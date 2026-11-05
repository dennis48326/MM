/* Mega Man 5 level provider for true widescreen.
 *
 * Same engine family as Mega Man 3/4; reverse-engineered from games/mm5/disasm
 * (block builder $D6C0, layout pointer $D7A3, sections $CB5F/$CD74):
 *   - Level bank $26 (8 KB at $A000): $A900 + n = layout id of screen n,
 *     $A950 + k = sections (bits 0-4 = screens after the first; a next section
 *     with top bits $20 continues to the right).
 *   - Graphics bank $27 (for stage bank $0E: per-screen table at $D793):
 *     layouts at $B600 + id*64 (8x8 blocks, row by row), block b -> metatiles
 *     at $B200 + b*4 (TL, TR, BL, BR), metatile m -> tiles $AD00/$AE00/$AF00/$B000 + m,
 *     palette $B100 + m (low bits).
 *   - RAM: camera x = $F9:$FC, section = $29 & 31, its length $2A,
 *     screens scrolled into it $2B.
 */
#include "nes.h"

static const uint8_t *lv;
static int lim_lo, lim_hi, gfx_bank, special;
static const uint8_t special_gfx[16] = {0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0,1,2,3,4,5,6,7};

static int mm5_begin(int *cam) {
    int lb = ram[0x26];
    if (lb >= 0x40 || ram[0x27] >= 0x40) return 0;
    lv = prg + lb * 0x2000;
    special = lb == 0x0E;
    gfx_bank = ram[0x27];
    int sec = ram[0x29] & 31, scr = ram[0xF9];
    if (ram[0x2B] > scr || ram[0x2A] > 31) return 0;
    lim_lo = scr - ram[0x2B];
    lim_hi = lim_lo + ram[0x2A];
    for (int k = sec + 1; k < 32 && (lv[0x950 + k] & 0xE0) == 0x20; k++) lim_hi += (lv[0x950 + k] & 31) + 1;
    for (int k = sec; k > 0 && (lv[0x950 + k] & 0xE0) == 0x20; k--) lim_lo -= (lv[0x950 + k - 1] & 31) + 1;
    if (lim_lo < 0) lim_lo = 0;
    *cam = scr * 256 + ram[0xFC];
    return 1;
}

static int mm5_tile(int tx, int ty, uint8_t *tile, uint8_t *palno) {
    if (tx < 0 || ty > 29) return 0;
    int screen = tx >> 5;
    if (screen < lim_lo || screen > lim_hi || screen >= 0x50) return 0;
    int id = lv[0x900 + screen];
    if (id >= 40) return 0;
    const uint8_t *g = prg + (special ? (screen < 16 ? special_gfx[screen] : 0x0E) : gfx_bank) * 0x2000;
    int blk = (ty >> 2) * 8 + ((tx >> 2) & 7), q = ((ty >> 1) & 1) * 2 + ((tx >> 1) & 1);
    int b = g[0x1600 + id * 64 + blk];
    int m = g[0x1200 + b * 4 + q];
    *tile = g[0xD00 + ((ty & 1) * 2 + (tx & 1)) * 0x100 + m];
    *palno = g[0x1100 + m] & 3;
    return 1;
}

const WideProvider wide_mm5 = {mm5_begin, mm5_tile};
