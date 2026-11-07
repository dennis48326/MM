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


/* ---- objects in the extra columns ----
 * Object list (bank $3A, set up per stage by its routine $8032 from the tables at
 * $80BF/$80CF/$80DF): n entries sorted by position, four arrays whose addresses the
 * game keeps in RAM: screen ($74), x ($78), y ($7C), type ($7E); screen $FF ends it.
 * Screens count in camera space ($57). Type $80 = invisible trigger (scroll locks
 * etc., always slot $16).
 * Spawning ($8120, every frame): moving right, entries reaching camera+254 are spawned;
 * moving left, entries reaching camera+8 (indices $0649/$064A track both edges).
 * $81A7 skips an entry whose "gone" bit is set (bit i&7 of $0650 + i/8, set by $ED21
 * when an item is collected) and $E590 one that some slot 8..$15 still holds
 * ($03FC + slot = list index), otherwise takes a free slot ($03A0 = 0).
 * An extended view would show them late; spawning earlier would change the game, so
 * harmless ones (below) are only drawn as "previews" from the same data. Enemies stay
 * hidden until the game spawns them. Objects already spawned are drawn in full
 * (the game hides sprites past the screen edge).
 * Slot arrays (slot X, 0 = Mega Man, 8..$15 objects): type $03A0, flags $03B7
 * (bit 0 hidden, bit 1 not drawn, $20 behind bg, $40 h-flip, $80 v-flip), x $046F:$0486,
 * y $04CB (high byte $04B4), sprite bank $0458 (16 KB at $8000, $85C9[type>>4]),
 * animation script $0527:$053E, frame offset $0510.
 * AI: bank $84C9[type], address $83C9:$82C9[type]; the 6 bytes before it are the
 * object's header ($EBDB): animation, palette set ($C9EF), CHR set ($C95C), ...
 * Drawing ($E1E1/$E2A9): script byte 0 = length | $80 (2nd table); sprite id at
 * script[frame+1], delay at script[frame+2]; id -> metasprite $8000/$8200 (or
 * $8100/$8300): count-1, offset-table id, (tile, attr) pairs; offsets $8400/$8500:
 * (dy, dx) pairs. Flipped: x = X - 8 - dx, attr ^= flags; else attr |= flags.
 * Items ($9245) spawned inside a solid tile (odd collision type, e.g. a breakable
 * block) stay hidden until the tile goes away; collision type 6 puts them behind bg.
 * Sprite tiles live in CHR RAM and are loaded per screen, palettes per object, so a
 * preview is only drawn when its tiles and palette are in place. */
static const uint8_t *sprb;
static uint8_t srd(int a) { return sprb[(a - 0x8000) & 0x3FFF]; }
static uint8_t bank8(int b, int a) { return (b >= 0 && b < prg_banks8) ? prg[b * 0x2000 + (a & 0x1FFF)] : 0; }

/* harmless objects worth showing before the game spawns them (classified from the
   AI code and the contact class, header byte 6: high nibble 0/A nothing, 2/5/9 solid
   platform, 7 item, others hurt; low nibble = damage) */
static const uint8_t mm6_harmless[256] = {
    [0x1D] = 1,                                  /* E-tank */
    [0x37] = 1,                                  /* 1-up */
    [0x38] = 1, [0x39] = 1,                      /* life energy small / large */
    [0x49] = 1, [0x4A] = 1,                      /* weapon energy small / large */
    [0x36] = 1, [0x41] = 1,                      /* wind fans, floor / ceiling (Wind Man) */
    [0x34] = 1,                                  /* lift rail, carries a platform (type $35) */
    [0x6F] = 1,                                  /* lift platform (y from a table) */
    [0x8B] = 1, [0xA0] = 1,                      /* moving platforms */
    /* not shown: 19/21 bomb you can stand on (explodes), A1 spiked flip platform,
       2D/73/75 spikes, 3D, 30; spawners and triggers that are hidden or delete
       themselves (33, 56, 57, 5B, 5E, 5F, 61, 72, 8A, 8F, A9, AF, CB, D5, 44);
       4F, 59, A2 and other mini-bosses; everything else attacks */
};

static int mm6_meta(WideSprite *o, int n, int max, int sbank, int sp, int frame, int sx, int sy, int flags) {
    if (sbank < 0 || sbank + 1 >= prg_banks8 || sp < 0x8000 || sp > 0xBFFF) return n;
    sprb = prg + sbank * 0x2000;
    int hdr = srd(sp), id = srd(sp + ((frame + 1) & 0xFF));
    int tb = (hdr & 0x80) ? 0x8100 : 0x8000;
    int mp = srd(tb + id) | srd(tb + 0x200 + id) << 8;
    if (mp < 0x8000 || mp > 0xBFFF) return n;
    int cnt = srd(mp) + 1, oi = srd(mp + 1);
    int op = srd(0x8400 + oi) | srd(0x8500 + oi) << 8;
    if (op < 0x8000 || op > 0xBFFF) return n;
    for (int k = 0; k < cnt && n < max; k++) {
        int dy = (int8_t)srd(op + 2 * k), dx = (int8_t)srd(op + 2 * k + 1);
        int at = srd(mp + 3 + 2 * k);
        int x = (flags & 0x40) ? sx - 8 - dx : sx + dx;
        int y = (flags & 0x80) ? sy - 8 - dy : sy + dy;
        at = (flags & 0xC0) ? at ^ (flags & 0xE0) : at | (flags & 0xE0);
        if (y < 0 || y >= 0xF0) continue;
        o[n].x = (int16_t)x; o[n].y = (int16_t)y;
        o[n].tile = srd(mp + 2 + 2 * k); o[n].attr = (uint8_t)at;
        n++;
    }
    return n;
}

static int in_ext(int wx, int camx) {
    int sx = wx - camx;
    return (sx < 0 && sx >= -wide_ext - 32) || (sx >= 256 && sx < 256 + wide_ext + 32);
}

/* CHR set c ($C95C: table in bank $37) is in CHR RAM now (first and last tile) */
static int chr_loaded(int c) {
    int e = c * 4, cnt = bank8(0x37, e), b1 = bank8(0x37, e + 1), b2 = bank8(0x37, e + 2), b3 = bank8(0x37, e + 3);
    int ppu = b1 * 16 + ((b3 & 0x80) ? 0x1000 : 0), src = ((b3 & 1) << 12) | (b2 << 4), bank = (b3 & 0x7E) >> 1;
    if (!cnt) return 1;
    for (int t = 0; t < cnt; t += cnt - 1 > 0 ? cnt - 1 : 1)
        for (int i = 0; i < 16; i++)
            if (ppu + t * 16 + i < 0x2000 && ppu_peek((uint16_t)(ppu + t * 16 + i)) != bank8(bank, src + t * 16 + i)) return 0;
    return 1;
}

/* palette set p ($C9EF: table in bank $37, $28 if $06A0) is in the palette buffer $0360 */
static int pal_loaded(int p) {
    int bk = ram[0x6A0] ? 0x28 : 0x37;
    int a = bank8(bk, 0x1000 + p) | bank8(bk, 0x1100 + p) << 8;
    if (a < 0x8000 || a > 0x9FFF) return 1;
    int x = bank8(bk, a), y = 1;
    for (int k = 0; k < 64 && x < 32; k++) {
        int v = bank8(bk, a + y);
        if (v & 0x40) { if (ram[0x360 + x] != 0x0F) return 0; x++; }
        if (x < 32 && ram[0x360 + x] != (v & 0x3F)) return 0;
        x++; y++;
        if (v & 0x80) break;
    }
    return 1;
}

/* collision type at a world point ($D9CF with the game's remap $DB0F) */
static int coll_at(int wx, int y) {
    if (y >= 0xF0) y = 0xE8;
    int screen = (wx >> 8) + scr_off, col = (wx >> 5) & 7;
    int addr = (map_hi + (y >> 5)) * 256 + map_lo + screen * 8 + col;
    if (screen >= 32 || addr < 0xA000 || addr > 0xBFFF) return 0;
    int b = mapb[addr - 0xA000];
    int m = gfx[(blk_page - 0x80) * 256 + b * 4 + ((y >> 4) & 1) * 2 + ((wx >> 4) & 1)];
    int page = (ram[0x340 + (m >> 3)] & (1 << (m & 7))) ? 0x9F : mt_page + 4;
    int c = gfx[((page - 0x80) & 0x1F) * 256 + m] >> 4;
    int st = ram[0x51] & 15;
    return bank8(0x3E, 0xDB0F + ((bank8(0x3E, 0xDAFF + st) << 4) | c));
}

static int mm6_objects(WideSprite *o, int max) {
    int camx = ram[0x57] * 256 + ram[0xF7], n = 0, fy = ram[0xF9];
    /* spawned objects (slots 8..$15) */
    for (int s = 8; s < 0x16; s++) {
        int fl = ram[0x3B7 + s];
        if (!ram[0x3A0 + s] || (fl & 3) || ram[0x4B4 + s]) continue;
        int wx = ram[0x46F + s] * 256 + ram[0x486 + s];
        if (!in_ext(wx, camx) && (wx - camx < 0 || wx - camx > 255)) continue;
        n = mm6_meta(o, n, max, ram[0x458 + s], ram[0x53E + s] | ram[0x527 + s] << 8, ram[0x510 + s],
                     wx - camx, ram[0x4CB + s] - fy, fl & 0xE0);
    }
    /* not spawned yet: harmless ones only */
    int ps = ram[0x74] | ram[0x75] << 8, px = ram[0x78] | ram[0x79] << 8;
    int py = ram[0x7C] | ram[0x7D] << 8, pt = ram[0x7E] | ram[0x7F] << 8;
    if (ps < 0x8000 || pt > 0x9F00 || px < 0x8000 || py < 0x8000) return n;
    for (int i = 0; i < 255; i++) {
        int scr = bank8(0x3A, ps + i);
        if (scr & 0x80) break;
        int type = bank8(0x3A, pt + i);
        if (type == 0x80 || (!mm6_harmless[type] && !wide_ghost_all)) continue;
        int wx = scr * 256 + bank8(0x3A, px + i), y = bank8(0x3A, py + i);
        if (!in_ext(wx, camx)) continue;
        if (scr < lim_lo || scr > lim_hi) continue;                 /* past a locked room edge */
        if (ram[0x650 + (i >> 3)] & (1 << (i & 7))) continue;      /* gone for good */
        int k;
        for (k = 8; k < 0x16 && ram[0x3FC + k] != i; k++) ;
        if (k < 0x16) continue;                                    /* the game has it */
        int aib = bank8(0x3A, 0x84C9 + type), ai = bank8(0x3A, 0x82C9 + type) | bank8(0x3A, 0x83C9 + type) << 8;
        int anim = bank8(aib, ai - 6), palset = bank8(aib, ai - 5), chrset = bank8(aib, ai - 4);
        if (chrset && !chr_loaded(chrset)) continue;
        if (palset && !pal_loaded(palset)) continue;
        int fl = 0;
        if (type == 0x41) fl = 0x80;                               /* $9988: hung upside down */
        if (type == 0x34 && (ram[0x51] & 15) != 12 && wx < ram[0x46F] * 256 + ram[0x486]) fl = 0x40;   /* $EF0C: faces Mega Man */
        if (type == 0x6F) y = bank8(0x29, 0x8C61 + (y & 0x1F));    /* $8B59: y is a table index */
        if (bank8(aib, ai) == 0x20 && bank8(aib, ai + 1) == 0x45 && bank8(aib, ai + 2) == 0x92) {   /* item: JSR $9245 */
            int c = coll_at(wx, (y + ram[0x67B]) & 0xFF);
            if (c == 6) fl = 0x20;
            else if (c & 1) continue;                              /* inside a block */
        }
        int sbank = bank8(0x3A, 0x85C9 + (type >> 4));
        sprb = prg + sbank * 0x2000;
        int sp = srd(0x8600 + anim) | srd(0x8700 + anim) << 8, frame = 0;
        if (sp >= 0x8000 && sp <= 0xBFFF) {
            int len = srd(sp) & 0x7F, total = 0;
            for (int f = 0; f < len; f += 2) total += srd(sp + f + 2) ? srd(sp + f + 2) : 256;
            if (total) {
                int t = (int)(frame_count % (uint32_t)total);
                for (int f = 0; f < len; f += 2) {
                    int d = srd(sp + f + 2) ? srd(sp + f + 2) : 256;
                    if (t < d) { frame = f; break; }
                    t -= d;
                }
            }
        }
        n = mm6_meta(o, n, max, sbank, sp, frame, wx - camx, y - fy, fl);
    }
    return n;
}

const WideProvider wide_mm6 = {mm6_begin, mm6_tile, mm6_objects};
