; PRG 8 KB bank $1D at $A000
.segment "BANK1D"
.org $A000

    .byte $E0,$04  ; $A000
    BNE loc_1D_A007              ; $A002  D0 03
    JMP loc_1D_A180              ; $A004  4C 80 A1


loc_1D_A007:
    LDA $0300,X                  ; $A007  BD 00 03
    AND #$0F                     ; $A00A  29 0F
    BNE loc_1D_A032              ; $A00C  D0 24
    STA $05E0,X                  ; $A00E  9D E0 05
    LDA $03C0,X                  ; $A011  BD C0 03
    CMP #$90                     ; $A014  C9 90
    BCS loc_1D_A01B              ; $A016  B0 03
    JMP sub_1F_F797              ; $A018  4C 97 F7


loc_1D_A01B:
    LDY #$00                     ; $A01B  A0 00
    JSR sub_1F_F67C              ; $A01D  20 7C F6
    BCC loc_1D_A05F              ; $A020  90 3D
    LDA $0320,X                  ; $A022  BD 20 03
    SEC                          ; $A025  38
    SBC #$52                     ; $A026  E9 52
    TAY                          ; $A028  A8
    LDA $A176,Y                  ; $A029  B9 76 A1
    STA $0500,X                  ; $A02C  9D 00 05
    INC $0300,X                  ; $A02F  FE 00 03

loc_1D_A032:
    LDA $05C0,X                  ; $A032  BD C0 05
    CMP #$99                     ; $A035  C9 99
    BNE loc_1D_A04A              ; $A037  D0 11
    LDA $05A0,X                  ; $A039  BD A0 05
    CMP #$04                     ; $A03C  C9 04
    BNE loc_1D_A05F              ; $A03E  D0 1F
    LDA $0500,X                  ; $A040  BD 00 05
    TYA                          ; $A043  98
    LDA $A178,Y                  ; $A044  B9 78 A1
    JSR sub_1F_F835              ; $A047  20 35 F8

loc_1D_A04A:
    LDA $0300,X                  ; $A04A  BD 00 03
    AND #$02                     ; $A04D  29 02
    BEQ loc_1D_A054              ; $A04F  F0 03
    JMP loc_1D_A0D3              ; $A051  4C D3 A0


loc_1D_A054:
    JSR sub_1F_F8C2              ; $A054  20 C2 F8
    CMP #$60                     ; $A057  C9 60
    BCS loc_1D_A05F              ; $A059  B0 04
    INC $0300,X                  ; $A05B  FE 00 03
    RTS                          ; $A05E  60


loc_1D_A05F:
    LDY #$00                     ; $A05F  A0 00
    JSR sub_1F_F67C              ; $A061  20 7C F6
    ROL $0F                      ; $A064  26 0F
    LDA $04A0,X                  ; $A066  BD A0 04
    AND #$01                     ; $A069  29 01
    BEQ loc_1D_A075              ; $A06B  F0 08
    LDY #$00                     ; $A06D  A0 00
    JSR sub_1F_F580              ; $A06F  20 80 F5
    JMP loc_1D_A07A              ; $A072  4C 7A A0


loc_1D_A075:
    LDY #$01                     ; $A075  A0 01
    JSR sub_1F_F5C4              ; $A077  20 C4 F5

loc_1D_A07A:
    LDA $0F                      ; $A07A  A5 0F
    AND #$01                     ; $A07C  29 01
    BEQ loc_1D_A0D2              ; $A07E  F0 52
    LDA $04A0,X                  ; $A080  BD A0 04
    AND #$01                     ; $A083  29 01
    BEQ loc_1D_A091              ; $A085  F0 0A
    LDA $0360,X                  ; $A087  BD 60 03
    CMP #$D6                     ; $A08A  C9 D6
    BCC loc_1D_A0A1              ; $A08C  90 13
    JMP loc_1D_A098              ; $A08E  4C 98 A0


loc_1D_A091:
    LDA $0360,X                  ; $A091  BD 60 03
    CMP #$2A                     ; $A094  C9 2A
    BCS loc_1D_A0A1              ; $A096  B0 09

loc_1D_A098:
    LDA $04A0,X                  ; $A098  BD A0 04
    EOR #$03                     ; $A09B  49 03
    STA $04A0,X                  ; $A09D  9D A0 04
    RTS                          ; $A0A0  60


loc_1D_A0A1:
    LDA $10                      ; $A0A1  A5 10
    AND #$10                     ; $A0A3  29 10
    BEQ loc_1D_A0BC              ; $A0A5  F0 15
    LDA $0500,X                  ; $A0A7  BD 00 05
    TYA                          ; $A0AA  98
    LDA $A17A,Y                  ; $A0AB  B9 7A A1
    JSR sub_1F_F835              ; $A0AE  20 35 F8
    LDA #$A8                     ; $A0B1  A9 A8
    STA $0440,X                  ; $A0B3  9D 40 04
    LDA #$05                     ; $A0B6  A9 05
    STA $0460,X                  ; $A0B8  9D 60 04
    RTS                          ; $A0BB  60


loc_1D_A0BC:
    LDA $0500,X                  ; $A0BC  BD 00 05
    TAY                          ; $A0BF  A8
    LDA $A17C,Y                  ; $A0C0  B9 7C A1
    CMP $05C0,X                  ; $A0C3  DD C0 05
    BEQ loc_1D_A0D2              ; $A0C6  F0 0A
    LDA $0500,X                  ; $A0C8  BD 00 05
    TAY                          ; $A0CB  A8
    LDA $A17C,Y                  ; $A0CC  B9 7C A1
    JSR sub_1F_F835              ; $A0CF  20 35 F8

loc_1D_A0D2:
    RTS                          ; $A0D2  60


loc_1D_A0D3:
    LDA $0540,X                  ; $A0D3  BD 40 05
    BNE loc_1D_A13A              ; $A0D6  D0 62
    LDA $04A0,X                  ; $A0D8  BD A0 04
    AND #$01                     ; $A0DB  29 01
    BEQ loc_1D_A0E7              ; $A0DD  F0 08
    LDY #$00                     ; $A0DF  A0 00
    JSR sub_1F_F580              ; $A0E1  20 80 F5
    JMP loc_1D_A0EC              ; $A0E4  4C EC A0


loc_1D_A0E7:
    LDY #$01                     ; $A0E7  A0 01
    JSR sub_1F_F5C4              ; $A0E9  20 C4 F5

loc_1D_A0EC:
    LDA $04A0,X                  ; $A0EC  BD A0 04
    AND #$01                     ; $A0EF  29 01
    BEQ loc_1D_A0FD              ; $A0F1  F0 0A
    LDA $0360,X                  ; $A0F3  BD 60 03
    CMP #$D6                     ; $A0F6  C9 D6
    BCC loc_1D_A10C              ; $A0F8  90 12
    JMP loc_1D_A104              ; $A0FA  4C 04 A1


loc_1D_A0FD:
    LDA $0360,X                  ; $A0FD  BD 60 03
    CMP #$2A                     ; $A100  C9 2A
    BCS loc_1D_A10C              ; $A102  B0 08

loc_1D_A104:
    LDA $04A0,X                  ; $A104  BD A0 04
    EOR #$03                     ; $A107  49 03
    STA $04A0,X                  ; $A109  9D A0 04

loc_1D_A10C:
    LDY #$00                     ; $A10C  A0 00
    JSR sub_1F_F67C              ; $A10E  20 7C F6
    BCC loc_1D_A13E              ; $A111  90 2B
    LDA #$04                     ; $A113  A9 04
    STA $0540,X                  ; $A115  9D 40 05
    LDA $0500,X                  ; $A118  BD 00 05
    TAY                          ; $A11B  A8
    LDA $A17C,Y                  ; $A11C  B9 7C A1
    JSR sub_1F_F835              ; $A11F  20 35 F8
    LDA #$A8                     ; $A122  A9 A8
    STA $0440,X                  ; $A124  9D 40 04
    LDA #$05                     ; $A127  A9 05
    STA $0460,X                  ; $A129  9D 60 04
    JSR sub_1F_F8C2              ; $A12C  20 C2 F8
    CMP #$60                     ; $A12F  C9 60
    BCC loc_1D_A139              ; $A131  90 06
    DEC $0300,X                  ; $A133  DE 00 03
    JSR sub_1F_F81B              ; $A136  20 1B F8

loc_1D_A139:
    RTS                          ; $A139  60


loc_1D_A13A:
    DEC $0540,X                  ; $A13A  DE 40 05
    RTS                          ; $A13D  60


loc_1D_A13E:
    LDA $0460,X                  ; $A13E  BD 60 04
    BPL loc_1D_A14D              ; $A141  10 0A
    LDA $0500,X                  ; $A143  BD 00 05
    TAY                          ; $A146  A8
    LDA $A17A,Y                  ; $A147  B9 7A A1
    JMP sub_1F_F835              ; $A14A  4C 35 F8


loc_1D_A14D:
    LDA $0500,X                  ; $A14D  BD 00 05
    TYA                          ; $A150  98
    LDA $A17E,Y                  ; $A151  B9 7E A1
    CMP $05C0,X                  ; $A154  DD C0 05
    BEQ loc_1D_A163              ; $A157  F0 0A
    LDA $0500,X                  ; $A159  BD 00 05
    TYA                          ; $A15C  98
    LDA $A17E,Y                  ; $A15D  B9 7E A1
    JSR sub_1F_F835              ; $A160  20 35 F8

loc_1D_A163:
    LDA $05A0,X                  ; $A163  BD A0 05
    CMP #$01                     ; $A166  C9 01
    BNE loc_1D_A139              ; $A168  D0 CF
    JSR sub_1D_A293              ; $A16A  20 93 A2
    LDA #$00                     ; $A16D  A9 00
    STA $05E0,X                  ; $A16F  9D E0 05
    STA $05A0,X                  ; $A172  9D A0 05
    RTS                          ; $A175  60

    .byte $00,$01,$88,$8A,$86,$8F,$83,$8C,$85,$8E  ; $A176

loc_1D_A180:
    LDA #$99                     ; $A180  A9 99
    CMP $05C0,X                  ; $A182  DD C0 05
    BEQ loc_1D_A1A2              ; $A185  F0 1B
    LDA #$00                     ; $A187  A9 00
    STA $0480,X                  ; $A189  9D 80 04
    TAY                          ; $A18C  A8
    JSR sub_1F_F67C              ; $A18D  20 7C F6
    BCC loc_1D_A1E1              ; $A190  90 4F
    LDA #$99                     ; $A192  A9 99
    JSR sub_1F_F835              ; $A194  20 35 F8
    INC $05A0,X                  ; $A197  FE A0 05
    LDA #$00                     ; $A19A  A9 00
    STA $0440,X                  ; $A19C  9D 40 04
    STA $0460,X                  ; $A19F  9D 60 04

loc_1D_A1A2:
    LDA $05A0,X                  ; $A1A2  BD A0 05
    BNE loc_1D_A1E1              ; $A1A5  D0 3A
    STA $05E0,X                  ; $A1A7  9D E0 05
    LDA $0440,X                  ; $A1AA  BD 40 04
    CLC                          ; $A1AD  18
    ADC $99                      ; $A1AE  65 99
    STA $0440,X                  ; $A1B0  9D 40 04
    LDA $0460,X                  ; $A1B3  BD 60 04
    ADC #$00                     ; $A1B6  69 00
    STA $0460,X                  ; $A1B8  9D 60 04
    CMP #$0C                     ; $A1BB  C9 0C
    BNE loc_1D_A1C4              ; $A1BD  D0 05
    LDA #$00                     ; $A1BF  A9 00
    STA $0440,X                  ; $A1C1  9D 40 04

loc_1D_A1C4:
    JSR sub_1F_F779              ; $A1C4  20 79 F7
    LDA $03E0,X                  ; $A1C7  BD E0 03
    BEQ loc_1D_A1E1              ; $A1CA  F0 15
    LDA #$00                     ; $A1CC  A9 00
    STA $0300,X                  ; $A1CE  9D 00 03
    LDA $0320,X                  ; $A1D1  BD 20 03
    CMP #$53                     ; $A1D4  C9 53
    BNE loc_1D_A1DD              ; $A1D6  D0 05
    LDA #$13                     ; $A1D8  A9 13
    STA $30                      ; $A1DA  85 30
    RTS                          ; $A1DC  60


loc_1D_A1DD:
    LDA #$80                     ; $A1DD  A9 80
    STA $68                      ; $A1DF  85 68

loc_1D_A1E1:
    RTS                          ; $A1E1  60

    .byte $20,$49,$A2,$BD,$60,$05,$F0,$F7,$A9,$0F,$85,$30,$BD,$00,$03,$29  ; $A1E2
    .byte $0F,$D0,$21,$20,$97,$F7,$A9,$9C,$DD,$C0,$03,$B0,$44,$9D,$C0,$03  ; $A1F2
    .byte $BD,$A0,$05,$C9,$04,$D0,$3F,$A9,$88,$20,$35,$F8,$FE,$00,$03,$A9  ; $A202
    .byte $FF,$9D,$00,$05,$BD,$00,$05,$F0,$15,$DE,$00,$05,$D0,$23,$A9,$99  ; $A212
    .byte $9D,$C0,$05,$FE,$A0,$05,$A9,$00,$9D,$40,$04,$9D,$60,$04,$20,$A2  ; $A222
    .byte $A1,$A5,$68,$F0,$11,$A9,$00,$85,$30,$A0,$0F,$99,$10,$03,$88,$10  ; $A232
    .byte $FA,$A9,$00,$9D,$E0,$05,$60  ; $A242
    LDA $0560,X                  ; $A249  BD 60 05
    BNE loc_1D_A292              ; $A24C  D0 44
    LDA $30                      ; $A24E  A5 30
    BNE loc_1D_A25D              ; $A250  D0 0B
    LDA $05C0                    ; $A252  AD C0 05
    CMP #$13                     ; $A255  C9 13
    BEQ loc_1D_A292              ; $A257  F0 39
    LDA #$0F                     ; $A259  A9 0F
    STA $30                      ; $A25B  85 30

loc_1D_A25D:
    LDA #$11                     ; $A25D  A9 11
    CMP $D9                      ; $A25F  C5 D9
    BEQ loc_1D_A26B              ; $A261  F0 08
    JSR sub_1F_F898              ; $A263  20 98 F8
    LDA #$B4                     ; $A266  A9 B4
    STA $0500,X                  ; $A268  9D 00 05

loc_1D_A26B:
    DEC $0500,X                  ; $A26B  DE 00 05
    BNE loc_1D_A292              ; $A26E  D0 22
    LDA #$00                     ; $A270  A9 00
    STA $30                      ; $A272  85 30
    INC $0560,X                  ; $A274  FE 60 05
    LDA $0580,X                  ; $A277  BD 80 05
    AND #$FB                     ; $A27A  29 FB
    STA $0580,X                  ; $A27C  9D 80 05
    LDA $0320,X                  ; $A27F  BD 20 03
    CMP #$53                     ; $A282  C9 53
    BNE loc_1D_A28A              ; $A284  D0 04
    LDA #$0C                     ; $A286  A9 0C
    BNE loc_1D_A28F              ; $A288  D0 05

loc_1D_A28A:
    LDA $22                      ; $A28A  A5 22
    CLC                          ; $A28C  18
    ADC #$01                     ; $A28D  69 01

loc_1D_A28F:
    JSR sub_1F_F898              ; $A28F  20 98 F8

loc_1D_A292:
    RTS                          ; $A292  60


sub_1D_A293:
    JSR sub_1F_FC53              ; $A293  20 53 FC
    BCS loc_1D_A2E7              ; $A296  B0 4F
    STY $00                      ; $A298  84 00
    LDA $04A0,X                  ; $A29A  BD A0 04
    STA $04A0,Y                  ; $A29D  99 A0 04
    AND #$02                     ; $A2A0  29 02
    TAY                          ; $A2A2  A8
    LDA $0360,X                  ; $A2A3  BD 60 03
    CLC                          ; $A2A6  18
    ADC $A2E8,Y                  ; $A2A7  79 E8 A2
    PHA                          ; $A2AA  48
    LDA $0380,X                  ; $A2AB  BD 80 03
    ADC $A2E9,Y                  ; $A2AE  79 E9 A2
    LDY $00                      ; $A2B1  A4 00
    STA $0380,Y                  ; $A2B3  99 80 03
    PLA                          ; $A2B6  68
    STA $0360,Y                  ; $A2B7  99 60 03
    LDA $03C0,X                  ; $A2BA  BD C0 03
    STA $03C0,Y                  ; $A2BD  99 C0 03
    LDA #$00                     ; $A2C0  A9 00
    STA $04E0,Y                  ; $A2C2  99 E0 04
    STA $0400,Y                  ; $A2C5  99 00 04
    LDA #$04                     ; $A2C8  A9 04
    STA $0420,Y                  ; $A2CA  99 20 04
    LDA $0320,X                  ; $A2CD  BD 20 03
    AND #$01                     ; $A2D0  29 01
    BNE loc_1D_A2D8              ; $A2D2  D0 04
    LDA #$18                     ; $A2D4  A9 18
    BNE loc_1D_A2DA              ; $A2D6  D0 02

loc_1D_A2D8:
    LDA #$73                     ; $A2D8  A9 73

loc_1D_A2DA:
    JSR sub_1F_F846              ; $A2DA  20 46 F8
    LDA #$8B                     ; $A2DD  A9 8B
    STA $0480,Y                  ; $A2DF  99 80 04
    LDA #$1B                     ; $A2E2  A9 1B
    STA $0320,Y                  ; $A2E4  99 20 03

loc_1D_A2E7:
    RTS                          ; $A2E7  60

    .byte $0D,$00,$F3,$FF  ; $A2E8
    LDA $0300,X                  ; $A2EC  BD 00 03
    AND #$0F                     ; $A2EF  29 0F
    BNE loc_1D_A2FE              ; $A2F1  D0 0B
    JSR sub_1F_F883              ; $A2F3  20 83 F8
    LDA #$3C                     ; $A2F6  A9 3C
    STA $0560,X                  ; $A2F8  9D 60 05
    INC $0300,X                  ; $A2FB  FE 00 03

loc_1D_A2FE:
    LDA $0300,X                  ; $A2FE  BD 00 03
    AND #$0F                     ; $A301  29 0F
    CMP #$02                     ; $A303  C9 02
    BEQ loc_1D_A321              ; $A305  F0 1A
    CMP #$03                     ; $A307  C9 03
    BEQ loc_1D_A389              ; $A309  F0 7E
    DEC $0560,X                  ; $A30B  DE 60 05
    BNE loc_1D_A318              ; $A30E  D0 08
    LDA #$00                     ; $A310  A9 00
    STA $0560,X                  ; $A312  9D 60 05
    INC $0300,X                  ; $A315  FE 00 03

loc_1D_A318:
    LDA #$00                     ; $A318  A9 00
    STA $05E0,X                  ; $A31A  9D E0 05
    STA $05A0,X                  ; $A31D  9D A0 05
    RTS                          ; $A320  60


loc_1D_A321:
    LDA $0500,X                  ; $A321  BD 00 05
    BNE loc_1D_A36B              ; $A324  D0 45
    LDA $05A0,X                  ; $A326  BD A0 05
    CMP #$01                     ; $A329  C9 01
    BNE loc_1D_A33D              ; $A32B  D0 10
    LDA $05E0,X                  ; $A32D  BD E0 05
    CMP #$01                     ; $A330  C9 01
    BNE loc_1D_A33D              ; $A332  D0 09
    LDA #$04                     ; $A334  A9 04
    STA $01                      ; $A336  85 01
    STX $00                      ; $A338  86 00
    JSR sub_1D_A41A              ; $A33A  20 1A A4

loc_1D_A33D:
    LDA $05A0,X                  ; $A33D  BD A0 05
    CMP #$03                     ; $A340  C9 03
    BNE loc_1D_A354              ; $A342  D0 10
    LDA $05E0,X                  ; $A344  BD E0 05
    CMP #$01                     ; $A347  C9 01
    BNE loc_1D_A354              ; $A349  D0 09
    LDA #$04                     ; $A34B  A9 04
    STA $01                      ; $A34D  85 01
    STX $00                      ; $A34F  86 00
    JSR sub_1D_A41A              ; $A351  20 1A A4

loc_1D_A354:
    LDA $05A0,X                  ; $A354  BD A0 05
    CMP #$04                     ; $A357  C9 04
    BNE loc_1D_A36A              ; $A359  D0 0F
    LDA $05E0,X                  ; $A35B  BD E0 05
    CMP #$02                     ; $A35E  C9 02
    BNE loc_1D_A36A              ; $A360  D0 08
    INC $0500,X                  ; $A362  FE 00 05
    LDA #$10                     ; $A365  A9 10
    STA $0520,X                  ; $A367  9D 20 05

loc_1D_A36A:
    RTS                          ; $A36A  60


loc_1D_A36B:
    LDA #$00                     ; $A36B  A9 00
    STA $05E0,X                  ; $A36D  9D E0 05
    STA $05A0,X                  ; $A370  9D A0 05
    DEC $0520,X                  ; $A373  DE 20 05
    BNE loc_1D_A388              ; $A376  D0 10
    INC $0300,X                  ; $A378  FE 00 03
    LDA #$77                     ; $A37B  A9 77
    JSR sub_1F_F835              ; $A37D  20 35 F8
    JSR sub_1F_F869              ; $A380  20 69 F8
    LDA #$5A                     ; $A383  A9 5A
    STA $0540,X                  ; $A385  9D 40 05

loc_1D_A388:
    RTS                          ; $A388  60


loc_1D_A389:
    LDA $05C0,X                  ; $A389  BD C0 05
    CMP #$76                     ; $A38C  C9 76
    BEQ loc_1D_A3FA              ; $A38E  F0 6A
    LDY #$0E                     ; $A390  A0 0E
    JSR sub_1F_F67C              ; $A392  20 7C F6
    BCC loc_1D_A3BA              ; $A395  90 23
    LDA #$AA                     ; $A397  A9 AA
    STA $0480,X                  ; $A399  9D 80 04
    LDA $04A0,X                  ; $A39C  BD A0 04
    AND #$01                     ; $A39F  29 01
    BEQ loc_1D_A3AB              ; $A3A1  F0 08
    LDY #$1C                     ; $A3A3  A0 1C
    JSR sub_1F_F580              ; $A3A5  20 80 F5
    JMP loc_1D_A3B0              ; $A3A8  4C B0 A3


loc_1D_A3AB:
    LDY #$1D                     ; $A3AB  A0 1D
    JSR sub_1F_F5C4              ; $A3AD  20 C4 F5

loc_1D_A3B0:
    BCC loc_1D_A3BA              ; $A3B0  90 08
    LDA $04A0,X                  ; $A3B2  BD A0 04
    EOR #$03                     ; $A3B5  49 03
    STA $04A0,X                  ; $A3B7  9D A0 04

loc_1D_A3BA:
    LDA $0560,X                  ; $A3BA  BD 60 05
    BNE loc_1D_A3D7              ; $A3BD  D0 18
    DEC $0540,X                  ; $A3BF  DE 40 05
    BNE loc_1D_A3D6              ; $A3C2  D0 12
    LDA #$C6                     ; $A3C4  A9 C6
    STA $0480,X                  ; $A3C6  9D 80 04
    LDA #$76                     ; $A3C9  A9 76
    JSR sub_1F_F835              ; $A3CB  20 35 F8
    LDA #$FF                     ; $A3CE  A9 FF
    STA $0540,X                  ; $A3D0  9D 40 05
    INC $0560,X                  ; $A3D3  FE 60 05

loc_1D_A3D6:
    RTS                          ; $A3D6  60


loc_1D_A3D7:
    DEC $0540,X                  ; $A3D7  DE 40 05
    BNE loc_1D_A3D6              ; $A3DA  D0 FA
    LDA #$00                     ; $A3DC  A9 00
    STA $0500,X                  ; $A3DE  9D 00 05
    STA $0520,X                  ; $A3E1  9D 20 05
    STA $0540,X                  ; $A3E4  9D 40 05
    STA $0560,X                  ; $A3E7  9D 60 05
    LDA #$C6                     ; $A3EA  A9 C6
    STA $0480,X                  ; $A3EC  9D 80 04
    LDA #$76                     ; $A3EF  A9 76
    JSR sub_1F_F835              ; $A3F1  20 35 F8
    LDA #$82                     ; $A3F4  A9 82
    STA $0300,X                  ; $A3F6  9D 00 03
    RTS                          ; $A3F9  60


loc_1D_A3FA:
    LDA $05A0,X                  ; $A3FA  BD A0 05
    CMP #$01                     ; $A3FD  C9 01
    BNE loc_1D_A419              ; $A3FF  D0 18
    LDA $05E0,X                  ; $A401  BD E0 05
    CMP #$02                     ; $A404  C9 02
    BNE loc_1D_A419              ; $A406  D0 11
    LDA #$04                     ; $A408  A9 04
    STA $01                      ; $A40A  85 01
    STX $00                      ; $A40C  86 00
    JSR sub_1D_A41A              ; $A40E  20 1A A4
    LDA #$10                     ; $A411  A9 10
    STA $0520,X                  ; $A413  9D 20 05
    DEC $0300,X                  ; $A416  DE 00 03

loc_1D_A419:
    RTS                          ; $A419  60


sub_1D_A41A:
    JSR sub_1F_FC53              ; $A41A  20 53 FC
    BCS loc_1D_A472              ; $A41D  B0 53
    LDX $01                      ; $A41F  A6 01
    LDA $A475,X                  ; $A421  BD 75 A4
    STA $0400,Y                  ; $A424  99 00 04
    LDA $A47A,X                  ; $A427  BD 7A A4
    STA $0420,Y                  ; $A42A  99 20 04
    LDA $A47F,X                  ; $A42D  BD 7F A4
    STA $0440,Y                  ; $A430  99 40 04
    LDA $A484,X                  ; $A433  BD 84 A4
    STA $0460,Y                  ; $A436  99 60 04
    LDA $A489,X                  ; $A439  BD 89 A4
    STA $04A0,Y                  ; $A43C  99 A0 04
    LDA $A48E,X                  ; $A43F  BD 8E A4
    JSR sub_1F_F846              ; $A442  20 46 F8
    LDA $A493,X                  ; $A445  BD 93 A4
    STA $0580,Y                  ; $A448  99 80 05
    LDX $00                      ; $A44B  A6 00
    LDA #$CB                     ; $A44D  A9 CB
    STA $0480,Y                  ; $A44F  99 80 04
    LDA #$36                     ; $A452  A9 36
    STA $0320,Y                  ; $A454  99 20 03
    LDA $0360,X                  ; $A457  BD 60 03
    STA $0360,Y                  ; $A45A  99 60 03
    LDA $0380,X                  ; $A45D  BD 80 03
    STA $0380,Y                  ; $A460  99 80 03
    LDA $03C0,X                  ; $A463  BD C0 03
    STA $03C0,Y                  ; $A466  99 C0 03
    LDA #$01                     ; $A469  A9 01
    STA $04E0,Y                  ; $A46B  99 E0 04
    DEC $01                      ; $A46E  C6 01
    BPL sub_1D_A41A              ; $A470  10 A8

loc_1D_A472:
    LDX $00                      ; $A472  A6 00
    RTS                          ; $A474  60

    .byte $00,$1F,$00,$00,$1F,$00,$02,$03,$03,$02,$00,$E1,$00,$00,$E1,$FD  ; $A475
    .byte $FD,$00,$00,$FD,$02,$02,$02,$01,$01,$40,$79,$78,$78,$79,$90,$90  ; $A485
    .byte $90,$D0,$D0  ; $A495
    LDA $0300,X                  ; $A498  BD 00 03
    AND #$0F                     ; $A49B  29 0F
    BNE loc_1D_A4BA              ; $A49D  D0 1B
    LDA $04A0,X                  ; $A49F  BD A0 04
    AND #$01                     ; $A4A2  29 01
    BEQ loc_1D_A4AC              ; $A4A4  F0 06
    JSR sub_1F_F71D              ; $A4A6  20 1D F7
    JMP loc_1D_A4AF              ; $A4A9  4C AF A4


loc_1D_A4AC:
    JSR sub_1F_F73B              ; $A4AC  20 3B F7

loc_1D_A4AF:
    JSR sub_1F_F8C2              ; $A4AF  20 C2 F8
    CMP #$40                     ; $A4B2  C9 40
    BCS loc_1D_A4B9              ; $A4B4  B0 03
    INC $0300,X                  ; $A4B6  FE 00 03

loc_1D_A4B9:
    RTS                          ; $A4B9  60


loc_1D_A4BA:
    LDA $0300,X                  ; $A4BA  BD 00 03
    AND #$02                     ; $A4BD  29 02
    BEQ loc_1D_A4C4              ; $A4BF  F0 03
    JMP loc_1D_A561              ; $A4C1  4C 61 A5


loc_1D_A4C4:
    LDA $0500,X                  ; $A4C4  BD 00 05
    BNE loc_1D_A51A              ; $A4C7  D0 51
    LDY $0520,X                  ; $A4C9  BC 20 05
    LDA $A56E,Y                  ; $A4CC  B9 6E A5
    ASL A                        ; $A4CF  0A
    TAY                          ; $A4D0  A8
    LDA $A57C,Y                  ; $A4D1  B9 7C A5
    STA $0440,X                  ; $A4D4  9D 40 04
    LDA $A57D,Y                  ; $A4D7  B9 7D A5
    STA $0460,X                  ; $A4DA  9D 60 04
    LDA $A59C,Y                  ; $A4DD  B9 9C A5
    STA $0400,X                  ; $A4E0  9D 00 04
    LDA $A59D,Y                  ; $A4E3  B9 9D A5
    STA $0420,X                  ; $A4E6  9D 20 04
    LDA $0420,X                  ; $A4E9  BD 20 04
    BPL loc_1D_A503              ; $A4EC  10 15
    LDA $0400,X                  ; $A4EE  BD 00 04
    EOR #$FF                     ; $A4F1  49 FF
    CLC                          ; $A4F3  18
    ADC #$01                     ; $A4F4  69 01
    STA $0400,X                  ; $A4F6  9D 00 04
    LDA $0420,X                  ; $A4F9  BD 20 04
    EOR #$FF                     ; $A4FC  49 FF
    ADC #$00                     ; $A4FE  69 00
    STA $0420,X                  ; $A500  9D 20 04

loc_1D_A503:
    INC $0520,X                  ; $A503  FE 20 05
    LDA $0520,X                  ; $A506  BD 20 05
    CMP #$06                     ; $A509  C9 06
    BNE loc_1D_A515              ; $A50B  D0 08
    INC $0300,X                  ; $A50D  FE 00 03
    LDA #$1A                     ; $A510  A9 1A
    STA $0560,X                  ; $A512  9D 60 05

loc_1D_A515:
    LDA #$0D                     ; $A515  A9 0D
    STA $0500,X                  ; $A517  9D 00 05

loc_1D_A51A:
    DEC $0500,X                  ; $A51A  DE 00 05
    LDA $03A0,X                  ; $A51D  BD A0 03
    CLC                          ; $A520  18
    ADC $0440,X                  ; $A521  7D 40 04
    STA $03A0,X                  ; $A524  9D A0 03
    LDA $03C0,X                  ; $A527  BD C0 03
    ADC $0460,X                  ; $A52A  7D 60 04
    STA $03C0,X                  ; $A52D  9D C0 03
    LDA $04A0,X                  ; $A530  BD A0 04
    AND #$02                     ; $A533  29 02
    BNE loc_1D_A53E              ; $A535  D0 07
    JSR sub_1F_F71D              ; $A537  20 1D F7
    BCS loc_1D_A541              ; $A53A  B0 05
    BCC loc_1D_A541              ; $A53C  90 03

loc_1D_A53E:
    JSR sub_1F_F73B              ; $A53E  20 3B F7

loc_1D_A541:
    LDA $0560,X                  ; $A541  BD 60 05
    BNE loc_1D_A55D              ; $A544  D0 17
    JSR sub_1D_A5BC              ; $A546  20 BC A5
    INC $0540,X                  ; $A549  FE 40 05
    LDA $0540,X                  ; $A54C  BD 40 05
    CMP #$02                     ; $A54F  C9 02
    BNE loc_1D_A557              ; $A551  D0 04
    LDA #$10                     ; $A553  A9 10
    BNE loc_1D_A559              ; $A555  D0 02

loc_1D_A557:
    LDA #$1A                     ; $A557  A9 1A

loc_1D_A559:
    STA $0560,X                  ; $A559  9D 60 05
    RTS                          ; $A55C  60


loc_1D_A55D:
    DEC $0560,X                  ; $A55D  DE 60 05
    RTS                          ; $A560  60


loc_1D_A561:
    LDA #$00                     ; $A561  A9 00
    STA $0440,X                  ; $A563  9D 40 04
    LDA #$03                     ; $A566  A9 03
    STA $0460,X                  ; $A568  9D 60 04
    JMP sub_1F_F779              ; $A56B  4C 79 F7

    .byte $09,$0A,$0B,$0C,$0D,$0E,$0F,$01,$02,$03,$04,$05,$06,$07,$00,$FE  ; $A56E
    .byte $27,$FE,$96,$FE,$3D,$FF,$00,$00,$C3,$00,$6A,$01,$D9,$01,$00,$02  ; $A57E
    .byte $D9,$01,$6A,$01,$C3,$00,$00,$00,$3D,$FF,$96,$FE,$27,$FE,$00,$00  ; $A58E
    .byte $C3,$00,$6A,$01,$D9,$01,$00,$02,$D9,$01,$6A,$01,$C3,$00,$00,$00  ; $A59E
    .byte $3D,$FF,$96,$FE,$27,$FE,$00,$FE,$27,$FE,$96,$FE,$3D,$FF  ; $A5AE

sub_1D_A5BC:
    JSR sub_1F_FC53              ; $A5BC  20 53 FC
    BCS loc_1D_A5FD              ; $A5BF  B0 3C
    STY $00                      ; $A5C1  84 00
    LDA $04A0,X                  ; $A5C3  BD A0 04
    AND #$02                     ; $A5C6  29 02
    TAY                          ; $A5C8  A8
    LDA $0360,X                  ; $A5C9  BD 60 03
    CLC                          ; $A5CC  18
    ADC $A731,Y                  ; $A5CD  79 31 A7
    PHA                          ; $A5D0  48
    LDA $0380,X                  ; $A5D1  BD 80 03
    ADC $A732,Y                  ; $A5D4  79 32 A7
    LDY $00                      ; $A5D7  A4 00
    STA $0380,Y                  ; $A5D9  99 80 03
    PLA                          ; $A5DC  68
    STA $0360,Y                  ; $A5DD  99 60 03
    LDA $03C0,X                  ; $A5E0  BD C0 03
    CLC                          ; $A5E3  18
    ADC #$10                     ; $A5E4  69 10
    STA $03C0,Y                  ; $A5E6  99 C0 03
    LDA #$00                     ; $A5E9  A9 00
    STA $04E0,Y                  ; $A5EB  99 E0 04
    LDA #$81                     ; $A5EE  A9 81
    JSR sub_1F_F846              ; $A5F0  20 46 F8
    LDA #$26                     ; $A5F3  A9 26
    STA $0320,Y                  ; $A5F5  99 20 03
    LDA #$93                     ; $A5F8  A9 93
    STA $0480,Y                  ; $A5FA  99 80 04

loc_1D_A5FD:
    RTS                          ; $A5FD  60

    LDA $0300,X                  ; $A5FE  BD 00 03
    AND #$0F                     ; $A601  29 0F
    BNE loc_1D_A60B              ; $A603  D0 06
    JSR sub_1F_F81B              ; $A605  20 1B F8
    INC $0300,X                  ; $A608  FE 00 03

loc_1D_A60B:
    LDA $0300,X                  ; $A60B  BD 00 03
    AND #$02                     ; $A60E  29 02
    BNE loc_1D_A627              ; $A610  D0 15
    LDY #$12                     ; $A612  A0 12
    JSR sub_1F_F67C              ; $A614  20 7C F6
    BCC loc_1D_A626              ; $A617  90 0D
    LDA #$71                     ; $A619  A9 71
    JSR sub_1F_F835              ; $A61B  20 35 F8
    LDA #$24                     ; $A61E  A9 24
    JSR sub_1F_F89A              ; $A620  20 9A F8
    INC $0300,X                  ; $A623  FE 00 03

loc_1D_A626:
    RTS                          ; $A626  60


loc_1D_A627:
    LDA $05C0,X                  ; $A627  BD C0 05
    CMP #$71                     ; $A62A  C9 71
    BNE loc_1D_A626              ; $A62C  D0 F8
    LDA $05A0,X                  ; $A62E  BD A0 05
    CMP #$04                     ; $A631  C9 04
    BNE loc_1D_A626              ; $A633  D0 F1
    LDA #$80                     ; $A635  A9 80
    JMP sub_1F_F835              ; $A637  4C 35 F8

    .byte $BD,$C0,$05,$C9,$71,$D0,$27,$BD,$A0,$05,$C9,$04,$D0,$1F,$A9,$92  ; $A63A
    .byte $20,$35,$F8,$A9,$40,$9D,$00,$04,$9D,$40,$04,$A9,$00,$9D,$20,$04  ; $A64A
    .byte $9D,$60,$04,$A9,$C0,$9D,$80,$04,$A9,$01,$9D,$E0,$04,$60,$4C,$EA  ; $A65A
    .byte $AB,$BD,$00,$03,$29,$0F,$D0,$0B,$9D,$60,$04,$A9,$80,$9D,$40,$04  ; $A66A
    .byte $FE,$00,$03,$BD,$00,$03,$29,$02,$D0,$39,$BD,$A0,$04,$29,$01,$F0  ; $A67A
    .byte $08,$A0,$14,$20,$80,$F5,$4C,$98,$A6,$A0,$15,$20,$C4,$F5,$90,$06  ; $A68A
    .byte $FE,$40,$05,$4C,$59,$F7,$BD,$40,$05,$D0,$F8,$BD,$20,$05,$D0,$12  ; $A69A
    .byte $20,$C2,$F8,$C9,$08,$B0,$0B,$FE,$00,$03,$FE,$20,$05,$A9,$33,$20  ; $A6AA
    .byte $35,$F8,$60,$BD,$C0,$05,$C9,$33,$D0,$F8,$BD,$E0,$05,$1D,$A0,$05  ; $A6BA
    .byte $D0,$F0,$A9,$32,$20,$35,$F8,$A9,$00,$9D,$00,$04,$A9,$04,$9D,$20  ; $A6CA
    .byte $04,$DE,$00,$03,$20,$53,$FC,$B0,$4D,$84,$00,$BD,$A0,$04,$99,$A0  ; $A6DA
    .byte $04,$29,$02,$A8,$BD,$60,$03,$18,$79,$31,$A7,$48,$BD,$80,$03,$79  ; $A6EA
    .byte $32,$A7,$A4,$00,$99,$80,$03,$68,$99,$60,$03,$BD,$C0,$03,$38,$E9  ; $A6FA
    .byte $10,$99,$C0,$03,$A9,$00,$99,$E0,$04,$A9,$34,$20,$46,$F8,$BD,$20  ; $A70A
    .byte $03,$C9,$28,$F0,$07,$A9,$45,$99,$20,$03,$D0,$05,$A9,$29,$99,$20  ; $A71A
    .byte $03,$A9,$C0,$99,$80,$04,$60,$00,$00,$00,$00,$BD,$00,$03,$29,$0F  ; $A72A
    .byte $D0,$0E,$9D,$00,$05,$9D,$40,$04,$A9,$02,$9D,$60,$04,$FE,$00,$03  ; $A73A
    .byte $BD,$00,$03,$29,$02,$D0,$1A,$A0,$17,$20,$42,$F6,$90,$13,$FE,$00  ; $A74A
    .byte $03,$A9,$71,$20,$35,$F8,$A9,$00,$9D,$00,$05,$A9,$56,$9D,$20,$03  ; $A75A
    .byte $60,$BD,$00,$05,$D0,$5A,$BD,$20,$03,$C9,$29,$F0,$09,$BD,$C0,$03  ; $A76A
    .byte $C9,$62,$B0,$4C,$90,$07,$BD,$C0,$03,$C9,$B4,$B0,$43,$FE,$00,$05  ; $A77A
    .byte $20,$53,$FC,$B0,$3B,$84,$00,$BD,$A0,$04,$99,$A0,$04,$29,$02,$A8  ; $A78A
    .byte $BD,$60,$03,$18,$79,$31,$A7,$48,$BD,$80,$03,$79,$32,$A7,$A4,$00  ; $A79A
    .byte $99,$80,$03,$68,$99,$60,$03,$BD,$C0,$03,$38,$E9,$04,$99,$C0,$03  ; $A7AA
    .byte $A9,$00,$99,$20,$03,$99,$80,$04,$99,$E0,$04,$A9,$68,$20,$46,$F8  ; $A7BA
    .byte $60,$BD,$00,$03,$29,$0F,$D0,$19,$A0,$02,$B9,$BD,$A8,$99,$0D,$06  ; $A7CA
    .byte $99,$2D,$06,$88,$10,$F4,$84,$18,$FE,$00,$03,$20,$2E,$A8,$9D,$00  ; $A7DA
    .byte $05,$BD,$C0,$03,$48,$38,$E9,$10,$9D,$C0,$03,$A9,$00,$9D,$80,$04  ; $A7EA
    .byte $BD,$C0,$05,$48,$20,$03,$80,$68,$9D,$C0,$05,$68,$9D,$C0,$03,$BD  ; $A7FA
    .byte $E0,$04,$D0,$0C,$9D,$20,$05,$9D,$40,$05,$A9,$63,$9D,$20,$03,$60  ; $A80A
    .byte $A9,$98,$9D,$80,$04,$DE,$00,$05,$D0,$09,$20,$EC,$A8,$20,$2E,$A8  ; $A81A
    .byte $9D,$00,$05,$60  ; $A82A

sub_1D_A82E:
    LDA $E4                      ; $A82E  A5 E4
    ADC $E5                      ; $A830  65 E5
    STA $E5                      ; $A832  85 E5
    AND #$03                     ; $A834  29 03
    TAY                          ; $A836  A8
    LDA $A83B,Y                  ; $A837  B9 3B A8
    RTS                          ; $A83A  60

    .byte $3C,$1E,$78,$3C,$BD,$20,$05,$D0,$74,$A9,$0A,$9D,$20,$05,$20,$53  ; $A83B
    .byte $FC,$B0,$6D,$A9,$27,$20,$9A,$F8,$A9,$71,$20,$46,$F8,$A9,$19,$99  ; $A84B
    .byte $20,$03,$A9,$00,$99,$80,$04,$99,$00,$05,$BD,$80,$03,$99,$80,$03  ; $A85B
    .byte $86,$00,$BD,$C0,$03,$85,$01,$BD,$60,$03,$85,$02,$BD,$40,$05,$48  ; $A86B
    .byte $AA,$A5,$01,$18,$7D,$DC,$A8,$99,$C0,$03,$A5,$02,$18,$7D,$E4,$A8  ; $A87B
    .byte $99,$60,$03,$68,$0A,$0A,$AA,$A0,$00,$BD,$BC,$A8,$99,$0C,$06,$99  ; $A88B
    .byte $2C,$06,$E8,$C8,$C0,$04,$D0,$F1,$A9,$FF,$85,$18,$A6,$00,$FE,$40  ; $A89B
    .byte $05,$BD,$40,$05,$29,$03,$D0,$08,$A9,$00,$9D,$00,$03,$DE,$20,$05  ; $A8AB
    .byte $60,$0F,$20,$10,$17,$0F,$10,$00,$17,$0F,$00,$0F,$07,$0F,$0F,$0F  ; $A8BB
    .byte $0F,$0F,$20,$37,$17,$0F,$10,$27,$07,$0F,$0F,$17,$0F,$0F,$0F,$0F  ; $A8CB
    .byte $0F,$F0,$10,$10,$D0,$F0,$10,$10,$D0,$F0,$20,$E8,$10,$F0,$20,$E8  ; $A8DB
    .byte $10,$20,$53,$FC,$B0,$49,$84,$00,$BD,$A0,$04,$99,$A0,$04,$29,$02  ; $A8EB
    .byte $A8,$BD,$60,$03,$18,$79,$3B,$A9,$48,$BD,$80,$03,$79,$3C,$A9,$A4  ; $A8FB
    .byte $00,$99,$80,$03,$68,$99,$60,$03,$BD,$C0,$03,$18,$69,$1C,$99,$C0  ; $A90B
    .byte $03,$A9,$80,$99,$00,$04,$A9,$02,$99,$20,$04,$A9,$93,$20,$46,$F8  ; $A91B
    .byte $A9,$46,$99,$20,$03,$A9,$C0,$99,$80,$04,$A9,$01,$99,$E0,$04,$60  ; $A92B
    .byte $F8,$FF,$F8,$FF,$BD,$A0,$04,$29,$01,$F0,$08,$A9,$08,$20,$80,$F5  ; $A93B
    .byte $4C,$53,$A9,$A0,$09,$20,$C4,$F5,$90,$0A,$A9,$71,$20,$35,$F8,$A9  ; $A94B
    .byte $00,$9D,$20,$03  ; $A95B

loc_1D_A95F:
    RTS                          ; $A95F  60

    LDA $05E0,X                  ; $A960  BD E0 05
    CMP #$02                     ; $A963  C9 02
    BNE loc_1D_A95F              ; $A965  D0 F8
    LDA $0500,X                  ; $A967  BD 00 05
    CMP #$08                     ; $A96A  C9 08
    BEQ loc_1D_A95F              ; $A96C  F0 F1
    STX $00                      ; $A96E  86 00
    LDY $0360,X                  ; $A970  BC 60 03
    STY $02                      ; $A973  84 02
    LDY $0380,X                  ; $A975  BC 80 03
    STY $03                      ; $A978  84 03
    LDY $03C0,X                  ; $A97A  BC C0 03
    STY $04                      ; $A97D  84 04
    LDY $05C0,X                  ; $A97F  BC C0 05
    STY $10                      ; $A982  84 10
    LDA $0320,X                  ; $A984  BD 20 03
    STA $11                      ; $A987  85 11
    LDA $0500,X                  ; $A989  BD 00 05
    TAX                          ; $A98C  AA

loc_1D_A98D:
    JSR sub_1F_FC53              ; $A98D  20 53 FC
    BCS loc_1D_A9F7              ; $A990  B0 65
    LDA $10                      ; $A992  A5 10
    JSR sub_1F_F846              ; $A994  20 46 F8
    LDA $11                      ; $A997  A5 11
    CMP #$56                     ; $A999  C9 56
    BEQ loc_1D_A9B3              ; $A99B  F0 16
    CMP #$48                     ; $A99D  C9 48
    BEQ loc_1D_A9B3              ; $A99F  F0 12
    CMP #$39                     ; $A9A1  C9 39
    BEQ loc_1D_A9BF              ; $A9A3  F0 1A
    CMP #$48                     ; $A9A5  C9 48
    BEQ loc_1D_A9BF              ; $A9A7  F0 16
    LDA #$00                     ; $A9A9  A9 00
    STA $0480,Y                  ; $A9AB  99 80 04
    STA $0320,Y                  ; $A9AE  99 20 03
    BEQ loc_1D_A9C9              ; $A9B1  F0 16

loc_1D_A9B3:
    LDA #$80                     ; $A9B3  A9 80
    STA $0480,Y                  ; $A9B5  99 80 04
    LDA #$54                     ; $A9B8  A9 54
    STA $0320,Y                  ; $A9BA  99 20 03
    BNE loc_1D_A9C9              ; $A9BD  D0 0A

loc_1D_A9BF:
    LDA #$80                     ; $A9BF  A9 80
    STA $0480,Y                  ; $A9C1  99 80 04
    LDA #$55                     ; $A9C4  A9 55
    STA $0320,Y                  ; $A9C6  99 20 03

loc_1D_A9C9:
    LDA #$00                     ; $A9C9  A9 00
    STA $01                      ; $A9CB  85 01
    LDA $A9FA,X                  ; $A9CD  BD FA A9
    BPL loc_1D_A9D4              ; $A9D0  10 02
    DEC $01                      ; $A9D2  C6 01

loc_1D_A9D4:
    CLC                          ; $A9D4  18
    ADC $02                      ; $A9D5  65 02
    STA $0360,Y                  ; $A9D7  99 60 03
    LDA $03                      ; $A9DA  A5 03
    ADC $01                      ; $A9DC  65 01
    STA $0380,Y                  ; $A9DE  99 80 03
    LDA $04                      ; $A9E1  A5 04
    CLC                          ; $A9E3  18
    ADC $AA02,X                  ; $A9E4  7D 02 AA
    STA $03C0,Y                  ; $A9E7  99 C0 03
    LDX $00                      ; $A9EA  A6 00
    INC $0500,X                  ; $A9EC  FE 00 05
    LDA $0500,X                  ; $A9EF  BD 00 05
    TAX                          ; $A9F2  AA
    AND #$01                     ; $A9F3  29 01
    BNE loc_1D_A98D              ; $A9F5  D0 96

loc_1D_A9F7:
    LDX $00                      ; $A9F7  A6 00
    RTS                          ; $A9F9  60

    .byte $0C,$F4,$F0,$10,$F4,$0C,$00,$00,$F4,$0C,$00,$00,$F4,$0C,$F0,$10  ; $A9FA
    LDA $0300,X                  ; $AA0A  BD 00 03
    AND #$0F                     ; $AA0D  29 0F
    BNE loc_1D_AA2C              ; $AA0F  D0 1B
    LDA #$44                     ; $AA11  A9 44
    STA $0440,X                  ; $AA13  9D 40 04
    LDA #$03                     ; $AA16  A9 03
    STA $0460,X                  ; $AA18  9D 60 04
    LDA #$1E                     ; $AA1B  A9 1E
    STA $0500,X                  ; $AA1D  9D 00 05
    JSR sub_1F_F883              ; $AA20  20 83 F8
    JSR sub_1D_A82E              ; $AA23  20 2E A8
    STA $0520,X                  ; $AA26  9D 20 05
    INC $0300,X                  ; $AA29  FE 00 03

loc_1D_AA2C:
    DEC $0520,X                  ; $AA2C  DE 20 05
    BNE loc_1D_AA3A              ; $AA2F  D0 09
    JSR sub_1D_AA9A              ; $AA31  20 9A AA
    JSR sub_1D_A82E              ; $AA34  20 2E A8
    STA $0520,X                  ; $AA37  9D 20 05

loc_1D_AA3A:
    LDA $0300,X                  ; $AA3A  BD 00 03
    AND #$02                     ; $AA3D  29 02
    BNE loc_1D_AA72              ; $AA3F  D0 31
    LDA $04A0,X                  ; $AA41  BD A0 04
    AND #$01                     ; $AA44  29 01
    BEQ loc_1D_AA50              ; $AA46  F0 08
    LDY #$0A                     ; $AA48  A0 0A
    JSR sub_1F_F580              ; $AA4A  20 80 F5
    JMP loc_1D_AA55              ; $AA4D  4C 55 AA


loc_1D_AA50:
    LDY #$0B                     ; $AA50  A0 0B
    JSR sub_1F_F5C4              ; $AA52  20 C4 F5

loc_1D_AA55:
    LDY #$20                     ; $AA55  A0 20
    JSR sub_1F_F67C              ; $AA57  20 7C F6
    BCC loc_1D_AA6D              ; $AA5A  90 11
    LDA #$44                     ; $AA5C  A9 44
    STA $0440,X                  ; $AA5E  9D 40 04
    LDA #$03                     ; $AA61  A9 03
    STA $0460,X                  ; $AA63  9D 60 04
    INC $0300,X                  ; $AA66  FE 00 03
    LDA #$3D                     ; $AA69  A9 3D
    BNE loc_1D_AA6F              ; $AA6B  D0 02

loc_1D_AA6D:
    LDA #$3C                     ; $AA6D  A9 3C

loc_1D_AA6F:
    JMP sub_1F_F835              ; $AA6F  4C 35 F8


loc_1D_AA72:
    LDA $05C0,X                  ; $AA72  BD C0 05
    CMP #$3B                     ; $AA75  C9 3B
    BEQ loc_1D_AA86              ; $AA77  F0 0D
    LDA $05E0,X                  ; $AA79  BD E0 05
    ORA $05A0,X                  ; $AA7C  1D A0 05
    BNE loc_1D_AA99              ; $AA7F  D0 18
    LDA #$3B                     ; $AA81  A9 3B
    JSR sub_1F_F835              ; $AA83  20 35 F8

loc_1D_AA86:
    DEC $0500,X                  ; $AA86  DE 00 05
    BNE loc_1D_AA99              ; $AA89  D0 0E
    JSR sub_1F_F869              ; $AA8B  20 69 F8
    JSR sub_1F_F883              ; $AA8E  20 83 F8
    DEC $0300,X                  ; $AA91  DE 00 03
    LDA #$3C                     ; $AA94  A9 3C
    STA $0500,X                  ; $AA96  9D 00 05

loc_1D_AA99:
    RTS                          ; $AA99  60


sub_1D_AA9A:
    JSR sub_1F_FC53              ; $AA9A  20 53 FC
    BCS loc_1D_AADB              ; $AA9D  B0 3C
    STY $00                      ; $AA9F  84 00
    LDA $04A0,X                  ; $AAA1  BD A0 04
    STA $04A0,Y                  ; $AAA4  99 A0 04
    AND #$02                     ; $AAA7  29 02
    TAY                          ; $AAA9  A8
    LDA $0360,X                  ; $AAAA  BD 60 03
    CLC                          ; $AAAD  18
    ADC $AADC,Y                  ; $AAAE  79 DC AA
    PHA                          ; $AAB1  48
    LDA $0380,X                  ; $AAB2  BD 80 03
    ADC $AADD,Y                  ; $AAB5  79 DD AA
    LDY $00                      ; $AAB8  A4 00
    STA $0380,Y                  ; $AABA  99 80 03
    PLA                          ; $AABD  68
    STA $0360,Y                  ; $AABE  99 60 03
    LDA $03C0,X                  ; $AAC1  BD C0 03
    STA $03C0,Y                  ; $AAC4  99 C0 03
    LDA #$01                     ; $AAC7  A9 01
    STA $04E0,Y                  ; $AAC9  99 E0 04
    LDA #$3E                     ; $AACC  A9 3E
    JSR sub_1F_F846              ; $AACE  20 46 F8
    LDA #$1D                     ; $AAD1  A9 1D
    STA $0320,Y                  ; $AAD3  99 20 03
    LDA #$C0                     ; $AAD6  A9 C0
    STA $0480,Y                  ; $AAD8  99 80 04

loc_1D_AADB:
    RTS                          ; $AADB  60

    .byte $08,$00,$F8,$FF  ; $AADC
    LDA $0300,X                  ; $AAE0  BD 00 03
    AND #$0F                     ; $AAE3  29 0F
    BNE loc_1D_AAF2              ; $AAE5  D0 0B
    STA $0500,X                  ; $AAE7  9D 00 05
    LDA #$1E                     ; $AAEA  A9 1E
    STA $0520,X                  ; $AAEC  9D 20 05
    INC $0300,X                  ; $AAEF  FE 00 03

loc_1D_AAF2:
    LDA $0300,X                  ; $AAF2  BD 00 03
    AND #$02                     ; $AAF5  29 02
    BNE loc_1D_AB3A              ; $AAF7  D0 41
    LDA $04A0,X                  ; $AAF9  BD A0 04
    AND #$01                     ; $AAFC  29 01
    BEQ loc_1D_AB06              ; $AAFE  F0 06
    JSR sub_1F_F71D              ; $AB00  20 1D F7
    JMP loc_1D_AB09              ; $AB03  4C 09 AB


loc_1D_AB06:
    JSR sub_1F_F73B              ; $AB06  20 3B F7

loc_1D_AB09:
    LDY #$08                     ; $AB09  A0 08
    JSR sub_1F_F67C              ; $AB0B  20 7C F6
    BCC loc_1D_AB39              ; $AB0E  90 29
    LDA $0500,X                  ; $AB10  BD 00 05
    TAY                          ; $AB13  A8
    LDA $AB4F,Y                  ; $AB14  B9 4F AB
    STA $0440,X                  ; $AB17  9D 40 04
    LDA $AB52,Y                  ; $AB1A  B9 52 AB
    STA $0460,X                  ; $AB1D  9D 60 04
    LDA $AB55,Y                  ; $AB20  B9 55 AB
    STA $0400,X                  ; $AB23  9D 00 04
    LDA $AB58,Y                  ; $AB26  B9 58 AB
    STA $0420,X                  ; $AB29  9D 20 04
    INC $0500,X                  ; $AB2C  FE 00 05
    LDA $0500,X                  ; $AB2F  BD 00 05
    CMP #$03                     ; $AB32  C9 03
    BCC loc_1D_AB39              ; $AB34  90 03
    INC $0300,X                  ; $AB36  FE 00 03

loc_1D_AB39:
    RTS                          ; $AB39  60


loc_1D_AB3A:
    DEC $0520,X                  ; $AB3A  DE 20 05
    BNE loc_1D_AB3A              ; $AB3D  D0 FB
    LDA #$71                     ; $AB3F  A9 71
    JSR sub_1F_F835              ; $AB41  20 35 F8
    LDA #$00                     ; $AB44  A9 00
    STA $0500,X                  ; $AB46  9D 00 05
    LDA #$39                     ; $AB49  A9 39
    STA $0320,X                  ; $AB4B  9D 20 03
    RTS                          ; $AB4E  60

    .byte $9E,$44,$4F,$04,$03,$02,$00,$00,$80,$01,$01,$00  ; $AB4F
    LDA $05C0,X                  ; $AB5B  BD C0 05
    CMP #$2F                     ; $AB5E  C9 2F
    BNE loc_1D_AB65              ; $AB60  D0 03
    JMP loc_1D_ABEA              ; $AB62  4C EA AB


loc_1D_AB65:
    LDA $0300,X                  ; $AB65  BD 00 03
    AND #$0F                     ; $AB68  29 0F
    BNE loc_1D_ABC9              ; $AB6A  D0 5D
    JSR sub_1D_AC27              ; $AB6C  20 27 AC
    BCS loc_1D_ABE9              ; $AB6F  B0 78
    LDA $0580,X                  ; $AB71  BD 80 05
    AND #$FB                     ; $AB74  29 FB
    STA $0580,X                  ; $AB76  9D 80 05
    INC $0300,X                  ; $AB79  FE 00 03
    LDA #$66                     ; $AB7C  A9 66
    STA $0440,X                  ; $AB7E  9D 40 04
    LDA #$00                     ; $AB81  A9 00
    STA $0460,X                  ; $AB83  9D 60 04
    LDA #$2E                     ; $AB86  A9 2E
    JSR sub_1F_F846              ; $AB88  20 46 F8
    LDA #$31                     ; $AB8B  A9 31
    STA $0320,Y                  ; $AB8D  99 20 03
    LDA $03C0,X                  ; $AB90  BD C0 03
    STA $03C0,Y                  ; $AB93  99 C0 03
    LDA $FC                      ; $AB96  A5 FC
    CLC                          ; $AB98  18
    ADC #$04                     ; $AB99  69 04
    STA $0360,Y                  ; $AB9B  99 60 03
    LDA $F9                      ; $AB9E  A5 F9
    ADC #$00                     ; $ABA0  69 00
    STA $0380,Y                  ; $ABA2  99 80 03
    LDA #$00                     ; $ABA5  A9 00
    STA $0400,Y                  ; $ABA7  99 00 04
    LDA #$04                     ; $ABAA  A9 04
    STA $0420,Y                  ; $ABAC  99 20 04
    LDA $0360,X                  ; $ABAF  BD 60 03
    SEC                          ; $ABB2  38
    SBC #$08                     ; $ABB3  E9 08
    STA $0500,Y                  ; $ABB5  99 00 05
    LDA $0380,X                  ; $ABB8  BD 80 03
    SBC #$00                     ; $ABBB  E9 00
    STA $0540,Y                  ; $ABBD  99 40 05
    TXA                          ; $ABC0  8A
    STA $0520,Y                  ; $ABC1  99 20 05
    LDA #$00                     ; $ABC4  A9 00
    STA $0480,Y                  ; $ABC6  99 80 04

loc_1D_ABC9:
    LDA $0580,X                  ; $ABC9  BD 80 05
    AND #$FB                     ; $ABCC  29 FB
    STA $0580,X                  ; $ABCE  9D 80 05
    LDA $0500,X                  ; $ABD1  BD 00 05
    BNE loc_1D_ABE9              ; $ABD4  D0 13
    LDA #$00                     ; $ABD6  A9 00
    STA $05E0,X                  ; $ABD8  9D E0 05
    LDA $92                      ; $ABDB  A5 92
    AND #$04                     ; $ABDD  29 04
    BEQ loc_1D_ABE9              ; $ABDF  F0 08
    LDA $0580,X                  ; $ABE1  BD 80 05
    ORA #$04                     ; $ABE4  09 04
    STA $0580,X                  ; $ABE6  9D 80 05

loc_1D_ABE9:
    RTS                          ; $ABE9  60


loc_1D_ABEA:
    LDA $0360                    ; $ABEA  AD 60 03
    SEC                          ; $ABED  38
    SBC $0360,X                  ; $ABEE  FD 60 03
    PHA                          ; $ABF1  48
    LDA $0380                    ; $ABF2  AD 80 03
    SBC $0380,X                  ; $ABF5  FD 80 03
    PLA                          ; $ABF8  68
    BEQ loc_1D_AC16              ; $ABF9  F0 1B
    BCC loc_1D_AC0B              ; $ABFB  90 0E
    JSR sub_1F_F71D              ; $ABFD  20 1D F7
    LDA $0580,X                  ; $AC00  BD 80 05
    ORA #$40                     ; $AC03  09 40
    STA $0580,X                  ; $AC05  9D 80 05
    JMP loc_1D_AC16              ; $AC08  4C 16 AC


loc_1D_AC0B:
    JSR sub_1F_F73B              ; $AC0B  20 3B F7
    LDA $0580,X                  ; $AC0E  BD 80 05
    AND #$BF                     ; $AC11  29 BF
    STA $0580,X                  ; $AC13  9D 80 05

loc_1D_AC16:
    LDA $03C0                    ; $AC16  AD C0 03
    SEC                          ; $AC19  38
    SBC $03C0,X                  ; $AC1A  FD C0 03
    BEQ loc_1D_ABE9              ; $AC1D  F0 CA
    BCS loc_1D_AC24              ; $AC1F  B0 03
    JMP sub_1F_F779              ; $AC21  4C 79 F7


loc_1D_AC24:
    JMP sub_1F_F759              ; $AC24  4C 59 F7


sub_1D_AC27:
    JSR sub_1F_F8C2              ; $AC27  20 C2 F8
    CMP #$44                     ; $AC2A  C9 44
    BCS loc_1D_AC7E              ; $AC2C  B0 50
    LDA $0360,X                  ; $AC2E  BD 60 03
    SEC                          ; $AC31  38
    SBC $FC                      ; $AC32  E5 FC
    STA $00                      ; $AC34  85 00
    LDA $0380,X                  ; $AC36  BD 80 03
    SBC $F9                      ; $AC39  E5 F9
    BCC loc_1D_AC79              ; $AC3B  90 3C
    LDA $00                      ; $AC3D  A5 00
    CMP #$80                     ; $AC3F  C9 80
    BCC loc_1D_AC79              ; $AC41  90 36
    LDA #$00                     ; $AC43  A9 00
    STA $01                      ; $AC45  85 01
    STX $00                      ; $AC47  86 00
    LDY #$1F                     ; $AC49  A0 1F

loc_1D_AC4B:
    CPY $00                      ; $AC4B  C4 00
    BEQ loc_1D_AC62              ; $AC4D  F0 13
    LDA $0300,Y                  ; $AC4F  B9 00 03
    BPL loc_1D_AC62              ; $AC52  10 0E
    LDA $0580,Y                  ; $AC54  B9 80 05
    BPL loc_1D_AC62              ; $AC57  10 09
    LDA $0320,Y                  ; $AC59  B9 20 03
    CMP #$30                     ; $AC5C  C9 30
    BNE loc_1D_AC62              ; $AC5E  D0 02
    INC $01                      ; $AC60  E6 01

loc_1D_AC62:
    DEY                          ; $AC62  88
    CPY #$0F                     ; $AC63  C0 0F
    BNE loc_1D_AC4B              ; $AC65  D0 E4
    LDA $01                      ; $AC67  A5 01
    CMP #$03                     ; $AC69  C9 03
    BEQ loc_1D_AC79              ; $AC6B  F0 0C
    LDY $00                      ; $AC6D  A4 00

loc_1D_AC6F:
    LDA $0300,Y                  ; $AC6F  B9 00 03
    BPL loc_1D_AC80              ; $AC72  10 0C
    DEY                          ; $AC74  88
    CPY #$0F                     ; $AC75  C0 0F
    BNE loc_1D_AC6F              ; $AC77  D0 F6

loc_1D_AC79:
    LDA #$00                     ; $AC79  A9 00
    STA $0300,X                  ; $AC7B  9D 00 03

loc_1D_AC7E:
    SEC                          ; $AC7E  38
    RTS                          ; $AC7F  60


loc_1D_AC80:
    CLC                          ; $AC80  18
    RTS                          ; $AC81  60

    LDA $0300,X                  ; $AC82  BD 00 03
    AND #$0F                     ; $AC85  29 0F
    BNE loc_1D_ACBE              ; $AC87  D0 35
    STA $0560,X                  ; $AC89  9D 60 05
    JSR sub_1F_F71D              ; $AC8C  20 1D F7
    LDA $0500,X                  ; $AC8F  BD 00 05
    SEC                          ; $AC92  38
    SBC $0360,X                  ; $AC93  FD 60 03
    LDA $0540,X                  ; $AC96  BD 40 05
    SBC $0380,X                  ; $AC99  FD 80 03
    BCS loc_1D_ACB8              ; $AC9C  B0 1A
    LDA $0500,X                  ; $AC9E  BD 00 05
    STA $0360,X                  ; $ACA1  9D 60 03
    LDA $0540,X                  ; $ACA4  BD 40 05
    STA $0380,X                  ; $ACA7  9D 80 03
    INC $0300,X                  ; $ACAA  FE 00 03
    LDY $0520,X                  ; $ACAD  BC 20 05
    LDA #$08                     ; $ACB0  A9 08
    STA $0500,Y                  ; $ACB2  99 00 05
    STA $0500,X                  ; $ACB5  9D 00 05

loc_1D_ACB8:
    LDA #$00                     ; $ACB8  A9 00
    STA $05E0,X                  ; $ACBA  9D E0 05
    RTS                          ; $ACBD  60


loc_1D_ACBE:
    LDA $0560,X                  ; $ACBE  BD 60 05
    BNE loc_1D_ACCB              ; $ACC1  D0 08
    LDA #$25                     ; $ACC3  A9 25
    JSR sub_1F_F89A              ; $ACC5  20 9A F8
    INC $0560,X                  ; $ACC8  FE 60 05

loc_1D_ACCB:
    LDA #$01                     ; $ACCB  A9 01
    STA $95                      ; $ACCD  85 95
    LDA $0500,X                  ; $ACCF  BD 00 05
    BEQ loc_1D_ACE0              ; $ACD2  F0 0C
    LDA $05E0,X                  ; $ACD4  BD E0 05
    BNE loc_1D_AD08              ; $ACD7  D0 2F
    DEC $0500,X                  ; $ACD9  DE 00 05
    INC $0360,X                  ; $ACDC  FE 60 03
    RTS                          ; $ACDF  60


loc_1D_ACE0:
    LDA $05A0,X                  ; $ACE0  BD A0 05
    BNE loc_1D_AD08              ; $ACE3  D0 23
    STA $05E0,X                  ; $ACE5  9D E0 05
    LDY $0520,X                  ; $ACE8  BC 20 05
    LDA $05A0,Y                  ; $ACEB  B9 A0 05
    BNE loc_1D_AD08              ; $ACEE  D0 18
    STA $05E0,Y                  ; $ACF0  99 E0 05
    STA $0500,Y                  ; $ACF3  99 00 05
    STA $0300,X                  ; $ACF6  9D 00 03
    LDA #$2F                     ; $ACF9  A9 2F
    STA $05C0,Y                  ; $ACFB  99 C0 05
    LDA #$C0                     ; $ACFE  A9 C0
    STA $0480,Y                  ; $AD00  99 80 04
    LDA #$01                     ; $AD03  A9 01
    STA $04E0,Y                  ; $AD05  99 E0 04

loc_1D_AD08:
    RTS                          ; $AD08  60

    LDA $0300,X                  ; $AD09  BD 00 03
    AND #$0F                     ; $AD0C  29 0F
    BNE loc_1D_AD4B              ; $AD0E  D0 3B
    JSR sub_1F_F8C2              ; $AD10  20 C2 F8
    CMP #$28                     ; $AD13  C9 28
    BCS loc_1D_AD4A              ; $AD15  B0 33
    INC $0300,X                  ; $AD17  FE 00 03
    LDA #$1E                     ; $AD1A  A9 1E
    STA $0500,X                  ; $AD1C  9D 00 05
    LDA #$30                     ; $AD1F  A9 30
    STA $0540,X                  ; $AD21  9D 40 05
    LDA $0580,X                  ; $AD24  BD 80 05
    EOR #$04                     ; $AD27  49 04
    STA $0580,X                  ; $AD29  9D 80 05
    LDA $04A0,X                  ; $AD2C  BD A0 04
    AND #$02                     ; $AD2F  29 02
    TAY                          ; $AD31  A8
    LDA $0360,X                  ; $AD32  BD 60 03
    CLC                          ; $AD35  18
    ADC $ADD5,Y                  ; $AD36  79 D5 AD
    PHA                          ; $AD39  48
    LDA $0380,X                  ; $AD3A  BD 80 03
    ADC $ADD6,Y                  ; $AD3D  79 D6 AD
    STA $0380,X                  ; $AD40  9D 80 03
    PLA                          ; $AD43  68
    STA $0360,X                  ; $AD44  9D 60 03
    JSR sub_1F_F869              ; $AD47  20 69 F8

loc_1D_AD4A:
    RTS                          ; $AD4A  60


loc_1D_AD4B:
    LDA $0300,X                  ; $AD4B  BD 00 03
    AND #$02                     ; $AD4E  29 02
    BNE loc_1D_AD9A              ; $AD50  D0 48
    JSR sub_1F_F883              ; $AD52  20 83 F8
    LDA $04A0,X                  ; $AD55  BD A0 04
    AND #$01                     ; $AD58  29 01
    BEQ loc_1D_AD62              ; $AD5A  F0 06
    JSR sub_1F_F71D              ; $AD5C  20 1D F7
    JMP loc_1D_AD65              ; $AD5F  4C 65 AD


loc_1D_AD62:
    JSR sub_1F_F73B              ; $AD62  20 3B F7

loc_1D_AD65:
    LDA $0520,X                  ; $AD65  BD 20 05
    BNE loc_1D_AD99              ; $AD68  D0 2F
    JSR sub_1F_F8C2              ; $AD6A  20 C2 F8
    CMP #$50                     ; $AD6D  C9 50
    BCC loc_1D_AD99              ; $AD6F  90 28
    INC $0300,X                  ; $AD71  FE 00 03
    INC $0520,X                  ; $AD74  FE 20 05
    LDA #$80                     ; $AD77  A9 80
    STA $0440,X                  ; $AD79  9D 40 04
    LDA #$00                     ; $AD7C  A9 00
    STA $0460,X                  ; $AD7E  9D 60 04
    LDA $04A0,X                  ; $AD81  BD A0 04
    AND #$01                     ; $AD84  29 01
    BEQ loc_1D_AD91              ; $AD86  F0 09
    LDA $0580,X                  ; $AD88  BD 80 05
    AND #$BF                     ; $AD8B  29 BF
    STA $0580,X                  ; $AD8D  9D 80 05
    RTS                          ; $AD90  60


loc_1D_AD91:
    LDA $0580,X                  ; $AD91  BD 80 05
    ORA #$40                     ; $AD94  09 40
    STA $0580,X                  ; $AD96  9D 80 05

loc_1D_AD99:
    RTS                          ; $AD99  60


loc_1D_AD9A:
    DEC $0540,X                  ; $AD9A  DE 40 05
    BNE loc_1D_ADB2              ; $AD9D  D0 13
    DEC $0300,X                  ; $AD9F  DE 00 03
    LDA $04A0,X                  ; $ADA2  BD A0 04
    EOR #$03                     ; $ADA5  49 03
    STA $04A0,X                  ; $ADA7  9D A0 04
    LDA #$3A                     ; $ADAA  A9 3A
    JSR sub_1F_F835              ; $ADAC  20 35 F8
    JMP loc_1D_ADD9              ; $ADAF  4C D9 AD


loc_1D_ADB2:
    LDA $04A0,X                  ; $ADB2  BD A0 04
    AND #$01                     ; $ADB5  29 01
    BEQ loc_1D_ADBF              ; $ADB7  F0 06
    JSR sub_1F_F779              ; $ADB9  20 79 F7
    JMP loc_1D_ADC2              ; $ADBC  4C C2 AD


loc_1D_ADBF:
    JSR sub_1F_F759              ; $ADBF  20 59 F7

loc_1D_ADC2:
    DEC $0500,X                  ; $ADC2  DE 00 05
    BNE loc_1D_AD99              ; $ADC5  D0 D2
    LDA #$3C                     ; $ADC7  A9 3C
    STA $0500,X                  ; $ADC9  9D 00 05
    LDA $04A0,X                  ; $ADCC  BD A0 04
    EOR #$03                     ; $ADCF  49 03
    STA $04A0,X                  ; $ADD1  9D A0 04
    RTS                          ; $ADD4  60

    .byte $50,$00,$B0,$FF  ; $ADD5

loc_1D_ADD9:
    JSR sub_1F_FC53              ; $ADD9  20 53 FC
    BCS loc_1D_AE27              ; $ADDC  B0 49
    STY $01                      ; $ADDE  84 01
    LDA $04A0,X                  ; $ADE0  BD A0 04
    STA $04A0,Y                  ; $ADE3  99 A0 04
    AND #$02                     ; $ADE6  29 02
    TAY                          ; $ADE8  A8
    LDA $0360,X                  ; $ADE9  BD 60 03
    CLC                          ; $ADEC  18
    ADC $A731,Y                  ; $ADED  79 31 A7
    PHA                          ; $ADF0  48
    LDA $0380,X                  ; $ADF1  BD 80 03
    ADC $A732,Y                  ; $ADF4  79 32 A7
    LDY $01                      ; $ADF7  A4 01
    STA $0380,Y                  ; $ADF9  99 80 03
    PLA                          ; $ADFC  68
    STA $0360,Y                  ; $ADFD  99 60 03
    LDA $03C0,X                  ; $AE00  BD C0 03
    CLC                          ; $AE03  18
    ADC #$18                     ; $AE04  69 18
    STA $03C0,Y                  ; $AE06  99 C0 03
    LDA #$35                     ; $AE09  A9 35
    JSR sub_1F_F846              ; $AE0B  20 46 F8
    LDA #$2F                     ; $AE0E  A9 2F
    STA $0320,Y                  ; $AE10  99 20 03
    LDA #$CF                     ; $AE13  A9 CF
    STA $0480,Y                  ; $AE15  99 80 04
    LDA #$01                     ; $AE18  A9 01
    STA $04E0,Y                  ; $AE1A  99 E0 04
    LDA #$50                     ; $AE1D  A9 50
    STA $0440,Y                  ; $AE1F  99 40 04
    LDA #$04                     ; $AE22  A9 04
    STA $0460,Y                  ; $AE24  99 60 04

loc_1D_AE27:
    RTS                          ; $AE27  60

    LDY #$08                     ; $AE28  A0 08
    JSR sub_1F_F606              ; $AE2A  20 06 F6
    BCC loc_1D_AE27              ; $AE2D  90 F8
    LDA #$71                     ; $AE2F  A9 71
    JSR sub_1F_F835              ; $AE31  20 35 F8
    LDA #$00                     ; $AE34  A9 00
    STA $0500,X                  ; $AE36  9D 00 05
    LDA #$3A                     ; $AE39  A9 3A
    STA $0320,X                  ; $AE3B  9D 20 03
    LDA #$00                     ; $AE3E  A9 00
    STA $01                      ; $AE40  85 01

loc_1D_AE42:
    JSR sub_1F_FC53              ; $AE42  20 53 FC
    BCS loc_1D_AEB3              ; $AE45  B0 6C
    STY $00                      ; $AE47  84 00
    LDA $04A0,X                  ; $AE49  BD A0 04
    STA $04A0,Y                  ; $AE4C  99 A0 04
    LDA $01                      ; $AE4F  A5 01
    ASL A                        ; $AE51  0A
    TAY                          ; $AE52  A8
    LDA $0360,X                  ; $AE53  BD 60 03
    CLC                          ; $AE56  18
    ADC $AEB4,Y                  ; $AE57  79 B4 AE
    PHA                          ; $AE5A  48
    LDA $0380,X                  ; $AE5B  BD 80 03
    ADC $AEB5,Y                  ; $AE5E  79 B5 AE
    LDY $00                      ; $AE61  A4 00
    STA $0380,Y                  ; $AE63  99 80 03
    PLA                          ; $AE66  68
    STA $0360,Y                  ; $AE67  99 60 03
    LDY $01                      ; $AE6A  A4 01
    LDA $03C0,X                  ; $AE6C  BD C0 03
    CLC                          ; $AE6F  18
    ADC $AEBE,Y                  ; $AE70  79 BE AE
    LDY $00                      ; $AE73  A4 00
    STA $03C0,Y                  ; $AE75  99 C0 03
    LDA #$41                     ; $AE78  A9 41
    JSR sub_1F_F846              ; $AE7A  20 46 F8
    LDA #$00                     ; $AE7D  A9 00
    STA $0400,Y                  ; $AE7F  99 00 04
    STA $0420,Y                  ; $AE82  99 20 04
    LDA #$C0                     ; $AE85  A9 C0
    STA $0480,Y                  ; $AE87  99 80 04
    LDA #$01                     ; $AE8A  A9 01
    STA $04E0,Y                  ; $AE8C  99 E0 04
    LDA #$3B                     ; $AE8F  A9 3B
    STA $0320,Y                  ; $AE91  99 20 03
    LDA #$08                     ; $AE94  A9 08
    STA $0500,Y                  ; $AE96  99 00 05
    STA $0520,Y                  ; $AE99  99 20 05
    LDA #$10                     ; $AE9C  A9 10
    STA $0540,Y                  ; $AE9E  99 40 05
    LDA #$33                     ; $AEA1  A9 33
    STA $0440,Y                  ; $AEA3  99 40 04
    LDA #$01                     ; $AEA6  A9 01
    STA $0460,Y                  ; $AEA8  99 60 04
    INC $01                      ; $AEAB  E6 01
    LDA $01                      ; $AEAD  A5 01
    CMP #$05                     ; $AEAF  C9 05
    BCC loc_1D_AE42              ; $AEB1  90 8F

loc_1D_AEB3:
    RTS                          ; $AEB3  60

    .byte $E8,$FF,$E8,$FF,$01,$00,$18,$00,$18,$00,$E8,$18,$01,$E8,$18,$BD  ; $AEB4
    .byte $00,$03,$29,$0F,$D0,$15,$FE,$00,$03,$A9,$3C,$9D,$40,$04,$A9,$09  ; $AEC4
    .byte $9D,$60,$04,$A9,$1E,$9D,$00,$05,$20,$83,$F8,$BD,$00,$03,$29,$0F  ; $AED4
    .byte $C9,$02,$F0,$57,$C9,$03,$D0,$03,$4C,$A5,$AF,$BD,$00,$05,$D0,$22  ; $AEE4
    .byte $BD,$C0,$05,$C9,$44,$F0,$1F,$BD,$20,$05,$D0,$1A,$A9,$45,$20,$35  ; $AEF4
    .byte $F8,$A0,$15,$20,$7C,$F6,$A5,$10,$29,$10,$F0,$09,$A9,$44,$20,$35  ; $AF04
    .byte $F8,$60,$DE,$00,$05,$60,$BD,$C0,$05,$C9,$45,$F0,$0F,$20,$C2,$F8  ; $AF14
    .byte $C9,$28,$B0,$F1,$A9,$45,$20,$35,$F8,$FE,$20,$05,$A0,$15,$20,$7C  ; $AF24
    .byte $F6,$90,$E2,$A9,$43,$20,$35,$F8,$FE,$00,$03,$BD,$40,$05,$D0,$18  ; $AF34
    .byte $BD,$E0,$04,$C9,$04,$D0,$11,$FE,$00,$03,$A9,$3C,$9D,$40,$04,$A9  ; $AF44
    .byte $09,$9D,$60,$04,$FE,$40,$05,$60,$BD,$A0,$04,$29,$01,$F0,$08,$A0  ; $AF54
    .byte $16,$20,$80,$F5,$4C,$70,$AF,$A0,$17,$20,$C4,$F5,$BD,$C0,$05,$C9  ; $AF64
    .byte $43,$F0,$24,$A0,$15,$20,$7C,$F6,$90,$1C,$A9,$BB,$9D,$40,$04,$A9  ; $AF74
    .byte $06,$9D,$60,$04,$A9,$43,$20,$35,$F8,$A9,$01,$9D,$A0,$05,$A9,$00  ; $AF84
    .byte $9D,$E0,$05,$20,$69,$F8,$60,$BD,$A0,$05,$D0,$00,$A9,$46,$4C,$35  ; $AF94
    .byte $F8,$BD,$C0,$05,$C9,$44,$F0,$1A,$A9,$45,$20,$35,$F8,$A0,$15,$20  ; $AFA4
    .byte $7C,$F6,$A5,$10,$29,$10,$F0,$DE,$A9,$44,$20,$35,$F8,$A9,$5A,$9D  ; $AFB4
    .byte $60,$05,$DE,$60,$05,$D0,$0B,$DE,$00,$03,$20,$1B,$F8,$A9,$45,$20  ; $AFC4
    .byte $35,$F8,$60  ; $AFD4
    LDA $0300,X                  ; $AFD7  BD 00 03
    AND #$0F                     ; $AFDA  29 0F
    BNE loc_1D_B00D              ; $AFDC  D0 2F
    STA $0440,X                  ; $AFDE  9D 40 04
    LDA #$02                     ; $AFE1  A9 02
    STA $0460,X                  ; $AFE3  9D 60 04
    JSR sub_1F_F8B3              ; $AFE6  20 B3 F8
    CMP #$18                     ; $AFE9  C9 18
    BCS loc_1D_B00C              ; $AFEB  B0 1F
    JSR sub_1F_F8C2              ; $AFED  20 C2 F8
    CMP #$18                     ; $AFF0  C9 18
    BCS loc_1D_B00C              ; $AFF2  B0 18
    INC $0300,X                  ; $AFF4  FE 00 03
    LDA #$21                     ; $AFF7  A9 21
    STA $0500,X                  ; $AFF9  9D 00 05
    LDA #$06                     ; $AFFC  A9 06
    STA $0520,X                  ; $AFFE  9D 20 05
    LDA $03C0,X                  ; $B001  BD C0 03
    STA $0540,X                  ; $B004  9D 40 05
    LDA #$10                     ; $B007  A9 10
    STA $0560,X                  ; $B009  9D 60 05

loc_1D_B00C:
    RTS                          ; $B00C  60


loc_1D_B00D:
    LDA $0580,X                  ; $B00D  BD 80 05
    AND #$04                     ; $B010  29 04
    BEQ loc_1D_B026              ; $B012  F0 12
    DEC $0500,X                  ; $B014  DE 00 05
    BNE loc_1D_B00C              ; $B017  D0 F3
    LDA $0580,X                  ; $B019  BD 80 05
    EOR #$04                     ; $B01C  49 04
    STA $0580,X                  ; $B01E  9D 80 05
    LDA #$A3                     ; $B021  A9 A3
    STA $0480,X                  ; $B023  9D 80 04

loc_1D_B026:
    LDA $0300,X                  ; $B026  BD 00 03
    AND #$02                     ; $B029  29 02
    BNE loc_1D_B04C              ; $B02B  D0 1F
    LDA #$00                     ; $B02D  A9 00
    STA $05E0,X                  ; $B02F  9D E0 05
    STA $05A0,X                  ; $B032  9D A0 05
    DEC $03C0,X                  ; $B035  DE C0 03
    DEC $03C0,X                  ; $B038  DE C0 03
    DEC $03C0,X                  ; $B03B  DE C0 03
    DEC $0520,X                  ; $B03E  DE 20 05
    BNE loc_1D_B00C              ; $B041  D0 C9
    INC $0300,X                  ; $B043  FE 00 03
    LDA #$22                     ; $B046  A9 22
    JSR sub_1F_F89A              ; $B048  20 9A F8
    RTS                          ; $B04B  60


loc_1D_B04C:
    LDA #$01                     ; $B04C  A9 01
    STA $05A0,X                  ; $B04E  9D A0 05
    LDA #$00                     ; $B051  A9 00
    STA $05E0,X                  ; $B053  9D E0 05
    JSR sub_1F_F759              ; $B056  20 59 F7
    DEC $0560,X                  ; $B059  DE 60 05
    BNE loc_1D_B00C              ; $B05C  D0 AE
    LDA #$00                     ; $B05E  A9 00
    STA $05E0,X                  ; $B060  9D E0 05
    STA $05A0,X                  ; $B063  9D A0 05
    LDA $0540,X                  ; $B066  BD 40 05
    STA $03C0,X                  ; $B069  9D C0 03
    LDA $0580,X                  ; $B06C  BD 80 05
    ORA #$94                     ; $B06F  09 94
    STA $0580,X                  ; $B071  9D 80 05
    LDA #$80                     ; $B074  A9 80
    STA $0300,X                  ; $B076  9D 00 03
    LDA #$83                     ; $B079  A9 83
    STA $0480,X                  ; $B07B  9D 80 04
    RTS                          ; $B07E  60

    LDA $0300,X                  ; $B07F  BD 00 03
    AND #$0F                     ; $B082  29 0F
    BNE loc_1D_B096              ; $B084  D0 10
    JSR sub_1F_F883              ; $B086  20 83 F8
    INC $0300,X                  ; $B089  FE 00 03
    LDA #$36                     ; $B08C  A9 36
    STA $0500,X                  ; $B08E  9D 00 05
    LDA #$10                     ; $B091  A9 10
    STA $0520,X                  ; $B093  9D 20 05

loc_1D_B096:
    LDA $0300,X                  ; $B096  BD 00 03
    AND #$02                     ; $B099  29 02
    BNE loc_1D_B0CB              ; $B09B  D0 2E
    LDA $05C0,X                  ; $B09D  BD C0 05
    CMP #$D6                     ; $B0A0  C9 D6
    BEQ loc_1D_B0B5              ; $B0A2  F0 11
    LDA $0540,X                  ; $B0A4  BD 40 05
    CMP #$03                     ; $B0A7  C9 03
    BCS loc_1D_B0ED              ; $B0A9  B0 42
    DEC $0500,X                  ; $B0AB  DE 00 05
    BNE loc_1D_B0E0              ; $B0AE  D0 30
    LDA #$D6                     ; $B0B0  A9 D6
    JSR sub_1F_F835              ; $B0B2  20 35 F8

loc_1D_B0B5:
    LDA #$00                     ; $B0B5  A9 00
    STA $05A0,X                  ; $B0B7  9D A0 05
    STA $05E0,X                  ; $B0BA  9D E0 05
    JSR sub_1D_B11C              ; $B0BD  20 1C B1
    INC $0540,X                  ; $B0C0  FE 40 05
    LDA #$36                     ; $B0C3  A9 36
    STA $0500,X                  ; $B0C5  9D 00 05
    INC $0300,X                  ; $B0C8  FE 00 03

loc_1D_B0CB:
    LDA #$00                     ; $B0CB  A9 00
    STA $05A0,X                  ; $B0CD  9D A0 05
    STA $05E0,X                  ; $B0D0  9D E0 05
    DEC $0520,X                  ; $B0D3  DE 20 05
    BNE loc_1D_B0EC              ; $B0D6  D0 14
    LDA #$10                     ; $B0D8  A9 10
    STA $0520,X                  ; $B0DA  9D 20 05
    DEC $0300,X                  ; $B0DD  DE 00 03

loc_1D_B0E0:
    LDA $05C0,X                  ; $B0E0  BD C0 05
    CMP #$C6                     ; $B0E3  C9 C6
    BEQ loc_1D_B0EC              ; $B0E5  F0 05
    LDA #$C6                     ; $B0E7  A9 C6
    JSR sub_1F_F835              ; $B0E9  20 35 F8

loc_1D_B0EC:
    RTS                          ; $B0EC  60


loc_1D_B0ED:
    LDA #$00                     ; $B0ED  A9 00
    STA $00                      ; $B0EF  85 00
    LDA #$E2                     ; $B0F1  A9 E2
    STA $01                      ; $B0F3  85 01
    LDY #$1F                     ; $B0F5  A0 1F

loc_1D_B0F7:
    LDA $0300,Y                  ; $B0F7  B9 00 03
    BMI loc_1D_B110              ; $B0FA  30 14

loc_1D_B0FC:
    DEY                          ; $B0FC  88
    CPY #$0F                     ; $B0FD  C0 0F
    BNE loc_1D_B0F7              ; $B0FF  D0 F6
    LDA $00                      ; $B101  A5 00
    CMP #$03                     ; $B103  C9 03
    BEQ loc_1D_B10A              ; $B105  F0 03
    DEC $0540,X                  ; $B107  DE 40 05

loc_1D_B10A:
    LDA #$38                     ; $B10A  A9 38
    STA $0500,X                  ; $B10C  9D 00 05
    RTS                          ; $B10F  60


loc_1D_B110:
    LDA $01                      ; $B110  A5 01
    CMP $05C0,Y                  ; $B112  D9 C0 05
    BNE loc_1D_B0FC              ; $B115  D0 E5
    INC $00                      ; $B117  E6 00
    JMP loc_1D_B0FC              ; $B119  4C FC B0


sub_1D_B11C:
    JSR sub_1F_FC53              ; $B11C  20 53 FC
    BCS loc_1D_B155              ; $B11F  B0 34
    LDA $04A0,X                  ; $B121  BD A0 04
    STA $04A0,Y                  ; $B124  99 A0 04
    LDA $0360,X                  ; $B127  BD 60 03
    STA $0360,Y                  ; $B12A  99 60 03
    LDA $0380,X                  ; $B12D  BD 80 03
    STA $0380,Y                  ; $B130  99 80 03
    LDA $03C0,X                  ; $B133  BD C0 03
    CLC                          ; $B136  18
    ADC #$04                     ; $B137  69 04
    STA $03C0,Y                  ; $B139  99 C0 03
    LDA #$E2                     ; $B13C  A9 E2
    JSR sub_1F_F846              ; $B13E  20 46 F8
    LDA #$98                     ; $B141  A9 98
    STA $0580,Y                  ; $B143  99 80 05
    LDA #$C0                     ; $B146  A9 C0
    STA $0480,Y                  ; $B148  99 80 04
    LDA #$42                     ; $B14B  A9 42
    STA $0320,Y                  ; $B14D  99 20 03
    LDA #$01                     ; $B150  A9 01
    STA $04E0,Y                  ; $B152  99 E0 04

loc_1D_B155:
    RTS                          ; $B155  60

    LDA $0300,X                  ; $B156  BD 00 03
    AND #$0F                     ; $B159  29 0F
    BNE loc_1D_B173              ; $B15B  D0 16
    STA $0520,X                  ; $B15D  9D 20 05
    STA $0400,X                  ; $B160  9D 00 04
    LDA #$02                     ; $B163  A9 02
    STA $0420,X                  ; $B165  9D 20 04
    INC $0300,X                  ; $B168  FE 00 03
    LDA #$F0                     ; $B16B  A9 F0
    STA $0500,X                  ; $B16D  9D 00 05
    JSR sub_1F_F81B              ; $B170  20 1B F8

loc_1D_B173:
    LDY #$08                     ; $B173  A0 08
    JSR sub_1F_F67C              ; $B175  20 7C F6
    BCC loc_1D_B198              ; $B178  90 1E
    LDA $04A0,X                  ; $B17A  BD A0 04
    AND #$01                     ; $B17D  29 01
    BEQ loc_1D_B189              ; $B17F  F0 08
    LDY #$08                     ; $B181  A0 08
    JSR sub_1F_F580              ; $B183  20 80 F5
    JMP loc_1D_B18E              ; $B186  4C 8E B1


loc_1D_B189:
    LDY #$09                     ; $B189  A0 09
    JSR sub_1F_F5C4              ; $B18B  20 C4 F5

loc_1D_B18E:
    BCC loc_1D_B198              ; $B18E  90 08
    LDA $04A0,X                  ; $B190  BD A0 04
    EOR #$03                     ; $B193  49 03
    STA $04A0,X                  ; $B195  9D A0 04

loc_1D_B198:
    DEC $0500,X                  ; $B198  DE 00 05
    BNE loc_1D_B1A8              ; $B19B  D0 0B
    LDA #$71                     ; $B19D  A9 71
    JSR sub_1F_F835              ; $B19F  20 35 F8
    LDA #$00                     ; $B1A2  A9 00
    STA $0320,X                  ; $B1A4  9D 20 03

loc_1D_B1A7:
    RTS                          ; $B1A7  60


loc_1D_B1A8:
    LDA $0520,X                  ; $B1A8  BD 20 05
    BNE loc_1D_B1A7              ; $B1AB  D0 FA
    LDA $0500,X                  ; $B1AD  BD 00 05
    CMP #$B4                     ; $B1B0  C9 B4
    BNE loc_1D_B1A7              ; $B1B2  D0 F3
    LDA #$F0                     ; $B1B4  A9 F0
    STA $0500,X                  ; $B1B6  9D 00 05
    INC $0520,X                  ; $B1B9  FE 20 05
    RTS                          ; $B1BC  60

    LDA $0300,X                  ; $B1BD  BD 00 03
    AND #$0F                     ; $B1C0  29 0F
    BNE loc_1D_B1F8              ; $B1C2  D0 34
    LDA $04A0,X                  ; $B1C4  BD A0 04
    AND #$01                     ; $B1C7  29 01
    BEQ loc_1D_B1D3              ; $B1C9  F0 08
    LDY #$18                     ; $B1CB  A0 18
    JSR sub_1F_F580              ; $B1CD  20 80 F5
    JMP loc_1D_B1D8              ; $B1D0  4C D8 B1


loc_1D_B1D3:
    LDY #$19                     ; $B1D3  A0 19
    JSR sub_1F_F5C4              ; $B1D5  20 C4 F5

loc_1D_B1D8:
    LDY #$18                     ; $B1D8  A0 18
    JSR sub_1F_F67C              ; $B1DA  20 7C F6
    BCC loc_1D_B1EE              ; $B1DD  90 0F
    JSR sub_1D_B224              ; $B1DF  20 24 B2
    INC $0300,X                  ; $B1E2  FE 00 03
    LDA #$CB                     ; $B1E5  A9 CB
    STA $0480,X                  ; $B1E7  9D 80 04
    LDA #$2B                     ; $B1EA  A9 2B
    BNE loc_1D_B1F5              ; $B1EC  D0 07

loc_1D_B1EE:
    LDA #$C3                     ; $B1EE  A9 C3
    STA $0480,X                  ; $B1F0  9D 80 04
    LDA #$2A                     ; $B1F3  A9 2A

loc_1D_B1F5:
    JMP sub_1F_F835              ; $B1F5  4C 35 F8


loc_1D_B1F8:
    LDA $05C0,X                  ; $B1F8  BD C0 05
    CMP #$2B                     ; $B1FB  C9 2B
    BNE loc_1D_B20A              ; $B1FD  D0 0B
    LDA $05A0,X                  ; $B1FF  BD A0 05
    CMP #$02                     ; $B202  C9 02
    BNE loc_1D_B21F              ; $B204  D0 19
    LDA #$29                     ; $B206  A9 29
    BNE loc_1D_B20C              ; $B208  D0 02

loc_1D_B20A:
    LDA #$29                     ; $B20A  A9 29

loc_1D_B20C:
    JSR sub_1F_F835              ; $B20C  20 35 F8
    LDA $0500,X                  ; $B20F  BD 00 05
    BNE loc_1D_B220              ; $B212  D0 0C
    LDA #$3C                     ; $B214  A9 3C
    STA $0500,X                  ; $B216  9D 00 05
    DEC $0300,X                  ; $B219  DE 00 03
    JSR sub_1F_F869              ; $B21C  20 69 F8

loc_1D_B21F:
    RTS                          ; $B21F  60


loc_1D_B220:
    DEC $0500,X                  ; $B220  DE 00 05
    RTS                          ; $B223  60


sub_1D_B224:
    LDA $E4                      ; $B224  A5 E4
    ADC $E5                      ; $B226  65 E5
    STA $E5                      ; $B228  85 E5
    AND #$01                     ; $B22A  29 01
    TAY                          ; $B22C  A8
    LDA $B23A,Y                  ; $B22D  B9 3A B2
    STA $0440,X                  ; $B230  9D 40 04
    LDA $B23C,Y                  ; $B233  B9 3C B2
    STA $0460,X                  ; $B236  9D 60 04
    RTS                          ; $B239  60

    .byte $52,$A8,$04,$05,$BD,$00,$03,$29,$0F,$D0,$20,$9D,$40,$04,$A9,$01  ; $B23A
    .byte $9D,$60,$04,$FE,$00,$03,$BD,$C0,$03,$C9,$88,$B0,$03,$FE,$20,$05  ; $B24A
    .byte $A9,$10,$9D,$00,$05,$A9,$01,$9D,$A0,$04,$60,$20,$C2,$F8,$C9,$16  ; $B25A
    .byte $B0,$30,$20,$B3,$F8,$C9,$15,$B0,$29,$BD,$A0,$04,$29,$02,$D0,$04  ; $B26A
    .byte $A9,$01,$D0,$02,$A9,$02,$85,$36,$A9,$00,$85,$37,$A9,$01,$85,$38  ; $B27A
    .byte $DE,$00,$05,$D0,$0D,$A9,$10,$9D,$00,$05,$BD,$A0,$04,$49,$03,$9D  ; $B28A
    .byte $A0,$04,$BD,$20,$05,$D0,$0E,$20,$79,$F7,$BD,$E0,$03,$F0,$05,$A9  ; $B29A
    .byte $00,$9D,$E0,$03,$60,$BD,$C0,$03,$48,$DE,$C0,$03,$20,$E2,$FA,$68  ; $B2AA
    .byte $9D,$C0,$03,$B0,$31,$AD,$C0,$03,$38,$FD,$C0,$03,$B0,$14,$AD,$C0  ; $B2BA
    .byte $03,$69,$02,$8D,$C0,$03,$C9,$F0,$90,$08,$69,$0F,$8D,$C0,$03,$EE  ; $B2CA
    .byte $E0,$03,$86,$0F,$A2,$00,$A0,$00,$20,$D6,$E8,$A5,$10,$29,$10,$F0  ; $B2DA
    .byte $03,$20,$13,$EE,$A6,$0F,$20,$59,$F7,$BD,$E0,$03,$F0,$B6,$A9,$00  ; $B2EA
    .byte $9D,$E0,$03,$60,$BD,$00,$05,$F0,$05,$DE,$00,$05,$D0,$3E,$BD,$80  ; $B2FA
    .byte $05,$29,$04,$F0,$10,$20,$C2,$F8,$C9,$61,$B0,$30,$BD,$80,$05,$29  ; $B30A
    .byte $FB,$9D,$80,$05,$60,$BD,$E0,$05,$D0,$27,$BD,$A0,$05,$D0,$0F,$A9  ; $B31A
    .byte $80,$9D,$80,$04,$BD,$80,$05,$09,$04,$9D,$80,$05,$D0,$09,$C9,$02  ; $B32A
    .byte $D0,$10,$A9,$AE,$9D,$80,$04,$A9,$1E,$9D,$00,$05,$A9,$00,$9D,$E0  ; $B33A
    .byte $05,$60,$A9,$A4,$9D,$80,$04,$60,$BD,$00,$03,$29,$0F,$D0,$30,$BD  ; $B34A
    .byte $80,$05,$29,$04,$F0,$12,$20,$C2,$F8,$C9,$61,$B0,$E4,$BD,$80,$05  ; $B35A
    .byte $29,$FB,$9D,$80,$05,$4C,$83,$F8,$20,$97,$F7,$BD,$C0,$03,$C9,$78  ; $B36A
    .byte $90,$CF,$A9,$11,$9D,$00,$05,$A9,$03,$9D,$20,$05,$FE,$00,$03,$BD  ; $B37A
    .byte $C0,$05,$C9,$56,$D0,$0A,$BD,$E0,$05,$D0,$B6,$A9,$55,$20,$35,$F8  ; $B38A
    .byte $DE,$00,$05,$BD,$00,$05,$D0,$08,$A9,$11,$9D,$00,$05,$FE,$20,$05  ; $B39A
    .byte $BD,$20,$05,$29,$03,$9D,$20,$05,$A8,$BD,$A0,$03,$18,$79,$4C,$B4  ; $B3AA
    .byte $9D,$A0,$03,$BD,$C0,$03,$79,$50,$B4,$9D,$C0,$03,$BD,$A0,$04,$29  ; $B3BA
    .byte $02,$F0,$0D,$BD,$40,$05,$D0,$05,$20,$C2,$F8,$B0,$10,$4C,$3B,$F7  ; $B3CA
    .byte $BD,$40,$05,$D0,$05,$20,$C2,$F8,$90,$03,$4C,$1D,$F7,$A9,$26,$20  ; $B3DA
    .byte $9A,$F8,$A9,$56,$20,$35,$F8,$86,$00,$A9,$07,$85,$01,$20,$53,$FC  ; $B3EA
    .byte $B0,$4A,$A6,$01,$BD,$54,$B4,$99,$00,$04,$BD,$5C,$B4,$99,$20,$04  ; $B3FA
    .byte $BD,$64,$B4,$99,$40,$04,$BD,$6C,$B4,$99,$60,$04,$BD,$74,$B4,$99  ; $B40A
    .byte $A0,$04,$A6,$00,$A9,$57,$20,$46,$F8,$A9,$80,$99,$80,$04,$A9,$0F  ; $B41A
    .byte $99,$20,$03,$BD,$60,$03,$99,$60,$03,$BD,$80,$03,$99,$80,$03,$BD  ; $B42A
    .byte $C0,$03,$38,$E9,$0C,$99,$C0,$03,$C6,$01,$10,$B1,$A6,$00,$FE,$40  ; $B43A
    .byte $05,$60,$80,$80,$80,$80,$FF,$00,$00,$FF,$00,$6A,$00,$6A,$00,$6A  ; $B44A
    .byte $00,$6A,$00,$01,$02,$01,$00,$01,$02,$01,$00,$96,$00,$6A,$00,$6A  ; $B45A
    .byte $00,$96,$FE,$FE,$00,$01,$02,$01,$00,$FE,$02,$02,$02,$02,$01,$01  ; $B46A
    .byte $01,$01  ; $B47A
    LDY #$08                     ; $B47C  A0 08
    JSR sub_1F_F67C              ; $B47E  20 7C F6
    LDA $04A0,X                  ; $B481  BD A0 04
    AND #$01                     ; $B484  29 01
    BEQ loc_1D_B490              ; $B486  F0 08
    LDY #$1A                     ; $B488  A0 1A
    JSR sub_1F_F580              ; $B48A  20 80 F5
    JMP loc_1D_B495              ; $B48D  4C 95 B4


loc_1D_B490:
    LDY #$1B                     ; $B490  A0 1B
    JSR sub_1F_F5C4              ; $B492  20 C4 F5

loc_1D_B495:
    BCC loc_1D_B49F              ; $B495  90 08
    LDA $04A0,X                  ; $B497  BD A0 04
    EOR #$03                     ; $B49A  49 03
    STA $04A0,X                  ; $B49C  9D A0 04

loc_1D_B49F:
    LDA $0300,X                  ; $B49F  BD 00 03
    AND #$0F                     ; $B4A2  29 0F
    BNE loc_1D_B4B1              ; $B4A4  D0 0B
    JSR sub_1F_F8C2              ; $B4A6  20 C2 F8
    CMP #$10                     ; $B4A9  C9 10
    BCS loc_1D_B4B0              ; $B4AB  B0 03
    INC $0300,X                  ; $B4AD  FE 00 03

loc_1D_B4B0:
    RTS                          ; $B4B0  60


loc_1D_B4B1:
    JSR sub_1F_F8C2              ; $B4B1  20 C2 F8
    CMP #$30                     ; $B4B4  C9 30
    BCC loc_1D_B4B0              ; $B4B6  90 F8
    LDA $04A0,X                  ; $B4B8  BD A0 04
    EOR #$03                     ; $B4BB  49 03
    STA $04A0,X                  ; $B4BD  9D A0 04
    DEC $0300,X                  ; $B4C0  DE 00 03
    RTS                          ; $B4C3  60

    .byte $A0,$1A,$20,$7C,$F6,$26,$0F,$20,$7B,$FB,$B0,$1C,$A9,$18,$20,$9A  ; $B4C4
    .byte $F8,$A4,$10,$A9,$00,$99,$00,$03,$A9,$71,$20,$35,$F8,$A9,$00,$9D  ; $B4D4
    .byte $00,$05,$A9,$39,$9D,$20,$03,$60,$BD,$A0,$04,$29,$01,$F0,$08,$A0  ; $B4E4
    .byte $1C,$20,$80,$F5,$4C,$00,$B5,$A0,$1D,$20,$C4,$F5,$A5,$0F,$29,$01  ; $B4F4
    .byte $F0,$39,$A5,$10,$29,$10,$F0,$22,$A9,$52,$20,$35,$F8,$FE,$00,$05  ; $B504
    .byte $BD,$00,$05,$C9,$04,$F0,$0B,$A9,$29,$9D,$40,$04,$A9,$05,$9D,$60  ; $B514
    .byte $04,$60,$BD,$A0,$04,$49,$03,$9D,$A0,$04,$BD,$C0,$05,$C9,$51,$F0  ; $B524
    .byte $05,$A9,$51,$20,$35,$F8,$A9,$00,$9D,$00,$05,$60,$BD,$80,$05,$30  ; $B534
    .byte $16,$A9,$00,$9D,$00,$03,$85,$95,$85,$72,$A9,$30,$85,$1D,$A9,$F0  ; $B544
    .byte $85,$1E,$A9,$FF,$85,$1C,$60,$09,$08,$9D,$80,$05,$20,$03,$80,$BD  ; $B554
    .byte $E0,$04,$F0,$E2,$BD,$A0,$05,$D0,$0C,$BD,$E0,$05,$C9,$01,$D0,$05  ; $B564
    .byte $A9,$00,$9D,$E0,$05,$BD,$00,$05,$D0,$48,$BD,$A0,$04,$29,$01,$F0  ; $B574
    .byte $06,$20,$1D,$F7,$4C,$8E,$B5,$20,$3B,$F7,$BD,$00,$03,$29,$0F,$D0  ; $B584
    .byte $36,$20,$C2,$F8,$C9,$61,$B0,$2F,$FE,$00,$03,$FE,$A0,$05,$A9,$3C  ; $B594
    .byte $9D,$00,$05,$BD,$20,$03,$29,$01,$F0,$0A,$A9,$40,$9D,$00,$04,$A9  ; $B5A4
    .byte $00,$9D,$20,$04,$A9,$FF,$85,$1C,$A9,$10,$85,$1D,$85,$1E,$A9,$00  ; $B5B4
    .byte $85,$95,$DE,$00,$05,$D0,$00,$60,$BD,$00,$03,$29,$0F,$D0,$2A,$9D  ; $B5C4
    .byte $40,$04,$A9,$03,$9D,$60,$04,$20,$C2,$F8,$C9,$64,$B0,$1A,$A5,$E4  ; $B5D4
    .byte $65,$E5,$85,$E5,$29,$03,$A8,$B9,$E4,$B6,$9D,$40,$05,$FE,$00,$03  ; $B5E4
    .byte $BD,$80,$05,$49,$04,$9D,$80,$05,$60,$BD,$60,$05,$D0,$19,$BD,$40  ; $B5F4
    .byte $05,$F0,$06,$DE,$40,$05,$4C,$59,$F7,$A9,$4D,$20,$35,$F8,$FE,$60  ; $B604
    .byte $05,$A9,$10,$9D,$40,$05,$60,$BD,$A0,$05,$C9,$02,$90,$0A,$A9,$03  ; $B614
    .byte $9D,$A0,$05,$A9,$00,$9D,$E0,$05,$BD,$00,$03,$29,$02,$F0,$03,$4C  ; $B624
    .byte $BC,$B6,$BD,$00,$05,$D0,$59,$BC,$20,$05,$B9,$D6,$B6,$0A,$A8,$B9  ; $B634
    .byte $4A,$8F,$9D,$40,$04,$B9,$4B,$8F,$9D,$60,$04,$B9,$6A,$8F,$9D,$00  ; $B644
    .byte $04,$B9,$6B,$8F,$9D,$20,$04,$BD,$20,$04,$10,$15,$BD,$00,$04,$49  ; $B654
    .byte $FF,$18,$69,$01,$9D,$00,$04,$BD,$20,$04,$49,$FF,$69,$00,$9D,$20  ; $B664
    .byte $04,$FE,$20,$05,$BD,$20,$05,$C9,$07,$D0,$10,$BD,$A0,$04,$49,$03  ; $B674
    .byte $9D,$A0,$04,$FE,$00,$03,$A9,$00,$9D,$20,$05,$A9,$05,$9D,$00,$05  ; $B684
    .byte $DE,$00,$05,$BD,$A0,$03,$18,$7D,$40,$04,$9D,$A0,$03,$BD,$C0,$03  ; $B694
    .byte $7D,$60,$04,$9D,$C0,$03,$BD,$A0,$04,$29,$02,$D0,$07,$20,$1D,$F7  ; $B6A4
    .byte $B0,$05,$90,$03,$20,$3B,$F7,$60,$DE,$40,$05,$D0,$08,$DE,$00,$03  ; $B6B4
    .byte $A9,$10,$9D,$40,$05,$A9,$80,$9D,$40,$04,$A9,$00,$9D,$60,$04,$4C  ; $B6C4
    .byte $59,$F7,$09,$0A,$0B,$0C,$0D,$0E,$0F,$09,$0A,$0B,$0C,$0D,$0E,$0F  ; $B6D4
    .byte $22,$2A,$26,$2E,$A9,$00,$9D,$E0,$05,$BD,$00,$03,$29,$0F,$F0,$5E  ; $B6E4
    .byte $A5,$B0,$C9,$9C,$D0,$57,$BD,$00,$03,$09,$40,$9D,$00,$03,$86,$00  ; $B6F4
    .byte $BD,$20,$03,$29,$07,$A8,$B9,$FB,$B7,$9D,$20,$03,$A9,$CA,$9D,$80  ; $B704
    .byte $04,$A9,$1C,$9D,$E0,$04,$B9,$43,$B8,$9D,$00,$04,$B9,$4B,$B8,$9D  ; $B714
    .byte $20,$04,$20,$1B,$F8,$B9,$1B,$B8,$85,$ED,$20,$3C,$FF,$A9,$C0,$9D  ; $B724
    .byte $00,$03,$98,$0A,$0A,$A8,$A2,$00,$B9,$23,$B8,$9D,$1C,$06,$9D,$3C  ; $B734
    .byte $06,$C8,$E8,$E0,$04,$D0,$F1,$A9,$FF,$85,$18,$A6,$00,$60,$20,$DF  ; $B744
    .byte $B7,$FE,$00,$03,$20,$53,$FC,$A9,$61,$99,$20,$03,$BD,$C0,$03,$99  ; $B754
    .byte $20,$05,$BD,$60,$03,$99,$60,$03,$BD,$80,$03,$99,$80,$03,$A9,$10  ; $B764
    .byte $99,$C0,$03,$A9,$80,$99,$40,$04,$99,$80,$04,$A9,$00,$99,$60,$04  ; $B774
    .byte $86,$00,$BD,$20,$03,$29,$07,$AA,$BD,$F3,$B7,$A6,$00,$20,$46,$F8  ; $B784
    .byte $BD,$20,$03,$29,$07,$A8,$B9,$03,$B8,$85,$ED,$98,$0A,$A8,$A9,$0F  ; $B794
    .byte $8D,$1C,$06,$8D,$1D,$06,$8D,$3C,$06,$8D,$3D,$06,$B9,$0B,$B8,$8D  ; $B7A4
    .byte $1E,$06,$8D,$3E,$06,$B9,$0C,$B8,$8D,$1F,$06,$8D,$3F,$06,$A9,$FF  ; $B7B4
    .byte $85,$18,$4C,$3C,$FF,$20,$59,$F7,$BD,$C0,$03,$DD,$20,$05,$F0,$05  ; $B7C4
    .byte $A9,$80,$85,$B0,$60,$A9,$00,$9D,$00,$03,$60,$A9,$09,$85,$30,$A9  ; $B7D4
    .byte $80,$85,$B0,$85,$5A,$A9,$8E,$85,$B3,$A9,$0C,$20,$98,$F8,$60,$16  ; $B7E4
    .byte $1A,$14,$18,$15,$13,$19,$17,$A0,$B0,$B2,$A1,$A2,$B3,$A3,$B1,$23  ; $B7F4
    .byte $10,$23,$23,$23,$23,$10,$23,$30,$11,$30,$19,$27,$15,$37,$17,$30  ; $B804
    .byte $26,$27,$11,$27,$15,$27,$15,$21,$22,$21,$22,$21,$22,$21,$22,$0F  ; $B814
    .byte $30,$15,$27,$0F,$0F,$30,$19,$0F,$0F,$27,$15,$0F,$0F,$30,$19,$0F  ; $B824
    .byte $0F,$30,$26,$0F,$0F,$2C,$11,$0F,$0F,$27,$15,$0F,$0F,$27,$15,$00  ; $B834
    .byte $00,$00,$B3,$4C,$00,$80,$00,$01,$00,$00,$01,$01,$00,$02,$04,$BD  ; $B844
    .byte $00,$03,$29,$0F,$D0,$06,$FE,$00,$03,$20,$DF,$B7,$BD,$C0,$03,$C9  ; $B854
    .byte $80,$B0,$06,$20,$97,$F7,$4C,$BD,$B8,$BD,$20,$03,$29,$07,$A8,$B9  ; $B864
    .byte $EF,$B8,$A8,$20,$7C,$F6,$90,$41,$BD,$20,$03,$29,$07,$A8,$B9,$E7  ; $B874
    .byte $B8,$DD,$A0,$05,$D0,$38,$A9,$00,$9D,$E0,$05,$A5,$B0,$C9,$9C,$D0  ; $B884
    .byte $31,$A9,$C0,$9D,$00,$03,$A9,$1C,$9D,$E0,$04,$BD,$20,$03,$29,$07  ; $B894
    .byte $A8,$B9,$C7,$B8,$9D,$20,$03,$B9,$CF,$B8,$9D,$00,$04,$B9,$D7,$B8  ; $B8A4
    .byte $9D,$20,$04,$B9,$DF,$B8,$4C,$35,$F8,$A9,$00,$9D,$E0,$05,$A9,$80  ; $B8B4
    .byte $85,$B0,$60,$C0,$C1,$D6,$D0,$C2,$D4,$D2,$C3,$B3,$00,$2D,$00,$00  ; $B8C4
    .byte $4C,$6D,$00,$01,$00,$03,$01,$04,$01,$01,$04,$29,$1F,$33,$2C,$49  ; $B8D4
    .byte $22,$36,$3F,$04,$03,$05,$06,$02,$02,$08,$03,$1E,$1E,$00,$26,$1E  ; $B8E4
    .byte $00,$1E,$1E,$60,$BD,$C0,$03,$48,$DE,$C0,$03,$20,$E2,$FA,$68,$9D  ; $B8F4
    .byte $C0,$03,$B0,$22,$BD,$C0,$05,$29,$01,$A8,$AD,$40,$03,$18,$79,$2B  ; $B904
    .byte $B9,$8D,$40,$03,$AD,$60,$03,$79,$2D,$B9,$8D,$60,$03,$AD,$80,$03  ; $B914
    .byte $79,$2F,$B9,$8D,$80,$03,$60,$80,$80,$00,$FF,$00,$FF,$BD,$00,$03  ; $B924
    .byte $29,$0F,$D0,$2C,$9D,$A0,$05,$9D,$E0,$05,$9D,$20,$05,$20,$B3,$F8  ; $B934
    .byte $C9,$15,$B0,$1B,$A5,$30,$D0,$17,$BD,$C0,$03,$CD,$C0,$03,$90,$0F  ; $B944
    .byte $20,$C2,$F8,$C9,$18,$B0,$08,$A9,$0C,$9D,$00,$05,$FE,$00,$03,$60  ; $B954
    .byte $BD,$20,$05,$D0,$10,$DE,$00,$05,$D0,$F5,$FE,$20,$05,$BD,$80,$05  ; $B964
    .byte $29,$90,$9D,$80,$05,$BD,$00,$03,$29,$02,$D0,$0F,$BD,$A0,$05,$C9  ; $B974
    .byte $04,$D0,$DC,$FE,$00,$03,$A9,$14,$9D,$00,$05,$A9,$04,$9D,$A0,$05  ; $B984
    .byte $A9,$00,$9D,$E0,$05,$DE,$00,$05,$D0,$C5,$BD,$80,$05,$49,$01,$9D  ; $B994
    .byte $80,$05,$A9,$80,$9D,$00,$03,$60,$A0,$01,$B9,$00,$03,$10,$2C,$B9  ; $B9A4
    .byte $C0,$05,$C9,$AC,$F0,$04,$C9,$AF,$D0,$21,$20,$7B,$FB,$B0,$1C,$A9  ; $B9B4
    .byte $18,$20,$9A,$F8,$A4,$10,$A9,$00,$99,$00,$03,$A9,$71,$20,$35,$F8  ; $B9C4
    .byte $A9,$00,$9D,$00,$05,$A9,$19,$9D,$20,$03,$60,$C8,$C0,$03,$90,$CA  ; $B9D4
    .byte $60,$BD,$00,$03,$29,$0F,$D0,$1F,$9D,$40,$04,$A9,$01,$9D,$60,$04  ; $B9E4
    .byte $BD,$C0,$03,$9D,$60,$05,$20,$B3,$F8,$C9,$15,$B0,$40,$20,$C2,$F8  ; $B9F4
    .byte $C9,$0A,$B0,$39,$FE,$00,$03,$BD,$00,$05,$D0,$32,$20,$79,$F7,$BD  ; $BA04
    .byte $40,$04,$18,$69,$10,$9D,$40,$04,$BD,$60,$04,$69,$00,$9D,$60,$04  ; $BA14
    .byte $C9,$03,$D0,$05,$A9,$00,$9D,$40,$04,$BD,$C0,$03,$C9,$3A,$B0,$0D  ; $BA24
    .byte $FE,$00,$05,$A9,$00,$9D,$40,$04,$A9,$01,$9D,$60,$04,$60,$BD,$00  ; $BA34
    .byte $03,$29,$02,$D0,$0E,$20,$AF,$B2,$BD,$C0,$03,$DD,$60,$05,$90,$ED  ; $BA44
    .byte $FE,$00,$03,$20,$B3,$F8,$C9,$16,$B0,$E3,$20,$C2,$F8,$C9,$09,$B0  ; $BA54
    .byte $DC,$DE,$00,$03,$DE,$00,$05,$60,$BD,$00,$03,$29,$0F,$D0,$19,$FE  ; $BA64
    .byte $00,$03,$A5,$E4,$65,$E6,$85,$E4,$29,$03,$A8,$B9,$51,$BB,$9D,$20  ; $BA74
    .byte $05,$A9,$78,$9D,$00,$05,$D0,$75,$BD,$00,$05,$D0,$6D,$BD,$A0,$05  ; $BA84
    .byte $09,$01,$9D,$A0,$05,$BD,$40,$05,$D0,$5A,$20,$53,$FC,$A9,$BA,$20  ; $BA94
    .byte $46,$F8,$BD,$60,$03,$99,$60,$03,$BD,$80,$03,$99,$80,$03,$BD,$C0  ; $BAA4
    .byte $03,$99,$C0,$03,$A9,$80,$99,$80,$04,$A9,$8F,$99,$20,$03,$A9,$00  ; $BAB4
    .byte $99,$00,$04,$85,$02,$A9,$04,$99,$20,$04,$85,$03,$84,$0F,$86,$0E  ; $BAC4
    .byte $A6,$0F,$20,$63,$FC,$A4,$0F,$A6,$0E,$A5,$0C,$99,$A0,$04,$DE,$20  ; $BAD4
    .byte $05,$F0,$07,$A9,$12,$9D,$40,$05,$D0,$13,$A9,$00,$9D,$A0,$05,$DE  ; $BAE4
    .byte $00,$03,$D0,$09,$DE,$40,$05,$4C,$01,$BB,$DE,$00,$05,$BD,$C0,$05  ; $BAF4
    .byte $48,$20,$03,$80,$68,$9D,$C0,$05,$BD,$E0,$04,$D0,$1D,$9D,$00,$03  ; $BB04
    .byte $A0,$0F,$B9,$10,$03,$10,$0C,$B9,$D0,$03,$C9,$80,$B0,$05,$A9,$00  ; $BB14
    .byte $99,$10,$03,$88,$10,$EC,$A9,$80,$85,$55,$A9,$00,$9D,$E0,$05,$60  ; $BB24
    LDA $04A0,X                  ; $BB34  BD A0 04
    AND #$01                     ; $BB37  29 01
    BEQ loc_1D_BB41              ; $BB39  F0 06
    JSR sub_1F_F71D              ; $BB3B  20 1D F7
    JMP loc_1D_BB44              ; $BB3E  4C 44 BB


loc_1D_BB41:
    JSR sub_1F_F73B              ; $BB41  20 3B F7

loc_1D_BB44:
    LDA $04A0,X                  ; $BB44  BD A0 04
    AND #$08                     ; $BB47  29 08
    BEQ loc_1D_BB4E              ; $BB49  F0 03
    JMP sub_1F_F779              ; $BB4B  4C 79 F7


loc_1D_BB4E:
    JMP sub_1F_F759              ; $BB4E  4C 59 F7

    .byte $03,$03,$04,$02,$BD,$C0,$05,$F0,$61,$20,$97,$F7,$A0,$00,$84,$54  ; $BB51
    .byte $BD,$80,$03,$C9,$0B,$F0,$01,$C8,$B9,$BC,$BB,$DD,$C0,$03,$B0,$45  ; $BB61
    .byte $9D,$C0,$03,$BD,$E0,$05,$C9,$02,$D0,$40,$BD,$A0,$05,$C9,$02,$D0  ; $BB71
    .byte $39,$A9,$20,$8D,$0D,$06,$8D,$2D,$06,$A9,$37,$8D,$0E,$06,$8D,$2E  ; $BB81
    .byte $06,$A9,$17,$8D,$0F,$06,$8D,$2F,$06,$85,$18,$A9,$00,$9D,$C0,$05  ; $BB91
    .byte $A0,$1F,$B9,$00,$03,$10,$08,$B9,$80,$05,$29,$FB,$99,$80,$05,$88  ; $BBA1
    .byte $C0,$0F,$D0,$EE,$60,$A9,$00,$9D,$E0,$05,$60,$48,$78,$BD,$80,$05  ; $BBB1
    .byte $29,$04,$D0,$F6,$BD,$C0,$05,$48,$20,$03,$80,$68,$9D,$C0,$05,$BD  ; $BBC1
    .byte $E0,$04,$D0,$20,$9D,$20,$05,$9D,$80,$04,$A9,$04,$9D,$40,$05,$A9  ; $BBD1
    .byte $63,$9D,$20,$03,$A0,$0F,$A9,$00,$99,$10,$03,$88,$10,$FA,$A9,$80  ; $BBE1
    .byte $9D,$00,$03,$60,$BD,$00,$03,$29,$0F,$D0,$22,$9D,$E0,$05,$A0,$1F  ; $BBF1
    .byte $B9,$00,$03,$10,$0B,$B9,$C0,$05,$C9,$CF,$F0,$10,$C9,$D0,$F0,$0C  ; $BC01
    .byte $88,$C0,$0F,$D0,$EB,$A5,$54,$D0,$03,$FE,$00,$03,$60,$BD,$E0,$05  ; $BC11
    .byte $1D,$A0,$05,$D0,$1E,$FE,$20,$05,$BD,$20,$05,$C9,$02,$D0,$0E,$DE  ; $BC21
    .byte $00,$03,$A9,$00,$9D,$00,$05,$9D,$20,$05,$E6,$54,$60,$A9,$3C,$9D  ; $BC31
    .byte $00,$05,$60,$BD,$00,$05,$F0,$09,$DE,$00,$05,$A9,$00,$9D,$E0,$05  ; $BC41
    .byte $60,$BD,$E0,$05,$D0,$4F,$BD,$A0,$05,$C9,$02,$D0,$48,$20,$53,$FC  ; $BC51
    .byte $B0,$43,$A9,$CF,$20,$46,$F8,$BD,$60,$03,$99,$60,$03,$BD,$80,$03  ; $BC61
    .byte $99,$80,$03,$BD,$C0,$03,$99,$C0,$03,$A9,$C0,$99,$80,$04,$A9,$08  ; $BC71
    .byte $99,$E0,$04,$A9,$8D,$99,$20,$03,$A9,$00,$99,$00,$04,$A9,$01,$99  ; $BC81
    .byte $20,$04,$A9,$00,$99,$40,$04,$A9,$04,$99,$60,$04,$20,$69,$F8,$BD  ; $BC91
    .byte $A0,$04,$99,$A0,$04,$60,$60,$BD,$80,$05,$29,$04,$D0,$F8,$BD,$00  ; $BCA1
    .byte $03,$29,$0F,$D0,$22,$9D,$E0,$05,$A0,$1F,$B9,$00,$03,$10,$0B,$B9  ; $BCB1
    .byte $C0,$05,$C9,$CF,$F0,$10,$C9,$D0,$F0,$0C,$88,$C0,$0F,$D0,$EB,$A5  ; $BCC1
    .byte $54,$F0,$03,$FE,$00,$03,$60,$BD,$E0,$05,$1D,$A0,$05,$D0,$03,$DE  ; $BCD1
    .byte $00,$03,$BD,$A0,$05,$C9,$02,$D0,$ED,$BD,$E0,$05,$D0,$E8,$A9,$02  ; $BCE1
    .byte $85,$10,$20,$69,$F8,$20,$53,$FC,$B0,$5D,$A9,$D0,$20,$46,$F8,$A9  ; $BCF1
    .byte $01,$99,$A0,$05,$99,$E0,$04,$A9,$CB,$99,$80,$04,$A9,$8E,$99,$20  ; $BD01
    .byte $03,$BD,$60,$03,$99,$60,$03,$BD,$80,$03,$99,$80,$03,$BD,$C0,$03  ; $BD11
    .byte $99,$C0,$03,$BD,$A0,$04,$99,$A0,$04,$86,$00,$A6,$10,$BD,$59,$BD  ; $BD21
    .byte $99,$40,$04,$BD,$5C,$BD,$99,$60,$04,$BD,$5F,$BD,$99,$00,$04,$BD  ; $BD31
    .byte $62,$BD,$99,$20,$04,$A9,$1E,$99,$00,$05,$99,$20,$05,$A6,$00,$C6  ; $BD41
    .byte $10,$10,$A2,$A9,$00,$85,$54,$60,$44,$00,$2A,$03,$04,$05,$39,$55  ; $BD51
    .byte $8C,$01,$01,$01,$A0,$08,$20,$7C,$F6,$90,$0A,$A9,$44,$9D,$40,$04  ; $BD61
    .byte $A9,$03,$9D,$60,$04,$BD,$A0,$04,$29,$01,$F0,$08,$A0,$08,$20,$80  ; $BD71
    .byte $F5,$4C,$8A,$BD,$A0,$09,$20,$C4,$F5,$90,$08,$BD,$A0,$04,$49,$03  ; $BD81
    .byte $9D,$A0,$04,$60,$BD,$00,$05,$F0,$13,$DE,$00,$05,$20,$97,$F7,$BD  ; $BD91
    .byte $A0,$04,$29,$01,$F0,$03,$4C,$1D,$F7,$4C,$3B,$F7,$A0,$12,$20,$7C  ; $BDA1
    .byte $F6,$A9,$01,$9D,$A0,$05,$90,$26,$A9,$00,$9D,$A0,$05,$DE,$20,$05  ; $BDB1
    .byte $D0,$30,$A9,$3C,$9D,$20,$05,$A9,$A8,$9D,$40,$04,$A9,$05,$9D,$60  ; $BDC1
    .byte $04,$A9,$F1,$9D,$00,$04,$A9,$00,$9D,$20,$04,$20,$69,$F8,$BD,$A0  ; $BDD1
    .byte $04,$29,$01,$F0,$08,$A0,$1E,$20,$80,$F5,$4C,$F3,$BD,$A0,$1F,$20  ; $BDE1
    .byte $C4,$F5,$A9,$00,$9D,$E0,$05,$60  ; $BDF1
    LDY #$2C                     ; $BDF9  A0 2C
    BNE loc_1D_BDFF              ; $BDFB  D0 02
    LDY #$2D                     ; $BDFD  A0 2D

loc_1D_BDFF:
    JSR sub_1F_F67C              ; $BDFF  20 7C F6
    JSR sub_1F_FAE2              ; $BE02  20 E2 FA
    BCS loc_1D_BE3A              ; $BE05  B0 33
    LDA $0500,X                  ; $BE07  BD 00 05
    BNE loc_1D_BE25              ; $BE0A  D0 19
    LDA $04C0,X                  ; $BE0C  BD C0 04
    PHA                          ; $BE0F  48
    AND #$07                     ; $BE10  29 07
    TAY                          ; $BE12  A8
    LDA $DEC2,Y                  ; $BE13  B9 C2 DE
    STA $00                      ; $BE16  85 00
    PLA                          ; $BE18  68
    LSR A                        ; $BE19  4A
    LSR A                        ; $BE1A  4A
    LSR A                        ; $BE1B  4A
    TAY                          ; $BE1C  A8
    LDA $0150,Y                  ; $BE1D  B9 50 01
    ORA $00                      ; $BE20  05 00
    STA $0150,Y                  ; $BE22  99 50 01

loc_1D_BE25:
    LDA #$00                     ; $BE25  A9 00
    STA $0300,X                  ; $BE27  9D 00 03
    LDY $0320,X                  ; $BE2A  BC 20 03
    LDA $BDE6,Y                  ; $BE2D  B9 E6 BD
    STA $00                      ; $BE30  85 00
    LDA $BDEC,Y                  ; $BE32  B9 EC BD
    STA $01                      ; $BE35  85 01
    JMP ($0000)                  ; $BE37  6C 00 00


loc_1D_BE3A:
    LDA $0500,X                  ; $BE3A  BD 00 05
    BEQ loc_1D_BE49              ; $BE3D  F0 0A
    DEC $0500,X                  ; $BE3F  DE 00 05
    BNE loc_1D_BE49              ; $BE42  D0 05
    LDA #$00                     ; $BE44  A9 00
    STA $0300,X                  ; $BE46  9D 00 03

loc_1D_BE49:
    RTS                          ; $BE49  60

    .byte $56,$5C,$62,$66,$9D,$AB,$BE,$BE,$BE,$BE,$BE,$BE  ; $BE4A
    LDA #$0A                     ; $BE56  A9 0A
    LDY #$00                     ; $BE58  A0 00
    BEQ loc_1D_BE6C              ; $BE5A  F0 10
    LDA #$02                     ; $BE5C  A9 02
    LDY #$00                     ; $BE5E  A0 00
    BEQ loc_1D_BE6C              ; $BE60  F0 0A
    LDA #$0A                     ; $BE62  A9 0A
    BNE loc_1D_BE68              ; $BE64  D0 02
    LDA #$02                     ; $BE66  A9 02

loc_1D_BE68:
    LDY $A0                      ; $BE68  A4 A0
    BEQ loc_1D_BE98              ; $BE6A  F0 2C

loc_1D_BE6C:
    INC $58                      ; $BE6C  E6 58
    STA $0F                      ; $BE6E  85 0F
    STY $0E                      ; $BE70  84 0E

loc_1D_BE72:
    LDY $0E                      ; $BE72  A4 0E
    LDA $00A2,Y                  ; $BE74  B9 A2 00
    CMP #$9C                     ; $BE77  C9 9C
    BEQ loc_1D_BE98              ; $BE79  F0 1D
    LDA $00A2,Y                  ; $BE7B  B9 A2 00
    CLC                          ; $BE7E  18
    ADC #$01                     ; $BE7F  69 01
    STA $00A2,Y                  ; $BE81  99 A2 00
    LDA #$1C                     ; $BE84  A9 1C
    JSR sub_1F_F89A              ; $BE86  20 9A F8
    DEC $0F                      ; $BE89  C6 0F
    BEQ loc_1D_BE98              ; $BE8B  F0 0B

loc_1D_BE8D:
    JSR sub_1F_FD6E              ; $BE8D  20 6E FD
    LDA $95                      ; $BE90  A5 95
    AND #$03                     ; $BE92  29 03
    BNE loc_1D_BE8D              ; $BE94  D0 F7
    BEQ loc_1D_BE72              ; $BE96  F0 DA

loc_1D_BE98:
    LDA #$00                     ; $BE98  A9 00
    STA $58                      ; $BE9A  85 58
    RTS                          ; $BE9C  60

    .byte $A9,$14,$20,$9A,$F8,$A5,$AF,$C9,$09,$F0,$02,$E6,$AF,$60,$A9,$14  ; $BE9D
    .byte $20,$9A,$F8,$A5,$AE,$C9,$99,$F0,$1B,$E6,$AE,$A5,$AE,$29,$0F,$C9  ; $BEAD
    .byte $0A,$D0,$11,$A5,$AE,$29,$F0,$18,$69,$10,$85,$AE,$C9,$A0,$D0,$04  ; $BEBD
    .byte $A9,$99,$85,$AE,$60,$BD,$C0,$05,$C9,$71,$F0,$2A,$20,$7B,$FB,$B0  ; $BECD
    .byte $F3,$BD,$C0,$04,$48,$29,$07,$A8,$B9,$C2,$DE,$85,$00,$68,$4A,$4A  ; $BEDD
    .byte $4A,$A8,$B9,$50,$01,$05,$00,$99,$50,$01,$A4,$10,$A9,$00,$99,$00  ; $BEED
    .byte $03,$A9,$71,$4C,$35,$F8,$BD,$A0,$05,$C9,$04,$D0,$34,$A5,$E5,$65  ; $BEFD
    .byte $E6,$85,$E5,$85,$00,$A9,$64,$85,$01,$20,$EB,$FC,$A0,$05,$A5,$03  ; $BF0D
    .byte $D9,$3F,$BF,$90,$03,$88,$D0,$F8,$B9,$45,$BF,$20,$35,$F8,$B9,$4B  ; $BF1D
    .byte $BF,$9D,$20,$03,$BD,$80,$05,$29,$FC,$9D,$80,$05,$A9,$F0,$9D,$00  ; $BF2D
    .byte $05,$60,$63,$41,$23,$19,$0F,$05,$FB,$F9,$FA,$FC,$FE,$FD,$66,$64  ; $BF3D
    .byte $65,$67,$69,$68  ; $BF4D
    LDA $05A0,X                  ; $BF51  BD A0 05
    CMP #$04                     ; $BF54  C9 04
    BNE loc_1D_BF96              ; $BF56  D0 3E
    LDA $5A                      ; $BF58  A5 5A
    BMI loc_1D_BF77              ; $BF5A  30 1B
    LDA $E6                      ; $BF5C  A5 E6
    ADC $E7                      ; $BF5E  65 E7
    STA $E7                      ; $BF60  85 E7
    STA $00                      ; $BF62  85 00
    LDA #$64                     ; $BF64  A9 64
    STA $01                      ; $BF66  85 01
    JSR sub_1F_FCEB              ; $BF68  20 EB FC
    LDY #$04                     ; $BF6B  A0 04
    LDA $03                      ; $BF6D  A5 03

loc_1D_BF6F:
    CMP $BF97,Y                  ; $BF6F  D9 97 BF
    BCC loc_1D_BF7D              ; $BF72  90 09
    DEY                          ; $BF74  88
    BPL loc_1D_BF6F              ; $BF75  10 F8

loc_1D_BF77:
    LDA #$00                     ; $BF77  A9 00
    STA $0300,X                  ; $BF79  9D 00 03
    RTS                          ; $BF7C  60


loc_1D_BF7D:
    LDA $BF9C,Y                  ; $BF7D  B9 9C BF
    JSR sub_1F_F835              ; $BF80  20 35 F8
    LDA $BFA1,Y                  ; $BF83  B9 A1 BF
    STA $0320,X                  ; $BF86  9D 20 03
    LDA #$F0                     ; $BF89  A9 F0
    STA $0500,X                  ; $BF8B  9D 00 05
    LDA #$00                     ; $BF8E  A9 00
    STA $0440,X                  ; $BF90  9D 40 04
    STA $0460,X                  ; $BF93  9D 60 04

loc_1D_BF96:
    RTS                          ; $BF96  60

    .byte $1D,$1B,$0C,$0A,$01,$FB,$FC,$F9,$FA,$FE,$66,$67,$64,$65,$69,$ED  ; $BF97
    .byte $40,$40,$01,$C6,$15,$ED,$00,$A6,$41,$97,$11,$59,$54,$93,$44,$CD  ; $BFA7
    .byte $84,$66,$04,$08,$41,$75,$51,$9B,$15,$0B,$01,$88,$40,$C0,$01,$18  ; $BFB7
    .byte $00,$57,$80,$88,$40,$02,$00,$02,$10,$0E,$01,$C7,$10,$30,$00,$EF  ; $BFC7
    .byte $00,$0F,$50,$AB,$15,$C0,$05,$07,$55,$6F,$10,$97,$44,$08,$40,$2B  ; $BFD7
    .byte $01,$23,$00,$92,$71,$ED,$15,$67,$54,$7A,$54,$A1,$00,$AD,$01,$3A  ; $BFE7
    .byte $00,$DE,$04,$82,$51,$90,$00,$16,$05  ; $BFF7
