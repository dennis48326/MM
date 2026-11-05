; PRG 8 KB bank $1B at $A000
.segment "BANK1B"
.org $A000

    STA $04A0                    ; $A000  8D A0 04
    LDA #$28                     ; $A003  A9 28
    STA $04A1                    ; $A005  8D A1 04
    LDA #$00                     ; $A008  A9 00
    STA $04C1                    ; $A00A  8D C1 04
    LDA #$00                     ; $A00D  A9 00
    STA $04A2                    ; $A00F  8D A2 04
    LDA #$47                     ; $A012  A9 47
    STA $04A3                    ; $A014  8D A3 04
    LDA #$02                     ; $A017  A9 02
    STA $0402                    ; $A019  8D 02 04
    STA $0403                    ; $A01C  8D 03 04
    LDA #$27                     ; $A01F  A9 27
    STA $04A5                    ; $A021  8D A5 04
    LDA #$6F                     ; $A024  A9 6F
    STA $04A6                    ; $A026  8D A6 04
    LDA #$01                     ; $A029  A9 01
    STA $0405                    ; $A02B  8D 05 04
    STA $0406                    ; $A02E  8D 06 04
    LDA #$80                     ; $A031  A9 80
    STA $0660                    ; $A033  8D 60 06
    LDA #$00                     ; $A036  A9 00
    STA $0640                    ; $A038  8D 40 06
    LDA #$00                     ; $A03B  A9 00
    STA $AE                      ; $A03D  85 AE
    LDA #$00                     ; $A03F  A9 00
    STA $22                      ; $A041  85 22
    LDA #$00                     ; $A043  A9 00
    STA $FD                      ; $A045  85 FD
    LDA #$08                     ; $A047  A9 08
    STA $FE                      ; $A049  85 FE

loc_1B_A04B:
    DEC $FE                      ; $A04B  C6 FE
    BNE loc_1B_A069              ; $A04D  D0 1A
    LDA #$08                     ; $A04F  A9 08
    STA $FE                      ; $A051  85 FE
    LDX $FD                      ; $A053  A6 FD
    LDY #$00                     ; $A055  A0 00

loc_1B_A057:
    LDA $AA4F,X                  ; $A057  BD 4F AA
    STA $0356,Y                  ; $A05A  99 56 03
    INX                          ; $A05D  E8
    INY                          ; $A05E  C8
    CPY #$20                     ; $A05F  C0 20
    BNE loc_1B_A057              ; $A061  D0 F4
    CPX #$60                     ; $A063  E0 60
    BEQ loc_1B_A078              ; $A065  F0 11
    STX $FD                      ; $A067  86 FD

loc_1B_A069:
    JSR sub_1B_A6F7              ; $A069  20 F7 A6
    JSR sub_1E_C0AB              ; $A06C  20 AB C0
    LDA $27                      ; $A06F  A5 27
    AND #$08                     ; $A071  29 08
    BEQ loc_1B_A04B              ; $A073  F0 D6
    JMP loc_1B_A7B0              ; $A075  4C B0 A7


loc_1B_A078:
    LDA #$0E                     ; $A078  A9 0E
    JSR sub_1E_C051              ; $A07A  20 51 C0
    LDA #$00                     ; $A07D  A9 00
    STA $FD                      ; $A07F  85 FD
    STA $C8                      ; $A081  85 C8

loc_1B_A083:
    LDA $FD                      ; $A083  A5 FD
    CMP #$36                     ; $A085  C9 36
    BNE loc_1B_A089              ; $A087  D0 00

loc_1B_A089:
    JSR sub_1B_A553              ; $A089  20 53 A5
    LDA #$23                     ; $A08C  A9 23
    STA $03B6                    ; $A08E  8D B6 03
    LDA #$03                     ; $A091  A9 03
    STA $03B7                    ; $A093  8D B7 03
    JSR sub_1E_C0AB              ; $A096  20 AB C0
    LDA $27                      ; $A099  A5 27
    AND #$08                     ; $A09B  29 08
    BEQ loc_1B_A0A2              ; $A09D  F0 03
    JMP loc_1B_A7B0              ; $A09F  4C B0 A7


loc_1B_A0A2:
    JSR sub_1B_A553              ; $A0A2  20 53 A5
    LDA #$23                     ; $A0A5  A9 23
    STA $03B6                    ; $A0A7  8D B6 03
    LDA #$43                     ; $A0AA  A9 43
    STA $03B7                    ; $A0AC  8D B7 03
    LDA #$1F                     ; $A0AF  A9 1F
    STA $FE                      ; $A0B1  85 FE
    LDA #$0A                     ; $A0B3  A9 0A
    STA $FF                      ; $A0B5  85 FF

loc_1B_A0B7:
    DEC $FF                      ; $A0B7  C6 FF
    BNE loc_1B_A0CB              ; $A0B9  D0 10
    LDA #$0A                     ; $A0BB  A9 0A
    STA $FF                      ; $A0BD  85 FF
    LDX $FE                      ; $A0BF  A6 FE
    LDA $AE54,X                  ; $A0C1  BD 54 AE
    STA $035B                    ; $A0C4  8D 5B 03
    DEC $FE                      ; $A0C7  C6 FE
    BMI loc_1B_A0D7              ; $A0C9  30 0C

loc_1B_A0CB:
    JSR sub_1E_C0AB              ; $A0CB  20 AB C0
    LDA $27                      ; $A0CE  A5 27
    AND #$08                     ; $A0D0  29 08
    BEQ loc_1B_A0B7              ; $A0D2  F0 E3
    JMP loc_1B_A7B0              ; $A0D4  4C B0 A7


loc_1B_A0D7:
    LDA $FD                      ; $A0D7  A5 FD
    CMP #$0E                     ; $A0D9  C9 0E
    BNE loc_1B_A083              ; $A0DB  D0 A6
    LDA #$02                     ; $A0DD  A9 02
    STA $AE                      ; $A0DF  85 AE
    LDA #$F0                     ; $A0E1  A9 F0
    STA $22                      ; $A0E3  85 22

loc_1B_A0E5:
    SEC                          ; $A0E5  38
    LDA $21                      ; $A0E6  A5 21
    SBC #$80                     ; $A0E8  E9 80
    STA $21                      ; $A0EA  85 21
    LDA $22                      ; $A0EC  A5 22
    SBC #$00                     ; $A0EE  E9 00
    STA $22                      ; $A0F0  85 22
    BCC loc_1B_A10D              ; $A0F2  90 19
    CMP #$40                     ; $A0F4  C9 40
    BCS loc_1B_A0FB              ; $A0F6  B0 03
    JSR sub_1B_A57C              ; $A0F8  20 7C A5

loc_1B_A0FB:
    JSR sub_1B_A61B              ; $A0FB  20 1B A6
    JSR sub_1B_A6F7              ; $A0FE  20 F7 A6
    JSR sub_1E_C0AB              ; $A101  20 AB C0
    LDA $27                      ; $A104  A5 27
    AND #$08                     ; $A106  29 08
    BEQ loc_1B_A0E5              ; $A108  F0 DB
    JMP loc_1B_A7B0              ; $A10A  4C B0 A7


loc_1B_A10D:
    LDA #$F0                     ; $A10D  A9 F0
    STA $22                      ; $A10F  85 22
    LDA #$00                     ; $A111  A9 00
    STA $21                      ; $A113  85 21
    STA $AE                      ; $A115  85 AE

loc_1B_A117:
    SEC                          ; $A117  38
    LDA $21                      ; $A118  A5 21
    SBC #$80                     ; $A11A  E9 80
    STA $21                      ; $A11C  85 21
    LDA $22                      ; $A11E  A5 22
    SBC #$00                     ; $A120  E9 00
    STA $22                      ; $A122  85 22
    CMP #$C0                     ; $A124  C9 C0
    BEQ loc_1B_A13A              ; $A126  F0 12
    JSR sub_1B_A61B              ; $A128  20 1B A6
    JSR sub_1B_A6F7              ; $A12B  20 F7 A6
    JSR sub_1E_C0AB              ; $A12E  20 AB C0
    LDA $27                      ; $A131  A5 27
    AND #$08                     ; $A133  29 08
    BEQ loc_1B_A117              ; $A135  F0 E0
    JMP loc_1B_A7B0              ; $A137  4C B0 A7


loc_1B_A13A:
    LDX #$0F                     ; $A13A  A2 0F

loc_1B_A13C:
    LDA $AAAF,X                  ; $A13C  BD AF AA
    STA $0356,X                  ; $A13F  9D 56 03
    DEX                          ; $A142  CA
    BPL loc_1B_A13C              ; $A143  10 F7
    LDA #$00                     ; $A145  A9 00
    STA $0410                    ; $A147  8D 10 04
    LDA #$08                     ; $A14A  A9 08
    STA $0690                    ; $A14C  8D 90 06
    LDA #$FF                     ; $A14F  A9 FF
    STA $0450                    ; $A151  8D 50 04
    LDA #$B7                     ; $A154  A9 B7
    STA $04B0                    ; $A156  8D B0 04

loc_1B_A159:
    SEC                          ; $A159  38
    LDA $22                      ; $A15A  A5 22
    SBC #$02                     ; $A15C  E9 02
    STA $22                      ; $A15E  85 22
    JSR sub_1B_A61B              ; $A160  20 1B A6
    LDA $22                      ; $A163  A5 22
    BEQ loc_1B_A17C              ; $A165  F0 15
    JSR sub_1B_A6F7              ; $A167  20 F7 A6
    JSR sub_1B_A5F5              ; $A16A  20 F5 A5
    JSR sub_1B_A75F              ; $A16D  20 5F A7
    JSR sub_1E_C0AB              ; $A170  20 AB C0
    LDA $27                      ; $A173  A5 27
    AND #$08                     ; $A175  29 08
    BEQ loc_1B_A159              ; $A177  F0 E0
    JMP loc_1B_A7B0              ; $A179  4C B0 A7


loc_1B_A17C:
    LDA #$50                     ; $A17C  A9 50
    STA $FD                      ; $A17E  85 FD
    LDA #$00                     ; $A180  A9 00
    STA $03B7                    ; $A182  8D B7 03
    STA $FE                      ; $A185  85 FE
    LDA #$10                     ; $A187  A9 10
    STA $03B6                    ; $A189  8D B6 03
    LDA #$B0                     ; $A18C  A9 B0
    STA $FF                      ; $A18E  85 FF

loc_1B_A190:
    JSR sub_1B_A5F5              ; $A190  20 F5 A5
    JSR sub_1B_A6F7              ; $A193  20 F7 A6
    JSR sub_1B_A75F              ; $A196  20 5F A7
    JSR sub_1E_C747              ; $A199  20 47 C7
    JSR sub_1E_C0AB              ; $A19C  20 AB C0
    CLC                          ; $A19F  18
    LDA $03B7                    ; $A1A0  AD B7 03
    ADC #$20                     ; $A1A3  69 20
    STA $03B7                    ; $A1A5  8D B7 03
    LDA $03B6                    ; $A1A8  AD B6 03
    ADC #$00                     ; $A1AB  69 00
    STA $03B6                    ; $A1AD  8D B6 03
    CLC                          ; $A1B0  18
    LDA $FE                      ; $A1B1  A5 FE
    ADC #$20                     ; $A1B3  69 20
    STA $FE                      ; $A1B5  85 FE
    LDA $FF                      ; $A1B7  A5 FF
    ADC #$00                     ; $A1B9  69 00
    STA $FF                      ; $A1BB  85 FF
    DEC $FD                      ; $A1BD  C6 FD
    BNE loc_1B_A190              ; $A1BF  D0 CF
    LDA #$20                     ; $A1C1  A9 20
    STA $FD                      ; $A1C3  85 FD

loc_1B_A1C5:
    JSR sub_1B_A5F5              ; $A1C5  20 F5 A5
    JSR sub_1B_A6F7              ; $A1C8  20 F7 A6
    JSR sub_1B_A75F              ; $A1CB  20 5F A7
    JSR sub_1E_C0AB              ; $A1CE  20 AB C0
    DEC $FD                      ; $A1D1  C6 FD
    BNE loc_1B_A1C5              ; $A1D3  D0 F0
    LDX #$0F                     ; $A1D5  A2 0F

loc_1B_A1D7:
    LDA $AABF,X                  ; $A1D7  BD BF AA
    STA $0356,X                  ; $A1DA  9D 56 03
    DEX                          ; $A1DD  CA
    BPL loc_1B_A1D7              ; $A1DE  10 F7

loc_1B_A1E0:
    LDA #$0D                     ; $A1E0  A9 0D
    JSR sub_1E_C051              ; $A1E2  20 51 C0
    LDA #$0B                     ; $A1E5  A9 0B
    STA $C1                      ; $A1E7  85 C1
    LDA #$00                     ; $A1E9  A9 00
    STA $C0                      ; $A1EB  85 C0
    STA $CB                      ; $A1ED  85 CB

loc_1B_A1EF:
    LDA $27                      ; $A1EF  A5 27
    AND #$08                     ; $A1F1  29 08
    BNE loc_1B_A245              ; $A1F3  D0 50
    JSR sub_1B_A6F7              ; $A1F5  20 F7 A6
    JSR sub_1B_A5F5              ; $A1F8  20 F5 A5
    JSR sub_1B_A75F              ; $A1FB  20 5F A7
    LDX #$02                     ; $A1FE  A2 02

loc_1B_A200:
    LDA $A2C1,X                  ; $A200  BD C1 A2
    STA $0281,X                  ; $A203  9D 81 02
    DEX                          ; $A206  CA
    BPL loc_1B_A200              ; $A207  10 F7
    LDX $CB                      ; $A209  A6 CB
    LDY #$F8                     ; $A20B  A0 F8
    LDA $1C                      ; $A20D  A5 1C
    AND #$08                     ; $A20F  29 08
    BEQ loc_1B_A216              ; $A211  F0 03
    LDY $A2C4,X                  ; $A213  BC C4 A2

loc_1B_A216:
    STY $0280                    ; $A216  8C 80 02
    LDA $27                      ; $A219  A5 27
    AND #$34                     ; $A21B  29 34
    BEQ loc_1B_A231              ; $A21D  F0 12
    TXA                          ; $A21F  8A
    EOR #$01                     ; $A220  49 01
    STA $CB                      ; $A222  85 CB
    LDA #$2F                     ; $A224  A9 2F
    JSR sub_1E_C051              ; $A226  20 51 C0
    LDA #$0B                     ; $A229  A9 0B
    STA $C1                      ; $A22B  85 C1
    LDA #$00                     ; $A22D  A9 00
    STA $C0                      ; $A22F  85 C0

loc_1B_A231:
    JSR sub_1E_C0AB              ; $A231  20 AB C0
    SEC                          ; $A234  38
    LDA $C0                      ; $A235  A5 C0
    SBC #$01                     ; $A237  E9 01
    STA $C0                      ; $A239  85 C0
    LDA $C1                      ; $A23B  A5 C1
    SBC #$00                     ; $A23D  E9 00
    STA $C1                      ; $A23F  85 C1
    BCS loc_1B_A1EF              ; $A241  B0 AC
    INC $BE                      ; $A243  E6 BE

loc_1B_A245:
    LDA #$FF                     ; $A245  A9 FF
    JSR sub_1E_C051              ; $A247  20 51 C0
    LDA #$19                     ; $A24A  A9 19
    STA $FD                      ; $A24C  85 FD

loc_1B_A24E:
    LDA $1C                      ; $A24E  A5 1C
    AND #$01                     ; $A250  29 01
    BNE loc_1B_A263              ; $A252  D0 0F
    LDA $FD                      ; $A254  A5 FD
    CMP #$04                     ; $A256  C9 04
    BNE loc_1B_A25F              ; $A258  D0 05
    LDA #$3A                     ; $A25A  A9 3A
    JSR sub_1E_C051              ; $A25C  20 51 C0

loc_1B_A25F:
    DEC $FD                      ; $A25F  C6 FD
    BMI loc_1B_A277              ; $A261  30 14

loc_1B_A263:
    LDX $FD                      ; $A263  A6 FD
    LDA $AE7B,X                  ; $A265  BD 7B AE
    STA $0410                    ; $A268  8D 10 04
    JSR sub_1B_A6F7              ; $A26B  20 F7 A6
    JSR sub_1B_A75F              ; $A26E  20 5F A7
    JSR sub_1E_C0AB              ; $A271  20 AB C0
    JMP loc_1B_A24E              ; $A274  4C 4E A2


loc_1B_A277:
    LDA #$0A                     ; $A277  A9 0A
    STA $0410                    ; $A279  8D 10 04
    SEC                          ; $A27C  38
    LDA $04B0                    ; $A27D  AD B0 04
    SBC #$08                     ; $A280  E9 08
    STA $04B0                    ; $A282  8D B0 04
    LDA $0450                    ; $A285  AD 50 04
    SBC #$00                     ; $A288  E9 00
    STA $0450                    ; $A28A  8D 50 04
    BEQ loc_1B_A296              ; $A28D  F0 07
    LDA $04B0                    ; $A28F  AD B0 04
    CMP #$F0                     ; $A292  C9 F0
    BCC loc_1B_A2A2              ; $A294  90 0C

loc_1B_A296:
    JSR sub_1B_A6F7              ; $A296  20 F7 A6
    JSR sub_1B_A75F              ; $A299  20 5F A7
    JSR sub_1E_C0AB              ; $A29C  20 AB C0
    JMP loc_1B_A277              ; $A29F  4C 77 A2


loc_1B_A2A2:
    JSR sub_1B_A6F7              ; $A2A2  20 F7 A6
    LDA #$3E                     ; $A2A5  A9 3E
    STA $FD                      ; $A2A7  85 FD

loc_1B_A2A9:
    JSR sub_1E_C0AB              ; $A2A9  20 AB C0
    DEC $FD                      ; $A2AC  C6 FD
    BNE loc_1B_A2A9              ; $A2AE  D0 F9
    JSR sub_1B_A52D              ; $A2B0  20 2D A5
    LDA #$00                     ; $A2B3  A9 00
    STA $AE                      ; $A2B5  85 AE
    LDA #$0E                     ; $A2B7  A9 0E
    JSR sub_1E_C05D              ; $A2B9  20 5D C0
    LDA $BE                      ; $A2BC  A5 BE
    BEQ loc_1B_A2C6              ; $A2BE  F0 06
    RTS                          ; $A2C0  60

    .byte $A2,$01,$30,$98,$A8  ; $A2C1

loc_1B_A2C6:
    LDA #$03                     ; $A2C6  A9 03
    JSR sub_1E_C644              ; $A2C8  20 44 C6
    LDA #$05                     ; $A2CB  A9 05
    STA $2A                      ; $A2CD  85 2A
    LDA #$40                     ; $A2CF  A9 40
    STA $08                      ; $A2D1  85 08
    LDA #$8D                     ; $A2D3  A9 8D
    STA $09                      ; $A2D5  85 09
    JSR sub_1B_A87E              ; $A2D7  20 7E A8
    LDA #$80                     ; $A2DA  A9 80
    STA $08                      ; $A2DC  85 08
    LDA #$8D                     ; $A2DE  A9 8D
    STA $09                      ; $A2E0  85 09
    JSR sub_1B_A87E              ; $A2E2  20 7E A8
    LDX #$00                     ; $A2E5  A2 00

loc_1B_A2E7:
    LDA $AF39,X                  ; $A2E7  BD 39 AF
    STA $2006                    ; $A2EA  8D 06 20
    LDA $AF3A,X                  ; $A2ED  BD 3A AF
    STA $2006                    ; $A2F0  8D 06 20
    INX                          ; $A2F3  E8
    INX                          ; $A2F4  E8
    LDY $AF39,X                  ; $A2F5  BC 39 AF
    INX                          ; $A2F8  E8

loc_1B_A2F9:
    LDA $AF39,X                  ; $A2F9  BD 39 AF
    STA $2007                    ; $A2FC  8D 07 20
    INX                          ; $A2FF  E8
    DEY                          ; $A300  88
    BNE loc_1B_A2F9              ; $A301  D0 F6
    CPX #$19                     ; $A303  E0 19
    BNE loc_1B_A2E7              ; $A305  D0 E0
    LDA #$10                     ; $A307  A9 10
    JSR sub_1E_C051              ; $A309  20 51 C0
    LDA #$01                     ; $A30C  A9 01
    JSR sub_1B_A9B2              ; $A30E  20 B2 A9

loc_1B_A311:
    LDA #$00                     ; $A311  A9 00
    STA $FD                      ; $A313  85 FD
    STA $9A                      ; $A315  85 9A
    STA $9B                      ; $A317  85 9B

loc_1B_A319:
    LDX #$03                     ; $A319  A2 03

loc_1B_A31B:
    LDA $AFC7,X                  ; $A31B  BD C7 AF
    STA $0200,X                  ; $A31E  9D 00 02
    DEX                          ; $A321  CA
    BPL loc_1B_A31B              ; $A322  10 F7
    LDA $1C                      ; $A324  A5 1C
    AND #$08                     ; $A326  29 08
    BNE loc_1B_A335              ; $A328  D0 0B
    LDX #$60                     ; $A32A  A2 60
    LDA $FD                      ; $A32C  A5 FD
    BEQ loc_1B_A332              ; $A32E  F0 02
    LDX #$70                     ; $A330  A2 70

loc_1B_A332:
    STX $0200                    ; $A332  8E 00 02

loc_1B_A335:
    LDA $27                      ; $A335  A5 27
    AND #$3C                     ; $A337  29 3C
    BEQ loc_1B_A34A              ; $A339  F0 0F
    AND #$08                     ; $A33B  29 08
    BNE loc_1B_A350              ; $A33D  D0 11
    LDA #$2F                     ; $A33F  A9 2F
    JSR sub_1E_C051              ; $A341  20 51 C0
    LDA $FD                      ; $A344  A5 FD
    EOR #$01                     ; $A346  49 01
    STA $FD                      ; $A348  85 FD

loc_1B_A34A:
    JSR sub_1E_C0AB              ; $A34A  20 AB C0
    JMP loc_1B_A319              ; $A34D  4C 19 A3


loc_1B_A350:
    LDA $FD                      ; $A350  A5 FD
    BNE loc_1B_A357              ; $A352  D0 03
    JMP loc_1B_A519              ; $A354  4C 19 A5


loc_1B_A357:
    JSR sub_1B_A898              ; $A357  20 98 A8
    JSR sub_1A_8473              ; $A35A  20 73 84
    JSR sub_1B_A9CC              ; $A35D  20 CC A9
    LDX #$2F                     ; $A360  A2 2F

loc_1B_A362:
    LDA $AFCB,X                  ; $A362  BD CB AF
    STA $0200,X                  ; $A365  9D 00 02
    DEX                          ; $A368  CA
    BPL loc_1B_A362              ; $A369  10 F7
    LDA #$00                     ; $A36B  A9 00
    LDX #$18                     ; $A36D  A2 18

loc_1B_A36F:
    STA $0420,X                  ; $A36F  9D 20 04
    DEX                          ; $A372  CA
    BPL loc_1B_A36F              ; $A373  10 FA
    JSR sub_1B_AA25              ; $A375  20 25 AA
    JSR sub_1B_A8D4              ; $A378  20 D4 A8
    LDA #$00                     ; $A37B  A9 00
    STA $06A0                    ; $A37D  8D A0 06
    LDA #$09                     ; $A380  A9 09
    STA $0680                    ; $A382  8D 80 06
    LDA #$00                     ; $A385  A9 00
    STA $FE                      ; $A387  85 FE

loc_1B_A389:
    LDA $27                      ; $A389  A5 27
    AND #$F0                     ; $A38B  29 F0
    BNE loc_1B_A3A7              ; $A38D  D0 18
    LDA $23                      ; $A38F  A5 23
    AND #$F0                     ; $A391  29 F0
    BEQ loc_1B_A3DA              ; $A393  F0 45
    LDA $25                      ; $A395  A5 25
    CMP $23                      ; $A397  C5 23
    BNE loc_1B_A3DA              ; $A399  D0 3F
    INC $FE                      ; $A39B  E6 FE
    LDA $FE                      ; $A39D  A5 FE
    CMP #$18                     ; $A39F  C9 18
    BCC loc_1B_A3DE              ; $A3A1  90 3B
    LDA #$08                     ; $A3A3  A9 08
    STA $FE                      ; $A3A5  85 FE

loc_1B_A3A7:
    LDA #$2F                     ; $A3A7  A9 2F
    JSR sub_1E_C051              ; $A3A9  20 51 C0
    LDX $06A0                    ; $A3AC  AE A0 06
    LDA $23                      ; $A3AF  A5 23
    AND #$C0                     ; $A3B1  29 C0
    BEQ loc_1B_A3C5              ; $A3B3  F0 10
    AND #$80                     ; $A3B5  29 80
    BEQ loc_1B_A3BF              ; $A3B7  F0 06
    LDA $B02D,X                  ; $A3B9  BD 2D B0
    JMP loc_1B_A3D4              ; $A3BC  4C D4 A3


loc_1B_A3BF:
    LDA $B046,X                  ; $A3BF  BD 46 B0
    JMP loc_1B_A3D4              ; $A3C2  4C D4 A3


loc_1B_A3C5:
    LDA $23                      ; $A3C5  A5 23
    AND #$10                     ; $A3C7  29 10
    BEQ loc_1B_A3D1              ; $A3C9  F0 06
    LDA $B05F,X                  ; $A3CB  BD 5F B0
    JMP loc_1B_A3D4              ; $A3CE  4C D4 A3


loc_1B_A3D1:
    LDA $B078,X                  ; $A3D1  BD 78 B0

loc_1B_A3D4:
    STA $06A0                    ; $A3D4  8D A0 06
    JMP loc_1B_A3DE              ; $A3D7  4C DE A3


loc_1B_A3DA:
    LDA #$00                     ; $A3DA  A9 00
    STA $FE                      ; $A3DC  85 FE

loc_1B_A3DE:
    LDA $27                      ; $A3DE  A5 27
    AND #$03                     ; $A3E0  29 03
    BEQ loc_1B_A40C              ; $A3E2  F0 28
    LDA $27                      ; $A3E4  A5 27
    LDX $06A0                    ; $A3E6  AE A0 06
    AND #$01                     ; $A3E9  29 01
    BEQ loc_1B_A401              ; $A3EB  F0 14
    LDA $0420,X                  ; $A3ED  BD 20 04
    BNE loc_1B_A40C              ; $A3F0  D0 1A
    LDA #$42                     ; $A3F2  A9 42
    JSR sub_1E_C051              ; $A3F4  20 51 C0
    INC $0420,X                  ; $A3F7  FE 20 04
    DEC $0680                    ; $A3FA  CE 80 06
    BEQ loc_1B_A415              ; $A3FD  F0 16
    BNE loc_1B_A40C              ; $A3FF  D0 0B

loc_1B_A401:
    LDA $0420,X                  ; $A401  BD 20 04
    BEQ loc_1B_A40C              ; $A404  F0 06
    DEC $0420,X                  ; $A406  DE 20 04
    INC $0680                    ; $A409  EE 80 06

loc_1B_A40C:
    JSR sub_1B_A927              ; $A40C  20 27 A9
    JSR sub_1E_C0AB              ; $A40F  20 AB C0
    JMP loc_1B_A389              ; $A412  4C 89 A3


loc_1B_A415:
    JSR sub_1B_A927              ; $A415  20 27 A9
    LDA #$0F                     ; $A418  A9 0F
    STA $036C                    ; $A41A  8D 6C 03
    LDX #$00                     ; $A41D  A2 00

loc_1B_A41F:
    LDA $0420,X                  ; $A41F  BD 20 04
    BNE loc_1B_A429              ; $A422  D0 05
    INX                          ; $A424  E8
    CPX #$04                     ; $A425  E0 04
    BNE loc_1B_A41F              ; $A427  D0 F6

loc_1B_A429:
    STX $04                      ; $A429  86 04
    TXA                          ; $A42B  8A
    CLC                          ; $A42C  18
    ADC #$05                     ; $A42D  69 05
    TAX                          ; $A42F  AA
    LDA #$00                     ; $A430  A9 00
    STA $01                      ; $A432  85 01
    STA $02                      ; $A434  85 02
    STA $03                      ; $A436  85 03

loc_1B_A438:
    LDA $0420,X                  ; $A438  BD 20 04
    BEQ loc_1B_A44E              ; $A43B  F0 11
    LDY $01                      ; $A43D  A4 01
    LDA $B0A9,Y                  ; $A43F  B9 A9 B0
    PHA                          ; $A442  48
    LDA $B0BD,Y                  ; $A443  B9 BD B0
    TAY                          ; $A446  A8
    PLA                          ; $A447  68
    ORA $0002,Y                  ; $A448  19 02 00
    STA $0002,Y                  ; $A44B  99 02 00

loc_1B_A44E:
    INX                          ; $A44E  E8
    CPX #$19                     ; $A44F  E0 19
    BNE loc_1B_A455              ; $A451  D0 02
    LDX #$05                     ; $A453  A2 05

loc_1B_A455:
    INC $01                      ; $A455  E6 01
    LDA $01                      ; $A457  A5 01
    CMP #$14                     ; $A459  C9 14
    BNE loc_1B_A438              ; $A45B  D0 DB
    LDA $02                      ; $A45D  A5 02
    ORA $03                      ; $A45F  05 03
    CMP #$FF                     ; $A461  C9 FF
    BNE loc_1B_A468              ; $A463  D0 03
    JMP loc_1B_A4AD              ; $A465  4C AD A4


loc_1B_A468:
    LDX #$02                     ; $A468  A2 02
    JSR sub_1B_A98B              ; $A46A  20 8B A9
    LDA #$7D                     ; $A46D  A9 7D
    STA $FD                      ; $A46F  85 FD

loc_1B_A471:
    JSR sub_1E_C0AB              ; $A471  20 AB C0
    DEC $FD                      ; $A474  C6 FD
    BNE loc_1B_A471              ; $A476  D0 F9
    LDX #$03                     ; $A478  A2 03
    JSR sub_1B_A98B              ; $A47A  20 8B A9
    JSR sub_1B_A898              ; $A47D  20 98 A8
    JSR sub_1A_8473              ; $A480  20 73 84
    JSR sub_1B_AA09              ; $A483  20 09 AA
    JSR sub_1B_A8D4              ; $A486  20 D4 A8
    LDA #$7D                     ; $A489  A9 7D
    STA $FD                      ; $A48B  85 FD

loc_1B_A48D:
    JSR sub_1E_C0AB              ; $A48D  20 AB C0
    DEC $FD                      ; $A490  C6 FD
    BNE loc_1B_A48D              ; $A492  D0 F9
    JSR sub_1B_A898              ; $A494  20 98 A8
    LDX #$00                     ; $A497  A2 00
    JSR sub_1B_A98B              ; $A499  20 8B A9
    JSR sub_1E_C0AB              ; $A49C  20 AB C0
    LDX #$01                     ; $A49F  A2 01
    JSR sub_1B_A98B              ; $A4A1  20 8B A9
    JSR sub_1E_C0AB              ; $A4A4  20 AB C0
    JSR sub_1B_A8D4              ; $A4A7  20 D4 A8
    JMP loc_1B_A311              ; $A4AA  4C 11 A3


loc_1B_A4AD:
    LDA $02                      ; $A4AD  A5 02
    STA $9A                      ; $A4AF  85 9A
    AND #$03                     ; $A4B1  29 03
    STA $9B                      ; $A4B3  85 9B
    LDA $9A                      ; $A4B5  A5 9A
    AND #$20                     ; $A4B7  29 20
    LSR A                        ; $A4B9  4A
    LSR A                        ; $A4BA  4A
    LSR A                        ; $A4BB  4A
    ORA $9B                      ; $A4BC  05 9B
    STA $9B                      ; $A4BE  85 9B
    LDA $04                      ; $A4C0  A5 04
    STA $A7                      ; $A4C2  85 A7
    LDA #$C0                     ; $A4C4  A9 C0
    STA $FD                      ; $A4C6  85 FD
    LDA #$8D                     ; $A4C8  A9 8D
    STA $FE                      ; $A4CA  85 FE
    JSR sub_1B_A9EA              ; $A4CC  20 EA A9
    LDA #$3C                     ; $A4CF  A9 3C
    STA $FD                      ; $A4D1  85 FD

loc_1B_A4D3:
    JSR sub_1E_C0AB              ; $A4D3  20 AB C0
    DEC $FD                      ; $A4D6  C6 FD
    BNE loc_1B_A4D3              ; $A4D8  D0 F9
    JSR sub_1B_A898              ; $A4DA  20 98 A8
    JSR sub_1A_8473              ; $A4DD  20 73 84
    JSR sub_1B_A9CC              ; $A4E0  20 CC A9
    LDA $9A                      ; $A4E3  A5 9A
    STA $01                      ; $A4E5  85 01
    LDA $9B                      ; $A4E7  A5 9B
    STA $02                      ; $A4E9  85 02
    LDX #$00                     ; $A4EB  A2 00
    BEQ loc_1B_A4FB              ; $A4ED  F0 0C

loc_1B_A4EF:
    LSR $02                      ; $A4EF  46 02
    ROR $01                      ; $A4F1  66 01
    BCS loc_1B_A4FB              ; $A4F3  B0 06
    INX                          ; $A4F5  E8
    INX                          ; $A4F6  E8
    INX                          ; $A4F7  E8
    INX                          ; $A4F8  E8
    BNE loc_1B_A507              ; $A4F9  D0 0C

loc_1B_A4FB:
    LDY #$04                     ; $A4FB  A0 04

loc_1B_A4FD:
    LDA $B0D1,X                  ; $A4FD  BD D1 B0
    STA $0200,X                  ; $A500  9D 00 02
    INX                          ; $A503  E8
    DEY                          ; $A504  88
    BNE loc_1B_A4FD              ; $A505  D0 F6

loc_1B_A507:
    CPX #$30                     ; $A507  E0 30
    BNE loc_1B_A4EF              ; $A509  D0 E4
    JSR sub_1B_A8D4              ; $A50B  20 D4 A8
    LDA #$7D                     ; $A50E  A9 7D
    STA $FD                      ; $A510  85 FD

loc_1B_A512:
    JSR sub_1E_C0AB              ; $A512  20 AB C0
    DEC $FD                      ; $A515  C6 FD
    BNE loc_1B_A512              ; $A517  D0 F9

loc_1B_A519:
    JSR sub_1B_A52D              ; $A519  20 2D A5
    RTS                          ; $A51C  60


sub_1B_A51D:
    LDA $F8                      ; $A51D  A5 F8
    ORA #$18                     ; $A51F  09 18
    STA $F8                      ; $A521  85 F8
    LDA $F7                      ; $A523  A5 F7
    ORA #$80                     ; $A525  09 80
    STA $F7                      ; $A527  85 F7
    STA $2000                    ; $A529  8D 00 20
    RTS                          ; $A52C  60


sub_1B_A52D:
    LDA #$10                     ; $A52D  A9 10
    STA $F7                      ; $A52F  85 F7
    STA $2000                    ; $A531  8D 00 20
    LDA #$06                     ; $A534  A9 06
    STA $F8                      ; $A536  85 F8
    STA $2001                    ; $A538  8D 01 20
    RTS                          ; $A53B  60


sub_1B_A53C:
    LDA $08                      ; $A53C  A5 08
    PHA                          ; $A53E  48
    LDA $09                      ; $A53F  A5 09
    PHA                          ; $A541  48
    LDA $1B                      ; $A542  A5 1B
    JSR sub_1E_D11B              ; $A544  20 1B D1
    CLC                          ; $A547  18
    PLA                          ; $A548  68
    STA $09                      ; $A549  85 09
    PLA                          ; $A54B  68
    STA $08                      ; $A54C  85 08
    INC $08                      ; $A54E  E6 08
    INC $1A                      ; $A550  E6 1A
    RTS                          ; $A552  60


sub_1B_A553:
    LDY $FD                      ; $A553  A4 FD
    LDX #$00                     ; $A555  A2 00

loc_1B_A557:
    LDA #$46                     ; $A557  A9 46
    STA $C9                      ; $A559  85 C9
    LDA #$AD                     ; $A55B  A9 AD
    CLC                          ; $A55D  18
    ADC $C8                      ; $A55E  65 C8
    STA $CA                      ; $A560  85 CA
    LDA ($C9),Y                  ; $A562  B1 C9
    STA $03B8,X                  ; $A564  9D B8 03
    TYA                          ; $A567  98
    CLC                          ; $A568  18
    ADC #$01                     ; $A569  69 01
    TAY                          ; $A56B  A8
    LDA $C8                      ; $A56C  A5 C8
    ADC #$00                     ; $A56E  69 00
    STA $C8                      ; $A570  85 C8
    INX                          ; $A572  E8
    CPX #$1B                     ; $A573  E0 1B
    BNE loc_1B_A557              ; $A575  D0 E0
    STX $47                      ; $A577  86 47
    STY $FD                      ; $A579  84 FD
    RTS                          ; $A57B  60


sub_1B_A57C:
    STA $00                      ; $A57C  85 00
    LDA $00                      ; $A57E  A5 00
    AND #$01                     ; $A580  29 01
    BEQ loc_1B_A5A8              ; $A582  F0 24
    LDA $00                      ; $A584  A5 00
    EOR #$3F                     ; $A586  49 3F
    TAX                          ; $A588  AA
    LDA $B2F1,X                  ; $A589  BD F1 B2
    STA $03B9                    ; $A58C  8D B9 03
    LDA $B2F2,X                  ; $A58F  BD F2 B2
    STA $03B8                    ; $A592  8D B8 03
    LDA #$23                     ; $A595  A9 23
    STA $03B6                    ; $A597  8D B6 03
    LDX $00                      ; $A59A  A6 00
    DEX                          ; $A59C  CA
    TXA                          ; $A59D  8A
    ORA #$C0                     ; $A59E  09 C0
    STA $03B7                    ; $A5A0  8D B7 03
    LDA #$02                     ; $A5A3  A9 02
    STA $47                      ; $A5A5  85 47
    RTS                          ; $A5A7  60


loc_1B_A5A8:
    LDA $00                      ; $A5A8  A5 00
    LSR A                        ; $A5AA  4A
    CMP #$1E                     ; $A5AB  C9 1E
    BCC loc_1B_A5B0              ; $A5AD  90 01
    RTS                          ; $A5AF  60


loc_1B_A5B0:
    ASL A                        ; $A5B0  0A
    ASL A                        ; $A5B1  0A
    ASL A                        ; $A5B2  0A
    ASL A                        ; $A5B3  0A
    ROL $08                      ; $A5B4  26 08
    ASL A                        ; $A5B6  0A
    ROL $08                      ; $A5B7  26 08
    STA $03B7                    ; $A5B9  8D B7 03
    LDA $08                      ; $A5BC  A5 08
    AND #$03                     ; $A5BE  29 03
    ORA #$20                     ; $A5C0  09 20
    STA $03B6                    ; $A5C2  8D B6 03
    LDA $00                      ; $A5C5  A5 00
    LSR A                        ; $A5C7  4A
    EOR #$1F                     ; $A5C8  49 1F
    STA $09                      ; $A5CA  85 09
    LDA #$00                     ; $A5CC  A9 00
    LSR $09                      ; $A5CE  46 09
    ROR A                        ; $A5D0  6A
    LSR $09                      ; $A5D1  46 09
    ROR A                        ; $A5D3  6A
    LSR $09                      ; $A5D4  46 09
    ROR A                        ; $A5D6  6A
    STA $08                      ; $A5D7  85 08
    CLC                          ; $A5D9  18
    LDA $08                      ; $A5DA  A5 08
    ADC #$F1                     ; $A5DC  69 F1
    STA $08                      ; $A5DE  85 08
    LDA $09                      ; $A5E0  A5 09
    ADC #$B2                     ; $A5E2  69 B2
    STA $09                      ; $A5E4  85 09
    LDY #$1F                     ; $A5E6  A0 1F

loc_1B_A5E8:
    LDA ($08),Y                  ; $A5E8  B1 08
    STA $03B8,Y                  ; $A5EA  99 B8 03
    DEY                          ; $A5ED  88
    BPL loc_1B_A5E8              ; $A5EE  10 F8
    LDA #$20                     ; $A5F0  A9 20
    STA $47                      ; $A5F2  85 47
    RTS                          ; $A5F4  60


sub_1B_A5F5:
    DEC $0690                    ; $A5F5  CE 90 06
    BNE loc_1B_A60E              ; $A5F8  D0 14
    LDA #$05                     ; $A5FA  A9 05
    STA $0690                    ; $A5FC  8D 90 06
    INC $0410                    ; $A5FF  EE 10 04
    LDA $0410                    ; $A602  AD 10 04
    CMP #$02                     ; $A605  C9 02
    BNE loc_1B_A60E              ; $A607  D0 05
    LDA #$00                     ; $A609  A9 00
    STA $0410                    ; $A60B  8D 10 04

loc_1B_A60E:
    RTS                          ; $A60E  60

    .byte $A2,$14,$BD,$CF,$AA,$9D,$EC,$02,$CA,$10,$F7,$60  ; $A60F

sub_1B_A61B:
    LDX #$02                     ; $A61B  A2 02

loc_1B_A61D:
    STX $2B                      ; $A61D  86 2B
    LDA $0400,X                  ; $A61F  BD 00 04
    BEQ loc_1B_A64D              ; $A622  F0 29
    CLC                          ; $A624  18
    LDA $04C0,X                  ; $A625  BD C0 04
    ADC $0660                    ; $A628  6D 60 06
    STA $04C0,X                  ; $A62B  9D C0 04
    LDA $04A0,X                  ; $A62E  BD A0 04
    ADC $0640                    ; $A631  6D 40 06
    STA $04A0,X                  ; $A634  9D A0 04
    LDA $0440,X                  ; $A637  BD 40 04
    ADC #$00                     ; $A63A  69 00
    STA $0440,X                  ; $A63C  9D 40 04
    BNE loc_1B_A64D              ; $A63F  D0 0C
    LDA $04A0,X                  ; $A641  BD A0 04
    CMP #$E8                     ; $A644  C9 E8
    BCC loc_1B_A64D              ; $A646  90 05
    LDA #$00                     ; $A648  A9 00
    STA $0400,X                  ; $A64A  9D 00 04

loc_1B_A64D:
    LDX $2B                      ; $A64D  A6 2B
    INX                          ; $A64F  E8
    CPX #$0F                     ; $A650  E0 0F
    BNE loc_1B_A61D              ; $A652  D0 C9
    LDA $AE                      ; $A654  A5 AE
    BNE loc_1B_A65E              ; $A656  D0 06
    LDA $22                      ; $A658  A5 22
    CMP #$A8                     ; $A65A  C9 A8
    BCC loc_1B_A6A6              ; $A65C  90 48

loc_1B_A65E:
    SEC                          ; $A65E  38
    LDA $04C0                    ; $A65F  AD C0 04
    SBC $0660                    ; $A662  ED 60 06
    STA $04C0                    ; $A665  8D C0 04
    LDA $04A0                    ; $A668  AD A0 04
    SBC $0640                    ; $A66B  ED 40 06
    STA $04A0                    ; $A66E  8D A0 04
    BCS loc_1B_A682              ; $A671  B0 0F
    LDA #$01                     ; $A673  A9 01
    JSR sub_1B_A6D3              ; $A675  20 D3 A6
    LDA #$00                     ; $A678  A9 00
    STA $04C0                    ; $A67A  8D C0 04
    LDA #$48                     ; $A67D  A9 48
    STA $04A0                    ; $A67F  8D A0 04

loc_1B_A682:
    SEC                          ; $A682  38
    LDA $04C1                    ; $A683  AD C1 04
    SBC $0660                    ; $A686  ED 60 06
    STA $04C1                    ; $A689  8D C1 04
    LDA $04A1                    ; $A68C  AD A1 04
    SBC $0640                    ; $A68F  ED 40 06
    STA $04A1                    ; $A692  8D A1 04
    BCS loc_1B_A6A6              ; $A695  B0 0F
    LDA #$02                     ; $A697  A9 02
    JSR sub_1B_A6D3              ; $A699  20 D3 A6
    LDA #$00                     ; $A69C  A9 00
    STA $04C1                    ; $A69E  8D C1 04
    LDA #$48                     ; $A6A1  A9 48
    STA $04A1                    ; $A6A3  8D A1 04

loc_1B_A6A6:
    CLC                          ; $A6A6  18
    LDA $0660                    ; $A6A7  AD 60 06
    ADC #$02                     ; $A6AA  69 02
    STA $0660                    ; $A6AC  8D 60 06
    LDA $0640                    ; $A6AF  AD 40 06
    ADC #$00                     ; $A6B2  69 00
    STA $0640                    ; $A6B4  8D 40 06
    CMP #$02                     ; $A6B7  C9 02
    BNE loc_1B_A6C0              ; $A6B9  D0 05
    LDA #$00                     ; $A6BB  A9 00
    STA $0660                    ; $A6BD  8D 60 06

loc_1B_A6C0:
    CLC                          ; $A6C0  18
    LDA $04B0                    ; $A6C1  AD B0 04
    ADC $0640                    ; $A6C4  6D 40 06
    STA $04B0                    ; $A6C7  8D B0 04
    LDA $0450                    ; $A6CA  AD 50 04
    ADC #$00                     ; $A6CD  69 00
    STA $0450                    ; $A6CF  8D 50 04
    RTS                          ; $A6D2  60


sub_1B_A6D3:
    STA $00                      ; $A6D3  85 00
    LDX #$02                     ; $A6D5  A2 02

loc_1B_A6D7:
    LDA $0400,X                  ; $A6D7  BD 00 04
    BEQ loc_1B_A6E2              ; $A6DA  F0 06
    INX                          ; $A6DC  E8
    CPX #$0F                     ; $A6DD  E0 0F
    BNE loc_1B_A6D7              ; $A6DF  D0 F6
    RTS                          ; $A6E1  60


loc_1B_A6E2:
    LDA $00                      ; $A6E2  A5 00
    STA $0400,X                  ; $A6E4  9D 00 04
    LDA #$FF                     ; $A6E7  A9 FF
    STA $0440,X                  ; $A6E9  9D 40 04
    LDA #$E0                     ; $A6EC  A9 E0
    STA $04A0,X                  ; $A6EE  9D A0 04
    LDA #$00                     ; $A6F1  A9 00
    STA $04C0,X                  ; $A6F3  9D C0 04
    RTS                          ; $A6F6  60


sub_1B_A6F7:
    JSR sub_1A_8473              ; $A6F7  20 73 84
    LDA #$00                     ; $A6FA  A9 00
    STA $00                      ; $A6FC  85 00
    LDX #$02                     ; $A6FE  A2 02

loc_1B_A700:
    STX $2B                      ; $A700  86 2B
    LDA $0400,X                  ; $A702  BD 00 04
    BEQ loc_1B_A757              ; $A705  F0 50
    LDY $04A0,X                  ; $A707  BC A0 04
    STY $08                      ; $A70A  84 08
    LDY $0440,X                  ; $A70C  BC 40 04
    STY $09                      ; $A70F  84 09
    LDX #$00                     ; $A711  A2 00
    LDY #$0C                     ; $A713  A0 0C
    CMP #$01                     ; $A715  C9 01
    BEQ loc_1B_A71D              ; $A717  F0 04
    LDY #$04                     ; $A719  A0 04
    LDX #$30                     ; $A71B  A2 30

loc_1B_A71D:
    STY $02                      ; $A71D  84 02
    LDY $00                      ; $A71F  A4 00

loc_1B_A721:
    CLC                          ; $A721  18
    LDA $08                      ; $A722  A5 08
    ADC $AAE3,X                  ; $A724  7D E3 AA
    STA $0200,Y                  ; $A727  99 00 02
    LDA $09                      ; $A72A  A5 09
    ADC #$00                     ; $A72C  69 00
    BEQ loc_1B_A737              ; $A72E  F0 07
    LDA #$F8                     ; $A730  A9 F8
    STA $0200,Y                  ; $A732  99 00 02
    BNE loc_1B_A74D              ; $A735  D0 16

loc_1B_A737:
    LDA $AAE4,X                  ; $A737  BD E4 AA
    STA $0201,Y                  ; $A73A  99 01 02
    LDA $AAE5,X                  ; $A73D  BD E5 AA
    STA $0202,Y                  ; $A740  99 02 02
    LDA $AAE6,X                  ; $A743  BD E6 AA
    STA $0203,Y                  ; $A746  99 03 02
    INY                          ; $A749  C8
    INY                          ; $A74A  C8
    INY                          ; $A74B  C8
    INY                          ; $A74C  C8

loc_1B_A74D:
    INX                          ; $A74D  E8
    INX                          ; $A74E  E8
    INX                          ; $A74F  E8
    INX                          ; $A750  E8
    DEC $02                      ; $A751  C6 02
    BNE loc_1B_A721              ; $A753  D0 CC
    STY $00                      ; $A755  84 00

loc_1B_A757:
    LDX $2B                      ; $A757  A6 2B
    INX                          ; $A759  E8
    CPX #$0F                     ; $A75A  E0 0F
    BNE loc_1B_A700              ; $A75C  D0 A2
    RTS                          ; $A75E  60


sub_1B_A75F:
    LDX $0410                    ; $A75F  AE 10 04
    LDA $AB23,X                  ; $A762  BD 23 AB
    STA $08                      ; $A765  85 08
    LDA $AB30,X                  ; $A767  BD 30 AB
    STA $09                      ; $A76A  85 09
    LDY #$00                     ; $A76C  A0 00
    LDA ($08),Y                  ; $A76E  B1 08
    STA $01                      ; $A770  85 01
    LDX $00                      ; $A772  A6 00
    BEQ loc_1B_A7AF              ; $A774  F0 39
    INY                          ; $A776  C8

loc_1B_A777:
    CLC                          ; $A777  18
    LDA $04B0                    ; $A778  AD B0 04
    ADC ($08),Y                  ; $A77B  71 08
    STA $0200,X                  ; $A77D  9D 00 02
    LDA $0450                    ; $A780  AD 50 04
    ADC #$00                     ; $A783  69 00
    BEQ loc_1B_A792              ; $A785  F0 0B
    INY                          ; $A787  C8
    INY                          ; $A788  C8
    INY                          ; $A789  C8
    INY                          ; $A78A  C8
    LDA #$F8                     ; $A78B  A9 F8
    STA $0200,X                  ; $A78D  9D 00 02
    BNE loc_1B_A7A5              ; $A790  D0 13

loc_1B_A792:
    INY                          ; $A792  C8
    LDA ($08),Y                  ; $A793  B1 08
    STA $0201,X                  ; $A795  9D 01 02
    INY                          ; $A798  C8
    LDA ($08),Y                  ; $A799  B1 08
    STA $0202,X                  ; $A79B  9D 02 02
    INY                          ; $A79E  C8
    LDA ($08),Y                  ; $A79F  B1 08
    STA $0203,X                  ; $A7A1  9D 03 02
    INY                          ; $A7A4  C8

loc_1B_A7A5:
    INX                          ; $A7A5  E8
    INX                          ; $A7A6  E8
    INX                          ; $A7A7  E8
    INX                          ; $A7A8  E8
    BEQ loc_1B_A7AF              ; $A7A9  F0 04
    DEC $01                      ; $A7AB  C6 01
    BNE loc_1B_A777              ; $A7AD  D0 C8

loc_1B_A7AF:
    RTS                          ; $A7AF  60


loc_1B_A7B0:
    JSR sub_1B_A52D              ; $A7B0  20 2D A5
    LDA #$50                     ; $A7B3  A9 50
    STA $FD                      ; $A7B5  85 FD
    LDA #$00                     ; $A7B7  A9 00
    STA $03B7                    ; $A7B9  8D B7 03
    STA $FE                      ; $A7BC  85 FE
    LDA #$10                     ; $A7BE  A9 10
    STA $03B6                    ; $A7C0  8D B6 03
    LDA #$B0                     ; $A7C3  A9 B0
    STA $FF                      ; $A7C5  85 FF

loc_1B_A7C7:
    JSR sub_1E_C747              ; $A7C7  20 47 C7
    JSR sub_1E_D1DF              ; $A7CA  20 DF D1
    CLC                          ; $A7CD  18
    LDA $03B7                    ; $A7CE  AD B7 03
    ADC #$20                     ; $A7D1  69 20
    STA $03B7                    ; $A7D3  8D B7 03
    LDA $03B6                    ; $A7D6  AD B6 03
    ADC #$00                     ; $A7D9  69 00
    STA $03B6                    ; $A7DB  8D B6 03
    CLC                          ; $A7DE  18
    LDA $FE                      ; $A7DF  A5 FE
    ADC #$20                     ; $A7E1  69 20
    STA $FE                      ; $A7E3  85 FE
    LDA $FF                      ; $A7E5  A5 FF
    ADC #$00                     ; $A7E7  69 00
    STA $FF                      ; $A7E9  85 FF
    DEC $FD                      ; $A7EB  C6 FD
    BNE loc_1B_A7C7              ; $A7ED  D0 D8
    LDA #$D1                     ; $A7EF  A9 D1
    STA $08                      ; $A7F1  85 08
    LDA #$B6                     ; $A7F3  A9 B6
    STA $09                      ; $A7F5  85 09
    LDA #$20                     ; $A7F7  A9 20
    STA $2006                    ; $A7F9  8D 06 20
    LDY #$00                     ; $A7FC  A0 00
    STY $2006                    ; $A7FE  8C 06 20
    LDX #$1E                     ; $A801  A2 1E

loc_1B_A803:
    LDY #$00                     ; $A803  A0 00

loc_1B_A805:
    LDA ($08),Y                  ; $A805  B1 08
    STA $2007                    ; $A807  8D 07 20
    INY                          ; $A80A  C8
    CPY #$20                     ; $A80B  C0 20
    BNE loc_1B_A805              ; $A80D  D0 F6
    SEC                          ; $A80F  38
    LDA $08                      ; $A810  A5 08
    SBC #$20                     ; $A812  E9 20
    STA $08                      ; $A814  85 08
    LDA $09                      ; $A816  A5 09
    SBC #$00                     ; $A818  E9 00
    STA $09                      ; $A81A  85 09
    DEX                          ; $A81C  CA
    BNE loc_1B_A803              ; $A81D  D0 E4
    LDY #$3F                     ; $A81F  A0 3F

loc_1B_A821:
    LDA $B2F1,Y                  ; $A821  B9 F1 B2
    STA $2007                    ; $A824  8D 07 20
    DEY                          ; $A827  88
    BPL loc_1B_A821              ; $A828  10 F7
    LDX #$1F                     ; $A82A  A2 1F

loc_1B_A82C:
    LDA $AA8F,X                  ; $A82C  BD 8F AA
    STA $0356,X                  ; $A82F  9D 56 03
    DEX                          ; $A832  CA
    BPL loc_1B_A82C              ; $A833  10 F7
    LDX #$0F                     ; $A835  A2 0F

loc_1B_A837:
    LDA $AABF,X                  ; $A837  BD BF AA
    STA $0356,X                  ; $A83A  9D 56 03
    DEX                          ; $A83D  CA
    BPL loc_1B_A837              ; $A83E  10 F7
    LDX #$1F                     ; $A840  A2 1F
    LDA #$00                     ; $A842  A9 00

loc_1B_A844:
    STA $0440,X                  ; $A844  9D 40 04
    STA $0400,X                  ; $A847  9D 00 04
    DEX                          ; $A84A  CA
    BPL loc_1B_A844              ; $A84B  10 F7
    LDA #$77                     ; $A84D  A9 77
    STA $04B0                    ; $A84F  8D B0 04
    LDA #$00                     ; $A852  A9 00
    STA $0410                    ; $A854  8D 10 04
    LDA #$08                     ; $A857  A9 08
    STA $0690                    ; $A859  8D 90 06
    LDA #$01                     ; $A85C  A9 01
    STA $0402                    ; $A85E  8D 02 04
    LDA #$CC                     ; $A861  A9 CC
    STA $04A2                    ; $A863  8D A2 04
    LDA #$02                     ; $A866  A9 02
    STA $0403                    ; $A868  8D 03 04
    LDA #$A4                     ; $A86B  A9 A4
    STA $04A3                    ; $A86D  8D A3 04
    JSR sub_1B_A51D              ; $A870  20 1D A5
    LDA #$00                     ; $A873  A9 00
    STA $27                      ; $A875  85 27
    STA $22                      ; $A877  85 22
    STA $AE                      ; $A879  85 AE
    JMP loc_1B_A1E0              ; $A87B  4C E0 A1


sub_1B_A87E:
    LDA #$00                     ; $A87E  A9 00
    STA $1A                      ; $A880  85 1A
    STA $1B                      ; $A882  85 1B

loc_1B_A884:
    JSR sub_1E_CA0B              ; $A884  20 0B CA
    INC $08                      ; $A887  E6 08
    INC $1A                      ; $A889  E6 1A
    JSR sub_1E_CA0B              ; $A88B  20 0B CA
    JSR sub_1B_A53C              ; $A88E  20 3C A5
    LDA $08                      ; $A891  A5 08
    AND #$3F                     ; $A893  29 3F
    BNE loc_1B_A884              ; $A895  D0 ED
    RTS                          ; $A897  60


sub_1B_A898:
    LDA #$04                     ; $A898  A9 04
    STA $FD                      ; $A89A  85 FD

loc_1B_A89C:
    LDA $1C                      ; $A89C  A5 1C
    AND #$03                     ; $A89E  29 03
    BNE loc_1B_A8A9              ; $A8A0  D0 07
    JSR sub_1B_A8B0              ; $A8A2  20 B0 A8
    DEC $FD                      ; $A8A5  C6 FD
    BMI loc_1B_A8AF              ; $A8A7  30 06

loc_1B_A8A9:
    JSR sub_1E_C0AB              ; $A8A9  20 AB C0
    JMP loc_1B_A89C              ; $A8AC  4C 9C A8


loc_1B_A8AF:
    RTS                          ; $A8AF  60


sub_1B_A8B0:
    LDX #$07                     ; $A8B0  A2 07
    LDA #$04                     ; $A8B2  A9 04
    JSR sub_1B_A8BF              ; $A8B4  20 BF A8
    LDX #$1F                     ; $A8B7  A2 1F
    LDA #$0F                     ; $A8B9  A9 0F
    JSR sub_1B_A8BF              ; $A8BB  20 BF A8
    RTS                          ; $A8BE  60


sub_1B_A8BF:
    STA $00                      ; $A8BF  85 00

loc_1B_A8C1:
    SEC                          ; $A8C1  38
    LDA $0356,X                  ; $A8C2  BD 56 03
    SBC #$10                     ; $A8C5  E9 10
    BPL loc_1B_A8CB              ; $A8C7  10 02
    LDA #$0F                     ; $A8C9  A9 0F

loc_1B_A8CB:
    STA $0356,X                  ; $A8CB  9D 56 03
    DEX                          ; $A8CE  CA
    CPX $00                      ; $A8CF  E4 00
    BNE loc_1B_A8C1              ; $A8D1  D0 EE
    RTS                          ; $A8D3  60


sub_1B_A8D4:
    LDA #$04                     ; $A8D4  A9 04
    STA $FD                      ; $A8D6  85 FD

loc_1B_A8D8:
    LDA $1C                      ; $A8D8  A5 1C
    AND #$03                     ; $A8DA  29 03
    BNE loc_1B_A8E5              ; $A8DC  D0 07
    JSR sub_1B_A8EC              ; $A8DE  20 EC A8
    DEC $FD                      ; $A8E1  C6 FD
    BMI loc_1B_A8EB              ; $A8E3  30 06

loc_1B_A8E5:
    JSR sub_1E_C0AB              ; $A8E5  20 AB C0
    JMP loc_1B_A8D8              ; $A8E8  4C D8 A8


loc_1B_A8EB:
    RTS                          ; $A8EB  60


sub_1B_A8EC:
    LDX #$07                     ; $A8EC  A2 07
    LDY #$07                     ; $A8EE  A0 07
    LDA #$04                     ; $A8F0  A9 04
    JSR sub_1B_A8FF              ; $A8F2  20 FF A8
    LDX #$1F                     ; $A8F5  A2 1F
    LDY #$1F                     ; $A8F7  A0 1F
    LDA #$0F                     ; $A8F9  A9 0F
    JSR sub_1B_A8FF              ; $A8FB  20 FF A8
    RTS                          ; $A8FE  60


sub_1B_A8FF:
    STA $01                      ; $A8FF  85 01

loc_1B_A901:
    LDA $0356,X                  ; $A901  BD 56 03
    CMP #$0F                     ; $A904  C9 0F
    BNE loc_1B_A910              ; $A906  D0 08
    LDA $AEF9,Y                  ; $A908  B9 F9 AE
    AND #$0F                     ; $A90B  29 0F
    JMP loc_1B_A91D              ; $A90D  4C 1D A9


loc_1B_A910:
    CLC                          ; $A910  18
    LDA $0356,X                  ; $A911  BD 56 03
    ADC #$10                     ; $A914  69 10
    CMP $AEF9,Y                  ; $A916  D9 F9 AE
    BEQ loc_1B_A91D              ; $A919  F0 02
    BCS loc_1B_A920              ; $A91B  B0 03

loc_1B_A91D:
    STA $0356,X                  ; $A91D  9D 56 03

loc_1B_A920:
    DEY                          ; $A920  88
    DEX                          ; $A921  CA
    CPX $01                      ; $A922  E4 01
    BNE loc_1B_A901              ; $A924  D0 DB
    RTS                          ; $A926  60


sub_1B_A927:
    LDX $06A0                    ; $A927  AE A0 06
    LDA $AFFB,X                  ; $A92A  BD FB AF
    STA $09                      ; $A92D  85 09
    LDA $B014,X                  ; $A92F  BD 14 B0
    STA $08                      ; $A932  85 08
    LDX #$0F                     ; $A934  A2 0F

loc_1B_A936:
    CLC                          ; $A936  18
    LDA $B099,X                  ; $A937  BD 99 B0
    ADC $08                      ; $A93A  65 08
    STA $0230,X                  ; $A93C  9D 30 02
    DEX                          ; $A93F  CA
    LDA $B099,X                  ; $A940  BD 99 B0
    STA $0230,X                  ; $A943  9D 30 02
    DEX                          ; $A946  CA
    LDA $B099,X                  ; $A947  BD 99 B0
    STA $0230,X                  ; $A94A  9D 30 02
    DEX                          ; $A94D  CA
    CLC                          ; $A94E  18
    LDA $B099,X                  ; $A94F  BD 99 B0
    ADC $09                      ; $A952  65 09
    STA $0230,X                  ; $A954  9D 30 02
    DEX                          ; $A957  CA
    BPL loc_1B_A936              ; $A958  10 DC
    LDA $1C                      ; $A95A  A5 1C
    LSR A                        ; $A95C  4A
    AND #$07                     ; $A95D  29 07
    TAX                          ; $A95F  AA
    LDA $B091,X                  ; $A960  BD 91 B0
    STA $036C                    ; $A963  8D 6C 03
    CLC                          ; $A966  18
    LDA $0680                    ; $A967  AD 80 06
    ADC #$24                     ; $A96A  69 24
    STA $022D                    ; $A96C  8D 2D 02
    LDX #$00                     ; $A96F  A2 00
    LDY #$40                     ; $A971  A0 40

loc_1B_A973:
    LDA $0420,X                  ; $A973  BD 20 04
    BNE loc_1B_A97C              ; $A976  D0 04
    LDA #$F8                     ; $A978  A9 F8
    BNE loc_1B_A97E              ; $A97A  D0 02

loc_1B_A97C:
    LDA #$3F                     ; $A97C  A9 3F

loc_1B_A97E:
    STA $0201,Y                  ; $A97E  99 01 02
    INY                          ; $A981  C8
    INY                          ; $A982  C8
    INY                          ; $A983  C8
    INY                          ; $A984  C8
    INX                          ; $A985  E8
    CPX #$19                     ; $A986  E0 19
    BNE loc_1B_A973              ; $A988  D0 E9
    RTS                          ; $A98A  60


sub_1B_A98B:
    LDA $AFBD,X                  ; $A98B  BD BD AF
    TAX                          ; $A98E  AA
    LDA $AF39,X                  ; $A98F  BD 39 AF
    STA $03B6                    ; $A992  8D B6 03
    INX                          ; $A995  E8
    LDA $AF39,X                  ; $A996  BD 39 AF
    STA $03B7                    ; $A999  8D B7 03
    INX                          ; $A99C  E8
    LDA $AF39,X                  ; $A99D  BD 39 AF
    STA $47                      ; $A9A0  85 47
    INX                          ; $A9A2  E8
    LDY #$00                     ; $A9A3  A0 00

loc_1B_A9A5:
    LDA $AF39,X                  ; $A9A5  BD 39 AF
    STA $03B8,Y                  ; $A9A8  99 B8 03
    INX                          ; $A9AB  E8
    INY                          ; $A9AC  C8
    CPY $47                      ; $A9AD  C4 47
    BNE loc_1B_A9A5              ; $A9AF  D0 F4
    RTS                          ; $A9B1  60


sub_1B_A9B2:
    STA $20                      ; $A9B2  85 20
    LDA #$00                     ; $A9B4  A9 00
    STA $1F                      ; $A9B6  85 1F
    STA $22                      ; $A9B8  85 22
    LDX #$21                     ; $A9BA  A2 21

loc_1B_A9BC:
    LDA $AEF7,X                  ; $A9BC  BD F7 AE
    STA $0354,X                  ; $A9BF  9D 54 03
    DEX                          ; $A9C2  CA
    BPL loc_1B_A9BC              ; $A9C3  10 F7
    JSR sub_1A_8473              ; $A9C5  20 73 84
    JSR sub_1B_A51D              ; $A9C8  20 1D A5
    RTS                          ; $A9CB  60


sub_1B_A9CC:
    CLC                          ; $A9CC  18
    LDA $1F                      ; $A9CD  A5 1F
    ADC #$08                     ; $A9CF  69 08
    STA $1F                      ; $A9D1  85 1F
    PHP                          ; $A9D3  08
    LDA $20                      ; $A9D4  A5 20
    ADC #$00                     ; $A9D6  69 00
    STA $20                      ; $A9D8  85 20
    PLP                          ; $A9DA  28
    BEQ loc_1B_A9E9              ; $A9DB  F0 0C
    JSR sub_1E_C0AB              ; $A9DD  20 AB C0
    JSR sub_1E_C0AB              ; $A9E0  20 AB C0
    JSR sub_1E_C0AB              ; $A9E3  20 AB C0
    JMP sub_1B_A9CC              ; $A9E6  4C CC A9


loc_1B_A9E9:
    RTS                          ; $A9E9  60


sub_1B_A9EA:
    LDA #$00                     ; $A9EA  A9 00
    STA $1B                      ; $A9EC  85 1B
    STA $1A                      ; $A9EE  85 1A

loc_1B_A9F0:
    LDA $FD                      ; $A9F0  A5 FD
    STA $08                      ; $A9F2  85 08
    LDA $FE                      ; $A9F4  A5 FE
    STA $09                      ; $A9F6  85 09
    JSR sub_1E_CA0B              ; $A9F8  20 0B CA
    INC $FD                      ; $A9FB  E6 FD
    INC $1A                      ; $A9FD  E6 1A
    JSR sub_1E_C0AB              ; $A9FF  20 AB C0
    LDA $FD                      ; $AA02  A5 FD
    AND #$3F                     ; $AA04  29 3F
    BNE loc_1B_A9F0              ; $AA06  D0 E8
    RTS                          ; $AA08  60


sub_1B_AA09:
    SEC                          ; $AA09  38
    LDA $1F                      ; $AA0A  A5 1F
    SBC #$08                     ; $AA0C  E9 08
    STA $1F                      ; $AA0E  85 1F
    BEQ loc_1B_AA24              ; $AA10  F0 12
    LDA $20                      ; $AA12  A5 20
    SBC #$00                     ; $AA14  E9 00
    STA $20                      ; $AA16  85 20
    JSR sub_1E_C0AB              ; $AA18  20 AB C0
    JSR sub_1E_C0AB              ; $AA1B  20 AB C0
    JSR sub_1E_C0AB              ; $AA1E  20 AB C0
    JMP sub_1B_AA09              ; $AA21  4C 09 AA


loc_1B_AA24:
    RTS                          ; $AA24  60


sub_1B_AA25:
    LDX #$00                     ; $AA25  A2 00
    LDY #$40                     ; $AA27  A0 40

loc_1B_AA29:
    CLC                          ; $AA29  18
    LDA $AFFB,X                  ; $AA2A  BD FB AF
    ADC #$04                     ; $AA2D  69 04
    STA $0200,Y                  ; $AA2F  99 00 02
    INY                          ; $AA32  C8
    LDA #$0F                     ; $AA33  A9 0F
    STA $0200,Y                  ; $AA35  99 00 02
    INY                          ; $AA38  C8
    LDA #$00                     ; $AA39  A9 00
    STA $0200,Y                  ; $AA3B  99 00 02
    INY                          ; $AA3E  C8
    CLC                          ; $AA3F  18
    LDA $B014,X                  ; $AA40  BD 14 B0
    ADC #$04                     ; $AA43  69 04
    STA $0200,Y                  ; $AA45  99 00 02
    INY                          ; $AA48  C8
    INX                          ; $AA49  E8
    CPX #$19                     ; $AA4A  E0 19
    BNE loc_1B_AA29              ; $AA4C  D0 DB
    RTS                          ; $AA4E  60

    .byte $0F,$0F,$0F,$04,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$07,$0F,$0F,$0F,$00  ; $AA4F
    .byte $0F,$0F,$2C,$11,$0F,$0F,$30,$38,$0F,$0F,$0C,$00,$0F,$0F,$0F,$00  ; $AA5F
    .byte $0F,$00,$03,$14,$0F,$0F,$01,$00,$0F,$00,$04,$17,$0F,$00,$00,$10  ; $AA6F
    .byte $0F,$0F,$2C,$11,$0F,$0F,$30,$38,$0F,$10,$1C,$01,$0F,$00,$00,$10  ; $AA7F
    .byte $0F,$03,$13,$24,$0F,$0F,$11,$0C,$0F,$04,$14,$27,$0F,$00,$10,$30  ; $AA8F
    .byte $0F,$0F,$2C,$11,$0F,$0F,$30,$38,$0F,$30,$2C,$11,$0F,$00,$10,$30  ; $AA9F
    .byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$00,$10,$30  ; $AAAF
    .byte $26,$15,$20,$06,$0F,$30,$2C,$15,$26,$21,$20,$0B,$0F,$00,$10,$30  ; $AABF
    .byte $2F,$3C,$02,$C0,$37,$3D,$02,$C0,$3F,$3B,$02,$C0,$3F,$3A,$02,$B8  ; $AACF
    .byte $3F,$39,$02,$B0,$00,$30,$02,$C0,$00,$31,$02,$C8,$08,$32,$02,$C0  ; $AADF
    .byte $08,$33,$02,$C8,$10,$34,$02,$C0,$10,$35,$02,$C8,$00,$30,$02,$E0  ; $AAEF
    .byte $00,$31,$02,$E8,$08,$32,$02,$E0,$08,$33,$02,$E8,$10,$34,$02,$E0  ; $AAFF
    .byte $10,$35,$02,$E8,$00,$36,$03,$98,$08,$37,$03,$98,$10,$37,$03,$98  ; $AB0F
    .byte $18,$38,$03,$98,$3D,$6A,$97,$C8,$F9,$2E,$57,$80,$A9,$D2,$FB,$0C  ; $AB1F
    .byte $35,$AB,$AB,$AB,$AB,$AB,$AC,$AC,$AC,$AC,$AC,$AC,$AD,$AD,$0B,$00  ; $AB2F
    .byte $00,$01,$C8,$00,$01,$01,$D0,$00,$02,$01,$D8,$08,$03,$00,$C8,$08  ; $AB3F
    .byte $04,$00,$D0,$08,$05,$00,$D8,$08,$1F,$01,$C8,$08,$20,$01,$D0,$10  ; $AB4F
    .byte $06,$00,$C8,$10,$07,$00,$D0,$10,$08,$00,$D8,$0B,$00,$09,$01,$C8  ; $AB5F
    .byte $00,$0A,$01,$D0,$00,$0B,$01,$D8,$08,$03,$00,$C8,$08,$04,$00,$D0  ; $AB6F
    .byte $08,$05,$00,$D8,$08,$1F,$01,$C8,$08,$20,$01,$D0,$10,$06,$00,$C8  ; $AB7F
    .byte $10,$07,$00,$D0,$10,$08,$00,$D8,$0C,$00,$0C,$01,$C8,$00,$0D,$01  ; $AB8F
    .byte $D0,$00,$02,$01,$D8,$00,$21,$00,$D0,$08,$03,$00,$C8,$08,$04,$00  ; $AB9F
    .byte $D0,$08,$05,$00,$D8,$08,$23,$01,$C8,$08,$24,$01,$D0,$10,$06,$00  ; $ABAF
    .byte $C8,$10,$07,$00,$D0,$10,$08,$00,$D8,$0C,$00,$0C,$01,$C8,$00,$0E  ; $ABBF
    .byte $01,$D0,$00,$02,$01,$D8,$00,$22,$00,$D0,$08,$03,$00,$C8,$08,$04  ; $ABCF
    .byte $00,$D0,$08,$05,$00,$D8,$08,$23,$01,$C8,$08,$24,$01,$D0,$10,$06  ; $ABDF
    .byte $00,$C8,$10,$07,$00,$D0,$10,$08,$00,$D8,$0D,$00,$0F,$01,$C8,$00  ; $ABEF
    .byte $10,$01,$D0,$00,$11,$01,$D8,$00,$25,$00,$C8,$00,$26,$00,$D0,$08  ; $ABFF
    .byte $03,$00,$C8,$08,$04,$00,$D0,$08,$05,$00,$D8,$08,$1F,$01,$C8,$08  ; $AC0F
    .byte $20,$01,$D0,$10,$06,$00,$C8,$10,$07,$00,$D0,$10,$08,$00,$D8,$0A  ; $AC1F
    .byte $00,$12,$00,$C8,$00,$13,$00,$D0,$00,$14,$00,$D8,$08,$03,$00,$C8  ; $AC2F
    .byte $08,$15,$00,$D0,$08,$05,$00,$D8,$10,$06,$00,$C8,$10,$07,$00,$D0  ; $AC3F
    .byte $10,$08,$00,$D8,$06,$27,$01,$CF,$0A,$00,$12,$00,$C8,$00,$16,$00  ; $AC4F
    .byte $D0,$00,$17,$00,$D8,$08,$03,$00,$C8,$08,$18,$00,$D0,$08,$19,$00  ; $AC5F
    .byte $D8,$10,$06,$00,$C8,$10,$07,$00,$D0,$10,$08,$00,$D8,$06,$28,$01  ; $AC6F
    .byte $CF,$0A,$00,$12,$00,$C8,$00,$1A,$00,$D0,$00,$17,$00,$D8,$08,$03  ; $AC7F
    .byte $00,$C8,$08,$1B,$00,$D0,$08,$05,$00,$D8,$10,$06,$00,$C8,$10,$07  ; $AC8F
    .byte $00,$D0,$10,$08,$00,$D8,$06,$28,$01,$CF,$0A,$00,$1C,$00,$C8,$00  ; $AC9F
    .byte $1D,$00,$D0,$00,$17,$00,$D8,$08,$03,$00,$C8,$08,$18,$00,$D0,$08  ; $ACAF
    .byte $05,$00,$D8,$10,$06,$00,$C8,$10,$07,$00,$D0,$10,$08,$00,$D8,$06  ; $ACBF
    .byte $28,$01,$CF,$0A,$00,$1C,$00,$C8,$00,$1E,$00,$D0,$00,$17,$00,$D8  ; $ACCF
    .byte $08,$03,$00,$C8,$08,$18,$00,$D0,$08,$05,$00,$D8,$10,$06,$00,$C8  ; $ACDF
    .byte $10,$07,$00,$D0,$10,$08,$00,$D8,$06,$28,$01,$CF,$04,$F8,$2A,$00  ; $ACEF
    .byte $D0,$00,$2A,$00,$D0,$08,$2A,$00,$D0,$10,$2A,$00,$D0,$0A,$F8,$2F  ; $ACFF
    .byte $00,$D0,$00,$2C,$00,$C8,$00,$2D,$00,$D0,$00,$2C,$40,$D8,$08,$2C  ; $AD0F
    .byte $00,$C8,$08,$2D,$00,$D0,$08,$2C,$40,$D8,$10,$2B,$00,$C8,$10,$2E  ; $AD1F
    .byte $00,$D0,$10,$2B,$40,$D8,$04,$08,$2F,$00,$D0,$10,$2B,$00,$C8,$10  ; $AD2F
    .byte $2E,$00,$D0,$10,$2B,$40,$D8,$00,$00,$00,$C9,$CE,$00,$D4,$C8,$C5  ; $AD3F
    .byte $00,$D9,$C5,$C1,$D2,$00,$CF,$C6,$00,$A2,$A0,$A0,$D8,$DD,$00,$00  ; $AD4F
    .byte $00,$00,$C1,$00,$D3,$D5,$D0,$C5,$D2,$00,$D2,$CF,$C2,$CF,$D4,$00  ; $AD5F
    .byte $CE,$C1,$CD,$C5,$C4,$00,$CD,$C5,$C7,$C1,$CD,$C1,$CE,$00,$00,$00  ; $AD6F
    .byte $00,$00,$00,$00,$D7,$C1,$D3,$00,$C3,$D2,$C5,$C1,$D4,$C5,$C4,$DC  ; $AD7F
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$C4,$D2,$DC,$CC,$C9,$C7,$C8  ; $AD8F
    .byte $D4,$00,$C3,$D2,$C5,$C1,$D4,$C5,$C4,$00,$CD,$C5,$C7,$C1,$CD,$C1  ; $AD9F
    .byte $CE,$00,$00,$00,$D4,$CF,$00,$D3,$D4,$CF,$D0,$00,$D4,$C8,$C5,$00  ; $ADAF
    .byte $C5,$D6,$C9,$CC,$00,$C4,$C5,$D3,$C9,$D2,$C5,$D3,$00,$00,$00,$00  ; $ADBF
    .byte $00,$00,$00,$00,$00,$00,$CF,$C6,$00,$C4,$D2,$DC,$D7,$C9,$CC,$D9  ; $ADCF
    .byte $DC,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C8,$CF,$D7,$C5,$D6,$C5  ; $ADDF
    .byte $D2,$DD,$C1,$C6,$D4,$C5,$D2,$00,$C8,$C9,$D3,$00,$C4,$C5,$C6,$C5  ; $ADEF
    .byte $C1,$D4,$DD,$00,$00,$00,$00,$C4,$D2,$DC,$D7,$C9,$CC,$D9,$00,$C3  ; $ADFF
    .byte $D2,$C5,$C1,$D4,$C5,$C4,$00,$C5,$C9,$C7,$C8,$D4,$00,$00,$00,$00  ; $AE0F
    .byte $00,$00,$00,$CF,$C6,$00,$C8,$C9,$D3,$00,$CF,$D7,$CE,$00,$D2,$CF  ; $AE1F
    .byte $C2,$CF,$D4,$D3,$00,$00,$00,$00,$00,$00,$00,$00,$00,$D4,$CF,$00  ; $AE2F
    .byte $C3,$CF,$D5,$CE,$D4,$C5,$D2,$00,$CD,$C5,$C7,$C1,$CD,$C1,$CE,$DC  ; $AE3F
    .byte $00,$00,$00,$00,$00,$0F,$00,$10,$20,$30,$30,$30,$30,$30,$30,$30  ; $AE4F
    .byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30  ; $AE5F
    .byte $30,$20,$10,$00,$0F,$30,$30,$30,$20,$10,$00,$0F,$0C,$0B,$0A,$06  ; $AE6F
    .byte $06,$09,$09,$08,$08,$07,$07,$06,$06,$06,$06,$06,$06,$05,$05,$04  ; $AE7F
    .byte $04,$03,$03,$02,$02,$01,$13,$21,$47,$A3,$A7,$A5,$A1,$A1,$00,$C3  ; $AE8F
    .byte $C1,$D0,$C3,$CF,$CD,$00,$C3,$CF,$DC,$CC,$D4,$C4,$1F,$21,$81,$D4  ; $AE9F
    .byte $CD,$00,$C1,$CE,$C4,$00,$A3,$A7,$A5,$A1,$A5,$00,$C3,$C1,$D0,$C3  ; $AEAF
    .byte $CF,$CD,$00,$D5,$DC,$D3,$DC,$C1,$DC,$DD,$C9,$CE,$C3,$DC,$0B,$21  ; $AEBF
    .byte $CB,$CC,$C9,$C3,$C5,$CE,$D3,$C5,$C4,$00,$C2,$D9,$19,$22,$04,$CE  ; $AECF
    .byte $C9,$CE,$D4,$C5,$CE,$C4,$CF,$00,$CF,$C6,$00,$C1,$CD,$C5,$D2,$C9  ; $AEDF
    .byte $C3,$C1,$DC,$00,$C9,$CE,$C3,$DC,$00,$00,$0F,$35,$21,$11,$0F,$30  ; $AEEF
    .byte $3C,$21,$0F,$27,$17,$07,$0F,$30,$11,$0C,$0F,$0F,$30,$16,$0F,$0F  ; $AEFF
    .byte $30,$0F,$0F,$30,$30,$30,$0F,$0F,$0F,$0F,$0F,$26,$26,$27,$0F,$17  ; $AF0F
    .byte $28,$05,$0F,$17,$27,$18,$0F,$19,$2A,$37,$0F,$20,$2C,$11,$0F,$20  ; $AF1F
    .byte $26,$36,$0F,$00,$2C,$11,$0F,$16,$35,$20,$25,$8C,$09,$40,$53,$54  ; $AF2F
    .byte $41,$52,$54,$40,$40,$40,$25,$CC,$0A,$40,$50,$41,$53,$53,$57,$4F  ; $AF3F
    .byte $52,$44,$40,$25,$8C,$09,$50,$41,$53,$53,$57,$4F,$52,$44,$40,$25  ; $AF4F
    .byte $CC,$0A,$45,$52,$52,$4F,$52,$40,$5F,$40,$40,$40,$25,$8B,$08,$43  ; $AF5F
    .byte $4F,$4E,$54,$49,$4E,$55,$45,$25,$CB,$0C,$53,$54,$41,$47,$45,$40  ; $AF6F
    .byte $53,$45,$4C,$45,$43,$54,$26,$0B,$09,$50,$41,$53,$53,$57,$4F,$52  ; $AF7F
    .byte $44,$40,$22,$66,$0E,$50,$52,$45,$53,$53,$40,$41,$94,$42,$55,$54  ; $AF8F
    .byte $54,$4F,$4E,$26,$CA,$09,$50,$41,$53,$53,$57,$4F,$52,$44,$40,$27  ; $AF9F
    .byte $0A,$0C,$53,$54,$41,$47,$45,$40,$53,$45,$4C,$45,$43,$54,$00,$0C  ; $AFAF
    .byte $19,$25,$32,$3D,$4C,$58,$69,$75,$F8,$22,$00,$58,$30,$25,$00,$44  ; $AFBF
    .byte $30,$26,$00,$54,$30,$27,$00,$64,$30,$28,$00,$74,$30,$29,$00,$84  ; $AFCF
    .byte $44,$E1,$02,$30,$54,$E2,$02,$30,$64,$E3,$02,$30,$74,$E4,$02,$30  ; $AFDF
    .byte $84,$E5,$02,$30,$A0,$3F,$00,$D0,$B4,$2D,$01,$D0,$40,$40,$40,$40  ; $AFEF
    .byte $40,$50,$50,$50,$50,$50,$60,$60,$60,$60,$60,$70,$70,$70,$70,$70  ; $AFFF
    .byte $80,$80,$80,$80,$80,$41,$51,$61,$71,$81,$41,$51,$61,$71,$81,$41  ; $B00F
    .byte $51,$61,$71,$81,$41,$51,$61,$71,$81,$41,$51,$61,$71,$81,$01,$02  ; $B01F
    .byte $03,$04,$00,$06,$07,$08,$09,$05,$0B,$0C,$0D,$0E,$0A,$10,$11,$12  ; $B02F
    .byte $13,$0F,$15,$16,$17,$18,$14,$04,$00,$01,$02,$03,$09,$05,$06,$07  ; $B03F
    .byte $08,$0E,$0A,$0B,$0C,$0D,$13,$0F,$10,$11,$12,$18,$14,$15,$16,$17  ; $B04F
    .byte $14,$15,$16,$17,$18,$00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A  ; $B05F
    .byte $0B,$0C,$0D,$0E,$0F,$10,$11,$12,$13,$05,$06,$07,$08,$09,$0A,$0B  ; $B06F
    .byte $0C,$0D,$0E,$0F,$10,$11,$12,$13,$14,$15,$16,$17,$18,$00,$01,$02  ; $B07F
    .byte $03,$04,$0F,$00,$10,$20,$30,$20,$10,$00,$00,$3E,$01,$00,$00,$3E  ; $B08F
    .byte $41,$08,$08,$3E,$81,$00,$08,$3E,$C1,$08,$00,$01,$00,$10,$04,$20  ; $B09F
    .byte $00,$08,$10,$80,$08,$02,$04,$00,$01,$40,$80,$02,$20,$40,$00,$00  ; $B0AF
    .byte $00,$00,$01,$00,$00,$01,$01,$00,$00,$01,$00,$00,$01,$01,$01,$00  ; $B0BF
    .byte $01,$00,$60,$2F,$00,$60,$70,$1F,$00,$60,$60,$1B,$00,$80,$70,$19  ; $B0CF
    .byte $00,$70,$60,$1D,$00,$70,$60,$1C,$00,$90,$70,$1A,$00,$90,$70,$1E  ; $B0DF
    .byte $00,$80,$80,$20,$00,$60,$80,$25,$00,$70,$80,$26,$00,$80,$80,$27  ; $B0EF
    .byte $00,$90  ; $B0FF

loc_1B_B101:
    LDA #$03                     ; $B101  A9 03
    JSR sub_1E_C644              ; $B103  20 44 C6
    LDA $2A                      ; $B106  A5 2A
    PHA                          ; $B108  48
    LDA #$05                     ; $B109  A9 05
    STA $2A                      ; $B10B  85 2A
    LDA #$00                     ; $B10D  A9 00
    STA $08                      ; $B10F  85 08
    LDA #$8E                     ; $B111  A9 8E
    STA $09                      ; $B113  85 09
    JSR sub_1B_A87E              ; $B115  20 7E A8
    LDA #$40                     ; $B118  A9 40
    STA $08                      ; $B11A  85 08
    LDA #$8E                     ; $B11C  A9 8E
    JSR sub_1B_A87E              ; $B11E  20 7E A8
    LDA #$21                     ; $B121  A9 21
    STA $2006                    ; $B123  8D 06 20
    LDA #$CC                     ; $B126  A9 CC
    STA $2006                    ; $B128  8D 06 20
    LDX #$00                     ; $B12B  A2 00

loc_1B_B12D:
    LDA $B1E0,X                  ; $B12D  BD E0 B1
    STA $2007                    ; $B130  8D 07 20
    INX                          ; $B133  E8
    CPX #$09                     ; $B134  E0 09
    BNE loc_1B_B12D              ; $B136  D0 F5
    LDA #$0F                     ; $B138  A9 0F
    JSR sub_1E_C051              ; $B13A  20 51 C0
    JSR sub_1A_847E              ; $B13D  20 7E 84
    LDA #$00                     ; $B140  A9 00
    JSR sub_1B_A9B2              ; $B142  20 B2 A9
    LDA #$04                     ; $B145  A9 04
    STA $FE                      ; $B147  85 FE
    LDA #$7D                     ; $B149  A9 7D
    STA $FD                      ; $B14B  85 FD

loc_1B_B14D:
    LDX $FE                      ; $B14D  A6 FE
    CPX #$07                     ; $B14F  E0 07
    BEQ loc_1B_B158              ; $B151  F0 05
    JSR sub_1B_A98B              ; $B153  20 8B A9
    INC $FE                      ; $B156  E6 FE

loc_1B_B158:
    JSR sub_1E_C0AB              ; $B158  20 AB C0
    DEC $FD                      ; $B15B  C6 FD
    BNE loc_1B_B14D              ; $B15D  D0 EE
    JSR sub_1B_A898              ; $B15F  20 98 A8
    JSR sub_1B_A9CC              ; $B162  20 CC A9
    LDA #$80                     ; $B165  A9 80
    STA $FD                      ; $B167  85 FD
    LDA #$8E                     ; $B169  A9 8E
    STA $FE                      ; $B16B  85 FE
    JSR sub_1B_A9EA              ; $B16D  20 EA A9
    LDA #$10                     ; $B170  A9 10
    JSR sub_1E_C051              ; $B172  20 51 C0

loc_1B_B175:
    JSR sub_1B_A8D4              ; $B175  20 D4 A8
    LDA #$00                     ; $B178  A9 00
    STA $FD                      ; $B17A  85 FD

loc_1B_B17C:
    LDA $27                      ; $B17C  A5 27
    AND #$3C                     ; $B17E  29 3C
    BEQ loc_1B_B1A7              ; $B180  F0 25
    AND #$08                     ; $B182  29 08
    BNE loc_1B_B1C6              ; $B184  D0 40
    LDA #$2F                     ; $B186  A9 2F
    JSR sub_1E_C051              ; $B188  20 51 C0
    LDA $27                      ; $B18B  A5 27
    AND #$24                     ; $B18D  29 24
    BNE loc_1B_B19B              ; $B18F  D0 0A
    DEC $FD                      ; $B191  C6 FD
    BPL loc_1B_B1A7              ; $B193  10 12
    LDA #$02                     ; $B195  A9 02
    STA $FD                      ; $B197  85 FD
    BNE loc_1B_B1A7              ; $B199  D0 0C

loc_1B_B19B:
    INC $FD                      ; $B19B  E6 FD
    LDA $FD                      ; $B19D  A5 FD
    CMP #$03                     ; $B19F  C9 03
    BNE loc_1B_B1A7              ; $B1A1  D0 04
    LDA #$00                     ; $B1A3  A9 00
    STA $FD                      ; $B1A5  85 FD

loc_1B_B1A7:
    LDX #$03                     ; $B1A7  A2 03

loc_1B_B1A9:
    LDA $B1E9,X                  ; $B1A9  BD E9 B1
    STA $0200,X                  ; $B1AC  9D 00 02
    DEX                          ; $B1AF  CA
    BPL loc_1B_B1A9              ; $B1B0  10 F7
    LDA $1C                      ; $B1B2  A5 1C
    AND #$08                     ; $B1B4  29 08
    BNE loc_1B_B1C0              ; $B1B6  D0 08
    LDX $FD                      ; $B1B8  A6 FD
    LDA $B1ED,X                  ; $B1BA  BD ED B1
    STA $0200                    ; $B1BD  8D 00 02

loc_1B_B1C0:
    JSR sub_1E_C0AB              ; $B1C0  20 AB C0
    JMP loc_1B_B17C              ; $B1C3  4C 7C B1


loc_1B_B1C6:
    LDA $FD                      ; $B1C6  A5 FD
    CMP #$02                     ; $B1C8  C9 02
    BEQ loc_1B_B1CF              ; $B1CA  F0 03
    JMP loc_1B_B1D5              ; $B1CC  4C D5 B1


loc_1B_B1CF:
    JSR sub_1B_B224              ; $B1CF  20 24 B2
    JMP loc_1B_B175              ; $B1D2  4C 75 B1


loc_1B_B1D5:
    JSR sub_1B_A52D              ; $B1D5  20 2D A5
    PLA                          ; $B1D8  68
    STA $2A                      ; $B1D9  85 2A
    LDA #$03                     ; $B1DB  A9 03
    STA $A8                      ; $B1DD  85 A8
    RTS                          ; $B1DF  60

    .byte $47,$41,$4D,$45,$40,$4F,$56,$45,$52,$F8,$22,$00,$48,$60,$70,$80  ; $B1E0
    .byte $98,$22,$00,$28,$68,$2F,$00,$C8,$88,$1F,$00,$C8,$78,$1B,$00,$C8  ; $B1F0
    .byte $88,$19,$00,$D8,$68,$1D,$00,$D8,$78,$1C,$00,$D8,$98,$1A,$00,$D8  ; $B200
    .byte $98,$1E,$00,$C8,$A8,$20,$00,$C8,$A8,$25,$00,$D8,$B8,$26,$00,$C8  ; $B210
    .byte $B8,$27,$00,$D8  ; $B220

sub_1B_B224:
    JSR sub_1B_A898              ; $B224  20 98 A8
    JSR sub_1A_8473              ; $B227  20 73 84
    JSR sub_1B_A9CC              ; $B22A  20 CC A9
    LDA #$00                     ; $B22D  A9 00
    LDX #$18                     ; $B22F  A2 18

loc_1B_B231:
    STA $0420,X                  ; $B231  9D 20 04
    DEX                          ; $B234  CA
    BPL loc_1B_B231              ; $B235  10 FA
    LDA $9A                      ; $B237  A5 9A
    STA $00                      ; $B239  85 00
    EOR #$FF                     ; $B23B  49 FF
    STA $01                      ; $B23D  85 01
    CLC                          ; $B23F  18
    LDA $A7                      ; $B240  A5 A7
    TAX                          ; $B242  AA
    ADC #$05                     ; $B243  69 05
    STA $03                      ; $B245  85 03
    INC $0420,X                  ; $B247  FE 20 04
    LDX #$00                     ; $B24A  A2 00

loc_1B_B24C:
    LDY $B0BD,X                  ; $B24C  BC BD B0
    LDA $0000,Y                  ; $B24F  B9 00 00
    LDY $03                      ; $B252  A4 03
    AND $B0A9,X                  ; $B254  3D A9 B0
    BEQ loc_1B_B25B              ; $B257  F0 02
    LDA #$01                     ; $B259  A9 01

loc_1B_B25B:
    STA $0420,Y                  ; $B25B  99 20 04
    INY                          ; $B25E  C8
    CPY #$19                     ; $B25F  C0 19
    BNE loc_1B_B265              ; $B261  D0 02
    LDY #$05                     ; $B263  A0 05

loc_1B_B265:
    STY $03                      ; $B265  84 03
    INX                          ; $B267  E8
    CPX #$14                     ; $B268  E0 14
    BNE loc_1B_B24C              ; $B26A  D0 E0
    JSR sub_1B_AA25              ; $B26C  20 25 AA
    JSR sub_1B_A927              ; $B26F  20 27 A9
    LDA #$F8                     ; $B272  A9 F8
    STA $0230                    ; $B274  8D 30 02
    STA $0234                    ; $B277  8D 34 02
    STA $0238                    ; $B27A  8D 38 02
    STA $023C                    ; $B27D  8D 3C 02
    LDX #$27                     ; $B280  A2 27

loc_1B_B282:
    LDA $AFCB,X                  ; $B282  BD CB AF
    STA $0200,X                  ; $B285  9D 00 02
    DEX                          ; $B288  CA
    BPL loc_1B_B282              ; $B289  10 F7
    LDX #$03                     ; $B28B  A2 03

loc_1B_B28D:
    LDA $B1F0,X                  ; $B28D  BD F0 B1
    STA $0228,X                  ; $B290  9D 28 02
    DEX                          ; $B293  CA
    BPL loc_1B_B28D              ; $B294  10 F7
    LDA $9A                      ; $B296  A5 9A
    ASL A                        ; $B298  0A
    ORA #$01                     ; $B299  09 01
    STA $00                      ; $B29B  85 00
    LDA $9B                      ; $B29D  A5 9B
    ROL A                        ; $B29F  2A
    STA $01                      ; $B2A0  85 01
    LDX #$00                     ; $B2A2  A2 00
    LDA #$0C                     ; $B2A4  A9 0C
    STA $02                      ; $B2A6  85 02

loc_1B_B2A8:
    LSR $01                      ; $B2A8  46 01
    ROR $00                      ; $B2AA  66 00
    BCC loc_1B_B2BC              ; $B2AC  90 0E
    LDY #$04                     ; $B2AE  A0 04

loc_1B_B2B0:
    LDA $B1F4,X                  ; $B2B0  BD F4 B1
    STA $02A4,X                  ; $B2B3  9D A4 02
    INX                          ; $B2B6  E8
    DEY                          ; $B2B7  88
    BNE loc_1B_B2B0              ; $B2B8  D0 F6
    BEQ loc_1B_B2C0              ; $B2BA  F0 04

loc_1B_B2BC:
    INX                          ; $B2BC  E8
    INX                          ; $B2BD  E8
    INX                          ; $B2BE  E8
    INX                          ; $B2BF  E8

loc_1B_B2C0:
    DEC $02                      ; $B2C0  C6 02
    BNE loc_1B_B2A8              ; $B2C2  D0 E4
    LDX #$07                     ; $B2C4  A2 07
    JSR sub_1B_A98B              ; $B2C6  20 8B A9
    JSR sub_1B_A8D4              ; $B2C9  20 D4 A8

loc_1B_B2CC:
    LDX #$F8                     ; $B2CC  A2 F8
    LDA $1C                      ; $B2CE  A5 1C
    AND #$08                     ; $B2D0  29 08
    BNE loc_1B_B2D6              ; $B2D2  D0 02
    LDX #$98                     ; $B2D4  A2 98

loc_1B_B2D6:
    STX $0228                    ; $B2D6  8E 28 02
    JSR sub_1E_C0AB              ; $B2D9  20 AB C0
    LDA $27                      ; $B2DC  A5 27
    AND #$01                     ; $B2DE  29 01
    BEQ loc_1B_B2CC              ; $B2E0  F0 EA
    LDA #$42                     ; $B2E2  A9 42
    JSR sub_1E_C051              ; $B2E4  20 51 C0
    JSR sub_1B_A898              ; $B2E7  20 98 A8
    JSR sub_1A_8473              ; $B2EA  20 73 84
    JSR sub_1B_AA09              ; $B2ED  20 09 AA
    RTS                          ; $B2F0  60

    .byte $FF,$FF,$FF,$55,$55,$55,$55,$55,$FF,$FF,$FF,$55,$55,$55,$55,$55  ; $B2F1
    .byte $FF,$FF,$FF,$55,$55,$55,$55,$55,$FF,$FF,$F7,$50,$50,$55,$55,$55  ; $B301
    .byte $F5,$F5,$55,$04,$01,$55,$55,$55,$55,$A6,$AA,$AA,$AA,$AA,$A9,$55  ; $B311
    .byte $55,$55,$A4,$A0,$A0,$A1,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55  ; $B321
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B331
    .byte $00,$00,$00,$00,$E0,$E2,$E4,$E6,$E8,$EA,$E4,$E6,$E8,$EA,$E4,$E6  ; $B341
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B351
    .byte $00,$00,$00,$00,$E0,$E2,$E4,$E6,$E8,$EA,$E4,$E6,$E8,$EA,$E4,$E6  ; $B361
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B371
    .byte $00,$00,$00,$00,$E0,$E2,$E4,$E6,$E8,$EA,$E4,$E6,$E8,$EA,$E4,$E6  ; $B381
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B391
    .byte $00,$00,$00,$00,$E0,$E2,$E4,$E6,$E8,$EA,$E4,$E6,$E8,$EA,$E4,$E6  ; $B3A1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B3B1
    .byte $00,$00,$00,$00,$E0,$E2,$E4,$E6,$E8,$EA,$E4,$E6,$E8,$EA,$E4,$E6  ; $B3C1
    .byte $00,$00,$00,$00,$00,$00,$D0,$D2,$C5,$D3,$D3,$00,$D3,$D4,$C1,$D2  ; $B3D1
    .byte $D4,$00,$00,$00,$E0,$E2,$E4,$E6,$E8,$EA,$E4,$E6,$E8,$EA,$E4,$E6  ; $B3E1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B3F1
    .byte $00,$00,$00,$00,$E0,$E2,$E4,$E6,$E8,$EA,$E4,$E6,$E8,$EA,$E4,$E6  ; $B401
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B411
    .byte $00,$00,$00,$00,$E0,$E2,$E4,$E6,$E8,$EA,$E4,$E6,$E8,$EA,$E4,$E6  ; $B421
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$C4,$C9,$C6,$C6,$C9,$C3,$D5,$CC  ; $B431
    .byte $D4,$00,$00,$00,$E0,$E2,$E4,$E6,$E8,$EA,$E4,$E6,$E8,$EA,$E4,$E6  ; $B441
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B451
    .byte $00,$00,$00,$00,$E0,$E2,$E4,$E6,$E8,$EA,$E4,$E6,$E8,$EA,$E4,$E6  ; $B461
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$CE,$CF,$D2,$CD,$C1,$CC,$00,$00  ; $B471
    .byte $00,$00,$00,$00,$E0,$E2,$ED,$ED,$ED,$ED,$ED,$ED,$ED,$ED,$ED,$ED  ; $B481
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B491
    .byte $00,$00,$00,$00,$E0,$E2,$EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC,$EC  ; $B4A1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B4B1
    .byte $00,$00,$00,$00,$EE,$EF,$00,$00,$F1,$F3,$F3,$F3,$F5,$F7,$F3,$F3  ; $B4C1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$BA,$BB,$BB  ; $B4D1
    .byte $BB,$BB,$BC,$00,$00,$00,$00,$00,$F1,$F3,$F3,$F3,$F4,$F6,$F3,$F3  ; $B4E1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$B4,$B5,$B6  ; $B4F1
    .byte $B7,$B8,$B9,$00,$00,$00,$00,$00,$F1,$F3,$F3,$F3,$F3,$F3,$F3,$F3  ; $B501
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$B0,$B1  ; $B511
    .byte $B2,$B3,$00,$00,$00,$00,$00,$00,$F0,$F2,$F2,$F2,$F2,$F2,$F2,$F2  ; $B521
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$AC,$AD  ; $B531
    .byte $AE,$AF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B541
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B551
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B561
    .byte $00,$00,$00,$00,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F,$70,$71  ; $B571
    .byte $72,$73,$74,$75,$76,$77,$78,$79,$7A,$7B,$7C,$7D,$00,$00,$00,$00  ; $B581
    .byte $00,$00,$00,$00,$00,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A  ; $B591
    .byte $5B,$5C,$5D,$5E,$5F,$60,$61,$62,$63,$64,$65,$00,$00,$00,$00,$00  ; $B5A1
    .byte $00,$00,$00,$00,$00,$00,$3C,$3D,$3E,$3F,$40,$41,$42,$43,$44,$45  ; $B5B1
    .byte $46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F,$00,$00,$00,$00,$00,$00  ; $B5C1
    .byte $00,$00,$00,$00,$00,$00,$00,$2A,$2B,$2C,$2D,$2E,$2F,$30,$31,$32  ; $B5D1
    .byte $33,$34,$35,$36,$37,$38,$39,$3A,$3B,$00,$00,$00,$00,$00,$00,$00  ; $B5E1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$1A,$1B,$1C,$1D,$1E,$1F,$20,$21  ; $B5F1
    .byte $22,$23,$24,$25,$26,$27,$28,$29,$00,$00,$00,$00,$00,$00,$00,$00  ; $B601
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$0D,$0E,$0F,$10,$11,$12  ; $B611
    .byte $13,$14,$15,$16,$17,$18,$19,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B621
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$7E,$01,$02,$03,$04,$05  ; $B631
    .byte $06,$07,$08,$09,$0A,$0B,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B641
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B651
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B661
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B671
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B681
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B691
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B6A1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B6B1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B6C1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B6D1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B6E1
    .byte $20,$7E,$84,$E6,$20,$A9,$04,$20,$44,$C6,$A9,$05,$85,$2A,$A9,$C0  ; $B6F1
    .byte $85,$08,$A9,$8E,$85,$09,$20,$7E,$A8,$A9,$00,$85,$08,$A9,$8F,$85  ; $B701
    .byte $09,$20,$7E,$A8,$A9,$00,$8D,$A0,$06,$8D,$80,$06,$8D,$81,$06,$8D  ; $B711
    .byte $00,$04,$8D,$01,$04,$8D,$A1,$04,$A9,$0F,$A2,$1F,$9D,$56,$03,$CA  ; $B721
    .byte $10,$FA,$A9,$FF,$20,$51,$C0,$20,$73,$84,$20,$1D,$A5,$A9,$BB,$85  ; $B731
    .byte $FD,$20,$AB,$C0,$C6,$FD,$D0,$F9,$A9,$13,$20,$51,$C0,$A9,$04,$85  ; $B741
    .byte $FD,$A9,$3F,$85,$FE,$C6,$FE,$D0,$11,$A9,$3F,$85,$FE,$A2,$1B,$A0  ; $B751
    .byte $3B,$A9,$0F,$20,$FF,$A8,$C6,$FD,$F0,$09,$20,$F9,$B8,$20,$AB,$C0  ; $B761
    .byte $4C,$56,$B7,$AE,$A0,$06,$BD,$7B,$BA,$85,$FD,$BD,$81,$BA,$85,$FE  ; $B771
    .byte $A9,$3F,$85,$FF,$A5,$FF,$F0,$02,$C6,$FF,$AD,$A0,$06,$C9,$05,$D0  ; $B781
    .byte $09,$A5,$FF,$29,$01,$85,$20,$4C,$A1,$B7,$20,$E0,$B9,$20,$FF,$B9  ; $B791
    .byte $AD,$A0,$06,$D0,$0F,$A5,$1C,$29,$07,$D0,$09,$A2,$1F,$A0,$3F,$A9  ; $B7A1
    .byte $FF,$20,$FF,$A8,$20,$F9,$B8,$20,$AB,$C0,$38,$A5,$FD,$E9,$01,$85  ; $B7B1
    .byte $FD,$A5,$FE,$E9,$00,$85,$FE,$B0,$BB,$EE,$A0,$06,$AD,$A0,$06,$C9  ; $B7C1
    .byte $06,$D0,$A0,$20,$2D,$A5,$20,$3C,$84,$A9,$05,$20,$44,$C6,$A9,$20  ; $B7D1
    .byte $8D,$06,$20,$A9,$00,$8D,$06,$20,$A0,$04,$A2,$00,$8D,$07,$20,$E8  ; $B7E1
    .byte $D0,$FA,$88,$D0,$F5,$8D,$20,$04,$A2,$1F,$20,$9E,$82,$E6,$20,$20  ; $B7F1
    .byte $73,$84,$A9,$30,$8D,$69,$03,$A9,$0D,$20,$51,$C0,$20,$1D,$A5,$20  ; $B801
    .byte $65,$84,$A9,$25,$8D,$B6,$03,$A9,$AC,$8D,$B7,$03,$A9,$A2,$85,$FD  ; $B811
    .byte $A9,$00,$85,$FE,$8D,$A0,$06,$A5,$FD,$29,$03,$D0,$13,$A6,$FE,$E0  ; $B821
    .byte $05,$F0,$0D,$BD,$DB,$BA,$8D,$B8,$03,$E6,$47,$E6,$FE,$EE,$B7,$03  ; $B831
    .byte $20,$58,$83,$20,$AB,$C0,$C6,$FD,$D0,$DD,$A9,$A0,$8D,$B7,$03,$A9  ; $B841
    .byte $20,$20,$24,$BA,$A9,$49,$85,$FD,$A9,$01,$85,$FE,$A9,$00,$8D,$80  ; $B851
    .byte $06,$A9,$25,$8D,$B6,$03,$A9,$83,$8D,$B7,$03,$20,$37,$D6,$20,$58  ; $B861
    .byte $83,$20,$AB,$C0,$38,$A5,$FD,$E9,$01,$85,$FD,$A5,$FE,$E9,$00,$85  ; $B871
    .byte $FE,$D0,$E8,$A5,$FD,$F0,$13,$C9,$D0,$D0,$E0,$AD,$A0,$06,$C9,$0E  ; $B881
    .byte $90,$D9,$A9,$14,$20,$51,$C0,$4C,$6C,$B8,$A9,$25,$8D,$B6,$03,$A9  ; $B891
    .byte $80,$8D,$B7,$03,$A9,$20,$20,$24,$BA,$A9,$25,$8D,$B6,$03,$A9,$C0  ; $B8A1
    .byte $8D,$B7,$03,$A9,$20,$20,$24,$BA,$EE,$A0,$06,$AD,$A0,$06,$C9,$10  ; $B8B1
    .byte $D0,$92,$A9,$0F,$8D,$58,$03,$8D,$59,$03,$A9,$00,$8D,$A0,$06,$85  ; $B8C1
    .byte $20,$20,$42,$D6,$20,$4D,$D6,$20,$58,$83,$20,$AB,$C0,$AD,$A0,$06  ; $B8D1
    .byte $C9,$3C,$D0,$F0,$A5,$22,$D0,$EC,$20,$58,$83,$20,$AB,$C0,$A5,$27  ; $B8E1
    .byte $29,$08,$F0,$F4,$20,$2D,$A5,$60,$20,$73,$84,$AD,$A0,$06,$C9,$05  ; $B8F1
    .byte $D0,$1B,$A0,$04,$A2,$30,$A5,$FF,$29,$01,$D0,$04,$A0,$05,$A2,$0F  ; $B901
    .byte $8E,$67,$03,$8A,$29,$0F,$8D,$6F,$03,$20,$27,$D6,$60,$A9,$00,$8D  ; $B911
    .byte $60,$04,$8D,$A0,$04,$8D,$40,$04,$85,$00,$EE,$80,$06,$AD,$80,$06  ; $B921
    .byte $C9,$10,$D0,$14,$A9,$00,$8D,$80,$06,$EE,$00,$04,$AD,$00,$04,$C9  ; $B931
    .byte $04,$D0,$05,$A9,$00,$8D,$00,$04,$AD,$A0,$06,$C9,$04,$90,$0F,$AC  ; $B941
    .byte $00,$04,$A5,$FF,$29,$01,$D0,$02,$A0,$04,$20,$27,$D6,$60,$20,$24  ; $B951
    .byte $D6,$AE,$A0,$06,$18,$AD,$C1,$04,$7D,$D3,$BA,$8D,$C1,$04,$AD,$A1  ; $B961
    .byte $04,$7D,$D7,$BA,$8D,$A1,$04,$A5,$1C,$29,$07,$D0,$0F,$EE,$81,$06  ; $B971
    .byte $AD,$81,$06,$C9,$04,$D0,$05,$A9,$00,$8D,$81,$06,$AD,$A0,$06,$0A  ; $B981
    .byte $0A,$6D,$81,$06,$AA,$BD,$B3,$BA,$85,$02,$A5,$FF,$F0,$1B,$AE,$A0  ; $B991
    .byte $06,$F0,$16,$CA,$A5,$FF,$F0,$11,$4A,$4A,$4A,$4A,$85,$02,$8A,$0A  ; $B9A1
    .byte $0A,$65,$02,$AA,$BD,$C3,$BA,$85,$02,$A4,$00,$A2,$15,$18,$BD,$87  ; $B9B1
    .byte $BA,$6D,$A1,$04,$99,$00,$02,$C8,$A5,$02,$99,$00,$02,$C8,$A9,$03  ; $B9C1
    .byte $99,$00,$02,$C8,$BD,$9D,$BA,$99,$00,$02,$C8,$CA,$10,$DF,$60,$AE  ; $B9D1
    .byte $A0,$06,$A5,$FF,$29,$01,$D0,$01,$E8,$8A,$0A,$AA,$A0,$00,$BD,$6F  ; $B9E1
    .byte $BA,$99,$68,$03,$99,$70,$03,$E8,$C8,$C0,$02,$D0,$F1,$60,$AE,$A0  ; $B9F1
    .byte $06,$F0,$1F,$A5,$FF,$29,$01,$F0,$01,$CA,$8A,$0A,$0A,$85,$00,$18  ; $BA01
    .byte $0A,$65,$00,$AA,$A0,$00,$BD,$33,$BA,$99,$56,$03,$E8,$C8,$C0,$0C  ; $BA11
    .byte $D0,$F4,$60,$A2,$20,$86,$47,$CA,$9D,$B8,$03,$CA,$10,$FA,$20,$AB  ; $BA21
    .byte $C0,$60,$0F,$26,$26,$27,$0F,$17,$28,$05,$0F,$17,$27,$18,$0F,$11  ; $BA31
    .byte $11,$20,$0F,$10,$28,$20,$0F,$10,$20,$18,$0F,$21,$21,$35,$0F,$25  ; $BA41
    .byte $37,$16,$0F,$25,$35,$17,$0F,$10,$10,$00,$0F,$00,$18,$05,$0F,$00  ; $BA51
    .byte $10,$00,$0F,$30,$21,$1C,$0F,$19,$37,$16,$0F,$19,$2A,$18,$2C,$11  ; $BA61
    .byte $28,$15,$30,$00,$34,$24,$30,$11,$2C,$11,$2C,$32,$32,$32,$32,$90  ; $BA71
    .byte $03,$02,$02,$02,$02,$02,$00,$08,$10,$20,$28,$30,$40,$48,$50,$58  ; $BA81
    .byte $68,$78,$80,$88,$90,$A8,$B8,$C0,$D0,$D8,$E0,$E8,$D8,$70,$18,$B0  ; $BA91
    .byte $88,$40,$A0,$F8,$20,$58,$C8,$08,$88,$38,$B0,$D8,$70,$28,$B8,$08  ; $BAA1
    .byte $98,$48,$0C,$0D,$0E,$0D,$1B,$1C,$1B,$1C,$2C,$2D,$2E,$2D,$3B,$3B  ; $BAB1
    .byte $3B,$3B,$1B,$1A,$19,$0F,$2C,$1F,$1E,$1D,$3C,$3A,$39,$2F,$3D,$3D  ; $BAC1
    .byte $3D,$3C,$80,$80,$E5,$00,$00,$00,$00,$08,$13,$14,$01,$06,$06,$A9  ; $BAD1
    .byte $03,$20,$44,$C6,$A9,$06,$20,$44,$C6,$A5,$2A,$48,$A9,$05,$85,$2A  ; $BAE1
    .byte $A9,$40,$85,$08,$A9,$8F,$85,$09,$20,$7E,$A8,$A9,$80,$85,$08,$A9  ; $BAF1
    .byte $8F,$85,$09,$20,$7E,$A8,$68,$85,$2A,$A9,$17,$20,$51,$C0,$20,$7E  ; $BB01
    .byte $84,$A9,$01,$20,$B2,$A9,$A2,$0F,$8A,$9D,$66,$03,$CA,$10,$FA,$A9  ; $BB11
    .byte $06,$8D,$00,$04,$20,$24,$D6,$A9,$05,$85,$FD,$A5,$1C,$29,$07,$D0  ; $BB21
    .byte $0D,$A2,$1B,$A0,$3B,$A9,$0F,$20,$FF,$A8,$C6,$FD,$F0,$06,$20,$AB  ; $BB31
    .byte $C0,$4C,$2C,$BB,$20,$34,$BD,$20,$22,$BD,$20,$34,$BD,$EE,$B7,$03  ; $BB41
    .byte $A6,$2A,$BD,$12,$BE,$8D,$B8,$03,$E6,$47,$20,$34,$BD,$20,$22,$BD  ; $BB51
    .byte $EE,$B7,$03,$EE,$B7,$03,$20,$AB,$C0,$A9,$08,$20,$3E,$BD,$A9,$09  ; $BB61
    .byte $20,$3E,$BD,$A5,$2A,$20,$3E,$BD,$A5,$2A,$C9,$04,$D0,$05,$A9,$13  ; $BB71
    .byte $20,$3E,$BD,$A9,$9C,$85,$FD,$A2,$00,$A5,$FD,$29,$01,$F0,$06,$A6  ; $BB81
    .byte $2A,$E8,$8A,$0A,$AA,$BD,$5A,$BF,$8D,$68,$03,$8D,$70,$03,$BD,$5B  ; $BB91
    .byte $BF,$8D,$69,$03,$8D,$71,$03,$20,$AB,$C0,$C6,$FD,$D0,$D9,$A6,$2A  ; $BBA1
    .byte $BD,$81,$C2,$F0,$03,$20,$62,$BC,$A2,$08,$20,$8B,$A9,$20,$AB,$C0  ; $BBB1
    .byte $A2,$09,$20,$8B,$A9,$20,$AB,$C0,$A2,$03,$BD,$70,$BF,$9D,$FC,$02  ; $BBC1
    .byte $CA,$10,$F7,$A9,$30,$8D,$74,$03,$A9,$00,$85,$FD,$A6,$FD,$BD,$6E  ; $BBD1
    .byte $BF,$8D,$FC,$02,$A5,$1C,$29,$08,$D0,$05,$A9,$F8,$8D,$FC,$02,$A5  ; $BBE1
    .byte $27,$29,$3C,$F0,$0F,$29,$08,$D0,$11,$A9,$2F,$20,$51,$C0,$A5,$FD  ; $BBF1
    .byte $49,$01,$85,$FD,$20,$AB,$C0,$4C,$DD,$BB,$A5,$FD,$F0,$03,$4C,$5E  ; $BC01
    .byte $BC,$A2,$1F,$BD,$56,$03,$9D,$00,$07,$CA,$10,$F7,$20,$24,$B2,$20  ; $BC11
    .byte $24,$D6,$A9,$05,$85,$FD,$A5,$1C,$29,$03,$D0,$28,$A2,$1F,$BD,$56  ; $BC21
    .byte $03,$C9,$0F,$D0,$0B,$BD,$00,$07,$29,$0F,$9D,$56,$03,$4C,$4E,$BC  ; $BC31
    .byte $18,$69,$10,$DD,$00,$07,$F0,$02,$B0,$03,$9D,$56,$03,$CA,$10,$DE  ; $BC41
    .byte $C6,$FD,$F0,$06,$20,$AB,$C0,$4C,$27,$BC,$4C,$C9,$BB,$20,$2D,$A5  ; $BC51
    .byte $60,$A9,$0F,$8D,$5C,$03,$8D,$5D,$03,$A2,$02,$BD,$74,$BF,$9D,$73  ; $BC61
    .byte $03,$CA,$10,$F7,$20,$73,$84,$20,$B7,$BD,$A9,$7D,$85,$FD,$A2,$0F  ; $BC71
    .byte $A5,$FD,$29,$08,$F0,$02,$A2,$15,$8E,$66,$03,$20,$AB,$C0,$C6,$FD  ; $BC81
    .byte $D0,$EC,$A9,$07,$8D,$00,$04,$20,$24,$D6,$A9,$0A,$20,$3E,$BD,$A9  ; $BC91
    .byte $0B,$20,$3E,$BD,$20,$AB,$BD,$20,$B7,$BD,$A6,$2A,$BD,$81,$C2,$4A  ; $BCA1
    .byte $09,$A0,$8D,$20,$04,$EE,$20,$04,$A9,$0F,$20,$3E,$BD,$A9,$0C,$20  ; $BCB1
    .byte $3E,$BD,$A9,$0D,$20,$3E,$BD,$A9,$0E,$20,$3E,$BD,$20,$AB,$BD,$20  ; $BCC1
    .byte $B7,$BD,$20,$73,$84,$A9,$06,$8D,$00,$04,$20,$24,$D6,$20,$EC,$BD  ; $BCD1
    .byte $A9,$08,$20,$3E,$BD,$A9,$09,$20,$3E,$BD,$AD,$20,$04,$29,$0F,$18  ; $BCE1
    .byte $69,$0F,$20,$3E,$BD,$A9,$7D,$85,$FD,$A2,$12,$A5,$FD,$29,$01,$D0  ; $BCF1
    .byte $06,$A6,$2A,$E8,$8A,$0A,$AA,$BD,$5A,$BF,$8D,$68,$03,$8D,$70,$03  ; $BD01
    .byte $BD,$5B,$BF,$8D,$69,$03,$8D,$71,$03,$20,$AB,$C0,$C6,$FD,$D0,$D9  ; $BD11
    .byte $60,$A9,$24,$8D,$B6,$03,$A9,$CD,$8D,$B7,$03,$A9,$94,$8D,$B8,$03  ; $BD21
    .byte $E6,$47,$60,$20,$AB,$C0,$A5,$1C,$29,$07,$D0,$F7,$60,$84,$00,$0A  ; $BD31
    .byte $0A,$0A,$0A,$A8,$A9,$00,$69,$00,$85,$C8,$A9,$1A,$85,$C9,$A9,$BE  ; $BD41
    .byte $18,$65,$C8,$85,$CA,$B1,$C9,$8D,$B6,$03,$98,$18,$69,$01,$A8,$A5  ; $BD51
    .byte $CA,$69,$00,$85,$CA,$B1,$C9,$8D,$B7,$03,$98,$18,$69,$01,$A8,$A5  ; $BD61
    .byte $CA,$69,$00,$85,$CA,$84,$FE,$A9,$0E,$85,$FD,$20,$34,$BD,$A4,$FE  ; $BD71
    .byte $C0,$F7,$D0,$05,$AD,$20,$04,$D0,$02,$B1,$C9,$8D,$B8,$03,$E6,$47  ; $BD81
    .byte $EE,$B7,$03,$A5,$FE,$18,$69,$01,$85,$FE,$A5,$CA,$69,$00,$85,$CA  ; $BD91
    .byte $C6,$FD,$D0,$D7,$A4,$00,$20,$AB,$C0,$60,$A9,$7D,$85,$FD,$20,$AB  ; $BDA1
    .byte $C0,$C6,$FD,$D0,$F9,$60,$A2,$1F,$A9,$00,$9D,$B8,$03,$CA,$10,$FA  ; $BDB1
    .byte $A9,$09,$85,$FD,$A9,$24,$8D,$B6,$03,$A9,$AB,$8D,$B7,$03,$18,$AD  ; $BDC1
    .byte $B7,$03,$69,$20,$8D,$B7,$03,$AD,$B6,$03,$69,$00,$8D,$B6,$03,$A9  ; $BDD1
    .byte $0F,$85,$47,$20,$AB,$C0,$C6,$FD,$10,$E4,$60,$20,$34,$BD,$20,$22  ; $BDE1
    .byte $BD,$20,$34,$BD,$EE,$B7,$03,$A6,$2A,$AD,$20,$04,$8D,$B8,$03,$E6  ; $BDF1
    .byte $47,$20,$34,$BD,$20,$22,$BD,$EE,$B7,$03,$EE,$B7,$03,$20,$AB,$C0  ; $BE01
    .byte $60,$48,$41,$57,$42,$51,$46,$4D,$43,$25,$8B,$40,$40,$41,$54,$4F  ; $BE11
    .byte $4D,$49,$43,$40,$46,$49,$52,$45,$40,$25,$8B,$40,$40,$41,$49,$52  ; $BE21
    .byte $40,$53,$48,$4F,$4F,$54,$45,$52,$40,$25,$8B,$40,$40,$4C,$45,$41  ; $BE31
    .byte $46,$40,$53,$48,$49,$45,$4C,$44,$40,$25,$8B,$40,$40,$42,$55,$42  ; $BE41
    .byte $42,$4C,$45,$94,$4C,$45,$41,$44,$40,$25,$8B,$40,$40,$51,$55,$49  ; $BE51
    .byte $43,$4B,$40,$40,$40,$40,$40,$40,$40,$25,$8B,$40,$40,$54,$49,$4D  ; $BE61
    .byte $45,$94,$53,$54,$4F,$50,$50,$45,$52,$25,$8B,$40,$40,$4D,$45,$54  ; $BE71
    .byte $41,$4C,$94,$42,$4C,$41,$44,$45,$40,$25,$8B,$40,$40,$43,$52,$41  ; $BE81
    .byte $53,$48,$40,$42,$4F,$4D,$42,$45,$52,$25,$0B,$40,$40,$47,$45,$54  ; $BE91
    .byte $40,$45,$51,$55,$49,$50,$50,$45,$44,$25,$4B,$40,$40,$57,$49,$54  ; $BEA1
    .byte $48,$40,$40,$40,$40,$40,$40,$40,$40,$25,$2B,$40,$4D,$45,$53,$53  ; $BEB1
    .byte $41,$47,$45,$40,$46,$52,$4F,$4D,$40,$25,$6B,$40,$44,$52,$5C,$4C  ; $BEC1
    .byte $49,$47,$48,$54,$5C,$40,$40,$40,$40,$25,$2B,$43,$4F,$4D,$50,$4C  ; $BED1
    .byte $45,$54,$45,$44,$5F,$40,$40,$40,$40,$25,$6B,$47,$45,$54,$40,$59  ; $BEE1
    .byte $4F,$55,$52,$40,$40,$40,$40,$40,$40,$25,$AB,$57,$45,$41,$50,$4F  ; $BEF1
    .byte $4E,$53,$40,$52,$45,$41,$44,$59,$5F,$24,$EB,$49,$54,$45,$4D,$94  ; $BF01
    .byte $40,$40,$40,$40,$40,$40,$40,$40,$40,$25,$8B,$40,$40,$49,$54,$45  ; $BF11
    .byte $4D,$94,$A1,$40,$40,$40,$40,$40,$40,$25,$8B,$40,$40,$49,$54,$45  ; $BF21
    .byte $4D,$94,$A2,$40,$40,$40,$40,$40,$40,$25,$8B,$40,$40,$49,$54,$45  ; $BF31
    .byte $4D,$94,$A3,$40,$40,$40,$40,$40,$40,$25,$CB,$40,$40,$94,$42,$4F  ; $BF41
    .byte $4F,$4D,$45,$52,$41,$4E,$47,$40,$40,$2C,$11,$28,$15,$20,$11,$20  ; $BF51
    .byte $19,$20,$00,$34,$25,$34,$14,$37,$18,$20,$26,$20,$16,$B0,$C0,$B0  ; $BF61
    .byte $22,$03,$40,$20,$10,$36,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF71
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF81
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF91
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BFA1
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BFB1
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BFC1
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$78  ; $BFD1
    .byte $EE,$E1,$BF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BFE1
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$F0,$CF,$E0,$BF,$E0,$BF  ; $BFF1
