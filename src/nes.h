/* Runtime shared by the recompiled game code and the reference interpreter. */
#ifndef NES_H
#define NES_H
#include <stdint.h>
#include <stddef.h>

#if defined(__GNUC__)
#define LIKELY(x) __builtin_expect(!!(x), 1)
#define UNLIKELY(x) __builtin_expect(!!(x), 0)
#else
#define LIKELY(x) (x)
#define UNLIKELY(x) (x)
#endif

/* ---- CPU state ---- */
extern uint8_t A, X, Y, S;
extern uint8_t fC, fZ, fN, fV, fI, fD; /* fZ: zero flag set when fZ==0; fN: bit7 */
extern uint16_t PC;
extern uint64_t cycles;      /* CPU cycles since power on */
extern uint64_t next_event;  /* service() must run when cycles >= next_event */
extern int nest_depth;
extern uint8_t nest_s[64];
extern int cpu_jammed;

/* ---- memory ---- */
extern uint8_t ram[0x800];
extern uint8_t wram[0x2000];
extern const uint8_t *prg;   /* 128 KB PRG ROM */
extern int prg_banks;        /* 16 KB units */
extern int prg_banks8;           /* 8 KB units */
extern int prg_map[4];           /* 8 KB bank mapped in slot $8000/$A000/$C000/$E000 */
extern const uint8_t *prg_slot[4];
extern int mapper;               /* iNES mapper number: 2 UxROM, 1 MMC1, 4 MMC3 */

uint8_t io_read(uint16_t a);
void io_write(uint16_t a, uint8_t v);
void mapper_write(uint16_t a, uint8_t v);

static inline uint8_t rd(uint16_t a) {
    if (a < 0x2000) return ram[a & 0x7FF];
    if (a >= 0x8000) return prg_slot[(a >> 13) & 3][a & 0x1FFF];
    return io_read(a);
}
static inline void wr(uint16_t a, uint8_t v) {
    if (a < 0x2000) { ram[a & 0x7FF] = v; return; }
    if (a >= 0x8000) { mapper_write(a, v); return; }
    io_write(a, v);
}

#define SETNZ(v) (fZ = fN = (uint8_t)(v))
#define PUSH(v) (ram[0x100 | S--] = (uint8_t)(v))
#define PULL() (ram[0x100 | ++S])
#define PUSH16(v) do { uint16_t v_ = (v); PUSH(v_ >> 8); PUSH(v_ & 0xFF); } while (0)
#define PULL16() pull16()
/* after CLI / PLP / RTI: let service() look for a pending IRQ right away */
#define IRQCHK() do { if (!fI) next_event = 0; } while (0)
static inline uint16_t pull16(void) { uint16_t lo = PULL(); return (uint16_t)(lo | (PULL() << 8)); }

static inline uint8_t getP(int b) {
    return (uint8_t)((fN & 0x80) | (fV ? 0x40 : 0) | 0x20 | (b ? 0x10 : 0) |
                     (fD ? 8 : 0) | (fI ? 4 : 0) | (fZ == 0 ? 2 : 0) | (fC ? 1 : 0));
}
static inline void setP(uint8_t p) {
    fN = p & 0x80; fV = (p >> 6) & 1; fD = (p >> 3) & 1; fI = (p >> 2) & 1;
    fZ = (p & 2) ? 0 : 1; fC = p & 1;
}
static inline void op_adc(uint8_t m) {
    unsigned r = A + m + fC;
    fV = ((~(A ^ m) & (A ^ r) & 0x80) != 0);
    fC = (uint8_t)(r >> 8);
    A = (uint8_t)r; SETNZ(A);
}
static inline void op_cmp(uint8_t reg, uint8_t m) {
    fC = reg >= m; SETNZ((uint8_t)(reg - m));
}

/* ---- execution ---- */
typedef int (*exec_fn)(void);
extern exec_fn g_exec;       /* runs from PC; returns 1 when RTI unwinds nest */
int service(void);           /* returns 1 if an interrupt was taken (PC changed) */
int interp_step(void);       /* one instruction; 1 = nested RTI exit */
int interp_run(void);
void nes_power(const uint8_t *prg_data, int nbanks16, const uint8_t *chr_data, int chr_size, int vertical_mirror, int mapper_no);
void nes_reset_cpu(void);

/* ---- PPU ---- */
extern uint8_t framebuffer[240][256];  /* palette indices 0..63 (bit 6 = grayscale unused) */
extern uint32_t frame_count;

/* ---- input ---- */
extern uint8_t pad_state[2];  /* bit0 A,1 B,2 Select,3 Start,4 Up,5 Down,6 Left,7 Right */

/* ---- audio ---- */
#define AUDIO_RATE 44100
int audio_take(int16_t *dst, int max);  /* drains generated samples */

/* ---- host callbacks ---- */
void host_frame(void);   /* called once per frame at start of vblank */

/* ---- statistics ---- */
extern uint64_t stat_interp_insns;  /* instructions run by fallback interpreter */
extern int stat_max_nest;
extern uint8_t *cov_map;
extern int opt_extra_lines;      /* boost: CPU-only scanlines added after line 240 */
extern int opt_no_sprite_limit;  /* boost: no 8-sprites-per-line limit */
extern void (*nmi_hook)(uint16_t pc);  /* optional: marks executed PRG addresses (interpreter only) */
#endif
