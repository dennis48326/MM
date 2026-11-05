"""Static recompiler: 6502 NES game -> C.

usage: recomp.py rom.nes outdir [coverage.bin ...]

PRG ROM is handled in 8 KB banks. A *region* is one 8 KB bank as seen in one
CPU slot ($8000, $A000, $C000 or $E000); code is position dependent, so the same
bank in two slots would be two regions. Each region becomes one C function whose
instructions are labels. At run time the dispatcher looks up the region for the
bank actually mapped in the slot of PC, so mapper behaviour is always honoured.

Code is discovered by recursive descent from the vectors plus every address the
reference interpreter executed in the coverage runs. Mapper-specific guesses
about which bank sits in another slot are used for discovery only; an unknown
entry point falls back to the interpreter, so gaps cost speed, never correctness.
"""
import sys
import os
from m6502 import OPS, MODES, BRANCH, body, disasm, store_may_hit_rom

rom = open(sys.argv[1], 'rb').read()
outdir = sys.argv[2]
covfiles = sys.argv[3:]
NB16 = rom[4]
NB8 = NB16 * 2
MAPPER = (rom[6] >> 4) | (rom[7] & 0xF0)
trainer = 512 if rom[6] & 4 else 0
PRG = rom[16 + trainer:16 + trainer + NB16 * 0x4000]
LAST = NB8 - 1


def slot_of(a):
    return (a - 0x8000) >> 13 if a >= 0x8000 else None


def base(r):
    return 0x8000 + r[0] * 0x2000


def assume(cur, t):
    """Region that static target t probably lands in, from code in region cur."""
    ts = slot_of(t)
    if ts is None:
        return None
    cs, cb = cur
    if ts == cs:
        return (ts, cb)
    if MAPPER in (1, 2):
        if ts >= 2:
            return (ts, NB8 - 4 + ts)          # last 16 KB fixed at $C000
        if cs < 2:
            return (ts, (cb & ~1) | ts)        # 16 KB switchable pair
        return None
    if MAPPER == 4:
        if ts == 3:
            return (3, LAST)
        if ts == 2:
            return (2, LAST - 1)               # PRG mode 0
        return None
    return None


def rbyte(r, a):
    return PRG[r[1] * 0x2000 + (a & 0x1FFF)]


def next_slot_bank(r):
    """Bank guaranteed to follow region r in the next slot, or None."""
    s, b = r
    if MAPPER in (1, 2) and s in (0, 2):
        return b + 1                  # 16 KB banks are always mapped as aligned pairs
    if MAPPER == 4 and s == 2:
        return LAST                   # $E000 is hardwired to the last bank
    return None


def decode(r, a):
    op = rbyte(r, a)
    m, mode, cyc = OPS[op]
    n = MODES[mode]
    if (a & 0x1FFF) + n + 1 > 0x2000:
        nb = next_slot_bank(r)
        if nb is None:
            return None   # would straddle two independent slots: leave to the interpreter
        bs = [PRG[(nb if ((a + i) & 0x1FFF) < (a & 0x1FFF) else r[1]) * 0x2000 + ((a + i) & 0x1FFF)]
              for i in range(1, n + 1)]
        operand = bs[0] if n == 1 else (bs[0] | (bs[1] << 8)) if n == 2 else None
        return op, operand, n + 1
    bs = [rbyte(r, a + i) for i in range(1, n + 1)]
    operand = bs[0] if n == 1 else (bs[0] | (bs[1] << 8)) if n == 2 else None
    return op, operand, n + 1


insns = {}       # (region, addr) -> (op, operand, length)
work = []


def seed(r, a):
    if r is None or slot_of(a) != r[0]:
        return
    work.append((r, a))


def vec(a):
    return PRG[LAST * 0x2000 + (a & 0x1FFF)] | (PRG[LAST * 0x2000 + ((a + 1) & 0x1FFF)] << 8)


VEC_REGION = (3, LAST)
vectors = {}
for nm, v in (('nmi', 0xFFFA), ('irq', 0xFFFE), ('reset', 0xFFFC)):
    t = vec(v)
    vectors[nm] = (assume(VEC_REGION, t), t)
    seed(*vectors[nm])

covered = set()
for cf in covfiles:
    d = open(cf, 'rb').read()
    for s in range(4):
        for b in range(NB8):
            off = (s * NB8 + b) * 0x2000
            chunk = d[off:off + 0x2000]
            for i, x in enumerate(chunk):
                if x:
                    covered.add(((s, b), 0x8000 + s * 0x2000 + i))
for k in covered:
    seed(*k)

while work:
    r, a = work.pop()
    if (r, a) in insns:
        continue
    d = decode(r, a)
    if d is None:
        continue
    insns[(r, a)] = d
    op, o, ln = d
    m, mode, _ = OPS[op]
    nxt = (a + ln) & 0xFFFF
    if m in BRANCH:
        t = (nxt + (o - 256 if o >= 128 else o)) & 0xFFFF
        seed(assume(r, t), t)
        seed(assume(r, nxt), nxt)
    elif m == 'JMP' and mode == 'abs':
        seed(assume(r, o), o)
    elif m == 'JSR':
        seed(assume(r, o), o)
        seed(assume(r, nxt), nxt)
    elif m in ('JMP', 'RTS', 'RTI', 'BRK', 'KIL'):
        pass
    else:
        seed(assume(r, nxt), nxt)

regions = sorted({r for (r, _) in insns})

# ------------------------------------------------------------------ C output
os.makedirs(outdir, exist_ok=True)


def rname(r):
    return 's%d_b%02X' % r


def lab(r, a):
    return 'L%s_%04X' % (rname(r), a)


def hx(v, w):
    return ('0x%0' + str(w) + 'X') % v


def chk(nxt):
    return 'if (UNLIKELY(cycles >= next_event)) { PC = %s; if (service()) goto dispatch; }' % hx(nxt, 4)


def jump_to(r, t):
    """goto a static target (PC already set): direct only inside this region."""
    if slot_of(t) == r[0] and (r, t) in insns:
        return 'goto %s;' % lab(r, t)
    return 'goto dispatch;'


def emit_region(r):
    keys = sorted(a for (rr, a) in insns if rr == r)
    s, b = r
    L = []
    w = L.append
    name = 'rc_' + rname(r)
    w('int %s(void) {' % name)
    w('    uint16_t ea; (void)ea;')
    w('    static void *const tbl[0x2000] = {')
    for a in keys:
        w('        [0x%04X] = &&%s,' % (a & 0x1FFF, lab(r, a)))
    w('    };')
    w('dispatch:')
    w('    if ((PC >> 13) != %d || prg_map[%d] != %d) return 0;' % (4 + s, s, b))
    w('    { void *t_ = tbl[PC & 0x1FFF]; if (!t_) return 2; goto *t_; }')
    for idx, a in enumerate(keys):
        op, o, ln = insns[(r, a)]
        m, mode, cyc = OPS[op]
        nxt = (a + ln) & 0xFFFF
        w('%s: /* %s */' % (lab(r, a), disasm(op, o, a)))
        if mode in ('imm', 'zp', 'zpx', 'zpy', 'izx', 'izy'):
            O = hx(o, 2)
        elif MODES[mode] == 2:
            O = hx(o, 4)
        else:
            O = None
        if m in BRANCH:
            t = (nxt + (o - 256 if o >= 128 else o)) & 0xFFFF
            pen = 2 if (t ^ nxt) & 0xFF00 else 1
            w('    cycles += 2;')
            w('    if (%s) { cycles += %d; PC = %s; if (UNLIKELY(cycles >= next_event) && service()) goto dispatch; %s }'
              % (BRANCH[m], pen, hx(t, 4), jump_to(r, t)))
            w('    ' + chk(nxt))
        elif m == 'JMP' and mode == 'abs':
            w('    cycles += 3; PC = %s;' % O)
            w('    if (UNLIKELY(cycles >= next_event) && service()) goto dispatch; ' + jump_to(r, o))
            continue
        elif m == 'JMP':
            w('    cycles += 5; PC = rd(%s) | (rd(%s) << 8);' % (O, hx((o & 0xFF00) | ((o + 1) & 0xFF), 4)))
            w('    if (UNLIKELY(cycles >= next_event)) service(); goto dispatch;')
            continue
        elif m == 'JSR':
            w('    cycles += 6; PUSH16(%s); PC = %s;' % (hx((a + 2) & 0xFFFF, 4), O))
            w('    if (UNLIKELY(cycles >= next_event) && service()) goto dispatch; ' + jump_to(r, o))
            continue
        elif m == 'RTS':
            w('    cycles += 6; PC = (uint16_t)(PULL16() + 1);')
            w('    if (UNLIKELY(cycles >= next_event)) service(); goto dispatch;')
            continue
        elif m == 'RTI':
            w('    cycles += 6; setP(PULL()); PC = PULL16(); IRQCHK();')
            w('    if (nest_depth && S == nest_s[nest_depth]) return 1;')
            w('    if (UNLIKELY(cycles >= next_event)) service(); goto dispatch;')
            continue
        elif m == 'BRK':
            w('    cycles += 7; PUSH16(%s); PUSH(getP(1)); fI = 1; PC = rd(0xFFFE) | (rd(0xFFFF) << 8);' % hx((a + 2) & 0xFFFF, 4))
            w('    if (UNLIKELY(cycles >= next_event)) service(); goto dispatch;')
            continue
        elif m == 'KIL':
            w('    PC = %s; return 2;' % hx(a, 4))
            continue
        else:
            w('    cycles += %d; %s' % (cyc, body(op, O)))
            if store_may_hit_rom(op, o):
                w('    if (prg_map[%d] != %d) { PC = %s; if (UNLIKELY(cycles >= next_event)) service(); goto dispatch; }'
                  % (s, b, hx(nxt, 4)))
            w('    ' + chk(nxt))
        follow = keys[idx + 1] if idx + 1 < len(keys) else None
        if follow != nxt:
            if slot_of(nxt) == s and (r, nxt) in insns:
                w('    goto %s;' % lab(r, nxt))
            else:
                w('    PC = %s; goto dispatch;' % hx(nxt, 4))
    w('}')
    return name, '\n'.join(L) + '\n'


HDR = '/* Generated by tools/recomp.py from the game ROM. Do not edit. */\n#include "nes.h"\n\n'
names = {}
for r in regions:
    name, code = emit_region(r)
    names[r] = name
    open(os.path.join(outdir, '%s.c' % name), 'w').write(HDR + code)

L = [HDR]
w = L.append
for r in regions:
    bits = bytearray(0x400)
    for (rr, a) in insns:
        if rr == r:
            off = a & 0x1FFF
            bits[off >> 3] |= 1 << (off & 7)
    w('static const uint8_t known_%s[0x400] = {%s};' % (rname(r), ','.join(str(x) for x in bits)))
for r in regions:
    w('int %s(void);' % names[r])
w('static int (*const region_fn[4][%d])(void) = {' % NB8)
for s in range(4):
    w('    {%s},' % ', '.join(names.get((s, b), '0') for b in range(NB8)))
w('};')
w('static const uint8_t *const known[4][%d] = {' % NB8)
for s in range(4):
    w('    {%s},' % ', '.join(('known_' + rname((s, b))) if (s, b) in names else '0' for b in range(NB8)))
w('};')
w('''
static inline int rc_known(uint16_t pc) {
    if (pc < 0x8000) return 0;
    int s = (pc >> 13) & 3, b = prg_map[s];
    uint16_t o = pc & 0x1FFF;
    return known[s][b] && ((known[s][b][o >> 3] >> (o & 7)) & 1);
}

static int interp_until_known(void) {
    do {
        if (interp_step()) return 1;
        if (cycles >= next_event) service();
    } while (!rc_known(PC));
    return 0;
}

int rc_exec(void) {
    for (;;) {
        int r = 2;
        if (PC >= 0x8000) {
            int s = (PC >> 13) & 3;
            int (*f)(void) = region_fn[s][prg_map[s]];
            if (f) r = f();
        }
        if (r == 1) return 1;
        if (r == 2 && interp_until_known()) return 1;
    }
}
''')
open(os.path.join(outdir, 'rc_main.c'), 'w').write('\n'.join(L))

per = {}
for (r, a) in insns:
    per[rname(r)] = per.get(rname(r), 0) + 1
print('mapper %d, instructions per region:' % MAPPER, dict(sorted(per.items())))
print('covered addrs:', len(covered), 'total decoded:', len(insns))

# ------------------------------------------------------------------ listing
# A labeled disassembly per 8 KB bank (ca65-style). Code is what discovery
# found; everything else is emitted as .byte data.
targets = {}
for (r, a), (op, o, ln) in insns.items():
    m, mode, _ = OPS[op]
    nxt = (a + ln) & 0xFFFF
    t = None
    if m in ('JSR',) or (m == 'JMP' and mode == 'abs'):
        t = o
    elif m in BRANCH:
        t = (nxt + (o - 256 if o >= 128 else o)) & 0xFFFF
    if t is not None:
        tr = assume(r, t)
        if tr is not None:
            if m == 'JSR':
                targets[(tr, t)] = 'sub'
            else:
                targets.setdefault((tr, t), 'loc')
for nm, (vr, t) in vectors.items():
    if vr is not None:
        targets[(vr, t)] = nm
ldir = os.path.join(outdir, 'disasm')
os.makedirs(ldir, exist_ok=True)


def lname(r, a):
    k = targets.get((r, a))
    if k in ('nmi', 'reset', 'irq'):
        return k + '_vector'
    return '%s_%02X_%04X' % (k, r[1], a)


def operand_text(r, op, o, a):
    m, mode, _ = OPS[op]
    if mode == 'abs' and m in ('JSR', 'JMP') and (assume(r, o), o) in targets:
        return disasm(op, o, a).replace('$%04X' % o, lname(assume(r, o), o))
    if mode == 'rel':
        t = (a + 2 + (o - 256 if o >= 128 else o)) & 0xFFFF
        if (assume(r, t), t) in targets:
            return '%s %s' % (m, lname(assume(r, t), t))
    return disasm(op, o, a)


def default_slot(b):
    if MAPPER in (1, 2):
        return b & 1 if b < NB8 - 2 else 2 + (b & 1)
    if MAPPER == 4:
        return 3 if b == LAST else 2 if b == LAST - 1 else 0
    return 0


for b in range(NB8):
    slots = sorted({r[0] for r in regions if r[1] == b}) or [default_slot(b)]
    for s in slots:
        r = (s, b)
        b0 = 0x8000 + s * 0x2000
        out = ['; PRG 8 KB bank $%02X at $%04X' % (b, b0), '.segment "BANK%02X"' % b, '.org $%04X' % b0, '']
        data = []

        def flush():
            for i in range(0, len(data), 16):
                chunk = data[i:i + 16]
                out.append('    .byte ' + ','.join('$%02X' % x for _, x in chunk) + '  ; $%04X' % chunk[0][0])
            data.clear()

        a = b0
        while a < b0 + 0x2000:
            d = insns.get((r, a))
            if d:
                flush()
                op, o, ln = d
                if (r, a) in targets:
                    out.append('')
                    out.append('%s:' % lname(r, a))
                raw = ' '.join('%02X' % PRG[b * 0x2000 + ((a + i) & 0x1FFF)] for i in range(ln))
                out.append('    %-28s ; $%04X  %s' % (operand_text(r, op, o, a), a, raw))
                if OPS[op][0] in ('RTS', 'RTI', 'JMP'):
                    out.append('')
                a += ln
            else:
                data.append((a, PRG[b * 0x2000 + (a & 0x1FFF)]))
                a += 1
        flush()
        fn = 'bank%02X.asm' % b if len(slots) == 1 else 'bank%02X_at_%04X.asm' % (b, b0)
        open(os.path.join(ldir, fn), 'w').write('\n'.join(out) + '\n')
print('listing written to', ldir)
