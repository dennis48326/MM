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


/* ---- objects in the extra columns ----
 * Reverse-engineered from games/mm5/disasm (spawner bank $1B $988A/$990A, drawer $DFC3/$E08F):
 *   - Placement list in the level bank ($26, at $A000), sorted by x, up to 128 entries:
 *     $AA00 + i screen ($FF ends), $AA80 x, $AB00 y (screen y; rooms have no world y),
 *     $AB80 type (types >= $C0 are palette/scroll events, not objects).
 *     The game keeps two cursors ($AD right, $AE left) and spawns an entry when it
 *     crosses the edge of the 256-px screen (right edge = camera + 255) in the
 *     scroll direction (bit 0 of $AC), unless a slot $08-$17 already holds it
 *     ($0438 + slot = list index, $FF when free) or its "gone for good" bit is set
 *     ($0100 + i/8, bit i&7: set when an item is collected, sub $F297).
 *   - Type tables (bank $1B at $8000): $9A42 flags (bit 7: does not face Mega Man,
 *     the rest -> $0528), $9AD2 routine id (-> $0300), $9BF2 animation id (-> $0558).
 *   - Slots 0..$17: $0300 routine (0 = free), $0330/$0348 x lo/hi, $0378 y, $0390 y page
 *     (0 = on screen), $0528 flags (bit 2 invisible, $10 behind bg, $20 h-flip (facing
 *     right), $40 v-flip), $0540 animation frame (bits 0-6), $0558 animation id.
 *   - Drawing: the 16 KB sprite bank at $8000 is $E33B[routine] (and +1). Animation
 *     $8600/$8700[id]: last frame (bit 7: frames in the $8100/$8300 table, else
 *     $8000/$8200), delay, frame ids (0 = none). Frame: CHR 1 KB bank, count-1,
 *     offset-table id ($8400/$8500: dy, dx pairs), then tile, attr pairs. The first
 *     tile's top bits name a sprite CHR slot ($EC + slot = loaded bank, slot 1 fixed);
 *     a frame whose bank is not loaded is not drawn. Flipped offsets are $F8 - d.
 *     An object not on the 256-px screen is not drawn at all; parts sticking out are
 *     culled, which is what the extension shows instead.
 * Previews (not spawned yet) are only drawn for harmless types, below. */
static const uint8_t *fixb, *tyb;

/* 1 = harmless, shown before the game spawns it */
static const uint8_t mm5_harmless[256] = {
    [0x20] = 1, [0x21] = 1, [0x22] = 1, [0x23] = 1,   /* floating lifts (routine $2E) */
    [0x24] = 1, [0x25] = 1, [0x26] = 1, [0x27] = 1,
    [0x4E] = 1,                                       /* Wave Man's Marine Bike */
    [0x80] = 1,                                       /* Eddie (only while $5D = 0) */
    [0x81] = 1, [0x82] = 1, [0x83] = 1, [0x84] = 1,   /* E-tank, M-tank (only while $BE = $80), */
    [0x85] = 1, [0x86] = 1, [0x87] = 1,               /* 1-up, energy, */
    [0x88] = 1, [0x89] = 1, [0x8A] = 1, [0x8B] = 1,   /* Beat letters M E G A M A N V */
    [0x8C] = 1, [0x8D] = 1, [0x8E] = 1, [0x8F] = 1,
};
/* Not shown: every enemy and mini-boss ($00-$1F, $28-$3F, $4C, $50, $60, $61, $7F),
 * the chain/spiked-ball arms ($0E/$0F), falling crystals/drills that start hidden ($0A, $10,
 * $11), boss and Wily-stage scripts ($52-$5F, $62-$72) and the invisible spawners/scroll
 * triggers ($40-$4B, $55-$58: no animation). Eddie and the M-tank start with the hidden
 * flag set but their routines clear it on the first frame, so it is ignored for them.
 * Lifts are previewed in their first frame (the game holds their frame), items animate. */

static int mm5_meta(WideSprite *o, int n, int max, int routine, int anim, int frame, int sx, int sy, int fl) {
    if (!anim) return n;
    const uint8_t *sb = prg + (fixb[0xE33B - 0xC000 + routine] % (unsigned)prg_banks8) * 0x2000;
#define SR(a) sb[((a) - 0x8000) & 0x3FFF]
    int ap = SR(0x8600 + anim) | SR(0x8700 + anim) << 8;
    if (ap < 0x8000 || ap >= 0xC000) return n;
    int hdr = SR(ap);
    if (frame > (hdr & 0x7F)) frame = 0;
    int fid = SR(ap + 2 + frame);
    if (!fid) return n;
    int fp = (hdr & 0x80) ? SR(0x8100 + fid) | SR(0x8300 + fid) << 8 : SR(0x8000 + fid) | SR(0x8200 + fid) << 8;
    if (fp < 0x8000 || fp >= 0xC000) return n;
    int slot = SR(fp + 3) >> 6;
    if (slot != 1 && ram[0xEC + slot] != SR(fp)) return n;   /* CHR bank not loaded */
    int cnt = SR(fp + 1) + 1, oi = SR(fp + 2);
    int op = SR(0x8400 + oi) | SR(0x8500 + oi) << 8;
    int f10 = (fl << 1) & 0xC0, f11 = (fl << 1) & 0x20;
    for (int k = 0; k < cnt && n < max; k++) {
        int dy = SR(op + 2 * k), dx = SR(op + 2 * k + 1);
        if (f10 & 0x80) dy = 0xF8 - dy;
        if (f10 & 0x40) dx = 0xF8 - dx;
        int y = sy + (int8_t)dy;
        if (y < 0 || y >= 0xF0) continue;
        o[n].x = (int16_t)(sx + (int8_t)dx); o[n].y = (int16_t)y;
        o[n].tile = SR(fp + 3 + 2 * k);
        o[n].attr = (uint8_t)((SR(fp + 4 + 2 * k) ^ f10) | f11);
        n++;
    }
#undef SR
    return n;
}

static int in_ext(int wx, int camx) {
    int sx = wx - camx;
    return (sx < 0 && sx >= -wide_ext - 32) || (sx >= 256 && sx < 256 + wide_ext + 32);
}

static int mm5_objects(WideSprite *o, int max) {
    int camx = ram[0xF9] * 256 + ram[0xFC], n = 0;
    fixb = prg + (prg_banks8 - 2) * 0x2000;
    tyb = prg + 0x1B * 0x2000;
    /* spawned objects (not Mega Man), as the game would draw them without the screen edge */
    for (int s = 1; s < 0x18; s++) {
        int r = ram[0x300 + s], fl = ram[0x528 + s];
        if (!r || ram[0x390 + s] || (fl & 0x04)) continue;
        int sx = ram[0x348 + s] * 256 + ram[0x330 + s] - camx;
        if (sx < -wide_ext - 64 || sx >= 256 + wide_ext + 64) continue;
        n = mm5_meta(o, n, max, r, ram[0x558 + s], ram[0x540 + s] & 0x7F, sx, ram[0x378 + s], fl);
    }
    /* not spawned yet: harmless ones only, where the game would spawn them */
    int mmx = ram[0x348] * 256 + ram[0x330];
    for (int i = 0; i < 128; i++) {
        int scr = lv[0xA00 + i];
        if (scr == 0xFF) break;
        int type = lv[0xB80 + i];
        if (type >= 0x90) continue;                               /* $C0+: events; no type $90-$BF */
        if (!mm5_harmless[type] && !wide_ghost_all) continue;
        if (scr < lim_lo || scr > lim_hi) continue;               /* another room */
        int wx = scr * 256 + lv[0xA80 + i];
        if (!in_ext(wx, camx)) continue;
        if (ram[0x100 + (i >> 3)] & (1 << (i & 7))) continue;     /* gone for good */
        int k;
        for (k = 8; k < 0x18 && ram[0x438 + k] != i; k++) ;
        if (k < 0x18) continue;                                   /* the game has it */
        if (type == 0x80 && ram[0x5D]) continue;                  /* Eddie already came */
        if (type == 0x82 && ram[0xBE] != 0x80) continue;          /* M-tank removed at once */
        int fl = tyb[0x1A42 + type], routine = tyb[0x1AD2 + type], anim = tyb[0x1BF2 + type];
        if ((fl & 0x04) && !mm5_harmless[type]) continue;         /* invisible (ghost-all mode) */
        fl &= 0x7F;
        if (!(tyb[0x1A42 + type] & 0x80) && wx < mmx) fl |= 0x20; /* faces Mega Man */
        int frame = 0;
        const uint8_t *sb = prg + (fixb[0xE33B - 0xC000 + routine] % (unsigned)prg_banks8) * 0x2000;
        int ap = sb[(0x600 + anim) & 0x3FFF] | sb[(0x700 + anim) & 0x3FFF] << 8;
        if (type >= 0x81 && anim && ap >= 0x8000 && ap < 0xC000) {   /* items animate; lifts keep frame 0 */
            int last = sb[ap - 0x8000] & 0x7F, delay = sb[(ap + 1 - 0x8000) & 0x3FFF];
            frame = (int)((frame_count / (delay + 1u)) % (last + 1u));
            if (!sb[(ap + 2 + frame - 0x8000) & 0x3FFF]) frame = 0;
        }
        n = mm5_meta(o, n, max, routine, anim, frame, wx - camx, lv[0xB00 + i], fl);
    }
    return n;
}

const WideProvider wide_mm5 = {mm5_begin, mm5_tile, mm5_objects};
