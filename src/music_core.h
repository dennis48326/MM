/* Second NES core that runs only a sound driver (see music_core.c). */
#ifndef MUSIC_CORE_H
#define MUSIC_CORE_H
#include <stdint.h>
void music_core_load(const uint8_t *rom, long size);   /* power on with this .nes image */
void music_core_write(uint16_t a, uint8_t v);           /* CPU write (mapper registers, APU) */
void music_core_poke(uint16_t a, uint8_t v);            /* RAM */
int  music_core_call(uint16_t addr, uint8_t a);         /* JSR addr with A, run to RTS */
void music_core_frame_time(void);                       /* let one frame of time pass */
int  music_core_take(int16_t *dst, int max);            /* drain its audio samples */
#endif
