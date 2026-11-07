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


/* ---- objects in the extra columns ----
 * Bank 6 (16 KB, mapped at $8000 while the game spawns and draws objects) holds:
 *   - the placement lists: word $A452 + stage*2 -> entries of 4 bytes, sorted by x:
 *     screen, x, y, type; screen $FF ends the list. y $FE (wake up objects of that type)
 *     and $FF (enemy generator, Guts Man lift spawner), and type $FF, are not objects.
 *   - per type: flags $A380 (copied to $0420: $40 facing, $20 invisible, $04 can be shot,
 *     $02 touches Mega Man; types $3C-$47 are pickups, the rest hurt).
 * Spawning (sub_0E_D896 -> D9AD): an entry is spawned when the scrolling camera brings it
 * into the 256-pixel screen ($8B/$8C track the first entries left / right of the screen),
 * unless its list index is still in $7B..$8A (slot $10+n keeps it in $7B+n; set to $FF
 * when the object is destroyed or leaves; a collected pickup keeps it until its slot is
 * reused). Nothing is remembered beyond that, so 1-ups and energy come back like in the game.
 * A spawned list object gets sprite $0400 = $FF and type $06E0; slots: $0420 flags,
 * $0460/$0480 x (screen, pixel), $0600 y ($F8 = free slot), $0440 animation (frame << 4 |
 * delay counter), $0640 (high nibble added to $0400 for other sprites). Slot 0 is Mega Man.
 * Drawing (sub_0E_D16E, bank 6): $0400 != $FF: animation word $8186 + (sprite + $0640 >> 4)*2;
 * $0400 = $FF: invisible if $0420 & $20, animation word $8770 + type*2. Animation: byte 0 =
 * last frame << 4 | delay, then one byte per frame: metasprite word $8000 + id*2 (normal) or
 * $8650 / $8750 + (id*2 & $FF) for id < $80 / >= $80 (type path). Metasprite: count, offset
 * set (word $82AA + n*2 -> one index per sprite: dy $833A, dx $843A, flipped dx $853A),
 * then (tile, attr) pairs; attr ^= facing, |= $20 in two places (sub_0E_D328).
 * Sprites past the screen edge are hidden by the game, so spawned objects are drawn here
 * in full (also the Guts Man lifts, which flag themselves invisible off screen); unspawned
 * list entries are drawn (as previews) only if harmless. */
static const uint8_t *b6;
static uint8_t r6(int a) { return b6[(a - 0x8000) & 0x3FFF]; }
static int w6(int a) { return r6(a) | r6(a + 1) << 8; }

/* harmless list objects worth showing before the game spawns them. Every other type in the
   lists hurts on touch or is an invisible trigger/generator; MM1's platforms (Guts Man lifts)
   are made by a generator entry at the start of the stage, so they are always "spawned". */
static const uint8_t mm1_harmless[256] = {
    [0x3D] = 1, [0x3E] = 1, [0x3F] = 1, [0x40] = 1,   /* weapon / life energy, small and large */
    [0x41] = 1,                                       /* 1-up */
    [0x42] = 1,                                       /* Magnet Beam (Elec Man stage) */
    [0x45] = 1,                                       /* full refill (Wily 4) */
    /* $43 (Wily 4) is invisible; $3C (bonus ball) and $44 only come from defeated enemies */
};

static int mm1_meta(WideSprite *o, int n, int max, int mp, int sx, int sy, int flip, int pri) {
    if (mp < 0x8000 || mp > 0xBFFF) return n;
    int cnt = r6(mp), op = w6(0x82AA + ((r6(mp + 1) << 1) & 0xFF));
    for (int k = 0; k < cnt && n < max; k++) {
        int idx = r6(op + k);
        int yy = sy + (int8_t)r6(0x833A + idx);
        if (yy < 0 || yy >= 0xF0) continue;
        o[n].x = (int16_t)(sx + (int8_t)r6((flip ? 0x853A : 0x843A) + idx));
        o[n].y = (int16_t)yy;
        o[n].tile = r6(mp + 2 + k * 2);
        o[n].attr = (uint8_t)((r6(mp + 3 + k * 2) ^ flip) | pri);
        n++;
    }
    return n;
}

/* metasprite of a list-object type at animation frame f */
static int mm1_type_meta(int type, int f) {
    int ap = w6(0x8770 + ((type << 1) & 0xFF));
    if (ap < 0x8000 || ap > 0xBFFF) return 0;
    int id = r6(ap + 1 + f);
    return w6(((id & 0x80) ? 0x8750 : 0x8650) + ((id << 1) & 0xFF));
}

/* sub_0E_D328: behind the background in parts of Fire Man's stage and Wily 2 */
static int mm1_pri(int scr, int y) {
    int st = ram[0x31];
    if (st == 3) return scr >= 8 && scr < 10 && y >= 0x4C && y < 0x69 ? 0x20 : 0;
    if (st == 7) return (scr == 0x1B || scr == 0x1C || scr == 0x1F || scr == 0x20) && y >= 0xB9 ? 0x20 : 0;
    return 0;
}

static int in_ext(int wx, int camx) {
    int sx = wx - camx;
    return (sx < 0 && sx >= -wide_ext - 32) || (sx >= 256 && sx < 256 + wide_ext + 32);
}

static int mm1_objects(WideSprite *o, int max) {
    int camx = ram[0x1B] * 256 + ram[0x1A], n = 0, st = ram[0x31];
    b6 = prg + 6 * 0x4000;
    /* spawned objects, everything but Mega Man (slot 0) */
    int nslots = ram[0x54] > 32 ? 32 : ram[0x54];
    for (int s = 1; s < nslots; s++) {
        int y = ram[0x600 + s];
        if (y == 0xF8) continue;
        int wx = ram[0x460 + s] * 256 + ram[0x480 + s];
        if (wx - camx < -wide_ext - 32 || wx - camx >= 256 + wide_ext + 32) continue;
        int fl = ram[0x420 + s], spr = ram[0x400 + s], fr = (ram[0x440 + s] >> 4) + 1, mp;
        if (spr == 0xFF) {
            /* the Guts Man lifts ($2C, AI $B921) set $20 just to hide themselves outside
               screen x $10..$F7; other types use it for really invisible states */
            if ((fl & 0x20) && ram[0x6E0 + s] != 0x2C) continue;
            int ap = w6(0x8770 + ((ram[0x6E0 + s] << 1) & 0xFF));
            if (ap < 0x8000 || ap > 0xBFFF) continue;
            int id = r6(ap + fr);
            mp = w6(((id & 0x80) ? 0x8750 : 0x8650) + ((id << 1) & 0xFF));
        } else {
            int ap = w6(0x8186 + ((spr + (ram[0x640 + s] >> 4)) & 0xFF) * 2);
            if (ap < 0x8000 || ap > 0xBFFF) continue;
            mp = w6(0x8000 + r6(ap + fr) * 2);
        }
        n = mm1_meta(o, n, max, mp, wx - camx, y, fl & 0x40, mm1_pri(ram[0x460 + s], y));
    }
    /* not spawned yet: harmless ones only */
    if (st >= 10) return n;
    int lp = w6(0xA452 + st * 2);
    for (int i = 0; i < 256; i++) {
        int a = lp + i * 4;
        if (a > 0xBFFC) break;
        int scr = r6(a);
        if (scr == 0xFF) break;
        int y = r6(a + 2), type = r6(a + 3);
        if (y >= 0xFE || type == 0xFF) continue;
        if (!mm1_harmless[type] && !wide_ghost_all) continue;
        if (scr < ram[0x27] || scr > ram[0x28]) continue;      /* another room */
        int wx = scr * 256 + r6(a + 1);
        if (!in_ext(wx, camx)) continue;
        int k;
        for (k = 0; k < 16 && ram[0x7B + k] != i; k++) ;
        if (k < 16) continue;                                  /* the game has it */
        int fl = r6(0xA380 + type);
        if (fl & 0x20) continue;                               /* invisible */
        int ap = w6(0x8770 + ((type << 1) & 0xFF)), f = 0;
        if (ap >= 0x8000 && ap <= 0xBFFF) f = (int)((frame_count / ((r6(ap) & 15) + 1u)) % ((r6(ap) >> 4) + 1u));
        n = mm1_meta(o, n, max, mm1_type_meta(type, f), wx - camx, y, fl & 0x40, mm1_pri(scr, y));
    }
    return n;
}

const WideProvider wide_mm1 = {mm1_begin, mm1_tile, mm1_objects};
