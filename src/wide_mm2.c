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


/* ---- objects in the extra columns ----
 * Enemies and other objects come from two lists in the stage bank, sorted by x:
 *   $B600/$B700/$B800/$B900 + i: screen, x, y, type (spawned once and again after
 *   leaving the screen; slot n remembers its list index in $0100+n),
 *   $BA00/$BA40/$BA80/$BAC0 + i: the same for objects with lasting state ($0140+i
 *   nonzero while still there; slot n remembers the index in $0130+n).
 * The game spawns an entry when it reaches the 256-pixel screen (sub_1E_D658), so
 * an extended view shows them late. Spawning them earlier would change the game,
 * so harmless ones (platforms and the like, below) are only drawn, as "previews",
 * from the same data the game uses; enemies stay hidden until the game spawns them.
 * Objects already spawned are drawn in full: the game hides the sprites of an
 * object that stick out past the screen edge.
 * Drawing (sub_1E_CEF9): type -> animation $F980/$FA80 (frame count-1, delay, sprite
 * ids); sprite id -> $8100/$8300 in bank $0A: count, offset-table id, then (tile, attr)
 * pairs; offset table $8400/$8500: (dy, dx) pairs, dx through $8600 when flipped. */
static const uint8_t *fixb, *sprb;
static uint8_t rom(int a) { return a >= 0xC000 ? fixb[a - 0xC000] : sprb[(a - 0x8000) & 0x3FFF]; }

/* harmless objects worth showing before the game spawns them. Found from the
   type tables: drawn (no $20 in the $D805 flags), and no contact damage (flag bit 0
   clear, or 0 in the damage table $ED5C); platforms store a width in $0150. */
static const uint8_t mm2_harmless[256] = {
    [0x12] = 1,                                  /* lifts on a track (Crash Man, Wily) */
    [0x13] = 1,                                  /* falling platforms (Bubble Man) */
    [0x2D] = 1, [0x57] = 1,                      /* Crash Bomber walls (Wily) */
    [0x63] = 1,                                  /* floating blocks (Wily 1 dragon) */
    [0x76] = 1, [0x77] = 1, [0x78] = 1, [0x79] = 1,   /* weapon / life energy */
    [0x7A] = 1, [0x7B] = 1,                      /* E-tank, 1-up */
    /* not the Air Man clouds (0x3E): a Lightning Lord rides each one */
};

static int mm2_meta(WideSprite *o, int n, int max, int type, int frame, int sx, int sy, int flags, int palov) {
    int ap = rom(0xF980 + type) | rom(0xFA80 + type) << 8;
    if (ap < 0x8000) return n;
    if (frame > rom(ap)) frame = 0;
    int id = rom(ap + 2 + frame);
    if (!id) return n;
    int mp = sprb[0x100 + id] | sprb[0x300 + id] << 8;
    if (mp < 0x8000) return n;
    int cnt = rom(mp), oi = rom(mp + 1);
    int op = sprb[0x400 + oi] | sprb[0x500 + oi] << 8;
    for (int k = 0, y = 2; k < cnt && n < max; k++, y += 2) {
        int at = rom(mp + y + 1);
        if (palov) at = (at & 0xF0) | palov;
        at ^= flags & 0x40;
        int dxr = rom(op + y + 1);
        int dx = (int8_t)((flags & 0x40) ? sprb[0x600 + dxr] : dxr);
        int yy = (sy + rom(op + y)) & 0xFF;
        if (yy >= 0xF0) continue;
        o[n].x = (int16_t)(sx + dx); o[n].y = (int16_t)yy;
        o[n].tile = rom(mp + y); o[n].attr = (uint8_t)at;
        n++;
    }
    return n;
}

static int in_ext(int wx, int camx) {
    int sx = wx - camx;
    return (sx < 0 && sx >= -wide_ext - 32) || (sx >= 256 && sx < 256 + wide_ext + 32);
}

static int mm2_objects(WideSprite *o, int max) {
    int camx = ram[0x20] * 256 + ram[0x1F], n = 0;
    const uint8_t *lv = prg + bank * 0x4000;
    fixb = prg + (prg_banks - 1) * 0x4000;
    sprb = prg + 0x0A * 0x4000;
    /* spawned enemies and objects (slots $10-$1F) */
    for (int s = 0x10; s < 0x20; s++) {
        int fl = ram[0x420 + s];
        if (!(fl & 0x80) || (fl & 0x20)) continue;
        int wx = ram[0x440 + s] * 256 + ram[0x460 + s];
        n = mm2_meta(o, n, max, ram[0x400 + s], ram[0x6A0 + s], wx - camx, ram[0x4A0 + s], fl, ram[0x100 + s]);
    }
    /* not spawned yet: harmless ones only */
    for (int list = 0; list < 2; list++) {
        int cnt = list ? 64 : 256;
        for (int i = 0; i < cnt; i++) {
            int scr = lv[(list ? 0x3A00 : 0x3600) + i];
            if (scr == 0xFF) break;
            int type = lv[(list ? 0x3AC0 : 0x3900) + i];
            if (!mm2_harmless[type] && !wide_ghost_all) continue;
            int wx = scr * 256 + lv[(list ? 0x3A40 : 0x3700) + i];
            if (!in_ext(wx, camx)) continue;
            if (list && !ram[0x140 + i]) continue;                 /* gone for good */
            int k, base = list ? 0x130 : 0x100;
            for (k = 0; k < 16 && ram[base + k] != i; k++) ;
            if (k < 16) continue;                                  /* the game has it */
            int fl = rom(0xD805 + type);
            if (fl & 0x20) continue;
            int ap = rom(0xF980 + type) | rom(0xFA80 + type) << 8, frame = 0;
            if (ap >= 0x8000) frame = (int)((frame_count / (rom(ap + 1) + 1u)) % (rom(ap) + 1u));
            n = mm2_meta(o, n, max, type, frame, wx - camx, lv[(list ? 0x3A80 : 0x3800) + i], fl, 0);
        }
    }
    return n;
}

const WideProvider wide_mm2 = {mm2_begin, mm2_tile, mm2_objects};
