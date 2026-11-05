/* Native Windows front end: GDI window, keyboard + XInput gamepad, waveOut audio.
   The recompiled game runs on the main thread; host_frame() is called by the
   PPU once per frame to present, pace to 60.0988 Hz and read input. */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmsystem.h>
#include <setjmp.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "nes.h"
#include "palette.h"
#include "osd.h"
#include "md5.h"
#define OSD_WHITE 0xfcfcfc
#define OSD_YELLOW 0xfcd880
#define OSD_LIGHT 0xa4e4fc

int rc_exec(void);
extern const int game_prg_banks;
extern const int game_vertical_mirror;
extern const int game_mapper;
extern const int game_chr_size;
extern const int game_trainer;
extern const char game_title[];
extern const char game_rom_name[];
extern const char game_md5_file[];
extern const char game_md5_data[];

/* ---------------- ROM loading ----------------
   The exe holds only the translated code. The ROM's graphics, levels and music
   come from the user's .nes file, found by MD5 (whole file, or everything after
   the 16-byte header so a different header still matches). */
static uint8_t *rom_buf;
static const uint8_t *game_prg, *game_chr;
static char rom_path[MAX_PATH];

static uint8_t *read_file(const char *path, size_t *n) {
    HANDLE f = CreateFileA(path, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, NULL);
    if (f == INVALID_HANDLE_VALUE) return NULL;
    DWORD size = GetFileSize(f, NULL), got = 0;
    uint8_t *b = NULL;
    if (size > 16 && size <= 8 * 1024 * 1024 && (b = (uint8_t *)malloc(size)) && ReadFile(f, b, size, &got, NULL) && got == size) {
        *n = size;
    } else { free(b); b = NULL; }
    CloseHandle(f);
    return b;
}

static int try_rom(const char *path) {
    size_t n;
    uint8_t *b = read_file(path, &n);
    if (!b) return 0;
    char h[33];
    md5_hex(b, n, h);
    int ok = !strcmp(h, game_md5_file);
    if (!ok) { md5_hex(b + 16, n - 16, h); ok = !strcmp(h, game_md5_data); }
    size_t need = 16 + (size_t)game_trainer + (size_t)game_prg_banks * 0x4000 + (size_t)game_chr_size;
    if (!ok || n < need) { free(b); return 0; }
    rom_buf = b;
    game_prg = b + 16 + game_trainer;
    game_chr = game_prg + game_prg_banks * 0x4000;
    snprintf(rom_path, sizeof rom_path, "%s", path);
    return 1;
}

static int find_rom(const char *given) {
    char dir[MAX_PATH], p[MAX_PATH];
    if (given && try_rom(given)) return 1;
    GetModuleFileNameA(NULL, dir, MAX_PATH);
    char *sl = strrchr(dir, '\\');
    if (sl) sl[1] = 0; else dir[0] = 0;
    snprintf(p, sizeof p, "%s%s", dir, game_rom_name);      /* usual name first */
    if (try_rom(p)) return 1;
    WIN32_FIND_DATAA fd;
    snprintf(p, sizeof p, "%s*.nes", dir);
    HANDLE h = FindFirstFileA(p, &fd);
    if (h == INVALID_HANDLE_VALUE) return 0;
    int ok = 0;
    do {
        if (fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) continue;
        snprintf(p, sizeof p, "%s%s", dir, fd.cFileName);
        if (try_rom(p)) { ok = 1; break; }
    } while (FindNextFileA(h, &fd));
    FindClose(h);
    return ok;
}

#define SRC_W 256
#define SRC_H 224   /* NTSC visible area: lines 8..231 */
#define SRC_Y0 8

static HWND hwnd;
static uint32_t pixels[SRC_H * (SRC_W + 2 * WIDE_MAX)];
static int img_w = SRC_W;        /* composed picture width (wider in true widescreen) */
/* 0 = original 4:3, 1 = stretched to fill, 2 = extended (true widescreen) */
static int wide_mode;
extern const WideProvider *const game_wide_provider;
static int window_scale = 3;
static BITMAPINFO bmi;
static LARGE_INTEGER qpf, next_tick;
static double frame_ticks;
static int paused, fast, fullscreen, quitting, want_reset;
static WINDOWPLACEMENT prev_place = {sizeof prev_place};
static jmp_buf reset_jmp;
static int opt_volume = 100, opt_scale = 0, opt_fullscreen = 0, from_launcher = 0;
static char game_name[48];

/* ---------------- audio ---------------- */
#define NBUF 12
#define BUFSAMP 2048
static HWAVEOUT wo;
static WAVEHDR hdr[NBUF];
static int16_t abufs[NBUF][BUFSAMP];

static void audio_init(void) {
    WAVEFORMATEX f = {0};
    f.wFormatTag = WAVE_FORMAT_PCM; f.nChannels = 1; f.nSamplesPerSec = AUDIO_RATE;
    f.wBitsPerSample = 16; f.nBlockAlign = 2; f.nAvgBytesPerSec = AUDIO_RATE * 2;
    if (waveOutOpen(&wo, WAVE_MAPPER, &f, 0, 0, CALLBACK_NULL) != MMSYSERR_NOERROR) { wo = 0; return; }
    for (int i = 0; i < NBUF; i++) { hdr[i].dwFlags = WHDR_DONE; }
}

static int audio_queued(void) {
    int q = 0;
    for (int i = 0; i < NBUF; i++) if (!(hdr[i].dwFlags & WHDR_DONE)) q++;
    return q;
}

static void audio_submit(const int16_t *s, int n) {
    if (!wo || n <= 0) return;
    for (int i = 0; i < NBUF; i++) {
        if (!(hdr[i].dwFlags & WHDR_DONE)) continue;
        if (hdr[i].dwFlags & WHDR_PREPARED) waveOutUnprepareHeader(wo, &hdr[i], sizeof hdr[i]);
        if (n > BUFSAMP) n = BUFSAMP;
        memcpy(abufs[i], s, n * 2);
        memset(&hdr[i], 0, sizeof hdr[i]);
        hdr[i].lpData = (LPSTR)abufs[i];
        hdr[i].dwBufferLength = n * 2;
        waveOutPrepareHeader(wo, &hdr[i], sizeof hdr[i]);
        waveOutWrite(wo, &hdr[i], sizeof hdr[i]);
        return;
    }
}

static void audio_frame(void) {
    int16_t s[BUFSAMP];
    int n = audio_take(s, BUFSAMP);
    if (fast || paused) return;
    if (opt_volume < 100) for (int i = 0; i < n; i++) s[i] = (int16_t)(s[i] * opt_volume / 100);          /* drop audio while fast-forwarding */
    int q = audio_queued();
    if (q == 0 && n > 0) {               /* underrun: prime with a little silence */
        int16_t z[1024]; for (int i = 0; i < 1024; i++) z[i] = s[0];
        audio_submit(z, 1024);
    }
    if (q < NBUF - 2) audio_submit(s, n); /* if far ahead, drop a frame of audio */
}

/* ---------------- input ---------------- */
typedef struct { WORD wButtons; BYTE lt, rt; SHORT lx, ly, rx, ry; } XGP;
typedef struct { DWORD packet; XGP gp; } XSTATE;
typedef DWORD(WINAPI *XInputGetState_t)(DWORD, XSTATE *);
static XInputGetState_t xget;

static void input_init(void) {
    const char *dlls[] = {"xinput1_4.dll", "xinput1_3.dll", "xinput9_1_0.dll"};
    for (int i = 0; i < 3 && !xget; i++) {
        HMODULE h = LoadLibraryA(dlls[i]);
        if (h) xget = (XInputGetState_t)(void *)GetProcAddress(h, "XInputGetState");
    }
}

static int key(int vk) { return (GetAsyncKeyState(vk) & 0x8000) != 0; }

static uint8_t read_pad(int player) {
    uint8_t m = 0;
    if (player == 0 && GetForegroundWindow() == hwnd) {
        if (key('X') || key('K')) m |= 0x01;               /* A */
        if (key('Z') || key('J')) m |= 0x02;               /* B */
        if (key(VK_RSHIFT) || key(VK_TAB)) m |= 0x04;     /* Select */
        if (key(VK_RETURN)) m |= 0x08;                     /* Start */
        if (key(VK_UP) || key('W')) m |= 0x10;
        if (key(VK_DOWN) || key('S')) m |= 0x20;
        if (key(VK_LEFT) || key('A')) m |= 0x40;
        if (key(VK_RIGHT) || key('D')) m |= 0x80;
    }
    if (xget) {
        XSTATE st;
        if (xget(player, &st) == 0) {
            WORD b = st.gp.wButtons;
            if (b & 0x1000) m |= 0x01;          /* pad A -> NES A */
            if (b & 0x4000 || b & 0x2000) m |= 0x02; /* X or B -> NES B */
            if (b & 0x0020) m |= 0x04;          /* Back */
            if (b & 0x0010) m |= 0x08;          /* Start */
            if (b & 0x0001 || st.gp.ly > 16000) m |= 0x10;
            if (b & 0x0002 || st.gp.ly < -16000) m |= 0x20;
            if (b & 0x0004 || st.gp.lx < -16000) m |= 0x40;
            if (b & 0x0008 || st.gp.lx > 16000) m |= 0x80;
        }
    }
    if ((m & 0x30) == 0x30) m &= ~0x30;  /* no opposing directions */
    if ((m & 0xC0) == 0xC0) m &= ~0xC0;
    return m;
}

/* ---------------- video ---------------- */
static int stretching(void) { return wide_mode == 1 || (wide_mode == 2 && !game_wide_provider); }

/* true widescreen: add enough columns per side to match the window's shape */
static void update_wide(void) {
    RECT rc; GetClientRect(hwnd, &rc);
    int ext = 0;
    if (wide_mode == 2 && game_wide_provider && rc.bottom > 0) {
        int tw = (int)((long long)rc.right * SRC_H / rc.bottom);
        ext = (tw - SRC_W) / 2;
        if (ext < 0) ext = 0;
        if (ext > WIDE_MAX) ext = WIDE_MAX;
    }
    wide_prov = ext ? game_wide_provider : NULL;
    wide_ext = ext;
    img_w = SRC_W + 2 * ext;
    bmi.bmiHeader.biWidth = img_w;
}

static void present(HDC dc) {
    RECT rc; GetClientRect(hwnd, &rc);
    int cw = rc.right, ch = rc.bottom;
    if (cw <= 0 || ch <= 0) return;
    int iw = img_w, dw, dh;
    if (stretching()) { dw = cw; dh = ch; }
    else {
        if ((long long)cw * SRC_H > (long long)ch * iw) { dh = ch; dw = ch * iw / SRC_H; } else { dw = cw; dh = cw * SRC_H / iw; }
        int ix = cw / iw, iy = ch / SRC_H, is = ix < iy ? ix : iy;
        if (is >= 1 && is * iw >= dw - iw / 2) { dw = is * iw; dh = is * SRC_H; } /* prefer integer scale */
    }
    int x0 = (cw - dw) / 2, y0 = (ch - dh) / 2;
    HBRUSH black = (HBRUSH)GetStockObject(BLACK_BRUSH);
    RECT r;
    r = (RECT){0, 0, cw, y0}; FillRect(dc, &r, black);
    r = (RECT){0, y0 + dh, cw, ch}; FillRect(dc, &r, black);
    r = (RECT){0, y0, x0, y0 + dh}; FillRect(dc, &r, black);
    r = (RECT){x0 + dw, y0, cw, y0 + dh}; FillRect(dc, &r, black);
    SetStretchBltMode(dc, COLORONCOLOR);
    StretchDIBits(dc, x0, y0, dw, dh, 0, 0, iw, SRC_H, pixels, &bmi, DIB_RGB_COLORS, SRCCOPY);
}

static void toggle_fullscreen(void) {
    DWORD style = GetWindowLong(hwnd, GWL_STYLE);
    osd_show(fullscreen ? "WINDOWED" : "FULLSCREEN", "F11 TO TOGGLE", OSD_WHITE, 120);
    if (!fullscreen) {
        MONITORINFO mi = {sizeof mi};
        GetWindowPlacement(hwnd, &prev_place);
        GetMonitorInfo(MonitorFromWindow(hwnd, MONITOR_DEFAULTTOPRIMARY), &mi);
        SetWindowLong(hwnd, GWL_STYLE, style & ~WS_OVERLAPPEDWINDOW);
        SetWindowPos(hwnd, HWND_TOP, mi.rcMonitor.left, mi.rcMonitor.top, mi.rcMonitor.right - mi.rcMonitor.left,
                     mi.rcMonitor.bottom - mi.rcMonitor.top, SWP_NOOWNERZORDER | SWP_FRAMECHANGED);
        ShowCursor(FALSE);
    } else {
        SetWindowLong(hwnd, GWL_STYLE, style | WS_OVERLAPPEDWINDOW);
        SetWindowPlacement(hwnd, &prev_place);
        SetWindowPos(hwnd, NULL, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE | SWP_NOZORDER | SWP_NOOWNERZORDER | SWP_FRAMECHANGED);
        ShowCursor(TRUE);
    }
    fullscreen ^= 1;
    update_wide();
}

#define BOOST_LINES 4000
/* Boost: 4000 extra CPU-only scanlines per frame (about 15x the CPU time of
   the console) so the game never misses a frame, and no 8-sprite-per-line
   limit so nothing flickers. Original: hardware-accurate. */
static void set_boost(int on) {
    opt_extra_lines = on ? BOOST_LINES : 0;
    opt_no_sprite_limit = on;
}

static void osd_boost(void) {
    if (opt_extra_lines) osd_show("BOOST ON", "NO SLOWDOWN  NO FLICKER", OSD_YELLOW, 150);
    else osd_show("BOOST OFF", "ORIGINAL NES TIMING", OSD_LIGHT, 150);
}

static void set_title(void) {
    char t[128];
    snprintf(t, sizeof t, "%s%s%s%s", game_title, opt_extra_lines ? " [boost]" : "", paused ? " [paused]" : "", fast ? " [fast]" : "");
    SetWindowTextA(hwnd, t);
}

static void size_window_for_mode(void) {
    if (fullscreen) return;
    int h = SRC_H * window_scale;
    int w = wide_mode ? h * 16 / 9 : SRC_W * window_scale;
    RECT r = {0, 0, w, h};
    AdjustWindowRect(&r, WS_OVERLAPPEDWINDOW, FALSE);
    SetWindowPos(hwnd, NULL, 0, 0, r.right - r.left, r.bottom - r.top, SWP_NOMOVE | SWP_NOZORDER);
}

static void osd_wide(void) {
    if (wide_mode == 0) osd_show("4:3 ORIGINAL", "F4: WIDESCREEN MODES", OSD_WHITE, 150);
    else if (wide_mode == 1) osd_show("WIDESCREEN: STRETCH", "PICTURE STRETCHED TO FILL", OSD_WHITE, 150);
    else if (game_wide_provider) osd_show("WIDESCREEN: EXTENDED", "MORE OF THE LEVEL ON EACH SIDE", OSD_YELLOW, 150);
    else osd_show("EXTENDED NOT READY YET", "MEGA MAN 2 ONLY - USING STRETCH", OSD_LIGHT, 180);
}

static void set_wide_mode(int m) {
    wide_mode = m;
    size_window_for_mode();
    update_wide();
}

static LRESULT CALLBACK wndproc(HWND h, UINT msg, WPARAM wp, LPARAM lp) {
    switch (msg) {
    case WM_CLOSE: quitting = 1; DestroyWindow(h); return 0;
    case WM_DESTROY: PostQuitMessage(0); return 0;
    case WM_PAINT: { PAINTSTRUCT ps; HDC dc = BeginPaint(h, &ps); present(dc); EndPaint(h, &ps); return 0; }
    case WM_ERASEBKGND: return 1;
    case WM_SIZE: update_wide(); break;
    case WM_SYSKEYDOWN:
        if (wp == VK_RETURN) { toggle_fullscreen(); return 0; }
        break;
    case WM_KEYDOWN:
        if (lp & (1 << 30)) break; /* auto-repeat */
        switch (wp) {
        case VK_ESCAPE:
            /* started from the launcher: Esc goes straight back to it (the launcher
               reappears when this process exits). Started directly: leave
               fullscreen first, then quit. */
            if (from_launcher || !fullscreen) PostMessage(h, WM_CLOSE, 0, 0);
            else toggle_fullscreen();
            return 0;
        case VK_F11: toggle_fullscreen(); return 0;
        case 'P': case VK_PAUSE: paused ^= 1; set_title(); if (!paused) osd_show("RESUME", NULL, OSD_WHITE, 45); return 0;
        case VK_F2: want_reset = 1; osd_show("RESET", NULL, OSD_WHITE, 90); return 0;
        case VK_F3: set_boost(!opt_extra_lines); set_title(); osd_boost(); return 0;
        case VK_F4: set_wide_mode((wide_mode + 1) % 3); osd_wide(); return 0;
        case VK_OEM_3: case VK_SPACE: fast = 1; set_title(); return 0;
        }
        break;
    case WM_KEYUP:
        if (wp == VK_OEM_3 || wp == VK_SPACE) { fast = 0; set_title(); QueryPerformanceCounter(&next_tick); }
        break;
    case WM_KILLFOCUS:
        fast = 0;
        break;
    }
    return DefWindowProc(h, msg, wp, lp);
}

static void pump(void) {
    MSG m;
    while (PeekMessage(&m, NULL, 0, 0, PM_REMOVE)) {
        if (m.message == WM_QUIT) quitting = 1;
        TranslateMessage(&m);
        DispatchMessage(&m);
    }
    if (quitting) {
        if (wo) { waveOutReset(wo); waveOutClose(wo); }
        timeEndPeriod(1);
        ExitProcess(0);
    }
}

static void wait_next_frame(void) {
    LARGE_INTEGER now;
    next_tick.QuadPart += (LONGLONG)frame_ticks;
    QueryPerformanceCounter(&now);
    if (now.QuadPart > next_tick.QuadPart + (LONGLONG)(frame_ticks * 4)) next_tick = now; /* fell behind: resync */
    for (;;) {
        QueryPerformanceCounter(&now);
        LONGLONG left = next_tick.QuadPart - now.QuadPart;
        if (left <= 0) break;
        double ms = left * 1000.0 / qpf.QuadPart;
        if (ms > 2.0) Sleep((DWORD)(ms - 1.5)); else YieldProcessor();
    }
}

static void compose(void) {
    int e = wide_ext, w = img_w;
    for (int y = 0; y < SRC_H; y++) {
        uint32_t *d = pixels + y * w;
        int line = SRC_Y0 + y;
        for (int x = 0; x < e; x++) d[x] = nes_palette[wide_left[line][x] & 63];
        for (int x = 0; x < SRC_W; x++) d[e + x] = nes_palette[framebuffer[line][x] & 63];
        for (int x = 0; x < e; x++) d[e + SRC_W + x] = nes_palette[wide_right[line][x] & 63];
    }
    osd_draw(pixels, w, SRC_H);
    HDC dc = GetDC(hwnd); present(dc); ReleaseDC(hwnd, dc);
}

void host_frame(void) {
    if (fast) osd_show(">> FAST FORWARD", NULL, OSD_WHITE, 21);
    compose();
    osd_tick();
    pump();
    while (paused && !want_reset) {
        osd_show("PAUSED", "P TO RESUME", OSD_WHITE, 30);
        compose();
        Sleep(15); pump(); QueryPerformanceCounter(&next_tick);
    }
    if (want_reset) {
        want_reset = 0;
        longjmp(reset_jmp, 1);
    }
    audio_frame();
    pad_state[0] = read_pad(0);
    pad_state[1] = read_pad(1);
    if (!fast) wait_next_frame();
    else QueryPerformanceCounter(&next_tick);
}

int WINAPI WinMain(HINSTANCE inst, HINSTANCE prev, LPSTR cmd, int show) {
    (void)prev; (void)cmd;
    timeBeginPeriod(1);
    SetProcessDPIAware();
    WNDCLASSA wc = {0};
    wc.style = CS_HREDRAW | CS_VREDRAW;
    wc.lpfnWndProc = wndproc;
    wc.hInstance = inst;
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hIcon = LoadIcon(inst, MAKEINTRESOURCE(1));
    wc.lpszClassName = "NesNativeGame";
    RegisterClassA(&wc);
    /* options from the launcher: --fullscreen --scale N --volume 0..100 --boost --launcher --rom path */
    const char *rom_arg = NULL;
    for (int i = 1; i < __argc; i++) {
        const char *a = __argv[i];
        if (!strcmp(a, "--fullscreen")) opt_fullscreen = 1;
        else if (!strcmp(a, "--scale") && i + 1 < __argc) opt_scale = atoi(__argv[++i]);
        else if (!strcmp(a, "--volume") && i + 1 < __argc) opt_volume = atoi(__argv[++i]);
        else if (!strcmp(a, "--boost")) set_boost(1);
        else if (!strcmp(a, "--launcher")) from_launcher = 1;
        else if (!strcmp(a, "--wide") && i + 1 < __argc) wide_mode = atoi(__argv[++i]) % 3;
        else if (!strcmp(a, "--rom") && i + 1 < __argc) rom_arg = __argv[++i];
    }
    if (!find_rom(rom_arg)) {
        char m[600];
        snprintf(m, sizeof m,
                 "Could not find the ROM for %s.\n\n"
                 "Put the game's .nes file (usually named %s) in the same folder as this program. "
                 "Any file name works; it is recognized by its MD5:\n\n%s  (whole file)\n%s  (without header)",
                 game_title, game_rom_name, game_md5_file, game_md5_data);
        MessageBoxA(NULL, m, game_title, MB_ICONERROR | MB_OK);
        return 1;
    }
    if (opt_volume < 0) opt_volume = 0;
    if (opt_volume > 100) opt_volume = 100;
    int scale = 3;
    {
        int sh = GetSystemMetrics(SM_CYSCREEN);
        while (scale > 1 && SRC_H * scale > sh - 120) scale--;
        if (sh > 1400) scale = 4;
        if (opt_scale >= 1 && opt_scale <= 8) {
            scale = opt_scale;
            while (scale > 1 && SRC_H * scale > sh - 60) scale--;
        }
    }
    bmi.bmiHeader.biSize = sizeof bmi.bmiHeader;
    bmi.bmiHeader.biWidth = SRC_W;
    bmi.bmiHeader.biHeight = -SRC_H;
    bmi.bmiHeader.biPlanes = 1;
    bmi.bmiHeader.biBitCount = 32;
    bmi.bmiHeader.biCompression = BI_RGB;
    window_scale = scale;
    if (wide_mode < 0) wide_mode = 0;
    RECT r = {0, 0, wide_mode ? SRC_H * scale * 16 / 9 : SRC_W * scale, SRC_H * scale};
    AdjustWindowRect(&r, WS_OVERLAPPEDWINDOW, FALSE);
    hwnd = CreateWindowA("NesNativeGame", game_title, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT,
                         r.right - r.left, r.bottom - r.top, NULL, NULL, inst, NULL);
    ShowWindow(hwnd, show);
    UpdateWindow(hwnd);
    if (opt_fullscreen) toggle_fullscreen();
    update_wide();
    set_title();
    {   /* "Mega Man 3 - native" -> "MEGA MAN 3" for the start-up banner */
        int n = 0;
        for (const char *c = game_title; *c && n < 40 && !(c[0] == ' ' && c[1] == '-'); c++)
            game_name[n++] = (*c >= 'a' && *c <= 'z') ? (char)(*c - 32) : *c;
        game_name[n] = 0;
        osd_show(game_name, opt_extra_lines ? (from_launcher ? "BOOST ON   ESC: LAUNCHER" : "BOOST ON   F3: TOGGLE")
                                            : (from_launcher ? "ORIGINAL   ESC: LAUNCHER" : "ORIGINAL   F3: BOOST"),
                 OSD_WHITE, 180);
    }


    QueryPerformanceFrequency(&qpf);
    frame_ticks = qpf.QuadPart / (1789773.0 / 29780.5);
    audio_init();
    input_init();

    setjmp(reset_jmp);
    nes_power(game_prg, game_prg_banks, game_chr_size ? game_chr : NULL, game_chr_size, game_vertical_mirror, game_mapper);
    QueryPerformanceCounter(&next_tick);
    g_exec = rc_exec;
    g_exec();
    return 0;
}
