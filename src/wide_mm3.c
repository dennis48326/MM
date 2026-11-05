/* Mega Man 3 level provider for true widescreen.
 *
 * Reverse-engineered from the game (see games/mm3/disasm, column builder at $E4F1):
 *   - The stage's level data is the 8 KB PRG bank $22, mapped at $A000; the layouts and
 *     metatiles come from bank table[$22] (table at $C8B9, mostly the same bank).
 *   - $AA00 + n: layout id of level screen n. A screen is 8x8 blocks of 32x32 pixels,
 *     stored row by row at $AF00 + id*64.
 *   - Block b -> four 16x16 metatiles at $B700 + b*4 (order TL, TR, BL, BR).
 *   - Metatile m -> tiles at $BB00/$BC00/$BD00/$BE00 + m (TL, TR, BL, BR),
 *     palette = $BF00 + m (low two bits).
 *   - $AA40 + k: level sections ("rooms"); bits 0-4 = screens after the first,
 *     bits 6-7 = vertical link. Section k starts after the screens of sections 0..k-1.
 *   - RAM: camera x = $F9:$FC, current section = $2B.
 * The same engine (with different addresses) runs Mega Man 4-6; see wide_mm4.c etc.
 */
#include "nes.h"

static const uint8_t *bk, *gfx;   /* level bank ($22) and layout/metatile bank (table at $C8B9) */
static int lim_lo, lim_hi, breakable;
static const uint8_t gfx_bank[23] = {0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0C,0x0D,0x0D,0x0F,
                                     0x0D,0x11,0x12,0x13,0x10,0x1E,0x0E};

static int mm3_begin(int *cam) {
    int st = ram[0x22];
    if (st >= 23) return 0;
    bk = prg + st * 0x2000;
    gfx = prg + gfx_bank[st] * 0x2000;
    breakable = st == 2 || st == 9;   /* blocks Mega Man can destroy: cleared per $0110 bit mask */
    int sec = ram[0x2B];
    if (sec >= 0x20) return 0;
    int start = 0;
    for (int k = 0; k < sec; k++) start += (bk[0xA40 + k] & 0x1F) + 1;
    lim_lo = start;
    lim_hi = start + (bk[0xA40 + sec] & 0x1F);
    *cam = ram[0xF9] * 256 + ram[0xFC];
    return 1;
}

static int mm3_tile(int tx, int ty, uint8_t *tile, uint8_t *palno) {
    if (tx < 0 || ty > 29) return 0;
    int screen = tx >> 5;
    if (screen < lim_lo || screen > lim_hi || screen >= 0x40) return 0;
    int id = bk[0xA00 + screen];
    if (id >= 48) return 0;
    int blk = (ty >> 2) * 8 + ((tx >> 2) & 7), q = ((ty >> 1) & 1) * 2 + ((tx >> 1) & 1);
    int b = gfx[0xF00 + id * 64 + blk];
    int m = gfx[0x1700 + b * 4 + q];
    *tile = gfx[0x1B00 + ((ty & 1) * 2 + (tx & 1)) * 0x100 + m];
    *palno = gfx[0x1F00 + m] & 3;
    if (breakable && (gfx[0x1F00 + m] & 0xF0) == 0x70 &&
        (ram[0x110 + (((screen & 1) << 5) | (blk >> 1))] & (0x80 >> (((blk & 1) << 2) | q))))
        *tile = 0;
    return 1;
}

const WideProvider wide_mm3 = {mm3_begin, mm3_tile};
