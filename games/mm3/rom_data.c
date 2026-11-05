/* ROM identity for Mega Man 3 - native. The ROM itself is loaded from the .nes file at run time. */
#include "nes.h"
const char game_title[] = "Mega Man 3 - native";
const char game_rom_name[] = "mega3.nes";
const char game_md5_file[] = "6c591b7228fd31cbe0bf49243c012095";
const char game_md5_data[] = "4a53b6f58067d62c9a43404fe835dd5c";
const int game_prg_banks = 16;
const int game_chr_size = 131072;
const int game_trainer = 0;
const int game_vertical_mirror = 0;
const int game_mapper = 4;
extern const WideProvider wide_mm3;
const WideProvider *const game_wide_provider = &wide_mm3;
