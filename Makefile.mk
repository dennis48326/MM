# Build with MinGW-w64 (gcc or clang). Run from this folder.
#   make -f Makefile.mk all      -> MegaMan.exe .. MegaMan6.exe, Launcher.exe
#   make -f Makefile.mk regen    -> re-run the recompiler (needs Python 3 and the .nes files one folder up)
CC      ?= gcc
WINDRES ?= windres
CFLAGS  ?= -O2 -w
RT = src/nes.c src/host_win32.c src/osd.c src/md5.c src/jukebox.c src/music_core.c
# each game uses its own widescreen level provider (named in games/mmN/rom_data.c)

all: MegaMan.exe MegaMan2.exe MegaMan3.exe MegaMan4.exe MegaMan5.exe MegaMan6.exe Launcher.exe

MegaMan.exe: $(RT) $(wildcard games/mm1/*.c)
	$(WINDRES) -I res res/app.rc -O coff -o app.res.o
	$(CC) $(CFLAGS) -Isrc -DRECOMP -o $@ $(RT) src/wide_mm1.c games/mm1/*.c app.res.o -mwindows -lwinmm -static
MegaMan2.exe: $(RT) $(wildcard games/mm2/*.c)
	$(WINDRES) -I res res/app2.rc -O coff -o app2.res.o
	$(CC) $(CFLAGS) -Isrc -DRECOMP -o $@ $(RT) src/wide_mm2.c games/mm2/*.c app2.res.o -mwindows -lwinmm -static
MegaMan3.exe: $(RT) $(wildcard games/mm3/*.c)
	$(WINDRES) -I res res/app3.rc -O coff -o app3.res.o
	$(CC) $(CFLAGS) -Isrc -DRECOMP -o $@ $(RT) src/wide_mm3.c games/mm3/*.c app3.res.o -mwindows -lwinmm -static
MegaMan4.exe: $(RT) $(wildcard games/mm4/*.c)
	$(WINDRES) -I res res/app4.rc -O coff -o app4.res.o
	$(CC) $(CFLAGS) -Isrc -DRECOMP -o $@ $(RT) src/wide_mm4.c games/mm4/*.c app4.res.o -mwindows -lwinmm -static
MegaMan5.exe: $(RT) $(wildcard games/mm5/*.c)
	$(WINDRES) -I res res/app5.rc -O coff -o app5.res.o
	$(CC) $(CFLAGS) -Isrc -DRECOMP -o $@ $(RT) src/wide_mm5.c games/mm5/*.c app5.res.o -mwindows -lwinmm -static
MegaMan6.exe: $(RT) $(wildcard games/mm6/*.c)
	$(WINDRES) -I res res/app6.rc -O coff -o app6.res.o
	$(CC) $(CFLAGS) -Isrc -DRECOMP -o $@ $(RT) src/wide_mm6.c games/mm6/*.c app6.res.o -mwindows -lwinmm -static
Launcher.exe: launcher/core.c launcher/win32.c launcher/core.h launcher/launcher.rc
	$(WINDRES) -I launcher launcher/launcher.rc -O coff -o launcher.res.o
	$(CC) $(CFLAGS) -Isrc -o $@ launcher/win32.c launcher/core.c src/md5.c launcher.res.o -mwindows -lwinmm -static

regen:
	python tools/gen_interp.py src/interp_gen.inc
	python tools/recomp.py ../mega.nes games/mm1 coverage/coverage_mm1.bin
	python tools/embed.py ../mega.nes games/mm1/rom_data.c "Mega Man - native" wide_mm1
	python tools/recomp.py ../mega2.nes games/mm2 coverage/coverage_mm2.bin
	python tools/embed.py ../mega2.nes games/mm2/rom_data.c "Mega Man 2 - native" wide_mm2
	python tools/recomp.py ../mega3.nes games/mm3 coverage/coverage_mm3.bin
	python tools/embed.py ../mega3.nes games/mm3/rom_data.c "Mega Man 3 - native" wide_mm3
	python tools/recomp.py ../mega4.nes games/mm4 coverage/coverage_mm4.bin
	python tools/embed.py ../mega4.nes games/mm4/rom_data.c "Mega Man 4 - native" wide_mm4
	python tools/recomp.py ../mega5.nes games/mm5 coverage/coverage_mm5.bin
	python tools/embed.py ../mega5.nes games/mm5/rom_data.c "Mega Man 5 - native" wide_mm5
	python tools/recomp.py ../mega6.nes games/mm6 coverage/coverage_mm6.bin
	python tools/embed.py ../mega6.nes games/mm6/rom_data.c "Mega Man 6 - native" wide_mm6

mmtest:
	$(CC) $(CFLAGS) -Isrc -o mmtest src/nes.c src/host_test.c src/wide_mm*.c src/jukebox.c src/music_core.c src/md5.c -lm
