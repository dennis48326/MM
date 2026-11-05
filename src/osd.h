/* On-screen display: small pixel-art message box drawn over the game picture. */
#ifndef OSD_H
#define OSD_H
#include <stdint.h>
/* show a message for `frames` frames (60 = one second); l2 may be NULL */
void osd_show(const char *l1, const char *l2, uint32_t color1, int frames);
void osd_tick(void);                          /* once per displayed frame */
void osd_draw(uint32_t *px, int w, int h);    /* 0x00RRGGBB pixels */
#endif
