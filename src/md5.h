#ifndef MD5_H
#define MD5_H
#include <stdint.h>
#include <stddef.h>
void md5(const uint8_t *data, size_t len, uint8_t out[16]);
void md5_hex(const uint8_t *data, size_t len, char out[33]);
#endif
