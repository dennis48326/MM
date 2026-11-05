; PRG 8 KB bank $3E at $C000
.segment "BANK3E"
.org $C000


nmi_vector:
    PHP                          ; $C000  08
    PHA                          ; $C001  48
    TXA                          ; $C002  8A
    PHA                          ; $C003  48
    TYA                          ; $C004  98
    PHA                          ; $C005  48
    LDA $EA                      ; $C006  A5 EA
    BEQ loc_3E_C015              ; $C008  F0 0B
    LDA $F1                      ; $C00A  A5 F1
    STA $5C                      ; $C00C  85 5C
    LDA #$00                     ; $C00E  A9 00
    STA $5D                      ; $C010  85 5D
    JMP loc_3E_C0D2              ; $C012  4C D2 C0


loc_3E_C015:
    LDA $9A                      ; $C015  A5 9A
    BEQ loc_3E_C028              ; $C017  F0 0F
    LDA $FF                      ; $C019  A5 FF
    AND #$78                     ; $C01B  29 78
    STA $2000                    ; $C01D  8D 00 20
    LDA #$00                     ; $C020  A9 00
    STA $2001                    ; $C022  8D 01 20
    JMP loc_3E_C0B7              ; $C025  4C B7 C0


loc_3E_C028:
    LDA $FA                      ; $C028  A5 FA
    STA $65                      ; $C02A  85 65
    LDA $FC                      ; $C02C  A5 FC
    STA $66                      ; $C02E  85 66
    LDA $FD                      ; $C030  A5 FD
    STA $67                      ; $C032  85 67
    LDA $F1                      ; $C034  A5 F1
    STA $5C                      ; $C036  85 5C
    LDA $F0                      ; $C038  A5 F0
    STA $5D                      ; $C03A  85 5D
    CMP #$03                     ; $C03C  C9 03
    BEQ loc_3E_C04C              ; $C03E  F0 0C
    CMP #$06                     ; $C040  C9 06
    BEQ loc_3E_C04C              ; $C042  F0 08
    CMP #$07                     ; $C044  C9 07
    BEQ loc_3E_C04C              ; $C046  F0 04
    CMP #$09                     ; $C048  C9 09
    BCC loc_3E_C054              ; $C04A  90 08

loc_3E_C04C:
    LDA $69                      ; $C04C  A5 69
    STA $66                      ; $C04E  85 66
    LDA $6A                      ; $C050  A5 6A
    STA $67                      ; $C052  85 67

loc_3E_C054:
    LDA $FF                      ; $C054  A5 FF
    AND #$78                     ; $C056  29 78
    STA $2000                    ; $C058  8D 00 20
    LDA #$00                     ; $C05B  A9 00
    STA $2001                    ; $C05D  8D 01 20
    STA $2003                    ; $C060  8D 03 20
    LDA #$02                     ; $C063  A9 02
    STA $4014                    ; $C065  8D 14 40
    LDA $19                      ; $C068  A5 19
    BEQ loc_3E_C06F              ; $C06A  F0 03
    JSR sub_3E_C330              ; $C06C  20 30 C3

loc_3E_C06F:
    LDA $1A                      ; $C06F  A5 1A
    BEQ loc_3E_C08A              ; $C071  F0 17
    LDA $FF                      ; $C073  A5 FF
    AND #$7F                     ; $C075  29 7F
    ORA #$04                     ; $C077  09 04
    STA $2000                    ; $C079  8D 00 20
    LDX #$00                     ; $C07C  A2 00
    STX $1A                      ; $C07E  86 1A
    JSR sub_3E_C334              ; $C080  20 34 C3
    LDA $FF                      ; $C083  A5 FF
    AND #$7F                     ; $C085  29 7F
    STA $2000                    ; $C087  8D 00 20

loc_3E_C08A:
    LDA $18                      ; $C08A  A5 18
    BEQ loc_3E_C0B7              ; $C08C  F0 29
    LDX #$00                     ; $C08E  A2 00
    STX $18                      ; $C090  86 18
    LDA $2002                    ; $C092  AD 02 20
    LDA #$3F                     ; $C095  A9 3F
    STA $2006                    ; $C097  8D 06 20
    STX $2006                    ; $C09A  8E 06 20
    LDY #$20                     ; $C09D  A0 20

loc_3E_C09F:
    LDA $0600,X                  ; $C09F  BD 00 06
    STA $2007                    ; $C0A2  8D 07 20
    INX                          ; $C0A5  E8
    DEY                          ; $C0A6  88
    BNE loc_3E_C09F              ; $C0A7  D0 F6
    LDA #$3F                     ; $C0A9  A9 3F
    STA $2006                    ; $C0AB  8D 06 20
    STY $2006                    ; $C0AE  8C 06 20
    STY $2006                    ; $C0B1  8C 06 20
    STY $2006                    ; $C0B4  8C 06 20

loc_3E_C0B7:
    LDA $2002                    ; $C0B7  AD 02 20
    LDA $66                      ; $C0BA  A5 66
    STA $2005                    ; $C0BC  8D 05 20
    LDA $65                      ; $C0BF  A5 65
    STA $2005                    ; $C0C1  8D 05 20
    LDA $FE                      ; $C0C4  A5 FE
    STA $2001                    ; $C0C6  8D 01 20
    LDA $67                      ; $C0C9  A5 67
    AND #$03                     ; $C0CB  29 03
    ORA $FF                      ; $C0CD  05 FF
    STA $2000                    ; $C0CF  8D 00 20

loc_3E_C0D2:
    LDA $5C                      ; $C0D2  A5 5C
    STA $C000                    ; $C0D4  8D 00 C0
    STA $C001                    ; $C0D7  8D 01 C0
    LDX $9B                      ; $C0DA  A6 9B
    STA $E000,X                  ; $C0DC  9D 00 E0
    BEQ loc_3E_C0ED              ; $C0DF  F0 0C
    LDX $5D                      ; $C0E1  A6 5D
    LDA $C318,X                  ; $C0E3  BD 18 C3
    STA $9C                      ; $C0E6  85 9C
    LDA $C324,X                  ; $C0E8  BD 24 C3
    STA $9D                      ; $C0EB  85 9D

loc_3E_C0ED:
    INC $92                      ; $C0ED  E6 92
    LDX #$FF                     ; $C0EF  A2 FF
    STX $90                      ; $C0F1  86 90
    INX                          ; $C0F3  E8
    LDY #$04                     ; $C0F4  A0 04

loc_3E_C0F6:
    LDA $80,X                    ; $C0F6  B5 80
    CMP #$01                     ; $C0F8  C9 01
    BNE loc_3E_C104              ; $C0FA  D0 08
    DEC $81,X                    ; $C0FC  D6 81
    BNE loc_3E_C104              ; $C0FE  D0 04
    LDA #$04                     ; $C100  A9 04
    STA $80,X                    ; $C102  95 80

loc_3E_C104:
    INX                          ; $C104  E8
    INX                          ; $C105  E8
    INX                          ; $C106  E8
    INX                          ; $C107  E8
    DEY                          ; $C108  88
    BNE loc_3E_C0F6              ; $C109  D0 EB
    TSX                          ; $C10B  BA
    LDA $0107,X                  ; $C10C  BD 07 01
    STA $E9                      ; $C10F  85 E9
    LDA $0106,X                  ; $C111  BD 06 01
    STA $E8                      ; $C114  85 E8
    LDA #$C1                     ; $C116  A9 C1
    STA $0107,X                  ; $C118  9D 07 01
    LDA #$27                     ; $C11B  A9 27
    STA $0106,X                  ; $C11D  9D 06 01
    PLA                          ; $C120  68
    TAY                          ; $C121  A8
    PLA                          ; $C122  68
    TAX                          ; $C123  AA
    PLA                          ; $C124  68
    PLP                          ; $C125  28
    RTI                          ; $C126  40

    PHP                          ; $C127  08
    PHP                          ; $C128  08
    PHP                          ; $C129  08
    PHA                          ; $C12A  48
    TXA                          ; $C12B  8A
    PHA                          ; $C12C  48
    TYA                          ; $C12D  98
    PHA                          ; $C12E  48
    TSX                          ; $C12F  BA
    SEC                          ; $C130  38
    LDA $E8                      ; $C131  A5 E8
    SBC #$01                     ; $C133  E9 01
    STA $0105,X                  ; $C135  9D 05 01
    LDA $E9                      ; $C138  A5 E9
    SBC #$00                     ; $C13A  E9 00
    STA $0106,X                  ; $C13C  9D 06 01
    JSR sub_3F_FF5C              ; $C13F  20 5C FF
    PLA                          ; $C142  68
    TAY                          ; $C143  A8
    PLA                          ; $C144  68
    TAX                          ; $C145  AA
    PLA                          ; $C146  68
    PLP                          ; $C147  28
    RTS                          ; $C148  60


irq_vector:
    PHP                          ; $C149  08
    PHA                          ; $C14A  48
    TXA                          ; $C14B  8A
    PHA                          ; $C14C  48
    TYA                          ; $C14D  98
    PHA                          ; $C14E  48
    STA $E000                    ; $C14F  8D 00 E0
    STA $E001                    ; $C152  8D 01 E0
    JMP ($009C)                  ; $C155  6C 9C 00

    .byte $AD,$02,$20,$A9,$28,$8D,$06,$20,$A9,$80,$8D,$06,$20,$A5,$5E,$8D  ; $C158
    .byte $05,$20,$A9,$00,$8D,$05,$20,$A5,$FF,$09,$02,$8D,$00,$20,$A9,$BE  ; $C168
    .byte $38,$E5,$5C,$8D,$00,$C0,$A9,$89,$85,$9C,$A9,$C1,$85,$9D,$4C,$11  ; $C178
    .byte $C3,$AD,$02,$20,$A9,$23,$8D,$06,$20,$A9,$00,$8D,$06,$20,$A9,$00  ; $C188
    .byte $8D,$05,$20,$8D,$05,$20,$A5,$FF,$29,$FC,$8D,$00,$20,$4C,$0E,$C3  ; $C198
    .byte $AD,$02,$20,$A9,$21,$8D,$06,$20,$A9,$00,$8D,$06,$20,$A9,$00,$8D  ; $C1A8
    .byte $05,$20,$8D,$05,$20,$A9,$A0,$38,$E5,$5C,$8D,$00,$C0,$A9,$D0,$85  ; $C1B8
    .byte $9C,$A9,$C1,$85,$9D,$4C,$11,$C3,$AD,$02,$20,$A9,$22,$8D,$06,$20  ; $C1C8
    .byte $A9,$80,$8D,$06,$20,$4C,$02,$C2,$AD,$02,$20,$A9,$80,$A0,$22,$D0  ; $C1D8
    .byte $53,$AD,$02,$20,$A5,$66,$4A,$4A,$4A,$29,$1F,$09,$00,$A0,$23,$8C  ; $C1E8
    .byte $06,$20,$8D,$06,$20,$A5,$FF,$8D,$00,$20,$A5,$66,$8D,$05,$20,$A5  ; $C1F8
    .byte $65,$8D,$05,$20,$4C,$0E,$C3,$AD,$02,$20,$A5,$66,$4A,$4A,$4A,$29  ; $C208
    .byte $1F,$09,$E0,$A0,$21,$8C,$06,$20,$8D,$06,$20,$A5,$FF,$8D,$00,$20  ; $C218
    .byte $A5,$66,$8D,$05,$20,$A5,$65,$8D,$05,$20,$4C,$0E,$C3,$AD,$02,$20  ; $C228
    .byte $A9,$40,$A0,$22,$8C,$06,$20,$8D,$06,$20,$A5,$FF,$8D,$00,$20,$A9  ; $C238
    .byte $00,$8D,$05,$20,$8D,$05,$20,$4C,$0E,$C3,$18,$AD,$02,$20,$A5,$66  ; $C248
    .byte $49,$FF,$69,$01,$8D,$05,$20,$A9,$00,$8D,$05,$20,$A5,$67,$49,$FF  ; $C258
    .byte $69,$00,$29,$01,$05,$FF,$8D,$00,$20,$A9,$4F,$8D,$00,$C0,$A9,$81  ; $C268
    .byte $85,$9C,$A9,$C2,$85,$9D,$4C,$11,$C3,$AD,$02,$20,$A5,$66,$8D,$05  ; $C278
    .byte $20,$A5,$FF,$05,$67,$8D,$00,$20,$A9,$2F,$8D,$00,$C0,$A9,$42,$85  ; $C288
    .byte $9C,$A9,$C2,$85,$9D,$4C,$11,$C3,$AD,$02,$20,$A9,$00,$A0,$28,$8C  ; $C298
    .byte $06,$20,$8D,$06,$20,$A5,$FF,$09,$01,$8D,$00,$20,$A9,$00,$8D,$05  ; $C2A8
    .byte $20,$8D,$05,$20,$4C,$0E,$C3,$AD,$02,$20,$A9,$00,$A0,$23,$8C,$06  ; $C2B8
    .byte $20,$8D,$06,$20,$A5,$FF,$8D,$00,$20,$A9,$00,$8D,$05,$20,$8D,$05  ; $C2C8
    .byte $20,$4C,$0E,$C3  ; $C2D8
    LDA $2002                    ; $C2DC  AD 02 20
    LDA $FF                      ; $C2DF  A5 FF
    STA $2000                    ; $C2E1  8D 00 20
    LDA $FC                      ; $C2E4  A5 FC
    STA $2005                    ; $C2E6  8D 05 20
    LDA $FA                      ; $C2E9  A5 FA
    STA $2005                    ; $C2EB  8D 05 20
    LDA #$28                     ; $C2EE  A9 28
    STA $C000                    ; $C2F0  8D 00 C0
    LDA #$FE                     ; $C2F3  A9 FE
    STA $9C                      ; $C2F5  85 9C
    LDA #$C2                     ; $C2F7  A9 C2
    STA $9D                      ; $C2F9  85 9D
    JMP loc_3E_C311              ; $C2FB  4C 11 C3

    LDA $2002                    ; $C2FE  AD 02 20
    LDA $FF                      ; $C301  A5 FF
    STA $2000                    ; $C303  8D 00 20
    LDA #$00                     ; $C306  A9 00
    STA $2005                    ; $C308  8D 05 20
    STA $2005                    ; $C30B  8D 05 20
    STA $E000                    ; $C30E  8D 00 E0

loc_3E_C311:
    PLA                          ; $C311  68
    TAY                          ; $C312  A8
    PLA                          ; $C313  68
    TAX                          ; $C314  AA
    PLA                          ; $C315  68
    PLP                          ; $C316  28
    RTI                          ; $C317  40

    .byte $0E,$58,$A8,$E0,$E9,$0F,$35,$52,$A0,$BF,$FE,$DC,$C3,$C1,$C1,$C1  ; $C318
    .byte $C1,$C2,$C2,$C2,$C2,$C2,$C2,$C2  ; $C328

sub_3E_C330:
    LDX #$00                     ; $C330  A2 00
    STX $19                      ; $C332  86 19

sub_3E_C334:
    LDA $0780,X                  ; $C334  BD 80 07
    BMI loc_3E_C354              ; $C337  30 1B
    STA $2006                    ; $C339  8D 06 20
    LDA $0781,X                  ; $C33C  BD 81 07
    STA $2006                    ; $C33F  8D 06 20
    LDY $0782,X                  ; $C342  BC 82 07

loc_3E_C345:
    LDA $0783,X                  ; $C345  BD 83 07
    STA $2007                    ; $C348  8D 07 20
    INX                          ; $C34B  E8
    DEY                          ; $C34C  88
    BPL loc_3E_C345              ; $C34D  10 F6
    INX                          ; $C34F  E8
    INX                          ; $C350  E8
    INX                          ; $C351  E8
    BNE sub_3E_C334              ; $C352  D0 E0

loc_3E_C354:
    RTS                          ; $C354  60

    .byte $A5,$FF,$29,$11,$85,$FF,$8D,$00,$20,$60,$A5,$FF,$09,$80,$85,$FF  ; $C355
    .byte $8D,$00,$20,$60  ; $C365

sub_3E_C369:
    INC $EA                      ; $C369  E6 EA
    LDA #$00                     ; $C36B  A9 00
    STA $FE                      ; $C36D  85 FE
    STA $2001                    ; $C36F  8D 01 20
    RTS                          ; $C372  60


sub_3E_C373:
    DEC $EA                      ; $C373  C6 EA
    LDA #$18                     ; $C375  A9 18
    STA $FE                      ; $C377  85 FE
    STA $2001                    ; $C379  8D 01 20
    RTS                          ; $C37C  60


sub_3E_C37D:
    LDX #$01                     ; $C37D  A2 01
    STX $4016                    ; $C37F  8E 16 40
    DEX                          ; $C382  CA
    STX $4016                    ; $C383  8E 16 40
    LDX #$08                     ; $C386  A2 08

loc_3E_C388:
    LDA $4016                    ; $C388  AD 16 40
    LSR A                        ; $C38B  4A
    ROL $14                      ; $C38C  26 14
    LSR A                        ; $C38E  4A
    ROL $00                      ; $C38F  26 00
    LDA $4017                    ; $C391  AD 17 40
    LSR A                        ; $C394  4A
    ROL $15                      ; $C395  26 15
    LSR A                        ; $C397  4A
    ROL $01                      ; $C398  26 01
    DEX                          ; $C39A  CA
    BNE loc_3E_C388              ; $C39B  D0 EB
    LDA $00                      ; $C39D  A5 00
    ORA $14                      ; $C39F  05 14
    STA $14                      ; $C3A1  85 14
    LDA $01                      ; $C3A3  A5 01
    ORA $15                      ; $C3A5  05 15
    STA $15                      ; $C3A7  85 15
    LDX #$01                     ; $C3A9  A2 01

loc_3E_C3AB:
    LDA $14,X                    ; $C3AB  B5 14
    TAY                          ; $C3AD  A8
    EOR $16,X                    ; $C3AE  55 16
    AND $14,X                    ; $C3B0  35 14
    STA $14,X                    ; $C3B2  95 14
    STY $16,X                    ; $C3B4  94 16
    DEX                          ; $C3B6  CA
    BPL loc_3E_C3AB              ; $C3B7  10 F2
    LDX #$03                     ; $C3B9  A2 03

loc_3E_C3BB:
    LDA $14,X                    ; $C3BB  B5 14
    AND #$0C                     ; $C3BD  29 0C
    CMP #$0C                     ; $C3BF  C9 0C
    BEQ loc_3E_C3CB              ; $C3C1  F0 08
    LDA $14,X                    ; $C3C3  B5 14
    AND #$03                     ; $C3C5  29 03
    CMP #$03                     ; $C3C7  C9 03
    BNE loc_3E_C3D1              ; $C3C9  D0 06

loc_3E_C3CB:
    LDA $14,X                    ; $C3CB  B5 14
    AND #$F0                     ; $C3CD  29 F0
    STA $14,X                    ; $C3CF  95 14

loc_3E_C3D1:
    DEX                          ; $C3D1  CA
    BPL loc_3E_C3BB              ; $C3D2  10 E7
    RTS                          ; $C3D4  60


sub_3E_C3D5:
    STA $00                      ; $C3D5  85 00
    STX $01                      ; $C3D7  86 01
    STY $02                      ; $C3D9  84 02
    LDA $2002                    ; $C3DB  AD 02 20
    LDA $FF                      ; $C3DE  A5 FF
    AND #$FE                     ; $C3E0  29 FE
    STA $2000                    ; $C3E2  8D 00 20
    LDA $00                      ; $C3E5  A5 00
    STA $2006                    ; $C3E7  8D 06 20
    LDY #$00                     ; $C3EA  A0 00
    STY $2006                    ; $C3EC  8C 06 20
    LDX #$04                     ; $C3EF  A2 04
    CMP #$20                     ; $C3F1  C9 20
    BCS loc_3E_C3F7              ; $C3F3  B0 02
    LDX $02                      ; $C3F5  A6 02

loc_3E_C3F7:
    LDY #$00                     ; $C3F7  A0 00
    LDA $01                      ; $C3F9  A5 01

loc_3E_C3FB:
    STA $2007                    ; $C3FB  8D 07 20
    DEY                          ; $C3FE  88
    BNE loc_3E_C3FB              ; $C3FF  D0 FA
    DEX                          ; $C401  CA
    BNE loc_3E_C3FB              ; $C402  D0 F7
    LDY $02                      ; $C404  A4 02
    LDA $00                      ; $C406  A5 00
    CMP #$20                     ; $C408  C9 20
    BCC loc_3E_C41E              ; $C40A  90 12
    ADC #$02                     ; $C40C  69 02
    STA $2006                    ; $C40E  8D 06 20
    LDA #$C0                     ; $C411  A9 C0
    STA $2006                    ; $C413  8D 06 20
    LDX #$40                     ; $C416  A2 40

loc_3E_C418:
    STY $2007                    ; $C418  8C 07 20
    DEX                          ; $C41B  CA
    BNE loc_3E_C418              ; $C41C  D0 FA

loc_3E_C41E:
    LDX $01                      ; $C41E  A6 01
    RTS                          ; $C420  60


sub_3E_C421:
    LDX $97                      ; $C421  A6 97
    CPX #$04                     ; $C423  E0 04
    BNE loc_3E_C42C              ; $C425  D0 05
    LDA #$F8                     ; $C427  A9 F8
    STA $0200                    ; $C429  8D 00 02

loc_3E_C42C:
    LDA #$F8                     ; $C42C  A9 F8

loc_3E_C42E:
    STA $0200,X                  ; $C42E  9D 00 02
    INX                          ; $C431  E8
    INX                          ; $C432  E8
    INX                          ; $C433  E8
    INX                          ; $C434  E8
    BNE loc_3E_C42E              ; $C435  D0 F7
    RTS                          ; $C437  60


sub_3E_C438:
    LDX #$17                     ; $C438  A2 17

loc_3E_C43A:
    LDA #$00                     ; $C43A  A9 00
    STA $0300,X                  ; $C43C  9D 00 03
    STA $05A0,X                  ; $C43F  9D A0 05
    STA $05B8,X                  ; $C442  9D B8 05
    STA $0450,X                  ; $C445  9D 50 04
    LDA #$FF                     ; $C448  A9 FF
    STA $0438,X                  ; $C44A  9D 38 04
    DEX                          ; $C44D  CA
    BNE loc_3E_C43A              ; $C44E  D0 EA
    RTS                          ; $C450  60


sub_3E_C451:
    LDA #$30                     ; $C451  A9 30
    LDX #$F0                     ; $C453  A2 F0
    BNE loc_3E_C45A              ; $C455  D0 03

sub_3E_C457:
    LDA #$10                     ; $C457  A9 10
    TAX                          ; $C459  AA

loc_3E_C45A:
    STA $0F                      ; $C45A  85 0F
    STX $0D                      ; $C45C  86 0D
    LDY #$04                     ; $C45E  A0 04
    STY $0E                      ; $C460  84 0E

loc_3E_C462:
    LDY #$1F                     ; $C462  A0 1F

loc_3E_C464:
    LDA $0620,Y                  ; $C464  B9 20 06
    STA $0600,Y                  ; $C467  99 00 06
    DEY                          ; $C46A  88
    BPL loc_3E_C464              ; $C46B  10 F7
    LDA $64                      ; $C46D  A5 64
    PHA                          ; $C46F  48
    LDY #$1F                     ; $C470  A0 1F

loc_3E_C472:
    TYA                          ; $C472  98
    AND #$03                     ; $C473  29 03
    CMP #$03                     ; $C475  C9 03
    BNE loc_3E_C483              ; $C477  D0 0A
    LSR $64                      ; $C479  46 64
    BCC loc_3E_C483              ; $C47B  90 06
    DEY                          ; $C47D  88
    DEY                          ; $C47E  88
    DEY                          ; $C47F  88
    JMP loc_3E_C490              ; $C480  4C 90 C4


loc_3E_C483:
    LDA $0600,Y                  ; $C483  B9 00 06
    SEC                          ; $C486  38
    SBC $0F                      ; $C487  E5 0F
    BPL loc_3E_C48D              ; $C489  10 02
    LDA #$0F                     ; $C48B  A9 0F

loc_3E_C48D:
    STA $0600,Y                  ; $C48D  99 00 06

loc_3E_C490:
    DEY                          ; $C490  88
    BPL loc_3E_C472              ; $C491  10 DF
    STY $18                      ; $C493  84 18
    PLA                          ; $C495  68
    STA $64                      ; $C496  85 64
    LDA $0E                      ; $C498  A5 0E

loc_3E_C49A:
    PHA                          ; $C49A  48
    JSR sub_3F_FF1C              ; $C49B  20 1C FF
    PLA                          ; $C49E  68
    SEC                          ; $C49F  38
    SBC #$01                     ; $C4A0  E9 01
    BNE loc_3E_C49A              ; $C4A2  D0 F6
    LDA $0F                      ; $C4A4  A5 0F
    CLC                          ; $C4A6  18
    ADC $0D                      ; $C4A7  65 0D
    STA $0F                      ; $C4A9  85 0F
    CMP #$50                     ; $C4AB  C9 50
    BEQ loc_3E_C4B3              ; $C4AD  F0 04
    LDA $0F                      ; $C4AF  A5 0F
    BPL loc_3E_C462              ; $C4B1  10 AF

loc_3E_C4B3:
    LDA #$00                     ; $C4B3  A9 00
    STA $64                      ; $C4B5  85 64
    RTS                          ; $C4B7  60

    .byte $86,$0E,$84,$0F,$0A,$A8,$C8,$68,$85,$0C,$68,$85,$0D,$B1,$0C,$AA  ; $C4B8
    .byte $C8,$B1,$0C,$85,$0D,$86,$0C,$A6,$0E,$A4,$0F,$6C,$0C,$00  ; $C4C8
    LDX #$7F                     ; $C4D6  A2 7F
    TXS                          ; $C4D8  9A

loc_3E_C4D9:
    LDX #$00                     ; $C4D9  A2 00
    LDY #$04                     ; $C4DB  A0 04
    LDA $E4,X                    ; $C4DD  B5 E4
    AND #$02                     ; $C4DF  29 02
    STA $00                      ; $C4E1  85 00
    LDA $E5,X                    ; $C4E3  B5 E5
    AND #$02                     ; $C4E5  29 02
    EOR $00                      ; $C4E7  45 00
    CLC                          ; $C4E9  18
    BEQ loc_3E_C4ED              ; $C4EA  F0 01
    SEC                          ; $C4EC  38

loc_3E_C4ED:
    ROR $E4,X                    ; $C4ED  76 E4
    INX                          ; $C4EF  E8
    DEY                          ; $C4F0  88
    BNE loc_3E_C4ED              ; $C4F1  D0 FA
    LDA $F6                      ; $C4F3  A5 F6
    PHA                          ; $C4F5  48
    LDA #$20                     ; $C4F6  A9 20
    STA $F6                      ; $C4F8  85 F6
    JSR sub_3F_FF37              ; $C4FA  20 37 FF
    JSR $B800                    ; $C4FD  20 00 B8
    PLA                          ; $C500  68
    STA $F6                      ; $C501  85 F6
    JSR sub_3F_FF37              ; $C503  20 37 FF
    JSR sub_3F_FF1C              ; $C506  20 1C FF
    JMP loc_3E_C4D9              ; $C509  4C D9 C4

    LDX #$BF                     ; $C50C  A2 BF
    TXS                          ; $C50E  9A
    LDA $FF                      ; $C50F  A5 FF
    STA $2000                    ; $C511  8D 00 20
    JSR sub_3F_FF1C              ; $C514  20 1C FF
    LDA #$88                     ; $C517  A9 88
    STA $E4                      ; $C519  85 E4
    STA $F1                      ; $C51B  85 F1
    LDA #$C4                     ; $C51D  A9 C4
    STA $94                      ; $C51F  85 94
    LDA #$D6                     ; $C521  A9 D6
    STA $93                      ; $C523  85 93
    LDA #$01                     ; $C525  A9 01
    JSR sub_3F_FEED              ; $C527  20 ED FE
    CLI                          ; $C52A  58
    LDA #$01                     ; $C52B  A9 01
    STA $9B                      ; $C52D  85 9B
    LDA #$39                     ; $C52F  A9 39
    STA $F5                      ; $C531  85 F5
    JSR sub_3F_FF37              ; $C533  20 37 FF
    JSR $8000                    ; $C536  20 00 80
    LDA #$02                     ; $C539  A9 02
    STA $A1                      ; $C53B  85 A1
    LDA #$9C                     ; $C53D  A9 9C
    STA $B1                      ; $C53F  85 B1

loc_3E_C541:
    JSR sub_3E_C457              ; $C541  20 57 C4
    LDA #$40                     ; $C544  A9 40
    STA $99                      ; $C546  85 99
    LDA #$04                     ; $C548  A9 04
    STA $97                      ; $C54A  85 97
    JSR sub_3E_C421              ; $C54C  20 21 C4
    JSR sub_3E_C438              ; $C54F  20 38 C4
    JSR sub_3F_FF1C              ; $C552  20 1C FF
    JSR $8006                    ; $C555  20 06 80
    LDA $1F                      ; $C558  A5 1F
    STA $2A                      ; $C55A  85 2A
    STA $F9                      ; $C55C  85 F9
    STA $0348                    ; $C55E  8D 48 03
    STA $45                      ; $C561  85 45
    STA $46                      ; $C563  85 46
    STA $47                      ; $C565  85 47
    STA $48                      ; $C567  85 48
    BEQ loc_3E_C592              ; $C569  F0 27
    ASL A                        ; $C56B  0A
    ASL A                        ; $C56C  0A
    STA $00                      ; $C56D  85 00
    LDA $22                      ; $C56F  A5 22
    ASL A                        ; $C571  0A
    ASL A                        ; $C572  0A
    ASL A                        ; $C573  0A
    ADC $00                      ; $C574  65 00
    TAY                          ; $C576  A8
    LDA $C8A7,Y                  ; $C577  B9 A7 C8
    STA $2A                      ; $C57A  85 2A
    STA $F9                      ; $C57C  85 F9
    STA $0348                    ; $C57E  8D 48 03
    STA $45                      ; $C581  85 45
    LDA $C8A8,Y                  ; $C583  B9 A8 C8
    STA $46                      ; $C586  85 46
    LDA $C8A9,Y                  ; $C588  B9 A9 C8
    STA $47                      ; $C58B  85 47
    LDA $C8AA,Y                  ; $C58D  B9 AA C8
    STA $48                      ; $C590  85 48

loc_3E_C592:
    INC $45                      ; $C592  E6 45
    JSR sub_3E_C369              ; $C594  20 69 C3
    LDX $22                      ; $C597  A6 22
    JSR sub_3E_DA05              ; $C599  20 05 DA
    LDX $47                      ; $C59C  A6 47
    BEQ loc_3E_C5A3              ; $C59E  F0 03
    JSR sub_3E_DA05              ; $C5A0  20 05 DA

loc_3E_C5A3:
    JSR sub_3E_C373              ; $C5A3  20 73 C3
    LDA #$00                     ; $C5A6  A9 00
    STA $24                      ; $C5A8  85 24

loc_3E_C5AA:
    JSR sub_3E_CFB1              ; $C5AA  20 B1 CF
    JSR sub_3F_FF1C              ; $C5AD  20 1C FF
    LDA $2A                      ; $C5B0  A5 2A
    CMP $45                      ; $C5B2  C5 45
    BEQ loc_3E_C5C4              ; $C5B4  F0 0E
    INC $24                      ; $C5B6  E6 24
    LDA $24                      ; $C5B8  A5 24
    AND #$1F                     ; $C5BA  29 1F
    STA $24                      ; $C5BC  85 24
    BNE loc_3E_C5AA              ; $C5BE  D0 EA
    INC $2A                      ; $C5C0  E6 2A
    BNE loc_3E_C5AA              ; $C5C2  D0 E6

loc_3E_C5C4:
    LDA #$01                     ; $C5C4  A9 01
    STA $23                      ; $C5C6  85 23
    STA $2F                      ; $C5C8  85 2F
    LDY $0348                    ; $C5CA  AC 48 03
    LDA $B300,Y                  ; $C5CD  B9 00 B3
    STA $9E                      ; $C5D0  85 9E
    STA $9F                      ; $C5D2  85 9F
    LDY $46                      ; $C5D4  A4 46
    LDA $B530,Y                  ; $C5D6  B9 30 B5
    PHA                          ; $C5D9  48
    AND #$F0                     ; $C5DA  29 F0
    ORA $46                      ; $C5DC  05 46
    STA $2B                      ; $C5DE  85 2B
    AND #$20                     ; $C5E0  29 20
    BEQ loc_3E_C5E8              ; $C5E2  F0 04
    ORA $46                      ; $C5E4  05 46
    STA $2B                      ; $C5E6  85 2B

loc_3E_C5E8:
    LDA #$00                     ; $C5E8  A9 00
    STA $2E                      ; $C5EA  85 2E
    PLA                          ; $C5EC  68
    AND #$0F                     ; $C5ED  29 0F
    STA $2D                      ; $C5EF  85 2D
    LDA $2B                      ; $C5F1  A5 2B
    AND #$C0                     ; $C5F3  29 C0
    BEQ loc_3E_C607              ; $C5F5  F0 10
    LDA #$08                     ; $C5F7  A9 08
    STA $23                      ; $C5F9  85 23
    LDA #$00                     ; $C5FB  A9 00
    STA $24                      ; $C5FD  85 24
    STA $A000                    ; $C5FF  8D 00 A0
    LDA $0348                    ; $C602  AD 48 03
    STA $2A                      ; $C605  85 2A

loc_3E_C607:
    LDA $48                      ; $C607  A5 48
    ASL A                        ; $C609  0A
    ASL A                        ; $C60A  0A
    STA $00                      ; $C60B  85 00
    ASL A                        ; $C60D  0A
    ASL A                        ; $C60E  0A
    ADC $00                      ; $C60F  65 00
    TAX                          ; $C611  AA
    LDY #$00                     ; $C612  A0 00

loc_3E_C614:
    LDA $B590,X                  ; $C614  BD 90 B5
    STA $0620,Y                  ; $C617  99 20 06
    CPY #$04                     ; $C61A  C0 04
    BCS loc_3E_C62C              ; $C61C  B0 0E
    LDA $B5A0,X                  ; $C61E  BD A0 B5
    STA $06F0,Y                  ; $C621  99 F0 06
    LDA #$00                     ; $C624  A9 00
    STA $06F4,Y                  ; $C626  99 F4 06
    STA $06F8,Y                  ; $C629  99 F8 06

loc_3E_C62C:
    CPY #$08                     ; $C62C  C0 08
    BCS loc_3E_C636              ; $C62E  B0 06
    LDA $C853,Y                  ; $C630  B9 53 C8
    STA $0630,Y                  ; $C633  99 30 06

loc_3E_C636:
    INX                          ; $C636  E8
    INY                          ; $C637  C8
    CPY #$10                     ; $C638  C0 10
    BNE loc_3E_C614              ; $C63A  D0 D8
    LDA $0620                    ; $C63C  AD 20 06
    STA $0630                    ; $C63F  8D 30 06
    LDA #$01                     ; $C642  A9 01
    STA $0300                    ; $C644  8D 00 03
    LDA #$80                     ; $C647  A9 80
    STA $0330                    ; $C649  8D 30 03
    STA $27                      ; $C64C  85 27
    STA $0130                    ; $C64E  8D 30 01
    LDA #$90                     ; $C651  A9 90
    STA $0528                    ; $C653  8D 28 05
    LDA #$64                     ; $C656  A9 64
    STA $0378                    ; $C658  8D 78 03
    LDX #$00                     ; $C65B  A2 00
    STX $0390                    ; $C65D  8E 90 03
    STX $A0                      ; $C660  86 A0
    STX $0138                    ; $C662  8E 38 01
    LDA #$33                     ; $C665  A9 33
    JSR sub_3F_F446              ; $C667  20 46 F4
    JSR sub_3F_F324              ; $C66A  20 24 F3
    LDA #$0A                     ; $C66D  A9 0A
    STA $30                      ; $C66F  85 30
    LDA #$4C                     ; $C671  A9 4C
    STA $03A8                    ; $C673  8D A8 03
    STA $37                      ; $C676  85 37
    LDA #$01                     ; $C678  A9 01
    STA $03C0                    ; $C67A  8D C0 03
    STA $38                      ; $C67D  85 38
    LDY $22                      ; $C67F  A4 22
    LDA $C85B,Y                  ; $C681  B9 5B C8
    JSR sub_3F_F6BC              ; $C684  20 BC F6
    LDA #$9C                     ; $C687  A9 9C
    STA $B0                      ; $C689  85 B0
    LDA $22                      ; $C68B  A5 22
    CMP #$0E                     ; $C68D  C9 0E
    BNE loc_3E_C6C7              ; $C68F  D0 36
    LDA $F9                      ; $C691  A5 F9
    CMP #$09                     ; $C693  C9 09
    BNE loc_3E_C6C7              ; $C695  D0 30
    LDA $AC                      ; $C697  A5 AC
    CMP #$FF                     ; $C699  C9 FF
    BNE loc_3E_C6C7              ; $C69B  D0 2A
    LDY #$42                     ; $C69D  A0 42

loc_3E_C69F:
    LDA $C92B,Y                  ; $C69F  B9 2B C9
    STA $0780,Y                  ; $C6A2  99 80 07
    DEY                          ; $C6A5  88
    BPL loc_3E_C69F              ; $C6A6  10 F7
    STY $19                      ; $C6A8  84 19
    LDY #$17                     ; $C6AA  A0 17
    LDX #$00                     ; $C6AC  A2 00
    LDA #$73                     ; $C6AE  A9 73
    JSR sub_3F_F452              ; $C6B0  20 52 F4
    LDA #$1C                     ; $C6B3  A9 1C
    STA $0408,Y                  ; $C6B5  99 08 04
    LDA #$B3                     ; $C6B8  A9 B3
    STA $0300,Y                  ; $C6BA  99 00 03
    LDA #$80                     ; $C6BD  A9 80
    STA $0330,Y                  ; $C6BF  99 30 03
    LDA #$44                     ; $C6C2  A9 44
    STA $0378,Y                  ; $C6C4  99 78 03

loc_3E_C6C7:
    JSR sub_3F_FF1C              ; $C6C7  20 1C FF
    JSR sub_3E_C451              ; $C6CA  20 51 C4
    LDY $22                      ; $C6CD  A4 22
    LDA $C87B,Y                  ; $C6CF  B9 7B C8
    STA $EF                      ; $C6D2  85 EF
    LDA $22                      ; $C6D4  A5 22
    CMP #$03                     ; $C6D6  C9 03
    BEQ loc_3E_C6EB              ; $C6D8  F0 11
    CMP #$01                     ; $C6DA  C9 01
    BNE loc_3E_C6F3              ; $C6DC  D0 15
    LDA $2B                      ; $C6DE  A5 2B
    AND #$0F                     ; $C6E0  29 0F
    TAY                          ; $C6E2  A8
    LDA $CFA1,Y                  ; $C6E3  B9 A1 CF
    STA $EF                      ; $C6E6  85 EF
    JMP loc_3E_C6F3              ; $C6E8  4C F3 C6


loc_3E_C6EB:
    LDA $1F                      ; $C6EB  A5 1F
    BEQ loc_3E_C6F3              ; $C6ED  F0 04
    LDA #$00                     ; $C6EF  A9 00
    STA $EF                      ; $C6F1  85 EF

loc_3E_C6F3:
    LDA $22                      ; $C6F3  A5 22
    CMP #$08                     ; $C6F5  C9 08
    BNE loc_3E_C707              ; $C6F7  D0 0E
    LDA #$00                     ; $C6F9  A9 00
    STA $EF                      ; $C6FB  85 EF
    LDA $F9                      ; $C6FD  A5 F9
    CMP #$06                     ; $C6FF  C9 06
    BCS loc_3E_C707              ; $C701  B0 04
    LDA #$90                     ; $C703  A9 90
    STA $EF                      ; $C705  85 EF

loc_3E_C707:
    LDA $19                      ; $C707  A5 19
    ORA $1A                      ; $C709  05 1A
    BNE loc_3E_C740              ; $C70B  D0 33
    LDA $14                      ; $C70D  A5 14
    AND #$10                     ; $C70F  29 10
    BEQ loc_3E_C740              ; $C711  F0 2D
    LDA $30                      ; $C713  A5 30
    CMP #$02                     ; $C715  C9 02
    BEQ loc_3E_C740              ; $C717  F0 27
    CMP #$05                     ; $C719  C9 05
    BCS loc_3E_C740              ; $C71B  B0 23
    LDA $013C                    ; $C71D  AD 3C 01
    ORA $013D                    ; $C720  0D 3D 01
    ORA $013A                    ; $C723  0D 3A 01
    BNE loc_3E_C740              ; $C726  D0 18
    LDA $0135                    ; $C728  AD 35 01
    BEQ loc_3E_C731              ; $C72B  F0 04
    CMP #$40                     ; $C72D  C9 40
    BNE loc_3E_C740              ; $C72F  D0 0F

loc_3E_C731:
    LDA #$3C                     ; $C731  A9 3C
    STA $F5                      ; $C733  85 F5
    JSR sub_3F_FF37              ; $C735  20 37 FF
    LDA #$30                     ; $C738  A9 30
    JSR sub_3F_F6BE              ; $C73A  20 BE F6
    JSR $9600                    ; $C73D  20 00 96

loc_3E_C740:
    LDX #$3C                     ; $C740  A2 3C
    STX $F5                      ; $C742  86 F5
    INX                          ; $C744  E8
    STX $F6                      ; $C745  86 F6
    JSR sub_3F_FF37              ; $C747  20 37 FF
    JSR $8000                    ; $C74A  20 00 80
    LDX #$3A                     ; $C74D  A2 3A
    STX $F5                      ; $C74F  86 F5
    INX                          ; $C751  E8
    STX $F6                      ; $C752  86 F6
    JSR sub_3F_FF37              ; $C754  20 37 FF
    JSR $8003                    ; $C757  20 03 80
    LDA $22                      ; $C75A  A5 22
    ORA #$20                     ; $C75C  09 20
    STA $F6                      ; $C75E  85 F6
    JSR sub_3F_FF37              ; $C760  20 37 FF
    JSR sub_3E_C96E              ; $C763  20 6E C9
    LDA #$38                     ; $C766  A9 38
    STA $F5                      ; $C768  85 F5
    LDA $22                      ; $C76A  A5 22
    ORA #$20                     ; $C76C  09 20
    STA $F6                      ; $C76E  85 F6
    JSR sub_3F_FF37              ; $C770  20 37 FF
    JSR $8000                    ; $C773  20 00 80
    JSR sub_3F_E0FA              ; $C776  20 FA E0
    JSR sub_3F_E35C              ; $C779  20 5C E3
    JSR sub_3F_E262              ; $C77C  20 62 E2
    JSR sub_3F_E429              ; $C77F  20 29 E4
    JSR sub_3F_E49C              ; $C782  20 9C E4
    JSR sub_3F_E4DD              ; $C785  20 DD E4
    LDA $37                      ; $C788  A5 37
    STA $03A8                    ; $C78A  8D A8 03
    LDA $38                      ; $C78D  A5 38
    STA $03C0                    ; $C78F  8D C0 03
    LDA $22                      ; $C792  A5 22
    ASL A                        ; $C794  0A
    CLC                          ; $C795  18
    ADC $1F                      ; $C796  65 1F
    TAY                          ; $C798  A8
    LDA $FC                      ; $C799  A5 FC
    STA $25                      ; $C79B  85 25
    LDA $0330                    ; $C79D  AD 30 03
    STA $27                      ; $C7A0  85 27
    LDA $0348                    ; $C7A2  AD 48 03
    STA $28                      ; $C7A5  85 28
    CMP $C88B,Y                  ; $C7A7  D9 8B C8
    BNE loc_3E_C7B4              ; $C7AA  D0 08
    LDA $1F                      ; $C7AC  A5 1F
    CMP #$02                     ; $C7AE  C9 02
    BEQ loc_3E_C7B4              ; $C7B0  F0 02
    INC $1F                      ; $C7B2  E6 1F

loc_3E_C7B4:
    LDA #$04                     ; $C7B4  A9 04
    STA $97                      ; $C7B6  85 97
    JSR sub_3E_C421              ; $C7B8  20 21 C4
    JSR sub_3E_DB3A              ; $C7BB  20 3A DB
    LDA #$00                     ; $C7BE  A9 00
    STA $3D                      ; $C7C0  85 3D
    STA $3F                      ; $C7C2  85 3F
    STA $9A                      ; $C7C4  85 9A
    JSR sub_3F_FF1C              ; $C7C6  20 1C FF
    INC $9A                      ; $C7C9  E6 9A
    LDA $30                      ; $C7CB  A5 30
    CMP #$07                     ; $C7CD  C9 07
    BEQ loc_3E_C7DD              ; $C7CF  F0 0C
    CMP #$08                     ; $C7D1  C9 08
    BEQ loc_3E_C7DD              ; $C7D3  F0 08
    CMP #$11                     ; $C7D5  C9 11
    BEQ loc_3E_C7DD              ; $C7D7  F0 04
    CMP #$13                     ; $C7D9  C9 13
    BNE loc_3E_C7F3              ; $C7DB  D0 16

loc_3E_C7DD:
    LDA $0133                    ; $C7DD  AD 33 01
    SEC                          ; $C7E0  38
    SBC #$01                     ; $C7E1  E9 01
    STA $0133                    ; $C7E3  8D 33 01
    LDA $0134                    ; $C7E6  AD 34 01
    SBC #$00                     ; $C7E9  E9 00
    STA $0134                    ; $C7EB  8D 34 01
    ORA $0133                    ; $C7EE  0D 33 01
    BEQ loc_3E_C7F6              ; $C7F1  F0 03

loc_3E_C7F3:
    JMP loc_3E_C6F3              ; $C7F3  4C F3 C6


loc_3E_C7F6:
    LDA $22                      ; $C7F6  A5 22
    STA $0147                    ; $C7F8  8D 47 01
    LDA #$00                     ; $C7FB  A9 00
    STA $9A                      ; $C7FD  85 9A
    STA $06F0                    ; $C7FF  8D F0 06
    STA $06F1                    ; $C802  8D F1 06
    STA $06F2                    ; $C805  8D F2 06
    STA $06F3                    ; $C808  8D F3 06
    LDA $30                      ; $C80B  A5 30
    CMP #$13                     ; $C80D  C9 13
    BEQ loc_3E_C83C              ; $C80F  F0 2B
    LDA #$39                     ; $C811  A9 39
    STA $F5                      ; $C813  85 F5
    JSR sub_3F_FF37              ; $C815  20 37 FF
    LDA $30                      ; $C818  A5 30
    CMP #$07                     ; $C81A  C9 07
    BEQ loc_3E_C82F              ; $C81C  F0 11
    CMP #$11                     ; $C81E  C9 11
    BEQ loc_3E_C835              ; $C820  F0 13

loc_3E_C822:
    LDA #$00                     ; $C822  A9 00
    STA $1F                      ; $C824  85 1F
    JSR sub_3E_C846              ; $C826  20 46 C8
    JSR $8003                    ; $C829  20 03 80
    JMP loc_3E_C541              ; $C82C  4C 41 C5


loc_3E_C82F:
    LDA $A1                      ; $C82F  A5 A1
    BEQ loc_3E_C822              ; $C831  F0 EF
    DEC $A1                      ; $C833  C6 A1

loc_3E_C835:
    LDA #$00                     ; $C835  A9 00
    STA $9A                      ; $C837  85 9A
    JMP loc_3E_C541              ; $C839  4C 41 C5


loc_3E_C83C:
    LDA #$1B                     ; $C83C  A9 1B
    STA $F5                      ; $C83E  85 F5
    JSR sub_3F_FF37              ; $C840  20 37 FF
    JMP $8003                    ; $C843  4C 03 80


sub_3E_C846:
    LDY #$1F                     ; $C846  A0 1F
    LDA #$00                     ; $C848  A9 00
    STA $AC                      ; $C84A  85 AC

loc_3E_C84C:
    STA $0100,Y                  ; $C84C  99 00 01
    DEY                          ; $C84F  88
    BPL loc_3E_C84C              ; $C850  10 FA
    RTS                          ; $C852  60

    .byte $0F,$0F,$2C,$11,$0F,$0F,$30,$37,$00,$01,$03,$04,$02,$07,$05,$06  ; $C853
    .byte $08,$08,$15,$15,$09,$09,$16,$16,$00,$20,$00,$00,$00,$00,$00,$00  ; $C863
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$B8,$00,$00,$00,$00  ; $C873
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$0B,$19,$13,$1A,$0B,$15,$12,$1F  ; $C883
    .byte $0C,$17,$0B,$16,$0E,$17,$10,$19,$07,$FF,$09,$FF,$08,$FF,$10,$FF  ; $C893
    .byte $08,$FF,$0A,$FF,$09,$FF,$FF,$FF,$0B,$04,$42,$01,$19,$07,$00,$02  ; $C8A3
    .byte $13,$07,$54,$01,$1A,$0B,$00,$02,$0B,$06,$43,$00,$15,$08,$00,$00  ; $C8B3
    .byte $12,$05,$44,$03,$1F,$08,$00,$02,$0C,$08,$45,$04,$17,$0B,$49,$06  ; $C8C3
    .byte $0B,$02,$46,$02,$16,$07,$00,$01,$0E,$06,$47,$00,$17,$0A,$00,$03  ; $C8D3
    .byte $10,$06,$48,$00,$19,$08,$00,$02,$07,$02,$4E,$00,$00,$00,$00,$00  ; $C8E3
    .byte $09,$03,$4F,$00,$00,$00,$00,$00,$08,$02,$50,$00,$00,$00,$00,$00  ; $C8F3
    .byte $10,$08,$51,$00,$00,$00,$00,$00,$08,$02,$52,$00,$00,$00,$00,$00  ; $C903
    .byte $0A,$05,$53,$00,$00,$00,$00,$00,$09,$09,$00,$06,$00,$00,$00,$00  ; $C913
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$20,$8E,$03,$38,$39,$3A,$3B,$20  ; $C923
    .byte $AE,$03,$58,$59,$5A,$5B,$20,$CE,$03,$24,$25,$26,$27,$20,$EE,$03  ; $C933
    .byte $34,$35,$00,$19,$21,$0E,$03,$34,$35,$00,$19,$21,$2E,$03,$34,$35  ; $C943
    .byte $00,$19,$21,$4E,$03,$44,$45,$46,$47,$21,$6E,$03,$54,$55,$56,$57  ; $C953
    .byte $23,$CB,$01,$99,$66,$23,$D3,$01,$99,$66,$FF  ; $C963

sub_3E_C96E:
    LDA $2B                      ; $C96E  A5 2B
    AND #$C0                     ; $C970  29 C0
    BNE loc_3E_C9E6              ; $C972  D0 72
    LDA #$01                     ; $C974  A9 01
    STA $A000                    ; $C976  8D 00 A0
    LDA $0330                    ; $C979  AD 30 03
    SEC                          ; $C97C  38
    SBC $FC                      ; $C97D  E5 FC
    STA $10                      ; $C97F  85 10
    LDA $22                      ; $C981  A5 22
    CMP #$0A                     ; $C983  C9 0A
    BNE loc_3E_C9D3              ; $C985  D0 4C
    LDA $2E                      ; $C987  A5 2E
    BNE loc_3E_C98F              ; $C989  D0 04
    LDA $FC                      ; $C98B  A5 FC
    BEQ loc_3E_C9D3              ; $C98D  F0 44

loc_3E_C98F:
    LDA $95                      ; $C98F  A5 95
    AND #$01                     ; $C991  29 01
    BEQ loc_3E_C9E6              ; $C993  F0 51
    STA $11                      ; $C995  85 11
    LDA $10                      ; $C997  A5 10
    SEC                          ; $C999  38
    SBC #$F0                     ; $C99A  E9 F0
    BCC loc_3E_C9B6              ; $C99C  90 18
    BEQ loc_3E_C9B6              ; $C99E  F0 16
    STA $00                      ; $C9A0  85 00
    LDA $0330                    ; $C9A2  AD 30 03
    SEC                          ; $C9A5  38
    SBC $00                      ; $C9A6  E5 00
    STA $0330                    ; $C9A8  8D 30 03
    LDA $0348                    ; $C9AB  AD 48 03
    SBC #$00                     ; $C9AE  E9 00
    STA $0348                    ; $C9B0  8D 48 03
    JMP loc_3E_CA3E              ; $C9B3  4C 3E CA


loc_3E_C9B6:
    LDA #$10                     ; $C9B6  A9 10
    SEC                          ; $C9B8  38
    SBC $10                      ; $C9B9  E5 10
    BCC loc_3E_C9D0              ; $C9BB  90 13
    STA $00                      ; $C9BD  85 00
    LDA $0330                    ; $C9BF  AD 30 03
    CLC                          ; $C9C2  18
    ADC $00                      ; $C9C3  65 00
    STA $0330                    ; $C9C5  8D 30 03
    LDA $0348                    ; $C9C8  AD 48 03
    ADC #$00                     ; $C9CB  69 00
    STA $0348                    ; $C9CD  8D 48 03

loc_3E_C9D0:
    JMP loc_3E_CA3E              ; $C9D0  4C 3E CA


loc_3E_C9D3:
    LDA $0330                    ; $C9D3  AD 30 03
    SEC                          ; $C9D6  38
    SBC $27                      ; $C9D7  E5 27
    STA $11                      ; $C9D9  85 11
    LDA $0348                    ; $C9DB  AD 48 03
    SBC $28                      ; $C9DE  E5 28
    ORA $11                      ; $C9E0  05 11
    BCC loc_3E_C9E9              ; $C9E2  90 05
    BNE loc_3E_CA2E              ; $C9E4  D0 48

loc_3E_C9E6:
    JMP loc_3E_CC13              ; $C9E6  4C 13 CC


loc_3E_C9E9:
    LDA $10                      ; $C9E9  A5 10
    CMP #$81                     ; $C9EB  C9 81
    BCS loc_3E_C9E6              ; $C9ED  B0 F7
    LDA $11                      ; $C9EF  A5 11
    EOR #$FF                     ; $C9F1  49 FF
    ADC #$01                     ; $C9F3  69 01
    CMP #$08                     ; $C9F5  C9 08
    BCC loc_3E_C9FB              ; $C9F7  90 02
    LDA #$08                     ; $C9F9  A9 08

loc_3E_C9FB:
    STA $11                      ; $C9FB  85 11
    LDA $FC                      ; $C9FD  A5 FC
    SEC                          ; $C9FF  38
    SBC $11                      ; $CA00  E5 11
    STA $FC                      ; $CA02  85 FC
    PHP                          ; $CA04  08
    LDA $F9                      ; $CA05  A5 F9
    STA $11                      ; $CA07  85 11
    SBC #$00                     ; $CA09  E9 00
    STA $F9                      ; $CA0B  85 F9
    PLP                          ; $CA0D  28
    LDA $2E                      ; $CA0E  A5 2E
    SBC #$00                     ; $CA10  E9 00
    STA $2E                      ; $CA12  85 2E
    BCS loc_3E_CA2A              ; $CA14  B0 14
    LDA #$00                     ; $CA16  A9 00
    STA $FC                      ; $CA18  85 FC
    STA $2E                      ; $CA1A  85 2E
    LDA $11                      ; $CA1C  A5 11
    STA $F9                      ; $CA1E  85 F9
    LDA #$10                     ; $CA20  A9 10
    CMP $0330                    ; $CA22  CD 30 03
    BCC loc_3E_CA2A              ; $CA25  90 03
    STA $0330                    ; $CA27  8D 30 03

loc_3E_CA2A:
    LDA #$02                     ; $CA2A  A9 02
    BNE loc_3E_CA79              ; $CA2C  D0 4B

loc_3E_CA2E:
    BEQ loc_3E_CA76              ; $CA2E  F0 46
    LDA $10                      ; $CA30  A5 10
    CMP #$80                     ; $CA32  C9 80
    BCC loc_3E_CA76              ; $CA34  90 40
    LDA #$08                     ; $CA36  A9 08
    CMP $11                      ; $CA38  C5 11
    BCS loc_3E_CA3E              ; $CA3A  B0 02
    STA $11                      ; $CA3C  85 11

loc_3E_CA3E:
    LDA $FC                      ; $CA3E  A5 FC
    CLC                          ; $CA40  18
    ADC $11                      ; $CA41  65 11
    STA $FC                      ; $CA43  85 FC
    PHP                          ; $CA45  08
    LDA $F9                      ; $CA46  A5 F9
    ADC #$00                     ; $CA48  69 00
    STA $F9                      ; $CA4A  85 F9
    PLP                          ; $CA4C  28
    LDA $2E                      ; $CA4D  A5 2E
    ADC #$00                     ; $CA4F  69 00
    STA $2E                      ; $CA51  85 2E
    CMP $2D                      ; $CA53  C5 2D
    BNE loc_3E_CA72              ; $CA55  D0 1B
    LDA $3F                      ; $CA57  A5 3F
    CMP #$50                     ; $CA59  C9 50
    BEQ loc_3E_CA6B              ; $CA5B  F0 0E
    LDA #$00                     ; $CA5D  A9 00
    STA $FC                      ; $CA5F  85 FC
    LDA #$F0                     ; $CA61  A9 F0
    CMP $0330                    ; $CA63  CD 30 03
    BCS loc_3E_CA72              ; $CA66  B0 0A
    STA $0330                    ; $CA68  8D 30 03

loc_3E_CA6B:
    LDA #$00                     ; $CA6B  A9 00
    STA $FC                      ; $CA6D  85 FC
    JMP loc_3E_CAFF              ; $CA6F  4C FF CA


loc_3E_CA72:
    LDA #$01                     ; $CA72  A9 01
    BNE loc_3E_CA79              ; $CA74  D0 03

loc_3E_CA76:
    JMP loc_3E_CC13              ; $CA76  4C 13 CC


loc_3E_CA79:
    STA $10                      ; $CA79  85 10
    STA $2F                      ; $CA7B  85 2F
    LDA $FC                      ; $CA7D  A5 FC
    SEC                          ; $CA7F  38
    SBC $25                      ; $CA80  E5 25
    BPL loc_3E_CA89              ; $CA82  10 05
    EOR #$FF                     ; $CA84  49 FF
    CLC                          ; $CA86  18
    ADC #$01                     ; $CA87  69 01

loc_3E_CA89:
    STA $11                      ; $CA89  85 11
    BEQ loc_3E_CA76              ; $CA8B  F0 E9
    LDA $10                      ; $CA8D  A5 10
    AND #$01                     ; $CA8F  29 01
    BEQ loc_3E_CA98              ; $CA91  F0 05
    LDA $25                      ; $CA93  A5 25
    JMP loc_3E_CA9C              ; $CA95  4C 9C CA


loc_3E_CA98:
    LDA $25                      ; $CA98  A5 25
    EOR #$FF                     ; $CA9A  49 FF

loc_3E_CA9C:
    AND #$07                     ; $CA9C  29 07
    CLC                          ; $CA9E  18
    ADC $11                      ; $CA9F  65 11
    LSR A                        ; $CAA1  4A
    LSR A                        ; $CAA2  4A
    LSR A                        ; $CAA3  4A
    BEQ loc_3E_CACC              ; $CAA4  F0 26
    LDA $10                      ; $CAA6  A5 10
    CMP $23                      ; $CAA8  C5 23
    STA $23                      ; $CAAA  85 23
    PHP                          ; $CAAC  08
    AND #$01                     ; $CAAD  29 01
    TAY                          ; $CAAF  A8
    PLP                          ; $CAB0  28
    BNE loc_3E_CAC1              ; $CAB1  D0 0E
    LDA $24                      ; $CAB3  A5 24
    CLC                          ; $CAB5  18
    ADC $CBFD,Y                  ; $CAB6  79 FD CB
    CMP #$20                     ; $CAB9  C9 20
    AND #$1F                     ; $CABB  29 1F
    STA $24                      ; $CABD  85 24
    BCC loc_3E_CAC9              ; $CABF  90 08

loc_3E_CAC1:
    LDA $2A                      ; $CAC1  A5 2A
    CLC                          ; $CAC3  18
    ADC $CBFD,Y                  ; $CAC4  79 FD CB
    STA $2A                      ; $CAC7  85 2A

loc_3E_CAC9:
    JSR sub_3E_CFB1              ; $CAC9  20 B1 CF

loc_3E_CACC:
    JMP loc_3E_CC13              ; $CACC  4C 13 CC


loc_3E_CACF:
    LDX #$00                     ; $CACF  A2 00

loc_3E_CAD1:
    LDA $B540,X                  ; $CAD1  BD 40 B5
    BMI loc_3E_CACC              ; $CAD4  30 F6
    CMP $F9                      ; $CAD6  C5 F9
    BEQ loc_3E_CAE0              ; $CAD8  F0 06
    INX                          ; $CADA  E8
    INX                          ; $CADB  E8
    INX                          ; $CADC  E8
    INX                          ; $CADD  E8
    BNE loc_3E_CAD1              ; $CADE  D0 F1

loc_3E_CAE0:
    LDA $B541,X                  ; $CAE0  BD 41 B5
    AND #$20                     ; $CAE3  29 20
    BEQ loc_3E_CACC              ; $CAE5  F0 E5
    LDY $B543,X                  ; $CAE7  BC 43 B5
    STY $2A                      ; $CAEA  84 2A
    LDA $B300,Y                  ; $CAEC  B9 00 B3
    STA $9E                      ; $CAEF  85 9E
    STA $9F                      ; $CAF1  85 9F
    DEY                          ; $CAF3  88
    STY $F9                      ; $CAF4  84 F9
    STY $0348                    ; $CAF6  8C 48 03
    LDY $B542,X                  ; $CAF9  BC 42 B5
    JMP loc_3E_CB1B              ; $CAFC  4C 1B CB


loc_3E_CAFF:
    LDA $2B                      ; $CAFF  A5 2B
    AND #$0F                     ; $CB01  29 0F
    TAY                          ; $CB03  A8
    LDA $30                      ; $CB04  A5 30
    CMP #$04                     ; $CB06  C9 04
    BNE loc_3E_CB11              ; $CB08  D0 07
    LDA $B531,Y                  ; $CB0A  B9 31 B5
    AND #$10                     ; $CB0D  29 10
    BNE loc_3E_CACC              ; $CB0F  D0 BB

loc_3E_CB11:
    LDA $B531,Y                  ; $CB11  B9 31 B5
    AND #$E0                     ; $CB14  29 E0
    CMP #$20                     ; $CB16  C9 20
    BNE loc_3E_CACF              ; $CB18  D0 B5
    INY                          ; $CB1A  C8

loc_3E_CB1B:
    STY $00                      ; $CB1B  84 00
    LDA $B530,Y                  ; $CB1D  B9 30 B5
    AND #$30                     ; $CB20  29 30
    ORA $00                      ; $CB22  05 00
    STA $2B                      ; $CB24  85 2B
    LDA $B530,Y                  ; $CB26  B9 30 B5
    AND #$0F                     ; $CB29  29 0F
    STA $2D                      ; $CB2B  85 2D
    LDA #$00                     ; $CB2D  A9 00
    STA $2E                      ; $CB2F  85 2E
    LDA #$01                     ; $CB31  A9 01
    STA $23                      ; $CB33  85 23
    STA $2F                      ; $CB35  85 2F
    LDA $2B                      ; $CB37  A5 2B
    AND #$0F                     ; $CB39  29 0F
    TAY                          ; $CB3B  A8
    LDA $B530,Y                  ; $CB3C  B9 30 B5
    AND #$10                     ; $CB3F  29 10
    BEQ loc_3E_CB68              ; $CB41  F0 25
    LDA $0135                    ; $CB43  AD 35 01
    AND #$7F                     ; $CB46  29 7F
    BEQ loc_3E_CB59              ; $CB48  F0 0F
    LDA #$00                     ; $CB4A  A9 00
    STA $0136                    ; $CB4C  8D 36 01
    LDA #$30                     ; $CB4F  A9 30
    STA $0137                    ; $CB51  8D 37 01
    LDA #$80                     ; $CB54  A9 80
    STA $0135                    ; $CB56  8D 35 01

loc_3E_CB59:
    LDA $0528                    ; $CB59  AD 28 05
    AND #$DF                     ; $CB5C  29 DF
    STA $0528                    ; $CB5E  8D 28 05
    LDA #$00                     ; $CB61  A9 00
    STA $EF                      ; $CB63  85 EF
    JSR sub_3F_E682              ; $CB65  20 82 E6

loc_3E_CB68:
    JSR sub_3E_CEE1              ; $CB68  20 E1 CE
    JSR sub_3E_C438              ; $CB6B  20 38 C4

loc_3E_CB6E:
    LDA $FC                      ; $CB6E  A5 FC
    CLC                          ; $CB70  18
    ADC #$02                     ; $CB71  69 02
    STA $FC                      ; $CB73  85 FC
    LDA $F9                      ; $CB75  A5 F9
    ADC #$00                     ; $CB77  69 00
    STA $F9                      ; $CB79  85 F9
    LDA $0318                    ; $CB7B  AD 18 03
    CLC                          ; $CB7E  18
    ADC #$80                     ; $CB7F  69 80
    STA $0318                    ; $CB81  8D 18 03
    LDA $0330                    ; $CB84  AD 30 03
    ADC #$00                     ; $CB87  69 00
    STA $0330                    ; $CB89  8D 30 03
    LDA $0348                    ; $CB8C  AD 48 03
    ADC #$00                     ; $CB8F  69 00
    STA $0348                    ; $CB91  8D 48 03
    LDA $FC                      ; $CB94  A5 FC
    SEC                          ; $CB96  38
    SBC $25                      ; $CB97  E5 25
    STA $11                      ; $CB99  85 11
    BEQ loc_3E_CBB8              ; $CB9B  F0 1B
    LDA $25                      ; $CB9D  A5 25
    AND #$07                     ; $CB9F  29 07
    CLC                          ; $CBA1  18
    ADC $11                      ; $CBA2  65 11
    LSR A                        ; $CBA4  4A
    LSR A                        ; $CBA5  4A
    LSR A                        ; $CBA6  4A
    BEQ loc_3E_CBB8              ; $CBA7  F0 0F
    INC $24                      ; $CBA9  E6 24
    LDA $24                      ; $CBAB  A5 24
    AND #$1F                     ; $CBAD  29 1F
    STA $24                      ; $CBAF  85 24
    BNE loc_3E_CBB5              ; $CBB1  D0 02
    INC $2A                      ; $CBB3  E6 2A

loc_3E_CBB5:
    JSR sub_3E_CFB1              ; $CBB5  20 B1 CF

loc_3E_CBB8:
    JSR sub_3E_DABB              ; $CBB8  20 BB DA
    LDA $FC                      ; $CBBB  A5 FC
    STA $25                      ; $CBBD  85 25
    LDA #$04                     ; $CBBF  A9 04
    STA $97                      ; $CBC1  85 97
    JSR sub_3E_C421              ; $CBC3  20 21 C4
    LDA $F6                      ; $CBC6  A5 F6
    PHA                          ; $CBC8  48
    JSR sub_3E_DB3A              ; $CBC9  20 3A DB
    PLA                          ; $CBCC  68
    STA $F6                      ; $CBCD  85 F6
    JSR sub_3F_FF37              ; $CBCF  20 37 FF
    LDA #$01                     ; $CBD2  A9 01
    STA $0300                    ; $CBD4  8D 00 03
    LDA #$00                     ; $CBD7  A9 00
    STA $9A                      ; $CBD9  85 9A
    JSR sub_3F_FF1C              ; $CBDB  20 1C FF
    INC $9A                      ; $CBDE  E6 9A
    LDA $FC                      ; $CBE0  A5 FC
    BNE loc_3E_CB6E              ; $CBE2  D0 8A
    LDA $2B                      ; $CBE4  A5 2B
    AND #$0F                     ; $CBE6  29 0F
    TAY                          ; $CBE8  A8
    LDA $B530,Y                  ; $CBE9  B9 30 B5
    AND #$10                     ; $CBEC  29 10
    BEQ loc_3E_CBFC              ; $CBEE  F0 0C
    LDY $22                      ; $CBF0  A4 22
    LDA $CC03,Y                  ; $CBF2  B9 03 CC
    CMP $F9                      ; $CBF5  C5 F9
    BEQ loc_3E_CBFC              ; $CBF7  F0 03
    JSR sub_3F_E751              ; $CBF9  20 51 E7

loc_3E_CBFC:
    RTS                          ; $CBFC  60

    .byte $FF,$01,$1D,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$12,$10  ; $CBFD
    .byte $00,$13,$14,$15,$00,$06  ; $CC0D

loc_3E_CC13:
    LDA $FC                      ; $CC13  A5 FC
    BNE loc_3E_CC28              ; $CC15  D0 11
    LDA #$10                     ; $CC17  A9 10
    CMP $0330                    ; $CC19  CD 30 03
    BCS loc_3E_CC25              ; $CC1C  B0 07
    LDA #$F0                     ; $CC1E  A9 F0
    CMP $0330                    ; $CC20  CD 30 03
    BCS loc_3E_CC28              ; $CC23  B0 03

loc_3E_CC25:
    STA $0330                    ; $CC25  8D 30 03

loc_3E_CC28:
    LDA $0390                    ; $CC28  AD 90 03
    BNE loc_3E_CBFC              ; $CC2B  D0 CF
    LDA #$04                     ; $CC2D  A9 04
    STA $01                      ; $CC2F  85 01
    LDA $0378                    ; $CC31  AD 78 03
    CMP #$E8                     ; $CC34  C9 E8
    BCS loc_3E_CC46              ; $CC36  B0 0E
    CMP #$08                     ; $CC38  C9 08
    BCS loc_3E_CBFC              ; $CC3A  B0 C0
    LDA $30                      ; $CC3C  A5 30
    CMP #$03                     ; $CC3E  C9 03
    BNE loc_3E_CBFC              ; $CC40  D0 BA
    LDA #$08                     ; $CC42  A9 08
    STA $01                      ; $CC44  85 01

loc_3E_CC46:
    LDA $2B                      ; $CC46  A5 2B
    AND #$C0                     ; $CC48  29 C0
    BNE loc_3E_CC4F              ; $CC4A  D0 03
    JMP loc_3E_CD24              ; $CC4C  4C 24 CD


loc_3E_CC4F:
    LDA $01                      ; $CC4F  A5 01
    AND #$0C                     ; $CC51  29 0C
    BEQ loc_3E_CCCF              ; $CC53  F0 7A
    STA $00                      ; $CC55  85 00
    ASL A                        ; $CC57  0A
    ASL A                        ; $CC58  0A
    ASL A                        ; $CC59  0A
    ASL A                        ; $CC5A  0A
    AND $2B                      ; $CC5B  25 2B
    BEQ loc_3E_CC99              ; $CC5D  F0 3A
    LDA $2E                      ; $CC5F  A5 2E
    CMP $2D                      ; $CC61  C5 2D
    BEQ loc_3E_CC79              ; $CC63  F0 14
    INC $2E                      ; $CC65  E6 2E

loc_3E_CC67:
    INC $2A                      ; $CC67  E6 2A
    INC $F9                      ; $CC69  E6 F9
    INC $0348                    ; $CC6B  EE 48 03
    LDA $00                      ; $CC6E  A5 00
    STA $23                      ; $CC70  85 23
    LDA #$01                     ; $CC72  A9 01
    STA $2F                      ; $CC74  85 2F
    JMP loc_3E_CDD5              ; $CC76  4C D5 CD


loc_3E_CC79:
    INC $2B                      ; $CC79  E6 2B
    LDA $2B                      ; $CC7B  A5 2B
    AND #$0F                     ; $CC7D  29 0F
    STA $2B                      ; $CC7F  85 2B
    TAY                          ; $CC81  A8
    LDA $B530,Y                  ; $CC82  B9 30 B5
    AND #$F0                     ; $CC85  29 F0
    ORA $2B                      ; $CC87  05 2B
    STA $2B                      ; $CC89  85 2B
    LDA #$00                     ; $CC8B  A9 00
    STA $2E                      ; $CC8D  85 2E
    LDA $B530,Y                  ; $CC8F  B9 30 B5
    AND #$0F                     ; $CC92  29 0F
    STA $2D                      ; $CC94  85 2D
    JMP loc_3E_CC67              ; $CC96  4C 67 CC


loc_3E_CC99:
    LDA $2E                      ; $CC99  A5 2E
    BEQ loc_3E_CCB1              ; $CC9B  F0 14
    DEC $2E                      ; $CC9D  C6 2E

loc_3E_CC9F:
    DEC $2A                      ; $CC9F  C6 2A
    DEC $F9                      ; $CCA1  C6 F9
    DEC $0348                    ; $CCA3  CE 48 03
    LDA $00                      ; $CCA6  A5 00
    STA $23                      ; $CCA8  85 23
    LDA #$02                     ; $CCAA  A9 02
    STA $2F                      ; $CCAC  85 2F
    JMP loc_3E_CDD5              ; $CCAE  4C D5 CD


loc_3E_CCB1:
    DEC $2B                      ; $CCB1  C6 2B
    LDA $2B                      ; $CCB3  A5 2B
    AND #$0F                     ; $CCB5  29 0F
    STA $2B                      ; $CCB7  85 2B
    TAY                          ; $CCB9  A8
    LDA $B530,Y                  ; $CCBA  B9 30 B5
    AND #$F0                     ; $CCBD  29 F0
    ORA $2B                      ; $CCBF  05 2B
    STA $2B                      ; $CCC1  85 2B
    LDA $B530,Y                  ; $CCC3  B9 30 B5
    AND #$0F                     ; $CCC6  29 0F
    STA $2E                      ; $CCC8  85 2E
    STA $2D                      ; $CCCA  85 2D
    JMP loc_3E_CC9F              ; $CCCC  4C 9F CC


loc_3E_CCCF:
    RTS                          ; $CCCF  60


loc_3E_CCD0:
    LDY #$00                     ; $CCD0  A0 00

loc_3E_CCD2:
    LDA $B540,Y                  ; $CCD2  B9 40 B5
    BMI loc_3E_CCCF              ; $CCD5  30 F8
    CMP $F9                      ; $CCD7  C5 F9
    BEQ loc_3E_CCE1              ; $CCD9  F0 06
    INY                          ; $CCDB  C8
    INY                          ; $CCDC  C8
    INY                          ; $CCDD  C8
    INY                          ; $CCDE  C8
    BNE loc_3E_CCD2              ; $CCDF  D0 F1

loc_3E_CCE1:
    LDA $01                      ; $CCE1  A5 01
    ASL A                        ; $CCE3  0A
    ASL A                        ; $CCE4  0A
    ASL A                        ; $CCE5  0A
    ASL A                        ; $CCE6  0A
    AND $B541,Y                  ; $CCE7  39 41 B5
    BEQ loc_3E_CCCF              ; $CCEA  F0 E3
    LDX $B542,Y                  ; $CCEC  BE 42 B5
    LDA $B530,X                  ; $CCEF  BD 30 B5
    PHA                          ; $CCF2  48
    AND #$F0                     ; $CCF3  29 F0
    ORA $B542,Y                  ; $CCF5  19 42 B5
    STA $2B                      ; $CCF8  85 2B
    PLA                          ; $CCFA  68
    AND #$0F                     ; $CCFB  29 0F
    STA $2D                      ; $CCFD  85 2D
    LDA #$00                     ; $CCFF  A9 00
    STA $2E                      ; $CD01  85 2E
    LDX $B543,Y                  ; $CD03  BE 43 B5
    STX $2A                      ; $CD06  86 2A
    STX $F9                      ; $CD08  86 F9
    STX $0348                    ; $CD0A  8E 48 03
    LDA $B300,X                  ; $CD0D  BD 00 B3
    STA $9E                      ; $CD10  85 9E
    STA $9F                      ; $CD12  85 9F
    LDA #$01                     ; $CD14  A9 01
    STA $2F                      ; $CD16  85 2F
    LDA $01                      ; $CD18  A5 01
    STA $23                      ; $CD1A  85 23
    LDA #$00                     ; $CD1C  A9 00
    STA $A000                    ; $CD1E  8D 00 A0
    JMP loc_3E_CDD5              ; $CD21  4C D5 CD


loc_3E_CD24:
    LDA $FC                      ; $CD24  A5 FC
    BNE loc_3E_CCCF              ; $CD26  D0 A7
    LDA $2B                      ; $CD28  A5 2B
    AND #$0F                     ; $CD2A  29 0F
    TAY                          ; $CD2C  A8
    LDA $2D                      ; $CD2D  A5 2D
    BNE loc_3E_CD3E              ; $CD2F  D0 0D
    LDA $B531,Y                  ; $CD31  B9 31 B5
    LSR A                        ; $CD34  4A
    LSR A                        ; $CD35  4A
    LSR A                        ; $CD36  4A
    LSR A                        ; $CD37  4A
    AND $01                      ; $CD38  25 01
    BNE loc_3E_CD46              ; $CD3A  D0 0A
    BEQ loc_3E_CD65              ; $CD3C  F0 27

loc_3E_CD3E:
    LDA $2E                      ; $CD3E  A5 2E
    BEQ loc_3E_CD65              ; $CD40  F0 23
    CMP $2D                      ; $CD42  C5 2D
    BNE loc_3E_CCCF              ; $CD44  D0 89

loc_3E_CD46:
    INY                          ; $CD46  C8
    LDA $B530,Y                  ; $CD47  B9 30 B5
    AND #$C0                     ; $CD4A  29 C0
    BEQ loc_3E_CCD0              ; $CD4C  F0 82
    STA $10                      ; $CD4E  85 10
    LDA #$00                     ; $CD50  A9 00
    STA $11                      ; $CD52  85 11
    LDA $B530,Y                  ; $CD54  B9 30 B5
    AND #$0F                     ; $CD57  29 0F
    STA $12                      ; $CD59  85 12
    LDA #$01                     ; $CD5B  A9 01
    STA $13                      ; $CD5D  85 13
    LDA #$01                     ; $CD5F  A9 01
    STA $02                      ; $CD61  85 02
    BNE loc_3E_CD92              ; $CD63  D0 2D

loc_3E_CD65:
    LDA $B530,Y                  ; $CD65  B9 30 B5
    DEY                          ; $CD68  88
    BMI loc_3E_CDD4              ; $CD69  30 69
    AND #$C0                     ; $CD6B  29 C0
    BNE loc_3E_CD76              ; $CD6D  D0 07
    LDA $B530,Y                  ; $CD6F  B9 30 B5
    AND #$20                     ; $CD72  29 20
    BNE loc_3E_CDA2              ; $CD74  D0 2C

loc_3E_CD76:
    LDA $B530,Y                  ; $CD76  B9 30 B5
    AND #$C0                     ; $CD79  29 C0
    BEQ loc_3E_CDA2              ; $CD7B  F0 25
    EOR #$C0                     ; $CD7D  49 C0
    STA $10                      ; $CD7F  85 10
    LDA $B530,Y                  ; $CD81  B9 30 B5
    AND #$0F                     ; $CD84  29 0F
    STA $11                      ; $CD86  85 11
    STA $12                      ; $CD88  85 12
    LDA #$FF                     ; $CD8A  A9 FF
    STA $13                      ; $CD8C  85 13
    LDA #$02                     ; $CD8E  A9 02
    STA $02                      ; $CD90  85 02

loc_3E_CD92:
    LDA $01                      ; $CD92  A5 01
    AND #$0C                     ; $CD94  29 0C
    BEQ loc_3E_CDD4              ; $CD96  F0 3C
    STA $00                      ; $CD98  85 00
    ASL A                        ; $CD9A  0A
    ASL A                        ; $CD9B  0A
    ASL A                        ; $CD9C  0A
    ASL A                        ; $CD9D  0A
    AND $10                      ; $CD9E  25 10
    BNE loc_3E_CDA5              ; $CDA0  D0 03

loc_3E_CDA2:
    JMP loc_3E_CCD0              ; $CDA2  4C D0 CC


loc_3E_CDA5:
    STY $10                      ; $CDA5  84 10
    LDA $B530,Y                  ; $CDA7  B9 30 B5
    AND #$F0                     ; $CDAA  29 F0
    ORA $10                      ; $CDAC  05 10
    STA $2B                      ; $CDAE  85 2B
    LDA $11                      ; $CDB0  A5 11
    STA $2E                      ; $CDB2  85 2E
    LDA $12                      ; $CDB4  A5 12
    STA $2D                      ; $CDB6  85 2D
    LDA $F9                      ; $CDB8  A5 F9
    CLC                          ; $CDBA  18
    ADC $13                      ; $CDBB  65 13
    STA $F9                      ; $CDBD  85 F9
    STA $2A                      ; $CDBF  85 2A
    STA $0348                    ; $CDC1  8D 48 03
    LDA $00                      ; $CDC4  A5 00
    STA $23                      ; $CDC6  85 23
    LDA $02                      ; $CDC8  A5 02
    STA $2F                      ; $CDCA  85 2F
    LDA #$00                     ; $CDCC  A9 00
    STA $A000                    ; $CDCE  8D 00 A0
    JMP loc_3E_CDD5              ; $CDD1  4C D5 CD


loc_3E_CDD4:
    RTS                          ; $CDD4  60


loc_3E_CDD5:
    LDA $23                      ; $CDD5  A5 23
    AND #$04                     ; $CDD7  29 04
    LSR A                        ; $CDD9  4A
    LSR A                        ; $CDDA  4A
    STA $11                      ; $CDDB  85 11
    TAX                          ; $CDDD  AA
    LDA $CBFF,X                  ; $CDDE  BD FF CB
    STA $24                      ; $CDE1  85 24
    JSR sub_3E_CEE1              ; $CDE3  20 E1 CE
    JSR sub_3E_C438              ; $CDE6  20 38 C4
    LDA #$00                     ; $CDE9  A9 00
    STA $013E                    ; $CDEB  8D 3E 01

loc_3E_CDEE:
    LDA $23                      ; $CDEE  A5 23
    AND #$04                     ; $CDF0  29 04
    BEQ loc_3E_CE1E              ; $CDF2  F0 2A
    LDA $FA                      ; $CDF4  A5 FA
    CLC                          ; $CDF6  18
    ADC #$02                     ; $CDF7  69 02
    STA $FA                      ; $CDF9  85 FA
    CMP #$F0                     ; $CDFB  C9 F0
    BCC loc_3E_CE03              ; $CDFD  90 04
    ADC #$0F                     ; $CDFF  69 0F
    STA $FA                      ; $CE01  85 FA

loc_3E_CE03:
    LDA $0360                    ; $CE03  AD 60 03
    SEC                          ; $CE06  38
    SBC #$C0                     ; $CE07  E9 C0
    STA $0360                    ; $CE09  8D 60 03
    LDA $0378                    ; $CE0C  AD 78 03
    SBC #$01                     ; $CE0F  E9 01
    STA $0378                    ; $CE11  8D 78 03
    BCS loc_3E_CE45              ; $CE14  B0 2F
    SBC #$0F                     ; $CE16  E9 0F
    STA $0378                    ; $CE18  8D 78 03
    JMP loc_3E_CE45              ; $CE1B  4C 45 CE


loc_3E_CE1E:
    LDA $FA                      ; $CE1E  A5 FA
    SEC                          ; $CE20  38
    SBC #$02                     ; $CE21  E9 02
    STA $FA                      ; $CE23  85 FA
    BCS loc_3E_CE2B              ; $CE25  B0 04
    SBC #$0F                     ; $CE27  E9 0F
    STA $FA                      ; $CE29  85 FA

loc_3E_CE2B:
    LDA $0360                    ; $CE2B  AD 60 03
    CLC                          ; $CE2E  18
    ADC #$C0                     ; $CE2F  69 C0
    STA $0360                    ; $CE31  8D 60 03
    LDA $0378                    ; $CE34  AD 78 03
    ADC #$01                     ; $CE37  69 01
    STA $0378                    ; $CE39  8D 78 03
    CMP #$F0                     ; $CE3C  C9 F0
    BCC loc_3E_CE45              ; $CE3E  90 05
    ADC #$0F                     ; $CE40  69 0F
    STA $0378                    ; $CE42  8D 78 03

loc_3E_CE45:
    JSR sub_3E_CE97              ; $CE45  20 97 CE
    JSR sub_3E_DABB              ; $CE48  20 BB DA
    LDA $11                      ; $CE4B  A5 11
    PHA                          ; $CE4D  48
    LDA #$04                     ; $CE4E  A9 04
    STA $97                      ; $CE50  85 97
    JSR sub_3E_C421              ; $CE52  20 21 C4
    LDA $F6                      ; $CE55  A5 F6
    PHA                          ; $CE57  48
    JSR sub_3E_DB3A              ; $CE58  20 3A DB
    PLA                          ; $CE5B  68
    STA $F6                      ; $CE5C  85 F6
    JSR sub_3F_FF37              ; $CE5E  20 37 FF
    LDA #$01                     ; $CE61  A9 01
    STA $0300                    ; $CE63  8D 00 03
    LDA #$00                     ; $CE66  A9 00
    STA $9A                      ; $CE68  85 9A
    JSR sub_3F_FF1C              ; $CE6A  20 1C FF
    PLA                          ; $CE6D  68
    STA $11                      ; $CE6E  85 11
    INC $9A                      ; $CE70  E6 9A
    LDA $FA                      ; $CE72  A5 FA
    STA $26                      ; $CE74  85 26
    BEQ loc_3E_CE7B              ; $CE76  F0 03
    JMP loc_3E_CDEE              ; $CE78  4C EE CD


loc_3E_CE7B:
    LDA $2B                      ; $CE7B  A5 2B
    AND #$20                     ; $CE7D  29 20
    BEQ loc_3E_CE96              ; $CE7F  F0 15
    LDA $2B                      ; $CE81  A5 2B
    AND #$2F                     ; $CE83  29 2F
    STA $2B                      ; $CE85  85 2B
    LDA #$00                     ; $CE87  A9 00
    STA $24                      ; $CE89  85 24
    INC $2A                      ; $CE8B  E6 2A
    LDA #$01                     ; $CE8D  A9 01
    STA $23                      ; $CE8F  85 23
    LDA #$01                     ; $CE91  A9 01
    STA $A000                    ; $CE93  8D 00 A0

loc_3E_CE96:
    RTS                          ; $CE96  60


sub_3E_CE97:
    LDA $FA                      ; $CE97  A5 FA
    SEC                          ; $CE99  38
    SBC $26                      ; $CE9A  E5 26
    BPL loc_3E_CEA3              ; $CE9C  10 05
    EOR #$FF                     ; $CE9E  49 FF
    CLC                          ; $CEA0  18
    ADC #$01                     ; $CEA1  69 01

loc_3E_CEA3:
    AND #$0F                     ; $CEA3  29 0F
    STA $10                      ; $CEA5  85 10
    BEQ loc_3E_CE96              ; $CEA7  F0 ED
    LDA $23                      ; $CEA9  A5 23
    AND #$04                     ; $CEAB  29 04
    BEQ loc_3E_CEB4              ; $CEAD  F0 05
    LDA $26                      ; $CEAF  A5 26
    JMP loc_3E_CEB8              ; $CEB1  4C B8 CE


loc_3E_CEB4:
    LDA $26                      ; $CEB4  A5 26
    EOR #$FF                     ; $CEB6  49 FF

loc_3E_CEB8:
    AND #$07                     ; $CEB8  29 07
    CLC                          ; $CEBA  18
    ADC $10                      ; $CEBB  65 10
    LSR A                        ; $CEBD  4A
    LSR A                        ; $CEBE  4A
    LSR A                        ; $CEBF  4A
    BEQ loc_3E_CE96              ; $CEC0  F0 D4
    LDX $11                      ; $CEC2  A6 11
    LDA $24                      ; $CEC4  A5 24
    AND #$01                     ; $CEC6  29 01
    CMP $CC01,X                  ; $CEC8  DD 01 CC
    BNE loc_3E_CED3              ; $CECB  D0 06
    JSR sub_3E_D052              ; $CECD  20 52 D0
    JMP loc_3E_CED6              ; $CED0  4C D6 CE


loc_3E_CED3:
    JSR sub_3E_D143              ; $CED3  20 43 D1

loc_3E_CED6:
    LDX $11                      ; $CED6  A6 11
    LDA $24                      ; $CED8  A5 24
    CLC                          ; $CEDA  18
    ADC $CBFD,X                  ; $CEDB  7D FD CB
    STA $24                      ; $CEDE  85 24
    RTS                          ; $CEE0  60


sub_3E_CEE1:
    LDA $2B                      ; $CEE1  A5 2B
    AND #$0F                     ; $CEE3  29 0F
    TAY                          ; $CEE5  A8
    LDA $B560,Y                  ; $CEE6  B9 60 B5
    PHA                          ; $CEE9  48
    LDA $B550,Y                  ; $CEEA  B9 50 B5
    BEQ loc_3E_CF28              ; $CEED  F0 39
    ASL A                        ; $CEEF  0A
    ASL A                        ; $CEF0  0A
    STA $00                      ; $CEF1  85 00
    ASL A                        ; $CEF3  0A
    ASL A                        ; $CEF4  0A
    ADC $00                      ; $CEF5  65 00
    TAY                          ; $CEF7  A8
    LDX #$00                     ; $CEF8  A2 00

loc_3E_CEFA:
    LDA $B590,Y                  ; $CEFA  B9 90 B5
    STA $0620,X                  ; $CEFD  9D 20 06
    LDA $0135                    ; $CF00  AD 35 01
    BNE loc_3E_CF0B              ; $CF03  D0 06
    LDA $B590,Y                  ; $CF05  B9 90 B5
    STA $0600,X                  ; $CF08  9D 00 06

loc_3E_CF0B:
    CPX #$04                     ; $CF0B  E0 04
    BCS loc_3E_CF22              ; $CF0D  B0 13
    LDA $B5A0,Y                  ; $CF0F  B9 A0 B5
    CMP $06F0,X                  ; $CF12  DD F0 06
    BEQ loc_3E_CF22              ; $CF15  F0 0B
    STA $06F0,X                  ; $CF17  9D F0 06
    LDA #$00                     ; $CF1A  A9 00
    STA $06F4,X                  ; $CF1C  9D F4 06
    STA $06F8,X                  ; $CF1F  9D F8 06

loc_3E_CF22:
    INY                          ; $CF22  C8
    INX                          ; $CF23  E8
    CPX #$10                     ; $CF24  E0 10
    BNE loc_3E_CEFA              ; $CF26  D0 D2

loc_3E_CF28:
    LDA $0600                    ; $CF28  AD 00 06
    STA $0610                    ; $CF2B  8D 10 06
    STA $0630                    ; $CF2E  8D 30 06
    LDA #$FF                     ; $CF31  A9 FF
    STA $18                      ; $CF33  85 18
    LDA #$00                     ; $CF35  A9 00
    STA $0120                    ; $CF37  8D 20 01
    STA $0121                    ; $CF3A  8D 21 01
    STA $0122                    ; $CF3D  8D 22 01
    STA $0123                    ; $CF40  8D 23 01
    STA $3E                      ; $CF43  85 3E
    STA $FD                      ; $CF45  85 FD
    STA $FA                      ; $CF47  85 FA
    STA $013C                    ; $CF49  8D 3C 01
    STA $013D                    ; $CF4C  8D 3D 01
    STA $013A                    ; $CF4F  8D 3A 01
    STA $BF                      ; $CF52  85 BF
    STA $04C8                    ; $CF54  8D C8 04
    LDY #$3F                     ; $CF57  A0 3F

loc_3E_CF59:
    STA $0680,Y                  ; $CF59  99 80 06
    DEY                          ; $CF5C  88
    BPL loc_3E_CF59              ; $CF5D  10 FA
    STA $F0                      ; $CF5F  85 F0
    STA $1C                      ; $CF61  85 1C
    LDA #$88                     ; $CF63  A9 88
    STA $F1                      ; $CF65  85 F1
    LDA $22                      ; $CF67  A5 22
    CMP #$08                     ; $CF69  C9 08
    BEQ loc_3E_CF77              ; $CF6B  F0 0A
    CMP #$03                     ; $CF6D  C9 03
    BNE loc_3E_CF7B              ; $CF6F  D0 0A
    LDA $F9                      ; $CF71  A5 F9
    CMP #$0C                     ; $CF73  C9 0C
    BCC loc_3E_CF7B              ; $CF75  90 04

loc_3E_CF77:
    LDA #$00                     ; $CF77  A9 00
    STA $EF                      ; $CF79  85 EF

loc_3E_CF7B:
    LDA $22                      ; $CF7B  A5 22
    CMP #$01                     ; $CF7D  C9 01
    BEQ loc_3E_CF93              ; $CF7F  F0 12
    CMP #$03                     ; $CF81  C9 03
    BNE loc_3E_CF9D              ; $CF83  D0 18
    LDA $2B                      ; $CF85  A5 2B
    AND #$0F                     ; $CF87  29 0F
    CMP #$03                     ; $CF89  C9 03
    BNE loc_3E_CF9D              ; $CF8B  D0 10
    LDA #$00                     ; $CF8D  A9 00
    STA $EF                      ; $CF8F  85 EF
    BEQ loc_3E_CF9D              ; $CF91  F0 0A

loc_3E_CF93:
    LDA $2B                      ; $CF93  A5 2B
    AND #$0F                     ; $CF95  29 0F
    TAY                          ; $CF97  A8
    LDA $CFA1,Y                  ; $CF98  B9 A1 CF
    STA $EF                      ; $CF9B  85 EF

loc_3E_CF9D:
    PLA                          ; $CF9D  68
    JMP loc_3E_DA8B              ; $CF9E  4C 8B DA

    .byte $00,$01,$01,$01,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$00  ; $CFA1

sub_3E_CFB1:
    LDY $2A                      ; $CFB1  A4 2A
    JSR sub_3E_D2CE              ; $CFB3  20 CE D2
    LDA #$20                     ; $CFB6  A9 20
    STA $0780                    ; $CFB8  8D 80 07
    LDA $24                      ; $CFBB  A5 24
    STA $0781                    ; $CFBD  8D 81 07
    LSR A                        ; $CFC0  4A
    LSR A                        ; $CFC1  4A
    STA $29                      ; $CFC2  85 29
    LDA #$1D                     ; $CFC4  A9 1D
    STA $0782                    ; $CFC6  8D 82 07
    LDA #$00                     ; $CFC9  A9 00
    STA $03                      ; $CFCB  85 03
    STA $04                      ; $CFCD  85 04
    LDA $24                      ; $CFCF  A5 24
    AND #$03                     ; $CFD1  29 03
    STA $05                      ; $CFD3  85 05

loc_3E_CFD5:
    JSR sub_3E_D17F              ; $CFD5  20 7F D1
    LDX $03                      ; $CFD8  A6 03
    LDY $05                      ; $CFDA  A4 05
    LDA $06C0,Y                  ; $CFDC  B9 C0 06
    STA $0783,X                  ; $CFDF  9D 83 07
    LDA $06C4,Y                  ; $CFE2  B9 C4 06
    STA $0784,X                  ; $CFE5  9D 84 07
    LDA $29                      ; $CFE8  A5 29
    CMP #$38                     ; $CFEA  C9 38
    BCS loc_3E_D000              ; $CFEC  B0 12
    LDA $06C8,Y                  ; $CFEE  B9 C8 06
    STA $0785,X                  ; $CFF1  9D 85 07
    LDA $06CC,Y                  ; $CFF4  B9 CC 06
    STA $0786,X                  ; $CFF7  9D 86 07
    INX                          ; $CFFA  E8
    INX                          ; $CFFB  E8
    INX                          ; $CFFC  E8
    INX                          ; $CFFD  E8
    STX $03                      ; $CFFE  86 03

loc_3E_D000:
    LDA $05                      ; $D000  A5 05
    LSR A                        ; $D002  4A
    BCC loc_3E_D036              ; $D003  90 31
    TAY                          ; $D005  A8
    LDX $29                      ; $D006  A6 29
    LDA $0640,X                  ; $D008  BD 40 06
    AND $D04E,Y                  ; $D00B  39 4E D0
    STA $00                      ; $D00E  85 00
    LDA $10                      ; $D010  A5 10
    AND $D050,Y                  ; $D012  39 50 D0
    ORA $00                      ; $D015  05 00
    STA $0640,X                  ; $D017  9D 40 06
    LDX $04                      ; $D01A  A6 04
    STA $07A4,X                  ; $D01C  9D A4 07
    LDA #$23                     ; $D01F  A9 23
    STA $07A1,X                  ; $D021  9D A1 07
    LDA #$C0                     ; $D024  A9 C0
    ORA $29                      ; $D026  05 29
    STA $07A2,X                  ; $D028  9D A2 07
    LDA #$00                     ; $D02B  A9 00
    STA $07A3,X                  ; $D02D  9D A3 07
    INX                          ; $D030  E8
    INX                          ; $D031  E8
    INX                          ; $D032  E8
    INX                          ; $D033  E8
    STX $04                      ; $D034  86 04

loc_3E_D036:
    LDA $29                      ; $D036  A5 29
    CLC                          ; $D038  18
    ADC #$08                     ; $D039  69 08
    STA $29                      ; $D03B  85 29
    CMP #$40                     ; $D03D  C9 40
    BCC loc_3E_CFD5              ; $D03F  90 94
    LDA #$20                     ; $D041  A9 20
    ADC $04                      ; $D043  65 04
    TAY                          ; $D045  A8
    LDA #$FF                     ; $D046  A9 FF
    STA $0780,Y                  ; $D048  99 80 07
    STA $1A                      ; $D04B  85 1A
    RTS                          ; $D04D  60

    .byte $CC,$33,$33,$CC  ; $D04E

sub_3E_D052:
    LDY $2A                      ; $D052  A4 2A
    JSR sub_3E_D2CE              ; $D054  20 CE D2
    LDA $24                      ; $D057  A5 24
    AND #$1C                     ; $D059  29 1C
    ASL A                        ; $D05B  0A
    STA $29                      ; $D05C  85 29
    LDA #$00                     ; $D05E  A9 00
    STA $03                      ; $D060  85 03
    STA $06                      ; $D062  85 06
    LDA $24                      ; $D064  A5 24
    AND #$03                     ; $D066  29 03
    TAX                          ; $D068  AA
    EOR #$01                     ; $D069  49 01
    TAY                          ; $D06B  A8
    LDA $D173,X                  ; $D06C  BD 73 D1
    STA $04                      ; $D06F  85 04
    LDA $D173,Y                  ; $D071  B9 73 D1
    STA $05                      ; $D074  85 05
    LDA $24                      ; $D076  A5 24
    LSR A                        ; $D078  4A
    LSR A                        ; $D079  4A
    TAY                          ; $D07A  A8
    LDA $D2C6,Y                  ; $D07B  B9 C6 D2
    STA $0780                    ; $D07E  8D 80 07
    STA $07D0                    ; $D081  8D D0 07
    LDA $D2BE,Y                  ; $D084  B9 BE D2
    ORA $D177,X                  ; $D087  1D 77 D1
    STA $0781                    ; $D08A  8D 81 07
    STA $07D1                    ; $D08D  8D D1 07
    LDA #$1F                     ; $D090  A9 1F
    STA $0782                    ; $D092  8D 82 07
    STA $07D2                    ; $D095  8D D2 07
    LDA #$23                     ; $D098  A9 23
    STA $07A3                    ; $D09A  8D A3 07
    STA $07F3                    ; $D09D  8D F3 07
    LDA #$C0                     ; $D0A0  A9 C0
    ORA $29                      ; $D0A2  05 29
    STA $07A4                    ; $D0A4  8D A4 07
    STA $07F4                    ; $D0A7  8D F4 07
    LDA #$07                     ; $D0AA  A9 07
    STA $07A5                    ; $D0AC  8D A5 07
    STA $07F5                    ; $D0AF  8D F5 07

loc_3E_D0B2:
    JSR sub_3E_D17F              ; $D0B2  20 7F D1
    LDA #$04                     ; $D0B5  A9 04
    STA $07                      ; $D0B7  85 07
    LDA $04                      ; $D0B9  A5 04
    PHA                          ; $D0BB  48
    LDA $05                      ; $D0BC  A5 05
    PHA                          ; $D0BE  48

loc_3E_D0BF:
    LDX $03                      ; $D0BF  A6 03
    LDY $04                      ; $D0C1  A4 04
    LDA $06C0,Y                  ; $D0C3  B9 C0 06
    STA $0783,X                  ; $D0C6  9D 83 07
    LDY $05                      ; $D0C9  A4 05
    LDA $06C0,Y                  ; $D0CB  B9 C0 06
    STA $07D3,X                  ; $D0CE  9D D3 07
    INC $03                      ; $D0D1  E6 03
    INC $04                      ; $D0D3  E6 04
    INC $05                      ; $D0D5  E6 05
    DEC $07                      ; $D0D7  C6 07
    BNE loc_3E_D0BF              ; $D0D9  D0 E4
    PLA                          ; $D0DB  68
    STA $05                      ; $D0DC  85 05
    PLA                          ; $D0DE  68
    STA $04                      ; $D0DF  85 04
    LDA $24                      ; $D0E1  A5 24
    AND #$03                     ; $D0E3  29 03
    LSR A                        ; $D0E5  4A
    TAY                          ; $D0E6  A8
    LDX $29                      ; $D0E7  A6 29
    LDA $0640,X                  ; $D0E9  BD 40 06
    AND $D16F,Y                  ; $D0EC  39 6F D1
    STA $00                      ; $D0EF  85 00
    LDA $10                      ; $D0F1  A5 10
    AND $D171,Y                  ; $D0F3  39 71 D1
    ORA $00                      ; $D0F6  05 00
    STA $0640,X                  ; $D0F8  9D 40 06
    LDX $06                      ; $D0FB  A6 06
    STA $07A6,X                  ; $D0FD  9D A6 07
    STA $07F6,X                  ; $D100  9D F6 07
    INC $06                      ; $D103  E6 06
    INC $29                      ; $D105  E6 29
    LDA $29                      ; $D107  A5 29
    AND #$07                     ; $D109  29 07
    BNE loc_3E_D0B2              ; $D10B  D0 A5
    DEC $29                      ; $D10D  C6 29
    LDA $29                      ; $D10F  A5 29
    AND #$38                     ; $D111  29 38
    STA $29                      ; $D113  85 29
    LDY $2A                      ; $D115  A4 2A
    INY                          ; $D117  C8
    JSR sub_3E_D2CE              ; $D118  20 CE D2
    JSR sub_3E_D17F              ; $D11B  20 7F D1
    LDY $04                      ; $D11E  A4 04
    LDA $06C0,Y                  ; $D120  B9 C0 06
    STA $0783                    ; $D123  8D 83 07
    LDY $05                      ; $D126  A4 05
    LDA $06C0,Y                  ; $D128  B9 C0 06
    STA $07D3                    ; $D12B  8D D3 07
    LDA $23                      ; $D12E  A5 23
    AND #$04                     ; $D130  29 04
    LSR A                        ; $D132  4A
    LSR A                        ; $D133  4A
    TAX                          ; $D134  AA
    LDY $D17B,X                  ; $D135  BC 7B D1
    LDA #$FF                     ; $D138  A9 FF
    STA $0780,Y                  ; $D13A  99 80 07
    STA $19                      ; $D13D  85 19
    STA $07D0,Y                  ; $D13F  99 D0 07
    RTS                          ; $D142  60


sub_3E_D143:
    LDY #$2E                     ; $D143  A0 2E

loc_3E_D145:
    LDA $07D0,Y                  ; $D145  B9 D0 07
    STA $0780,Y                  ; $D148  99 80 07
    DEY                          ; $D14B  88
    BPL loc_3E_D145              ; $D14C  10 F7
    LDA $0781                    ; $D14E  AD 81 07
    EOR #$20                     ; $D151  49 20
    STA $0781                    ; $D153  8D 81 07
    LDA #$23                     ; $D156  A9 23
    STA $07A3                    ; $D158  8D A3 07
    LDA $23                      ; $D15B  A5 23
    AND #$04                     ; $D15D  29 04
    LSR A                        ; $D15F  4A
    LSR A                        ; $D160  4A
    EOR #$01                     ; $D161  49 01
    TAX                          ; $D163  AA
    LDY $D17B,X                  ; $D164  BC 7B D1
    LDA #$FF                     ; $D167  A9 FF
    STA $0780,Y                  ; $D169  99 80 07
    STA $19                      ; $D16C  85 19
    RTS                          ; $D16E  60

    .byte $F0,$0F,$0F,$F0,$00,$04,$08,$0C,$00,$20,$40,$60,$23,$2E,$2A,$1F  ; $D16F

sub_3E_D17F:
    JSR sub_3E_D295              ; $D17F  20 95 D2
    LDY #$03                     ; $D182  A0 03
    STY $02                      ; $D184  84 02
    LDA #$00                     ; $D186  A9 00
    STA $10                      ; $D188  85 10

loc_3E_D18A:
    LDY $02                      ; $D18A  A4 02
    LDX $D2BA,Y                  ; $D18C  BE BA D2
    LDA ($00),Y                  ; $D18F  B1 00
    TAY                          ; $D191  A8
    LDA $A000,Y                  ; $D192  B9 00 A0
    STA $06C0,X                  ; $D195  9D C0 06
    LDA $A100,Y                  ; $D198  B9 00 A1
    STA $06C1,X                  ; $D19B  9D C1 06
    LDA $A200,Y                  ; $D19E  B9 00 A2
    STA $06C4,X                  ; $D1A1  9D C4 06
    LDA $A300,Y                  ; $D1A4  B9 00 A3
    STA $06C5,X                  ; $D1A7  9D C5 06
    LDA $A400,Y                  ; $D1AA  B9 00 A4
    AND #$03                     ; $D1AD  29 03
    ORA $10                      ; $D1AF  05 10
    STA $10                      ; $D1B1  85 10
    JSR sub_3E_D1C5              ; $D1B3  20 C5 D1
    JSR sub_3E_D24B              ; $D1B6  20 4B D2
    DEC $02                      ; $D1B9  C6 02
    BMI loc_3E_D1C4              ; $D1BB  30 07
    ASL $10                      ; $D1BD  06 10
    ASL $10                      ; $D1BF  06 10
    JMP loc_3E_D18A              ; $D1C1  4C 8A D1


loc_3E_D1C4:
    RTS                          ; $D1C4  60


sub_3E_D1C5:
    LDA $22                      ; $D1C5  A5 22
    CMP #$02                     ; $D1C7  C9 02
    BEQ loc_3E_D230              ; $D1C9  F0 65
    CMP #$04                     ; $D1CB  C9 04
    BNE loc_3E_D1C4              ; $D1CD  D0 F5
    CPY #$09                     ; $D1CF  C0 09
    BEQ loc_3E_D1D7              ; $D1D1  F0 04
    CPY #$8C                     ; $D1D3  C0 8C
    BNE loc_3E_D1C4              ; $D1D5  D0 ED

loc_3E_D1D7:
    LDA #$00                     ; $D1D7  A9 00
    STA $E6                      ; $D1D9  85 E6
    LDA $2B                      ; $D1DB  A5 2B
    AND #$C0                     ; $D1DD  29 C0
    BNE loc_3E_D1EB              ; $D1DF  D0 0A
    LDA $2A                      ; $D1E1  A5 2A
    ROR A                        ; $D1E3  6A
    ROR A                        ; $D1E4  6A
    ROR A                        ; $D1E5  6A
    ROR A                        ; $D1E6  6A
    AND #$20                     ; $D1E7  29 20
    STA $E6                      ; $D1E9  85 E6

loc_3E_D1EB:
    LDA $29                      ; $D1EB  A5 29
    LSR A                        ; $D1ED  4A
    PHA                          ; $D1EE  48
    AND #$FC                     ; $D1EF  29 FC
    STA $E7                      ; $D1F1  85 E7
    PLA                          ; $D1F3  68
    LSR A                        ; $D1F4  4A
    AND #$01                     ; $D1F5  29 01
    ORA $E7                      ; $D1F7  05 E7
    STA $E7                      ; $D1F9  85 E7
    LDA $02                      ; $D1FB  A5 02
    AND #$02                     ; $D1FD  29 02
    ORA $E6                      ; $D1FF  05 E6
    ORA $E7                      ; $D201  05 E7
    STA $E7                      ; $D203  85 E7
    LDA $29                      ; $D205  A5 29
    ASL A                        ; $D207  0A
    STA $E6                      ; $D208  85 E6
    LDA $02                      ; $D20A  A5 02
    AND #$01                     ; $D20C  29 01
    ORA $E6                      ; $D20E  05 E6
    AND #$07                     ; $D210  29 07
    TAY                          ; $D212  A8
    LDA $FCBF,Y                  ; $D213  B9 BF FC
    STA $E6                      ; $D216  85 E6
    LDY $E7                      ; $D218  A4 E7
    LDA $0680,Y                  ; $D21A  B9 80 06
    AND $E6                      ; $D21D  25 E6
    BEQ loc_3E_D22F              ; $D21F  F0 0E
    LDA #$00                     ; $D221  A9 00
    STA $06C0,X                  ; $D223  9D C0 06
    STA $06C1,X                  ; $D226  9D C1 06
    STA $06C4,X                  ; $D229  9D C4 06
    STA $06C5,X                  ; $D22C  9D C5 06

loc_3E_D22F:
    RTS                          ; $D22F  60


loc_3E_D230:
    LDA $A400,Y                  ; $D230  B9 00 A4
    AND #$F0                     ; $D233  29 F0
    CMP #$70                     ; $D235  C9 70
    BNE loc_3E_D22F              ; $D237  D0 F6
    LDY $2A                      ; $D239  A4 2A
    LDA $0670,Y                  ; $D23B  B9 70 06
    AND #$0F                     ; $D23E  29 0F
    BEQ loc_3E_D22F              ; $D240  F0 ED
    LDA $10                      ; $D242  A5 10
    AND #$FC                     ; $D244  29 FC
    ORA #$01                     ; $D246  09 01
    STA $10                      ; $D248  85 10
    RTS                          ; $D24A  60


sub_3E_D24B:
    LDA $F0                      ; $D24B  A5 F0
    CMP #$04                     ; $D24D  C9 04
    BNE loc_3E_D294              ; $D24F  D0 43
    LDY $2A                      ; $D251  A4 2A
    CPY #$0C                     ; $D253  C0 0C
    BCC loc_3E_D294              ; $D255  90 3D
    CPY #$11                     ; $D257  C0 11
    BCS loc_3E_D294              ; $D259  B0 39
    LDX $E566,Y                  ; $D25B  BE 66 E5

loc_3E_D25E:
    LDA $E577,X                  ; $D25E  BD 77 E5
    BMI loc_3E_D294              ; $D261  30 31
    CMP $29                      ; $D263  C5 29
    BEQ loc_3E_D26B              ; $D265  F0 04
    INX                          ; $D267  E8
    INX                          ; $D268  E8
    BNE loc_3E_D25E              ; $D269  D0 F3

loc_3E_D26B:
    LDA $E578,X                  ; $D26B  BD 78 E5
    ORA $02                      ; $D26E  05 02
    PHA                          ; $D270  48
    AND #$07                     ; $D271  29 07
    TAX                          ; $D273  AA
    PLA                          ; $D274  68
    LSR A                        ; $D275  4A
    LSR A                        ; $D276  4A
    LSR A                        ; $D277  4A
    TAY                          ; $D278  A8
    LDA $0680,Y                  ; $D279  B9 80 06
    AND $FCBF,X                  ; $D27C  3D BF FC
    BEQ loc_3E_D294              ; $D27F  F0 13
    LDY $02                      ; $D281  A4 02
    LDX $D2BA,Y                  ; $D283  BE BA D2
    LDA #$00                     ; $D286  A9 00
    STA $06C0,X                  ; $D288  9D C0 06
    STA $06C1,X                  ; $D28B  9D C1 06
    STA $06C4,X                  ; $D28E  9D C4 06
    STA $06C5,X                  ; $D291  9D C5 06

loc_3E_D294:
    RTS                          ; $D294  60


sub_3E_D295:
    LDA $22                      ; $D295  A5 22
    ORA #$20                     ; $D297  09 20
    CMP $F6                      ; $D299  C5 F6
    BEQ sub_3E_D2A2              ; $D29B  F0 05
    STA $F6                      ; $D29D  85 F6
    JSR sub_3F_FF37              ; $D29F  20 37 FF

sub_3E_D2A2:
    LDA #$00                     ; $D2A2  A9 00
    STA $01                      ; $D2A4  85 01
    LDY $29                      ; $D2A6  A4 29
    LDA ($20),Y                  ; $D2A8  B1 20
    ASL A                        ; $D2AA  0A
    ROL $01                      ; $D2AB  26 01
    ASL A                        ; $D2AD  0A
    ROL $01                      ; $D2AE  26 01
    STA $00                      ; $D2B0  85 00
    LDA $01                      ; $D2B2  A5 01
    CLC                          ; $D2B4  18
    ADC #$A5                     ; $D2B5  69 A5
    STA $01                      ; $D2B7  85 01
    RTS                          ; $D2B9  60

    .byte $00,$02,$08,$0A,$00,$80,$00,$80,$00,$80,$00,$80,$20,$20,$21,$21  ; $D2BA
    .byte $22,$22,$23,$23  ; $D2CA

sub_3E_D2CE:
    LDA $22                      ; $D2CE  A5 22
    ORA #$20                     ; $D2D0  09 20
    STA $F6                      ; $D2D2  85 F6
    JSR sub_3F_FF37              ; $D2D4  20 37 FF

sub_3E_D2D7:
    LDA $B500,Y                  ; $D2D7  B9 00 B5
    PHA                          ; $D2DA  48
    LDA #$00                     ; $D2DB  A9 00
    STA $00                      ; $D2DD  85 00
    PLA                          ; $D2DF  68
    ASL A                        ; $D2E0  0A
    ROL $00                      ; $D2E1  26 00
    ASL A                        ; $D2E3  0A
    ROL $00                      ; $D2E4  26 00
    ASL A                        ; $D2E6  0A
    ROL $00                      ; $D2E7  26 00
    ASL A                        ; $D2E9  0A
    ROL $00                      ; $D2EA  26 00
    ASL A                        ; $D2EC  0A
    ROL $00                      ; $D2ED  26 00
    ASL A                        ; $D2EF  0A
    ROL $00                      ; $D2F0  26 00
    STA $20                      ; $D2F2  85 20
    LDA $00                      ; $D2F4  A5 00
    CLC                          ; $D2F6  18
    ADC #$A9                     ; $D2F7  69 A9
    STA $21                      ; $D2F9  85 21
    RTS                          ; $D2FB  60


sub_3E_D2FC:
    JSR sub_3E_D53A              ; $D2FC  20 3A D5
    JSR sub_3E_D552              ; $D2FF  20 52 D5
    LDA $D69E,Y                  ; $D302  B9 9E D6
    STA $5A                      ; $D305  85 5A
    LDA $D6DE,Y                  ; $D307  B9 DE D6
    STA $5B                      ; $D30A  85 5B
    LDY #$00                     ; $D30C  A0 00
    STY $40                      ; $D30E  84 40
    LDA ($5A),Y                  ; $D310  B1 5A
    STA $06                      ; $D312  85 06
    LDA #$00                     ; $D314  A9 00
    STA $02                      ; $D316  85 02
    LDA $0390,X                  ; $D318  BD 90 03
    STA $03                      ; $D31B  85 03
    LDY #$01                     ; $D31D  A0 01
    LDA ($5A),Y                  ; $D31F  B1 5A
    PHA                          ; $D321  48
    CLC                          ; $D322  18
    ADC $0378,X                  ; $D323  7D 78 03
    STA $11                      ; $D326  85 11
    PLA                          ; $D328  68
    BMI loc_3E_D335              ; $D329  30 0A
    BCS loc_3E_D337              ; $D32B  B0 0A
    LDA $11                      ; $D32D  A5 11
    CMP #$F0                     ; $D32F  C9 F0
    BCS loc_3E_D337              ; $D331  B0 04
    BCC loc_3E_D344              ; $D333  90 0F

loc_3E_D335:
    BCS loc_3E_D344              ; $D335  B0 0D

loc_3E_D337:
    LDA #$00                     ; $D337  A9 00
    LDY $06                      ; $D339  A4 06

loc_3E_D33B:
    STA $0045,Y                  ; $D33B  99 45 00
    DEY                          ; $D33E  88
    BPL loc_3E_D33B              ; $D33F  10 FA
    JMP loc_3E_D58D              ; $D341  4C 8D D5


loc_3E_D344:
    LDA $03                      ; $D344  A5 03
    BNE loc_3E_D337              ; $D346  D0 EF
    LDA $11                      ; $D348  A5 11
    LSR A                        ; $D34A  4A
    LSR A                        ; $D34B  4A
    PHA                          ; $D34C  48
    AND #$38                     ; $D34D  29 38
    STA $29                      ; $D34F  85 29
    PLA                          ; $D351  68
    LSR A                        ; $D352  4A
    AND #$02                     ; $D353  29 02
    STA $03                      ; $D355  85 03
    LDA #$00                     ; $D357  A9 00
    STA $04                      ; $D359  85 04
    LDY #$02                     ; $D35B  A0 02
    STY $40                      ; $D35D  84 40
    LDA ($5A),Y                  ; $D35F  B1 5A
    BPL loc_3E_D365              ; $D361  10 02
    DEC $04                      ; $D363  C6 04

loc_3E_D365:
    CLC                          ; $D365  18
    ADC $0330,X                  ; $D366  7D 30 03
    STA $12                      ; $D369  85 12
    LDA $0348,X                  ; $D36B  BD 48 03
    ADC $04                      ; $D36E  65 04
    STA $13                      ; $D370  85 13
    LDA $12                      ; $D372  A5 12
    LSR A                        ; $D374  4A
    LSR A                        ; $D375  4A
    LSR A                        ; $D376  4A
    LSR A                        ; $D377  4A
    PHA                          ; $D378  48
    AND #$01                     ; $D379  29 01
    ORA $03                      ; $D37B  05 03
    STA $03                      ; $D37D  85 03
    PLA                          ; $D37F  68
    LSR A                        ; $D380  4A
    ORA $29                      ; $D381  05 29
    STA $29                      ; $D383  85 29

loc_3E_D385:
    LDY $13                      ; $D385  A4 13
    JSR sub_3E_D2D7              ; $D387  20 D7 D2

loc_3E_D38A:
    JSR sub_3E_D2A2              ; $D38A  20 A2 D2

loc_3E_D38D:
    LDY $03                      ; $D38D  A4 03
    LDA ($00),Y                  ; $D38F  B1 00
    TAY                          ; $D391  A8
    LDA $A400,Y                  ; $D392  B9 00 A4
    AND #$F0                     ; $D395  29 F0
    JSR sub_3E_D599              ; $D397  20 99 D5
    JSR sub_3E_D5DA              ; $D39A  20 DA D5
    JSR sub_3E_D5E6              ; $D39D  20 E6 D5
    JSR sub_3E_D624              ; $D3A0  20 24 D6
    JSR sub_3E_D661              ; $D3A3  20 61 D6
    CPX #$00                     ; $D3A6  E0 00
    BNE loc_3E_D3B0              ; $D3A8  D0 06
    CMP #$30                     ; $D3AA  C9 30
    BNE loc_3E_D3B0              ; $D3AC  D0 02
    STA $3D                      ; $D3AE  85 3D

loc_3E_D3B0:
    LDY $02                      ; $D3B0  A4 02
    STA $0045,Y                  ; $D3B2  99 45 00
    CMP $41                      ; $D3B5  C5 41
    BCC loc_3E_D3BB              ; $D3B7  90 02
    STA $41                      ; $D3B9  85 41

loc_3E_D3BB:
    ORA $10                      ; $D3BB  05 10
    STA $10                      ; $D3BD  85 10
    LDA $02                      ; $D3BF  A5 02
    CMP $06                      ; $D3C1  C5 06
    BEQ loc_3E_D3FD              ; $D3C3  F0 38
    INC $02                      ; $D3C5  E6 02
    INC $40                      ; $D3C7  E6 40
    LDY $40                      ; $D3C9  A4 40
    LDA $12                      ; $D3CB  A5 12
    PHA                          ; $D3CD  48
    AND #$10                     ; $D3CE  29 10
    STA $04                      ; $D3D0  85 04
    PLA                          ; $D3D2  68
    CLC                          ; $D3D3  18
    ADC ($5A),Y                  ; $D3D4  71 5A
    STA $12                      ; $D3D6  85 12
    AND #$10                     ; $D3D8  29 10
    CMP $04                      ; $D3DA  C5 04
    BEQ loc_3E_D38D              ; $D3DC  F0 AF
    LDA $03                      ; $D3DE  A5 03
    EOR #$01                     ; $D3E0  49 01
    STA $03                      ; $D3E2  85 03
    AND #$01                     ; $D3E4  29 01
    BNE loc_3E_D38D              ; $D3E6  D0 A5
    INC $29                      ; $D3E8  E6 29
    LDA $29                      ; $D3EA  A5 29
    AND #$07                     ; $D3EC  29 07
    BNE loc_3E_D38A              ; $D3EE  D0 9A
    INC $13                      ; $D3F0  E6 13
    DEC $29                      ; $D3F2  C6 29
    LDA $29                      ; $D3F4  A5 29
    AND #$38                     ; $D3F6  29 38
    STA $29                      ; $D3F8  85 29
    JMP loc_3E_D385              ; $D3FA  4C 85 D3


loc_3E_D3FD:
    LDA $F0                      ; $D3FD  A5 F0
    CMP #$04                     ; $D3FF  C9 04
    BNE loc_3E_D425              ; $D401  D0 22
    LDA $013F                    ; $D403  AD 3F 01
    AND #$04                     ; $D406  29 04
    BNE loc_3E_D425              ; $D408  D0 1B
    LDA $0348,X                  ; $D40A  BD 48 03
    CMP #$0C                     ; $D40D  C9 0C
    BEQ loc_3E_D425              ; $D40F  F0 14
    LDA $10                      ; $D411  A5 10
    BNE loc_3E_D425              ; $D413  D0 10
    LDA $11                      ; $D415  A5 11
    CLC                          ; $D417  18
    ADC $013E                    ; $D418  6D 3E 01
    CMP #$C0                     ; $D41B  C9 C0
    BCC loc_3E_D425              ; $D41D  90 06
    STA $11                      ; $D41F  85 11
    LDA #$10                     ; $D421  A9 10
    STA $10                      ; $D423  85 10

loc_3E_D425:
    JMP loc_3E_D58D              ; $D425  4C 8D D5


sub_3E_D428:
    JSR sub_3E_D53A              ; $D428  20 3A D5
    JSR sub_3E_D566              ; $D42B  20 66 D5
    LDA $D808,Y                  ; $D42E  B9 08 D8
    STA $5A                      ; $D431  85 5A
    LDA $D848,Y                  ; $D433  B9 48 D8
    STA $5B                      ; $D436  85 5B
    LDY #$00                     ; $D438  A0 00
    LDA ($5A),Y                  ; $D43A  B1 5A
    STA $06                      ; $D43C  85 06
    LDA #$00                     ; $D43E  A9 00
    STA $02                      ; $D440  85 02
    LDA #$00                     ; $D442  A9 00
    STA $04                      ; $D444  85 04
    STA $05                      ; $D446  85 05
    LDY #$01                     ; $D448  A0 01
    LDA ($5A),Y                  ; $D44A  B1 5A
    BPL loc_3E_D450              ; $D44C  10 02
    DEC $04                      ; $D44E  C6 04

loc_3E_D450:
    CLC                          ; $D450  18
    ADC $0330,X                  ; $D451  7D 30 03
    STA $12                      ; $D454  85 12
    LDA $0348,X                  ; $D456  BD 48 03
    ADC $04                      ; $D459  65 04
    STA $13                      ; $D45B  85 13
    LDA $12                      ; $D45D  A5 12
    LSR A                        ; $D45F  4A
    LSR A                        ; $D460  4A
    LSR A                        ; $D461  4A
    LSR A                        ; $D462  4A
    PHA                          ; $D463  48
    AND #$01                     ; $D464  29 01
    STA $03                      ; $D466  85 03
    PLA                          ; $D468  68
    LSR A                        ; $D469  4A
    STA $29                      ; $D46A  85 29
    LDY #$02                     ; $D46C  A0 02
    STY $40                      ; $D46E  84 40
    LDA $0390,X                  ; $D470  BD 90 03
    BMI loc_3E_D497              ; $D473  30 22
    BNE loc_3E_D48F              ; $D475  D0 18
    LDA $0378,X                  ; $D477  BD 78 03
    CLC                          ; $D47A  18
    ADC ($5A),Y                  ; $D47B  71 5A
    STA $11                      ; $D47D  85 11
    LDA ($5A),Y                  ; $D47F  B1 5A
    BPL loc_3E_D487              ; $D481  10 04
    BCC loc_3E_D497              ; $D483  90 12
    BCS loc_3E_D489              ; $D485  B0 02

loc_3E_D487:
    BCS loc_3E_D48F              ; $D487  B0 06

loc_3E_D489:
    LDA $11                      ; $D489  A5 11
    CMP #$F0                     ; $D48B  C9 F0
    BCC loc_3E_D49D              ; $D48D  90 0E

loc_3E_D48F:
    LDA #$EF                     ; $D48F  A9 EF
    STA $11                      ; $D491  85 11
    INC $05                      ; $D493  E6 05
    BNE loc_3E_D49D              ; $D495  D0 06

loc_3E_D497:
    LDA #$00                     ; $D497  A9 00
    STA $11                      ; $D499  85 11
    INC $05                      ; $D49B  E6 05

loc_3E_D49D:
    LDA $11                      ; $D49D  A5 11
    LSR A                        ; $D49F  4A
    LSR A                        ; $D4A0  4A
    PHA                          ; $D4A1  48
    AND #$38                     ; $D4A2  29 38
    ORA $29                      ; $D4A4  05 29
    STA $29                      ; $D4A6  85 29
    PLA                          ; $D4A8  68
    LSR A                        ; $D4A9  4A
    AND #$02                     ; $D4AA  29 02
    ORA $03                      ; $D4AC  05 03
    STA $03                      ; $D4AE  85 03
    LDY $13                      ; $D4B0  A4 13
    JSR sub_3E_D2D7              ; $D4B2  20 D7 D2

loc_3E_D4B5:
    JSR sub_3E_D2A2              ; $D4B5  20 A2 D2

loc_3E_D4B8:
    LDY $03                      ; $D4B8  A4 03
    LDA ($00),Y                  ; $D4BA  B1 00
    TAY                          ; $D4BC  A8
    LDA $A400,Y                  ; $D4BD  B9 00 A4
    AND #$F0                     ; $D4C0  29 F0
    CMP #$40                     ; $D4C2  C9 40
    BNE loc_3E_D4C8              ; $D4C4  D0 02
    LDA #$20                     ; $D4C6  A9 20

loc_3E_D4C8:
    JSR sub_3E_D599              ; $D4C8  20 99 D5
    JSR sub_3E_D5DA              ; $D4CB  20 DA D5
    JSR sub_3E_D5E6              ; $D4CE  20 E6 D5
    JSR sub_3E_D624              ; $D4D1  20 24 D6
    JSR sub_3E_D661              ; $D4D4  20 61 D6
    CPX #$00                     ; $D4D7  E0 00
    BNE loc_3E_D4E1              ; $D4D9  D0 06
    CMP #$30                     ; $D4DB  C9 30
    BNE loc_3E_D4E1              ; $D4DD  D0 02
    STA $3D                      ; $D4DF  85 3D

loc_3E_D4E1:
    LDY $02                      ; $D4E1  A4 02
    STA $0045,Y                  ; $D4E3  99 45 00
    CMP $41                      ; $D4E6  C5 41
    BCC loc_3E_D4EC              ; $D4E8  90 02
    STA $41                      ; $D4EA  85 41

loc_3E_D4EC:
    ORA $10                      ; $D4EC  05 10
    STA $10                      ; $D4EE  85 10
    LDA $02                      ; $D4F0  A5 02
    CMP $06                      ; $D4F2  C5 06
    BEQ loc_3E_D537              ; $D4F4  F0 41
    INC $02                      ; $D4F6  E6 02
    INC $40                      ; $D4F8  E6 40
    LDA $05                      ; $D4FA  A5 05
    BNE loc_3E_D4B8              ; $D4FC  D0 BA
    LDY $40                      ; $D4FE  A4 40
    LDA $11                      ; $D500  A5 11
    PHA                          ; $D502  48
    AND #$10                     ; $D503  29 10
    STA $04                      ; $D505  85 04
    PLA                          ; $D507  68
    CLC                          ; $D508  18
    ADC ($5A),Y                  ; $D509  71 5A
    STA $11                      ; $D50B  85 11
    AND #$10                     ; $D50D  29 10
    CMP $04                      ; $D50F  C5 04
    BEQ loc_3E_D4B8              ; $D511  F0 A5
    LDA $03                      ; $D513  A5 03
    EOR #$02                     ; $D515  49 02
    STA $03                      ; $D517  85 03
    AND #$02                     ; $D519  29 02
    BNE loc_3E_D4B8              ; $D51B  D0 9B
    LDA $29                      ; $D51D  A5 29
    PHA                          ; $D51F  48
    CLC                          ; $D520  18
    ADC #$08                     ; $D521  69 08
    STA $29                      ; $D523  85 29
    CMP #$40                     ; $D525  C9 40
    PLA                          ; $D527  68
    BCC loc_3E_D4B5              ; $D528  90 8B
    STA $29                      ; $D52A  85 29
    LDA $03                      ; $D52C  A5 03
    EOR #$02                     ; $D52E  49 02
    STA $03                      ; $D530  85 03
    INC $05                      ; $D532  E6 05
    JMP loc_3E_D4B8              ; $D534  4C B8 D4


loc_3E_D537:
    JMP loc_3E_D58D              ; $D537  4C 8D D5


sub_3E_D53A:
    LDA #$00                     ; $D53A  A9 00
    STA $10                      ; $D53C  85 10
    STA $41                      ; $D53E  85 41
    LDA $F6                      ; $D540  A5 F6
    STA $EC                      ; $D542  85 EC
    LDA $22                      ; $D544  A5 22
    ORA #$20                     ; $D546  09 20
    STA $F6                      ; $D548  85 F6
    LDA $0378,X                  ; $D54A  BD 78 03
    STA $42                      ; $D54D  85 42
    JMP sub_3F_FF37              ; $D54F  4C 37 FF


sub_3E_D552:
    LDA $F0                      ; $D552  A5 F0
    CMP #$04                     ; $D554  C9 04
    BNE loc_3E_D58C              ; $D556  D0 34
    LDA $013F                    ; $D558  AD 3F 01
    AND #$04                     ; $D55B  29 04
    BNE sub_3E_D566              ; $D55D  D0 07
    LDA $0348,X                  ; $D55F  BD 48 03
    CMP #$0C                     ; $D562  C9 0C
    BNE loc_3E_D582              ; $D564  D0 1C

sub_3E_D566:
    LDA $F0                      ; $D566  A5 F0
    CMP #$04                     ; $D568  C9 04
    BNE loc_3E_D58C              ; $D56A  D0 20
    LDA $30                      ; $D56C  A5 30
    CMP #$02                     ; $D56E  C9 02
    BNE loc_3E_D57B              ; $D570  D0 09
    LDA $0378,X                  ; $D572  BD 78 03
    CMP #$B7                     ; $D575  C9 B7
    BCS loc_3E_D58C              ; $D577  B0 13
    BCC loc_3E_D582              ; $D579  90 07

loc_3E_D57B:
    LDA $0378,X                  ; $D57B  BD 78 03
    CMP #$B5                     ; $D57E  C9 B5
    BCS loc_3E_D58C              ; $D580  B0 0A

loc_3E_D582:
    LDA $0378,X                  ; $D582  BD 78 03
    SEC                          ; $D585  38
    SBC $013E                    ; $D586  ED 3E 01
    STA $0378,X                  ; $D589  9D 78 03

loc_3E_D58C:
    RTS                          ; $D58C  60


loc_3E_D58D:
    LDA $42                      ; $D58D  A5 42
    STA $0378,X                  ; $D58F  9D 78 03
    LDA $EC                      ; $D592  A5 EC
    STA $F6                      ; $D594  85 F6
    JMP sub_3F_FF37              ; $D596  4C 37 FF


sub_3E_D599:
    CPY #$09                     ; $D599  C0 09
    BEQ loc_3E_D5A1              ; $D59B  F0 04
    CPY #$8C                     ; $D59D  C0 8C
    BNE loc_3E_D5D9              ; $D59F  D0 38

loc_3E_D5A1:
    LDY $22                      ; $D5A1  A4 22
    CPY #$04                     ; $D5A3  C0 04
    BNE loc_3E_D5D9              ; $D5A5  D0 32

loc_3E_D5A7:
    LDA $12                      ; $D5A7  A5 12
    LSR A                        ; $D5A9  4A
    LSR A                        ; $D5AA  4A
    LSR A                        ; $D5AB  4A
    LSR A                        ; $D5AC  4A
    STA $07                      ; $D5AD  85 07
    LDA $11                      ; $D5AF  A5 11
    AND #$F0                     ; $D5B1  29 F0
    ORA $07                      ; $D5B3  05 07
    PHA                          ; $D5B5  48
    AND #$07                     ; $D5B6  29 07
    TAY                          ; $D5B8  A8
    LDA $FCBF,Y                  ; $D5B9  B9 BF FC
    STA $07                      ; $D5BC  85 07
    CLC                          ; $D5BE  18
    LDA $2B                      ; $D5BF  A5 2B
    AND #$C0                     ; $D5C1  29 C0
    BNE loc_3E_D5C8              ; $D5C3  D0 03
    LDA $13                      ; $D5C5  A5 13
    LSR A                        ; $D5C7  4A

loc_3E_D5C8:
    PLA                          ; $D5C8  68
    ROR A                        ; $D5C9  6A
    LSR A                        ; $D5CA  4A
    LSR A                        ; $D5CB  4A
    TAY                          ; $D5CC  A8
    LDA $0680,Y                  ; $D5CD  B9 80 06
    AND $07                      ; $D5D0  25 07
    BEQ loc_3E_D5D7              ; $D5D2  F0 03
    LDA #$00                     ; $D5D4  A9 00
    RTS                          ; $D5D6  60


loc_3E_D5D7:
    LDA #$10                     ; $D5D7  A9 10

loc_3E_D5D9:
    RTS                          ; $D5D9  60


sub_3E_D5DA:
    LDY $22                      ; $D5DA  A4 22
    CPY #$08                     ; $D5DC  C0 08
    BNE loc_3E_D5D9              ; $D5DE  D0 F9
    CMP #$10                     ; $D5E0  C9 10
    BEQ loc_3E_D5A7              ; $D5E2  F0 C3
    BNE loc_3E_D5D9              ; $D5E4  D0 F3

sub_3E_D5E6:
    LDY $F0                      ; $D5E6  A4 F0
    CPY #$05                     ; $D5E8  C0 05
    BEQ loc_3E_D61A              ; $D5EA  F0 2E
    LDY $22                      ; $D5EC  A4 22
    CPY #$02                     ; $D5EE  C0 02
    BEQ loc_3E_D60E              ; $D5F0  F0 1C
    CPY #$04                     ; $D5F2  C0 04
    BNE loc_3E_D60D              ; $D5F4  D0 17
    LDY $3E                      ; $D5F6  A4 3E
    BEQ loc_3E_D60D              ; $D5F8  F0 13
    STA $07                      ; $D5FA  85 07
    LDY #$04                     ; $D5FC  A0 04
    LDA $29                      ; $D5FE  A5 29

loc_3E_D600:
    CMP $D691,Y                  ; $D600  D9 91 D6
    BEQ loc_3E_D60B              ; $D603  F0 06
    DEY                          ; $D605  88
    BPL loc_3E_D600              ; $D606  10 F8
    LDA $07                      ; $D608  A5 07
    RTS                          ; $D60A  60


loc_3E_D60B:
    LDA #$00                     ; $D60B  A9 00

loc_3E_D60D:
    RTS                          ; $D60D  60


loc_3E_D60E:
    CMP #$70                     ; $D60E  C9 70
    BNE loc_3E_D60D              ; $D610  D0 FB
    LDY $13                      ; $D612  A4 13
    LDA $0670,Y                  ; $D614  B9 70 06
    AND #$F0                     ; $D617  29 F0
    RTS                          ; $D619  60


loc_3E_D61A:
    LDY $11                      ; $D61A  A4 11
    CPY $013E                    ; $D61C  CC 3E 01
    BCS loc_3E_D623              ; $D61F  B0 02
    LDA #$00                     ; $D621  A9 00

loc_3E_D623:
    RTS                          ; $D623  60


sub_3E_D624:
    LDY $F0                      ; $D624  A4 F0
    CPY #$04                     ; $D626  C0 04
    BNE loc_3E_D623              ; $D628  D0 F9
    CMP #$90                     ; $D62A  C9 90
    BNE loc_3E_D623              ; $D62C  D0 F5
    LDY $13                      ; $D62E  A4 13
    LDA $E566,Y                  ; $D630  B9 66 E5
    TAY                          ; $D633  A8

loc_3E_D634:
    LDA $E577,Y                  ; $D634  B9 77 E5
    BMI loc_3E_D65E              ; $D637  30 25
    CMP $29                      ; $D639  C5 29
    BEQ loc_3E_D641              ; $D63B  F0 04
    INY                          ; $D63D  C8
    INY                          ; $D63E  C8
    BNE loc_3E_D634              ; $D63F  D0 F3

loc_3E_D641:
    LDA $E578,Y                  ; $D641  B9 78 E5
    ORA $03                      ; $D644  05 03
    PHA                          ; $D646  48
    AND #$07                     ; $D647  29 07
    TAY                          ; $D649  A8
    LDA $FCBF,Y                  ; $D64A  B9 BF FC
    STA $07                      ; $D64D  85 07
    PLA                          ; $D64F  68
    LSR A                        ; $D650  4A
    LSR A                        ; $D651  4A
    LSR A                        ; $D652  4A
    TAY                          ; $D653  A8
    LDA $0680,Y                  ; $D654  B9 80 06
    AND $07                      ; $D657  25 07
    BEQ loc_3E_D65E              ; $D659  F0 03
    LDA #$00                     ; $D65B  A9 00
    RTS                          ; $D65D  60


loc_3E_D65E:
    LDA #$90                     ; $D65E  A9 90
    RTS                          ; $D660  60


sub_3E_D661:
    LDY $22                      ; $D661  A4 22
    CPY #$0E                     ; $D663  C0 0E
    BNE loc_3E_D690              ; $D665  D0 29
    LDY $13                      ; $D667  A4 13
    CPY #$09                     ; $D669  C0 09
    BNE loc_3E_D690              ; $D66B  D0 23
    LDY $AC                      ; $D66D  A4 AC
    CPY #$FF                     ; $D66F  C0 FF
    BNE loc_3E_D690              ; $D671  D0 1D
    CMP #$00                     ; $D673  C9 00
    BNE loc_3E_D690              ; $D675  D0 19
    LDY #$06                     ; $D677  A0 06

loc_3E_D679:
    LDA $D696,Y                  ; $D679  B9 96 D6
    CMP $29                      ; $D67C  C5 29
    BNE loc_3E_D68A              ; $D67E  D0 0A
    LDA $D697,Y                  ; $D680  B9 97 D6
    CMP $03                      ; $D683  C5 03
    BNE loc_3E_D68A              ; $D685  D0 03
    LDA #$10                     ; $D687  A9 10
    RTS                          ; $D689  60


loc_3E_D68A:
    DEY                          ; $D68A  88
    DEY                          ; $D68B  88
    BPL loc_3E_D679              ; $D68C  10 EB
    LDA #$00                     ; $D68E  A9 00

loc_3E_D690:
    RTS                          ; $D690  60

    .byte $29,$2A,$2B,$32,$3A,$0B,$01,$0C,$00,$13,$03,$14,$02,$1E,$23,$27  ; $D691
    .byte $2A,$2F,$34,$39,$3E,$43,$3E,$48,$3E,$4D,$52,$57,$5B,$5F,$27,$27  ; $D6A1
    .byte $62,$67,$6A,$6F,$73,$77,$7C,$81,$86,$8B,$8F,$93,$97,$9B,$9F,$A4  ; $D6B1
    .byte $27,$A9,$AC,$B0,$B5,$BA,$BE,$C2,$C6,$CA,$CE,$D1,$D7,$DD,$E2,$E7  ; $D6C1
    .byte $EC,$F1,$F4,$F7,$FA,$FD,$00,$05,$08,$08,$08,$08,$08,$D7,$D7,$D7  ; $D6D1
    .byte $D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7  ; $D6E1
    .byte $D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7  ; $D6F1
    .byte $D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7  ; $D701
    .byte $D7,$D7,$D7,$D7,$D7,$D7,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$02,$0C,$F9  ; $D711
    .byte $07,$07,$01,$F7,$F9,$0E,$00,$00,$00,$02,$F2,$F2,$0E,$0E,$02,$0A  ; $D721
    .byte $F2,$0E,$0E,$02,$00,$F2,$0E,$0E,$02,$08,$F5,$0B,$0B,$02,$F8,$F5  ; $D731
    .byte $0B,$0B,$02,$0C,$F5,$0B,$0B,$02,$10,$F5,$0B,$0B,$02,$0C,$F5,$0B  ; $D741
    .byte $0B,$02,$F0,$F5,$0B,$0B,$01,$08,$F9,$0E,$01,$F8,$F9,$0E,$00,$09  ; $D751
    .byte $00,$02,$14,$F5,$0B,$0B,$00,$04,$00,$02,$00,$F1,$0F,$0F,$01,$06  ; $D761
    .byte $F9,$0E,$01,$FA,$F9,$0E,$02,$08,$F1,$0F,$0F,$02,$F8,$F1,$0F,$0F  ; $D771
    .byte $02,$0C,$F1,$0F,$0F,$02,$FC,$F1,$0F,$0F,$01,$24,$F9,$0E,$01,$09  ; $D781
    .byte $F9,$0E,$01,$F7,$F9,$0E,$01,$0A,$F9,$0E,$01,$EE,$F9,$0E,$02,$05  ; $D791
    .byte $F5,$0B,$0B,$02,$FB,$F5,$0B,$0B,$00,$FF,$00,$01,$F0,$F9,$0E,$02  ; $D7A1
    .byte $10,$F7,$09,$09,$02,$F0,$F7,$09,$09,$01,$30,$FA,$0C,$01,$0C,$FA  ; $D7B1
    .byte $0C,$01,$06,$FB,$0A,$01,$FA,$FB,$0A,$01,$F4,$F9,$0E,$00,$08,$00  ; $D7C1
    .byte $03,$10,$E9,$10,$10,$0E,$03,$F0,$E9,$10,$10,$0E,$02,$18,$F1,$0F  ; $D7D1
    .byte $0F,$02,$E8,$F1,$0F,$0F,$02,$1C,$F1,$0F,$0F,$02,$E4,$F1,$0F,$0F  ; $D7E1
    .byte $00,$08,$0E,$00,$F8,$0E,$00,$08,$F2,$00,$F8,$F2,$00,$F7,$00,$02  ; $D7F1
    .byte $10,$F2,$0E,$0E,$00,$F4,$00,$88,$8D,$92,$92,$97,$9B,$9F,$A2,$A5  ; $D801
    .byte $AA,$AF,$B4,$B9,$BC,$BF,$C3,$C7,$CC,$D1,$D6,$DB,$E0,$E5,$EA,$EF  ; $D811
    .byte $F3,$F7,$F7,$FA,$FE,$02,$05,$08,$0C,$10,$15,$1A,$1E,$22,$26,$2A  ; $D821
    .byte $2F,$34,$39,$3E,$41,$44,$49,$4E,$52,$56,$5B,$60,$66,$6C,$70,$74  ; $D831
    .byte $79,$7E,$84,$8A,$91,$98,$9C,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8  ; $D841
    .byte $D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8,$D8  ; $D851
    .byte $D8,$D8,$D8,$D8,$D8,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9  ; $D861
    .byte $D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9,$D9  ; $D871
    .byte $D9,$D9,$D9,$D9,$D9,$D9,$D9,$02,$08,$F8,$08,$0B,$02,$F8,$F8,$08  ; $D881
    .byte $0B,$02,$00,$F5,$0B,$05,$01,$0F,$00,$09,$01,$F1,$00,$09,$00,$0F  ; $D891
    .byte $04,$00,$F1,$04,$02,$10,$16,$0F,$0F,$02,$F0,$16,$0F,$0F,$02,$10  ; $D8A1
    .byte $1E,$0F,$0F,$02,$F0,$1E,$0F,$0F,$00,$10,$00,$00,$F0,$00,$01,$0C  ; $D8B1
    .byte $F9,$0E,$01,$F4,$F9,$0E,$02,$0C,$F9,$07,$0B,$02,$F4,$F9,$07,$0B  ; $D8C1
    .byte $02,$0C,$F9,$07,$0F,$02,$F4,$F9,$07,$0F,$02,$0C,$F5,$0B,$0B,$02  ; $D8D1
    .byte $F4,$F5,$0B,$0B,$02,$08,$F1,$0F,$0F,$02,$F8,$F1,$0F,$0F,$01,$08  ; $D8E1
    .byte $F9,$0E,$01,$F8,$F9,$0E,$00,$00,$00,$01,$0C,$F9,$0E,$01,$F4,$F9  ; $D8F1
    .byte $0E,$00,$04,$00,$00,$FC,$00,$01,$08,$FB,$0A,$01,$F8,$FB,$0A,$02  ; $D901
    .byte $08,$F7,$09,$07,$02,$F8,$F7,$09,$07,$01,$10,$F9,$0E,$01,$F0,$F9  ; $D911
    .byte $0E,$01,$10,$FD,$0E,$01,$F0,$FD,$0E,$02,$0C,$17,$0F,$0F,$02,$F4  ; $D921
    .byte $17,$0F,$0F,$02,$08,$F8,$08,$08,$02,$F8,$F8,$08,$08,$00,$0C,$FE  ; $D931
    .byte $00,$F4,$FE,$02,$0A,$F1,$0F,$0F,$02,$F6,$F1,$0F,$0F,$01,$06,$FB  ; $D941
    .byte $0A,$01,$FA,$FB,$0A,$02,$0C,$F1,$0F,$0F,$02,$F4,$F1,$0F,$0F,$03  ; $D951
    .byte $0C,$EC,$10,$10,$08,$03,$F4,$EC,$10,$10,$08,$01,$14,$F9,$0E,$01  ; $D961
    .byte $EC,$F9,$0E,$02,$18,$F1,$0F,$0F,$02,$E8,$F1,$0F,$0F,$03,$10,$E9  ; $D971
    .byte $10,$10,$0E,$03,$F0,$E9,$10,$10,$0E,$04,$10,$E5,$10,$10,$10,$06  ; $D981
    .byte $04,$F0,$E5,$10,$10,$10,$06,$01,$00,$FC,$08,$00,$00,$05  ; $D991

sub_3E_D99F:
    LDA $12                      ; $D99F  A5 12
    AND #$0F                     ; $D9A1  29 0F
    STA $12                      ; $D9A3  85 12
    LDA $0330,X                  ; $D9A5  BD 30 03
    SEC                          ; $D9A8  38
    SBC $12                      ; $D9A9  E5 12
    STA $0330,X                  ; $D9AB  9D 30 03
    LDA $0348,X                  ; $D9AE  BD 48 03
    SBC #$00                     ; $D9B1  E9 00
    STA $0348,X                  ; $D9B3  9D 48 03
    RTS                          ; $D9B6  60


sub_3E_D9B7:
    LDA $12                      ; $D9B7  A5 12
    AND #$0F                     ; $D9B9  29 0F
    EOR #$0F                     ; $D9BB  49 0F
    SEC                          ; $D9BD  38
    ADC $0330,X                  ; $D9BE  7D 30 03
    STA $0330,X                  ; $D9C1  9D 30 03
    LDA $0348,X                  ; $D9C4  BD 48 03
    ADC #$00                     ; $D9C7  69 00
    STA $0348,X                  ; $D9C9  9D 48 03
    RTS                          ; $D9CC  60


sub_3E_D9CD:
    LDA $11                      ; $D9CD  A5 11
    AND #$0F                     ; $D9CF  29 0F
    EOR #$0F                     ; $D9D1  49 0F
    SEC                          ; $D9D3  38
    ADC $0378,X                  ; $D9D4  7D 78 03
    STA $0378,X                  ; $D9D7  9D 78 03
    CMP #$F0                     ; $D9DA  C9 F0
    BCC loc_3E_D9E6              ; $D9DC  90 08
    ADC #$0F                     ; $D9DE  69 0F
    STA $0378,X                  ; $D9E0  9D 78 03
    INC $0390,X                  ; $D9E3  FE 90 03

loc_3E_D9E6:
    RTS                          ; $D9E6  60


sub_3E_D9E7:
    LDA $11                      ; $D9E7  A5 11
    PHA                          ; $D9E9  48
    AND #$0F                     ; $D9EA  29 0F
    STA $11                      ; $D9EC  85 11
    LDA $0378,X                  ; $D9EE  BD 78 03
    SEC                          ; $D9F1  38
    SBC $11                      ; $D9F2  E5 11
    STA $0378,X                  ; $D9F4  9D 78 03
    BCS loc_3E_DA01              ; $D9F7  B0 08
    SBC #$0F                     ; $D9F9  E9 0F
    STA $0378,X                  ; $D9FB  9D 78 03
    DEC $0390,X                  ; $D9FE  DE 90 03

loc_3E_DA01:
    PLA                          ; $DA01  68
    STA $11                      ; $DA02  85 11
    RTS                          ; $DA04  60


sub_3E_DA05:
    LDA $F5                      ; $DA05  A5 F5
    PHA                          ; $DA07  48
    LDA $F6                      ; $DA08  A5 F6
    PHA                          ; $DA0A  48
    LDA #$28                     ; $DA0B  A9 28
    STA $F6                      ; $DA0D  85 F6
    JSR sub_3F_FF37              ; $DA0F  20 37 FF
    LDA $FF                      ; $DA12  A5 FF
    AND #$FE                     ; $DA14  29 FE
    STA $2000                    ; $DA16  8D 00 20
    LDA $B800,X                  ; $DA19  BD 00 B8
    STA $02                      ; $DA1C  85 02
    LDA $B870,X                  ; $DA1E  BD 70 B8
    STA $03                      ; $DA21  85 03
    LDY #$00                     ; $DA23  A0 00

loc_3E_DA25:
    LDA ($02),Y                  ; $DA25  B1 02
    BMI loc_3E_DA3A              ; $DA27  30 11
    STA $0618,Y                  ; $DA29  99 18 06
    STA $0638,Y                  ; $DA2C  99 38 06
    INY                          ; $DA2F  C8
    CPY #$08                     ; $DA30  C0 08
    BNE loc_3E_DA25              ; $DA32  D0 F1
    LDA #$FF                     ; $DA34  A9 FF
    STA $18                      ; $DA36  85 18
    BNE loc_3E_DA3B              ; $DA38  D0 01

loc_3E_DA3A:
    INY                          ; $DA3A  C8

loc_3E_DA3B:
    LDA #$28                     ; $DA3B  A9 28
    STA $F6                      ; $DA3D  85 F6
    JSR sub_3F_FF37              ; $DA3F  20 37 FF
    LDA ($02),Y                  ; $DA42  B1 02
    BMI loc_3E_DA82              ; $DA44  30 3C
    PHA                          ; $DA46  48
    INY                          ; $DA47  C8
    LDA ($02),Y                  ; $DA48  B1 02
    STA $04                      ; $DA4A  85 04
    INY                          ; $DA4C  C8
    LDA ($02),Y                  ; $DA4D  B1 02
    STA $06                      ; $DA4F  85 06
    LDX #$00                     ; $DA51  A2 00
    STX $05                      ; $DA53  86 05
    INY                          ; $DA55  C8
    LDA $2002                    ; $DA56  AD 02 20
    LDA ($02),Y                  ; $DA59  B1 02
    STA $2006                    ; $DA5B  8D 06 20
    STX $2006                    ; $DA5E  8E 06 20
    STY $07                      ; $DA61  84 07
    PLA                          ; $DA63  68
    STA $F5                      ; $DA64  85 F5
    STA $F6                      ; $DA66  85 F6
    INC $F6                      ; $DA68  E6 F6
    JSR sub_3F_FF37              ; $DA6A  20 37 FF

loc_3E_DA6D:
    LDY #$00                     ; $DA6D  A0 00

loc_3E_DA6F:
    LDA ($05),Y                  ; $DA6F  B1 05
    STA $2007                    ; $DA71  8D 07 20
    INY                          ; $DA74  C8
    BNE loc_3E_DA6F              ; $DA75  D0 F8
    INC $06                      ; $DA77  E6 06
    DEC $04                      ; $DA79  C6 04
    BNE loc_3E_DA6D              ; $DA7B  D0 F0
    LDY $07                      ; $DA7D  A4 07
    INY                          ; $DA7F  C8
    BNE loc_3E_DA3B              ; $DA80  D0 B9

loc_3E_DA82:
    PLA                          ; $DA82  68
    STA $F6                      ; $DA83  85 F6
    PLA                          ; $DA85  68
    STA $F5                      ; $DA86  85 F5
    JMP sub_3F_FF37              ; $DA88  4C 37 FF


loc_3E_DA8B:
    STA $50                      ; $DA8B  85 50
    TAY                          ; $DA8D  A8
    LDA #$29                     ; $DA8E  A9 29
    STA $F6                      ; $DA90  85 F6
    JSR sub_3F_FF37              ; $DA92  20 37 FF
    LDA $B800,Y                  ; $DA95  B9 00 B8
    STA $52                      ; $DA98  85 52
    LDA $B860,Y                  ; $DA9A  B9 60 B8
    STA $53                      ; $DA9D  85 53
    LDY #$00                     ; $DA9F  A0 00
    STY $51                      ; $DAA1  84 51
    STY $55                      ; $DAA3  84 55

loc_3E_DAA5:
    INC $51                      ; $DAA5  E6 51
    LDA ($52),Y                  ; $DAA7  B1 52
    BMI loc_3E_DABA              ; $DAA9  30 0F
    STA $0618,Y                  ; $DAAB  99 18 06
    STA $0638,Y                  ; $DAAE  99 38 06
    INY                          ; $DAB1  C8
    CPY #$08                     ; $DAB2  C0 08
    BNE loc_3E_DAA5              ; $DAB4  D0 EF
    LDA #$FF                     ; $DAB6  A9 FF
    STA $18                      ; $DAB8  85 18

loc_3E_DABA:
    RTS                          ; $DABA  60


sub_3E_DABB:
    LDA $19                      ; $DABB  A5 19
    ORA $1A                      ; $DABD  05 1A
    BNE loc_3E_DB39              ; $DABF  D0 78
    LDA $55                      ; $DAC1  A5 55
    BNE loc_3E_DAEC              ; $DAC3  D0 27
    LDA #$29                     ; $DAC5  A9 29
    STA $F6                      ; $DAC7  85 F6
    JSR sub_3F_FF37              ; $DAC9  20 37 FF
    LDY $51                      ; $DACC  A4 51
    LDA ($52),Y                  ; $DACE  B1 52
    BMI loc_3E_DB39              ; $DAD0  30 67
    STA $54                      ; $DAD2  85 54
    INY                          ; $DAD4  C8
    LDA ($52),Y                  ; $DAD5  B1 52
    STA $55                      ; $DAD7  85 55
    INY                          ; $DAD9  C8
    LDA #$00                     ; $DADA  A9 00
    STA $56                      ; $DADC  85 56
    STA $58                      ; $DADE  85 58
    LDA ($52),Y                  ; $DAE0  B1 52
    STA $57                      ; $DAE2  85 57
    INY                          ; $DAE4  C8
    LDA ($52),Y                  ; $DAE5  B1 52
    STA $59                      ; $DAE7  85 59
    INY                          ; $DAE9  C8
    STY $51                      ; $DAEA  84 51

loc_3E_DAEC:
    LDA $59                      ; $DAEC  A5 59
    STA $0780                    ; $DAEE  8D 80 07
    LDA $58                      ; $DAF1  A5 58
    STA $0781                    ; $DAF3  8D 81 07
    LDA $54                      ; $DAF6  A5 54
    STA $F5                      ; $DAF8  85 F5
    STA $F6                      ; $DAFA  85 F6
    INC $F6                      ; $DAFC  E6 F6
    JSR sub_3F_FF37              ; $DAFE  20 37 FF
    LDY #$00                     ; $DB01  A0 00

loc_3E_DB03:
    LDA ($56),Y                  ; $DB03  B1 56
    STA $0783,Y                  ; $DB05  99 83 07
    INY                          ; $DB08  C8
    TYA                          ; $DB09  98
    AND #$0F                     ; $DB0A  29 0F
    BNE loc_3E_DB03              ; $DB0C  D0 F5
    DEC $55                      ; $DB0E  C6 55
    BEQ loc_3E_DB16              ; $DB10  F0 04
    CPY #$30                     ; $DB12  C0 30
    BNE loc_3E_DB03              ; $DB14  D0 ED

loc_3E_DB16:
    LDA #$FF                     ; $DB16  A9 FF
    STA $0783,Y                  ; $DB18  99 83 07
    TYA                          ; $DB1B  98
    CLC                          ; $DB1C  18
    ADC $56                      ; $DB1D  65 56
    STA $56                      ; $DB1F  85 56
    LDA $57                      ; $DB21  A5 57
    ADC #$00                     ; $DB23  69 00
    STA $57                      ; $DB25  85 57
    TYA                          ; $DB27  98
    CLC                          ; $DB28  18
    ADC $58                      ; $DB29  65 58
    STA $58                      ; $DB2B  85 58
    LDA $59                      ; $DB2D  A5 59
    ADC #$00                     ; $DB2F  69 00
    STA $59                      ; $DB31  85 59
    DEY                          ; $DB33  88
    STY $0782                    ; $DB34  8C 82 07
    STY $19                      ; $DB37  84 19

loc_3E_DB39:
    RTS                          ; $DB39  60


sub_3E_DB3A:
    JSR sub_3E_DF5F              ; $DB3A  20 5F DF
    INC $95                      ; $DB3D  E6 95
    LDA $95                      ; $DB3F  A5 95
    LSR A                        ; $DB41  4A
    BCS loc_3E_DB5C              ; $DB42  B0 18
    JSR sub_3E_DEE2              ; $DB44  20 E2 DE
    LDX #$00                     ; $DB47  A2 00
    STX $96                      ; $DB49  86 96

loc_3E_DB4B:
    LDA $0300,X                  ; $DB4B  BD 00 03
    BEQ loc_3E_DB53              ; $DB4E  F0 03
    JSR sub_3E_DB72              ; $DB50  20 72 DB

loc_3E_DB53:
    INC $96                      ; $DB53  E6 96
    LDX $96                      ; $DB55  A6 96
    CPX #$18                     ; $DB57  E0 18
    BNE loc_3E_DB4B              ; $DB59  D0 F0
    RTS                          ; $DB5B  60


loc_3E_DB5C:
    LDX #$17                     ; $DB5C  A2 17
    STX $96                      ; $DB5E  86 96

loc_3E_DB60:
    LDA $0300,X                  ; $DB60  BD 00 03
    BEQ loc_3E_DB68              ; $DB63  F0 03
    JSR sub_3E_DB72              ; $DB65  20 72 DB

loc_3E_DB68:
    DEC $96                      ; $DB68  C6 96
    LDX $96                      ; $DB6A  A6 96
    BPL loc_3E_DB60              ; $DB6C  10 F2
    JSR sub_3E_DEF2              ; $DB6E  20 F2 DE
    RTS                          ; $DB71  60


sub_3E_DB72:
    LDA $0528,X                  ; $DB72  BD 28 05
    AND #$10                     ; $DB75  29 10
    BNE loc_3E_DB7C              ; $DB77  D0 03
    JMP loc_3E_DC50              ; $DB79  4C 50 DC


loc_3E_DB7C:
    LDA $0330,X                  ; $DB7C  BD 30 03
    SEC                          ; $DB7F  38
    SBC $FC                      ; $DB80  E5 FC
    STA $13                      ; $DB82  85 13
    STA $00                      ; $DB84  85 00
    LDA $0348,X                  ; $DB86  BD 48 03
    SBC $F9                      ; $DB89  E5 F9
    STA $01                      ; $DB8B  85 01
    BEQ loc_3E_DBC7              ; $DB8D  F0 38
    LDA $0528,X                  ; $DB8F  BD 28 05
    AND #$08                     ; $DB92  29 08
    BEQ loc_3E_DBDA              ; $DB94  F0 44
    BCS loc_3E_DBA0              ; $DB96  B0 08
    LDA $13                      ; $DB98  A5 13
    EOR #$FF                     ; $DB9A  49 FF
    ADC #$01                     ; $DB9C  69 01
    STA $00                      ; $DB9E  85 00

loc_3E_DBA0:
    LDA $0300,X                  ; $DBA0  BD 00 03
    CMP #$20                     ; $DBA3  C9 20
    BCC loc_3E_DBBE              ; $DBA5  90 17
    CMP #$24                     ; $DBA7  C9 24
    BCS loc_3E_DBBE              ; $DBA9  B0 13
    LDA $01                      ; $DBAB  A5 01
    BPL loc_3E_DBB3              ; $DBAD  10 04
    EOR #$FF                     ; $DBAF  49 FF
    ADC #$01                     ; $DBB1  69 01

loc_3E_DBB3:
    CMP #$02                     ; $DBB3  C9 02
    BCC loc_3E_DBC4              ; $DBB5  90 0D
    LDA $0420,X                  ; $DBB7  BD 20 04
    BNE loc_3E_DBC4              ; $DBBA  D0 08
    BEQ loc_3E_DBDA              ; $DBBC  F0 1C

loc_3E_DBBE:
    LDA $00                      ; $DBBE  A5 00
    CMP #$30                     ; $DBC0  C9 30
    BCS loc_3E_DBDA              ; $DBC2  B0 16

loc_3E_DBC4:
    JMP loc_3E_DC45              ; $DBC4  4C 45 DC


loc_3E_DBC7:
    LDA $0390,X                  ; $DBC7  BD 90 03
    BEQ loc_3E_DBD7              ; $DBCA  F0 0B
    CPX #$00                     ; $DBCC  E0 00
    BEQ loc_3E_DC14              ; $DBCE  F0 44
    LDA $0390,X                  ; $DBD0  BD 90 03
    BMI loc_3E_DBC4              ; $DBD3  30 EF
    BPL loc_3E_DBDA              ; $DBD5  10 03

loc_3E_DBD7:
    JMP loc_3E_DC55              ; $DBD7  4C 55 DC


loc_3E_DBDA:
    LDA $0558,X                  ; $DBDA  BD 58 05
    CMP #$55                     ; $DBDD  C9 55
    BEQ loc_3E_DC45              ; $DBDF  F0 64
    CMP #$71                     ; $DBE1  C9 71
    BEQ loc_3E_DC45              ; $DBE3  F0 60
    LDA $0300,X                  ; $DBE5  BD 00 03
    CMP #$26                     ; $DBE8  C9 26
    BEQ loc_3E_DC45              ; $DBEA  F0 59
    CMP #$96                     ; $DBEC  C9 96
    BEQ loc_3E_DC45              ; $DBEE  F0 55
    CMP #$99                     ; $DBF0  C9 99
    BEQ loc_3E_DC45              ; $DBF2  F0 51
    CMP #$BB                     ; $DBF4  C9 BB
    BEQ loc_3E_DC45              ; $DBF6  F0 4D
    CMP #$BC                     ; $DBF8  C9 BC
    BEQ loc_3E_DC45              ; $DBFA  F0 49
    CMP #$4D                     ; $DBFC  C9 4D
    BEQ loc_3E_DC45              ; $DBFE  F0 45

sub_3E_DC00:
    LDA #$00                     ; $DC00  A9 00
    STA $05A0,X                  ; $DC02  9D A0 05
    STA $0300,X                  ; $DC05  9D 00 03
    STA $05B8,X                  ; $DC08  9D B8 05
    STA $0450,X                  ; $DC0B  9D 50 04
    LDA #$FF                     ; $DC0E  A9 FF
    STA $0438,X                  ; $DC10  9D 38 04
    RTS                          ; $DC13  60


loc_3E_DC14:
    LDA $0390,X                  ; $DC14  BD 90 03
    BMI loc_3E_DC45              ; $DC17  30 2C
    LDA #$07                     ; $DC19  A9 07
    CMP $30                      ; $DC1B  C5 30
    BEQ loc_3E_DC45              ; $DC1D  F0 26
    STA $30                      ; $DC1F  85 30
    LDA #$00                     ; $DC21  A9 00
    STA $AD                      ; $DC23  85 AD
    LDA #$F0                     ; $DC25  A9 F0
    JSR sub_3F_F6BC              ; $DC27  20 BC F6
    LDA #$25                     ; $DC2A  A9 25
    JSR sub_3F_F6BE              ; $DC2C  20 BE F6
    LDA #$2C                     ; $DC2F  A9 2C
    STA $0133                    ; $DC31  8D 33 01
    LDA #$01                     ; $DC34  A9 01
    STA $0134                    ; $DC36  8D 34 01
    BNE loc_3E_DC45              ; $DC39  D0 0A
    LDA #$00                     ; $DC3B  A9 00
    STA $03D8                    ; $DC3D  8D D8 03
    LDA #$0C                     ; $DC40  A9 0C
    STA $03F0                    ; $DC42  8D F0 03

loc_3E_DC45:
    LDA $0528,X                  ; $DC45  BD 28 05
    AND #$7F                     ; $DC48  29 7F
    STA $0528,X                  ; $DC4A  9D 28 05
    JMP loc_3E_DC67              ; $DC4D  4C 67 DC


loc_3E_DC50:
    LDA $0330,X                  ; $DC50  BD 30 03
    STA $13                      ; $DC53  85 13

loc_3E_DC55:
    LDA $0378,X                  ; $DC55  BD 78 03
    STA $12                      ; $DC58  85 12
    LDA $0528,X                  ; $DC5A  BD 28 05
    ORA #$80                     ; $DC5D  09 80
    STA $0528,X                  ; $DC5F  9D 28 05
    AND #$04                     ; $DC62  29 04
    BEQ loc_3E_DC67              ; $DC64  F0 01

loc_3E_DC66:
    RTS                          ; $DC66  60


loc_3E_DC67:
    LDY $0300,X                  ; $DC67  BC 00 03
    LDA $DFFA,Y                  ; $DC6A  B9 FA DF
    CMP $F6                      ; $DC6D  C5 F6
    BEQ loc_3E_DC7A              ; $DC6F  F0 09
    STA $F6                      ; $DC71  85 F6
    STA $F5                      ; $DC73  85 F5
    DEC $F5                      ; $DC75  C6 F5
    JSR sub_3F_FF37              ; $DC77  20 37 FF

loc_3E_DC7A:
    LDY #$00                     ; $DC7A  A0 00
    LDA $0528,X                  ; $DC7C  BD 28 05
    AND #$40                     ; $DC7F  29 40
    STA $10                      ; $DC81  85 10
    BEQ loc_3E_DC86              ; $DC83  F0 01
    INY                          ; $DC85  C8

loc_3E_DC86:
    STY $11                      ; $DC86  84 11
    LDY $0558,X                  ; $DC88  BC 58 05
    BEQ loc_3E_DC66              ; $DC8B  F0 D9
    LDA $BE00,Y                  ; $DC8D  B9 00 BE
    STA $00                      ; $DC90  85 00
    LDA $BF00,Y                  ; $DC92  B9 00 BF
    STA $01                      ; $DC95  85 01
    LDY #$00                     ; $DC97  A0 00
    LDA ($00),Y                  ; $DC99  B1 00
    STA $02                      ; $DC9B  85 02
    AND #$7F                     ; $DC9D  29 7F
    STA $03                      ; $DC9F  85 03
    LDA $6B                      ; $DCA1  A5 6B
    BNE loc_3E_DCE2              ; $DCA3  D0 3D
    LDA $05B8,X                  ; $DCA5  BD B8 05
    BEQ loc_3E_DCB7              ; $DCA8  F0 0D
    DEC $05B8,X                  ; $DCAA  DE B8 05
    LDA $05B8,X                  ; $DCAD  BD B8 05
    AND #$7F                     ; $DCB0  29 7F
    BNE loc_3E_DCB7              ; $DCB2  D0 03
    STA $05B8,X                  ; $DCB4  9D B8 05

loc_3E_DCB7:
    LDA $05B8,X                  ; $DCB7  BD B8 05
    BMI loc_3E_DCE2              ; $DCBA  30 26
    LDA $0570,X                  ; $DCBC  BD 70 05
    AND #$7F                     ; $DCBF  29 7F
    INC $0570,X                  ; $DCC1  FE 70 05
    INY                          ; $DCC4  C8
    CMP ($00),Y                  ; $DCC5  D1 00
    BNE loc_3E_DCE2              ; $DCC7  D0 19
    LDA $0570,X                  ; $DCC9  BD 70 05
    AND #$80                     ; $DCCC  29 80
    STA $0570,X                  ; $DCCE  9D 70 05
    LDA $0540,X                  ; $DCD1  BD 40 05
    AND #$7F                     ; $DCD4  29 7F
    INC $0540,X                  ; $DCD6  FE 40 05
    CMP $03                      ; $DCD9  C5 03
    BNE loc_3E_DCE2              ; $DCDB  D0 05
    LDA #$00                     ; $DCDD  A9 00
    STA $0540,X                  ; $DCDF  9D 40 05

loc_3E_DCE2:
    LDA $0528,X                  ; $DCE2  BD 28 05
    BPL loc_3E_DD48              ; $DCE5  10 61
    CPX $0146                    ; $DCE7  EC 46 01
    BNE loc_3E_DD16              ; $DCEA  D0 2A
    LDA $0132                    ; $DCEC  AD 32 01
    BPL loc_3E_DD16              ; $DCEF  10 25
    JSR sub_3E_DE4A              ; $DCF1  20 4A DE
    LDA $05B8,X                  ; $DCF4  BD B8 05
    BEQ loc_3E_DD30              ; $DCF7  F0 37
    BMI loc_3E_DD30              ; $DCF9  30 35
    LSR A                        ; $DCFB  4A
    LSR A                        ; $DCFC  4A
    BCC loc_3E_DD30              ; $DCFD  90 31
    LDY $22                      ; $DCFF  A4 22
    LDA $DD5E,Y                  ; $DD01  B9 5E DD
    BEQ loc_3E_DD10              ; $DD04  F0 0A
    CPY #$0E                     ; $DD06  C0 0E
    BNE loc_3E_DD6E              ; $DD08  D0 64
    LDY $F9                      ; $DD0A  A4 F9
    CPY #$0B                     ; $DD0C  C0 0B
    BNE loc_3E_DD6E              ; $DD0E  D0 5E

loc_3E_DD10:
    JSR sub_3E_DE72              ; $DD10  20 72 DE
    JMP loc_3E_DD30              ; $DD13  4C 30 DD


loc_3E_DD16:
    LDA $05B8,X                  ; $DD16  BD B8 05
    BEQ loc_3E_DD30              ; $DD19  F0 15
    BMI loc_3E_DD30              ; $DD1B  30 13
    LDY $0300,X                  ; $DD1D  BC 00 03
    CPY #$24                     ; $DD20  C0 24
    BEQ loc_3E_DD49              ; $DD22  F0 25
    CPY #$2B                     ; $DD24  C0 2B
    BEQ loc_3E_DD50              ; $DD26  F0 28
    CPY #$52                     ; $DD28  C0 52
    BEQ loc_3E_DD57              ; $DD2A  F0 2B
    LSR A                        ; $DD2C  4A
    LSR A                        ; $DD2D  4A
    BCS loc_3E_DD48              ; $DD2E  B0 18

loc_3E_DD30:
    LDA $0540,X                  ; $DD30  BD 40 05
    AND #$7F                     ; $DD33  29 7F
    CLC                          ; $DD35  18
    ADC #$02                     ; $DD36  69 02
    TAY                          ; $DD38  A8
    LDA ($00),Y                  ; $DD39  B1 00
    BNE loc_3E_DD6E              ; $DD3B  D0 31
    STA $05A0,X                  ; $DD3D  9D A0 05
    STA $0300,X                  ; $DD40  9D 00 03
    LDA #$FF                     ; $DD43  A9 FF
    STA $0438,X                  ; $DD45  9D 38 04

loc_3E_DD48:
    RTS                          ; $DD48  60


loc_3E_DD49:
    LDY #$03                     ; $DD49  A0 03
    LDA #$03                     ; $DD4B  A9 03
    JMP loc_3E_DE8D              ; $DD4D  4C 8D DE


loc_3E_DD50:
    LDY #$0B                     ; $DD50  A0 0B
    LDA #$07                     ; $DD52  A9 07
    JMP loc_3E_DE8D              ; $DD54  4C 8D DE


loc_3E_DD57:
    LDY #$0F                     ; $DD57  A0 0F
    LDA #$07                     ; $DD59  A9 07
    JMP loc_3E_DE8D              ; $DD5B  4C 8D DE

    .byte $DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$00,$00,$DF,$00,$00,$00,$DF,$8B  ; $DD5E

loc_3E_DD6E:
    TAY                          ; $DD6E  A8
    LDA $02                      ; $DD6F  A5 02
    BMI loc_3E_DD80              ; $DD71  30 0D
    LDA $B800,Y                  ; $DD73  B9 00 B8
    STA $02                      ; $DD76  85 02
    LDA $BA00,Y                  ; $DD78  B9 00 BA
    STA $03                      ; $DD7B  85 03
    JMP loc_3E_DD8A              ; $DD7D  4C 8A DD


loc_3E_DD80:
    LDA $B900,Y                  ; $DD80  B9 00 B9
    STA $02                      ; $DD83  85 02
    LDA $BB00,Y                  ; $DD85  B9 00 BB
    STA $03                      ; $DD88  85 03

loc_3E_DD8A:
    LDY #$00                     ; $DD8A  A0 00
    STY $00                      ; $DD8C  84 00
    LDA $0300,X                  ; $DD8E  BD 00 03
    STA $01                      ; $DD91  85 01
    CMP #$0B                     ; $DD93  C9 0B
    BNE loc_3E_DD9C              ; $DD95  D0 05
    LDA $0468,X                  ; $DD97  BD 68 04
    STA $00                      ; $DD9A  85 00

loc_3E_DD9C:
    LDA ($02),Y                  ; $DD9C  B1 02
    STA $04                      ; $DD9E  85 04
    INY                          ; $DDA0  C8
    LDA ($02),Y                  ; $DDA1  B1 02
    CLC                          ; $DDA3  18
    ADC $11                      ; $DDA4  65 11
    PHA                          ; $DDA6  48
    LDA $0528,X                  ; $DDA7  BD 28 05
    AND #$20                     ; $DDAA  29 20
    STA $11                      ; $DDAC  85 11
    PLA                          ; $DDAE  68
    TAX                          ; $DDAF  AA
    LDA $BC00,X                  ; $DDB0  BD 00 BC
    SEC                          ; $DDB3  38
    SBC #$02                     ; $DDB4  E9 02
    STA $05                      ; $DDB6  85 05
    LDA $BD00,X                  ; $DDB8  BD 00 BD
    SBC #$00                     ; $DDBB  E9 00
    STA $06                      ; $DDBD  85 06
    LDX $97                      ; $DDBF  A6 97
    BEQ loc_3E_DE41              ; $DDC1  F0 7E

loc_3E_DDC3:
    INY                          ; $DDC3  C8
    LDA ($02),Y                  ; $DDC4  B1 02
    STA $0201,X                  ; $DDC6  9D 01 02
    LDA $00                      ; $DDC9  A5 00
    BEQ loc_3E_DDE9              ; $DDCB  F0 1C
    LDA $12                      ; $DDCD  A5 12
    CLC                          ; $DDCF  18
    ADC ($05),Y                  ; $DDD0  71 05
    STA $0200,X                  ; $DDD2  9D 00 02
    BCS loc_3E_DDE1              ; $DDD5  B0 0A
    CMP #$F8                     ; $DDD7  C9 F8
    BCS loc_3E_DE42              ; $DDD9  B0 67
    CMP $00                      ; $DDDB  C5 00
    BCS loc_3E_DE42              ; $DDDD  B0 63
    BCC loc_3E_DDFB              ; $DDDF  90 1A

loc_3E_DDE1:
    LDA ($05),Y                  ; $DDE1  B1 05
    CMP #$C0                     ; $DDE3  C9 C0
    BCS loc_3E_DDFB              ; $DDE5  B0 14
    BCC loc_3E_DE42              ; $DDE7  90 59

loc_3E_DDE9:
    LDA $12                      ; $DDE9  A5 12
    CLC                          ; $DDEB  18
    ADC ($05),Y                  ; $DDEC  71 05
    STA $0200,X                  ; $DDEE  9D 00 02
    LDA ($05),Y                  ; $DDF1  B1 05
    BMI loc_3E_DDF9              ; $DDF3  30 04
    BCC loc_3E_DDFB              ; $DDF5  90 04
    BCS loc_3E_DE42              ; $DDF7  B0 49

loc_3E_DDF9:
    BCC loc_3E_DE42              ; $DDF9  90 47

loc_3E_DDFB:
    LDA $01                      ; $DDFB  A5 01
    CMP #$88                     ; $DDFD  C9 88
    BNE loc_3E_DE0C              ; $DDFF  D0 0B
    LDA $038F                    ; $DE01  AD 8F 03
    CLC                          ; $DE04  18
    ADC #$03                     ; $DE05  69 03
    CMP $0200,X                  ; $DE07  DD 00 02
    BCS loc_3E_DE42              ; $DE0A  B0 36

loc_3E_DE0C:
    INY                          ; $DE0C  C8
    LDA $EF                      ; $DE0D  A5 EF
    BEQ loc_3E_DE1A              ; $DE0F  F0 09
    CMP $0200,X                  ; $DE11  DD 00 02
    BCS loc_3E_DE1A              ; $DE14  B0 04
    LDA #$20                     ; $DE16  A9 20
    STA $11                      ; $DE18  85 11

loc_3E_DE1A:
    LDA ($02),Y                  ; $DE1A  B1 02
    EOR $10                      ; $DE1C  45 10
    ORA $11                      ; $DE1E  05 11
    STA $0202,X                  ; $DE20  9D 02 02
    LDA $13                      ; $DE23  A5 13
    CLC                          ; $DE25  18
    ADC ($05),Y                  ; $DE26  71 05
    STA $0203,X                  ; $DE28  9D 03 02
    LDA ($05),Y                  ; $DE2B  B1 05
    BMI loc_3E_DE33              ; $DE2D  30 04
    BCC loc_3E_DE35              ; $DE2F  90 04
    BCS loc_3E_DE43              ; $DE31  B0 10

loc_3E_DE33:
    BCC loc_3E_DE43              ; $DE33  90 0E

loc_3E_DE35:
    INX                          ; $DE35  E8
    INX                          ; $DE36  E8
    INX                          ; $DE37  E8
    INX                          ; $DE38  E8
    STX $97                      ; $DE39  86 97
    BEQ loc_3E_DE41              ; $DE3B  F0 04

loc_3E_DE3D:
    DEC $04                      ; $DE3D  C6 04
    BPL loc_3E_DDC3              ; $DE3F  10 82

loc_3E_DE41:
    RTS                          ; $DE41  60


loc_3E_DE42:
    INY                          ; $DE42  C8

loc_3E_DE43:
    LDA #$F8                     ; $DE43  A9 F8
    STA $0200,X                  ; $DE45  9D 00 02
    BNE loc_3E_DE3D              ; $DE48  D0 F3

sub_3E_DE4A:
    LDY #$03                     ; $DE4A  A0 03

loc_3E_DE4C:
    LDA $0624,Y                  ; $DE4C  B9 24 06
    STA $0604,Y                  ; $DE4F  99 04 06
    LDA $0628,Y                  ; $DE52  B9 28 06
    STA $0608,Y                  ; $DE55  99 08 06
    LDA $062C,Y                  ; $DE58  B9 2C 06
    STA $060C,Y                  ; $DE5B  99 0C 06
    LDA $0638,Y                  ; $DE5E  B9 38 06
    STA $0618,Y                  ; $DE61  99 18 06
    LDA $063C,Y                  ; $DE64  B9 3C 06
    STA $061C,Y                  ; $DE67  99 1C 06
    DEY                          ; $DE6A  88
    BNE loc_3E_DE4C              ; $DE6B  D0 DF
    LDA #$FF                     ; $DE6D  A9 FF
    STA $18                      ; $DE6F  85 18
    RTS                          ; $DE71  60


sub_3E_DE72:
    LDY #$03                     ; $DE72  A0 03
    LDA #$20                     ; $DE74  A9 20

loc_3E_DE76:
    STA $0604,Y                  ; $DE76  99 04 06
    STA $0608,Y                  ; $DE79  99 08 06
    STA $060C,Y                  ; $DE7C  99 0C 06
    STA $0618,Y                  ; $DE7F  99 18 06
    STA $061C,Y                  ; $DE82  99 1C 06
    DEY                          ; $DE85  88
    BNE loc_3E_DE76              ; $DE86  D0 EE
    LDA #$FF                     ; $DE88  A9 FF
    STA $18                      ; $DE8A  85 18
    RTS                          ; $DE8C  60


loc_3E_DE8D:
    STA $03                      ; $DE8D  85 03
    LDA $05B8,X                  ; $DE8F  BD B8 05
    LSR A                        ; $DE92  4A
    LSR A                        ; $DE93  4A
    BCC loc_3E_DEB7              ; $DE94  90 21

loc_3E_DE96:
    LDA #$20                     ; $DE96  A9 20
    STA $0600,Y                  ; $DE98  99 00 06

loc_3E_DE9B:
    DEY                          ; $DE9B  88
    DEC $03                      ; $DE9C  C6 03
    BEQ loc_3E_DEA8              ; $DE9E  F0 08
    LDA $03                      ; $DEA0  A5 03
    AND #$03                     ; $DEA2  29 03
    BNE loc_3E_DE96              ; $DEA4  D0 F0
    BEQ loc_3E_DE9B              ; $DEA6  F0 F3

loc_3E_DEA8:
    LDA #$20                     ; $DEA8  A9 20
    LDY #$03                     ; $DEAA  A0 03

loc_3E_DEAC:
    STA $0618,Y                  ; $DEAC  99 18 06
    STA $061C,Y                  ; $DEAF  99 1C 06
    DEY                          ; $DEB2  88
    BNE loc_3E_DEAC              ; $DEB3  D0 F7
    BEQ loc_3E_DEDB              ; $DEB5  F0 24

loc_3E_DEB7:
    LDA $0620,Y                  ; $DEB7  B9 20 06
    STA $0600,Y                  ; $DEBA  99 00 06

loc_3E_DEBD:
    DEY                          ; $DEBD  88
    DEC $03                      ; $DEBE  C6 03
    BEQ loc_3E_DECA              ; $DEC0  F0 08
    LDA $03                      ; $DEC2  A5 03
    AND #$03                     ; $DEC4  29 03
    BNE loc_3E_DEB7              ; $DEC6  D0 EF
    BEQ loc_3E_DEBD              ; $DEC8  F0 F3

loc_3E_DECA:
    LDY #$03                     ; $DECA  A0 03

loc_3E_DECC:
    LDA $0638,Y                  ; $DECC  B9 38 06
    STA $0618,Y                  ; $DECF  99 18 06
    LDA $063C,Y                  ; $DED2  B9 3C 06
    STA $061C,Y                  ; $DED5  99 1C 06
    DEY                          ; $DED8  88
    BNE loc_3E_DECC              ; $DED9  D0 F1

loc_3E_DEDB:
    LDA #$FF                     ; $DEDB  A9 FF
    STA $18                      ; $DEDD  85 18
    JMP loc_3E_DD30              ; $DEDF  4C 30 DD


sub_3E_DEE2:
    LDX #$00                     ; $DEE2  A2 00
    STX $10                      ; $DEE4  86 10

loc_3E_DEE6:
    JSR sub_3E_DF00              ; $DEE6  20 00 DF
    INC $10                      ; $DEE9  E6 10
    LDX $10                      ; $DEEB  A6 10
    CPX #$03                     ; $DEED  E0 03
    BNE loc_3E_DEE6              ; $DEEF  D0 F5
    RTS                          ; $DEF1  60


sub_3E_DEF2:
    LDX #$02                     ; $DEF2  A2 02
    STX $10                      ; $DEF4  86 10

loc_3E_DEF6:
    JSR sub_3E_DF00              ; $DEF6  20 00 DF
    DEC $10                      ; $DEF9  C6 10
    LDX $10                      ; $DEFB  A6 10
    BPL loc_3E_DEF6              ; $DEFD  10 F7

loc_3E_DEFF:
    RTS                          ; $DEFF  60


sub_3E_DF00:
    LDA $0130,X                  ; $DF00  BD 30 01
    BPL loc_3E_DEFF              ; $DF03  10 FA
    AND #$7F                     ; $DF05  29 7F
    TAY                          ; $DF07  A8
    LDA $00B0,Y                  ; $DF08  B9 B0 00
    AND #$7F                     ; $DF0B  29 7F
    STA $00                      ; $DF0D  85 00
    LDA $DF59,X                  ; $DF0F  BD 59 DF
    STA $01                      ; $DF12  85 01
    LDA $DF5C,X                  ; $DF14  BD 5C DF
    STA $02                      ; $DF17  85 02
    LDX $97                      ; $DF19  A6 97
    BEQ loc_3E_DF56              ; $DF1B  F0 39
    LDA #$48                     ; $DF1D  A9 48
    STA $03                      ; $DF1F  85 03

loc_3E_DF21:
    LDA $01                      ; $DF21  A5 01
    STA $0202,X                  ; $DF23  9D 02 02
    LDA $02                      ; $DF26  A5 02
    STA $0203,X                  ; $DF28  9D 03 02
    LDA $03                      ; $DF2B  A5 03
    STA $0200,X                  ; $DF2D  9D 00 02
    LDY #$04                     ; $DF30  A0 04
    LDA $00                      ; $DF32  A5 00
    SEC                          ; $DF34  38
    SBC #$04                     ; $DF35  E9 04
    BCS loc_3E_DF3D              ; $DF37  B0 04
    LDY $00                      ; $DF39  A4 00
    LDA #$00                     ; $DF3B  A9 00

loc_3E_DF3D:
    STA $00                      ; $DF3D  85 00
    TYA                          ; $DF3F  98
    ORA #$80                     ; $DF40  09 80
    STA $0201,X                  ; $DF42  9D 01 02
    INX                          ; $DF45  E8
    INX                          ; $DF46  E8
    INX                          ; $DF47  E8
    INX                          ; $DF48  E8
    BEQ loc_3E_DF56              ; $DF49  F0 0B
    LDA $03                      ; $DF4B  A5 03
    SEC                          ; $DF4D  38
    SBC #$08                     ; $DF4E  E9 08
    STA $03                      ; $DF50  85 03
    CMP #$10                     ; $DF52  C9 10
    BNE loc_3E_DF21              ; $DF54  D0 CB

loc_3E_DF56:
    STX $97                      ; $DF56  86 97
    RTS                          ; $DF58  60

    .byte $01,$00,$02,$18,$10,$28  ; $DF59

sub_3E_DF5F:
    LDA $013A                    ; $DF5F  AD 3A 01
    BEQ loc_3E_DFBD              ; $DF62  F0 59
    DEC $013A                    ; $DF64  CE 3A 01
    LDA $013A                    ; $DF67  AD 3A 01
    AND #$07                     ; $DF6A  29 07
    BNE loc_3E_DF73              ; $DF6C  D0 05
    LDA #$18                     ; $DF6E  A9 18
    JSR sub_3F_F6BE              ; $DF70  20 BE F6

loc_3E_DF73:
    LDX #$74                     ; $DF73  A2 74
    LDY #$3A                     ; $DF75  A0 3A

loc_3E_DF77:
    LDA $0145                    ; $DF77  AD 45 01
    CMP #$10                     ; $DF7A  C9 10
    BCS loc_3E_DF8A              ; $DF7C  B0 0C
    LDA #$99                     ; $DF7E  A9 99
    STA $0201,X                  ; $DF80  9D 01 02
    LDA #$00                     ; $DF83  A9 00
    STA $0202,X                  ; $DF85  9D 02 02
    BEQ loc_3E_DF94              ; $DF88  F0 0A

loc_3E_DF8A:
    LDA #$FF                     ; $DF8A  A9 FF
    STA $0201,X                  ; $DF8C  9D 01 02
    LDA #$03                     ; $DF8F  A9 03
    STA $0202,X                  ; $DF91  9D 02 02

loc_3E_DF94:
    LDA $DFBF,Y                  ; $DF94  B9 BF DF
    SEC                          ; $DF97  38
    SBC $013B                    ; $DF98  ED 3B 01
    STA $0203,X                  ; $DF9B  9D 03 02
    LDA $DFBE,Y                  ; $DF9E  B9 BE DF
    CLC                          ; $DFA1  18
    ADC $013B                    ; $DFA2  6D 3B 01
    STA $0200,X                  ; $DFA5  9D 00 02
    DEY                          ; $DFA8  88
    DEY                          ; $DFA9  88
    DEX                          ; $DFAA  CA
    DEX                          ; $DFAB  CA
    DEX                          ; $DFAC  CA
    DEX                          ; $DFAD  CA
    BPL loc_3E_DF77              ; $DFAE  10 C7
    LDA $013B                    ; $DFB0  AD 3B 01
    CLC                          ; $DFB3  18
    ADC #$04                     ; $DFB4  69 04
    STA $013B                    ; $DFB6  8D 3B 01
    LDA #$78                     ; $DFB9  A9 78
    STA $97                      ; $DFBB  85 97

loc_3E_DFBD:
    RTS                          ; $DFBD  60

    .byte $00,$30,$00,$50,$00,$70,$00,$90,$00,$B0,$00,$D0,$00,$F0,$18,$F8  ; $DFBE
    .byte $30,$60,$38,$38,$38,$B8,$38,$F8,$40,$70,$48,$70,$58,$F8,$60,$30  ; $DFCE
    .byte $60,$B0,$70,$80,$78,$B8,$78,$F8,$80,$30,$88,$C8,$90,$40,$98,$F8  ; $DFDE
    .byte $A8,$48,$A8,$60,$B8,$78,$B8,$98,$B8,$B8,$B8,$F8,$0D,$0D,$0D,$0D  ; $DFEE
    .byte $0D,$0D  ; $DFFE
