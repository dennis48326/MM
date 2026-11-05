; PRG 8 KB bank $3F at $E000
.segment "BANK3F"
.org $E000

    .byte $05,$8D,$C8,$05,$60  ; $E000

sub_3F_E005:
    TXA                          ; $E005  8A
    PHA                          ; $E006  48
    JSR sub_3F_E1DD              ; $E007  20 DD E1
    JSR sub_3E_CF4A              ; $E00A  20 4A CF
    PLA                          ; $E00D  68
    TAX                          ; $E00E  AA
    JMP sub_3E_C62B              ; $E00F  4C 2B C6

    .byte $AD,$B7,$03,$29,$FE,$8D,$B7,$03,$60,$AD,$B7,$03,$09,$01,$8D,$B7  ; $E012
    .byte $03,$60,$20,$12,$E0,$A2,$00,$A0,$06,$20,$22,$E5,$A2,$08,$20,$05  ; $E022
    .byte $E0,$CA,$D0,$FA,$60  ; $E032

loc_3F_E037:
    LDA #$2A                     ; $E037  A9 2A
    JSR sub_3E_CAA4              ; $E039  20 A4 CA
    LDA $03B7                    ; $E03C  AD B7 03
    AND #$DF                     ; $E03F  29 DF
    ORA #$40                     ; $E041  09 40
    STA $03B7                    ; $E043  8D B7 03
    LDA #$01                     ; $E046  A9 01
    STA $03CE                    ; $E048  8D CE 03
    LDA #$00                     ; $E04B  A9 00
    TAX                          ; $E04D  AA
    STA $05C8                    ; $E04E  8D C8 05
    STA $05B1                    ; $E051  8D B1 05
    STA $98                      ; $E054  85 98
    STA $060D                    ; $E056  8D 0D 06
    LDY #$66                     ; $E059  A0 66
    JSR sub_3F_E522              ; $E05B  20 22 E5
    LDA #$04                     ; $E05E  A9 04
    STA $0624                    ; $E060  8D 24 06

loc_3F_E063:
    JSR sub_3F_E005              ; $E063  20 05 E0
    LDA #$00                     ; $E066  A9 00
    STA $ED                      ; $E068  85 ED
    STA $EB                      ; $E06A  85 EB
    LDX #$00                     ; $E06C  A2 00
    LDY #$02                     ; $E06E  A0 02
    JSR sub_3F_EE9A              ; $E070  20 9A EE
    LDA $EE                      ; $E073  A5 EE
    CMP #$08                     ; $E075  C9 08
    BCC loc_3F_E07D              ; $E077  90 04
    LDA #$07                     ; $E079  A9 07
    STA $EE                      ; $E07B  85 EE

loc_3F_E07D:
    JSR sub_3F_E4D3              ; $E07D  20 D3 E4
    LDA $04CB                    ; $E080  AD CB 04
    CMP #$20                     ; $E083  C9 20
    BCC loc_3F_E063              ; $E085  90 DC
    LDA $0486                    ; $E087  AD 86 04
    CMP #$80                     ; $E08A  C9 80
    BNE loc_3F_E095              ; $E08C  D0 07
    LDA $04CB                    ; $E08E  AD CB 04
    CMP #$70                     ; $E091  C9 70
    BCC loc_3F_E063              ; $E093  90 CE

loc_3F_E095:
    LDA #$00                     ; $E095  A9 00
    STA $00                      ; $E097  85 00
    STA $11                      ; $E099  85 11
    LDA #$0B                     ; $E09B  A9 0B
    STA $01                      ; $E09D  85 01
    JSR sub_3E_D9CF              ; $E09F  20 CF D9
    LDA $11                      ; $E0A2  A5 11
    STA $064B                    ; $E0A4  8D 4B 06
    AND #$01                     ; $E0A7  29 01
    BEQ loc_3F_E063              ; $E0A9  F0 B8
    LDA #$37                     ; $E0AB  A9 37
    STA $DC                      ; $E0AD  85 DC
    JSR sub_3E_DB6D              ; $E0AF  20 6D DB
    LDA #$00                     ; $E0B2  A9 00
    STA $EB                      ; $E0B4  85 EB
    STA $ED                      ; $E0B6  85 ED
    JSR sub_3F_E4D3              ; $E0B8  20 D3 E4
    LDX #$00                     ; $E0BB  A2 00
    LDY #$05                     ; $E0BD  A0 05
    JSR sub_3F_E522              ; $E0BF  20 22 E5
    LDA #$08                     ; $E0C2  A9 08
    STA $05B1                    ; $E0C4  8D B1 05

loc_3F_E0C7:
    JSR sub_3F_E005              ; $E0C7  20 05 E0
    DEC $05B1                    ; $E0CA  CE B1 05
    BNE loc_3F_E0C7              ; $E0CD  D0 F8
    LDY #$04                     ; $E0CF  A0 04
    JSR sub_3E_CB28              ; $E0D1  20 28 CB
    EOR ($60,X)                  ; $E0D4  41 60
    LDX #$03                     ; $E0D6  A2 03
    BNE loc_3F_E0ED              ; $E0D8  D0 13
    LDX #$0F                     ; $E0DA  A2 0F
    BNE loc_3F_E0ED              ; $E0DC  D0 0F
    LDX #$1F                     ; $E0DE  A2 1F
    JSR sub_3E_CA71              ; $E0E0  20 71 CA
    LDX #$0B                     ; $E0E3  A2 0B
    JSR sub_3E_CA71              ; $E0E5  20 71 CA
    LDX #$07                     ; $E0E8  A2 07
    JSR sub_3E_CA71              ; $E0EA  20 71 CA

loc_3F_E0ED:
    JSR sub_3E_CA71              ; $E0ED  20 71 CA
    LDA #$05                     ; $E0F0  A9 05
    JSR sub_3E_C5F6              ; $E0F2  20 F6 C5
    LDA $49                      ; $E0F5  A5 49
    SEC                          ; $E0F7  38
    SBC #$10                     ; $E0F8  E9 10
    STA $49                      ; $E0FA  85 49
    RTS                          ; $E0FC  60


sub_3F_E0FD:
    STA $94                      ; $E0FD  85 94
    ORA $98                      ; $E0FF  05 98
    LDY $9B                      ; $E101  A4 9B
    CLC                          ; $E103  18
    ADC $E111,Y                  ; $E104  79 11 E1
    TAY                          ; $E107  A8
    LDA $E114,Y                  ; $E108  B9 14 E1
    TAY                          ; $E10B  A8
    LDX #$00                     ; $E10C  A2 00
    JMP sub_3F_E522              ; $E10E  4C 22 E5

    .byte $00,$08,$10,$00,$01,$02,$03,$04,$0E,$07,$07,$1B,$1C,$1D,$FF,$20  ; $E111
    .byte $21,$25,$23,$29,$2A,$2B,$FF,$2D,$2E,$32,$32,$18,$18,$0C,$FF,$0F  ; $E121
    .byte $0F,$08,$08,$1F,$1F,$1E,$FF,$2F,$2F,$26,$67,$34,$34,$34,$FF,$22  ; $E131
    .byte $22,$33,$33,$A9,$00,$85,$11,$85,$00,$85,$01,$20,$CD,$D9,$A5,$13  ; $E141
    .byte $29,$FC,$85,$80,$BD,$86,$04,$29,$E0,$85,$4D,$18,$69,$10,$9D,$86  ; $E151
    .byte $04,$BD,$CB,$04,$38,$ED,$7B,$06,$29,$E0,$85,$4E,$18,$69,$10,$6D  ; $E161
    .byte $7B,$06,$9D,$CB,$04,$20,$AB,$D8,$20,$94,$DB,$20,$2E,$D9,$E6,$6B  ; $E171
    .byte $E6,$6B,$E6,$5C,$E6,$5C,$20,$94,$DB,$20,$2E,$D9,$C6,$6B,$A5,$5C  ; $E181
    .byte $18,$69,$3E,$85,$5C,$20,$94,$DB,$20,$2E,$D9,$E6,$6B,$E6,$6B,$E6  ; $E191
    .byte $5C,$E6,$5C,$20,$94,$DB,$20,$2E,$D9,$20,$2B,$C6,$A5,$47,$D0,$F9  ; $E1A1
    .byte $60,$00,$04,$08,$0C,$00,$00,$00,$01,$01,$01,$01,$02,$02,$02,$02  ; $E1B1
    .byte $03,$03,$03,$03,$00,$01,$80,$97,$5D,$E6,$73,$00,$04,$04,$0C,$04  ; $E1C1
    .byte $08,$06,$0A,$04,$FF,$02,$0E,$04,$04,$04,$04,$04  ; $E1D1

sub_3F_E1DD:
    LDA #$00                     ; $E1DD  A9 00
    STA $8C                      ; $E1DF  85 8C

sub_3F_E1E1:
    TXA                          ; $E1E1  8A
    PHA                          ; $E1E2  48
    JSR sub_3E_CC20              ; $E1E3  20 20 CC
    LDX #$16                     ; $E1E6  A2 16
    LDA $F3                      ; $E1E8  A5 F3
    LSR A                        ; $E1EA  4A
    BCC loc_3F_E1F6              ; $E1EB  90 09

loc_3F_E1ED:
    TXA                          ; $E1ED  8A
    STA $07D9,X                  ; $E1EE  9D D9 07
    DEX                          ; $E1F1  CA
    BPL loc_3F_E1ED              ; $E1F2  10 F9
    BMI loc_3F_E200              ; $E1F4  30 0A

loc_3F_E1F6:
    LDY #$00                     ; $E1F6  A0 00

loc_3F_E1F8:
    TYA                          ; $E1F8  98
    STA $07D9,X                  ; $E1F9  9D D9 07
    INY                          ; $E1FC  C8
    DEX                          ; $E1FD  CA
    BPL loc_3F_E1F8              ; $E1FE  10 F8

loc_3F_E200:
    LDA #$3E                     ; $E200  A9 3E
    JSR sub_3E_CB91              ; $E202  20 91 CB
    LDY #$16                     ; $E205  A0 16
    STY $06                      ; $E207  84 06

loc_3F_E209:
    LDY $06                      ; $E209  A4 06
    LDX $07D9,Y                  ; $E20B  BE D9 07
    LDA $03A0,X                  ; $E20E  BD A0 03
    BEQ loc_3F_E269              ; $E211  F0 56
    LDA $03B7,X                  ; $E213  BD B7 03
    AND #$02                     ; $E216  29 02
    BNE loc_3F_E269              ; $E218  D0 4F
    LDA $0458,X                  ; $E21A  BD 58 04
    TAY                          ; $E21D  A8
    JSR sub_3E_CBC0              ; $E21E  20 C0 CB
    DEC $0555,X                  ; $E221  DE 55 05
    BNE loc_3F_E24B              ; $E224  D0 25
    INC $0510,X                  ; $E226  FE 10 05
    INC $0510,X                  ; $E229  FE 10 05
    LDA $0510,X                  ; $E22C  BD 10 05
    CMP $04F9,X                  ; $E22F  DD F9 04
    BCC loc_3F_E239              ; $E232  90 05
    LDA #$00                     ; $E234  A9 00
    STA $0510,X                  ; $E236  9D 10 05

loc_3F_E239:
    TAY                          ; $E239  A8
    INY                          ; $E23A  C8
    INY                          ; $E23B  C8
    LDA $053E,X                  ; $E23C  BD 3E 05
    STA $08                      ; $E23F  85 08
    LDA $0527,X                  ; $E241  BD 27 05
    STA $09                      ; $E244  85 09
    LDA ($08),Y                  ; $E246  B1 08
    STA $0555,X                  ; $E248  9D 55 05

loc_3F_E24B:
    LDA $03B7,X                  ; $E24B  BD B7 03
    AND #$01                     ; $E24E  29 01
    BNE loc_3F_E269              ; $E250  D0 17
    LDA $04B4,X                  ; $E252  BD B4 04
    BNE loc_3F_E269              ; $E255  D0 12
    LDA $0486,X                  ; $E257  BD 86 04
    SEC                          ; $E25A  38
    SBC $F7                      ; $E25B  E5 F7
    CMP #$04                     ; $E25D  C9 04
    BCC loc_3F_E269              ; $E25F  90 08
    STA $00                      ; $E261  85 00
    JSR sub_3F_E2A9              ; $E263  20 A9 E2
    TXA                          ; $E266  8A
    BEQ loc_3F_E283              ; $E267  F0 1A

loc_3F_E269:
    DEC $06                      ; $E269  C6 06
    BPL loc_3F_E209              ; $E26B  10 9C
    LDX $8C                      ; $E26D  A6 8C
    LDA #$F0                     ; $E26F  A9 F0

loc_3F_E271:
    STA $0200,X                  ; $E271  9D 00 02
    INX                          ; $E274  E8
    INX                          ; $E275  E8
    INX                          ; $E276  E8
    INX                          ; $E277  E8
    BNE loc_3F_E271              ; $E278  D0 F7
    JSR sub_3E_CBE9              ; $E27A  20 E9 CB
    JSR sub_3E_CC3A              ; $E27D  20 3A CC
    PLA                          ; $E280  68
    TAX                          ; $E281  AA
    RTS                          ; $E282  60


loc_3F_E283:
    JSR sub_3E_CBE9              ; $E283  20 E9 CB
    JSR sub_3E_CC3A              ; $E286  20 3A CC
    INC $8C                      ; $E289  E6 8C
    PLA                          ; $E28B  68
    TAX                          ; $E28C  AA
    RTS                          ; $E28D  60

    .byte $00,$10,$20,$30,$40,$50,$60,$70,$80,$90,$A0,$B0,$C0,$D0,$E0,$F0  ; $E28E
    .byte $1C,$53,$91,$D0,$E3,$E3,$E3,$E3,$A6,$8C,$60  ; $E29E

sub_3F_E2A9:
    LDA $04CB,X                  ; $E2A9  BD CB 04
    SEC                          ; $E2AC  38
    SBC $F9                      ; $E2AD  E5 F9
    STA $01                      ; $E2AF  85 01
    LDA $03B7,X                  ; $E2B1  BD B7 03
    AND #$E0                     ; $E2B4  29 E0
    STA $8D                      ; $E2B6  85 8D
    ASL A                        ; $E2B8  0A
    ROL A                        ; $E2B9  2A
    ROL A                        ; $E2BA  2A
    AND #$03                     ; $E2BB  29 03
    TAY                          ; $E2BD  A8
    LDA $E29E,Y                  ; $E2BE  B9 9E E2
    STA $08                      ; $E2C1  85 08
    LDA $E2A2,Y                  ; $E2C3  B9 A2 E2
    STA $09                      ; $E2C6  85 09
    LDY #$00                     ; $E2C8  A0 00
    LDA $053E,X                  ; $E2CA  BD 3E 05
    STA $0A                      ; $E2CD  85 0A
    LDA $0527,X                  ; $E2CF  BD 27 05
    STA $0B                      ; $E2D2  85 0B
    LDA ($0A),Y                  ; $E2D4  B1 0A
    ASL A                        ; $E2D6  0A
    LDY $0510,X                  ; $E2D7  BC 10 05
    INY                          ; $E2DA  C8
    LDA ($0A),Y                  ; $E2DB  B1 0A
    TAY                          ; $E2DD  A8
    LDA $8000,Y                  ; $E2DE  B9 00 80
    STA $0C                      ; $E2E1  85 0C
    LDA $8200,Y                  ; $E2E3  B9 00 82
    STA $0D                      ; $E2E6  85 0D
    BCC loc_3F_E2F4              ; $E2E8  90 0A
    LDA $8100,Y                  ; $E2EA  B9 00 81
    STA $0C                      ; $E2ED  85 0C
    LDA $8300,Y                  ; $E2EF  B9 00 83
    STA $0D                      ; $E2F2  85 0D

loc_3F_E2F4:
    LDY #$00                     ; $E2F4  A0 00
    LDA ($0C),Y                  ; $E2F6  B1 0C
    STA $02                      ; $E2F8  85 02
    INY                          ; $E2FA  C8
    LDA ($0C),Y                  ; $E2FB  B1 0C
    TAY                          ; $E2FD  A8
    LDA $8400,Y                  ; $E2FE  B9 00 84
    STA $0E                      ; $E301  85 0E
    LDA $8500,Y                  ; $E303  B9 00 85
    STA $0F                      ; $E306  85 0F
    CLC                          ; $E308  18
    LDA $0C                      ; $E309  A5 0C
    ADC #$02                     ; $E30B  69 02
    STA $0C                      ; $E30D  85 0C
    LDA $0D                      ; $E30F  A5 0D
    ADC #$00                     ; $E311  69 00
    STA $0D                      ; $E313  85 0D
    LDX $8C                      ; $E315  A6 8C
    LDY #$00                     ; $E317  A0 00
    JMP ($0008)                  ; $E319  6C 08 00


loc_3F_E31C:
    LDA ($0C),Y                  ; $E31C  B1 0C
    STA $0201,X                  ; $E31E  9D 01 02
    LDA ($0E),Y                  ; $E321  B1 0E
    CLC                          ; $E323  18
    ADC $01                      ; $E324  65 01
    STA $0200,X                  ; $E326  9D 00 02
    ROR A                        ; $E329  6A
    EOR ($0E),Y                  ; $E32A  51 0E
    PHP                          ; $E32C  08
    INY                          ; $E32D  C8
    PLP                          ; $E32E  28
    BMI loc_3F_E34B              ; $E32F  30 1A
    LDA ($0E),Y                  ; $E331  B1 0E
    CLC                          ; $E333  18
    ADC $00                      ; $E334  65 00
    STA $0203,X                  ; $E336  9D 03 02
    ROR A                        ; $E339  6A
    EOR ($0E),Y                  ; $E33A  51 0E
    BMI loc_3F_E34B              ; $E33C  30 0D
    LDA ($0C),Y                  ; $E33E  B1 0C
    ORA $8D                      ; $E340  05 8D
    STA $0202,X                  ; $E342  9D 02 02
    INX                          ; $E345  E8
    INX                          ; $E346  E8
    INX                          ; $E347  E8
    INX                          ; $E348  E8
    BEQ loc_3F_E350              ; $E349  F0 05

loc_3F_E34B:
    INY                          ; $E34B  C8
    DEC $02                      ; $E34C  C6 02
    BPL loc_3F_E31C              ; $E34E  10 CC

loc_3F_E350:
    STX $8C                      ; $E350  86 8C
    RTS                          ; $E352  60

    LDA $00                      ; $E353  A5 00
    SEC                          ; $E355  38
    SBC #$08                     ; $E356  E9 08
    STA $00                      ; $E358  85 00
    BCC loc_3F_E390              ; $E35A  90 34

loc_3F_E35C:
    LDA ($0C),Y                  ; $E35C  B1 0C
    STA $0201,X                  ; $E35E  9D 01 02
    LDA ($0E),Y                  ; $E361  B1 0E
    CLC                          ; $E363  18
    ADC $01                      ; $E364  65 01
    STA $0200,X                  ; $E366  9D 00 02
    ROR A                        ; $E369  6A
    EOR ($0E),Y                  ; $E36A  51 0E
    INY                          ; $E36C  C8
    BMI loc_3F_E389              ; $E36D  30 1A
    LDA $00                      ; $E36F  A5 00
    SEC                          ; $E371  38
    SBC ($0E),Y                  ; $E372  F1 0E
    STA $0203,X                  ; $E374  9D 03 02
    ROR A                        ; $E377  6A
    EOR ($0E),Y                  ; $E378  51 0E
    BPL loc_3F_E389              ; $E37A  10 0D
    LDA ($0C),Y                  ; $E37C  B1 0C
    EOR $8D                      ; $E37E  45 8D
    STA $0202,X                  ; $E380  9D 02 02
    INX                          ; $E383  E8
    INX                          ; $E384  E8
    INX                          ; $E385  E8
    INX                          ; $E386  E8
    BEQ loc_3F_E38E              ; $E387  F0 05

loc_3F_E389:
    INY                          ; $E389  C8
    DEC $02                      ; $E38A  C6 02
    BPL loc_3F_E35C              ; $E38C  10 CE

loc_3F_E38E:
    STX $8C                      ; $E38E  86 8C

loc_3F_E390:
    RTS                          ; $E390  60

    .byte $A5,$01,$38,$E9,$08,$85,$01,$90,$35,$B1,$0C,$9D,$01,$02,$A5,$01  ; $E391
    .byte $38,$F1,$0E,$9D,$00,$02,$6A,$51,$0E,$0A,$C8,$90,$1A,$A5,$00,$18  ; $E3A1
    .byte $71,$0E,$9D,$03,$02,$6A,$51,$0E,$30,$0D,$B1,$0C,$45,$8D,$9D,$02  ; $E3B1
    .byte $02,$E8,$E8,$E8,$E8,$F0,$05,$C8,$C6,$02,$10,$CD,$86,$8C,$60  ; $E3C1
    LDA $00                      ; $E3D0  A5 00
    SEC                          ; $E3D2  38
    SBC #$08                     ; $E3D3  E9 08
    STA $00                      ; $E3D5  85 00
    BCC loc_3F_E417              ; $E3D7  90 3E
    LDA $01                      ; $E3D9  A5 01
    SEC                          ; $E3DB  38
    SBC #$08                     ; $E3DC  E9 08
    STA $01                      ; $E3DE  85 01
    BCC loc_3F_E417              ; $E3E0  90 35

loc_3F_E3E2:
    LDA ($0C),Y                  ; $E3E2  B1 0C
    STA $0201,X                  ; $E3E4  9D 01 02
    LDA $01                      ; $E3E7  A5 01
    SEC                          ; $E3E9  38
    SBC ($0E),Y                  ; $E3EA  F1 0E
    STA $0200,X                  ; $E3EC  9D 00 02
    ROR A                        ; $E3EF  6A
    EOR ($0E),Y                  ; $E3F0  51 0E
    ASL A                        ; $E3F2  0A
    INY                          ; $E3F3  C8
    BCC loc_3F_E410              ; $E3F4  90 1A
    LDA $00                      ; $E3F6  A5 00
    SEC                          ; $E3F8  38
    SBC ($0E),Y                  ; $E3F9  F1 0E
    STA $0203,X                  ; $E3FB  9D 03 02
    ROR A                        ; $E3FE  6A
    EOR ($0E),Y                  ; $E3FF  51 0E
    BPL loc_3F_E410              ; $E401  10 0D
    LDA ($0C),Y                  ; $E403  B1 0C
    EOR $8D                      ; $E405  45 8D
    STA $0202,X                  ; $E407  9D 02 02
    INX                          ; $E40A  E8
    INX                          ; $E40B  E8
    INX                          ; $E40C  E8
    INX                          ; $E40D  E8
    BEQ loc_3F_E415              ; $E40E  F0 05

loc_3F_E410:
    INY                          ; $E410  C8
    DEC $02                      ; $E411  C6 02
    BPL loc_3F_E3E2              ; $E413  10 CD

loc_3F_E415:
    STX $8C                      ; $E415  86 8C

loc_3F_E417:
    RTS                          ; $E417  60

    .byte $00,$01,$02,$02  ; $E418

sub_3F_E41C:
    LDA $40                      ; $E41C  A5 40
    AND #$03                     ; $E41E  29 03
    TAY                          ; $E420  A8
    LDA $E418,Y                  ; $E421  B9 18 E4
    STA $99                      ; $E424  85 99
    LDA $42                      ; $E426  A5 42
    AND #$80                     ; $E428  29 80
    STA $9A                      ; $E42A  85 9A
    LDA #$3E                     ; $E42C  A9 3E
    JSR sub_3E_CB91              ; $E42E  20 91 CB
    TSX                          ; $E431  BA
    STX $90                      ; $E432  86 90
    LDA #$16                     ; $E434  A9 16
    STA $8F                      ; $E436  85 8F

loc_3F_E438:
    LDX $8F                      ; $E438  A6 8F
    LDA $03A0,X                  ; $E43A  BD A0 03
    BEQ loc_3F_E47A              ; $E43D  F0 3B
    LDA $0441,X                  ; $E43F  BD 41 04
    TAY                          ; $E442  A8
    JSR sub_3E_CBC0              ; $E443  20 C0 CB
    LDA $042A,X                  ; $E446  BD 2A 04
    STA $08                      ; $E449  85 08
    LDA $0413,X                  ; $E44B  BD 13 04
    STA $09                      ; $E44E  85 09
    JSR sub_3F_E482              ; $E450  20 82 E4
    JMP loc_3F_E477              ; $E453  4C 77 E4


loc_3F_E456:
    LDX $8F                      ; $E456  A6 8F
    LDA #$00                     ; $E458  A9 00
    STA $03A0,X                  ; $E45A  9D A0 03
    LDA #$FF                     ; $E45D  A9 FF
    STA $03FC,X                  ; $E45F  9D FC 03
    STA $03E5,X                  ; $E462  9D E5 03
    JMP loc_3F_E477              ; $E465  4C 77 E4


sub_3F_E468:
    LDX $8F                      ; $E468  A6 8F
    PLA                          ; $E46A  68
    CLC                          ; $E46B  18
    ADC #$01                     ; $E46C  69 01
    STA $042A,X                  ; $E46E  9D 2A 04
    PLA                          ; $E471  68
    ADC #$00                     ; $E472  69 00
    STA $0413,X                  ; $E474  9D 13 04

loc_3F_E477:
    LDX $90                      ; $E477  A6 90
    TXS                          ; $E479  9A

loc_3F_E47A:
    DEC $8F                      ; $E47A  C6 8F
    BPL loc_3F_E438              ; $E47C  10 BA
    JSR sub_3E_CBE9              ; $E47E  20 E9 CB
    RTS                          ; $E481  60


sub_3F_E482:
    JMP ($0008)                  ; $E482  6C 08 00


sub_3F_E485:
    LDA $04CB,X                  ; $E485  BD CB 04
    CMP #$F8                     ; $E488  C9 F8
    BCS loc_3F_E4A5              ; $E48A  B0 19
    LDA $04B4,X                  ; $E48C  BD B4 04
    BNE loc_3F_E4A5              ; $E48F  D0 14
    LDA $0486,X                  ; $E491  BD 86 04
    SEC                          ; $E494  38
    SBC $56                      ; $E495  E5 56
    TAY                          ; $E497  A8
    LDA $046F,X                  ; $E498  BD 6F 04
    SBC $57                      ; $E49B  E5 57
    BNE loc_3F_E4A5              ; $E49D  D0 06
    CPY #$04                     ; $E49F  C0 04
    BCC loc_3F_E4A5              ; $E4A1  90 02
    CLC                          ; $E4A3  18
    RTS                          ; $E4A4  60


loc_3F_E4A5:
    SEC                          ; $E4A5  38
    RTS                          ; $E4A6  60


sub_3F_E4A7:
    LDA #$00                     ; $E4A7  A9 00
    STA $04B4,X                  ; $E4A9  9D B4 04
    LDA $E4B9,Y                  ; $E4AC  B9 B9 E4
    STA $0486,X                  ; $E4AF  9D 86 04
    LDA $E4C2,Y                  ; $E4B2  B9 C2 E4
    STA $04CB,X                  ; $E4B5  9D CB 04
    RTS                          ; $E4B8  60

    .byte $80,$80,$C4,$E1,$60,$2C,$C0,$98,$80,$77,$00,$3B,$60,$00,$AB,$C7  ; $E4B9
    .byte $88,$88  ; $E4C9

sub_3F_E4CB:
    LDA #$00                     ; $E4CB  A9 00
    STA $EB                      ; $E4CD  85 EB
    STA $EC                      ; $E4CF  85 EC

sub_3F_E4D1:
    LDX $8F                      ; $E4D1  A6 8F

sub_3F_E4D3:
    LDA $EB                      ; $E4D3  A5 EB
    CLC                          ; $E4D5  18
    ADC $049D,X                  ; $E4D6  7D 9D 04
    STA $049D,X                  ; $E4D9  9D 9D 04
    LDA $ED                      ; $E4DC  A5 ED
    BPL loc_3F_E4E3              ; $E4DE  10 03
    DEC $046F,X                  ; $E4E0  DE 6F 04

loc_3F_E4E3:
    ADC $0486,X                  ; $E4E3  7D 86 04
    STA $0486,X                  ; $E4E6  9D 86 04
    LDA $046F,X                  ; $E4E9  BD 6F 04
    ADC #$00                     ; $E4EC  69 00
    STA $046F,X                  ; $E4EE  9D 6F 04
    LDA $EC                      ; $E4F1  A5 EC
    CLC                          ; $E4F3  18
    ADC $04E2,X                  ; $E4F4  7D E2 04
    STA $04E2,X                  ; $E4F7  9D E2 04
    LDA $EE                      ; $E4FA  A5 EE
    BPL loc_3F_E501              ; $E4FC  10 03
    DEC $04B4,X                  ; $E4FE  DE B4 04

loc_3F_E501:
    ADC $04CB,X                  ; $E501  7D CB 04
    STA $04CB,X                  ; $E504  9D CB 04
    LDA $04B4,X                  ; $E507  BD B4 04
    ADC #$00                     ; $E50A  69 00
    STA $04B4,X                  ; $E50C  9D B4 04
    RTS                          ; $E50F  60


sub_3F_E510:
    LDX #$03                     ; $E510  A2 03

loc_3F_E512:
    LDA $03A0,X                  ; $E512  BD A0 03
    BEQ loc_3F_E51C              ; $E515  F0 05
    DEX                          ; $E517  CA
    BPL loc_3F_E512              ; $E518  10 F8
    SEC                          ; $E51A  38
    RTS                          ; $E51B  60


loc_3F_E51C:
    JSR sub_3E_CB28              ; $E51C  20 28 CB
    EOR ($18,X)                  ; $E51F  41 18
    RTS                          ; $E521  60


sub_3F_E522:
    LDA #$FE                     ; $E522  A9 FE
    STA $0510,X                  ; $E524  9D 10 05
    LDA $0458,X                  ; $E527  BD 58 04
    JSR sub_3E_CB91              ; $E52A  20 91 CB
    CLC                          ; $E52D  18
    ADC #$01                     ; $E52E  69 01
    JSR sub_3E_CBDA              ; $E530  20 DA CB
    LDA $8600,Y                  ; $E533  B9 00 86
    STA $053E,X                  ; $E536  9D 3E 05
    STA $08                      ; $E539  85 08
    LDA $8700,Y                  ; $E53B  B9 00 87
    STA $0527,X                  ; $E53E  9D 27 05
    STA $09                      ; $E541  85 09
    LDY #$00                     ; $E543  A0 00
    LDA $03B7,X                  ; $E545  BD B7 03
    AND #$FE                     ; $E548  29 FE
    STA $03B7,X                  ; $E54A  9D B7 03
    LDA ($08),Y                  ; $E54D  B1 08
    AND #$7F                     ; $E54F  29 7F
    STA $04F9,X                  ; $E551  9D F9 04
    LDA #$01                     ; $E554  A9 01
    STA $0555,X                  ; $E556  9D 55 05
    JSR sub_3E_CBE9              ; $E559  20 E9 CB
    RTS                          ; $E55C  60


sub_3F_E55D:
    LDA $0458,X                  ; $E55D  BD 58 04
    JSR sub_3E_CB91              ; $E560  20 91 CB
    CLC                          ; $E563  18
    ADC #$01                     ; $E564  69 01
    JSR sub_3E_CBDA              ; $E566  20 DA CB
    LDA $8600,Y                  ; $E569  B9 00 86
    STA $053E,X                  ; $E56C  9D 3E 05
    STA $08                      ; $E56F  85 08
    LDA $8700,Y                  ; $E571  B9 00 87
    STA $0527,X                  ; $E574  9D 27 05
    STA $09                      ; $E577  85 09
    LDY #$00                     ; $E579  A0 00
    LDA ($08),Y                  ; $E57B  B1 08
    AND #$7F                     ; $E57D  29 7F
    CMP $04F9,X                  ; $E57F  DD F9 04
    STA $04F9,X                  ; $E582  9D F9 04
    BCS loc_3F_E58C              ; $E585  B0 05
    LDA #$01                     ; $E587  A9 01
    STA $0555,X                  ; $E589  9D 55 05

loc_3F_E58C:
    JSR sub_3E_CBE9              ; $E58C  20 E9 CB
    RTS                          ; $E58F  60


sub_3F_E590:
    LDX #$0D                     ; $E590  A2 0D
    TYA                          ; $E592  98

loc_3F_E593:
    CMP $0404,X                  ; $E593  DD 04 04
    BEQ loc_3F_E5A7              ; $E596  F0 0F
    DEX                          ; $E598  CA
    BPL loc_3F_E593              ; $E599  10 F8

sub_3F_E59B:
    LDX #$15                     ; $E59B  A2 15

loc_3F_E59D:
    LDA $03A0,X                  ; $E59D  BD A0 03
    BEQ loc_3F_E5A9              ; $E5A0  F0 07
    DEX                          ; $E5A2  CA
    CPX #$08                     ; $E5A3  E0 08
    BCS loc_3F_E59D              ; $E5A5  B0 F6

loc_3F_E5A7:
    SEC                          ; $E5A7  38
    RTS                          ; $E5A8  60


loc_3F_E5A9:
    CLC                          ; $E5A9  18
    RTS                          ; $E5AA  60


sub_3F_E5AB:
    JSR sub_3F_E59B              ; $E5AB  20 9B E5
    BCS loc_3F_E5B5              ; $E5AE  B0 05
    JSR sub_3E_CB28              ; $E5B0  20 28 CB
    EOR ($18,X)                  ; $E5B3  41 18

loc_3F_E5B5:
    RTS                          ; $E5B5  60


sub_3F_E5B6:
    LDY #$00                     ; $E5B6  A0 00
    LDA #$0C                     ; $E5B8  A9 0C
    STA $11                      ; $E5BA  85 11
    LDA $0486,Y                  ; $E5BC  B9 86 04
    CMP $0486,X                  ; $E5BF  DD 86 04
    LDA $046F,Y                  ; $E5C2  B9 6F 04
    SBC $046F,X                  ; $E5C5  FD 6F 04
    BMI loc_3F_E5CE              ; $E5C8  30 04
    LDA #$04                     ; $E5CA  A9 04
    STA $11                      ; $E5CC  85 11

loc_3F_E5CE:
    RTS                          ; $E5CE  60

    .byte $00,$40,$40,$40,$40,$40,$C0,$C0,$C0,$80,$80,$80,$00,$00,$00,$00  ; $E5CF

sub_3F_E5DF:
    LDA $03CE,X                  ; $E5DF  BD CE 03
    TAY                          ; $E5E2  A8
    LDA $03B7,X                  ; $E5E3  BD B7 03
    AND #$3F                     ; $E5E6  29 3F
    ORA $E5CF,Y                  ; $E5E8  19 CF E5
    STA $03B7,X                  ; $E5EB  9D B7 03
    RTS                          ; $E5EE  60

    .byte $0A,$0A,$0A,$85,$00,$BD,$CE,$03,$29,$07,$05,$00,$A8,$B9,$03,$E6  ; $E5EF
    .byte $A8,$4C,$22,$E5,$49,$49,$4A,$4A,$4B,$4B,$4A,$4A,$9D,$CE,$03  ; $E5FF

sub_3F_E60E:
    JSR sub_3F_E61A              ; $E60E  20 1A E6
    JMP sub_3F_E4D3              ; $E611  4C D3 E4

    .byte $20,$1A,$E6,$4C,$11,$EC  ; $E614

sub_3F_E61A:
    LDA $E646,Y                  ; $E61A  B9 46 E6
    STA $01                      ; $E61D  85 01
    LDA $E655,Y                  ; $E61F  B9 55 E6
    STA $02                      ; $E622  85 02
    LDA $03CE,X                  ; $E624  BD CE 03
    TAY                          ; $E627  A8
    LDA ($01),Y                  ; $E628  B1 01
    STA $EE                      ; $E62A  85 EE
    INY                          ; $E62C  C8
    INY                          ; $E62D  C8
    INY                          ; $E62E  C8
    INY                          ; $E62F  C8
    LDA ($01),Y                  ; $E630  B1 01
    STA $ED                      ; $E632  85 ED
    TYA                          ; $E634  98
    CLC                          ; $E635  18
    ADC #$10                     ; $E636  69 10
    TAY                          ; $E638  A8
    LDA ($01),Y                  ; $E639  B1 01
    STA $EC                      ; $E63B  85 EC
    INY                          ; $E63D  C8
    INY                          ; $E63E  C8
    INY                          ; $E63F  C8
    INY                          ; $E640  C8
    LDA ($01),Y                  ; $E641  B1 01
    STA $EB                      ; $E643  85 EB
    RTS                          ; $E645  60

    .byte $64,$8C,$B4,$DC,$04,$2C,$54,$7C,$A4,$CC,$F4,$1C,$44,$6C,$94,$E6  ; $E646
    .byte $E6,$E6,$E6,$E7,$E7,$E7,$E7,$E7,$E7,$E7,$E8,$E8,$E8,$E8,$FE,$FE  ; $E656
    .byte $FE,$FF,$00,$00,$01,$01,$02,$01,$01,$00,$00,$FF,$FE,$FE,$FE,$FE  ; $E666
    .byte $FE,$FF,$00,$27,$96,$3D,$00,$C3,$6A,$D9,$00,$D9,$6A,$C3,$00,$3D  ; $E676
    .byte $96,$27,$00,$27,$96,$3D,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00  ; $E686
    .byte $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$80,$8A,$A6,$D0,$00,$30  ; $E696
    .byte $5A,$76,$80,$76,$5A,$30,$00,$D0,$A6,$8A,$80,$8A,$A6,$D0,$FF,$FF  ; $E6A6
    .byte $FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF  ; $E6B6
    .byte $FF,$FF,$B0,$B7,$C8,$E2,$00,$1E,$38,$49,$50,$49,$38,$1E,$00,$E2  ; $E6C6
    .byte $C8,$B7,$B0,$B7,$C8,$E2,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00  ; $E6D6
    .byte $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$A0,$A8,$BD,$DC,$00,$24  ; $E6E6
    .byte $43,$58,$60,$58,$43,$24,$00,$DC,$BD,$A8,$A0,$A8,$BD,$DC,$FF,$FF  ; $E6F6
    .byte $FF,$FF,$00,$00,$00,$00,$01,$00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF  ; $E706
    .byte $FF,$FF,$00,$14,$4B,$9F,$00,$61,$B5,$EC,$00,$EC,$B5,$61,$00,$9F  ; $E716
    .byte $4B,$14,$00,$14,$4B,$9F,$FE,$FE,$FF,$FF,$00,$00,$00,$01,$01,$01  ; $E726
    .byte $00,$00,$00,$FF,$FF,$FE,$FE,$FE,$FF,$FF,$B0,$CA,$13,$80,$00,$80  ; $E736
    .byte $ED,$36,$50,$36,$ED,$80,$00,$80,$13,$CA,$B0,$CA,$13,$80,$FE,$FE  ; $E746
    .byte $FE,$FF,$00,$00,$01,$01,$01,$01,$01,$00,$00,$FF,$FE,$FE,$FE,$FE  ; $E756
    .byte $FE,$FF,$80,$9E,$F1,$6E,$00,$92,$0F,$62,$80,$62,$0F,$92,$00,$6E  ; $E766
    .byte $F1,$9E,$80,$9E,$F1,$6E,$FD,$FD,$FD,$FE,$00,$01,$02,$02,$03,$02  ; $E776
    .byte $02,$01,$00,$FE,$FD,$FD,$FD,$FD,$FD,$FE,$00,$3B,$E1,$DB,$00,$25  ; $E786
    .byte $1F,$C5,$00,$C5,$1F,$25,$00,$DB,$E1,$3B,$00,$3B,$E1,$DB,$FC,$FC  ; $E796
    .byte $FD,$FE,$00,$01,$02,$03,$04,$03,$02,$01,$00,$FE,$FD,$FC,$FC,$FC  ; $E7A6
    .byte $FD,$FE,$00,$4E,$2C,$79,$00,$87,$D4,$B2,$00,$B2,$D4,$87,$00,$79  ; $E7B6
    .byte $2C,$4E,$00,$4E,$2C,$79,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00  ; $E7C6
    .byte $00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$40,$4F,$79,$B7,$00,$49  ; $E7D6
    .byte $87,$B1,$C0,$B1,$87,$49,$00,$B7,$79,$4F,$40,$4F,$79,$B7,$FD,$FD  ; $E7E6
    .byte $FE,$FF,$00,$00,$01,$02,$02,$02,$01,$00,$00,$FF,$FE,$FD,$FD,$FD  ; $E7F6
    .byte $FE,$FF,$80,$B1,$3C,$0C,$00,$F4,$C4,$4F,$80,$4F,$C4,$F4,$00,$0C  ; $E806
    .byte $3C,$B1,$80,$B1,$3C,$0C,$FE,$FE,$FE,$FF,$00,$00,$01,$01,$01,$01  ; $E816
    .byte $01,$00,$00,$FF,$FE,$FE,$FE,$FE,$FE,$FF,$40,$63,$C4,$55,$00,$AB  ; $E826
    .byte $3C,$9D,$C0,$9D,$3C,$AB,$00,$55,$C4,$63,$40,$63,$C4,$55,$F8,$F8  ; $E836
    .byte $FA,$FC,$00,$03,$05,$07,$08,$07,$05,$03,$00,$FC,$FA,$F8,$F8,$F8  ; $E846
    .byte $FA,$FC,$00,$9C,$58,$F1,$00,$0F,$A8,$64,$00,$64,$A8,$0F,$00,$F1  ; $E856
    .byte $58,$9C,$00,$9C,$58,$F1,$FA,$FA,$FB,$FD,$00,$02,$04,$05,$06,$05  ; $E866
    .byte $04,$02,$00,$FD,$FB,$FA,$FA,$FA,$FB,$FD,$00,$75,$C2,$B5,$00,$4B  ; $E876
    .byte $3E,$8B,$00,$8B,$3E,$4B,$00,$B5,$C2,$75,$00,$75,$C2,$B5,$FA,$FA  ; $E886
    .byte $FC,$FD,$00,$02,$03,$05,$05,$05,$03,$02,$00,$FD,$FC,$FA,$FA,$FA  ; $E896
    .byte $FC,$FD,$6F,$DB,$10,$DF,$00,$21,$F0,$25,$91,$25,$F0,$21,$00,$DF  ; $E8A6
    .byte $10,$DB,$6F,$DB,$10,$DF  ; $E8B6

sub_3F_E8BC:
    STY $00                      ; $E8BC  84 00
    JSR sub_3F_E927              ; $E8BE  20 27 E9
    LDY $00                      ; $E8C1  A4 00
    LDA $03CE,Y                  ; $E8C3  B9 CE 03
    CMP #$04                     ; $E8C6  C9 04
    BNE loc_3F_E904              ; $E8C8  D0 3A
    BEQ loc_3F_E8DA              ; $E8CA  F0 0E

sub_3F_E8CC:
    STY $00                      ; $E8CC  84 00
    JSR sub_3F_E927              ; $E8CE  20 27 E9
    LDY $00                      ; $E8D1  A4 00
    LDA $03CE,Y                  ; $E8D3  B9 CE 03
    CMP #$01                     ; $E8D6  C9 01
    BNE loc_3F_E904              ; $E8D8  D0 2A

loc_3F_E8DA:
    LDA $03                      ; $E8DA  A5 03
    CLC                          ; $E8DC  18
    ADC $04CB,Y                  ; $E8DD  79 CB 04
    STA $04CB,X                  ; $E8E0  9D CB 04
    LDA $04                      ; $E8E3  A5 04
    ADC $04B4,Y                  ; $E8E5  79 B4 04
    STA $04B4,X                  ; $E8E8  9D B4 04
    LDA $0486,Y                  ; $E8EB  B9 86 04
    SEC                          ; $E8EE  38
    SBC $01                      ; $E8EF  E5 01
    STA $0486,X                  ; $E8F1  9D 86 04
    LDA $046F,Y                  ; $E8F4  B9 6F 04
    SBC $02                      ; $E8F7  E5 02
    STA $046F,X                  ; $E8F9  9D 6F 04
    RTS                          ; $E8FC  60


sub_3F_E8FD:
    STY $00                      ; $E8FD  84 00
    JSR sub_3F_E927              ; $E8FF  20 27 E9
    LDY $00                      ; $E902  A4 00

loc_3F_E904:
    LDA $03                      ; $E904  A5 03
    CLC                          ; $E906  18
    ADC $04CB,Y                  ; $E907  79 CB 04
    STA $04CB,X                  ; $E90A  9D CB 04
    LDA $04                      ; $E90D  A5 04
    ADC $04B4,Y                  ; $E90F  79 B4 04
    STA $04B4,X                  ; $E912  9D B4 04
    CLC                          ; $E915  18
    LDA $0486,Y                  ; $E916  B9 86 04
    ADC $01                      ; $E919  65 01
    STA $0486,X                  ; $E91B  9D 86 04
    LDA $046F,Y                  ; $E91E  B9 6F 04
    ADC $02                      ; $E921  65 02
    STA $046F,X                  ; $E923  9D 6F 04
    RTS                          ; $E926  60


sub_3F_E927:
    ASL A                        ; $E927  0A
    TAY                          ; $E928  A8
    LDA #$00                     ; $E929  A9 00
    STA $02                      ; $E92B  85 02
    STA $04                      ; $E92D  85 04
    LDA $E943,Y                  ; $E92F  B9 43 E9
    STA $01                      ; $E932  85 01
    BPL loc_3F_E938              ; $E934  10 02
    DEC $02                      ; $E936  C6 02

loc_3F_E938:
    INY                          ; $E938  C8
    LDA $E943,Y                  ; $E939  B9 43 E9
    STA $03                      ; $E93C  85 03
    BPL loc_3F_E942              ; $E93E  10 02
    DEC $04                      ; $E940  C6 04

loc_3F_E942:
    RTS                          ; $E942  60

    .byte $00,$18,$FC,$F0,$E8,$08,$00,$00,$EF,$FF,$EC,$00,$10,$00,$00,$10  ; $E943
    .byte $00,$F0,$0C,$F4,$0C,$0C,$F6,$FE,$EC,$00,$00,$E8,$10,$FC,$08,$04  ; $E953
    .byte $EE,$00,$10,$00,$20,$00,$30,$00,$08,$FC,$F8,$FC,$10,$00,$F0,$00  ; $E963
    .byte $00,$10,$10,$F8,$F0,$F8,$E0,$04,$D0,$08,$00,$EC,$EC,$00,$00,$14  ; $E973
    .byte $14,$00,$F2,$06,$F0,$00,$F6,$F4,$00,$0E,$40,$60,$40,$A0,$E0,$00  ; $E983
    .byte $E0,$00,$EA,$04,$E4,$FA,$E4,$F8,$E4,$F6,$E8,$3C,$F0,$E8,$F0,$18  ; $E993
    .byte $F4,$F8,$EE,$00,$F4,$F4,$F4,$0C,$13,$F8,$F8,$23,$00,$EC,$F0,$FE  ; $E9A3
    .byte $00,$FA,$F8,$06,$F8,$06,$00,$05,$FC,$F2,$00,$F0,$00,$F8,$00,$08  ; $E9B3
    .byte $14,$F8,$F8,$15,$00,$E0,$20,$00,$00,$20,$E0,$00,$EE,$F9,$00,$CC  ; $E9C3

sub_3F_E9D3:
    LDX $8F                      ; $E9D3  A6 8F
    LDA $03B7,X                  ; $E9D5  BD B7 03
    AND #$FE                     ; $E9D8  29 FE
    STA $03B7,X                  ; $E9DA  9D B7 03
    JSR sub_3F_E485              ; $E9DD  20 85 E4
    BCS loc_3F_EA19              ; $E9E0  B0 37
    LDA $056C,X                  ; $E9E2  BD 6C 05
    BEQ loc_3F_EA16              ; $E9E5  F0 2F
    LDA $03B7,X                  ; $E9E7  BD B7 03
    ORA #$01                     ; $E9EA  09 01
    STA $03B7,X                  ; $E9EC  9D B7 03
    JSR sub_3F_EB72              ; $E9EF  20 72 EB
    LDA $056C,X                  ; $E9F2  BD 6C 05
    AND #$0F                     ; $E9F5  29 0F
    STA $00                      ; $E9F7  85 00
    LDA #$35                     ; $E9F9  A9 35
    STA $DC                      ; $E9FB  85 DC
    LDA #$00                     ; $E9FD  A9 00
    STA $056C,X                  ; $E9FF  9D 6C 05
    LDA $03E5,X                  ; $EA02  BD E5 03
    SEC                          ; $EA05  38
    SBC $00                      ; $EA06  E5 00
    STA $03E5,X                  ; $EA08  9D E5 03
    BPL loc_3F_EA16              ; $EA0B  10 09
    LDY #$17                     ; $EA0D  A0 17
    JSR sub_3E_CB28              ; $EA0F  20 28 CB
    EOR ($4C,X)                  ; $EA12  41 4C
    RRA $E4,X                    ; $EA14  77 E4

loc_3F_EA16:
    JMP sub_3F_E468              ; $EA16  4C 68 E4


loc_3F_EA19:
    JMP loc_3F_E456              ; $EA19  4C 56 E4


sub_3F_EA1C:
    LDX $8F                      ; $EA1C  A6 8F
    LDA $03B7,X                  ; $EA1E  BD B7 03
    AND #$FE                     ; $EA21  29 FE
    STA $03B7,X                  ; $EA23  9D B7 03
    JSR sub_3F_E485              ; $EA26  20 85 E4
    BCS loc_3F_EA67              ; $EA29  B0 3C
    LDA $056C,X                  ; $EA2B  BD 6C 05
    BEQ loc_3F_EA64              ; $EA2E  F0 34
    JSR sub_3F_EB72              ; $EA30  20 72 EB
    LDA $056C,X                  ; $EA33  BD 6C 05
    AND #$0F                     ; $EA36  29 0F
    STA $00                      ; $EA38  85 00
    LDA $03B7,X                  ; $EA3A  BD B7 03
    ORA #$01                     ; $EA3D  09 01
    STA $03B7,X                  ; $EA3F  9D B7 03
    LDA #$35                     ; $EA42  A9 35
    STA $DC                      ; $EA44  85 DC
    LDA #$00                     ; $EA46  A9 00
    STA $056C,X                  ; $EA48  9D 6C 05
    LDA $03E5,X                  ; $EA4B  BD E5 03
    SEC                          ; $EA4E  38
    SBC $00                      ; $EA4F  E5 00
    STA $03E5,X                  ; $EA51  9D E5 03
    BPL loc_3F_EA64              ; $EA54  10 0E
    LDA #$FF                     ; $EA56  A9 FF
    STA $03E5,X                  ; $EA58  9D E5 03
    LDY #$25                     ; $EA5B  A0 25
    JSR sub_3E_CB28              ; $EA5D  20 28 CB
    EOR ($4C,X)                  ; $EA60  41 4C
    RRA $E4,X                    ; $EA62  77 E4

loc_3F_EA64:
    JMP sub_3F_E468              ; $EA64  4C 68 E4


loc_3F_EA67:
    JMP loc_3F_E456              ; $EA67  4C 56 E4


sub_3F_EA6A:
    LDX $8F                      ; $EA6A  A6 8F
    LDA #$00                     ; $EA6C  A9 00
    STA $056C,X                  ; $EA6E  9D 6C 05
    JSR sub_3F_E485              ; $EA71  20 85 E4
    BCS loc_3F_EA79              ; $EA74  B0 03
    JMP sub_3F_E468              ; $EA76  4C 68 E4


loc_3F_EA79:
    JMP loc_3F_E456              ; $EA79  4C 56 E4


sub_3F_EA7C:
    LDX $8F                      ; $EA7C  A6 8F
    LDA #$00                     ; $EA7E  A9 00
    STA $056C,X                  ; $EA80  9D 6C 05
    LDA $04B4,X                  ; $EA83  BD B4 04
    CMP #$FF                     ; $EA86  C9 FF
    BEQ loc_3F_EA8F              ; $EA88  F0 05
    JSR sub_3F_E485              ; $EA8A  20 85 E4
    BCS loc_3F_EA92              ; $EA8D  B0 03

loc_3F_EA8F:
    JMP sub_3F_E468              ; $EA8F  4C 68 E4


loc_3F_EA92:
    JMP loc_3F_E456              ; $EA92  4C 56 E4


sub_3F_EA95:
    LDX $8F                      ; $EA95  A6 8F
    LDA $056C,X                  ; $EA97  BD 6C 05
    BEQ loc_3F_EAA3              ; $EA9A  F0 07
    CMP #$14                     ; $EA9C  C9 14
    BNE loc_3F_EAA3              ; $EA9E  D0 03
    JMP sub_3F_E9D3              ; $EAA0  4C D3 E9


loc_3F_EAA3:
    JSR sub_3F_E485              ; $EAA3  20 85 E4
    BCS loc_3F_EAB0              ; $EAA6  B0 08
    LDA #$00                     ; $EAA8  A9 00
    STA $056C,X                  ; $EAAA  9D 6C 05
    JMP sub_3F_E468              ; $EAAD  4C 68 E4


loc_3F_EAB0:
    JMP loc_3F_E456              ; $EAB0  4C 56 E4


sub_3F_EAB3:
    PHA                          ; $EAB3  48
    LDX $8F                      ; $EAB4  A6 8F
    LDA $03B7,X                  ; $EAB6  BD B7 03
    AND #$FE                     ; $EAB9  29 FE
    STA $03B7,X                  ; $EABB  9D B7 03
    JSR sub_3F_E485              ; $EABE  20 85 E4
    BCS loc_3F_EB38              ; $EAC1  B0 75
    PLA                          ; $EAC3  68
    TAY                          ; $EAC4  A8
    LDA $056C,X                  ; $EAC5  BD 6C 05
    BEQ loc_3F_EB30              ; $EAC8  F0 66
    CMP #$30                     ; $EACA  C9 30
    BEQ loc_3F_EB30              ; $EACC  F0 62
    LDA $03B7,X                  ; $EACE  BD B7 03
    ORA #$01                     ; $EAD1  09 01
    STA $03B7,X                  ; $EAD3  9D B7 03
    LDA $EB3C,Y                  ; $EAD6  B9 3C EB
    STA $00                      ; $EAD9  85 00
    LDA $EB3F,Y                  ; $EADB  B9 3F EB
    STA $01                      ; $EADE  85 01
    CPY #$00                     ; $EAE0  C0 00
    BEQ loc_3F_EAFA              ; $EAE2  F0 16
    JSR sub_3F_EB72              ; $EAE4  20 72 EB
    LDA $056C,X                  ; $EAE7  BD 6C 05
    AND #$F0                     ; $EAEA  29 F0
    CMP #$10                     ; $EAEC  C9 10
    BNE loc_3F_EAFA              ; $EAEE  D0 0A
    LDA $056C,X                  ; $EAF0  BD 6C 05
    AND #$0F                     ; $EAF3  29 0F
    STA $00                      ; $EAF5  85 00
    JMP loc_3F_EB0A              ; $EAF7  4C 0A EB


loc_3F_EAFA:
    LDA $056C,X                  ; $EAFA  BD 6C 05
    LSR A                        ; $EAFD  4A
    LSR A                        ; $EAFE  4A
    LSR A                        ; $EAFF  4A
    LSR A                        ; $EB00  4A
    TAY                          ; $EB01  A8
    LDA ($00),Y                  ; $EB02  B1 00
    BEQ loc_3F_EB30              ; $EB04  F0 2A
    BMI loc_3F_EB1E              ; $EB06  30 16
    STA $00                      ; $EB08  85 00

loc_3F_EB0A:
    LDA #$35                     ; $EB0A  A9 35
    STA $DC                      ; $EB0C  85 DC
    LDA #$00                     ; $EB0E  A9 00
    STA $056C,X                  ; $EB10  9D 6C 05
    LDA $03E5,X                  ; $EB13  BD E5 03
    SEC                          ; $EB16  38
    SBC $00                      ; $EB17  E5 00
    STA $03E5,X                  ; $EB19  9D E5 03
    BPL loc_3F_EB30              ; $EB1C  10 12

loc_3F_EB1E:
    LDA #$FF                     ; $EB1E  A9 FF
    STA $03E5,X                  ; $EB20  9D E5 03
    LDA #$35                     ; $EB23  A9 35
    STA $DC                      ; $EB25  85 DC
    LDY #$17                     ; $EB27  A0 17
    JSR sub_3E_CB28              ; $EB29  20 28 CB
    EOR ($4C,X)                  ; $EB2C  41 4C
    RRA $E4,X                    ; $EB2E  77 E4

loc_3F_EB30:
    LDA #$00                     ; $EB30  A9 00
    STA $056C,X                  ; $EB32  9D 6C 05
    JMP sub_3F_E468              ; $EB35  4C 68 E4


loc_3F_EB38:
    PLA                          ; $EB38  68
    JMP loc_3F_E456              ; $EB39  4C 56 E4

    .byte $42,$52,$62,$EB,$EB,$EB,$00,$00,$00,$00,$00,$00,$00,$80,$00,$00  ; $EB3C
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$01,$80,$03  ; $EB4C
    .byte $03,$04,$04,$03,$00,$00,$00,$00,$00,$00,$00,$02,$02,$80,$01,$03  ; $EB5C
    .byte $03,$03,$04,$03,$00,$00  ; $EB6C

sub_3F_EB72:
    LDA $056C,X                  ; $EB72  BD 6C 05
    LSR A                        ; $EB75  4A
    LSR A                        ; $EB76  4A
    LSR A                        ; $EB77  4A
    LSR A                        ; $EB78  4A
    TAY                          ; $EB79  A8
    LDA $EBB1,Y                  ; $EB7A  B9 B1 EB
    STA $08                      ; $EB7D  85 08
    LDA $EBC1,Y                  ; $EB7F  B9 C1 EB
    STA $09                      ; $EB82  85 09
    JMP ($0008)                  ; $EB84  6C 08 00

    .byte $BD,$B7,$03,$29,$FE,$9D,$B7,$03,$BD,$E5,$03,$38,$E9,$02,$10,$19  ; $EB87
    .byte $9D,$E5,$03,$20,$68,$E4,$A9,$FC,$85,$EE,$A9,$00,$85,$ED,$20,$CB  ; $EB97
    .byte $E4,$20,$85,$E4,$90,$EA,$4C,$56,$E4  ; $EBA7
    RTS                          ; $EBB0  60

    .byte $B0,$B0,$B0,$B0,$B0,$B0,$87,$B0,$B0,$B0,$B0,$B0,$B0,$B0,$B0,$B0  ; $EBB1
    .byte $EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB  ; $EBC1

sub_3F_EBD1:
    PLA                          ; $EBD1  68
    STA $0A                      ; $EBD2  85 0A
    PLA                          ; $EBD4  68
    STA $0B                      ; $EBD5  85 0B
    PHA                          ; $EBD7  48
    LDA $0A                      ; $EBD8  A5 0A
    PHA                          ; $EBDA  48

sub_3F_EBDB:
    LDA #$00                     ; $EBDB  A9 00
    STA $056C,X                  ; $EBDD  9D 6C 05
    LDY #$FD                     ; $EBE0  A0 FD
    DEC $0B                      ; $EBE2  C6 0B
    LDA ($0A),Y                  ; $EBE4  B1 0A
    STA $0583,X                  ; $EBE6  9D 83 05
    DEY                          ; $EBE9  88
    LDA ($0A),Y                  ; $EBEA  B1 0A
    STA $03E5,X                  ; $EBEC  9D E5 03
    DEY                          ; $EBEF  88
    LDA ($0A),Y                  ; $EBF0  B1 0A
    STA $059A,X                  ; $EBF2  9D 9A 05
    DEY                          ; $EBF5  88
    DEY                          ; $EBF6  88
    LDA ($0A),Y                  ; $EBF7  B1 0A
    BEQ loc_3F_EBFE              ; $EBF9  F0 03
    JSR sub_3E_C9EF              ; $EBFB  20 EF C9

loc_3F_EBFE:
    DEY                          ; $EBFE  88
    LDA ($0A),Y                  ; $EBFF  B1 0A
    TAY                          ; $EC01  A8
    JSR sub_3F_E522              ; $EC02  20 22 E5
    RTS                          ; $EC05  60

    .byte $A9,$40,$D0,$02  ; $EC06

sub_3F_EC0A:
    LDA #$2A                     ; $EC0A  A9 2A
    STA $00                      ; $EC0C  85 00
    JSR sub_3F_ECA4              ; $EC0E  20 A4 EC

sub_3F_EC11:
    JSR sub_3F_E4D1              ; $EC11  20 D1 E4
    LDA $EE                      ; $EC14  A5 EE
    STA $06                      ; $EC16  85 06
    LDY #$00                     ; $EC18  A0 00
    STY $07                      ; $EC1A  84 07
    STY $11                      ; $EC1C  84 11
    LDA $ED                      ; $EC1E  A5 ED
    BPL loc_3F_EC26              ; $EC20  10 04
    LDY #$04                     ; $EC22  A0 04
    STY $07                      ; $EC24  84 07

loc_3F_EC26:
    LDA ($08),Y                  ; $EC26  B1 08
    STA $00                      ; $EC28  85 00
    INY                          ; $EC2A  C8
    LDA ($08),Y                  ; $EC2B  B1 08
    STA $01                      ; $EC2D  85 01
    INY                          ; $EC2F  C8
    STY $07                      ; $EC30  84 07
    JSR sub_3E_D9CD              ; $EC32  20 CD D9
    LDY $07                      ; $EC35  A4 07
    LDA ($08),Y                  ; $EC37  B1 08
    STA $00                      ; $EC39  85 00
    INY                          ; $EC3B  C8
    LDA ($08),Y                  ; $EC3C  B1 08
    STA $01                      ; $EC3E  85 01
    JSR sub_3E_D9CD              ; $EC40  20 CD D9
    LDA $11                      ; $EC43  A5 11
    STA $12                      ; $EC45  85 12
    BEQ loc_3F_EC55              ; $EC47  F0 0C
    AND #$01                     ; $EC49  29 01
    BEQ loc_3F_EC55              ; $EC4B  F0 08
    JSR sub_3E_DB4F              ; $EC4D  20 4F DB
    LDX $8F                      ; $EC50  A6 8F
    JSR sub_3F_E4CB              ; $EC52  20 CB E4

loc_3F_EC55:
    LDA #$00                     ; $EC55  A9 00
    STA $11                      ; $EC57  85 11
    LDY #$08                     ; $EC59  A0 08
    STY $07                      ; $EC5B  84 07
    LDA $06                      ; $EC5D  A5 06
    BPL loc_3F_EC65              ; $EC5F  10 04
    LDY #$0C                     ; $EC61  A0 0C
    STY $07                      ; $EC63  84 07

loc_3F_EC65:
    LDA ($08),Y                  ; $EC65  B1 08
    STA $00                      ; $EC67  85 00
    INY                          ; $EC69  C8
    LDA ($08),Y                  ; $EC6A  B1 08
    STA $01                      ; $EC6C  85 01
    INY                          ; $EC6E  C8
    STY $07                      ; $EC6F  84 07
    JSR sub_3E_D9CD              ; $EC71  20 CD D9
    LDY $07                      ; $EC74  A4 07
    LDA ($08),Y                  ; $EC76  B1 08
    STA $00                      ; $EC78  85 00
    INY                          ; $EC7A  C8
    LDA ($08),Y                  ; $EC7B  B1 08
    STA $01                      ; $EC7D  85 01
    JSR sub_3E_D9CD              ; $EC7F  20 CD D9
    LDA $11                      ; $EC82  A5 11
    BEQ loc_3F_ECA1              ; $EC84  F0 1B
    AND #$01                     ; $EC86  29 01
    BEQ loc_3F_ECA1              ; $EC88  F0 17
    JSR sub_3E_DB6D              ; $EC8A  20 6D DB
    LDX $8F                      ; $EC8D  A6 8F
    LDA $05F6,X                  ; $EC8F  BD F6 05
    BMI loc_3F_EC99              ; $EC92  30 05
    LDA #$00                     ; $EC94  A9 00
    STA $05DF,X                  ; $EC96  9D DF 05

loc_3F_EC99:
    LDA #$00                     ; $EC99  A9 00
    STA $05F6,X                  ; $EC9B  9D F6 05
    JSR sub_3F_E4CB              ; $EC9E  20 CB E4

loc_3F_ECA1:
    LDX $8F                      ; $ECA1  A6 8F
    RTS                          ; $ECA3  60


sub_3F_ECA4:
    LDA $05DF,X                  ; $ECA4  BD DF 05
    ORA #$01                     ; $ECA7  09 01
    CLC                          ; $ECA9  18
    ADC $00                      ; $ECAA  65 00
    STA $05DF,X                  ; $ECAC  9D DF 05
    STA $EC                      ; $ECAF  85 EC
    LDA #$00                     ; $ECB1  A9 00
    ADC $05F6,X                  ; $ECB3  7D F6 05
    BMI loc_3F_ECBE              ; $ECB6  30 06
    CMP #$08                     ; $ECB8  C9 08
    BCC loc_3F_ECBE              ; $ECBA  90 02
    LDA #$07                     ; $ECBC  A9 07

loc_3F_ECBE:
    STA $05F6,X                  ; $ECBE  9D F6 05
    STA $EE                      ; $ECC1  85 EE
    RTS                          ; $ECC3  60


sub_3F_ECC4:
    LDA $04CB,X                  ; $ECC4  BD CB 04
    STA $02                      ; $ECC7  85 02

sub_3F_ECC9:
    LDA $04B4,X                  ; $ECC9  BD B4 04
    STA $03                      ; $ECCC  85 03
    LDA $0486,X                  ; $ECCE  BD 86 04
    STA $00                      ; $ECD1  85 00
    LDA $046F,X                  ; $ECD3  BD 6F 04
    STA $01                      ; $ECD6  85 01
    LDY #$15                     ; $ECD8  A0 15

loc_3F_ECDA:
    LDA $03A0,Y                  ; $ECDA  B9 A0 03
    BEQ sub_3F_ECF5              ; $ECDD  F0 16
    LDA $059A,X                  ; $ECDF  BD 9A 05
    STA $08                      ; $ECE2  85 08
    LDA $059A,Y                  ; $ECE4  B9 9A 05
    STA $0A                      ; $ECE7  85 0A
    JSR sub_3F_F726              ; $ECE9  20 26 F7
    LDA $11                      ; $ECEC  A5 11
    BEQ sub_3F_ECF5              ; $ECEE  F0 05
    LDA $0583,Y                  ; $ECF0  B9 83 05
    SEC                          ; $ECF3  38
    RTS                          ; $ECF4  60


sub_3F_ECF5:
    DEY                          ; $ECF5  88
    CPY #$07                     ; $ECF6  C0 07
    BNE loc_3F_ECDA              ; $ECF8  D0 E0
    CLC                          ; $ECFA  18
    RTS                          ; $ECFB  60


sub_3F_ECFC:
    LDY #$00                     ; $ECFC  A0 00
    JSR sub_3F_F8AE              ; $ECFE  20 AE F8
    LDA $11                      ; $ED01  A5 11
    SEC                          ; $ED03  38
    SBC $03CE,X                  ; $ED04  FD CE 03
    AND #$0F                     ; $ED07  29 0F
    BEQ loc_3F_ED18              ; $ED09  F0 0D
    CMP #$08                     ; $ED0B  C9 08
    BCC loc_3F_ED15              ; $ED0D  90 06
    DEC $03CE,X                  ; $ED0F  DE CE 03
    DEC $03CE,X                  ; $ED12  DE CE 03

loc_3F_ED15:
    INC $03CE,X                  ; $ED15  FE CE 03

loc_3F_ED18:
    LDA $03CE,X                  ; $ED18  BD CE 03
    AND #$0F                     ; $ED1B  29 0F
    STA $03CE,X                  ; $ED1D  9D CE 03
    RTS                          ; $ED20  60


sub_3F_ED21:
    LDA $03FC,X                  ; $ED21  BD FC 03
    BMI loc_3F_ED3D              ; $ED24  30 17
    AND #$07                     ; $ED26  29 07
    TAY                          ; $ED28  A8
    LDA $DFB1,Y                  ; $ED29  B9 B1 DF
    STA $00                      ; $ED2C  85 00
    LDA $03FC,X                  ; $ED2E  BD FC 03
    LSR A                        ; $ED31  4A
    LSR A                        ; $ED32  4A
    LSR A                        ; $ED33  4A
    TAY                          ; $ED34  A8
    LDA $0650,Y                  ; $ED35  B9 50 06
    ORA $00                      ; $ED38  05 00
    STA $0650,Y                  ; $ED3A  99 50 06

loc_3F_ED3D:
    RTS                          ; $ED3D  60


sub_3F_ED3E:
    LDA #$F0                     ; $ED3E  A9 F0
    STA $DC                      ; $ED40  85 DC
    JSR sub_3E_C62B              ; $ED42  20 2B C6
    LDA #$26                     ; $ED45  A9 26
    STA $DC                      ; $ED47  85 DC
    JSR sub_3E_C62B              ; $ED49  20 2B C6
    LDA $0486,X                  ; $ED4C  BD 86 04
    STA $06                      ; $ED4F  85 06
    LDA $04CB,X                  ; $ED51  BD CB 04
    STA $07                      ; $ED54  85 07
    LDA #$05                     ; $ED56  A9 05
    STA $05                      ; $ED58  85 05
    LDX #$15                     ; $ED5A  A2 15
    JSR sub_3F_ED69              ; $ED5C  20 69 ED
    BCS loc_3F_ED68              ; $ED5F  B0 07
    LDA #$09                     ; $ED61  A9 09
    STA $05                      ; $ED63  85 05
    JSR sub_3F_ED69              ; $ED65  20 69 ED

loc_3F_ED68:
    RTS                          ; $ED68  60


sub_3F_ED69:
    LDA #$07                     ; $ED69  A9 07
    STA $04                      ; $ED6B  85 04

loc_3F_ED6D:
    LDA $03A0,X                  ; $ED6D  BD A0 03
    BNE loc_3F_EDA1              ; $ED70  D0 2F
    LDY #$08                     ; $ED72  A0 08
    JSR sub_3E_CB28              ; $ED74  20 28 CB
    EOR ($A5,X)                  ; $ED77  41 A5
    ISC ($9D),Y                  ; $ED79  F3 9D
    DCP $A505,X                  ; $ED7B  DF 05 A5
    ORA $9D                      ; $ED7E  05 9D
    INY                          ; $ED80  C8
    ORA $A5                      ; $ED81  05 A5
    NOP $0A                      ; $ED83  04 0A
    STA $03CE,X                  ; $ED85  9D CE 03
    LDA $06                      ; $ED88  A5 06
    STA $0486,X                  ; $ED8A  9D 86 04
    LDA $07                      ; $ED8D  A5 07
    STA $04CB,X                  ; $ED8F  9D CB 04
    LDA #$00                     ; $ED92  A9 00
    STA $04B4,X                  ; $ED94  9D B4 04
    LDA $046F                    ; $ED97  AD 6F 04
    STA $046F,X                  ; $ED9A  9D 6F 04
    DEC $04                      ; $ED9D  C6 04
    BMI loc_3F_EDA6              ; $ED9F  30 05

loc_3F_EDA1:
    DEX                          ; $EDA1  CA
    BNE loc_3F_ED6D              ; $EDA2  D0 C9
    SEC                          ; $EDA4  38
    RTS                          ; $EDA5  60


loc_3F_EDA6:
    CLC                          ; $EDA6  18
    RTS                          ; $EDA7  60


sub_3F_EDA8:
    LDY #$00                     ; $EDA8  A0 00
    LDA #$00                     ; $EDAA  A9 00
    STA $11                      ; $EDAC  85 11
    LDA $00                      ; $EDAE  A5 00
    BEQ loc_3F_EDE1              ; $EDB0  F0 2F
    LDA $0486,Y                  ; $EDB2  B9 86 04
    SEC                          ; $EDB5  38
    SBC $0486,X                  ; $EDB6  FD 86 04
    STA $08                      ; $EDB9  85 08
    LDA $046F,Y                  ; $EDBB  B9 6F 04
    SBC $046F,X                  ; $EDBE  FD 6F 04
    STA $09                      ; $EDC1  85 09
    BPL loc_3F_EDD5              ; $EDC3  10 10
    EOR #$FF                     ; $EDC5  49 FF
    STA $09                      ; $EDC7  85 09
    LDA $08                      ; $EDC9  A5 08
    EOR #$FF                     ; $EDCB  49 FF
    STA $08                      ; $EDCD  85 08
    INC $08                      ; $EDCF  E6 08
    BNE loc_3F_EDD5              ; $EDD1  D0 02
    INC $09                      ; $EDD3  E6 09

loc_3F_EDD5:
    LDA $09                      ; $EDD5  A5 09
    BNE loc_3F_EE18              ; $EDD7  D0 3F
    LDA $08                      ; $EDD9  A5 08
    CMP $00                      ; $EDDB  C5 00
    BCC loc_3F_EDE1              ; $EDDD  90 02
    BNE loc_3F_EE18              ; $EDDF  D0 37

loc_3F_EDE1:
    LDA $01                      ; $EDE1  A5 01
    BEQ loc_3F_EE14              ; $EDE3  F0 2F
    LDA $04CB,Y                  ; $EDE5  B9 CB 04
    SEC                          ; $EDE8  38
    SBC $04CB,X                  ; $EDE9  FD CB 04
    STA $08                      ; $EDEC  85 08
    LDA $04B4,Y                  ; $EDEE  B9 B4 04
    SBC $04B4,X                  ; $EDF1  FD B4 04
    STA $09                      ; $EDF4  85 09
    BPL loc_3F_EE08              ; $EDF6  10 10
    EOR #$FF                     ; $EDF8  49 FF
    STA $09                      ; $EDFA  85 09
    LDA $08                      ; $EDFC  A5 08
    EOR #$FF                     ; $EDFE  49 FF
    STA $08                      ; $EE00  85 08
    INC $08                      ; $EE02  E6 08
    BNE loc_3F_EE08              ; $EE04  D0 02
    INC $09                      ; $EE06  E6 09

loc_3F_EE08:
    LDA $09                      ; $EE08  A5 09
    BNE loc_3F_EE18              ; $EE0A  D0 0C
    LDA $08                      ; $EE0C  A5 08
    CMP $01                      ; $EE0E  C5 01
    BCC loc_3F_EE14              ; $EE10  90 02
    BNE loc_3F_EE18              ; $EE12  D0 04

loc_3F_EE14:
    LDA #$01                     ; $EE14  A9 01
    STA $11                      ; $EE16  85 11

loc_3F_EE18:
    RTS                          ; $EE18  60


sub_3F_EE19:
    STA $00                      ; $EE19  85 00
    CLC                          ; $EE1B  18
    LDA $05B1,X                  ; $EE1C  BD B1 05
    ADC $EEF8,Y                  ; $EE1F  79 F8 EE
    STA $05B1,X                  ; $EE22  9D B1 05
    STA $EB                      ; $EE25  85 EB
    LDA $05C8,X                  ; $EE27  BD C8 05
    ADC $EF02,Y                  ; $EE2A  79 02 EF
    STA $05C8,X                  ; $EE2D  9D C8 05
    STA $ED                      ; $EE30  85 ED
    LDY $00                      ; $EE32  A4 00
    CPY #$FF                     ; $EE34  C0 FF
    BEQ loc_3F_EE49              ; $EE36  F0 11
    CMP $EE63,Y                  ; $EE38  D9 63 EE
    BNE loc_3F_EE49              ; $EE3B  D0 0C
    LDA $EE66,Y                  ; $EE3D  B9 66 EE
    CMP $EB                      ; $EE40  C5 EB
    BCS loc_3F_EE49              ; $EE42  B0 05
    STA $05B1,X                  ; $EE44  9D B1 05
    STA $EB                      ; $EE47  85 EB

loc_3F_EE49:
    LDA $03CE,X                  ; $EE49  BD CE 03
    CMP #$0C                     ; $EE4C  C9 0C
    BNE loc_3F_EE62              ; $EE4E  D0 12
    LDA $EB                      ; $EE50  A5 EB
    EOR #$FF                     ; $EE52  49 FF
    STA $EB                      ; $EE54  85 EB
    LDA $ED                      ; $EE56  A5 ED
    EOR #$FF                     ; $EE58  49 FF
    STA $ED                      ; $EE5A  85 ED
    INC $EB                      ; $EE5C  E6 EB
    BNE loc_3F_EE62              ; $EE5E  D0 02
    INC $ED                      ; $EE60  E6 ED

loc_3F_EE62:
    RTS                          ; $EE62  60

    .byte $01,$03,$02,$80,$00,$80,$38,$BD,$B1,$05,$F9,$F8,$EE,$9D,$B1,$05  ; $EE63
    .byte $85,$EB,$BD,$C8,$05,$F9,$02,$EF,$9D,$C8,$05,$85,$ED,$BD,$CE,$03  ; $EE73
    .byte $C9,$0C,$D0,$41,$A5,$EB,$49,$FF,$85,$EB,$A5,$ED,$49,$FF,$85,$ED  ; $EE83
    .byte $E6,$EB,$D0,$31,$E6,$ED,$60  ; $EE93

sub_3F_EE9A:
    CLC                          ; $EE9A  18
    LDA $060D,X                  ; $EE9B  BD 0D 06
    ADC $EEF8,Y                  ; $EE9E  79 F8 EE
    STA $060D,X                  ; $EEA1  9D 0D 06
    STA $EC                      ; $EEA4  85 EC
    LDA $0624,X                  ; $EEA6  BD 24 06
    ADC $EF02,Y                  ; $EEA9  79 02 EF
    STA $0624,X                  ; $EEAC  9D 24 06
    STA $EE                      ; $EEAF  85 EE
    LDA $03CE,X                  ; $EEB1  BD CE 03
    BNE loc_3F_EEC8              ; $EEB4  D0 12
    LDA $EC                      ; $EEB6  A5 EC
    EOR #$FF                     ; $EEB8  49 FF
    STA $EC                      ; $EEBA  85 EC
    LDA $EE                      ; $EEBC  A5 EE
    EOR #$FF                     ; $EEBE  49 FF
    STA $EE                      ; $EEC0  85 EE
    INC $EC                      ; $EEC2  E6 EC
    BNE loc_3F_EEC8              ; $EEC4  D0 02
    INC $EE                      ; $EEC6  E6 EE

loc_3F_EEC8:
    RTS                          ; $EEC8  60


sub_3F_EEC9:
    SEC                          ; $EEC9  38
    LDA $060D,X                  ; $EECA  BD 0D 06
    SBC $EEF8,Y                  ; $EECD  F9 F8 EE
    STA $060D,X                  ; $EED0  9D 0D 06
    STA $EC                      ; $EED3  85 EC
    LDA $0624,X                  ; $EED5  BD 24 06
    SBC $EF02,Y                  ; $EED8  F9 02 EF
    STA $0624,X                  ; $EEDB  9D 24 06
    STA $EE                      ; $EEDE  85 EE
    LDA $03CE,X                  ; $EEE0  BD CE 03
    BNE loc_3F_EEC8              ; $EEE3  D0 E3
    LDA $EC                      ; $EEE5  A5 EC
    EOR #$FF                     ; $EEE7  49 FF
    STA $EC                      ; $EEE9  85 EC
    LDA $EE                      ; $EEEB  A5 EE
    EOR #$FF                     ; $EEED  49 FF
    STA $EE                      ; $EEEF  85 EE
    INC $EC                      ; $EEF1  E6 EC
    BNE loc_3F_EEC8              ; $EEF3  D0 D3
    INC $EE                      ; $EEF5  E6 EE
    RTS                          ; $EEF7  60

    .byte $10,$08,$40,$2A,$1A,$80,$00,$20,$00,$30,$00,$00,$00,$00,$00,$00  ; $EEF8
    .byte $01,$00,$0C,$00  ; $EF08

sub_3F_EF0C:
    JSR sub_3F_E5B6              ; $EF0C  20 B6 E5
    LDA $11                      ; $EF0F  A5 11
    STA $03CE,X                  ; $EF11  9D CE 03
    JSR sub_3F_E5DF              ; $EF14  20 DF E5
    RTS                          ; $EF17  60


sub_3F_EF18:
    LDA $03CE,X                  ; $EF18  BD CE 03
    EOR #$08                     ; $EF1B  49 08
    STA $03CE,X                  ; $EF1D  9D CE 03
    LDA $03B7,X                  ; $EF20  BD B7 03
    EOR #$40                     ; $EF23  49 40
    STA $03B7,X                  ; $EF25  9D B7 03
    RTS                          ; $EF28  60

    .byte $A9,$01,$8D,$42,$06,$A9,$FF,$8D,$ED,$03,$A9,$F1,$85,$DC,$20,$DD  ; $EF29
    .byte $E1,$20,$4A,$CF,$A9,$04,$20,$F6,$C5,$A2,$08,$A9,$31,$85,$DC,$EE  ; $EF39
    .byte $ED,$03,$AD,$ED,$03,$C9,$1B,$90,$E5,$60,$38,$C8,$38,$C8,$30,$C0  ; $EF49
    .byte $C0,$30,$A9,$5A,$8D,$2C,$06,$A2,$08,$BD,$6C,$05,$F0,$5C,$A4,$51  ; $EF59
    .byte $C0,$08,$90,$17,$29,$F0,$C9,$10,$F0,$11,$4A,$85,$00,$A5,$51,$38  ; $EF69
    .byte $E9,$08,$05,$00,$A8,$B9,$E0,$EF,$4C,$87,$EF,$BD,$6C,$05,$29,$0F  ; $EF79
    .byte $85,$00,$A9,$00,$9D,$6C,$05,$BD,$DF,$05,$D0,$2E,$A5,$00,$F0,$2A  ; $EF89
    .byte $A9,$35,$85,$DC,$BD,$E5,$03,$38,$E5,$00,$9D,$E5,$03,$10,$11,$BD  ; $EF99
    .byte $24,$06,$20,$EF,$C9,$20,$F1,$D6,$A9,$00,$8D,$C7,$05,$4C,$56,$E4  ; $EFA9
    .byte $A9,$BB,$20,$EF,$C9,$A9,$20,$9D,$DF,$05,$BD,$DF,$05,$F0,$15,$29  ; $EFB9
    .byte $07,$D0,$04,$A9,$BB,$D0,$07,$29,$03,$D0,$06,$BD,$24,$06,$20,$EF  ; $EFC9
    .byte $C9,$DE,$DF,$05,$4C,$68,$E4,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $EFD9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $EFE9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $EFF9
    .byte $02,$01,$01,$04,$02,$00,$01,$00,$01,$01,$01,$01,$04,$00,$01,$00  ; $F009
    .byte $01,$03,$01,$01,$01,$00,$01,$00,$01,$01,$04,$01,$01,$00,$01,$00  ; $F019
    .byte $01,$01,$01,$01,$01,$00,$01,$00,$02,$01,$01,$01,$01,$00,$02,$00  ; $F029
    .byte $03,$01,$01,$01,$01,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $F039
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$F0,$10,$00,$FF,$00,$84,$84,$84  ; $F049
    .byte $84,$81,$80,$82,$83  ; $F059

sub_3F_F05E:
    JSR sub_3E_CB28              ; $F05E  20 28 CB
    KIL                          ; $F061  42
    JSR sub_3E_C9BF              ; $F062  20 BF C9
    LDA #$25                     ; $F065  A9 25
    JSR sub_3E_C9EF              ; $F067  20 EF C9
    LDA #$12                     ; $F06A  A9 12
    JSR sub_3E_CB28              ; $F06C  20 28 CB
    BRK                          ; $F06F  00
    LDA #$8A                     ; $F070  A9 8A
    JSR sub_3E_CAA4              ; $F072  20 A4 CA
    LDA #$1D                     ; $F075  A9 1D
    JSR sub_3E_CAA4              ; $F077  20 A4 CA
    LDA #$79                     ; $F07A  A9 79
    JSR sub_3E_CAA4              ; $F07C  20 A4 CA
    LDA #$7A                     ; $F07F  A9 7A
    JSR sub_3E_CAA4              ; $F081  20 A4 CA
    LDA #$0F                     ; $F084  A9 0F
    STA $DC                      ; $F086  85 DC
    LDX #$00                     ; $F088  A2 00
    STX $F7                      ; $F08A  86 F7
    STX $F9                      ; $F08C  86 F9
    STX $FA                      ; $F08E  86 FA
    LDY #$01                     ; $F090  A0 01
    JSR sub_3E_CB28              ; $F092  20 28 CB
    EOR ($A0,X)                  ; $F095  41 A0
    STA $2220,Y                  ; $F097  99 20 22
    SBC $A9                      ; $F09A  E5 A9
    STX $0C85                    ; $F09C  8E 85 0C
    LDA #$F2                     ; $F09F  A9 F2
    STA $0D                      ; $F0A1  85 0D
    JSR sub_3F_F258              ; $F0A3  20 58 F2
    LDA #$01                     ; $F0A6  A9 01
    STA $04                      ; $F0A8  85 04
    STA $05                      ; $F0AA  85 05
    LDA #$80                     ; $F0AC  A9 80
    STA $0486                    ; $F0AE  8D 86 04
    LDA #$6F                     ; $F0B1  A9 6F
    STA $04CB                    ; $F0B3  8D CB 04
    LDA #$08                     ; $F0B6  A9 08
    STA $05C8                    ; $F0B8  8D C8 05
    LDY #$07                     ; $F0BB  A0 07
    STY $06A9                    ; $F0BD  8C A9 06

loc_3F_F0C0:
    LDY $06A9                    ; $F0C0  AC A9 06
    JSR sub_3F_F52F              ; $F0C3  20 2F F5
    BCC loc_3F_F0ED              ; $F0C6  90 25
    DEC $05C8                    ; $F0C8  CE C8 05
    LDA #$16                     ; $F0CB  A9 16
    SEC                          ; $F0CD  38
    SBC $06A9                    ; $F0CE  ED A9 06
    TAX                          ; $F0D1  AA
    JSR sub_3F_F51C              ; $F0D2  20 1C F5
    BCS loc_3F_F0DC              ; $F0D5  B0 05
    LDA #$00                     ; $F0D7  A9 00
    STA $03A0,X                  ; $F0D9  9D A0 03

loc_3F_F0DC:
    LDA $F056,Y                  ; $F0DC  B9 56 F0
    TAY                          ; $F0DF  A8
    JSR sub_3F_E522              ; $F0E0  20 22 E5
    LDY $06A9                    ; $F0E3  AC A9 06
    LDA $F6C7,Y                  ; $F0E6  B9 C7 F6
    JSR sub_3E_CB28              ; $F0E9  20 28 CB
    BRK                          ; $F0EC  00

loc_3F_F0ED:
    DEC $06A9                    ; $F0ED  CE A9 06
    BPL loc_3F_F0C0              ; $F0F0  10 CE
    LDA $05C8                    ; $F0F2  AD C8 05
    BNE loc_3F_F100              ; $F0F5  D0 09
    LDA $51                      ; $F0F7  A5 51
    AND #$08                     ; $F0F9  29 08
    BEQ loc_3F_F100              ; $F0FB  F0 03
    JMP loc_3F_F193              ; $F0FD  4C 93 F1


loc_3F_F100:
    JSR sub_3F_E1DD              ; $F100  20 DD E1
    JSR sub_3E_CA89              ; $F103  20 89 CA
    LDA $05C8                    ; $F106  AD C8 05
    BNE loc_3F_F124              ; $F109  D0 19
    JSR sub_3F_F6D9              ; $F10B  20 D9 F6
    JSR sub_3F_F6D9              ; $F10E  20 D9 F6
    LDA #$E0                     ; $F111  A9 E0
    JSR sub_3E_C9EF              ; $F113  20 EF C9
    LDA #$45                     ; $F116  A9 45
    JSR sub_3E_CB28              ; $F118  20 28 CB
    BRK                          ; $F11B  00
    .byte $A9,$00,$8D,$AE,$03,$20,$DD,$E1  ; $F11C

loc_3F_F124:
    LDY $04                      ; $F124  A4 04
    LDA $F21C,Y                  ; $F126  B9 1C F2
    STA $0486                    ; $F129  8D 86 04
    LDY $05                      ; $F12C  A4 05
    LDA $F21F,Y                  ; $F12E  B9 1F F2
    STA $04CB                    ; $F131  8D CB 04

loc_3F_F134:
    JSR sub_3E_C62B              ; $F134  20 2B C6
    JSR sub_3F_E1DD              ; $F137  20 DD E1
    LDA $42                      ; $F13A  A5 42
    AND #$0F                     ; $F13C  29 0F
    BEQ loc_3F_F16D              ; $F13E  F0 2D
    AND #$03                     ; $F140  29 03
    TAY                          ; $F142  A8
    LDA $F22A,Y                  ; $F143  B9 2A F2
    CLC                          ; $F146  18
    ADC $04                      ; $F147  65 04
    AND #$07                     ; $F149  29 07
    TAY                          ; $F14B  A8
    LDA $F222,Y                  ; $F14C  B9 22 F2
    STA $04                      ; $F14F  85 04
    LDA $42                      ; $F151  A5 42
    AND #$0C                     ; $F153  29 0C
    LSR A                        ; $F155  4A
    LSR A                        ; $F156  4A
    TAY                          ; $F157  A8
    LDA $F22A,Y                  ; $F158  B9 2A F2
    CLC                          ; $F15B  18
    ADC $05                      ; $F15C  65 05
    AND #$07                     ; $F15E  29 07
    TAY                          ; $F160  A8
    LDA $F222,Y                  ; $F161  B9 22 F2
    STA $05                      ; $F164  85 05
    LDA #$32                     ; $F166  A9 32
    STA $DC                      ; $F168  85 DC
    JMP loc_3F_F124              ; $F16A  4C 24 F1


loc_3F_F16D:
    LDA $42                      ; $F16D  A5 42
    AND #$90                     ; $F16F  29 90
    BEQ loc_3F_F134              ; $F171  F0 C1
    LDA #$38                     ; $F173  A9 38
    STA $DC                      ; $F175  85 DC
    LDA $05                      ; $F177  A5 05
    ASL A                        ; $F179  0A
    ASL A                        ; $F17A  0A
    ORA $04                      ; $F17B  05 04
    TAY                          ; $F17D  A8
    LDA $F22E,Y                  ; $F17E  B9 2E F2
    BPL loc_3F_F18A              ; $F181  10 07
    LDA $05C8                    ; $F183  AD C8 05
    BNE loc_3F_F134              ; $F186  D0 AC
    LDA #$08                     ; $F188  A9 08

loc_3F_F18A:
    STA $51                      ; $F18A  85 51
    LDA #$33                     ; $F18C  A9 33
    STA $DC                      ; $F18E  85 DC
    JSR sub_3E_CA3D              ; $F190  20 3D CA

loc_3F_F193:
    LDA $51                      ; $F193  A5 51
    BIT $FF5C                    ; $F195  2C 5C FF
    BEQ loc_3F_F1A8              ; $F198  F0 0E
    AND #$04                     ; $F19A  29 04
    BEQ loc_3F_F1A1              ; $F19C  F0 03
    JMP sub_3F_F6CF              ; $F19E  4C CF F6


loc_3F_F1A1:
    JMP loc_3F_F6D4              ; $F1A1  4C D4 F6

    .byte $20,$2B,$C6,$60  ; $F1A4

loc_3F_F1A8:
    JSR sub_3E_C9BF              ; $F1A8  20 BF C9
    JSR sub_3E_CB28              ; $F1AB  20 28 CB
    SLO ($60,X)                  ; $F1AE  03 60

loc_3F_F1B0:
    LDA #$3A                     ; $F1B0  A9 3A
    JSR sub_3E_C9EF              ; $F1B2  20 EF C9
    LDA #$03                     ; $F1B5  A9 03
    JSR sub_3E_C5F6              ; $F1B7  20 F6 C5
    LDA #$3B                     ; $F1BA  A9 3B
    JSR sub_3E_C9EF              ; $F1BC  20 EF C9
    LDA #$03                     ; $F1BF  A9 03
    JSR sub_3E_C5F6              ; $F1C1  20 F6 C5
    LDA #$5F                     ; $F1C4  A9 5F
    JSR sub_3E_C9EF              ; $F1C6  20 EF C9
    LDA #$03                     ; $F1C9  A9 03
    JSR sub_3E_C5F6              ; $F1CB  20 F6 C5
    JMP loc_3F_F1B0              ; $F1CE  4C B0 F1


loc_3F_F1D1:
    LDA #$60                     ; $F1D1  A9 60
    JSR sub_3E_C9EF              ; $F1D3  20 EF C9
    LDA #$05                     ; $F1D6  A9 05
    JSR sub_3E_C5F6              ; $F1D8  20 F6 C5
    LDA #$61                     ; $F1DB  A9 61
    JSR sub_3E_C9EF              ; $F1DD  20 EF C9
    LDA #$05                     ; $F1E0  A9 05
    JSR sub_3E_C5F6              ; $F1E2  20 F6 C5
    LDA #$62                     ; $F1E5  A9 62
    JSR sub_3E_C9EF              ; $F1E7  20 EF C9
    LDA #$05                     ; $F1EA  A9 05
    JSR sub_3E_C5F6              ; $F1EC  20 F6 C5
    LDA #$63                     ; $F1EF  A9 63
    JSR sub_3E_C9EF              ; $F1F1  20 EF C9
    LDA #$05                     ; $F1F4  A9 05
    JSR sub_3E_C5F6              ; $F1F6  20 F6 C5
    JMP loc_3F_F1D1              ; $F1F9  4C D1 F1

    .byte $00,$1B,$36,$24,$12,$2E,$09,$3E,$07,$23,$3A,$29,$1A,$33,$11,$41  ; $F1FC
    .byte $36,$3F,$45,$43,$3E,$44,$39,$46,$64,$73,$86,$84,$6E,$85,$65,$83  ; $F20C
    .byte $30,$80,$D0,$2F,$6F,$AF,$00,$01,$02,$00,$00,$00,$00,$02,$00,$01  ; $F21C
    .byte $FF,$00,$00,$01,$03,$FF,$02,$FF,$05,$FF,$04,$06,$07,$FF,$FF,$FF  ; $F22C
    .byte $FF,$FF,$08,$0C,$09,$FF,$0D,$FF,$0E,$FF,$0A,$0B,$0F,$FF,$20,$2B  ; $F23C
    .byte $C6,$A5,$42,$29,$90,$F0,$F7,$60  ; $F24C

sub_3F_F254:
    LDA #$60                     ; $F254  A9 60
    BNE loc_3F_F25A              ; $F256  D0 02

sub_3F_F258:
    LDA #$90                     ; $F258  A9 90

loc_3F_F25A:
    STA $07                      ; $F25A  85 07
    LDX #$16                     ; $F25C  A2 16
    LDY #$00                     ; $F25E  A0 00
    STY $06                      ; $F260  84 06

loc_3F_F262:
    LDA $03A0,X                  ; $F262  BD A0 03
    BNE loc_3F_F28A              ; $F265  D0 23
    LDY $06                      ; $F267  A4 06
    LDA ($0C),Y                  ; $F269  B1 0C
    BEQ loc_3F_F28D              ; $F26B  F0 20
    LDY $07                      ; $F26D  A4 07
    JSR sub_3E_CB28              ; $F26F  20 28 CB
    EOR ($A4,X)                  ; $F272  41 A4
    ASL $B1                      ; $F274  06 B1
    NOP $9DC8                    ; $F276  0C C8 9D
    STX $04                      ; $F279  86 04
    LDA ($0C),Y                  ; $F27B  B1 0C
    STA $04CB,X                  ; $F27D  9D CB 04
    INY                          ; $F280  C8
    LDA ($0C),Y                  ; $F281  B1 0C
    INY                          ; $F283  C8
    STY $06                      ; $F284  84 06
    TAY                          ; $F286  A8
    JSR sub_3F_E522              ; $F287  20 22 E5

loc_3F_F28A:
    DEX                          ; $F28A  CA
    BPL loc_3F_F262              ; $F28B  10 D5

loc_3F_F28D:
    RTS                          ; $F28D  60

    .byte $30,$2F,$43,$80,$2F,$44,$30,$6F,$46,$D0,$2F,$45,$30,$AF,$48,$D0  ; $F28E
    .byte $6F,$47,$80,$AF,$49,$D0,$AF,$4A,$80,$73,$4E,$00  ; $F29E

sub_3F_F2AA:
    RTS                          ; $F2AA  60


sub_3F_F2AB:
    JSR sub_3E_CB28              ; $F2AB  20 28 CB
    KIL                          ; $F2AE  42
    JSR sub_3E_CB28              ; $F2AF  20 28 CB
    JMP $2060                    ; $F2B2  4C 60 20

    .byte $AB,$F2  ; $F2B5
    JSR sub_3F_F473              ; $F2B7  20 73 F4
    JSR sub_3F_E1DD              ; $F2BA  20 DD E1
    JSR sub_3E_CB28              ; $F2BD  20 28 CB
    KIL                          ; $F2C0  02
    RTS                          ; $F2C1  60


sub_3F_F2C2:
    LDA #$15                     ; $F2C2  A9 15
    STA $DC                      ; $F2C4  85 DC
    JSR sub_3F_F2AB              ; $F2C6  20 AB F2
    LDX #$00                     ; $F2C9  A2 00
    LDY #$50                     ; $F2CB  A0 50
    JSR sub_3E_CB28              ; $F2CD  20 28 CB
    EOR ($8A,X)                  ; $F2D0  41 8A
    STA $05B1                    ; $F2D2  8D B1 05
    STA $05C8                    ; $F2D5  8D C8 05

loc_3F_F2D8:
    LDX #$00                     ; $F2D8  A2 00
    LDY #$A7                     ; $F2DA  A0 A7
    JSR sub_3F_E522              ; $F2DC  20 22 E5
    LDY $05B1                    ; $F2DF  AC B1 05
    LDA $F563,Y                  ; $F2E2  B9 63 F5
    STA $0486                    ; $F2E5  8D 86 04
    LDY $05C8                    ; $F2E8  AC C8 05
    LDA $F569,Y                  ; $F2EB  B9 69 F5
    STA $04CB                    ; $F2EE  8D CB 04
    JSR sub_3F_E1DD              ; $F2F1  20 DD E1

loc_3F_F2F4:
    JSR sub_3F_E1DD              ; $F2F4  20 DD E1
    JSR sub_3E_C62B              ; $F2F7  20 2B C6
    LDA $42                      ; $F2FA  A5 42
    BEQ loc_3F_F2F4              ; $F2FC  F0 F6
    BIT $FF5B                    ; $F2FE  2C 5B FF
    BNE loc_3F_F37A              ; $F301  D0 77
    BIT $FF58                    ; $F303  2C 58 FF
    BEQ loc_3F_F348              ; $F306  F0 40
    JSR sub_3F_F3AB              ; $F308  20 AB F3
    LDA $0300,Y                  ; $F30B  B9 00 03
    BEQ loc_3F_F320              ; $F30E  F0 10
    AND #$7F                     ; $F310  29 7F
    TAX                          ; $F312  AA
    LDA #$00                     ; $F313  A9 00
    STA $0300,Y                  ; $F315  99 00 03

loc_3F_F318:
    LDA #$00                     ; $F318  A9 00
    STA $03A0,X                  ; $F31A  9D A0 03
    JMP loc_3F_F2D8              ; $F31D  4C D8 F2


loc_3F_F320:
    LDY #$01                     ; $F320  A0 01
    JSR sub_3F_E5AB              ; $F322  20 AB E5
    BCS loc_3F_F2D8              ; $F325  B0 B1
    CPX #$10                     ; $F327  E0 10
    BEQ loc_3F_F318              ; $F329  F0 ED
    LDY #$9D                     ; $F32B  A0 9D
    JSR sub_3F_E522              ; $F32D  20 22 E5
    LDA $0486                    ; $F330  AD 86 04
    STA $0486,X                  ; $F333  9D 86 04
    LDA $04CB                    ; $F336  AD CB 04
    STA $04CB,X                  ; $F339  9D CB 04
    JSR sub_3F_F3AB              ; $F33C  20 AB F3
    TXA                          ; $F33F  8A
    ORA #$80                     ; $F340  09 80
    STA $0300,Y                  ; $F342  99 00 03
    JMP loc_3F_F2D8              ; $F345  4C D8 F2


loc_3F_F348:
    AND #$03                     ; $F348  29 03
    TAY                          ; $F34A  A8
    LDA $F22A,Y                  ; $F34B  B9 2A F2
    CLC                          ; $F34E  18
    ADC $05B1                    ; $F34F  6D B1 05
    AND #$07                     ; $F352  29 07
    TAY                          ; $F354  A8
    LDA $F54D,Y                  ; $F355  B9 4D F5
    CMP #$06                     ; $F358  C9 06
    BEQ loc_3F_F37A              ; $F35A  F0 1E
    STA $05B1                    ; $F35C  8D B1 05
    LDA $42                      ; $F35F  A5 42
    AND #$0C                     ; $F361  29 0C
    LSR A                        ; $F363  4A
    LSR A                        ; $F364  4A
    TAY                          ; $F365  A8
    LDA $F22A,Y                  ; $F366  B9 2A F2
    CLC                          ; $F369  18
    ADC $05C8                    ; $F36A  6D C8 05
    AND #$07                     ; $F36D  29 07
    TAY                          ; $F36F  A8
    LDA $F555,Y                  ; $F370  B9 55 F5
    STA $05C8                    ; $F373  8D C8 05
    JMP loc_3F_F2D8              ; $F376  4C D8 F2


loc_3F_F379:
    RTS                          ; $F379  60


loc_3F_F37A:
    LDA #$5B                     ; $F37A  A9 5B
    STA $04CB                    ; $F37C  8D CB 04
    LDA #$D4                     ; $F37F  A9 D4
    STA $0486                    ; $F381  8D 86 04
    LDX #$00                     ; $F384  A2 00
    LDY #$A8                     ; $F386  A0 A8
    JSR sub_3F_E522              ; $F388  20 22 E5

loc_3F_F38B:
    JSR sub_3F_E1DD              ; $F38B  20 DD E1
    JSR sub_3E_C62B              ; $F38E  20 2B C6
    LDA $42                      ; $F391  A5 42
    AND #$90                     ; $F393  29 90
    BNE loc_3F_F3CC              ; $F395  D0 35
    LDA $42                      ; $F397  A5 42
    AND #$03                     ; $F399  29 03
    BEQ loc_3F_F38B              ; $F39B  F0 EE
    LDY #$00                     ; $F39D  A0 00
    AND #$02                     ; $F39F  29 02
    BEQ loc_3F_F3A5              ; $F3A1  F0 02
    LDY #$05                     ; $F3A3  A0 05

loc_3F_F3A5:
    STY $05B1                    ; $F3A5  8C B1 05
    JMP loc_3F_F2D8              ; $F3A8  4C D8 F2


sub_3F_F3AB:
    LDY $05C8                    ; $F3AB  AC C8 05
    LDA $05B1                    ; $F3AE  AD B1 05
    CLC                          ; $F3B1  18
    ADC $F55D,Y                  ; $F3B2  79 5D F5
    TAY                          ; $F3B5  A8
    RTS                          ; $F3B6  60


sub_3F_F3B7:
    LDA #$00                     ; $F3B7  A9 00
    STA $05C8                    ; $F3B9  8D C8 05
    TYA                          ; $F3BC  98

loc_3F_F3BD:
    CMP #$06                     ; $F3BD  C9 06
    BCC loc_3F_F3C8              ; $F3BF  90 07
    INC $05C8                    ; $F3C1  EE C8 05
    SBC #$06                     ; $F3C4  E9 06
    BNE loc_3F_F3BD              ; $F3C6  D0 F5

loc_3F_F3C8:
    STA $05B1                    ; $F3C8  8D B1 05
    RTS                          ; $F3CB  60


loc_3F_F3CC:
    LDA #$FF                     ; $F3CC  A9 FF
    STA $0692                    ; $F3CE  8D 92 06
    STA $0693                    ; $F3D1  8D 93 06
    STA $0694                    ; $F3D4  8D 94 06
    STA $0695                    ; $F3D7  8D 95 06
    LDA #$00                     ; $F3DA  A9 00
    STA $00                      ; $F3DC  85 00
    STA $0696                    ; $F3DE  8D 96 06
    LDA $031C                    ; $F3E1  AD 1C 03
    ASL A                        ; $F3E4  0A
    ROL $00                      ; $F3E5  26 00
    LDA $031D                    ; $F3E7  AD 1D 03
    ASL A                        ; $F3EA  0A
    ROL $00                      ; $F3EB  26 00
    LDA $0322                    ; $F3ED  AD 22 03
    ASL A                        ; $F3F0  0A
    ROL $00                      ; $F3F1  26 00
    LDA $0323                    ; $F3F3  AD 23 03
    ASL A                        ; $F3F6  0A
    ROL $00                      ; $F3F7  26 00
    LDY $00                      ; $F3F9  A4 00
    LDA $F56F,Y                  ; $F3FB  B9 6F F5
    BMI loc_3F_F45D              ; $F3FE  30 5D
    TAY                          ; $F400  A8
    LDA $F583,Y                  ; $F401  B9 83 F5
    STA $0696                    ; $F404  8D 96 06
    LDA $F57F,Y                  ; $F407  B9 7F F5
    PHA                          ; $F40A  48
    CLC                          ; $F40B  18
    ADC #$8F                     ; $F40C  69 8F
    STA $08                      ; $F40E  85 08
    LDA #$F5                     ; $F410  A9 F5
    ADC #$00                     ; $F412  69 00
    STA $09                      ; $F414  85 09
    PLA                          ; $F416  68
    CLC                          ; $F417  18
    ADC #$1F                     ; $F418  69 1F
    STA $0A                      ; $F41A  85 0A
    LDA #$F6                     ; $F41C  A9 F6
    ADC #$00                     ; $F41E  69 00
    STA $0B                      ; $F420  85 0B
    LDY #$23                     ; $F422  A0 23

loc_3F_F424:
    LDA $0300,Y                  ; $F424  B9 00 03
    BEQ loc_3F_F438              ; $F427  F0 0F
    LDA ($08),Y                  ; $F429  B1 08
    BMI loc_3F_F438              ; $F42B  30 0B
    TAX                          ; $F42D  AA
    LDA $0692,X                  ; $F42E  BD 92 06
    BPL loc_3F_F45D              ; $F431  10 2A
    LDA ($0A),Y                  ; $F433  B1 0A
    STA $0692,X                  ; $F435  9D 92 06

loc_3F_F438:
    DEY                          ; $F438  88
    BPL loc_3F_F424              ; $F439  10 E9
    LDA $0692                    ; $F43B  AD 92 06
    ORA $0693                    ; $F43E  0D 93 06
    ORA $0694                    ; $F441  0D 94 06
    ORA $0695                    ; $F444  0D 95 06
    BMI loc_3F_F45D              ; $F447  30 14
    LDY #$03                     ; $F449  A0 03

loc_3F_F44B:
    LDA $0692,Y                  ; $F44B  B9 92 06
    AND #$04                     ; $F44E  29 04
    LSR A                        ; $F450  4A
    ORA $0692,Y                  ; $F451  19 92 06
    STA $0692,Y                  ; $F454  99 92 06
    DEY                          ; $F457  88
    BPL loc_3F_F44B              ; $F458  10 F1
    JMP loc_3F_F379              ; $F45A  4C 79 F3


loc_3F_F45D:
    LDA #$38                     ; $F45D  A9 38
    STA $DC                      ; $F45F  85 DC
    LDA #$16                     ; $F461  A9 16
    JSR sub_3E_CB28              ; $F463  20 28 CB
    BRK                          ; $F466  00
    .byte $20,$4A,$F2,$A9,$17,$20,$28,$CB,$00,$4C,$7A,$F3  ; $F467

sub_3F_F473:
    LDA $F3                      ; $F473  A5 F3
    AND #$02                     ; $F475  29 02
    ORA $0696                    ; $F477  0D 96 06
    PHA                          ; $F47A  48
    TAY                          ; $F47B  A8
    LDA $F57F,Y                  ; $F47C  B9 7F F5
    PHA                          ; $F47F  48
    CLC                          ; $F480  18
    ADC #$8F                     ; $F481  69 8F
    STA $0C                      ; $F483  85 0C
    LDA #$F5                     ; $F485  A9 F5
    ADC #$00                     ; $F487  69 00
    STA $0D                      ; $F489  85 0D
    PLA                          ; $F48B  68
    CLC                          ; $F48C  18
    ADC #$1F                     ; $F48D  69 1F
    STA $0E                      ; $F48F  85 0E
    LDA #$F6                     ; $F491  A9 F6
    ADC #$00                     ; $F493  69 00
    STA $0F                      ; $F495  85 0F
    LDY #$01                     ; $F497  A0 01
    JSR sub_3F_E5AB              ; $F499  20 AB E5
    LDY #$9D                     ; $F49C  A0 9D
    JSR sub_3F_E522              ; $F49E  20 22 E5
    PLA                          ; $F4A1  68
    TAY                          ; $F4A2  A8
    LDA $F587,Y                  ; $F4A3  B9 87 F5
    STA $0486,X                  ; $F4A6  9D 86 04
    LDA $F58B,Y                  ; $F4A9  B9 8B F5
    STA $04CB,X                  ; $F4AC  9D CB 04
    LDX #$03                     ; $F4AF  A2 03

loc_3F_F4B1:
    LDY #$24                     ; $F4B1  A0 24

loc_3F_F4B3:
    TXA                          ; $F4B3  8A

loc_3F_F4B4:
    DEY                          ; $F4B4  88
    CMP ($0C),Y                  ; $F4B5  D1 0C
    BNE loc_3F_F4B4              ; $F4B7  D0 FB
    LDA $0692,X                  ; $F4B9  BD 92 06
    CMP ($0E),Y                  ; $F4BC  D1 0E
    BNE loc_3F_F4B3              ; $F4BE  D0 F3
    JSR sub_3F_F3B7              ; $F4C0  20 B7 F3
    TXA                          ; $F4C3  8A
    PHA                          ; $F4C4  48
    LDY #$01                     ; $F4C5  A0 01
    JSR sub_3F_E5AB              ; $F4C7  20 AB E5
    LDY #$9D                     ; $F4CA  A0 9D
    JSR sub_3F_E522              ; $F4CC  20 22 E5
    LDY $05B1                    ; $F4CF  AC B1 05
    LDA $F563,Y                  ; $F4D2  B9 63 F5
    STA $0486,X                  ; $F4D5  9D 86 04
    LDY $05C8                    ; $F4D8  AC C8 05
    LDA $F569,Y                  ; $F4DB  B9 69 F5
    STA $04CB,X                  ; $F4DE  9D CB 04
    PLA                          ; $F4E1  68
    TAX                          ; $F4E2  AA
    DEX                          ; $F4E3  CA
    BPL loc_3F_F4B1              ; $F4E4  10 CB
    RTS                          ; $F4E6  60

    .byte $A4,$51,$C0,$08,$B0,$26,$B9,$AF,$F6,$AA,$A5,$57,$D9,$14,$F5,$D0  ; $F4E7
    .byte $0D,$A9,$04,$8D,$A5,$06,$B9,$BF,$F6,$19,$B7,$F6,$D0,$08,$A9,$00  ; $F4F7
    .byte $8D,$A5,$06,$B9,$B7,$F6,$1D,$92,$06,$9D,$92,$06,$60,$FF,$FF,$FF  ; $F507
    .byte $FF,$1D,$1F,$1A,$17  ; $F517

sub_3F_F51C:
    LDA $F6BF,Y                  ; $F51C  B9 BF F6
    STA $00                      ; $F51F  85 00
    BNE loc_3F_F534              ; $F521  D0 11
    LDA $F6BF,Y                  ; $F523  B9 BF F6
    STA $00                      ; $F526  85 00
    LDA $57                      ; $F528  A5 57
    CMP $F514,Y                  ; $F52A  D9 14 F5
    BEQ loc_3F_F534              ; $F52D  F0 05

sub_3F_F52F:
    LDA $F6B7,Y                  ; $F52F  B9 B7 F6
    STA $00                      ; $F532  85 00

loc_3F_F534:
    TXA                          ; $F534  8A
    PHA                          ; $F535  48
    CPY #$08                     ; $F536  C0 08
    BCS loc_3F_F549              ; $F538  B0 0F
    LDA $F6AF,Y                  ; $F53A  B9 AF F6
    TAX                          ; $F53D  AA
    LDA $0692,X                  ; $F53E  BD 92 06
    AND $00                      ; $F541  25 00
    BEQ loc_3F_F549              ; $F543  F0 04
    PLA                          ; $F545  68
    TAX                          ; $F546  AA
    SEC                          ; $F547  38
    RTS                          ; $F548  60


loc_3F_F549:
    PLA                          ; $F549  68
    TAX                          ; $F54A  AA
    CLC                          ; $F54B  18
    RTS                          ; $F54C  60

    .byte $00,$01,$02,$03,$04,$05,$06,$06,$00,$01,$02,$03,$04,$05,$00,$05  ; $F54D
    .byte $00,$06,$0C,$12,$18,$1E,$3C,$4C,$5C,$6C,$7C,$8C,$33,$43,$53,$63  ; $F55D
    .byte $73,$83,$FF,$03,$02,$FF,$00,$FF,$FF,$FF,$01,$FF,$FF,$FF,$FF,$FF  ; $F56D
    .byte $FF,$FF,$48,$00,$6C,$24,$00,$01,$00,$01,$8C,$7C,$7C,$8C,$73,$73  ; $F57D
    .byte $83,$83,$00,$00,$01,$01,$03,$03,$00,$00,$01,$01,$03,$03,$00,$00  ; $F58D
    .byte $02,$02,$03,$03,$00,$00,$02,$02,$03,$03,$01,$01,$02,$02,$FF,$FF  ; $F59D
    .byte $01,$01,$02,$02,$FF,$FF,$03,$03,$00,$00,$01,$01,$03,$03,$00,$00  ; $F5AD
    .byte $01,$01,$01,$01,$00,$00,$02,$02,$01,$01,$00,$00,$02,$02,$03,$03  ; $F5BD
    .byte $02,$02,$FF,$FF,$03,$03,$02,$02,$FF,$FF,$01,$00,$02,$01,$03,$03  ; $F5CD
    .byte $00,$01,$00,$03,$01,$03,$02,$01,$00,$02,$00,$01,$02,$00,$01,$02  ; $F5DD
    .byte $00,$01,$03,$03,$00,$02,$FF,$FF,$03,$02,$03,$02,$FF,$FF,$02,$00  ; $F5ED
    .byte $03,$03,$03,$00,$01,$02,$01,$00,$01,$01,$02,$00,$03,$03,$03,$00  ; $F5FD
    .byte $01,$02,$01,$00,$01,$01,$02,$00,$03,$03,$FF,$FF,$02,$02,$02,$00  ; $F60D
    .byte $FF,$FF,$00,$01,$04,$05,$00,$01,$02,$03,$06,$07,$02,$03,$04,$05  ; $F61D
    .byte $00,$01,$04,$05,$06,$07,$02,$03,$06,$07,$00,$01,$04,$05,$00,$00  ; $F62D
    .byte $02,$03,$06,$07,$00,$00,$00,$01,$00,$01,$04,$05,$02,$03,$02,$03  ; $F63D
    .byte $06,$07,$00,$01,$04,$05,$00,$01,$02,$03,$06,$07,$02,$03,$04,$05  ; $F64D
    .byte $04,$05,$00,$00,$06,$07,$06,$07,$00,$00,$00,$03,$06,$04,$01,$02  ; $F65D
    .byte $00,$01,$04,$00,$05,$03,$04,$02,$01,$00,$05,$06,$05,$06,$03,$01  ; $F66D
    .byte $02,$07,$06,$04,$07,$02,$00,$00,$07,$07,$05,$03,$00,$00,$01,$00  ; $F67D
    .byte $00,$01,$02,$06,$00,$00,$01,$03,$02,$06,$02,$01,$04,$06,$07,$07  ; $F68D
    .byte $03,$04,$04,$04,$05,$07,$03,$02,$03,$05,$00,$00,$06,$05,$07,$05  ; $F69D
    .byte $00,$00,$00,$01,$03,$02,$01,$00,$03,$02,$01,$01,$01,$01,$02,$02  ; $F6AD
    .byte $02,$02,$01,$01,$01,$01,$04,$04,$04,$04,$30,$31,$33,$32,$35,$34  ; $F6BD
    .byte $36,$37  ; $F6CD

sub_3F_F6CF:
    JSR sub_3E_CB28              ; $F6CF  20 28 CB
    PHA                          ; $F6D2  48
    RTS                          ; $F6D3  60


loc_3F_F6D4:
    JSR sub_3E_CB28              ; $F6D4  20 28 CB
    EOR #$60                     ; $F6D7  49 60

sub_3F_F6D9:
    LDX #$04                     ; $F6D9  A2 04

loc_3F_F6DB:
    LDA #$61                     ; $F6DB  A9 61
    STA $DC                      ; $F6DD  85 DC
    LDA #$30                     ; $F6DF  A9 30
    STA $0370                    ; $F6E1  8D 70 03
    INC $46                      ; $F6E4  E6 46
    LDA #$02                     ; $F6E6  A9 02
    JSR sub_3E_C5F6              ; $F6E8  20 F6 C5
    LDA #$0F                     ; $F6EB  A9 0F
    STA $0370                    ; $F6ED  8D 70 03
    INC $46                      ; $F6F0  E6 46
    LDA #$02                     ; $F6F2  A9 02
    JSR sub_3E_C5F6              ; $F6F4  20 F6 C5
    DEX                          ; $F6F7  CA
    BNE loc_3F_F6DB              ; $F6F8  D0 E1
    RTS                          ; $F6FA  60


sub_3F_F6FB:
    JSR sub_3E_CB28              ; $F6FB  20 28 CB
    LSR A                        ; $F6FE  4A
    RTS                          ; $F6FF  60

    .byte $03,$02,$05,$04,$01,$07,$06,$08,$00,$57,$5D,$58,$59,$5A,$5C,$5B  ; $F700
    .byte $00,$29,$BD,$86,$04,$85,$00,$BD,$6F,$04,$85,$01,$BD,$CB,$04,$85  ; $F710
    .byte $02,$BD,$B4,$04,$85,$03  ; $F720

sub_3F_F726:
    LDA $0486,Y                  ; $F726  B9 86 04
    STA $04                      ; $F729  85 04
    LDA $046F,Y                  ; $F72B  B9 6F 04
    STA $05                      ; $F72E  85 05
    LDA $04CB,Y                  ; $F730  B9 CB 04
    STA $06                      ; $F733  85 06
    LDA $04B4,Y                  ; $F735  B9 B4 04
    STA $07                      ; $F738  85 07
    TXA                          ; $F73A  8A
    PHA                          ; $F73B  48
    TYA                          ; $F73C  98
    PHA                          ; $F73D  48
    LDA #$00                     ; $F73E  A9 00
    STA $11                      ; $F740  85 11
    LDY $08                      ; $F742  A4 08
    LDX $0A                      ; $F744  A6 0A
    LDA $F7DC,X                  ; $F746  BD DC F7
    CLC                          ; $F749  18
    ADC $F7DC,Y                  ; $F74A  79 DC F7
    STA $08                      ; $F74D  85 08
    LDA $F845,X                  ; $F74F  BD 45 F8
    CLC                          ; $F752  18
    ADC $F845,Y                  ; $F753  79 45 F8
    STA $09                      ; $F756  85 09
    LDA $00                      ; $F758  A5 00
    SEC                          ; $F75A  38
    SBC $04                      ; $F75B  E5 04
    STA $04                      ; $F75D  85 04
    STA $0A                      ; $F75F  85 0A
    LDA $01                      ; $F761  A5 01
    SBC $05                      ; $F763  E5 05
    BMI loc_3F_F76F              ; $F765  30 08
    BNE loc_3F_F7A4              ; $F767  D0 3B
    LDA $04                      ; $F769  A5 04
    BEQ loc_3F_F77F              ; $F76B  F0 12
    BNE loc_3F_F777              ; $F76D  D0 08

loc_3F_F76F:
    LDA $04                      ; $F76F  A5 04
    EOR #$FF                     ; $F771  49 FF
    STA $04                      ; $F773  85 04
    INC $04                      ; $F775  E6 04

loc_3F_F777:
    LDA $04                      ; $F777  A5 04
    CMP $08                      ; $F779  C5 08
    BCC loc_3F_F77F              ; $F77B  90 02
    BNE loc_3F_F7A4              ; $F77D  D0 25

loc_3F_F77F:
    LDA $02                      ; $F77F  A5 02
    SEC                          ; $F781  38
    SBC $06                      ; $F782  E5 06
    STA $06                      ; $F784  85 06
    STA $0B                      ; $F786  85 0B
    LDA $03                      ; $F788  A5 03
    SBC $07                      ; $F78A  E5 07
    BMI loc_3F_F796              ; $F78C  30 08
    BNE loc_3F_F7A4              ; $F78E  D0 14
    LDA $06                      ; $F790  A5 06
    BEQ loc_3F_F7A9              ; $F792  F0 15
    BNE loc_3F_F79E              ; $F794  D0 08

loc_3F_F796:
    LDA $06                      ; $F796  A5 06
    EOR #$FF                     ; $F798  49 FF
    STA $06                      ; $F79A  85 06
    INC $06                      ; $F79C  E6 06

loc_3F_F79E:
    LDA $06                      ; $F79E  A5 06
    CMP $09                      ; $F7A0  C5 09
    BCC loc_3F_F7A9              ; $F7A2  90 05

loc_3F_F7A4:
    PLA                          ; $F7A4  68
    TAY                          ; $F7A5  A8
    PLA                          ; $F7A6  68
    TAX                          ; $F7A7  AA
    RTS                          ; $F7A8  60


loc_3F_F7A9:
    LDA #$03                     ; $F7A9  A9 03
    STA $11                      ; $F7AB  85 11
    LDA $08                      ; $F7AD  A5 08
    SEC                          ; $F7AF  38
    SBC $04                      ; $F7B0  E5 04
    STA $ED                      ; $F7B2  85 ED
    STA $EB                      ; $F7B4  85 EB
    LDA $0A                      ; $F7B6  A5 0A
    BPL loc_3F_F7C2              ; $F7B8  10 08
    LDA $ED                      ; $F7BA  A5 ED
    EOR #$FF                     ; $F7BC  49 FF
    STA $ED                      ; $F7BE  85 ED
    INC $ED                      ; $F7C0  E6 ED

loc_3F_F7C2:
    LDA $09                      ; $F7C2  A5 09
    SEC                          ; $F7C4  38
    SBC $06                      ; $F7C5  E5 06
    STA $EE                      ; $F7C7  85 EE
    STA $EC                      ; $F7C9  85 EC
    LDA $0B                      ; $F7CB  A5 0B
    BPL loc_3F_F7A4              ; $F7CD  10 D5
    LDA $EE                      ; $F7CF  A5 EE
    EOR #$FF                     ; $F7D1  49 FF
    STA $EE                      ; $F7D3  85 EE
    INC $EE                      ; $F7D5  E6 EE
    PLA                          ; $F7D7  68
    TAY                          ; $F7D8  A8
    PLA                          ; $F7D9  68
    TAX                          ; $F7DA  AA
    RTS                          ; $F7DB  60

    .byte $08,$02,$08,$08,$08,$08,$08,$04,$05,$06,$04,$04,$10,$05,$05,$08  ; $F7DC
    .byte $0F,$04,$04,$04,$04,$04,$04,$08,$0A,$7F,$16,$10,$08,$08,$08,$08  ; $F7EC
    .byte $08,$04,$20,$08,$04,$10,$0C,$05,$06,$05,$07,$0C,$0C,$0C,$0C,$0C  ; $F7FC
    .byte $0A,$0C,$0A,$0C,$12,$0C,$08,$02,$02,$0C,$0C,$06,$08,$04,$0C,$08  ; $F80C
    .byte $08,$08,$06,$08,$0C,$08,$08,$06,$08,$04,$0C,$28,$38,$04,$08,$0C  ; $F81C
    .byte $05,$08,$0F,$3C,$0A,$0E,$0C,$09,$08,$11,$09,$08,$08,$20,$30,$08  ; $F82C
    .byte $10,$18,$04,$0A,$0A,$12,$08,$18,$08,$0C,$02,$10,$09,$06,$08,$04  ; $F83C
    .byte $08,$05,$06,$0E,$04,$10,$07,$0C,$06,$14,$04,$04,$0A,$04,$05,$07  ; $F84C
    .byte $0C,$04,$08,$0A,$08,$05,$0D,$09,$08,$08,$04,$10,$0E,$04,$03,$14  ; $F85C
    .byte $0C,$01,$0A,$07,$14,$10,$10,$10,$10,$08,$10,$10,$0A,$10,$10,$04  ; $F86C
    .byte $08,$14,$10,$06,$02,$10,$04,$14,$10,$10,$0A,$16,$08,$0C,$06,$08  ; $F87C
    .byte $0C,$0C,$0C,$04,$20,$38,$7F,$03,$04,$0C,$08,$36,$14,$0A,$05,$04  ; $F88C
    .byte $04,$08,$06,$10,$08,$09,$20,$30,$10,$10,$18,$04,$0A,$10,$1C,$10  ; $F89C
    .byte $22,$0B  ; $F8AC

sub_3F_F8AE:
    LDA $0486,Y                  ; $F8AE  B9 86 04
    STA $08                      ; $F8B1  85 08
    LDA $046F,Y                  ; $F8B3  B9 6F 04
    STA $09                      ; $F8B6  85 09
    LDA $04CB,Y                  ; $F8B8  B9 CB 04
    STA $0A                      ; $F8BB  85 0A
    LDA $0486,X                  ; $F8BD  BD 86 04
    STA $0B                      ; $F8C0  85 0B
    LDA $046F,X                  ; $F8C2  BD 6F 04
    STA $0C                      ; $F8C5  85 0C
    LDA $04CB,X                  ; $F8C7  BD CB 04
    STA $0D                      ; $F8CA  85 0D
    LDY #$00                     ; $F8CC  A0 00
    LDA $0A                      ; $F8CE  A5 0A
    SEC                          ; $F8D0  38
    SBC $0D                      ; $F8D1  E5 0D
    BCS loc_3F_F8DB              ; $F8D3  B0 06
    EOR #$FF                     ; $F8D5  49 FF
    ADC #$01                     ; $F8D7  69 01
    LDY #$04                     ; $F8D9  A0 04

loc_3F_F8DB:
    STA $00                      ; $F8DB  85 00
    LDA $08                      ; $F8DD  A5 08
    SEC                          ; $F8DF  38
    SBC $0B                      ; $F8E0  E5 0B
    STA $01                      ; $F8E2  85 01
    LDA $09                      ; $F8E4  A5 09
    SBC $0C                      ; $F8E6  E5 0C
    LDA $01                      ; $F8E8  A5 01
    BCS loc_3F_F8F2              ; $F8EA  B0 06
    EOR #$FF                     ; $F8EC  49 FF
    ADC #$01                     ; $F8EE  69 01
    INY                          ; $F8F0  C8
    INY                          ; $F8F1  C8

loc_3F_F8F2:
    STA $01                      ; $F8F2  85 01
    CMP $00                      ; $F8F4  C5 00
    BCS loc_3F_F901              ; $F8F6  B0 09
    PHA                          ; $F8F8  48
    LDA $00                      ; $F8F9  A5 00
    STA $01                      ; $F8FB  85 01
    PLA                          ; $F8FD  68
    STA $00                      ; $F8FE  85 00
    INY                          ; $F900  C8

loc_3F_F901:
    LDA #$00                     ; $F901  A9 00
    STA $02                      ; $F903  85 02
    LDA $01                      ; $F905  A5 01
    LSR A                        ; $F907  4A
    LSR A                        ; $F908  4A
    CMP $00                      ; $F909  C5 00
    BCS loc_3F_F916              ; $F90B  B0 09
    INC $02                      ; $F90D  E6 02
    ASL A                        ; $F90F  0A
    CMP $00                      ; $F910  C5 00
    BCS loc_3F_F916              ; $F912  B0 02
    INC $02                      ; $F914  E6 02

loc_3F_F916:
    TYA                          ; $F916  98
    ASL A                        ; $F917  0A
    ASL A                        ; $F918  0A
    CLC                          ; $F919  18
    ADC $02                      ; $F91A  65 02
    TAY                          ; $F91C  A8
    LDA $F923,Y                  ; $F91D  B9 23 F9
    STA $11                      ; $F920  85 11
    RTS                          ; $F922  60

    .byte $04,$05,$06,$04,$08,$07,$06,$04,$0C,$0B,$0A,$04,$08,$09,$0A,$04  ; $F923
    .byte $04,$03,$02,$04,$00,$01,$02,$04,$0C,$0D,$0E,$04,$00,$0F,$0E,$04  ; $F933
    .byte $F9,$46,$00,$A9,$80,$8D,$A5,$06,$A4,$51,$20,$23,$F5,$B0,$4A,$A6  ; $F943
    .byte $8F,$20,$03,$FA,$20,$5F,$FA,$A6,$8F,$20,$68,$E4,$AD,$A8,$03,$D0  ; $F953
    .byte $F8,$A9,$F0,$A4,$51,$C0,$08,$90,$02,$A9,$3C,$9D,$B1,$05,$20,$68  ; $F963
    .byte $E4,$DE,$B1,$05,$D0,$F8,$AD,$E5,$03,$30,$F3,$A9,$13,$85,$DC,$20  ; $F973
    .byte $2B,$C6,$A9,$F0,$9D,$B1,$05,$A9,$00,$85,$40,$20,$30,$D4,$20,$68  ; $F983
    .byte $E4,$DE,$B1,$05,$D0,$F1,$20,$E7,$F4,$A5,$51,$29,$08,$D0,$12,$20  ; $F993
    .byte $C6,$F9,$A9,$00,$20,$2A,$D4,$20,$68,$E4,$AD,$CB,$04,$C9,$B4,$90  ; $F9A3
    .byte $F1,$A9,$45,$8D,$2A,$04,$A9,$91,$8D,$13,$04,$A9,$00,$20,$30,$D4  ; $F9B3
    .byte $4C,$56,$E4,$68,$8D,$C7,$05,$68,$8D,$DE,$05,$AD,$86,$04,$C9,$80  ; $F9C3
    .byte $B0,$11,$A9,$01,$20,$2A,$D4,$20,$68,$E4,$AD,$86,$04,$C9,$80,$90  ; $F9D3
    .byte $F1,$B0,$0F,$A9,$02,$20,$2A,$D4,$20,$68,$E4,$AD,$86,$04,$C9,$80  ; $F9E3
    .byte $B0,$F1,$A9,$80,$8D,$86,$04,$AD,$DE,$05,$48,$AD,$C7,$05,$48,$60  ; $F9F3
    .byte $68,$9D,$B1,$05,$68,$9D,$C8,$05,$A9,$0C,$85,$DC,$A5,$51,$C9,$0F  ; $FA03
    .byte $D0,$04,$A9,$18,$85,$DC,$20,$2B,$C6,$A4,$57,$88,$8C,$84,$06,$AD  ; $FA13
    .byte $4F,$06,$8D,$85,$06,$AD,$9E,$06,$8D,$86,$06,$A9,$01,$20,$30,$D4  ; $FA23
    .byte $20,$68,$E4,$AD,$86,$04,$C9,$40,$90,$F1,$20,$F1,$D6,$20,$DD,$E1  ; $FA33
    .byte $20,$4A,$CF,$A9,$00,$20,$30,$D4,$20,$68,$E4,$BD,$C8,$05,$48,$BD  ; $FA43
    .byte $B1,$05,$48,$60,$36,$3F,$45,$43,$3E,$44,$39,$46,$20,$59,$DE,$AC  ; $FA53
    .byte $3D,$06,$B9,$57,$FA,$20,$A4,$CA,$A9,$3C,$20,$F6,$C5,$A2,$08,$A0  ; $FA63
    .byte $93,$20,$28,$CB,$41,$A5,$57,$9D,$6F,$04,$A9,$C0,$9D,$86,$04,$A9  ; $FA73
    .byte $00,$9D,$CB,$04,$60,$FA,$20,$B4,$CA,$A9,$3C,$20,$06,$C6,$A2,$08  ; $FA83
    .byte $A0,$93,$20,$38,$CB,$41,$A5,$57,$9D,$6F,$04,$A9,$C0,$9D,$86,$04  ; $FA93
    .byte $A9,$00,$9D,$CB,$04,$60,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FAA3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$24,$FF,$FF,$FF  ; $FAB3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FAC3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FAD3
    .byte $00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FAE3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$8C,$F3,$FF  ; $FAF3
    .byte $FF,$C5,$73,$FF,$FF,$FF,$ED,$FF,$FF,$5F,$E5,$FF,$FF,$E9,$ED,$FF  ; $FB03
    .byte $FF,$EB,$E9,$FF,$FF,$9F,$79,$FF,$FF,$E9,$97,$FF,$FF,$00,$00,$00  ; $FB13
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FB23
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$FF,$FF,$FF  ; $FB33
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FB43
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FB53
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FB63
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FB73
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FB83
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FB93
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FBA3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FBB3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FBC3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FBD3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FBE3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00,$00,$01,$FF,$FF,$FF  ; $FBF3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FC03
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$01,$00  ; $FC13
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FC23
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FC33
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FC43
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FC53
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FC63
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FC73
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FC83
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$04  ; $FC93
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FCA3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FCB3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FCC3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FCD3
    .byte $40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00  ; $FCE3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FCF3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FD03
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FD13
    .byte $04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FD23
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FD33
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FD43
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$04  ; $FD53
    .byte $20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FD63
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FD73
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FD83
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FD93
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FDA3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$FF,$FF,$FF  ; $FDB3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FDC3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FDD3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FDE3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FDF3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FE03
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FE13
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FE23
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FE33
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FE43
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FE53
    .byte $00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FE63
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FE73
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FE83
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$10  ; $FE93
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FEA3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF  ; $FEB3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FEC3
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $FED3
    .byte $00,$00,$00,$00,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FEE3
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$46,$F3,$FF  ; $FEF3
    .byte $FF,$E5,$FC,$FF,$FF,$CF,$DB,$FF,$FF,$CF,$FE,$FF,$FF,$DD,$E3,$FF  ; $FF03
    .byte $FF,$5E,$FB,$FF,$FF,$A4,$C3,$FF,$FF,$77,$5B,$FF,$FF,$02,$00,$10  ; $FF13
    .byte $08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FF23
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$37,$BE,$FF  ; $FF33
    .byte $FF,$00,$D9,$FF,$FF,$71,$BF,$FF,$FF,$F7,$EA,$FF,$FF,$00,$02,$04  ; $FF43
    .byte $05,$06,$07,$FF,$FF,$80,$40,$20,$10,$08,$04,$02,$01,$00,$01,$02  ; $FF53
    .byte $03,$00,$04,$08,$0C,$00,$10,$20,$30,$00,$40,$80,$C0  ; $FF63

reset_vector:
    SEI                          ; $FF70  78
    CLD                          ; $FF71  D8
    LDA #$00                     ; $FF72  A9 00
    STA $2000                    ; $FF74  8D 00 20
    STA $2001                    ; $FF77  8D 01 20
    STA $4010                    ; $FF7A  8D 10 40
    STA $4015                    ; $FF7D  8D 15 40
    LDA #$40                     ; $FF80  A9 40
    STA $4017                    ; $FF82  8D 17 40
    LDX #$02                     ; $FF85  A2 02

loc_3F_FF87:
    LDA $2002                    ; $FF87  AD 02 20
    BPL loc_3F_FF87              ; $FF8A  10 FB

loc_3F_FF8C:
    LDA $2002                    ; $FF8C  AD 02 20
    BMI loc_3F_FF8C              ; $FF8F  30 FB
    DEX                          ; $FF91  CA
    BPL loc_3F_FF87              ; $FF92  10 F3
    DEX                          ; $FF94  CA
    TXS                          ; $FF95  9A
    STA $E000                    ; $FF96  8D 00 E0
    LDA $2002                    ; $FF99  AD 02 20
    LDA #$10                     ; $FF9C  A9 10
    TAX                          ; $FF9E  AA

loc_3F_FF9F:
    STA $2006                    ; $FF9F  8D 06 20
    STA $2006                    ; $FFA2  8D 06 20
    EOR #$10                     ; $FFA5  49 10
    DEX                          ; $FFA7  CA
    BNE loc_3F_FF9F              ; $FFA8  D0 F5
    TXA                          ; $FFAA  8A

loc_3F_FFAB:
    STA $00,X                    ; $FFAB  95 00
    STA $0100,X                  ; $FFAD  9D 00 01
    STA $0200,X                  ; $FFB0  9D 00 02
    STA $0300,X                  ; $FFB3  9D 00 03
    STA $0400,X                  ; $FFB6  9D 00 04
    STA $0500,X                  ; $FFB9  9D 00 05
    STA $0600,X                  ; $FFBC  9D 00 06
    STA $0700,X                  ; $FFBF  9D 00 07
    DEX                          ; $FFC2  CA
    BNE loc_3F_FFAB              ; $FFC3  D0 E6
    LDA #$01                     ; $FFC5  A9 01
    STA $FB                      ; $FFC7  85 FB
    STA $A000                    ; $FFC9  8D 00 A0
    LDY #$05                     ; $FFCC  A0 05

loc_3F_FFCE:
    STY $8000                    ; $FFCE  8C 00 80
    LDA $FF50,Y                  ; $FFD1  B9 50 FF
    STA $8001                    ; $FFD4  8D 01 80
    DEY                          ; $FFD7  88
    BPL loc_3F_FFCE              ; $FFD8  10 F4
    JMP loc_3E_C51E              ; $FFDA  4C 1E C5

    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $FFDD
    .byte $FF,$FF,$FF,$F4,$E5,$00,$00,$58,$04,$00,$00,$08,$9C,$00,$C0,$70  ; $FFED
    .byte $FF,$4C,$C1  ; $FFFD
