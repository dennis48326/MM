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


/* ---- objects in the extra columns ----
 * Stage object list in the stage bank (at $A000): $AB00/$AC00/$AD00/$AE00 + i = screen,
 * x, y (screen y), type; sorted by x, $FF ends it. The spawner (bank $1A, $9C00) walks two
 * indices ($9F left edge, $9E right edge) and spawns entry i when it crosses the edge of
 * the 256-px screen (sub $9C80): not if a slot $10-$1F already has $04C0 = i (any slot,
 * active or not; $FF when deleted), not if "gone" bit $0150[i>>3] & $DEC2[i&7] is set
 * (collected items, set at $BE22; cleared on stage start). Type -> per-type tables in
 * bank 0 (at $A000): $A000 flags (-> $0580), $A100 AI, $A200 hit flags (-> $0480, bit 7
 * = contact damage), $A300 animation, $A400 HP.
 * Object slots (0 = Mega Man, $10-$1F enemies/objects): $0300 bit 7 active, $0360/$0380
 * x lo/hi, $03C0 y, $03E0 y screen (nonzero = off screen vertically), $0580 flags (bit 6
 * flip, 5 behind bg, 4 world coordinates, 2 hidden), $05C0 animation (bit 7 -> bank $1B
 * else $1A; bank $15 for slots >= $10 while $5A != 0), $05A0 frame, $05E0 bit 7 blink.
 * Drawing (bank $1F, $F06B): animation id -> $8000/$8080 pointer: [0] last frame, [1]
 * delay, [2+frame] sprite id (0 = gone); sprite id -> $8100/$8200: count-1 (bit 7: offset
 * tables in bank $14, else $19), offset table index (+1 when flipped), (tile, attr) pairs;
 * offset table at $BE00/$BF00 + index (in that bank at $A000): (dy, dx) pairs. Sprites
 * that wrap past an edge are dropped, objects on another screen are not drawn at all
 * (deleted, or kept up to $48 px away with flag bit 3), so the extension shows nothing of
 * them; the y limit is $F0 ($B0 in a few rooms of stage 8). */
static const uint8_t *bank8(int b) { return prg + (size_t)(b % prg_banks8) * 0x2000; }

/* harmless objects worth showing before the game spawns them (all stages, incl. Doc Robot
 * and Wily stages; types without contact damage, $A200 bit 7 clear, checked by their AI) */
static const uint8_t mm3_harmless[256] = {
    [0x16] = 1, [0x25] = 1, [0x31] = 1, [0x3D] = 1,  /* Magnet Man: wall magnets' field sparkles (pull, no damage) */
    [0x27] = 1,                                      /* Top Man: lifts */
    [0x2D] = 1,                                      /* Spark Man: platforms that drop when stood on */
    [0x58] = 1, [0x59] = 1,                          /* Doc Robot (Spark): conveyor platforms */
    [0x5A] = 1,                                      /* Doc Robot (Shadow), Wily 2: flipping platforms */
    [0x5D] = 1,                                      /* Wily 1/3: blocks broken by Hard Knuckle */
    [0x8A] = 1,                                      /* Wily 4: teleporters to the boss rematches */
    [0x50] = 1, [0x51] = 1, [0x52] = 1, [0x53] = 1,  /* life energy L/S, weapon energy L/S */
    [0x54] = 1, [0x55] = 1, [0x56] = 1,              /* E-tank, 1-up, "?" item box */
    /* not shown: 0x0B (Snake Man, rises from below, hidden at spawn), 0x64/0x65 (Spark Man
       sliding sparks: AI calls the contact-damage routine), invisible spawners and triggers
       (0x14, 0x66, 0x67, 0x7B, 0x7E-0x80, 0x8B-0x8D), Doc Robot / mini-boss / boss parts
       (0x57, 0x5E, 0x5F, 0x68-0x6F, 0x70-0x89), everything with contact damage */
};

/* one metasprite; anim bank ab, frame index, screen x/y, flags as $0580 */
static int mm3_meta(WideSprite *o, int n, int max, int ab, int anim, int frame, int sx, int sy, int fl, int sid_ov) {
    const uint8_t *a = bank8(ab);
    int ap = a[anim & 0x7F] | a[0x80 + (anim & 0x7F)] << 8;
    if (ap < 0x8000 || ap >= 0xA000) return n;
    int sid = sid_ov;
    if (!sid) {
        if (frame > a[ap - 0x8000]) frame = 0;
        sid = a[ap - 0x8000 + 2 + frame];
    }
    if (!sid) return n;
    int mp = a[0x100 + sid] | a[0x200 + sid] << 8;
    if (mp < 0x8000 || mp >= 0x9FFE) return n;
    mp -= 0x8000;
    int cnt = a[mp];
    const uint8_t *ob = bank8(cnt & 0x80 ? 0x14 : 0x19);
    int oi = (a[mp + 1] + ((fl & 0x40) ? 1 : 0)) & 0xFF;
    int op = (ob[0x1E00 + oi] | ob[0x1F00 + oi] << 8) - 0xA000;
    if (op < 0 || op >= 0x2000 - 64) return n;
    int ylim = (ram[0x22] == 8 && (ram[0xF9] == 0x15 || ram[0xF9] == 0x1A)) ? 0xB0 : 0xF0;
    cnt &= 0x7F;
    for (int k = 0; k <= cnt && n < max && mp + 3 + 2 * k < 0x2000; k++) {
        int y = sy + (int8_t)ob[op + 2 * k];
        if (y < 0 || y > 255 || y >= ylim) continue;
        o[n].x = (int16_t)(sx + (int8_t)ob[op + 2 * k + 1]);
        o[n].y = (int16_t)y;
        o[n].tile = a[mp + 2 + 2 * k];
        o[n].attr = (uint8_t)((a[mp + 3 + 2 * k] ^ (fl & 0x40)) | (fl & 0x20));
        n++;
    }
    return n;
}

static int mm3_in_ext(int wx, int camx) {
    int sx = wx - camx;
    return (sx < 0 && sx >= -wide_ext - 32) || (sx >= 256 && sx < 256 + wide_ext + 32);
}

static int mm3_objects(WideSprite *o, int max) {
    int camx = ram[0xF9] * 256 + ram[0xFC], n = 0;
    /* spawned objects (not Mega Man), drawn in full */
    for (int s = 1; s < 0x20; s++) {
        int fl = ram[0x580 + s];
        if (!(ram[0x300 + s] & 0x80) || !(fl & 0x10) || (fl & 0x04) || ram[0x3E0 + s]) continue;
        if ((ram[0x5E0 + s] & 0x80) && (ram[0x92] & 0x04)) continue;     /* blinking */
        int sid = 0;
        if (s >= 0x10 && (ram[0x4E0 + s] & 0xE0)) {                       /* hit flash */
            if (!(ram[0x300 + s] & 0x40)) continue;
            if (ram[0x4E0 + s] & 0x20) sid = 0xAF;
        }
        int an = ram[0x5C0 + s];
        if (!an) continue;
        int ab = (s >= 0x10 && ram[0x5A]) ? 0x15 : (an & 0x80) ? 0x1B : 0x1A;
        int wx = ram[0x380 + s] * 256 + ram[0x360 + s];
        n = mm3_meta(o, n, max, ab, an, ram[0x5A0 + s] & 0x7F, wx - camx, ram[0x3C0 + s], fl, sid);
    }
    /* not spawned yet: harmless ones only, where the game would spawn them */
    if (ram[0x5A]) return n;
    const uint8_t *t0 = bank8(0);
    for (int i = 0; i < 256; i++) {
        int scr = bk[0xB00 + i];
        if (scr == 0xFF) break;
        if (scr < lim_lo || scr > lim_hi) continue;                         /* other room */
        int type = bk[0xE00 + i];
        if (!mm3_harmless[type] && !wide_ghost_all) continue;
        int wx = scr * 256 + bk[0xC00 + i];
        if (!mm3_in_ext(wx, camx)) continue;
        int k;
        for (k = 0x10; k < 0x20 && !(ram[0x4C0 + k] == i && (ram[0x300 + k] & 0x80)); k++) ;
        if (k < 0x20) continue;                                             /* the game has it */
        if (ram[0x150 + (i >> 3)] & (1 << (i & 7))) continue;              /* collected */
        int fl = t0[type], an = t0[0x300 + type];
        if (!(fl & 0x10) || (fl & 0x04) || !an) continue;                   /* never drawn */
        const uint8_t *a = bank8(an & 0x80 ? 0x1B : 0x1A);
        int ap = a[an & 0x7F] | a[0x80 + (an & 0x7F)] << 8, frame = 0;
        if (ap >= 0x8000 && ap < 0xA000) {
            frame = (int)((frame_count / (a[ap - 0x7FFF] + 1u)) % (a[ap - 0x8000] + 1u));
            if (!a[ap - 0x8000 + 2 + frame]) frame = 0;
        }
        n = mm3_meta(o, n, max, an & 0x80 ? 0x1B : 0x1A, an, frame, wx - camx, bk[0xD00 + i], fl, 0);
    }
    return n;
}

const WideProvider wide_mm3 = {mm3_begin, mm3_tile, mm3_objects};
