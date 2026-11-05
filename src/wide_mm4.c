/* Mega Man 4 level provider for true widescreen.
 *
 * Same engine family as Mega Man 3 (see wide_mm3.c); reverse-engineered from
 * games/mm4/disasm (block builder $D17F, layout pointer $D2D7, sections $CAFF):
 *   - Level bank: 8 KB PRG bank ($22 | $20), mapped at $A000.
 *   - $B500 + n: layout id of level screen n; layouts (8x8 blocks of 32x32 px,
 *     row by row) at $A900 + id*64.
 *   - Block b -> metatiles at $A500 + b*4 (TL, TR, BL, BR).
 *   - Metatile m -> tiles $A000/$A100/$A200/$A300 + m, palette $A400 + m (low bits).
 *   - $B530 + k: sections. Bits 0-3 = screens after the first, $20 in the next
 *     section's top bits = it continues to the right (one scrolling room).
 *   - RAM: camera x = $F9:$FC, section = $2B & 15, its length $2D,
 *     screens scrolled into it $2E.
 */
#include "nes.h"

static const uint8_t *bk;
static int lim_lo, lim_hi;

static int mm4_begin(int *cam) {
    int st = ram[0x22];
    if (st >= 0x20) return 0;
    bk = prg + (st | 0x20) * 0x2000;
    int sec = ram[0x2B] & 15, scr = ram[0xF9];
    if (ram[0x2E] > scr || ram[0x2D] > 15) return 0;
    lim_lo = scr - ram[0x2E];
    lim_hi = lim_lo + ram[0x2D];
    /* sections joined horizontally form one room */
    for (int k = sec + 1; k < 16 && (bk[0x1530 + k] & 0xE0) == 0x20; k++) lim_hi += (bk[0x1530 + k] & 15) + 1;
    for (int k = sec; k > 0 && (bk[0x1530 + k] & 0xE0) == 0x20; k--) lim_lo -= (bk[0x1530 + k - 1] & 15) + 1;
    if (lim_lo < 0) lim_lo = 0;
    *cam = scr * 256 + ram[0xFC];
    return 1;
}

static int mm4_tile(int tx, int ty, uint8_t *tile, uint8_t *palno) {
    if (tx < 0 || ty > 29) return 0;
    int screen = tx >> 5;
    if (screen < lim_lo || screen > lim_hi || screen >= 0x30) return 0;
    int id = bk[0x1500 + screen];
    if (id >= 48) return 0;
    int blk = (ty >> 2) * 8 + ((tx >> 2) & 7), q = ((ty >> 1) & 1) * 2 + ((tx >> 1) & 1);
    int b = bk[0x900 + id * 64 + blk];
    int m = bk[0x500 + b * 4 + q];
    *tile = bk[((ty & 1) * 2 + (tx & 1)) * 0x100 + m];
    *palno = bk[0x400 + m] & 3;
    return 1;
}

const WideProvider wide_mm4 = {mm4_begin, mm4_tile};
