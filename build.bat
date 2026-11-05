@echo off
rem Rebuild everything on Windows with MinGW-w64 (e.g. from https://winlibs.com or MSYS2)
rem Make sure gcc.exe and windres.exe are on PATH.
windres -I res res\app.rc -O coff -o app1.res.o || goto :err
gcc -O2 -w -Isrc -DRECOMP -o MegaMan.exe src\nes.c src\host_win32.c src\osd.c src\md5.c games\mm1\rc_main.c games\mm1\rc_s0_b08.c games\mm1\rc_s0_b0A.c games\mm1\rc_s1_b0B.c games\mm1\rc_s1_b0D.c games\mm1\rc_s2_b0E.c games\mm1\rc_s3_b0F.c games\mm1\rom_data.c app1.res.o -mwindows -lwinmm -static || goto :err
echo Built MegaMan.exe
windres -I res res\app2.rc -O coff -o app2.res.o || goto :err
gcc -O2 -w -Isrc -DRECOMP -o MegaMan2.exe src\nes.c src\host_win32.c src\osd.c src\md5.c src\wide_mm2.c games\mm2\rc_main.c games\mm2\rc_s0_b18.c games\mm2\rc_s0_b1A.c games\mm2\rc_s0_b1C.c games\mm2\rc_s1_b1B.c games\mm2\rc_s1_b1D.c games\mm2\rc_s2_b1E.c games\mm2\rc_s3_b1F.c games\mm2\rom_data.c app2.res.o -mwindows -lwinmm -static || goto :err
echo Built MegaMan2.exe
windres -I res res\app3.rc -O coff -o app3.res.o || goto :err
gcc -O2 -w -Isrc -DRECOMP -o MegaMan3.exe src\nes.c src\host_win32.c src\osd.c src\md5.c games\mm3\rc_main.c games\mm3\rc_s0_b09.c games\mm3\rc_s0_b16.c games\mm3\rc_s0_b18.c games\mm3\rc_s0_b1A.c games\mm3\rc_s0_b1C.c games\mm3\rc_s1_b01.c games\mm3\rc_s1_b02.c games\mm3\rc_s1_b03.c games\mm3\rc_s1_b1D.c games\mm3\rc_s2_b1E.c games\mm3\rc_s3_b1F.c games\mm3\rom_data.c app3.res.o -mwindows -lwinmm -static || goto :err
echo Built MegaMan3.exe
windres -I res res\app4.rc -O coff -o app4.res.o || goto :err
gcc -O2 -w -Isrc -DRECOMP -o MegaMan4.exe src\nes.c src\host_win32.c src\osd.c src\md5.c games\mm4\rc_main.c games\mm4\rc_s0_b1B.c games\mm4\rc_s0_b1E.c games\mm4\rc_s0_b38.c games\mm4\rc_s0_b39.c games\mm4\rc_s0_b3A.c games\mm4\rc_s0_b3C.c games\mm4\rc_s1_b20.c games\mm4\rc_s1_b3B.c games\mm4\rc_s1_b3D.c games\mm4\rc_s2_b3E.c games\mm4\rc_s3_b3F.c games\mm4\rom_data.c app4.res.o -mwindows -lwinmm -static || goto :err
echo Built MegaMan4.exe
windres -I res res\app5.rc -O coff -o app5.res.o || goto :err
gcc -O2 -w -Isrc -DRECOMP -o MegaMan5.exe src\nes.c src\host_win32.c src\osd.c src\md5.c games\mm5\rc_main.c games\mm5\rc_s0_b00.c games\mm5\rc_s0_b01.c games\mm5\rc_s0_b0B.c games\mm5\rc_s0_b17.c games\mm5\rc_s0_b18.c games\mm5\rc_s0_b1B.c games\mm5\rc_s0_b1C.c games\mm5\rc_s1_b05.c games\mm5\rc_s1_b0A.c games\mm5\rc_s1_b0C.c games\mm5\rc_s1_b1D.c games\mm5\rc_s2_b1E.c games\mm5\rc_s3_b1F.c games\mm5\rom_data.c app5.res.o -mwindows -lwinmm -static || goto :err
echo Built MegaMan5.exe
windres -I res res\app6.rc -O coff -o app6.res.o || goto :err
gcc -O2 -w -Isrc -DRECOMP -o MegaMan6.exe src\nes.c src\host_win32.c src\osd.c src\md5.c games\mm6\rc_main.c games\mm6\rc_s0_b29.c games\mm6\rc_s0_b30.c games\mm6\rc_s0_b34.c games\mm6\rc_s0_b38.c games\mm6\rc_s0_b39.c games\mm6\rc_s0_b3A.c games\mm6\rc_s0_b3B.c games\mm6\rc_s0_b3C.c games\mm6\rc_s1_b3B.c games\mm6\rc_s1_b3D.c games\mm6\rc_s2_b3E.c games\mm6\rc_s3_b3F.c games\mm6\rom_data.c app6.res.o -mwindows -lwinmm -static || goto :err
echo Built MegaMan6.exe
windres -I launcher launcher\launcher.rc -O coff -o launcher.res.o || goto :err
gcc -O2 -w -Isrc -o Launcher.exe launcher\win32.c launcher\core.c src\md5.c launcher.res.o -mwindows -lwinmm -static || goto :err
echo Built Launcher.exe
goto :eof
:err
echo Build failed.
