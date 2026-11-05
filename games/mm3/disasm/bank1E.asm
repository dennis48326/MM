; PRG 8 KB bank $1E at $C000
.segment "BANK1E"
.org $C000


nmi_vector:
    PHP                          ; $C000  08
    PHA                          ; $C001  48
    TXA                          ; $C002  8A
    PHA                          ; $C003  48
    TYA                          ; $C004  98
    PHA                          ; $C005  48
    LDA $2002                    ; $C006  AD 02 20
    LDA $FF                      ; $C009  A5 FF
    AND #$7F                     ; $C00B  29 7F
    STA $2000                    ; $C00D  8D 00 20
    LDA #$00                     ; $C010  A9 00
    STA $2001                    ; $C012  8D 01 20
    LDA $EE                      ; $C015  A5 EE
    ORA $9A                      ; $C017  05 9A
    BNE loc_1E_C088              ; $C019  D0 6D
    LDA $FC                      ; $C01B  A5 FC
    STA $79                      ; $C01D  85 79
    LDA $FD                      ; $C01F  A5 FD
    STA $7A                      ; $C021  85 7A
    LDA $F8                      ; $C023  A5 F8
    STA $78                      ; $C025  85 78
    LDA $50                      ; $C027  A5 50
    BNE loc_1E_C02F              ; $C029  D0 04
    LDA $5E                      ; $C02B  A5 5E
    STA $7B                      ; $C02D  85 7B

loc_1E_C02F:
    LDA #$00                     ; $C02F  A9 00
    STA $2003                    ; $C031  8D 03 20
    LDA #$02                     ; $C034  A9 02
    STA $4014                    ; $C036  8D 14 40
    LDA $19                      ; $C039  A5 19
    BEQ loc_1E_C040              ; $C03B  F0 03
    JSR sub_1E_C4F8              ; $C03D  20 F8 C4

loc_1E_C040:
    LDA $1A                      ; $C040  A5 1A
    BEQ loc_1E_C05B              ; $C042  F0 17
    LDA $FF                      ; $C044  A5 FF
    AND #$7F                     ; $C046  29 7F
    ORA #$04                     ; $C048  09 04
    STA $2000                    ; $C04A  8D 00 20
    LDX #$00                     ; $C04D  A2 00
    STX $1A                      ; $C04F  86 1A
    JSR sub_1E_C4FC              ; $C051  20 FC C4
    LDA $FF                      ; $C054  A5 FF
    AND #$7F                     ; $C056  29 7F
    STA $2000                    ; $C058  8D 00 20

loc_1E_C05B:
    LDA $18                      ; $C05B  A5 18
    BEQ loc_1E_C088              ; $C05D  F0 29
    LDX #$00                     ; $C05F  A2 00
    STX $18                      ; $C061  86 18
    LDA $2002                    ; $C063  AD 02 20
    LDA #$3F                     ; $C066  A9 3F
    STA $2006                    ; $C068  8D 06 20
    STX $2006                    ; $C06B  8E 06 20
    LDY #$20                     ; $C06E  A0 20

loc_1E_C070:
    LDA $0600,X                  ; $C070  BD 00 06
    STA $2007                    ; $C073  8D 07 20
    INX                          ; $C076  E8
    DEY                          ; $C077  88
    BNE loc_1E_C070              ; $C078  D0 F6
    LDA #$3F                     ; $C07A  A9 3F
    STA $2006                    ; $C07C  8D 06 20
    STY $2006                    ; $C07F  8C 06 20
    STY $2006                    ; $C082  8C 06 20
    STY $2006                    ; $C085  8C 06 20

loc_1E_C088:
    LDA $78                      ; $C088  A5 78
    CMP #$02                     ; $C08A  C9 02
    BNE loc_1E_C09D              ; $C08C  D0 0F
    LDA $2002                    ; $C08E  AD 02 20
    LDA $5F                      ; $C091  A5 5F
    STA $2005                    ; $C093  8D 05 20
    LDA #$00                     ; $C096  A9 00
    STA $2005                    ; $C098  8D 05 20
    BEQ loc_1E_C0AA              ; $C09B  F0 0D

loc_1E_C09D:
    LDA $2002                    ; $C09D  AD 02 20
    LDA $79                      ; $C0A0  A5 79
    STA $2005                    ; $C0A2  8D 05 20
    LDA $FA                      ; $C0A5  A5 FA
    STA $2005                    ; $C0A7  8D 05 20

loc_1E_C0AA:
    LDA $FE                      ; $C0AA  A5 FE
    STA $2001                    ; $C0AC  8D 01 20
    LDA $7A                      ; $C0AF  A5 7A
    AND #$03                     ; $C0B1  29 03
    ORA $FF                      ; $C0B3  05 FF
    STA $2000                    ; $C0B5  8D 00 20
    JSR sub_1F_FF41              ; $C0B8  20 41 FF
    LDA $F0                      ; $C0BB  A5 F0
    STA $8000                    ; $C0BD  8D 00 80
    LDA $7B                      ; $C0C0  A5 7B
    STA $C000                    ; $C0C2  8D 00 C0
    STA $C001                    ; $C0C5  8D 01 C0
    LDX $9B                      ; $C0C8  A6 9B
    STA $E000,X                  ; $C0CA  9D 00 E0
    BEQ loc_1E_C0E7              ; $C0CD  F0 18
    LDX $78                      ; $C0CF  A6 78
    LDA $50                      ; $C0D1  A5 50
    BEQ loc_1E_C0DD              ; $C0D3  F0 08
    LDA $7B                      ; $C0D5  A5 7B
    CMP $51                      ; $C0D7  C5 51
    BCC loc_1E_C0DD              ; $C0D9  90 02
    LDX #$01                     ; $C0DB  A2 01

loc_1E_C0DD:
    LDA $C4C8,X                  ; $C0DD  BD C8 C4
    STA $9C                      ; $C0E0  85 9C
    LDA $C4DA,X                  ; $C0E2  BD DA C4
    STA $9D                      ; $C0E5  85 9D

loc_1E_C0E7:
    INC $92                      ; $C0E7  E6 92
    LDX #$FF                     ; $C0E9  A2 FF
    STX $90                      ; $C0EB  86 90
    INX                          ; $C0ED  E8
    LDY #$04                     ; $C0EE  A0 04

loc_1E_C0F0:
    LDA $80,X                    ; $C0F0  B5 80
    CMP #$01                     ; $C0F2  C9 01
    BNE loc_1E_C0FE              ; $C0F4  D0 08
    DEC $81,X                    ; $C0F6  D6 81
    BNE loc_1E_C0FE              ; $C0F8  D0 04
    LDA #$04                     ; $C0FA  A9 04
    STA $80,X                    ; $C0FC  95 80

loc_1E_C0FE:
    INX                          ; $C0FE  E8
    INX                          ; $C0FF  E8
    INX                          ; $C100  E8
    INX                          ; $C101  E8
    DEY                          ; $C102  88
    BNE loc_1E_C0F0              ; $C103  D0 EB
    TSX                          ; $C105  BA
    LDA $0107,X                  ; $C106  BD 07 01
    STA $7D                      ; $C109  85 7D
    LDA $0106,X                  ; $C10B  BD 06 01
    STA $7C                      ; $C10E  85 7C
    LDA #$C1                     ; $C110  A9 C1
    STA $0107,X                  ; $C112  9D 07 01
    LDA #$21                     ; $C115  A9 21
    STA $0106,X                  ; $C117  9D 06 01
    PLA                          ; $C11A  68
    TAY                          ; $C11B  A8
    PLA                          ; $C11C  68
    TAX                          ; $C11D  AA
    PLA                          ; $C11E  68
    PLP                          ; $C11F  28
    RTI                          ; $C120  40

    PHP                          ; $C121  08
    PHP                          ; $C122  08
    PHP                          ; $C123  08
    PHA                          ; $C124  48
    TXA                          ; $C125  8A
    PHA                          ; $C126  48
    TYA                          ; $C127  98
    PHA                          ; $C128  48
    TSX                          ; $C129  BA
    SEC                          ; $C12A  38
    LDA $7C                      ; $C12B  A5 7C
    SBC #$01                     ; $C12D  E9 01
    STA $0105,X                  ; $C12F  9D 05 01
    LDA $7D                      ; $C132  A5 7D
    SBC #$00                     ; $C134  E9 00
    STA $0106,X                  ; $C136  9D 06 01
    JSR sub_1F_FF90              ; $C139  20 90 FF
    PLA                          ; $C13C  68
    TAY                          ; $C13D  A8
    PLA                          ; $C13E  68
    TAX                          ; $C13F  AA
    PLA                          ; $C140  68
    PLP                          ; $C141  28
    RTS                          ; $C142  60


irq_vector:
    PHP                          ; $C143  08
    PHA                          ; $C144  48
    TXA                          ; $C145  8A
    PHA                          ; $C146  48
    TYA                          ; $C147  98
    PHA                          ; $C148  48
    STA $E000                    ; $C149  8D 00 E0
    STA $E001                    ; $C14C  8D 01 E0
    JMP ($009C)                  ; $C14F  6C 9C 00

    LDA $78                      ; $C152  A5 78
    CMP #$0B                     ; $C154  C9 0B
    BEQ loc_1E_C17B              ; $C156  F0 23
    LDA $2002                    ; $C158  AD 02 20
    LDA $52                      ; $C15B  A5 52
    STA $2006                    ; $C15D  8D 06 20
    LDA #$C0                     ; $C160  A9 C0
    STA $2006                    ; $C162  8D 06 20
    LDA $52                      ; $C165  A5 52
    LSR A                        ; $C167  4A
    LSR A                        ; $C168  4A
    AND #$03                     ; $C169  29 03
    ORA #$98                     ; $C16B  09 98
    STA $2000                    ; $C16D  8D 00 20
    LDA #$00                     ; $C170  A9 00
    STA $2005                    ; $C172  8D 05 20
    STA $2005                    ; $C175  8D 05 20
    JMP loc_1E_C4BD              ; $C178  4C BD C4


loc_1E_C17B:
    LDA $2002                    ; $C17B  AD 02 20
    LDA #$20                     ; $C17E  A9 20
    STA $2006                    ; $C180  8D 06 20
    LDA #$00                     ; $C183  A9 00
    STA $2006                    ; $C185  8D 06 20
    LDA #$98                     ; $C188  A9 98
    STA $2000                    ; $C18A  8D 00 20
    LDA #$00                     ; $C18D  A9 00
    STA $2005                    ; $C18F  8D 05 20
    STA $2005                    ; $C192  8D 05 20
    JMP loc_1E_C4BD              ; $C195  4C BD C4

    LDA $2002                    ; $C198  AD 02 20
    LDA $79                      ; $C19B  A5 79
    STA $2005                    ; $C19D  8D 05 20
    LDA #$00                     ; $C1A0  A9 00
    STA $2005                    ; $C1A2  8D 05 20
    LDA $50                      ; $C1A5  A5 50
    BEQ loc_1E_C1BE              ; $C1A7  F0 15
    LDA $51                      ; $C1A9  A5 51
    SEC                          ; $C1AB  38
    SBC #$9F                     ; $C1AC  E9 9F
    STA $C000                    ; $C1AE  8D 00 C0
    LDA $C4C9                    ; $C1B1  AD C9 C4
    STA $9C                      ; $C1B4  85 9C
    LDA $C4DB                    ; $C1B6  AD DB C4
    STA $9D                      ; $C1B9  85 9D
    JMP loc_1E_C4BD              ; $C1BB  4C BD C4


loc_1E_C1BE:
    JMP loc_1E_C4BA              ; $C1BE  4C BA C4

    .byte $AD,$02,$20,$A9,$28,$8D,$06,$20,$A9,$00,$8D,$06,$20,$A5,$FF,$09  ; $C1C1
    .byte $02,$8D,$00,$20,$A9,$00,$8D,$05,$20,$8D,$05,$20,$A9,$B0,$38,$E5  ; $C1D1
    .byte $7B,$8D,$00,$C0,$A6,$78,$A5,$50,$F0,$08,$A5,$51,$C9,$B0,$D0,$02  ; $C1E1
    .byte $A2,$00,$BD,$C9,$C4,$85,$9C,$BD,$DB,$C4,$85,$9D,$4C,$BD,$C4,$AD  ; $C1F1
    .byte $02,$20,$A9,$22,$8D,$06,$20,$A9,$C0,$8D,$06,$20,$A5,$FF,$8D,$00  ; $C201
    .byte $20,$A9,$00,$8D,$05,$20,$A9,$B0,$8D,$05,$20,$A5,$50,$F0,$9E,$A5  ; $C211
    .byte $51,$38,$E9,$B0,$8D,$00,$C0,$AD,$C9,$C4,$85,$9C,$AD,$DB,$C4,$85  ; $C221
    .byte $9D,$4C,$BD,$C4,$AD,$02,$20,$A9,$20,$8D,$06,$20,$A5,$79,$4A,$4A  ; $C231
    .byte $4A,$29,$1F,$09,$00,$8D,$06,$20,$A5,$FF,$29,$FC,$8D,$00,$20,$A5  ; $C241
    .byte $79,$8D,$05,$20,$A9,$00,$8D,$05,$20,$A9,$C0,$38,$E5,$7B,$8D,$00  ; $C251
    .byte $C0,$AD,$CE,$C4,$85,$9C,$AD,$E0,$C4,$85,$9D,$4C,$BD,$C4,$AD,$02  ; $C261
    .byte $20,$A9,$23,$8D,$06,$20,$A5,$79,$4A,$4A,$4A,$29,$1F,$09,$00,$8D  ; $C271
    .byte $06,$20,$A5,$FF,$29,$FC,$8D,$00,$20,$A5,$79,$8D,$05,$20,$A9,$C0  ; $C281
    .byte $8D,$05,$20,$4C,$BA,$C4  ; $C291
    LDA $2002                    ; $C297  AD 02 20
    LDA $79                      ; $C29A  A5 79
    EOR #$FF                     ; $C29C  49 FF
    CLC                          ; $C29E  18
    ADC #$01                     ; $C29F  69 01
    STA $9C                      ; $C2A1  85 9C
    LDA $7A                      ; $C2A3  A5 7A
    EOR #$FF                     ; $C2A5  49 FF
    ADC #$00                     ; $C2A7  69 00
    AND #$01                     ; $C2A9  29 01
    STA $9D                      ; $C2AB  85 9D
    LDA $FF                      ; $C2AD  A5 FF
    AND #$FC                     ; $C2AF  29 FC
    ORA $9D                      ; $C2B1  05 9D
    STA $2000                    ; $C2B3  8D 00 20
    LDA $9C                      ; $C2B6  A5 9C
    STA $2005                    ; $C2B8  8D 05 20
    LDA #$58                     ; $C2BB  A9 58
    STA $2005                    ; $C2BD  8D 05 20
    LDA #$40                     ; $C2C0  A9 40
    STA $C000                    ; $C2C2  8D 00 C0
    LDA $C4D0                    ; $C2C5  AD D0 C4
    STA $9C                      ; $C2C8  85 9C
    LDA $C4E2                    ; $C2CA  AD E2 C4
    STA $9D                      ; $C2CD  85 9D
    JMP loc_1E_C4BD              ; $C2CF  4C BD C4

    LDA $2002                    ; $C2D2  AD 02 20
    LDA $7A                      ; $C2D5  A5 7A
    AND #$01                     ; $C2D7  29 01
    ASL A                        ; $C2D9  0A
    ASL A                        ; $C2DA  0A
    ORA #$22                     ; $C2DB  09 22
    STA $2006                    ; $C2DD  8D 06 20
    LDA $79                      ; $C2E0  A5 79
    LSR A                        ; $C2E2  4A
    LSR A                        ; $C2E3  4A
    LSR A                        ; $C2E4  4A
    AND #$1F                     ; $C2E5  29 1F
    ORA #$60                     ; $C2E7  09 60
    STA $2006                    ; $C2E9  8D 06 20
    LDA $7A                      ; $C2EC  A5 7A
    AND #$03                     ; $C2EE  29 03
    ORA $FF                      ; $C2F0  05 FF
    STA $2000                    ; $C2F2  8D 00 20
    LDA $79                      ; $C2F5  A5 79
    STA $2005                    ; $C2F7  8D 05 20
    LDA #$98                     ; $C2FA  A9 98
    STA $2005                    ; $C2FC  8D 05 20
    JMP loc_1E_C4BA              ; $C2FF  4C BA C4

    .byte $AD,$02,$20,$A4,$73,$A5,$69,$59,$EC,$C4,$18,$79,$EF,$C4,$8D,$05  ; $C302
    .byte $20,$B9,$F2,$C4,$8D,$05,$20,$A9,$0E,$8D,$00,$C0,$AD,$D2,$C4,$85  ; $C312
    .byte $9C,$AD,$E4,$C4,$85,$9D,$4C,$BD,$C4,$AD,$02,$20,$A4,$73,$A9,$00  ; $C322
    .byte $8D,$05,$20,$B9,$F5,$C4,$8D,$05,$20,$E6,$73,$A5,$73,$C9,$03,$F0  ; $C332
    .byte $12,$A9,$20,$8D,$00,$C0,$AD,$D1,$C4,$85,$9C,$AD,$E3,$C4,$85,$9D  ; $C342
    .byte $4C,$BD,$C4,$A9,$00,$85,$73,$A5,$50,$F0,$15,$A5,$51,$38,$E9,$A0  ; $C352
    .byte $8D,$00,$C0,$AD,$C9,$C4,$85,$9C,$AD,$DB,$C4,$85,$9D,$4C,$BD,$C4  ; $C362
    .byte $4C,$BA,$C4,$AD,$02,$20,$A9,$21,$8D,$06,$20,$A9,$40,$8D,$06,$20  ; $C372
    .byte $A5,$FF,$29,$FC,$8D,$00,$20,$A9,$00,$8D,$05,$20,$8D,$05,$20,$A9  ; $C382
    .byte $4C,$8D,$00,$C0,$AD,$D4,$C4,$85,$9C,$AD,$E6,$C4,$85,$9D,$4C,$BD  ; $C392
    .byte $C4,$AD,$02,$20,$A5,$6A,$8D,$05,$20,$A9,$00,$8D,$05,$20,$A5,$50  ; $C3A2
    .byte $F0,$15,$A5,$51,$38,$E9,$A0,$8D,$00,$C0,$AD,$C9,$C4,$85,$9C,$AD  ; $C3B2
    .byte $DB,$C4,$85,$9D,$4C,$BD,$C4,$4C,$BA,$C4,$AD,$02,$20,$A5,$6B,$0A  ; $C3C2
    .byte $0A,$09,$20,$8D,$06,$20,$A5,$6A,$4A,$4A,$4A,$09,$E0,$8D,$06,$20  ; $C3D2
    .byte $A5,$6A,$8D,$05,$20,$A5,$7B,$8D,$05,$20,$A5,$FF,$05,$6B,$8D,$00  ; $C3E2
    .byte $20,$A9,$AE,$38,$E5,$7B,$8D,$00,$C0,$AD,$D6,$C4,$85,$9C,$AD,$E8  ; $C3F2
    .byte $C4,$85,$9D,$4C,$BD,$C4,$A5,$50,$F0,$0B,$A5,$51,$38,$E9,$B0,$AA  ; $C402
    .byte $D0,$03,$4C,$52,$C1,$AD,$02,$20,$A9,$22,$8D,$06,$20,$A9,$C0,$8D  ; $C412
    .byte $06,$20,$A5,$FF,$29,$FC,$8D,$00,$20,$A9,$00,$8D,$05,$20,$8D,$05  ; $C422
    .byte $20,$A5,$50,$F0,$10,$8E,$00,$C0,$AD,$C9,$C4,$85,$9C,$AD,$DB,$C4  ; $C432
    .byte $85,$9D,$4C,$BD,$C4,$4C,$BA,$C4,$AD,$02,$20,$A5,$69,$8D,$05,$20  ; $C442
    .byte $A9,$00,$8D,$05,$20,$A9,$30,$8D,$00,$C0,$AD,$D8,$C4,$85,$9C,$AD  ; $C452
    .byte $EA,$C4,$85,$9D,$4C,$BD,$C4,$AD,$02,$20,$A5,$6A,$8D,$05,$20,$A9  ; $C462
    .byte $00,$8D,$05,$20,$A5,$FF,$29,$FC,$05,$6B,$8D,$00,$20,$A9,$66,$85  ; $C472
    .byte $E8,$A9,$72,$85,$E9,$20,$45,$FF,$A5,$F0,$8D,$00,$80,$A9,$78,$85  ; $C482
    .byte $E8,$A9,$7A,$85,$E9,$E6,$1B,$4C,$BA,$C4,$A5,$E8,$48,$A5,$E9,$48  ; $C492
    .byte $A9,$66,$85,$E8,$A9,$72,$85,$E9,$20,$45,$FF,$A5,$F0,$8D,$00,$80  ; $C4A2
    .byte $68,$85,$E9,$68,$85,$E8,$E6,$1B  ; $C4B2

loc_1E_C4BA:
    STA $E000                    ; $C4BA  8D 00 E0

loc_1E_C4BD:
    PLA                          ; $C4BD  68
    TAY                          ; $C4BE  A8
    PLA                          ; $C4BF  68
    TAX                          ; $C4C0  AA
    PLA                          ; $C4C1  68
    PLP                          ; $C4C2  28
    RTI                          ; $C4C3  40

    .byte $00,$00,$00,$00,$BA,$52,$98,$C1,$00,$35,$6F,$97,$D2,$02,$2B,$75  ; $C4C4
    .byte $A3,$CC,$08,$4A,$69,$9C,$C4,$C1,$C1,$C1,$C2,$C2,$C2,$C2,$C2,$C3  ; $C4D4
    .byte $C3,$C3,$C3,$C3,$C4,$C4,$C4,$C4,$FF,$00,$FF,$01,$00,$01,$30,$60  ; $C4E4
    .byte $90,$40,$70,$A0  ; $C4F4

sub_1E_C4F8:
    LDX #$00                     ; $C4F8  A2 00
    STX $19                      ; $C4FA  86 19

sub_1E_C4FC:
    LDA $0780,X                  ; $C4FC  BD 80 07
    BMI loc_1E_C51C              ; $C4FF  30 1B
    STA $2006                    ; $C501  8D 06 20
    LDA $0781,X                  ; $C504  BD 81 07
    STA $2006                    ; $C507  8D 06 20
    LDY $0782,X                  ; $C50A  BC 82 07

loc_1E_C50D:
    LDA $0783,X                  ; $C50D  BD 83 07
    STA $2007                    ; $C510  8D 07 20
    INX                          ; $C513  E8
    DEY                          ; $C514  88
    BPL loc_1E_C50D              ; $C515  10 F6
    INX                          ; $C517  E8
    INX                          ; $C518  E8
    INX                          ; $C519  E8
    BNE sub_1E_C4FC              ; $C51A  D0 E0

loc_1E_C51C:
    RTS                          ; $C51C  60

    .byte $A5,$FF,$29,$11,$85,$FF,$8D,$00,$20,$60,$A5,$FF,$09,$80,$85,$FF  ; $C51D
    .byte $8D,$00,$20,$60  ; $C52D

sub_1E_C531:
    INC $EE                      ; $C531  E6 EE
    LDA #$00                     ; $C533  A9 00
    STA $FE                      ; $C535  85 FE
    STA $2001                    ; $C537  8D 01 20
    RTS                          ; $C53A  60


sub_1E_C53B:
    DEC $EE                      ; $C53B  C6 EE
    LDA #$18                     ; $C53D  A9 18
    STA $FE                      ; $C53F  85 FE
    STA $2001                    ; $C541  8D 01 20
    RTS                          ; $C544  60


sub_1E_C545:
    LDX #$01                     ; $C545  A2 01
    STX $4016                    ; $C547  8E 16 40
    DEX                          ; $C54A  CA
    STX $4016                    ; $C54B  8E 16 40
    LDX #$08                     ; $C54E  A2 08

loc_1E_C550:
    LDA $4016                    ; $C550  AD 16 40
    LSR A                        ; $C553  4A
    ROL $14                      ; $C554  26 14
    LSR A                        ; $C556  4A
    ROL $00                      ; $C557  26 00
    LDA $4017                    ; $C559  AD 17 40
    LSR A                        ; $C55C  4A
    ROL $15                      ; $C55D  26 15
    LSR A                        ; $C55F  4A
    ROL $01                      ; $C560  26 01
    DEX                          ; $C562  CA
    BNE loc_1E_C550              ; $C563  D0 EB
    LDA $00                      ; $C565  A5 00
    ORA $14                      ; $C567  05 14
    STA $14                      ; $C569  85 14
    LDA $01                      ; $C56B  A5 01
    ORA $15                      ; $C56D  05 15
    STA $15                      ; $C56F  85 15
    LDX #$01                     ; $C571  A2 01

loc_1E_C573:
    LDA $14,X                    ; $C573  B5 14
    TAY                          ; $C575  A8
    EOR $16,X                    ; $C576  55 16
    AND $14,X                    ; $C578  35 14
    STA $14,X                    ; $C57A  95 14
    STY $16,X                    ; $C57C  94 16
    DEX                          ; $C57E  CA
    BPL loc_1E_C573              ; $C57F  10 F2
    LDX #$03                     ; $C581  A2 03

loc_1E_C583:
    LDA $14,X                    ; $C583  B5 14
    AND #$0C                     ; $C585  29 0C
    CMP #$0C                     ; $C587  C9 0C
    BEQ loc_1E_C593              ; $C589  F0 08
    LDA $14,X                    ; $C58B  B5 14
    AND #$03                     ; $C58D  29 03
    CMP #$03                     ; $C58F  C9 03
    BNE loc_1E_C599              ; $C591  D0 06

loc_1E_C593:
    LDA $14,X                    ; $C593  B5 14
    AND #$F0                     ; $C595  29 F0
    STA $14,X                    ; $C597  95 14

loc_1E_C599:
    DEX                          ; $C599  CA
    BPL loc_1E_C583              ; $C59A  10 E7
    RTS                          ; $C59C  60


sub_1E_C59D:
    STA $00                      ; $C59D  85 00
    STX $01                      ; $C59F  86 01
    STY $02                      ; $C5A1  84 02
    LDA $2002                    ; $C5A3  AD 02 20
    LDA $FF                      ; $C5A6  A5 FF
    AND #$FE                     ; $C5A8  29 FE
    STA $2000                    ; $C5AA  8D 00 20
    LDA $00                      ; $C5AD  A5 00
    STA $2006                    ; $C5AF  8D 06 20
    LDY #$00                     ; $C5B2  A0 00
    STY $2006                    ; $C5B4  8C 06 20
    LDX #$04                     ; $C5B7  A2 04
    CMP #$20                     ; $C5B9  C9 20
    BCS loc_1E_C5BF              ; $C5BB  B0 02
    LDX $02                      ; $C5BD  A6 02

loc_1E_C5BF:
    LDY #$00                     ; $C5BF  A0 00
    LDA $01                      ; $C5C1  A5 01

loc_1E_C5C3:
    STA $2007                    ; $C5C3  8D 07 20
    DEY                          ; $C5C6  88
    BNE loc_1E_C5C3              ; $C5C7  D0 FA
    DEX                          ; $C5C9  CA
    BNE loc_1E_C5C3              ; $C5CA  D0 F7
    LDY $02                      ; $C5CC  A4 02
    LDA $00                      ; $C5CE  A5 00
    CMP #$20                     ; $C5D0  C9 20
    BCC loc_1E_C5E6              ; $C5D2  90 12
    ADC #$02                     ; $C5D4  69 02
    STA $2006                    ; $C5D6  8D 06 20
    LDA #$C0                     ; $C5D9  A9 C0
    STA $2006                    ; $C5DB  8D 06 20
    LDX #$40                     ; $C5DE  A2 40

loc_1E_C5E0:
    STY $2007                    ; $C5E0  8C 07 20
    DEX                          ; $C5E3  CA
    BNE loc_1E_C5E0              ; $C5E4  D0 FA

loc_1E_C5E6:
    LDX $01                      ; $C5E6  A6 01
    RTS                          ; $C5E8  60


sub_1E_C5E9:
    LDA $30                      ; $C5E9  A5 30
    CMP #$07                     ; $C5EB  C9 07
    BNE loc_1E_C5F5              ; $C5ED  D0 06
    LDX #$6C                     ; $C5EF  A2 6C
    STX $97                      ; $C5F1  86 97
    BNE loc_1E_C60A              ; $C5F3  D0 15

loc_1E_C5F5:
    LDX $97                      ; $C5F5  A6 97
    CPX #$04                     ; $C5F7  E0 04
    BNE loc_1E_C600              ; $C5F9  D0 05
    LDA #$F8                     ; $C5FB  A9 F8
    STA $0200                    ; $C5FD  8D 00 02

loc_1E_C600:
    LDA $50                      ; $C600  A5 50
    BNE loc_1E_C60A              ; $C602  D0 06
    LDA $72                      ; $C604  A5 72
    BEQ loc_1E_C60A              ; $C606  F0 02
    LDX #$30                     ; $C608  A2 30

loc_1E_C60A:
    LDA #$F8                     ; $C60A  A9 F8

loc_1E_C60C:
    STA $0200,X                  ; $C60C  9D 00 02
    INX                          ; $C60F  E8
    INX                          ; $C610  E8
    INX                          ; $C611  E8
    INX                          ; $C612  E8
    BNE loc_1E_C60C              ; $C613  D0 F7
    LDA $50                      ; $C615  A5 50
    BNE loc_1E_C627              ; $C617  D0 0E
    LDA $71                      ; $C619  A5 71
    BNE loc_1E_C63E              ; $C61B  D0 21
    LDA $72                      ; $C61D  A5 72
    BNE loc_1E_C669              ; $C61F  D0 48
    LDA $F8                      ; $C621  A5 F8
    CMP #$02                     ; $C623  C9 02
    BEQ loc_1E_C696              ; $C625  F0 6F

loc_1E_C627:
    RTS                          ; $C627  60


sub_1E_C628:
    LDX #$1F                     ; $C628  A2 1F

loc_1E_C62A:
    LDA #$00                     ; $C62A  A9 00
    STA $0300,X                  ; $C62C  9D 00 03
    LDA #$FF                     ; $C62F  A9 FF
    STA $04C0,X                  ; $C631  9D C0 04
    DEX                          ; $C634  CA
    BNE loc_1E_C62A              ; $C635  D0 F3
    LDA #$00                     ; $C637  A9 00
    STA $71                      ; $C639  85 71
    STA $72                      ; $C63B  85 72
    RTS                          ; $C63D  60


loc_1E_C63E:
    LDA #$00                     ; $C63E  A9 00
    STA $71                      ; $C640  85 71
    LDY #$2C                     ; $C642  A0 2C

loc_1E_C644:
    LDA $C6D8,Y                  ; $C644  B9 D8 C6
    STA $0200,Y                  ; $C647  99 00 02
    LDA $C6D9,Y                  ; $C64A  B9 D9 C6
    STA $0201,Y                  ; $C64D  99 01 02
    LDA $C6DA,Y                  ; $C650  B9 DA C6
    STA $0202,Y                  ; $C653  99 02 02
    LDA $C6DB,Y                  ; $C656  B9 DB C6
    STA $0203,Y                  ; $C659  99 03 02
    DEY                          ; $C65C  88
    DEY                          ; $C65D  88
    DEY                          ; $C65E  88
    DEY                          ; $C65F  88
    BPL loc_1E_C644              ; $C660  10 E2
    STY $72                      ; $C662  84 72
    LDA #$30                     ; $C664  A9 30
    STA $97                      ; $C666  85 97
    RTS                          ; $C668  60


loc_1E_C669:
    LDY #$14                     ; $C669  A0 14

loc_1E_C66B:
    LDA $0203,Y                  ; $C66B  B9 03 02
    SEC                          ; $C66E  38
    SBC #$01                     ; $C66F  E9 01
    STA $0203,Y                  ; $C671  99 03 02
    DEY                          ; $C674  88
    DEY                          ; $C675  88
    DEY                          ; $C676  88
    DEY                          ; $C677  88
    BPL loc_1E_C66B              ; $C678  10 F1
    LDA $95                      ; $C67A  A5 95
    AND #$01                     ; $C67C  29 01
    BNE loc_1E_C691              ; $C67E  D0 11
    LDY #$14                     ; $C680  A0 14

loc_1E_C682:
    LDA $021B,Y                  ; $C682  B9 1B 02
    SEC                          ; $C685  38
    SBC #$01                     ; $C686  E9 01
    STA $021B,Y                  ; $C688  99 1B 02
    DEY                          ; $C68B  88
    DEY                          ; $C68C  88
    DEY                          ; $C68D  88
    DEY                          ; $C68E  88
    BPL loc_1E_C682              ; $C68F  10 F1

loc_1E_C691:
    LDA #$30                     ; $C691  A9 30
    STA $97                      ; $C693  85 97
    RTS                          ; $C695  60


loc_1E_C696:
    LDA $FC                      ; $C696  A5 FC
    STA $00                      ; $C698  85 00
    LDA $F9                      ; $C69A  A5 F9
    LSR A                        ; $C69C  4A
    ROR $00                      ; $C69D  66 00
    LSR A                        ; $C69F  4A
    ROR $00                      ; $C6A0  66 00
    LDA $95                      ; $C6A2  A5 95
    AND #$01                     ; $C6A4  29 01
    ASL A                        ; $C6A6  0A
    ASL A                        ; $C6A7  0A
    ASL A                        ; $C6A8  0A
    ASL A                        ; $C6A9  0A
    ASL A                        ; $C6AA  0A
    TAY                          ; $C6AB  A8
    LDX #$1C                     ; $C6AC  A2 1C

loc_1E_C6AE:
    LDA $C708,Y                  ; $C6AE  B9 08 C7
    STA $0200,X                  ; $C6B1  9D 00 02
    LDA $C709,Y                  ; $C6B4  B9 09 C7
    STA $0201,X                  ; $C6B7  9D 01 02
    LDA $C70A,Y                  ; $C6BA  B9 0A C7
    STA $0202,X                  ; $C6BD  9D 02 02
    LDA $C70B,Y                  ; $C6C0  B9 0B C7
    SEC                          ; $C6C3  38
    SBC $00                      ; $C6C4  E5 00
    STA $0203,X                  ; $C6C6  9D 03 02
    INY                          ; $C6C9  C8
    INY                          ; $C6CA  C8
    INY                          ; $C6CB  C8
    INY                          ; $C6CC  C8
    DEX                          ; $C6CD  CA
    DEX                          ; $C6CE  CA
    DEX                          ; $C6CF  CA
    DEX                          ; $C6D0  CA
    BPL loc_1E_C6AE              ; $C6D1  10 DB
    LDA #$20                     ; $C6D3  A9 20
    STA $97                      ; $C6D5  85 97
    RTS                          ; $C6D7  60

    .byte $58,$F1,$02,$28,$E0,$F1,$02,$28,$B8,$F1,$02,$70,$20,$F1,$02,$A0  ; $C6D8
    .byte $68,$F1,$02,$D0,$D8,$F1,$02,$D0,$90,$F2,$02,$10,$40,$F2,$02,$58  ; $C6E8
    .byte $D0,$F2,$02,$58,$78,$F2,$02,$80,$28,$F2,$02,$D8,$A8,$F2,$02,$D8  ; $C6F8
    .byte $90,$E4,$03,$18,$28,$E4,$03,$20,$68,$E4,$03,$30,$58,$E4,$03,$60  ; $C708
    .byte $80,$E4,$03,$70,$10,$E4,$03,$98,$58,$E4,$03,$C0,$80,$E4,$03,$D0  ; $C718
    .byte $18,$E4,$03,$10,$A0,$E4,$03,$48,$28,$E4,$03,$58,$40,$E4,$03,$90  ; $C728
    .byte $98,$E4,$03,$A0,$78,$E4,$03,$D8,$30,$E4,$03,$E0,$A0,$E4,$03,$E8  ; $C738
    .byte $00,$00,$00,$00  ; $C748

sub_1E_C74C:
    LDA #$30                     ; $C74C  A9 30
    LDX #$F0                     ; $C74E  A2 F0
    BNE loc_1E_C755              ; $C750  D0 03

sub_1E_C752:
    LDA #$10                     ; $C752  A9 10
    TAX                          ; $C754  AA

loc_1E_C755:
    STA $0F                      ; $C755  85 0F
    STX $0D                      ; $C757  86 0D
    LDY #$04                     ; $C759  A0 04
    STY $0E                      ; $C75B  84 0E

loc_1E_C75D:
    LDY #$1F                     ; $C75D  A0 1F

loc_1E_C75F:
    LDA $0620,Y                  ; $C75F  B9 20 06
    STA $0600,Y                  ; $C762  99 00 06
    DEY                          ; $C765  88
    BPL loc_1E_C75F              ; $C766  10 F7
    LDY #$1F                     ; $C768  A0 1F

loc_1E_C76A:
    LDA $0600,Y                  ; $C76A  B9 00 06
    SEC                          ; $C76D  38
    SBC $0F                      ; $C76E  E5 0F
    BPL loc_1E_C774              ; $C770  10 02
    LDA #$0F                     ; $C772  A9 0F

loc_1E_C774:
    STA $0600,Y                  ; $C774  99 00 06
    DEY                          ; $C777  88
    BPL loc_1E_C76A              ; $C778  10 F0
    STY $18                      ; $C77A  84 18
    LDA $0E                      ; $C77C  A5 0E

loc_1E_C77E:
    PHA                          ; $C77E  48
    JSR sub_1F_FF21              ; $C77F  20 21 FF
    PLA                          ; $C782  68
    SEC                          ; $C783  38
    SBC #$01                     ; $C784  E9 01
    BNE loc_1E_C77E              ; $C786  D0 F6
    LDA $0F                      ; $C788  A5 0F
    CLC                          ; $C78A  18
    ADC $0D                      ; $C78B  65 0D
    STA $0F                      ; $C78D  85 0F
    CMP #$50                     ; $C78F  C9 50
    BEQ loc_1E_C797              ; $C791  F0 04
    LDA $0F                      ; $C793  A5 0F
    BPL loc_1E_C75D              ; $C795  10 C6

loc_1E_C797:
    RTS                          ; $C797  60


sub_1E_C798:
    LDA $1C                      ; $C798  A5 1C
    BEQ loc_1E_C7DC              ; $C79A  F0 40
    LDA $95                      ; $C79C  A5 95
    AND #$03                     ; $C79E  29 03
    BNE loc_1E_C7DC              ; $C7A0  D0 3A
    LDY #$1F                     ; $C7A2  A0 1F

loc_1E_C7A4:
    LDA $0620,Y                  ; $C7A4  B9 20 06
    STA $0600,Y                  ; $C7A7  99 00 06
    DEY                          ; $C7AA  88
    BPL loc_1E_C7A4              ; $C7AB  10 F7
    LDY #$0F                     ; $C7AD  A0 0F

loc_1E_C7AF:
    LDA $0600,Y                  ; $C7AF  B9 00 06
    SEC                          ; $C7B2  38
    SBC $1D                      ; $C7B3  E5 1D
    BPL loc_1E_C7B9              ; $C7B5  10 02
    LDA #$0F                     ; $C7B7  A9 0F

loc_1E_C7B9:
    STA $0600,Y                  ; $C7B9  99 00 06
    DEY                          ; $C7BC  88
    BPL loc_1E_C7AF              ; $C7BD  10 F0
    STY $18                      ; $C7BF  84 18
    LDA $1D                      ; $C7C1  A5 1D
    CLC                          ; $C7C3  18
    ADC $1E                      ; $C7C4  65 1E
    STA $1D                      ; $C7C6  85 1D
    CMP #$F0                     ; $C7C8  C9 F0
    BEQ loc_1E_C7D4              ; $C7CA  F0 08
    CMP #$50                     ; $C7CC  C9 50
    BNE loc_1E_C7DC              ; $C7CE  D0 0C
    INC $71                      ; $C7D0  E6 71
    BNE loc_1E_C7D8              ; $C7D2  D0 04

loc_1E_C7D4:
    LDA #$00                     ; $C7D4  A9 00
    STA $72                      ; $C7D6  85 72

loc_1E_C7D8:
    LDA #$00                     ; $C7D8  A9 00
    STA $1C                      ; $C7DA  85 1C

loc_1E_C7DC:
    RTS                          ; $C7DC  60

    .byte $86,$0E,$84,$0F,$0A,$A8,$C8,$68,$85,$0C,$68,$85,$0D,$B1,$0C,$AA  ; $C7DD
    .byte $C8,$B1,$0C,$85,$0D,$86,$0C,$A6,$0E,$A4,$0F,$6C,$0C,$00  ; $C7ED

sub_1E_C7FB:
    LDX #$00                     ; $C7FB  A2 00
    LDY #$04                     ; $C7FD  A0 04
    LDA $E4,X                    ; $C7FF  B5 E4
    AND #$02                     ; $C801  29 02
    STA $00                      ; $C803  85 00
    LDA $E5,X                    ; $C805  B5 E5
    AND #$02                     ; $C807  29 02
    EOR $00                      ; $C809  45 00
    CLC                          ; $C80B  18
    BEQ loc_1E_C80F              ; $C80C  F0 01
    SEC                          ; $C80E  38

loc_1E_C80F:
    ROR $E4,X                    ; $C80F  76 E4
    INX                          ; $C811  E8
    DEY                          ; $C812  88
    BNE loc_1E_C80F              ; $C813  D0 FA
    RTS                          ; $C815  60


sub_1E_C816:
    LDA $22                      ; $C816  A5 22
    STA $F5                      ; $C818  85 F5
    JSR sub_1F_FF6B              ; $C81A  20 6B FF
    LDA $AA80                    ; $C81D  AD 80 AA
    STA $E8                      ; $C820  85 E8
    LDA $AA81                    ; $C822  AD 81 AA
    STA $E9                      ; $C825  85 E9
    LDX #$07                     ; $C827  A2 07

loc_1E_C829:
    LDA $C898,X                  ; $C829  BD 98 C8
    STA $0610,X                  ; $C82C  9D 10 06
    STA $0630,X                  ; $C82F  9D 30 06
    DEX                          ; $C832  CA
    BPL loc_1E_C829              ; $C833  10 F4
    LDA #$00                     ; $C835  A9 00
    STA $EA                      ; $C837  85 EA
    LDA #$01                     ; $C839  A9 01
    STA $EB                      ; $C83B  85 EB

sub_1E_C83D:
    LDA $2B                      ; $C83D  A5 2B
    ASL A                        ; $C83F  0A
    TAX                          ; $C840  AA
    LDA $AA60,X                  ; $C841  BD 60 AA
    PHA                          ; $C844  48
    LDA $AA61,X                  ; $C845  BD 61 AA
    ASL A                        ; $C848  0A
    ASL A                        ; $C849  0A
    STA $00                      ; $C84A  85 00
    ASL A                        ; $C84C  0A
    ASL A                        ; $C84D  0A
    ADC $00                      ; $C84E  65 00
    TAY                          ; $C850  A8
    LDX #$00                     ; $C851  A2 00

loc_1E_C853:
    LDA $AA82,Y                  ; $C853  B9 82 AA
    STA $0600,X                  ; $C856  9D 00 06
    STA $0620,X                  ; $C859  9D 20 06
    INY                          ; $C85C  C8
    INX                          ; $C85D  E8
    CPX #$10                     ; $C85E  E0 10
    BNE loc_1E_C853              ; $C860  D0 F1
    LDX #$00                     ; $C862  A2 00

loc_1E_C864:
    LDA $AA82,Y                  ; $C864  B9 82 AA
    PHA                          ; $C867  48
    AND #$80                     ; $C868  29 80
    STA $0100,X                  ; $C86A  9D 00 01
    PLA                          ; $C86D  68
    AND #$7F                     ; $C86E  29 7F
    STA $0108,X                  ; $C870  9D 08 01
    LDA #$00                     ; $C873  A9 00
    STA $0104,X                  ; $C875  9D 04 01
    STA $010C,X                  ; $C878  9D 0C 01
    INY                          ; $C87B  C8
    INX                          ; $C87C  E8
    CPX #$04                     ; $C87D  E0 04
    BNE loc_1E_C864              ; $C87F  D0 E3
    LDA $0600                    ; $C881  AD 00 06
    STA $0610                    ; $C884  8D 10 06
    STA $0630                    ; $C887  8D 30 06
    LDA #$01                     ; $C88A  A9 01
    STA $F5                      ; $C88C  85 F5
    JSR sub_1F_FF6B              ; $C88E  20 6B FF
    PLA                          ; $C891  68
    JSR $A000                    ; $C892  20 00 A0
    JMP sub_1F_FF3C              ; $C895  4C 3C FF

    .byte $0F,$0F,$2C,$11,$0F,$0F,$30,$37  ; $C898

sub_1E_C8A0:
    TXA                          ; $C8A0  8A
    PHA                          ; $C8A1  48
    TYA                          ; $C8A2  98
    PHA                          ; $C8A3  48
    LDA $F5                      ; $C8A4  A5 F5
    CMP #$13                     ; $C8A6  C9 13
    BEQ loc_1E_C8B4              ; $C8A8  F0 0A
    LDY $22                      ; $C8AA  A4 22
    LDA $C8B9,Y                  ; $C8AC  B9 B9 C8
    STA $F5                      ; $C8AF  85 F5
    JSR sub_1F_FF6B              ; $C8B1  20 6B FF

loc_1E_C8B4:
    PLA                          ; $C8B4  68
    TAY                          ; $C8B5  A8
    PLA                          ; $C8B6  68
    TAX                          ; $C8B7  AA
    RTS                          ; $C8B8  60

    .byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0D,$0F  ; $C8B9
    .byte $0D,$11,$12,$13,$10,$1E,$0E  ; $C8C9
    LDX #$BF                     ; $C8D0  A2 BF
    TXS                          ; $C8D2  9A
    LDA $FF                      ; $C8D3  A5 FF
    STA $2000                    ; $C8D5  8D 00 20
    JSR sub_1F_FF21              ; $C8D8  20 21 FF
    LDA #$88                     ; $C8DB  A9 88
    STA $E4                      ; $C8DD  85 E4
    CLI                          ; $C8DF  58
    LDA #$01                     ; $C8E0  A9 01
    STA $9B                      ; $C8E2  85 9B
    LDA #$00                     ; $C8E4  A9 00
    JSR sub_1F_F898              ; $C8E6  20 98 F8
    LDA #$40                     ; $C8E9  A9 40
    STA $99                      ; $C8EB  85 99
    LDA #$18                     ; $C8ED  A9 18
    STA $F4                      ; $C8EF  85 F4
    JSR sub_1F_FF6B              ; $C8F1  20 6B FF
    JSR $9009                    ; $C8F4  20 09 90
    LDA #$9C                     ; $C8F7  A9 9C
    STA $A9                      ; $C8F9  85 A9
    LDA #$02                     ; $C8FB  A9 02
    STA $AE                      ; $C8FD  85 AE

loc_1E_C8FF:
    LDA #$00                     ; $C8FF  A9 00
    LDY #$1F                     ; $C901  A0 1F

loc_1E_C903:
    STA $0150,Y                  ; $C903  99 50 01
    DEY                          ; $C906  88
    BPL loc_1E_C903              ; $C907  10 FA

loc_1E_C909:
    LDA #$00                     ; $C909  A9 00
    STA $EE                      ; $C90B  85 EE
    JSR sub_1E_C752              ; $C90D  20 52 C7
    LDA #$04                     ; $C910  A9 04
    STA $97                      ; $C912  85 97
    JSR sub_1E_C5E9              ; $C914  20 E9 C5
    JSR sub_1F_FF21              ; $C917  20 21 FF
    JSR sub_1E_C628              ; $C91A  20 28 C6
    LDA #$01                     ; $C91D  A9 01
    STA $A000                    ; $C91F  8D 00 A0
    LDA #$00                     ; $C922  A9 00
    STA $F8                      ; $C924  85 F8
    STA $0300                    ; $C926  8D 00 03
    STA $FD                      ; $C929  85 FD
    STA $71                      ; $C92B  85 71
    STA $72                      ; $C92D  85 72
    STA $FC                      ; $C92F  85 FC
    STA $FA                      ; $C931  85 FA
    STA $F9                      ; $C933  85 F9
    STA $25                      ; $C935  85 25
    STA $0380                    ; $C937  8D 80 03
    STA $03E0                    ; $C93A  8D E0 03
    STA $B1                      ; $C93D  85 B1
    STA $B2                      ; $C93F  85 B2
    STA $B3                      ; $C941  85 B3
    STA $9E                      ; $C943  85 9E
    STA $9F                      ; $C945  85 9F
    STA $5A                      ; $C947  85 5A
    STA $A0                      ; $C949  85 A0
    STA $B4                      ; $C94B  85 B4
    STA $A1                      ; $C94D  85 A1
    STA $6F                      ; $C94F  85 6F
    LDY $22                      ; $C951  A4 22
    LDA $CD0C,Y                  ; $C953  B9 0C CD
    JSR sub_1F_F898              ; $C956  20 98 F8
    LDA #$01                     ; $C959  A9 01
    STA $31                      ; $C95B  85 31
    STA $23                      ; $C95D  85 23
    STA $2E                      ; $C95F  85 2E
    LDA #$FF                     ; $C961  A9 FF
    STA $29                      ; $C963  85 29
    LDA #$1F                     ; $C965  A9 1F
    STA $24                      ; $C967  85 24

loc_1E_C969:
    LDA #$01                     ; $C969  A9 01
    STA $10                      ; $C96B  85 10
    JSR sub_1F_E4F1              ; $C96D  20 F1 E4
    JSR sub_1F_FF21              ; $C970  20 21 FF
    LDA $29                      ; $C973  A5 29
    BEQ loc_1E_C969              ; $C975  F0 F2
    LDA $22                      ; $C977  A5 22
    STA $F5                      ; $C979  85 F5
    JSR sub_1F_FF6B              ; $C97B  20 6B FF
    LDA $AA40                    ; $C97E  AD 40 AA
    PHA                          ; $C981  48
    AND #$E0                     ; $C982  29 E0
    STA $2A                      ; $C984  85 2A
    LDX #$01                     ; $C986  A2 01
    LDY #$2A                     ; $C988  A0 2A
    AND #$C0                     ; $C98A  29 C0
    BEQ loc_1E_C991              ; $C98C  F0 03
    DEX                          ; $C98E  CA
    LDY #$26                     ; $C98F  A0 26

loc_1E_C991:
    STX $A000                    ; $C991  8E 00 A0
    STY $52                      ; $C994  84 52
    PLA                          ; $C996  68
    AND #$1F                     ; $C997  29 1F
    STA $2C                      ; $C999  85 2C
    LDA #$00                     ; $C99B  A9 00
    STA $2B                      ; $C99D  85 2B
    STA $2D                      ; $C99F  85 2D
    JSR sub_1E_C816              ; $C9A1  20 16 C8
    LDA #$00                     ; $C9A4  A9 00
    STA $18                      ; $C9A6  85 18
    JSR sub_1F_FF21              ; $C9A8  20 21 FF
    JSR sub_1E_C74C              ; $C9AB  20 4C C7
    LDA #$80                     ; $C9AE  A9 80
    STA $0360                    ; $C9B0  8D 60 03

loc_1E_C9B3:
    LDA #$9C                     ; $C9B3  A9 9C
    STA $A2                      ; $C9B5  85 A2
    LDA #$E8                     ; $C9B7  A9 E8
    STA $51                      ; $C9B9  85 51
    STA $5E                      ; $C9BB  85 5E
    LDA $F9                      ; $C9BD  A5 F9
    BNE loc_1E_C9D3              ; $C9BF  D0 12
    LDA $22                      ; $C9C1  A5 22
    CMP #$02                     ; $C9C3  C9 02
    BEQ loc_1E_C9CB              ; $C9C5  F0 04
    CMP #$09                     ; $C9C7  C9 09
    BNE loc_1E_C9D3              ; $C9C9  D0 08

loc_1E_C9CB:
    LDA #$9F                     ; $C9CB  A9 9F
    STA $5E                      ; $C9CD  85 5E
    LDA #$02                     ; $C9CF  A9 02
    STA $F8                      ; $C9D1  85 F8

loc_1E_C9D3:
    LDA #$74                     ; $C9D3  A9 74
    STA $EA                      ; $C9D5  85 EA
    LDA #$75                     ; $C9D7  A9 75
    STA $EB                      ; $C9D9  85 EB
    JSR sub_1F_FF3C              ; $C9DB  20 3C FF
    LDA #$30                     ; $C9DE  A9 30
    STA $0611                    ; $C9E0  8D 11 06
    INC $18                      ; $C9E3  E6 18
    LDA #$3C                     ; $C9E5  A9 3C

loc_1E_C9E7:
    PHA                          ; $C9E7  48
    LDA $95                      ; $C9E8  A5 95
    AND #$10                     ; $C9EA  29 10
    BEQ loc_1E_CA10              ; $C9EC  F0 22
    LDX #$10                     ; $C9EE  A2 10

loc_1E_C9F0:
    LDA $CCF8,X                  ; $C9F0  BD F8 CC
    STA $0200,X                  ; $C9F3  9D 00 02
    LDA $CCF9,X                  ; $C9F6  BD F9 CC
    STA $0201,X                  ; $C9F9  9D 01 02
    LDA $CCFA,X                  ; $C9FC  BD FA CC
    STA $0202,X                  ; $C9FF  9D 02 02
    LDA $CCFB,X                  ; $CA02  BD FB CC
    STA $0203,X                  ; $CA05  9D 03 02
    DEX                          ; $CA08  CA
    DEX                          ; $CA09  CA
    DEX                          ; $CA0A  CA
    DEX                          ; $CA0B  CA
    BPL loc_1E_C9F0              ; $CA0C  10 E2
    LDA #$14                     ; $CA0E  A9 14

loc_1E_CA10:
    STA $97                      ; $CA10  85 97
    TAX                          ; $CA12  AA
    LDA #$F8                     ; $CA13  A9 F8

loc_1E_CA15:
    STA $0200,X                  ; $CA15  9D 00 02
    INX                          ; $CA18  E8
    INX                          ; $CA19  E8
    INX                          ; $CA1A  E8
    INX                          ; $CA1B  E8
    BNE loc_1E_CA15              ; $CA1C  D0 F7
    LDA #$00                     ; $CA1E  A9 00
    STA $EE                      ; $CA20  85 EE
    JSR sub_1F_FF21              ; $CA22  20 21 FF
    INC $EE                      ; $CA25  E6 EE
    INC $95                      ; $CA27  E6 95
    PLA                          ; $CA29  68
    SEC                          ; $CA2A  38
    SBC #$01                     ; $CA2B  E9 01
    BNE loc_1E_C9E7              ; $CA2D  D0 B8
    LDA #$0F                     ; $CA2F  A9 0F
    STA $0611                    ; $CA31  8D 11 06
    INC $18                      ; $CA34  E6 18
    LDA #$00                     ; $CA36  A9 00
    STA $EA                      ; $CA38  85 EA
    LDA #$01                     ; $CA3A  A9 01
    STA $EB                      ; $CA3C  85 EB
    JSR sub_1F_FF3C              ; $CA3E  20 3C FF
    LDA #$80                     ; $CA41  A9 80
    STA $0300                    ; $CA43  8D 00 03
    LDA #$00                     ; $CA46  A9 00
    STA $03C0                    ; $CA48  8D C0 03
    LDA #$D0                     ; $CA4B  A9 D0
    STA $0580                    ; $CA4D  8D 80 05
    LDA #$4C                     ; $CA50  A9 4C
    STA $0400                    ; $CA52  8D 00 04
    LDA #$01                     ; $CA55  A9 01
    STA $0420                    ; $CA57  8D 20 04
    LDA #$00                     ; $CA5A  A9 00
    STA $0440                    ; $CA5C  8D 40 04
    LDA #$F9                     ; $CA5F  A9 F9
    STA $0460                    ; $CA61  8D 60 04
    LDX #$00                     ; $CA64  A2 00
    LDA #$13                     ; $CA66  A9 13
    JSR sub_1F_F835              ; $CA68  20 35 F8
    LDA #$04                     ; $CA6B  A9 04
    STA $30                      ; $CA6D  85 30
    LDA #$80                     ; $CA6F  A9 80
    STA $B2                      ; $CA71  85 B2

loc_1E_CA73:
    LDA $14                      ; $CA73  A5 14
    AND #$10                     ; $CA75  29 10
    BEQ loc_1E_CAB5              ; $CA77  F0 3C
    LDA $30                      ; $CA79  A5 30
    CMP #$04                     ; $CA7B  C9 04
    BEQ loc_1E_CAB5              ; $CA7D  F0 36
    CMP #$07                     ; $CA7F  C9 07
    BEQ loc_1E_CAB5              ; $CA81  F0 32
    CMP #$09                     ; $CA83  C9 09
    BCS loc_1E_CAB5              ; $CA85  B0 2E
    LDA $A0                      ; $CA87  A5 A0
    SEC                          ; $CA89  38
    SBC #$06                     ; $CA8A  E9 06
    BCC loc_1E_CA99              ; $CA8C  90 0B
    AND #$01                     ; $CA8E  29 01
    BEQ loc_1E_CA99              ; $CA90  F0 07
    LDA #$00                     ; $CA92  A9 00
    STA $0301                    ; $CA94  8D 01 03
    BEQ loc_1E_CAA4              ; $CA97  F0 0B

loc_1E_CA99:
    LDA $0301                    ; $CA99  AD 01 03
    ORA $0302                    ; $CA9C  0D 02 03
    ORA $0303                    ; $CA9F  0D 03 03
    BMI loc_1E_CAB5              ; $CAA2  30 11

loc_1E_CAA4:
    LDY $30                      ; $CAA4  A4 30
    LDA $CD1E,Y                  ; $CAA6  B9 1E CD
    BMI loc_1E_CAB5              ; $CAA9  30 0A
    LDA #$02                     ; $CAAB  A9 02
    STA $F5                      ; $CAAD  85 F5
    JSR sub_1F_FF6B              ; $CAAF  20 6B FF
    JSR $A003                    ; $CAB2  20 03 A0

loc_1E_CAB5:
    LDA $22                      ; $CAB5  A5 22
    STA $F5                      ; $CAB7  85 F5
    JSR sub_1F_FF6B              ; $CAB9  20 6B FF
    JSR sub_1E_CD34              ; $CABC  20 34 CD
    LDA $3D                      ; $CABF  A5 3D
    BEQ loc_1E_CAD7              ; $CAC1  F0 14
    STA $30                      ; $CAC3  85 30
    CMP #$0E                     ; $CAC5  C9 0E
    BNE loc_1E_CAD3              ; $CAC7  D0 0A
    LDA #$F2                     ; $CAC9  A9 F2
    JSR sub_1F_F89A              ; $CACB  20 9A F8
    LDA #$17                     ; $CACE  A9 17
    JSR sub_1F_F89A              ; $CAD0  20 9A F8

loc_1E_CAD3:
    LDA #$00                     ; $CAD3  A9 00
    STA $3D                      ; $CAD5  85 3D

loc_1E_CAD7:
    JSR sub_1F_E16A              ; $CAD7  20 6A E1
    LDA $FC                      ; $CADA  A5 FC
    STA $25                      ; $CADC  85 25
    STA $00                      ; $CADE  85 00
    LDA $F8                      ; $CAE0  A5 F8
    CMP #$02                     ; $CAE2  C9 02
    BNE loc_1E_CAF2              ; $CAE4  D0 0C
    LDA $F9                      ; $CAE6  A5 F9
    LSR A                        ; $CAE8  4A
    ROR $00                      ; $CAE9  66 00
    LSR A                        ; $CAEB  4A
    ROR $00                      ; $CAEC  66 00
    LDA $00                      ; $CAEE  A5 00
    STA $5F                      ; $CAF0  85 5F

loc_1E_CAF2:
    LDA $0380                    ; $CAF2  AD 80 03
    CMP $6F                      ; $CAF5  C5 6F
    BCC loc_1E_CAFB              ; $CAF7  90 02
    STA $6F                      ; $CAF9  85 6F

loc_1E_CAFB:
    LDA $0360                    ; $CAFB  AD 60 03
    STA $27                      ; $CAFE  85 27
    LDX #$1C                     ; $CB00  A2 1C
    STX $F4                      ; $CB02  86 F4
    INX                          ; $CB04  E8
    STX $F5                      ; $CB05  86 F5
    JSR sub_1F_FF6B              ; $CB07  20 6B FF
    JSR $8000                    ; $CB0A  20 00 80
    LDA #$1A                     ; $CB0D  A9 1A
    STA $F4                      ; $CB0F  85 F4
    LDA $22                      ; $CB11  A5 22
    STA $F5                      ; $CB13  85 F5
    JSR sub_1F_FF6B              ; $CB15  20 6B FF
    JSR $9C00                    ; $CB18  20 00 9C
    LDA #$09                     ; $CB1B  A9 09
    STA $F4                      ; $CB1D  85 F4
    JSR sub_1F_FF6B              ; $CB1F  20 6B FF
    JSR $8003                    ; $CB22  20 03 80
    JSR $8006                    ; $CB25  20 06 80
    JSR $800F                    ; $CB28  20 0F 80
    JSR $8009                    ; $CB2B  20 09 80
    JSR $800C                    ; $CB2E  20 0C 80
    JSR $8000                    ; $CB31  20 00 80
    JSR $8012                    ; $CB34  20 12 80
    JSR sub_1E_C798              ; $CB37  20 98 C7
    JSR sub_1F_FF57              ; $CB3A  20 57 FF
    LDA $98                      ; $CB3D  A5 98
    AND #$02                     ; $CB3F  29 02
    BEQ loc_1E_CB49              ; $CB41  F0 06
    LDA #$01                     ; $CB43  A9 01
    ORA $17                      ; $CB45  05 17
    STA $17                      ; $CB47  85 17

loc_1E_CB49:
    JSR sub_1E_C7FB              ; $CB49  20 FB C7
    LDA $59                      ; $CB4C  A5 59
    BNE loc_1E_CB5B              ; $CB4E  D0 0B
    LDA $3C                      ; $CB50  A5 3C
    BNE loc_1E_CB78              ; $CB52  D0 24
    LDA $74                      ; $CB54  A5 74
    BNE loc_1E_CBCE              ; $CB56  D0 76
    JMP loc_1E_CA73              ; $CB58  4C 73 CA


loc_1E_CB5B:
    LDA #$00                     ; $CB5B  A9 00
    STA $EE                      ; $CB5D  85 EE
    STA $71                      ; $CB5F  85 71
    STA $72                      ; $CB61  85 72
    STA $F8                      ; $CB63  85 F8
    STA $5A                      ; $CB65  85 5A
    LDA #$18                     ; $CB67  A9 18
    STA $F4                      ; $CB69  85 F4
    LDA #$10                     ; $CB6B  A9 10
    STA $F5                      ; $CB6D  85 F5
    JSR sub_1F_FF6B              ; $CB6F  20 6B FF
    JSR $9000                    ; $CB72  20 00 90
    JMP loc_1E_C8FF              ; $CB75  4C FF C8


loc_1E_CB78:
    LDA #$00                     ; $CB78  A9 00
    STA $3C                      ; $CB7A  85 3C
    STA $5A                      ; $CB7C  85 5A
    LDA $AE                      ; $CB7E  A5 AE
    SEC                          ; $CB80  38
    SBC #$01                     ; $CB81  E9 01
    BCC loc_1E_CBB1              ; $CB83  90 2C
    STA $AE                      ; $CB85  85 AE
    AND #$0F                     ; $CB87  29 0F
    CMP #$0F                     ; $CB89  C9 0F
    BNE loc_1E_CB94              ; $CB8B  D0 07
    LDA $AE                      ; $CB8D  A5 AE
    SEC                          ; $CB8F  38
    SBC #$06                     ; $CB90  E9 06
    STA $AE                      ; $CB92  85 AE

loc_1E_CB94:
    LDA #$00                     ; $CB94  A9 00
    STA $EE                      ; $CB96  85 EE
    STA $71                      ; $CB98  85 71
    STA $72                      ; $CB9A  85 72
    STA $F8                      ; $CB9C  85 F8
    LDA $60                      ; $CB9E  A5 60
    CMP #$12                     ; $CBA0  C9 12
    BEQ loc_1E_CBA7              ; $CBA2  F0 03
    JMP loc_1E_CC18              ; $CBA4  4C 18 CC


loc_1E_CBA7:
    LDA #$18                     ; $CBA7  A9 18
    STA $F4                      ; $CBA9  85 F4
    JSR sub_1F_FF6B              ; $CBAB  20 6B FF
    JMP $9006                    ; $CBAE  4C 06 90


loc_1E_CBB1:
    LDA #$00                     ; $CBB1  A9 00
    STA $EE                      ; $CBB3  85 EE
    STA $5A                      ; $CBB5  85 5A
    STA $71                      ; $CBB7  85 71
    STA $72                      ; $CBB9  85 72
    STA $F8                      ; $CBBB  85 F8
    LDA #$18                     ; $CBBD  A9 18
    STA $F4                      ; $CBBF  85 F4
    LDA #$13                     ; $CBC1  A9 13
    STA $F5                      ; $CBC3  85 F5
    JSR sub_1F_FF6B              ; $CBC5  20 6B FF
    JSR $9003                    ; $CBC8  20 03 90
    JMP loc_1E_C8FF              ; $CBCB  4C FF C8


loc_1E_CBCE:
    PHA                          ; $CBCE  48
    LDA #$00                     ; $CBCF  A9 00
    STA $5A                      ; $CBD1  85 5A
    STA $74                      ; $CBD3  85 74
    STA $B1                      ; $CBD5  85 B1
    STA $B2                      ; $CBD7  85 B2
    STA $B3                      ; $CBD9  85 B3
    STA $5A                      ; $CBDB  85 5A
    STA $F9                      ; $CBDD  85 F9
    STA $F8                      ; $CBDF  85 F8
    LDA #$0B                     ; $CBE1  A9 0B
    STA $F4                      ; $CBE3  85 F4
    LDA #$0E                     ; $CBE5  A9 0E
    STA $F5                      ; $CBE7  85 F5
    JSR sub_1F_FF6B              ; $CBE9  20 6B FF
    PLA                          ; $CBEC  68
    AND #$7F                     ; $CBED  29 7F
    BNE loc_1E_CBF7              ; $CBEF  D0 06
    JSR $8000                    ; $CBF1  20 00 80
    JMP loc_1E_C8FF              ; $CBF4  4C FF C8


loc_1E_CBF7:
    LDA $75                      ; $CBF7  A5 75
    CMP #$06                     ; $CBF9  C9 06
    BEQ loc_1E_CC03              ; $CBFB  F0 06
    JSR $8003                    ; $CBFD  20 03 80
    JMP loc_1E_C8FF              ; $CC00  4C FF C8


loc_1E_CC03:
    LDA #$0C                     ; $CC03  A9 0C
    STA $F4                      ; $CC05  85 F4
    LDA #$0E                     ; $CC07  A9 0E
    STA $F5                      ; $CC09  85 F5
    JSR sub_1F_FF6B              ; $CC0B  20 6B FF
    LDA #$11                     ; $CC0E  A9 11
    STA $F8                      ; $CC10  85 F8
    JSR $8000                    ; $CC12  20 00 80
    JMP loc_1E_C8FF              ; $CC15  4C FF C8


loc_1E_CC18:
    LDA $22                      ; $CC18  A5 22
    STA $F5                      ; $CC1A  85 F5
    JSR sub_1F_FF6B              ; $CC1C  20 6B FF
    LDY #$00                     ; $CC1F  A0 00

loc_1E_CC21:
    LDA $6F                      ; $CC21  A5 6F
    CMP $AAF8,Y                  ; $CC23  D9 F8 AA
    BCC loc_1E_CC2B              ; $CC26  90 03
    INY                          ; $CC28  C8
    BNE loc_1E_CC21              ; $CC29  D0 F6

loc_1E_CC2B:
    DEY                          ; $CC2B  88
    BPL loc_1E_CC31              ; $CC2C  10 03
    JMP loc_1E_C909              ; $CC2E  4C 09 C9


loc_1E_CC31:
    TYA                          ; $CC31  98
    PHA                          ; $CC32  48
    JSR sub_1E_C752              ; $CC33  20 52 C7
    LDA #$04                     ; $CC36  A9 04
    STA $97                      ; $CC38  85 97
    JSR sub_1E_C5E9              ; $CC3A  20 E9 C5
    JSR sub_1F_FF21              ; $CC3D  20 21 FF
    JSR sub_1E_C628              ; $CC40  20 28 C6
    LDA #$00                     ; $CC43  A9 00
    STA $F8                      ; $CC45  85 F8
    STA $FD                      ; $CC47  85 FD
    STA $71                      ; $CC49  85 71
    STA $72                      ; $CC4B  85 72
    STA $FC                      ; $CC4D  85 FC
    STA $FA                      ; $CC4F  85 FA
    STA $25                      ; $CC51  85 25
    STA $03E0                    ; $CC53  8D E0 03
    STA $B1                      ; $CC56  85 B1
    STA $B2                      ; $CC58  85 B2
    STA $B3                      ; $CC5A  85 B3
    STA $5A                      ; $CC5C  85 5A
    STA $A0                      ; $CC5E  85 A0
    STA $B4                      ; $CC60  85 B4
    STA $A1                      ; $CC62  85 A1
    PLA                          ; $CC64  68
    TAY                          ; $CC65  A8
    LDA $AAF8,Y                  ; $CC66  B9 F8 AA
    STA $29                      ; $CC69  85 29
    STA $F9                      ; $CC6B  85 F9
    STA $0380                    ; $CC6D  8D 80 03
    LDA $ABC0,Y                  ; $CC70  B9 C0 AB
    STA $9E                      ; $CC73  85 9E
    STA $9F                      ; $CC75  85 9F
    LDX $AAF0,Y                  ; $CC77  BE F0 AA
    STX $2B                      ; $CC7A  86 2B
    LDA $AA40,X                  ; $CC7C  BD 40 AA
    PHA                          ; $CC7F  48
    STA $00                      ; $CC80  85 00
    AND #$20                     ; $CC82  29 20
    STA $2A                      ; $CC84  85 2A
    BNE loc_1E_CC8E              ; $CC86  D0 06
    LDA $00                      ; $CC88  A5 00
    AND #$C0                     ; $CC8A  29 C0
    STA $2A                      ; $CC8C  85 2A

loc_1E_CC8E:
    LDX #$01                     ; $CC8E  A2 01
    LDY #$2A                     ; $CC90  A0 2A
    AND #$20                     ; $CC92  29 20
    BNE loc_1E_CC99              ; $CC94  D0 03
    DEX                          ; $CC96  CA
    LDY #$26                     ; $CC97  A0 26

loc_1E_CC99:
    STX $A000                    ; $CC99  8E 00 A0
    STY $52                      ; $CC9C  84 52
    PLA                          ; $CC9E  68
    AND #$1F                     ; $CC9F  29 1F
    STA $2C                      ; $CCA1  85 2C
    LDA #$00                     ; $CCA3  A9 00
    STA $2D                      ; $CCA5  85 2D
    LDY $22                      ; $CCA7  A4 22
    LDA $CD0C,Y                  ; $CCA9  B9 0C CD
    JSR sub_1F_F898              ; $CCAC  20 98 F8
    LDA #$01                     ; $CCAF  A9 01
    STA $31                      ; $CCB1  85 31
    STA $23                      ; $CCB3  85 23
    STA $2E                      ; $CCB5  85 2E
    DEC $29                      ; $CCB7  C6 29
    LDA #$1F                     ; $CCB9  A9 1F
    STA $24                      ; $CCBB  85 24
    LDA #$21                     ; $CCBD  A9 21

loc_1E_CCBF:
    PHA                          ; $CCBF  48
    LDA #$01                     ; $CCC0  A9 01
    STA $10                      ; $CCC2  85 10
    JSR sub_1F_E4F1              ; $CCC4  20 F1 E4
    JSR sub_1F_FF21              ; $CCC7  20 21 FF
    PLA                          ; $CCCA  68
    SEC                          ; $CCCB  38
    SBC #$01                     ; $CCCC  E9 01
    BNE loc_1E_CCBF              ; $CCCE  D0 EF
    JSR sub_1E_C816              ; $CCD0  20 16 C8
    LDA #$00                     ; $CCD3  A9 00
    STA $18                      ; $CCD5  85 18
    JSR sub_1F_FF21              ; $CCD7  20 21 FF
    JSR sub_1E_C74C              ; $CCDA  20 4C C7
    LDA #$80                     ; $CCDD  A9 80
    STA $0360                    ; $CCDF  8D 60 03
    JMP loc_1E_C9B3              ; $CCE2  4C B3 C9

    .byte $A5,$98,$29,$03,$C9,$01,$D0,$0A,$A0,$0B,$A9,$9C,$99,$A2,$00,$88  ; $CCE5
    .byte $10,$FA,$60,$80,$40,$00,$6C,$80,$41,$00,$74,$80,$42,$00,$7C,$80  ; $CCF5
    .byte $43,$00,$84,$80,$44,$00,$8C,$01,$02,$03,$04,$05,$06,$07,$08,$01  ; $CD05
    .byte $03,$07,$08,$09,$09,$0A,$0A,$0B,$0B,$00,$00,$FF,$00,$FF,$00,$FF  ; $CD15
    .byte $FF,$00,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $CD25

sub_1E_CD34:
    LDA $0420                    ; $CD34  AD 20 04
    CMP #$02                     ; $CD37  C9 02
    BNE loc_1E_CD41              ; $CD39  D0 06
    LDA $30                      ; $CD3B  A5 30
    CMP #$02                     ; $CD3D  C9 02
    BEQ loc_1E_CD4B              ; $CD3F  F0 0A

loc_1E_CD41:
    LDA #$4C                     ; $CD41  A9 4C
    STA $0400                    ; $CD43  8D 00 04
    LDA #$01                     ; $CD46  A9 01
    STA $0420                    ; $CD48  8D 20 04

loc_1E_CD4B:
    LDA #$40                     ; $CD4B  A9 40
    STA $99                      ; $CD4D  85 99
    LDX #$00                     ; $CD4F  A2 00
    STX $5D                      ; $CD51  86 5D
    LDA $36                      ; $CD53  A5 36
    BEQ loc_1E_CD5A              ; $CD55  F0 03
    JSR sub_1E_CDEC              ; $CD57  20 EC CD

loc_1E_CD5A:
    LDA $39                      ; $CD5A  A5 39
    BEQ loc_1E_CD6A              ; $CD5C  F0 0C
    DEC $39                      ; $CD5E  C6 39
    BNE loc_1E_CD6A              ; $CD60  D0 08
    LDA $05E0                    ; $CD62  AD E0 05
    AND #$7F                     ; $CD65  29 7F
    STA $05E0                    ; $CD67  8D E0 05

loc_1E_CD6A:
    LDA $16                      ; $CD6A  A5 16
    AND #$40                     ; $CD6C  29 40
    BNE loc_1E_CD76              ; $CD6E  D0 06
    LDA #$E0                     ; $CD70  A9 E0
    STA $1F                      ; $CD72  85 1F
    BNE loc_1E_CD8B              ; $CD74  D0 15

loc_1E_CD76:
    LDA $1F                      ; $CD76  A5 1F
    CLC                          ; $CD78  18
    ADC #$20                     ; $CD79  69 20
    STA $1F                      ; $CD7B  85 1F
    BNE loc_1E_CD8B              ; $CD7D  D0 0C
    LDA $A0                      ; $CD7F  A5 A0
    CMP #$02                     ; $CD81  C9 02
    BNE loc_1E_CD8B              ; $CD83  D0 06
    LDA $14                      ; $CD85  A5 14
    ORA #$40                     ; $CD87  09 40
    STA $14                      ; $CD89  85 14

loc_1E_CD8B:
    LDY $30                      ; $CD8B  A4 30
    LDA $CD9A,Y                  ; $CD8D  B9 9A CD
    STA $00                      ; $CD90  85 00
    LDA $CDB0,Y                  ; $CD92  B9 B0 CD
    STA $01                      ; $CD95  85 01
    JMP ($0000)                  ; $CD97  6C 00 00

    .byte $36,$07,$FD,$EB,$BA,$13,$AB,$31,$58,$29,$91,$BE,$D3,$E1,$79,$CC  ; $CD9A
    .byte $14,$AA,$52,$33,$8A,$8C,$CE,$D0,$D3,$D4,$D5,$D6,$D6,$D8,$D8,$D9  ; $CDAA
    .byte $D9,$D9,$D9,$DB,$D7,$CD,$DD,$DD,$DE,$DF,$DF,$E0,$66,$61,$E0,$CF  ; $CDBA
    .byte $CE,$CF  ; $CDCA
    LDA $5A                      ; $CDCC  A5 5A
    BMI loc_1E_CDE6              ; $CDCE  30 16
    LDY #$00                     ; $CDD0  A0 00
    JSR sub_1F_F67C              ; $CDD2  20 7C F6
    BCC loc_1E_CDE5              ; $CDD5  90 0E
    LDA #$01                     ; $CDD7  A9 01
    CMP $05C0                    ; $CDD9  CD C0 05
    BEQ loc_1E_CDE5              ; $CDDC  F0 07
    JSR sub_1F_F835              ; $CDDE  20 35 F8
    LDA #$00                     ; $CDE1  A9 00
    STA $32                      ; $CDE3  85 32

loc_1E_CDE5:
    RTS                          ; $CDE5  60


loc_1E_CDE6:
    LDA #$00                     ; $CDE6  A9 00
    STA $05E0                    ; $CDE8  8D E0 05
    RTS                          ; $CDEB  60


sub_1E_CDEC:
    LDA $0580                    ; $CDEC  AD 80 05
    PHA                          ; $CDEF  48
    LDA $0400                    ; $CDF0  AD 00 04
    PHA                          ; $CDF3  48
    LDA $0420                    ; $CDF4  AD 20 04
    PHA                          ; $CDF7  48
    LDA $37                      ; $CDF8  A5 37
    STA $0400                    ; $CDFA  8D 00 04
    LDA $38                      ; $CDFD  A5 38
    STA $0420                    ; $CDFF  8D 20 04
    LDY $30                      ; $CE02  A4 30
    CPY #$02                     ; $CE04  C0 02
    BEQ loc_1E_CE0A              ; $CE06  F0 02
    LDY #$00                     ; $CE08  A0 00

loc_1E_CE0A:
    LDA $36                      ; $CE0A  A5 36
    AND #$01                     ; $CE0C  29 01
    BEQ loc_1E_CE16              ; $CE0E  F0 06
    JSR sub_1F_F580              ; $CE10  20 80 F5
    JMP loc_1E_CE1A              ; $CE13  4C 1A CE


loc_1E_CE16:
    INY                          ; $CE16  C8
    JSR sub_1F_F5C4              ; $CE17  20 C4 F5

loc_1E_CE1A:
    PLA                          ; $CE1A  68
    STA $0420                    ; $CE1B  8D 20 04
    PLA                          ; $CE1E  68
    STA $0400                    ; $CE1F  8D 00 04
    PLA                          ; $CE22  68
    AND #$40                     ; $CE23  29 40
    STA $00                      ; $CE25  85 00
    LDA $0580                    ; $CE27  AD 80 05
    AND #$BF                     ; $CE2A  29 BF
    ORA $00                      ; $CE2C  05 00
    STA $0580                    ; $CE2E  8D 80 05
    LDA #$00                     ; $CE31  A9 00
    STA $36                      ; $CE33  85 36

loc_1E_CE35:
    RTS                          ; $CE35  60

    JSR sub_1E_D007              ; $CE36  20 07 D0
    BCC loc_1E_CE35              ; $CE39  90 FA
    LDY $5D                      ; $CE3B  A4 5D
    CPY #$01                     ; $CE3D  C0 01
    BNE loc_1E_CE88              ; $CE3F  D0 47
    LDA $05C0                    ; $CE41  AD C0 05
    CMP #$11                     ; $CE44  C9 11
    BNE loc_1E_CE4D              ; $CE46  D0 05
    LDA #$01                     ; $CE48  A9 01
    JSR sub_1F_F835              ; $CE4A  20 35 F8

loc_1E_CE4D:
    LDY $05C1                    ; $CE4D  AC C1 05
    CPY #$D7                     ; $CE50  C0 D7
    BCC loc_1E_CE88              ; $CE52  90 34
    LDA $CCEF,Y                  ; $CE54  B9 EF CC
    STA $00                      ; $CE57  85 00
    LDA $CCF2,Y                  ; $CE59  B9 F2 CC
    STA $01                      ; $CE5C  85 01
    JMP ($0000)                  ; $CE5E  6C 00 00

    LDA $05A1                    ; $CE61  AD A1 05
    BNE loc_1E_CE88              ; $CE64  D0 22
    INC $3A                      ; $CE66  E6 3A
    LDA #$EE                     ; $CE68  A9 EE
    STA $0440                    ; $CE6A  8D 40 04
    LDA #$06                     ; $CE6D  A9 06
    STA $0460                    ; $CE6F  8D 60 04
    INC $05A1                    ; $CE72  EE A1 05
    LDA #$3C                     ; $CE75  A9 3C
    STA $0501                    ; $CE77  8D 01 05
    LDA $0581                    ; $CE7A  AD 81 05
    AND #$FE                     ; $CE7D  29 FE
    STA $0581                    ; $CE7F  8D 81 05
    JSR sub_1E_DED8              ; $CE82  20 D8 DE
    JMP sub_1E_D007              ; $CE85  4C 07 D0


loc_1E_CE88:
    LDA $05C0                    ; $CE88  AD C0 05
    CMP #$10                     ; $CE8B  C9 10
    BNE loc_1E_CE9E              ; $CE8D  D0 0F
    LDA $14                      ; $CE8F  A5 14
    AND #$80                     ; $CE91  29 80
    BEQ loc_1E_CE35              ; $CE93  F0 A0
    LDA $16                      ; $CE95  A5 16
    AND #$04                     ; $CE97  29 04
    BEQ loc_1E_CE35              ; $CE99  F0 9A
    JMP loc_1E_D38E              ; $CE9B  4C 8E D3


loc_1E_CE9E:
    LDA $14                      ; $CE9E  A5 14
    AND #$80                     ; $CEA0  29 80
    BEQ loc_1E_CECD              ; $CEA2  F0 29
    LDA $16                      ; $CEA4  A5 16
    AND #$04                     ; $CEA6  29 04
    BEQ loc_1E_CEAD              ; $CEA8  F0 03
    JMP loc_1E_D38E              ; $CEAA  4C 8E D3


loc_1E_CEAD:
    LDA $17                      ; $CEAD  A5 17
    AND #$01                     ; $CEAF  29 01
    BNE loc_1E_CEC0              ; $CEB1  D0 0D
    LDA #$E5                     ; $CEB3  A9 E5
    STA $0440,X                  ; $CEB5  9D 40 04
    LDA #$04                     ; $CEB8  A9 04
    STA $0460,X                  ; $CEBA  9D 60 04
    JMP sub_1E_D007              ; $CEBD  4C 07 D0


loc_1E_CEC0:
    LDA #$00                     ; $CEC0  A9 00
    STA $0440                    ; $CEC2  8D 40 04
    LDA #$08                     ; $CEC5  A9 08
    STA $0460                    ; $CEC7  8D 60 04
    JMP sub_1E_D007              ; $CECA  4C 07 D0


loc_1E_CECD:
    LDA $05C0                    ; $CECD  AD C0 05
    CMP #$04                     ; $CED0  C9 04
    BEQ loc_1E_CEEB              ; $CED2  F0 17
    CMP #$05                     ; $CED4  C9 05
    BEQ loc_1E_CEEB              ; $CED6  F0 13
    CMP #$0D                     ; $CED8  C9 0D
    BEQ loc_1E_CEE4              ; $CEDA  F0 08
    CMP #$0E                     ; $CEDC  C9 0E
    BEQ loc_1E_CEE4              ; $CEDE  F0 04
    CMP #$0F                     ; $CEE0  C9 0F
    BNE loc_1E_CF0A              ; $CEE2  D0 26

loc_1E_CEE4:
    LDA $05A0                    ; $CEE4  AD A0 05
    BNE loc_1E_CF0A              ; $CEE7  D0 21
    BEQ sub_1E_CF59              ; $CEE9  F0 6E

loc_1E_CEEB:
    LDA $16                      ; $CEEB  A5 16
    AND $31                      ; $CEED  25 31
    BEQ loc_1E_CEF9              ; $CEEF  F0 08
    PHA                          ; $CEF1  48
    JSR sub_1E_CF59              ; $CEF2  20 59 CF
    PLA                          ; $CEF5  68
    JMP sub_1E_CF3D              ; $CEF6  4C 3D CF


loc_1E_CEF9:
    LDA #$0D                     ; $CEF9  A9 0D
    JSR sub_1F_F835              ; $CEFB  20 35 F8
    LDA $32                      ; $CEFE  A5 32
    BEQ loc_1E_CF05              ; $CF00  F0 03
    JSR sub_1E_D370              ; $CF02  20 70 D3

loc_1E_CF05:
    LDA $31                      ; $CF05  A5 31
    JMP sub_1E_CF3D              ; $CF07  4C 3D CF


loc_1E_CF0A:
    LDA $16                      ; $CF0A  A5 16
    AND #$03                     ; $CF0C  29 03
    BEQ loc_1E_CF4B              ; $CF0E  F0 3B
    STA $31                      ; $CF10  85 31
    JSR sub_1E_CF59              ; $CF12  20 59 CF
    LDA $05C0                    ; $CF15  AD C0 05
    CMP #$0D                     ; $CF18  C9 0D
    BEQ loc_1E_CF24              ; $CF1A  F0 08
    CMP #$0E                     ; $CF1C  C9 0E
    BEQ loc_1E_CF24              ; $CF1E  F0 04
    CMP #$0F                     ; $CF20  C9 0F
    BNE loc_1E_CEF9              ; $CF22  D0 D5

loc_1E_CF24:
    LDA #$04                     ; $CF24  A9 04
    JSR sub_1F_F835              ; $CF26  20 35 F8
    LDA $31                      ; $CF29  A5 31
    LDY $32                      ; $CF2B  A4 32
    BEQ sub_1E_CF3D              ; $CF2D  F0 0E
    JSR sub_1E_D370              ; $CF2F  20 70 D3
    LDY $A0                      ; $CF32  A4 A0
    CMP #$04                     ; $CF34  C9 04
    BNE sub_1E_CF3D              ; $CF36  D0 05
    LDY #$AA                     ; $CF38  A0 AA
    STA $05C0                    ; $CF3A  8D C0 05

sub_1E_CF3D:
    AND #$01                     ; $CF3D  29 01
    BEQ loc_1E_CF46              ; $CF3F  F0 05
    LDY #$00                     ; $CF41  A0 00
    JMP sub_1F_F580              ; $CF43  4C 80 F5


loc_1E_CF46:
    LDY #$01                     ; $CF46  A0 01
    JMP sub_1F_F5C4              ; $CF48  4C C4 F5


loc_1E_CF4B:
    LDA $32                      ; $CF4B  A5 32
    BNE sub_1E_CF59              ; $CF4D  D0 0A
    LDA #$01                     ; $CF4F  A9 01
    CMP $05C0                    ; $CF51  CD C0 05
    BEQ sub_1E_CF59              ; $CF54  F0 03
    JSR sub_1F_F835              ; $CF56  20 35 F8

sub_1E_CF59:
    JSR sub_1E_D355              ; $CF59  20 55 D3
    LDA $14                      ; $CF5C  A5 14
    AND #$40                     ; $CF5E  29 40
    BEQ loc_1E_CF65              ; $CF60  F0 03
    JSR sub_1E_D0DA              ; $CF62  20 DA D0

loc_1E_CF65:
    RTS                          ; $CF65  60

    .byte $20,$D8,$DE,$A9,$82,$CD,$21,$03,$F0,$0B,$8D,$21,$03,$AD,$E1,$05  ; $CF66
    .byte $29,$7F,$8D,$E1,$05,$A5,$14,$29,$80,$F0,$03,$4C,$AD,$CE,$A5,$16  ; $CF76
    .byte $29,$03,$F0,$11,$85,$31,$20,$3D,$CF,$A9,$01,$20,$35,$F8,$A5,$32  ; $CF86
    .byte $F0,$03,$20,$70,$D3,$A5,$16,$29,$0C,$F0,$32,$48,$A9,$80,$9D,$40  ; $CF96
    .byte $04,$A9,$01,$9D,$60,$04,$68,$29,$08,$F0,$11,$A0,$01,$20,$42,$F6  ; $CFA6
    .byte $A9,$0C,$CD,$C0,$03,$90,$0A,$8D,$C0,$03,$B0,$05,$A0,$07,$20,$06  ; $CFB6
    .byte $F6,$AD,$C0,$03,$18,$69,$0E,$8D,$C1,$03,$20,$1B,$F8,$20,$55,$D3  ; $CFC6
    .byte $A5,$14,$29,$40,$F0,$03,$20,$DA,$D0,$60,$AD,$61,$03,$8D,$60,$03  ; $CFD6
    .byte $AD,$81,$03,$8D,$80,$03,$AD,$C1,$03,$8D,$C0,$03,$A9,$00,$8D,$01  ; $CFE6
    .byte $03,$A9,$05,$85,$EB,$20,$3C,$FF,$A9,$08,$85,$30,$A9,$DA,$4C,$35  ; $CFF6
    .byte $F8  ; $D006

sub_1E_D007:
    LDA $0460                    ; $D007  AD 60 04
    BMI loc_1E_D019              ; $D00A  30 0D
    LDA $3A                      ; $D00C  A5 3A
    BNE loc_1E_D01D              ; $D00E  D0 0D
    LDA $16                      ; $D010  A5 16
    AND #$80                     ; $D012  29 80
    BNE loc_1E_D019              ; $D014  D0 03
    JSR sub_1F_F81B              ; $D016  20 1B F8

loc_1E_D019:
    LDA #$00                     ; $D019  A9 00
    STA $3A                      ; $D01B  85 3A

loc_1E_D01D:
    LDY #$06                     ; $D01D  A0 06
    JSR sub_1F_E8D6              ; $D01F  20 D6 E8
    LDA $10                      ; $D022  A5 10
    STA $0F                      ; $D024  85 0F
    LDY #$00                     ; $D026  A0 00
    JSR sub_1F_F67C              ; $D028  20 7C F6
    PHP                          ; $D02B  08
    LDA $0F                      ; $D02C  A5 0F
    CMP #$80                     ; $D02E  C9 80
    BNE loc_1E_D07E              ; $D030  D0 4C
    LDA $B9                      ; $D032  A5 B9
    BNE loc_1E_D084              ; $D034  D0 4E
    LDA #$03                     ; $D036  A9 03
    STA $B9                      ; $D038  85 B9
    LDA $BA                      ; $D03A  A5 BA
    BNE loc_1E_D084              ; $D03C  D0 46
    INC $BA                      ; $D03E  E6 BA
    LDA #$1F                     ; $D040  A9 1F
    JSR sub_1F_F89A              ; $D042  20 9A F8
    LDA #$80                     ; $D045  A9 80
    STA $0304                    ; $D047  8D 04 03
    LDA $0580                    ; $D04A  AD 80 05
    STA $0584                    ; $D04D  8D 84 05
    LDX #$04                     ; $D050  A2 04
    LDA #$68                     ; $D052  A9 68
    JSR sub_1F_F835              ; $D054  20 35 F8
    LDA $0360                    ; $D057  AD 60 03
    STA $0364                    ; $D05A  8D 64 03
    LDA $0380                    ; $D05D  AD 80 03
    STA $0384                    ; $D060  8D 84 03
    LDA $03C0                    ; $D063  AD C0 03
    AND #$F0                     ; $D066  29 F0
    SEC                          ; $D068  38
    SBC #$08                     ; $D069  E9 08
    STA $03C4                    ; $D06B  8D C4 03
    LDA $03E0                    ; $D06E  AD E0 03
    STA $03E4                    ; $D071  8D E4 03
    LDX #$00                     ; $D074  A2 00
    STX $0484                    ; $D076  8E 84 04
    STX $0324                    ; $D079  8E 24 03
    BEQ loc_1E_D084              ; $D07C  F0 06

loc_1E_D07E:
    LDA #$00                     ; $D07E  A9 00
    STA $BA                      ; $D080  85 BA
    STA $B9                      ; $D082  85 B9

loc_1E_D084:
    PLP                          ; $D084  28
    JSR sub_1E_D47E              ; $D085  20 7E D4
    BCC loc_1E_D0A7              ; $D088  90 1D
    LDA $30                      ; $D08A  A5 30
    BEQ loc_1E_D0A6              ; $D08C  F0 18
    LDA #$13                     ; $D08E  A9 13
    JSR sub_1F_F89A              ; $D090  20 9A F8
    LDA #$00                     ; $D093  A9 00
    STA $30                      ; $D095  85 30
    LDA #$0D                     ; $D097  A9 0D
    JSR sub_1F_F835              ; $D099  20 35 F8
    INC $05A0                    ; $D09C  EE A0 05
    LDA $32                      ; $D09F  A5 32
    BEQ loc_1E_D0A6              ; $D0A1  F0 03
    JSR sub_1E_D370              ; $D0A3  20 70 D3

loc_1E_D0A6:
    RTS                          ; $D0A6  60


loc_1E_D0A7:
    LDA $30                      ; $D0A7  A5 30
    CMP #$03                     ; $D0A9  C9 03
    BEQ loc_1E_D0D8              ; $D0AB  F0 2B
    CMP #$01                     ; $D0AD  C9 01
    BEQ sub_1E_D0C1              ; $D0AF  F0 10
    LDA #$07                     ; $D0B1  A9 07
    JSR sub_1F_F835              ; $D0B3  20 35 F8
    LDA #$01                     ; $D0B6  A9 01
    STA $30                      ; $D0B8  85 30
    LDA $32                      ; $D0BA  A5 32
    BEQ sub_1E_D0C1              ; $D0BC  F0 03
    JSR sub_1E_D370              ; $D0BE  20 70 D3

sub_1E_D0C1:
    LDA $16                      ; $D0C1  A5 16
    AND #$03                     ; $D0C3  29 03
    BEQ loc_1E_D0CC              ; $D0C5  F0 05
    STA $31                      ; $D0C7  85 31
    JSR sub_1E_CF3D              ; $D0C9  20 3D CF

loc_1E_D0CC:
    JSR sub_1E_D355              ; $D0CC  20 55 D3
    LDA $14                      ; $D0CF  A5 14
    AND #$40                     ; $D0D1  29 40
    BEQ loc_1E_D0D8              ; $D0D3  F0 03
    JSR sub_1E_D0DA              ; $D0D5  20 DA D0

loc_1E_D0D8:
    CLC                          ; $D0D8  18
    RTS                          ; $D0D9  60


sub_1E_D0DA:
    LDY $A0                      ; $D0DA  A4 A0
    LDA $00A2,Y                  ; $D0DC  B9 A2 00
    AND #$1F                     ; $D0DF  29 1F
    BEQ loc_1E_D134              ; $D0E1  F0 51
    LDA $D33D,Y                  ; $D0E3  B9 3D D3
    TAY                          ; $D0E6  A8

loc_1E_D0E7:
    LDA $0300,Y                  ; $D0E7  B9 00 03
    BPL loc_1E_D0F1              ; $D0EA  10 05
    DEY                          ; $D0EC  88
    BNE loc_1E_D0E7              ; $D0ED  D0 F8
    BEQ loc_1E_D134              ; $D0EF  F0 43

loc_1E_D0F1:
    LDY $A0                      ; $D0F1  A4 A0
    JSR sub_1E_DECE              ; $D0F3  20 CE DE
    LDA $D303,Y                  ; $D0F6  B9 03 D3
    STA $00                      ; $D0F9  85 00
    LDA $D30F,Y                  ; $D0FB  B9 0F D3
    STA $01                      ; $D0FE  85 01
    JMP ($0000)                  ; $D100  6C 00 00


loc_1E_D103:
    LDA $32                      ; $D103  A5 32
    BNE loc_1E_D10A              ; $D105  D0 03
    JSR sub_1E_D370              ; $D107  20 70 D3

loc_1E_D10A:
    LDA $05C0                    ; $D10A  AD C0 05
    CMP #$05                     ; $D10D  C9 05
    BEQ loc_1E_D121              ; $D10F  F0 10
    CMP #$0E                     ; $D111  C9 0E
    BEQ loc_1E_D121              ; $D113  F0 0C
    CMP #$0F                     ; $D115  C9 0F
    BEQ loc_1E_D121              ; $D117  F0 08
    LDA #$00                     ; $D119  A9 00
    STA $05A0                    ; $D11B  8D A0 05
    STA $05E0                    ; $D11E  8D E0 05

loc_1E_D121:
    LDA #$10                     ; $D121  A9 10
    STA $32                      ; $D123  85 32
    LDY $A0                      ; $D125  A4 A0
    LDA $D33D,Y                  ; $D127  B9 3D D3
    TAY                          ; $D12A  A8

loc_1E_D12B:
    LDA $0300,Y                  ; $D12B  B9 00 03
    BPL loc_1E_D135              ; $D12E  10 05
    DEY                          ; $D130  88
    BNE loc_1E_D12B              ; $D131  D0 F8
    CLC                          ; $D133  18

loc_1E_D134:
    RTS                          ; $D134  60


loc_1E_D135:
    LDX $A0                      ; $D135  A6 A0
    LDA $D349,X                  ; $D137  BD 49 D3
    JSR sub_1F_F89A              ; $D13A  20 9A F8
    LDX #$00                     ; $D13D  A2 00
    LDA #$80                     ; $D13F  A9 80
    STA $0300,Y                  ; $D141  99 00 03
    LDA $31                      ; $D144  A5 31
    ROR A                        ; $D146  6A
    ROR A                        ; $D147  6A
    ROR A                        ; $D148  6A
    AND #$40                     ; $D149  29 40
    ORA #$90                     ; $D14B  09 90
    STA $0580,Y                  ; $D14D  99 80 05
    LDA #$00                     ; $D150  A9 00
    STA $0400,Y                  ; $D152  99 00 04
    LDA #$04                     ; $D155  A9 04
    STA $0420,Y                  ; $D157  99 20 04
    LDA $31                      ; $D15A  A5 31
    STA $04A0,Y                  ; $D15C  99 A0 04
    AND #$02                     ; $D15F  29 02
    TAX                          ; $D161  AA
    LDA $0360                    ; $D162  AD 60 03
    CLC                          ; $D165  18
    ADC $D31B,X                  ; $D166  7D 1B D3
    STA $0360,Y                  ; $D169  99 60 03
    LDA $0380                    ; $D16C  AD 80 03
    ADC $D31C,X                  ; $D16F  7D 1C D3
    STA $0380,Y                  ; $D172  99 80 03
    LDA $03C0                    ; $D175  AD C0 03
    STA $03C0,Y                  ; $D178  99 C0 03
    LDA $03E0                    ; $D17B  AD E0 03
    STA $03E0,Y                  ; $D17E  99 E0 03
    LDA #$00                     ; $D181  A9 00
    STA $0480,Y                  ; $D183  99 80 04
    STA $05A0,Y                  ; $D186  99 A0 05
    STA $05E0,Y                  ; $D189  99 E0 05
    STA $0340,Y                  ; $D18C  99 40 03
    STA $0500,Y                  ; $D18F  99 00 05
    LDX $A0                      ; $D192  A6 A0
    LDA $D323,X                  ; $D194  BD 23 D3
    STA $05C0,Y                  ; $D197  99 C0 05
    LDA $D32F,X                  ; $D19A  BD 2F D3
    STA $0320,Y                  ; $D19D  99 20 03
    INC $3B                      ; $D1A0  E6 3B
    LDX #$00                     ; $D1A2  A2 00
    SEC                          ; $D1A4  38
    RTS                          ; $D1A5  60

    LDA $05C0                    ; $D1A6  AD C0 05
    CMP #$D7                     ; $D1A9  C9 D7
    BCS loc_1E_D1B7              ; $D1AB  B0 0A
    LDA $0580                    ; $D1AD  AD 80 05
    BPL loc_1E_D1FA              ; $D1B0  10 48
    LDA $0301                    ; $D1B2  AD 01 03
    BPL loc_1E_D1BA              ; $D1B5  10 03

loc_1E_D1B7:
    JMP loc_1E_D103              ; $D1B7  4C 03 D1


loc_1E_D1BA:
    LDY #$01                     ; $D1BA  A0 01
    LDA #$13                     ; $D1BC  A9 13
    JSR sub_1F_F846              ; $D1BE  20 46 F8
    LDA #$00                     ; $D1C1  A9 00
    STA $03C1                    ; $D1C3  8D C1 03
    STA $03E1                    ; $D1C6  8D E1 03
    LDA #$11                     ; $D1C9  A9 11
    STA $0481                    ; $D1CB  8D 81 04
    LDA $31                      ; $D1CE  A5 31
    STA $04A1                    ; $D1D0  8D A1 04
    AND #$02                     ; $D1D3  29 02
    TAX                          ; $D1D5  AA
    LDA $0360                    ; $D1D6  AD 60 03
    CLC                          ; $D1D9  18
    ADC $D31F,X                  ; $D1DA  7D 1F D3
    STA $0361                    ; $D1DD  8D 61 03
    LDA $0380                    ; $D1E0  AD 80 03
    ADC $D320,X                  ; $D1E3  7D 20 D3
    STA $0381                    ; $D1E6  8D 81 03
    LDA #$80                     ; $D1E9  A9 80
    STA $0320,Y                  ; $D1EB  99 20 03
    LDA #$AB                     ; $D1EE  A9 AB
    STA $0441                    ; $D1F0  8D 41 04
    LDA #$FF                     ; $D1F3  A9 FF
    STA $0461                    ; $D1F5  8D 61 04
    LDX #$00                     ; $D1F8  A2 00

loc_1E_D1FA:
    RTS                          ; $D1FA  60

    .byte $20,$03,$D1,$90,$11,$A5,$3B,$29,$01,$AA,$B9,$C0,$03,$18,$7D,$3B  ; $D1FB
    .byte $D3,$99,$C0,$03,$A2,$00,$60,$20,$03,$D1,$90,$35,$C8,$20,$35,$D1  ; $D20B
    .byte $C8,$20,$35,$D1,$A9,$B4,$8D,$01,$05,$8D,$02,$05,$8D,$03,$05,$A9  ; $D21B
    .byte $00,$8D,$41,$04,$8D,$42,$04,$8D,$43,$04,$8D,$61,$04,$8D,$62,$04  ; $D22B
    .byte $8D,$63,$04,$AD,$61,$03,$29,$FC,$8D,$61,$03,$8D,$62,$03,$8D,$63  ; $D23B
    .byte $03,$60,$AD,$01,$03,$30,$40,$A4,$30,$C0,$04,$B0,$3A,$B9,$93,$D2  ; $D24B
    .byte $F0,$35,$20,$03,$D1,$A4,$30,$B9,$93,$D2,$20,$35,$F8,$C0,$03,$D0  ; $D25B
    .byte $05,$A9,$AE,$8D,$C1,$05,$A9,$00,$8D,$01,$04,$8D,$21,$04,$8D,$61  ; $D26B
    .byte $04,$A9,$80,$8D,$41,$04,$EE,$E1,$05,$A5,$30,$8D,$00,$05,$A9,$10  ; $D27B
    .byte $8D,$20,$05,$A9,$0B,$85,$30,$60,$AA,$AB,$00,$AD,$01,$07,$00,$0A  ; $D28B
    .byte $FC,$FF,$04,$00,$A5,$30,$C9,$01,$D0,$2D,$A9,$A3,$CD,$C0,$05,$F0  ; $D29B
    .byte $26,$20,$35,$F8,$A9,$2C,$4C,$9A,$F8,$20,$03,$D1,$90,$19,$A9,$44  ; $D2AB
    .byte $99,$40,$04,$A9,$03,$99,$60,$04,$A9,$00,$99,$00,$04,$A9,$01,$99  ; $D2BB
    .byte $20,$04,$A9,$13,$99,$00,$05,$60,$20,$03,$D1,$90,$2A,$A5,$16,$29  ; $D2CB
    .byte $0B,$F0,$03,$99,$A0,$04,$A9,$00,$99,$40,$04,$A9,$04,$99,$60,$04  ; $D2DB
    .byte $A9,$14,$99,$00,$05,$BD,$60,$03,$99,$60,$03,$BD,$80,$03,$99,$80  ; $D2EB
    .byte $03,$BD,$C0,$03,$99,$C0,$03,$60,$03,$12,$FB,$4D,$03,$9F,$B4,$A6  ; $D2FB
    .byte $03,$A6,$D3,$A6,$D1,$D2,$D1,$D2,$D1,$D2,$D2,$D1,$D1,$D1,$D2,$D1  ; $D30B
    .byte $0F,$00,$F0,$FF,$17,$00,$E8,$FF,$18,$9F,$A2,$AC,$97,$18,$A5,$18  ; $D31B
    .byte $9C,$18,$9E,$18,$01,$84,$01,$85,$83,$01,$86,$01,$87,$01,$88,$01  ; $D32B
    .byte $FE,$02,$03,$01,$03,$01,$02,$00,$03,$03,$02,$03,$01,$03,$15,$2B  ; $D33B
    .byte $15,$15,$2A,$2C,$15,$15,$2D,$15,$2E,$15  ; $D34B

sub_1E_D355:
    LDA $32                      ; $D355  A5 32
    BEQ loc_1E_D36F              ; $D357  F0 16
    DEC $32                      ; $D359  C6 32
    BNE loc_1E_D36F              ; $D35B  D0 12
    JSR sub_1E_D37F              ; $D35D  20 7F D3
    LDY $05C0                    ; $D360  AC C0 05
    CPY #$04                     ; $D363  C0 04
    BEQ loc_1E_D36F              ; $D365  F0 08
    LDA #$00                     ; $D367  A9 00
    STA $05E0                    ; $D369  8D E0 05
    STA $05A0                    ; $D36C  8D A0 05

loc_1E_D36F:
    RTS                          ; $D36F  60


sub_1E_D370:
    PHA                          ; $D370  48
    INC $05C0                    ; $D371  EE C0 05
    LDA $A0                      ; $D374  A5 A0
    CMP #$0A                     ; $D376  C9 0A
    BNE loc_1E_D37D              ; $D378  D0 03
    INC $05C0                    ; $D37A  EE C0 05

loc_1E_D37D:
    PLA                          ; $D37D  68
    RTS                          ; $D37E  60


sub_1E_D37F:
    PHA                          ; $D37F  48
    DEC $05C0                    ; $D380  CE C0 05
    LDA $A0                      ; $D383  A5 A0
    CMP #$0A                     ; $D385  C9 0A
    BNE loc_1E_D38C              ; $D387  D0 03
    DEC $05C0                    ; $D389  CE C0 05

loc_1E_D38C:
    PLA                          ; $D38C  68
    RTS                          ; $D38D  60


loc_1E_D38E:
    LDA $16                      ; $D38E  A5 16
    AND #$03                     ; $D390  29 03
    BEQ loc_1E_D396              ; $D392  F0 02
    STA $31                      ; $D394  85 31

loc_1E_D396:
    LDY #$04                     ; $D396  A0 04
    LDA $31                      ; $D398  A5 31
    AND #$01                     ; $D39A  29 01
    BNE loc_1E_D39F              ; $D39C  D0 01
    INY                          ; $D39E  C8

loc_1E_D39F:
    JSR sub_1F_E8D6              ; $D39F  20 D6 E8
    LDA $10                      ; $D3A2  A5 10
    AND #$10                     ; $D3A4  29 10
    BEQ loc_1E_D3A9              ; $D3A6  F0 01
    RTS                          ; $D3A8  60


loc_1E_D3A9:
    LDA #$02                     ; $D3A9  A9 02
    STA $30                      ; $D3AB  85 30
    LDA #$14                     ; $D3AD  A9 14
    STA $33                      ; $D3AF  85 33
    LDA #$10                     ; $D3B1  A9 10
    JSR sub_1F_F835              ; $D3B3  20 35 F8
    LDA $03C0                    ; $D3B6  AD C0 03
    CLC                          ; $D3B9  18
    ADC #$02                     ; $D3BA  69 02
    STA $03C0                    ; $D3BC  8D C0 03
    LDA #$80                     ; $D3BF  A9 80
    STA $0400                    ; $D3C1  8D 00 04
    LDA #$02                     ; $D3C4  A9 02
    STA $0420                    ; $D3C6  8D 20 04
    LDA #$80                     ; $D3C9  A9 80
    STA $0304                    ; $D3CB  8D 04 03
    LDA $0580                    ; $D3CE  AD 80 05
    STA $0584                    ; $D3D1  8D 84 05
    LDX #$04                     ; $D3D4  A2 04
    LDA #$17                     ; $D3D6  A9 17
    JSR sub_1F_F835              ; $D3D8  20 35 F8
    LDA $0360                    ; $D3DB  AD 60 03
    STA $0364                    ; $D3DE  8D 64 03
    LDA $0380                    ; $D3E1  AD 80 03
    STA $0384                    ; $D3E4  8D 84 03
    LDA $03C0                    ; $D3E7  AD C0 03
    STA $03C4                    ; $D3EA  8D C4 03
    LDA $03E0                    ; $D3ED  AD E0 03
    STA $03E4                    ; $D3F0  8D E4 03
    LDX #$00                     ; $D3F3  A2 00
    STX $0484                    ; $D3F5  8E 84 04
    STX $0324                    ; $D3F8  8E 24 03
    BEQ loc_1E_D412              ; $D3FB  F0 15
    LDY #$02                     ; $D3FD  A0 02
    JSR sub_1F_F67C              ; $D3FF  20 7C F6
    BCC loc_1E_D455              ; $D402  90 51
    LDA $16                      ; $D404  A5 16
    AND #$03                     ; $D406  29 03
    BEQ loc_1E_D412              ; $D408  F0 08
    CMP $31                      ; $D40A  C5 31
    BEQ loc_1E_D412              ; $D40C  F0 04
    STA $31                      ; $D40E  85 31
    BNE loc_1E_D43E              ; $D410  D0 2C

loc_1E_D412:
    LDA $31                      ; $D412  A5 31
    AND #$01                     ; $D414  29 01
    BEQ loc_1E_D420              ; $D416  F0 08
    LDY #$02                     ; $D418  A0 02
    JSR sub_1F_F580              ; $D41A  20 80 F5
    JMP loc_1E_D425              ; $D41D  4C 25 D4


loc_1E_D420:
    LDY #$03                     ; $D420  A0 03
    JSR sub_1F_F5C4              ; $D422  20 C4 F5

loc_1E_D425:
    LDA $10                      ; $D425  A5 10
    AND #$10                     ; $D427  29 10
    BNE loc_1E_D43E              ; $D429  D0 13
    LDA $33                      ; $D42B  A5 33
    BEQ loc_1E_D43E              ; $D42D  F0 0F
    DEC $33                      ; $D42F  C6 33
    LDA $33                      ; $D431  A5 33
    CMP #$0C                     ; $D433  C9 0C
    BCS loc_1E_D43D              ; $D435  B0 06
    LDA $14                      ; $D437  A5 14
    AND #$80                     ; $D439  29 80
    BNE loc_1E_D43E              ; $D43B  D0 01

loc_1E_D43D:
    RTS                          ; $D43D  60


loc_1E_D43E:
    LDY #$01                     ; $D43E  A0 01
    JSR sub_1F_E8D6              ; $D440  20 D6 E8
    LDA $10                      ; $D443  A5 10
    AND #$10                     ; $D445  29 10
    BNE loc_1E_D470              ; $D447  D0 27
    STA $33                      ; $D449  85 33
    STA $30                      ; $D44B  85 30
    LDA $14                      ; $D44D  A5 14
    AND #$80                     ; $D44F  29 80
    BNE loc_1E_D471              ; $D451  D0 1E
    BEQ loc_1E_D45D              ; $D453  F0 08

loc_1E_D455:
    LDA #$00                     ; $D455  A9 00
    STA $33                      ; $D457  85 33
    LDA #$01                     ; $D459  A9 01
    BNE loc_1E_D45F              ; $D45B  D0 02

loc_1E_D45D:
    LDA #$04                     ; $D45D  A9 04

loc_1E_D45F:
    JSR sub_1F_F835              ; $D45F  20 35 F8
    LDA #$4C                     ; $D462  A9 4C
    STA $0400                    ; $D464  8D 00 04
    LDA #$01                     ; $D467  A9 01
    STA $0420                    ; $D469  8D 20 04
    LDA #$00                     ; $D46C  A9 00
    STA $30                      ; $D46E  85 30

loc_1E_D470:
    RTS                          ; $D470  60


loc_1E_D471:
    LDA #$4C                     ; $D471  A9 4C
    STA $0400                    ; $D473  8D 00 04
    LDA #$01                     ; $D476  A9 01
    STA $0420                    ; $D478  8D 20 04
    JMP loc_1E_CEAD              ; $D47B  4C AD CE


sub_1E_D47E:
    LDA $03E0                    ; $D47E  AD E0 03
    BNE loc_1E_D4C7              ; $D481  D0 44
    LDA $16                      ; $D483  A5 16
    AND #$08                     ; $D485  29 08
    BEQ loc_1E_D4C8              ; $D487  F0 3F
    PHP                          ; $D489  08

loc_1E_D48A:
    LDY #$04                     ; $D48A  A0 04
    JSR sub_1F_E9E3              ; $D48C  20 E3 E9
    LDA $44                      ; $D48F  A5 44
    CMP #$20                     ; $D491  C9 20
    BEQ loc_1E_D4A3              ; $D493  F0 0E
    CMP #$40                     ; $D495  C9 40
    BEQ loc_1E_D4A3              ; $D497  F0 0A
    LDA $43                      ; $D499  A5 43
    CMP #$20                     ; $D49B  C9 20
    BEQ loc_1E_D4A3              ; $D49D  F0 04
    CMP #$40                     ; $D49F  C9 40
    BNE loc_1E_D4C6              ; $D4A1  D0 23

loc_1E_D4A3:
    PLP                          ; $D4A3  28
    LDA $12                      ; $D4A4  A5 12
    AND #$F0                     ; $D4A6  29 F0
    ORA #$08                     ; $D4A8  09 08
    STA $0360                    ; $D4AA  8D 60 03
    LDA #$0A                     ; $D4AD  A9 0A

loc_1E_D4AF:
    JSR sub_1F_F835              ; $D4AF  20 35 F8
    LDA #$03                     ; $D4B2  A9 03
    STA $30                      ; $D4B4  85 30
    LDA #$4C                     ; $D4B6  A9 4C
    STA $0440                    ; $D4B8  8D 40 04
    LDA #$01                     ; $D4BB  A9 01
    STA $0460                    ; $D4BD  8D 60 04
    LDA #$00                     ; $D4C0  A9 00
    STA $32                      ; $D4C2  85 32
    CLC                          ; $D4C4  18
    RTS                          ; $D4C5  60


loc_1E_D4C6:
    PLP                          ; $D4C6  28

loc_1E_D4C7:
    RTS                          ; $D4C7  60


loc_1E_D4C8:
    LDA $16                      ; $D4C8  A5 16
    AND #$04                     ; $D4CA  29 04
    BEQ loc_1E_D4C7              ; $D4CC  F0 F9
    PHP                          ; $D4CE  08
    LDA $43                      ; $D4CF  A5 43
    CMP #$40                     ; $D4D1  C9 40
    BNE loc_1E_D48A              ; $D4D3  D0 B5
    PLP                          ; $D4D5  28
    LDA $0360                    ; $D4D6  AD 60 03
    AND #$F0                     ; $D4D9  29 F0
    ORA #$08                     ; $D4DB  09 08
    STA $0360                    ; $D4DD  8D 60 03
    LDA $11                      ; $D4E0  A5 11
    AND #$F0                     ; $D4E2  29 F0
    STA $03C0                    ; $D4E4  8D C0 03
    LDA #$14                     ; $D4E7  A9 14
    BNE loc_1E_D4AF              ; $D4E9  D0 C4
    JSR sub_1E_D355              ; $D4EB  20 55 D3
    LDA $14                      ; $D4EE  A5 14
    AND #$40                     ; $D4F0  29 40
    BEQ loc_1E_D50B              ; $D4F2  F0 17
    LDA $16                      ; $D4F4  A5 16
    AND #$03                     ; $D4F6  29 03
    BEQ loc_1E_D508              ; $D4F8  F0 0E
    CMP $31                      ; $D4FA  C5 31
    BEQ loc_1E_D508              ; $D4FC  F0 0A
    STA $31                      ; $D4FE  85 31
    LDA $0580                    ; $D500  AD 80 05
    EOR #$40                     ; $D503  49 40
    STA $0580                    ; $D505  8D 80 05

loc_1E_D508:
    JSR sub_1E_D0DA              ; $D508  20 DA D0

loc_1E_D50B:
    LDA $32                      ; $D50B  A5 32
    BNE loc_1E_D4C7              ; $D50D  D0 B8
    LDA $16                      ; $D50F  A5 16
    AND #$0C                     ; $D511  29 0C
    BNE loc_1E_D521              ; $D513  D0 0C
    LDA $14                      ; $D515  A5 14
    AND #$80                     ; $D517  29 80
    BNE loc_1E_D51E              ; $D519  D0 03
    JMP loc_1E_D5B4              ; $D51B  4C B4 D5


loc_1E_D51E:
    JMP loc_1E_D5AD              ; $D51E  4C AD D5


loc_1E_D521:
    PHA                          ; $D521  48
    LDA $0360                    ; $D522  AD 60 03
    AND #$F0                     ; $D525  29 F0
    ORA #$08                     ; $D527  09 08
    STA $0360                    ; $D529  8D 60 03
    PLA                          ; $D52C  68
    AND #$04                     ; $D52D  29 04
    BEQ loc_1E_D568              ; $D52F  F0 37
    LDA #$0A                     ; $D531  A9 0A
    CMP $05C0                    ; $D533  CD C0 05
    BEQ loc_1E_D53B              ; $D536  F0 03
    JSR sub_1F_F835              ; $D538  20 35 F8

loc_1E_D53B:
    LDY #$00                     ; $D53B  A0 00
    JSR sub_1F_F606              ; $D53D  20 06 F6
    BCS loc_1E_D5AD              ; $D540  B0 6B
    LDA $03E0                    ; $D542  AD E0 03
    BEQ loc_1E_D54D              ; $D545  F0 06
    LDA #$00                     ; $D547  A9 00
    STA $03C0                    ; $D549  8D C0 03
    RTS                          ; $D54C  60


loc_1E_D54D:
    LDY #$04                     ; $D54D  A0 04
    JSR sub_1F_E9E3              ; $D54F  20 E3 E9
    LDA $44                      ; $D552  A5 44
    CMP #$20                     ; $D554  C9 20
    BEQ loc_1E_D5B9              ; $D556  F0 61
    CMP #$40                     ; $D558  C9 40
    BEQ loc_1E_D5B9              ; $D55A  F0 5D
    LDA $43                      ; $D55C  A5 43
    CMP #$20                     ; $D55E  C9 20
    BEQ loc_1E_D5B9              ; $D560  F0 57
    CMP #$40                     ; $D562  C9 40
    BEQ loc_1E_D5B9              ; $D564  F0 53
    BNE loc_1E_D5AD              ; $D566  D0 45

loc_1E_D568:
    LDY #$01                     ; $D568  A0 01
    JSR sub_1F_F642              ; $D56A  20 42 F6
    BCS loc_1E_D5B4              ; $D56D  B0 45
    LDA $03E0                    ; $D56F  AD E0 03
    BEQ loc_1E_D57A              ; $D572  F0 06
    LDA #$EF                     ; $D574  A9 EF
    STA $03C0                    ; $D576  8D C0 03
    RTS                          ; $D579  60


loc_1E_D57A:
    LDA $03C0                    ; $D57A  AD C0 03
    CMP #$10                     ; $D57D  C9 10
    BCC loc_1E_D5B9              ; $D57F  90 38
    LDY #$04                     ; $D581  A0 04
    JSR sub_1F_E9E3              ; $D583  20 E3 E9
    LDA $44                      ; $D586  A5 44
    CMP #$20                     ; $D588  C9 20
    BEQ loc_1E_D5B9              ; $D58A  F0 2D
    CMP #$40                     ; $D58C  C9 40
    BEQ loc_1E_D5B9              ; $D58E  F0 29
    LDA $43                      ; $D590  A5 43
    CMP #$20                     ; $D592  C9 20
    BEQ loc_1E_D5B9              ; $D594  F0 23
    CMP #$40                     ; $D596  C9 40
    BEQ loc_1E_D5B9              ; $D598  F0 1F
    LDA #$14                     ; $D59A  A9 14
    CMP $05C0                    ; $D59C  CD C0 05
    BEQ loc_1E_D5A4              ; $D59F  F0 03
    JSR sub_1F_F835              ; $D5A1  20 35 F8

loc_1E_D5A4:
    LDA $03C0                    ; $D5A4  AD C0 03
    AND #$0F                     ; $D5A7  29 0F
    CMP #$0C                     ; $D5A9  C9 0C
    BCS loc_1E_D5B9              ; $D5AB  B0 0C

loc_1E_D5AD:
    LDA #$00                     ; $D5AD  A9 00
    STA $30                      ; $D5AF  85 30
    JMP sub_1F_F81B              ; $D5B1  4C 1B F8


loc_1E_D5B4:
    LDA #$00                     ; $D5B4  A9 00
    STA $05E0                    ; $D5B6  8D E0 05

loc_1E_D5B9:
    RTS                          ; $D5B9  60

    LDA $05A0                    ; $D5BA  AD A0 05
    BNE loc_1E_D5EB              ; $D5BD  D0 2C
    LDA $22                      ; $D5BF  A5 22
    CMP #$07                     ; $D5C1  C9 07
    BEQ loc_1E_D5D2              ; $D5C3  F0 0D
    LDA $03C0                    ; $D5C5  AD C0 03
    CMP #$68                     ; $D5C8  C9 68
    BCS loc_1E_D5DF              ; $D5CA  B0 13
    JSR sub_1F_F797              ; $D5CC  20 97 F7
    JMP loc_1E_D5E6              ; $D5CF  4C E6 D5


loc_1E_D5D2:
    LDA $03C0                    ; $D5D2  AD C0 03
    CMP #$30                     ; $D5D5  C9 30
    BCS loc_1E_D5DF              ; $D5D7  B0 06
    JSR sub_1F_F797              ; $D5D9  20 97 F7
    JMP loc_1E_D5E6              ; $D5DC  4C E6 D5


loc_1E_D5DF:
    LDY #$00                     ; $D5DF  A0 00
    JSR sub_1F_F67C              ; $D5E1  20 7C F6
    BCS loc_1E_D5EB              ; $D5E4  B0 05

loc_1E_D5E6:
    LDA #$00                     ; $D5E6  A9 00
    STA $05E0                    ; $D5E8  8D E0 05

loc_1E_D5EB:
    LDA $05E0                    ; $D5EB  AD E0 05
    BNE loc_1E_D5FC              ; $D5EE  D0 0C
    LDA $05A0                    ; $D5F0  AD A0 05
    CMP #$01                     ; $D5F3  C9 01
    BNE loc_1E_D5FC              ; $D5F5  D0 05
    LDA #$34                     ; $D5F7  A9 34
    JSR sub_1F_F89A              ; $D5F9  20 9A F8

loc_1E_D5FC:
    LDA $05A0                    ; $D5FC  AD A0 05
    CMP #$04                     ; $D5FF  C9 04
    BNE loc_1E_D60B              ; $D601  D0 08
    LDA #$00                     ; $D603  A9 00
    STA $30                      ; $D605  85 30
    STA $32                      ; $D607  85 32
    STA $39                      ; $D609  85 39

loc_1E_D60B:
    RTS                          ; $D60B  60


loc_1E_D60C:
    LDA #$00                     ; $D60C  A9 00
    STA $30                      ; $D60E  85 30
    JMP sub_1F_F81B              ; $D610  4C 1B F8

    LDY $34                      ; $D613  A4 34
    LDA $0300,Y                  ; $D615  B9 00 03
    BPL loc_1E_D60C              ; $D618  10 F2
    LDA $05C0,Y                  ; $D61A  B9 C0 05
    CMP #$62                     ; $D61D  C9 62
    BNE loc_1E_D60C              ; $D61F  D0 EB
    LDA $16                      ; $D621  A5 16
    AND #$0C                     ; $D623  29 0C
    BEQ loc_1E_D656              ; $D625  F0 2F
    STA $00                      ; $D627  85 00
    LDA $0440                    ; $D629  AD 40 04
    PHA                          ; $D62C  48
    LDA $0460                    ; $D62D  AD 60 04
    PHA                          ; $D630  48
    LDA #$40                     ; $D631  A9 40
    STA $0440                    ; $D633  8D 40 04
    LDA #$00                     ; $D636  A9 00
    STA $0460                    ; $D638  8D 60 04
    LDA $00                      ; $D63B  A5 00
    AND #$08                     ; $D63D  29 08
    BEQ loc_1E_D649              ; $D63F  F0 08
    LDY #$01                     ; $D641  A0 01
    JSR sub_1F_F642              ; $D643  20 42 F6
    JMP loc_1E_D64E              ; $D646  4C 4E D6


loc_1E_D649:
    LDY #$00                     ; $D649  A0 00
    JSR sub_1F_F606              ; $D64B  20 06 F6

loc_1E_D64E:
    PLA                          ; $D64E  68
    STA $0460                    ; $D64F  8D 60 04
    PLA                          ; $D652  68
    STA $0440                    ; $D653  8D 40 04

loc_1E_D656:
    LDA $0440                    ; $D656  AD 40 04
    ORA $0460                    ; $D659  0D 60 04
    BNE loc_1E_D67E              ; $D65C  D0 20
    LDA $14                      ; $D65E  A5 14
    AND #$80                     ; $D660  29 80
    BEQ loc_1E_D667              ; $D662  F0 03
    JMP loc_1E_CEAD              ; $D664  4C AD CE


loc_1E_D667:
    LDA #$00                     ; $D667  A9 00
    STA $0400                    ; $D669  8D 00 04
    LDA #$01                     ; $D66C  A9 01
    STA $0420                    ; $D66E  8D 20 04
    LDA $0580                    ; $D671  AD 80 05
    PHA                          ; $D674  48
    LDA $35                      ; $D675  A5 35
    JSR sub_1E_CF3D              ; $D677  20 3D CF
    PLA                          ; $D67A  68
    STA $0580                    ; $D67B  8D 80 05

loc_1E_D67E:
    LDY #$01                     ; $D67E  A0 01
    JSR sub_1F_F642              ; $D680  20 42 F6
    LDA $0440                    ; $D683  AD 40 04
    CLC                          ; $D686  18
    ADC #$40                     ; $D687  69 40
    STA $0440                    ; $D689  8D 40 04
    LDA $0460                    ; $D68C  AD 60 04
    ADC #$00                     ; $D68F  69 00
    STA $0460                    ; $D691  8D 60 04
    CMP #$07                     ; $D694  C9 07
    BCC loc_1E_D69D              ; $D696  90 05
    LDA #$00                     ; $D698  A9 00
    STA $0440                    ; $D69A  8D 40 04

loc_1E_D69D:
    LDA #$4C                     ; $D69D  A9 4C
    STA $0400                    ; $D69F  8D 00 04
    LDA #$01                     ; $D6A2  A9 01
    STA $0420                    ; $D6A4  8D 20 04
    JSR sub_1E_D0C1              ; $D6A7  20 C1 D0
    RTS                          ; $D6AA  60

    LDA $05C0                    ; $D6AB  AD C0 05
    CMP #$11                     ; $D6AE  C9 11
    BEQ loc_1E_D701              ; $D6B0  F0 4F
    CMP #$B1                     ; $D6B2  C9 B1
    BEQ loc_1E_D701              ; $D6B4  F0 4B
    LDA $05C0                    ; $D6B6  AD C0 05
    STA $3E                      ; $D6B9  85 3E
    CMP #$D9                     ; $D6BB  C9 D9
    BCS loc_1E_D6C3              ; $D6BD  B0 04
    LDA #$11                     ; $D6BF  A9 11
    BNE loc_1E_D6C5              ; $D6C1  D0 02

loc_1E_D6C3:
    LDA #$B1                     ; $D6C3  A9 B1

loc_1E_D6C5:
    JSR sub_1F_F835              ; $D6C5  20 35 F8
    LDA #$00                     ; $D6C8  A9 00
    STA $32                      ; $D6CA  85 32
    JSR sub_1F_F81B              ; $D6CC  20 1B F8
    LDA #$80                     ; $D6CF  A9 80
    STA $0304                    ; $D6D1  8D 04 03
    LDA $0580                    ; $D6D4  AD 80 05
    STA $0584                    ; $D6D7  8D 84 05
    LDX #$04                     ; $D6DA  A2 04
    LDA #$12                     ; $D6DC  A9 12
    JSR sub_1F_F835              ; $D6DE  20 35 F8
    LDA $0360                    ; $D6E1  AD 60 03
    STA $0364                    ; $D6E4  8D 64 03
    LDA $0380                    ; $D6E7  AD 80 03
    STA $0384                    ; $D6EA  8D 84 03
    LDA $03C0                    ; $D6ED  AD C0 03
    STA $03C4                    ; $D6F0  8D C4 03
    LDA $03E0                    ; $D6F3  AD E0 03
    STA $03E4                    ; $D6F6  8D E4 03
    LDX #$00                     ; $D6F9  A2 00
    STX $0484                    ; $D6FB  8E 84 04
    STX $0324                    ; $D6FE  8E 24 03

loc_1E_D701:
    LDA $3E                      ; $D701  A5 3E
    CMP #$10                     ; $D703  C9 10
    BEQ loc_1E_D742              ; $D705  F0 3B
    CMP #$79                     ; $D707  C9 79
    BCS loc_1E_D742              ; $D709  B0 37
    LDY #$00                     ; $D70B  A0 00
    JSR sub_1F_F67C              ; $D70D  20 7C F6
    LDA #$80                     ; $D710  A9 80
    STA $0400                    ; $D712  8D 00 04
    LDA #$00                     ; $D715  A9 00
    STA $0420                    ; $D717  8D 20 04
    LDA $0580                    ; $D71A  AD 80 05
    PHA                          ; $D71D  48
    LDA $0580                    ; $D71E  AD 80 05
    AND #$40                     ; $D721  29 40
    BNE loc_1E_D72D              ; $D723  D0 08
    LDY #$00                     ; $D725  A0 00
    JSR sub_1F_F580              ; $D727  20 80 F5
    JMP loc_1E_D732              ; $D72A  4C 32 D7


loc_1E_D72D:
    LDY #$01                     ; $D72D  A0 01
    JSR sub_1F_F5C4              ; $D72F  20 C4 F5

loc_1E_D732:
    LDA $0360                    ; $D732  AD 60 03
    STA $0364                    ; $D735  8D 64 03
    LDA $0380                    ; $D738  AD 80 03
    STA $0384                    ; $D73B  8D 84 03
    PLA                          ; $D73E  68
    STA $0580                    ; $D73F  8D 80 05

loc_1E_D742:
    LDA $05A0                    ; $D742  AD A0 05
    CMP #$09                     ; $D745  C9 09
    BNE loc_1E_D778              ; $D747  D0 2F
    LDA $3E                      ; $D749  A5 3E
    PHA                          ; $D74B  48
    CMP #$10                     ; $D74C  C9 10
    BEQ loc_1E_D754              ; $D74E  F0 04
    CMP #$D9                     ; $D750  C9 D9
    BCC loc_1E_D757              ; $D752  90 03

loc_1E_D754:
    JSR sub_1F_F835              ; $D754  20 35 F8

loc_1E_D757:
    PLA                          ; $D757  68
    CMP #$10                     ; $D758  C9 10
    BEQ loc_1E_D764              ; $D75A  F0 08
    CMP #$D9                     ; $D75C  C9 D9
    BCC loc_1E_D768              ; $D75E  90 08
    LDA #$08                     ; $D760  A9 08
    BNE loc_1E_D76A              ; $D762  D0 06

loc_1E_D764:
    LDA #$02                     ; $D764  A9 02
    BNE loc_1E_D76A              ; $D766  D0 02

loc_1E_D768:
    LDA #$00                     ; $D768  A9 00

loc_1E_D76A:
    STA $30                      ; $D76A  85 30
    LDA #$3C                     ; $D76C  A9 3C
    STA $39                      ; $D76E  85 39
    LDA $05E0                    ; $D770  AD E0 05
    ORA #$80                     ; $D773  09 80
    STA $05E0                    ; $D775  8D E0 05

loc_1E_D778:
    RTS                          ; $D778  60

    LDA #$00                     ; $D779  A9 00
    STA $3D                      ; $D77B  85 3D
    LDA $05C0                    ; $D77D  AD C0 05
    CMP #$7A                     ; $D780  C9 7A
    BEQ loc_1E_D7E7              ; $D782  F0 63
    LDA $03E0                    ; $D784  AD E0 03
    BNE loc_1E_D7EA              ; $D787  D0 61
    LDY #$0F                     ; $D789  A0 0F

loc_1E_D78B:
    LDA #$7A                     ; $D78B  A9 7A
    STA $05C0,Y                  ; $D78D  99 C0 05
    LDA #$00                     ; $D790  A9 00
    STA $05E0,Y                  ; $D792  99 E0 05
    STA $05A0,Y                  ; $D795  99 A0 05
    STA $0480,Y                  ; $D798  99 80 04
    LDA $0360                    ; $D79B  AD 60 03
    STA $0360,Y                  ; $D79E  99 60 03
    LDA $0380                    ; $D7A1  AD 80 03
    STA $0380,Y                  ; $D7A4  99 80 03
    LDA $03C0                    ; $D7A7  AD C0 03
    STA $03C0,Y                  ; $D7AA  99 C0 03
    LDA $03E0                    ; $D7AD  AD E0 03
    STA $03E0,Y                  ; $D7B0  99 E0 03
    LDA #$10                     ; $D7B3  A9 10
    STA $0320,Y                  ; $D7B5  99 20 03
    LDA #$80                     ; $D7B8  A9 80
    STA $0300,Y                  ; $D7BA  99 00 03
    LDA #$90                     ; $D7BD  A9 90
    STA $0580,Y                  ; $D7BF  99 80 05
    LDA $D7F1,Y                  ; $D7C2  B9 F1 D7
    STA $0400,Y                  ; $D7C5  99 00 04
    LDA $D801,Y                  ; $D7C8  B9 01 D8
    STA $0420,Y                  ; $D7CB  99 20 04
    LDA $D811,Y                  ; $D7CE  B9 11 D8
    STA $0440,Y                  ; $D7D1  99 40 04
    LDA $D821,Y                  ; $D7D4  B9 21 D8
    STA $0460,Y                  ; $D7D7  99 60 04
    DEY                          ; $D7DA  88
    BPL loc_1E_D78B              ; $D7DB  10 AE
    LDA #$00                     ; $D7DD  A9 00
    STA $0440                    ; $D7DF  8D 40 04
    LDA #$03                     ; $D7E2  A9 03
    STA $0460                    ; $D7E4  8D 60 04

loc_1E_D7E7:
    JSR sub_1F_F779              ; $D7E7  20 79 F7

loc_1E_D7EA:
    INC $3F                      ; $D7EA  E6 3F
    BNE loc_1E_D7F0              ; $D7EC  D0 02
    INC $3C                      ; $D7EE  E6 3C

loc_1E_D7F0:
    RTS                          ; $D7F0  60

    .byte $00,$1F,$00,$1F,$00,$E1,$00,$E1,$00,$0F,$80,$0F,$00,$F1,$80,$F1  ; $D7F1
    .byte $00,$02,$03,$02,$00,$FD,$FD,$FD,$00,$01,$01,$01,$00,$FE,$FE,$FE  ; $D801
    .byte $00,$E1,$00,$1F,$00,$1F,$00,$E1,$80,$F1,$00,$0F,$80,$0F,$00,$F1  ; $D811
    .byte $FD,$FD,$00,$02,$03,$02,$00,$FD,$FE,$FE,$00,$01,$01,$01,$00,$FE  ; $D821
    .byte $A9,$00,$8D,$E0,$05,$CE,$00,$05,$D0,$1C,$A9,$1E,$8D,$00,$05,$A0  ; $D831
    .byte $68,$B9,$01,$02,$18,$69,$01,$C9,$FA,$D0,$02,$A9,$F7,$99,$01,$02  ; $D841
    .byte $88,$88,$88,$88,$10,$EB,$60,$20,$D8,$DE,$AD,$C0,$05,$C9,$DA,$D0  ; $D851
    .byte $0C,$AD,$A0,$05,$C9,$03,$D0,$EE,$A9,$DB,$20,$35,$F8,$A0,$06,$20  ; $D861
    .byte $D6,$E8,$A5,$10,$C9,$80,$F0,$0D,$A9,$DB,$CD,$C0,$05,$F0,$13,$20  ; $D871
    .byte $35,$F8,$4C,$93,$D8,$A9,$DC,$CD,$C0,$05,$F0,$30,$20,$35,$F8,$4C  ; $D881
    .byte $BD,$D8,$A0,$00,$20,$7C,$F6,$90,$15,$A5,$14,$29,$80,$F0,$70,$A9  ; $D891
    .byte $E5,$8D,$40,$04,$A9,$04,$8D,$60,$04,$A0,$00,$20,$7C,$F6,$A5,$16  ; $D8A1
    .byte $29,$03,$F0,$5B,$85,$31,$20,$3D,$CF,$4C,$10,$D9,$A5,$14,$29,$80  ; $D8B1
    .byte $F0,$0B,$A0,$01,$20,$D6,$E8,$A5,$10,$C9,$80,$D0,$D2,$A5,$16,$29  ; $D8C1
    .byte $03,$F0,$05,$85,$31,$20,$3D,$CF,$A9,$80,$8D,$40,$04,$A9,$01,$8D  ; $D8D1
    .byte $60,$04,$A5,$16,$29,$0C,$F0,$27,$29,$04,$D0,$1E,$A0,$01,$20,$42  ; $D8E1
    .byte $F6,$A0,$06,$20,$D6,$E8,$A5,$10,$C9,$80,$F0,$0B,$AD,$C0,$03,$29  ; $D8F1
    .byte $F0,$18,$69,$10,$8D,$C0,$03,$4C,$10,$D9,$A0,$00,$4C,$06,$F6,$AD  ; $D901
    .byte $C0,$05,$48,$20,$55,$D3,$A5,$14,$29,$40,$F0,$03,$20,$DA,$D0,$A9  ; $D911
    .byte $00,$85,$32,$68,$8D,$C0,$05,$60,$A0,$00,$20,$7C,$F6,$90,$60,$A9  ; $D921
    .byte $01,$CD,$C0,$05,$F0,$0B,$8D,$C0,$05,$A9,$00,$8D,$E0,$05,$8D,$A0  ; $D931
    .byte $05,$A5,$22,$C9,$10,$D0,$2B,$A0,$26,$C4,$52,$F0,$0D,$84,$52,$A0  ; $D941
    .byte $00,$8C,$00,$A0,$84,$70,$84,$28,$F0,$04,$A4,$70,$F0,$14,$85,$F5  ; $D951
    .byte $20,$6B,$FF,$A9,$1A,$20,$B4,$E8,$A9,$04,$85,$10,$20,$8C,$EF,$A2  ; $D961
    .byte $00,$60,$A5,$B0,$C9,$9C,$F0,$13,$A5,$95,$29,$03,$D0,$11,$E6,$B0  ; $D971
    .byte $A5,$B0,$C9,$81,$F0,$09,$A9,$1C,$4C,$9A,$F8,$A9,$00,$85,$30,$60  ; $D981
    .byte $A0,$00,$20,$7C,$F6,$B0,$1E,$AD,$80,$05,$48,$29,$40,$D0,$08,$A0  ; $D991
    .byte $00,$20,$80,$F5,$4C,$AD,$D9,$A0,$01,$20,$C4,$F5,$68,$8D,$80,$05  ; $D9A1
    .byte $CE,$00,$05,$D0,$07,$A9,$00,$8D,$00,$05,$85,$30,$60,$CE,$20,$05  ; $D9B1
    .byte $D0,$0F,$AC,$00,$05,$84,$30,$B9,$97,$D2,$20,$35,$F8,$A9,$00,$85  ; $D9C1
    .byte $32,$60,$AD,$00,$05,$29,$0F,$F0,$57,$AD,$60,$04,$10,$52,$A9,$68  ; $D9D1
    .byte $CD,$C0,$03,$F0,$05,$B0,$49,$8D,$C0,$03,$A0,$0F,$B9,$10,$03,$30  ; $D9E1
    .byte $10,$88,$10,$F8,$AD,$00,$05,$C9,$04,$F0,$07,$20,$3A,$DB,$EE,$00  ; $D9F1
    .byte $05,$60,$A9,$31,$20,$9A,$F8,$A4,$22,$B9,$04,$DD,$85,$A1,$B9,$0C  ; $DA01
    .byte $DD,$85,$B4,$18,$65,$A1,$A8,$A9,$80,$99,$A2,$00,$A9,$02,$85,$F5  ; $DA11
    .byte $20,$6B,$FF,$20,$00,$A0,$A9,$0D,$85,$30,$A9,$80,$8D,$00,$03,$60  ; $DA21
    .byte $A5,$22,$C9,$10,$90,$1E,$A5,$95,$29,$07,$D0,$18,$AD,$20,$05,$F0  ; $DA31
    .byte $07,$AD,$10,$06,$C9,$0F,$F0,$0C,$AD,$10,$06,$49,$2F,$8D,$10,$06  ; $DA41
    .byte $A9,$FF,$85,$18,$A0,$00,$20,$7C,$F6,$90,$10,$AD,$20,$05,$F0,$0B  ; $DA51
    .byte $A9,$01,$CD,$C0,$05,$F0,$04,$20,$35,$F8,$38,$26,$0F,$A0,$0F,$A5  ; $DA61
    .byte $22,$C9,$11,$D0,$04,$C0,$00,$F0,$08,$B9,$10,$03,$30,$83,$88,$10  ; $DA71
    .byte $EE,$A5,$22,$C9,$08,$90,$0A,$C9,$0C,$B0,$06,$A5,$F9,$C9,$18,$90  ; $DA81
    .byte $36,$A5,$22,$C9,$11,$D0,$0E,$A9,$37,$C5,$D9,$F0,$16,$A9,$00,$85  ; $DA91
    .byte $FD,$A9,$37,$D0,$06,$A9,$38,$C5,$D9,$F0,$08,$20,$98,$F8,$A9,$FF  ; $DAA1
    .byte $8D,$20,$05,$AD,$20,$05,$F0,$0F,$CE,$20,$05,$D0,$6D,$A5,$22,$C9  ; $DAB1
    .byte $10,$90,$04,$A9,$00,$85,$FD,$A5,$22,$C9,$08,$90,$03,$4C,$89,$DB  ; $DAC1
    .byte $84,$00,$AD,$60,$03,$C9,$80,$F0,$26,$B0,$13,$A0,$00,$20,$80,$F5  ; $DAD1
    .byte $26,$00,$A9,$80,$CD,$60,$03,$B0,$16,$8D,$60,$03,$90,$11,$A0,$01  ; $DAE1
    .byte $20,$C4,$F5,$26,$00,$A9,$80,$CD,$60,$03,$90,$03,$8D,$60,$03,$A0  ; $DAF1
    .byte $00,$46,$0F,$B0,$01,$C8,$B9,$7F,$DC,$CD,$C0,$05,$F0,$03,$20,$35  ; $DB01
    .byte $F8,$C0,$01,$F0,$72,$46,$00,$90,$6E,$AD,$60,$03,$C9,$80,$F0,$0B  ; $DB11
    .byte $A9,$E5,$8D,$40,$04,$A9,$04,$8D,$60,$04,$60,$A9,$00,$8D,$40,$04  ; $DB21
    .byte $A9,$08,$8D,$60,$04,$EE,$00,$05,$60,$AC,$00,$05,$BE,$00,$DD,$A0  ; $DB31
    .byte $1F,$A9,$5B,$20,$46,$F8,$A9,$00,$99,$80,$04,$A9,$11,$99,$20,$03  ; $DB41
    .byte $B9,$E1,$DC,$99,$60,$03,$AD,$80,$03,$99,$80,$03,$B9,$D1,$DC,$99  ; $DB51
    .byte $C0,$03,$BD,$71,$DC,$99,$00,$04,$BD,$89,$DC,$99,$20,$04,$BD,$A1  ; $DB61
    .byte $DC,$99,$40,$04,$BD,$B9,$DC,$99,$60,$04,$CA,$88,$C0,$0F,$D0,$C1  ; $DB71
    .byte $A9,$32,$20,$9A,$F8,$A2,$00,$60,$A5,$22,$C9,$10,$B0,$26,$C9,$0C  ; $DB81
    .byte $B0,$13,$A5,$F9,$C9,$18,$B0,$0D,$A9,$00,$85,$30,$A4,$22,$B9,$0C  ; $DB91
    .byte $CD,$20,$98,$F8,$60,$A9,$81,$8D,$00,$03,$A9,$00,$8D,$00,$05,$A9  ; $DBA1
    .byte $0D,$85,$30,$60,$A9,$0F,$8D,$10,$06,$85,$18,$A9,$00,$85,$F8,$85  ; $DBB1
    .byte $6A,$85,$6B,$85,$FD,$A5,$22,$18,$69,$04,$85,$30,$A9,$80,$8D,$00  ; $DBC1
    .byte $03,$A9,$00,$8D,$00,$05,$8D,$20,$05,$8D,$40,$05,$8D,$60,$05,$60  ; $DBD1
    .byte $AD,$00,$03,$29,$0F,$D0,$27,$A0,$00,$20,$7C,$F6,$B0,$0C,$AD,$A0  ; $DBE1
    .byte $05,$C9,$04,$D0,$18,$A9,$07,$4C,$35,$F8,$EE,$00,$03,$8D,$40,$04  ; $DBF1
    .byte $8D,$60,$04,$A9,$3C,$8D,$00,$05,$A9,$01,$20,$35,$F8,$60,$AD,$00  ; $DC01
    .byte $05,$F0,$04,$CE,$00,$05,$60,$A9,$13,$CD,$C0,$05,$F0,$0D,$20,$35  ; $DC11
    .byte $F8,$A9,$34,$20,$9A,$F8,$A9,$04,$8D,$A0,$05,$AD,$A0,$05,$C9,$02  ; $DC21
    .byte $D0,$40,$A9,$00,$8D,$E0,$05,$AD,$40,$04,$18,$65,$99,$8D,$40,$04  ; $DC31
    .byte $AD,$60,$04,$69,$00,$8D,$60,$04,$20,$79,$F7,$AD,$E0,$03,$F0,$22  ; $DC41
    .byte $A4,$22,$C0,$0C,$B0,$1D,$A5,$61,$19,$C2,$DE,$85,$61,$E6,$59,$A5  ; $DC51
    .byte $22,$C9,$00,$F0,$09,$C9,$07,$D0,$09,$A9,$9C,$85,$AB,$60,$A9,$9C  ; $DC61
    .byte $85,$AD,$60,$A9,$FF,$85,$74,$E6,$75,$A9,$9C,$85,$A2,$60,$04,$07  ; $DC71
    .byte $00,$C2,$00,$C2,$00,$3E,$00,$3E,$00,$E1,$00,$E1,$00,$1F,$00,$1F  ; $DC81
    .byte $00,$F1,$80,$F1,$00,$0F,$80,$0F,$00,$FB,$FA,$FB,$00,$04,$06,$04  ; $DC91
    .byte $00,$FD,$FD,$FD,$00,$02,$03,$02,$00,$FE,$FE,$FE,$00,$01,$01,$01  ; $DCA1
    .byte $00,$3E,$00,$C2,$00,$C2,$00,$3E,$00,$1F,$00,$E1,$00,$E1,$00,$1F  ; $DCB1
    .byte $80,$0F,$00,$F1,$80,$F1,$00,$0F,$06,$04,$00,$FB,$FA,$FB,$00,$04  ; $DCC1
    .byte $03,$02,$00,$FD,$FD,$FD,$00,$02,$01,$01,$00,$FE,$FE,$FE,$00,$01  ; $DCD1
    .byte $00,$23,$78,$C0,$F0,$CC,$78,$23,$00,$23,$78,$C0,$F0,$CC,$78,$23  ; $DCE1
    .byte $80,$D4,$F8,$D4,$80,$2B,$08,$2B,$80,$D4,$F8,$D4,$80,$2B,$08,$2B  ; $DCF1
    .byte $1F,$1F,$27,$02,$04,$01,$03,$05,$00,$02,$04,$00,$00,$00,$00,$00  ; $DD01
    .byte $06,$06,$06,$A0,$00,$20,$7C,$F6,$90,$0A,$A9,$01,$CD,$C0,$05,$F0  ; $DD11
    .byte $03,$20,$35,$F8,$A0,$26,$C4,$52,$F0,$0D,$84,$52,$A0,$00,$8C,$00  ; $DD21
    .byte $A0,$84,$70,$84,$28,$F0,$04,$A4,$70,$F0,$16,$A9,$11,$85,$F5,$20  ; $DD31
    .byte $6B,$FF,$A9,$04,$20,$B4,$E8,$A9,$04,$85,$10,$20,$8C,$EF,$A2,$00  ; $DD41
    .byte $60,$A0,$0F,$B9,$08,$03,$30,$4C,$88,$10,$F8,$A9,$0B,$C5,$F8,$F0  ; $DD51
    .byte $10,$85,$F8,$A5,$FD,$09,$01,$85,$FD,$A9,$50,$85,$FA,$A9,$52,$85  ; $DD61
    .byte $5E,$A5,$FA,$38,$E9,$03,$85,$FA,$B0,$06,$A9,$00,$85,$FA,$85,$30  ; $DD71
    .byte $A0,$03,$B9,$A6,$DD,$38,$E5,$FA,$90,$0B,$99,$DC,$03,$B9,$9C,$05  ; $DD81
    .byte $29,$FB,$99,$9C,$05,$88,$10,$EA,$A5,$30,$F0,$08,$AD,$9E,$05,$09  ; $DD91
    .byte $04,$8D,$9E,$05,$60,$48,$3F,$3F,$3F,$AD,$A0,$05,$C9,$04,$D0,$F4  ; $DDA1
    .byte $A4,$6C,$B9,$5E,$DE,$10,$09,$85,$74,$E6,$75,$A9,$9C,$85,$A2,$60  ; $DDB1
    .byte $A9,$00,$85,$EE,$20,$52,$C7,$A9,$04,$85,$97,$20,$E9,$C5,$20,$21  ; $DDC1
    .byte $FF,$20,$28,$C6,$A9,$01,$85,$F5,$20,$6B,$FF,$A4,$6C,$D0,$02,$84  ; $DDD1
    .byte $6E,$B9,$5E,$DE,$85,$F9,$8D,$80,$03,$85,$2B,$85,$29,$A9,$20,$85  ; $DDE1
    .byte $2A,$B9,$72,$DE,$8D,$60,$03,$B9,$86,$DE,$8D,$C0,$03,$B9,$9A,$DE  ; $DDF1
    .byte $85,$9E,$85,$9F,$B9,$AE,$DE,$20,$00,$A0,$20,$3C,$FF,$A9,$01,$85  ; $DE01
    .byte $31,$85,$23,$85,$2E,$C6,$29,$A9,$1F,$85,$24,$A9,$21,$48,$A9,$01  ; $DE11
    .byte $85,$10,$20,$F1,$E4,$20,$21,$FF,$68,$38,$E9,$01,$D0,$EF,$85,$2C  ; $DE21
    .byte $85,$2D,$85,$5A,$A5,$F9,$C9,$08,$D0,$05,$A9,$0A,$20,$98,$F8,$20  ; $DE31
    .byte $21,$FF,$20,$4C,$C7,$A2,$00,$A9,$13,$20,$35,$F8,$A9,$12,$85,$30  ; $DE41
    .byte $60,$AD,$A0,$05,$C9,$04,$D0,$04,$A9,$00,$85,$30,$60,$07,$00,$FF  ; $DE51
    .byte $0A,$0C,$0E,$10,$12,$14,$16,$18,$00,$08,$08,$08,$08,$08,$08,$08  ; $DE61
    .byte $08,$30,$00,$00,$20,$20,$20,$20,$20,$20,$20,$20,$00,$30,$30,$30  ; $DE71
    .byte $70,$90,$D0,$D0,$D0,$B0,$00,$00,$C0,$B0,$B0,$B0,$B0,$B0,$A0,$B0  ; $DE81
    .byte $00,$2C,$6C,$AC,$AC,$AC,$2C,$6C,$AC,$10,$10,$00,$1B,$1C,$1D,$1E  ; $DE91
    .byte $1F,$20,$21,$22,$00,$11,$11,$11,$11,$11,$11,$11,$11,$02,$02,$00  ; $DEA1
    .byte $25,$23,$27,$24,$2A,$26,$28,$29,$00,$02,$02,$02,$02,$02,$02,$02  ; $DEB1
    .byte $02,$01,$02,$04,$08,$10,$20,$40,$80,$01,$04,$40,$80  ; $DEC1

sub_1E_DECE:
    LDA $A0                      ; $DECE  A5 A0
    CMP #$06                     ; $DED0  C9 06
    BCC sub_1E_DED8              ; $DED2  90 04
    AND #$01                     ; $DED4  29 01
    BNE loc_1E_DF1A              ; $DED6  D0 42

sub_1E_DED8:
    LDY $A0                      ; $DED8  A4 A0
    INC $B5                      ; $DEDA  E6 B5
    LDA $B5                      ; $DEDC  A5 B5
    CMP $DF27,Y                  ; $DEDE  D9 27 DF
    BNE loc_1E_DF1A              ; $DEE1  D0 37
    LDA #$00                     ; $DEE3  A9 00
    STA $B5                      ; $DEE5  85 B5
    LDA $00A2,Y                  ; $DEE7  B9 A2 00
    AND #$1F                     ; $DEEA  29 1F
    SEC                          ; $DEEC  38
    SBC $DF1B,Y                  ; $DEED  F9 1B DF
    BCS loc_1E_DEF4              ; $DEF0  B0 02
    LDA #$00                     ; $DEF2  A9 00

loc_1E_DEF4:
    ORA #$80                     ; $DEF4  09 80
    STA $00A2,Y                  ; $DEF6  99 A2 00
    CMP #$80                     ; $DEF9  C9 80
    BNE loc_1E_DF1A              ; $DEFB  D0 1D
    CPY #$0B                     ; $DEFD  C0 0B
    BEQ loc_1E_DF15              ; $DEFF  F0 14
    CPY #$09                     ; $DF01  C0 09
    BNE loc_1E_DF1A              ; $DF03  D0 15
    LDA #$02                     ; $DF05  A9 02
    STA $EB                      ; $DF07  85 EB
    JSR sub_1F_FF3C              ; $DF09  20 3C FF
    LDA #$01                     ; $DF0C  A9 01
    JSR sub_1F_F835              ; $DF0E  20 35 F8
    LDA #$00                     ; $DF11  A9 00
    STA $30                      ; $DF13  85 30

loc_1E_DF15:
    LDA #$00                     ; $DF15  A9 00
    STA $0301                    ; $DF17  8D 01 03

loc_1E_DF1A:
    RTS                          ; $DF1A  60

    .byte $00,$02,$01,$02,$02,$00,$01,$03,$01,$01,$01,$01,$00,$01,$04,$01  ; $DF1B
    .byte $01,$00,$02,$01,$01,$1E,$02,$1E,$AD,$C0,$05,$C9,$13,$F0,$17,$A0  ; $DF2B
    .byte $00,$20,$7C,$F6,$90,$48,$A9,$13,$20,$35,$F8,$EE,$A0,$05,$A9,$00  ; $DF3B
    .byte $8D,$40,$04,$8D,$60,$04,$AD,$A0,$05,$D0,$33,$8D,$E0,$05,$20,$79  ; $DF4B
    .byte $F7,$AD,$E0,$03,$D0,$12,$AD,$40,$04,$18,$65,$99,$8D,$40,$04,$AD  ; $DF5B
    .byte $60,$04,$69,$00,$8D,$60,$04,$60,$A9,$00,$85,$30,$A9,$80,$85,$74  ; $DF6B
    .byte $A9,$FF,$85,$60,$A0,$0B,$A9,$9C,$99,$A2,$00,$88,$10,$FA,$60,$A0  ; $DF7B
    .byte $00,$20,$7C,$F6,$08,$66,$0F,$28,$B0,$0D,$A9,$07,$CD,$C0,$05,$F0  ; $DF8B
    .byte $10,$20,$35,$F8,$4C,$AC,$DF,$A9,$04,$CD,$C0,$05,$F0,$03,$20,$35  ; $DF9B
    .byte $F8,$AD,$00,$03,$29,$0F,$D0,$62,$AD,$60,$03,$C9,$50,$F0,$5B,$B0  ; $DFAB
    .byte $06,$EE,$60,$03,$4C,$C5,$DF,$CE,$60,$03,$AD,$60,$03,$C9,$50,$D0  ; $DFBB
    .byte $56,$AD,$1F,$03,$30,$44,$A9,$80,$8D,$1F,$03,$A9,$90,$8D,$9F,$05  ; $DFCB
    .byte $A9,$6D,$8D,$DF,$05,$A9,$00,$8D,$FF,$05,$8D,$BF,$05,$8D,$FF,$03  ; $DFDB
    .byte $8D,$DF,$03,$8D,$20,$05,$A5,$F9,$8D,$9F,$03,$A9,$C0,$8D,$7F,$03  ; $DFEB
    .byte $A9,$EE,$8D,$3F,$03  ; $DFFB
