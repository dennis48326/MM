/* Mega Man 6 level provider for true widescreen.
 *
 * Reverse-engineered from games/mm6/disasm (column builder $D1FB, map pointer
 * $D900, per-stage setup $DBD8). The map is stored differently from Mega Man 3-5:
 *   - Per-stage RAM (copied from tables at $DF21..): map bank $6F (at $A000) and
 *     map address $53:$52; graphics bank $6E (at $8000), block table page $67,
 *     metatile table page $63.
 *   - Map: block id of screen s, block row r (0-7), block column c (0-7) at
 *     ($53 + r) * 256 + $52 + s*8 + c (one page per block row).
 *   - Block b -> metatiles at $67xx + b*4 (TL, TR, BL, BR).
 *   - Metatile m -> tiles at pages $63+0..3 (TL, TR, BL, BR) + m, palette page $63+4.
 *   - RAM: camera x = $57:$F7 (map screen = camera screen + $59).
 *   - Rooms: MM6 has no section table; invisible trigger objects in the level set
 *     $71 (bit 0: may scroll right, bit 1: may scroll left). A locked side ends
 *     at the screen the camera can still reach; an open side is shown.
 */
#include "nes.h"

static const uint8_t *mapb, *gfx;
static int map_lo, map_hi, blk_page, mt_page, scr_off, lim_lo, lim_hi;

static int mm6_begin(int *cam) {
    if (ram[0x6E] >= 0x40 || ram[0x6F] >= 0x40) return 0;
    mapb = prg + ram[0x6F] * 0x2000;
    gfx = prg + ram[0x6E] * 0x2000;
    map_lo = ram[0x52]; map_hi = ram[0x53];
    blk_page = ram[0x67]; mt_page = ram[0x63];
    if (map_hi < 0xA0 || map_hi > 0xB8 || blk_page < 0x80 || blk_page > 0x9F || mt_page < 0x80 || mt_page > 0x9B) return 0;
    int scr = ram[0x57], fine = ram[0x56];
    scr_off = ram[0x59];
    lim_lo = (ram[0x71] & 2) ? 0 : scr + (fine >= 0xF0);
    lim_hi = (ram[0x71] & 1) ? 255 : scr + (fine > 0);
    *cam = scr * 256 + ram[0xF7];
    return 1;
}

static int mm6_tile(int tx, int ty, uint8_t *tile, uint8_t *palno) {
    if (tx < 0 || ty > 29) return 0;
    int screen = tx >> 5;
    if (screen < lim_lo || screen > lim_hi) return 0;
    screen += scr_off;
    if (screen >= 32) return 0;
    int addr = (map_hi + (ty >> 2)) * 256 + map_lo + screen * 8 + ((tx >> 2) & 7);
    if (addr < 0xA000 || addr > 0xBFFF) return 0;
    int b = mapb[addr - 0xA000];
    int m = gfx[(blk_page - 0x80) * 256 + b * 4 + ((ty >> 1) & 1) * 2 + ((tx >> 1) & 1)];
    *tile = gfx[(mt_page - 0x80 + (ty & 1) * 2 + (tx & 1)) * 256 + m];
    *palno = gfx[(mt_page - 0x80 + 4) * 256 + m] & 3;
    return 1;
}

const WideProvider wide_mm6 = {mm6_begin, mm6_tile};
