/* headless check: dump frames and audio */
#include "core.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static uint32_t fb[LW * LH];
static void dump(const char *p) {
    FILE *f = fopen(p, "wb"); fprintf(f, "P6 %d %d 255\n", LW, LH);
    for (int i = 0; i < LW * LH; i++) { fputc(fb[i] >> 16, f); fputc((fb[i] >> 8) & 255, f); fputc(fb[i] & 255, f); }
    fclose(f);
}
int main(int argc, char **argv) {
    LSettings s = {0, 3, 20, 1, 2, 1};
    lc_info_lines[0] = "MEGA MAN"; lc_info_lines[1] = "  9999 OPS RECOMPILED  UXROM"; lc_info_lines[3] = "MEGA MAN 2"; lc_info_lines[4] = "  XXXX OPS RECOMPILED  MMC1"; lc_info_lines[6] = "FRAME-EXACT VS REFERENCE CPU";
    lc_init(&s);
    /* script: frame -> event */
    struct { int f, ev; } sc[] = {{60, EV_RIGHT}, {100, EV_DOWN}, {140, EV_LEFT}, {150, EV_LEFT}, {170, EV_OK},
                                  {200, EV_OK}, {260, EV_RIGHT}, {280, EV_RIGHT}, {290, EV_RIGHT}, {300, EV_RIGHT}, {310, EV_OK}, {380, EV_OK},
                                  {420, EV_UP}, {430, EV_RIGHT}, {500, EV_OK}};
    int shots[] = {50, 120, 165, 190, 240, 330, 450, 590, 0};
    FILE *wav = fopen("out.raw", "wb");
    int si = 0, ni = 0;
    for (int f = 0; f < 640; f++) {
        for (int k = 0; k < (int)(sizeof sc / sizeof sc[0]); k++) if (sc[k].f == f) lc_event(sc[k].ev);
        int a = lc_update();
        if (a == ACT_LAUNCH) { printf("launch at %d\n", f); }
        lc_render(fb);
        int16_t au[735]; lc_audio(au, 735); fwrite(au, 2, 735, wav);
        if (shots[si] == f) { char p[64]; snprintf(p, 64, "shot_%03d.ppm", f); dump(p); si++; }
        (void)ni;
    }
    /* longer music render */
    lc_returned(1);
    for (int f = 0; f < 60 * 20; f++) { lc_update(); int16_t au[735]; lc_audio(au, 735); fwrite(au, 2, 735, wav); }
    fclose(wav);
    return 0;
}
