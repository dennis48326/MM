"""Generate the reference 6502 interpreter switch from the shared table."""
import sys
from m6502 import OPS, MODES, BRANCH, body

out = []
w = out.append
for op in range(256):
    m, mode, cyc = OPS[op]
    n = MODES[mode]
    w('case 0x%02X: /* %s %s */ {' % (op, m, mode))
    if n == 1:
        w('  uint8_t o8 = rd((uint16_t)(PC + 1));')
    elif n == 2:
        w('  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);')
    O = 'o8' if n == 1 else 'o16'
    if m in BRANCH:
        w('  PC = (uint16_t)(PC + 2); cycles += 2;')
        w('  if (%s) { uint16_t t_ = (uint16_t)(PC + (int8_t)o8); cycles += 1 + (((t_ ^ PC) & 0xFF00) ? 1 : 0); PC = t_; }' % BRANCH[m])
    elif m == 'JMP' and mode == 'abs':
        w('  cycles += 3; PC = o16;')
    elif m == 'JMP':
        w('  cycles += 5; PC = rd(o16) | (rd((o16 & 0xFF00) | ((o16 + 1) & 0xFF)) << 8);')
    elif m == 'JSR':
        w('  cycles += 6; PUSH16((uint16_t)(PC + 2)); PC = o16;')
    elif m == 'RTS':
        w('  cycles += 6; PC = (uint16_t)(PULL16() + 1);')
    elif m == 'RTI':
        w('  cycles += 6; setP(PULL()); PC = PULL16(); IRQCHK();')
        w('  if (nest_depth && S == nest_s[nest_depth]) return 1;')
    elif m == 'BRK':
        w('  cycles += 7; PUSH16((uint16_t)(PC + 2)); PUSH(getP(1)); fI = 1; PC = rd(0xFFFE) | (rd(0xFFFF) << 8);')
    elif m == 'KIL':
        w('  cycles += 2; cpu_jammed = 1;')
    else:
        w('  PC = (uint16_t)(PC + %d); cycles += %d;' % (n + 1, cyc))
        w('  ' + body(op, O))
    w('} break;')

open(sys.argv[1], 'w').write('\n'.join(out) + '\n')
