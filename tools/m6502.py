"""6502 opcode table and C semantics, shared by the interpreter generator and
the static recompiler so both execute identical instruction bodies."""

# mode, operand length
MODES = {
    'imp': 0, 'acc': 0, 'imm': 1, 'zp': 1, 'zpx': 1, 'zpy': 1, 'abs': 2,
    'abx': 2, 'aby': 2, 'izx': 1, 'izy': 1, 'ind': 2, 'rel': 1,
}

_T = """
00 BRK imp 7|01 ORA izx 6|02 KIL imp 2|03 SLO izx 8|04 NOP zp 3|05 ORA zp 3|06 ASL zp 5|07 SLO zp 5
08 PHP imp 3|09 ORA imm 2|0A ASL acc 2|0B ANC imm 2|0C NOP abs 4|0D ORA abs 4|0E ASL abs 6|0F SLO abs 6
10 BPL rel 2|11 ORA izy 5|12 KIL imp 2|13 SLO izy 8|14 NOP zpx 4|15 ORA zpx 4|16 ASL zpx 6|17 SLO zpx 6
18 CLC imp 2|19 ORA aby 4|1A NOP imp 2|1B SLO aby 7|1C NOP abx 4|1D ORA abx 4|1E ASL abx 7|1F SLO abx 7
20 JSR abs 6|21 AND izx 6|22 KIL imp 2|23 RLA izx 8|24 BIT zp 3|25 AND zp 3|26 ROL zp 5|27 RLA zp 5
28 PLP imp 4|29 AND imm 2|2A ROL acc 2|2B ANC imm 2|2C BIT abs 4|2D AND abs 4|2E ROL abs 6|2F RLA abs 6
30 BMI rel 2|31 AND izy 5|32 KIL imp 2|33 RLA izy 8|34 NOP zpx 4|35 AND zpx 4|36 ROL zpx 6|37 RLA zpx 6
38 SEC imp 2|39 AND aby 4|3A NOP imp 2|3B RLA aby 7|3C NOP abx 4|3D AND abx 4|3E ROL abx 7|3F RLA abx 7
40 RTI imp 6|41 EOR izx 6|42 KIL imp 2|43 SRE izx 8|44 NOP zp 3|45 EOR zp 3|46 LSR zp 5|47 SRE zp 5
48 PHA imp 3|49 EOR imm 2|4A LSR acc 2|4B ALR imm 2|4C JMP abs 3|4D EOR abs 4|4E LSR abs 6|4F SRE abs 6
50 BVC rel 2|51 EOR izy 5|52 KIL imp 2|53 SRE izy 8|54 NOP zpx 4|55 EOR zpx 4|56 LSR zpx 6|57 SRE zpx 6
58 CLI imp 2|59 EOR aby 4|5A NOP imp 2|5B SRE aby 7|5C NOP abx 4|5D EOR abx 4|5E LSR abx 7|5F SRE abx 7
60 RTS imp 6|61 ADC izx 6|62 KIL imp 2|63 RRA izx 8|64 NOP zp 3|65 ADC zp 3|66 ROR zp 5|67 RRA zp 5
68 PLA imp 4|69 ADC imm 2|6A ROR acc 2|6B ARR imm 2|6C JMP ind 5|6D ADC abs 4|6E ROR abs 6|6F RRA abs 6
70 BVS rel 2|71 ADC izy 5|72 KIL imp 2|73 RRA izy 8|74 NOP zpx 4|75 ADC zpx 4|76 ROR zpx 6|77 RRA zpx 6
78 SEI imp 2|79 ADC aby 4|7A NOP imp 2|7B RRA aby 7|7C NOP abx 4|7D ADC abx 4|7E ROR abx 7|7F RRA abx 7
80 NOP imm 2|81 STA izx 6|82 NOP imm 2|83 SAX izx 6|84 STY zp 3|85 STA zp 3|86 STX zp 3|87 SAX zp 3
88 DEY imp 2|89 NOP imm 2|8A TXA imp 2|8B XAA imm 2|8C STY abs 4|8D STA abs 4|8E STX abs 4|8F SAX abs 4
90 BCC rel 2|91 STA izy 6|92 KIL imp 2|93 SHA izy 6|94 STY zpx 4|95 STA zpx 4|96 STX zpy 4|97 SAX zpy 4
98 TYA imp 2|99 STA aby 5|9A TXS imp 2|9B TAS aby 5|9C SHY abx 5|9D STA abx 5|9E SHX aby 5|9F SHA aby 5
A0 LDY imm 2|A1 LDA izx 6|A2 LDX imm 2|A3 LAX izx 6|A4 LDY zp 3|A5 LDA zp 3|A6 LDX zp 3|A7 LAX zp 3
A8 TAY imp 2|A9 LDA imm 2|AA TAX imp 2|AB LXA imm 2|AC LDY abs 4|AD LDA abs 4|AE LDX abs 4|AF LAX abs 4
B0 BCS rel 2|B1 LDA izy 5|B2 KIL imp 2|B3 LAX izy 5|B4 LDY zpx 4|B5 LDA zpx 4|B6 LDX zpy 4|B7 LAX zpy 4
B8 CLV imp 2|B9 LDA aby 4|BA TSX imp 2|BB LAS aby 4|BC LDY abx 4|BD LDA abx 4|BE LDX aby 4|BF LAX aby 4
C0 CPY imm 2|C1 CMP izx 6|C2 NOP imm 2|C3 DCP izx 8|C4 CPY zp 3|C5 CMP zp 3|C6 DEC zp 5|C7 DCP zp 5
C8 INY imp 2|C9 CMP imm 2|CA DEX imp 2|CB AXS imm 2|CC CPY abs 4|CD CMP abs 4|CE DEC abs 6|CF DCP abs 6
D0 BNE rel 2|D1 CMP izy 5|D2 KIL imp 2|D3 DCP izy 8|D4 NOP zpx 4|D5 CMP zpx 4|D6 DEC zpx 6|D7 DCP zpx 6
D8 CLD imp 2|D9 CMP aby 4|DA NOP imp 2|DB DCP aby 7|DC NOP abx 4|DD CMP abx 4|DE DEC abx 7|DF DCP abx 7
E0 CPX imm 2|E1 SBC izx 6|E2 NOP imm 2|E3 ISC izx 8|E4 CPX zp 3|E5 SBC zp 3|E6 INC zp 5|E7 ISC zp 5
E8 INX imp 2|E9 SBC imm 2|EA NOP imp 2|EB SBC imm 2|EC CPX abs 4|ED SBC abs 4|EE INC abs 6|EF ISC abs 6
F0 BEQ rel 2|F1 SBC izy 5|F2 KIL imp 2|F3 ISC izy 8|F4 NOP zpx 4|F5 SBC zpx 4|F6 INC zpx 6|F7 ISC zpx 6
F8 SED imp 2|F9 SBC aby 4|FA NOP imp 2|FB ISC aby 7|FC NOP abx 4|FD SBC abx 4|FE INC abx 7|FF ISC abx 7
"""

OPS = {}
for line in _T.strip().splitlines():
    for ent in line.split('|'):
        h, m, mode, cyc = ent.split()
        OPS[int(h, 16)] = (m, mode, int(cyc))
assert len(OPS) == 256

OFFICIAL = set()
_off = ("ADC AND ASL BCC BCS BEQ BIT BMI BNE BPL BRK BVC BVS CLC CLD CLI CLV CMP CPX CPY "
        "DEC DEX DEY EOR INC INX INY JMP JSR LDA LDX LDY LSR NOP ORA PHA PHP PLA PLP ROL "
        "ROR RTI RTS SBC SEC SED SEI STA STX STY TAX TAY TSX TXA TXS TYA").split()
for k, (m, mode, c) in OPS.items():
    if m in _off and not (m == 'NOP' and k != 0xEA) and not (m == 'SBC' and k == 0xEB):
        OFFICIAL.add(k)

READ_PENALTY = {'LDA', 'LDX', 'LDY', 'EOR', 'AND', 'ORA', 'ADC', 'SBC', 'CMP', 'LAX', 'NOP', 'LAS'}
BRANCH = {'BPL': '!(fN & 0x80)', 'BMI': '(fN & 0x80)', 'BVC': '!fV', 'BVS': 'fV',
          'BCC': '!fC', 'BCS': 'fC', 'BNE': 'fZ', 'BEQ': '!fZ'}
RMW = {'ASL', 'LSR', 'ROL', 'ROR', 'INC', 'DEC', 'SLO', 'RLA', 'SRE', 'RRA', 'DCP', 'ISC'}
STORES = {'STA', 'STX', 'STY', 'SAX', 'SHA', 'SHX', 'SHY', 'TAS'}


def oplen(op):
    return 1 + MODES[OPS[op][1]]


def disasm(op, operand, pc):
    m, mode, _ = OPS[op]
    o = operand
    if mode in ('imp',):
        return m
    if mode == 'acc':
        return m + ' A'
    if mode == 'imm':
        return '%s #$%02X' % (m, o)
    if mode == 'zp':
        return '%s $%02X' % (m, o)
    if mode == 'zpx':
        return '%s $%02X,X' % (m, o)
    if mode == 'zpy':
        return '%s $%02X,Y' % (m, o)
    if mode == 'abs':
        return '%s $%04X' % (m, o)
    if mode == 'abx':
        return '%s $%04X,X' % (m, o)
    if mode == 'aby':
        return '%s $%04X,Y' % (m, o)
    if mode == 'izx':
        return '%s ($%02X,X)' % (m, o)
    if mode == 'izy':
        return '%s ($%02X),Y' % (m, o)
    if mode == 'ind':
        return '%s ($%04X)' % (m, o)
    if mode == 'rel':
        return '%s $%04X' % (m, (pc + 2 + (o - 256 if o >= 128 else o)) & 0xFFFF)


def _c(v, const):
    """operand text: hex literal when constant, else variable name"""
    return v


def ea_code(mode, O, penalty, const_val=None):
    """Return (prelude, is_zp). prelude computes `ea`.
    O is the operand C expression. penalty: add page-cross cycle."""
    if mode == 'zp':
        return 'ea = (uint8_t)(%s);' % O, True
    if mode == 'zpx':
        return 'ea = (uint8_t)(%s + X);' % O, True
    if mode == 'zpy':
        return 'ea = (uint8_t)(%s + Y);' % O, True
    if mode == 'abs':
        return 'ea = %s;' % O, False
    if mode in ('abx', 'aby'):
        r = 'X' if mode == 'abx' else 'Y'
        s = 'ea = (uint16_t)(%s + %s);' % (O, r)
        if penalty:
            s += ' if (((%s) & 0xFF) + %s > 0xFF) cycles++;' % (O, r)
        return s, False
    if mode == 'izx':
        return ('{ uint8_t p_ = (uint8_t)(%s + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); }' % O), False
    if mode == 'izy':
        s = ('{ uint16_t b_ = ram[(uint8_t)(%s)] | (ram[(uint8_t)((%s) + 1)] << 8); ea = (uint16_t)(b_ + Y);' % (O, O))
        if penalty:
            s += ' if ((b_ & 0xFF) + Y > 0xFF) cycles++;'
        s += ' }'
        return s, False
    raise ValueError(mode)


def rd_expr(is_zp, mode, const_ea=None):
    if is_zp:
        return 'ram[ea]'
    return 'rd(ea)'


def wr_stmt(is_zp, v):
    if is_zp:
        return 'ram[ea] = %s;' % v
    return 'wr(ea, %s);' % v


ALU = {
    'ORA': 'A |= M; SETNZ(A);',
    'AND': 'A &= M; SETNZ(A);',
    'EOR': 'A ^= M; SETNZ(A);',
    'ADC': 'op_adc(M);',
    'SBC': 'op_adc((uint8_t)~M);',
    'CMP': 'op_cmp(A, M);',
    'CPX': 'op_cmp(X, M);',
    'CPY': 'op_cmp(Y, M);',
    'BIT': 'fZ = A & M; fN = M; fV = (M >> 6) & 1;',
    'LDA': 'A = M; SETNZ(A);',
    'LDX': 'X = M; SETNZ(X);',
    'LDY': 'Y = M; SETNZ(Y);',
    'LAX': 'A = X = M; SETNZ(A);',
    'NOP': '(void)M;',
    'ANC': 'A &= M; SETNZ(A); fC = A >> 7;',
    'ALR': 'A &= M; fC = A & 1; A >>= 1; SETNZ(A);',
    'ARR': 'A &= M; A = (A >> 1) | (fC << 7); SETNZ(A); fC = (A >> 6) & 1; fV = ((A >> 6) ^ (A >> 5)) & 1;',
    'XAA': 'A = (A | 0xEE) & X & M; SETNZ(A);',
    'LXA': 'A = X = M; SETNZ(A);',
    'AXS': '{ unsigned r_ = (A & X) - M; fC = (A & X) >= M; X = (uint8_t)r_; SETNZ(X); }',
    'LAS': 'A = X = S = M & S; SETNZ(A);',
}

RMWOP = {
    'ASL': 'fC = M >> 7; M <<= 1; SETNZ(M);',
    'LSR': 'fC = M & 1; M >>= 1; SETNZ(M);',
    'ROL': '{ uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); SETNZ(M); }',
    'ROR': '{ uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); SETNZ(M); }',
    'INC': 'M++; SETNZ(M);',
    'DEC': 'M--; SETNZ(M);',
    'SLO': 'fC = M >> 7; M <<= 1; A |= M; SETNZ(A);',
    'RLA': '{ uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); A &= M; SETNZ(A); }',
    'SRE': 'fC = M & 1; M >>= 1; A ^= M; SETNZ(A);',
    'RRA': '{ uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); op_adc(M); }',
    'DCP': 'M--; op_cmp(A, M);',
    'ISC': 'M++; op_adc((uint8_t)~M);',
}

IMPLIED = {
    'TAX': 'X = A; SETNZ(X);', 'TXA': 'A = X; SETNZ(A);', 'TAY': 'Y = A; SETNZ(Y);',
    'TYA': 'A = Y; SETNZ(A);', 'TSX': 'X = S; SETNZ(X);', 'TXS': 'S = X;',
    'INX': 'X++; SETNZ(X);', 'INY': 'Y++; SETNZ(Y);', 'DEX': 'X--; SETNZ(X);',
    'DEY': 'Y--; SETNZ(Y);', 'CLC': 'fC = 0;', 'SEC': 'fC = 1;', 'CLI': 'fI = 0; IRQCHK();',
    'SEI': 'fI = 1;', 'CLV': 'fV = 0;', 'CLD': 'fD = 0;', 'SED': 'fD = 1;', 'NOP': '',
    'PHA': 'PUSH(A);', 'PLA': 'A = PULL(); SETNZ(A);', 'PHP': 'PUSH(getP(1));',
    'PLP': 'setP(PULL()); IRQCHK();',
}


def body(op, O, pc_expr=None):
    """Semantics of a non-control-flow instruction.
    O: operand C expression (constant text or o8/o16).
    Returns C code (without cycle base add) or None for control flow."""
    m, mode, cyc = OPS[op]
    if m in BRANCH or m in ('JMP', 'JSR', 'RTS', 'RTI', 'BRK', 'KIL'):
        return None
    if mode == 'imp':
        return IMPLIED[m]
    if mode == 'acc':
        return '{ uint8_t M = A; %s A = M; }' % RMWOP[m]
    if mode == 'imm':
        return '{ uint8_t M = (uint8_t)(%s); %s }' % (O, ALU[m])
    if m in RMW:
        pre, zp = ea_code(mode, O, False)
        return '%s { uint8_t M = %s; %s %s }' % (pre, rd_expr(zp, mode), RMWOP[m], wr_stmt(zp, 'M'))
    if m in STORES:
        pre, zp = ea_code(mode, O, False)
        if m == 'STA':
            v = 'A'
        elif m == 'STX':
            v = 'X'
        elif m == 'STY':
            v = 'Y'
        elif m == 'SAX':
            v = '(uint8_t)(A & X)'
        elif m == 'SHA':
            v = '(uint8_t)(A & X & ((ea >> 8) + 1))'
        elif m in ('SHX', 'SHY'):
            r = 'X' if m == 'SHX' else 'Y'
            ix = 'Y' if m == 'SHX' else 'X'
            return ('{ uint16_t b_ = (uint16_t)(%s); ea = (uint16_t)(b_ + %s); uint8_t v_ = (uint8_t)(%s & ((b_ >> 8) + 1));'
                    ' if ((b_ ^ ea) & 0xFF00) ea = (uint16_t)((v_ << 8) | (ea & 0xFF)); wr(ea, v_); }' % (O, ix, r))
        elif m == 'TAS':
            return '%s S = A & X; wr(ea, (uint8_t)(S & ((ea >> 8) + 1)));' % pre
        return '%s %s' % (pre, wr_stmt(zp, v))
    # reads
    pre, zp = ea_code(mode, O, m in READ_PENALTY)
    return '%s { uint8_t M = %s; %s }' % (pre, rd_expr(zp, mode), ALU[m])


def store_may_hit_rom(op, operand):
    """Could this instruction write to $8000-$FFFF (mapper register)?"""
    m, mode, _ = OPS[op]
    if not (m in STORES or m in RMW):
        return False
    if mode in ('zp', 'zpx', 'zpy', 'acc'):
        return False
    if mode == 'abs':
        return operand >= 0x8000
    if mode in ('abx', 'aby'):
        return operand + 0xFF >= 0x8000
    return True
