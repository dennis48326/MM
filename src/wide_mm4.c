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


/* ---- objects in the extra columns ----
 * Object placement list, in the level bank at $B100/$B180/$B200/$B280 + i: screen,
 * x, y (screen y; objects are only placed in the room they belong to), type; sorted
 * by screen, $FF ends it. Types $C0+ are palette / scroll triggers, not objects.
 * Spawner (bank $38 at $8000, the level bank at $A000; called every frame): $9E is the
 * next entry to the right (spawned when x <= camera + 255), $9F the number of entries
 * left of the camera (entry $9F-1 spawned when x >= camera), so an entry spawns when it
 * crosses the 256-pixel screen edge. It is skipped while a slot $08-$17 holds it
 * ($0438 + slot = list index) or its bit in $0100 + i/8 (mask $FCBF) is set (gone for
 * good: collected / destroyed, sub_3F_FC9E). Per type t: $817F flags (-> $0528),
 * $820F AI routine (-> $0300), $829F contact damage / hit points (-> $0408; bit 7 =
 * hurts on touch), $832F animation (-> $0558); all in bank $38.
 * Slots (24, X = 0 Mega Man, 1-7 shots, 8-$17 enemies/objects): $0300 AI (0 = free),
 * $0330/$0348 x lo/hi (world), $0378/$0390 y lo/hi (hi != 0: off screen vertically),
 * $0528 flags (bit 6 facing = h-flip, bit 5 behind background, bit 4 world coords,
 * bit 2 invisible), $0558 animation, $0540 frame, $05B8 hit flash.
 * Drawing (sub_3E_DC67): bank $DFFA[AI] at $A000 (and that bank - 1 at $8000);
 * animation $BE00/$BF00: [bit 7: second sprite table | last frame], delay, sprite ids
 * (0 = object ends); sprite $B800/$BA00 (or $B900/$BB00) + id: count-1, offset table
 * index (+1 when flipped), (tile, attr) pairs; offsets $BC00/$BD00 + index: (dy, dx)
 * signed pairs. Sprites whose y or x overflow the screen are hidden; $EF nonzero:
 * sprites below that line go behind the background. */
static const uint8_t *b38, *ob_lo, *ob_hi;
static uint8_t mm4_rom(int a) {
    if (a >= 0xC000) return prg[(prg_banks8 - 2) * 0x2000 + (a - 0xC000)];
    return a >= 0xA000 ? ob_hi[a - 0xA000] : ob_lo[a - 0x8000];
}

/* harmless objects worth showing before the game spawns them (list types; the
 * rest are enemies, hazards, bosses, or invisible / scripted helpers) */
static const uint8_t mm4_harmless[0x90] = {
    [0x28] = 1, [0x82] = 1,                      /* propeller lifts you ride (Bright Man) */
    [0x80] = 1,                                  /* static block decoration (Bright Man) */
    [0x29] = 1,                                  /* static breakable pillar (Cossack 2 / 4) */
    [0x31] = 1, [0x32] = 1,                      /* Eddie */
    [0x56] = 1,                                  /* E-tank */
    [0x5A] = 1, [0x5B] = 1, [0x7A] = 1, [0x7B] = 1,   /* weapon / life energy, large and small */
    [0x7C] = 1,                                  /* 1-up */
    [0x7D] = 1, [0x7E] = 1,                      /* Wire / Balloon adapter */
    [0x74] = 1,                                  /* boss-rush teleporters (Wily 3) */
};

/* map the object's sprite banks: $DFFA + AI (the table runs on into $E000) */
static int mm4_map(int ai) {
    int a = 0xDFFA + ai, bank = prg[(prg_banks8 - (a >= 0xE000 ? 1 : 2)) * 0x2000 + (a & 0x1FFF)];
    if (bank < 1 || bank >= prg_banks8) return 0;
    ob_hi = prg + bank * 0x2000; ob_lo = prg + (bank - 1) * 0x2000;
    return 1;
}

static int mm4_meta(WideSprite *o, int n, int max, int ai, int anim, int frame, int sx, int sy, int fl) {
    if (!anim || !mm4_map(ai)) return n;
    int ap = mm4_rom(0xBE00 + anim) | mm4_rom(0xBF00 + anim) << 8;
    if (ap < 0x8000) return n;
    int b0 = mm4_rom(ap);
    if (frame > (b0 & 0x7F)) frame = 0;
    int id = mm4_rom(ap + 2 + frame);
    if (!id) return n;
    int t0 = (b0 & 0x80) ? 0xB900 : 0xB800;
    int mp = mm4_rom(t0 + id) | mm4_rom(t0 + 0x200 + id) << 8;
    if (mp < 0x8000) return n;
    int cnt = mm4_rom(mp) + 1, oi = (mm4_rom(mp + 1) + ((fl & 0x40) ? 1 : 0)) & 0xFF;
    int op = mm4_rom(0xBC00 + oi) | mm4_rom(0xBD00 + oi) << 8;
    if (op < 0x8000) return n;
    for (int k = 0; k < cnt && n < max; k++) {
        int y = sy + (int8_t)mm4_rom(op + 2 * k);
        if (y < 0 || y >= 0xF0) continue;
        int at = (mm4_rom(mp + 3 + 2 * k) ^ (fl & 0x40)) | (fl & 0x20);
        if (ram[0xEF] && ram[0xEF] < y) at |= 0x20;
        o[n].x = (int16_t)(sx + (int8_t)mm4_rom(op + 2 * k + 1)); o[n].y = (int16_t)y;
        o[n].tile = mm4_rom(mp + 2 + 2 * k); o[n].attr = (uint8_t)at;
        n++;
    }
    return n;
}

static int mm4_objects(WideSprite *o, int max) {
    int camx = ram[0xF9] * 256 + ram[0xFC], n = 0;
    b38 = prg + 0x38 * 0x2000;
    /* spawned objects (not Mega Man) */
    for (int s = 1; s < 0x18; s++) {
        int fl = ram[0x528 + s];
        if (!ram[0x300 + s] || !(fl & 0x10) || (fl & 0x04) || ram[0x390 + s]) continue;
        int sx = ram[0x348 + s] * 256 + ram[0x330 + s] - camx;
        if (sx < -wide_ext - 64 || sx >= 256 + wide_ext + 64) continue;
        int fx = ram[0x5B8 + s];
        if (fx && !(fx & 0x80) && (fx & 2)) continue;          /* blinking, as the game does */
        n = mm4_meta(o, n, max, ram[0x300 + s], ram[0x558 + s], ram[0x540 + s] & 0x7F, sx, ram[0x378 + s], fl);
    }
    /* not spawned yet: harmless ones only */
    for (int i = 0; i < 128; i++) {
        int scr = bk[0x1100 + i];
        if (scr == 0xFF) break;
        int t = bk[0x1280 + i];
        if (t >= 0x90 || (!mm4_harmless[t] && !wide_ghost_all)) continue;
        if (scr < lim_lo || scr > lim_hi) continue;
        int sx = scr * 256 + bk[0x1180 + i] - camx;
        if (i >= ram[0x9E]) { if (sx < 256 || sx >= 256 + wide_ext + 32) continue; }   /* still to come on the right */
        else if (i < ram[0x9F]) { if (sx >= 0 || sx < -wide_ext - 32) continue; }     /* passed on the left */
        else continue;
        if (ram[0x100 + (i >> 3)] & (1 << (i & 7))) continue;  /* gone for good */
        int k;
        for (k = 8; k < 0x18 && ram[0x438 + k] != i; k++) ;
        if (k < 0x18) continue;                                /* the game has it */
        int fl = b38[0x17F + t], ai = b38[0x20F + t], anim = b38[0x32F + t];
        if (fl & 0x04) continue;
        int frame = 0;
        if (anim && mm4_map(ai)) {
            int ap = mm4_rom(0xBE00 + anim) | mm4_rom(0xBF00 + anim) << 8;
            if (ap >= 0x8000) {
                frame = (int)((frame_count / (mm4_rom(ap + 1) + 1u)) % ((mm4_rom(ap) & 0x7F) + 1u));
                if (!mm4_rom(ap + 2 + frame)) frame = 0;
            }
        }
        n = mm4_meta(o, n, max, ai, anim, frame, sx, bk[0x1200 + i], fl);
    }
    return n;
}

const WideProvider wide_mm4 = {mm4_begin, mm4_tile, mm4_objects};
