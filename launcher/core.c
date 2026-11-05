/* Launcher core: original pixel art, menu logic, beam-in animation and a
   small chiptune synthesizer. No platform code here. */
#include "core.h"
#include "font.h"
#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

/* ---------------------------------------------------------------- palette */
#define C_BLACK  0x000000
#define C_DEEP   0x070a24
#define C_NAVY   0x0c1450
#define C_NAVY2  0x10207a
#define C_BLUE   0x0058f8
#define C_CYAN   0x3cbcfc
#define C_LIGHT  0xa4e4fc
#define C_WHITE  0xfcfcfc
#define C_YELLOW 0xfcd880
#define C_ORANGE 0xfca044
#define C_RED    0xe83820
#define C_GRAY   0x2c3058
#define C_PANEL  0x040a30

static uint32_t *FB;
static LSettings *S;

static inline void px(int x, int y, uint32_t c) {
    if ((unsigned)x < LW && (unsigned)y < LH) FB[y * LW + x] = c;
}
static void rect(int x, int y, int w, int h, uint32_t c) {
    for (int j = 0; j < h; j++) for (int i = 0; i < w; i++) px(x + i, y + j, c);
}
static void frame(int x, int y, int w, int h, int t, uint32_t c) {
    rect(x, y, w, t, c); rect(x, y + h - t, w, t, c);
    rect(x, y, t, h, c); rect(x + w - t, y, t, h, c);
}
static uint32_t dim(uint32_t c, int num, int den) {
    int r = ((c >> 16) & 255) * num / den, g = ((c >> 8) & 255) * num / den, b = (c & 255) * num / den;
    return (uint32_t)((r << 16) | (g << 8) | b);
}
/* dither-darken the whole screen: level 0..4 */
static void darken(int level) {
    static const uint8_t pat[5][4] = {{0, 0, 0, 0}, {1, 0, 0, 0}, {1, 0, 0, 1}, {1, 1, 0, 1}, {1, 1, 1, 1}};
    if (level <= 0) return;
    if (level > 4) level = 4;
    for (int y = 0; y < LH; y++)
        for (int x = 0; x < LW; x++)
            if (pat[level][(y & 1) * 2 + (x & 1)]) FB[y * LW + x] = dim(FB[y * LW + x], 1, 4);
}

static void glyph(int x, int y, char ch, uint32_t c, int sc) {
    const uint8_t *g = font8[(unsigned char)ch & 127];
    for (int r = 0; r < 7; r++)
        for (int b = 0; b < 7; b++)
            if (g[r] & (0x40 >> b)) rect(x + b * sc, y + r * sc, sc, sc, c);
}
static void text(int x, int y, const char *s, uint32_t c, int sc) {
    for (; *s; s++, x += 8 * sc) glyph(x, y, *s, c, sc);
}
static int tw(const char *s, int sc) { return (int)strlen(s) * 8 * sc - sc; }
static void text_c(int cx, int y, const char *s, uint32_t c, int sc) { text(cx - tw(s, sc) / 2, y, s, c, sc); }
static void text_sh(int x, int y, const char *s, uint32_t c, int sc) {
    text(x + 1, y + 1, s, C_BLACK, sc);
    text(x, y, s, c, sc);
}

/* ---------------------------------------------------------------- state */
enum { ST_MENU, ST_KEYS, ST_INFO, ST_TELE, ST_AWAY };
static int state, frame_no, focus, bar_row, tele_t, msg_t;
static char msg[40];
static int mouse_x = -1, mouse_y = -1;
static volatile int sfx_req = -1, sfx_param;
static volatile int music_live;

#define NSTARS 70
static struct { float x, y, v; uint32_t c; } stars[NSTARS];

/* panels */
/* grid items, 4 columns x 2 rows; the volume bar is focus index BAR */
/* grid: six cartridges on top, six settings below; volume bar = BAR, close box = IT_EXIT */
enum { IT_G1, IT_G2, IT_G3, IT_G4, IT_G5, IT_G6, IT_MODE, IT_WIDE, IT_SCREEN, IT_MUSIC, IT_KEYS, IT_INFO, NP };
#define BAR NP
#define IT_EXIT (NP + 1)
#define COLS 6
#define NGAMES 6
static const char *pname[NP] = {"MM1", "MM2", "MM3", "MM4", "MM5", "MM6",
                                "MODE", "WIDE", "VIDEO", "MUSIC", "KEYS", "INFO"};
static const char *gname[NGAMES] = {"MEGA MAN", "MEGA MAN 2", "MEGA MAN 3", "MEGA MAN 4", "MEGA MAN 5", "MEGA MAN 6"};
static const uint32_t gcolor[NGAMES] = {0x0058f8, 0xe83820, 0xd89800, 0x00a0a0, 0x8040d8, 0x28a028};
static int hover_close;
static int avail_mask = 0x3F;   /* bit n: ROM for game n+1 was found */
void lc_set_available(int mask) { avail_mask = mask; }
#define HAVE(g) ((avail_mask >> (g)) & 1)
#define CLOSE_X (LW - 18)
#define CLOSE_Y 5
static int game_sel;
#define PX0 42
#define PY0 62
#define PW 40
#define PH 40
#define PGX 6
#define PGY 16
static int panel_x(int i) { return PX0 + (i % COLS) * (PW + PGX); }
static int panel_y(int i) { return PY0 + (i / COLS) * (PH + PGY); }
#define BAR_X 13
#define BAR_Y 68
#define BAR_H 105

enum { SFX_CURSOR, SFX_SELECT, SFX_BACK, SFX_VOL, SFX_BEAM, SFX_LAND, SFX_ERROR, SFX_TOGGLE };
static void sfx(int id, int param) { sfx_param = param; sfx_req = id; }

void lc_init(LSettings *s) {
    S = s;
    srand(7);
    for (int i = 0; i < NSTARS; i++) {
        stars[i].x = (float)(rand() % LW); stars[i].y = (float)(rand() % LH);
        int layer = rand() % 3;
        stars[i].v = 0.15f + layer * 0.3f;
        stars[i].c = layer == 2 ? C_WHITE : layer == 1 ? C_LIGHT : C_BLUE;
    }
    state = ST_MENU;
    game_sel = s->last_game;
    if (game_sel < 0 || game_sel >= NGAMES) game_sel = 0;
    focus = IT_G1 + game_sel;
}

void lc_message(const char *m) {
    strncpy(msg, m, sizeof msg - 1);
    msg[sizeof msg - 1] = 0;
    msg_t = 240;
}

static int act_pending;
static void set_vol(int v) {
    if (v < 0) v = 0;
    if (v > VOL_MAX) v = VOL_MAX;
    if (v != S->volume) { S->volume = v; sfx(SFX_VOL, v); act_pending = ACT_SAVE; }
}

static void activate(int i) {
    switch (i) {
    case IT_G1: case IT_G2: case IT_G3: case IT_G4: case IT_G5: case IT_G6:
        if (!HAVE(i - IT_G1)) {
            char m[40];
            snprintf(m, sizeof m, "NO ROM FOUND FOR %s", gname[i - IT_G1]);
            lc_message(m); sfx(SFX_ERROR, 0);
            break;
        }
        game_sel = i - IT_G1; S->last_game = game_sel;
        state = ST_TELE; tele_t = 0; sfx(SFX_SELECT, 0); break;
    case IT_MODE: S->boost ^= 1; sfx(SFX_TOGGLE, 0); act_pending = ACT_SAVE; break;
    case IT_SCREEN:   /* window 2x -> 3x -> 4x -> fullscreen -> 2x */
        if (S->fullscreen) { S->fullscreen = 0; S->scale = 2; }
        else if (S->scale >= 4) S->fullscreen = 1;
        else S->scale++;
        sfx(SFX_TOGGLE, 0); act_pending = ACT_SAVE; break;
    case IT_WIDE: S->wide = (S->wide + 1) % 3; sfx(SFX_TOGGLE, 0); act_pending = ACT_SAVE; break;
    case IT_MUSIC: S->music ^= 1; sfx(SFX_TOGGLE, 0); act_pending = ACT_SAVE; break;
    case IT_KEYS: state = ST_KEYS; sfx(SFX_SELECT, 0); break;
    case IT_INFO: state = ST_INFO; sfx(SFX_SELECT, 0); break;
    case IT_EXIT: act_pending = ACT_QUIT; break;
    }
}

static void move_focus(int nf) {
    if (nf != focus) { focus = nf; sfx(SFX_CURSOR, 0); }
}

void lc_event(int ev) {
    if (state == ST_KEYS || state == ST_INFO) {
        if (ev == EV_OK || ev == EV_BACK) { state = ST_MENU; sfx(SFX_BACK, 0); }
        return;
    }
    if (state != ST_MENU) return;
    if (ev == EV_VOL_UP) { set_vol(S->volume + 1); return; }
    if (ev == EV_VOL_DOWN) { set_vol(S->volume - 1); return; }
    if (focus == BAR) {
        switch (ev) {
        case EV_UP: set_vol(S->volume + 1); break;
        case EV_DOWN: set_vol(S->volume - 1); break;
        case EV_RIGHT: case EV_OK: move_focus(bar_row * COLS); break;
        case EV_BACK: act_pending = ACT_QUIT; break;
        }
        return;
    }
    int col = focus % COLS, row = focus / COLS;
    switch (ev) {
    case EV_LEFT: if (col == 0) { bar_row = row; move_focus(BAR); } else move_focus(focus - 1); break;
    case EV_RIGHT: if (col < COLS - 1) move_focus(focus + 1); break;
    case EV_UP: if (row == 1) move_focus(focus - COLS); break;
    case EV_DOWN: if (row == 0) move_focus(focus + COLS); break;
    case EV_OK: activate(focus); break;
    case EV_BACK: act_pending = ACT_QUIT; break;
    }
}

static int hit_panel(int x, int y) {
    for (int i = 0; i < NP; i++)
        if (x >= panel_x(i) - 2 && x < panel_x(i) + PW + 2 && y >= panel_y(i) - 2 && y < panel_y(i) + PH + 2) return i;
    if (x >= BAR_X - 6 && x < BAR_X + 26 && y >= BAR_Y - 12 && y < BAR_Y + BAR_H + 6) return BAR;
    if (x >= CLOSE_X - 2 && x < CLOSE_X + 14 && y >= CLOSE_Y - 2 && y < CLOSE_Y + 14) return IT_EXIT;
    return -1;
}

int lc_is_interactive(int x, int y) {
    if (state == ST_KEYS || state == ST_INFO) return 1;
    return state == ST_MENU && hit_panel(x, y) >= 0;
}

void lc_mouse_move(int x, int y) {
    if (x == mouse_x && y == mouse_y) return;
    mouse_x = x; mouse_y = y;
    if (state != ST_MENU) return;
    int h = hit_panel(x, y);
    hover_close = (h == IT_EXIT);
    if (h >= 0 && h != IT_EXIT) { if (h == BAR && focus != BAR) bar_row = 0; move_focus(h); }
}

void lc_mouse_click(int x, int y) {
    if (state == ST_KEYS || state == ST_INFO) { lc_event(EV_BACK); return; }
    if (state != ST_MENU) return;
    int h = hit_panel(x, y);
    if (h < 0) return;
    if (h == IT_EXIT) { act_pending = ACT_QUIT; return; }
    focus = h;
    if (h == BAR) set_vol((BAR_Y + BAR_H - y) / 4 + 1);
    else activate(h);
}

void lc_wheel(int dir) {
    if (state == ST_MENU) set_vol(S->volume + dir);
}

void lc_returned(int ok) {
    state = ST_MENU;
    if (ok) lc_message("WELCOME BACK!");
}

int lc_update(void) {
    frame_no++;
    if (msg_t) msg_t--;
    float speed = state == ST_TELE ? 1.0f + tele_t * 0.25f : 1.0f;
    for (int i = 0; i < NSTARS; i++) {
        stars[i].x -= stars[i].v * speed;
        if (stars[i].x < 0) { stars[i].x += LW; stars[i].y = (float)(rand() % LH); }
    }
    music_live = S->music && (state == ST_MENU || state == ST_KEYS || state == ST_INFO);
    if (state == ST_TELE) {
        tele_t++;
        if (tele_t == 16) sfx(SFX_BEAM, 0);
        if (tele_t == 40) sfx(SFX_LAND, 0);
        if (tele_t >= 58 && tele_t < 98 && (tele_t - 58) % 16 == 0) sfx(SFX_CURSOR, 0);
        if (tele_t == 104) { state = ST_AWAY; return ACT_LAUNCH; }
    }
    int a = act_pending;
    act_pending = ACT_NONE;
    return a;
}

/* ---------------------------------------------------------------- icons */
static void icon_play(int x, int y, int on) {
    uint32_t a = on ? C_CYAN : C_BLUE, b = on ? C_WHITE : C_LIGHT;
    for (int r = 0; r < 20; r++) {
        int w = (r < 10 ? r : 19 - r) * 17 / 10 + 1;
        rect(x + 6, y + 2 + r, w, 1, a);
        px(x + 6, y + 2 + r, b); px(x + 7, y + 2 + r, b);
    }
    rect(x + 8, y + 6, 2, 2, b);
}
static void icon_screen(int x, int y, int on) {
    uint32_t a = on ? C_WHITE : C_LIGHT, b = on ? C_CYAN : C_BLUE;
    frame(x + 1, y + 2, 22, 16, 2, a);
    rect(x + 3, y + 4, 18, 12, b);
    rect(x + 5, y + 6, 6, 2, a); rect(x + 5, y + 9, 3, 1, a);
    rect(x + 10, y + 18, 4, 3, a);
    rect(x + 6, y + 21, 12, 2, a);
}
static void icon_wide(int x, int y, int on) {
    uint32_t a = on ? C_WHITE : C_LIGHT, b = on ? C_CYAN : C_BLUE;
    int w = S->wide ? 22 : 16, x0 = x + (24 - w) / 2;
    frame(x0, y + 6, w, 12, 2, a);                                   /* screen outline */
    rect(x0 + 2, y + 8, w - 4, 8, b);
    if (S->wide == 2) { rect(x0 + 2, y + 8, 3, 8, C_YELLOW); rect(x0 + w - 5, y + 8, 3, 8, C_YELLOW); }
    for (int k = 0; k < 3; k++) {                                     /* arrows */
        px(x + 1 + k, y + 21 - k, a); px(x + 1 + k, y + 21 + k, a);
        px(x + 22 - k, y + 21 - k, a); px(x + 22 - k, y + 21 + k, a);
    }
    rect(x + 1, y + 21, 22, 1, a);
}
static void icon_scale(int x, int y, int on) {
    uint32_t a = on ? C_WHITE : C_LIGHT, b = on ? C_CYAN : C_BLUE;
    frame(x + 8, y + 1, 15, 15, 2, b);
    frame(x + 1, y + 13, 10, 10, 2, a);
    for (int i = 0; i < 7; i++) { px(x + 11 + i, y + 11 - i, a); px(x + 12 + i, y + 11 - i, a); }
    rect(x + 15, y + 4, 5, 2, a); rect(x + 18, y + 4, 2, 5, a);
}
static void icon_music(int x, int y, int on) {
    uint32_t a = on ? C_WHITE : C_LIGHT, b = on ? C_CYAN : C_BLUE;
    rect(x + 7, y + 3, 14, 3, a);
    rect(x + 7, y + 3, 2, 15, a); rect(x + 19, y + 3, 2, 13, a);
    rect(x + 2, y + 16, 6, 4, b); rect(x + 3, y + 15, 4, 6, b);
    rect(x + 14, y + 14, 6, 4, b); rect(x + 15, y + 13, 4, 6, b);
    if (!S->music) for (int i = 0; i < 20; i++) { px(x + 2 + i, y + 2 + i, C_RED); px(x + 3 + i, y + 2 + i, C_RED); }
}
static void icon_keys(int x, int y, int on) {
    uint32_t a = on ? C_LIGHT : C_GRAY, b = on ? C_WHITE : C_LIGHT, r = on ? C_RED : dim(C_RED, 1, 2);
    rect(x + 2, y + 7, 20, 12, a); rect(x + 1, y + 9, 22, 8, a); rect(x + 3, y + 6, 18, 14, a);
    rect(x + 4, y + 11, 6, 2, C_PANEL); rect(x + 6, y + 9, 2, 6, C_PANEL);
    rect(x + 15, y + 12, 3, 3, r); rect(x + 19, y + 10, 3, 3, r);
    rect(x + 11, y + 15, 2, 1, b); rect(x + 13, y + 15, 2, 1, b);
}
static void icon_cart(int x, int y, int on, int which) {
    int have = HAVE(which);
    uint32_t body = on ? 0xb8b8c8 : 0x6c6c84, edge = on ? C_WHITE : C_LIGHT, dark = on ? 0x58586c : 0x34344c;
    uint32_t lab = on ? gcolor[which] : dim(gcolor[which], 2, 3);
    if (!have) { body = 0x2c2c40; edge = 0x44445c; dark = 0x1c1c2c; lab = 0x24243a; }
    rect(x + 3, y + 1, 18, 22, body);
    rect(x + 3, y + 1, 18, 1, edge); rect(x + 3, y + 1, 1, 22, edge);
    rect(x + 20, y + 2, 1, 21, dark); rect(x + 4, y + 22, 17, 1, dark);
    for (int k = 0; k < 3; k++) rect(x + 5, y + 3 + k * 2, 14, 1, dark);      /* grip ridges */
    rect(x + 5, y + 10, 14, 11, lab);                                         /* label */
    rect(x + 5, y + 10, 14, 1, on ? C_WHITE : C_LIGHT);
    glyph(x + 9, y + 12, (char)('1' + which), have ? C_WHITE : 0x50506c, 1);
    rect(x + 7, y + 23, 10, 1, dark);                                         /* contacts */
    if (!have)                                                                /* empty slot: red cross */
        for (int k = 0; k < 14; k++) { px(x + 5 + k, y + 5 + k, C_RED); px(x + 18 - k, y + 5 + k, C_RED); }
}
static void icon_info(int x, int y, int on) {
    uint32_t a = on ? C_CYAN : C_BLUE, b = on ? C_WHITE : C_LIGHT;
    for (int j = 0; j < 24; j++)
        for (int i = 0; i < 24; i++) {
            float dx = i - 11.5f, dy = j - 11.5f, d = sqrtf(dx * dx + dy * dy);
            if (d < 10.5f) px(x + i, y + j, d >= 8.5f ? b : a);
        }
    rect(x + 11, y + 5, 2, 2, b);
    rect(x + 10, y + 9, 3, 2, b); rect(x + 11, y + 9, 2, 9, b); rect(x + 9, y + 17, 6, 2, b);
}
static void icon_mode(int x, int y, int on) {
    static const char *bolt[22] = {
        ".........XXXXXX", "........XXXXXX.", ".......XXXXXX..", "......XXXXXX...", ".....XXXXXX....",
        "....XXXXXX.....", "...XXXXXX......", "..XXXXXXXXXXXX.", ".XXXXXXXXXXXX..", "......XXXXXX...",
        ".....XXXXXX....", "....XXXXXX.....", "...XXXXXX......", "..XXXXX........", ".XXXXX.........",
        ".XXXX..........", "XXXX...........", "XXX............", "XX.............", "X..............",
        "...............", "..............."};
    uint32_t a = S->boost ? (on ? C_YELLOW : C_ORANGE) : (on ? C_LIGHT : C_GRAY);
    uint32_t b = S->boost ? C_WHITE : (on ? C_WHITE : C_BLUE);
    for (int r = 0; r < 22; r++)
        for (int c = 0; c < 15; c++)
            if (bolt[r][c] == 'X') px(x + 5 + c, y + 1 + r, (c > 0 && bolt[r][c - 1] == '.') ? b : a);
}
static void icon_exit(int x, int y, int on) {
    uint32_t a = on ? C_ORANGE : dim(C_ORANGE, 2, 3), b = on ? C_WHITE : C_LIGHT;
    for (int j = 0; j < 24; j++)
        for (int i = 0; i < 24; i++) {
            float dx = i - 11.5f, dy = j - 12.5f, d = sqrtf(dx * dx + dy * dy);
            if (d >= 7.5f && d < 10.0f && !(dy < -2 && fabsf(dx) < 4.5f)) px(x + i, y + j, a);
        }
    rect(x + 11, y + 1, 2, 11, b);
}

/* ---------------------------------------------------------------- scene */
static void draw_background(int band) {
    for (int i = 0; i < LW * LH; i++) FB[i] = C_DEEP;
    for (int i = 0; i < NSTARS; i++) {
        int x = (int)stars[i].x, y = (int)stars[i].y;
        px(x, y, stars[i].c);
        if (state == ST_TELE && tele_t > 16) for (int k = 1; k < 1 + tele_t / 6; k++) px(x + k, y, dim(stars[i].c, 1, 2));
    }
    if (!band) return;
    /* stage-select style diagonal band */
    int sc = frame_no / 2;
    for (int y = 56; y < 180; y++)
        for (int x = 0; x < LW; x++)
            FB[y * LW + x] = (((x + y + sc) >> 3) & 1) ? C_NAVY : C_NAVY2;
    rect(0, 55, LW, 1, C_BLUE); rect(0, 180, LW, 1, C_BLUE);
    rect(0, 53, LW, 1, C_CYAN); rect(0, 182, LW, 1, C_CYAN);
}

static void draw_title(void) {
    static const uint32_t grad[14] = {C_WHITE, C_WHITE, C_WHITE, C_LIGHT, C_LIGHT, C_LIGHT, C_LIGHT,
                                      C_CYAN, C_CYAN, C_CYAN, C_CYAN, C_BLUE, C_BLUE, C_BLUE};
    const char *t = "MM NATIVE";
    int x0 = (LW - tw(t, 2)) / 2, y0 = 10;
    /* outline + drop shadow */
    for (int dy = -1; dy <= 3; dy++)
        for (int dx = -1; dx <= 3; dx++) text(x0 + dx, y0 + dy, t, (dx > 1 || dy > 1) ? C_NAVY2 : C_BLACK, 2);
    for (const char *p = t; *p; p++) {
        int gx = x0 + (int)(p - t) * 16;
        const uint8_t *g = font8[(unsigned char)*p];
        for (int r = 0; r < 7; r++)
            for (int b = 0; b < 7; b++)
                if (g[r] & (0x40 >> b)) {
                    px(gx + b * 2, y0 + r * 2, grad[r * 2]); px(gx + b * 2 + 1, y0 + r * 2, grad[r * 2]);
                    px(gx + b * 2, y0 + r * 2 + 1, grad[r * 2 + 1]); px(gx + b * 2 + 1, y0 + r * 2 + 1, grad[r * 2 + 1]);
                }
    }
    /* glint sweeping across the title */
    int gl = (frame_no * 3) % 600 - 60;
    for (int y = 0; y < 14; y++)
        for (int k = 0; k < 3; k++) {
            int x = gl + y / 2 + k;
            if (x >= 0 && x < LW && FB[(y0 + y) * LW + x] != C_BLACK && FB[(y0 + y) * LW + x] != C_NAVY2 &&
                FB[(y0 + y) * LW + x] != C_DEEP)
                FB[(y0 + y) * LW + x] = C_WHITE;
        }
    if (state == ST_MENU && focus < NGAMES) {
        char b[40];
        if (HAVE(focus)) {
            strcpy(b, "PLAY > "); strcat(b, gname[focus]);
            text_c(LW / 2, 34, b, (frame_no / 16) & 1 ? C_WHITE : C_YELLOW, 1);
        } else {
            strcpy(b, "NO ROM FOR "); strcat(b, gname[focus]);
            text_c(LW / 2, 34, b, C_RED, 1);
        }
    } else if (state == ST_MENU && focus == IT_WIDE) {
        static const char *wt[3] = {"WIDESCREEN OFF: ORIGINAL 4:3", "WIDESCREEN: STRETCH TO FILL", "WIDESCREEN: EXTENDED LEVEL VIEW"};
        text_c(LW / 2, 34, wt[S->wide % 3], S->wide == 2 ? C_YELLOW : C_LIGHT, 1);
    } else if (state == ST_MENU && focus == IT_MODE) {
        text_c(LW / 2, 34, S->boost ? "BOOST: NO SLOWDOWN, NO FLICKER" : "ORIGINAL: PLAYS LIKE THE NES",
               S->boost ? C_YELLOW : C_LIGHT, 1);
    } else text_c(LW / 2, 34, "STATIC RECOMP * WIN64", C_CYAN, 1);
}

static void draw_close(void) {
    uint32_t c = hover_close ? C_RED : C_BLUE, f = hover_close ? C_WHITE : C_LIGHT;
    rect(CLOSE_X, CLOSE_Y, 12, 12, c);
    frame(CLOSE_X, CLOSE_Y, 12, 12, 1, f);
    for (int i = 0; i < 6; i++) {
        px(CLOSE_X + 3 + i, CLOSE_Y + 3 + i, C_WHITE); px(CLOSE_X + 8 - i, CLOSE_Y + 3 + i, C_WHITE);
    }
}

static void brackets(int x, int y, int w, int h, int gap, uint32_t c) {
    int L = 5;
    int x0 = x - gap, y0 = y - gap, x1 = x + w + gap - 1, y1 = y + h + gap - 1;
    rect(x0, y0, L, 2, c); rect(x0, y0, 2, L, c);
    rect(x1 - L + 1, y0, L, 2, c); rect(x1 - 1, y0, 2, L, c);
    rect(x0, y1 - 1, L, 2, c); rect(x0, y1 - L + 1, 2, L, c);
    rect(x1 - L + 1, y1 - 1, L, 2, c); rect(x1 - 1, y1 - L + 1, 2, L, c);
}

static void draw_panel(int i) {
    int x = panel_x(i), y = panel_y(i), sel = (focus == i && state == ST_MENU);
    int blink = (frame_no / 6) & 1;
    uint32_t border = sel ? (blink ? C_WHITE : C_CYAN) : C_BLUE;
    rect(x + 3, y + 3, PW, PH, C_BLACK);               /* shadow */
    rect(x, y, PW, PH, C_PANEL);
    frame(x, y, PW, PH, 2, border);
    rect(x + 2, y + 2, PW - 4, 1, sel ? C_NAVY2 : C_NAVY);
    int ix = x + (PW - 24) / 2, iy = y + (PH - 24) / 2;
    switch (i) {
    case IT_G1: case IT_G2: case IT_G3: case IT_G4: case IT_G5: case IT_G6: icon_cart(ix, iy, sel, i - IT_G1); break;
    case IT_MODE: icon_mode(ix, iy, sel); break;
    case IT_SCREEN: icon_screen(ix, iy, sel); break;
    case IT_WIDE: icon_wide(ix, iy, sel); break;
    case IT_MUSIC: icon_music(ix, iy, sel); break;
    case IT_KEYS: icon_keys(ix, iy, sel); break;
    case IT_INFO: icon_info(ix, iy, sel); break;
    }
    uint32_t lc = sel ? C_WHITE : C_LIGHT;
    if (i < NGAMES && S->last_game == i) lc = sel ? C_YELLOW : dim(C_YELLOW, 3, 4);
    if (i < NGAMES && !HAVE(i)) lc = sel ? 0x9090a8 : 0x6c6c84;
    text_c(x + PW / 2 + 1, y + PH + 3, pname[i], lc, 1);
    if (sel) brackets(x, y, PW, PH, 3 + ((frame_no / 10) & 1), C_WHITE);
    const char *val = NULL;
    char buf[8];
    if (i == IT_SCREEN) { if (S->fullscreen) val = "FULL"; else { buf[0] = (char)('0' + S->scale); buf[1] = 'X'; buf[2] = 0; val = buf; } }
    if (i == IT_WIDE) val = S->wide == 0 ? "4:3" : S->wide == 1 ? "FILL" : "EXT";
    if (i == IT_MUSIC) val = S->music ? "ON" : "OFF";
    if (i == IT_MODE) val = S->boost ? "BOOST" : "ORIG";
    if (val) text_c(x + PW / 2 + 1, y + PH + 13, val, sel ? C_YELLOW : dim(C_YELLOW, 3, 4), 1);
}

static void draw_bar(void) {
    int sel = focus == BAR && state == ST_MENU;
    text_c(BAR_X + 6, 58, "VOL", sel ? C_WHITE : C_LIGHT, 1);
    rect(BAR_X, BAR_Y, 12, BAR_H, C_BLACK);
    for (int s = 0; s < VOL_MAX; s++) {
        int yy = BAR_Y + BAR_H - 2 - (s + 1) * 4 + 1;
        int on = s < S->volume;
        rect(BAR_X + 2, yy, 8, 1, on ? C_WHITE : C_GRAY);
        rect(BAR_X + 2, yy + 1, 8, 1, on ? C_YELLOW : C_GRAY);
        rect(BAR_X + 2, yy + 2, 8, 1, on ? C_WHITE : C_GRAY);
    }
    if (sel) {
        uint32_t c = ((frame_no / 6) & 1) ? C_WHITE : C_CYAN;
        frame(BAR_X - 2, BAR_Y - 2, 16, BAR_H + 4, 1, c);
        int bob = (frame_no / 8) & 1, ax = BAR_X + 22;
        for (int k = 0; k < 4; k++) {
            rect(ax - k, BAR_Y + 2 - bob + k, 2 * k + 1, 1, C_WHITE);           /* up arrow */
            rect(ax - k, BAR_Y + BAR_H - 3 + bob - k, 2 * k + 1, 1, C_WHITE);   /* down arrow */
        }
    }
}

static void draw_footer(void) {
    if (msg_t) {
        if ((msg_t / 8) & 1 || msg_t < 200) text_c(LW / 2, 188, msg, C_YELLOW, 1);
        return;
    }
    if ((frame_no / 300) & 1) {
        text_c(LW / 2, 188, "ARROWS:MOVE  ENTER:OK  ESC:QUIT", C_LIGHT, 1);
    } else if ((frame_no % 60) < 40) {
        text_c(LW / 2, 188, "PRESS START", C_WHITE, 1);
    }
}

static void draw_keys_overlay(void) {
    darken(3);
    int w = 220, h = 172, x = (LW - w) / 2, y = 14;
    rect(x + 4, y + 4, w, h, C_BLACK);
    rect(x, y, w, h, C_PANEL);
    frame(x, y, w, h, 2, C_WHITE);
    frame(x + 4, y + 4, w - 8, h - 8, 1, C_BLUE);
    text_c(LW / 2, y + 10, "CONTROLS", C_YELLOW, 1);
    static const char *rows[][2] = {
        {"MOVE", "ARROWS/WASD"}, {"JUMP", "X  OR  K"}, {"SHOOT", "Z  OR  J"},
        {"START", "ENTER"}, {"SELECT", "RSHIFT/TAB"}, {"PAUSE", "P"},
        {"TURBO", "HOLD SPACE"}, {"RESET", "F2"}, {"BOOST", "F3"}, {"WIDE", "F4"}, {"FULL", "F11"}, {"BACK", "ESC"},
    };
    for (int i = 0; i < 12; i++) {
        text(x + 14, y + 24 + i * 11, rows[i][0], C_CYAN, 1);
        text(x + 86, y + 24 + i * 11, rows[i][1], C_WHITE, 1);
    }
    if ((frame_no / 20) & 1) text_c(LW / 2, y + h - 14, "XBOX PAD WORKS TOO", C_LIGHT, 1);
}

const char *lc_info_lines[8];  /* unused now; kept for compatibility */
static const char *info_lines[10] = {
    "MM1   9999 OPS  UXROM",
    "MM2  11727 OPS  MMC1",
    "MM3  11912 OPS  MMC3",
    "MM4  13468 OPS  MMC3",
    "MM5  13455 OPS  MMC3",
    "MM6  11773 OPS  MMC3",
    "ALL CHECKED FRAME-EXACT",
    "AGAINST A REFERENCE 6502",
    "BOOST: 15X CPU PER FRAME AND",
    "NO 8-SPRITE LIMIT  (F3 IN GAME)",
};

static void draw_info_overlay(void) {
    darken(3);
    int w = 280, h = 158, x = (LW - w) / 2, y = 24;
    rect(x + 4, y + 4, w, h, C_BLACK);
    rect(x, y, w, h, C_PANEL);
    frame(x, y, w, h, 2, C_WHITE);
    frame(x + 4, y + 4, w - 8, h - 8, 1, C_BLUE);
    text_c(LW / 2, y + 10, "ABOUT THIS BUILD", C_YELLOW, 1);
    for (int i = 0; i < 10; i++)
        text(x + 14, y + 26 + i * 12 + (i >= 6 ? 6 : 0), info_lines[i], i < 6 ? C_WHITE : i < 8 ? C_CYAN : C_YELLOW, 1);
    for (int i = 0; i < 6; i++)   /* ROM detection status, by MD5 */
        text(x + 14 + 23 * 8, y + 26 + i * 12, HAVE(i) ? "ROM OK" : "NO ROM", HAVE(i) ? 0x58d858 : C_RED, 1);
}

static void draw_tele(void) {
    int t = tele_t;
    if (t < 16) {
        draw_background(1);
        draw_title();
        for (int i = 0; i < NP; i++) draw_panel(i);
        draw_bar();
        darken(t / 3);
        return;
    }
    draw_background(0);
    int ground = 120, cx = LW / 2;
    /* floor grid */
    for (int x = 0; x < LW; x++) px(x, ground + 14, (x / 4 + frame_no / 2) & 1 ? C_NAVY2 : C_NAVY);
    for (int x = 0; x < LW; x += 16) for (int y = ground + 15; y < LH; y += 2) px(x + ((y - ground) * (x - cx)) / 64, y, C_NAVY);
    /* landing pad */
    int lit = t >= 40;
    rect(cx - 26, ground + 8, 52, 6, C_GRAY);
    rect(cx - 22, ground + 6, 44, 2, lit ? C_CYAN : C_BLUE);
    rect(cx - 26, ground + 13, 52, 1, C_BLACK);
    for (int i = 0; i < 6; i++) {
        int on = lit ? ((i + frame_no / 4) % 3 != 0) : ((i + frame_no / 8) % 6 == 0);
        rect(cx - 21 + i * 8, ground + 10, 3, 2, on ? C_YELLOW : C_NAVY2);
    }
    if (t < 40) {
        int head = -12 + (t - 16) * 6;
        if (head > ground + 5) head = ground + 5;
        for (int y = head - 70; y <= head; y++) {
            if (y < 0) continue;
            int fade = head - y;
            uint32_t glow = fade > 50 ? C_NAVY2 : C_BLUE, edge = fade > 40 ? C_BLUE : C_CYAN,
                     core = fade > 56 ? C_CYAN : C_WHITE;
            px(cx - 6, y, glow); px(cx + 5, y, glow);
            rect(cx - 5, y, 2, 1, edge); rect(cx + 3, y, 2, 1, edge);
            rect(cx - 3, y, 6, 1, core);
            if (((y + t * 3) % 9) == 0 && fade < 50) rect(cx - 8, y, 16, 1, C_LIGHT);  /* energy rings */
        }
        rect(cx - 7, head - 2, 14, 4, C_WHITE);
        rect(cx - 9, head - 1, 18, 2, C_CYAN);
    } else {
        int k = t - 40;
        /* impact: expanding flash, sparks and a ring */
        int w = k * 12;
        if (k < 14) rect(cx - w / 2, ground + 5, w, 1, k < 6 ? C_WHITE : C_CYAN);
        if (k < 18) {
            float r = 4.0f + k * 3.0f;
            for (int a = 0; a < 64; a++) {
                float ang = a / 64.0f * 6.2832f;
                px(cx + (int)(cosf(ang) * r), ground + 5 + (int)(sinf(ang) * r * 0.35f), k < 9 ? C_WHITE : C_BLUE);
            }
        }
        for (int i = 0; i < 16; i++) {
            float ang = 3.1416f + (float)i / 15.0f * 3.1416f;
            float r = k * 2.6f, g = k * k * 0.05f;
            if (k < 24) {
                int sx = cx + (int)(cosf(ang) * r), sy = ground + 4 + (int)(sinf(ang) * r * 0.8f + g);
                rect(sx, sy, 2, 2, (k + i) & 2 ? C_WHITE : C_CYAN);
            }
        }
        /* energy column shimmering above the pad */
        int colh = k < 30 ? 40 - k : 10;
        for (int y = ground + 5 - colh; y < ground + 6; y++)
            if (((y + k) % 3) != 0) {
                px(cx - 8 + ((y + k) % 5 == 0), y, C_LIGHT);
                px(cx + 7 - ((y + k) % 5 == 0), y, C_LIGHT);
            }
        if (t >= 56 && t < 100 && ((t - 56) / 8) % 2 == 0) {
            text_c(cx + 1, 71, "READY", C_NAVY2, 2);
            text_c(cx, 70, "READY", C_WHITE, 2);
        }
        if (t >= 56) text_c(cx, 160, gname[game_sel], C_CYAN, 1);
        if (k < 3) /* impact flash */
            for (int i = 0; i < LW * LH; i++) {
                uint32_t c = FB[i];
                int r = (c >> 16) & 255, g = (c >> 8) & 255, b = c & 255, a = k == 0 ? 3 : k == 1 ? 2 : 1;
                r += (255 - r) * a / 4; g += (255 - g) * a / 4; b += (255 - b) * a / 4;
                FB[i] = (uint32_t)((r << 16) | (g << 8) | b);
            }
    }
}

void lc_render(uint32_t *fb) {
    FB = fb;
    if (state == ST_TELE) { draw_tele(); return; }
    if (state == ST_AWAY) {
        draw_background(0);
        text_c(LW / 2, 96, "GAME RUNNING", C_LIGHT, 1);
        return;
    }
    draw_background(1);
    draw_title();
    draw_close();
    draw_bar();
    for (int i = 0; i < NP; i++) draw_panel(i);
    draw_footer();
    if (state == ST_KEYS) draw_keys_overlay();
    if (state == ST_INFO) draw_info_overlay();
}

/* ================================================================ audio */
static float mfreq(int m) { return 440.0f * powf(2.0f, (m - 69) / 12.0f); }

/* original 8-bar loop, E minor, 16th-note steps. 0 = hold, -1 = rest */
static const signed char lead[128] = {
    76, 0, 0, 74, 76, 0, 79, 0, 78, 0, 76, 0, 74, 0, 71, 0,
    72, 0, 0, 0, 71, 72, 74, 0, 76, 0, 0, 0, 72, 0, 0, -1,
    74, 0, 0, 72, 74, 0, 78, 0, 81, 0, 79, 0, 78, 0, 74, 0,
    75, 0, 0, 0, 78, 0, 0, 0, 71, 0, 75, 0, 78, 0, 83, 0,
    79, 0, 78, 0, 76, 0, 74, 0, 76, 0, 0, 0, 71, 0, 74, 0,
    72, 0, 74, 0, 76, 0, 79, 0, 76, 0, 74, 0, 72, 0, 71, 0,
    74, 0, 0, 0, 78, 0, 81, 0, 86, 0, 0, 0, 81, 0, 78, 0,
    83, 0, 0, 0, 0, 0, 78, 0, 75, 0, 71, 0, 66, 0, 71, -1,
};
static const signed char chord_root[4] = {40, 36, 38, 35};
static const signed char chord_arp[4][4] = {{64, 67, 71, 76}, {60, 64, 67, 72}, {62, 66, 69, 74}, {59, 63, 66, 71}};
static const char drums[17] = "K.h.S.h.K.KhS.hh";

typedef struct { float f0, f1, dur, duty, vol; int noise; } Seg;
static const Seg sfx_cursor[] = {{1568, 1568, .03f, .5f, .22f, 0}, {2093, 2093, .04f, .5f, .18f, 0}, {0}};
static const Seg sfx_select[] = {{659, 659, .045f, .25f, .24f, 0}, {831, 831, .045f, .25f, .24f, 0},
                                 {988, 988, .045f, .25f, .24f, 0}, {1319, 1319, .09f, .25f, .24f, 0}, {0}};
static const Seg sfx_back[] = {{1319, 1319, .04f, .5f, .2f, 0}, {880, 880, .06f, .5f, .2f, 0}, {0}};
static const Seg sfx_toggle[] = {{1047, 1047, .03f, .25f, .22f, 0}, {1568, 1568, .05f, .25f, .22f, 0}, {0}};
static const Seg sfx_beam[] = {{2400, 180, .42f, .5f, .22f, 0}, {0}};
static const Seg sfx_land[] = {{0, 0, .09f, 0, .32f, 1}, {300, 90, .14f, .5f, .22f, 0}, {0}};
static const Seg sfx_error[] = {{110, 110, .22f, .5f, .22f, 0}, {0}};
static Seg sfx_vol[2];

static const Seg *cur_sfx;
static int sfx_seg;
static float sfx_t, sfx_ph;

static uint32_t rng = 0x12345;
static float noise(void) { rng = rng * 1664525u + 1013904223u; return (rng >> 16 & 1) ? 1.0f : -1.0f; }

static struct {
    long pos;
    float lead_ph, lead_t, lead_f; int lead_on;
    float arp_ph, arp_t, arp_f;
    float bass_ph, bass_f; int bass_on;
    float kick_t, snare_t, hat_t, kick_ph, snare_ph;
    float lp, fade;
} M = {.kick_t = 9, .snare_t = 9, .hat_t = 9};

#define STEP_SAMPLES 4725  /* 140 BPM sixteenths */

static void music_step(int step) {
    int s = step & 127, bar = (s >> 4) & 3, in = s & 15;
    int n = lead[s];
    if (n > 0) { M.lead_f = mfreq(n); M.lead_t = 0; M.lead_on = 1; }
    else if (n < 0) M.lead_on = 0;
    M.arp_f = mfreq(chord_arp[bar][in & 3] + ((in & 4) ? 12 : 0)); M.arp_t = 0;
    if ((in & 1) == 0) { M.bass_f = mfreq(chord_root[bar] + ((in & 2) ? 12 : 0)); M.bass_on = 1; }
    char d = drums[in];
    if (d == 'K') { M.kick_t = 0; M.kick_ph = 0; }
    if (d == 'S') M.snare_t = 0;
    if (d == 'h' || d == 'K') M.hat_t = 0;
}

void lc_audio(int16_t *out, int n) {
    const float dt = 1.0f / LRATE;
    int req = sfx_req;
    if (req >= 0) {
        sfx_req = -1;
        switch (req) {
        case SFX_CURSOR: cur_sfx = sfx_cursor; break;
        case SFX_SELECT: cur_sfx = sfx_select; break;
        case SFX_BACK: cur_sfx = sfx_back; break;
        case SFX_TOGGLE: cur_sfx = sfx_toggle; break;
        case SFX_BEAM: cur_sfx = sfx_beam; break;
        case SFX_LAND: cur_sfx = sfx_land; break;
        case SFX_ERROR: cur_sfx = sfx_error; break;
        case SFX_VOL: {
            float f = 330.0f * powf(2.0f, sfx_param / 10.0f);
            sfx_vol[0] = (Seg){f, f, .045f, .5f, .2f, 0};
            sfx_vol[1] = (Seg){0};
            cur_sfx = sfx_vol;
            break;
        }
        }
        sfx_seg = 0; sfx_t = 0;
    }
    float master = (S ? S->volume : 20) / (float)VOL_MAX;
    master = master * master * 1.3f;  /* perceptual curve */
    int live = music_live;
    for (int i = 0; i < n; i++) {
        float m = 0;
        /* music fades in/out smoothly when toggled */
        M.fade += ((live ? 1.0f : 0.0f) - M.fade) * 0.0004f;
        if (M.fade > 0.001f || live) {
            if (M.pos % STEP_SAMPLES == 0) music_step((int)(M.pos / STEP_SAMPLES));
            M.pos++;
            /* lead: 25% pulse with delayed vibrato */
            if (M.lead_on) {
                float vib = M.lead_t > 0.18f ? 1.0f + 0.006f * sinf(6.2832f * 5.5f * M.lead_t) : 1.0f;
                M.lead_ph += M.lead_f * vib * dt; M.lead_ph -= (int)M.lead_ph;
                float env = 0.55f + 0.45f * expf(-M.lead_t * 6.0f);
                m += (M.lead_ph < 0.25f ? 1.0f : -1.0f) * 0.12f * env;
                M.lead_t += dt;
            }
            /* arpeggio: thin 12.5% pulse, plucky */
            M.arp_ph += M.arp_f * dt; M.arp_ph -= (int)M.arp_ph;
            m += (M.arp_ph < 0.125f ? 1.0f : -1.0f) * 0.045f * expf(-M.arp_t * 16.0f);
            M.arp_t += dt;
            /* bass: triangle, gated */
            if (M.bass_on && (M.pos % (2 * STEP_SAMPLES)) < (long)(STEP_SAMPLES * 1.7)) {
                M.bass_ph += M.bass_f * dt; M.bass_ph -= (int)M.bass_ph;
                float tri = 4.0f * fabsf(M.bass_ph - 0.5f) - 1.0f;
                tri = floorf(tri * 8.0f) / 8.0f;  /* 4-bit stair-step like the real chip */
                m += tri * 0.2f;
            }
            /* drums */
            if (M.kick_t < 0.15f) {
                float f = 50.0f + 120.0f * expf(-M.kick_t * 35.0f);
                M.kick_ph += f * dt; M.kick_ph -= (int)M.kick_ph;
                m += (4.0f * fabsf(M.kick_ph - 0.5f) - 1.0f) * 0.34f * expf(-M.kick_t * 14.0f);
                M.kick_t += dt;
            }
            if (M.snare_t < 0.2f) {
                M.snare_ph += 190.0f * dt; M.snare_ph -= (int)M.snare_ph;
                m += noise() * 0.13f * expf(-M.snare_t * 20.0f);
                m += (4.0f * fabsf(M.snare_ph - 0.5f) - 1.0f) * 0.08f * expf(-M.snare_t * 30.0f);
                M.snare_t += dt;
            }
            if (M.hat_t < 0.05f) { m += noise() * 0.045f * expf(-M.hat_t * 90.0f); M.hat_t += dt; }
            m *= M.fade;
        }
        /* sound effects */
        if (cur_sfx && cur_sfx[sfx_seg].dur > 0) {
            const Seg *g = &cur_sfx[sfx_seg];
            float k = sfx_t / g->dur;
            float v = g->vol * (1.0f - 0.35f * k);
            if (g->noise) m += noise() * v * (1.0f - k);
            else {
                float f = g->f0 * powf(g->f1 / g->f0, k);
                sfx_ph += f * dt; sfx_ph -= (int)sfx_ph;
                m += (sfx_ph < g->duty ? 1.0f : -1.0f) * v;
            }
            sfx_t += dt;
            if (sfx_t >= g->dur) { sfx_seg++; sfx_t = 0; }
        }
        M.lp += (m - M.lp) * 0.55f;
        float o = M.lp * master;
        if (o > 1) o = 1;
        if (o < -1) o = -1;
        out[i] = (int16_t)(o * 32000.0f);
    }
}

void lc_error_sound(void) { sfx(SFX_ERROR, 0); }

int lc_selected_game(void) { return game_sel; }
