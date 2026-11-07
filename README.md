# Mega Man 1-6: native Windows builds (static recompilation)

`MegaMan.exe` through `MegaMan6.exe` are native x86-64 Windows programs. Each game's 6502 machine
code (from `mega.nes` through `mega6.nes`) was translated to C and compiled. It does not emulate the CPU at
run time. Small C models of the NES picture chip (PPU), sound chip (APU) and
controller replace the console hardware. The exes contain only the translated code. Each game's graphics, levels and
music are read from your .nes file when it starts (see "ROM detection").

## Launcher

Double-click `Launcher.exe` for the front end, an animated pixel menu with an
original chiptune loop and a beam-in animation when a game starts.

* **MM1-MM6** (top row) start that game. The launcher hides while you play and
  returns when the game closes, and it opens on the game you played last
  (shown in yellow).
* **MODE** switches between **BOOST** (no slowdown, no flicker) and **ORIG**
  (plays exactly like the NES). See "Boost mode" below.
* **WIDE** cycles 4:3, FILL (stretch) and EXT (extended level view). **VIDEO**
  cycles window 2x, 3x, 4x and fullscreen.
* **MUSIC** switches the in-game music between **ORIG** (each game's own
  soundtrack) and **JUKE**, the jukebox mod (see "Jukebox" below). Press **M**
  to turn the launcher's own music on or off.
* **VOL**: the energy bar on the left sets the volume for the launcher and the
  games. Move left onto it and press up or down, use the mouse wheel, press
  + or -, or click the bar.
* **LOOK** picks the picture filter: **OFF**, **CRT** (old-school television)
  or **XBRZ** (smoothed pixel art). See "Filters" below.
* **INFO** shows build details; press right on it to see the game controls.
* To quit, use the small X at the top right or press Esc.
* Settings are saved in `launcher.ini` next to the exe.

Each game can also be run directly with `--fullscreen`, `--scale N`,
`--volume 0-100`, `--boost`, `--wide 0|1|2`, `--filter 0|1|2`, `--jukebox` and `--rom path`. The launcher also passes `--launcher`, which
makes Esc return to it.

## ROM detection

The programs don't contain any ROM data. They find your ROM files by content,
not by name:

* **Launcher:** it looks at every `.nes` file in its folder and computes each
  file's MD5. It matches the MD5 against the six supplied ROMs, using either
  the whole file or everything after the 16-byte iNES header, so a copy with a
  different header still matches. It re-scans whenever its window becomes
  active and after a game closes.
* **Missing games:** a game whose ROM isn't found shows as an empty, crossed-out
  cartridge, and INFO shows "NO ROM" for it. Matched games show "ROM OK".
* **Starting a game:** the launcher passes the matched file to the game with
  `--rom "path"`.
* **Running a game directly:** each game checks its usual file name first,
  then every `.nes` file in its folder. If no file matches, it shows a message
  with the expected MD5s. A game always verifies the MD5 before running,
  because the translated code only works with that exact ROM.

| Game | MD5 (whole file) | MD5 (without header) |
|------|------------------|----------------------|
| Mega Man   | 8cfaa33b1ec522ce89ab82af2dd17da7 | 4de82cfceadbf1a5e693b669b1221107 |
| Mega Man 2 | 302761a666ac89c21f185052d02127d3 | 0527a0ee512f69e08b8db6dc97964632 |
| Mega Man 3 | 6c591b7228fd31cbe0bf49243c012095 | 4a53b6f58067d62c9a43404fe835dd5c |
| Mega Man 4 | 7daebae488795835f962e875ee1f75e8 | db45eb9413964295adb8d1da961807cc |
| Mega Man 5 | efc39ebe851e946f8258a45f8a08c44f | 4482fbbbc77e03266b979f5028d4b51d |
| Mega Man 6 | 7a3fbab64ed19a5d5e08c38654af37aa | 00f8cbeba7db567d1083053b30a93ada |

## Boost mode

The NES CPU is slow. When a lot is happening on screen, the game's logic for a
frame isn't done when the next frame starts, so the game skips a beat. That is
the famous slowdown. The picture chip can also show only 8 sprites per
scanline, so the games rotate sprites and they flicker.

Boost mode fixes both. It doesn't change any game code:

* **No slowdown:** after the last visible line of each frame, the runtime adds
  4,000 extra scanlines in which only the CPU runs. The picture chip is idle,
  the sound chip is paused and the cartridge chip's scanline counter doesn't
  tick. The game gets about 15 times the console's CPU time to finish its frame
  before the next vblank. Pacing stays at 60 frames per second, and music
  tempo and pitch are unchanged (the sound chip produces exactly the same
  samples per frame).
* **No flicker:** the 8-sprites-per-line limit is lifted, so every sprite is
  drawn every frame. The overflow flag is still reported to the game.

**How this was measured.** For each game, I logged where the CPU was each time
a frame's interrupt arrived during long scripted play sessions:

* If the CPU was in the game's wait-for-next-frame loop, the frame finished
  in time.
* Anywhere else, or a missed interrupt, means a lag (slowdown) frame.

Lag frames in those sessions:

| Game | Original | Boost |
|------|---------:|------:|
| Mega Man   | 0.88% | 0% |
| Mega Man 2 | 0.17% | 0% |
| Mega Man 3 | 7.00% | 0% |
| Mega Man 4 | 3.01% | 0% |
| Mega Man 5 | 2.10% | 0% |
| Mega Man 6 | 1.98% | 0% |

Lower boost levels left a few lag frames in games 4-6 (Mega Man 6 still had 15
at 2,000 extra lines). 4,000 cleared them all in the test sessions. Boost mode
was also checked frame-exact between the recompiled code and the reference
interpreter for all six games. Press **F3** in a game to switch between boost
and original on the fly.

## Widescreen

Press **F4** in a game, or use the launcher's **WIDE** panel, to cycle through
three modes:

* **4:3** is the original picture.
* **FILL** stretches the 4:3 picture to fill the window or monitor. It works
  in all six games.
* **EXT** (extended) is true widescreen. The game shows more of the level on
  each side, with as many extra columns as the window's shape needs: about 71
  per side at 16:9 and up to 160 per side for ultrawide. It works in all six
  games.

How extended mode works:

* **Level data:** each game has a small "level provider" (`src/wide_mm1.c` ..
  `src/wide_mm6.c`) that reads the level straight from the ROM, using the
  camera position and room limits the game keeps in RAM. The runtime draws
  those columns beside the normal 256-pixel picture, line by line, using the
  current tiles and palettes. It also fills in the 8-pixel strip the game
  blanks on the left edge. Formats, all reverse-engineered from each game's own
  block builder (details at the top of each file):

  | Game | Level format | Rooms |
  |------|--------------|-------|
  | Mega Man | screens of 8×8 blocks (32×32 px), column by column, in the stage's 16 KB bank | camera limits `$27..$28` |
  | Mega Man 2 | same idea, 16 KB stage bank | room screens `$14..$15` |
  | Mega Man 3 | screen list + 8×8-block layouts, row by row, in an 8 KB stage bank | section table, current section `$2B` |
  | Mega Man 4 | as Mega Man 3, different addresses | section table + sections joined to the right |
  | Mega Man 5 | as Mega Man 4, layouts in a second graphics bank | section table + joined sections |
  | Mega Man 6 | one 256-byte page per block row, all screens side by side | scroll-lock flags set by trigger objects (`$71`) |
* **Background only:** enemies and items appear exactly when the original game
  spawns them, so gameplay is unchanged.
* **Room edges:** past a room's locked scroll edge (stage starts, shafts, boss
  rooms) the extra area is dark.
* **Self-check:** while each frame is drawn, the tiles the game really shows
  are sampled line by line and compared with the provider. If fewer than 85%
  match (pause or weapon menu, continue screen, vertical screen transitions,
  cutscenes) the extra area stays dark for that frame. It never shows the
  wrong thing. Lines with their own scroll (Gemini Man's star field, split
  screens) stay dark, and rooms that sit a few rows off the nametable grid
  (some vertical rooms in Mega Man 5) are found automatically.
* **Energy bars:** in both FILL and EXT, the boss's energy bar moves to the
  right edge of the picture, mirroring Mega Man's bar on the left. In EXT, Mega
  Man's life and weapon bars also move out to the left edge of the wider
  picture. The bars are recognised by their shape (columns of seven sprites at
  the top left), so this works in all six games. Only where they are drawn
  changes: the game still sees the same sprites, so gameplay, the sprite limit
  and sprite-0 timing are unchanged.
* **No effect when off:** with widescreen off the game runs exactly as before.
  Original and boost modes were re-checked frame for frame, and in extended
  mode the recompiled code and the reference interpreter still agree.

The launcher passes `--wide 0|1|2`.

## Jukebox

With **MUSIC: JUKE** in the launcher, any game can play any track from any
Mega Man ROM found next to the exes. Press **F6** / **F5** to step forward /
back through one playlist of every soundtrack (143 tracks with all six
ROMs), or hold **Shift** to jump to the next / previous game. The first entry,
**GAME MUSIC**, is the game's own soundtrack. A banner shows the game, the
track number and its name (stage themes, stage select, stage start and title
are named; the rest are numbered). The choice is kept in `jukebox.ini` and
carries over to the other games.

How it works:

* **A second NES inside each exe** (`src/music_core.c`) runs only the sound
  driver of the ROM the track comes from, like an NSF player: map the driver's
  bank, call its "play sound" entry with the track number once, then its
  update routine every frame. Mega Man 1 and 2 share one Capcom driver, Mega
  Man 3-6 another; the track list is read from each driver's own table in the
  ROM (music vs. sound effect is a flag in each entry), with duplicates, silent
  entries and stings under five seconds left out.
* **Sound effects stay**: the game keeps running its own driver, and only the
  APU channels its driver has handed to a sound effect are heard (the drivers
  keep that as a bit mask in RAM). Music on those channels is muted.
* **No effect on the game**: the game's RAM and picture are exactly the same
  with the jukebox on (checked frame for frame in all six games), and with it
  off nothing changes at all.

## Filters

Press **F7** in a game, or use the launcher's **LOOK** panel, to cycle the
upscaling filter: OFF (sharp pixels, integer scaling when it fits), CRT and
XBRZ. Filters change only how the picture is drawn to the window; the game
itself is untouched. They work with every widescreen mode.

* **CRT** imitates a consumer tube television: each scanline is drawn as a
  glowing beam that gets wider when it is bright (so dark lines between rows
  close up in bright areas), neighbouring pixels blend a little like a
  composite signal, bright areas bleed a soft halo, an aperture-grille mask
  gives the fine red/green/blue stripes, and the glass is gently curved with
  rounded corners and darker edges. It is computed in linear light, like a
  real tube, and drawn straight at the window's size.
* **XBRZ** is Zenju's xBRZ pixel-art scaler (the version used by PPSSPP),
  which rounds off diagonal edges and curves while keeping flat areas crisp.
  The picture is scaled 2x-6x to cover the window and then smoothly resized
  to fit exactly.

Both filters run on all CPU cores. At very large sizes (above 1600 pixels
tall) the CRT filter renders at half size and lets the window scaling do the
rest.

## Controls

| NES        | Keyboard               | Xbox pad     |
|------------|------------------------|--------------|
| D-pad      | Arrow keys or WASD     | D-pad / left stick |
| A (jump)   | X or K                 | A            |
| B (shoot)  | Z or J                 | X or B       |
| Start      | Enter                  | Start        |
| Select     | Right Shift or Tab     | Back         |

* **P** pause · **Space** or **`** (hold) fast-forward · **F2** reset
* **F3** boost on/off · **F4** widescreen 4:3 / fill / extended · **F11** or **Alt+Enter** fullscreen or windowed
* **F7** picture filter off / CRT / xBRZ
* **F5 / F6** previous / next jukebox track, **Shift+F5 / Shift+F6** previous / next game's tracks (jukebox on)
* **Esc**: if the game was started from the launcher, returns to the launcher.
  If it was started directly, it leaves fullscreen first and then quits.

A small on-screen banner confirms each action: the game name and mode at
start-up, BOOST ON/OFF, FULLSCREEN/WINDOWED, PAUSED, RESET and FAST FORWARD.
It is drawn in the game's own pixel resolution, so it scales with the picture,
slides in, and fades out after a couple of seconds.

## How it was made

1. **Disassembly and code discovery** (`tools/recomp.py`). The tool follows the
   code from the reset, NMI and IRQ vectors. It adds every address the reference
   interpreter executed during scripted play of all six stages
   (`coverage/coverage_mm1.bin`). It found 9,999 instructions: 4,090 in the fixed
   bank ($C000) and the rest in switchable banks 4, 5 and 6. Banks 0 to 3 hold
   only data. `games/mm1/disasm/*.asm` contains a labeled listing of every 8 KB bank.
2. **Translation to C** (`games/mmN/rc_*.c`). Each instruction becomes C code with
   its exact cycle count. Each instruction also gets a label that both static
   jumps and the dispatcher can reach. The dispatcher handles `RTS`, `JMP ()`
   and bank-switched code. NMIs are taken at instruction boundaries, the same as
   on hardware.
3. **Safety net.** If execution reaches an address that was never discovered,
   for example code in RAM, a small interpreter runs it until control returns
   to translated code. In the test runs this almost never happened (0 to 81
   instructions out of about 115 million).
4. **Verification.** The interpreter in `src/nes.c` (`src/interp_gen.inc`) is
   built from the same opcode table as the recompiler. It passes `nestest`
   (8,991 instructions, cycle-exact) and all 16 blargg `instr_test-v5` ROMs. The
   recompiled build and the interpreter were run with the same controller input
   for 12,000 to 20,000 frames. They produced identical RAM and screen hashes on
   every frame, including runs whose input was not used for code discovery.

## Mega Man 2

Mega Man 2 uses the MMC1 mapper (256 KB PRG). The runtime supports MMC1's
serial register, all four PRG banking modes and mirroring control. That
support passes blargg's MMC1-based `official_only` test. Code discovery played
all eight Robot Master stages and Wily stage 1, reached with the all-bosses
password. Discovery found 11,727 instructions: 3,814 in the fixed bank and the
rest in banks 12, 13 and 14. On 15,000-frame held-out runs, including one in
Wily's castle, the recompiled build matched the interpreter exactly with zero
fallback instructions.

`MegaMan.exe` was rebuilt on the new runtime and re-verified against its
interpreter.

## Mega Man 3

Mega Man 3 uses the MMC3 mapper (256 KB PRG, 128 KB CHR ROM). For it the
runtime was generalized:

* PRG ROM is mapped in four 8 KB slots and CHR in eight 1 KB pages.
* The MMC3's bank registers, mirroring and scanline IRQ counter are
  implemented.
* After `CLI`, `PLP` and `RTI`, the CPU checks right away for a pending IRQ.

The recompiler now works in 8 KB regions, one per bank and slot. At run time
the dispatcher picks the region for the bank actually mapped where the program
counter is, so code reached through bank switching is always correct.

Code discovery played all eight Robot Master stages. It found 11,912
instructions in 11 bank/slot regions. On four 15,000-frame held-out runs, the
recompiled build matched the interpreter exactly on every frame. Three of
those runs needed no fallback instructions at all. One run reached code that
discovery hadn't seen, and the interpreter ran 6,364 instructions there.

Mega Man and Mega Man 2 were regenerated with the new recompiler and
re-verified against the interpreter on held-out runs.

## Mega Man 4

Mega Man 4 is also an MMC3 game, with 512 KB PRG ROM and CHR RAM. It needed no
runtime changes. Code discovery played all eight Robot Master stages. It found
13,468 instructions in 11 bank/slot regions. Four 15,000-frame held-out runs
matched the interpreter exactly on every frame, with zero fallback
instructions.

## Mega Man 5

Mega Man 5 is an MMC3 game with 256 KB PRG and 256 KB CHR ROM. Code discovery
played all eight Robot Master stages. It found 13,455 instructions in 13
bank/slot regions. Four 15,000-frame held-out runs matched the interpreter
exactly, with zero fallback instructions.

While working on Mega Man 5, I improved the recompiler to also translate
instructions that straddle two 8 KB slots, when the next slot's bank is fixed
by the hardware. Mega Man 1 and 2 were regenerated with this change and
re-verified. Neither now falls back to the interpreter in testing.

## Mega Man 6

Mega Man 6 is an MMC3 game with 512 KB PRG ROM and CHR RAM. It needed no
runtime changes. Code discovery played all eight Robot Master stages. It found
11,773 instructions in 12 bank/slot regions. One bank runs from two different
slots, so its listing has one file per slot. Four 15,000-frame held-out runs
matched the interpreter exactly, with zero fallback instructions.

## Repository layout

```
src/            runtime: nes.c (CPU interpreter, PPU, APU, mappers), host_win32.c (window, sound, input,
                ROM loading), osd.c (on-screen banner), md5.c, wide_*.c (widescreen level providers),
                filters.c (CRT and xBRZ filters), xbrz_glue.cpp, host_test.c (headless test host)
third_party/    xbrz/ (Zenju's xBRZ scaler, GPLv3; see its README)
games/mm1..mm6/ generated per game: recompiled C (rc_*.c), ROM identity (rom_data.c), disasm/ listings
launcher/       launcher: core.c (art, menu, synth), win32.c (window, input, audio, ROM scan), font
tools/          m6502.py (opcode semantics), recomp.py, gen_interp.py, embed.py, mkinput*.py
res/            icons and version resources
coverage/       code-coverage maps used for discovery (one per game)
```

ROM files (`*.nes`) and built exes are not committed (see `.gitignore`). This
repository should stay **private**: the generated code and listings in
`games/` are derived from Capcom's ROMs.

## Rebuilding

To rebuild on Windows with MinGW-w64 (gcc and windres on PATH), run `build.bat`
in the repository root. It builds all the exes; the xBRZ scaler is C++, so
`g++` must be on PATH too and the games are linked with it. With make, run `make -f Makefile.mk`.

To regenerate the C code from the ROM, run `make -f Makefile.mk regen`. This needs Python 3 and
looks for `mega.nes` through `mega6.nes` one folder above the repository.

The tools handle UxROM (mapper 2), MMC1 (mapper 1) and MMC3 (mapper 4) games. Save states are not supported: translated code
keeps the game's place on the native call stack, so it cannot be captured
mid-frame.
