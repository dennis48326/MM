/* Platform-independent launcher: renders into a 256x200 RGB buffer and
   synthesizes its own chiptune audio. */
#ifndef LAUNCHER_CORE_H
#define LAUNCHER_CORE_H
#include <stdint.h>

#define LW 320
#define LH 200
#define LRATE 44100
#define VOL_MAX 26

typedef struct {
    int fullscreen;  /* 0/1 */
    int scale;       /* 2..4 */
    int volume;      /* 0..VOL_MAX */
    int music;       /* 0/1 */
    int last_game;   /* 0..5 = Mega Man 1..6 */
    int boost;       /* 1 = no slowdown / no flicker, 0 = original */
} LSettings;

enum { EV_LEFT, EV_RIGHT, EV_UP, EV_DOWN, EV_OK, EV_BACK, EV_VOL_UP, EV_VOL_DOWN };
enum { ACT_NONE, ACT_LAUNCH, ACT_QUIT, ACT_SAVE };

void lc_init(LSettings *s);
void lc_event(int ev);
void lc_mouse_move(int x, int y);          /* internal coordinates */
void lc_mouse_click(int x, int y);
void lc_wheel(int dir);
int  lc_is_interactive(int x, int y);     /* for window dragging */
int  lc_update(void);                     /* once per 1/60 s; returns ACT_* */
void lc_render(uint32_t *fb);             /* 0x00RRGGBB, LW*LH */
void lc_audio(int16_t *out, int n);       /* audio thread */
void lc_returned(int ok);                 /* game exited / failed to start */
void lc_message(const char *msg);
void lc_error_sound(void);
int  lc_selected_game(void);
void lc_set_available(int mask);   /* bit n set: ROM for game n+1 found */
extern const char *lc_info_lines[8];
#endif
