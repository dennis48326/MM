/* Jukebox ("arranged music") mod. See jukebox.h.

   The chosen track is played by a second NES core (music_core.c) that runs only
   the sound driver of the ROM the track belongs to, like an NSF player:
     - Mega Man 1 and 2 share one driver: play = $9000/$8000, request = $9003/$8003,
       track table of little-endian pointers; a track is music when the low nibble
       of its first byte (its priority) is non-zero.
     - Mega Man 3-6 share another: play = $8000, request = $8003 (A = track),
       track count at $8A40, big-endian pointers at $8A43 + 2n; music when the
       first byte is 0. Data at pointers >= $C000 lives in an extra bank.
   The running game keeps its own driver. Its music is silenced by letting only the
   APU channels its driver has handed to a sound effect through: both drivers keep
   that as a bit mask (bit 0 pulse 1, 1 pulse 2, 2 triangle, 3 noise) in $EF (MM1/2)
   or $CF (MM3-6). */
#include "jukebox.h"
#include "music_core.h"
#include "nes.h"
#include "md5.h"
#include <stdio.h>
#include <string.h>

const char *const mm_rom_md5[6][2] = {
    {"8cfaa33b1ec522ce89ab82af2dd17da7", "4de82cfceadbf1a5e693b669b1221107"},
    {"302761a666ac89c21f185052d02127d3", "0527a0ee512f69e08b8db6dc97964632"},
    {"6c591b7228fd31cbe0bf49243c012095", "4a53b6f58067d62c9a43404fe835dd5c"},
    {"7daebae488795835f962e875ee1f75e8", "db45eb9413964295adb8d1da961807cc"},
    {"efc39ebe851e946f8258a45f8a08c44f", "4482fbbbc77e03266b979f5028d4b51d"},
    {"7a3fbab64ed19a5d5e08c38654af37aa", "00f8cbeba7db567d1083053b30a93ada"},
};

typedef struct {
    int engine;             /* 0: Mega Man 1/2 driver, 1: Mega Man 3-6 driver */
    int bank;               /* MM1/2: 16 KB bank at $8000; MM3-6: 8 KB bank at $8000 (+1 at $A000) */
    int ext_bank;           /* MM3-6: 8 KB bank holding data at pointers >= $C000 */
    uint16_t play, req, table;
    int max_tracks;
    uint8_t sfx_mask;       /* zero-page byte: channels currently used by sound effects */
} Driver;

static const Driver drv[6] = {
    {0, 4, 0, 0x9000, 0x9003, 0x9A60, 0x33, 0xEF},
    {0, 12, 0, 0x8000, 0x8003, 0x8A50, 0x43, 0xEF},
    {1, 0x16, 0x18, 0x8000, 0x8003, 0x8A40, 0, 0xCF},
    {1, 0x1E, 0x1D, 0x8000, 0x8003, 0x8A40, 0, 0xCF},
    {1, 0x18, 0x1A, 0x8000, 0x8003, 0x8A40, 0, 0xCF},
    {1, 0x34, 0x36, 0x8000, 0x8003, 0x8A40, 0, 0xCF},
};

static const char *const game_label[6] = {"MEGA MAN", "MEGA MAN 2", "MEGA MAN 3", "MEGA MAN 4", "MEGA MAN 5", "MEGA MAN 6"};

/* names of the tracks identified in play (stage themes, stage select, stage start) */
typedef struct { int game, id; const char *name; } TrackName;
static const TrackName names[] = {
    {0, 0x01, "STAGE SELECT"}, {0, 0x02, "STAGE START"},
    {0, 0x05, "CUT MAN"}, {0, 0x0A, "GUTS MAN"}, {0, 0x0F, "ICE MAN"},
    {0, 0x08, "BOMB MAN"}, {0, 0x06, "FIRE MAN"}, {0, 0x07, "FIRE MAN"}, {0, 0x09, "ELEC MAN"},
    {1, 0x00, "FLASH MAN"}, {1, 0x01, "WOOD MAN"}, {1, 0x02, "CRASH MAN"}, {1, 0x03, "HEAT MAN"},
    {1, 0x04, "AIR MAN"}, {1, 0x05, "METAL MAN"}, {1, 0x06, "QUICK MAN"}, {1, 0x07, "BUBBLE MAN"},
    {1, 0x0C, "STAGE SELECT"}, {1, 0x0A, "STAGE START"}, {1, 0x0D, "TITLE"},
    {2, 0x01, "NEEDLE MAN"}, {2, 0x02, "MAGNET MAN"}, {2, 0x03, "GEMINI MAN"}, {2, 0x04, "HARD MAN"},
    {2, 0x05, "TOP MAN"}, {2, 0x06, "SNAKE MAN"}, {2, 0x07, "SPARK MAN"}, {2, 0x08, "SHADOW MAN"},
    {2, 0x10, "STAGE SELECT"}, {2, 0x33, "STAGE START"},
    {3, 0x00, "BRIGHT MAN"}, {3, 0x01, "TOAD MAN"}, {3, 0x02, "RING MAN"}, {3, 0x03, "DRILL MAN"},
    {3, 0x04, "PHARAOH MAN"}, {3, 0x05, "DIVE MAN"}, {3, 0x06, "SKULL MAN"}, {3, 0x07, "DUST MAN"},
    {3, 0x10, "STAGE SELECT"}, {3, 0x0F, "STAGE START"}, {3, 0x12, "TITLE"},
    {4, 0x00, "GRAVITY MAN"}, {4, 0x01, "STONE MAN"}, {4, 0x02, "WAVE MAN"}, {4, 0x03, "STAR MAN"},
    {4, 0x04, "CRYSTAL MAN"}, {4, 0x05, "GYRO MAN"}, {4, 0x06, "CHARGE MAN"}, {4, 0x07, "NAPALM MAN"},
    {4, 0x0D, "STAGE SELECT"}, {4, 0x0E, "STAGE START"}, {4, 0x0B, "TITLE"},
    {5, 0x00, "WIND MAN"}, {5, 0x01, "BLIZZARD MAN"}, {5, 0x02, "YAMATO MAN"}, {5, 0x03, "FLAME MAN"},
    {5, 0x04, "PLANT MAN"}, {5, 0x05, "CENTAUR MAN"}, {5, 0x06, "TOMAHAWK MAN"}, {5, 0x07, "KNIGHT MAN"},
    {5, 0x0F, "STAGE SELECT"}, {5, 0x10, "STAGE START"}, {5, 0x0D, "TITLE"},
};

/* tracks that are empty or too short to be worth a slot (found by rendering every track) */
#include "jukebox_skip.h"

static const uint8_t *roms[6];
static long rom_size[6];
static int host = -1;
#define MAXT 400
static uint8_t pl_game[MAXT], pl_id[MAXT];
static int pl_n = 1;          /* entry 0 = the game's own music */
static int cur;

int jukebox_identify(const uint8_t *rom, long size) {
    char a[33], b[33];
    if (size <= 16) return -1;
    md5_hex(rom, (size_t)size, a);
    md5_hex(rom + 16, (size_t)(size - 16), b);
    for (int g = 0; g < 6; g++)
        if (!strcmp(a, mm_rom_md5[g][0]) || !strcmp(b, mm_rom_md5[g][1])) return g;
    return -1;
}

static const uint8_t *prg_of(int g) { return roms[g] + 16 + ((roms[g][6] & 4) ? 512 : 0); }

/* offset in PRG of track id's data if it is a music track (from the driver's own
   table in the ROM), else -1 */
static long music_data(int g, int id) {
    const Driver *d = &drv[g];
    const uint8_t *p = prg_of(g);
    long prg_size = roms[g][4] * 0x4000L, off;
    for (int k = 0; k < (int)(sizeof skip / sizeof skip[0]); k++)
        if (skip[k][0] == g && skip[k][1] == id) return -1;
    if (d->engine == 0) {
        const uint8_t *b = p + d->bank * 0x4000L;
        int ptr = b[d->table - 0x8000 + 2 * id] | (b[d->table - 0x8000 + 2 * id + 1] << 8);
        if (ptr < 0x8000 || ptr >= 0xC000) return -1;
        off = d->bank * 0x4000L + (ptr - 0x8000);
        return (p[off] & 0x0F) ? off : -1;
    }
    const uint8_t *b = p + d->bank * 0x2000L;
    if (id >= b[0xA40]) return -1;
    int hi = b[0xA43 + 2 * id], lo = b[0xA44 + 2 * id];
    if (!hi && !lo) return -1;
    if (hi >= 0xC0) off = d->ext_bank * 0x2000L + ((((hi - 0x20) << 8) | lo) - 0xA000);
    else off = d->bank * 0x2000L + (((hi << 8) | lo) - 0x8000);
    if (off < 0 || off >= prg_size) return -1;
    return p[off] == 0 ? off : -1;
}

static void rebuild(void) {
    pl_n = 1;
    for (int g = 0; g < 6; g++) {
        if (!roms[g]) continue;
        int n = drv[g].engine == 0 ? drv[g].max_tracks : prg_of(g)[drv[g].bank * 0x2000L + 0xA40];
        long seen[256]; int ns = 0;
        for (int id = 0; id < n && pl_n < MAXT; id++) {
            long off = music_data(g, id);
            int dup = 0;
            for (int k = 0; k < ns; k++) if (seen[k] == off) dup = 1;
            if (off < 0 || dup) continue;               /* not music, or the same data as an earlier track */
            seen[ns++] = off;
            pl_game[pl_n] = (uint8_t)g; pl_id[pl_n] = (uint8_t)id; pl_n++;
        }
    }
}

int jukebox_add_rom(const uint8_t *rom, long size) {
    int g = jukebox_identify(rom, size);
    if (g < 0 || roms[g]) return -1;   /* unknown, or this game is already in */
    roms[g] = rom; rom_size[g] = size;
    rebuild();
    return g;
}

void jukebox_set_host(int game) { host = game; }
int jukebox_count(void) { return pl_n; }
int jukebox_current(void) { return cur; }

int jukebox_entry(int i, int *game, int *id) {
    if (i <= 0 || i >= pl_n) return 0;
    *game = pl_game[i]; *id = pl_id[i];
    return 1;
}

int jukebox_find(int game, int id) {
    for (int i = 1; i < pl_n; i++) if (pl_game[i] == game && pl_id[i] == id) return i;
    return 0;
}

int jukebox_next_game(int i, int dir) {
    int g = i > 0 && i < pl_n ? pl_game[i] : (dir > 0 ? -1 : 6);
    for (int k = 0; k < 7; k++) {
        g += dir;
        if (g < 0 || g > 5) return 0;
        for (int j = 1; j < pl_n; j++) if (pl_game[j] == g) return j;
    }
    return 0;
}

void jukebox_describe(int i, char *l1, char *l2) {
    if (i <= 0 || i >= pl_n) { strcpy(l1, "GAME MUSIC"); strcpy(l2, "F5/F6: OTHER TRACKS"); return; }
    int g = pl_game[i], id = pl_id[i], k = 0, n = 0;
    for (int j = 1; j < pl_n; j++) if (pl_game[j] == g) { n++; if (j <= i) k++; }
    sprintf(l1, "%s  %d/%d", game_label[g], k, n);
    for (unsigned t = 0; t < sizeof names / sizeof names[0]; t++)
        if (names[t].game == g && names[t].id == id) { strcpy(l2, names[t].name); return; }
    sprintf(l2, "TRACK %d", k);
}

static void start_track(int g, int id) {
    const Driver *d = &drv[g];
    music_core_load(roms[g], rom_size[g]);
    if (d->engine == 0) {
        if (g == 0) music_core_write(0xC004, (uint8_t)d->bank);              /* UxROM: $C004 holds 4 (bus conflict) */
        else {                                                                /* MMC1: serial load of PRG bank */
            music_core_write(0x8000, 0x80);
            for (int i = 0; i < 5; i++) music_core_write(0xE000, (uint8_t)(d->bank >> i));
        }
    } else {                                                                  /* MMC3 */
        music_core_write(0x8000, 6); music_core_write(0x8001, (uint8_t)d->bank);
        music_core_write(0x8000, 7); music_core_write(0x8001, (uint8_t)(d->bank + 1));
    }
    music_core_write(0x4017, 0x40);
    music_core_write(0x4015, 0x0F);
    music_core_call(d->req, (uint8_t)id);
}

void jukebox_select(int i) {
    if (i < 0 || i >= pl_n) i = 0;
    cur = i;
    if (i > 0) start_track(pl_game[i], pl_id[i]);
}

void jukebox_frame(void) {
    if (cur <= 0) return;
    music_core_call(drv[pl_game[cur]].play, 0);
    music_core_frame_time();
}

int jukebox_take(int16_t *dst, int max) { return cur > 0 ? music_core_take(dst, max) : 0; }

uint8_t jukebox_apu_gate(void) {
    if (cur <= 0 || host < 0) return 0x1F;
    return ram[drv[host].sfx_mask] & 0x0F;   /* sound-effect channels only; DMC (music drums) off */
}
