/* NES hardware runtime: memory map, UxROM mapper, PPU, APU, controllers,
   interrupt servicing and the reference/fallback 6502 interpreter. */
#include "nes.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

/* ---------------- CPU state ---------------- */
uint8_t A, X, Y, S;
uint8_t fC, fZ = 1, fN, fV, fI = 1, fD;
uint16_t PC;
uint64_t cycles;
uint64_t next_event;
int nest_depth;
uint8_t nest_s[64];
int cpu_jammed;
exec_fn g_exec = interp_run;
uint64_t stat_interp_insns;
uint8_t *cov_map;
int stat_max_nest;

/* ---------------- memory ---------------- */
uint8_t ram[0x800];
uint8_t wram[0x2000];
const uint8_t *prg;
int prg_banks;            /* 16 KB units */
int prg_banks8;           /* 8 KB units */
int prg_map[4];           /* 8 KB bank in each slot $8000/$A000/$C000/$E000 */
const uint8_t *prg_slot[4];
int mapper = 2;
int mapper_irq;

static uint8_t chr_ram[0x2000];
static const uint8_t *chr_rom;
static int chr_pages;     /* 1 KB pages of CHR ROM, 0 = CHR RAM */
static uint8_t *chr_page[8];
#define CHR(a) (chr_page[((a) >> 10) & 7][(a) & 0x3FF])

static void set_mirroring(int m);
static void set_prg8(int slot, int b) {
    b &= prg_banks8 - 1;
    prg_map[slot] = b;
    prg_slot[slot] = prg + b * 0x2000;
}
static void set_chr1(int page, int b) {
    if (!chr_pages) chr_page[page] = chr_ram + page * 0x400;
    else chr_page[page] = (uint8_t *)(chr_rom + (b % chr_pages) * 0x400);
}
static void set_prg16(int lo, int hi) {
    set_prg8(0, lo * 2); set_prg8(1, lo * 2 + 1);
    set_prg8(2, hi * 2); set_prg8(3, hi * 2 + 1);
}

/* ---- MMC1 (mapper 1) ---- */
static uint8_t mmc1_shift, mmc1_count, mmc1_ctrl = 0x0C, mmc1_prg, mmc1_chr0, mmc1_chr1;
static void mmc1_update(void) {
    set_mirroring(mmc1_ctrl & 3);
    int pb = mmc1_prg & 0x0F & (prg_banks - 1), lo, hi;
    switch ((mmc1_ctrl >> 2) & 3) {
    case 0: case 1: lo = pb & ~1; hi = lo | 1; break;
    case 2: lo = 0; hi = pb; break;
    default: lo = pb; hi = prg_banks - 1; break;
    }
    set_prg16(lo, hi);
    for (int i = 0; i < 8; i++) {
        if (mmc1_ctrl & 0x10) set_chr1(i, (i < 4 ? mmc1_chr0 : mmc1_chr1) * 4 + (i & 3));
        else set_chr1(i, (mmc1_chr0 & 0x1E) * 4 + i);
    }
}

/* ---- MMC3 (mapper 4) ---- */
static uint8_t m3_sel, m3_r[8], m3_mirror, m3_latch, m3_counter, m3_reload, m3_irq_en;
static void mmc3_update(void) {
    int last = prg_banks8 - 1;
    if (m3_sel & 0x40) { set_prg8(0, last - 1); set_prg8(2, m3_r[6]); }
    else { set_prg8(0, m3_r[6]); set_prg8(2, last - 1); }
    set_prg8(1, m3_r[7]);
    set_prg8(3, last);
    int x = (m3_sel & 0x80) ? 4 : 0;
    set_chr1(0 ^ x, m3_r[0] & 0xFE); set_chr1(1 ^ x, m3_r[0] | 1);
    set_chr1(2 ^ x, m3_r[1] & 0xFE); set_chr1(3 ^ x, m3_r[1] | 1);
    set_chr1(4 ^ x, m3_r[2]); set_chr1(5 ^ x, m3_r[3]);
    set_chr1(6 ^ x, m3_r[4]); set_chr1(7 ^ x, m3_r[5]);
    set_mirroring(m3_mirror ? 3 : 2);
}
static void mmc3_scanline(void) {
    if (m3_counter == 0 || m3_reload) { m3_counter = m3_latch; m3_reload = 0; }
    else m3_counter--;
    if (m3_counter == 0 && m3_irq_en) mapper_irq = 1;
}

void mapper_write(uint16_t a, uint8_t v) {
    if (mapper == 1) {
        if (v & 0x80) { mmc1_shift = 0; mmc1_count = 0; mmc1_ctrl |= 0x0C; mmc1_update(); return; }
        mmc1_shift |= (uint8_t)((v & 1) << mmc1_count);
        if (++mmc1_count == 5) {
            switch ((a >> 13) & 3) {
            case 0: mmc1_ctrl = mmc1_shift; break;
            case 1: mmc1_chr0 = mmc1_shift; break;
            case 2: mmc1_chr1 = mmc1_shift; break;
            case 3: mmc1_prg = mmc1_shift; break;
            }
            mmc1_shift = 0; mmc1_count = 0;
            mmc1_update();
        }
        return;
    }
    if (mapper == 4) {
        switch (a & 0xE001) {
        case 0x8000: m3_sel = v; break;
        case 0x8001: m3_r[m3_sel & 7] = v; break;
        case 0xA000: m3_mirror = v & 1; break;
        case 0xC000: m3_latch = v; break;
        case 0xC001: m3_counter = 0; m3_reload = 1; break;
        case 0xE000: m3_irq_en = 0; mapper_irq = 0; break;
        case 0xE001: m3_irq_en = 1; break;
        }
        mmc3_update();
        return;
    }
    /* UxROM with bus conflicts: the written value is ANDed with the ROM byte */
    v &= rd(a);
    set_prg16(v & (prg_banks - 1), prg_banks - 1);
}

/* ---------------- PPU ---------------- */
uint8_t framebuffer[240][256];
uint32_t frame_count;
static uint8_t vram[0x800];
static uint8_t pal[32];
static uint8_t oam[256];
static uint8_t ppu_ctrl, ppu_mask, ppu_status, oam_addr, ppu_latch, read_buf;
static uint16_t ppu_v, ppu_t;
static uint8_t ppu_x, ppu_w;
static int nt_page[4];  /* physical 1 KB page for each logical nametable */
static int nmi_pending;
static int ppu_line;            /* 0..261 */
static uint64_t line_start_dot; /* absolute dot where current line began */
static int ev_stage;            /* 0: dot 1, 1: dot 256, 2: line end */
static uint64_t ev_dot;
static int odd_frame;
static int extra_done, apu_frozen;
int opt_extra_lines;          /* boost: idle CPU-only scanlines per frame */
int opt_no_sprite_limit;      /* boost: draw all sprites on a line */
void (*nmi_hook)(uint16_t pc);
void (*ppu_write_hook)(uint16_t reg, uint8_t v, uint16_t vaddr);

static inline uint16_t nt_index(uint16_t a) {
    return (uint16_t)((nt_page[(a >> 10) & 3] << 10) | (a & 0x3FF));
}
/* 0: one-screen A, 1: one-screen B, 2: vertical, 3: horizontal */
static void set_mirroring(int m) {
    static const int map[4][4] = {{0, 0, 0, 0}, {1, 1, 1, 1}, {0, 1, 0, 1}, {0, 0, 1, 1}};
    for (int i = 0; i < 4; i++) nt_page[i] = map[m][i];
}
static inline uint8_t pal_idx(uint16_t a) {
    a &= 0x1F;
    if ((a & 0x13) == 0x10) a &= 0x0F;
    return (uint8_t)a;
}
static uint8_t ppu_mem_read(uint16_t a) {
    a &= 0x3FFF;
    if (a < 0x2000) return CHR(a);
    if (a < 0x3F00) return vram[nt_index(a)];
    return pal[pal_idx(a)];
}
static void ppu_mem_write(uint16_t a, uint8_t v) {
    a &= 0x3FFF;
    if (a < 0x2000) { if (!chr_pages) CHR(a) = v; }
    else if (a < 0x3F00) vram[nt_index(a)] = v;
    else pal[pal_idx(a)] = v & 0x3F;
}

/* ---------------- widescreen ----------------
   A per-game provider maps world tile positions to level tiles straight from
   the ROM. Extra columns are drawn on both sides of the 256-pixel picture.
   Each frame the provider's answer is checked against what the game itself
   put in the nametables; if they disagree (menus, transitions, cutscenes)
   the extra area stays dark, so it can never show the wrong thing. */
int wide_ext;
uint8_t wide_left[240][WIDE_MAX], wide_right[240][WIDE_MAX];
const WideProvider *wide_prov;
int wide_active;                 /* this frame's check passed */
static uint32_t wide_checked_frame = 0xFFFFFFFF;
static int wide_cam;             /* provider's camera x (world pixels) */

static int wide_world_left(uint16_t v) {
    int nt_x = (((v & 0x1F) << 3) | ppu_x) + ((v >> 10) & 1) * 256;
    int d = ((nt_x - wide_cam) % 512 + 512) % 512;
    if (d >= 256) d -= 512;
    return wide_cam + d;
}

static void wide_check(uint16_t v) {
    wide_active = 0;
    if (!wide_prov || !wide_prov->begin(&wide_cam)) return;
    int wl = wide_world_left(v), nt_col0 = (((v & 0x1F) << 3 | ppu_x) + ((v >> 10) & 1) * 256) >> 3;
    int match = 0, total = 0;
    for (int ty = 2; ty < 28; ty += 3)
        for (int k = 1; k < 32; k += 3) {
            uint8_t t, p;
            int col = (nt_col0 + k) & 63;
            uint8_t nt = vram[nt_index((uint16_t)(0x2000 | ((col & 32) ? 0x400 : 0) | (ty << 5) | (col & 31)))];
            total++;
            if (wide_prov->tile((wl >> 3) + k, ty, &t, &p) && t == nt) match++;
        }
    wide_active = match * 100 >= total * 85;
}

static void wide_line(int y, uint16_t v, uint8_t *bgpix) {
    int ext = wide_ext;
    uint8_t *L = wide_left[y], *R = wide_right[y];
    if (frame_count != wide_checked_frame) { wide_checked_frame = frame_count; wide_check(v); }
    if (!wide_active || !(ppu_mask & 0x08)) {
        memset(L, 0x0F, ext); memset(R, 0x0F, ext);
        return;
    }
    int wl = wide_world_left(v), ty = (v >> 5) & 31, fy = (v >> 12) & 7;
    uint16_t pt = (ppu_ctrl & 0x10) ? 0x1000 : 0;
    /* ranges: left extension, the game's clipped left 8 pixels (if hidden), right extension */
    int ranges[3][2] = {{-ext, 0}, {0, (ppu_mask & 0x02) ? 0 : 8}, {256, 256 + ext}};
    for (int r = 0; r < 3; r++) {
        int last_tx = 0x7FFFFFFF, ok = 0;
        uint8_t lo = 0, hi = 0, pn = 0;
        for (int i = ranges[r][0]; i < ranges[r][1]; i++) {
            int wx = wl + i, tx = wx >> 3;
            if (tx != last_tx) {
                uint8_t t = 0, p = 0;
                last_tx = tx;
                ok = wide_prov->tile(tx, ty, &t, &p);
                if (ok) { lo = CHR(pt + t * 16 + fy); hi = CHR(pt + t * 16 + fy + 8); pn = p; }
            }
            uint8_t c = 0x0F;
            if (ok) {
                int b = 7 - (wx & 7);
                int ci = ((lo >> b) & 1) | (((hi >> b) & 1) << 1);
                c = ci ? pal[(pn << 2) | ci] : pal[0];
                if (r == 1) bgpix[i] = ci ? (uint8_t)(ci | (pn << 2)) : 0;
            }
            if (r == 0) L[i + ext] = c;
            else if (r == 2) R[i - 256] = c;
        }
    }
}

/* ---------------- HUD relocation (widescreen modes) ----------------
   Every Mega Man game draws its energy bars as columns of 7 sprites at
   Y = 24, 32, ... 72, one palette per column: Mega Man's life at X=24, weapon
   energy at X=16, and the boss's bar further right. When hud_move is on, those
   columns are drawn at new places: Mega Man's bars at the same distance from
   the left edge of the wider picture, the boss bar mirrored to the right edge.
   Only the drawing moves; the game sees exactly the same sprites. */
int hud_move;
static uint8_t hud_class[64];          /* 0 none, 1 player bar, 2 boss bar */
static uint32_t hud_frame = 0xFFFFFFFF;

int hud_seen;                   /* debug: bit0 player bar, bit1 boss bar seen */
static void hud_detect(void) {
    memset(hud_class, 0, sizeof hud_class);
    for (int x = 8; x <= 64; x++) {
        int idx[7], n = 0, attr = -1, ok = 1;
        for (int i = 0; i < 64 && ok; i++) {
            if (oam[i * 4 + 3] != x) continue;
            int sy = oam[i * 4];
            if (sy < 0xEF && (sy < 24 || sy > 72 || (sy & 7))) { ok = 0; break; }   /* something else at this X */
            if (sy >= 0xEF) continue;
            if (attr < 0) attr = oam[i * 4 + 2];
            if (oam[i * 4 + 2] != attr || n >= 7) { ok = 0; break; }
            idx[n++] = i;
        }
        if (!ok || n != 7) continue;
        int seen = 0;
        for (int k = 0; k < 7; k++) seen |= 1 << ((oam[idx[k] * 4] - 24) >> 3);
        if (seen != 0x7F) continue;                      /* need one sprite on each of the 7 rows */
        int cls = (x <= 24) ? 1 : 2;
        if (cls == 1 && wide_ext <= 0) continue;          /* stretch mode: Mega Man's bars already sit at the left */
        hud_seen |= cls;
        for (int k = 0; k < 7; k++) hud_class[idx[k]] = cls;
    }
}

static int hud_new_x(int cls, int sx) {
    if (cls == 1) return sx - wide_ext;                  /* keep its margin from the (new) left edge */
    return 256 + wide_ext - 32;                          /* mirror the life bar's margin on the right */
}

static void render_line(int y) {
    uint8_t bgpix[256 + 16];
    int hud_n = 0, hud_i[8];
    uint8_t *out = framebuffer[y];
    int show_bg = ppu_mask & 0x08, show_spr = ppu_mask & 0x10;
    memset(bgpix, 0, sizeof bgpix);
    if (show_bg) {
        uint16_t v = ppu_v;
        int fine_y = (v >> 12) & 7;
        uint16_t pt = (ppu_ctrl & 0x10) ? 0x1000 : 0;
        for (int t = 0; t < 33; t++) {
            uint8_t tile = vram[nt_index(0x2000 | (v & 0x0FFF))];
            uint8_t at = vram[nt_index(0x23C0 | (v & 0x0C00) | ((v >> 4) & 0x38) | ((v >> 2) & 7))];
            int shift = ((v >> 4) & 4) | (v & 2);
            uint8_t palno = (at >> shift) & 3;
            uint16_t pa = pt + tile * 16 + fine_y;
            uint8_t lo = CHR(pa), hi = CHR(pa + 8);
            for (int px = 0; px < 8; px++) {
                int x = t * 8 + px - ppu_x;
                uint8_t c = (uint8_t)(((lo >> (7 - px)) & 1) | (((hi >> (7 - px)) & 1) << 1));
                if (x >= 0 && x < 256) bgpix[x] = c ? (uint8_t)(c | (palno << 2)) : 0;
            }
            if ((v & 0x1F) == 31) { v &= ~0x1F; v ^= 0x0400; } else v++;
        }
        if (!(ppu_mask & 0x02)) memset(bgpix, 0, 8);
    }
    uint8_t sp[256], spattr[256];
    memset(sp, 0, sizeof sp);
    if (show_spr) {
        int h = (ppu_ctrl & 0x20) ? 16 : 8, found = 0;
        for (int i = 0; i < 64; i++) {
            int row = y - oam[i * 4] - 1;
            if (row < 0 || row >= h) continue;
            if (++found > 8) { ppu_status |= 0x20; if (!opt_no_sprite_limit) break; }
            uint8_t tile = oam[i * 4 + 1], at = oam[i * 4 + 2], sx = oam[i * 4 + 3];
            if (hud_move) {
                if (frame_count != hud_frame) { hud_frame = frame_count; hud_detect(); }
                if (hud_class[i] && hud_n < 8) {
                    if (i == 0) {           /* keep sprite-0 hit exactly as the game expects */
                        int r0 = (at & 0x80) ? h - 1 - row : row;
                        uint16_t pa0 = (uint16_t)(((ppu_ctrl & 0x08) ? 0x1000 : 0) + tile * 16 + r0);
                        for (int px = 0; px < 8 && sx + px < 255; px++) {
                            int bit = (at & 0x40) ? px : 7 - px;
                            if ((((CHR(pa0) >> bit) | (CHR(pa0 + 8) >> bit)) & 1) && show_bg && bgpix[sx + px]) ppu_status |= 0x40;
                        }
                    }
                    hud_i[hud_n++] = i;
                    continue;
                }
            }
            if (at & 0x80) row = h - 1 - row;
            uint16_t pa;
            if (h == 16) pa = (uint16_t)(((tile & 1) ? 0x1000 : 0) + (tile & 0xFE) * 16 + (row >= 8 ? 16 : 0) + (row & 7));
            else pa = (uint16_t)(((ppu_ctrl & 0x08) ? 0x1000 : 0) + tile * 16 + row);
            uint8_t lo = CHR(pa), hi = CHR(pa + 8);
            for (int px = 0; px < 8; px++) {
                int x = sx + px;
                if (x > 255) break;
                int bit = (at & 0x40) ? px : 7 - px;
                uint8_t c = (uint8_t)(((lo >> bit) & 1) | (((hi >> bit) & 1) << 1));
                if (!c) continue;
                if (x < 8 && !(ppu_mask & 0x04)) continue;
                if (i == 0 && show_bg && bgpix[x] && x != 255) ppu_status |= 0x40;
                if (sp[x]) continue;
                sp[x] = (uint8_t)(0x10 | ((at & 3) << 2) | c);
                spattr[x] = at;
            }
        }
    }
    if (wide_ext) wide_line(y, ppu_v, bgpix);   /* also fills the clipped left 8 pixels */
    for (int x = 0; x < 256; x++) {
        uint8_t c;
        if (sp[x] && (!(spattr[x] & 0x20) || !bgpix[x])) c = pal[sp[x]];
        else c = bgpix[x] ? pal[bgpix[x]] : pal[0];
        if (ppu_mask & 1) c &= 0x30;
        out[x] = c;
    }
    /* relocated HUD bars, drawn last (in front) into the wide picture */
    for (int k = 0; k < hud_n; k++) {
        int i = hud_i[k], h = (ppu_ctrl & 0x20) ? 16 : 8;
        int row = y - oam[i * 4] - 1;
        uint8_t tile = oam[i * 4 + 1], at = oam[i * 4 + 2];
        if (at & 0x80) row = h - 1 - row;
        uint16_t pa = (h == 16) ? (uint16_t)(((tile & 1) ? 0x1000 : 0) + (tile & 0xFE) * 16 + (row >= 8 ? 16 : 0) + (row & 7))
                                : (uint16_t)(((ppu_ctrl & 0x08) ? 0x1000 : 0) + tile * 16 + row);
        uint8_t lo = CHR(pa), hi = CHR(pa + 8);
        int nx = hud_new_x(hud_class[i], oam[i * 4 + 3]);
        for (int px = 0; px < 8; px++) {
            int bit = (at & 0x40) ? px : 7 - px;
            int c = ((lo >> bit) & 1) | (((hi >> bit) & 1) << 1);
            if (!c) continue;
            uint8_t col = pal[0x10 | ((at & 3) << 2) | c];
            int x = nx + px;
            if (x < -wide_ext || x >= 256 + wide_ext) continue;
            if (x < 0) wide_left[y][x + wide_ext] = col;
            else if (x >= 256) wide_right[y][x - 256] = col;
            else out[x] = col;
        }
    }
}

static inline int rendering(void) { return ppu_mask & 0x18; }

static void ppu_inc_y(void) {
    if ((ppu_v & 0x7000) != 0x7000) ppu_v += 0x1000;
    else {
        ppu_v &= ~0x7000;
        int cy = (ppu_v & 0x03E0) >> 5;
        if (cy == 29) { cy = 0; ppu_v ^= 0x0800; }
        else if (cy == 31) cy = 0;
        else cy++;
        ppu_v = (uint16_t)((ppu_v & ~0x03E0) | (cy << 5));
    }
}

void apu_sync(void);
static uint64_t apu_last;
static int irq_asserted(void);
static void schedule(void) {
    static const int dots[3] = {1, 256, 341};
    int d = dots[ev_stage];
    if (ev_stage == 2 && ppu_line == 261 && odd_frame && rendering()) d = 340;
    ev_dot = line_start_dot + d;
    uint64_t evc = (ev_dot + 2) / 3;
    next_event = (nmi_pending || (!fI && irq_asserted())) ? 0 : evc;
}

static void ppu_event(void) {
    if (ev_stage == 0) {
        if (ppu_line == 241) {
            ppu_status |= 0x80;
            frame_count++;
            apu_sync();
            host_frame();
            if (ppu_ctrl & 0x80) nmi_pending = 1;
        } else if (ppu_line == 261) {
            ppu_status &= 0x1F;
        }
        ev_stage = 1;
    } else if (ev_stage == 1) {
        if (ppu_line < 240) render_line(ppu_line);
        if (mapper == 4 && rendering() && (ppu_line < 240 || ppu_line == 261)) mmc3_scanline();
        if (rendering() && (ppu_line < 240 || ppu_line == 261)) {
            ppu_inc_y();
            ppu_v = (uint16_t)((ppu_v & ~0x041F) | (ppu_t & 0x041F));
            if (ppu_line == 261) ppu_v = (uint16_t)((ppu_v & ~0x7BE0) | (ppu_t & 0x7BE0));
        }
        ev_stage = 2;
    } else {
        line_start_dot = ev_dot;
        ev_stage = 0;
        /* boost mode: after the last visible line, run extra idle scanlines in
           which only the CPU advances (no rendering, no APU, no mapper IRQ).
           The game's main loop gets more time before vblank/NMI, so frames
           that would have lagged on hardware finish in time. */
        if (ppu_line == 240 && extra_done < opt_extra_lines) {
            if (extra_done++ == 0) { apu_sync(); apu_frozen = 1; }
            return;
        }
        if (ppu_line == 240 && extra_done) { apu_frozen = 0; apu_last = cycles; extra_done = 0; }
        if (++ppu_line == 262) { ppu_line = 0; odd_frame ^= 1; }
    }
}

static void ppu_sync(void) {
    uint64_t now = cycles * 3;
    while (now >= ev_dot) { ppu_event(); schedule(); }
    schedule();
}

/* ---------------- controllers ---------------- */
uint8_t pad_state[2];
static uint8_t pad_shift[2], pad_strobe;

/* ---------------- APU ---------------- */
#define CPU_HZ 1789773
static const uint8_t len_table[32] = {10, 254, 20, 2, 40, 4, 80, 6, 160, 8, 60, 10, 14, 12, 26, 14,
                                      12, 16, 24, 18, 48, 20, 96, 22, 192, 24, 72, 26, 16, 28, 32, 30};
static const uint8_t duty_tbl[4][8] = {{0, 0, 0, 0, 0, 0, 0, 1}, {0, 0, 0, 0, 0, 0, 1, 1},
                                       {0, 0, 0, 0, 1, 1, 1, 1}, {1, 1, 1, 1, 1, 1, 0, 0}};
static const uint8_t tri_seq[32] = {15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0,
                                    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
static const uint16_t noise_period[16] = {4, 8, 16, 32, 64, 96, 128, 160, 202, 254, 380, 508, 762, 1016, 2034, 4068};
static const uint16_t dmc_rate[16] = {428, 380, 340, 320, 286, 254, 226, 214, 190, 160, 142, 128, 106, 84, 72, 54};

typedef struct {
    uint8_t enabled, duty, seq, halt, constvol, vol, env_start, env_div, env_decay;
    uint8_t sw_en, sw_period, sw_neg, sw_shift, sw_div, sw_reload, len;
    uint16_t timer, period;
} Pulse;
static Pulse pulse[2];
static struct { uint8_t enabled, control, lin_reload, lin, lin_flag, len, seq; uint16_t timer, period; } tri;
static struct { uint8_t enabled, halt, constvol, vol, env_start, env_div, env_decay, mode, len; uint16_t timer, period, lfsr; } noi;
static struct {
    uint8_t irq_en, loop, level, buffer, buf_full, shift, bits, silence, irq;
    uint16_t rate, timer, addr, cur_addr, length, remaining;
} dmc;
static uint8_t fc_mode, fc_inhibit, frame_irq;
static uint32_t fc_cycle;
static uint32_t samp_acc;
static double samp_sum; static int samp_n;
static double hp_prev_in, hp_prev_out, lp_out;
#define ABUF 32768
static int16_t abuf[ABUF];
static int a_head, a_tail;

static float pulse_tbl[31], tnd_tbl[203];

static void env_clock(uint8_t *start, uint8_t *div, uint8_t *decay, uint8_t vol, uint8_t loop) {
    if (*start) { *start = 0; *decay = 15; *div = vol; }
    else if (*div == 0) { *div = vol; if (*decay) (*decay)--; else if (loop) *decay = 15; }
    else (*div)--;
}
static uint16_t sweep_target(int i) {
    Pulse *p = &pulse[i];
    int ch = p->period >> p->sw_shift;
    if (p->sw_neg) ch = -ch - (i == 0 ? 1 : 0);
    int t = p->period + ch;
    return (uint16_t)(t < 0 ? 0 : t);
}
static int pulse_muted(int i) { return pulse[i].period < 8 || sweep_target(i) > 0x7FF; }

static void quarter_frame(void) {
    for (int i = 0; i < 2; i++) env_clock(&pulse[i].env_start, &pulse[i].env_div, &pulse[i].env_decay, pulse[i].vol, pulse[i].halt);
    env_clock(&noi.env_start, &noi.env_div, &noi.env_decay, noi.vol, noi.halt);
    if (tri.lin_flag) tri.lin = tri.lin_reload; else if (tri.lin) tri.lin--;
    if (!tri.control) tri.lin_flag = 0;
}
static void half_frame(void) {
    for (int i = 0; i < 2; i++) {
        Pulse *p = &pulse[i];
        if (!p->halt && p->len) p->len--;
        if (p->sw_div == 0 && p->sw_en && p->sw_shift && !pulse_muted(i)) p->period = sweep_target(i);
        if (p->sw_div == 0 || p->sw_reload) { p->sw_div = p->sw_period; p->sw_reload = 0; }
        else p->sw_div--;
    }
    if (!tri.control && tri.len) tri.len--;
    if (!noi.halt && noi.len) noi.len--;
}

static void dmc_fetch(void) {
    if (!dmc.buf_full && dmc.remaining) {
        dmc.buffer = rd(dmc.cur_addr);
        dmc.buf_full = 1;
        dmc.cur_addr = dmc.cur_addr == 0xFFFF ? 0x8000 : dmc.cur_addr + 1;
        if (--dmc.remaining == 0) {
            if (dmc.loop) { dmc.cur_addr = dmc.addr; dmc.remaining = dmc.length; }
            else if (dmc.irq_en) dmc.irq = 1;
        }
    }
}

static inline void apu_cycle(void) {
    /* frame counter */
    fc_cycle++;
    if (fc_mode == 0) {
        if (fc_cycle == 7457) quarter_frame();
        else if (fc_cycle == 14913) { quarter_frame(); half_frame(); }
        else if (fc_cycle == 22371) quarter_frame();
        else if (fc_cycle == 29829) { quarter_frame(); half_frame(); if (!fc_inhibit) frame_irq = 1; }
        else if (fc_cycle >= 29830) fc_cycle = 0;
    } else {
        if (fc_cycle == 7457) quarter_frame();
        else if (fc_cycle == 14913) { quarter_frame(); half_frame(); }
        else if (fc_cycle == 22371) quarter_frame();
        else if (fc_cycle == 37281) { quarter_frame(); half_frame(); }
        else if (fc_cycle >= 37282) fc_cycle = 0;
    }
    /* timers */
    if (fc_cycle & 1) {
        for (int i = 0; i < 2; i++) {
            Pulse *p = &pulse[i];
            if (p->timer == 0) { p->timer = p->period; p->seq = (p->seq + 1) & 7; } else p->timer--;
        }
    }
    if (tri.timer == 0) { tri.timer = tri.period; if (tri.len && tri.lin && tri.period >= 2) tri.seq = (tri.seq + 1) & 31; } else tri.timer--;
    if (noi.timer == 0) {
        noi.timer = noi.period;
        uint16_t fb = (noi.lfsr & 1) ^ ((noi.lfsr >> (noi.mode ? 6 : 1)) & 1);
        noi.lfsr = (uint16_t)((noi.lfsr >> 1) | (fb << 14));
    } else noi.timer--;
    if (dmc.timer == 0) {
        dmc.timer = dmc.rate - 1;
        if (!dmc.silence) {
            if (dmc.shift & 1) { if (dmc.level <= 125) dmc.level += 2; }
            else { if (dmc.level >= 2) dmc.level -= 2; }
            dmc.shift >>= 1;
        }
        if (dmc.bits) dmc.bits--;
        if (dmc.bits == 0) {
            dmc.bits = 8;
            if (dmc.buf_full) { dmc.shift = dmc.buffer; dmc.buf_full = 0; dmc.silence = 0; dmc_fetch(); }
            else dmc.silence = 1;
        }
    } else dmc.timer--;

    /* mix */
    int p1 = 0, p2 = 0, t, n = 0;
    for (int i = 0; i < 2; i++) {
        Pulse *p = &pulse[i];
        int o = 0;
        if (p->len && !pulse_muted(i) && duty_tbl[p->duty][p->seq]) o = p->constvol ? p->vol : p->env_decay;
        if (i == 0) p1 = o; else p2 = o;
    }
    t = tri_seq[tri.seq];
    if (noi.len && !(noi.lfsr & 1)) n = noi.constvol ? noi.vol : noi.env_decay;
    double s = pulse_tbl[p1 + p2] + tnd_tbl[3 * t + 2 * n + dmc.level];
    samp_sum += s; samp_n++;
    samp_acc += AUDIO_RATE;
    if (samp_acc >= CPU_HZ) {
        samp_acc -= CPU_HZ;
        double x = samp_sum / samp_n;
        samp_sum = 0; samp_n = 0;
        double y = x - hp_prev_in + 0.9965 * hp_prev_out;   /* ~25 Hz high-pass */
        hp_prev_in = x; hp_prev_out = y;
        lp_out += (y - lp_out) * 0.6;                       /* gentle low-pass */
        int v = (int)(lp_out * 40000.0);
        if (v > 32767) v = 32767; if (v < -32768) v = -32768;
        int nh = (a_head + 1) % ABUF;
        if (nh != a_tail) { abuf[a_head] = (int16_t)v; a_head = nh; }
    }
}

void apu_sync(void) {
    if (apu_frozen) { apu_last = cycles; return; }
    while (apu_last < cycles) { apu_cycle(); apu_last++; }
}

int audio_take(int16_t *dst, int max) {
    int n = 0;
    while (n < max && a_tail != a_head) { dst[n++] = abuf[a_tail]; a_tail = (a_tail + 1) % ABUF; }
    return n;
}

static void apu_write(uint16_t a, uint8_t v) {
    apu_sync();
    if (a < 0x4008) {
        Pulse *p = &pulse[(a >> 2) & 1];
        switch (a & 3) {
        case 0: p->duty = v >> 6; p->halt = (v >> 5) & 1; p->constvol = (v >> 4) & 1; p->vol = v & 15; break;
        case 1: p->sw_en = v >> 7; p->sw_period = (v >> 4) & 7; p->sw_neg = (v >> 3) & 1; p->sw_shift = v & 7; p->sw_reload = 1; break;
        case 2: p->period = (uint16_t)((p->period & 0x700) | v); break;
        case 3: p->period = (uint16_t)((p->period & 0xFF) | ((v & 7) << 8));
            if (p->enabled) p->len = len_table[v >> 3];
            p->seq = 0; p->env_start = 1; break;
        }
        return;
    }
    switch (a) {
    case 0x4008: tri.control = v >> 7; tri.lin_reload = v & 0x7F; break;
    case 0x400A: tri.period = (uint16_t)((tri.period & 0x700) | v); break;
    case 0x400B: tri.period = (uint16_t)((tri.period & 0xFF) | ((v & 7) << 8));
        if (tri.enabled) tri.len = len_table[v >> 3];
        tri.lin_flag = 1; break;
    case 0x400C: noi.halt = (v >> 5) & 1; noi.constvol = (v >> 4) & 1; noi.vol = v & 15; break;
    case 0x400E: noi.mode = v >> 7; noi.period = noise_period[v & 15]; break;
    case 0x400F: if (noi.enabled) noi.len = len_table[v >> 3]; noi.env_start = 1; break;
    case 0x4010: dmc.irq_en = v >> 7; dmc.loop = (v >> 6) & 1; dmc.rate = dmc_rate[v & 15];
        if (!dmc.irq_en) dmc.irq = 0; break;
    case 0x4011: dmc.level = v & 0x7F; break;
    case 0x4012: dmc.addr = (uint16_t)(0xC000 + v * 64); break;
    case 0x4013: dmc.length = (uint16_t)(v * 16 + 1); break;
    case 0x4015:
        pulse[0].enabled = v & 1; if (!(v & 1)) pulse[0].len = 0;
        pulse[1].enabled = (v >> 1) & 1; if (!(v & 2)) pulse[1].len = 0;
        tri.enabled = (v >> 2) & 1; if (!(v & 4)) tri.len = 0;
        noi.enabled = (v >> 3) & 1; if (!(v & 8)) noi.len = 0;
        dmc.irq = 0;
        if (!(v & 16)) dmc.remaining = 0;
        else if (!dmc.remaining) { dmc.cur_addr = dmc.addr; dmc.remaining = dmc.length; dmc_fetch(); }
        break;
    case 0x4017:
        fc_mode = v >> 7; fc_inhibit = (v >> 6) & 1;
        if (fc_inhibit) frame_irq = 0;
        fc_cycle = 0;
        if (fc_mode) { quarter_frame(); half_frame(); }
        break;
    }
}

static uint8_t apu_status(void) {
    apu_sync();
    uint8_t r = (uint8_t)((pulse[0].len ? 1 : 0) | (pulse[1].len ? 2 : 0) | (tri.len ? 4 : 0) |
                          (noi.len ? 8 : 0) | (dmc.remaining ? 16 : 0) | (frame_irq ? 0x40 : 0) | (dmc.irq ? 0x80 : 0));
    frame_irq = 0;
    return r;
}

/* ---------------- I/O dispatch ---------------- */
uint8_t io_read(uint16_t a) {
    if (a < 0x4000) {
        ppu_sync();
        switch (a & 7) {
        case 2: {
            uint8_t r = (uint8_t)((ppu_status & 0xE0) | (ppu_latch & 0x1F));
            ppu_status &= 0x7F; ppu_w = 0; ppu_latch = r;
            return r;
        }
        case 4: return ppu_latch = oam[oam_addr];
        case 7: {
            uint16_t addr = ppu_v & 0x3FFF;
            uint8_t r;
            if (addr < 0x3F00) { r = read_buf; read_buf = ppu_mem_read(addr); }
            else { r = (uint8_t)((ppu_mem_read(addr) & 0x3F) | (ppu_latch & 0xC0)); read_buf = ppu_mem_read(addr - 0x1000); }
            ppu_v = (uint16_t)((ppu_v + ((ppu_ctrl & 4) ? 32 : 1)) & 0x7FFF);
            return ppu_latch = r;
        }
        default: return ppu_latch;
        }
    }
    if (a == 0x4015) return apu_status();
    if (a == 0x4016 || a == 0x4017) {
        int i = a & 1;
        uint8_t r;
        if (pad_strobe) r = pad_state[i] & 1;
        else { r = pad_shift[i] & 1; pad_shift[i] = (uint8_t)((pad_shift[i] >> 1) | 0x80); }
        return (uint8_t)(r | 0x40);
    }
    if (a >= 0x6000) return wram[a - 0x6000];
    return (uint8_t)(a >> 8);
}

void io_write(uint16_t a, uint8_t v) {
    if (a < 0x4000) {
        ppu_sync();
        if (ppu_write_hook) ppu_write_hook((uint16_t)(0x2000 | (a & 7)), v, ppu_v);
        ppu_latch = v;
        switch (a & 7) {
        case 0:
            if ((v & 0x80) && !(ppu_ctrl & 0x80) && (ppu_status & 0x80)) { nmi_pending = 1; next_event = 0; }
            ppu_ctrl = v;
            ppu_t = (uint16_t)((ppu_t & ~0x0C00) | ((v & 3) << 10));
            break;
        case 1: ppu_mask = v; schedule(); break;
        case 3: oam_addr = v; break;
        case 4: oam[oam_addr++] = v; break;
        case 5:
            if (!ppu_w) { ppu_t = (uint16_t)((ppu_t & ~0x1F) | (v >> 3)); ppu_x = v & 7; }
            else ppu_t = (uint16_t)((ppu_t & ~0x73E0) | ((v & 7) << 12) | ((v & 0xF8) << 2));
            ppu_w ^= 1;
            break;
        case 6:
            if (!ppu_w) ppu_t = (uint16_t)((ppu_t & 0x00FF) | ((v & 0x3F) << 8));
            else { ppu_t = (uint16_t)((ppu_t & 0x7F00) | v); ppu_v = ppu_t; }
            ppu_w ^= 1;
            break;
        case 7:
            ppu_mem_write(ppu_v, v);
            ppu_v = (uint16_t)((ppu_v + ((ppu_ctrl & 4) ? 32 : 1)) & 0x7FFF);
            break;
        }
        if (nmi_pending) next_event = 0;
        return;
    }
    if (a == 0x4014) {
        uint16_t base = (uint16_t)(v << 8);
        for (int i = 0; i < 256; i++) oam[(uint8_t)(oam_addr + i)] = rd((uint16_t)(base + i));
        cycles += 513 + (cycles & 1);
        return;
    }
    if (a == 0x4016) {
        pad_strobe = v & 1;
        if (pad_strobe) { pad_shift[0] = pad_state[0]; pad_shift[1] = pad_state[1]; }
        return;
    }
    if (a < 0x4018) { apu_write(a, v); return; }
    if (a >= 0x6000) wram[a - 0x6000] = v;
}

/* ---------------- interrupts ---------------- */
static void take_interrupt(uint16_t vec) {
    if (vec == 0xFFFA && nmi_hook) nmi_hook(PC);
    if (nest_depth >= 62) { fprintf(stderr, "interrupt nesting overflow\n"); abort(); }
    nest_depth++;
    if (nest_depth > stat_max_nest) stat_max_nest = nest_depth;
    nest_s[nest_depth] = S;
    PUSH16(PC);
    PUSH(getP(0));
    fI = 1;
    cycles += 7;
    PC = (uint16_t)(rd(vec) | (rd((uint16_t)(vec + 1)) << 8));
    g_exec();
    nest_depth--;
}

static int irq_asserted(void) { return frame_irq || dmc.irq || mapper_irq; }

int service(void) {
    if (pad_strobe) { pad_shift[0] = pad_state[0]; pad_shift[1] = pad_state[1]; }
    ppu_sync();
    if (nmi_pending) {
        nmi_pending = 0;
        schedule();
        take_interrupt(0xFFFA);
        return 1;
    }
    if (!fI && irq_asserted()) {
        take_interrupt(0xFFFE);
        return 1;
    }
    return 0;
}

/* ---------------- interpreter ---------------- */
int interp_step(void) {
    uint16_t ea;
    (void)ea;
    stat_interp_insns++;
    if (cov_map && PC >= 0x8000)
        { int sl = (PC >> 13) & 3; cov_map[(sl * prg_banks8 + prg_map[sl]) * 0x2000 + (PC & 0x1FFF)] = 1; }
    uint8_t op = rd(PC);
    switch (op) {
#include "interp_gen.inc"
    }
    return 0;
}

int interp_run(void) {
    for (;;) {
        if (interp_step()) return 1;
        if (cycles >= next_event) service();
    }
}

/* ---------------- power on ---------------- */

void nes_reset_cpu(void) {
    S = 0xFD; fI = 1;
    PC = (uint16_t)(rd(0xFFFC) | (rd(0xFFFD) << 8));
    cycles = 7;
}

void nes_power(const uint8_t *prg_data, int nbanks, const uint8_t *chr_data, int chr_size, int vmirror, int mapper_no) {
    prg = prg_data;
    prg_banks = nbanks;
    prg_banks8 = nbanks * 2;
    mapper = mapper_no;
    chr_rom = chr_data;
    chr_pages = chr_data ? chr_size / 0x400 : 0;
    for (int i = 0; i < 8; i++) set_chr1(i, i);
    set_prg16(0, nbanks - 1);
    set_mirroring(vmirror ? 2 : 3);
    mapper_irq = 0;
    if (mapper == 1) { mmc1_shift = mmc1_count = 0; mmc1_ctrl = 0x0C; mmc1_prg = mmc1_chr0 = mmc1_chr1 = 0; mmc1_update(); }
    if (mapper == 4) {
        m3_sel = m3_mirror = m3_latch = m3_counter = m3_reload = m3_irq_en = 0;
        static const uint8_t init[8] = {0, 2, 4, 5, 6, 7, 0, 1};
        memcpy(m3_r, init, 8);
        m3_mirror = vmirror ? 0 : 1;
        mmc3_update();
    }
    /* full power-on state, so this can also serve as a hard reset */
    memset(pulse, 0, sizeof pulse); memset(&tri, 0, sizeof tri);
    memset(&noi, 0, sizeof noi); memset(&dmc, 0, sizeof dmc);
    fc_mode = fc_inhibit = frame_irq = 0; fc_cycle = 0;
    ppu_ctrl = ppu_mask = ppu_status = oam_addr = ppu_latch = read_buf = 0;
    ppu_v = ppu_t = 0; ppu_x = ppu_w = 0; nmi_pending = 0; odd_frame = 0;
    memset(vram, 0, sizeof vram); memset(oam, 0, sizeof oam); memset(pal, 0, sizeof pal);
    nest_depth = 0; cpu_jammed = 0; extra_done = 0; apu_frozen = 0; A = X = Y = 0; fC = fN = fV = fD = 0; fZ = 1;
    pad_strobe = 0;
    for (int i = 0; i < 31; i++) pulse_tbl[i] = i ? (float)(95.52 / (8128.0 / i + 100)) : 0;
    for (int i = 0; i < 203; i++) tnd_tbl[i] = i ? (float)(163.67 / (24329.0 / i + 100)) : 0;
    noi.lfsr = 1; noi.period = 4;
    dmc.rate = 428; dmc.bits = 8; dmc.silence = 1;
    memset(ram, 0, sizeof ram);
    ppu_line = 0; line_start_dot = 0; ev_stage = 0;
    nes_reset_cpu();
    apu_last = cycles;
    schedule();
}
