/* Launcher shell for Windows: borderless pixel window, keyboard/mouse/XInput,
   waveOut audio thread, launcher.ini, starts MegaMan.exe and waits for it. */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmsystem.h>
#include <stdio.h>
#include <string.h>
#include "core.h"
#include "md5.h"
#ifndef INFO1
#define INFO1 ""
#endif
#ifndef INFO2
#define INFO2 ""
#endif

static HWND hwnd;
static int scale = 3;
static uint32_t fb[LW * LH];
static BITMAPINFO bmi;
static LSettings set = {0, 3, 20, 1, 0, 1, 0, 0, 0};
static char exe_dir[MAX_PATH], ini_path[MAX_PATH];

/* MD5s of the supplied ROMs: whole .nes file, and everything after the 16-byte
   iNES header (so a copy with a different header is still recognized). */
static const char *rom_md5[6][2] = {
    {"8cfaa33b1ec522ce89ab82af2dd17da7", "4de82cfceadbf1a5e693b669b1221107"},
    {"302761a666ac89c21f185052d02127d3", "0527a0ee512f69e08b8db6dc97964632"},
    {"6c591b7228fd31cbe0bf49243c012095", "4a53b6f58067d62c9a43404fe835dd5c"},
    {"7daebae488795835f962e875ee1f75e8", "db45eb9413964295adb8d1da961807cc"},
    {"efc39ebe851e946f8258a45f8a08c44f", "4482fbbbc77e03266b979f5028d4b51d"},
    {"7a3fbab64ed19a5d5e08c38654af37aa", "00f8cbeba7db567d1083053b30a93ada"},
};
static char rom_found[6][MAX_PATH];

/* look at every .nes file next to the launcher and match it by MD5 */
static int scan_roms(void) {
    char pat[MAX_PATH], p[MAX_PATH];
    int mask = 0;
    for (int g = 0; g < 6; g++) rom_found[g][0] = 0;
    snprintf(pat, sizeof pat, "%s*.nes", exe_dir);
    WIN32_FIND_DATAA fd;
    HANDLE h = FindFirstFileA(pat, &fd);
    if (h == INVALID_HANDLE_VALUE) return 0;
    do {
        if (fd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) continue;
        if (fd.nFileSizeHigh || fd.nFileSizeLow <= 16 || fd.nFileSizeLow > 8 * 1024 * 1024) continue;
        snprintf(p, sizeof p, "%s%s", exe_dir, fd.cFileName);
        HANDLE f = CreateFileA(p, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, NULL);
        if (f == INVALID_HANDLE_VALUE) continue;
        DWORD n = fd.nFileSizeLow, got = 0;
        uint8_t *b = (uint8_t *)malloc(n);
        if (b && ReadFile(f, b, n, &got, NULL) && got == n) {
            char whole[33], data[33];
            md5_hex(b, n, whole);
            md5_hex(b + 16, n - 16, data);
            for (int g = 0; g < 6; g++)
                if (!rom_found[g][0] && (!strcmp(whole, rom_md5[g][0]) || !strcmp(data, rom_md5[g][1]))) {
                    snprintf(rom_found[g], MAX_PATH, "%s", p);
                    mask |= 1 << g;
                }
        }
        free(b);
        CloseHandle(f);
    } while (FindNextFileA(h, &fd));
    FindClose(h);
    return mask;
}

static const char *game_exe[6] = {"MegaMan.exe", "MegaMan2.exe", "MegaMan3.exe",
                                   "MegaMan4.exe", "MegaMan5.exe", "MegaMan6.exe"};

/* ---------------- settings ---------------- */
static void load_settings(void) {
    set.fullscreen = GetPrivateProfileIntA("game", "fullscreen", 0, ini_path) ? 1 : 0;
    set.scale = GetPrivateProfileIntA("game", "scale", 3, ini_path);
    set.volume = GetPrivateProfileIntA("game", "volume", 20, ini_path);
    set.music = GetPrivateProfileIntA("launcher", "music", 1, ini_path) ? 1 : 0;
    set.last_game = GetPrivateProfileIntA("launcher", "last_game", 0, ini_path);
    if (set.last_game < 0 || set.last_game > 5) set.last_game = 0;
    set.boost = GetPrivateProfileIntA("game", "boost", 1, ini_path) ? 1 : 0;
    set.wide = GetPrivateProfileIntA("game", "wide", 0, ini_path);
    set.jukebox = GetPrivateProfileIntA("game", "jukebox", 0, ini_path) ? 1 : 0;
    set.filter = GetPrivateProfileIntA("game", "filter", 0, ini_path);
    if (set.filter < 0 || set.filter > 2) set.filter = 0;
    if (set.wide < 0 || set.wide > 2) set.wide = 0;
    if (set.scale < 2 || set.scale > 4) set.scale = 3;
    if (set.volume < 0 || set.volume > VOL_MAX) set.volume = 20;
}
static void save_settings(void) {
    char b[16];
    sprintf(b, "%d", set.fullscreen); WritePrivateProfileStringA("game", "fullscreen", b, ini_path);
    sprintf(b, "%d", set.scale); WritePrivateProfileStringA("game", "scale", b, ini_path);
    sprintf(b, "%d", set.volume); WritePrivateProfileStringA("game", "volume", b, ini_path);
    sprintf(b, "%d", set.music); WritePrivateProfileStringA("launcher", "music", b, ini_path);
    sprintf(b, "%d", set.last_game); WritePrivateProfileStringA("launcher", "last_game", b, ini_path);
    sprintf(b, "%d", set.boost); WritePrivateProfileStringA("game", "boost", b, ini_path);
    sprintf(b, "%d", set.wide); WritePrivateProfileStringA("game", "wide", b, ini_path);
    sprintf(b, "%d", set.jukebox); WritePrivateProfileStringA("game", "jukebox", b, ini_path);
    sprintf(b, "%d", set.filter); WritePrivateProfileStringA("game", "filter", b, ini_path);
}

/* ---------------- audio ---------------- */
#define NB 4
#define BS 1024
static HWAVEOUT wo;
static WAVEHDR hdr[NB];
static int16_t abuf[NB][BS];
static HANDLE aev;

static DWORD WINAPI audio_thread(LPVOID p) {
    (void)p;
    for (;;) {
        WaitForSingleObject(aev, 50);
        for (int i = 0; i < NB; i++) {
            if (!(hdr[i].dwFlags & WHDR_DONE)) continue;
            lc_audio(abuf[i], BS);
            hdr[i].dwFlags &= ~WHDR_DONE;
            waveOutWrite(wo, &hdr[i], sizeof hdr[i]);
        }
    }
    return 0;
}

static void audio_init(void) {
    WAVEFORMATEX f = {0};
    f.wFormatTag = WAVE_FORMAT_PCM; f.nChannels = 1; f.nSamplesPerSec = LRATE;
    f.wBitsPerSample = 16; f.nBlockAlign = 2; f.nAvgBytesPerSec = LRATE * 2;
    aev = CreateEventA(NULL, FALSE, FALSE, NULL);
    if (waveOutOpen(&wo, WAVE_MAPPER, &f, (DWORD_PTR)aev, 0, CALLBACK_EVENT) != MMSYSERR_NOERROR) { wo = 0; return; }
    for (int i = 0; i < NB; i++) {
        hdr[i].lpData = (LPSTR)abuf[i];
        hdr[i].dwBufferLength = BS * 2;
        waveOutPrepareHeader(wo, &hdr[i], sizeof hdr[i]);
        hdr[i].dwFlags |= WHDR_DONE;
    }
    CreateThread(NULL, 0, audio_thread, NULL, 0, NULL);
}

/* ---------------- input ---------------- */
typedef struct { WORD wButtons; BYTE lt, rt; SHORT lx, ly, rx, ry; } XGP;
typedef struct { DWORD packet; XGP gp; } XSTATE;
typedef DWORD(WINAPI *XInputGetState_t)(DWORD, XSTATE *);
static XInputGetState_t xget;

static void pad_poll(void) {
    static int held[6], rep[6];
    if (!xget) return;
    XSTATE st;
    int now[6] = {0};
    if (xget(0, &st) == 0) {
        WORD b = st.gp.wButtons;
        now[0] = (b & 0x0004) || st.gp.lx < -16000;  /* left */
        now[1] = (b & 0x0008) || st.gp.lx > 16000;   /* right */
        now[2] = (b & 0x0001) || st.gp.ly > 16000;   /* up */
        now[3] = (b & 0x0002) || st.gp.ly < -16000;  /* down */
        now[4] = (b & 0x1000) || (b & 0x0010);       /* A / Start */
        now[5] = (b & 0x2000) || (b & 0x0020);       /* B / Back */
    }
    static const int ev[6] = {EV_LEFT, EV_RIGHT, EV_UP, EV_DOWN, EV_OK, EV_BACK};
    for (int i = 0; i < 6; i++) {
        if (now[i] && !held[i]) { lc_event(ev[i]); rep[i] = 0; }
        else if (now[i] && i < 4 && ++rep[i] > 24 && (rep[i] % 6) == 0) lc_event(ev[i]);
        held[i] = now[i];
    }
}

/* ---------------- launching ---------------- */
static void present(void) {
    HDC dc = GetDC(hwnd);
    SetStretchBltMode(dc, COLORONCOLOR);
    StretchDIBits(dc, 0, 0, LW * scale, LH * scale, 0, 0, LW, LH, fb, &bmi, DIB_RGB_COLORS, SRCCOPY);
    ReleaseDC(hwnd, dc);
}

static int pump(void) {
    MSG m;
    while (PeekMessage(&m, NULL, 0, 0, PM_REMOVE)) {
        if (m.message == WM_QUIT) return 0;
        TranslateMessage(&m);
        DispatchMessage(&m);
    }
    return 1;
}

static int launch_game(void) {
    char path[MAX_PATH], cmd[MAX_PATH + 96];
    int g = lc_selected_game();
    snprintf(path, sizeof path, "%s%s", exe_dir, game_exe[g]);
    if (GetFileAttributesA(path) == INVALID_FILE_ATTRIBUTES) {
        char m[40];
        snprintf(m, sizeof m, "%s NOT FOUND", game_exe[g]);
        for (char *c = m; *c; c++) if (*c >= 'a' && *c <= 'z') *c -= 32;
        lc_returned(0); lc_message(m); lc_error_sound();
        return 1;
    }
    char cmd2[MAX_PATH * 2 + 160];
    snprintf(cmd2, sizeof cmd2, "\"%s\" --launcher --wide %d --filter %d --scale %d --volume %d%s%s%s --rom \"%s\"", path, set.wide, set.filter, set.scale,
             (set.volume * 100 + VOL_MAX / 2) / VOL_MAX, set.fullscreen ? " --fullscreen" : "",
             set.boost ? " --boost" : "", set.jukebox ? " --jukebox" : "", rom_found[g]);
    STARTUPINFOA si = {sizeof si};
    PROCESS_INFORMATION pi;
    if (!CreateProcessA(path, cmd2, NULL, NULL, FALSE, 0, NULL, exe_dir, &si, &pi)) {
        lc_returned(0); lc_message("COULD NOT START GAME"); lc_error_sound();
        return 1;
    }
    CloseHandle(pi.hThread);
    if (wo) waveOutPause(wo);
    ShowWindow(hwnd, SW_HIDE);
    for (;;) {
        DWORD r = MsgWaitForMultipleObjects(1, &pi.hProcess, FALSE, INFINITE, QS_ALLINPUT);
        if (r == WAIT_OBJECT_0) break;
        if (!pump()) { CloseHandle(pi.hProcess); return 0; }
    }
    CloseHandle(pi.hProcess);
    lc_set_available(scan_roms());
    lc_returned(1);
    ShowWindow(hwnd, SW_SHOW);
    SetForegroundWindow(hwnd);
    if (wo) waveOutRestart(wo);
    return 1;
}

/* ---------------- window ---------------- */
static int to_ix(LPARAM lp) { return (short)LOWORD(lp) / scale; }
static int to_iy(LPARAM lp) { return (short)HIWORD(lp) / scale; }

static LRESULT CALLBACK wndproc(HWND h, UINT msg, WPARAM wp, LPARAM lp) {
    switch (msg) {
    case WM_NCHITTEST: {
        POINT p = {(short)LOWORD(lp), (short)HIWORD(lp)};
        ScreenToClient(h, &p);
        if (p.x >= 0 && p.y >= 0 && p.x < LW * scale && p.y < LH * scale && !lc_is_interactive(p.x / scale, p.y / scale))
            return HTCAPTION;  /* drag the window from anywhere that isn't a button */
        return HTCLIENT;
    }
    case WM_MOUSEMOVE: lc_mouse_move(to_ix(lp), to_iy(lp)); return 0;
    case WM_LBUTTONDOWN: lc_mouse_click(to_ix(lp), to_iy(lp)); return 0;
    case WM_MOUSEWHEEL: lc_wheel(GET_WHEEL_DELTA_WPARAM(wp) > 0 ? 1 : -1); return 0;
    case WM_KEYDOWN:
        switch (wp) {
        case VK_LEFT: case 'A': lc_event(EV_LEFT); break;
        case VK_RIGHT: case 'D': lc_event(EV_RIGHT); break;
        case VK_UP: case 'W': lc_event(EV_UP); break;
        case VK_DOWN: case 'S': lc_event(EV_DOWN); break;
        case VK_RETURN: case VK_SPACE: case 'X': case 'Z': case 'K': case 'J':
            if (!(lp & (1 << 30))) lc_event(EV_OK);
            break;
        case VK_ESCAPE: case VK_BACK: if (!(lp & (1 << 30))) lc_event(EV_BACK); break;
        case 'M': if (!(lp & (1 << 30))) lc_event(EV_MUSIC); break;
        case VK_OEM_PLUS: case VK_ADD: lc_event(EV_VOL_UP); break;
        case VK_OEM_MINUS: case VK_SUBTRACT: lc_event(EV_VOL_DOWN); break;
        }
        return 0;
    case WM_PAINT: { PAINTSTRUCT ps; BeginPaint(h, &ps); EndPaint(h, &ps); present(); return 0; }
    case WM_ERASEBKGND: return 1;
    case WM_ACTIVATEAPP:   /* re-scan when the user comes back (they may have added a ROM) */
        if (wp) lc_set_available(scan_roms());
        break;
    case WM_CLOSE: DestroyWindow(h); return 0;
    case WM_DESTROY: PostQuitMessage(0); return 0;
    }
    return DefWindowProc(h, msg, wp, lp);
}

int WINAPI WinMain(HINSTANCE inst, HINSTANCE prev, LPSTR cmdline, int show) {
    (void)prev; (void)cmdline;
    SetProcessDPIAware();
    timeBeginPeriod(1);
    GetModuleFileNameA(NULL, exe_dir, MAX_PATH);
    char *slash = strrchr(exe_dir, '\\');
    if (slash) slash[1] = 0;
    snprintf(ini_path, sizeof ini_path, "%slauncher.ini", exe_dir);
    load_settings();

    const char *dlls[] = {"xinput1_4.dll", "xinput1_3.dll", "xinput9_1_0.dll"};
    for (int i = 0; i < 3 && !xget; i++) {
        HMODULE m = LoadLibraryA(dlls[i]);
        if (m) xget = (XInputGetState_t)(void *)GetProcAddress(m, "XInputGetState");
    }

    int sw = GetSystemMetrics(SM_CXSCREEN), sh = GetSystemMetrics(SM_CYSCREEN);
    scale = 3;
    if (sh >= 1400 && sw >= 1900) scale = 4;
    while (scale > 1 && (LH * scale > sh - 80 || LW * scale > sw - 40)) scale--;

    WNDCLASSA wc = {0};
    wc.style = CS_DROPSHADOW;
    wc.lpfnWndProc = wndproc;
    wc.hInstance = inst;
    wc.hCursor = LoadCursor(NULL, IDC_HAND);
    wc.hIcon = LoadIcon(inst, MAKEINTRESOURCE(1));
    wc.lpszClassName = "MMNativeLauncher";
    RegisterClassA(&wc);
    hwnd = CreateWindowExA(WS_EX_APPWINDOW, "MMNativeLauncher", "MM Native Launcher", WS_POPUP | WS_SYSMENU | WS_MINIMIZEBOX,
                           (sw - LW * scale) / 2, (sh - LH * scale) / 2, LW * scale, LH * scale, NULL, NULL, inst, NULL);

    bmi.bmiHeader.biSize = sizeof bmi.bmiHeader;
    bmi.bmiHeader.biWidth = LW;
    bmi.bmiHeader.biHeight = -LH;
    bmi.bmiHeader.biPlanes = 1;
    bmi.bmiHeader.biBitCount = 32;
    bmi.bmiHeader.biCompression = BI_RGB;

    lc_info_lines[0] = "MEGA MAN";
    lc_info_lines[1] = INFO1;
    lc_info_lines[3] = "MEGA MAN 2";
    lc_info_lines[4] = INFO2;
    lc_info_lines[6] = "6502 CODE TRANSLATED TO C AND";
    lc_info_lines[7] = "CHECKED FRAME-EXACT VS A CPU";
    lc_set_available(scan_roms());
    lc_init(&set);
    lc_render(fb);
    ShowWindow(hwnd, show);
    present();
    audio_init();

    LARGE_INTEGER f, t0, now;
    QueryPerformanceFrequency(&f);
    QueryPerformanceCounter(&t0);
    double tick = f.QuadPart / 60.0, acc = 0;
    for (;;) {
        if (!pump()) break;
        QueryPerformanceCounter(&now);
        acc += (double)(now.QuadPart - t0.QuadPart);
        t0 = now;
        if (acc > tick * 5) acc = tick * 5;
        int stepped = 0;
        while (acc >= tick) {
            acc -= tick;
            pad_poll();
            int a = lc_update();
            stepped = 1;
            if (a == ACT_SAVE) save_settings();
            if (a == ACT_QUIT) { save_settings(); DestroyWindow(hwnd); }
            if (a == ACT_LAUNCH) {
                save_settings();
                if (!launch_game()) { DestroyWindow(hwnd); break; }
                QueryPerformanceCounter(&t0);
                acc = 0;
            }
        }
        if (stepped && IsWindow(hwnd)) { lc_render(fb); present(); }
        Sleep(1);
    }
    if (wo) { waveOutReset(wo); }
    timeEndPeriod(1);
    return 0;
}
