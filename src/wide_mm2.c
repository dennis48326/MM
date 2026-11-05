/* Mega Man 2 level provider for true widescreen.
 *
 * Reverse-engineered from the game (see games/mm2/disasm):
 *   - The stage's level data lives in 16 KB PRG bank ($2A & 7), mapped at $8000.
 *   - A level is a run of screens; each screen is 8x8 blocks of 32x32 pixels,
 *     stored column by column (64 bytes per screen, screens back to back).
 *   - Block id -> four 16x16 metatiles at $8000 + id*4 (order TL, BL, TR, BR);
 *     metatile m -> tiles m*4+0..3 (TL, BL, TR, BR); attribute byte at $8400 + id.
 *   - RAM: camera x = $20:$1F, room scroll limits (screens) = $14..$15,
 *     right-edge stream pointer $18/$19 = level data + 96 + camera/4 (12 columns ahead).
 * The sub_1E_C96B routine ($C96B) is the game's own block builder this mirrors.
 */
#include "nes.h"

static int bank, base0, lim_lo, lim_hi;

static int mm2_begin(int *cam) {
    int stage = ram[0x2A];
    if (stage > 13) return 0;
    int camx = ram[0x20] * 256 + ram[0x1F];
    int p18 = ram[0x18] | (ram[0x19] << 8);
    if (p18 < 0x8000 || p18 > 0xBFFF) return 0;
    bank = stage & 7;
    base0 = p18 - 0x60 - (camx >> 2);   /* the game streams 384 px ahead of the camera */
    lim_lo = ram[0x14];
    lim_hi = ram[0x15];
    if (lim_hi < lim_lo) return 0;
    *cam = camx;
    return 1;
}

static int mm2_tile(int tx, int ty, uint8_t *tile, uint8_t *palno) {
    int wx = tx * 8;
    if (wx < 0) return 0;
    int screen = wx >> 8;
    if (screen < lim_lo || screen > lim_hi) return 0;     /* past the room edge: dark */
    if (ty > 31) return 0;
    int addr = base0 + (wx >> 5) * 8 + (ty >> 2);
    if (addr < 0x8000 || addr > 0xBFFF) return 0;
    const uint8_t *b = prg + bank * 0x4000;
    int id = b[addr - 0x8000];
    int quad = ((tx >> 1) & 1) * 2 + ((ty >> 1) & 1);
    int m = b[id * 4 + quad];
    *tile = (uint8_t)(m * 4 + (tx & 1) * 2 + (ty & 1));
    int shift = ((ty >> 1) & 1) * 4 + ((tx >> 1) & 1) * 2;
    *palno = (uint8_t)((b[0x400 + id] >> shift) & 3);
    return 1;
}

const WideProvider wide_mm2 = {mm2_begin, mm2_tile};
