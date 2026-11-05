/* ROM identity for Mega Man 6 - native. The ROM itself is loaded from the .nes file at run time. */
#include "nes.h"
const char game_title[] = "Mega Man 6 - native";
const char game_rom_name[] = "mega6.nes";
const char game_md5_file[] = "7a3fbab64ed19a5d5e08c38654af37aa";
const char game_md5_data[] = "00f8cbeba7db567d1083053b30a93ada";
const int game_prg_banks = 32;
const int game_chr_size = 0;
const int game_trainer = 0;
const int game_vertical_mirror = 0;
const int game_mapper = 4;
const WideProvider *const game_wide_provider = 0;   /* no true widescreen yet */
