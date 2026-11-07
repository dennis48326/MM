/* Upscaling filters for the game window (see filters.h).

   CRT: a model of a consumer TV, drawn at the window's resolution.
     - Each of the picture's lines is one electron-beam scanline. Its vertical
       profile is a gaussian that is narrow for dark colours and wide for bright
       ones (per colour channel), so dark areas show clear scanline gaps and
       bright areas bloom them closed, like a real tube.
     - Horizontally the beam blends neighbouring pixels slightly (sharpened
       linear), so pixels stay crisp but not blocky.
     - Light is added up in linear space (gamma 2.4 in, 2.2 out), plus a faint
       halation glow (a blurred copy of the picture).
     - An aperture-grille mask (vertical red/green/blue stripes, one stripe per
       window pixel) and a slight barrel curvature, rounded corners and
       vignette finish the look.
   xBRZ: Zenju's "scale by rules" pixel-art upscaler (third_party/xbrz) at the
     smallest factor (2..6) that covers the window, then resampled to fit.

   All work is split into row ranges handed to filter_parallel (threads in the
   Windows front end, a plain loop elsewhere). */
#include "filters.h"
#include <math.h>
#include <stdlib.h>
#include <string.h>

void xbrz_scale_rgb(int factor, const uint32_t *src, uint32_t *dst, int w, int h, int y0, int y1);

static void serial(filter_job_fn fn, void *ctx, int n) { for (int i = 0; i < n; i++) fn(ctx, i); }
static filter_parallel_fn par = serial;
void filter_set_parallel(filter_parallel_fn p) { par = p ? p : serial; }

const char *filter_name(int mode) {
    return mode == FILTER_CRT ? "CRT" : mode == FILTER_XBRZ ? "XBRZ" : "OFF";
}

/* ------------------------------------------------------------------ CRT */

#define CRT_BEAM_D 64      /* distance steps (0..1 line) */
#define CRT_BEAM_C 64      /* intensity steps */
static float beam_w[CRT_BEAM_D + 1][CRT_BEAM_C + 1];
static float dec_lut[256];
static uint8_t enc_lut[4096];
static int crt_tables_done;

static void crt_tables(void) {
    for (int i = 0; i < 256; i++) dec_lut[i] = powf(i / 255.0f, 2.4f);
    for (int i = 0; i < 4096; i++) {
        float v = powf(i / 4095.0f, 1.0f / 2.2f) * 255.0f + 0.5f;
        enc_lut[i] = (uint8_t)(v > 255 ? 255 : v);
    }
    for (int d = 0; d <= CRT_BEAM_D; d++)
        for (int c = 0; c <= CRT_BEAM_C; c++) {
            float dist = (float)d / CRT_BEAM_D, inten = (float)c / CRT_BEAM_C;
            float sigma = 0.25f + 0.15f * sqrtf(inten);          /* beam widens with brightness */
            beam_w[d][c] = expf(-0.5f * (dist / sigma) * (dist / sigma));
        }
    crt_tables_done = 1;
}

typedef struct {
    int sw, sh, dw, dh;
    int32_t *u, *v;          /* source position per window pixel, 1/256 pixel; v < 0: outside */
    uint8_t *shade;          /* corner / vignette, 0..255 */
    float *lin, *glow;       /* linear source picture and its blurred copy, 3 floats per pixel */
    const uint32_t *src;
    uint32_t *dst;
} Crt;
static Crt crt;

static void crt_setup(int sw, int sh, int dw, int dh) {
    if (crt.sw == sw && crt.sh == sh && crt.dw == dw && crt.dh == dh && crt.u) return;
    free(crt.u); free(crt.v); free(crt.shade); free(crt.lin); free(crt.glow);
    crt.sw = sw; crt.sh = sh; crt.dw = dw; crt.dh = dh;
    size_t n = (size_t)dw * dh;
    crt.u = malloc(n * sizeof *crt.u);
    crt.v = malloc(n * sizeof *crt.v);
    crt.shade = malloc(n);
    crt.lin = malloc((size_t)sw * sh * 3 * sizeof(float));
    crt.glow = malloc((size_t)sw * sh * 3 * sizeof(float));
    const float k = 0.035f;                     /* barrel curvature */
    const float corner = 0.035f;                /* corner radius (fraction of the half size) */
    float aspect = (float)dw / dh;
    for (int y = 0; y < dh; y++)
        for (int x = 0; x < dw; x++) {
            float nx = (x + 0.5f) / dw * 2 - 1, ny = (y + 0.5f) / dh * 2 - 1;
            float wx = nx * (1 + k * ny * ny * (aspect > 1.5f ? 0.6f : 1.0f));   /* gentler on wide pictures */
            float wy = ny * (1 + k * nx * nx);
            size_t i = (size_t)y * dw + x;
            if (wx <= -1 || wx >= 1 || wy <= -1 || wy >= 1) { crt.v[i] = -1; crt.u[i] = 0; crt.shade[i] = 0; continue; }
            crt.u[i] = (int32_t)((wx + 1) * 0.5f * sw * 256);
            crt.v[i] = (int32_t)((wy + 1) * 0.5f * sh * 256);
            /* rounded corners: distance (window pixels) inside a rounded rectangle, antialiased */
            float px = (1 - fabsf(wx)) * dw * 0.5f, py = (1 - fabsf(wy)) * dh * 0.5f, R = dh * corner;
            float d = (px < R && py < R) ? R - sqrtf((R - px) * (R - px) + (R - py) * (R - py)) : fminf(px, py);
            float s = d <= 0 ? 0 : d >= 1.5f ? 1 : d / 1.5f;
            float vig = 1 - 0.12f * (wx * wx * 0.5f + wy * wy * 0.5f);
            float sh_ = s * vig;
            crt.shade[i] = (uint8_t)(sh_ * 255 + 0.5f);
        }
}

static void crt_prepare(void) {
    int sw = crt.sw, sh = crt.sh;
    for (int i = 0; i < sw * sh; i++) {
        uint32_t c = crt.src[i];
        crt.lin[i * 3] = dec_lut[(c >> 16) & 255];
        crt.lin[i * 3 + 1] = dec_lut[(c >> 8) & 255];
        crt.lin[i * 3 + 2] = dec_lut[c & 255];
    }
    /* halation: separable blur, radius 4 source pixels */
    static const float g[9] = {0.03f, 0.07f, 0.12f, 0.17f, 0.22f, 0.17f, 0.12f, 0.07f, 0.03f};
    float *tmp = malloc((size_t)sw * sh * 3 * sizeof(float));
    for (int y = 0; y < sh; y++)
        for (int x = 0; x < sw; x++)
            for (int c = 0; c < 3; c++) {
                float s = 0;
                for (int k = -4; k <= 4; k++) {
                    int xx = x + k < 0 ? 0 : x + k >= sw ? sw - 1 : x + k;
                    s += g[k + 4] * crt.lin[(y * sw + xx) * 3 + c];
                }
                tmp[(y * sw + x) * 3 + c] = s;
            }
    for (int y = 0; y < sh; y++)
        for (int x = 0; x < sw; x++)
            for (int c = 0; c < 3; c++) {
                float s = 0;
                for (int k = -4; k <= 4; k++) {
                    int yy = y + k < 0 ? 0 : y + k >= sh ? sh - 1 : y + k;
                    s += g[k + 4] * tmp[(yy * sw + x) * 3 + c];
                }
                crt.glow[(y * sw + x) * 3 + c] = s;
            }
    free(tmp);
}

#define CRT_JOBS 32
static void crt_rows(void *ctx, int job) {
    (void)ctx;
    int sw = crt.sw, sh = crt.sh, dw = crt.dw, dh = crt.dh;
    int y0 = dh * job / CRT_JOBS, y1 = dh * (job + 1) / CRT_JOBS;
    const float gain = 1.5f, glow_amt = 0.10f, mask_dark = 0.70f;
    for (int y = y0; y < y1; y++) {
        uint32_t *out = crt.dst + (size_t)y * dw;
        for (int x = 0; x < dw; x++) {
            size_t i = (size_t)y * dw + x;
            if (crt.v[i] < 0 || !crt.shade[i]) { out[x] = 0; continue; }
            int u = crt.u[i] - 128, v = crt.v[i] - 128;           /* relative to pixel centres */
            int ix = u >> 8, jy = v >> 8;
            float fx = (u & 255) / 256.0f, fy = (v & 255) / 256.0f;
            /* sharpened horizontal blend */
            float gx = (fx - 0.5f) * 1.8f + 0.5f;
            gx = gx < 0 ? 0 : gx > 1 ? 1 : gx;
            int x0 = ix < 0 ? 0 : ix >= sw ? sw - 1 : ix, x1 = ix + 1 < 0 ? 0 : ix + 1 >= sw ? sw - 1 : ix + 1;
            float acc[3] = {0, 0, 0};
            for (int l = 0; l < 2; l++) {
                int yy = jy + l;
                if (yy < 0 || yy >= sh) continue;
                float dist = l ? 1 - fy : fy;
                int di = (int)(dist * CRT_BEAM_D + 0.5f);
                const float *a = crt.lin + ((size_t)yy * sw + x0) * 3, *b = crt.lin + ((size_t)yy * sw + x1) * 3;
                for (int c = 0; c < 3; c++) {
                    float col = a[c] + (b[c] - a[c]) * gx;
                    int ci = (int)(col * CRT_BEAM_C + 0.5f);
                    if (ci > CRT_BEAM_C) ci = CRT_BEAM_C;
                    acc[c] += col * beam_w[di][ci];
                }
            }
            /* halation, nearest glow sample (it is smooth already) */
            int gxp = (crt.u[i] >> 8), gyp = (crt.v[i] >> 8);
            if (gxp >= sw) gxp = sw - 1;
            if (gyp >= sh) gyp = sh - 1;
            const float *gl = crt.glow + ((size_t)gyp * sw + gxp) * 3;
            /* aperture grille: one coloured stripe per window pixel */
            int m = x % 3;
            float shade = crt.shade[i] / 255.0f * gain;
            uint32_t px = 0;
            for (int c = 0; c < 3; c++) {
                float val = (acc[c] + gl[c] * glow_amt) * (c == m ? 1.0f : mask_dark) * shade;
                int e = (int)(val * 4095.0f);
                if (e > 4095) e = 4095;
                if (e < 0) e = 0;
                px = (px << 8) | enc_lut[e];
            }
            out[x] = px;
        }
    }
}

static void crt_render(const uint32_t *src, int sw, int sh, uint32_t *dst, int dw, int dh) {
    if (!crt_tables_done) crt_tables();
    crt_setup(sw, sh, dw, dh);
    crt.src = src; crt.dst = dst;
    crt_prepare();
    par(crt_rows, 0, CRT_JOBS);
}

/* ------------------------------------------------------------------ xBRZ */

typedef struct {
    int factor, sw, sh, dw, dh;
    uint32_t *big;
    size_t big_cap;
    const uint32_t *src;
    uint32_t *dst;
} Xbrz;
static Xbrz xb;

#define XB_SLICE 16
static void xbrz_job(void *ctx, int job) {
    (void)ctx;
    int y0 = job * XB_SLICE, y1 = y0 + XB_SLICE;
    if (y1 > xb.sh) y1 = xb.sh;
    xbrz_scale_rgb(xb.factor, xb.src, xb.big, xb.sw, xb.sh, y0, y1);
}

#define RS_JOBS 32
static void resample_job(void *ctx, int job) {   /* bilinear, big -> window */
    (void)ctx;
    int bw = xb.sw * xb.factor, bh = xb.sh * xb.factor, dw = xb.dw, dh = xb.dh;
    int y0 = dh * job / RS_JOBS, y1 = dh * (job + 1) / RS_JOBS;
    for (int y = y0; y < y1; y++) {
        float sy = (y + 0.5f) * bh / dh - 0.5f;
        int j = (int)floorf(sy);
        float fy = sy - j;
        int j0 = j < 0 ? 0 : j, j1 = j + 1 >= bh ? bh - 1 : j + 1;
        uint32_t wy = (uint32_t)(fy * 256);
        const uint32_t *ra = xb.big + (size_t)j0 * bw, *rb = xb.big + (size_t)j1 * bw;
        uint32_t *out = xb.dst + (size_t)y * dw;
        for (int x = 0; x < dw; x++) {
            float sx = (x + 0.5f) * bw / dw - 0.5f;
            int i = (int)floorf(sx);
            float fx = sx - i;
            int i0 = i < 0 ? 0 : i, i1 = i + 1 >= bw ? bw - 1 : i + 1;
            uint32_t wx = (uint32_t)(fx * 256);
            uint32_t p00 = ra[i0], p01 = ra[i1], p10 = rb[i0], p11 = rb[i1], px = 0;
            for (int sh = 16; sh >= 0; sh -= 8) {
                uint32_t a = (p00 >> sh) & 255, b = (p01 >> sh) & 255, c = (p10 >> sh) & 255, d = (p11 >> sh) & 255;
                uint32_t top = a * (256 - wx) + b * wx, bot = c * (256 - wx) + d * wx;
                uint32_t v = (top * (256 - wy) + bot * wy) >> 16;
                px |= v << sh;
            }
            out[x] = px;
        }
    }
}

static void xbrz_render(const uint32_t *src, int sw, int sh, uint32_t *dst, int dw, int dh) {
    int f = (dh + sh - 1) / sh, fw = (dw + sw - 1) / sw;
    if (fw > f) f = fw;
    if (f < 2) f = 2;
    if (f > 6) f = 6;
    size_t need = (size_t)sw * f * sh * f;
    if (need > xb.big_cap) { free(xb.big); xb.big = malloc(need * sizeof(uint32_t)); xb.big_cap = need; }
    xb.factor = f; xb.sw = sw; xb.sh = sh; xb.dw = dw; xb.dh = dh; xb.src = src; xb.dst = dst;
    par(xbrz_job, 0, (sh + XB_SLICE - 1) / XB_SLICE);
    par(resample_job, 0, RS_JOBS);
}

int filter_render(int mode, const uint32_t *src, int sw, int sh, uint32_t *dst, int dw, int dh) {
    if (dw < 16 || dh < 16) return 0;
    if (mode == FILTER_CRT) { crt_render(src, sw, sh, dst, dw, dh); return 1; }
    if (mode == FILTER_XBRZ) { xbrz_render(src, sw, sh, dst, dw, dh); return 1; }
    return 0;
}
