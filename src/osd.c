/* On-screen display, drawn in the game's own 256-pixel space so it scales with
   the picture and stays crisp. Slides in, holds, then fades out. */
#include "osd.h"
#include "font8.h"
#include <string.h>

static char line1[48], line2[48];
static uint32_t col1;
static int timer, age;

void osd_show(const char *l1, const char *l2, uint32_t color1, int frames) {
    int same = !strcmp(line1, l1) && timer > 0;
    strncpy(line1, l1, sizeof line1 - 1);
    strncpy(line2, l2 ? l2 : "", sizeof line2 - 1);
    col1 = color1;
    timer = frames;
    if (!same) age = 0;
}

void osd_tick(void) {
    if (timer > 0) { timer--; age++; }
}

static inline uint32_t blend(uint32_t d, uint32_t s, int a) { /* a: 0..256 */
    uint32_t r = (((d >> 16) & 255) * (256 - a) + ((s >> 16) & 255) * a) >> 8;
    uint32_t g = (((d >> 8) & 255) * (256 - a) + ((s >> 8) & 255) * a) >> 8;
    uint32_t b = ((d & 255) * (256 - a) + (s & 255) * a) >> 8;
    return (r << 16) | (g << 8) | b;
}

static void put(uint32_t *px, int w, int h, int x, int y, uint32_t c, int a) {
    if ((unsigned)x < (unsigned)w && (unsigned)y < (unsigned)h) px[y * w + x] = blend(px[y * w + x], c, a);
}

static void text(uint32_t *px, int w, int h, int x, int y, const char *s, uint32_t c, int a) {
    for (; *s; s++, x += 8) {
        const uint8_t *g = font8[(unsigned char)*s & 127];
        for (int r = 0; r < 7; r++)
            for (int b = 0; b < 7; b++)
                if (g[r] & (0x40 >> b)) {
                    put(px, w, h, x + b + 1, y + r + 1, 0x000000, a * 3 / 4);   /* drop shadow */
                    put(px, w, h, x + b, y + r, c, a);
                }
    }
}

void osd_draw(uint32_t *px, int w, int h) {
    if (timer <= 0) return;
    int a = timer >= 20 ? 256 : timer * 256 / 20;
    int n1 = (int)strlen(line1), n2 = (int)strlen(line2);
    int tw = (n1 > n2 ? n1 : n2) * 8 - 1;
    int bw = tw + 20, bh = n2 ? 30 : 19;
    int bx = (w - bw) / 2, by = 8 - (age < 6 ? (6 - age) * 5 : 0);
    for (int y = 0; y < bh; y++)
        for (int x = 0; x < bw; x++) {
            int edge = (x == 0 || y == 0 || x == bw - 1 || y == bh - 1);
            int corner = (x == 0 || x == bw - 1) && (y == 0 || y == bh - 1);
            if (corner) continue;
            put(px, w, h, bx + x, by + y, edge ? 0x3cbcfc : (y == 1 ? 0x10207a : 0x040a30), edge ? a : a * 13 / 16);
        }
    /* accent bar on the left */
    for (int y = 3; y < bh - 3; y++) { put(px, w, h, bx + 4, by + y, col1, a); put(px, w, h, bx + 5, by + y, col1, a); }
    text(px, w, h, bx + 12 + (tw - (n1 * 8 - 1)) / 2, by + 6, line1, col1, a);
    if (n2) text(px, w, h, bx + 12 + (tw - (n2 * 8 - 1)) / 2, by + 17, line2, 0xa4e4fc, a);
}
