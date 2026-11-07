/* Headless test host: CPU test ROMs, scripted game runs with per-frame
   hashes, screenshots (PPM) and code-coverage capture. */
#include "nes.h"
#include <stdio.h>
#include "palette.h"
#include "jukebox.h"
#include "filters.h"
#include <time.h>
#include <math.h>
extern const WideProvider wide_mm1, wide_mm2, wide_mm3, wide_mm4, wide_mm5, wide_mm6;
static const WideProvider *provs[7] = {0, &wide_mm1, &wide_mm2, &wide_mm3, &wide_mm4, &wide_mm5, &wide_mm6};
extern uint32_t wide_stat_level, wide_stat_active;
static int prov_no = 2; static FILE *wlog; extern int wide_last_pct;
extern int hud_seen;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef RECOMP
int rc_exec(void);
#endif

static uint8_t *rom; static long romsz;
static int mode;            /* 0 game, 1 blargg */
static uint32_t max_frames;
static FILE *hashlog;
static const char *shot_prefix;
static uint32_t shot_every;
static const char *cov_path;
static struct { uint32_t start, dur; uint8_t mask; } inputs[4096];
static int ninputs;
static FILE *audio_out;
static FILE *nmi_log, *ppu_log, *ram_log;
static void log_ppu(uint16_t reg, uint8_t v, uint16_t va) { fprintf(ppu_log, "%u %04X %04X %02X %04X\n", frame_count, PC, reg, v, va); }
static void log_nmi(uint16_t pc) { if (nmi_log) fwrite(&pc, 2, 1, nmi_log); }
extern void (*exec_hook)(uint16_t pc);
static int snd_bank = -1, snd_req; static FILE *snd_log;
static void log_snd(uint16_t pc) { if (pc == snd_req && prg_map[(pc >> 13) & 3] == snd_bank) fprintf(snd_log, "%u %02X\n", frame_count, A); }
static int juke_nomix;
static uint8_t *juke_rom; static long juke_size; static int juke_id = -1;
static FILE *hudlog;
static int npokes; static uint16_t poke_a[16]; static uint8_t poke_v[16];

static void load(const char *p) {
    FILE *f = fopen(p, "rb");
    if (!f) { perror(p); exit(1); }
    fseek(f, 0, SEEK_END); romsz = ftell(f); fseek(f, 0, SEEK_SET);
    rom = malloc(romsz);
    if (fread(rom, 1, romsz, f) != (size_t)romsz) exit(1);
    fclose(f);
}

static void shot(const char *path) {
    FILE *f = fopen(path, "wb");
    int e = wide_ext;
    fprintf(f, "P6 %d 240 255\n", 256 + 2 * e);
    for (int y = 0; y < 240; y++)
        for (int x = -e; x < 256 + e; x++) {
            uint8_t ci = x < 0 ? wide_left[y][x + e] : x >= 256 ? wide_right[y][x - 256] : framebuffer[y][x];
            uint32_t c = nes_palette[ci & 63];
            fputc(c >> 16, f); fputc((c >> 8) & 255, f); fputc(c & 255, f);
        }
    fclose(f);
}

static uint64_t fnv(const uint8_t *d, size_t n, uint64_t h) {
    for (size_t i = 0; i < n; i++) { h ^= d[i]; h *= 0x100000001b3ULL; }
    return h;
}

static void finish(void) {
    if (cov_path && cov_map) {
        FILE *f = fopen(cov_path, "wb");
        fwrite(cov_map, 1, (size_t)4 * prg_banks8 * 0x2000, f);
        fclose(f);
    }
    if (hashlog) fclose(hashlog);
    if (snd_log) fclose(snd_log);
    if (wlog) fclose(wlog);
    if (audio_out) fclose(audio_out);
    if (nmi_log) fclose(nmi_log);
    if (ppu_log) fclose(ppu_log);
    if (ram_log) fclose(ram_log);
    if (wide_ext) fprintf(stderr, "wide level=%u active=%u\n", wide_stat_level, wide_stat_active);
    if (hud_move) fprintf(stderr, "hud_seen=%d\n", hud_seen);
    fprintf(stderr, "frames=%u interp_insns=%llu max_nest=%d jammed=%d\n", frame_count,
            (unsigned long long)stat_interp_insns, stat_max_nest, cpu_jammed);
    exit(0);
}

void host_frame(void) {
    if (mode == 1) {
        if (wram[1] == 0xDE && wram[2] == 0xB0 && wram[3] == 0x61 && wram[0] < 0x80) {
            printf("result=%d\n%s\n", wram[0], (char *)wram + 4);
            exit(wram[0]);
        }
        if (frame_count > 60 * 60) { printf("timeout\n%s\n", (char *)wram + 4); exit(99); }
        return;
    }
    uint32_t fr = frame_count;
    if (hudlog) { fprintf(hudlog, "%u %d\n", fr, hud_seen); hud_seen = 0; }
    if (wlog) fprintf(wlog, "%u %d\n", fr, wide_last_pct);
    if (ram_log) fwrite(ram, 1, sizeof ram, ram_log);
    if (hashlog) {
        uint64_t h = fnv(ram, sizeof ram, 1469598103934665603ULL);
        uint64_t h2 = fnv(&framebuffer[0][0], sizeof framebuffer, 1469598103934665603ULL);
        fprintf(hashlog, "%u %016llx %016llx\n", fr, (unsigned long long)h, (unsigned long long)h2);
    }
    if (shot_prefix && shot_every && fr % shot_every == 0) {
        char p[512]; snprintf(p, sizeof p, "%s%06u.ppm", shot_prefix, fr); shot(p);
    }
    if (juke_id >= 0) { apu_gate = jukebox_apu_gate(); jukebox_frame(); }
    if (audio_out) {
        int16_t buf[4096], mb[4096]; int n = audio_take(buf, 4096);
        if (juke_id >= 0) {
            int m = jukebox_take(mb, 4096);
            if (juke_nomix) m = 0;
            for (int k = 0; k < n; k++) { int v = buf[k] + (k < m ? mb[k] : 0); buf[k] = (int16_t)(v > 32767 ? 32767 : v < -32768 ? -32768 : v); }
        }
        fwrite(buf, 2, n, audio_out);
    } else { int16_t buf[4096]; audio_take(buf, 4096); if (juke_id >= 0) jukebox_take(buf, 4096); }
    uint8_t m = 0;
    for (int i = 0; i < ninputs; i++)
        if (fr >= inputs[i].start && fr < inputs[i].start + inputs[i].dur) m |= inputs[i].mask;
    pad_state[0] = m;
    for (int i = 0; i < npokes; i++) ram[poke_a[i] & 0x7FF] = poke_v[i];
    if (fr >= max_frames) finish();
}

static uint8_t parse_buttons(const char *s) {
    uint8_t m = 0;
    for (; *s; s++) switch (*s) {
        case 'A': m |= 1; break; case 'B': m |= 2; break; case 's': m |= 4; break;
        case 'S': m |= 8; break; case 'U': m |= 16; break; case 'D': m |= 32; break;
        case 'L': m |= 64; break; case 'R': m |= 128; break;
    }
    return m;
}

int main(int argc, char **argv) {
    if (argc < 3) {
        fprintf(stderr, "usage: %s nestest|blargg|run rom [frames] [opts]\n"
                        "  run opts: -i script -h hashlog -s shotprefix every -c covfile -a audio.raw\n", argv[0]);
        return 1;
    }
    load(argv[2]);
    int nb = rom[4];
    const uint8_t *p = rom + 16 + ((rom[6] & 4) ? 512 : 0);
    nes_power(p, nb, rom[5] ? p + nb * 0x4000 : NULL, rom[5] * 0x2000, rom[6] & 1, (rom[6] >> 4) | (rom[7] & 0xF0));

    if (!strcmp(argv[1], "nestest")) {
        PC = 0xC000; S = 0xFD; setP(0x24); cycles = 7;
        for (int i = 0; i < 8991; i++) {
            printf("%04X A:%02X X:%02X Y:%02X P:%02X SP:%02X CYC:%llu\n", PC, A, X, Y, getP(0), S,
                   (unsigned long long)cycles);
            interp_step();
        }
        printf("result %02X %02X\n", ram[2], ram[3]);
        return 0;
    }
    if (!strcmp(argv[1], "filter")) {
        /* filter ROM in.ppm mode(0-2) dw dh out.ppm : run an upscaling filter on a screenshot */
        FILE *f = fopen(argv[3], "rb"); int w, h, mx; fscanf(f, "P6 %d %d %d", &w, &h, &mx); fgetc(f);
        uint32_t *src = malloc((size_t)w * h * 4);
        for (int i = 0; i < w * h; i++) { int r = fgetc(f), g = fgetc(f), b = fgetc(f); src[i] = (uint32_t)(r << 16 | g << 8 | b); }
        fclose(f);
        int mode = atoi(argv[4]), dw = atoi(argv[5]), dh = atoi(argv[6]);
        uint32_t *dst = malloc((size_t)dw * dh * 4);
        clock_t t0 = clock();
        for (int k = 0; k < 10; k++) filter_render(mode, src, w, h, dst, dw, dh);
        printf("%.2f ms per frame (1 thread)\n", (double)(clock() - t0) * 1000.0 / CLOCKS_PER_SEC / 10);
        FILE *o = fopen(argv[7], "wb"); fprintf(o, "P6 %d %d 255\n", dw, dh);
        for (int i = 0; i < dw * dh; i++) { fputc(dst[i] >> 16, o); fputc((dst[i] >> 8) & 255, o); fputc(dst[i] & 255, o); }
        fclose(o);
        return 0;
    }
    if (!strcmp(argv[1], "musicscan")) {
        /* render every jukebox track of this ROM for N seconds; print loudness per 2 s */
        int secs = argc > 3 ? atoi(argv[3]) : 40;
        int g = jukebox_add_rom(rom, romsz);
        if (g < 0) { printf("unknown ROM\n"); return 1; }
        for (int i = 1; i < jukebox_count(); i++) {
            int gg, id; jukebox_entry(i, &gg, &id);
            jukebox_select(i);
            printf("%02X", id);
            double acc = 0; long cnt = 0; int16_t buf[4096];
            for (int f = 0; f < secs * 60; f++) {
                jukebox_frame();
                int n = jukebox_take(buf, 4096);
                for (int k = 0; k < n; k++) { acc += (double)buf[k] * buf[k]; cnt++; }
                if (f % 120 == 119) { printf(" %d", cnt ? (int)sqrt(acc / cnt) : 0); acc = 0; cnt = 0; }
            }
            printf("\n");
        }
        return 0;
    }
    if (!strcmp(argv[1], "music")) {
        /* music ROM id seconds out.raw : render one jukebox track */
        int g = jukebox_add_rom(rom, romsz), id = (int)strtol(argv[3], 0, 16), secs = atoi(argv[4]);
        FILE *o = fopen(argv[5], "wb");
        jukebox_select(jukebox_find(g, id));
        int16_t buf[4096];
        for (int f = 0; f < secs * 60; f++) { jukebox_frame(); int n = jukebox_take(buf, 4096); fwrite(buf, 2, n, o); }
        fclose(o);
        return 0;
    }
    if (!strcmp(argv[1], "blargg")) {
        mode = 1;
#ifdef RECOMP
        g_exec = rc_exec;
#endif
        g_exec();
        return 0;
    }
    max_frames = argc > 3 ? (uint32_t)atoi(argv[3]) : 600;
    for (int i = 4; i < argc; i++) {
        if (!strcmp(argv[i], "-i")) {
            FILE *f = fopen(argv[++i], "r");
            char b[64]; unsigned s, d;
            while (f && fscanf(f, "%u %u %63s", &s, &d, b) == 3 && ninputs < 4096) {
                inputs[ninputs].start = s; inputs[ninputs].dur = d; inputs[ninputs].mask = parse_buttons(b); ninputs++;
            }
            if (f) fclose(f);
        } else if (!strcmp(argv[i], "-h")) hashlog = fopen(argv[++i], "w");
        else if (!strcmp(argv[i], "-s")) { shot_prefix = argv[++i]; shot_every = (uint32_t)atoi(argv[++i]); }
        else if (!strcmp(argv[i], "-c")) { cov_path = argv[++i]; cov_map = calloc((size_t)4 * nb * 2, 0x2000); }
        else if (!strcmp(argv[i], "-a")) audio_out = fopen(argv[++i], "wb");
        else if (!strcmp(argv[i], "--extra")) opt_extra_lines = atoi(argv[++i]);
        else if (!strcmp(argv[i], "--nolimit")) opt_no_sprite_limit = 1;
        else if (!strcmp(argv[i], "--wide")) { wide_ext = atoi(argv[++i]); }
        else if (!strcmp(argv[i], "--sndlog")) { unsigned b_, r_; sscanf(argv[++i], "%x:%x", &b_, &r_); snd_bank = (int)b_; snd_req = (int)r_; snd_log = fopen(argv[++i], "w"); exec_hook = log_snd; }
        else if (!strcmp(argv[i], "--jukenomix")) juke_nomix = 1;
        else if (!strcmp(argv[i], "--juke")) {   /* --juke other.nes trackid(hex): jukebox mod */
            FILE *jf = fopen(argv[++i], "rb"); fseek(jf, 0, SEEK_END); juke_size = ftell(jf); fseek(jf, 0, SEEK_SET);
            juke_rom = malloc(juke_size); fread(juke_rom, 1, juke_size, jf); fclose(jf);
            juke_id = (int)strtol(argv[++i], 0, 16);
            jukebox_add_rom(rom, romsz);
            jukebox_add_rom(juke_rom, juke_size);
            int jg = jukebox_identify(juke_rom, juke_size);
            jukebox_set_host(jukebox_identify(rom, romsz));
            jukebox_select(jukebox_find(jg, juke_id));
        }
        else if (!strcmp(argv[i], "--wlog")) wlog = fopen(argv[++i], "w");
        else if (!strcmp(argv[i], "--prov")) prov_no = atoi(argv[++i]);
        else if (!strcmp(argv[i], "--hud")) hud_move = 1;
        else if (!strcmp(argv[i], "--hudlog")) { hud_move = 1; hudlog = fopen(argv[++i], "w"); }
        else if (!strcmp(argv[i], "-w")) { ppu_log = fopen(argv[++i], "w"); ppu_write_hook = log_ppu; }
        else if (!strcmp(argv[i], "-r")) ram_log = fopen(argv[++i], "wb");
        else if (!strcmp(argv[i], "-n")) { nmi_log = fopen(argv[++i], "wb"); nmi_hook = log_nmi; }
        else if (!strcmp(argv[i], "-p") && npokes < 16) {
            unsigned a_, v_; sscanf(argv[++i], "%x=%x", &a_, &v_); poke_a[npokes] = (uint16_t)a_; poke_v[npokes++] = (uint8_t)v_;
        }
    }
    if (wide_ext) wide_prov = provs[prov_no];
#ifdef RECOMP
    g_exec = rc_exec;
#endif
    g_exec();
    finish();
    return 0;
}
