/* Mega Man 1 level provider for true widescreen.
 *
 * Reverse-engineered from games/mm1/disasm (block builder $CE58/$CED7):
 *   - Stage bank: 16 KB PRG bank $31 (the stage number), mapped at $8000.
 *   - $8C00 + n: layout id of level screen n; the layout's address is the word at
 *     $8C30 + id*2. A layout is 8x8 blocks of 32x32 px, stored column by column.
 *   - Block b -> metatiles at $8000 + b*4 (TL, BL, TR, BR); metatile m -> tiles
 *     m*4 + 0..3 (TL, BL, TR, BR); attribute byte for the block at $8300 + b.
 *   - RAM: camera x = $1B:$1A, clamped by the game to screens $27..$28 (the room).
 */
#include "nes.h"

static const uint8_t *bk;
static int lim_lo, lim_hi;

static int mm1_begin(int *cam) {
    int st = ram[0x31];
    if (st >= 6) return 0;
    bk = prg + st * 0x4000;
    lim_lo = ram[0x27]; lim_hi = ram[0x28];
    if (lim_hi < lim_lo) return 0;
    *cam = ram[0x1B] * 256 + ram[0x1A];
    return 1;
}

static int mm1_tile(int tx, int ty, uint8_t *tile, uint8_t *palno) {
    if (tx < 0 || ty > 29) return 0;
    int screen = tx >> 5;
    if (screen < lim_lo || screen > lim_hi || screen >= 0x30) return 0;
    int id = bk[0xC00 + screen];
    int ptr = bk[0xC30 + id * 2] | (bk[0xC31 + id * 2] << 8);
    if (ptr < 0x8000 || ptr > 0xBFC0) return 0;
    int b = bk[ptr - 0x8000 + ((tx >> 2) & 7) * 8 + (ty >> 2)];
    int m = bk[b * 4 + ((tx >> 1) & 1) * 2 + ((ty >> 1) & 1)];
    *tile = (uint8_t)(m * 4 + (tx & 1) * 2 + (ty & 1));
    *palno = (bk[0x300 + b] >> (((ty >> 1) & 1) * 4 + ((tx >> 1) & 1) * 2)) & 3;
    return 1;
}

const WideProvider wide_mm1 = {mm1_begin, mm1_tile};
