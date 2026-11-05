/* Jukebox ("arranged music") mod: play any track from any detected Mega Man ROM
   in place of the running game's music, keeping the game's sound effects. */
#ifndef JUKEBOX_H
#define JUKEBOX_H
#include <stdint.h>

extern const char *const mm_rom_md5[6][2];   /* whole file, without 16-byte header */

int  jukebox_identify(const uint8_t *rom, long size);       /* 0..5 = Mega Man 1..6, -1 = unknown */
int  jukebox_add_rom(const uint8_t *rom, long size);        /* keeps the pointer; returns game, -1 if unknown/already in */
void jukebox_set_host(int game);                            /* the game this exe runs (0..5) */
int  jukebox_count(void);                                   /* playlist size, entry 0 = game's own music */
void jukebox_select(int index);                             /* 0 = game's own music */
int  jukebox_current(void);
int  jukebox_find(int game, int id);                        /* playlist index of a track, or 0 */
void jukebox_describe(int index, char *line1, char *line2); /* e.g. "MEGA MAN 3  6/24", "SNAKE MAN STAGE" */
int  jukebox_entry(int index, int *game, int *id);          /* 1 if a real track */
int  jukebox_next_game(int index, int dir);                 /* first track of the next/previous game */
void jukebox_frame(void);                                   /* once per game frame */
int  jukebox_take(int16_t *dst, int max);                   /* music samples for this frame */
uint8_t jukebox_apu_gate(void);                             /* channels of the game's APU to keep */
#endif
