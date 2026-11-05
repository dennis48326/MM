"""Write the ROM identity for a game: embed.py rom.nes out.c [title] [wide_provider_symbol]

The game exe no longer contains the ROM. It records the ROM's MD5 (whole file
and headerless) plus layout, and loads the matching .nes file at start-up."""
import sys, hashlib, os
rom = open(sys.argv[1], 'rb').read()
nb = rom[4]; tr = 512 if rom[6] & 4 else 0
title = sys.argv[3] if len(sys.argv) > 3 else 'NES game'
wide = sys.argv[4] if len(sys.argv) > 4 else None
L = ['/* ROM identity for %s. The ROM itself is loaded from the .nes file at run time. */' % title,
     '#include "nes.h"',
     'const char game_title[] = "%s";' % title,
     'const char game_rom_name[] = "%s";' % os.path.basename(sys.argv[1]),
     'const char game_md5_file[] = "%s";' % hashlib.md5(rom).hexdigest(),
     'const char game_md5_data[] = "%s";' % hashlib.md5(rom[16:]).hexdigest(),
     'const int game_prg_banks = %d;' % nb,
     'const int game_chr_size = %d;' % (rom[5] * 0x2000),
     'const int game_trainer = %d;' % tr,
     'const int game_vertical_mirror = %d;' % (rom[6] & 1),
     'const int game_mapper = %d;' % ((rom[6] >> 4) | (rom[7] & 0xF0))]
if wide:
    L += ['extern const WideProvider %s;' % wide, 'const WideProvider *const game_wide_provider = &%s;' % wide]
else:
    L += ['const WideProvider *const game_wide_provider = 0;   /* no true widescreen yet */']
open(sys.argv[2], 'w').write('\n'.join(L) + '\n')
