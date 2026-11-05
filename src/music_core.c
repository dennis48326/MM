/* Music core: a second, private NES (CPU + mapper + APU) used only to run a game's
   sound driver, like an NSF player. It lets any game play tracks from any other
   detected Mega Man ROM. Built from the same nes.c with every global renamed. */
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "music_rename.h"
#include "nes.c"
#undef host_frame
#include "music_core.h"

void mc_host_frame(void) {}

static int mc_loaded;
static double mc_target;

/* run a subroutine to completion (returns to a sentinel address) */
static int mc_call(uint16_t addr, uint8_t a, uint8_t x, uint8_t y) {
    uint8_t s0 = mc_S;
    PUSH16(0xFFFF);                     /* RTS lands on $0000 */
    mc_PC = addr; mc_A = a; mc_X = x; mc_Y = y;
    for (long i = 0; i < 400000; i++) {
        mc_interp_step();
        if (mc_cycles >= mc_next_event) mc_service();
        if (mc_PC == 0x0000 && mc_S == s0) return 1;
    }
    mc_S = s0;                          /* runaway driver: give up on this call */
    return 0;
}

void music_core_load(const uint8_t *rom, long size) {
    int nb = rom[4];
    const uint8_t *p = rom + 16 + ((rom[6] & 4) ? 512 : 0);
    if (size < 16 + nb * 0x4000L) { mc_loaded = 0; return; }
    mc_nes_power(p, nb, rom[5] ? p + nb * 0x4000 : NULL, rom[5] * 0x2000, rom[6] & 1, (rom[6] >> 4) | (rom[7] & 0xF0));
    mc_fI = 1;
    mc_S = 0xFD;
    mc_target = (double)mc_cycles;
    mc_loaded = 1;
}

void music_core_write(uint16_t a, uint8_t v) { if (mc_loaded) wr(a, v); }
void music_core_poke(uint16_t a, uint8_t v) { if (mc_loaded) mc_ram[a & 0x7FF] = v; }
int music_core_call(uint16_t addr, uint8_t a) { return mc_loaded ? mc_call(addr, a, 0, 0) : 0; }

/* advance the music core by one NTSC frame of time so its APU produces the samples */
void music_core_frame_time(void) {
    if (!mc_loaded) return;
    mc_target += 29780.5;
    while ((double)mc_cycles < mc_target) {
        uint64_t t = (uint64_t)mc_target;
        if (mc_next_event < t) { mc_cycles = mc_next_event > mc_cycles ? mc_next_event : mc_cycles; mc_service(); }
        else { mc_cycles = t; break; }
    }
    mc_apu_sync();
}

int music_core_take(int16_t *dst, int max) { return mc_loaded ? mc_audio_take(dst, max) : 0; }
