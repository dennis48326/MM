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
    LDA $F0                      ; $C006  A5 F0
    BEQ loc_1E_C00D              ; $C008  F0 03
    JMP loc_1E_C107              ; $C00A  4C 07 C1


loc_1E_C00D:
    LDA $95                      ; $C00D  A5 95
    BEQ loc_1E_C014              ; $C00F  F0 03
    JMP loc_1E_C0BE              ; $C011  4C BE C0


loc_1E_C014:
    LDA $19                      ; $C014  A5 19
    ORA $1A                      ; $C016  05 1A
    STA $60                      ; $C018  85 60
    LDA $FA                      ; $C01A  A5 FA
    STA $A2                      ; $C01C  85 A2
    LDA $FC                      ; $C01E  A5 FC
    STA $A4                      ; $C020  85 A4
    LDA $FD                      ; $C022  A5 FD
    AND #$03                     ; $C024  29 03
    STA $A5                      ; $C026  85 A5
    LDA $9B                      ; $C028  A5 9B
    STA $9C                      ; $C02A  85 9C
    LDA $99                      ; $C02C  A5 99
    STA $9A                      ; $C02E  85 9A
    CMP #$05                     ; $C030  C9 05
    BNE loc_1E_C038              ; $C032  D0 04
    LDA $78                      ; $C034  A5 78
    STA $A4                      ; $C036  85 A4

loc_1E_C038:
    LDA $FF                      ; $C038  A5 FF
    AND #$78                     ; $C03A  29 78
    STA $2000                    ; $C03C  8D 00 20
    LDA #$00                     ; $C03F  A9 00
    STA $2001                    ; $C041  8D 01 20
    STA $2003                    ; $C044  8D 03 20
    LDA #$02                     ; $C047  A9 02
    STA $4014                    ; $C049  8D 14 40
    LDA $1C                      ; $C04C  A5 1C
    BEQ loc_1E_C059              ; $C04E  F0 09
    LDA #$00                     ; $C050  A9 00
    STA $1C                      ; $C052  85 1C
    LDX #$50                     ; $C054  A2 50
    JSR sub_1E_C29C              ; $C056  20 9C C2

loc_1E_C059:
    LDA $19                      ; $C059  A5 19
    BEQ loc_1E_C060              ; $C05B  F0 03
    JSR sub_1E_C298              ; $C05D  20 98 C2

loc_1E_C060:
    LDA $1A                      ; $C060  A5 1A
    BEQ loc_1E_C07B              ; $C062  F0 17
    LDA $FF                      ; $C064  A5 FF
    AND #$7F                     ; $C066  29 7F
    ORA #$04                     ; $C068  09 04
    STA $2000                    ; $C06A  8D 00 20
    LDX #$00                     ; $C06D  A2 00
    STX $1A                      ; $C06F  86 1A
    JSR sub_1E_C29C              ; $C071  20 9C C2
    LDA $FF                      ; $C074  A5 FF
    AND #$7F                     ; $C076  29 7F
    STA $2000                    ; $C078  8D 00 20

loc_1E_C07B:
    LDA $18                      ; $C07B  A5 18
    BEQ loc_1E_C0AC              ; $C07D  F0 2D
    LDA $60                      ; $C07F  A5 60
    BNE loc_1E_C0AC              ; $C081  D0 29
    LDX #$00                     ; $C083  A2 00
    STX $18                      ; $C085  86 18
    LDA $2002                    ; $C087  AD 02 20
    LDA #$3F                     ; $C08A  A9 3F
    STA $2006                    ; $C08C  8D 06 20
    STX $2006                    ; $C08F  8E 06 20
    LDY #$20                     ; $C092  A0 20

loc_1E_C094:
    LDA $0600,X                  ; $C094  BD 00 06
    STA $2007                    ; $C097  8D 07 20
    INX                          ; $C09A  E8
    DEY                          ; $C09B  88
    BNE loc_1E_C094              ; $C09C  D0 F6
    LDA #$3F                     ; $C09E  A9 3F
    STA $2006                    ; $C0A0  8D 06 20
    STY $2006                    ; $C0A3  8C 06 20
    STY $2006                    ; $C0A6  8C 06 20
    STY $2006                    ; $C0A9  8C 06 20

loc_1E_C0AC:
    LDX #$05                     ; $C0AC  A2 05

loc_1E_C0AE:
    STX $8000                    ; $C0AE  8E 00 80
    LDA $EA,X                    ; $C0B1  B5 EA
    STA $8001                    ; $C0B3  8D 01 80
    DEX                          ; $C0B6  CA
    BPL loc_1E_C0AE              ; $C0B7  10 F5
    LDA $F2                      ; $C0B9  A5 F2
    STA $8000                    ; $C0BB  8D 00 80

loc_1E_C0BE:
    LDA $9A                      ; $C0BE  A5 9A
    CMP #$04                     ; $C0C0  C9 04
    BNE loc_1E_C0D3              ; $C0C2  D0 0F
    LDA $2002                    ; $C0C4  AD 02 20
    LDA $78                      ; $C0C7  A5 78
    STA $2005                    ; $C0C9  8D 05 20
    LDA #$00                     ; $C0CC  A9 00
    STA $2005                    ; $C0CE  8D 05 20
    BEQ loc_1E_C0E0              ; $C0D1  F0 0D

loc_1E_C0D3:
    LDA $2002                    ; $C0D3  AD 02 20
    LDA $A4                      ; $C0D6  A5 A4
    STA $2005                    ; $C0D8  8D 05 20
    LDA $A2                      ; $C0DB  A5 A2
    STA $2005                    ; $C0DD  8D 05 20

loc_1E_C0E0:
    LDA $FE                      ; $C0E0  A5 FE
    STA $2001                    ; $C0E2  8D 01 20
    LDA $A5                      ; $C0E5  A5 A5
    ORA $FF                      ; $C0E7  05 FF
    STA $2000                    ; $C0E9  8D 00 20
    LDA $9C                      ; $C0EC  A5 9C
    STA $C000                    ; $C0EE  8D 00 C0
    STA $C001                    ; $C0F1  8D 01 C0
    LDX $96                      ; $C0F4  A6 96
    STA $E000,X                  ; $C0F6  9D 00 E0
    BEQ loc_1E_C107              ; $C0F9  F0 0C
    LDX $9A                      ; $C0FB  A6 9A
    LDA $C280,X                  ; $C0FD  BD 80 C2
    STA $97                      ; $C100  85 97
    LDA $C288,X                  ; $C102  BD 88 C2
    STA $98                      ; $C105  85 98

loc_1E_C107:
    INC $92                      ; $C107  E6 92
    LDX #$FF                     ; $C109  A2 FF
    STX $90                      ; $C10B  86 90
    INX                          ; $C10D  E8
    LDY #$04                     ; $C10E  A0 04

loc_1E_C110:
    LDA $80,X                    ; $C110  B5 80
    CMP #$01                     ; $C112  C9 01
    BNE loc_1E_C11E              ; $C114  D0 08
    DEC $81,X                    ; $C116  D6 81
    BNE loc_1E_C11E              ; $C118  D0 04
    LDA #$04                     ; $C11A  A9 04
    STA $80,X                    ; $C11C  95 80

loc_1E_C11E:
    INX                          ; $C11E  E8
    INX                          ; $C11F  E8
    INX                          ; $C120  E8
    INX                          ; $C121  E8
    DEY                          ; $C122  88
    BNE loc_1E_C110              ; $C123  D0 EB
    LDA $9A                      ; $C125  A5 9A
    CMP #$04                     ; $C127  C9 04
    BEQ loc_1E_C140              ; $C129  F0 15
    TSX                          ; $C12B  BA
    LDA $0107,X                  ; $C12C  BD 07 01
    STA $E9                      ; $C12F  85 E9
    LDA $0106,X                  ; $C131  BD 06 01
    STA $E8                      ; $C134  85 E8
    LDA #$C1                     ; $C136  A9 C1
    STA $0107,X                  ; $C138  9D 07 01
    LDA #$47                     ; $C13B  A9 47
    STA $0106,X                  ; $C13D  9D 06 01

loc_1E_C140:
    PLA                          ; $C140  68
    TAY                          ; $C141  A8
    PLA                          ; $C142  68
    TAX                          ; $C143  AA
    PLA                          ; $C144  68
    PLP                          ; $C145  28
    RTI                          ; $C146  40

    PHP                          ; $C147  08
    PHP                          ; $C148  08
    PHP                          ; $C149  08
    PHA                          ; $C14A  48
    TXA                          ; $C14B  8A
    PHA                          ; $C14C  48
    TYA                          ; $C14D  98
    PHA                          ; $C14E  48
    TSX                          ; $C14F  BA
    SEC                          ; $C150  38
    LDA $E8                      ; $C151  A5 E8
    SBC #$01                     ; $C153  E9 01
    STA $0105,X                  ; $C155  9D 05 01
    LDA $E9                      ; $C158  A5 E9
    SBC #$00                     ; $C15A  E9 00
    STA $0106,X                  ; $C15C  9D 06 01
    JSR sub_1F_FF68              ; $C15F  20 68 FF
    PLA                          ; $C162  68
    TAY                          ; $C163  A8
    PLA                          ; $C164  68
    TAX                          ; $C165  AA
    PLA                          ; $C166  68
    PLP                          ; $C167  28
    RTS                          ; $C168  60


irq_vector:
    PHP                          ; $C169  08
    PHA                          ; $C16A  48
    TXA                          ; $C16B  8A
    PHA                          ; $C16C  48
    TYA                          ; $C16D  98
    PHA                          ; $C16E  48
    STA $E000                    ; $C16F  8D 00 E0
    STA $E001                    ; $C172  8D 01 E0
    LDX $9A                      ; $C175  A6 9A
    LDA $C290,X                  ; $C177  BD 90 C2
    BNE loc_1E_C182              ; $C17A  D0 06
    LDX #$07                     ; $C17C  A2 07

loc_1E_C17E:
    NOP                          ; $C17E  EA
    DEX                          ; $C17F  CA
    BNE loc_1E_C17E              ; $C180  D0 FC

loc_1E_C182:
    JMP ($0097)                  ; $C182  6C 97 00

    .byte $AD,$02,$20,$A5,$A4,$4A,$4A,$4A,$05,$78,$A4,$79,$8C,$06,$20,$8D  ; $C185
    .byte $06,$20,$A5,$FF,$8D,$00,$20,$A5,$A4,$8D,$05,$20,$A9,$00,$8D,$05  ; $C195
    .byte $20,$4C,$76,$C2  ; $C1A5
    LDA $2002                    ; $C1A9  AD 02 20
    LDA #$23                     ; $C1AC  A9 23
    STA $2006                    ; $C1AE  8D 06 20
    LDA #$00                     ; $C1B1  A9 00
    STA $2006                    ; $C1B3  8D 06 20
    LDA #$00                     ; $C1B6  A9 00
    STA $2005                    ; $C1B8  8D 05 20
    STA $2005                    ; $C1BB  8D 05 20
    LDA $A5                      ; $C1BE  A5 A5
    EOR #$01                     ; $C1C0  49 01
    ORA $FF                      ; $C1C2  05 FF
    STA $2000                    ; $C1C4  8D 00 20
    JMP loc_1E_C276              ; $C1C7  4C 76 C2

    .byte $AD,$02,$20,$A5,$78,$8D,$05,$20,$A9,$00,$8D,$05,$20,$A9,$2E,$8D  ; $C1CA
    .byte $00,$C0,$A9,$04,$85,$97,$A9,$C2,$85,$98,$4C,$79,$C2,$AD,$02,$20  ; $C1DA
    .byte $A5,$79,$8D,$05,$20,$A5,$A2,$8D,$05,$20,$A5,$7A,$8D,$00,$C0,$A9  ; $C1EA
    .byte $04,$85,$97,$A9,$C2,$85,$98,$4C,$2B,$C1,$AD,$02,$20,$A5,$A4,$8D  ; $C1FA
    .byte $05,$20,$A5,$A2,$8D,$05,$20,$F0,$63,$AD,$02,$20,$A5,$7A,$8D,$06  ; $C20A
    .byte $20,$A5,$7B,$8D,$06,$20,$A9,$00,$8D,$05,$20,$8D,$05,$20,$A5,$FF  ; $C21A
    .byte $8D,$00,$20,$D0,$47  ; $C22A
    LDA $2002                    ; $C22F  AD 02 20
    LDA #$29                     ; $C232  A9 29
    STA $2006                    ; $C234  8D 06 20
    LDA #$C0                     ; $C237  A9 C0
    STA $2006                    ; $C239  8D 06 20
    LDA #$00                     ; $C23C  A9 00
    STA $2005                    ; $C23E  8D 05 20
    STA $2005                    ; $C241  8D 05 20
    LDA $FF                      ; $C244  A5 FF
    ORA #$02                     ; $C246  09 02
    STA $2000                    ; $C248  8D 00 20
    BNE loc_1E_C276              ; $C24B  D0 29
    LDA $2002                    ; $C24D  AD 02 20
    LDA $78                      ; $C250  A5 78
    STA $2005                    ; $C252  8D 05 20
    LDA #$00                     ; $C255  A9 00
    STA $2005                    ; $C257  8D 05 20
    LDA #$1F                     ; $C25A  A9 1F
    STA $C000                    ; $C25C  8D 00 C0
    LDA #$69                     ; $C25F  A9 69
    STA $97                      ; $C261  85 97
    LDA #$C2                     ; $C263  A9 C2
    STA $98                      ; $C265  85 98
    BNE loc_1E_C279              ; $C267  D0 10
    LDA $2002                    ; $C269  AD 02 20
    LDA $79                      ; $C26C  A5 79
    STA $2005                    ; $C26E  8D 05 20
    LDA #$00                     ; $C271  A9 00
    STA $2005                    ; $C273  8D 05 20

loc_1E_C276:
    STA $E000                    ; $C276  8D 00 E0

loc_1E_C279:
    PLA                          ; $C279  68
    TAY                          ; $C27A  A8
    PLA                          ; $C27B  68
    TAX                          ; $C27C  AA
    PLA                          ; $C27D  68
    PLP                          ; $C27E  28
    RTI                          ; $C27F  40

    .byte $76,$85,$A9,$CA,$E7,$13,$2F,$4D,$C2,$C1,$C1,$C1,$C1,$C2,$C2,$C2  ; $C280
    .byte $00,$00,$00,$01,$01,$00,$00,$01  ; $C290

sub_1E_C298:
    LDX #$00                     ; $C298  A2 00
    STX $19                      ; $C29A  86 19

sub_1E_C29C:
    LDA $0780,X                  ; $C29C  BD 80 07
    BMI loc_1E_C2BC              ; $C29F  30 1B
    STA $2006                    ; $C2A1  8D 06 20
    LDA $0781,X                  ; $C2A4  BD 81 07
    STA $2006                    ; $C2A7  8D 06 20
    LDY $0782,X                  ; $C2AA  BC 82 07

loc_1E_C2AD:
    LDA $0783,X                  ; $C2AD  BD 83 07
    STA $2007                    ; $C2B0  8D 07 20
    INX                          ; $C2B3  E8
    DEY                          ; $C2B4  88
    BPL loc_1E_C2AD              ; $C2B5  10 F6
    INX                          ; $C2B7  E8
    INX                          ; $C2B8  E8
    INX                          ; $C2B9  E8
    BNE sub_1E_C29C              ; $C2BA  D0 E0

loc_1E_C2BC:
    RTS                          ; $C2BC  60

    .byte $A5,$FF,$29,$11,$85,$FF,$8D,$00,$20,$60,$A5,$FF,$09,$80,$85,$FF  ; $C2BD
    .byte $8D,$00,$20,$60  ; $C2CD

sub_1E_C2D1:
    INC $F0                      ; $C2D1  E6 F0
    LDA #$00                     ; $C2D3  A9 00
    STA $FE                      ; $C2D5  85 FE
    STA $2001                    ; $C2D7  8D 01 20
    RTS                          ; $C2DA  60


sub_1E_C2DB:
    DEC $F0                      ; $C2DB  C6 F0
    LDA #$18                     ; $C2DD  A9 18
    STA $FE                      ; $C2DF  85 FE
    STA $2001                    ; $C2E1  8D 01 20
    RTS                          ; $C2E4  60


sub_1E_C2E5:
    LDX #$01                     ; $C2E5  A2 01
    STX $4016                    ; $C2E7  8E 16 40
    DEX                          ; $C2EA  CA
    STX $4016                    ; $C2EB  8E 16 40
    LDX #$08                     ; $C2EE  A2 08

loc_1E_C2F0:
    LDA $4016                    ; $C2F0  AD 16 40
    LSR A                        ; $C2F3  4A
    ROL $14                      ; $C2F4  26 14
    LSR A                        ; $C2F6  4A
    ROL $00                      ; $C2F7  26 00
    LDA $4017                    ; $C2F9  AD 17 40
    LSR A                        ; $C2FC  4A
    ROL $15                      ; $C2FD  26 15
    LSR A                        ; $C2FF  4A
    ROL $01                      ; $C300  26 01
    DEX                          ; $C302  CA
    BNE loc_1E_C2F0              ; $C303  D0 EB
    LDA $00                      ; $C305  A5 00
    ORA $14                      ; $C307  05 14
    STA $14                      ; $C309  85 14
    LDA $01                      ; $C30B  A5 01
    ORA $15                      ; $C30D  05 15
    STA $15                      ; $C30F  85 15
    LDX #$01                     ; $C311  A2 01

loc_1E_C313:
    LDA $14,X                    ; $C313  B5 14
    TAY                          ; $C315  A8
    EOR $16,X                    ; $C316  55 16
    AND $14,X                    ; $C318  35 14
    STA $14,X                    ; $C31A  95 14
    STY $16,X                    ; $C31C  94 16
    DEX                          ; $C31E  CA
    BPL loc_1E_C313              ; $C31F  10 F2
    LDX #$03                     ; $C321  A2 03

loc_1E_C323:
    LDA $14,X                    ; $C323  B5 14
    AND #$0C                     ; $C325  29 0C
    CMP #$0C                     ; $C327  C9 0C
    BEQ loc_1E_C333              ; $C329  F0 08
    LDA $14,X                    ; $C32B  B5 14
    AND #$03                     ; $C32D  29 03
    CMP #$03                     ; $C32F  C9 03
    BNE loc_1E_C339              ; $C331  D0 06

loc_1E_C333:
    LDA $14,X                    ; $C333  B5 14
    AND #$F0                     ; $C335  29 F0
    STA $14,X                    ; $C337  95 14

loc_1E_C339:
    DEX                          ; $C339  CA
    BPL loc_1E_C323              ; $C33A  10 E7
    LDA #$00                     ; $C33C  A9 00
    STA $15                      ; $C33E  85 15
    STA $17                      ; $C340  85 17
    RTS                          ; $C342  60


sub_1E_C343:
    STA $00                      ; $C343  85 00
    STX $01                      ; $C345  86 01
    STY $02                      ; $C347  84 02
    LDA $2002                    ; $C349  AD 02 20
    LDA $FF                      ; $C34C  A5 FF
    AND #$FE                     ; $C34E  29 FE
    STA $2000                    ; $C350  8D 00 20
    LDA $00                      ; $C353  A5 00
    STA $2006                    ; $C355  8D 06 20
    LDY #$00                     ; $C358  A0 00
    STY $2006                    ; $C35A  8C 06 20
    LDX #$04                     ; $C35D  A2 04
    CMP #$20                     ; $C35F  C9 20
    BCS loc_1E_C365              ; $C361  B0 02
    LDX $02                      ; $C363  A6 02

loc_1E_C365:
    LDY #$00                     ; $C365  A0 00
    LDA $01                      ; $C367  A5 01

loc_1E_C369:
    STA $2007                    ; $C369  8D 07 20
    DEY                          ; $C36C  88
    BNE loc_1E_C369              ; $C36D  D0 FA
    DEX                          ; $C36F  CA
    BNE loc_1E_C369              ; $C370  D0 F7
    LDY $02                      ; $C372  A4 02
    LDA $00                      ; $C374  A5 00
    CMP #$20                     ; $C376  C9 20
    BCC loc_1E_C38C              ; $C378  90 12
    ADC #$02                     ; $C37A  69 02
    STA $2006                    ; $C37C  8D 06 20
    LDA #$C0                     ; $C37F  A9 C0
    STA $2006                    ; $C381  8D 06 20
    LDX #$40                     ; $C384  A2 40

loc_1E_C386:
    STY $2007                    ; $C386  8C 07 20
    DEX                          ; $C389  CA
    BNE loc_1E_C386              ; $C38A  D0 FA

loc_1E_C38C:
    LDX $01                      ; $C38C  A6 01
    RTS                          ; $C38E  60


sub_1E_C38F:
    LDX #$00                     ; $C38F  A2 00
    LDA #$F8                     ; $C391  A9 F8

loc_1E_C393:
    STA $0200,X                  ; $C393  9D 00 02
    INX                          ; $C396  E8
    INX                          ; $C397  E8
    INX                          ; $C398  E8
    INX                          ; $C399  E8
    BNE loc_1E_C393              ; $C39A  D0 F7
    RTS                          ; $C39C  60


sub_1E_C39D:
    LDX #$17                     ; $C39D  A2 17

loc_1E_C39F:
    LDA #$00                     ; $C39F  A9 00
    STA $0300,X                  ; $C3A1  9D 00 03
    STA $05A0,X                  ; $C3A4  9D A0 05
    STA $05B8,X                  ; $C3A7  9D B8 05
    STA $0450,X                  ; $C3AA  9D 50 04
    LDA #$FF                     ; $C3AD  A9 FF
    STA $0438,X                  ; $C3AF  9D 38 04
    DEX                          ; $C3B2  CA
    BNE loc_1E_C39F              ; $C3B3  D0 EA
    STX $74                      ; $C3B5  86 74
    RTS                          ; $C3B7  60


sub_1E_C3B8:
    LDA #$00                     ; $C3B8  A9 00
    STA $99                      ; $C3BA  85 99
    STA $46                      ; $C3BC  85 46
    STA $78                      ; $C3BE  85 78
    STA $79                      ; $C3C0  85 79
    STA $7A                      ; $C3C2  85 7A
    STA $7B                      ; $C3C4  85 7B
    STA $FA                      ; $C3C6  85 FA
    STA $FB                      ; $C3C8  85 FB
    STA $FC                      ; $C3CA  85 FC
    STA $FD                      ; $C3CC  85 FD
    LDY #$88                     ; $C3CE  A0 88
    STY $9B                      ; $C3D0  84 9B
    LDY #$3F                     ; $C3D2  A0 3F

loc_1E_C3D4:
    STA $0680,Y                  ; $C3D4  99 80 06
    DEY                          ; $C3D7  88
    BPL loc_1E_C3D4              ; $C3D8  10 FA
    STA $58                      ; $C3DA  85 58
    LDA #$50                     ; $C3DC  A9 50
    STA $57                      ; $C3DE  85 57
    LDA $26                      ; $C3E0  A5 26
    CMP #$0A                     ; $C3E2  C9 0A
    BNE loc_1E_C3EA              ; $C3E4  D0 04
    LDA #$00                     ; $C3E6  A9 00
    STA $43                      ; $C3E8  85 43

loc_1E_C3EA:
    RTS                          ; $C3EA  60


sub_1E_C3EB:
    LDA #$30                     ; $C3EB  A9 30
    LDX #$F0                     ; $C3ED  A2 F0
    BNE loc_1E_C3F4              ; $C3EF  D0 03

sub_1E_C3F1:
    LDA #$10                     ; $C3F1  A9 10
    TAX                          ; $C3F3  AA

loc_1E_C3F4:
    STA $0F                      ; $C3F4  85 0F
    STX $0D                      ; $C3F6  86 0D
    INC $1B                      ; $C3F8  E6 1B
    LDY #$04                     ; $C3FA  A0 04
    STY $0E                      ; $C3FC  84 0E

loc_1E_C3FE:
    LDA $A9                      ; $C3FE  A5 A9
    PHA                          ; $C400  48
    LDY #$1F                     ; $C401  A0 1F

loc_1E_C403:
    TYA                          ; $C403  98
    AND #$03                     ; $C404  29 03
    CMP #$03                     ; $C406  C9 03
    BNE loc_1E_C414              ; $C408  D0 0A
    LSR $A9                      ; $C40A  46 A9
    BCC loc_1E_C414              ; $C40C  90 06
    DEY                          ; $C40E  88
    DEY                          ; $C40F  88
    DEY                          ; $C410  88
    JMP loc_1E_C421              ; $C411  4C 21 C4


loc_1E_C414:
    LDA $0620,Y                  ; $C414  B9 20 06
    SEC                          ; $C417  38
    SBC $0F                      ; $C418  E5 0F
    BPL loc_1E_C41E              ; $C41A  10 02
    LDA #$0F                     ; $C41C  A9 0F

loc_1E_C41E:
    STA $0600,Y                  ; $C41E  99 00 06

loc_1E_C421:
    DEY                          ; $C421  88
    BPL loc_1E_C403              ; $C422  10 DF
    LDA $0600                    ; $C424  AD 00 06
    STA $0610                    ; $C427  8D 10 06
    STY $18                      ; $C42A  84 18
    PLA                          ; $C42C  68
    STA $A9                      ; $C42D  85 A9
    LDA $0E                      ; $C42F  A5 0E

loc_1E_C431:
    PHA                          ; $C431  48
    JSR sub_1F_FF22              ; $C432  20 22 FF
    PLA                          ; $C435  68
    SEC                          ; $C436  38
    SBC #$01                     ; $C437  E9 01
    BNE loc_1E_C431              ; $C439  D0 F6
    LDA $0F                      ; $C43B  A5 0F
    CLC                          ; $C43D  18
    ADC $0D                      ; $C43E  65 0D
    STA $0F                      ; $C440  85 0F
    CMP #$50                     ; $C442  C9 50
    BEQ loc_1E_C44A              ; $C444  F0 04
    LDA $0F                      ; $C446  A5 0F
    BPL loc_1E_C3FE              ; $C448  10 B4

loc_1E_C44A:
    LDA #$00                     ; $C44A  A9 00
    STA $A9                      ; $C44C  85 A9
    DEC $1B                      ; $C44E  C6 1B
    RTS                          ; $C450  60

    .byte $68,$85,$02,$68,$85,$03,$A0,$01,$B1,$02,$85,$04,$C8,$B1,$02,$85  ; $C451
    .byte $05,$A0,$00,$B1,$04,$F0,$23,$8D,$06,$20,$20,$9B,$C4,$B1,$04,$8D  ; $C461
    .byte $06,$20,$20,$9B,$C4,$B1,$04,$85,$06,$20,$9B,$C4,$B1,$04,$8D,$07  ; $C471
    .byte $20,$20,$9B,$C4,$C6,$06,$10,$F4,$30,$D9,$A5,$02,$18,$69,$02,$85  ; $C481
    .byte $02,$A5,$03,$69,$00,$48,$A5,$02,$48,$60,$C8,$D0,$02,$E6,$05,$60  ; $C491

sub_1E_C4A1:
    JSR sub_1E_C6DB              ; $C4A1  20 DB C6
    LDA $17                      ; $C4A4  A5 17
    AND #$08                     ; $C4A6  29 08
    BEQ loc_1E_C4AD              ; $C4A8  F0 03
    JMP loc_1E_C5A7              ; $C4AA  4C A7 C5


loc_1E_C4AD:
    LDA $C807,Y                  ; $C4AD  B9 07 C8
    STA $40                      ; $C4B0  85 40
    TAY                          ; $C4B2  A8
    LDA $C837,Y                  ; $C4B3  B9 37 C8
    STA $06                      ; $C4B6  85 06
    LDA #$00                     ; $C4B8  A9 00
    STA $02                      ; $C4BA  85 02
    JSR sub_1E_C7AA              ; $C4BC  20 AA C7
    LDA $0390,X                  ; $C4BF  BD 90 03
    STA $03                      ; $C4C2  85 03
    LDA $C838,Y                  ; $C4C4  B9 38 C8
    PHA                          ; $C4C7  48
    CLC                          ; $C4C8  18
    ADC $11                      ; $C4C9  65 11
    STA $11                      ; $C4CB  85 11
    PLA                          ; $C4CD  68
    BMI loc_1E_C4E7              ; $C4CE  30 17
    BCS loc_1E_C4D8              ; $C4D0  B0 06
    LDA $11                      ; $C4D2  A5 11
    CMP #$F0                     ; $C4D4  C9 F0
    BCC loc_1E_C504              ; $C4D6  90 2C

loc_1E_C4D8:
    LDA $46                      ; $C4D8  A5 46
    BEQ loc_1E_C4F7              ; $C4DA  F0 1B
    LDA $11                      ; $C4DC  A5 11
    ADC #$0F                     ; $C4DE  69 0F
    STA $11                      ; $C4E0  85 11
    DEC $13                      ; $C4E2  C6 13
    JMP loc_1E_C504              ; $C4E4  4C 04 C5


loc_1E_C4E7:
    BCS loc_1E_C504              ; $C4E7  B0 1B
    LDA $46                      ; $C4E9  A5 46
    BEQ loc_1E_C4F7              ; $C4EB  F0 0A
    LDA $11                      ; $C4ED  A5 11
    SBC #$0F                     ; $C4EF  E9 0F
    STA $11                      ; $C4F1  85 11
    INC $13                      ; $C4F3  E6 13
    BNE loc_1E_C504              ; $C4F5  D0 0D

loc_1E_C4F7:
    LDA #$00                     ; $C4F7  A9 00
    LDY $06                      ; $C4F9  A4 06

loc_1E_C4FB:
    STA $0048,Y                  ; $C4FB  99 48 00
    DEY                          ; $C4FE  88
    BPL loc_1E_C4FB              ; $C4FF  10 FA
    JMP loc_1E_C737              ; $C501  4C 37 C7


loc_1E_C504:
    LDA $03                      ; $C504  A5 03
    BNE loc_1E_C4F7              ; $C506  D0 EF
    LDA $11                      ; $C508  A5 11
    LSR A                        ; $C50A  4A
    LSR A                        ; $C50B  4A
    PHA                          ; $C50C  48
    AND #$38                     ; $C50D  29 38
    STA $22                      ; $C50F  85 22
    PLA                          ; $C511  68
    LSR A                        ; $C512  4A
    AND #$02                     ; $C513  29 02
    STA $03                      ; $C515  85 03
    LDA #$00                     ; $C517  A9 00
    STA $04                      ; $C519  85 04
    LDA $C839,Y                  ; $C51B  B9 39 C8
    BPL loc_1E_C522              ; $C51E  10 02
    DEC $04                      ; $C520  C6 04

loc_1E_C522:
    CLC                          ; $C522  18
    ADC $0330,X                  ; $C523  7D 30 03
    STA $12                      ; $C526  85 12
    LDA $13                      ; $C528  A5 13
    ADC $04                      ; $C52A  65 04
    STA $13                      ; $C52C  85 13
    LDA $12                      ; $C52E  A5 12
    LSR A                        ; $C530  4A
    LSR A                        ; $C531  4A
    LSR A                        ; $C532  4A
    LSR A                        ; $C533  4A
    PHA                          ; $C534  48
    AND #$01                     ; $C535  29 01
    ORA $03                      ; $C537  05 03
    STA $03                      ; $C539  85 03
    PLA                          ; $C53B  68
    LSR A                        ; $C53C  4A
    ORA $22                      ; $C53D  05 22
    STA $22                      ; $C53F  85 22

loc_1E_C541:
    LDY $13                      ; $C541  A4 13
    JSR sub_1E_D7A3              ; $C543  20 A3 D7

loc_1E_C546:
    JSR sub_1E_D758              ; $C546  20 58 D7

loc_1E_C549:
    LDY $03                      ; $C549  A4 03
    LDA ($00),Y                  ; $C54B  B1 00
    TAY                          ; $C54D  A8
    LDA $B100,Y                  ; $C54E  B9 00 B1
    AND #$F0                     ; $C551  29 F0
    JSR sub_1E_C74E              ; $C553  20 4E C7
    JSR sub_1E_C77C              ; $C556  20 7C C7
    LDY $02                      ; $C559  A4 02
    STA $0048,Y                  ; $C55B  99 48 00
    CMP $42                      ; $C55E  C5 42
    BCC loc_1E_C564              ; $C560  90 02
    STA $42                      ; $C562  85 42

loc_1E_C564:
    ORA $10                      ; $C564  05 10
    STA $10                      ; $C566  85 10
    LDA $02                      ; $C568  A5 02
    CMP $06                      ; $C56A  C5 06
    BEQ loc_1E_C5A7              ; $C56C  F0 39
    INC $02                      ; $C56E  E6 02
    INC $40                      ; $C570  E6 40
    LDY $40                      ; $C572  A4 40
    LDA $12                      ; $C574  A5 12
    PHA                          ; $C576  48
    AND #$10                     ; $C577  29 10
    STA $04                      ; $C579  85 04
    PLA                          ; $C57B  68
    CLC                          ; $C57C  18
    ADC $C839,Y                  ; $C57D  79 39 C8
    STA $12                      ; $C580  85 12
    AND #$10                     ; $C582  29 10
    CMP $04                      ; $C584  C5 04
    BEQ loc_1E_C549              ; $C586  F0 C1
    LDA $03                      ; $C588  A5 03
    EOR #$01                     ; $C58A  49 01
    STA $03                      ; $C58C  85 03
    AND #$01                     ; $C58E  29 01
    BNE loc_1E_C549              ; $C590  D0 B7
    INC $22                      ; $C592  E6 22
    LDA $22                      ; $C594  A5 22
    AND #$07                     ; $C596  29 07
    BNE loc_1E_C546              ; $C598  D0 AC
    INC $13                      ; $C59A  E6 13
    DEC $22                      ; $C59C  C6 22
    LDA $22                      ; $C59E  A5 22
    AND #$38                     ; $C5A0  29 38
    STA $22                      ; $C5A2  85 22
    JMP loc_1E_C541              ; $C5A4  4C 41 C5


loc_1E_C5A7:
    JMP loc_1E_C737              ; $C5A7  4C 37 C7


sub_1E_C5AA:
    JSR sub_1E_C6DB              ; $C5AA  20 DB C6
    LDA $17                      ; $C5AD  A5 17
    AND #$08                     ; $C5AF  29 08
    BEQ loc_1E_C5B6              ; $C5B1  F0 03
    JMP loc_1E_C6D8              ; $C5B3  4C D8 C6


loc_1E_C5B6:
    LDA $C8E2,Y                  ; $C5B6  B9 E2 C8
    STA $40                      ; $C5B9  85 40
    TAY                          ; $C5BB  A8
    LDA $C912,Y                  ; $C5BC  B9 12 C9
    STA $06                      ; $C5BF  85 06
    LDA #$00                     ; $C5C1  A9 00
    STA $02                      ; $C5C3  85 02
    LDA #$00                     ; $C5C5  A9 00
    STA $04                      ; $C5C7  85 04
    STA $05                      ; $C5C9  85 05
    LDA $C913,Y                  ; $C5CB  B9 13 C9
    BPL loc_1E_C5D2              ; $C5CE  10 02
    DEC $04                      ; $C5D0  C6 04

loc_1E_C5D2:
    CLC                          ; $C5D2  18
    ADC $0330,X                  ; $C5D3  7D 30 03
    STA $12                      ; $C5D6  85 12
    LDA $13                      ; $C5D8  A5 13
    ADC $04                      ; $C5DA  65 04
    STA $13                      ; $C5DC  85 13
    LDA $12                      ; $C5DE  A5 12
    LSR A                        ; $C5E0  4A
    LSR A                        ; $C5E1  4A
    LSR A                        ; $C5E2  4A
    LSR A                        ; $C5E3  4A
    PHA                          ; $C5E4  48
    AND #$01                     ; $C5E5  29 01
    STA $03                      ; $C5E7  85 03
    PLA                          ; $C5E9  68
    LSR A                        ; $C5EA  4A
    STA $22                      ; $C5EB  85 22
    LDA $0390,X                  ; $C5ED  BD 90 03
    BMI loc_1E_C630              ; $C5F0  30 3E
    BNE loc_1E_C618              ; $C5F2  D0 24
    LDA $11                      ; $C5F4  A5 11
    CLC                          ; $C5F6  18
    ADC $C914,Y                  ; $C5F7  79 14 C9
    STA $11                      ; $C5FA  85 11
    LDA $C914,Y                  ; $C5FC  B9 14 C9
    BMI loc_1E_C620              ; $C5FF  30 1F
    BCS loc_1E_C609              ; $C601  B0 06
    LDA $11                      ; $C603  A5 11
    CMP #$F0                     ; $C605  C9 F0
    BCC loc_1E_C636              ; $C607  90 2D

loc_1E_C609:
    LDA $46                      ; $C609  A5 46
    BEQ loc_1E_C618              ; $C60B  F0 0B
    LDA $11                      ; $C60D  A5 11
    ADC #$0F                     ; $C60F  69 0F
    STA $11                      ; $C611  85 11
    DEC $13                      ; $C613  C6 13
    JMP loc_1E_C636              ; $C615  4C 36 C6


loc_1E_C618:
    LDA #$EF                     ; $C618  A9 EF
    STA $11                      ; $C61A  85 11
    INC $05                      ; $C61C  E6 05
    BNE loc_1E_C636              ; $C61E  D0 16

loc_1E_C620:
    BCS loc_1E_C636              ; $C620  B0 14
    LDA $46                      ; $C622  A5 46
    BEQ loc_1E_C630              ; $C624  F0 0A
    LDA $11                      ; $C626  A5 11
    SBC #$0F                     ; $C628  E9 0F
    STA $11                      ; $C62A  85 11
    INC $13                      ; $C62C  E6 13
    BNE loc_1E_C636              ; $C62E  D0 06

loc_1E_C630:
    LDA #$00                     ; $C630  A9 00
    STA $11                      ; $C632  85 11
    INC $05                      ; $C634  E6 05

loc_1E_C636:
    LDA $11                      ; $C636  A5 11
    LSR A                        ; $C638  4A
    LSR A                        ; $C639  4A
    PHA                          ; $C63A  48
    AND #$38                     ; $C63B  29 38
    ORA $22                      ; $C63D  05 22
    STA $22                      ; $C63F  85 22
    PLA                          ; $C641  68
    LSR A                        ; $C642  4A
    AND #$02                     ; $C643  29 02
    ORA $03                      ; $C645  05 03
    STA $03                      ; $C647  85 03

loc_1E_C649:
    LDY $13                      ; $C649  A4 13
    JSR sub_1E_D7A3              ; $C64B  20 A3 D7

loc_1E_C64E:
    JSR sub_1E_D758              ; $C64E  20 58 D7

loc_1E_C651:
    LDY $03                      ; $C651  A4 03
    LDA ($00),Y                  ; $C653  B1 00
    TAY                          ; $C655  A8
    LDA $B100,Y                  ; $C656  B9 00 B1
    AND #$F0                     ; $C659  29 F0
    CMP #$40                     ; $C65B  C9 40
    BNE loc_1E_C661              ; $C65D  D0 02
    LDA #$20                     ; $C65F  A9 20

loc_1E_C661:
    JSR sub_1E_C74E              ; $C661  20 4E C7
    JSR sub_1E_C77C              ; $C664  20 7C C7
    LDY $02                      ; $C667  A4 02
    STA $0048,Y                  ; $C669  99 48 00
    CMP $42                      ; $C66C  C5 42
    BCC loc_1E_C672              ; $C66E  90 02
    STA $42                      ; $C670  85 42

loc_1E_C672:
    ORA $10                      ; $C672  05 10
    STA $10                      ; $C674  85 10
    LDA $02                      ; $C676  A5 02
    CMP $06                      ; $C678  C5 06
    BEQ loc_1E_C6D8              ; $C67A  F0 5C
    INC $02                      ; $C67C  E6 02
    INC $40                      ; $C67E  E6 40
    LDA $05                      ; $C680  A5 05
    BNE loc_1E_C651              ; $C682  D0 CD
    LDY $40                      ; $C684  A4 40
    LDA $11                      ; $C686  A5 11
    PHA                          ; $C688  48
    AND #$10                     ; $C689  29 10
    STA $04                      ; $C68B  85 04
    PLA                          ; $C68D  68
    CLC                          ; $C68E  18
    ADC $C914,Y                  ; $C68F  79 14 C9
    STA $11                      ; $C692  85 11
    AND #$10                     ; $C694  29 10
    CMP $04                      ; $C696  C5 04
    BEQ loc_1E_C651              ; $C698  F0 B7
    LDA $03                      ; $C69A  A5 03
    EOR #$02                     ; $C69C  49 02
    STA $03                      ; $C69E  85 03
    AND #$02                     ; $C6A0  29 02
    BEQ loc_1E_C6B8              ; $C6A2  F0 14
    LDA $22                      ; $C6A4  A5 22
    CMP #$38                     ; $C6A6  C9 38
    BCC loc_1E_C651              ; $C6A8  90 A7
    LDA $46                      ; $C6AA  A5 46
    BNE loc_1E_C6C1              ; $C6AC  D0 13
    LDA $03                      ; $C6AE  A5 03
    EOR #$02                     ; $C6B0  49 02
    STA $03                      ; $C6B2  85 03
    INC $05                      ; $C6B4  E6 05
    BNE loc_1E_C651              ; $C6B6  D0 99

loc_1E_C6B8:
    LDA $22                      ; $C6B8  A5 22
    CLC                          ; $C6BA  18
    ADC #$08                     ; $C6BB  69 08
    STA $22                      ; $C6BD  85 22
    BNE loc_1E_C64E              ; $C6BF  D0 8D

loc_1E_C6C1:
    LDA $11                      ; $C6C1  A5 11
    AND #$0F                     ; $C6C3  29 0F
    STA $11                      ; $C6C5  85 11
    LDA $22                      ; $C6C7  A5 22
    AND #$07                     ; $C6C9  29 07
    STA $22                      ; $C6CB  85 22
    LDA $03                      ; $C6CD  A5 03
    AND #$01                     ; $C6CF  29 01
    STA $03                      ; $C6D1  85 03
    DEC $13                      ; $C6D3  C6 13
    JMP loc_1E_C649              ; $C6D5  4C 49 C6


loc_1E_C6D8:
    JMP loc_1E_C737              ; $C6D8  4C 37 C7


sub_1E_C6DB:
    LDA #$00                     ; $C6DB  A9 00
    STA $10                      ; $C6DD  85 10
    STA $42                      ; $C6DF  85 42
    LDA $F6                      ; $C6E1  A5 F6
    STA $F1                      ; $C6E3  85 F1
    LDA $0348,X                  ; $C6E5  BD 48 03
    STA $13                      ; $C6E8  85 13
    LDA $0378,X                  ; $C6EA  BD 78 03
    STA $11                      ; $C6ED  85 11
    LDA $46                      ; $C6EF  A5 46
    BEQ loc_1E_C736              ; $C6F1  F0 43
    LDA $26                      ; $C6F3  A5 26
    CMP #$0E                     ; $C6F5  C9 0E
    BNE loc_1E_C705              ; $C6F7  D0 0C
    LDA $11                      ; $C6F9  A5 11
    CMP #$60                     ; $C6FB  C9 60
    BCC loc_1E_C736              ; $C6FD  90 37
    CLC                          ; $C6FF  18
    ADC $79                      ; $C700  65 79
    STA $11                      ; $C702  85 11
    RTS                          ; $C704  60


loc_1E_C705:
    LDA $0390,X                  ; $C705  BD 90 03
    BEQ loc_1E_C712              ; $C708  F0 08
    LDA $13                      ; $C70A  A5 13
    SEC                          ; $C70C  38
    SBC $0390,X                  ; $C70D  FD 90 03
    STA $13                      ; $C710  85 13

loc_1E_C712:
    LDA $13                      ; $C712  A5 13
    CLC                          ; $C714  18
    ADC $FB                      ; $C715  65 FB
    STA $13                      ; $C717  85 13
    LDA $0378,X                  ; $C719  BD 78 03
    CLC                          ; $C71C  18
    ADC $FA                      ; $C71D  65 FA
    BCS loc_1E_C725              ; $C71F  B0 04
    CMP #$F0                     ; $C721  C9 F0
    BCC loc_1E_C729              ; $C723  90 04

loc_1E_C725:
    DEC $13                      ; $C725  C6 13
    ADC #$0F                     ; $C727  69 0F

loc_1E_C729:
    STA $11                      ; $C729  85 11
    LDA $26                      ; $C72B  A5 26
    CMP #$0C                     ; $C72D  C9 0C
    BNE loc_1E_C736              ; $C72F  D0 05
    LDA $0348,X                  ; $C731  BD 48 03
    STA $13                      ; $C734  85 13

loc_1E_C736:
    RTS                          ; $C736  60


loc_1E_C737:
    CPX #$00                     ; $C737  E0 00
    BNE loc_1E_C747              ; $C739  D0 0C
    LDA $36                      ; $C73B  A5 36
    BNE loc_1E_C747              ; $C73D  D0 08
    LDA $42                      ; $C73F  A5 42
    CMP #$D0                     ; $C741  C9 D0
    BCC loc_1E_C747              ; $C743  90 02
    STA $36                      ; $C745  85 36

loc_1E_C747:
    LDA $F1                      ; $C747  A5 F1
    STA $F6                      ; $C749  85 F6
    JMP sub_1F_FF43              ; $C74B  4C 43 FF


sub_1E_C74E:
    STA $07                      ; $C74E  85 07
    LDY $43                      ; $C750  A4 43
    BEQ loc_1E_C779              ; $C752  F0 25

loc_1E_C754:
    LDA $06BC,Y                  ; $C754  B9 BC 06
    CMP $13                      ; $C757  C5 13
    BNE loc_1E_C773              ; $C759  D0 18
    LDA $06BD,Y                  ; $C75B  B9 BD 06
    CMP $22                      ; $C75E  C5 22
    BNE loc_1E_C773              ; $C760  D0 11
    LDA $06BE,Y                  ; $C762  B9 BE 06
    CMP $03                      ; $C765  C5 03
    BNE loc_1E_C773              ; $C767  D0 0A
    LDA $06BF,Y                  ; $C769  B9 BF 06
    TAY                          ; $C76C  A8
    LDA $B100,Y                  ; $C76D  B9 00 B1
    AND #$F0                     ; $C770  29 F0
    RTS                          ; $C772  60


loc_1E_C773:
    DEY                          ; $C773  88
    DEY                          ; $C774  88
    DEY                          ; $C775  88
    DEY                          ; $C776  88
    BNE loc_1E_C754              ; $C777  D0 DB

loc_1E_C779:
    LDA $07                      ; $C779  A5 07
    RTS                          ; $C77B  60


sub_1E_C77C:
    PHA                          ; $C77C  48
    LDA $1E                      ; $C77D  A5 1E
    BNE loc_1E_C7A8              ; $C77F  D0 27
    LDA $22                      ; $C781  A5 22
    AND #$01                     ; $C783  29 01
    ASL A                        ; $C785  0A
    ASL A                        ; $C786  0A
    ORA $03                      ; $C787  05 03
    TAY                          ; $C789  A8
    LDA $F2B2,Y                  ; $C78A  B9 B2 F2
    STA $07                      ; $C78D  85 07
    LDA $13                      ; $C78F  A5 13
    AND #$01                     ; $C791  29 01
    TAY                          ; $C793  A8
    LDA $22                      ; $C794  A5 22
    LSR A                        ; $C796  4A
    ORA $F2C2,Y                  ; $C797  19 C2 F2
    TAY                          ; $C79A  A8
    LDA $0680,Y                  ; $C79B  B9 80 06
    AND $07                      ; $C79E  25 07
    BEQ loc_1E_C7A8              ; $C7A0  F0 06
    PLA                          ; $C7A2  68
    AND #$10                     ; $C7A3  29 10
    EOR #$10                     ; $C7A5  49 10
    PHA                          ; $C7A7  48

loc_1E_C7A8:
    PLA                          ; $C7A8  68
    RTS                          ; $C7A9  60


sub_1E_C7AA:
    STY $00                      ; $C7AA  84 00
    LDY $26                      ; $C7AC  A4 26
    LDA $C7E7,Y                  ; $C7AE  B9 E7 C7
    STA $01                      ; $C7B1  85 01
    LDA $C7F7,Y                  ; $C7B3  B9 F7 C7
    STA $03                      ; $C7B6  85 03
    LDY $00                      ; $C7B8  A4 00
    LDA $46                      ; $C7BA  A5 46
    BEQ loc_1E_C7E6              ; $C7BC  F0 28
    LDA $01                      ; $C7BE  A5 01
    BEQ loc_1E_C7E6              ; $C7C0  F0 24
    LDA $26                      ; $C7C2  A5 26
    CMP #$0C                     ; $C7C4  C9 0C
    BNE loc_1E_C7CC              ; $C7C6  D0 04
    CPX #$00                     ; $C7C8  E0 00
    BEQ loc_1E_C7E6              ; $C7CA  F0 1A

loc_1E_C7CC:
    LDA $C838,Y                  ; $C7CC  B9 38 C8
    BMI loc_1E_C7E6              ; $C7CF  30 15
    CLC                          ; $C7D1  18
    ADC $0378,X                  ; $C7D2  7D 78 03
    BCS loc_1E_C7E6              ; $C7D5  B0 0F
    CMP $01                      ; $C7D7  C5 01
    BCC loc_1E_C7E6              ; $C7D9  90 0B
    LDA $0378,X                  ; $C7DB  BD 78 03
    STA $11                      ; $C7DE  85 11
    LDA $03                      ; $C7E0  A5 03
    BMI loc_1E_C7E6              ; $C7E2  30 02
    STA $13                      ; $C7E4  85 13

loc_1E_C7E6:
    RTS                          ; $C7E6  60

    .byte $00,$00,$00,$C0,$00,$00,$00,$00,$00,$00,$00,$C0,$D0,$00,$00,$00  ; $C7E7
    .byte $00,$00,$00,$13,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$00,$00,$00  ; $C7F7
    .byte $00,$05,$09,$0E,$13,$18,$1D,$20,$24,$28,$2D,$32,$36,$3A,$3F,$44  ; $C807
    .byte $49,$4E,$52,$56,$59,$5C,$61,$66,$6A,$6E,$73,$78,$7C,$7F,$82,$87  ; $C817
    .byte $8C,$8F,$93,$97,$9A,$9D,$A1,$A5,$A8,$AB,$AB,$AB,$AB,$AB,$AB,$AB  ; $C827
    .byte $02,$0C,$F9,$07,$07,$01,$F6,$F9,$0E,$02,$F2,$F2,$0E,$0E,$02,$0C  ; $C837
    .byte $F2,$0E,$0E,$02,$0A,$F2,$0E,$0E,$02,$F8,$F2,$0E,$0E,$00,$00,$00  ; $C847
    .byte $01,$06,$FB,$0A,$01,$FA,$FB,$0A,$02,$10,$F5,$0B,$0B,$02,$F0,$F5  ; $C857
    .byte $0B,$0B,$01,$04,$F9,$0E,$01,$FC,$F9,$0E,$02,$10,$F1,$0F,$0F,$02  ; $C867
    .byte $F0,$F1,$0F,$0F,$02,$1C,$F1,$0F,$0F,$02,$E4,$F1,$0F,$0F,$01,$14  ; $C877
    .byte $F9,$0E,$01,$EC,$F9,$0E,$00,$04,$00,$00,$FC,$00,$02,$0C,$F5,$0B  ; $C887
    .byte $0B,$02,$F4,$F5,$0B,$0B,$01,$08,$F9,$0E,$01,$F8,$F9,$0E,$02,$14  ; $C897
    .byte $F5,$0B,$0B,$02,$EC,$F5,$0B,$0B,$01,$00,$F9,$0E,$00,$10,$00,$00  ; $C8A7
    .byte $F0,$00,$02,$0C,$F1,$0F,$0F,$02,$F4,$F1,$0F,$0F,$00,$36,$00,$01  ; $C8B7
    .byte $0C,$F9,$0E,$01,$F4,$F9,$0E,$00,$08,$00,$00,$F8,$00,$01,$FA,$F9  ; $C8C7
    .byte $0E,$01,$05,$F9,$0E,$00,$0C,$00,$00,$F4,$00,$00,$05,$0A,$0F,$14  ; $C8D7
    .byte $18,$1C,$20,$24,$27,$2A,$2F,$34,$38,$3C,$40,$44,$49,$4E,$55,$5C  ; $C8E7
    .byte $62,$68,$6D,$72,$77,$7C,$7F,$82,$86,$8A,$8D,$90,$94,$98,$9B,$9E  ; $C8F7
    .byte $A3,$A8,$AE,$B4,$B9,$BE,$C1,$C4,$C8,$CB,$CB,$02,$08,$F7,$09,$0B  ; $C907
    .byte $02,$F8,$F7,$09,$0B,$02,$00,$F5,$0B,$05,$02,$00,$FB,$05,$0B,$01  ; $C917
    .byte $0F,$FB,$0E,$01,$F1,$FB,$0E,$01,$0F,$F9,$00,$01,$F1,$F9,$00,$00  ; $C927
    .byte $0F,$04,$00,$F1,$04,$02,$0C,$F1,$0F,$0F,$02,$F4,$F1,$0F,$0F,$01  ; $C937
    .byte $08,$FD,$06,$01,$F8,$FD,$06,$01,$06,$FB,$0A,$01,$FA,$FB,$0A,$02  ; $C947
    .byte $10,$F1,$0F,$0F,$02,$F0,$F1,$0F,$0F,$04,$10,$E5,$0F,$0F,$0F,$09  ; $C957
    .byte $04,$F0,$E5,$0F,$0F,$0F,$09,$03,$08,$ED,$10,$10,$06,$03,$F8,$ED  ; $C967
    .byte $10,$10,$06,$02,$0C,$F5,$0B,$0B,$02,$F4,$F5,$0B,$0B,$02,$07,$F5  ; $C977
    .byte $0B,$0B,$02,$F9,$F5,$0B,$0B,$00,$04,$00,$00,$FC,$00,$01,$08,$F9  ; $C987
    .byte $0E,$01,$F8,$F9,$0E,$00,$0C,$00,$00,$F4,$00,$01,$10,$00,$0C,$01  ; $C997
    .byte $F1,$00,$0C,$00,$14,$00,$00,$EC,$00,$02,$10,$F5,$0B,$0B,$02,$F0  ; $C9A7
    .byte $F5,$0B,$0B,$03,$0C,$ED,$10,$10,$06,$03,$F4,$ED,$10,$10,$06,$02  ; $C9B7
    .byte $08,$F5,$0B,$0B,$02,$F8,$F5,$0B,$0B,$00,$08,$00,$00,$F8,$00,$01  ; $C9C7
    .byte $00,$FA,$08,$00,$00,$05  ; $C9D7

sub_1E_C9DD:
    LDA $26                      ; $C9DD  A5 26
    CMP #$01                     ; $C9DF  C9 01
    BNE loc_1E_CA31              ; $C9E1  D0 4E
    LDA $29                      ; $C9E3  A5 29
    AND #$1F                     ; $C9E5  29 1F
    CMP #$08                     ; $C9E7  C9 08
    BEQ loc_1E_C9EF              ; $C9E9  F0 04
    CMP #$0A                     ; $C9EB  C9 0A
    BNE loc_1E_CA31              ; $C9ED  D0 42

loc_1E_C9EF:
    LDA $99                      ; $C9EF  A5 99
    BNE loc_1E_CA03              ; $C9F1  D0 10
    STA $78                      ; $C9F3  85 78
    STA $79                      ; $C9F5  85 79
    LDA #$4F                     ; $C9F7  A9 4F
    STA $7A                      ; $C9F9  85 7A
    LDA #$40                     ; $C9FB  A9 40
    STA $9B                      ; $C9FD  85 9B
    LDA #$04                     ; $C9FF  A9 04
    STA $99                      ; $CA01  85 99

loc_1E_CA03:
    LDA $0330                    ; $CA03  AD 30 03
    CLC                          ; $CA06  18
    ADC #$03                     ; $CA07  69 03
    STA $0330                    ; $CA09  8D 30 03
    LDA $0348                    ; $CA0C  AD 48 03
    ADC #$00                     ; $CA0F  69 00
    STA $0348                    ; $CA11  8D 48 03
    LDA $FC                      ; $CA14  A5 FC
    BNE loc_1E_CA24              ; $CA16  D0 0C
    STA $11                      ; $CA18  85 11
    LDA $F9                      ; $CA1A  A5 F9
    CMP #$23                     ; $CA1C  C9 23
    BEQ loc_1E_CA2E              ; $CA1E  F0 0E
    CMP #$3F                     ; $CA20  C9 3F
    BEQ loc_1E_CA2E              ; $CA22  F0 0A

loc_1E_CA24:
    INC $78                      ; $CA24  E6 78
    INC $79                      ; $CA26  E6 79
    INC $79                      ; $CA28  E6 79
    LDA #$03                     ; $CA2A  A9 03
    STA $11                      ; $CA2C  85 11

loc_1E_CA2E:
    JMP loc_1E_CAB4              ; $CA2E  4C B4 CA


loc_1E_CA31:
    LDA $30                      ; $CA31  A5 30
    CMP #$22                     ; $CA33  C9 22
    BNE loc_1E_CA38              ; $CA35  D0 01
    RTS                          ; $CA37  60


loc_1E_CA38:
    LDA $29                      ; $CA38  A5 29
    AND #$C0                     ; $CA3A  29 C0
    BNE loc_1E_CA59              ; $CA3C  D0 1B
    LDA $0330                    ; $CA3E  AD 30 03
    SEC                          ; $CA41  38
    SBC $FC                      ; $CA42  E5 FC
    STA $10                      ; $CA44  85 10
    LDA $0330                    ; $CA46  AD 30 03
    SEC                          ; $CA49  38
    SBC $3C                      ; $CA4A  E5 3C
    STA $11                      ; $CA4C  85 11
    LDA $0348                    ; $CA4E  AD 48 03
    SBC $3D                      ; $CA51  E5 3D
    ORA $11                      ; $CA53  05 11
    BCC loc_1E_CA5C              ; $CA55  90 05
    BNE loc_1E_CAA4              ; $CA57  D0 4B

loc_1E_CA59:
    JMP loc_1E_CD10              ; $CA59  4C 10 CD


loc_1E_CA5C:
    LDA $10                      ; $CA5C  A5 10
    CMP #$81                     ; $CA5E  C9 81
    BCS loc_1E_CA59              ; $CA60  B0 F7
    LDA $11                      ; $CA62  A5 11
    EOR #$FF                     ; $CA64  49 FF
    ADC #$01                     ; $CA66  69 01
    CMP #$08                     ; $CA68  C9 08
    BCC loc_1E_CA6E              ; $CA6A  90 02
    LDA #$08                     ; $CA6C  A9 08

loc_1E_CA6E:
    STA $11                      ; $CA6E  85 11
    LDA $FC                      ; $CA70  A5 FC
    SEC                          ; $CA72  38
    SBC $11                      ; $CA73  E5 11
    STA $FC                      ; $CA75  85 FC
    PHP                          ; $CA77  08
    LDA $F9                      ; $CA78  A5 F9
    STA $11                      ; $CA7A  85 11
    SBC #$00                     ; $CA7C  E9 00
    STA $F9                      ; $CA7E  85 F9
    PLP                          ; $CA80  28
    LDA $2B                      ; $CA81  A5 2B
    SBC #$00                     ; $CA83  E9 00
    STA $2B                      ; $CA85  85 2B
    BCS loc_1E_CAA0              ; $CA87  B0 17
    LDA #$00                     ; $CA89  A9 00
    STA $FC                      ; $CA8B  85 FC
    STA $2B                      ; $CA8D  85 2B
    LDA $11                      ; $CA8F  A5 11
    STA $F9                      ; $CA91  85 F9
    LDA #$10                     ; $CA93  A9 10
    CMP $0330                    ; $CA95  CD 30 03
    BCC loc_1E_CAA0              ; $CA98  90 06
    STA $0330                    ; $CA9A  8D 30 03
    JMP loc_1E_CC49              ; $CA9D  4C 49 CC


loc_1E_CAA0:
    LDA #$02                     ; $CAA0  A9 02
    BNE loc_1E_CAE9              ; $CAA2  D0 45

loc_1E_CAA4:
    BEQ loc_1E_CAE6              ; $CAA4  F0 40
    LDA $10                      ; $CAA6  A5 10
    CMP #$80                     ; $CAA8  C9 80
    BCC loc_1E_CAE6              ; $CAAA  90 3A
    LDA #$08                     ; $CAAC  A9 08
    CMP $11                      ; $CAAE  C5 11
    BCS loc_1E_CAB4              ; $CAB0  B0 02
    STA $11                      ; $CAB2  85 11

loc_1E_CAB4:
    LDA $FC                      ; $CAB4  A5 FC
    CLC                          ; $CAB6  18
    ADC $11                      ; $CAB7  65 11
    STA $FC                      ; $CAB9  85 FC
    PHP                          ; $CABB  08
    LDA $F9                      ; $CABC  A5 F9
    ADC #$00                     ; $CABE  69 00
    STA $F9                      ; $CAC0  85 F9
    PLP                          ; $CAC2  28
    LDA $2B                      ; $CAC3  A5 2B
    ADC #$00                     ; $CAC5  69 00
    STA $2B                      ; $CAC7  85 2B
    CMP $2A                      ; $CAC9  C5 2A
    BNE loc_1E_CAE2              ; $CACB  D0 15
    LDA #$00                     ; $CACD  A9 00
    STA $FC                      ; $CACF  85 FC
    LDA #$F0                     ; $CAD1  A9 F0
    CMP $0330                    ; $CAD3  CD 30 03
    BCS loc_1E_CAE2              ; $CAD6  B0 0A
    STA $0330                    ; $CAD8  8D 30 03
    LDA #$00                     ; $CADB  A9 00
    STA $FC                      ; $CADD  85 FC
    JMP loc_1E_CB5F              ; $CADF  4C 5F CB


loc_1E_CAE2:
    LDA #$01                     ; $CAE2  A9 01
    BNE loc_1E_CAE9              ; $CAE4  D0 03

loc_1E_CAE6:
    JMP loc_1E_CD10              ; $CAE6  4C 10 CD


loc_1E_CAE9:
    STA $10                      ; $CAE9  85 10
    STA $AC                      ; $CAEB  85 AC
    LDA $FC                      ; $CAED  A5 FC
    SEC                          ; $CAEF  38
    SBC $44                      ; $CAF0  E5 44
    BPL loc_1E_CAF9              ; $CAF2  10 05
    EOR #$FF                     ; $CAF4  49 FF
    CLC                          ; $CAF6  18
    ADC #$01                     ; $CAF7  69 01

loc_1E_CAF9:
    STA $11                      ; $CAF9  85 11
    BEQ loc_1E_CAE6              ; $CAFB  F0 E9
    LDA $10                      ; $CAFD  A5 10
    AND #$01                     ; $CAFF  29 01
    BEQ loc_1E_CB08              ; $CB01  F0 05
    LDA $44                      ; $CB03  A5 44
    JMP loc_1E_CB0C              ; $CB05  4C 0C CB


loc_1E_CB08:
    LDA $44                      ; $CB08  A5 44
    EOR #$FF                     ; $CB0A  49 FF

loc_1E_CB0C:
    AND #$07                     ; $CB0C  29 07
    CLC                          ; $CB0E  18
    ADC $11                      ; $CB0F  65 11
    LSR A                        ; $CB11  4A
    LSR A                        ; $CB12  4A
    LSR A                        ; $CB13  4A
    BEQ loc_1E_CB5C              ; $CB14  F0 46
    LDA $10                      ; $CB16  A5 10
    CMP $28                      ; $CB18  C5 28
    STA $28                      ; $CB1A  85 28
    PHP                          ; $CB1C  08
    AND #$01                     ; $CB1D  29 01
    TAY                          ; $CB1F  A8
    PLP                          ; $CB20  28
    BNE loc_1E_CB31              ; $CB21  D0 0E
    LDA $25                      ; $CB23  A5 25
    CLC                          ; $CB25  18
    ADC $D0C6,Y                  ; $CB26  79 C6 D0
    CMP #$20                     ; $CB29  C9 20
    AND #$1F                     ; $CB2B  29 1F
    STA $25                      ; $CB2D  85 25
    BCC loc_1E_CB39              ; $CB2F  90 08

loc_1E_CB31:
    LDA $24                      ; $CB31  A5 24
    CLC                          ; $CB33  18
    ADC $D0C6,Y                  ; $CB34  79 C6 D0
    STA $24                      ; $CB37  85 24

loc_1E_CB39:
    LDA $25                      ; $CB39  A5 25
    BNE loc_1E_CB4D              ; $CB3B  D0 10
    LDA $26                      ; $CB3D  A5 26
    CMP #$05                     ; $CB3F  C9 05
    BNE loc_1E_CB4D              ; $CB41  D0 0A
    LDA $24                      ; $CB43  A5 24
    CMP #$0B                     ; $CB45  C9 0B
    BEQ loc_1E_CB5C              ; $CB47  F0 13
    CMP #$1A                     ; $CB49  C9 1A
    BEQ loc_1E_CB5C              ; $CB4B  F0 0F

loc_1E_CB4D:
    LDA $F6                      ; $CB4D  A5 F6
    PHA                          ; $CB4F  48
    JSR sub_1E_D8EB              ; $CB50  20 EB D8
    JSR sub_1E_D4E2              ; $CB53  20 E2 D4
    PLA                          ; $CB56  68
    STA $F6                      ; $CB57  85 F6
    JSR sub_1F_FF43              ; $CB59  20 43 FF

loc_1E_CB5C:
    JMP loc_1E_CD10              ; $CB5C  4C 10 CD


loc_1E_CB5F:
    LDA $55                      ; $CB5F  A5 55
    BNE loc_1E_CB5C              ; $CB61  D0 F9
    LDA $29                      ; $CB63  A5 29
    AND #$1F                     ; $CB65  29 1F
    TAY                          ; $CB67  A8
    LDA $A951,Y                  ; $CB68  B9 51 A9
    AND #$20                     ; $CB6B  29 20
    BEQ loc_1E_CB5C              ; $CB6D  F0 ED
    LDA $A951,Y                  ; $CB6F  B9 51 A9
    AND #$C0                     ; $CB72  29 C0
    BNE loc_1E_CB5C              ; $CB74  D0 E6
    INY                          ; $CB76  C8
    STY $00                      ; $CB77  84 00
    LDA $A950,Y                  ; $CB79  B9 50 A9
    AND #$20                     ; $CB7C  29 20
    ORA $00                      ; $CB7E  05 00
    STA $29                      ; $CB80  85 29
    LDA $A950,Y                  ; $CB82  B9 50 A9
    AND #$1F                     ; $CB85  29 1F
    STA $2A                      ; $CB87  85 2A
    LDA #$00                     ; $CB89  A9 00
    STA $2B                      ; $CB8B  85 2B
    LDA $A968,Y                  ; $CB8D  B9 68 A9
    PHA                          ; $CB90  48
    BPL loc_1E_CB96              ; $CB91  10 03
    JSR sub_1E_D0FC              ; $CB93  20 FC D0

loc_1E_CB96:
    JSR sub_1E_C3B8              ; $CB96  20 B8 C3
    JSR sub_1E_C39D              ; $CB99  20 9D C3
    JSR sub_1F_F32D              ; $CB9C  20 2D F3
    JSR sub_1E_D07F              ; $CB9F  20 7F D0
    LDA $28                      ; $CBA2  A5 28
    PHA                          ; $CBA4  48
    LDA #$01                     ; $CBA5  A9 01
    STA $28                      ; $CBA7  85 28
    STA $AC                      ; $CBA9  85 AC
    PLA                          ; $CBAB  68
    AND #$01                     ; $CBAC  29 01
    BNE loc_1E_CBB4              ; $CBAE  D0 04
    INC $24                      ; $CBB0  E6 24
    DEC $25                      ; $CBB2  C6 25

loc_1E_CBB4:
    LDA $FC                      ; $CBB4  A5 FC
    CLC                          ; $CBB6  18
    ADC #$04                     ; $CBB7  69 04
    STA $FC                      ; $CBB9  85 FC
    LDA $F9                      ; $CBBB  A5 F9
    ADC #$00                     ; $CBBD  69 00
    STA $F9                      ; $CBBF  85 F9
    LDA $0318                    ; $CBC1  AD 18 03
    CLC                          ; $CBC4  18
    ADC #$A0                     ; $CBC5  69 A0
    STA $0318                    ; $CBC7  8D 18 03
    LDA $0330                    ; $CBCA  AD 30 03
    ADC #$00                     ; $CBCD  69 00
    STA $0330                    ; $CBCF  8D 30 03
    LDA $0348                    ; $CBD2  AD 48 03
    ADC #$00                     ; $CBD5  69 00
    STA $0348                    ; $CBD7  8D 48 03
    LDA $FC                      ; $CBDA  A5 FC
    SEC                          ; $CBDC  38
    SBC $44                      ; $CBDD  E5 44
    STA $11                      ; $CBDF  85 11
    BEQ loc_1E_CBFE              ; $CBE1  F0 1B
    LDA $44                      ; $CBE3  A5 44
    AND #$07                     ; $CBE5  29 07
    CLC                          ; $CBE7  18
    ADC $11                      ; $CBE8  65 11
    LSR A                        ; $CBEA  4A
    LSR A                        ; $CBEB  4A
    LSR A                        ; $CBEC  4A
    BEQ loc_1E_CBFE              ; $CBED  F0 0F
    INC $25                      ; $CBEF  E6 25
    LDA $25                      ; $CBF1  A5 25
    AND #$1F                     ; $CBF3  29 1F
    STA $25                      ; $CBF5  85 25
    BNE loc_1E_CBFB              ; $CBF7  D0 02
    INC $24                      ; $CBF9  E6 24

loc_1E_CBFB:
    JSR sub_1E_D4E2              ; $CBFB  20 E2 D4

loc_1E_CBFE:
    LDA $FC                      ; $CBFE  A5 FC
    STA $44                      ; $CC00  85 44
    LDA #$04                     ; $CC02  A9 04
    STA $9F                      ; $CC04  85 9F
    JSR sub_1E_C38F              ; $CC06  20 8F C3
    LDA $F6                      ; $CC09  A5 F6
    PHA                          ; $CC0B  48
    LDA #$12                     ; $CC0C  A9 12
    JSR sub_1F_FF3D              ; $CC0E  20 3D FF
    JSR sub_1E_DF5E              ; $CC11  20 5E DF
    LDA $0558                    ; $CC14  AD 58 05
    CMP #$1D                     ; $CC17  C9 1D
    BNE loc_1E_CC20              ; $CC19  D0 05
    LDA #$00                     ; $CC1B  A9 00
    STA $0570                    ; $CC1D  8D 70 05

loc_1E_CC20:
    PLA                          ; $CC20  68
    STA $F6                      ; $CC21  85 F6
    JSR sub_1F_FF43              ; $CC23  20 43 FF
    LDA #$01                     ; $CC26  A9 01
    STA $0300                    ; $CC28  8D 00 03
    LDA #$00                     ; $CC2B  A9 00
    STA $95                      ; $CC2D  85 95
    JSR sub_1F_FF22              ; $CC2F  20 22 FF
    INC $95                      ; $CC32  E6 95
    LDA $FC                      ; $CC34  A5 FC
    BEQ loc_1E_CC3B              ; $CC36  F0 03
    JMP loc_1E_CBB4              ; $CC38  4C B4 CB


loc_1E_CC3B:
    PLA                          ; $CC3B  68
    BPL loc_1E_CC41              ; $CC3C  10 03
    JSR sub_1E_D16B              ; $CC3E  20 6B D1

loc_1E_CC41:
    LDA #$00                     ; $CC41  A9 00
    STA $35                      ; $CC43  85 35
    RTS                          ; $CC45  60


loc_1E_CC46:
    JMP loc_1E_CD10              ; $CC46  4C 10 CD


loc_1E_CC49:
    LDA $29                      ; $CC49  A5 29
    AND #$1F                     ; $CC4B  29 1F
    BEQ loc_1E_CC46              ; $CC4D  F0 F7
    TAY                          ; $CC4F  A8
    LDA $A968,Y                  ; $CC50  B9 68 A9
    AND #$40                     ; $CC53  29 40
    BEQ loc_1E_CC46              ; $CC55  F0 EF
    LDA $A94F,Y                  ; $CC57  B9 4F A9
    AND #$20                     ; $CC5A  29 20
    BEQ loc_1E_CC46              ; $CC5C  F0 E8
    DEY                          ; $CC5E  88
    STY $00                      ; $CC5F  84 00
    LDA $A950,Y                  ; $CC61  B9 50 A9
    AND #$20                     ; $CC64  29 20
    ORA $00                      ; $CC66  05 00
    STA $29                      ; $CC68  85 29
    LDA $A950,Y                  ; $CC6A  B9 50 A9
    AND #$1F                     ; $CC6D  29 1F
    STA $2A                      ; $CC6F  85 2A
    STA $2B                      ; $CC71  85 2B
    JSR sub_1E_C3B8              ; $CC73  20 B8 C3
    JSR sub_1E_C39D              ; $CC76  20 9D C3
    JSR sub_1F_F32D              ; $CC79  20 2D F3
    LDA $28                      ; $CC7C  A5 28
    PHA                          ; $CC7E  48
    LDA #$02                     ; $CC7F  A9 02
    STA $28                      ; $CC81  85 28
    STA $AC                      ; $CC83  85 AC
    PLA                          ; $CC85  68
    AND #$02                     ; $CC86  29 02
    BNE loc_1E_CC8E              ; $CC88  D0 04
    DEC $24                      ; $CC8A  C6 24
    INC $25                      ; $CC8C  E6 25

loc_1E_CC8E:
    LDA $FC                      ; $CC8E  A5 FC
    SEC                          ; $CC90  38
    SBC #$04                     ; $CC91  E9 04
    STA $FC                      ; $CC93  85 FC
    LDA $F9                      ; $CC95  A5 F9
    SBC #$00                     ; $CC97  E9 00
    STA $F9                      ; $CC99  85 F9
    LDA $0318                    ; $CC9B  AD 18 03
    SEC                          ; $CC9E  38
    SBC #$80                     ; $CC9F  E9 80
    STA $0318                    ; $CCA1  8D 18 03
    LDA $0330                    ; $CCA4  AD 30 03
    SBC #$00                     ; $CCA7  E9 00
    STA $0330                    ; $CCA9  8D 30 03
    LDA $0348                    ; $CCAC  AD 48 03
    SBC #$00                     ; $CCAF  E9 00
    STA $0348                    ; $CCB1  8D 48 03
    LDA $FC                      ; $CCB4  A5 FC
    SEC                          ; $CCB6  38
    SBC $44                      ; $CCB7  E5 44
    BPL loc_1E_CCC0              ; $CCB9  10 05
    EOR #$FF                     ; $CCBB  49 FF
    CLC                          ; $CCBD  18
    ADC #$01                     ; $CCBE  69 01

loc_1E_CCC0:
    STA $11                      ; $CCC0  85 11
    BEQ loc_1E_CCDF              ; $CCC2  F0 1B
    LDA $44                      ; $CCC4  A5 44
    EOR #$FF                     ; $CCC6  49 FF
    AND #$07                     ; $CCC8  29 07
    CLC                          ; $CCCA  18
    ADC $11                      ; $CCCB  65 11
    LSR A                        ; $CCCD  4A
    LSR A                        ; $CCCE  4A
    LSR A                        ; $CCCF  4A
    BEQ loc_1E_CCDF              ; $CCD0  F0 0D
    DEC $25                      ; $CCD2  C6 25
    BPL loc_1E_CCDC              ; $CCD4  10 06
    LDA #$1F                     ; $CCD6  A9 1F
    STA $25                      ; $CCD8  85 25
    DEC $24                      ; $CCDA  C6 24

loc_1E_CCDC:
    JSR sub_1E_D4E2              ; $CCDC  20 E2 D4

loc_1E_CCDF:
    LDA $FC                      ; $CCDF  A5 FC
    STA $44                      ; $CCE1  85 44
    LDA #$04                     ; $CCE3  A9 04
    STA $9F                      ; $CCE5  85 9F
    JSR sub_1E_C38F              ; $CCE7  20 8F C3
    LDA $F6                      ; $CCEA  A5 F6
    PHA                          ; $CCEC  48
    LDA #$12                     ; $CCED  A9 12
    JSR sub_1F_FF3D              ; $CCEF  20 3D FF
    JSR sub_1E_DF5E              ; $CCF2  20 5E DF
    PLA                          ; $CCF5  68
    STA $F6                      ; $CCF6  85 F6
    JSR sub_1F_FF43              ; $CCF8  20 43 FF
    LDA #$01                     ; $CCFB  A9 01
    STA $0300                    ; $CCFD  8D 00 03
    LDA #$00                     ; $CD00  A9 00
    STA $95                      ; $CD02  85 95
    JSR sub_1F_FF22              ; $CD04  20 22 FF
    INC $95                      ; $CD07  E6 95
    LDA $FC                      ; $CD09  A5 FC
    BNE loc_1E_CC8E              ; $CD0B  D0 81
    STA $35                      ; $CD0D  85 35

loc_1E_CD0F:
    RTS                          ; $CD0F  60


loc_1E_CD10:
    LDA $FC                      ; $CD10  A5 FC
    BNE loc_1E_CD0F              ; $CD12  D0 FB
    LDA #$10                     ; $CD14  A9 10
    CMP $0330                    ; $CD16  CD 30 03
    BCS loc_1E_CD22              ; $CD19  B0 07
    LDA #$F0                     ; $CD1B  A9 F0
    CMP $0330                    ; $CD1D  CD 30 03
    BCS loc_1E_CD25              ; $CD20  B0 03

loc_1E_CD22:
    STA $0330                    ; $CD22  8D 30 03

loc_1E_CD25:
    LDY $26                      ; $CD25  A4 26
    LDA $D0CC,Y                  ; $CD27  B9 CC D0
    BEQ loc_1E_CD33              ; $CD2A  F0 07
    CMP $29                      ; $CD2C  C5 29
    BNE loc_1E_CD33              ; $CD2E  D0 03
    JMP loc_1E_CF5D              ; $CD30  4C 5D CF


loc_1E_CD33:
    LDA $0390                    ; $CD33  AD 90 03
    BNE loc_1E_CD0F              ; $CD36  D0 D7
    LDA $AF                      ; $CD38  A5 AF
    BEQ loc_1E_CD57              ; $CD3A  F0 1B
    LDA #$80                     ; $CD3C  A9 80
    STA $01                      ; $CD3E  85 01
    LDA $0378                    ; $CD40  AD 78 03
    CMP #$08                     ; $CD43  C9 08
    BCC loc_1E_CD74              ; $CD45  90 2D
    CMP #$E8                     ; $CD47  C9 E8
    BCC loc_1E_CD0F              ; $CD49  90 C4
    LDA $30                      ; $CD4B  A5 30
    CMP #$03                     ; $CD4D  C9 03
    BNE loc_1E_CD0F              ; $CD4F  D0 BE
    LDA #$40                     ; $CD51  A9 40
    STA $01                      ; $CD53  85 01
    BNE loc_1E_CD74              ; $CD55  D0 1D

loc_1E_CD57:
    LDA #$40                     ; $CD57  A9 40
    STA $01                      ; $CD59  85 01
    LDA $0378                    ; $CD5B  AD 78 03
    CMP #$E8                     ; $CD5E  C9 E8
    BCS loc_1E_CD74              ; $CD60  B0 12
    CMP #$08                     ; $CD62  C9 08
    BCS loc_1E_CD0F              ; $CD64  B0 A9
    LDA $37                      ; $CD66  A5 37
    BNE loc_1E_CD70              ; $CD68  D0 06
    LDA $30                      ; $CD6A  A5 30
    CMP #$03                     ; $CD6C  C9 03
    BNE loc_1E_CD0F              ; $CD6E  D0 9F

loc_1E_CD70:
    LDA #$80                     ; $CD70  A9 80
    STA $01                      ; $CD72  85 01

loc_1E_CD74:
    JSR sub_1E_CFF0              ; $CD74  20 F0 CF
    BCS loc_1E_CDCC              ; $CD77  B0 53
    LDA $29                      ; $CD79  A5 29
    AND #$C0                     ; $CD7B  29 C0
    BEQ loc_1E_CDEE              ; $CD7D  F0 6F
    LDA $01                      ; $CD7F  A5 01
    AND $29                      ; $CD81  25 29
    BEQ loc_1E_CDBB              ; $CD83  F0 36
    LDA $2B                      ; $CD85  A5 2B
    CMP $2A                      ; $CD87  C5 2A
    BEQ loc_1E_CD9B              ; $CD89  F0 10
    INC $2B                      ; $CD8B  E6 2B

loc_1E_CD8D:
    INC $24                      ; $CD8D  E6 24
    INC $F9                      ; $CD8F  E6 F9
    INC $0348                    ; $CD91  EE 48 03
    LDA #$01                     ; $CD94  A9 01
    STA $AC                      ; $CD96  85 AC
    JMP loc_1E_CE7C              ; $CD98  4C 7C CE


loc_1E_CD9B:
    INC $29                      ; $CD9B  E6 29
    LDA $29                      ; $CD9D  A5 29
    AND #$1F                     ; $CD9F  29 1F
    STA $29                      ; $CDA1  85 29
    TAY                          ; $CDA3  A8
    LDA $A950,Y                  ; $CDA4  B9 50 A9
    AND #$E0                     ; $CDA7  29 E0
    ORA $29                      ; $CDA9  05 29
    STA $29                      ; $CDAB  85 29
    LDA #$00                     ; $CDAD  A9 00
    STA $2B                      ; $CDAF  85 2B
    LDA $A950,Y                  ; $CDB1  B9 50 A9
    AND #$1F                     ; $CDB4  29 1F
    STA $2A                      ; $CDB6  85 2A
    JMP loc_1E_CD8D              ; $CDB8  4C 8D CD


loc_1E_CDBB:
    LDA $2B                      ; $CDBB  A5 2B
    BEQ loc_1E_CDCF              ; $CDBD  F0 10
    DEC $2B                      ; $CDBF  C6 2B

loc_1E_CDC1:
    DEC $24                      ; $CDC1  C6 24
    DEC $F9                      ; $CDC3  C6 F9
    DEC $0348                    ; $CDC5  CE 48 03
    LDA #$02                     ; $CDC8  A9 02
    STA $AC                      ; $CDCA  85 AC

loc_1E_CDCC:
    JMP loc_1E_CE7C              ; $CDCC  4C 7C CE


loc_1E_CDCF:
    DEC $29                      ; $CDCF  C6 29
    LDA $29                      ; $CDD1  A5 29
    AND #$1F                     ; $CDD3  29 1F
    STA $29                      ; $CDD5  85 29
    TAY                          ; $CDD7  A8
    LDA $A950,Y                  ; $CDD8  B9 50 A9
    AND #$E0                     ; $CDDB  29 E0
    ORA $29                      ; $CDDD  05 29
    STA $29                      ; $CDDF  85 29
    LDA $A950,Y                  ; $CDE1  B9 50 A9
    AND #$1F                     ; $CDE4  29 1F
    STA $2B                      ; $CDE6  85 2B
    STA $2A                      ; $CDE8  85 2A
    JMP loc_1E_CDC1              ; $CDEA  4C C1 CD


loc_1E_CDED:
    RTS                          ; $CDED  60


loc_1E_CDEE:
    LDA $FC                      ; $CDEE  A5 FC
    BNE loc_1E_CDED              ; $CDF0  D0 FB
    LDA $29                      ; $CDF2  A5 29
    AND #$1F                     ; $CDF4  29 1F
    TAY                          ; $CDF6  A8
    LDA $2A                      ; $CDF7  A5 2A
    BNE loc_1E_CE04              ; $CDF9  D0 09
    LDA $A951,Y                  ; $CDFB  B9 51 A9
    AND $01                      ; $CDFE  25 01
    BNE loc_1E_CE0C              ; $CE00  D0 0A
    BEQ loc_1E_CE2B              ; $CE02  F0 27

loc_1E_CE04:
    LDA $2B                      ; $CE04  A5 2B
    BEQ loc_1E_CE2B              ; $CE06  F0 23
    CMP $2A                      ; $CE08  C5 2A
    BNE loc_1E_CE7B              ; $CE0A  D0 6F

loc_1E_CE0C:
    INY                          ; $CE0C  C8
    LDA $A950,Y                  ; $CE0D  B9 50 A9
    AND #$C0                     ; $CE10  29 C0
    BEQ loc_1E_CE7B              ; $CE12  F0 67
    STA $10                      ; $CE14  85 10
    LDA #$00                     ; $CE16  A9 00
    STA $11                      ; $CE18  85 11
    LDA $A950,Y                  ; $CE1A  B9 50 A9
    AND #$1F                     ; $CE1D  29 1F
    STA $12                      ; $CE1F  85 12
    LDA #$01                     ; $CE21  A9 01
    STA $13                      ; $CE23  85 13
    LDA #$01                     ; $CE25  A9 01
    STA $02                      ; $CE27  85 02
    BNE loc_1E_CE4A              ; $CE29  D0 1F

loc_1E_CE2B:
    LDA $A950,Y                  ; $CE2B  B9 50 A9
    DEY                          ; $CE2E  88
    BMI loc_1E_CE7B              ; $CE2F  30 4A
    AND #$C0                     ; $CE31  29 C0
    BEQ loc_1E_CE7B              ; $CE33  F0 46
    EOR #$C0                     ; $CE35  49 C0
    STA $10                      ; $CE37  85 10
    LDA $A950,Y                  ; $CE39  B9 50 A9
    AND #$1F                     ; $CE3C  29 1F
    STA $11                      ; $CE3E  85 11
    STA $12                      ; $CE40  85 12
    LDA #$FF                     ; $CE42  A9 FF
    STA $13                      ; $CE44  85 13
    LDA #$02                     ; $CE46  A9 02
    STA $02                      ; $CE48  85 02

loc_1E_CE4A:
    LDA $01                      ; $CE4A  A5 01
    AND $10                      ; $CE4C  25 10
    BEQ loc_1E_CE7B              ; $CE4E  F0 2B
    STY $10                      ; $CE50  84 10
    LDA $A950,Y                  ; $CE52  B9 50 A9
    AND #$E0                     ; $CE55  29 E0
    ORA $10                      ; $CE57  05 10
    STA $29                      ; $CE59  85 29
    LDA $11                      ; $CE5B  A5 11
    STA $2B                      ; $CE5D  85 2B
    LDA $12                      ; $CE5F  A5 12
    STA $2A                      ; $CE61  85 2A
    LDA $F9                      ; $CE63  A5 F9
    CLC                          ; $CE65  18
    ADC $13                      ; $CE66  65 13
    STA $F9                      ; $CE68  85 F9
    STA $24                      ; $CE6A  85 24
    STA $0348                    ; $CE6C  8D 48 03
    LDA $02                      ; $CE6F  A5 02
    STA $AC                      ; $CE71  85 AC
    LDA #$00                     ; $CE73  A9 00
    JSR sub_1F_FFB7              ; $CE75  20 B7 FF
    JMP loc_1E_CE7C              ; $CE78  4C 7C CE


loc_1E_CE7B:
    RTS                          ; $CE7B  60


loc_1E_CE7C:
    LDA $01                      ; $CE7C  A5 01
    LSR A                        ; $CE7E  4A
    LSR A                        ; $CE7F  4A
    LSR A                        ; $CE80  4A
    LSR A                        ; $CE81  4A
    STA $28                      ; $CE82  85 28
    AND #$04                     ; $CE84  29 04
    LSR A                        ; $CE86  4A
    LSR A                        ; $CE87  4A
    STA $11                      ; $CE88  85 11
    TAX                          ; $CE8A  AA
    LDA $D0C8,X                  ; $CE8B  BD C8 D0
    STA $25                      ; $CE8E  85 25
    JSR sub_1E_C3B8              ; $CE90  20 B8 C3
    JSR sub_1F_F32D              ; $CE93  20 2D F3
    LDA $37                      ; $CE96  A5 37
    BEQ loc_1E_CEA0              ; $CE98  F0 06
    LDA $28                      ; $CE9A  A5 28
    AND #$04                     ; $CE9C  29 04
    BEQ loc_1E_CEA3              ; $CE9E  F0 03

loc_1E_CEA0:
    JSR sub_1E_C39D              ; $CEA0  20 9D C3

loc_1E_CEA3:
    LDA $28                      ; $CEA3  A5 28
    AND #$04                     ; $CEA5  29 04
    BEQ loc_1E_CED3              ; $CEA7  F0 2A
    LDA $FA                      ; $CEA9  A5 FA
    CLC                          ; $CEAB  18
    ADC #$04                     ; $CEAC  69 04
    STA $FA                      ; $CEAE  85 FA
    CMP #$F0                     ; $CEB0  C9 F0
    BCC loc_1E_CEB8              ; $CEB2  90 04
    ADC #$0F                     ; $CEB4  69 0F
    STA $FA                      ; $CEB6  85 FA

loc_1E_CEB8:
    LDA $0360                    ; $CEB8  AD 60 03
    SEC                          ; $CEBB  38
    SBC #$80                     ; $CEBC  E9 80
    STA $0360                    ; $CEBE  8D 60 03
    LDA $0378                    ; $CEC1  AD 78 03
    SBC #$03                     ; $CEC4  E9 03
    STA $0378                    ; $CEC6  8D 78 03
    BCS loc_1E_CF01              ; $CEC9  B0 36
    SBC #$0F                     ; $CECB  E9 0F
    STA $0378                    ; $CECD  8D 78 03
    JMP loc_1E_CF01              ; $CED0  4C 01 CF


loc_1E_CED3:
    LDA $FA                      ; $CED3  A5 FA
    SEC                          ; $CED5  38
    SBC #$04                     ; $CED6  E9 04
    STA $FA                      ; $CED8  85 FA
    BCS loc_1E_CEE0              ; $CEDA  B0 04
    SBC #$0F                     ; $CEDC  E9 0F
    STA $FA                      ; $CEDE  85 FA

loc_1E_CEE0:
    LDA $37                      ; $CEE0  A5 37
    BEQ loc_1E_CEE7              ; $CEE2  F0 03
    JSR sub_1E_D04F              ; $CEE4  20 4F D0

loc_1E_CEE7:
    LDA $0360                    ; $CEE7  AD 60 03
    CLC                          ; $CEEA  18
    ADC #$80                     ; $CEEB  69 80
    STA $0360                    ; $CEED  8D 60 03
    LDA $0378                    ; $CEF0  AD 78 03
    ADC #$03                     ; $CEF3  69 03
    STA $0378                    ; $CEF5  8D 78 03
    CMP #$F0                     ; $CEF8  C9 F0
    BCC loc_1E_CF01              ; $CEFA  90 05
    ADC #$0F                     ; $CEFC  69 0F
    STA $0378                    ; $CEFE  8D 78 03

loc_1E_CF01:
    JSR sub_1E_CF94              ; $CF01  20 94 CF
    LDA $11                      ; $CF04  A5 11
    PHA                          ; $CF06  48
    LDA #$04                     ; $CF07  A9 04
    STA $9F                      ; $CF09  85 9F
    JSR sub_1E_C38F              ; $CF0B  20 8F C3
    LDA $F6                      ; $CF0E  A5 F6
    PHA                          ; $CF10  48
    LDA #$12                     ; $CF11  A9 12
    JSR sub_1F_FF3D              ; $CF13  20 3D FF
    JSR sub_1E_DF5E              ; $CF16  20 5E DF
    PLA                          ; $CF19  68
    STA $F6                      ; $CF1A  85 F6
    JSR sub_1F_FF43              ; $CF1C  20 43 FF
    LDA #$01                     ; $CF1F  A9 01
    STA $0300                    ; $CF21  8D 00 03
    LDA #$00                     ; $CF24  A9 00
    STA $95                      ; $CF26  85 95
    JSR sub_1F_FF22              ; $CF28  20 22 FF
    PLA                          ; $CF2B  68
    STA $11                      ; $CF2C  85 11
    INC $95                      ; $CF2E  E6 95
    LDA $FA                      ; $CF30  A5 FA
    STA $45                      ; $CF32  85 45
    BEQ loc_1E_CF39              ; $CF34  F0 03
    JMP loc_1E_CEA3              ; $CF36  4C A3 CE


loc_1E_CF39:
    LDA $0378                    ; $CF39  AD 78 03
    AND #$F8                     ; $CF3C  29 F8
    STA $0378                    ; $CF3E  8D 78 03
    LDA $29                      ; $CF41  A5 29
    AND #$20                     ; $CF43  29 20
    BEQ loc_1E_CF5C              ; $CF45  F0 15
    LDA $29                      ; $CF47  A5 29
    AND #$3F                     ; $CF49  29 3F
    STA $29                      ; $CF4B  85 29
    LDA #$00                     ; $CF4D  A9 00
    STA $25                      ; $CF4F  85 25
    INC $24                      ; $CF51  E6 24
    LDA #$01                     ; $CF53  A9 01
    STA $28                      ; $CF55  85 28
    LDA #$01                     ; $CF57  A9 01
    JSR sub_1F_FFB7              ; $CF59  20 B7 FF

loc_1E_CF5C:
    RTS                          ; $CF5C  60


loc_1E_CF5D:
    LDA #$08                     ; $CF5D  A9 08
    STA $28                      ; $CF5F  85 28
    LDA #$00                     ; $CF61  A9 00
    STA $11                      ; $CF63  85 11
    LDY $26                      ; $CF65  A4 26
    LDA $24                      ; $CF67  A5 24
    CMP $D0EC,Y                  ; $CF69  D9 EC D0
    BEQ loc_1E_CFBF              ; $CF6C  F0 51
    JSR sub_1E_CF94              ; $CF6E  20 94 CF
    LDA $25                      ; $CF71  A5 25
    BPL loc_1E_CF93              ; $CF73  10 1E
    LDA #$1D                     ; $CF75  A9 1D
    STA $25                      ; $CF77  85 25
    INC $24                      ; $CF79  E6 24
    LDY $26                      ; $CF7B  A4 26
    LDA $24                      ; $CF7D  A5 24
    CMP $D0DC,Y                  ; $CF7F  D9 DC D0
    BNE loc_1E_CF93              ; $CF82  D0 0F
    LDA $D0EC,Y                  ; $CF84  B9 EC D0
    STA $24                      ; $CF87  85 24
    LDY #$3F                     ; $CF89  A0 3F
    LDA #$00                     ; $CF8B  A9 00

loc_1E_CF8D:
    STA $0680,Y                  ; $CF8D  99 80 06
    DEY                          ; $CF90  88
    BPL loc_1E_CF8D              ; $CF91  10 FA

loc_1E_CF93:
    RTS                          ; $CF93  60


sub_1E_CF94:
    LDA $FA                      ; $CF94  A5 FA
    SEC                          ; $CF96  38
    SBC $45                      ; $CF97  E5 45
    BPL loc_1E_CFA0              ; $CF99  10 05
    EOR #$FF                     ; $CF9B  49 FF
    CLC                          ; $CF9D  18
    ADC #$01                     ; $CF9E  69 01

loc_1E_CFA0:
    AND #$0F                     ; $CFA0  29 0F
    STA $10                      ; $CFA2  85 10
    BEQ loc_1E_CF93              ; $CFA4  F0 ED
    LDA $28                      ; $CFA6  A5 28
    AND #$04                     ; $CFA8  29 04
    BEQ loc_1E_CFB1              ; $CFAA  F0 05
    LDA $45                      ; $CFAC  A5 45
    JMP loc_1E_CFB5              ; $CFAE  4C B5 CF


loc_1E_CFB1:
    LDA $45                      ; $CFB1  A5 45
    EOR #$FF                     ; $CFB3  49 FF

loc_1E_CFB5:
    AND #$07                     ; $CFB5  29 07
    CLC                          ; $CFB7  18
    ADC $10                      ; $CFB8  65 10
    LSR A                        ; $CFBA  4A
    LSR A                        ; $CFBB  4A
    LSR A                        ; $CFBC  4A
    BEQ loc_1E_CF93              ; $CFBD  F0 D4

loc_1E_CFBF:
    LDX $11                      ; $CFBF  A6 11
    LDA $25                      ; $CFC1  A5 25
    AND #$01                     ; $CFC3  29 01
    CMP $D0CA,X                  ; $CFC5  DD CA D0
    BNE loc_1E_CFD9              ; $CFC8  D0 0F
    LDA $F6                      ; $CFCA  A5 F6
    PHA                          ; $CFCC  48
    JSR sub_1E_D583              ; $CFCD  20 83 D5
    PLA                          ; $CFD0  68
    STA $F6                      ; $CFD1  85 F6
    JSR sub_1F_FF43              ; $CFD3  20 43 FF
    JMP loc_1E_CFE5              ; $CFD6  4C E5 CF


loc_1E_CFD9:
    LDA $F6                      ; $CFD9  A5 F6
    PHA                          ; $CFDB  48
    JSR sub_1E_D674              ; $CFDC  20 74 D6
    PLA                          ; $CFDF  68
    STA $F6                      ; $CFE0  85 F6
    JSR sub_1F_FF43              ; $CFE2  20 43 FF

loc_1E_CFE5:
    LDX $11                      ; $CFE5  A6 11
    LDA $25                      ; $CFE7  A5 25
    CLC                          ; $CFE9  18
    ADC $D0C6,X                  ; $CFEA  7D C6 D0
    STA $25                      ; $CFED  85 25
    RTS                          ; $CFEF  60


sub_1E_CFF0:
    LDX #$00                     ; $CFF0  A2 00

loc_1E_CFF2:
    LDA $A9E0,X                  ; $CFF2  BD E0 A9
    BMI loc_1E_D04D              ; $CFF5  30 56
    CMP $0348                    ; $CFF7  CD 48 03
    BNE loc_1E_D047              ; $CFFA  D0 4B
    LDA $A9E1,X                  ; $CFFC  BD E1 A9
    CMP $01                      ; $CFFF  C5 01
    BNE loc_1E_D04D              ; $D001  D0 4A
    LDA $A9E2,X                  ; $D003  BD E2 A9
    STA $24                      ; $D006  85 24
    STA $F9                      ; $D008  85 F9
    STA $0348                    ; $D00A  8D 48 03
    LDY $A9E3,X                  ; $D00D  BC E3 A9
    LDA $29                      ; $D010  A5 29
    AND #$1F                     ; $D012  29 1F
    CMP $A9E3,X                  ; $D014  DD E3 A9
    BCC loc_1E_D028              ; $D017  90 0F
    LDA #$02                     ; $D019  A9 02
    STA $AC                      ; $D01B  85 AC
    LDA $A950,Y                  ; $D01D  B9 50 A9
    AND #$1F                     ; $D020  29 1F
    STA $2B                      ; $D022  85 2B
    LDA #$02                     ; $D024  A9 02
    BNE loc_1E_D02E              ; $D026  D0 06

loc_1E_D028:
    LDA #$00                     ; $D028  A9 00
    STA $2B                      ; $D02A  85 2B
    LDA #$01                     ; $D02C  A9 01

loc_1E_D02E:
    STA $AC                      ; $D02E  85 AC
    LDA $A950,Y                  ; $D030  B9 50 A9
    PHA                          ; $D033  48
    AND #$1F                     ; $D034  29 1F
    STA $2A                      ; $D036  85 2A
    PLA                          ; $D038  68
    AND #$E0                     ; $D039  29 E0
    ORA $A9E3,X                  ; $D03B  1D E3 A9
    STA $29                      ; $D03E  85 29
    LDA #$00                     ; $D040  A9 00
    JSR sub_1F_FFB7              ; $D042  20 B7 FF
    SEC                          ; $D045  38
    RTS                          ; $D046  60


loc_1E_D047:
    INX                          ; $D047  E8
    INX                          ; $D048  E8
    INX                          ; $D049  E8
    INX                          ; $D04A  E8
    BNE loc_1E_CFF2              ; $D04B  D0 A5

loc_1E_D04D:
    CLC                          ; $D04D  18
    RTS                          ; $D04E  60


sub_1E_D04F:
    LDY #$17                     ; $D04F  A0 17

loc_1E_D051:
    LDA $0300,Y                  ; $D051  B9 00 03
    CMP #$0D                     ; $D054  C9 0D
    BNE loc_1E_D078              ; $D056  D0 20
    LDA #$00                     ; $D058  A9 00
    STA $0570,Y                  ; $D05A  99 70 05
    LDA $0348                    ; $D05D  AD 48 03
    STA $0348,Y                  ; $D060  99 48 03
    LDA $0360,Y                  ; $D063  B9 60 03
    CLC                          ; $D066  18
    ADC #$80                     ; $D067  69 80
    STA $0360,Y                  ; $D069  99 60 03
    LDA $0378,Y                  ; $D06C  B9 78 03
    ADC #$03                     ; $D06F  69 03
    STA $0378,Y                  ; $D071  99 78 03
    CMP #$F0                     ; $D074  C9 F0
    BCC loc_1E_D07B              ; $D076  90 03

loc_1E_D078:
    JSR sub_1F_F2FE              ; $D078  20 FE F2

loc_1E_D07B:
    DEY                          ; $D07B  88
    BNE loc_1E_D051              ; $D07C  D0 D3
    RTS                          ; $D07E  60


sub_1E_D07F:
    LDA $26                      ; $D07F  A5 26
    CMP #$06                     ; $D081  C9 06
    BEQ loc_1E_D0B0              ; $D083  F0 2B
    CMP #$01                     ; $D085  C9 01
    BNE loc_1E_D0AF              ; $D087  D0 26
    LDA #$8C                     ; $D089  A9 8C
    STA $00                      ; $D08B  85 00
    LDA $29                      ; $D08D  A5 29
    CMP #$29                     ; $D08F  C9 29
    BEQ loc_1E_D09B              ; $D091  F0 08
    CMP #$2A                     ; $D093  C9 2A
    BNE loc_1E_D0AF              ; $D095  D0 18
    LDA #$8F                     ; $D097  A9 8F
    STA $00                      ; $D099  85 00

loc_1E_D09B:
    LDY #$02                     ; $D09B  A0 02

loc_1E_D09D:
    LDA $00                      ; $D09D  A5 00
    STA $05F0,Y                  ; $D09F  99 F0 05
    LDA #$00                     ; $D0A2  A9 00
    STA $05F8,Y                  ; $D0A4  99 F8 05
    STA $05F4,Y                  ; $D0A7  99 F4 05
    DEC $00                      ; $D0AA  C6 00
    DEY                          ; $D0AC  88
    BPL loc_1E_D09D              ; $D0AD  10 EE

loc_1E_D0AF:
    RTS                          ; $D0AF  60


loc_1E_D0B0:
    LDA $29                      ; $D0B0  A5 29
    CMP #$24                     ; $D0B2  C9 24
    BNE loc_1E_D0AF              ; $D0B4  D0 F9
    LDA #$0F                     ; $D0B6  A9 0F
    LDY #$03                     ; $D0B8  A0 03

loc_1E_D0BA:
    STA $060C,Y                  ; $D0BA  99 0C 06
    STA $062C,Y                  ; $D0BD  99 2C 06
    DEY                          ; $D0C0  88
    BPL loc_1E_D0BA              ; $D0C1  10 F7
    STY $18                      ; $D0C3  84 18
    RTS                          ; $D0C5  60

    .byte $FF,$01,$1D,$00,$01,$00,$00,$00,$00,$29,$00,$00,$00,$00,$00,$00  ; $D0C6
    .byte $00,$80,$00,$00,$00,$00,$00,$00,$00,$16,$00,$00,$00,$00,$00,$00  ; $D0D6
    .byte $00,$03,$00,$00,$00,$00,$00,$00,$00,$1D,$00,$00,$00,$00,$00,$00  ; $D0E6
    .byte $00,$04,$00,$00,$00,$00  ; $D0F6

sub_1E_D0FC:
    LDA #$00                     ; $D0FC  A9 00
    STA $9D                      ; $D0FE  85 9D
    LDA $26                      ; $D100  A5 26
    ASL A                        ; $D102  0A
    ASL A                        ; $D103  0A
    ASL A                        ; $D104  0A
    TAX                          ; $D105  AA
    LDA $D231,X                  ; $D106  BD 31 D2
    STA $07D0                    ; $D109  8D D0 07
    LDA $D232,X                  ; $D10C  BD 32 D2
    STA $07D1                    ; $D10F  8D D1 07
    LDA $D233,X                  ; $D112  BD 33 D2
    STA $22                      ; $D115  85 22
    LDA $D234,X                  ; $D117  BD 34 D2
    STA $10                      ; $D11A  85 10
    LDA #$03                     ; $D11C  A9 03
    STA $11                      ; $D11E  85 11
    LDA #$25                     ; $D120  A9 25
    JSR sub_1F_EC5D              ; $D122  20 5D EC

loc_1E_D125:
    LDY $D235,X                  ; $D125  BC 35 D2
    JSR sub_1E_D829              ; $D128  20 29 D8
    LDA #$FF                     ; $D12B  A9 FF
    STA $1C                      ; $D12D  85 1C

loc_1E_D12F:
    LDA #$00                     ; $D12F  A9 00
    STA $95                      ; $D131  85 95
    JSR sub_1F_FF22              ; $D133  20 22 FF
    INC $95                      ; $D136  E6 95
    INC $9D                      ; $D138  E6 9D
    LDA $9D                      ; $D13A  A5 9D
    AND #$03                     ; $D13C  29 03
    BNE loc_1E_D12F              ; $D13E  D0 EF
    INX                          ; $D140  E8
    DEC $11                      ; $D141  C6 11
    BEQ loc_1E_D16A              ; $D143  F0 25
    LDA $07D1                    ; $D145  AD D1 07
    SEC                          ; $D148  38
    SBC #$40                     ; $D149  E9 40
    STA $07D1                    ; $D14B  8D D1 07
    LDA $07D0                    ; $D14E  AD D0 07
    SBC #$00                     ; $D151  E9 00
    STA $07D0                    ; $D153  8D D0 07
    LDA $10                      ; $D156  A5 10
    EOR #$02                     ; $D158  49 02
    STA $10                      ; $D15A  85 10
    AND #$02                     ; $D15C  29 02
    BEQ loc_1E_D125              ; $D15E  F0 C5
    LDA $22                      ; $D160  A5 22
    SEC                          ; $D162  38
    SBC #$08                     ; $D163  E9 08
    STA $22                      ; $D165  85 22
    JMP loc_1E_D125              ; $D167  4C 25 D1


loc_1E_D16A:
    RTS                          ; $D16A  60


sub_1E_D16B:
    LDY $26                      ; $D16B  A4 26
    LDA $0348                    ; $D16D  AD 48 03
    CMP $D301,Y                  ; $D170  D9 01 D3
    BEQ loc_1E_D16A              ; $D173  F0 F5
    LDA #$00                     ; $D175  A9 00
    STA $9D                      ; $D177  85 9D
    LDA $26                      ; $D179  A5 26
    STA $00                      ; $D17B  85 00
    CMP #$0E                     ; $D17D  C9 0E
    BNE loc_1E_D18A              ; $D17F  D0 09
    LDY $F9                      ; $D181  A4 F9
    LDA $D793,Y                  ; $D183  B9 93 D7
    STA $00                      ; $D186  85 00
    STA $27                      ; $D188  85 27

loc_1E_D18A:
    LDA $00                      ; $D18A  A5 00
    ASL A                        ; $D18C  0A
    ASL A                        ; $D18D  0A
    CLC                          ; $D18E  18
    ADC $00                      ; $D18F  65 00
    TAX                          ; $D191  AA
    LDA $D2B1,X                  ; $D192  BD B1 D2
    STA $07D0                    ; $D195  8D D0 07
    LDA $D2B2,X                  ; $D198  BD B2 D2
    STA $07D1                    ; $D19B  8D D1 07
    LDA $D2B3,X                  ; $D19E  BD B3 D2
    STA $22                      ; $D1A1  85 22
    LDA $D2B4,X                  ; $D1A3  BD B4 D2
    STA $10                      ; $D1A6  85 10
    LDA #$03                     ; $D1A8  A9 03
    STA $11                      ; $D1AA  85 11
    LDA $D2B5,X                  ; $D1AC  BD B5 D2
    STA $12                      ; $D1AF  85 12
    LDA $F0                      ; $D1B1  A5 F0
    BNE loc_1E_D1BA              ; $D1B3  D0 05
    LDA #$25                     ; $D1B5  A9 25
    JSR sub_1F_EC5D              ; $D1B7  20 5D EC

loc_1E_D1BA:
    LDY $12                      ; $D1BA  A4 12
    JSR sub_1E_D829              ; $D1BC  20 29 D8
    LDX #$00                     ; $D1BF  A2 00
    JSR sub_1E_D8C7              ; $D1C1  20 C7 D8
    LDY #$00                     ; $D1C4  A0 00
    STY $07D2                    ; $D1C6  8C D2 07
    STY $07D7                    ; $D1C9  8C D7 07

loc_1E_D1CC:
    LDA $07D4,Y                  ; $D1CC  B9 D4 07
    STA $07D3,Y                  ; $D1CF  99 D3 07
    INY                          ; $D1D2  C8
    CPY #$04                     ; $D1D3  C0 04
    BNE loc_1E_D1CC              ; $D1D5  D0 F5
    LDY #$00                     ; $D1D7  A0 00

loc_1E_D1D9:
    LDA $07D9,Y                  ; $D1D9  B9 D9 07
    STA $07D7,Y                  ; $D1DC  99 D7 07
    INY                          ; $D1DF  C8
    CPY #$06                     ; $D1E0  C0 06
    BNE loc_1E_D1D9              ; $D1E2  D0 F5
    STA $1C                      ; $D1E4  85 1C
    LDA $F0                      ; $D1E6  A5 F0
    BEQ loc_1E_D1F6              ; $D1E8  F0 0C
    LDA #$00                     ; $D1EA  A9 00
    STA $1C                      ; $D1EC  85 1C
    LDX #$50                     ; $D1EE  A2 50
    JSR sub_1E_C29C              ; $D1F0  20 9C C2
    JMP loc_1E_D207              ; $D1F3  4C 07 D2


loc_1E_D1F6:
    LDA #$00                     ; $D1F6  A9 00
    STA $95                      ; $D1F8  85 95
    JSR sub_1F_FF22              ; $D1FA  20 22 FF
    INC $95                      ; $D1FD  E6 95
    INC $9D                      ; $D1FF  E6 9D
    LDA $9D                      ; $D201  A5 9D
    AND #$03                     ; $D203  29 03
    BNE loc_1E_D1F6              ; $D205  D0 EF

loc_1E_D207:
    DEC $11                      ; $D207  C6 11
    BEQ loc_1E_D230              ; $D209  F0 25
    LDA $07D1                    ; $D20B  AD D1 07
    CLC                          ; $D20E  18
    ADC #$40                     ; $D20F  69 40
    STA $07D1                    ; $D211  8D D1 07
    LDA $07D0                    ; $D214  AD D0 07
    ADC #$00                     ; $D217  69 00
    STA $07D0                    ; $D219  8D D0 07
    LDA $10                      ; $D21C  A5 10
    EOR #$02                     ; $D21E  49 02
    STA $10                      ; $D220  85 10
    AND #$02                     ; $D222  29 02
    BNE loc_1E_D1BA              ; $D224  D0 94
    LDA $22                      ; $D226  A5 22
    CLC                          ; $D228  18
    ADC #$08                     ; $D229  69 08
    STA $22                      ; $D22B  85 22
    JMP loc_1E_D1BA              ; $D22D  4C BA D1


loc_1E_D230:
    RTS                          ; $D230  60

    .byte $22,$DE,$2F,$03,$E2,$E2,$E3,$00,$22,$DE,$2F,$03,$6C,$64,$6F,$00  ; $D231
    .byte $22,$DE,$2F,$03,$5F,$5F,$00,$00,$22,$DE,$2F,$03,$00,$00,$00,$00  ; $D241
    .byte $22,$DE,$2F,$03,$C0,$C0,$C1,$00,$22,$DE,$2F,$03,$01,$01,$10,$00  ; $D251
    .byte $22,$DE,$2F,$03,$50,$50,$51,$00,$22,$DE,$2F,$03,$0D,$05,$00,$00  ; $D261
    .byte $22,$DE,$2F,$03,$65,$65,$6D,$00,$22,$DE,$2F,$03,$AA,$AA,$00,$00  ; $D271
    .byte $22,$DE,$2F,$03,$16,$15,$11,$00,$22,$1E,$27,$01,$65,$65,$6D,$00  ; $D281
    .byte $22,$DE,$2F,$03,$21,$24,$2C,$00,$22,$DE,$2F,$03,$8B,$8B,$15,$00  ; $D291
    .byte $22,$DE,$2F,$03,$E2,$E2,$E3,$00,$22,$DE,$2F,$03,$72,$72,$7B,$00  ; $D2A1
    .byte $22,$41,$20,$02,$CA,$22,$41,$20,$02,$02,$22,$41,$20,$02,$17,$22  ; $D2B1
    .byte $41,$20,$02,$5F,$22,$41,$20,$02,$0A,$22,$41,$20,$02,$F8,$22,$41  ; $D2C1
    .byte $20,$02,$7A,$22,$41,$20,$02,$0E,$22,$41,$20,$02,$0A,$22,$41,$20  ; $D2D1
    .byte $02,$09,$22,$41,$20,$02,$85,$21,$81,$18,$00,$0A,$22,$41,$20,$02  ; $D2E1
    .byte $07,$22,$41,$20,$02,$0A,$22,$41,$20,$02,$CA,$22,$41,$20,$02,$41  ; $D2F1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$1B,$18,$00,$07  ; $D301

sub_1E_D311:
    LDA #$00                     ; $D311  A9 00
    STA $95                      ; $D313  85 95
    JSR sub_1E_C3F1              ; $D315  20 F1 C3
    INC $1B                      ; $D318  E6 1B
    JSR sub_1E_C38F              ; $D31A  20 8F C3
    JSR sub_1E_C39D              ; $D31D  20 9D C3
    JSR sub_1E_C3B8              ; $D320  20 B8 C3
    JSR sub_1F_FF22              ; $D323  20 22 FF
    JSR sub_1E_C2D1              ; $D326  20 D1 C2
    JSR sub_1F_F3F2              ; $D329  20 F2 F3
    LDA $F9                      ; $D32C  A5 F9
    STA $24                      ; $D32E  85 24
    STA $0348                    ; $D330  8D 48 03
    LDY $26                      ; $D333  A4 26
    LDA $D4C2,Y                  ; $D335  B9 C2 D4
    STA $27                      ; $D338  85 27

loc_1E_D33A:
    JSR sub_1E_D4E2              ; $D33A  20 E2 D4
    LDA $FF                      ; $D33D  A5 FF
    ORA #$04                     ; $D33F  09 04
    STA $2000                    ; $D341  8D 00 20
    LDX #$00                     ; $D344  A2 00
    STX $1A                      ; $D346  86 1A
    JSR sub_1E_C29C              ; $D348  20 9C C2
    LDA $FF                      ; $D34B  A5 FF
    STA $2000                    ; $D34D  8D 00 20
    LDA $24                      ; $D350  A5 24
    CMP $F9                      ; $D352  C5 F9
    BNE loc_1E_D364              ; $D354  D0 0E
    INC $25                      ; $D356  E6 25
    LDA $25                      ; $D358  A5 25
    AND #$1F                     ; $D35A  29 1F
    STA $25                      ; $D35C  85 25
    BNE loc_1E_D33A              ; $D35E  D0 DA
    INC $24                      ; $D360  E6 24
    BNE loc_1E_D33A              ; $D362  D0 D6

loc_1E_D364:
    LDA $26                      ; $D364  A5 26
    STA $F6                      ; $D366  85 F6
    JSR sub_1F_FF43              ; $D368  20 43 FF
    LDY #$0F                     ; $D36B  A0 0F

loc_1E_D36D:
    LDA $A988,Y                  ; $D36D  B9 88 A9
    STA $0620,Y                  ; $D370  99 20 06
    LDA $D4B2,Y                  ; $D373  B9 B2 D4
    STA $0630,Y                  ; $D376  99 30 06
    CPY #$04                     ; $D379  C0 04
    BCS loc_1E_D38B              ; $D37B  B0 0E
    LDA $A998,Y                  ; $D37D  B9 98 A9
    STA $05F0,Y                  ; $D380  99 F0 05
    LDA #$00                     ; $D383  A9 00
    STA $05F4,Y                  ; $D385  99 F4 05
    STA $05F8,Y                  ; $D388  99 F8 05

loc_1E_D38B:
    DEY                          ; $D38B  88
    BPL loc_1E_D36D              ; $D38C  10 DF
    LDA $0620                    ; $D38E  AD 20 06
    STA $0630                    ; $D391  8D 30 06
    LDA $A980                    ; $D394  AD 80 A9
    STA $EA                      ; $D397  85 EA
    LDA $A981                    ; $D399  AD 81 A9
    STA $EB                      ; $D39C  85 EB
    LDY $F9                      ; $D39E  A4 F9
    LDA $AC00,Y                  ; $D3A0  B9 00 AC
    STA $AD                      ; $D3A3  85 AD
    STA $AE                      ; $D3A5  85 AE
    LDA #$01                     ; $D3A7  A9 01
    STA $28                      ; $D3A9  85 28
    STA $AC                      ; $D3AB  85 AC
    LDA #$4C                     ; $D3AD  A9 4C
    STA $03A8                    ; $D3AF  8D A8 03
    LDA #$01                     ; $D3B2  A9 01
    STA $03C0                    ; $D3B4  8D C0 03
    LDY $29                      ; $D3B7  A4 29
    STY $00                      ; $D3B9  84 00
    LDA $A950,Y                  ; $D3BB  B9 50 A9
    AND #$1F                     ; $D3BE  29 1F
    STA $2A                      ; $D3C0  85 2A
    LDA #$00                     ; $D3C2  A9 00
    STA $2B                      ; $D3C4  85 2B
    LDA $A950,Y                  ; $D3C6  B9 50 A9
    AND #$E0                     ; $D3C9  29 E0
    ORA $00                      ; $D3CB  05 00
    STA $29                      ; $D3CD  85 29
    AND #$20                     ; $D3CF  29 20
    BEQ loc_1E_D3DD              ; $D3D1  F0 0A
    LDA $29                      ; $D3D3  A5 29
    AND #$3F                     ; $D3D5  29 3F
    STA $29                      ; $D3D7  85 29
    LDA #$01                     ; $D3D9  A9 01
    BNE loc_1E_D3E3              ; $D3DB  D0 06

loc_1E_D3DD:
    LDA $F9                      ; $D3DD  A5 F9
    STA $24                      ; $D3DF  85 24
    LDA #$00                     ; $D3E1  A9 00

loc_1E_D3E3:
    JSR sub_1F_FFB7              ; $D3E3  20 B7 FF
    LDY $00                      ; $D3E6  A4 00
    LDA $A968,Y                  ; $D3E8  B9 68 A9
    BPL loc_1E_D3F0              ; $D3EB  10 03
    JSR sub_1E_D16B              ; $D3ED  20 6B D1

loc_1E_D3F0:
    JSR sub_1F_F32D              ; $D3F0  20 2D F3
    LDY $26                      ; $D3F3  A4 26
    LDA $D4D2,Y                  ; $D3F5  B9 D2 D4
    JSR sub_1F_EC5B              ; $D3F8  20 5B EC
    LDA #$01                     ; $D3FB  A9 01
    STA $F5                      ; $D3FD  85 F5
    JSR sub_1F_FF43              ; $D3FF  20 43 FF
    LDY $50                      ; $D402  A4 50
    LDA $85F1,Y                  ; $D404  B9 F1 85
    STA $ED                      ; $D407  85 ED
    LDA $50                      ; $D409  A5 50
    ASL A                        ; $D40B  0A
    ASL A                        ; $D40C  0A
    TAY                          ; $D40D  A8
    LDA $854B,Y                  ; $D40E  B9 4B 85
    STA $0631                    ; $D411  8D 31 06
    LDA $854C,Y                  ; $D414  B9 4C 85
    STA $0632                    ; $D417  8D 32 06
    LDA $854D,Y                  ; $D41A  B9 4D 85
    STA $0633                    ; $D41D  8D 33 06
    LDA $FC                      ; $D420  A5 FC
    STA $44                      ; $D422  85 44
    LDA $FA                      ; $D424  A5 FA
    STA $45                      ; $D426  85 45
    LDA $0378                    ; $D428  AD 78 03
    STA $3E                      ; $D42B  85 3E
    LDA $0348                    ; $D42D  AD 48 03
    STA $3D                      ; $D430  85 3D
    LDA $0330                    ; $D432  AD 30 03
    STA $3C                      ; $D435  85 3C
    LDA #$0B                     ; $D437  A9 0B
    STA $F5                      ; $D439  85 F5
    JSR sub_1F_FF43              ; $D43B  20 43 FF
    JSR $814D                    ; $D43E  20 4D 81
    LDA $26                      ; $D441  A5 26
    CMP #$0E                     ; $D443  C9 0E
    BNE loc_1E_D450              ; $D445  D0 09
    LDA $F9                      ; $D447  A5 F9
    CMP #$03                     ; $D449  C9 03
    BNE loc_1E_D450              ; $D44B  D0 03
    JSR $8000                    ; $D44D  20 00 80

loc_1E_D450:
    JSR sub_1E_D474              ; $D450  20 74 D4
    JSR sub_1E_C2DB              ; $D453  20 DB C2
    JSR sub_1F_FF22              ; $D456  20 22 FF
    LDA #$00                     ; $D459  A9 00
    STA $1B                      ; $D45B  85 1B
    JMP sub_1E_C3EB              ; $D45D  4C EB C3

    .byte $A5,$F5,$48,$A5,$F6,$48,$20,$11,$D3,$E6,$95,$68,$85,$F6,$68,$85  ; $D460
    .byte $F5,$4C,$43,$FF  ; $D470

sub_1E_D474:
    LDA $26                      ; $D474  A5 26
    CMP #$0B                     ; $D476  C9 0B
    BNE loc_1E_D4B1              ; $D478  D0 37
    LDA $69                      ; $D47A  A5 69
    CMP #$04                     ; $D47C  C9 04
    BNE loc_1E_D4B1              ; $D47E  D0 31
    LDA #$1B                     ; $D480  A9 1B
    STA $F5                      ; $D482  85 F5
    JSR sub_1F_FF43              ; $D484  20 43 FF
    LDY #$36                     ; $D487  A0 36
    LDX #$28                     ; $D489  A2 28
    STX $43                      ; $D48B  86 43

loc_1E_D48D:
    LDA $8F7F,Y                  ; $D48D  B9 7F 8F
    STA $06BC,X                  ; $D490  9D BC 06
    LDA $8F80,Y                  ; $D493  B9 80 8F
    STA $06BD,X                  ; $D496  9D BD 06
    LDA $8F81,Y                  ; $D499  B9 81 8F
    STA $06BE,X                  ; $D49C  9D BE 06
    LDA $8F82,Y                  ; $D49F  B9 82 8F
    STA $06BF,X                  ; $D4A2  9D BF 06
    DEY                          ; $D4A5  88
    DEY                          ; $D4A6  88
    DEY                          ; $D4A7  88
    DEY                          ; $D4A8  88
    DEY                          ; $D4A9  88
    DEY                          ; $D4AA  88
    DEX                          ; $D4AB  CA
    DEX                          ; $D4AC  CA
    DEX                          ; $D4AD  CA
    DEX                          ; $D4AE  CA
    BNE loc_1E_D48D              ; $D4AF  D0 DC

loc_1E_D4B1:
    RTS                          ; $D4B1  60

    .byte $0F,$0F,$2C,$11,$0F,$0F,$20,$37,$0F,$0F,$20,$27,$0F,$0F,$20,$2A  ; $D4B2
    .byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$08,$0C,$0D,$0E,$0E  ; $D4C2
    .byte $00,$02,$01,$05,$03,$06,$07,$04,$08,$08,$08,$08,$09,$09,$09,$09  ; $D4D2

sub_1E_D4E2:
    LDY $24                      ; $D4E2  A4 24
    JSR sub_1E_D7A3              ; $D4E4  20 A3 D7
    LDA #$20                     ; $D4E7  A9 20
    STA $0780                    ; $D4E9  8D 80 07
    LDA $25                      ; $D4EC  A5 25
    STA $0781                    ; $D4EE  8D 81 07
    LSR A                        ; $D4F1  4A
    LSR A                        ; $D4F2  4A
    STA $22                      ; $D4F3  85 22
    LDA #$1D                     ; $D4F5  A9 1D
    STA $0782                    ; $D4F7  8D 82 07
    LDA #$00                     ; $D4FA  A9 00
    STA $03                      ; $D4FC  85 03
    STA $04                      ; $D4FE  85 04
    LDA $25                      ; $D500  A5 25
    AND #$03                     ; $D502  29 03
    STA $05                      ; $D504  85 05

loc_1E_D506:
    JSR sub_1E_D6C0              ; $D506  20 C0 D6
    LDX $03                      ; $D509  A6 03
    LDY $05                      ; $D50B  A4 05
    LDA $05E0,Y                  ; $D50D  B9 E0 05
    STA $0783,X                  ; $D510  9D 83 07
    LDA $05E4,Y                  ; $D513  B9 E4 05
    STA $0784,X                  ; $D516  9D 84 07
    LDA $22                      ; $D519  A5 22
    CMP #$38                     ; $D51B  C9 38
    BCS loc_1E_D531              ; $D51D  B0 12
    LDA $05E8,Y                  ; $D51F  B9 E8 05
    STA $0785,X                  ; $D522  9D 85 07
    LDA $05EC,Y                  ; $D525  B9 EC 05
    STA $0786,X                  ; $D528  9D 86 07
    INX                          ; $D52B  E8
    INX                          ; $D52C  E8
    INX                          ; $D52D  E8
    INX                          ; $D52E  E8
    STX $03                      ; $D52F  86 03

loc_1E_D531:
    LDA $05                      ; $D531  A5 05
    LSR A                        ; $D533  4A
    BCC loc_1E_D567              ; $D534  90 31
    TAY                          ; $D536  A8
    LDX $22                      ; $D537  A6 22
    LDA $0640,X                  ; $D539  BD 40 06
    AND $D57F,Y                  ; $D53C  39 7F D5
    STA $00                      ; $D53F  85 00
    LDA $10                      ; $D541  A5 10
    AND $D581,Y                  ; $D543  39 81 D5
    ORA $00                      ; $D546  05 00
    STA $0640,X                  ; $D548  9D 40 06
    LDX $04                      ; $D54B  A6 04
    STA $07A4,X                  ; $D54D  9D A4 07
    LDA #$23                     ; $D550  A9 23
    STA $07A1,X                  ; $D552  9D A1 07
    LDA #$C0                     ; $D555  A9 C0
    ORA $22                      ; $D557  05 22
    STA $07A2,X                  ; $D559  9D A2 07
    LDA #$00                     ; $D55C  A9 00
    STA $07A3,X                  ; $D55E  9D A3 07
    INX                          ; $D561  E8
    INX                          ; $D562  E8
    INX                          ; $D563  E8
    INX                          ; $D564  E8
    STX $04                      ; $D565  86 04

loc_1E_D567:
    LDA $22                      ; $D567  A5 22
    CLC                          ; $D569  18
    ADC #$08                     ; $D56A  69 08
    STA $22                      ; $D56C  85 22
    CMP #$40                     ; $D56E  C9 40
    BCC loc_1E_D506              ; $D570  90 94
    LDA #$20                     ; $D572  A9 20
    ADC $04                      ; $D574  65 04
    TAY                          ; $D576  A8
    LDA #$FF                     ; $D577  A9 FF
    STA $0780,Y                  ; $D579  99 80 07
    STA $1A                      ; $D57C  85 1A
    RTS                          ; $D57E  60

    .byte $CC,$33,$33,$CC  ; $D57F

sub_1E_D583:
    LDY $24                      ; $D583  A4 24
    JSR sub_1E_D7A3              ; $D585  20 A3 D7
    LDA $25                      ; $D588  A5 25
    AND #$1C                     ; $D58A  29 1C
    ASL A                        ; $D58C  0A
    STA $22                      ; $D58D  85 22
    LDA #$00                     ; $D58F  A9 00
    STA $03                      ; $D591  85 03
    STA $06                      ; $D593  85 06
    LDA $25                      ; $D595  A5 25
    AND #$03                     ; $D597  29 03
    TAX                          ; $D599  AA
    EOR #$01                     ; $D59A  49 01
    TAY                          ; $D59C  A8
    LDA $D6A4,X                  ; $D59D  BD A4 D6
    STA $04                      ; $D5A0  85 04
    LDA $D6A4,Y                  ; $D5A2  B9 A4 D6
    STA $05                      ; $D5A5  85 05
    LDA $25                      ; $D5A7  A5 25
    LSR A                        ; $D5A9  4A
    LSR A                        ; $D5AA  4A
    TAY                          ; $D5AB  A8
    LDA $D6B8,Y                  ; $D5AC  B9 B8 D6
    STA $0780                    ; $D5AF  8D 80 07
    STA $07D0                    ; $D5B2  8D D0 07
    LDA $D6B0,Y                  ; $D5B5  B9 B0 D6
    ORA $D6A8,X                  ; $D5B8  1D A8 D6
    STA $0781                    ; $D5BB  8D 81 07
    STA $07D1                    ; $D5BE  8D D1 07
    LDA #$1F                     ; $D5C1  A9 1F
    STA $0782                    ; $D5C3  8D 82 07
    STA $07D2                    ; $D5C6  8D D2 07
    LDA #$23                     ; $D5C9  A9 23
    STA $07A3                    ; $D5CB  8D A3 07
    STA $07F3                    ; $D5CE  8D F3 07
    LDA #$C0                     ; $D5D1  A9 C0
    ORA $22                      ; $D5D3  05 22
    STA $07A4                    ; $D5D5  8D A4 07
    STA $07F4                    ; $D5D8  8D F4 07
    LDA #$07                     ; $D5DB  A9 07
    STA $07A5                    ; $D5DD  8D A5 07
    STA $07F5                    ; $D5E0  8D F5 07

loc_1E_D5E3:
    JSR sub_1E_D6C0              ; $D5E3  20 C0 D6
    LDA #$04                     ; $D5E6  A9 04
    STA $07                      ; $D5E8  85 07
    LDA $04                      ; $D5EA  A5 04
    PHA                          ; $D5EC  48
    LDA $05                      ; $D5ED  A5 05
    PHA                          ; $D5EF  48

loc_1E_D5F0:
    LDX $03                      ; $D5F0  A6 03
    LDY $04                      ; $D5F2  A4 04
    LDA $05E0,Y                  ; $D5F4  B9 E0 05
    STA $0783,X                  ; $D5F7  9D 83 07
    LDY $05                      ; $D5FA  A4 05
    LDA $05E0,Y                  ; $D5FC  B9 E0 05
    STA $07D3,X                  ; $D5FF  9D D3 07
    INC $03                      ; $D602  E6 03
    INC $04                      ; $D604  E6 04
    INC $05                      ; $D606  E6 05
    DEC $07                      ; $D608  C6 07
    BNE loc_1E_D5F0              ; $D60A  D0 E4
    PLA                          ; $D60C  68
    STA $05                      ; $D60D  85 05
    PLA                          ; $D60F  68
    STA $04                      ; $D610  85 04
    LDA $25                      ; $D612  A5 25
    AND #$03                     ; $D614  29 03
    LSR A                        ; $D616  4A
    TAY                          ; $D617  A8
    LDX $22                      ; $D618  A6 22
    LDA $0640,X                  ; $D61A  BD 40 06
    AND $D6A0,Y                  ; $D61D  39 A0 D6
    STA $00                      ; $D620  85 00
    LDA $10                      ; $D622  A5 10
    AND $D6A2,Y                  ; $D624  39 A2 D6
    ORA $00                      ; $D627  05 00
    STA $0640,X                  ; $D629  9D 40 06
    LDX $06                      ; $D62C  A6 06
    STA $07A6,X                  ; $D62E  9D A6 07
    STA $07F6,X                  ; $D631  9D F6 07
    INC $06                      ; $D634  E6 06
    INC $22                      ; $D636  E6 22
    LDA $22                      ; $D638  A5 22
    AND #$07                     ; $D63A  29 07
    BNE loc_1E_D5E3              ; $D63C  D0 A5
    DEC $22                      ; $D63E  C6 22
    LDA $22                      ; $D640  A5 22
    AND #$38                     ; $D642  29 38
    STA $22                      ; $D644  85 22
    LDY $24                      ; $D646  A4 24
    INY                          ; $D648  C8
    JSR sub_1E_D7A3              ; $D649  20 A3 D7
    JSR sub_1E_D6C0              ; $D64C  20 C0 D6
    LDY $04                      ; $D64F  A4 04
    LDA $05E0,Y                  ; $D651  B9 E0 05
    STA $0783                    ; $D654  8D 83 07
    LDY $05                      ; $D657  A4 05
    LDA $05E0,Y                  ; $D659  B9 E0 05
    STA $07D3                    ; $D65C  8D D3 07
    LDA $28                      ; $D65F  A5 28
    AND #$04                     ; $D661  29 04
    LSR A                        ; $D663  4A
    LSR A                        ; $D664  4A
    TAX                          ; $D665  AA
    LDY $D6AC,X                  ; $D666  BC AC D6
    LDA #$FF                     ; $D669  A9 FF
    STA $0780,Y                  ; $D66B  99 80 07
    STA $19                      ; $D66E  85 19
    STA $07D0,Y                  ; $D670  99 D0 07
    RTS                          ; $D673  60


sub_1E_D674:
    LDY #$2E                     ; $D674  A0 2E

loc_1E_D676:
    LDA $07D0,Y                  ; $D676  B9 D0 07
    STA $0780,Y                  ; $D679  99 80 07
    DEY                          ; $D67C  88
    BPL loc_1E_D676              ; $D67D  10 F7
    LDA $0781                    ; $D67F  AD 81 07
    EOR #$20                     ; $D682  49 20
    STA $0781                    ; $D684  8D 81 07
    LDA #$23                     ; $D687  A9 23
    STA $07A3                    ; $D689  8D A3 07
    LDA $28                      ; $D68C  A5 28
    AND #$04                     ; $D68E  29 04
    LSR A                        ; $D690  4A
    LSR A                        ; $D691  4A
    EOR #$01                     ; $D692  49 01
    TAX                          ; $D694  AA
    LDY $D6AC,X                  ; $D695  BC AC D6
    LDA #$FF                     ; $D698  A9 FF
    STA $0780,Y                  ; $D69A  99 80 07
    STA $19                      ; $D69D  85 19
    RTS                          ; $D69F  60

    .byte $F0,$0F,$0F,$F0,$00,$04,$08,$0C,$00,$20,$40,$60,$23,$2E,$2A,$1F  ; $D6A0
    .byte $00,$80,$00,$80,$00,$80,$00,$80,$20,$20,$21,$21,$22,$22,$23,$23  ; $D6B0

sub_1E_D6C0:
    JSR sub_1E_D758              ; $D6C0  20 58 D7
    LDY #$03                     ; $D6C3  A0 03
    STY $02                      ; $D6C5  84 02
    LDA #$00                     ; $D6C7  A9 00
    STA $10                      ; $D6C9  85 10

loc_1E_D6CB:
    LDY $02                      ; $D6CB  A4 02
    LDX $D78B,Y                  ; $D6CD  BE 8B D7
    LDA ($00),Y                  ; $D6D0  B1 00
    JSR sub_1E_D703              ; $D6D2  20 03 D7
    TAY                          ; $D6D5  A8
    LDA $AD00,Y                  ; $D6D6  B9 00 AD
    STA $05E0,X                  ; $D6D9  9D E0 05
    LDA $AE00,Y                  ; $D6DC  B9 00 AE
    STA $05E1,X                  ; $D6DF  9D E1 05
    LDA $AF00,Y                  ; $D6E2  B9 00 AF
    STA $05E4,X                  ; $D6E5  9D E4 05
    LDA $B000,Y                  ; $D6E8  B9 00 B0
    STA $05E5,X                  ; $D6EB  9D E5 05
    LDA $B100,Y                  ; $D6EE  B9 00 B1
    AND #$03                     ; $D6F1  29 03
    ORA $10                      ; $D6F3  05 10
    STA $10                      ; $D6F5  85 10
    DEC $02                      ; $D6F7  C6 02
    BMI loc_1E_D702              ; $D6F9  30 07
    ASL $10                      ; $D6FB  06 10
    ASL $10                      ; $D6FD  06 10
    JMP loc_1E_D6CB              ; $D6FF  4C CB D6


loc_1E_D702:
    RTS                          ; $D702  60


sub_1E_D703:
    PHA                          ; $D703  48
    TAY                          ; $D704  A8
    LDA $59                      ; $D705  A5 59
    BNE loc_1E_D756              ; $D707  D0 4D
    LDY $43                      ; $D709  A4 43
    BEQ loc_1E_D72D              ; $D70B  F0 20

loc_1E_D70D:
    LDA $06BC,Y                  ; $D70D  B9 BC 06
    CMP $47                      ; $D710  C5 47
    BNE loc_1E_D727              ; $D712  D0 13
    LDA $06BD,Y                  ; $D714  B9 BD 06
    CMP $22                      ; $D717  C5 22
    BNE loc_1E_D727              ; $D719  D0 0C
    LDA $06BE,Y                  ; $D71B  B9 BE 06
    CMP $02                      ; $D71E  C5 02
    BNE loc_1E_D727              ; $D720  D0 05
    PLA                          ; $D722  68
    LDA $06BF,Y                  ; $D723  B9 BF 06
    RTS                          ; $D726  60


loc_1E_D727:
    DEY                          ; $D727  88
    DEY                          ; $D728  88
    DEY                          ; $D729  88
    DEY                          ; $D72A  88
    BNE loc_1E_D70D              ; $D72B  D0 E0

loc_1E_D72D:
    LDA $1E                      ; $D72D  A5 1E
    BNE loc_1E_D756              ; $D72F  D0 25
    LDA $22                      ; $D731  A5 22
    AND #$01                     ; $D733  29 01
    ASL A                        ; $D735  0A
    ASL A                        ; $D736  0A
    ORA $02                      ; $D737  05 02
    TAY                          ; $D739  A8
    LDA $F2B2,Y                  ; $D73A  B9 B2 F2
    STA $E6                      ; $D73D  85 E6
    LDA $47                      ; $D73F  A5 47
    AND #$01                     ; $D741  29 01
    TAY                          ; $D743  A8
    LDA $22                      ; $D744  A5 22
    LSR A                        ; $D746  4A
    ORA $F2C2,Y                  ; $D747  19 C2 F2
    TAY                          ; $D74A  A8
    LDA $0680,Y                  ; $D74B  B9 80 06
    AND $E6                      ; $D74E  25 E6
    BEQ loc_1E_D756              ; $D750  F0 04
    PLA                          ; $D752  68
    LDA #$00                     ; $D753  A9 00
    PHA                          ; $D755  48

loc_1E_D756:
    PLA                          ; $D756  68
    RTS                          ; $D757  60


sub_1E_D758:
    LDA $26                      ; $D758  A5 26
    CMP #$0E                     ; $D75A  C9 0E
    BNE loc_1E_D768              ; $D75C  D0 0A
    LDY $47                      ; $D75E  A4 47
    LDA $D793,Y                  ; $D760  B9 93 D7
    STA $27                      ; $D763  85 27
    JMP loc_1E_D76A              ; $D765  4C 6A D7


loc_1E_D768:
    LDA $27                      ; $D768  A5 27

loc_1E_D76A:
    CMP $F6                      ; $D76A  C5 F6
    BEQ loc_1E_D773              ; $D76C  F0 05
    STA $F6                      ; $D76E  85 F6
    JSR sub_1F_FF43              ; $D770  20 43 FF

loc_1E_D773:
    LDA #$00                     ; $D773  A9 00
    STA $01                      ; $D775  85 01
    LDY $22                      ; $D777  A4 22
    LDA ($20),Y                  ; $D779  B1 20
    ASL A                        ; $D77B  0A
    ROL $01                      ; $D77C  26 01
    ASL A                        ; $D77E  0A
    ROL $01                      ; $D77F  26 01
    STA $00                      ; $D781  85 00
    LDA $01                      ; $D783  A5 01
    CLC                          ; $D785  18
    ADC #$B2                     ; $D786  69 B2
    STA $01                      ; $D788  85 01
    RTS                          ; $D78A  60

    .byte $00,$02,$08,$0A,$FC,$F3,$CF,$3F,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E  ; $D78B
    .byte $00,$01,$02,$03,$04,$05,$06,$07  ; $D79B

sub_1E_D7A3:
    LDA $26                      ; $D7A3  A5 26
    CMP $F6                      ; $D7A5  C5 F6
    BEQ loc_1E_D7AE              ; $D7A7  F0 05
    STA $F6                      ; $D7A9  85 F6
    JSR sub_1F_FF43              ; $D7AB  20 43 FF

loc_1E_D7AE:
    CPY #$80                     ; $D7AE  C0 80
    BCC loc_1E_D7B4              ; $D7B0  90 02
    LDY #$00                     ; $D7B2  A0 00

loc_1E_D7B4:
    LDA $A900,Y                  ; $D7B4  B9 00 A9
    STY $47                      ; $D7B7  84 47
    PHA                          ; $D7B9  48
    LDA #$00                     ; $D7BA  A9 00
    STA $00                      ; $D7BC  85 00
    PLA                          ; $D7BE  68
    ASL A                        ; $D7BF  0A
    ROL $00                      ; $D7C0  26 00
    ASL A                        ; $D7C2  0A
    ROL $00                      ; $D7C3  26 00
    ASL A                        ; $D7C5  0A
    ROL $00                      ; $D7C6  26 00
    ASL A                        ; $D7C8  0A
    ROL $00                      ; $D7C9  26 00
    ASL A                        ; $D7CB  0A
    ROL $00                      ; $D7CC  26 00
    ASL A                        ; $D7CE  0A
    ROL $00                      ; $D7CF  26 00
    STA $20                      ; $D7D1  85 20
    LDA $00                      ; $D7D3  A5 00
    CLC                          ; $D7D5  18
    ADC #$B6                     ; $D7D6  69 B6
    STA $21                      ; $D7D8  85 21
    RTS                          ; $D7DA  60

    .byte $A9,$08,$8D,$D0,$07,$BD,$78,$03,$29,$F0,$0A,$2E,$D0,$07,$0A,$2E  ; $D7DB
    .byte $D0,$07,$8D,$D1,$07,$BD,$30,$03,$29,$F0,$4A,$4A,$4A,$0D,$D1,$07  ; $D7EB
    .byte $8D,$D1,$07,$20,$29,$D8,$A9,$FF,$85,$1C,$60,$A9,$08,$8D,$D0,$07  ; $D7FB
    .byte $BD,$78,$03,$29,$F0,$0A,$2E,$D0,$07,$0A,$2E,$D0,$07,$8D,$D1,$07  ; $D80B
    .byte $BD,$30,$03,$29,$F0,$4A,$4A,$4A,$0D,$D1,$07,$8D,$D1,$07  ; $D81B

sub_1E_D829:
    LDA $F6                      ; $D829  A5 F6
    PHA                          ; $D82B  48
    LDA $27                      ; $D82C  A5 27
    STA $F6                      ; $D82E  85 F6
    JSR sub_1F_FF43              ; $D830  20 43 FF
    LDA $07D0                    ; $D833  AD D0 07
    STA $07D5                    ; $D836  8D D5 07
    LDA $07D1                    ; $D839  AD D1 07
    ORA #$20                     ; $D83C  09 20
    STA $07D6                    ; $D83E  8D D6 07
    LDA #$01                     ; $D841  A9 01
    STA $07D2                    ; $D843  8D D2 07
    STA $07D7                    ; $D846  8D D7 07
    LDA $AD00,Y                  ; $D849  B9 00 AD
    STA $07D3                    ; $D84C  8D D3 07
    LDA $AE00,Y                  ; $D84F  B9 00 AE
    STA $07D4                    ; $D852  8D D4 07
    LDA $AF00,Y                  ; $D855  B9 00 AF
    STA $07D8                    ; $D858  8D D8 07
    LDA $B000,Y                  ; $D85B  B9 00 B0
    STA $07D9                    ; $D85E  8D D9 07
    LDA $B100,Y                  ; $D861  B9 00 B1
    AND #$03                     ; $D864  29 03
    STA $00                      ; $D866  85 00
    LDY $10                      ; $D868  A4 10
    BEQ loc_1E_D873              ; $D86A  F0 07

loc_1E_D86C:
    ASL $00                      ; $D86C  06 00
    ASL $00                      ; $D86E  06 00
    DEY                          ; $D870  88
    BNE loc_1E_D86C              ; $D871  D0 F9

loc_1E_D873:
    LDY $10                      ; $D873  A4 10
    LDA $D78F,Y                  ; $D875  B9 8F D7
    LDY $22                      ; $D878  A4 22
    AND $0640,Y                  ; $D87A  39 40 06
    ORA $00                      ; $D87D  05 00
    STA $07DD                    ; $D87F  8D DD 07
    STA $0640,Y                  ; $D882  99 40 06
    LDA #$23                     ; $D885  A9 23
    STA $07DA                    ; $D887  8D DA 07
    LDA $22                      ; $D88A  A5 22
    ORA #$C0                     ; $D88C  09 C0
    STA $07DB                    ; $D88E  8D DB 07
    LDA #$00                     ; $D891  A9 00
    STA $07DC                    ; $D893  8D DC 07
    LDA #$FF                     ; $D896  A9 FF
    STA $07DE                    ; $D898  8D DE 07
    PLA                          ; $D89B  68
    STA $F6                      ; $D89C  85 F6
    JSR sub_1F_FF43              ; $D89E  20 43 FF
    RTS                          ; $D8A1  60


sub_1E_D8A2:
    LDA $0330,X                  ; $D8A2  BD 30 03
    LSR A                        ; $D8A5  4A
    LSR A                        ; $D8A6  4A
    LSR A                        ; $D8A7  4A
    LSR A                        ; $D8A8  4A
    PHA                          ; $D8A9  48
    AND #$01                     ; $D8AA  29 01
    STA $10                      ; $D8AC  85 10
    PLA                          ; $D8AE  68
    LSR A                        ; $D8AF  4A
    STA $22                      ; $D8B0  85 22
    LDA $0378,X                  ; $D8B2  BD 78 03
    LSR A                        ; $D8B5  4A
    LSR A                        ; $D8B6  4A
    PHA                          ; $D8B7  48
    AND #$38                     ; $D8B8  29 38
    ORA $22                      ; $D8BA  05 22
    STA $22                      ; $D8BC  85 22
    PLA                          ; $D8BE  68
    LSR A                        ; $D8BF  4A
    AND #$02                     ; $D8C0  29 02
    ORA $10                      ; $D8C2  05 10
    STA $10                      ; $D8C4  85 10
    RTS                          ; $D8C6  60


sub_1E_D8C7:
    LDA $22                      ; $D8C7  A5 22
    AND #$01                     ; $D8C9  29 01
    ASL A                        ; $D8CB  0A
    ASL A                        ; $D8CC  0A
    ORA $10                      ; $D8CD  05 10
    TAY                          ; $D8CF  A8
    LDA $F2B2,Y                  ; $D8D0  B9 B2 F2
    STA $00                      ; $D8D3  85 00
    LDA $0348,X                  ; $D8D5  BD 48 03
    AND #$01                     ; $D8D8  29 01
    TAY                          ; $D8DA  A8
    LDA $22                      ; $D8DB  A5 22
    LSR A                        ; $D8DD  4A
    ORA $F2C2,Y                  ; $D8DE  19 C2 F2
    TAY                          ; $D8E1  A8
    LDA $0680,Y                  ; $D8E2  B9 80 06
    ORA $00                      ; $D8E5  05 00
    STA $0680,Y                  ; $D8E7  99 80 06
    RTS                          ; $D8EA  60


sub_1E_D8EB:
    LDA $46                      ; $D8EB  A5 46
    BEQ loc_1E_D934              ; $D8ED  F0 45
    LDA $F9                      ; $D8EF  A5 F9
    AND #$01                     ; $D8F1  29 01
    TAY                          ; $D8F3  A8
    LDA $F2C2,Y                  ; $D8F4  B9 C2 F2
    STA $00                      ; $D8F7  85 00
    LDA $FC                      ; $D8F9  A5 FC
    LSR A                        ; $D8FB  4A
    LSR A                        ; $D8FC  4A
    LSR A                        ; $D8FD  4A
    LSR A                        ; $D8FE  4A
    LSR A                        ; $D8FF  4A
    AND #$07                     ; $D900  29 07
    CLC                          ; $D902  18
    ADC #$04                     ; $D903  69 04
    CMP #$08                     ; $D905  C9 08
    AND #$07                     ; $D907  29 07
    STA $01                      ; $D909  85 01
    BCS loc_1E_D913              ; $D90B  B0 06
    LDA $00                      ; $D90D  A5 00
    EOR #$20                     ; $D90F  49 20
    STA $00                      ; $D911  85 00

loc_1E_D913:
    LDA $01                      ; $D913  A5 01
    AND #$01                     ; $D915  29 01
    TAY                          ; $D917  A8
    LDA $D935,Y                  ; $D918  B9 35 D9
    STA $02                      ; $D91B  85 02
    LDA $01                      ; $D91D  A5 01
    LSR A                        ; $D91F  4A
    ORA $00                      ; $D920  05 00
    TAY                          ; $D922  A8
    LDX #$08                     ; $D923  A2 08

loc_1E_D925:
    LDA $0680,Y                  ; $D925  B9 80 06
    AND $02                      ; $D928  25 02
    STA $0680,Y                  ; $D92A  99 80 06
    INY                          ; $D92D  C8
    INY                          ; $D92E  C8
    INY                          ; $D92F  C8
    INY                          ; $D930  C8
    DEX                          ; $D931  CA
    BNE loc_1E_D925              ; $D932  D0 F1

loc_1E_D934:
    RTS                          ; $D934  60

    .byte $F0,$0F,$A5,$19,$05,$1A,$D0,$F7,$A5,$1D,$10,$F3,$29,$7F,$85,$1D  ; $D935
    .byte $29,$3F,$85,$22,$A0,$00,$A5,$1D,$29,$40,$F0,$0A,$A0,$04,$A5,$29  ; $D945
    .byte $29,$20,$F0,$02,$A0,$08,$84,$10  ; $D955

sub_1E_D95D:
    LDA $22                      ; $D95D  A5 22
    PHA                          ; $D95F  48
    AND #$07                     ; $D960  29 07
    ASL A                        ; $D962  0A
    ASL A                        ; $D963  0A
    STA $0781                    ; $D964  8D 81 07
    LDA #$02                     ; $D967  A9 02
    STA $0780                    ; $D969  8D 80 07
    PLA                          ; $D96C  68
    AND #$F8                     ; $D96D  29 F8
    ASL A                        ; $D96F  0A
    ROL $0780                    ; $D970  2E 80 07
    ASL A                        ; $D973  0A
    ROL $0780                    ; $D974  2E 80 07
    ASL A                        ; $D977  0A
    ROL $0780                    ; $D978  2E 80 07
    ASL A                        ; $D97B  0A
    ROL $0780                    ; $D97C  2E 80 07
    ORA $0781                    ; $D97F  0D 81 07
    STA $0781                    ; $D982  8D 81 07
    CLC                          ; $D985  18
    ADC #$20                     ; $D986  69 20
    STA $0788                    ; $D988  8D 88 07
    ADC #$20                     ; $D98B  69 20
    STA $078F                    ; $D98D  8D 8F 07
    ADC #$20                     ; $D990  69 20
    STA $0796                    ; $D992  8D 96 07
    LDA $22                      ; $D995  A5 22
    ORA #$C0                     ; $D997  09 C0
    STA $079D                    ; $D999  8D 9D 07
    LDA $0780                    ; $D99C  AD 80 07
    ORA $10                      ; $D99F  05 10
    STA $0780                    ; $D9A1  8D 80 07
    STA $0787                    ; $D9A4  8D 87 07
    STA $078E                    ; $D9A7  8D 8E 07
    STA $0795                    ; $D9AA  8D 95 07
    ORA #$03                     ; $D9AD  09 03
    STA $079C                    ; $D9AF  8D 9C 07
    LDA #$03                     ; $D9B2  A9 03
    STA $0782                    ; $D9B4  8D 82 07
    STA $0789                    ; $D9B7  8D 89 07
    STA $0790                    ; $D9BA  8D 90 07
    STA $0797                    ; $D9BD  8D 97 07
    LDA #$00                     ; $D9C0  A9 00
    STA $079E                    ; $D9C2  8D 9E 07
    LDY $23                      ; $D9C5  A4 23
    JSR sub_1E_D7A3              ; $D9C7  20 A3 D7
    JSR sub_1E_D6C0              ; $D9CA  20 C0 D6
    LDX #$03                     ; $D9CD  A2 03

loc_1E_D9CF:
    LDA $05E0,X                  ; $D9CF  BD E0 05
    STA $0783,X                  ; $D9D2  9D 83 07
    LDA $05E4,X                  ; $D9D5  BD E4 05
    STA $078A,X                  ; $D9D8  9D 8A 07
    LDA $05E8,X                  ; $D9DB  BD E8 05
    STA $0791,X                  ; $D9DE  9D 91 07
    LDA $05EC,X                  ; $D9E1  BD EC 05
    STA $0798,X                  ; $D9E4  9D 98 07
    DEX                          ; $D9E7  CA
    BPL loc_1E_D9CF              ; $D9E8  10 E5
    LDA $10                      ; $D9EA  A5 10
    STA $079F                    ; $D9EC  8D 9F 07
    STX $07A0                    ; $D9EF  8E A0 07
    LDA $22                      ; $D9F2  A5 22
    AND #$3F                     ; $D9F4  29 3F
    CMP #$38                     ; $D9F6  C9 38
    BCC loc_1E_DA05              ; $D9F8  90 0B
    LDX #$04                     ; $D9FA  A2 04

loc_1E_D9FC:
    LDA $079C,X                  ; $D9FC  BD 9C 07
    STA $078E,X                  ; $D9FF  9D 8E 07
    DEX                          ; $DA02  CA
    BPL loc_1E_D9FC              ; $DA03  10 F7

loc_1E_DA05:
    STX $19                      ; $DA05  86 19
    RTS                          ; $DA07  60


loc_1E_DA08:
    LDA #$00                     ; $DA08  A9 00
    STA $1E                      ; $DA0A  85 1E
    LDA $10                      ; $DA0C  A5 10
    ORA #$03                     ; $DA0E  09 03
    STA $0780                    ; $DA10  8D 80 07
    LDA #$C0                     ; $DA13  A9 C0
    STA $0781                    ; $DA15  8D 81 07
    LDY #$3F                     ; $DA18  A0 3F
    STY $0782                    ; $DA1A  8C 82 07

loc_1E_DA1D:
    LDA $0680,Y                  ; $DA1D  B9 80 06
    STA $0783,Y                  ; $DA20  99 83 07
    LDA #$00                     ; $DA23  A9 00
    STA $0680,Y                  ; $DA25  99 80 06
    DEY                          ; $DA28  88
    BPL loc_1E_DA1D              ; $DA29  10 F2
    STY $07C3                    ; $DA2B  8C C3 07
    STY $19                      ; $DA2E  84 19

loc_1E_DA30:
    RTS                          ; $DA30  60


sub_1E_DA31:
    LDA #$04                     ; $DA31  A9 04
    STA $10                      ; $DA33  85 10
    LDA $2C                      ; $DA35  A5 2C
    BEQ loc_1E_DA3B              ; $DA37  F0 02
    ASL $10                      ; $DA39  06 10

loc_1E_DA3B:
    LDA $10                      ; $DA3B  A5 10
    ORA #$20                     ; $DA3D  09 20
    STA $10                      ; $DA3F  85 10
    LDA $19                      ; $DA41  A5 19
    ORA $1A                      ; $DA43  05 1A
    BNE loc_1E_DA30              ; $DA45  D0 E9

sub_1E_DA47:
    LDA $1E                      ; $DA47  A5 1E
    BEQ loc_1E_DA30              ; $DA49  F0 E5
    CMP #$40                     ; $DA4B  C9 40
    BEQ loc_1E_DA08              ; $DA4D  F0 B9
    AND #$7F                     ; $DA4F  29 7F
    STA $1E                      ; $DA51  85 1E
    LDY $23                      ; $DA53  A4 23
    JSR sub_1E_D7A3              ; $DA55  20 A3 D7
    LDA $1E                      ; $DA58  A5 1E
    STA $22                      ; $DA5A  85 22
    PHA                          ; $DA5C  48
    AND #$07                     ; $DA5D  29 07
    ASL A                        ; $DA5F  0A
    ASL A                        ; $DA60  0A
    STA $0781                    ; $DA61  8D 81 07
    LDA #$02                     ; $DA64  A9 02
    STA $0780                    ; $DA66  8D 80 07
    PLA                          ; $DA69  68
    AND #$F8                     ; $DA6A  29 F8
    ASL A                        ; $DA6C  0A
    ROL $0780                    ; $DA6D  2E 80 07
    ASL A                        ; $DA70  0A
    ROL $0780                    ; $DA71  2E 80 07
    ASL A                        ; $DA74  0A
    ROL $0780                    ; $DA75  2E 80 07
    ASL A                        ; $DA78  0A
    ROL $0780                    ; $DA79  2E 80 07
    ORA $0781                    ; $DA7C  0D 81 07
    STA $0781                    ; $DA7F  8D 81 07
    CLC                          ; $DA82  18
    ADC #$20                     ; $DA83  69 20
    STA $0794                    ; $DA85  8D 94 07
    ADC #$20                     ; $DA88  69 20
    STA $07A7                    ; $DA8A  8D A7 07
    ADC #$20                     ; $DA8D  69 20
    STA $07BA                    ; $DA8F  8D BA 07
    LDA $0780                    ; $DA92  AD 80 07
    ORA $10                      ; $DA95  05 10
    STA $0780                    ; $DA97  8D 80 07
    STA $0793                    ; $DA9A  8D 93 07
    STA $07A6                    ; $DA9D  8D A6 07
    STA $07B9                    ; $DAA0  8D B9 07
    LDA #$0F                     ; $DAA3  A9 0F
    STA $0782                    ; $DAA5  8D 82 07
    STA $0795                    ; $DAA8  8D 95 07
    STA $07A8                    ; $DAAB  8D A8 07
    STA $07BB                    ; $DAAE  8D BB 07

loc_1E_DAB1:
    JSR sub_1E_D6C0              ; $DAB1  20 C0 D6
    LDA $22                      ; $DAB4  A5 22
    AND #$03                     ; $DAB6  29 03
    TAX                          ; $DAB8  AA
    LDY $DAF8,X                  ; $DAB9  BC F8 DA
    LDX #$00                     ; $DABC  A2 00

loc_1E_DABE:
    LDA $05E0,X                  ; $DABE  BD E0 05
    STA $0780,Y                  ; $DAC1  99 80 07
    INY                          ; $DAC4  C8
    INX                          ; $DAC5  E8
    TXA                          ; $DAC6  8A
    AND #$03                     ; $DAC7  29 03
    BNE loc_1E_DABE              ; $DAC9  D0 F3
    TYA                          ; $DACB  98
    CLC                          ; $DACC  18
    ADC #$0F                     ; $DACD  69 0F
    PHA                          ; $DACF  48
    LDY $22                      ; $DAD0  A4 22
    LDA $10                      ; $DAD2  A5 10
    STA $0680,Y                  ; $DAD4  99 80 06
    PLA                          ; $DAD7  68
    TAY                          ; $DAD8  A8
    CPY #$4C                     ; $DAD9  C0 4C
    BCC loc_1E_DABE              ; $DADB  90 E1
    INC $1E                      ; $DADD  E6 1E
    INC $22                      ; $DADF  E6 22
    LDA $22                      ; $DAE1  A5 22
    AND #$03                     ; $DAE3  29 03
    BNE loc_1E_DAB1              ; $DAE5  D0 CA
    LDA #$FF                     ; $DAE7  A9 FF
    STA $07CC                    ; $DAE9  8D CC 07
    LDY $22                      ; $DAEC  A4 22
    CPY #$39                     ; $DAEE  C0 39
    BCC loc_1E_DAF5              ; $DAF0  90 03
    STA $07A6                    ; $DAF2  8D A6 07

loc_1E_DAF5:
    STA $19                      ; $DAF5  85 19
    RTS                          ; $DAF7  60

    .byte $03,$07,$0B,$0F  ; $DAF8

sub_1E_DAFC:
    LDA $F5                      ; $DAFC  A5 F5
    PHA                          ; $DAFE  48
    LDA $F6                      ; $DAFF  A5 F6
    PHA                          ; $DB01  48
    LDA #$3F                     ; $DB02  A9 3F
    STA $22                      ; $DB04  85 22

loc_1E_DB06:
    LDA $10                      ; $DB06  A5 10
    PHA                          ; $DB08  48
    JSR sub_1E_D95D              ; $DB09  20 5D D9
    PLA                          ; $DB0C  68
    STA $10                      ; $DB0D  85 10
    JSR sub_1E_C298              ; $DB0F  20 98 C2
    DEC $22                      ; $DB12  C6 22
    BPL loc_1E_DB06              ; $DB14  10 F0
    LDA #$00                     ; $DB16  A9 00
    STA $22                      ; $DB18  85 22
    PLA                          ; $DB1A  68
    STA $F6                      ; $DB1B  85 F6
    PLA                          ; $DB1D  68
    STA $F5                      ; $DB1E  85 F5
    JMP sub_1F_FF43              ; $DB20  4C 43 FF


sub_1E_DB23:
    LDA $F5                      ; $DB23  A5 F5
    PHA                          ; $DB25  48
    LDA $F6                      ; $DB26  A5 F6
    PHA                          ; $DB28  48
    LDA #$80                     ; $DB29  A9 80
    STA $1E                      ; $DB2B  85 1E

loc_1E_DB2D:
    LDA $10                      ; $DB2D  A5 10
    PHA                          ; $DB2F  48
    JSR sub_1E_DA47              ; $DB30  20 47 DA
    PLA                          ; $DB33  68
    STA $10                      ; $DB34  85 10
    JSR sub_1F_FF22              ; $DB36  20 22 FF
    LDA $1E                      ; $DB39  A5 1E
    BNE loc_1E_DB2D              ; $DB3B  D0 F0
    PLA                          ; $DB3D  68
    STA $F6                      ; $DB3E  85 F6
    PLA                          ; $DB40  68
    STA $F5                      ; $DB41  85 F5
    JMP sub_1F_FF43              ; $DB43  4C 43 FF

    LDX #$AF                     ; $DB46  A2 AF
    TXS                          ; $DB48  9A

loc_1E_DB49:
    LDX #$00                     ; $DB49  A2 00
    LDY #$04                     ; $DB4B  A0 04
    LDA $E4,X                    ; $DB4D  B5 E4
    AND #$02                     ; $DB4F  29 02
    STA $00                      ; $DB51  85 00
    LDA $E5,X                    ; $DB53  B5 E5
    AND #$02                     ; $DB55  29 02
    EOR $00                      ; $DB57  45 00
    CLC                          ; $DB59  18
    BEQ loc_1E_DB5D              ; $DB5A  F0 01
    SEC                          ; $DB5C  38

loc_1E_DB5D:
    ROR $E4,X                    ; $DB5D  76 E4
    INX                          ; $DB5F  E8
    DEY                          ; $DB60  88
    BNE loc_1E_DB5D              ; $DB61  D0 FA
    JSR sub_1E_DB6C              ; $DB63  20 6C DB
    JSR sub_1F_FF22              ; $DB66  20 22 FF
    JMP loc_1E_DB49              ; $DB69  4C 49 DB


sub_1E_DB6C:
    LDA $19                      ; $DB6C  A5 19
    ORA $1A                      ; $DB6E  05 1A
    ORA $1B                      ; $DB70  05 1B
    BNE loc_1E_DBD0              ; $DB72  D0 5C
    LDA #$03                     ; $DB74  A9 03
    STA $AB                      ; $DB76  85 AB
    LDA $18                      ; $DB78  A5 18
    AND #$01                     ; $DB7A  29 01
    STA $01                      ; $DB7C  85 01
    LDA #$00                     ; $DB7E  A9 00
    STA $18                      ; $DB80  85 18

loc_1E_DB82:
    LDX $AB                      ; $DB82  A6 AB
    LDA $05F0,X                  ; $DB84  BD F0 05
    BPL loc_1E_DB8F              ; $DB87  10 06
    AND #$7F                     ; $DB89  29 7F
    TAY                          ; $DB8B  A8
    JSR sub_1E_DBD1              ; $DB8C  20 D1 DB

loc_1E_DB8F:
    DEC $AB                      ; $DB8F  C6 AB
    BPL loc_1E_DB82              ; $DB91  10 EF
    LDA $01                      ; $DB93  A5 01
    STA $18                      ; $DB95  85 18
    LDA $05D0                    ; $DB97  AD D0 05
    BPL loc_1E_DBD0              ; $DB9A  10 34
    AND #$7F                     ; $DB9C  29 7F
    TAX                          ; $DB9E  AA
    LDY $DDB3,X                  ; $DB9F  BC B3 DD
    LDA $05D2                    ; $DBA2  AD D2 05
    INC $05D2                    ; $DBA5  EE D2 05
    CMP $DDBC,Y                  ; $DBA8  D9 BC DD
    BNE loc_1E_DBD0              ; $DBAB  D0 23
    LDA #$00                     ; $DBAD  A9 00
    STA $05D2                    ; $DBAF  8D D2 05
    LDA $05D1                    ; $DBB2  AD D1 05
    INC $05D1                    ; $DBB5  EE D1 05
    CMP $DDBB,Y                  ; $DBB8  D9 BB DD
    BNE loc_1E_DBC2              ; $DBBB  D0 05
    LDA #$00                     ; $DBBD  A9 00
    STA $05D1                    ; $DBBF  8D D1 05

loc_1E_DBC2:
    LDX $DDBD,Y                  ; $DBC2  BE BD DD
    TYA                          ; $DBC5  98
    CLC                          ; $DBC6  18
    ADC $05D1                    ; $DBC7  6D D1 05
    TAY                          ; $DBCA  A8
    LDA $DDBE,Y                  ; $DBCB  B9 BE DD
    STA $EA,X                    ; $DBCE  95 EA

loc_1E_DBD0:
    RTS                          ; $DBD0  60


sub_1E_DBD1:
    LDA $DD01,Y                  ; $DBD1  B9 01 DD
    TAY                          ; $DBD4  A8
    LDA $05F8,X                  ; $DBD5  BD F8 05
    INC $05F8,X                  ; $DBD8  FE F8 05
    CMP $DD22,Y                  ; $DBDB  D9 22 DD
    BNE loc_1E_DC1F              ; $DBDE  D0 3F
    LDA #$00                     ; $DBE0  A9 00
    STA $05F8,X                  ; $DBE2  9D F8 05
    LDA $05F4,X                  ; $DBE5  BD F4 05
    INC $05F4,X                  ; $DBE8  FE F4 05
    CMP $DD21,Y                  ; $DBEB  D9 21 DD
    BNE loc_1E_DBF5              ; $DBEE  D0 05
    LDA #$00                     ; $DBF0  A9 00
    STA $05F4,X                  ; $DBF2  9D F4 05

loc_1E_DBF5:
    TYA                          ; $DBF5  98
    CLC                          ; $DBF6  18
    ADC $05F4,X                  ; $DBF7  7D F4 05
    TAX                          ; $DBFA  AA
    LDA $DD23,X                  ; $DBFB  BD 23 DD
    BEQ loc_1E_DC20              ; $DBFE  F0 20
    ASL A                        ; $DC00  0A
    ADC $DD23,X                  ; $DC01  7D 23 DD
    TAX                          ; $DC04  AA
    LDA $AB                      ; $DC05  A5 AB
    ASL A                        ; $DC07  0A
    ASL A                        ; $DC08  0A
    TAY                          ; $DC09  A8
    LDA #$03                     ; $DC0A  A9 03
    STA $00                      ; $DC0C  85 00

loc_1E_DC0E:
    LDA $DC26,X                  ; $DC0E  BD 26 DC
    STA $0601,Y                  ; $DC11  99 01 06
    STA $0621,Y                  ; $DC14  99 21 06
    INY                          ; $DC17  C8
    INX                          ; $DC18  E8
    DEC $00                      ; $DC19  C6 00
    BNE loc_1E_DC0E              ; $DC1B  D0 F1
    INC $01                      ; $DC1D  E6 01

loc_1E_DC1F:
    RTS                          ; $DC1F  60


loc_1E_DC20:
    LDX $AB                      ; $DC20  A6 AB
    STA $05F0,X                  ; $DC22  9D F0 05
    RTS                          ; $DC25  60

    .byte $00,$00,$00,$06,$1B,$0B,$16,$1B,$0B,$26,$1B,$0B,$20,$01,$15,$30  ; $DC26
    .byte $3C,$2C,$30,$30,$3C,$30,$30,$30,$20,$01,$01,$20,$1C,$11,$20,$01  ; $DC36
    .byte $1C,$20,$11,$25,$0F,$14,$04,$17,$14,$04,$27,$14,$04,$29,$19,$09  ; $DC46
    .byte $19,$09,$29,$09,$29,$19,$20,$11,$01,$00,$00,$00,$00,$00,$00,$00  ; $DC56
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $DC66
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$2C,$1C,$2C,$20,$1C  ; $DC76
    .byte $20,$10,$11,$10,$00,$01,$00,$0F,$0F,$20,$1C,$21,$10,$0C,$11,$00  ; $DC86
    .byte $0F,$01,$10,$1C,$0C,$00,$0C,$0F,$0F,$0F,$0F,$21,$11,$01,$11,$01  ; $DC96
    .byte $21,$01,$21,$11,$11,$31,$21,$31,$21,$11,$21,$11,$31,$13,$01,$0F  ; $DCA6
    .byte $13,$01,$0A,$36,$1B,$0B,$37,$18,$08,$27,$18,$08,$07,$18,$08,$13  ; $DCB6
    .byte $01,$1A,$0F,$21,$09,$06,$0F,$29,$30,$00,$05,$30,$00,$0F,$31,$1C  ; $DCC6
    .byte $27,$31,$1C,$0F,$26,$11,$0F,$27,$26,$06,$26,$06,$27,$06,$27,$26  ; $DCD6
    .byte $3C,$2C,$20,$20,$3C,$2C,$2C,$20,$3C,$1C,$10,$2C,$2C,$1C,$10,$10  ; $DCE6
    .byte $2C,$1C,$25,$04,$0F,$04,$0F,$25,$0F,$25,$04,$00,$06,$0C,$12,$18  ; $DCF6
    .byte $1E,$1E,$1E,$1E,$1E,$22,$29,$30,$36,$3D,$44,$4A,$4F,$54,$5A,$5F  ; $DD06
    .byte $65,$69,$6D,$73,$78,$7D,$82,$87,$8C,$92,$92,$03,$08,$01,$02,$03  ; $DD16
    .byte $31,$03,$08,$05,$06,$07,$06,$03,$08,$08,$12,$09,$0A,$03,$08,$0C  ; $DD26
    .byte $0D,$0E,$0D,$03,$08,$09,$0A,$08,$12,$01,$0B,$1E,$1F,$04,$08,$20  ; $DD36
    .byte $21,$22,$28,$00,$04,$08,$23,$24,$25,$28,$00,$03,$08,$26,$27,$28  ; $DD46
    .byte $00,$04,$08,$28,$22,$21,$20,$00,$04,$08,$28,$25,$24,$23,$00,$03  ; $DD56
    .byte $08,$28,$27,$26,$00,$02,$06,$29,$2A,$2B,$02,$04,$2C,$2D,$2E,$03  ; $DD66
    .byte $08,$2F,$30,$35,$30,$02,$08,$32,$33,$34,$03,$08,$04,$0B,$09,$0A  ; $DD76
    .byte $01,$08,$38,$39,$01,$08,$3A,$3B,$03,$08,$09,$0A,$04,$0B,$02,$08  ; $DD86
    .byte $0F,$10,$11,$02,$08,$36,$37,$3C,$02,$08,$3D,$3E,$3F,$02,$08,$40  ; $DD96
    .byte $41,$42,$02,$08,$43,$44,$45,$03,$08,$46,$47,$48,$47,$00,$06,$0B  ; $DDA6
    .byte $11,$16,$1C,$21,$26,$02,$04,$01,$8E,$FC,$FE,$01,$04,$01,$8E,$FC  ; $DDB6
    .byte $02,$04,$00,$A4,$70,$72,$01,$04,$00,$B0,$6C,$02,$04,$00,$A4,$70  ; $DDC6
    .byte $72,$01,$10,$01,$9A,$6E,$01,$08,$01,$EE,$6A,$03,$05,$00,$80,$F4  ; $DDD6
    .byte $F6,$F2  ; $DDE6
    LDX #$8F                     ; $DDE8  A2 8F
    TXS                          ; $DDEA  9A
    LDA #$40                     ; $DDEB  A9 40
    STA $A1                      ; $DDED  85 A1
    CLI                          ; $DDEF  58
    LDA #$01                     ; $DDF0  A9 01
    STA $96                      ; $DDF2  85 96
    LDA #$DB                     ; $DDF4  A9 DB
    STA $94                      ; $DDF6  85 94
    LDA #$46                     ; $DDF8  A9 46
    STA $93                      ; $DDFA  85 93
    LDA #$01                     ; $DDFC  A9 01
    JSR sub_1F_FEF3              ; $DDFE  20 F3 FE
    LDA #$00                     ; $DE01  A9 00
    STA $F9                      ; $DE03  85 F9
    STA $29                      ; $DE05  85 29
    STA $0330                    ; $DE07  8D 30 03
    STA $0348                    ; $DE0A  8D 48 03
    STA $0378                    ; $DE0D  8D 78 03
    STA $0390                    ; $DE10  8D 90 03
    STA $95                      ; $DE13  85 95
    LDA #$17                     ; $DE15  A9 17
    STA $F5                      ; $DE17  85 F5
    LDA #$0C                     ; $DE19  A9 0C
    STA $F6                      ; $DE1B  85 F6
    JSR sub_1F_FF43              ; $DE1D  20 43 FF
    JSR $8000                    ; $DE20  20 00 80
    LDX #$00                     ; $DE23  A2 00
    STX $14                      ; $DE25  86 14
    STX $15                      ; $DE27  86 15
    STX $16                      ; $DE29  86 16
    STX $17                      ; $DE2B  86 17
    LDA #$1A                     ; $DE2D  A9 1A
    JSR sub_1F_EA98              ; $DE2F  20 98 EA
    JSR sub_1F_EA1E              ; $DE32  20 1E EA
    LDA #$01                     ; $DE35  A9 01
    STA $0300                    ; $DE37  8D 00 03
    LDA #$80                     ; $DE3A  A9 80
    STA $0528                    ; $DE3C  8D 28 05
    STA $0330                    ; $DE3F  8D 30 03
    STA $0378                    ; $DE42  8D 78 03
    JSR sub_1E_D311              ; $DE45  20 11 D3
    LDA $BD                      ; $DE48  A5 BD
    ORA #$80                     ; $DE4A  09 80
    STA $BD                      ; $DE4C  85 BD
    LDA $BE                      ; $DE4E  A5 BE
    ORA #$80                     ; $DE50  09 80
    STA $BE                      ; $DE52  85 BE
    LDA #$80                     ; $DE54  A9 80
    STA $2D                      ; $DE56  85 2D
    LDA #$9C                     ; $DE58  A9 9C
    STA $B0                      ; $DE5A  85 B0
    LDA #$08                     ; $DE5C  A9 08
    STA $30                      ; $DE5E  85 30
    LDA #$DE                     ; $DE60  A9 DE
    STA $94                      ; $DE62  85 94
    LDA #$70                     ; $DE64  A9 70
    STA $93                      ; $DE66  85 93
    LDA #$00                     ; $DE68  A9 00
    JSR sub_1F_FEF3              ; $DE6A  20 F3 FE
    JMP loc_1F_FF0B              ; $DE6D  4C 0B FF

    LDX #$DF                     ; $DE70  A2 DF
    TXS                          ; $DE72  9A

loc_1E_DE73:
    LDA $15                      ; $DE73  A5 15
    AND #$02                     ; $DE75  29 02
    BEQ loc_1E_DE7F              ; $DE77  F0 06
    LDA $A0                      ; $DE79  A5 A0
    EOR #$01                     ; $DE7B  49 01
    STA $A0                      ; $DE7D  85 A0

loc_1E_DE7F:
    LDA $A0                      ; $DE7F  A5 A0
    BEQ loc_1E_DE89              ; $DE81  F0 06
    JSR sub_1F_FF22              ; $DE83  20 22 FF
    JMP loc_1E_DE73              ; $DE86  4C 73 DE


loc_1E_DE89:
    LDA $30                      ; $DE89  A5 30
    CMP #$04                     ; $DE8B  C9 04
    BCS loc_1E_DEAC              ; $DE8D  B0 1D
    LDA $54                      ; $DE8F  A5 54
    BNE loc_1E_DEAC              ; $DE91  D0 19
    LDA $14                      ; $DE93  A5 14
    AND #$10                     ; $DE95  29 10
    BEQ loc_1E_DEAC              ; $DE97  F0 13
    LDA #$01                     ; $DE99  A9 01
    STA $F5                      ; $DE9B  85 F5
    LDA #$08                     ; $DE9D  A9 08
    STA $F6                      ; $DE9F  85 F6
    JSR sub_1F_FF43              ; $DEA1  20 43 FF
    LDA #$29                     ; $DEA4  A9 29
    JSR sub_1F_EC5D              ; $DEA6  20 5D EC
    JSR $8000                    ; $DEA9  20 00 80

loc_1E_DEAC:
    LDA #$1B                     ; $DEAC  A9 1B
    JSR sub_1F_FF3D              ; $DEAE  20 3D FF
    JSR $8000                    ; $DEB1  20 00 80
    LDA #$1C                     ; $DEB4  A9 1C
    JSR sub_1F_FF3D              ; $DEB6  20 3D FF
    JSR $8000                    ; $DEB9  20 00 80
    LDA $26                      ; $DEBC  A5 26
    STA $F6                      ; $DEBE  85 F6
    JSR sub_1F_FF43              ; $DEC0  20 43 FF
    JSR sub_1E_C9DD              ; $DEC3  20 DD C9
    LDA #$1B                     ; $DEC6  A9 1B
    STA $F5                      ; $DEC8  85 F5
    LDA $26                      ; $DECA  A5 26
    STA $F6                      ; $DECC  85 F6
    JSR sub_1F_FF43              ; $DECE  20 43 FF
    JSR $988A                    ; $DED1  20 8A 98
    JSR sub_1E_DA31              ; $DED4  20 31 DA
    LDA $FC                      ; $DED7  A5 FC
    STA $44                      ; $DED9  85 44
    LDA $FA                      ; $DEDB  A5 FA
    STA $45                      ; $DEDD  85 45
    LDA $0378                    ; $DEDF  AD 78 03
    STA $3E                      ; $DEE2  85 3E
    LDA $0390                    ; $DEE4  AD 90 03
    STA $3F                      ; $DEE7  85 3F
    LDA $0330                    ; $DEE9  AD 30 03
    STA $3C                      ; $DEEC  85 3C
    LDA $0348                    ; $DEEE  AD 48 03
    STA $3D                      ; $DEF1  85 3D
    CMP $69                      ; $DEF3  C5 69
    BCC loc_1E_DEF9              ; $DEF5  90 02
    STA $69                      ; $DEF7  85 69

loc_1E_DEF9:
    LDA $26                      ; $DEF9  A5 26
    BNE loc_1E_DF1A              ; $DEFB  D0 1D
    LDA $FC                      ; $DEFD  A5 FC
    LSR A                        ; $DEFF  4A
    AND #$03                     ; $DF00  29 03
    TAY                          ; $DF02  A8
    LDA $29                      ; $DF03  A5 29
    AND #$1F                     ; $DF05  29 1F
    TAX                          ; $DF07  AA
    LDA $DF53,X                  ; $DF08  BD 53 DF
    BNE loc_1E_DF15              ; $DF0B  D0 08
    LDA $9D                      ; $DF0D  A5 9D
    LSR A                        ; $DF0F  4A
    LSR A                        ; $DF10  4A
    LSR A                        ; $DF11  4A
    AND #$03                     ; $DF12  29 03
    TAY                          ; $DF14  A8

loc_1E_DF15:
    LDA $DF4F,Y                  ; $DF15  B9 4F DF
    STA $EA                      ; $DF18  85 EA

loc_1E_DF1A:
    LDA #$04                     ; $DF1A  A9 04
    STA $9F                      ; $DF1C  85 9F
    JSR sub_1E_C38F              ; $DF1E  20 8F C3
    JSR sub_1E_DF5E              ; $DF21  20 5E DF
    LDA #$00                     ; $DF24  A9 00
    STA $95                      ; $DF26  85 95
    STA $73                      ; $DF28  85 73
    LDA $15                      ; $DF2A  A5 15
    AND #$01                     ; $DF2C  29 01
    BEQ loc_1E_DF47              ; $DF2E  F0 17
    LDA $EC                      ; $DF30  A5 EC
    PHA                          ; $DF32  48
    LDA $ED                      ; $DF33  A5 ED
    PHA                          ; $DF35  48
    LDA #$C2                     ; $DF36  A9 C2
    STA $EC                      ; $DF38  85 EC
    LDA #$C3                     ; $DF3A  A9 C3
    STA $ED                      ; $DF3C  85 ED
    JSR sub_1F_E4A6              ; $DF3E  20 A6 E4
    PLA                          ; $DF41  68
    STA $ED                      ; $DF42  85 ED
    PLA                          ; $DF44  68
    STA $EC                      ; $DF45  85 EC

loc_1E_DF47:
    JSR sub_1F_FF22              ; $DF47  20 22 FF
    INC $95                      ; $DF4A  E6 95
    JMP loc_1E_DE73              ; $DF4C  4C 73 DE

    .byte $80,$F4,$F6,$F2,$00,$00,$FF,$FF,$00,$00,$00,$00,$00,$00,$00  ; $DF4F

sub_1E_DF5E:
    LDA #$FF                     ; $DF5E  A9 FF
    STA $EC                      ; $DF60  85 EC
    STA $EE                      ; $DF62  85 EE
    STA $EF                      ; $DF64  85 EF
    LDA $74                      ; $DF66  A5 74
    BEQ loc_1E_DF71              ; $DF68  F0 07
    JSR sub_1F_E2E7              ; $DF6A  20 E7 E2
    LDA #$28                     ; $DF6D  A9 28
    STA $EE                      ; $DF6F  85 EE

loc_1E_DF71:
    INC $9D                      ; $DF71  E6 9D
    LDA $9D                      ; $DF73  A5 9D
    LSR A                        ; $DF75  4A
    BCS loc_1E_DF91              ; $DF76  B0 19
    JSR sub_1F_E260              ; $DF78  20 60 E2
    LDX #$00                     ; $DF7B  A2 00
    STX $9E                      ; $DF7D  86 9E

loc_1E_DF7F:
    LDA $0300,X                  ; $DF7F  BD 00 03
    BEQ loc_1E_DF87              ; $DF82  F0 03
    JSR sub_1E_DFC3              ; $DF84  20 C3 DF

loc_1E_DF87:
    INC $9E                      ; $DF87  E6 9E
    LDX $9E                      ; $DF89  A6 9E
    CPX #$18                     ; $DF8B  E0 18
    BNE loc_1E_DF7F              ; $DF8D  D0 F0
    BEQ loc_1E_DFB8              ; $DF8F  F0 27

loc_1E_DF91:
    LDX $56                      ; $DF91  A6 56
    LDA $0300,X                  ; $DF93  BD 00 03
    PHA                          ; $DF96  48
    CMP #$6E                     ; $DF97  C9 6E
    BNE loc_1E_DF9E              ; $DF99  D0 03
    JSR sub_1F_E260              ; $DF9B  20 60 E2

loc_1E_DF9E:
    LDX #$17                     ; $DF9E  A2 17
    STX $9E                      ; $DFA0  86 9E

loc_1E_DFA2:
    LDA $0300,X                  ; $DFA2  BD 00 03
    BEQ loc_1E_DFAA              ; $DFA5  F0 03
    JSR sub_1E_DFC3              ; $DFA7  20 C3 DF

loc_1E_DFAA:
    DEC $9E                      ; $DFAA  C6 9E
    LDX $9E                      ; $DFAC  A6 9E
    BPL loc_1E_DFA2              ; $DFAE  10 F2
    PLA                          ; $DFB0  68
    CMP #$6E                     ; $DFB1  C9 6E
    BEQ loc_1E_DFB8              ; $DFB3  F0 03
    JSR sub_1F_E270              ; $DFB5  20 70 E2

loc_1E_DFB8:
    LDA $EF                      ; $DFB8  A5 EF
    BPL loc_1E_DFC2              ; $DFBA  10 06
    LDA $EE                      ; $DFBC  A5 EE
    STA $EF                      ; $DFBE  85 EF
    INC $EF                      ; $DFC0  E6 EF

loc_1E_DFC2:
    RTS                          ; $DFC2  60


sub_1E_DFC3:
    LDA $0528,X                  ; $DFC3  BD 28 05
    AND #$7F                     ; $DFC6  29 7F
    STA $0528,X                  ; $DFC8  9D 28 05
    LDA $0330,X                  ; $DFCB  BD 30 03
    SEC                          ; $DFCE  38
    SBC $FC                      ; $DFCF  E5 FC
    STA $13                      ; $DFD1  85 13
    LDA $0348,X                  ; $DFD3  BD 48 03
    SBC $F9                      ; $DFD6  E5 F9
    BEQ loc_1E_DFF9              ; $DFD8  F0 1F
    LDA $0528,X                  ; $DFDA  BD 28 05
    AND #$08                     ; $DFDD  29 08
    BEQ loc_1F_E057              ; $DFDF  F0 76
    LDA $13                      ; $DFE1  A5 13
    BCS loc_1E_DFE9              ; $DFE3  B0 04
    EOR #$FF                     ; $DFE5  49 FF
    ADC #$01                     ; $DFE7  69 01

loc_1E_DFE9:
    CMP #$30                     ; $DFE9  C9 30
    BCS loc_1F_E017              ; $DFEB  B0 2A
    LDA $0390,X                  ; $DFED  BD 90 03
    BEQ loc_1E_DFF6              ; $DFF0  F0 04
    BPL loc_1F_E017              ; $DFF2  10 23
    BMI loc_1F_E00D              ; $DFF4  30 17

loc_1E_DFF6:
    JMP loc_1F_E08F              ; $DFF6  4C 8F E0


loc_1E_DFF9:
    LDA $0378,X                  ; $DFF9  BD 78 03
    STA $12                      ; $DFFC  85 12
    LDA $0390,X                  ; $DFFE  BD 90 08
