/* Upscaling filters: CRT television look and xBRZ. Platform independent; the
   front end renders the picture straight into a window-sized buffer. */
#ifndef FILTERS_H
#define FILTERS_H
#include <stdint.h>

enum { FILTER_OFF, FILTER_CRT, FILTER_XBRZ, FILTER_COUNT };

typedef void (*filter_job_fn)(void *ctx, int job);
typedef void (*filter_parallel_fn)(filter_job_fn fn, void *ctx, int njobs);   /* run jobs 0..n-1, return when done */
void filter_set_parallel(filter_parallel_fn p);

const char *filter_name(int mode);
/* src: sw x sh pixels 0x00RRGGBB; dst: dw x dh. Returns 0 if mode is OFF (nothing drawn). */
int filter_render(int mode, const uint32_t *src, int sw, int sh, uint32_t *dst, int dw, int dh);
#endif
