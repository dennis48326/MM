/* C entry point for the xBRZ upscaler (third_party/xbrz, GPLv3). */
#include "../third_party/xbrz/xbrz.h"
extern "C" void xbrz_scale_rgb(int factor, const uint32_t *src, uint32_t *dst, int w, int h, int y0, int y1) {
    xbrz::scale((size_t)factor, src, dst, w, h, xbrz::ColorFormat::RGB, xbrz::ScalerCfg(), y0, y1);
}
