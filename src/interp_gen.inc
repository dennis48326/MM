case 0x00: /* BRK imp */ {
  cycles += 7; PUSH16((uint16_t)(PC + 2)); PUSH(getP(1)); fI = 1; PC = rd(0xFFFE) | (rd(0xFFFF) << 8);
} break;
case 0x01: /* ORA izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); A |= M; SETNZ(A); }
} break;
case 0x02: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0x03: /* SLO izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); fC = M >> 7; M <<= 1; A |= M; SETNZ(A); wr(ea, M); }
} break;
case 0x04: /* NOP zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; (void)M; }
} break;
case 0x05: /* ORA zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; A |= M; SETNZ(A); }
} break;
case 0x06: /* ASL zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; fC = M >> 7; M <<= 1; SETNZ(M); ram[ea] = M; }
} break;
case 0x07: /* SLO zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; fC = M >> 7; M <<= 1; A |= M; SETNZ(A); ram[ea] = M; }
} break;
case 0x08: /* PHP imp */ {
  PC = (uint16_t)(PC + 1); cycles += 3;
  PUSH(getP(1));
} break;
case 0x09: /* ORA imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); A |= M; SETNZ(A); }
} break;
case 0x0A: /* ASL acc */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  { uint8_t M = A; fC = M >> 7; M <<= 1; SETNZ(M); A = M; }
} break;
case 0x0B: /* ANC imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); A &= M; SETNZ(A); fC = A >> 7; }
} break;
case 0x0C: /* NOP abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); (void)M; }
} break;
case 0x0D: /* ORA abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); A |= M; SETNZ(A); }
} break;
case 0x0E: /* ASL abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); fC = M >> 7; M <<= 1; SETNZ(M); wr(ea, M); }
} break;
case 0x0F: /* SLO abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); fC = M >> 7; M <<= 1; A |= M; SETNZ(A); wr(ea, M); }
} break;
case 0x10: /* BPL rel */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  if (!(fN & 0x80)) { uint16_t t_ = (uint16_t)(PC + (int8_t)o8); cycles += 1 + (((t_ ^ PC) & 0xFF00) ? 1 : 0); PC = t_; }
} break;
case 0x11: /* ORA izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); if ((b_ & 0xFF) + Y > 0xFF) cycles++; } { uint8_t M = rd(ea); A |= M; SETNZ(A); }
} break;
case 0x12: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0x13: /* SLO izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); } { uint8_t M = rd(ea); fC = M >> 7; M <<= 1; A |= M; SETNZ(A); wr(ea, M); }
} break;
case 0x14: /* NOP zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; (void)M; }
} break;
case 0x15: /* ORA zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; A |= M; SETNZ(A); }
} break;
case 0x16: /* ASL zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; fC = M >> 7; M <<= 1; SETNZ(M); ram[ea] = M; }
} break;
case 0x17: /* SLO zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; fC = M >> 7; M <<= 1; A |= M; SETNZ(A); ram[ea] = M; }
} break;
case 0x18: /* CLC imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  fC = 0;
} break;
case 0x19: /* ORA aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + Y); if (((o16) & 0xFF) + Y > 0xFF) cycles++; { uint8_t M = rd(ea); A |= M; SETNZ(A); }
} break;
case 0x1A: /* NOP imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  
} break;
case 0x1B: /* SLO aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + Y); { uint8_t M = rd(ea); fC = M >> 7; M <<= 1; A |= M; SETNZ(A); wr(ea, M); }
} break;
case 0x1C: /* NOP abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); (void)M; }
} break;
case 0x1D: /* ORA abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); A |= M; SETNZ(A); }
} break;
case 0x1E: /* ASL abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); fC = M >> 7; M <<= 1; SETNZ(M); wr(ea, M); }
} break;
case 0x1F: /* SLO abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); fC = M >> 7; M <<= 1; A |= M; SETNZ(A); wr(ea, M); }
} break;
case 0x20: /* JSR abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  cycles += 6; PUSH16((uint16_t)(PC + 2)); PC = o16;
} break;
case 0x21: /* AND izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); A &= M; SETNZ(A); }
} break;
case 0x22: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0x23: /* RLA izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); A &= M; SETNZ(A); } wr(ea, M); }
} break;
case 0x24: /* BIT zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; fZ = A & M; fN = M; fV = (M >> 6) & 1; }
} break;
case 0x25: /* AND zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; A &= M; SETNZ(A); }
} break;
case 0x26: /* ROL zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); SETNZ(M); } ram[ea] = M; }
} break;
case 0x27: /* RLA zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); A &= M; SETNZ(A); } ram[ea] = M; }
} break;
case 0x28: /* PLP imp */ {
  PC = (uint16_t)(PC + 1); cycles += 4;
  setP(PULL()); IRQCHK();
} break;
case 0x29: /* AND imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); A &= M; SETNZ(A); }
} break;
case 0x2A: /* ROL acc */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  { uint8_t M = A; { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); SETNZ(M); } A = M; }
} break;
case 0x2B: /* ANC imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); A &= M; SETNZ(A); fC = A >> 7; }
} break;
case 0x2C: /* BIT abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); fZ = A & M; fN = M; fV = (M >> 6) & 1; }
} break;
case 0x2D: /* AND abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); A &= M; SETNZ(A); }
} break;
case 0x2E: /* ROL abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); SETNZ(M); } wr(ea, M); }
} break;
case 0x2F: /* RLA abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); A &= M; SETNZ(A); } wr(ea, M); }
} break;
case 0x30: /* BMI rel */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  if ((fN & 0x80)) { uint16_t t_ = (uint16_t)(PC + (int8_t)o8); cycles += 1 + (((t_ ^ PC) & 0xFF00) ? 1 : 0); PC = t_; }
} break;
case 0x31: /* AND izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); if ((b_ & 0xFF) + Y > 0xFF) cycles++; } { uint8_t M = rd(ea); A &= M; SETNZ(A); }
} break;
case 0x32: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0x33: /* RLA izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); } { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); A &= M; SETNZ(A); } wr(ea, M); }
} break;
case 0x34: /* NOP zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; (void)M; }
} break;
case 0x35: /* AND zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; A &= M; SETNZ(A); }
} break;
case 0x36: /* ROL zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); SETNZ(M); } ram[ea] = M; }
} break;
case 0x37: /* RLA zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); A &= M; SETNZ(A); } ram[ea] = M; }
} break;
case 0x38: /* SEC imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  fC = 1;
} break;
case 0x39: /* AND aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + Y); if (((o16) & 0xFF) + Y > 0xFF) cycles++; { uint8_t M = rd(ea); A &= M; SETNZ(A); }
} break;
case 0x3A: /* NOP imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  
} break;
case 0x3B: /* RLA aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + Y); { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); A &= M; SETNZ(A); } wr(ea, M); }
} break;
case 0x3C: /* NOP abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); (void)M; }
} break;
case 0x3D: /* AND abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); A &= M; SETNZ(A); }
} break;
case 0x3E: /* ROL abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); SETNZ(M); } wr(ea, M); }
} break;
case 0x3F: /* RLA abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M >> 7; M = (uint8_t)((M << 1) | c_); A &= M; SETNZ(A); } wr(ea, M); }
} break;
case 0x40: /* RTI imp */ {
  cycles += 6; setP(PULL()); PC = PULL16(); IRQCHK();
  if (nest_depth && S == nest_s[nest_depth]) return 1;
} break;
case 0x41: /* EOR izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); A ^= M; SETNZ(A); }
} break;
case 0x42: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0x43: /* SRE izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); fC = M & 1; M >>= 1; A ^= M; SETNZ(A); wr(ea, M); }
} break;
case 0x44: /* NOP zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; (void)M; }
} break;
case 0x45: /* EOR zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; A ^= M; SETNZ(A); }
} break;
case 0x46: /* LSR zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; fC = M & 1; M >>= 1; SETNZ(M); ram[ea] = M; }
} break;
case 0x47: /* SRE zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; fC = M & 1; M >>= 1; A ^= M; SETNZ(A); ram[ea] = M; }
} break;
case 0x48: /* PHA imp */ {
  PC = (uint16_t)(PC + 1); cycles += 3;
  PUSH(A);
} break;
case 0x49: /* EOR imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); A ^= M; SETNZ(A); }
} break;
case 0x4A: /* LSR acc */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  { uint8_t M = A; fC = M & 1; M >>= 1; SETNZ(M); A = M; }
} break;
case 0x4B: /* ALR imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); A &= M; fC = A & 1; A >>= 1; SETNZ(A); }
} break;
case 0x4C: /* JMP abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  cycles += 3; PC = o16;
} break;
case 0x4D: /* EOR abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); A ^= M; SETNZ(A); }
} break;
case 0x4E: /* LSR abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); fC = M & 1; M >>= 1; SETNZ(M); wr(ea, M); }
} break;
case 0x4F: /* SRE abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); fC = M & 1; M >>= 1; A ^= M; SETNZ(A); wr(ea, M); }
} break;
case 0x50: /* BVC rel */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  if (!fV) { uint16_t t_ = (uint16_t)(PC + (int8_t)o8); cycles += 1 + (((t_ ^ PC) & 0xFF00) ? 1 : 0); PC = t_; }
} break;
case 0x51: /* EOR izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); if ((b_ & 0xFF) + Y > 0xFF) cycles++; } { uint8_t M = rd(ea); A ^= M; SETNZ(A); }
} break;
case 0x52: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0x53: /* SRE izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); } { uint8_t M = rd(ea); fC = M & 1; M >>= 1; A ^= M; SETNZ(A); wr(ea, M); }
} break;
case 0x54: /* NOP zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; (void)M; }
} break;
case 0x55: /* EOR zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; A ^= M; SETNZ(A); }
} break;
case 0x56: /* LSR zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; fC = M & 1; M >>= 1; SETNZ(M); ram[ea] = M; }
} break;
case 0x57: /* SRE zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; fC = M & 1; M >>= 1; A ^= M; SETNZ(A); ram[ea] = M; }
} break;
case 0x58: /* CLI imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  fI = 0; IRQCHK();
} break;
case 0x59: /* EOR aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + Y); if (((o16) & 0xFF) + Y > 0xFF) cycles++; { uint8_t M = rd(ea); A ^= M; SETNZ(A); }
} break;
case 0x5A: /* NOP imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  
} break;
case 0x5B: /* SRE aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + Y); { uint8_t M = rd(ea); fC = M & 1; M >>= 1; A ^= M; SETNZ(A); wr(ea, M); }
} break;
case 0x5C: /* NOP abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); (void)M; }
} break;
case 0x5D: /* EOR abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); A ^= M; SETNZ(A); }
} break;
case 0x5E: /* LSR abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); fC = M & 1; M >>= 1; SETNZ(M); wr(ea, M); }
} break;
case 0x5F: /* SRE abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); fC = M & 1; M >>= 1; A ^= M; SETNZ(A); wr(ea, M); }
} break;
case 0x60: /* RTS imp */ {
  cycles += 6; PC = (uint16_t)(PULL16() + 1);
} break;
case 0x61: /* ADC izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); op_adc(M); }
} break;
case 0x62: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0x63: /* RRA izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); op_adc(M); } wr(ea, M); }
} break;
case 0x64: /* NOP zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; (void)M; }
} break;
case 0x65: /* ADC zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; op_adc(M); }
} break;
case 0x66: /* ROR zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); SETNZ(M); } ram[ea] = M; }
} break;
case 0x67: /* RRA zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); op_adc(M); } ram[ea] = M; }
} break;
case 0x68: /* PLA imp */ {
  PC = (uint16_t)(PC + 1); cycles += 4;
  A = PULL(); SETNZ(A);
} break;
case 0x69: /* ADC imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); op_adc(M); }
} break;
case 0x6A: /* ROR acc */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  { uint8_t M = A; { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); SETNZ(M); } A = M; }
} break;
case 0x6B: /* ARR imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); A &= M; A = (A >> 1) | (fC << 7); SETNZ(A); fC = (A >> 6) & 1; fV = ((A >> 6) ^ (A >> 5)) & 1; }
} break;
case 0x6C: /* JMP ind */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  cycles += 5; PC = rd(o16) | (rd((o16 & 0xFF00) | ((o16 + 1) & 0xFF)) << 8);
} break;
case 0x6D: /* ADC abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); op_adc(M); }
} break;
case 0x6E: /* ROR abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); SETNZ(M); } wr(ea, M); }
} break;
case 0x6F: /* RRA abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); op_adc(M); } wr(ea, M); }
} break;
case 0x70: /* BVS rel */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  if (fV) { uint16_t t_ = (uint16_t)(PC + (int8_t)o8); cycles += 1 + (((t_ ^ PC) & 0xFF00) ? 1 : 0); PC = t_; }
} break;
case 0x71: /* ADC izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); if ((b_ & 0xFF) + Y > 0xFF) cycles++; } { uint8_t M = rd(ea); op_adc(M); }
} break;
case 0x72: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0x73: /* RRA izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); } { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); op_adc(M); } wr(ea, M); }
} break;
case 0x74: /* NOP zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; (void)M; }
} break;
case 0x75: /* ADC zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; op_adc(M); }
} break;
case 0x76: /* ROR zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); SETNZ(M); } ram[ea] = M; }
} break;
case 0x77: /* RRA zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); op_adc(M); } ram[ea] = M; }
} break;
case 0x78: /* SEI imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  fI = 1;
} break;
case 0x79: /* ADC aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + Y); if (((o16) & 0xFF) + Y > 0xFF) cycles++; { uint8_t M = rd(ea); op_adc(M); }
} break;
case 0x7A: /* NOP imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  
} break;
case 0x7B: /* RRA aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + Y); { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); op_adc(M); } wr(ea, M); }
} break;
case 0x7C: /* NOP abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); (void)M; }
} break;
case 0x7D: /* ADC abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); op_adc(M); }
} break;
case 0x7E: /* ROR abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); SETNZ(M); } wr(ea, M); }
} break;
case 0x7F: /* RRA abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); { uint8_t c_ = fC; fC = M & 1; M = (uint8_t)((M >> 1) | (c_ << 7)); op_adc(M); } wr(ea, M); }
} break;
case 0x80: /* NOP imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); (void)M; }
} break;
case 0x81: /* STA izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } wr(ea, A);
} break;
case 0x82: /* NOP imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); (void)M; }
} break;
case 0x83: /* SAX izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } wr(ea, (uint8_t)(A & X));
} break;
case 0x84: /* STY zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); ram[ea] = Y;
} break;
case 0x85: /* STA zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); ram[ea] = A;
} break;
case 0x86: /* STX zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); ram[ea] = X;
} break;
case 0x87: /* SAX zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); ram[ea] = (uint8_t)(A & X);
} break;
case 0x88: /* DEY imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  Y--; SETNZ(Y);
} break;
case 0x89: /* NOP imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); (void)M; }
} break;
case 0x8A: /* TXA imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  A = X; SETNZ(A);
} break;
case 0x8B: /* XAA imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); A = (A | 0xEE) & X & M; SETNZ(A); }
} break;
case 0x8C: /* STY abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; wr(ea, Y);
} break;
case 0x8D: /* STA abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; wr(ea, A);
} break;
case 0x8E: /* STX abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; wr(ea, X);
} break;
case 0x8F: /* SAX abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; wr(ea, (uint8_t)(A & X));
} break;
case 0x90: /* BCC rel */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  if (!fC) { uint16_t t_ = (uint16_t)(PC + (int8_t)o8); cycles += 1 + (((t_ ^ PC) & 0xFF00) ? 1 : 0); PC = t_; }
} break;
case 0x91: /* STA izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); } wr(ea, A);
} break;
case 0x92: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0x93: /* SHA izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); } wr(ea, (uint8_t)(A & X & ((ea >> 8) + 1)));
} break;
case 0x94: /* STY zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); ram[ea] = Y;
} break;
case 0x95: /* STA zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); ram[ea] = A;
} break;
case 0x96: /* STX zpy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + Y); ram[ea] = X;
} break;
case 0x97: /* SAX zpy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + Y); ram[ea] = (uint8_t)(A & X);
} break;
case 0x98: /* TYA imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  A = Y; SETNZ(A);
} break;
case 0x99: /* STA aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 5;
  ea = (uint16_t)(o16 + Y); wr(ea, A);
} break;
case 0x9A: /* TXS imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  S = X;
} break;
case 0x9B: /* TAS aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 5;
  ea = (uint16_t)(o16 + Y); S = A & X; wr(ea, (uint8_t)(S & ((ea >> 8) + 1)));
} break;
case 0x9C: /* SHY abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 5;
  { uint16_t b_ = (uint16_t)(o16); ea = (uint16_t)(b_ + X); uint8_t v_ = (uint8_t)(Y & ((b_ >> 8) + 1)); if ((b_ ^ ea) & 0xFF00) ea = (uint16_t)((v_ << 8) | (ea & 0xFF)); wr(ea, v_); }
} break;
case 0x9D: /* STA abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 5;
  ea = (uint16_t)(o16 + X); wr(ea, A);
} break;
case 0x9E: /* SHX aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 5;
  { uint16_t b_ = (uint16_t)(o16); ea = (uint16_t)(b_ + Y); uint8_t v_ = (uint8_t)(X & ((b_ >> 8) + 1)); if ((b_ ^ ea) & 0xFF00) ea = (uint16_t)((v_ << 8) | (ea & 0xFF)); wr(ea, v_); }
} break;
case 0x9F: /* SHA aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 5;
  ea = (uint16_t)(o16 + Y); wr(ea, (uint8_t)(A & X & ((ea >> 8) + 1)));
} break;
case 0xA0: /* LDY imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); Y = M; SETNZ(Y); }
} break;
case 0xA1: /* LDA izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); A = M; SETNZ(A); }
} break;
case 0xA2: /* LDX imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); X = M; SETNZ(X); }
} break;
case 0xA3: /* LAX izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); A = X = M; SETNZ(A); }
} break;
case 0xA4: /* LDY zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; Y = M; SETNZ(Y); }
} break;
case 0xA5: /* LDA zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; A = M; SETNZ(A); }
} break;
case 0xA6: /* LDX zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; X = M; SETNZ(X); }
} break;
case 0xA7: /* LAX zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; A = X = M; SETNZ(A); }
} break;
case 0xA8: /* TAY imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  Y = A; SETNZ(Y);
} break;
case 0xA9: /* LDA imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); A = M; SETNZ(A); }
} break;
case 0xAA: /* TAX imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  X = A; SETNZ(X);
} break;
case 0xAB: /* LXA imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); A = X = M; SETNZ(A); }
} break;
case 0xAC: /* LDY abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); Y = M; SETNZ(Y); }
} break;
case 0xAD: /* LDA abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); A = M; SETNZ(A); }
} break;
case 0xAE: /* LDX abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); X = M; SETNZ(X); }
} break;
case 0xAF: /* LAX abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); A = X = M; SETNZ(A); }
} break;
case 0xB0: /* BCS rel */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  if (fC) { uint16_t t_ = (uint16_t)(PC + (int8_t)o8); cycles += 1 + (((t_ ^ PC) & 0xFF00) ? 1 : 0); PC = t_; }
} break;
case 0xB1: /* LDA izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); if ((b_ & 0xFF) + Y > 0xFF) cycles++; } { uint8_t M = rd(ea); A = M; SETNZ(A); }
} break;
case 0xB2: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0xB3: /* LAX izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); if ((b_ & 0xFF) + Y > 0xFF) cycles++; } { uint8_t M = rd(ea); A = X = M; SETNZ(A); }
} break;
case 0xB4: /* LDY zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; Y = M; SETNZ(Y); }
} break;
case 0xB5: /* LDA zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; A = M; SETNZ(A); }
} break;
case 0xB6: /* LDX zpy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + Y); { uint8_t M = ram[ea]; X = M; SETNZ(X); }
} break;
case 0xB7: /* LAX zpy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + Y); { uint8_t M = ram[ea]; A = X = M; SETNZ(A); }
} break;
case 0xB8: /* CLV imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  fV = 0;
} break;
case 0xB9: /* LDA aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + Y); if (((o16) & 0xFF) + Y > 0xFF) cycles++; { uint8_t M = rd(ea); A = M; SETNZ(A); }
} break;
case 0xBA: /* TSX imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  X = S; SETNZ(X);
} break;
case 0xBB: /* LAS aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + Y); if (((o16) & 0xFF) + Y > 0xFF) cycles++; { uint8_t M = rd(ea); A = X = S = M & S; SETNZ(A); }
} break;
case 0xBC: /* LDY abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); Y = M; SETNZ(Y); }
} break;
case 0xBD: /* LDA abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); A = M; SETNZ(A); }
} break;
case 0xBE: /* LDX aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + Y); if (((o16) & 0xFF) + Y > 0xFF) cycles++; { uint8_t M = rd(ea); X = M; SETNZ(X); }
} break;
case 0xBF: /* LAX aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + Y); if (((o16) & 0xFF) + Y > 0xFF) cycles++; { uint8_t M = rd(ea); A = X = M; SETNZ(A); }
} break;
case 0xC0: /* CPY imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); op_cmp(Y, M); }
} break;
case 0xC1: /* CMP izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); op_cmp(A, M); }
} break;
case 0xC2: /* NOP imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); (void)M; }
} break;
case 0xC3: /* DCP izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); M--; op_cmp(A, M); wr(ea, M); }
} break;
case 0xC4: /* CPY zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; op_cmp(Y, M); }
} break;
case 0xC5: /* CMP zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; op_cmp(A, M); }
} break;
case 0xC6: /* DEC zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; M--; SETNZ(M); ram[ea] = M; }
} break;
case 0xC7: /* DCP zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; M--; op_cmp(A, M); ram[ea] = M; }
} break;
case 0xC8: /* INY imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  Y++; SETNZ(Y);
} break;
case 0xC9: /* CMP imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); op_cmp(A, M); }
} break;
case 0xCA: /* DEX imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  X--; SETNZ(X);
} break;
case 0xCB: /* AXS imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); { unsigned r_ = (A & X) - M; fC = (A & X) >= M; X = (uint8_t)r_; SETNZ(X); } }
} break;
case 0xCC: /* CPY abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); op_cmp(Y, M); }
} break;
case 0xCD: /* CMP abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); op_cmp(A, M); }
} break;
case 0xCE: /* DEC abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); M--; SETNZ(M); wr(ea, M); }
} break;
case 0xCF: /* DCP abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); M--; op_cmp(A, M); wr(ea, M); }
} break;
case 0xD0: /* BNE rel */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  if (fZ) { uint16_t t_ = (uint16_t)(PC + (int8_t)o8); cycles += 1 + (((t_ ^ PC) & 0xFF00) ? 1 : 0); PC = t_; }
} break;
case 0xD1: /* CMP izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); if ((b_ & 0xFF) + Y > 0xFF) cycles++; } { uint8_t M = rd(ea); op_cmp(A, M); }
} break;
case 0xD2: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0xD3: /* DCP izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); } { uint8_t M = rd(ea); M--; op_cmp(A, M); wr(ea, M); }
} break;
case 0xD4: /* NOP zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; (void)M; }
} break;
case 0xD5: /* CMP zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; op_cmp(A, M); }
} break;
case 0xD6: /* DEC zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; M--; SETNZ(M); ram[ea] = M; }
} break;
case 0xD7: /* DCP zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; M--; op_cmp(A, M); ram[ea] = M; }
} break;
case 0xD8: /* CLD imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  fD = 0;
} break;
case 0xD9: /* CMP aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + Y); if (((o16) & 0xFF) + Y > 0xFF) cycles++; { uint8_t M = rd(ea); op_cmp(A, M); }
} break;
case 0xDA: /* NOP imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  
} break;
case 0xDB: /* DCP aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + Y); { uint8_t M = rd(ea); M--; op_cmp(A, M); wr(ea, M); }
} break;
case 0xDC: /* NOP abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); (void)M; }
} break;
case 0xDD: /* CMP abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); op_cmp(A, M); }
} break;
case 0xDE: /* DEC abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); M--; SETNZ(M); wr(ea, M); }
} break;
case 0xDF: /* DCP abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); M--; op_cmp(A, M); wr(ea, M); }
} break;
case 0xE0: /* CPX imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); op_cmp(X, M); }
} break;
case 0xE1: /* SBC izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); op_adc((uint8_t)~M); }
} break;
case 0xE2: /* NOP imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); (void)M; }
} break;
case 0xE3: /* ISC izx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint8_t p_ = (uint8_t)(o8 + X); ea = ram[p_] | (ram[(uint8_t)(p_ + 1)] << 8); } { uint8_t M = rd(ea); M++; op_adc((uint8_t)~M); wr(ea, M); }
} break;
case 0xE4: /* CPX zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; op_cmp(X, M); }
} break;
case 0xE5: /* SBC zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 3;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; op_adc((uint8_t)~M); }
} break;
case 0xE6: /* INC zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; M++; SETNZ(M); ram[ea] = M; }
} break;
case 0xE7: /* ISC zp */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  ea = (uint8_t)(o8); { uint8_t M = ram[ea]; M++; op_adc((uint8_t)~M); ram[ea] = M; }
} break;
case 0xE8: /* INX imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  X++; SETNZ(X);
} break;
case 0xE9: /* SBC imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); op_adc((uint8_t)~M); }
} break;
case 0xEA: /* NOP imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  
} break;
case 0xEB: /* SBC imm */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  { uint8_t M = (uint8_t)(o8); op_adc((uint8_t)~M); }
} break;
case 0xEC: /* CPX abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); op_cmp(X, M); }
} break;
case 0xED: /* SBC abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = o16; { uint8_t M = rd(ea); op_adc((uint8_t)~M); }
} break;
case 0xEE: /* INC abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); M++; SETNZ(M); wr(ea, M); }
} break;
case 0xEF: /* ISC abs */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 6;
  ea = o16; { uint8_t M = rd(ea); M++; op_adc((uint8_t)~M); wr(ea, M); }
} break;
case 0xF0: /* BEQ rel */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 2;
  if (!fZ) { uint16_t t_ = (uint16_t)(PC + (int8_t)o8); cycles += 1 + (((t_ ^ PC) & 0xFF00) ? 1 : 0); PC = t_; }
} break;
case 0xF1: /* SBC izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 5;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); if ((b_ & 0xFF) + Y > 0xFF) cycles++; } { uint8_t M = rd(ea); op_adc((uint8_t)~M); }
} break;
case 0xF2: /* KIL imp */ {
  cycles += 2; cpu_jammed = 1;
} break;
case 0xF3: /* ISC izy */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 8;
  { uint16_t b_ = ram[(uint8_t)(o8)] | (ram[(uint8_t)((o8) + 1)] << 8); ea = (uint16_t)(b_ + Y); } { uint8_t M = rd(ea); M++; op_adc((uint8_t)~M); wr(ea, M); }
} break;
case 0xF4: /* NOP zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; (void)M; }
} break;
case 0xF5: /* SBC zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 4;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; op_adc((uint8_t)~M); }
} break;
case 0xF6: /* INC zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; M++; SETNZ(M); ram[ea] = M; }
} break;
case 0xF7: /* ISC zpx */ {
  uint8_t o8 = rd((uint16_t)(PC + 1));
  PC = (uint16_t)(PC + 2); cycles += 6;
  ea = (uint8_t)(o8 + X); { uint8_t M = ram[ea]; M++; op_adc((uint8_t)~M); ram[ea] = M; }
} break;
case 0xF8: /* SED imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  fD = 1;
} break;
case 0xF9: /* SBC aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + Y); if (((o16) & 0xFF) + Y > 0xFF) cycles++; { uint8_t M = rd(ea); op_adc((uint8_t)~M); }
} break;
case 0xFA: /* NOP imp */ {
  PC = (uint16_t)(PC + 1); cycles += 2;
  
} break;
case 0xFB: /* ISC aby */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + Y); { uint8_t M = rd(ea); M++; op_adc((uint8_t)~M); wr(ea, M); }
} break;
case 0xFC: /* NOP abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); (void)M; }
} break;
case 0xFD: /* SBC abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 4;
  ea = (uint16_t)(o16 + X); if (((o16) & 0xFF) + X > 0xFF) cycles++; { uint8_t M = rd(ea); op_adc((uint8_t)~M); }
} break;
case 0xFE: /* INC abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); M++; SETNZ(M); wr(ea, M); }
} break;
case 0xFF: /* ISC abx */ {
  uint16_t o16 = rd((uint16_t)(PC + 1)) | (rd((uint16_t)(PC + 2)) << 8);
  PC = (uint16_t)(PC + 3); cycles += 7;
  ea = (uint16_t)(o16 + X); { uint8_t M = rd(ea); M++; op_adc((uint8_t)~M); wr(ea, M); }
} break;
