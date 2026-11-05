; PRG 8 KB bank $1D at $A000
.segment "BANK1D"
.org $A000

    LDA $14                      ; $A000  A5 14
    AND #$40                     ; $A002  29 40
    BNE loc_1D_A00D              ; $A004  D0 07
    JSR sub_1F_EC94              ; $A006  20 94 EC
    CMP #$50                     ; $A009  C9 50
    BCS loc_1D_A032              ; $A00B  B0 25

loc_1D_A00D:
    LDA #$6D                     ; $A00D  A9 6D
    JSR sub_1F_EA98              ; $A00F  20 98 EA
    LDA #$1C                     ; $A012  A9 1C
    STA $0588,X                  ; $A014  9D 88 05
    LDA #$A0                     ; $A017  A9 A0
    STA $05A0,X                  ; $A019  9D A0 05
    LDA $0540,X                  ; $A01C  BD 40 05
    BEQ loc_1D_A033              ; $A01F  F0 12
    LDA $0570,X                  ; $A021  BD 70 05
    CMP #$08                     ; $A024  C9 08
    BNE loc_1D_A032              ; $A026  D0 0A
    LDA #$6F                     ; $A028  A9 6F
    STA $03D8,X                  ; $A02A  9D D8 03
    LDA #$09                     ; $A02D  A9 09
    STA $03F0,X                  ; $A02F  9D F0 03

loc_1D_A032:
    RTS                          ; $A032  60


loc_1D_A033:
    LDA #$00                     ; $A033  A9 00
    STA $0570,X                  ; $A035  9D 70 05
    LDY #$21                     ; $A038  A0 21
    JSR sub_1F_E7B7              ; $A03A  20 B7 E7
    BCC loc_1D_A045              ; $A03D  90 06
    LDA #$01                     ; $A03F  A9 01
    STA $0540,X                  ; $A041  9D 40 05
    RTS                          ; $A044  60


loc_1D_A045:
    LDA $0468,X                  ; $A045  BD 68 04
    BEQ loc_1D_A04F              ; $A048  F0 05
    DEC $0468,X                  ; $A04A  DE 68 04
    BNE loc_1D_A088              ; $A04D  D0 39

loc_1D_A04F:
    LDY $0480,X                  ; $A04F  BC 80 04
    LDA $0300,Y                  ; $A052  B9 00 03
    CMP #$3C                     ; $A055  C9 3C
    BEQ loc_1D_A088              ; $A057  F0 2F
    LDA #$B4                     ; $A059  A9 B4
    STA $0468,X                  ; $A05B  9D 68 04
    JSR sub_1F_EC16              ; $A05E  20 16 EC
    JSR sub_1F_EC30              ; $A061  20 30 EC
    JSR sub_1D_A089              ; $A064  20 89 A0

loc_1D_A067:
    JSR sub_1F_F16F              ; $A067  20 6F F1
    BCS loc_1D_A088              ; $A06A  B0 1C
    LDA #$87                     ; $A06C  A9 87
    STA $0408,Y                  ; $A06E  99 08 04
    TYA                          ; $A071  98
    STA $0480,X                  ; $A072  9D 80 04
    LDA #$6E                     ; $A075  A9 6E
    JSR sub_1F_EAA4              ; $A077  20 A4 EA
    JSR sub_1D_A09D              ; $A07A  20 9D A0
    LDA #$08                     ; $A07D  A9 08
    JSR sub_1F_F470              ; $A07F  20 70 F4
    LDX $0D                      ; $A082  A6 0D
    DEC $0E                      ; $A084  C6 0E
    BPL loc_1D_A067              ; $A086  10 DF

loc_1D_A088:
    RTS                          ; $A088  60


sub_1D_A089:
    JSR sub_1F_ECC2              ; $A089  20 C2 EC
    STA $0F                      ; $A08C  85 0F
    DEC $0F                      ; $A08E  C6 0F
    LDA $0F                      ; $A090  A5 0F
    AND #$0F                     ; $A092  29 0F
    STA $0F                      ; $A094  85 0F
    LDA #$01                     ; $A096  A9 01
    STA $0E                      ; $A098  85 0E
    STX $0D                      ; $A09A  86 0D
    RTS                          ; $A09C  60


sub_1D_A09D:
    LDA $0300,X                  ; $A09D  BD 00 03
    CLC                          ; $A0A0  18
    ADC #$01                     ; $A0A1  69 01
    STA $0300,Y                  ; $A0A3  99 00 03
    TYA                          ; $A0A6  98
    TAX                          ; $A0A7  AA
    LDA $0E                      ; $A0A8  A5 0E
    ASL A                        ; $A0AA  0A
    CLC                          ; $A0AB  18
    ADC $0F                      ; $A0AC  65 0F
    AND #$0F                     ; $A0AE  29 0F
    TAY                          ; $A0B0  A8

loc_1D_A0B1:
    RTS                          ; $A0B1  60

    .byte $20,$68,$E9,$4C,$65,$EA  ; $A0B2
    JSR sub_1F_EC16              ; $A0B8  20 16 EC
    JSR sub_1F_EC30              ; $A0BB  20 30 EC
    LDA $0468,X                  ; $A0BE  BD 68 04
    BEQ loc_1D_A0CD              ; $A0C1  F0 0A
    LDA #$00                     ; $A0C3  A9 00
    STA $0570,X                  ; $A0C5  9D 70 05
    DEC $0468,X                  ; $A0C8  DE 68 04
    BNE loc_1D_A0B1              ; $A0CB  D0 E4

loc_1D_A0CD:
    STA $0570,X                  ; $A0CD  9D 70 05
    JSR sub_1F_EC94              ; $A0D0  20 94 EC
    CMP #$50                     ; $A0D3  C9 50
    BCS loc_1D_A0B1              ; $A0D5  B0 DA
    JSR sub_1F_EC76              ; $A0D7  20 76 EC
    CMP #$14                     ; $A0DA  C9 14
    BCS loc_1D_A0B1              ; $A0DC  B0 D3
    LDA #$01                     ; $A0DE  A9 01
    STA $0540,X                  ; $A0E0  9D 40 05
    LDA $0378,X                  ; $A0E3  BD 78 03
    SEC                          ; $A0E6  38
    SBC #$03                     ; $A0E7  E9 03
    STA $0378,X                  ; $A0E9  9D 78 03
    LDA #$C1                     ; $A0EC  A9 C1
    STA $0408,X                  ; $A0EE  9D 08 04
    LDA #$FB                     ; $A0F1  A9 FB
    STA $0588,X                  ; $A0F3  9D 88 05
    LDA #$A0                     ; $A0F6  A9 A0
    STA $05A0,X                  ; $A0F8  9D A0 05
    JSR sub_1F_EFF8              ; $A0FB  20 F8 EF
    BCS loc_1D_A13D              ; $A0FE  B0 3D
    JSR sub_1F_F2F3              ; $A100  20 F3 F2
    JSR sub_1D_A54D              ; $A103  20 4D A5
    LDA #$02                     ; $A106  A9 02
    STA $0E                      ; $A108  85 0E

loc_1D_A10A:
    JSR sub_1F_F16F              ; $A10A  20 6F F1
    BCS loc_1D_A16C              ; $A10D  B0 5D
    LDA #$C4                     ; $A10F  A9 C4
    STA $0300,Y                  ; $A111  99 00 03
    LDA #$C6                     ; $A114  A9 C6
    STA $0408,Y                  ; $A116  99 08 04
    LDA #$01                     ; $A119  A9 01
    STA $0450,Y                  ; $A11B  99 50 04
    LDA #$73                     ; $A11E  A9 73
    JSR sub_1F_EAA4              ; $A120  20 A4 EA
    LDA #$F0                     ; $A123  A9 F0
    STA $0468,Y                  ; $A125  99 68 04
    LDA $0E                      ; $A128  A5 0E
    STA $0420,Y                  ; $A12A  99 20 04
    JSR sub_1F_EA34              ; $A12D  20 34 EA
    LDA #$00                     ; $A130  A9 00
    STA $03A8,Y                  ; $A132  99 A8 03
    STA $03C0,Y                  ; $A135  99 C0 03
    DEC $0E                      ; $A138  C6 0E
    BPL loc_1D_A10A              ; $A13A  10 CE
    RTS                          ; $A13C  60


loc_1D_A13D:
    LDA $0570,X                  ; $A13D  BD 70 05
    CMP #$04                     ; $A140  C9 04
    BNE loc_1D_A1A3              ; $A142  D0 5F
    LDA $0540,X                  ; $A144  BD 40 05
    CMP #$03                     ; $A147  C9 03
    BEQ loc_1D_A16D              ; $A149  F0 22
    CMP #$08                     ; $A14B  C9 08
    BNE loc_1D_A1A3              ; $A14D  D0 54
    LDA $0378,X                  ; $A14F  BD 78 03
    CLC                          ; $A152  18
    ADC #$03                     ; $A153  69 03
    STA $0378,X                  ; $A155  9D 78 03
    LDA #$81                     ; $A158  A9 81
    STA $0408,X                  ; $A15A  9D 08 04
    LDA #$3C                     ; $A15D  A9 3C
    STA $0468,X                  ; $A15F  9D 68 04
    LDA #$B8                     ; $A162  A9 B8
    STA $0588,X                  ; $A164  9D 88 05
    LDA #$A0                     ; $A167  A9 A0
    STA $05A0,X                  ; $A169  9D A0 05

loc_1D_A16C:
    RTS                          ; $A16C  60


loc_1D_A16D:
    STX $0F                      ; $A16D  86 0F
    LDA #$02                     ; $A16F  A9 02
    STA $0E                      ; $A171  85 0E
    LDA $0420,X                  ; $A173  BD 20 04
    AND #$02                     ; $A176  29 02
    ASL A                        ; $A178  0A
    ASL A                        ; $A179  0A
    STA $0D                      ; $A17A  85 0D

loc_1D_A17C:
    JSR sub_1F_F16F              ; $A17C  20 6F F1
    BCS loc_1D_A1A3              ; $A17F  B0 22
    LDA #$86                     ; $A181  A9 86
    STA $0408,Y                  ; $A183  99 08 04
    LDA #$51                     ; $A186  A9 51
    STA $0300,Y                  ; $A188  99 00 03
    LDA #$85                     ; $A18B  A9 85
    JSR sub_1F_EAA4              ; $A18D  20 A4 EA
    TYA                          ; $A190  98
    TAX                          ; $A191  AA
    INC $0D                      ; $A192  E6 0D
    INC $0D                      ; $A194  E6 0D
    LDY $0D                      ; $A196  A4 0D
    LDA #$18                     ; $A198  A9 18
    JSR sub_1F_F470              ; $A19A  20 70 F4
    LDX $0F                      ; $A19D  A6 0F
    DEC $0E                      ; $A19F  C6 0E
    BPL loc_1D_A17C              ; $A1A1  10 D9

loc_1D_A1A3:
    RTS                          ; $A1A3  60

    DEC $0468,X                  ; $A1A4  DE 68 04
    BNE loc_1D_A1AC              ; $A1A7  D0 03
    JMP sub_1D_A54D              ; $A1A9  4C 4D A5


loc_1D_A1AC:
    LDY #$13                     ; $A1AC  A0 13
    JSR sub_1F_E7B7              ; $A1AE  20 B7 E7
    BCS loc_1D_A1C4              ; $A1B1  B0 11
    LDA $0420,X                  ; $A1B3  BD 20 04
    AND #$03                     ; $A1B6  29 03
    BEQ loc_1D_A1A3              ; $A1B8  F0 E9
    LDY #$1A                     ; $A1BA  A0 1A
    JSR sub_1F_EA3F              ; $A1BC  20 3F EA
    BCC loc_1D_A1A3              ; $A1BF  90 E2
    JMP sub_1F_EC4A              ; $A1C1  4C 4A EC


loc_1D_A1C4:
    LDA $E6                      ; $A1C4  A5 E6
    ADC $E7                      ; $A1C6  65 E7
    STA $E6                      ; $A1C8  85 E6
    AND #$01                     ; $A1CA  29 01
    TAY                          ; $A1CC  A8
    LDA $A1E4,Y                  ; $A1CD  B9 E4 A1
    STA $03A8,X                  ; $A1D0  9D A8 03
    LDA $A1E0,Y                  ; $A1D3  B9 E0 A1
    STA $03D8,X                  ; $A1D6  9D D8 03
    LDA $A1E2,Y                  ; $A1D9  B9 E2 A1
    STA $03F0,X                  ; $A1DC  9D F0 03
    RTS                          ; $A1DF  60

    .byte $D4,$77,$02,$03,$58,$48  ; $A1E0
    LDA $03A8,X                  ; $A1E6  BD A8 03
    STA $03D8,X                  ; $A1E9  9D D8 03
    LDA $03C0,X                  ; $A1EC  BD C0 03
    STA $03F0,X                  ; $A1EF  9D F0 03
    LDY #$01                     ; $A1F2  A0 01
    LDA $0528,X                  ; $A1F4  BD 28 05
    STA $0468,X                  ; $A1F7  9D 68 04
    AND #$20                     ; $A1FA  29 20
    BNE loc_1D_A1FF              ; $A1FC  D0 01
    INY                          ; $A1FE  C8

loc_1D_A1FF:
    TYA                          ; $A1FF  98
    ORA #$04                     ; $A200  09 04
    STA $0420,X                  ; $A202  9D 20 04
    LDA #$0F                     ; $A205  A9 0F
    STA $0588,X                  ; $A207  9D 88 05
    LDA #$A2                     ; $A20A  A9 A2
    STA $05A0,X                  ; $A20C  9D A0 05
    LDY #$07                     ; $A20F  A0 07
    INC $03F0,X                  ; $A211  FE F0 03
    JSR sub_1F_E747              ; $A214  20 47 E7
    DEC $03F0,X                  ; $A217  DE F0 03
    BCC loc_1D_A21F              ; $A21A  90 03
    JMP loc_1D_A273              ; $A21C  4C 73 A2


loc_1D_A21F:
    INC $0378,X                  ; $A21F  FE 78 03
    INC $0378,X                  ; $A222  FE 78 03
    JSR sub_1D_A2A6              ; $A225  20 A6 A2
    LDY #$0E                     ; $A228  A0 0E
    INC $03C0,X                  ; $A22A  FE C0 03
    JSR sub_1F_EA3F              ; $A22D  20 3F EA
    DEC $03C0,X                  ; $A230  DE C0 03
    LDA $0468,X                  ; $A233  BD 68 04
    STA $0528,X                  ; $A236  9D 28 05
    BCC loc_1D_A247              ; $A239  90 0C
    LDY #$07                     ; $A23B  A0 07
    JSR sub_1F_EA52              ; $A23D  20 52 EA
    BCC loc_1D_A290              ; $A240  90 4E
    JSR $852F                    ; $A242  20 2F 85
    BNE loc_1D_A24A              ; $A245  D0 03

loc_1D_A247:
    JSR sub_1D_A291              ; $A247  20 91 A2

loc_1D_A24A:
    LDA $0420,X                  ; $A24A  BD 20 04
    AND #$08                     ; $A24D  29 08
    BNE loc_1D_A25C              ; $A24F  D0 0B
    LDA #$0F                     ; $A251  A9 0F
    STA $0588,X                  ; $A253  9D 88 05
    LDA #$A2                     ; $A256  A9 A2
    STA $05A0,X                  ; $A258  9D A0 05
    RTS                          ; $A25B  60


loc_1D_A25C:
    LDA #$66                     ; $A25C  A9 66
    STA $0588,X                  ; $A25E  9D 88 05
    LDA #$A2                     ; $A261  A9 A2
    STA $05A0,X                  ; $A263  9D A0 05
    LDY #$08                     ; $A266  A0 08
    INC $03F0,X                  ; $A268  FE F0 03
    JSR sub_1F_E780              ; $A26B  20 80 E7
    DEC $03F0,X                  ; $A26E  DE F0 03
    BCC loc_1D_A287              ; $A271  90 14

loc_1D_A273:
    LDY #$0E                     ; $A273  A0 0E
    JSR sub_1F_EA3F              ; $A275  20 3F EA
    LDA $0468,X                  ; $A278  BD 68 04
    STA $0528,X                  ; $A27B  9D 28 05
    BCC loc_1D_A290              ; $A27E  90 10
    LDA $0420,X                  ; $A280  BD 20 04
    EOR #$0C                     ; $A283  49 0C
    BNE loc_1D_A2AB              ; $A285  D0 24

loc_1D_A287:
    JSR sub_1D_A2A6              ; $A287  20 A6 A2
    DEC $0378,X                  ; $A28A  DE 78 03
    DEC $0378,X                  ; $A28D  DE 78 03

loc_1D_A290:
    RTS                          ; $A290  60


sub_1D_A291:
    JSR $8538                    ; $A291  20 38 85
    AND #$01                     ; $A294  29 01
    BNE loc_1D_A29F              ; $A296  D0 07
    DEC $0330,X                  ; $A298  DE 30 03
    DEC $0330,X                  ; $A29B  DE 30 03
    RTS                          ; $A29E  60


loc_1D_A29F:
    INC $0330,X                  ; $A29F  FE 30 03
    INC $0330,X                  ; $A2A2  FE 30 03
    RTS                          ; $A2A5  60


sub_1D_A2A6:
    LDA $0420,X                  ; $A2A6  BD 20 04
    EOR #$03                     ; $A2A9  49 03

loc_1D_A2AB:
    STA $0420,X                  ; $A2AB  9D 20 04
    LDA #$28                     ; $A2AE  A9 28
    STA $0588,X                  ; $A2B0  9D 88 05
    LDA #$A2                     ; $A2B3  A9 A2
    STA $05A0,X                  ; $A2B5  9D A0 05
    RTS                          ; $A2B8  60

    .byte $20,$94,$EC,$C9,$50,$B0,$5E,$20,$76,$EC,$C9,$10,$B0,$57,$A9,$75  ; $A2B9
    .byte $20,$98,$EA,$A9,$D7,$9D,$88,$05,$A9,$A2,$9D,$A0,$05,$60,$BD,$70  ; $A2C9
    .byte $05,$C9,$04,$D0,$40,$BD,$40,$05,$D0,$0E,$BD,$78,$03,$18,$69,$04  ; $A2D9
    .byte $9D,$78,$03,$A9,$D1,$9D,$08,$04,$C9,$02,$D0,$29,$A9,$76,$20,$98  ; $A2E9
    .byte $EA,$A9,$0A,$9D,$88,$05,$A9,$A3,$9D,$A0,$05,$20,$16,$EC,$20,$30  ; $A2F9
    .byte $EC,$A0,$13,$20,$B7,$E7,$90,$0D,$A0,$1A,$20,$3F,$EA,$20,$26,$85  ; $A309
    .byte $90,$03,$20,$4A,$EC,$60,$A9,$20,$9D,$68,$04,$A9,$2D,$9D,$80,$04  ; $A319
    .byte $A9,$33,$9D,$88,$05,$A9,$A3,$9D,$A0,$05,$20,$65,$EA,$20,$26,$85  ; $A329
    .byte $DE,$68,$04,$D0,$08,$20,$2F,$85,$A9,$40,$9D,$68,$04,$DE,$80,$04  ; $A339
    .byte $D0,$2E,$A9,$96,$9D,$80,$04,$20,$89,$A0,$20,$6F,$F1,$B0,$21,$A9  ; $A349
    .byte $87,$99,$08,$04,$A9,$78,$20,$A4,$EA,$B9,$78,$03,$38,$E9,$04,$99  ; $A359
    .byte $78,$03,$20,$9D,$A0,$A9,$08,$20,$70,$F4,$A6,$0D,$C6,$0E,$10,$DA  ; $A369

loc_1D_A379:
    RTS                          ; $A379  60

    LDA $0540,X                  ; $A37A  BD 40 05
    BNE loc_1D_A396              ; $A37D  D0 17
    STA $0570,X                  ; $A37F  9D 70 05
    INC $0468,X                  ; $A382  FE 68 04
    LDA $0468,X                  ; $A385  BD 68 04
    CMP #$78                     ; $A388  C9 78
    BCC loc_1D_A379              ; $A38A  90 ED
    LDA #$01                     ; $A38C  A9 01
    STA $0540,X                  ; $A38E  9D 40 05
    LDA #$37                     ; $A391  A9 37
    JMP sub_1F_EC5D              ; $A393  4C 5D EC


loc_1D_A396:
    CMP #$05                     ; $A396  C9 05
    BNE loc_1D_A379              ; $A398  D0 DF
    LDA $0570,X                  ; $A39A  BD 70 05
    CMP #$03                     ; $A39D  C9 03
    BNE loc_1D_A379              ; $A39F  D0 D8
    LDA #$7A                     ; $A3A1  A9 7A
    JSR sub_1F_EA98              ; $A3A3  20 98 EA
    LDA #$C1                     ; $A3A6  A9 C1
    STA $0408,X                  ; $A3A8  9D 08 04

loc_1D_A3AB:
    LDA #$00                     ; $A3AB  A9 00
    STA $0480,X                  ; $A3AD  9D 80 04
    LDA #$BD                     ; $A3B0  A9 BD
    STA $0588,X                  ; $A3B2  9D 88 05
    LDA #$A3                     ; $A3B5  A9 A3
    STA $05A0,X                  ; $A3B7  9D A0 05
    JMP loc_1D_A3E6              ; $A3BA  4C E6 A3

    JSR sub_1F_EF87              ; $A3BD  20 87 EF
    BCS loc_1D_A3DC              ; $A3C0  B0 1A
    LDA #$00                     ; $A3C2  A9 00
    STA $03D8,X                  ; $A3C4  9D D8 03
    LDA #$01                     ; $A3C7  A9 01
    STA $03F0,X                  ; $A3C9  9D F0 03
    LDA #$31                     ; $A3CC  A9 31
    STA $0588,X                  ; $A3CE  9D 88 05
    LDA #$A4                     ; $A3D1  A9 A4
    STA $05A0,X                  ; $A3D3  9D A0 05
    LDA #$3C                     ; $A3D6  A9 3C
    STA $04B0,X                  ; $A3D8  9D B0 04
    RTS                          ; $A3DB  60


loc_1D_A3DC:
    INC $0480,X                  ; $A3DC  FE 80 04
    LDA $0480,X                  ; $A3DF  BD 80 04
    AND #$1F                     ; $A3E2  29 1F
    BNE loc_1D_A3EF              ; $A3E4  D0 09

loc_1D_A3E6:
    JSR sub_1F_ECC2              ; $A3E6  20 C2 EC
    TAY                          ; $A3E9  A8
    LDA #$38                     ; $A3EA  A9 38
    JSR sub_1F_F470              ; $A3EC  20 70 F4

loc_1D_A3EF:
    JSR sub_1F_EA65              ; $A3EF  20 65 EA
    JSR sub_1F_EA86              ; $A3F2  20 86 EA
    DEC $0468,X                  ; $A3F5  DE 68 04
    BNE loc_1D_A43C              ; $A3F8  D0 42
    JSR sub_1F_ECC2              ; $A3FA  20 C2 EC
    STA $0D                      ; $A3FD  85 0D
    LDA #$78                     ; $A3FF  A9 78
    STA $0468,X                  ; $A401  9D 68 04
    STX $0F                      ; $A404  86 0F
    JSR sub_1F_F16F              ; $A406  20 6F F1
    BCS loc_1D_A43C              ; $A409  B0 31
    LDA #$87                     ; $A40B  A9 87
    STA $0408,Y                  ; $A40D  99 08 04
    LDA #$55                     ; $A410  A9 55
    STA $0300,Y                  ; $A412  99 00 03
    LDA #$7B                     ; $A415  A9 7B
    JSR sub_1F_EAA4              ; $A417  20 A4 EA
    LDA $0378,Y                  ; $A41A  B9 78 03
    CLC                          ; $A41D  18
    ADC #$08                     ; $A41E  69 08
    STA $0378,Y                  ; $A420  99 78 03
    STY $0E                      ; $A423  84 0E
    LDY $0D                      ; $A425  A4 0D
    LDX $0E                      ; $A427  A6 0E
    LDA #$08                     ; $A429  A9 08
    JSR sub_1F_F470              ; $A42B  20 70 F4
    LDX $0F                      ; $A42E  A6 0F
    RTS                          ; $A430  60

    JSR sub_1F_E94A              ; $A431  20 4A E9
    DEC $04B0,X                  ; $A434  DE B0 04
    BNE loc_1D_A43C              ; $A437  D0 03
    JMP loc_1D_A3AB              ; $A439  4C AB A3


loc_1D_A43C:
    RTS                          ; $A43C  60

    .byte $BD,$58,$05,$C9,$24,$F0,$17,$A0,$18,$20,$3F,$EA,$B0,$0B,$A0,$20  ; $A43D
    .byte $20,$A1,$C4,$A5,$10,$29,$10,$D0,$22,$A9,$24,$20,$98,$EA,$BD,$70  ; $A44D
    .byte $05,$C9,$04,$D0,$16,$BD,$40,$05,$C9,$02,$F0,$0C,$C9,$04,$D0,$0B  ; $A45D
    .byte $A9,$23,$20,$98,$EA,$4C,$78,$A4,$20,$4A,$EC,$BD,$08,$04,$09,$40  ; $A46D
    .byte $9D,$08,$04,$20,$F8,$EF,$B0,$12,$B9,$20,$04,$29,$03,$DD,$20,$04  ; $A47D
    .byte $F0,$08,$BD,$08,$04,$29,$BF,$9D,$08,$04,$60,$A0,$0E,$20,$3F,$EA  ; $A48D
    .byte $90,$3C,$20,$89,$A0,$E6,$0E,$20,$4D,$A5,$A9,$2B,$20,$5D,$EC,$20  ; $A49D
    .byte $6F,$F1,$B0,$29,$A9,$87,$99,$08,$04,$A9,$5B,$99,$00,$03,$A9,$82  ; $A4AD
    .byte $38,$E5,$0E,$20,$A4,$EA,$98,$AA,$A4,$0F,$A9,$08,$20,$70,$F4,$A6  ; $A4BD
    .byte $0D,$E6,$0F,$A5,$0F,$29,$0F,$85,$0F,$C6,$0E,$10,$D2,$60,$A9,$A2  ; $A4CD
    .byte $9D,$08,$04,$A5,$32,$C9,$07,$D0,$06,$A9,$E2,$9D,$08,$04,$60,$20  ; $A4DD
    .byte $F8,$EF,$B0,$E9,$A9,$40,$85,$00,$20,$9D,$80,$BD,$00,$03,$C9,$5A  ; $A4ED
    .byte $F0,$DB,$A9,$0E,$85,$0D,$A9,$03,$85,$0E,$86,$0F,$20,$6F,$F1,$B0  ; $A4FD
    .byte $CC,$A9,$87,$99,$08,$04,$A9,$5B,$99,$00,$03,$BD,$28,$05,$A6,$0E  ; $A50D
    .byte $29,$20,$F0,$03,$E8,$E8,$E8,$BD,$43,$A5,$A6,$0F,$20,$A4,$EA,$98  ; $A51D
    .byte $AA,$A4,$0D,$A9,$08,$20,$70,$F4,$A6,$0F,$C6,$0E,$A5,$0D,$38,$E9  ; $A52D
    .byte $04,$85,$0D,$10,$C7,$60,$80,$82,$81,$7F,$81,$82,$80,$4C,$FC,$84  ; $A53D

sub_1D_A54D:
    JSR sub_1F_F2C4              ; $A54D  20 C4 F2
    LDA #$01                     ; $A550  A9 01
    STA $0300,X                  ; $A552  9D 00 03
    LDA #$2B                     ; $A555  A9 2B
    JSR sub_1F_EC5D              ; $A557  20 5D EC
    LDA #$42                     ; $A55A  A9 42
    JMP sub_1F_EA98              ; $A55C  4C 98 EA

    .byte $20,$FE,$F2,$A9,$01,$99,$00,$03,$A9,$42,$4C,$E9,$EA,$20,$C4,$F2  ; $A55F
    .byte $A9,$2F,$9D,$00,$03,$A9,$42,$4C,$98,$EA,$20,$20,$A6,$90,$3F,$20  ; $A56F
    .byte $16,$EC,$20,$30,$EC,$BD,$68,$04,$F0,$05,$DE,$68,$04,$D0,$2F,$A5  ; $A57F
    .byte $9D,$29,$07,$D0,$29,$A9,$00,$85,$00,$A0,$17,$B9,$00,$03,$C9,$52  ; $A58F
    .byte $D0,$02,$E6,$00,$88,$C0,$07,$B0,$F2,$A5,$00,$C9,$03,$B0,$71,$A9  ; $A59F
    .byte $87,$20,$98,$EA,$A9,$BE,$9D,$88,$05,$A9,$A5,$9D,$A0,$05,$60,$20  ; $A5AF
    .byte $20,$A6,$90,$5C,$BD,$00,$03,$C9,$5D,$D0,$55,$BD,$70,$05,$C9,$04  ; $A5BF
    .byte $F0,$13,$C9,$08,$D0,$4A,$A9,$79,$9D,$88,$05,$A9,$A5,$9D,$A0,$05  ; $A5CF
    .byte $A9,$AE,$4C,$98,$EA,$A9,$32,$9D,$68,$04,$20,$6F,$F1,$B0,$31,$A9  ; $A5DF
    .byte $D6,$99,$08,$04,$A9,$01,$99,$50,$04,$A9,$52,$99,$00,$03,$BD,$20  ; $A5EF
    .byte $04,$99,$20,$04,$29,$01,$18,$69,$02,$85,$10,$A9,$88,$20,$F5,$EA  ; $A5FF
    .byte $A9,$00,$99,$A8,$03,$A9,$01,$99,$C0,$03,$20,$34,$EA,$FE,$70,$05  ; $A60F
    .byte $60,$BD,$78,$03,$9D,$80,$04,$38,$E9,$0C,$9D,$78,$03,$A9,$CD,$9D  ; $A61F
    .byte $08,$04,$20,$F8,$EF,$BD,$80,$04,$9D,$78,$03,$A9,$97,$9D,$08,$04  ; $A62F
    .byte $B0,$DE,$A9,$40,$85,$00,$20,$9D,$80,$18,$60,$A0,$17,$20,$B7,$E7  ; $A63F
    .byte $90,$3A,$A0,$1C,$20,$3F,$EA,$90,$33,$A9,$7A,$9D,$D8,$03,$A9,$05  ; $A64F
    .byte $9D,$F0,$03,$A9,$6C,$9D,$88,$05,$A9,$A6,$9D,$A0,$05,$A0,$17,$20  ; $A65F
    .byte $B7,$E7,$66,$0F,$A0,$1C,$20,$3F,$EA,$A5,$0F,$10,$0F,$90,$03,$20  ; $A66F
    .byte $4A,$EC,$A9,$4A,$9D,$88,$05,$A9,$A6,$9D,$A0,$05,$60,$A9,$B5,$9D  ; $A67F
    .byte $A8,$03,$A9,$00,$9D,$C0,$03,$20,$C5,$A6,$A9,$00,$9D,$70,$05,$A0  ; $A68F
    .byte $17,$20,$B7,$E7,$B0,$03,$4C,$65,$EA,$A9,$01,$9D,$40,$05,$A9,$B7  ; $A69F
    .byte $9D,$88,$05,$A9,$A6,$9D,$A0,$05,$BD,$70,$05,$C9,$04,$D0,$1B,$BD  ; $A6AF
    .byte $40,$05,$C9,$02,$D0,$14,$A9,$A8,$9D,$D8,$03,$A9,$05,$9D,$F0,$03  ; $A6BF
    .byte $A9,$99,$9D,$88,$05,$A9,$A6,$9D,$A0,$05  ; $A6CF

loc_1D_A6D9:
    RTS                          ; $A6D9  60

    LDA #$00                     ; $A6DA  A9 00
    STA $0570,X                  ; $A6DC  9D 70 05
    JSR sub_1F_EC94              ; $A6DF  20 94 EC
    CMP #$40                     ; $A6E2  C9 40
    BCS loc_1D_A6D9              ; $A6E4  B0 F3
    JSR sub_1F_EC76              ; $A6E6  20 76 EC
    CMP #$10                     ; $A6E9  C9 10
    BCS loc_1D_A6D9              ; $A6EB  B0 EC
    LDA #$FC                     ; $A6ED  A9 FC
    STA $0588,X                  ; $A6EF  9D 88 05
    LDA #$A6                     ; $A6F2  A9 A6
    STA $05A0,X                  ; $A6F4  9D A0 05
    LDA #$04                     ; $A6F7  A9 04
    STA $0570,X                  ; $A6F9  9D 70 05
    JSR sub_1F_EC16              ; $A6FC  20 16 EC
    JSR sub_1F_EC30              ; $A6FF  20 30 EC
    LDA $0570,X                  ; $A702  BD 70 05
    CMP #$04                     ; $A705  C9 04
    BNE loc_1D_A6D9              ; $A707  D0 D0
    LDY $0540,X                  ; $A709  BC 40 05
    LDA $A7BB,Y                  ; $A70C  B9 BB A7
    STA $0408,X                  ; $A70F  9D 08 04
    LDA $0378,X                  ; $A712  BD 78 03
    SEC                          ; $A715  38
    SBC #$04                     ; $A716  E9 04
    STA $0378,X                  ; $A718  9D 78 03
    CPY #$02                     ; $A71B  C0 02
    BNE loc_1D_A6D9              ; $A71D  D0 BA
    LDA #$29                     ; $A71F  A9 29
    STA $0588,X                  ; $A721  9D 88 05
    LDA #$A7                     ; $A724  A9 A7
    STA $05A0,X                  ; $A726  9D A0 05
    LDA $0570,X                  ; $A729  BD 70 05
    CMP #$04                     ; $A72C  C9 04
    BNE loc_1D_A6D9              ; $A72E  D0 A9
    LDA $0540,X                  ; $A730  BD 40 05
    CMP #$10                     ; $A733  C9 10
    BEQ loc_1D_A767              ; $A735  F0 30
    CMP #$09                     ; $A737  C9 09
    BNE loc_1D_A6D9              ; $A739  D0 9E
    JSR sub_1F_F16F              ; $A73B  20 6F F1
    BCS loc_1D_A6D9              ; $A73E  B0 99
    LDA #$87                     ; $A740  A9 87
    STA $0408,Y                  ; $A742  99 08 04
    LDA #$61                     ; $A745  A9 61
    STA $0300,Y                  ; $A747  99 00 03
    LDA $0420,X                  ; $A74A  BD 20 04
    STA $0420,Y                  ; $A74D  99 20 04
    AND #$01                     ; $A750  29 01
    CLC                          ; $A752  18
    ADC #$28                     ; $A753  69 28
    STA $10                      ; $A755  85 10
    LDA #$8A                     ; $A757  A9 8A
    JSR sub_1F_EAF5              ; $A759  20 F5 EA
    LDA #$00                     ; $A75C  A9 00
    STA $03A8,Y                  ; $A75E  99 A8 03
    LDA #$02                     ; $A761  A9 02
    STA $03C0,Y                  ; $A763  99 C0 03
    RTS                          ; $A766  60


loc_1D_A767:
    LDA #$76                     ; $A767  A9 76
    STA $0588,X                  ; $A769  9D 88 05
    LDA #$A7                     ; $A76C  A9 A7
    STA $05A0,X                  ; $A76E  9D A0 05
    LDA #$02                     ; $A771  A9 02
    STA $0468,X                  ; $A773  9D 68 04
    LDA $0480,X                  ; $A776  BD 80 04
    BEQ loc_1D_A790              ; $A779  F0 15
    LDA #$00                     ; $A77B  A9 00
    STA $0570,X                  ; $A77D  9D 70 05
    DEC $0480,X                  ; $A780  DE 80 04
    BNE loc_1D_A7B9              ; $A783  D0 34
    LDA #$DA                     ; $A785  A9 DA
    STA $0588,X                  ; $A787  9D 88 05
    LDA #$A6                     ; $A78A  A9 A6
    STA $05A0,X                  ; $A78C  9D A0 05
    RTS                          ; $A78F  60


loc_1D_A790:
    LDA $0570,X                  ; $A790  BD 70 05
    CMP #$04                     ; $A793  C9 04
    BNE loc_1D_A7B9              ; $A795  D0 22
    LDA $0540,X                  ; $A797  BD 40 05
    CMP #$13                     ; $A79A  C9 13
    BEQ loc_1D_A7B4              ; $A79C  F0 16
    LDA $0378,X                  ; $A79E  BD 78 03
    CLC                          ; $A7A1  18
    ADC #$04                     ; $A7A2  69 04
    STA $0378,X                  ; $A7A4  9D 78 03
    LDY $0468,X                  ; $A7A7  BC 68 04
    LDA $A7BA,Y                  ; $A7AA  B9 BA A7
    STA $0408,X                  ; $A7AD  9D 08 04
    DEC $0468,X                  ; $A7B0  DE 68 04
    RTS                          ; $A7B3  60


loc_1D_A7B4:
    LDA #$1E                     ; $A7B4  A9 1E
    STA $0480,X                  ; $A7B6  9D 80 04

loc_1D_A7B9:
    RTS                          ; $A7B9  60

    .byte $CA,$D1,$C0,$CC  ; $A7BA
    LDA $0468,X                  ; $A7BE  BD 68 04
    BEQ loc_1D_A7C8              ; $A7C1  F0 05
    DEC $0468,X                  ; $A7C3  DE 68 04
    BNE loc_1D_A82D              ; $A7C6  D0 65

loc_1D_A7C8:
    JSR sub_1F_EA1E              ; $A7C8  20 1E EA
    LDA $0528,X                  ; $A7CB  BD 28 05
    AND #$FB                     ; $A7CE  29 FB
    STA $0528,X                  ; $A7D0  9D 28 05
    LDA #$DD                     ; $A7D3  A9 DD
    STA $0588,X                  ; $A7D5  9D 88 05
    LDA #$A7                     ; $A7D8  A9 A7
    STA $05A0,X                  ; $A7DA  9D A0 05
    JSR sub_1F_E968              ; $A7DD  20 68 E9
    JSR sub_1F_EFF8              ; $A7E0  20 F8 EF
    BCS loc_1D_A800              ; $A7E3  B0 1B
    LDA $0438,X                  ; $A7E5  BD 38 04
    PHA                          ; $A7E8  48
    LDA #$00                     ; $A7E9  A9 00
    STA $00                      ; $A7EB  85 00
    JSR $809D                    ; $A7ED  20 9D 80
    PLA                          ; $A7F0  68
    STA $0438,X                  ; $A7F1  9D 38 04
    LDA $0300,X                  ; $A7F4  BD 00 03
    BNE loc_1D_A800              ; $A7F7  D0 07
    LDA #$26                     ; $A7F9  A9 26
    STA $0300,X                  ; $A7FB  9D 00 03
    BNE loc_1D_A807              ; $A7FE  D0 07

loc_1D_A800:
    LDA $0378,X                  ; $A800  BD 78 03
    CMP #$E8                     ; $A803  C9 E8
    BCC loc_1D_A82D              ; $A805  90 26

loc_1D_A807:
    LDA $E6                      ; $A807  A5 E6
    ADC $E5                      ; $A809  65 E5
    STA $E6                      ; $A80B  85 E6
    AND #$03                     ; $A80D  29 03
    TAY                          ; $A80F  A8
    LDA $A82E,Y                  ; $A810  B9 2E A8
    STA $0468,X                  ; $A813  9D 68 04
    LDA $0528,X                  ; $A816  BD 28 05
    ORA #$04                     ; $A819  09 04
    STA $0528,X                  ; $A81B  9D 28 05
    LDA #$30                     ; $A81E  A9 30
    STA $0378,X                  ; $A820  9D 78 03
    LDA #$BE                     ; $A823  A9 BE
    STA $0588,X                  ; $A825  9D 88 05
    LDA #$A7                     ; $A828  A9 A7
    STA $05A0,X                  ; $A82A  9D A0 05

loc_1D_A82D:
    RTS                          ; $A82D  60

    .byte $0A,$3C,$78,$0A,$BD,$80,$04,$F0,$08,$DE,$80,$04,$D0,$03,$4C,$6C  ; $A82E
    .byte $A5,$BD,$58,$05,$C9,$36,$D0,$20,$BD,$70,$05,$C9,$06,$D0,$E0,$BD  ; $A83E
    .byte $40,$05,$D0,$03,$4C,$4A,$EC,$BD,$68,$04,$48,$20,$98,$EA,$68,$29  ; $A84E
    .byte $01,$A8,$B9,$08,$A9,$9D,$08,$04,$BD,$98,$04,$F0,$05,$DE,$98,$04  ; $A85E
    .byte $D0,$BD,$A0,$0D,$20,$B7,$E7,$90,$17,$A0,$10,$20,$3F,$EA,$90,$10  ; $A86E
    .byte $BD,$58,$05,$9D,$68,$04,$A9,$91,$9D,$08,$04,$A9,$36,$4C,$98,$EA  ; $A87E
    .byte $BD,$58,$05,$C9,$26,$D0,$72,$20,$94,$EC,$C9,$50,$B0,$6B,$20,$76  ; $A88E
    .byte $EC,$C9,$28,$B0,$64,$DE,$58,$05,$A9,$C9,$9D,$08,$04,$A9,$F0,$9D  ; $A89E
    .byte $80,$04,$A9,$00,$9D,$A8,$03,$A9,$02,$9D,$C0,$03,$A9,$3D,$20,$5D  ; $A8AE
    .byte $EC,$86,$0F,$A9,$02,$85,$0E,$20,$6F,$F1,$B0,$3D,$A9,$87,$99,$08  ; $A8BE
    .byte $04,$A9,$55,$99,$00,$03,$A9,$9D,$20,$A4,$EA,$B9,$78,$03,$38,$E9  ; $A8CE
    .byte $04,$99,$78,$03,$84,$0D,$BD,$20,$04,$29,$02,$0A,$0A,$18,$65,$0E  ; $A8DE
    .byte $A8,$A6,$0D,$A9,$40,$20,$70,$F4,$A6,$0F,$E6,$0E,$E6,$0E,$A5,$0E  ; $A8EE
    .byte $C9,$08,$D0,$C3,$A9,$3C,$9D,$98,$04,$60,$80,$C0,$BD,$58,$05,$C9  ; $A8FE
    .byte $1E,$F0,$0F,$20,$94,$EC,$C9,$30,$B0,$4C,$FE,$58,$05,$A9,$3B,$20  ; $A90E
    .byte $5D,$EC,$A0,$17,$20,$B7,$E7,$90,$3D,$A9,$1F,$20,$98,$EA,$BD,$28  ; $A91E
    .byte $05,$29,$BF,$9D,$28,$05,$20,$16,$EC,$20,$30,$EC,$A9,$44,$9D,$88  ; $A92E
    .byte $05,$A9,$A9,$9D,$A0,$05,$A0,$17,$20,$B7,$E7,$90,$19,$A0,$1C,$20  ; $A93E
    .byte $3F,$EA,$90,$12,$20,$C4,$F2,$A9,$42,$20,$98,$EA,$A9,$8C,$9D,$00  ; $A94E
    .byte $03,$A9,$8B,$9D,$08,$04,$60  ; $A95E

loc_1D_A965:
    LDA #$80                     ; $A965  A9 80
    STA $03D8,X                  ; $A967  9D D8 03
    LDA #$00                     ; $A96A  A9 00
    STA $03F0,X                  ; $A96C  9D F0 03
    LDA #$08                     ; $A96F  A9 08
    STA $0420,X                  ; $A971  9D 20 04
    LDA #$08                     ; $A974  A9 08
    STA $0468,X                  ; $A976  9D 68 04
    STA $0480,X                  ; $A979  9D 80 04
    LDA #$D1                     ; $A97C  A9 D1
    STA $0408,X                  ; $A97E  9D 08 04
    LDA #$00                     ; $A981  A9 00
    STA $0540,X                  ; $A983  9D 40 05
    STA $0570,X                  ; $A986  9D 70 05
    LDA #$93                     ; $A989  A9 93
    STA $0588,X                  ; $A98B  9D 88 05
    LDA #$A9                     ; $A98E  A9 A9
    STA $05A0,X                  ; $A990  9D A0 05
    LDA #$00                     ; $A993  A9 00
    STA $0570,X                  ; $A995  9D 70 05
    JSR sub_1F_EA86              ; $A998  20 86 EA
    DEC $0468,X                  ; $A99B  DE 68 04
    BNE loc_1D_A9DF              ; $A99E  D0 3F
    LDA #$08                     ; $A9A0  A9 08
    STA $0468,X                  ; $A9A2  9D 68 04
    JSR $8538                    ; $A9A5  20 38 85
    DEC $0480,X                  ; $A9A8  DE 80 04
    BNE loc_1D_A9DF              ; $A9AB  D0 32
    JSR sub_1F_ECC2              ; $A9AD  20 C2 EC
    TAY                          ; $A9B0  A8
    LDA #$18                     ; $A9B1  A9 18
    JSR sub_1F_F470              ; $A9B3  20 70 F4
    LDA #$20                     ; $A9B6  A9 20
    STA $0498,X                  ; $A9B8  9D 98 04
    LDA #$CF                     ; $A9BB  A9 CF
    STA $0588,X                  ; $A9BD  9D 88 05
    LDA #$A9                     ; $A9C0  A9 A9
    STA $05A0,X                  ; $A9C2  9D A0 05
    LDA #$01                     ; $A9C5  A9 01
    STA $0540,X                  ; $A9C7  9D 40 05
    LDA #$C0                     ; $A9CA  A9 C0
    STA $0408,X                  ; $A9CC  9D 08 04
    LDA #$00                     ; $A9CF  A9 00
    STA $0570,X                  ; $A9D1  9D 70 05
    JSR sub_1F_EA65              ; $A9D4  20 65 EA
    JSR sub_1F_EA86              ; $A9D7  20 86 EA
    DEC $0498,X                  ; $A9DA  DE 98 04
    BEQ loc_1D_A965              ; $A9DD  F0 86

loc_1D_A9DF:
    RTS                          ; $A9DF  60

    .byte $A4,$32,$BD,$08,$04,$29,$BF,$19,$B0,$AA,$9D,$08,$04,$BD,$78,$03  ; $A9E0
    .byte $48,$38,$E9,$18,$9D,$78,$03,$BD,$08,$04,$48,$A9,$C1,$9D,$08,$04  ; $A9F0
    .byte $20,$F8,$EF,$68,$9D,$08,$04,$68,$9D,$78,$03,$B0,$07,$A9,$40,$85  ; $AA00
    .byte $00,$4C,$9D,$80,$20,$16,$EC,$20,$30,$EC,$BD,$58,$05,$C9,$62,$D0  ; $AA10
    .byte $1B,$BD,$70,$05,$C9,$03,$D0,$B7,$BD,$40,$05,$C9,$03,$F0,$36,$C9  ; $AA20
    .byte $0F,$F0,$3D,$C9,$13,$D0,$78,$A9,$61,$20,$98,$EA,$A9,$00,$85,$00  ; $AA30
    .byte $A0,$17,$B9,$00,$03,$C9,$62,$D0,$02,$E6,$00,$88,$C0,$07,$B0,$F2  ; $AA40
    .byte $A5,$00,$C9,$02,$B0,$59,$BD,$08,$04,$29,$C0,$09,$25,$9D,$08,$04  ; $AA50
    .byte $A9,$62,$4C,$98,$EA,$BD,$08,$04,$29,$C0,$09,$24,$9D,$08,$04,$60  ; $AA60
    .byte $20,$6F,$F1,$B0,$3A,$A9,$C5,$99,$08,$04,$A9,$01,$99,$50,$04,$A9  ; $AA70
    .byte $62,$99,$00,$03,$BD,$20,$04,$99,$20,$04,$29,$01,$18,$69,$1E,$85  ; $AA80
    .byte $10,$A9,$00,$99,$A8,$03,$A9,$01,$99,$C0,$03,$A9,$87,$20,$F5,$EA  ; $AA90
    .byte $A9,$0A,$99,$68,$04,$8A,$99,$80,$04,$BD,$48,$03,$99,$98,$04,$60  ; $AAA0
    .byte $00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$BC,$80,$04  ; $AAB0
    .byte $B9,$00,$03,$C9,$59,$D0,$08,$BD,$98,$04,$D9,$48,$03,$F0,$03,$4C  ; $AAC0
    .byte $4D,$A5,$20,$FC,$84,$DE,$68,$04,$D0,$D5,$A9,$0A,$9D,$68,$04,$20  ; $AAD0
    .byte $5B,$ED,$B9,$F3,$AA,$9D,$28,$05,$B9,$03,$AB,$9D,$58,$05,$A9,$20  ; $AAE0
    .byte $4C,$70,$F4,$80,$A0,$A0,$A0,$A0,$E0,$E0,$E0,$C0,$C0,$C0,$C0,$80  ; $AAF0
    .byte $80,$80,$80,$88,$64,$64,$64,$87,$64,$64,$64,$88,$64,$64,$64,$87  ; $AB00
    .byte $64,$64,$64  ; $AB10
    LDY #$15                     ; $AB13  A0 15
    JSR sub_1F_E7B7              ; $AB15  20 B7 E7
    BCC loc_1D_AB24              ; $AB18  90 0A
    LDY #$16                     ; $AB1A  A0 16
    JSR sub_1F_EA3F              ; $AB1C  20 3F EA
    BCC loc_1D_AB24              ; $AB1F  90 03
    JSR sub_1F_EC4A              ; $AB21  20 4A EC

loc_1D_AB24:
    RTS                          ; $AB24  60

    .byte $BD,$68,$04,$FE,$68,$04,$29,$0F,$D0,$09,$20,$C2,$EC,$A8,$A9,$38  ; $AB25
    .byte $20,$70,$F4,$20,$65,$EA,$20,$86,$EA  ; $AB35

loc_1D_AB3E:
    RTS                          ; $AB3E  60

    LDA #$00                     ; $AB3F  A9 00
    STA $0570,X                  ; $AB41  9D 70 05
    LDA $0498,X                  ; $AB44  BD 98 04
    BEQ loc_1D_AB4E              ; $AB47  F0 05
    DEC $0498,X                  ; $AB49  DE 98 04
    BNE loc_1D_AB3E              ; $AB4C  D0 F0

loc_1D_AB4E:
    JSR sub_1F_EC94              ; $AB4E  20 94 EC
    CMP #$20                     ; $AB51  C9 20
    BCS loc_1D_AB3E              ; $AB53  B0 E9
    JSR sub_1F_EC76              ; $AB55  20 76 EC
    CMP #$18                     ; $AB58  C9 18
    BCS loc_1D_AB3E              ; $AB5A  B0 E2
    LDA #$66                     ; $AB5C  A9 66
    STA $0588,X                  ; $AB5E  9D 88 05
    LDA #$AB                     ; $AB61  A9 AB
    STA $05A0,X                  ; $AB63  9D A0 05
    LDA $0570,X                  ; $AB66  BD 70 05
    CMP #$02                     ; $AB69  C9 02
    BNE loc_1D_AB3E              ; $AB6B  D0 D1
    LDY $0540,X                  ; $AB6D  BC 40 05
    LDA $0378,X                  ; $AB70  BD 78 03
    SEC                          ; $AB73  38
    SBC $ABFB,Y                  ; $AB74  F9 FB AB
    STA $0378,X                  ; $AB77  9D 78 03
    LDA $ABFF,Y                  ; $AB7A  B9 FF AB
    STA $0408,X                  ; $AB7D  9D 08 04
    CPY #$03                     ; $AB80  C0 03
    BNE loc_1D_ABFA              ; $AB82  D0 76
    LDA #$98                     ; $AB84  A9 98
    STA $0588,X                  ; $AB86  9D 88 05
    LDA #$AB                     ; $AB89  A9 AB
    STA $05A0,X                  ; $AB8B  9D A0 05
    LDA #$95                     ; $AB8E  A9 95
    JSR sub_1F_EA98              ; $AB90  20 98 EA
    LDA #$07                     ; $AB93  A9 07
    STA $0468,X                  ; $AB95  9D 68 04
    LDA $0570,X                  ; $AB98  BD 70 05
    CMP #$02                     ; $AB9B  C9 02
    BNE loc_1D_ABFA              ; $AB9D  D0 5B
    LDA $0540,X                  ; $AB9F  BD 40 05
    CMP #$03                     ; $ABA2  C9 03
    BNE loc_1D_ABFA              ; $ABA4  D0 54
    DEC $0468,X                  ; $ABA6  DE 68 04
    BNE loc_1D_ABFA              ; $ABA9  D0 4F
    LDA #$C8                     ; $ABAB  A9 C8
    STA $0588,X                  ; $ABAD  9D 88 05
    LDA #$AB                     ; $ABB0  A9 AB
    STA $05A0,X                  ; $ABB2  9D A0 05
    LDA #$91                     ; $ABB5  A9 91
    JSR sub_1F_EA98              ; $ABB7  20 98 EA
    LDA #$A0                     ; $ABBA  A9 A0
    STA $0408,X                  ; $ABBC  9D 08 04
    LDA $0378,X                  ; $ABBF  BD 78 03
    SEC                          ; $ABC2  38
    SBC #$04                     ; $ABC3  E9 04
    STA $0378,X                  ; $ABC5  9D 78 03
    LDA $0570,X                  ; $ABC8  BD 70 05
    CMP #$04                     ; $ABCB  C9 04
    BNE loc_1D_ABFA              ; $ABCD  D0 2B
    LDY $0540,X                  ; $ABCF  BC 40 05
    LDA $0378,X                  ; $ABD2  BD 78 03
    SEC                          ; $ABD5  38
    SBC $AC03,Y                  ; $ABD6  F9 03 AC
    STA $0378,X                  ; $ABD9  9D 78 03
    LDA $AC09,Y                  ; $ABDC  B9 09 AC
    STA $0408,X                  ; $ABDF  9D 08 04
    CPY #$05                     ; $ABE2  C0 05
    BNE loc_1D_ABFA              ; $ABE4  D0 14
    LDA #$3F                     ; $ABE6  A9 3F
    STA $0588,X                  ; $ABE8  9D 88 05
    LDA #$AB                     ; $ABEB  A9 AB
    STA $05A0,X                  ; $ABED  9D A0 05
    LDA #$59                     ; $ABF0  A9 59
    JSR sub_1F_EA98              ; $ABF2  20 98 EA
    LDA #$3C                     ; $ABF5  A9 3C
    STA $0498,X                  ; $ABF7  9D 98 04

loc_1D_ABFA:
    RTS                          ; $ABFA  60

    .byte $08,$08,$00,$00,$9B,$9C,$9C,$9C,$07,$01,$00,$00,$00,$E4,$A3,$A3  ; $ABFB
    .byte $A3,$00,$00,$00,$20,$16,$EC,$20,$30,$EC,$BD,$58,$05,$C9,$97,$F0  ; $AC0B
    .byte $17,$BD,$08,$04,$48,$A9,$E6,$9D,$08,$04,$20,$F8,$EF,$68,$9D,$08  ; $AC1B
    .byte $04,$B0,$4F,$A9,$97,$20,$98,$EA,$BD,$70,$05,$C9,$05,$D0,$43,$BD  ; $AC2B
    .byte $40,$05,$F0,$09,$C9,$05,$D0,$3A,$A9,$96,$4C,$98,$EA,$20,$6F,$F1  ; $AC3B
    .byte $B0,$30,$A9,$C7,$99,$08,$04,$A9,$01,$99,$50,$04,$A9,$65,$99,$00  ; $AC4B
    .byte $03,$BD,$20,$04,$99,$20,$04,$29,$01,$18,$69,$53,$85,$10,$A9,$9E  ; $AC5B
    .byte $20,$F5,$EA,$A9,$00,$99,$A8,$03,$A9,$04,$99,$C0,$03,$98,$9D,$80  ; $AC6B
    .byte $04,$60,$FE,$68,$04,$BD,$68,$04,$C9,$78,$90,$3A,$A9,$00,$9D,$68  ; $AC7B
    .byte $04,$BC,$80,$04,$B9,$00,$03,$C9,$65,$F0,$2B,$20,$6F,$F1,$B0,$26  ; $AC8B
    .byte $A9,$87,$99,$08,$04,$A9,$9B,$99,$00,$03,$BD,$20,$04,$99,$20,$04  ; $AC9B
    .byte $29,$01,$18,$69,$02,$85,$10,$A9,$9F,$20,$F5,$EA,$A9,$00,$99,$A8  ; $ACAB
    .byte $03,$A9,$02,$99,$C0,$03,$60,$BD,$28,$05,$29,$FB,$9D,$28,$05,$A9  ; $ACBB
    .byte $DB,$9D,$88,$05,$A9,$AC,$9D,$A0,$05,$A5,$5D,$F0,$03,$4C,$C4,$F2  ; $ACCB
    .byte $A0,$21,$20,$B7,$E7,$90,$49,$A0,$28,$20,$3F,$EA,$90,$03,$20,$4A  ; $ACDB
    .byte $EC,$20,$94,$EC,$C9,$20,$B0,$38,$A9,$02,$9D,$88,$05,$A9,$AD,$9D  ; $ACEB
    .byte $A0,$05,$A9,$08,$20,$98,$EA,$BD,$70,$05,$C9,$08,$D0,$72,$BD,$40  ; $ACFB
    .byte $05,$C9,$03,$F0,$1C,$C9,$05,$D0,$67,$A9,$50,$9D,$68,$04,$A9,$7C  ; $AD0B
    .byte $9D,$88,$05,$A9,$AD,$9D,$A0,$05,$A9,$07,$20,$98,$EA,$FE,$40,$05  ; $AD1B
    .byte $60,$86,$0F,$20,$6F,$F1,$B0,$48,$A9,$57,$99,$00,$03,$A9,$00,$99  ; $AD2B
    .byte $08,$04,$99,$50,$04,$99,$A8,$03,$99,$D8,$03,$A9,$01,$99,$C0,$03  ; $AD3B
    .byte $A9,$04,$99,$F0,$03,$BD,$20,$04,$99,$20,$04,$BD,$38,$04,$99,$38  ; $AD4B
    .byte $04,$A5,$E5,$65,$E7,$85,$E7,$29,$07,$AA,$BD,$C4,$AD,$A6,$0F,$20  ; $AD5B
    .byte $A4,$EA,$A9,$23,$99,$68,$04,$B9,$78,$03,$38,$E9,$0C,$99,$78,$03  ; $AD6B
    .byte $60,$BD,$68,$04,$F0,$0F,$A9,$00,$9D,$70,$05,$DE,$68,$04,$D0,$F0  ; $AD7B
    .byte $A9,$09,$20,$98,$EA,$BD,$70,$05,$C9,$02,$D0,$E4,$DD,$40,$05,$D0  ; $AD8B
    .byte $DF,$A9,$B1,$9D,$88,$05,$A9,$AD,$9D,$A0,$05,$A9,$00,$9D,$D8,$03  ; $AD9B
    .byte $9D,$F0,$03,$FE,$40,$05,$A9,$00,$9D,$70,$05,$20,$E1,$E9,$20,$4A  ; $ADAB
    .byte $E9,$BD,$90,$03,$F0,$BA,$4C,$C4,$F2,$78,$74,$76,$72,$78,$74,$76  ; $ADBB
    .byte $78  ; $ADCB
    LDY $0468,X                  ; $ADCC  BC 68 04
    JSR sub_1F_E7B7              ; $ADCF  20 B7 E7
    BCC loc_1D_ADDE              ; $ADD2  90 0A
    LDA #$ED                     ; $ADD4  A9 ED
    STA $0588,X                  ; $ADD6  9D 88 05
    LDA #$AD                     ; $ADD9  A9 AD
    STA $05A0,X                  ; $ADDB  9D A0 05

loc_1D_ADDE:
    LDY #$2A                     ; $ADDE  A0 2A
    JSR sub_1F_EA3F              ; $ADE0  20 3F EA
    JSR $8526                    ; $ADE3  20 26 85
    BCC loc_1D_ADED              ; $ADE6  90 05
    LDA #$00                     ; $ADE8  A9 00
    STA $0420,X                  ; $ADEA  9D 20 04

loc_1D_ADED:
    LDA $0558,X                  ; $ADED  BD 58 05
    CMP #$73                     ; $ADF0  C9 73
    BNE loc_1D_ADFD              ; $ADF2  D0 09
    LDA $BE                      ; $ADF4  A5 BE
    CMP #$80                     ; $ADF6  C9 80
    BEQ loc_1D_ADFD              ; $ADF8  F0 03
    JMP sub_1F_F2C4              ; $ADFA  4C C4 F2


loc_1D_ADFD:
    LDA $0528,X                  ; $ADFD  BD 28 05
    AND #$FB                     ; $AE00  29 FB
    STA $0528,X                  ; $AE02  9D 28 05
    LDA $30                      ; $AE05  A5 30
    CMP #$06                     ; $AE07  C9 06
    BCS loc_1D_AE42              ; $AE09  B0 37
    JSR sub_1F_EF87              ; $AE0B  20 87 EF
    BCS loc_1D_AE42              ; $AE0E  B0 32
    LDA $0300,X                  ; $AE10  BD 00 03
    CMP #$B6                     ; $AE13  C9 B6
    BEQ loc_1D_AE1F              ; $AE15  F0 08
    CMP #$57                     ; $AE17  C9 57
    BNE loc_1D_AE22              ; $AE19  D0 07
    INC $5D                      ; $AE1B  E6 5D
    BNE loc_1D_AE22              ; $AE1D  D0 03

loc_1D_AE1F:
    JSR sub_1F_F297              ; $AE1F  20 97 F2

loc_1D_AE22:
    LDY $0558,X                  ; $AE22  BC 58 05
    LDA $AEC7,Y                  ; $AE25  B9 C7 AE
    BEQ loc_1D_AE2D              ; $AE28  F0 03
    JSR sub_1F_EC5D              ; $AE2A  20 5D EC

loc_1D_AE2D:
    LDA $AEB8,Y                  ; $AE2D  B9 B8 AE
    STA $5A                      ; $AE30  85 5A
    LDA $AED6,Y                  ; $AE32  B9 D6 AE
    STA $00                      ; $AE35  85 00
    LDA $AEE5,Y                  ; $AE37  B9 E5 AE
    STA $01                      ; $AE3A  85 01
    JSR sub_1F_F2C4              ; $AE3C  20 C4 F2
    JMP ($0000)                  ; $AE3F  6C 00 00


loc_1D_AE42:
    LDA $0300,X                  ; $AE42  BD 00 03
    CMP #$B7                     ; $AE45  C9 B7
    BNE loc_1D_AE58              ; $AE47  D0 0F
    DEC $0480,X                  ; $AE49  DE 80 04
    LDA $0480,X                  ; $AE4C  BD 80 04
    BEQ loc_1D_AE8B              ; $AE4F  F0 3A
    CMP #$3C                     ; $AE51  C9 3C
    BCS loc_1D_AE58              ; $AE53  B0 03
    STA $05B8,X                  ; $AE55  9D B8 05

loc_1D_AE58:
    RTS                          ; $AE58  60

    LDA $0540,X                  ; $AE59  BD 40 05
    CMP #$04                     ; $AE5C  C9 04
    BNE loc_1D_AE58              ; $AE5E  D0 F8
    LDA $2F                      ; $AE60  A5 2F
    BMI loc_1D_AE58              ; $AE62  30 F4
    LDA $E6                      ; $AE64  A5 E6
    ADC $E7                      ; $AE66  65 E7
    ADC $00                      ; $AE68  65 00
    SBC $9D                      ; $AE6A  E5 9D
    STA $E6                      ; $AE6C  85 E6
    ADC $01                      ; $AE6E  65 01
    SBC $E5                      ; $AE70  E5 E5
    ADC $92                      ; $AE72  65 92
    STA $E7                      ; $AE74  85 E7
    STA $00                      ; $AE76  85 00
    LDA #$32                     ; $AE78  A9 32
    STA $01                      ; $AE7A  85 01
    JSR sub_1F_F207              ; $AE7C  20 07 F2
    LDY #$04                     ; $AE7F  A0 04
    LDA $03                      ; $AE81  A5 03

loc_1D_AE83:
    CMP $AF1B,Y                  ; $AE83  D9 1B AF
    BCC loc_1D_AE8E              ; $AE86  90 06
    DEY                          ; $AE88  88
    BPL loc_1D_AE83              ; $AE89  10 F8

loc_1D_AE8B:
    JMP sub_1F_F2C4              ; $AE8B  4C C4 F2


loc_1D_AE8E:
    LDA $AF20,Y                  ; $AE8E  B9 20 AF
    JSR sub_1F_EA98              ; $AE91  20 98 EA
    LDA #$00                     ; $AE94  A9 00
    STA $0408,X                  ; $AE96  9D 08 04
    STA $0420,X                  ; $AE99  9D 20 04
    LDA $AF25,Y                  ; $AE9C  B9 25 AF
    STA $0468,X                  ; $AE9F  9D 68 04
    LDA #$FF                     ; $AEA2  A9 FF
    STA $0480,X                  ; $AEA4  9D 80 04
    JSR sub_1F_EA1E              ; $AEA7  20 1E EA
    LDA #$B7                     ; $AEAA  A9 B7
    STA $0300,X                  ; $AEAC  9D 00 03
    LDA #$CC                     ; $AEAF  A9 CC
    STA $0588,X                  ; $AEB1  9D 88 05
    LDA #$AD                     ; $AEB4  A9 AD
    STA $05A0,X                  ; $AEB6  9D A0 05

loc_1D_AEB9:
    RTS                          ; $AEB9  60

    .byte $A5,$BD,$C9,$89,$F0,$F9,$E6,$BD,$D0,$F5,$A5,$BE,$C9,$89,$F0,$EF  ; $AEBA
    .byte $E6,$BE,$D0,$EB  ; $AECA
    LDA $BF                      ; $AECE  A5 BF
    CMP #$09                     ; $AED0  C9 09
    BEQ loc_1D_AEB9              ; $AED2  F0 E5
    INC $BF                      ; $AED4  E6 BF
    BNE loc_1D_AEB9              ; $AED6  D0 E1
    LDX #$00                     ; $AED8  A2 00
    BEQ loc_1D_AEE0              ; $AEDA  F0 04
    LDX $32                      ; $AEDC  A6 32
    BEQ loc_1D_AEFD              ; $AEDE  F0 1D

loc_1D_AEE0:
    LDA $B0,X                    ; $AEE0  B5 B0
    CMP #$9C                     ; $AEE2  C9 9C
    BEQ loc_1D_AEFD              ; $AEE4  F0 17
    INC $B0,X                    ; $AEE6  F6 B0
    TXA                          ; $AEE8  8A
    PHA                          ; $AEE9  48
    LDA #$26                     ; $AEEA  A9 26
    JSR sub_1F_EC5D              ; $AEEC  20 5D EC
    JSR sub_1F_F363              ; $AEEF  20 63 F3
    LDA #$03                     ; $AEF2  A9 03
    JSR sub_1F_FF24              ; $AEF4  20 24 FF
    PLA                          ; $AEF7  68
    TAX                          ; $AEF8  AA
    DEC $5A                      ; $AEF9  C6 5A
    BNE loc_1D_AEE0              ; $AEFB  D0 E3

loc_1D_AEFD:
    LDA #$01                     ; $AEFD  A9 01
    STA $95                      ; $AEFF  85 95
    LDA #$00                     ; $AF01  A9 00
    STA $5A                      ; $AF03  85 5A
    LDX $A6                      ; $AF05  A6 A6
    RTS                          ; $AF07  60

    .byte $BC,$58,$05,$B9,$39,$F2,$05,$6D,$85,$6D,$C9,$FF,$D0,$04,$A9,$9C  ; $AF08
    .byte $85,$BC,$60,$0E,$0A,$08,$03,$02,$77,$74,$75,$78,$76,$13,$23,$13  ; $AF18
    .byte $23,$23,$00,$00,$0A,$02,$0A,$02,$00,$00,$00,$00,$00,$00,$00,$00  ; $AF28
    .byte $00,$24,$24,$00,$00,$00,$00,$24,$24,$24,$24,$24,$24,$24,$24,$24  ; $AF38
    .byte $BA,$C4,$D8,$D8,$DC,$DC,$CE,$08,$08,$08,$08,$08,$08,$08,$08,$AE  ; $AF48
    .byte $AE,$AE,$AE,$AE,$AE,$AE,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF  ; $AF58
    JSR sub_1F_EA65              ; $AF66  20 65 EA
    LDA $0330,X                  ; $AF69  BD 30 03
    SEC                          ; $AF6C  38
    SBC $FC                      ; $AF6D  E5 FC
    STA $00                      ; $AF6F  85 00
    LDA $0348,X                  ; $AF71  BD 48 03
    SBC $F9                      ; $AF74  E5 F9
    BNE loc_1D_AFDB              ; $AF76  D0 63
    LDA $00                      ; $AF78  A5 00
    CMP #$18                     ; $AF7A  C9 18
    BCC loc_1D_AFDB              ; $AF7C  90 5D
    CMP #$F4                     ; $AF7E  C9 F4
    BCS loc_1D_AFDB              ; $AF80  B0 59
    LDY $26                      ; $AF82  A4 26
    LDA $B0E1,Y                  ; $AF84  B9 E1 B0
    BEQ loc_1D_AFDB              ; $AF87  F0 52
    CPY #$0B                     ; $AF89  C0 0B
    BNE loc_1D_AF93              ; $AF8B  D0 06
    LDA $FA                      ; $AF8D  A5 FA
    AND #$0F                     ; $AF8F  29 0F
    BNE loc_1D_AFDB              ; $AF91  D0 48

loc_1D_AF93:
    LDA $1C                      ; $AF93  A5 1C
    BNE loc_1D_AFDB              ; $AF95  D0 44
    LDY #$06                     ; $AF97  A0 06
    JSR sub_1E_C4A1              ; $AF99  20 A1 C4
    LDA $10                      ; $AF9C  A5 10
    CMP #$30                     ; $AF9E  C9 30
    BNE loc_1D_AFDB              ; $AFA0  D0 39
    LDA #$2B                     ; $AFA2  A9 2B
    JSR sub_1F_EC5D              ; $AFA4  20 5D EC
    JSR sub_1F_F2C4              ; $AFA7  20 C4 F2
    LDA #$42                     ; $AFAA  A9 42
    JSR sub_1F_EA98              ; $AFAC  20 98 EA
    LDA #$01                     ; $AFAF  A9 01
    STA $0300,X                  ; $AFB1  9D 00 03
    LDA $0330,X                  ; $AFB4  BD 30 03
    AND #$F0                     ; $AFB7  29 F0
    ORA #$08                     ; $AFB9  09 08
    STA $0330,X                  ; $AFBB  9D 30 03
    LDA $0378,X                  ; $AFBE  BD 78 03
    AND #$F0                     ; $AFC1  29 F0
    ORA #$08                     ; $AFC3  09 08
    STA $0378,X                  ; $AFC5  9D 78 03
    LDY $26                      ; $AFC8  A4 26
    LDA $B0E1,Y                  ; $AFCA  B9 E1 B0
    TAY                          ; $AFCD  A8
    LDA $B0F0,Y                  ; $AFCE  B9 F0 B0
    STA $00                      ; $AFD1  85 00
    LDA $B0F3,Y                  ; $AFD3  B9 F3 B0
    STA $01                      ; $AFD6  85 01
    JMP ($0000)                  ; $AFD8  6C 00 00


loc_1D_AFDB:
    RTS                          ; $AFDB  60

    .byte $A0,$30,$B9,$AD,$B0,$DD,$48,$03,$D0,$33,$B9,$AE,$B0,$C5,$22,$D0  ; $AFDC
    .byte $2C,$B9,$AF,$B0,$C5,$03,$D0,$25,$85,$10,$A6,$43,$9D,$C2,$06,$B9  ; $AFEC
    .byte $AD,$B0,$9D,$C0,$06,$B9,$AE,$B0,$9D,$C1,$06,$B9,$B0,$B0,$9D,$C3  ; $AFFC
    .byte $06,$E8,$E8,$E8,$E8,$86,$43,$A6,$A6,$A8,$4C,$DB,$D7,$88,$88,$88  ; $B00C
    .byte $88,$10,$BF,$60,$BD,$78,$03,$48,$A5,$11,$9D,$78,$03,$20,$A2,$D8  ; $B01C
    .byte $20,$C7,$D8,$A0,$00,$20,$DB,$D7,$68,$9D,$78,$03,$60,$BD,$78,$03  ; $B02C
    .byte $48,$A5,$11,$9D,$78,$03,$BD,$48,$03,$48,$A5,$13,$9D,$48,$03,$A8  ; $B03C
    .byte $A5,$11,$29,$F0,$05,$13,$85,$00,$B9,$18,$BA,$85,$01,$B9,$BB,$B9  ; $B04C
    .byte $A8,$B9,$BE,$B9,$C5,$00,$D0,$08,$B9,$BF,$B9,$DD,$30,$03,$F0,$07  ; $B05C
    .byte $C8,$C8,$C8,$E6,$01,$D0,$EA,$A5,$01,$29,$07,$A8,$B9,$B2,$F2,$85  ; $B06C
    .byte $00,$A5,$01,$48,$4A,$4A,$4A,$A8,$B9,$DC,$05,$05,$00,$99,$DC,$05  ; $B07C
    .byte $20,$A2,$D8,$20,$C7,$D8,$68,$A8,$B9,$1B,$BA,$A8,$20,$DB,$D7,$68  ; $B08C
    .byte $9D,$48,$03,$68,$9D,$78,$03,$A9,$00,$85,$95,$20,$22,$FF,$E6,$95  ; $B09C
    .byte $60,$05,$2F,$02,$00,$05,$2F,$03,$00,$05,$37,$00,$00,$05,$37,$01  ; $B0AC
    .byte $00,$0F,$1F,$01,$00,$0F,$1F,$03,$00,$0F,$27,$01,$00,$1A,$1F,$00  ; $B0BC
    .byte $00,$1A,$1F,$01,$00,$1A,$1F,$02,$00,$1A,$1F,$03,$00,$1A,$27,$00  ; $B0CC
    .byte $00,$1A,$27,$01,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00  ; $B0DC
    .byte $03,$02,$00,$00,$00,$DC,$20,$39,$AF,$B0,$B0,$A5,$FC,$18,$69,$80  ; $B0EC
    .byte $9D,$30,$03,$A5,$F9,$69,$00,$9D,$48,$03,$DE,$68,$04,$D0,$0D,$AD  ; $B0FC
    .byte $20,$06,$8D,$10,$06,$A9,$FF,$85,$18,$4C,$C4,$F2,$60,$A9,$00,$9D  ; $B10C
    .byte $70,$05,$BD,$68,$04,$F0,$0D,$DE,$68,$04,$D0,$F0,$BD,$28,$05,$49  ; $B11C
    .byte $40,$9D,$28,$05,$20,$E1,$E9,$20,$99,$E9,$BD,$90,$03,$F0,$03,$20  ; $B12C
    .byte $C4,$F2,$60  ; $B13C
    JSR sub_1F_EA03              ; $B13F  20 03 EA
    JSR sub_1F_E92A              ; $B142  20 2A E9
    LDA $46                      ; $B145  A5 46
    ORA $AF                      ; $B147  05 AF
    BNE loc_1D_B182              ; $B149  D0 37
    LDA $0378                    ; $B14B  AD 78 03
    SEC                          ; $B14E  38
    SBC $0378,X                  ; $B14F  FD 78 03
    BCC loc_1D_B158              ; $B152  90 04
    CMP #$28                     ; $B154  C9 28
    BCS loc_1D_B182              ; $B156  B0 2A

loc_1D_B158:
    LDY #$1B                     ; $B158  A0 1B
    JSR sub_1E_C4A1              ; $B15A  20 A1 C4
    LDA $10                      ; $B15D  A5 10
    AND #$10                     ; $B15F  29 10
    BNE loc_1D_B182              ; $B161  D0 1F
    LDY #$17                     ; $B163  A0 17
    JSR sub_1E_C4A1              ; $B165  20 A1 C4
    LDA $10                      ; $B168  A5 10
    AND #$10                     ; $B16A  29 10
    BNE loc_1D_B182              ; $B16C  D0 14
    LDA #$78                     ; $B16E  A9 78
    STA $0588,X                  ; $B170  9D 88 05
    LDA #$B1                     ; $B173  A9 B1
    STA $05A0,X                  ; $B175  9D A0 05
    LDY #$17                     ; $B178  A0 17
    JSR sub_1F_EA03              ; $B17A  20 03 EA
    JSR sub_1F_E747              ; $B17D  20 47 E7
    BCS loc_1D_B188              ; $B180  B0 06

loc_1D_B182:
    LDA #$00                     ; $B182  A9 00
    STA $0570,X                  ; $B184  9D 70 05

loc_1D_B187:
    RTS                          ; $B187  60


loc_1D_B188:
    LDA $0540,X                  ; $B188  BD 40 05
    CMP #$04                     ; $B18B  C9 04
    BNE loc_1D_B187              ; $B18D  D0 F8
    LDA #$99                     ; $B18F  A9 99
    JSR sub_1F_EA98              ; $B191  20 98 EA
    LDA #$05                     ; $B194  A9 05
    STA $ED                      ; $B196  85 ED
    LDA #$A2                     ; $B198  A9 A2
    STA $0588,X                  ; $B19A  9D 88 05
    LDA #$B1                     ; $B19D  A9 B1
    STA $05A0,X                  ; $B19F  9D A0 05
    LDA $30                      ; $B1A2  A5 30
    CMP #$02                     ; $B1A4  C9 02
    BCS loc_1D_B187              ; $B1A6  B0 DF
    JSR sub_1F_EF87              ; $B1A8  20 87 EF
    BCS loc_1D_B187              ; $B1AB  B0 DA
    JSR sub_1F_EC94              ; $B1AD  20 94 EC
    CMP #$07                     ; $B1B0  C9 07
    BCS loc_1D_B187              ; $B1B2  B0 D3
    LDA $0378,X                  ; $B1B4  BD 78 03
    SEC                          ; $B1B7  38
    SBC $0378                    ; $B1B8  ED 78 03
    BCC loc_1D_B187              ; $B1BB  90 CA
    CMP #$0C                     ; $B1BD  C9 0C
    BCC loc_1D_B187              ; $B1BF  90 C6
    LDA $0528,X                  ; $B1C1  BD 28 05
    ORA #$01                     ; $B1C4  09 01
    STA $0528,X                  ; $B1C6  9D 28 05
    LDA #$A9                     ; $B1C9  A9 A9
    STA $03D8,X                  ; $B1CB  9D D8 03
    LDA #$05                     ; $B1CE  A9 05
    STA $03F0,X                  ; $B1D0  9D F0 03
    LDA #$11                     ; $B1D3  A9 11
    STA $0408,X                  ; $B1D5  9D 08 04
    LDA #$E7                     ; $B1D8  A9 E7
    STA $0588,X                  ; $B1DA  9D 88 05
    LDA #$B1                     ; $B1DD  A9 B1
    STA $05A0,X                  ; $B1DF  9D A0 05
    LDA #$04                     ; $B1E2  A9 04
    JMP loc_1D_B5E8              ; $B1E4  4C E8 B5

    LDA #$9A                     ; $B1E7  A9 9A
    CMP $0558,X                  ; $B1E9  DD 58 05
    BEQ loc_1D_B1F1              ; $B1EC  F0 03
    JSR sub_1F_EA98              ; $B1EE  20 98 EA

loc_1D_B1F1:
    LDY #$17                     ; $B1F1  A0 17
    JSR sub_1F_E7B7              ; $B1F3  20 B7 E7
    BCC loc_1D_B238              ; $B1F6  90 40
    LDA #$00                     ; $B1F8  A9 00
    STA $03D8,X                  ; $B1FA  9D D8 03
    LDA #$08                     ; $B1FD  A9 08
    STA $03F0,X                  ; $B1FF  9D F0 03
    LDA #$22                     ; $B202  A9 22
    STA $0588,X                  ; $B204  9D 88 05
    LDA #$B2                     ; $B207  A9 B2
    STA $05A0,X                  ; $B209  9D A0 05
    LDA #$4E                     ; $B20C  A9 4E
    JSR sub_1F_EA98              ; $B20E  20 98 EA
    LDA #$46                     ; $B211  A9 46
    STA $ED                      ; $B213  85 ED
    LDA #$04                     ; $B215  A9 04
    STA $0540,X                  ; $B217  9D 40 05
    LDA $0528,X                  ; $B21A  BD 28 05
    AND #$FE                     ; $B21D  29 FE
    STA $0528,X                  ; $B21F  9D 28 05
    LDA $0540,X                  ; $B222  BD 40 05
    BNE loc_1D_B238              ; $B225  D0 11
    JSR sub_1F_EA03              ; $B227  20 03 EA
    JSR sub_1F_E94A              ; $B22A  20 4A E9
    LDA $0390,X                  ; $B22D  BD 90 03
    STA $0570,X                  ; $B230  9D 70 05
    BEQ loc_1D_B238              ; $B233  F0 03
    JSR sub_1F_F2C4              ; $B235  20 C4 F2

loc_1D_B238:
    RTS                          ; $B238  60

    .byte $20,$03,$EA,$20,$2A,$E9,$A5,$46,$05,$AF,$D0,$29,$AD,$78,$03,$38  ; $B239
    .byte $FD,$78,$03,$90,$04,$C9,$10,$B0,$1C,$A0,$17,$20,$A1,$C4,$A5,$10  ; $B249
    .byte $29,$10,$D0,$11,$BD,$78,$03,$C9,$D0,$B0,$0A,$A9,$74,$9D,$88,$05  ; $B259
    .byte $A9,$B2,$9D,$A0,$05,$A9,$00,$9D,$70,$05,$60,$BD,$40,$05,$C9,$04  ; $B269
    .byte $D0,$F8,$A9,$98,$20,$98,$EA,$A9,$04,$85,$ED,$A9,$96,$9D,$88,$05  ; $B279
    .byte $A9,$B2,$9D,$A0,$05,$BD,$28,$05,$09,$01,$9D,$28,$05,$AD,$C8,$04  ; $B289
    .byte $F0,$D8,$A9,$C1,$9D,$88,$05,$A9,$B2,$9D,$A0,$05,$BD,$20,$04,$8D  ; $B299
    .byte $20,$04,$BD,$28,$05,$29,$20,$85,$00,$AD,$28,$05,$29,$DF,$05,$00  ; $B2A9
    .byte $8D,$28,$05,$A9,$32,$9D,$68,$04,$DE,$68,$04,$D0,$0A,$A9,$32,$9D  ; $B2B9
    .byte $68,$04,$A9,$01,$20,$E8,$B5,$BD,$20,$04,$29,$03,$9D,$20,$04,$A0  ; $B2C9
    .byte $00,$AD,$C8,$04,$F0,$1F,$BD,$20,$04,$85,$39,$A5,$16,$29,$03,$F0  ; $B2D9
    .byte $07,$DD,$20,$04,$F0,$02,$A0,$02,$A5,$16,$29,$0C,$F0,$07,$1D,$20  ; $B2E9
    .byte $04,$9D,$20,$04,$C8,$B9,$4F,$B3,$9D,$A8,$03,$85,$3A,$B9,$53,$B3  ; $B2F9
    .byte $9D,$C0,$03,$85,$3B,$B9,$57,$B3,$9D,$D8,$03,$B9,$5B,$B3,$9D,$F0  ; $B309
    .byte $03,$A5,$BB,$C9,$80,$F0,$07,$A0,$1C,$20,$3F,$EA,$90,$11,$A5,$39  ; $B319
    .byte $F0,$0A,$AD,$F0,$03,$10,$05,$A0,$00,$20,$34,$EA,$4C,$F8,$B1,$A0  ; $B329
    .byte $17,$20,$52,$EA,$A9,$E8,$DD,$78,$03,$90,$07,$A9,$1C,$DD,$78,$03  ; $B339
    .byte $90,$03,$9D,$78,$03,$60,$4C,$33,$00,$B5,$01,$01,$01,$00,$00,$7F  ; $B349
    .byte $00,$B5,$00,$00,$00,$00,$A0,$13,$BD,$D8,$03,$9D,$80,$04,$BD,$F0  ; $B359
    .byte $03,$9D,$98,$04,$20,$B7,$E7,$90,$1C,$A0,$00,$BD,$80,$04,$38,$E9  ; $B369
    .byte $00,$BD,$98,$04,$E9,$FD,$B0,$01,$C8,$B9,$B0,$B3,$9D,$D8,$03,$B9  ; $B379
    .byte $B2,$B3,$9D,$F0,$03,$A0,$1A,$20,$3F,$EA,$90,$08,$BD,$20,$04,$49  ; $B389
    .byte $03,$9D,$20,$04,$DE,$68,$04,$D0,$0D,$20,$C4,$F2,$A9,$42,$20,$98  ; $B399
    .byte $EA,$A9,$C2,$9D,$00,$03,$60,$80,$80,$01,$02,$A0,$1A,$20,$3F,$EA  ; $B3A9
    .byte $90,$4F,$A9,$0F,$85,$5B,$A0,$03,$A9,$AD,$20,$A4,$EA,$A9,$73,$99  ; $B3B9
    .byte $00,$03,$A9,$00,$99,$08,$04,$A9,$0B,$99,$88,$05,$A9,$B4,$99,$A0  ; $B3C9
    .byte $05,$BD,$20,$04,$49,$03,$19,$3B,$B4,$99,$20,$04,$B9,$3E,$B4,$99  ; $B3D9
    .byte $A8,$03,$B9,$41,$B4,$99,$C0,$03,$B9,$44,$B4,$99,$D8,$03,$B9,$47  ; $B3E9
    .byte $B4,$99,$F0,$03,$A9,$00,$99,$08,$04,$A9,$78,$99,$68,$04,$88,$D0  ; $B3F9
    .byte $B7,$60,$A0,$1A,$20,$3F,$EA,$90,$08,$BD,$20,$04,$49,$03,$9D,$20  ; $B409
    .byte $04,$A0,$13,$20,$52,$EA,$90,$08,$BD,$20,$04,$49,$0C,$9D,$20,$04  ; $B419
    .byte $DE,$68,$04,$D0,$0D,$20,$C4,$F2,$A9,$01,$9D,$00,$03,$A9,$42,$20  ; $B429
    .byte $98,$EA,$60,$00,$08,$04,$00,$D4,$D4,$04,$02,$02,$00,$D4,$D4,$00  ; $B439
    .byte $02,$02,$A5,$16,$29,$0C,$F0,$0D,$9D,$20,$04,$A9,$5E,$9D,$88,$05  ; $B449
    .byte $A9,$B4,$9D,$A0,$05,$BD,$98,$04,$C9,$24,$D0,$0A,$A9,$00,$9D,$98  ; $B459
    .byte $04,$A9,$41,$20,$5D,$EC,$FE,$98,$04  ; $B469
    JSR sub_1F_EA65              ; $B472  20 65 EA
    JSR sub_1F_EA86              ; $B475  20 86 EA
    LDA $0390,X                  ; $B478  BD 90 03
    BEQ loc_1D_B480              ; $B47B  F0 03
    JSR sub_1F_F2C4              ; $B47D  20 C4 F2

loc_1D_B480:
    RTS                          ; $B480  60

    .byte $BD,$70,$05,$C9,$02,$D0,$24,$BC,$40,$05,$BD,$78,$03,$18,$79,$D6  ; $B481
    .byte $B4,$9D,$78,$03,$B9,$DC,$B4,$9D,$68,$04,$B9,$E2,$B4,$85,$5B,$BD  ; $B491
    .byte $80,$04,$F0,$07,$C0,$05,$D0,$03,$4C,$C4,$F2,$BD,$98,$04,$F0,$0D  ; $B4A1
    .byte $DE,$98,$04,$D0,$1F,$BD,$28,$05,$29,$FB,$9D,$28,$05,$BC,$68,$04  ; $B4B1
    .byte $20,$B7,$E7,$90,$0F,$A9,$00,$9D,$80,$04,$A0,$1A,$20,$3F,$EA,$90  ; $B4C1
    .byte $03,$FE,$80,$04,$60,$FC,$FC,$FC,$04,$04,$04,$23,$27,$1C,$27,$23  ; $B4D1
    .byte $13,$01,$01,$01,$01,$01,$01,$BD,$68,$04,$F0,$14,$DE,$68,$04,$D0  ; $B4E1
    .byte $29,$A9,$05,$9D,$68,$04,$A9,$01,$9D,$88,$05,$A9,$B5,$9D,$A0,$05  ; $B4F1
    .byte $BD,$A8,$03,$18,$69,$33,$9D,$A8,$03,$BD,$C0,$03,$69,$00,$9D,$C0  ; $B501
    .byte $03,$C9,$04,$D0,$05,$A9,$00,$9D,$A8,$03,$A9,$00,$85,$0F,$A0,$1E  ; $B511
    .byte $20,$3F,$EA,$90,$59,$FE,$40,$05,$A9,$60,$9D,$88,$05,$A9,$B5,$9D  ; $B521
    .byte $A0,$05,$A9,$78,$9D,$68,$04,$A5,$26,$C9,$0E,$D0,$0E,$BD,$78,$03  ; $B531
    .byte $9D,$98,$04,$A5,$FA,$9D,$C8,$04,$4C,$60,$B5,$BD,$78,$03,$18,$65  ; $B541
    .byte $FA,$9D,$98,$04,$B0,$04,$C9,$F0,$90,$05,$69,$0F,$9D,$98,$04,$A9  ; $B551
    .byte $FF,$85,$0F,$DE,$68,$04,$D0,$38,$20,$C4,$F2,$A9,$01,$9D,$00,$03  ; $B561
    .byte $A9,$42,$20,$98,$EA,$BD,$28,$05,$29,$FC,$9D,$28,$05,$60,$E4,$73  ; $B571
    .byte $D0,$1E,$DE,$68,$04,$D0,$0A,$A9,$05,$9D,$68,$04,$A9,$01,$20,$E8  ; $B581
    .byte $B5,$BD,$20,$04,$85,$39,$BD,$A8,$03,$85,$3A,$BD,$C0,$03,$85,$3B  ; $B591
    .byte $A9,$00,$9D,$70,$05,$A5,$0F,$F0,$3D,$A5,$46,$F0,$39,$A5,$26,$C9  ; $B5A1
    .byte $0E,$D0,$19,$A5,$FA,$38,$FD,$C8,$04,$18,$7D,$98,$04,$9D,$78,$03  ; $B5B1
    .byte $B0,$1A,$C9,$F0,$90,$20,$69,$0F,$9D,$78,$03,$60,$BD,$98,$04,$38  ; $B5C1
    .byte $E5,$FA,$9D,$78,$03,$B0,$05,$E9,$0F,$9D,$78,$03,$A4,$26,$D9,$FE  ; $B5D1
    .byte $B5,$90,$03,$20,$C4,$F2,$60  ; $B5E1

loc_1D_B5E8:
    STA $00                      ; $B5E8  85 00
    LDY $32                      ; $B5EA  A4 32
    LDA $00B0,Y                  ; $B5EC  B9 B0 00
    AND #$7F                     ; $B5EF  29 7F
    SEC                          ; $B5F1  38
    SBC $00                      ; $B5F2  E5 00
    BCS loc_1D_B5F8              ; $B5F4  B0 02
    LDA #$00                     ; $B5F6  A9 00

loc_1D_B5F8:
    ORA #$80                     ; $B5F8  09 80
    STA $00B0,Y                  ; $B5FA  99 B0 00
    RTS                          ; $B5FD  60

    .byte $F0,$F0,$F0,$C0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$C0,$D0,$F0,$F0,$F0  ; $B5FE
    .byte $BD,$40,$05,$C9,$02,$D0,$3F,$A9,$AB,$20,$98,$EA,$A9,$24,$9D,$88  ; $B60E
    .byte $05,$A9,$B6,$9D,$A0,$05,$A5,$14,$29,$40,$F0,$2A,$A9,$01,$9D,$20  ; $B61E
    .byte $04,$AD,$28,$05,$29,$20,$D0,$05,$A9,$02,$9D,$20,$04,$A9,$00,$9D  ; $B62E
    .byte $A8,$03,$A9,$03,$9D,$C0,$03,$A9,$6D,$9D,$88,$05,$A9,$B6,$9D,$A0  ; $B63E
    .byte $05,$A9,$02,$20,$E8,$B5,$AD,$30,$03,$9D,$30,$03,$AD,$48,$03,$9D  ; $B64E
    .byte $48,$03,$AD,$78,$03,$9D,$78,$03,$AD,$90,$03,$9D,$90,$03,$60,$BD  ; $B65E
    .byte $28,$05,$48,$20,$65,$EA,$68,$9D,$28,$05,$60,$BD,$80,$04,$D0,$2C  ; $B66E
    .byte $BC,$68,$04,$A9,$48,$20,$70,$F4,$DE,$68,$04,$BD,$68,$04,$29,$0F  ; $B67E
    .byte $9D,$68,$04,$29,$03,$D0,$03,$FE,$98,$04,$BD,$98,$04,$9D,$80,$04  ; $B68E
    .byte $C9,$08,$90,$08,$BD,$28,$05,$30,$03,$4C,$C4,$F2,$BD,$40,$05,$C9  ; $B69E
    .byte $03,$D0,$05,$A9,$00,$9D,$70,$05,$20,$65,$EA,$20,$86,$EA,$BD,$28  ; $B6AE
    .byte $05,$29,$DF,$9D,$28,$05,$DE,$80,$04,$60,$A5,$BC,$C9,$80,$F0,$63  ; $B6BE
    .byte $AD,$30,$03,$48,$AD,$48,$03,$48,$AD,$78,$03,$48,$AD,$78,$03,$38  ; $B6CE
    .byte $E9,$18,$B0,$02,$A9,$00,$8D,$78,$03,$A0,$00,$AD,$28,$05,$29,$20  ; $B6DE
    .byte $F0,$01,$C8,$AD,$30,$03,$18,$79,$2F,$B8,$8D,$30,$03,$AD,$48,$03  ; $B6EE
    .byte $79,$31,$B8,$8D,$48,$03,$20,$EE,$B7,$90,$08,$20,$5B,$ED,$A9,$40  ; $B6FE
    .byte $20,$70,$F4,$68,$8D,$78,$03,$68,$8D,$48,$03,$68,$8D,$30,$03,$20  ; $B70E
    .byte $65,$EA,$20,$86,$EA,$DE,$68,$04,$D0,$08,$A9,$0A,$9D,$68,$04,$20  ; $B71E
    .byte $83,$B7,$60,$20,$C4,$F2,$A9,$46,$9D,$00,$03,$A9,$C6,$9D,$A8,$03  ; $B72E
    .byte $9D,$D8,$03,$A9,$01,$9D,$C0,$03,$9D,$F0,$03,$BD,$30,$03,$38,$E5  ; $B73E
    .byte $FC,$A8,$A9,$09,$C0,$80,$B0,$02,$A9,$0A,$9D,$20,$04,$60,$BC,$68  ; $B74E
    .byte $04,$20,$5D,$ED,$A9,$40,$20,$70,$F4,$BC,$68,$04,$B9,$00,$03,$DD  ; $B75E
    .byte $80,$04,$D0,$06,$20,$65,$EA,$4C,$86,$EA,$A9,$C8,$9D,$88,$05,$A9  ; $B76E
    .byte $B6,$9D,$A0,$05,$60,$A0,$17,$A9,$FF,$85,$01,$A9,$00,$85,$02,$B9  ; $B77E
    .byte $00,$03,$F0,$26,$B9,$28,$05,$10,$21,$29,$04,$D0,$1D,$B9,$08,$04  ; $B78E
    .byte $29,$40,$F0,$16,$20,$AB,$EC,$85,$00,$20,$85,$EC,$C5,$00,$90,$02  ; $B79E
    .byte $A5,$00,$C5,$01,$B0,$04,$85,$01,$84,$02,$88,$C0,$07,$D0,$D0,$A5  ; $B7AE
    .byte $02,$F0,$2C,$9D,$68,$04,$A8,$B9,$00,$03,$9D,$80,$04,$B9,$30,$03  ; $B7BE
    .byte $9D,$98,$04,$B9,$78,$03,$9D,$C8,$04,$A9,$5C,$9D,$88,$05,$A9,$B7  ; $B7CE
    .byte $9D,$A0,$05,$20,$C4,$EC,$A8,$9D,$B0,$04,$A9,$40,$20,$70,$F4,$60  ; $B7DE
    .byte $20,$76,$EC,$C9,$04,$B0,$34,$20,$94,$EC,$C9,$04,$B0,$2D,$A9,$00  ; $B7EE
    .byte $9D,$20,$04,$AD,$30,$03,$9D,$30,$03,$AD,$48,$03,$9D,$48,$03,$AD  ; $B7FE
    .byte $78,$03,$9D,$78,$03,$A9,$9C,$DD,$58,$05,$F0,$03,$20,$98,$EA,$18  ; $B80E
    .byte $AD,$28,$05,$29,$20,$09,$80,$9D,$28,$05,$60,$A9,$0A,$9D,$68,$04  ; $B81E
    .byte $60,$10,$F0,$00,$FF  ; $B82E
    LDA $0528,X                  ; $B833  BD 28 05
    BPL loc_1D_B872              ; $B836  10 3A
    LDA $0318,X                  ; $B838  BD 18 03
    CLC                          ; $B83B  18
    ADC $03A8,X                  ; $B83C  7D A8 03
    STA $0318,X                  ; $B83F  9D 18 03
    LDA $0330,X                  ; $B842  BD 30 03
    ADC $03C0,X                  ; $B845  7D C0 03
    STA $0330,X                  ; $B848  9D 30 03
    LDA $0348,X                  ; $B84B  BD 48 03
    ADC $0468,X                  ; $B84E  7D 68 04
    STA $0348,X                  ; $B851  9D 48 03
    LDA $0360,X                  ; $B854  BD 60 03
    CLC                          ; $B857  18
    ADC $03D8,X                  ; $B858  7D D8 03
    STA $0360,X                  ; $B85B  9D 60 03
    LDA $0378,X                  ; $B85E  BD 78 03
    ADC $03F0,X                  ; $B861  7D F0 03
    STA $0378,X                  ; $B864  9D 78 03
    LDA $0390,X                  ; $B867  BD 90 03
    ADC $0480,X                  ; $B86A  7D 80 04
    STA $0390,X                  ; $B86D  9D 90 03
    BEQ loc_1D_B875              ; $B870  F0 03

loc_1D_B872:
    JSR sub_1F_F2C4              ; $B872  20 C4 F2

loc_1D_B875:
    RTS                          ; $B875  60

    .byte $A9,$80,$85,$1E,$85,$29,$A9,$04,$85,$23,$A9,$00,$8D,$DC,$05,$8D  ; $B876
    .byte $DD,$05,$8D,$DE,$05,$8D,$DF,$05,$A9,$98,$9D,$88,$05,$A9,$B8,$9D  ; $B886
    .byte $A0,$05,$A5,$1E,$D0,$D9,$8D,$60,$03,$E6,$46,$A9,$BF,$85,$9B,$A9  ; $B896
    .byte $02,$85,$99,$A9,$1D,$85,$25,$A9,$01,$85,$24,$A9,$BB,$9D,$88,$05  ; $B8A6
    .byte $A9,$B8,$9D,$A0,$05,$BD,$80,$04,$48,$20,$6E,$B9,$68,$DD,$80,$04  ; $B8B6
    .byte $F0,$AD,$A9,$40,$9D,$B0,$04,$9D,$D8,$03,$A9,$00,$9D,$F0,$03,$A9  ; $B8C6
    .byte $E4,$9D,$88,$05,$A9,$B8,$9D,$A0,$05,$A9,$2D,$9D,$C8,$04,$BD,$C8  ; $B8D6
    .byte $04,$F0,$0A,$DE,$C8,$04,$29,$02,$85,$FC,$4C,$6E,$B9,$BD,$B0,$04  ; $B8E6
    .byte $38,$FD,$D8,$03,$9D,$B0,$04,$A5,$FA,$FD,$F0,$03,$B0,$04,$E9,$0F  ; $B8F6
    .byte $E6,$FB,$85,$FA,$20,$E1,$E9,$A5,$FB,$DD,$98,$04,$90,$2E,$D0,$07  ; $B906
    .byte $BD,$80,$04,$C5,$FA,$90,$25,$BD,$80,$04,$85,$FA,$BD,$98,$04,$85  ; $B916
    .byte $FB,$A9,$BB,$9D,$88,$05,$A9,$B8,$9D,$A0,$05,$BD,$68,$04,$C9,$1D  ; $B926
    .byte $D0,$0A,$A9,$43,$9D,$88,$05,$A9,$B9,$9D,$A0,$05,$60,$A5,$25,$C9  ; $B936
    .byte $18,$B0,$F9,$A9,$03,$85,$24,$A9,$00,$85,$2B,$85,$2A,$85,$25,$85  ; $B946
    .byte $FB,$A9,$22,$85,$29,$A9,$01,$85,$28,$A9,$02,$85,$F9,$8D,$48,$03  ; $B956
    .byte $9D,$48,$03,$A9,$01,$4C,$B7,$FF,$BD,$68,$04,$48,$29,$07,$A8,$B9  ; $B966
    .byte $B2,$F2,$85,$00,$68,$4A,$4A,$4A,$A8,$B9,$DC,$05,$25,$00,$F0,$29  ; $B976
    .byte $BD,$68,$04,$0A,$7D,$68,$04,$FE,$68,$04,$A8,$B9,$C0,$B9,$29,$F0  ; $B986
    .byte $C5,$FA,$F0,$D4,$9D,$80,$04,$B9,$C0,$B9,$29,$0F,$9D,$98,$04,$C0  ; $B996
    .byte $2A,$D0,$C5,$20,$B0,$B9,$4C,$6E,$B9,$60,$A0,$1F,$A9,$00,$99,$80  ; $B9A6
    .byte $06,$88,$10,$FA,$60,$00,$24,$4E,$B0,$A8,$E1,$A0,$A8,$D1,$90,$A8  ; $B9B6
    .byte $B1,$70,$88,$B1,$70,$48,$A1,$60,$88,$A1,$60,$48,$91,$50,$88,$91  ; $B9C6
    .byte $50,$48,$71,$30,$C8,$61,$20,$C8,$51,$10,$C8,$31,$E1,$68,$21,$D1  ; $B9D6
    .byte $68,$11,$C1,$68,$01,$B1,$68,$E2,$A1,$68,$D2,$91,$68,$C2,$81,$68  ; $B9E6
    .byte $B2,$71,$68,$A2,$61,$68,$82,$41,$28,$72,$31,$28,$62,$21,$28,$52  ; $B9F6
    .byte $11,$28,$42,$01,$28,$32,$E2,$28,$22,$D2,$28,$12,$C2,$28,$02,$00  ; $BA06
    .byte $00,$00,$00,$0C,$1A,$65,$65,$6D,$65,$65,$65,$65,$6D,$6D,$65,$65  ; $BA16
    .byte $6D,$65,$65,$65,$65,$65,$65,$65,$65,$6D,$65,$65,$65,$65,$65,$65  ; $BA26
    .byte $65,$6D,$65,$65,$65,$BD,$68,$04,$D0,$2B,$DE,$98,$04,$D0,$03,$4C  ; $BA36
    .byte $C4,$F2,$DE,$80,$04,$BD,$80,$04,$29,$0F,$A8,$A9,$30,$20,$70,$F4  ; $BA46
    .byte $1E,$A8,$03,$3E,$C0,$03,$1E,$D8,$03,$3E,$F0,$03,$BC,$98,$04,$B9  ; $BA56
    .byte $75,$BA,$9D,$68,$04,$20,$65,$EA,$20,$86,$EA,$DE,$68,$04,$60,$03  ; $BA66
    .byte $03,$02,$02,$02,$02,$03,$03,$FE,$68,$04,$BD,$68,$04,$C9,$3C,$D0  ; $BA76
    .byte $6C,$A9,$9D,$9D,$88,$05,$A9,$BA,$9D,$A0,$05,$BC,$48,$03,$B9,$E3  ; $BA86
    .byte $BA,$9D,$80,$04,$9D,$98,$04,$BD,$68,$04,$D0,$4E,$A9,$3C,$9D,$68  ; $BA96
    .byte $04,$20,$6F,$F1,$B0,$2B,$A9,$39,$20,$5D,$EC,$A9,$B9,$20,$A4,$EA  ; $BAA6
    .byte $A9,$01,$99,$00,$03,$A9,$00,$99,$08,$04,$A9,$02,$99,$28,$05,$BD  ; $BAB6
    .byte $80,$04,$AA,$BD,$F6,$BA,$99,$30,$03,$BD,$F7,$BA,$99,$78,$03,$A6  ; $BAC6
    .byte $A6,$BC,$80,$04,$FE,$80,$04,$FE,$80,$04,$FE,$80,$04,$B9,$F8,$BA  ; $BAD6
    .byte $F0,$08,$10,$BD,$BD,$98,$04,$9D,$80,$04,$DE,$68,$04,$60,$00,$24  ; $BAE6
    .byte $38,$98,$01,$98,$B8,$00,$38,$68,$01,$78,$A8,$00,$48,$A8,$01,$98  ; $BAF6
    .byte $78,$00,$68,$A8,$01,$78,$68,$00,$38,$98,$01,$88,$88,$00,$58,$98  ; $BB06
    .byte $01,$68,$68,$FF,$58,$A8,$01,$68,$68,$00,$88,$A8,$01,$C8,$78,$00  ; $BB16
    .byte $78,$68,$01,$B8,$B8,$00,$58,$98,$01,$A8,$B8,$00,$88,$B8,$00,$88  ; $BB26
    .byte $78,$01,$A8,$B8,$FF,$BC,$68,$04,$B9,$78,$03,$18,$7D,$80,$04,$9D  ; $BB36
    .byte $78,$03,$B9,$30,$03,$9D,$30,$03,$60,$00,$00,$00,$00,$00,$00,$00  ; $BB46
    .byte $00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$08,$00,$00,$22,$08,$01  ; $BB56
    .byte $08,$10,$02,$00,$00,$10,$00,$21,$00,$09,$00,$00,$00,$40,$00,$00  ; $BB66
    .byte $00,$00,$00,$88,$00,$20,$08,$00,$80,$00,$00,$00,$00,$00,$00,$00  ; $BB76
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00  ; $BB86
    .byte $00,$00,$00,$00,$00,$01,$20,$00,$00,$00,$00,$00,$00,$00,$00,$20  ; $BB96
    .byte $00,$80,$08,$00,$00,$04,$88,$A0,$00,$40,$00,$00,$00,$00,$20,$00  ; $BBA6
    .byte $00,$00,$00,$00,$00,$01,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00  ; $BBB6
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BBC6
    .byte $00,$40,$00,$82,$00,$00,$00,$00,$00,$00,$08,$00,$00,$00,$00,$04  ; $BBD6
    .byte $00,$00,$00,$82,$00,$00,$00,$60,$20,$01,$80,$00,$00,$25,$00,$02  ; $BBE6
    .byte $00,$00,$00,$00,$00,$00,$08,$00,$00,$10,$00,$00,$00,$00,$00,$00  ; $BBF6
    .byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00  ; $BC06
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00  ; $BC16
    .byte $04,$01,$00,$00,$00,$00,$60,$00,$04,$00,$41,$01,$08,$00,$00,$10  ; $BC26
    .byte $01,$00,$00,$00,$00,$00,$00,$01,$20,$01,$00,$00,$00,$00,$00,$00  ; $BC36
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BC46
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80,$00,$00,$00,$01,$00  ; $BC56
    .byte $0A,$04,$18,$01,$A1,$00,$20,$00,$01,$00,$07,$00,$00,$00,$00,$44  ; $BC66
    .byte $08,$04,$20,$01,$08,$00,$08,$00,$02,$50,$00,$00,$00,$00,$00,$00  ; $BC76
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$00,$00,$00,$00  ; $BC86
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$10,$00,$00,$00  ; $BC96
    .byte $02,$14,$08,$00,$00,$00,$00,$00,$08,$01,$00,$00,$00,$00,$00,$00  ; $BCA6
    .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$40,$08,$00,$00,$01,$00,$00  ; $BCB6
    .byte $00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$10,$20,$00  ; $BCC6
    .byte $02,$00,$00,$00,$18,$00,$00,$00,$00,$00,$08,$10,$00,$00,$40,$00  ; $BCD6
    .byte $00,$00,$00,$01,$09,$40,$20,$00,$00,$00,$20,$00,$08,$00,$08,$00  ; $BCE6
    .byte $80,$00,$11,$01,$15,$01,$00,$00,$20,$10,$00,$00,$00,$00,$00,$00  ; $BCF6
    .byte $00,$00,$00,$00,$00,$00,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BD06
    .byte $00,$00,$00,$00,$01,$00,$01,$00,$02,$00,$00,$00,$00,$00,$02,$00  ; $BD16
    .byte $00,$01,$02,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$20,$41  ; $BD26
    .byte $81,$04,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$40,$00  ; $BD36
    .byte $00,$04,$00,$00,$00,$00,$02,$01,$00,$00,$04,$00,$00,$00,$00,$00  ; $BD46
    .byte $04,$00,$00,$00,$08,$00,$00,$00,$00,$01,$08,$00,$00,$00,$00,$10  ; $BD56
    .byte $04,$00,$00,$00,$00,$00,$90,$40,$00,$40,$20,$00,$00,$00,$00,$00  ; $BD66
    .byte $00,$10,$C0,$00,$00,$00,$00,$00,$04,$01,$00,$00,$00,$00,$00,$00  ; $BD76
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00  ; $BD86
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$12,$00,$00,$10,$00,$00  ; $BD96
    .byte $80,$00,$00,$00,$C0,$40,$00,$00,$04,$10,$20,$10,$20,$14,$A0,$00  ; $BDA6
    .byte $08,$00,$40,$00,$10,$00,$02,$01,$82,$40,$00,$00,$00,$00,$00,$00  ; $BDB6
    .byte $00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00  ; $BDC6
    .byte $00,$00,$00,$00,$20,$00,$00,$00,$20,$00,$08,$00,$00,$00,$00,$00  ; $BDD6
    .byte $0A,$00,$A0,$00,$00,$10,$0E,$00,$00,$04,$00,$00,$08,$01,$00,$00  ; $BDE6
    .byte $20,$00,$00,$00,$00,$04,$18,$01,$48,$51,$00,$00,$00,$00,$00,$00  ; $BDF6
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BE06
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$0A,$00,$00,$00  ; $BE16
    .byte $80,$00,$00,$00,$00,$00,$20,$00,$00,$04,$00,$10,$00,$00,$00,$00  ; $BE26
    .byte $00,$00,$00,$10,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00  ; $BE36
    .byte $00,$00,$00,$00,$80,$00,$00,$40,$00,$00,$00,$00,$00,$00,$00,$00  ; $BE46
    .byte $00,$00,$00,$00,$00,$00,$04,$00,$01,$00,$00,$00,$00,$00,$00,$00  ; $BE56
    .byte $01,$10,$01,$00,$81,$14,$00,$00,$10,$00,$84,$05,$84,$00,$88,$00  ; $BE66
    .byte $20,$00,$40,$00,$01,$00,$80,$11,$00,$01,$00,$00,$00,$00,$00,$00  ; $BE76
    .byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00  ; $BE86
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$04  ; $BE96
    .byte $00,$00,$40,$40,$80,$00,$00,$00,$00,$00,$40,$04,$40,$01,$42,$00  ; $BEA6
    .byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00  ; $BEB6
    .byte $00,$00,$00,$01,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00  ; $BEC6
    .byte $40,$40,$00,$00,$01,$00,$00,$04,$00,$00,$00,$00,$00,$04,$00,$00  ; $BED6
    .byte $00,$00,$00,$00,$40,$00,$82,$00,$80,$00,$11,$40,$49,$00,$00,$00  ; $BEE6
    .byte $40,$04,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$20,$01,$00,$00  ; $BEF6
    .byte $00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00  ; $BF06
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00  ; $BF16
    .byte $00,$00,$00,$00,$00,$00,$40,$04,$01,$04,$00,$00,$01,$00,$01,$00  ; $BF26
    .byte $00,$00,$00,$04,$00,$00,$00,$00,$00,$11,$00,$00,$04,$00,$00,$00  ; $BF36
    .byte $00,$00,$80,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00  ; $BF46
    .byte $00,$00,$08,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$E0,$04  ; $BF56
    .byte $00,$00,$01,$01,$04,$00,$01,$01,$08,$00,$00,$00,$00,$04,$04,$00  ; $BF66
    .byte $21,$00,$00,$00,$41,$00,$02,$00,$00,$40,$00,$00,$00,$00,$00,$00  ; $BF76
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00  ; $BF86
    .byte $80,$00,$00,$00,$00,$00,$40,$00,$00,$10,$04,$00,$00,$00,$00,$00  ; $BF96
    .byte $80,$00,$40,$00,$80,$00,$20,$00,$00,$00,$00,$00,$00,$10,$10,$00  ; $BFA6
    .byte $44,$00,$40,$00,$00,$00,$00,$00,$01,$15,$00,$00,$00,$00,$00,$00  ; $BFB6
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$04,$00,$00,$00  ; $BFC6
    .byte $40,$00,$00,$10,$80,$04,$C0,$00,$04,$01,$2D,$00,$00,$04,$08,$00  ; $BFD6
    .byte $00,$00,$01,$00,$80,$00,$00,$01,$21,$00,$00,$14,$00,$00,$09,$00  ; $BFE6
    .byte $00,$00,$40,$00,$00,$00,$00,$00,$04,$00  ; $BFF6
