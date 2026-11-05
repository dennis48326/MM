; PRG 8 KB bank $3E at $C000
.segment "BANK3E"
.org $C000


nmi_vector:
    PHA                          ; $C000  48
    TXA                          ; $C001  8A
    PHA                          ; $C002  48
    TYA                          ; $C003  98
    PHA                          ; $C004  48
    LDA $F2                      ; $C005  A5 F2
    BEQ loc_3E_C013              ; $C007  F0 0A
    LDA $FD                      ; $C009  A5 FD
    BNE loc_3E_C010              ; $C00B  D0 03
    JMP loc_3E_C0A9              ; $C00D  4C A9 C0


loc_3E_C010:
    JMP loc_3E_C0C0              ; $C010  4C C0 C0


loc_3E_C013:
    LDA $FC                      ; $C013  A5 FC
    AND #$78                     ; $C015  29 78
    STA $2000                    ; $C017  8D 00 20
    LDA #$00                     ; $C01A  A9 00
    STA $2001                    ; $C01C  8D 01 20
    LDA $FB                      ; $C01F  A5 FB
    STA $A000                    ; $C021  8D 00 A0
    LDA #$00                     ; $C024  A9 00
    STA $2003                    ; $C026  8D 03 20
    LDA #$02                     ; $C029  A9 02
    STA $4014                    ; $C02B  8D 14 40
    LDA $60                      ; $C02E  A5 60
    BNE loc_3E_C046              ; $C030  D0 14
    LDA $47                      ; $C032  A5 47
    BNE loc_3E_C043              ; $C034  D0 0D
    LDA $46                      ; $C036  A5 46
    BNE loc_3E_C040              ; $C038  D0 06
    JSR sub_3E_C79C              ; $C03A  20 9C C7
    JMP loc_3E_C049              ; $C03D  4C 49 C0


loc_3E_C040:
    JSR sub_3E_C69E              ; $C040  20 9E C6

loc_3E_C043:
    JSR sub_3E_C6D7              ; $C043  20 D7 C6

loc_3E_C046:
    JSR sub_3E_C7DE              ; $C046  20 DE C7

loc_3E_C049:
    LDA $2002                    ; $C049  AD 02 20
    LDA $F7                      ; $C04C  A5 F7
    CLC                          ; $C04E  18
    ADC $069D                    ; $C04F  6D 9D 06
    STA $06A7                    ; $C052  8D A7 06
    STA $2005                    ; $C055  8D 05 20
    LDA $57                      ; $C058  A5 57
    STA $06A8                    ; $C05A  8D A8 06
    LDA $F9                      ; $C05D  A5 F9
    CLC                          ; $C05F  18
    ADC $069C                    ; $C060  6D 9C 06
    STA $2005                    ; $C063  8D 05 20
    LDA $0677                    ; $C066  AD 77 06
    STA $0676                    ; $C069  8D 76 06
    LDA $0672                    ; $C06C  AD 72 06
    STA $C000                    ; $C06F  8D 00 C0
    STA $C001                    ; $C072  8D 01 C0
    LDY $F4                      ; $C075  A4 F4
    STA $E000,Y                  ; $C077  99 00 E0
    LDA $FD                      ; $C07A  A5 FD
    AND #$F9                     ; $C07C  29 F9
    STA $2001                    ; $C07E  8D 01 20
    LDA $FA                      ; $C081  A5 FA
    AND #$01                     ; $C083  29 01
    ASL A                        ; $C085  0A
    ORA $FC                      ; $C086  05 FC
    ORA $F8                      ; $C088  05 F8
    STA $2000                    ; $C08A  8D 00 20
    INC $F3                      ; $C08D  E6 F3
    LDX #$03                     ; $C08F  A2 03

loc_3E_C091:
    LDA $21,X                    ; $C091  B5 21
    CMP #$01                     ; $C093  C9 01
    BNE loc_3E_C09F              ; $C095  D0 08
    DEC $25,X                    ; $C097  D6 25
    BNE loc_3E_C09F              ; $C099  D0 04
    LDA #$04                     ; $C09B  A9 04
    STA $21,X                    ; $C09D  95 21

loc_3E_C09F:
    DEX                          ; $C09F  CA
    BPL loc_3E_C091              ; $C0A0  10 EF
    LDA #$88                     ; $C0A2  A9 88
    STA $F2                      ; $C0A4  85 F2
    JSR sub_3E_C711              ; $C0A6  20 11 C7

loc_3E_C0A9:
    LDA $F4                      ; $C0A9  A5 F4
    BEQ loc_3E_C0B4              ; $C0AB  F0 07
    LDA $0672                    ; $C0AD  AD 72 06
    CMP #$70                     ; $C0B0  C9 70
    BCC loc_3E_C0B7              ; $C0B2  90 03

loc_3E_C0B4:
    JSR sub_3E_C8C1              ; $C0B4  20 C1 C8

loc_3E_C0B7:
    JSR sub_3E_C88D              ; $C0B7  20 8D C8
    PLA                          ; $C0BA  68
    TAY                          ; $C0BB  A8
    PLA                          ; $C0BC  68
    TAX                          ; $C0BD  AA
    PLA                          ; $C0BE  68
    RTI                          ; $C0BF  40


loc_3E_C0C0:
    LDA $F4                      ; $C0C0  A5 F4
    BEQ loc_3E_C0F5              ; $C0C2  F0 31
    LDA $0677                    ; $C0C4  AD 77 06
    STA $0676                    ; $C0C7  8D 76 06
    LDA $0672                    ; $C0CA  AD 72 06
    STA $C000                    ; $C0CD  8D 00 C0
    STA $C001                    ; $C0D0  8D 01 C0
    LDY $F4                      ; $C0D3  A4 F4
    STA $E000,Y                  ; $C0D5  99 00 E0
    LDA $2002                    ; $C0D8  AD 02 20
    LDA $F7                      ; $C0DB  A5 F7
    CLC                          ; $C0DD  18
    ADC $069D                    ; $C0DE  6D 9D 06
    STA $06A7                    ; $C0E1  8D A7 06
    STA $2005                    ; $C0E4  8D 05 20
    LDA $57                      ; $C0E7  A5 57
    STA $06A8                    ; $C0E9  8D A8 06
    LDA $F9                      ; $C0EC  A5 F9
    CLC                          ; $C0EE  18
    ADC $069C                    ; $C0EF  6D 9C 06
    STA $2005                    ; $C0F2  8D 05 20

loc_3E_C0F5:
    LDA $FA                      ; $C0F5  A5 FA
    AND #$01                     ; $C0F7  29 01
    ASL A                        ; $C0F9  0A
    ORA $FC                      ; $C0FA  05 FC
    ORA $F8                      ; $C0FC  05 F8
    STA $2000                    ; $C0FE  8D 00 20
    JMP loc_3E_C0A9              ; $C101  4C A9 C0


sub_3E_C104:
    LDA $0676                    ; $C104  AD 76 06
    ASL A                        ; $C107  0A
    TAX                          ; $C108  AA
    LDA $C116,X                  ; $C109  BD 16 C1
    STA $1D                      ; $C10C  85 1D
    LDA $C117,X                  ; $C10E  BD 17 C1
    STA $1E                      ; $C111  85 1E
    JMP ($001D)                  ; $C113  6C 1D 00

    .byte $67,$C1,$8C,$C1,$AB,$C1,$DB,$C1,$FB,$C1,$18,$C2,$29,$C2,$3A,$C2  ; $C116
    .byte $58,$C2,$7A,$C2,$A8,$C2,$BE,$C2,$D7,$C2,$F0,$C2,$FF,$C2,$1B,$C3  ; $C126
    .byte $F0,$C2,$37,$C3,$B8,$C3,$B8,$C3,$D8,$C3,$53,$C4,$75,$C4,$8F,$C4  ; $C136
    .byte $A3,$C4,$B2,$C4,$F2,$C4  ; $C146

irq_vector:
    PHA                          ; $C14C  48
    TXA                          ; $C14D  8A
    PHA                          ; $C14E  48
    TYA                          ; $C14F  98
    PHA                          ; $C150  48
    STA $E000                    ; $C151  8D 00 E0
    STA $E001                    ; $C154  8D 01 E0
    JSR sub_3E_C104              ; $C157  20 04 C1
    INC $0676                    ; $C15A  EE 76 06
    PLA                          ; $C15D  68
    TAY                          ; $C15E  A8
    PLA                          ; $C15F  68
    TAX                          ; $C160  AA
    PLA                          ; $C161  68
    RTI                          ; $C162  40


sub_3E_C163:
    DEX                          ; $C163  CA
    BNE sub_3E_C163              ; $C164  D0 FD
    RTS                          ; $C166  60

    .byte $A2,$04,$EA,$CA,$D0,$FC,$AD,$71,$06,$8D,$06,$20,$A9,$00,$8D,$06  ; $C167
    .byte $20,$A5,$FC,$29,$E4,$09,$10,$8D,$00,$20,$A5,$FD,$29,$EF,$8D,$01  ; $C177
    .byte $20,$8D,$00,$E0,$60,$A2,$04,$20,$63,$C1,$AD,$73,$06,$8D,$00,$C0  ; $C187
    .byte $A9,$28,$8D,$06,$20,$A9,$E0,$8D,$06,$20,$A9,$8D,$38,$ED,$73,$06  ; $C197
    .byte $8D,$74,$06,$60,$AD,$74,$06,$8D,$00,$C0,$EA,$EA,$EA,$EA,$EA,$EA  ; $C1A7
    .byte $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$A9,$20  ; $C1B7
    .byte $8D,$06,$20,$A9,$E0,$8D,$06,$20,$A5,$F7,$8D,$05,$20,$8D,$05,$20  ; $C1C7

loc_3E_C1D7:
    JSR sub_3E_C8C1              ; $C1D7  20 C1 C8
    RTS                          ; $C1DA  60

    .byte $A2,$03,$20,$63,$C1,$EA,$EA,$EA,$EA,$EA,$A9,$23,$8D,$06,$20,$A9  ; $C1DB
    .byte $00,$8D,$06,$20,$A5,$F7,$8D,$05,$20,$8D,$05,$20,$8D,$00,$E0,$60  ; $C1EB
    .byte $A9,$68,$8D,$00,$C0,$A9,$00,$38,$E5,$F7,$8D,$05,$20,$8D,$05,$20  ; $C1FB
    .byte $A5,$F8,$49,$01,$05,$FC,$8D,$00,$20,$20,$C1,$C8,$60,$A5,$F7,$8D  ; $C20B
    .byte $05,$20,$8D,$05,$20,$A5,$FC,$8D,$00,$20,$8D,$00,$E0,$60,$A9,$AE  ; $C21B
    .byte $8D,$00,$C0,$AD,$75,$06,$8D,$05,$20,$8D,$05,$20,$4C,$D7,$C1,$A2  ; $C22B
    .byte $03,$20,$63,$C1,$EA,$EA,$EA,$EA,$EA,$A9,$23,$8D,$06,$20,$A9,$00  ; $C23B
    .byte $8D,$06,$20,$8D,$05,$20,$8D,$05,$20,$8D,$00,$E0,$60,$EA,$EA,$EA  ; $C24B
    .byte $EA,$EA,$EA,$EA,$EA,$EA,$AD,$B4,$05,$8D,$00,$C0,$AD,$24,$06,$8D  ; $C25B
    .byte $78,$06,$AD,$CA,$05,$8D,$C9,$05,$AD,$E1,$05,$8D,$E0,$05,$60,$EA  ; $C26B
    .byte $EA,$EA,$EA,$EA,$EA,$EA,$EA,$EA,$A9,$01,$8D,$00,$C0,$AD,$C9,$05  ; $C27B
    .byte $8D,$06,$20,$AD,$E0,$05,$8D,$06,$20,$A9,$00,$8D,$05,$20,$8D,$05  ; $C28B
    .byte $20,$CE,$78,$06,$D0,$03,$8D,$00,$E0,$CE,$76,$06,$60,$A9,$30,$8D  ; $C29B
    .byte $00,$C0,$A5,$FC,$09,$01,$8D,$00,$20,$AD,$E0,$05,$8D,$05,$20,$8D  ; $C2AB
    .byte $05,$20,$60,$A9,$01,$8D,$00,$C0,$A5,$FC,$29,$FE,$8D,$00,$20,$AD  ; $C2BB
    .byte $F7,$05,$8D,$05,$20,$8D,$05,$20,$8D,$00,$E0,$60  ; $C2CB
    LDA #$30                     ; $C2D7  A9 30
    STA $C000                    ; $C2D9  8D 00 C0
    LDA $06A8                    ; $C2DC  AD A8 06
    STA $0678                    ; $C2DF  8D 78 06
    LDA $06A7                    ; $C2E2  AD A7 06
    LSR $0678                    ; $C2E5  4E 78 06
    ROR A                        ; $C2E8  6A
    STA $2005                    ; $C2E9  8D 05 20
    STA $2005                    ; $C2EC  8D 05 20
    RTS                          ; $C2EF  60

    LDA $06A7                    ; $C2F0  AD A7 06
    STA $2005                    ; $C2F3  8D 05 20
    STA $2005                    ; $C2F6  8D 05 20
    STA $E000                    ; $C2F9  8D 00 E0
    JMP loc_3E_C1D7              ; $C2FC  4C D7 C1

    .byte $A9,$01,$8D,$00,$C0,$A9,$00,$8D,$05,$20,$8D,$05,$20,$A9,$14,$8D  ; $C2FF
    .byte $78,$06,$A5,$F3,$29,$04,$4A,$4A,$8D,$79,$06,$60,$A9,$02,$8D,$00  ; $C30F
    .byte $C0,$AD,$79,$06,$8D,$05,$20,$8D,$05,$20,$49,$01,$8D,$79,$06,$CE  ; $C31F
    .byte $78,$06,$F0,$03,$CE,$76,$06,$60  ; $C32F
    LDA $069C                    ; $C337  AD 9C 06
    CLC                          ; $C33A  18
    ADC #$08                     ; $C33B  69 08
    STA $C000                    ; $C33D  8D 00 C0
    LDA #$28                     ; $C340  A9 28
    STA $2006                    ; $C342  8D 06 20
    LDA #$00                     ; $C345  A9 00
    STA $2006                    ; $C347  8D 06 20
    LDA $F4                      ; $C34A  A5 F4
    BEQ loc_3E_C3AD              ; $C34C  F0 5F
    LDA $05F5                    ; $C34E  AD F5 05
    CLC                          ; $C351  18
    ADC $05C7                    ; $C352  6D C7 05
    STA $05F5                    ; $C355  8D F5 05
    LDA $069C                    ; $C358  AD 9C 06
    ADC $05DE                    ; $C35B  6D DE 05
    STA $069C                    ; $C35E  8D 9C 06
    BMI loc_3E_C365              ; $C361  30 02
    BNE loc_3E_C37B              ; $C363  D0 16

loc_3E_C365:
    LDA $57                      ; $C365  A5 57
    CMP #$06                     ; $C367  C9 06
    BEQ loc_3E_C3AE              ; $C369  F0 43
    LDA #$55                     ; $C36B  A9 55
    STA $DC                      ; $C36D  85 DC
    LDA #$00                     ; $C36F  A9 00
    STA $05C7                    ; $C371  8D C7 05
    LDA #$04                     ; $C374  A9 04
    STA $05DE                    ; $C376  8D DE 05
    BNE loc_3E_C390              ; $C379  D0 15

loc_3E_C37B:
    CMP #$40                     ; $C37B  C9 40
    BCC loc_3E_C390              ; $C37D  90 11
    DEC $069C                    ; $C37F  CE 9C 06
    LDA #$56                     ; $C382  A9 56
    STA $DC                      ; $C384  85 DC
    LDA #$D4                     ; $C386  A9 D4
    STA $05C7                    ; $C388  8D C7 05
    LDA #$FF                     ; $C38B  A9 FF
    STA $05DE                    ; $C38D  8D DE 05

loc_3E_C390:
    LDA $57                      ; $C390  A5 57
    CMP #$06                     ; $C392  C9 06
    BNE loc_3E_C3A4              ; $C394  D0 0E
    LDA #$57                     ; $C396  A9 57
    STA $DC                      ; $C398  85 DC
    LDA #$00                     ; $C39A  A9 00
    STA $05C7                    ; $C39C  8D C7 05
    LDA #$FC                     ; $C39F  A9 FC
    STA $05DE                    ; $C3A1  8D DE 05

loc_3E_C3A4:
    LDA #$B0                     ; $C3A4  A9 B0
    SEC                          ; $C3A6  38
    SBC $069C                    ; $C3A7  ED 9C 06
    STA $0672                    ; $C3AA  8D 72 06

loc_3E_C3AD:
    RTS                          ; $C3AD  60


loc_3E_C3AE:
    LDA #$00                     ; $C3AE  A9 00
    STA $F4                      ; $C3B0  85 F4
    STA $71                      ; $C3B2  85 71
    STA $069C                    ; $C3B4  8D 9C 06
    RTS                          ; $C3B7  60

    LDX #$03                     ; $C3B8  A2 03
    JSR sub_3E_C163              ; $C3BA  20 63 C1
    NOP                          ; $C3BD  EA
    NOP                          ; $C3BE  EA
    NOP                          ; $C3BF  EA
    NOP                          ; $C3C0  EA
    NOP                          ; $C3C1  EA
    LDA #$22                     ; $C3C2  A9 22
    STA $2006                    ; $C3C4  8D 06 20
    LDA #$E0                     ; $C3C7  A9 E0
    STA $2006                    ; $C3C9  8D 06 20
    LDA $F7                      ; $C3CC  A5 F7
    STA $2005                    ; $C3CE  8D 05 20
    STA $2005                    ; $C3D1  8D 05 20
    STA $E000                    ; $C3D4  8D 00 E0
    RTS                          ; $C3D7  60

    .byte $AD,$9C,$06,$18,$69,$08,$8D,$00,$C0,$A9,$28,$8D,$06,$20,$A9,$00  ; $C3D8
    .byte $8D,$06,$20,$A5,$F4,$F0,$5E,$A5,$F3,$4A,$90,$30,$A5,$23,$30,$4F  ; $C3E8
    .byte $AD,$9C,$06,$18,$6D,$DE,$05,$8D,$9C,$06,$C9,$03,$B0,$0C,$A9,$03  ; $C3F8
    .byte $8D,$9C,$06,$A9,$01,$8D,$DE,$05,$D0,$09,$C9,$40,$90,$05,$A9,$FF  ; $C408
    .byte $8D,$DE,$05,$A9,$70,$38,$ED,$9C,$06,$8D,$72,$06,$AD,$72,$06,$38  ; $C418
    .byte $E9,$06,$8D,$78,$06,$A2,$15,$BD,$A0,$03,$C9,$72,$D0,$0E,$AD,$78  ; $C428
    .byte $06,$9D,$CB,$04,$AD,$BD,$03,$09,$80,$8D,$BD,$03,$CA,$D0,$E8,$A9  ; $C438
    .byte $00,$8D,$F5,$05,$60,$A9,$00,$8D,$9C,$06,$60,$A2,$03,$20,$63,$C1  ; $C448
    .byte $EA,$EA,$EA,$EA,$EA,$A9,$21,$8D,$06,$20,$A9,$E0,$8D,$06,$20,$A5  ; $C458
    .byte $F7,$8D,$05,$20,$8D,$05,$20,$8D,$00,$E0,$4C,$D7,$C1,$A9,$0B,$8D  ; $C468
    .byte $00,$C0,$A2,$02,$20,$63,$C1,$A9,$20,$8D,$06,$20,$A9,$00,$8D,$06  ; $C478
    .byte $20,$A9,$12,$8D,$76,$06,$60,$A9,$6E,$8D,$00,$C0,$AD,$02,$20,$AD  ; $C488
    .byte $78,$06,$8D,$05,$20,$8D,$05,$20,$4C,$D7,$C1,$AD,$02,$20,$A9,$00  ; $C498
    .byte $8D,$05,$20,$8D,$05,$20,$8D,$00,$E0,$60,$A2,$03,$20,$63,$C1,$EA  ; $C4A8
    .byte $EA,$EA,$EA,$EA,$A9,$23,$8D,$06,$20,$A9,$00,$8D,$06,$20,$AD,$78  ; $C4B8
    .byte $06,$8D,$05,$20,$8D,$05,$20,$A5,$F3,$4A,$90,$1A,$AD,$78,$06,$18  ; $C4C8
    .byte $6D,$79,$06,$8D,$78,$06,$AD,$B1,$05,$D0,$0B,$AD,$79,$06,$49,$FF  ; $C4D8
    .byte $8D,$9B,$06,$EE,$9B,$06,$8D,$00,$E0,$60,$A2,$03,$20,$63,$C1,$EA  ; $C4E8
    .byte $EA,$EA,$EA,$EA,$A9,$23,$8D,$06,$20,$A9,$00,$8D,$06,$20,$AD,$78  ; $C4F8
    .byte $06,$8D,$05,$20,$8D,$05,$20,$AD,$A8,$03,$F0,$09,$A5,$F3,$29,$03  ; $C508
    .byte $F0,$BA,$8D,$00,$E0,$60  ; $C518

loc_3E_C51E:
    SEI                          ; $C51E  78
    CLD                          ; $C51F  D8
    LDX #$0F                     ; $C520  A2 0F
    LDA $FFF8                    ; $C522  AD F8 FF
    CMP #$08                     ; $C525  C9 08
    BNE loc_3E_C536              ; $C527  D0 0D

loc_3E_C529:
    LDA $FFE0,X                  ; $C529  BD E0 FF
    CMP $C53E,X                  ; $C52C  DD 3E C5
    BNE loc_3E_C536              ; $C52F  D0 05
    DEX                          ; $C531  CA
    BPL loc_3E_C529              ; $C532  10 F5
    BMI loc_3E_C54E              ; $C534  30 18

loc_3E_C536:
    LDA #$00                     ; $C536  A9 00
    STA $2001                    ; $C538  8D 01 20

loc_3E_C53B:
    BEQ loc_3E_C53B              ; $C53B  F0 FE
    NOP                          ; $C53D  EA
    ISC $FFFF,X                  ; $C53E  FF FF FF
    ISC $FFFF,X                  ; $C541  FF FF FF
    ISC $FFFF,X                  ; $C544  FF FF FF
    ISC $FFFF,X                  ; $C547  FF FF FF
    ISC $FFFF,X                  ; $C54A  FF FF FF
    ISC $FFA9,X                  ; $C54D  FF A9 FF
    STA $DC                      ; $C550  85 DC
    LDA #$88                     ; $C552  A9 88
    STA $FC                      ; $C554  85 FC
    STA $2000                    ; $C556  8D 00 20
    LDA #$18                     ; $C559  A9 18
    STA $FD                      ; $C55B  85 FD
    CLI                          ; $C55D  58
    LDX #$00                     ; $C55E  A2 00
    JSR sub_3E_C5C7              ; $C560  20 C7 C5
    LDX #$01                     ; $C563  A2 01
    JSR sub_3E_C5C7              ; $C565  20 C7 C5

loc_3E_C568:
    LDX #$FF                     ; $C568  A2 FF
    TXS                          ; $C56A  9A
    STX $33                      ; $C56B  86 33

loc_3E_C56D:
    LDY #$00                     ; $C56D  A0 00

loc_3E_C56F:
    LDA $0021,Y                  ; $C56F  B9 21 00
    BMI loc_3E_C578              ; $C572  30 04
    CMP #$04                     ; $C574  C9 04
    BCS loc_3E_C588              ; $C576  B0 10

loc_3E_C578:
    INY                          ; $C578  C8
    CPY #$04                     ; $C579  C0 04
    BNE loc_3E_C56F              ; $C57B  D0 F2
    LDA #$00                     ; $C57D  A9 00
    STA $F2                      ; $C57F  85 F2

loc_3E_C581:
    LDA $F2                      ; $C581  A5 F2
    BEQ loc_3E_C581              ; $C583  F0 FC
    JMP loc_3E_C56D              ; $C585  4C 6D C5


loc_3E_C588:
    STY $33                      ; $C588  84 33
    LDA $0034,Y                  ; $C58A  B9 34 00
    JSR sub_3E_CB91              ; $C58D  20 91 CB
    LDA $0038,Y                  ; $C590  B9 38 00
    JSR sub_3E_CBDA              ; $C593  20 DA CB
    LDA $0021,Y                  ; $C596  B9 21 00
    LDX #$02                     ; $C599  A2 02
    STX $21,Y                    ; $C59B  96 21
    CMP #$08                     ; $C59D  C9 08
    BEQ loc_3E_C5AF              ; $C59F  F0 0E
    LDA $003C,Y                  ; $C5A1  B9 3C 00
    STA $10                      ; $C5A4  85 10
    LDX $29,Y                    ; $C5A6  B6 29
    TXS                          ; $C5A8  9A
    PLA                          ; $C5A9  68
    TAY                          ; $C5AA  A8
    PLA                          ; $C5AB  68
    TAX                          ; $C5AC  AA
    PLA                          ; $C5AD  68
    RTS                          ; $C5AE  60


loc_3E_C5AF:
    LDX $33                      ; $C5AF  A6 33
    LDA $C5C3,X                  ; $C5B1  BD C3 C5
    TAX                          ; $C5B4  AA
    TXS                          ; $C5B5  9A
    LDA $0029,Y                  ; $C5B6  B9 29 00
    STA $31                      ; $C5B9  85 31
    LDA $002D,Y                  ; $C5BB  B9 2D 00
    STA $32                      ; $C5BE  85 32
    JMP ($0031)                  ; $C5C0  6C 31 00

    .byte $3F,$5F,$7F,$9F  ; $C5C3

sub_3E_C5C7:
    LDA $C632,X                  ; $C5C7  BD 32 C6
    TAY                          ; $C5CA  A8
    LDA #$08                     ; $C5CB  A9 08
    STA $0021,Y                  ; $C5CD  99 21 00
    LDA $C668,X                  ; $C5D0  BD 68 C6
    STA $0029,Y                  ; $C5D3  99 29 00
    LDA $C64D,X                  ; $C5D6  BD 4D C6
    STA $002D,Y                  ; $C5D9  99 2D 00
    LDA $C683,X                  ; $C5DC  BD 83 C6
    STA $0034,Y                  ; $C5DF  99 34 00
    STA $0038,Y                  ; $C5E2  99 38 00
    RTS                          ; $C5E5  60


loc_3E_C5E6:
    LDY $33                      ; $C5E6  A4 33
    LDA #$00                     ; $C5E8  A9 00
    STA $0021,Y                  ; $C5EA  99 21 00
    JMP loc_3E_C568              ; $C5ED  4C 68 C5


sub_3E_C5F0:
    LDA #$00                     ; $C5F0  A9 00
    STA $0021,Y                  ; $C5F2  99 21 00
    RTS                          ; $C5F5  60


sub_3E_C5F6:
    STA $31                      ; $C5F6  85 31
    PHA                          ; $C5F8  48

loc_3E_C5F9:
    TXA                          ; $C5F9  8A
    PHA                          ; $C5FA  48
    TYA                          ; $C5FB  98
    PHA                          ; $C5FC  48
    LDY $33                      ; $C5FD  A4 33
    LDA $10                      ; $C5FF  A5 10
    STA $003C,Y                  ; $C601  99 3C 00
    LDA $4A                      ; $C604  A5 4A
    STA $0034,Y                  ; $C606  99 34 00
    LDA $4B                      ; $C609  A5 4B
    STA $0038,Y                  ; $C60B  99 38 00
    LDA $31                      ; $C60E  A5 31
    STA $0025,Y                  ; $C610  99 25 00
    LDA #$01                     ; $C613  A9 01
    STA $0021,Y                  ; $C615  99 21 00
    TSX                          ; $C618  BA
    STX $29,Y                    ; $C619  96 29
    LDA $DC                      ; $C61B  A5 DC
    CMP #$FF                     ; $C61D  C9 FF
    BEQ loc_3E_C628              ; $C61F  F0 07
    JSR sub_3E_C8B2              ; $C621  20 B2 C8
    LDA #$FF                     ; $C624  A9 FF
    STA $DC                      ; $C626  85 DC

loc_3E_C628:
    JMP loc_3E_C568              ; $C628  4C 68 C5


sub_3E_C62B:
    PHA                          ; $C62B  48
    LDA #$01                     ; $C62C  A9 01
    STA $31                      ; $C62E  85 31
    BNE loc_3E_C5F9              ; $C630  D0 C7
    BRK                          ; $C632  00
    .byte $03,$01,$02,$02,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02  ; $C633
    .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$CC,$C9,$90,$D4,$90,$F1  ; $C643
    .byte $91,$87,$F1,$91,$91,$91,$91,$91,$91,$91,$91,$91,$91,$91,$91,$8B  ; $C653
    .byte $BE,$9F,$BC,$8C,$91,$B1,$05,$E2,$BB,$FC,$B0,$00,$B0,$D1,$04,$08  ; $C663
    .byte $0C,$10,$A8,$18,$B2,$B7,$BC,$C1,$14,$C6,$CA,$B9,$93,$EB,$05,$AD  ; $C673
    .byte $3E,$3E,$3B,$3E,$3B,$3E,$3B,$39,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B  ; $C683
    .byte $3B,$3B,$3B,$3B,$3B,$3B,$3D,$39,$3B,$3B,$3B  ; $C693

sub_3E_C69E:
    LDX $46                      ; $C69E  A6 46
    BEQ loc_3E_C6D6              ; $C6A0  F0 34
    LDX #$00                     ; $C6A2  A2 00
    LDA $2002                    ; $C6A4  AD 02 20
    LDA #$3F                     ; $C6A7  A9 3F
    STA $2006                    ; $C6A9  8D 06 20
    LDA #$00                     ; $C6AC  A9 00
    STA $2006                    ; $C6AE  8D 06 20
    LDY #$20                     ; $C6B1  A0 20

loc_3E_C6B3:
    LDA $0360,X                  ; $C6B3  BD 60 03
    SEC                          ; $C6B6  38
    SBC $48                      ; $C6B7  E5 48
    BPL loc_3E_C6BD              ; $C6B9  10 02
    LDA #$0F                     ; $C6BB  A9 0F

loc_3E_C6BD:
    STA $2007                    ; $C6BD  8D 07 20
    INX                          ; $C6C0  E8
    DEY                          ; $C6C1  88
    BNE loc_3E_C6B3              ; $C6C2  D0 EF
    LDA #$3F                     ; $C6C4  A9 3F
    STA $2006                    ; $C6C6  8D 06 20
    LDA #$00                     ; $C6C9  A9 00
    STA $2006                    ; $C6CB  8D 06 20
    STA $2006                    ; $C6CE  8D 06 20
    STA $2006                    ; $C6D1  8D 06 20
    STA $46                      ; $C6D4  85 46

loc_3E_C6D6:
    RTS                          ; $C6D6  60


sub_3E_C6D7:
    LDA $47                      ; $C6D7  A5 47
    BEQ loc_3E_C710              ; $C6D9  F0 35
    LDX #$00                     ; $C6DB  A2 00
    LDA $2002                    ; $C6DD  AD 02 20

loc_3E_C6E0:
    LDY #$00                     ; $C6E0  A0 00
    LDA $0780,X                  ; $C6E2  BD 80 07
    BPL loc_3E_C6E9              ; $C6E5  10 02
    LDY #$04                     ; $C6E7  A0 04

loc_3E_C6E9:
    STY $2000                    ; $C6E9  8C 00 20
    AND #$7F                     ; $C6EC  29 7F
    TAY                          ; $C6EE  A8
    INX                          ; $C6EF  E8
    LDA $0780,X                  ; $C6F0  BD 80 07
    STA $2006                    ; $C6F3  8D 06 20
    INX                          ; $C6F6  E8
    LDA $0780,X                  ; $C6F7  BD 80 07
    STA $2006                    ; $C6FA  8D 06 20
    INX                          ; $C6FD  E8

loc_3E_C6FE:
    LDA $0780,X                  ; $C6FE  BD 80 07
    STA $2007                    ; $C701  8D 07 20
    INX                          ; $C704  E8
    DEY                          ; $C705  88
    BNE loc_3E_C6FE              ; $C706  D0 F6
    CPX $47                      ; $C708  E4 47
    BNE loc_3E_C6E0              ; $C70A  D0 D4
    LDA #$00                     ; $C70C  A9 00
    STA $47                      ; $C70E  85 47

loc_3E_C710:
    RTS                          ; $C710  60


sub_3E_C711:
    LDX #$01                     ; $C711  A2 01
    STX $4016                    ; $C713  8E 16 40
    DEX                          ; $C716  CA
    STX $4016                    ; $C717  8E 16 40
    INX                          ; $C71A  E8

loc_3E_C71B:
    LDA $40,X                    ; $C71B  B5 40
    EOR #$FF                     ; $C71D  49 FF
    STA $44,X                    ; $C71F  95 44
    LDY #$08                     ; $C721  A0 08

loc_3E_C723:
    LDA $4016,X                  ; $C723  BD 16 40
    AND #$03                     ; $C726  29 03
    LSR A                        ; $C728  4A
    ROL $40,X                    ; $C729  36 40
    ORA $40,X                    ; $C72B  15 40
    STA $40,X                    ; $C72D  95 40
    DEY                          ; $C72F  88
    BNE loc_3E_C723              ; $C730  D0 F1
    AND $44,X                    ; $C732  35 44
    STA $42,X                    ; $C734  95 42
    DEX                          ; $C736  CA
    BPL loc_3E_C71B              ; $C737  10 E2
    LDA $067D                    ; $C739  AD 7D 06
    BNE loc_3E_C73F              ; $C73C  D0 01
    RTS                          ; $C73E  60


loc_3E_C73F:
    LDA $40                      ; $C73F  A5 40
    BNE loc_3E_C779              ; $C741  D0 36
    LDA #$00                     ; $C743  A9 00
    STA $42                      ; $C745  85 42
    DEC $067E                    ; $C747  CE 7E 06
    BNE loc_3E_C764              ; $C74A  D0 18
    LDY $067F                    ; $C74C  AC 7F 06
    LDA $C780,Y                  ; $C74F  B9 80 C7
    BEQ loc_3E_C779              ; $C752  F0 25
    STA $067E                    ; $C754  8D 7E 06
    INC $067F                    ; $C757  EE 7F 06
    INC $067F                    ; $C75A  EE 7F 06
    INY                          ; $C75D  C8
    INY                          ; $C75E  C8
    LDA $C77F,Y                  ; $C75F  B9 7F C7
    STA $42                      ; $C762  85 42

loc_3E_C764:
    LDY $067F                    ; $C764  AC 7F 06
    LDA $C77F,Y                  ; $C767  B9 7F C7
    STA $40                      ; $C76A  85 40
    LDA $DF                      ; $C76C  A5 DF
    AND #$0F                     ; $C76E  29 0F
    BNE loc_3E_C778              ; $C770  D0 06
    LDA #$40                     ; $C772  A9 40
    ORA $42                      ; $C774  05 42
    STA $42                      ; $C776  85 42

loc_3E_C778:
    RTS                          ; $C778  60


loc_3E_C779:
    LDA #$00                     ; $C779  A9 00
    STA $067D                    ; $C77B  8D 7D 06
    RTS                          ; $C77E  60

    .byte $78,$00,$90,$01,$6E,$00,$5A,$01,$1C,$81,$82,$00,$7F,$01,$B4,$00  ; $C77F
    .byte $7F,$01,$1C,$81,$78,$00,$1E,$01,$1C,$81,$78,$00,$00  ; $C78F

sub_3E_C79C:
    LDX $84                      ; $C79C  A6 84
    BEQ loc_3E_C7D5              ; $C79E  F0 35
    LDA $2002                    ; $C7A0  AD 02 20
    LDA $86                      ; $C7A3  A5 86
    STA $2006                    ; $C7A5  8D 06 20
    LDA $85                      ; $C7A8  A5 85
    STA $2006                    ; $C7AA  8D 06 20
    LDA #$06                     ; $C7AD  A9 06
    STA $8000                    ; $C7AF  8D 00 80
    LDA $8A                      ; $C7B2  A5 8A
    STA $8001                    ; $C7B4  8D 01 80
    LDA $87                      ; $C7B7  A5 87
    AND #$03                     ; $C7B9  29 03
    TAX                          ; $C7BB  AA
    LDA $C7DA,X                  ; $C7BC  BD DA C7
    STA $88                      ; $C7BF  85 88
    LDA $C7D6,X                  ; $C7C1  BD D6 C7
    TAX                          ; $C7C4  AA
    LDY #$00                     ; $C7C5  A0 00
    STY $2000                    ; $C7C7  8C 00 20

loc_3E_C7CA:
    LDA ($83),Y                  ; $C7CA  B1 83
    STA $2007                    ; $C7CC  8D 07 20
    INY                          ; $C7CF  C8
    DEX                          ; $C7D0  CA
    BNE loc_3E_C7CA              ; $C7D1  D0 F7
    STY $89                      ; $C7D3  84 89

loc_3E_C7D5:
    RTS                          ; $C7D5  60

    .byte $40,$10,$20,$30,$04,$01,$02,$03  ; $C7D6

sub_3E_C7DE:
    LDA $60                      ; $C7DE  A5 60
    BEQ loc_3E_C82C              ; $C7E0  F0 4A
    LDX #$00                     ; $C7E2  A2 00
    STX $60                      ; $C7E4  86 60
    CMP #$68                     ; $C7E6  C9 68
    BNE loc_3E_C82D              ; $C7E8  D0 43
    LDA $2002                    ; $C7EA  AD 02 20
    LDX #$00                     ; $C7ED  A2 00
    STX $2000                    ; $C7EF  8E 00 20
    LDY #$20                     ; $C7F2  A0 20
    LDA $5D                      ; $C7F4  A5 5D
    STA $2006                    ; $C7F6  8D 06 20
    LDA $5C                      ; $C7F9  A5 5C
    AND #$E0                     ; $C7FB  29 E0
    STA $2006                    ; $C7FD  8D 06 20

loc_3E_C800:
    LDA $07B0,X                  ; $C800  BD B0 07
    STA $2007                    ; $C803  8D 07 20
    INX                          ; $C806  E8
    DEY                          ; $C807  88
    BNE loc_3E_C800              ; $C808  D0 F6
    LDA $6A                      ; $C80A  A5 6A
    AND #$F8                     ; $C80C  29 F8
    TAX                          ; $C80E  AA
    LDY #$08                     ; $C80F  A0 08
    LDA $5F                      ; $C811  A5 5F
    STA $2006                    ; $C813  8D 06 20
    LDA $5E                      ; $C816  A5 5E
    AND #$F8                     ; $C818  29 F8
    STA $2006                    ; $C81A  8D 06 20

loc_3E_C81D:
    LDA $0300,X                  ; $C81D  BD 00 03
    STA $2007                    ; $C820  8D 07 20
    INX                          ; $C823  E8
    DEY                          ; $C824  88
    BNE loc_3E_C81D              ; $C825  D0 F6
    LDA $FC                      ; $C827  A5 FC
    STA $2000                    ; $C829  8D 00 20

loc_3E_C82C:
    RTS                          ; $C82C  60


loc_3E_C82D:
    LDA $2002                    ; $C82D  AD 02 20
    LDA $FC                      ; $C830  A5 FC
    AND #$78                     ; $C832  29 78
    ORA #$04                     ; $C834  09 04
    STA $2000                    ; $C836  8D 00 20
    LDA #$1E                     ; $C839  A9 1E
    SEC                          ; $C83B  38
    SBC $6C                      ; $C83C  E5 6C
    TAY                          ; $C83E  A8
    LDA $5B                      ; $C83F  A5 5B
    AND #$03                     ; $C841  29 03
    TAX                          ; $C843  AA
    LDA $5D                      ; $C844  A5 5D
    STA $2006                    ; $C846  8D 06 20
    LDA $5C                      ; $C849  A5 5C
    STA $2006                    ; $C84B  8D 06 20

loc_3E_C84E:
    LDA $07B0,X                  ; $C84E  BD B0 07
    STA $2007                    ; $C851  8D 07 20
    INX                          ; $C854  E8
    DEY                          ; $C855  88
    BNE loc_3E_C84E              ; $C856  D0 F6
    LDA $6C                      ; $C858  A5 6C
    LSR A                        ; $C85A  4A
    LSR A                        ; $C85B  4A
    STA $1D                      ; $C85C  85 1D
    LDA #$08                     ; $C85E  A9 08
    SEC                          ; $C860  38
    SBC $1D                      ; $C861  E5 1D
    TAY                          ; $C863  A8
    LDX $6A                      ; $C864  A6 6A
    LDA $5E                      ; $C866  A5 5E

loc_3E_C868:
    LDA $5F                      ; $C868  A5 5F
    STA $2006                    ; $C86A  8D 06 20
    LDA $5E                      ; $C86D  A5 5E
    STA $2006                    ; $C86F  8D 06 20
    LDA $0300,X                  ; $C872  BD 00 03
    STA $2007                    ; $C875  8D 07 20
    TXA                          ; $C878  8A
    CLC                          ; $C879  18
    ADC #$08                     ; $C87A  69 08
    TAX                          ; $C87C  AA
    LDA $5E                      ; $C87D  A5 5E
    CLC                          ; $C87F  18
    ADC #$08                     ; $C880  69 08
    STA $5E                      ; $C882  85 5E
    DEY                          ; $C884  88
    BNE loc_3E_C868              ; $C885  D0 E1
    LDA $FC                      ; $C887  A5 FC
    STA $2000                    ; $C889  8D 00 20
    RTS                          ; $C88C  60


sub_3E_C88D:
    TXA                          ; $C88D  8A
    PHA                          ; $C88E  48
    LDX #$00                     ; $C88F  A2 00
    LDY #$04                     ; $C891  A0 04
    LDA $DF,X                    ; $C893  B5 DF
    AND #$02                     ; $C895  29 02
    STA $E1                      ; $C897  85 E1
    LDA $E0,X                    ; $C899  B5 E0
    AND #$02                     ; $C89B  29 02
    EOR $E1                      ; $C89D  45 E1
    CLC                          ; $C89F  18
    BEQ loc_3E_C8A3              ; $C8A0  F0 01
    SEC                          ; $C8A2  38

loc_3E_C8A3:
    ROR $DF,X                    ; $C8A3  76 DF
    INX                          ; $C8A5  E8
    DEY                          ; $C8A6  88
    BNE loc_3E_C8A3              ; $C8A7  D0 FA
    LDA $DF                      ; $C8A9  A5 DF
    ADC $F3                      ; $C8AB  65 F3
    STA $DF                      ; $C8AD  85 DF
    PLA                          ; $C8AF  68
    TAX                          ; $C8B0  AA
    RTS                          ; $C8B1  60


sub_3E_C8B2:
    STX $DA                      ; $C8B2  86 DA
    LDX $D9                      ; $C8B4  A6 D9
    STA $B0,X                    ; $C8B6  95 B0
    INX                          ; $C8B8  E8
    TXA                          ; $C8B9  8A
    AND #$0F                     ; $C8BA  29 0F
    STA $D9                      ; $C8BC  85 D9
    LDX $DA                      ; $C8BE  A6 DA
    RTS                          ; $C8C0  60


sub_3E_C8C1:
    LDA #$06                     ; $C8C1  A9 06
    STA $8000                    ; $C8C3  8D 00 80
    LDA #$34                     ; $C8C6  A9 34
    STA $8001                    ; $C8C8  8D 01 80
    LDA #$07                     ; $C8CB  A9 07
    STA $8000                    ; $C8CD  8D 00 80
    LDA #$35                     ; $C8D0  A9 35
    STA $8001                    ; $C8D2  8D 01 80
    LDX $DB                      ; $C8D5  A6 DB
    CPX $D9                      ; $C8D7  E4 D9
    BEQ loc_3E_C8E8              ; $C8D9  F0 0D
    LDA $B0,X                    ; $C8DB  B5 B0
    JSR $8003                    ; $C8DD  20 03 80
    INC $DB                      ; $C8E0  E6 DB
    LDA $DB                      ; $C8E2  A5 DB
    AND #$0F                     ; $C8E4  29 0F
    STA $DB                      ; $C8E6  85 DB

loc_3E_C8E8:
    JSR $8000                    ; $C8E8  20 00 80
    LDA #$06                     ; $C8EB  A9 06
    STA $8000                    ; $C8ED  8D 00 80
    LDA $4A                      ; $C8F0  A5 4A
    STA $8001                    ; $C8F2  8D 01 80
    LDA #$07                     ; $C8F5  A9 07
    STA $8000                    ; $C8F7  8D 00 80
    LDA $4B                      ; $C8FA  A5 4B
    STA $8001                    ; $C8FC  8D 01 80
    LDA $4C                      ; $C8FF  A5 4C
    STA $8000                    ; $C901  8D 00 80
    RTS                          ; $C904  60


loc_3E_C905:
    JSR sub_3E_C62B              ; $C905  20 2B C6

loc_3E_C908:
    LDA $07F8                    ; $C908  AD F8 07
    AND #$07                     ; $C90B  29 07
    STA $07F8                    ; $C90D  8D F8 07
    CMP $07F9                    ; $C910  CD F9 07
    BEQ loc_3E_C905              ; $C913  F0 F0
    TAX                          ; $C915  AA
    LDA $07F0,X                  ; $C916  BD F0 07
    JSR sub_3E_C95C              ; $C919  20 5C C9
    JSR sub_3E_C92D              ; $C91C  20 2D C9
    LDX $07F8                    ; $C91F  AE F8 07
    LDA #$00                     ; $C922  A9 00
    STA $07F0,X                  ; $C924  9D F0 07
    INC $07F8                    ; $C927  EE F8 07
    JMP loc_3E_C908              ; $C92A  4C 08 C9


sub_3E_C92D:
    LDA #$00                     ; $C92D  A9 00
    STA $89                      ; $C92F  85 89

loc_3E_C931:
    JSR sub_3E_C62B              ; $C931  20 2B C6
    LDA $89                      ; $C934  A5 89
    BEQ loc_3E_C931              ; $C936  F0 F9
    CLC                          ; $C938  18
    ADC $85                      ; $C939  65 85
    STA $85                      ; $C93B  85 85
    LDA #$00                     ; $C93D  A9 00
    ADC $86                      ; $C93F  65 86
    STA $86                      ; $C941  85 86
    LDA $89                      ; $C943  A5 89
    CLC                          ; $C945  18
    ADC $83                      ; $C946  65 83
    STA $83                      ; $C948  85 83
    LDA #$00                     ; $C94A  A9 00
    ADC $84                      ; $C94C  65 84
    STA $84                      ; $C94E  85 84
    LDA $87                      ; $C950  A5 87
    SEC                          ; $C952  38
    SBC $88                      ; $C953  E5 88
    STA $87                      ; $C955  85 87
    BNE sub_3E_C92D              ; $C957  D0 D4
    STA $84                      ; $C959  85 84
    RTS                          ; $C95B  60


sub_3E_C95C:
    LDY #$00                     ; $C95C  A0 00
    STY $82                      ; $C95E  84 82
    ASL A                        ; $C960  0A
    ROL $82                      ; $C961  26 82
    ASL A                        ; $C963  0A
    ROL $82                      ; $C964  26 82
    CLC                          ; $C966  18
    ADC #$00                     ; $C967  69 00
    STA $81                      ; $C969  85 81
    LDA $82                      ; $C96B  A5 82
    ADC #$80                     ; $C96D  69 80
    STA $82                      ; $C96F  85 82
    LDA #$37                     ; $C971  A9 37
    JSR sub_3E_CB91              ; $C973  20 91 CB
    LDA ($81),Y                  ; $C976  B1 81
    STA $87                      ; $C978  85 87
    LDA #$00                     ; $C97A  A9 00
    STA $86                      ; $C97C  85 86
    INY                          ; $C97E  C8
    LDA ($81),Y                  ; $C97F  B1 81
    ASL A                        ; $C981  0A
    ROL $86                      ; $C982  26 86
    ASL A                        ; $C984  0A
    ROL $86                      ; $C985  26 86
    ASL A                        ; $C987  0A
    ROL $86                      ; $C988  26 86
    ASL A                        ; $C98A  0A
    ROL $86                      ; $C98B  26 86
    STA $85                      ; $C98D  85 85
    INY                          ; $C98F  C8
    LDA ($81),Y                  ; $C990  B1 81
    STA $83                      ; $C992  85 83
    INY                          ; $C994  C8
    LDA ($81),Y                  ; $C995  B1 81
    AND #$01                     ; $C997  29 01
    ASL $83                      ; $C999  06 83
    ROL A                        ; $C99B  2A
    ASL $83                      ; $C99C  06 83
    ROL A                        ; $C99E  2A
    ASL $83                      ; $C99F  06 83
    ROL A                        ; $C9A1  2A
    ASL $83                      ; $C9A2  06 83
    ROL A                        ; $C9A4  2A
    ORA #$80                     ; $C9A5  09 80
    STA $84                      ; $C9A7  85 84
    LDA ($81),Y                  ; $C9A9  B1 81
    AND #$80                     ; $C9AB  29 80
    LSR A                        ; $C9AD  4A
    LSR A                        ; $C9AE  4A
    LSR A                        ; $C9AF  4A
    ORA $86                      ; $C9B0  05 86
    STA $86                      ; $C9B2  85 86
    LDA ($81),Y                  ; $C9B4  B1 81
    AND #$7E                     ; $C9B6  29 7E
    LSR A                        ; $C9B8  4A
    STA $8A                      ; $C9B9  85 8A
    JSR sub_3E_CBE9              ; $C9BB  20 E9 CB
    RTS                          ; $C9BE  60


sub_3E_C9BF:
    LDA $FD                      ; $C9BF  A5 FD
    PHA                          ; $C9C1  48
    LDA #$00                     ; $C9C2  A9 00
    STA $FD                      ; $C9C4  85 FD
    STA $2001                    ; $C9C6  8D 01 20
    LDA $FC                      ; $C9C9  A5 FC
    AND #$FB                     ; $C9CB  29 FB
    STA $2000                    ; $C9CD  8D 00 20
    LDA $2002                    ; $C9D0  AD 02 20
    LDA #$20                     ; $C9D3  A9 20
    STA $2006                    ; $C9D5  8D 06 20
    LDA #$00                     ; $C9D8  A9 00
    TAY                          ; $C9DA  A8
    STA $2006                    ; $C9DB  8D 06 20
    LDA #$00                     ; $C9DE  A9 00
    LDX #$0C                     ; $C9E0  A2 0C

loc_3E_C9E2:
    STA $2007                    ; $C9E2  8D 07 20
    INY                          ; $C9E5  C8
    BNE loc_3E_C9E2              ; $C9E6  D0 FA
    DEX                          ; $C9E8  CA
    BNE loc_3E_C9E2              ; $C9E9  D0 F7
    PLA                          ; $C9EB  68
    STA $FD                      ; $C9EC  85 FD
    RTS                          ; $C9EE  60


sub_3E_C9EF:
    STX $01                      ; $C9EF  86 01
    STY $02                      ; $C9F1  84 02
    PHA                          ; $C9F3  48
    TAX                          ; $C9F4  AA
    LDA #$37                     ; $C9F5  A9 37
    LDY $06A0                    ; $C9F7  AC A0 06
    BEQ loc_3E_C9FE              ; $C9FA  F0 02
    LDA #$28                     ; $C9FC  A9 28

loc_3E_C9FE:
    JSR sub_3E_CB91              ; $C9FE  20 91 CB
    LDA $9000,X                  ; $CA01  BD 00 90
    STA $08                      ; $CA04  85 08
    LDA $9100,X                  ; $CA06  BD 00 91
    STA $09                      ; $CA09  85 09
    LDY #$00                     ; $CA0B  A0 00
    LDA ($08),Y                  ; $CA0D  B1 08
    TAX                          ; $CA0F  AA
    INY                          ; $CA10  C8

loc_3E_CA11:
    LDA ($08),Y                  ; $CA11  B1 08
    BIT $FF59                    ; $CA13  2C 59 FF
    BEQ loc_3E_CA22              ; $CA16  F0 0A
    STA $00                      ; $CA18  85 00
    LDA #$0F                     ; $CA1A  A9 0F
    STA $0360,X                  ; $CA1C  9D 60 03
    INX                          ; $CA1F  E8
    LDA $00                      ; $CA20  A5 00

loc_3E_CA22:
    BIT $FF58                    ; $CA22  2C 58 FF
    BEQ loc_3E_CA29              ; $CA25  F0 02
    LDY #$FF                     ; $CA27  A0 FF

loc_3E_CA29:
    AND #$3F                     ; $CA29  29 3F
    STA $0360,X                  ; $CA2B  9D 60 03
    INX                          ; $CA2E  E8
    INY                          ; $CA2F  C8
    BNE loc_3E_CA11              ; $CA30  D0 DF
    INC $46                      ; $CA32  E6 46
    JSR sub_3E_CBE9              ; $CA34  20 E9 CB
    PLA                          ; $CA37  68
    LDX $01                      ; $CA38  A6 01
    LDY $02                      ; $CA3A  A4 02
    RTS                          ; $CA3C  60


sub_3E_CA3D:
    PHA                          ; $CA3D  48

loc_3E_CA3E:
    INC $46                      ; $CA3E  E6 46
    LDA #$04                     ; $CA40  A9 04
    JSR sub_3E_C5F6              ; $CA42  20 F6 C5
    LDA $48                      ; $CA45  A5 48
    CLC                          ; $CA47  18
    ADC #$10                     ; $CA48  69 10
    STA $48                      ; $CA4A  85 48
    CMP #$50                     ; $CA4C  C9 50
    BCC loc_3E_CA3E              ; $CA4E  90 EE
    LDA #$00                     ; $CA50  A9 00
    STA $FD                      ; $CA52  85 FD
    STA $2001                    ; $CA54  8D 01 20
    PLA                          ; $CA57  68
    RTS                          ; $CA58  60


sub_3E_CA59:
    LDY #$03                     ; $CA59  A0 03

loc_3E_CA5B:
    LDA $0360,X                  ; $CA5B  BD 60 03
    SEC                          ; $CA5E  38
    SBC #$10                     ; $CA5F  E9 10
    BPL loc_3E_CA65              ; $CA61  10 02
    LDA #$0F                     ; $CA63  A9 0F

loc_3E_CA65:
    STA $0360,X                  ; $CA65  9D 60 03
    DEX                          ; $CA68  CA
    DEY                          ; $CA69  88
    BPL loc_3E_CA5B              ; $CA6A  10 EF
    LDA #$01                     ; $CA6C  A9 01
    STA $46                      ; $CA6E  85 46
    RTS                          ; $CA70  60


sub_3E_CA71:
    LDY #$03                     ; $CA71  A0 03

loc_3E_CA73:
    LDA $0380,X                  ; $CA73  BD 80 03
    SEC                          ; $CA76  38
    SBC $49                      ; $CA77  E5 49
    BPL loc_3E_CA7D              ; $CA79  10 02
    LDA #$0F                     ; $CA7B  A9 0F

loc_3E_CA7D:
    STA $0360,X                  ; $CA7D  9D 60 03
    DEX                          ; $CA80  CA
    DEY                          ; $CA81  88
    BPL loc_3E_CA73              ; $CA82  10 EF
    LDA #$01                     ; $CA84  A9 01
    STA $46                      ; $CA86  85 46
    RTS                          ; $CA88  60


sub_3E_CA89:
    PHA                          ; $CA89  48
    LDA #$1E                     ; $CA8A  A9 1E
    STA $FD                      ; $CA8C  85 FD

loc_3E_CA8E:
    INC $46                      ; $CA8E  E6 46
    LDA #$04                     ; $CA90  A9 04
    JSR sub_3E_C5F6              ; $CA92  20 F6 C5
    LDA $48                      ; $CA95  A5 48
    SEC                          ; $CA97  38
    SBC #$10                     ; $CA98  E9 10
    STA $48                      ; $CA9A  85 48
    BPL loc_3E_CA8E              ; $CA9C  10 F0
    LDA #$00                     ; $CA9E  A9 00
    STA $48                      ; $CAA0  85 48
    PLA                          ; $CAA2  68
    RTS                          ; $CAA3  60


sub_3E_CAA4:
    STX $00                      ; $CAA4  86 00
    LDX $FD                      ; $CAA6  A6 FD
    BEQ loc_3E_CACA              ; $CAA8  F0 20

sub_3E_CAAA:
    PHA                          ; $CAAA  48

loc_3E_CAAB:
    LDX $07F9                    ; $CAAB  AE F9 07
    INX                          ; $CAAE  E8
    TXA                          ; $CAAF  8A
    AND #$07                     ; $CAB0  29 07
    CMP $07F8                    ; $CAB2  CD F8 07
    BNE loc_3E_CABD              ; $CAB5  D0 06
    JSR sub_3E_C62B              ; $CAB7  20 2B C6
    JMP loc_3E_CAAB              ; $CABA  4C AB CA


loc_3E_CABD:
    LDX $07F9                    ; $CABD  AE F9 07
    STA $07F9                    ; $CAC0  8D F9 07
    PLA                          ; $CAC3  68
    STA $07F0,X                  ; $CAC4  9D F0 07
    LDX $00                      ; $CAC7  A6 00
    RTS                          ; $CAC9  60


loc_3E_CACA:
    PHA                          ; $CACA  48

loc_3E_CACB:
    LDA $84                      ; $CACB  A5 84
    BEQ loc_3E_CAD5              ; $CACD  F0 06
    JSR sub_3E_C62B              ; $CACF  20 2B C6
    JMP loc_3E_CACB              ; $CAD2  4C CB CA


loc_3E_CAD5:
    PLA                          ; $CAD5  68
    PHA                          ; $CAD6  48
    JSR sub_3E_C95C              ; $CAD7  20 5C C9
    LDA #$00                     ; $CADA  A9 00
    STA $FD                      ; $CADC  85 FD
    STA $2001                    ; $CADE  8D 01 20
    LDA $FC                      ; $CAE1  A5 FC
    AND #$FB                     ; $CAE3  29 FB
    STA $2000                    ; $CAE5  8D 00 20
    LDA $8A                      ; $CAE8  A5 8A
    JSR sub_3E_CB91              ; $CAEA  20 91 CB
    LDA $2002                    ; $CAED  AD 02 20
    LDA $86                      ; $CAF0  A5 86
    STA $2006                    ; $CAF2  8D 06 20
    LDA $85                      ; $CAF5  A5 85
    STA $2006                    ; $CAF7  8D 06 20

loc_3E_CAFA:
    LDY #$00                     ; $CAFA  A0 00
    LDX #$10                     ; $CAFC  A2 10

loc_3E_CAFE:
    LDA ($83),Y                  ; $CAFE  B1 83
    STA $2007                    ; $CB00  8D 07 20
    INY                          ; $CB03  C8
    DEX                          ; $CB04  CA
    BNE loc_3E_CAFE              ; $CB05  D0 F7
    LDA $83                      ; $CB07  A5 83
    CLC                          ; $CB09  18
    ADC #$10                     ; $CB0A  69 10
    STA $83                      ; $CB0C  85 83
    LDA $84                      ; $CB0E  A5 84
    ADC #$00                     ; $CB10  69 00
    STA $84                      ; $CB12  85 84
    DEC $87                      ; $CB14  C6 87
    BNE loc_3E_CAFA              ; $CB16  D0 E2
    JSR sub_3E_CBE9              ; $CB18  20 E9 CB
    LDA #$00                     ; $CB1B  A9 00
    STA $84                      ; $CB1D  85 84
    LDA $FC                      ; $CB1F  A5 FC
    STA $2000                    ; $CB21  8D 00 20
    PLA                          ; $CB24  68
    LDX $00                      ; $CB25  A6 00
    RTS                          ; $CB27  60


sub_3E_CB28:
    STA $15                      ; $CB28  85 15
    STX $16                      ; $CB2A  86 16
    LDA $10                      ; $CB2C  A5 10
    PHA                          ; $CB2E  48
    TSX                          ; $CB2F  BA
    STX $10                      ; $CB30  86 10
    JSR sub_3E_CB63              ; $CB32  20 63 CB
    LDA $11                      ; $CB35  A5 11
    ASL A                        ; $CB37  0A
    ROL A                        ; $CB38  2A
    ROL A                        ; $CB39  2A
    AND #$03                     ; $CB3A  29 03
    TAX                          ; $CB3C  AA
    LDA $CB5F,X                  ; $CB3D  BD 5F CB
    TAX                          ; $CB40  AA
    JSR sub_3E_CB91              ; $CB41  20 91 CB
    INX                          ; $CB44  E8
    TXA                          ; $CB45  8A
    JSR sub_3E_CBDA              ; $CB46  20 DA CB
    LDA $15                      ; $CB49  A5 15
    LDX $16                      ; $CB4B  A6 16
    JSR $8000                    ; $CB4D  20 00 80
    JSR sub_3E_CBE9              ; $CB50  20 E9 CB
    STA $15                      ; $CB53  85 15
    STX $16                      ; $CB55  86 16
    PLA                          ; $CB57  68
    STA $10                      ; $CB58  85 10
    LDA $15                      ; $CB5A  A5 15
    LDX $16                      ; $CB5C  A6 16
    RTS                          ; $CB5E  60

    .byte $3C,$3A,$38,$36  ; $CB5F

sub_3E_CB63:
    STA $00                      ; $CB63  85 00
    STX $01                      ; $CB65  86 01
    STY $02                      ; $CB67  84 02
    LDX $10                      ; $CB69  A6 10
    LDA $0102,X                  ; $CB6B  BD 02 01
    STA $08                      ; $CB6E  85 08
    LDA $0103,X                  ; $CB70  BD 03 01
    STA $09                      ; $CB73  85 09
    LDY #$01                     ; $CB75  A0 01
    LDA ($08),Y                  ; $CB77  B1 08
    STA $11                      ; $CB79  85 11
    LDA $08                      ; $CB7B  A5 08
    CLC                          ; $CB7D  18
    ADC #$01                     ; $CB7E  69 01
    STA $0102,X                  ; $CB80  9D 02 01
    LDA $09                      ; $CB83  A5 09
    ADC #$00                     ; $CB85  69 00
    STA $0103,X                  ; $CB87  9D 03 01
    LDA $00                      ; $CB8A  A5 00
    LDX $01                      ; $CB8C  A6 01
    LDY $02                      ; $CB8E  A4 02
    RTS                          ; $CB90  60


sub_3E_CB91:
    STA $17                      ; $CB91  85 17
    STX $18                      ; $CB93  86 18
    TSX                          ; $CB95  BA
    DEX                          ; $CB96  CA
    DEX                          ; $CB97  CA
    TXS                          ; $CB98  9A
    LDA $0103,X                  ; $CB99  BD 03 01
    STA $0101,X                  ; $CB9C  9D 01 01
    LDA $0104,X                  ; $CB9F  BD 04 01
    STA $0102,X                  ; $CBA2  9D 02 01
    LDA $4A                      ; $CBA5  A5 4A
    STA $0103,X                  ; $CBA7  9D 03 01
    LDA $4B                      ; $CBAA  A5 4B
    STA $0104,X                  ; $CBAC  9D 04 01
    LDA #$06                     ; $CBAF  A9 06
    STA $4C                      ; $CBB1  85 4C
    STA $8000                    ; $CBB3  8D 00 80
    LDA $17                      ; $CBB6  A5 17
    STA $4A                      ; $CBB8  85 4A
    STA $8001                    ; $CBBA  8D 01 80
    LDX $18                      ; $CBBD  A6 18
    RTS                          ; $CBBF  60


sub_3E_CBC0:
    LDA #$06                     ; $CBC0  A9 06
    STA $4C                      ; $CBC2  85 4C
    STA $8000                    ; $CBC4  8D 00 80
    STY $4A                      ; $CBC7  84 4A
    STY $8001                    ; $CBC9  8C 01 80
    INY                          ; $CBCC  C8
    STY $4B                      ; $CBCD  84 4B
    LDA #$07                     ; $CBCF  A9 07
    STA $4C                      ; $CBD1  85 4C
    STA $8000                    ; $CBD3  8D 00 80
    STY $8001                    ; $CBD6  8C 01 80
    RTS                          ; $CBD9  60


sub_3E_CBDA:
    PHA                          ; $CBDA  48
    STA $4B                      ; $CBDB  85 4B
    LDA #$07                     ; $CBDD  A9 07
    STA $4C                      ; $CBDF  85 4C
    STA $8000                    ; $CBE1  8D 00 80
    PLA                          ; $CBE4  68
    STA $8001                    ; $CBE5  8D 01 80
    RTS                          ; $CBE8  60


sub_3E_CBE9:
    STA $17                      ; $CBE9  85 17
    STX $18                      ; $CBEB  86 18
    TSX                          ; $CBED  BA
    LDA #$06                     ; $CBEE  A9 06
    STA $4C                      ; $CBF0  85 4C
    STA $8000                    ; $CBF2  8D 00 80
    LDA $0103,X                  ; $CBF5  BD 03 01
    STA $4A                      ; $CBF8  85 4A
    STA $8001                    ; $CBFA  8D 01 80
    LDA #$07                     ; $CBFD  A9 07
    STA $4C                      ; $CBFF  85 4C
    STA $8000                    ; $CC01  8D 00 80
    LDA $0104,X                  ; $CC04  BD 04 01
    STA $4B                      ; $CC07  85 4B
    STA $8001                    ; $CC09  8D 01 80
    LDA $0101,X                  ; $CC0C  BD 01 01
    STA $0103,X                  ; $CC0F  9D 03 01
    LDA $0102,X                  ; $CC12  BD 02 01
    STA $0104,X                  ; $CC15  9D 04 01
    INX                          ; $CC18  E8
    INX                          ; $CC19  E8
    TXS                          ; $CC1A  9A
    LDA $17                      ; $CC1B  A5 17
    LDX $18                      ; $CC1D  A6 18
    RTS                          ; $CC1F  60


sub_3E_CC20:
    PLA                          ; $CC20  68
    CLC                          ; $CC21  18
    ADC #$01                     ; $CC22  69 01
    STA $15                      ; $CC24  85 15
    PLA                          ; $CC26  68
    ADC #$00                     ; $CC27  69 00
    STA $16                      ; $CC29  85 16
    LDA $04                      ; $CC2B  A5 04
    PHA                          ; $CC2D  48
    LDA $05                      ; $CC2E  A5 05
    PHA                          ; $CC30  48
    LDA $06                      ; $CC31  A5 06
    PHA                          ; $CC33  48
    LDA $07                      ; $CC34  A5 07
    PHA                          ; $CC36  48
    JMP ($0015)                  ; $CC37  6C 15 00


sub_3E_CC3A:
    PLA                          ; $CC3A  68
    CLC                          ; $CC3B  18
    ADC #$01                     ; $CC3C  69 01
    STA $15                      ; $CC3E  85 15
    PLA                          ; $CC40  68
    ADC #$00                     ; $CC41  69 00
    STA $16                      ; $CC43  85 16
    PLA                          ; $CC45  68
    STA $07                      ; $CC46  85 07
    PLA                          ; $CC48  68
    STA $06                      ; $CC49  85 06
    PLA                          ; $CC4B  68
    STA $05                      ; $CC4C  85 05
    PLA                          ; $CC4E  68
    STA $04                      ; $CC4F  85 04
    JMP ($0015)                  ; $CC51  6C 15 00


sub_3E_CC54:
    LDA #$00                     ; $CC54  A9 00
    STA $00                      ; $CC56  85 00
    LDY #$FF                     ; $CC58  A0 FF

loc_3E_CC5A:
    INY                          ; $CC5A  C8
    LDA ($08),Y                  ; $CC5B  B1 08
    CLC                          ; $CC5D  18
    ADC $00                      ; $CC5E  65 00
    STA $00                      ; $CC60  85 00
    CMP $DF                      ; $CC62  C5 DF
    BCC loc_3E_CC5A              ; $CC64  90 F4
    RTS                          ; $CC66  60


sub_3E_CC67:
    JSR sub_3E_CB91              ; $CC67  20 91 CB
    LDA ($08),Y                  ; $CC6A  B1 08
    JSR sub_3E_CBE9              ; $CC6C  20 E9 CB
    RTS                          ; $CC6F  60

    .byte $A9,$00,$85,$06,$85,$07,$A5,$00,$05,$01,$05,$02,$05,$03,$D0,$05  ; $CC70
    .byte $85,$04,$85,$05,$60,$86,$08,$A0,$10,$06,$06,$26,$00,$26,$01,$26  ; $CC80
    .byte $07,$38,$A5,$01,$E5,$02,$AA,$A5,$07,$E5,$03,$90,$06,$86,$01,$85  ; $CC90
    .byte $07,$E6,$06,$88,$D0,$E3,$A5,$06,$85,$04,$A5,$00,$85,$05,$A6,$08  ; $CCA0
    .byte $60  ; $CCB0
    LDA #$02                     ; $CCB1  A9 02
    STA $06AC                    ; $CCB3  8D AC 06
    LDA #$C3                     ; $CCB6  A9 C3
    STA $DF                      ; $CCB8  85 DF
    LDA #$01                     ; $CCBA  A9 01
    STA $E0                      ; $CCBC  85 E0
    LDA #$4B                     ; $CCBE  A9 4B
    JSR sub_3E_C9EF              ; $CCC0  20 EF C9
    JSR sub_3E_CA3D              ; $CCC3  20 3D CA
    JSR sub_3E_C9BF              ; $CCC6  20 BF C9
    LDA #$00                     ; $CCC9  A9 00
    JSR sub_3E_C9EF              ; $CCCB  20 EF C9
    LDA #$1F                     ; $CCCE  A9 1F
    JSR sub_3E_CB28              ; $CCD0  20 28 CB
    BRK                          ; $CCD3  00
    LDA #$81                     ; $CCD4  A9 81
    JSR sub_3E_CAA4              ; $CCD6  20 A4 CA
    JSR sub_3E_CA89              ; $CCD9  20 89 CA
    LDA #$78                     ; $CCDC  A9 78
    JSR sub_3E_C5F6              ; $CCDE  20 F6 C5
    JSR sub_3E_D04E              ; $CCE1  20 4E D0
    JSR sub_3F_F2AA              ; $CCE4  20 AA F2

loc_3E_CCE7:
    JSR sub_3E_CB28              ; $CCE7  20 28 CB
    ORA ($A0,X)                  ; $CCEA  01 A0
    KIL                          ; $CCEC  02
    JSR sub_3E_C5F0              ; $CCED  20 F0 C5
    JSR sub_3E_D0A6              ; $CCF0  20 A6 D0
    LDA #$00                     ; $CCF3  A9 00
    STA $03A0                    ; $CCF5  8D A0 03
    STA $03A1                    ; $CCF8  8D A1 03
    STA $03A2                    ; $CCFB  8D A2 03
    JSR sub_3F_E1DD              ; $CCFE  20 DD E1
    LDA #$01                     ; $CD01  A9 01
    STA $03A1                    ; $CD03  8D A1 03
    JSR sub_3E_CA89              ; $CD06  20 89 CA
    LDA #$01                     ; $CD09  A9 01
    STA $03A2                    ; $CD0B  8D A2 03
    LDA #$19                     ; $CD0E  A9 19
    STA $DC                      ; $CD10  85 DC
    JSR sub_3E_CE76              ; $CD12  20 76 CE
    LDA $11                      ; $CD15  A5 11
    BNE loc_3E_CCE7              ; $CD17  D0 CE
    LDA $05B1                    ; $CD19  AD B1 05
    BEQ loc_3E_CD24              ; $CD1C  F0 06
    JSR sub_3E_CA3D              ; $CD1E  20 3D CA
    JSR sub_3F_F2C2              ; $CD21  20 C2 F2

loc_3E_CD24:
    JSR sub_3E_CB28              ; $CD24  20 28 CB
    KIL                          ; $CD27  42
    JSR sub_3E_CA3D              ; $CD28  20 3D CA
    JSR sub_3F_E1DD              ; $CD2B  20 DD E1
    LDX #$09                     ; $CD2E  A2 09
    LDA #$80                     ; $CD30  A9 80

loc_3E_CD32:
    STA $0688,X                  ; $CD32  9D 88 06
    DEX                          ; $CD35  CA
    BPL loc_3E_CD32              ; $CD36  10 FA
    LDA #$00                     ; $CD38  A9 00
    STA $06A1                    ; $CD3A  8D A1 06
    LDA #$02                     ; $CD3D  A9 02
    STA $A9                      ; $CD3F  85 A9

loc_3E_CD41:
    LDY #$02                     ; $CD41  A0 02
    JSR sub_3E_C5F0              ; $CD43  20 F0 C5
    JSR sub_3F_F05E              ; $CD46  20 5E F0

loc_3E_CD49:
    JSR sub_3E_CE58              ; $CD49  20 58 CE

loc_3E_CD4C:
    JSR sub_3E_CDC3              ; $CD4C  20 C3 CD
    JSR sub_3E_CA89              ; $CD4F  20 89 CA

loc_3E_CD52:
    JSR sub_3E_CB28              ; $CD52  20 28 CB
    RTI                          ; $CD55  40

    JSR sub_3F_E41C              ; $CD56  20 1C E4
    JSR sub_3E_D1D4              ; $CD59  20 D4 D1
    JSR sub_3E_CB28              ; $CD5C  20 28 CB
    NOP $20                      ; $CD5F  44 20
    ANC #$C6                     ; $CD61  2B C6
    LDA $F0                      ; $CD63  A5 F0
    BEQ loc_3E_CD52              ; $CD65  F0 EB
    LDA #$F0                     ; $CD67  A9 F0
    STA $DC                      ; $CD69  85 DC
    JSR sub_3E_CA3D              ; $CD6B  20 3D CA
    LDY #$00                     ; $CD6E  A0 00
    STY $F4                      ; $CD70  84 F4
    STY $F1                      ; $CD72  84 F1
    STY $06A0                    ; $CD74  8C A0 06
    STY $069C                    ; $CD77  8C 9C 06
    STY $069D                    ; $CD7A  8C 9D 06
    STY $57                      ; $CD7D  84 57
    LDY #$02                     ; $CD7F  A0 02
    JSR sub_3E_C5F0              ; $CD81  20 F0 C5
    LDA $F0                      ; $CD84  A5 F0
    CMP #$03                     ; $CD86  C9 03
    BNE loc_3E_CD97              ; $CD88  D0 0D
    JSR sub_3F_F2B4              ; $CD8A  20 B4 F2
    LDA #$02                     ; $CD8D  A9 02
    STA $A9                      ; $CD8F  85 A9
    LDA $11                      ; $CD91  A5 11
    BEQ loc_3E_CD41              ; $CD93  F0 AC
    BNE loc_3E_CD49              ; $CD95  D0 B2

loc_3E_CD97:
    CMP #$01                     ; $CD97  C9 01
    BNE loc_3E_CDB6              ; $CD99  D0 1B
    LDA $51                      ; $CD9B  A5 51
    INC $51                      ; $CD9D  E6 51
    BIT $FF5C                    ; $CD9F  2C 5C FF
    BNE loc_3E_CDB3              ; $CDA2  D0 0F
    DEC $51                      ; $CDA4  C6 51
    JSR sub_3F_F6FB              ; $CDA6  20 FB F6
    JSR sub_3F_F2B4              ; $CDA9  20 B4 F2
    LDA $11                      ; $CDAC  A5 11
    BEQ loc_3E_CDB3              ; $CDAE  F0 03
    JMP loc_3E_CD49              ; $CDB0  4C 49 CD


loc_3E_CDB3:
    JMP loc_3E_CD41              ; $CDB3  4C 41 CD


loc_3E_CDB6:
    CMP #$02                     ; $CDB6  C9 02
    BNE loc_3E_CDBD              ; $CDB8  D0 03
    JMP loc_3E_CD4C              ; $CDBA  4C 4C CD


loc_3E_CDBD:
    JSR sub_3F_F6CF              ; $CDBD  20 CF F6
    JMP loc_3E_CD49              ; $CDC0  4C 49 CD


sub_3E_CDC3:
    LDA $51                      ; $CDC3  A5 51
    CMP #$07                     ; $CDC5  C9 07
    BNE loc_3E_CDCE              ; $CDC7  D0 05
    LDA #$00                     ; $CDC9  A9 00
    STA $0358                    ; $CDCB  8D 58 03

loc_3E_CDCE:
    LDA $07F8                    ; $CDCE  AD F8 07
    CMP $07F9                    ; $CDD1  CD F9 07
    BEQ loc_3E_CDDC              ; $CDD4  F0 06
    JSR sub_3E_C62B              ; $CDD6  20 2B C6
    JMP loc_3E_CDCE              ; $CDD9  4C CE CD


loc_3E_CDDC:
    LDA #$00                     ; $CDDC  A9 00
    JSR sub_3E_CAA4              ; $CDDE  20 A4 CA
    LDA #$01                     ; $CDE1  A9 01
    JSR sub_3E_CAA4              ; $CDE3  20 A4 CA
    LDA $0642                    ; $CDE6  AD 42 06
    STA $EF                      ; $CDE9  85 EF
    LDA $51                      ; $CDEB  A5 51
    CMP #$0E                     ; $CDED  C9 0E
    BNE loc_3E_CDF8              ; $CDEF  D0 07
    LDA #$00                     ; $CDF1  A9 00
    STA $0642                    ; $CDF3  8D 42 06
    STA $EF                      ; $CDF6  85 EF

loc_3E_CDF8:
    LDY $51                      ; $CDF8  A4 51
    JSR sub_3F_F52F              ; $CDFA  20 2F F5
    BCC loc_3E_CE04              ; $CDFD  90 05
    LDA #$01                     ; $CDFF  A9 01
    STA $06A0                    ; $CE01  8D A0 06

loc_3E_CE04:
    LDA $0685                    ; $CE04  AD 85 06
    STA $064F                    ; $CE07  8D 4F 06
    JSR sub_3E_C9BF              ; $CE0A  20 BF C9
    LDA $51                      ; $CE0D  A5 51
    JSR sub_3E_DBD7              ; $CE0F  20 D7 DB
    LDY #$03                     ; $CE12  A0 03
    LDX #$00                     ; $CE14  A2 00
    JSR sub_3E_CB28              ; $CE16  20 28 CB
    EOR ($A9,X)                  ; $CE19  41 A9
    NOP #$85                     ; $CE1B  80 85
    SHA $868D,Y                  ; $CE1D  9F 8D 86
    NOP $AD                      ; $CE20  04 AD
    STX $06                      ; $CE22  86 06
    BEQ loc_3E_CE29              ; $CE24  F0 03
    JSR sub_3E_C9EF              ; $CE26  20 EF C9

loc_3E_CE29:
    LDA #$09                     ; $CE29  A9 09
    STA $AE                      ; $CE2B  85 AE
    JSR sub_3E_C9EF              ; $CE2D  20 EF C9
    LDA #$00                     ; $CE30  A9 00
    STA $0699                    ; $CE32  8D 99 06
    STA $0642                    ; $CE35  8D 42 06
    STA $06A2                    ; $CE38  8D A2 06
    STA $06A3                    ; $CE3B  8D A3 06
    STA $0682                    ; $CE3E  8D 82 06
    STA $06A4                    ; $CE41  8D A4 06
    LDA #$5A                     ; $CE44  A9 5A
    STA $06AB                    ; $CE46  8D AB 06
    RTS                          ; $CE49  60


sub_3E_CE4A:
    LDA #$00                     ; $CE4A  A9 00
    LDX #$1F                     ; $CE4C  A2 1F

loc_3E_CE4E:
    STA $0650,X                  ; $CE4E  9D 50 06
    STA $0340,X                  ; $CE51  9D 40 03
    DEX                          ; $CE54  CA
    BPL loc_3E_CE4E              ; $CE55  10 F7
    RTS                          ; $CE57  60


sub_3E_CE58:
    LDA #$00                     ; $CE58  A9 00
    STA $0642                    ; $CE5A  8D 42 06
    STA $EF                      ; $CE5D  85 EF
    STA $0686                    ; $CE5F  8D 86 06
    STA $0684                    ; $CE62  8D 84 06
    STA $06A0                    ; $CE65  8D A0 06
    STA $0685                    ; $CE68  8D 85 06
    STA $069E                    ; $CE6B  8D 9E 06
    JSR sub_3E_CE4A              ; $CE6E  20 4A CE
    JSR sub_3E_CB28              ; $CE71  20 28 CB
    SRE $60                      ; $CE74  47 60

sub_3E_CE76:
    LDA #$00                     ; $CE76  A9 00
    STA $11                      ; $CE78  85 11
    STA $05B1                    ; $CE7A  8D B1 05
    LDA #$06                     ; $CE7D  A9 06
    STA $05DF                    ; $CE7F  8D DF 05
    LDA #$40                     ; $CE82  A9 40
    STA $05F6                    ; $CE84  8D F6 05

loc_3E_CE87:
    DEC $05F6                    ; $CE87  CE F6 05
    BNE loc_3E_CEB3              ; $CE8A  D0 27
    DEC $05DF                    ; $CE8C  CE DF 05
    BNE loc_3E_CEB3              ; $CE8F  D0 22
    LDA #$F0                     ; $CE91  A9 F0
    STA $DC                      ; $CE93  85 DC
    JSR sub_3E_CA3D              ; $CE95  20 3D CA
    JSR sub_3E_CEEA              ; $CE98  20 EA CE
    JSR sub_3E_CA3D              ; $CE9B  20 3D CA
    LDA $11                      ; $CE9E  A5 11
    BNE loc_3E_CEAC              ; $CEA0  D0 0A
    LDA $0681                    ; $CEA2  AD 81 06
    CMP #$08                     ; $CEA5  C9 08
    BNE loc_3E_CEAC              ; $CEA7  D0 03
    JMP reset_vector             ; $CEA9  4C 70 FF


loc_3E_CEAC:
    LDA #$01                     ; $CEAC  A9 01
    STA $11                      ; $CEAE  85 11
    JMP loc_3E_CEE7              ; $CEB0  4C E7 CE


loc_3E_CEB3:
    JSR sub_3E_C62B              ; $CEB3  20 2B C6
    JSR sub_3F_E1DD              ; $CEB6  20 DD E1
    LDA $42                      ; $CEB9  A5 42
    AND #$10                     ; $CEBB  29 10
    BNE loc_3E_CEE3              ; $CEBD  D0 24
    LDA $42                      ; $CEBF  A5 42
    AND #$80                     ; $CEC1  29 80
    BNE loc_3E_CEE3              ; $CEC3  D0 1E
    LDA $42                      ; $CEC5  A5 42
    AND #$0C                     ; $CEC7  29 0C
    BEQ loc_3E_CE87              ; $CEC9  F0 BC
    LDA #$32                     ; $CECB  A9 32
    STA $DC                      ; $CECD  85 DC
    LDA $05B1                    ; $CECF  AD B1 05
    EOR #$01                     ; $CED2  49 01
    STA $05B1                    ; $CED4  8D B1 05
    TAY                          ; $CED7  A8
    LDA $CEE8,Y                  ; $CED8  B9 E8 CE
    STA $04CD                    ; $CEDB  8D CD 04
    BEQ loc_3E_CEE3              ; $CEDE  F0 03
    JMP loc_3E_CE87              ; $CEE0  4C 87 CE


loc_3E_CEE3:
    LDA #$33                     ; $CEE3  A9 33
    STA $DC                      ; $CEE5  85 DC

loc_3E_CEE7:
    RTS                          ; $CEE7  60

    .byte $AB,$BB  ; $CEE8

sub_3E_CEEA:
    JSR sub_3E_CB28              ; $CEEA  20 28 CB
    KIL                          ; $CEED  42
    JSR sub_3F_E1DD              ; $CEEE  20 DD E1
    LDA $0681                    ; $CEF1  AD 81 06
    AND #$07                     ; $CEF4  29 07
    STA $0681                    ; $CEF6  8D 81 06
    STA $51                      ; $CEF9  85 51
    LDA #$02                     ; $CEFB  A9 02
    STA $A9                      ; $CEFD  85 A9
    JSR sub_3E_CE58              ; $CEFF  20 58 CE
    JSR sub_3E_CDC3              ; $CF02  20 C3 CD
    LDA #$F0                     ; $CF05  A9 F0
    STA $DC                      ; $CF07  85 DC
    JSR sub_3E_CA89              ; $CF09  20 89 CA
    LDA #$01                     ; $CF0C  A9 01
    STA $067E                    ; $CF0E  8D 7E 06
    STA $067F                    ; $CF11  8D 7F 06
    STA $067D                    ; $CF14  8D 7D 06

loc_3E_CF17:
    LDA $067D                    ; $CF17  AD 7D 06
    BEQ loc_3E_CF3E              ; $CF1A  F0 22
    JSR sub_3E_CB28              ; $CF1C  20 28 CB
    RTI                          ; $CF1F  40

    JSR sub_3F_E41C              ; $CF20  20 1C E4
    JSR sub_3E_D1D4              ; $CF23  20 D4 D1
    JSR sub_3E_CF4A              ; $CF26  20 4A CF
    JSR sub_3E_CB28              ; $CF29  20 28 CB
    NOP $20                      ; $CF2C  44 20
    ANC #$C6                     ; $CF2E  2B C6
    LDA $F0                      ; $CF30  A5 F0
    BEQ loc_3E_CF17              ; $CF32  F0 E3
    LDA #$00                     ; $CF34  A9 00
    STA $067D                    ; $CF36  8D 7D 06
    LDA $40                      ; $CF39  A5 40
    STA $11                      ; $CF3B  85 11
    RTS                          ; $CF3D  60


loc_3E_CF3E:
    LDA #$F0                     ; $CF3E  A9 F0
    STA $DC                      ; $CF40  85 DC
    LDA $40                      ; $CF42  A5 40
    STA $11                      ; $CF44  85 11
    STA $067D                    ; $CF46  8D 7D 06
    RTS                          ; $CF49  60


sub_3E_CF4A:
    LDY $8C                      ; $CF4A  A4 8C
    LDA #$FF                     ; $CF4C  A9 FF
    STA $05                      ; $CF4E  85 05
    LDA $0642                    ; $CF50  AD 42 06
    BEQ loc_3E_CF69              ; $CF53  F0 14
    LDA $03ED                    ; $CF55  AD ED 03
    STA $01                      ; $CF58  85 01
    LDA #$28                     ; $CF5A  A9 28
    STA $02                      ; $CF5C  85 02
    LDA #$10                     ; $CF5E  A9 10
    STA $03                      ; $CF60  85 03
    LDA #$03                     ; $CF62  A9 03
    STA $04                      ; $CF64  85 04
    JSR sub_3E_CFCA              ; $CF66  20 CA CF

loc_3E_CF69:
    LDA $03E5                    ; $CF69  AD E5 03
    STA $01                      ; $CF6C  85 01
    LDA #$18                     ; $CF6E  A9 18
    STA $02                      ; $CF70  85 02
    LDA #$10                     ; $CF72  A9 10
    STA $03                      ; $CF74  85 03
    LDA #$01                     ; $CF76  A9 01
    STA $04                      ; $CF78  85 04
    JSR sub_3E_CFCA              ; $CF7A  20 CA CF
    LDX $0699                    ; $CF7D  AE 99 06
    BEQ loc_3E_CF92              ; $CF80  F0 10
    LDA $0688,X                  ; $CF82  BD 88 06
    STA $01                      ; $CF85  85 01
    LDA #$10                     ; $CF87  A9 10
    STA $02                      ; $CF89  85 02
    LDA #$00                     ; $CF8B  A9 00
    STA $04                      ; $CF8D  85 04
    JMP sub_3E_CFCA              ; $CF8F  4C CA CF


loc_3E_CF92:
    LDA #$28                     ; $CF92  A9 28
    STA $03                      ; $CF94  85 03
    LDA $A5                      ; $CF96  A5 A5
    LDX $9B                      ; $CF98  A6 9B
    BEQ loc_3E_CFC6              ; $CF9A  F0 2A
    DEX                          ; $CF9C  CA
    BNE loc_3E_CFB9              ; $CF9D  D0 1A
    LDA $9D                      ; $CF9F  A5 9D
    BNE loc_3E_CFB3              ; $CFA1  D0 10
    LDA $F3                      ; $CFA3  A5 F3
    AND #$01                     ; $CFA5  29 01
    BNE loc_3E_CFB3              ; $CFA7  D0 0A
    INC $9C                      ; $CFA9  E6 9C
    LDA $9C                      ; $CFAB  A5 9C
    CMP #$14                     ; $CFAD  C9 14
    BCC loc_3E_CFB3              ; $CFAF  90 02
    DEC $9C                      ; $CFB1  C6 9C

loc_3E_CFB3:
    LDA #$20                     ; $CFB3  A9 20
    STA $03                      ; $CFB5  85 03
    LDA $9C                      ; $CFB7  A5 9C

loc_3E_CFB9:
    STA $01                      ; $CFB9  85 01
    LDA #$10                     ; $CFBB  A9 10
    STA $02                      ; $CFBD  85 02
    LDA #$00                     ; $CFBF  A9 00
    STA $04                      ; $CFC1  85 04
    JSR sub_3E_CFCA              ; $CFC3  20 CA CF

loc_3E_CFC6:
    LDX $8F                      ; $CFC6  A6 8F
    RTS                          ; $CFC8  60


loc_3E_CFC9:
    RTS                          ; $CFC9  60


sub_3E_CFCA:
    TYA                          ; $CFCA  98
    LSR A                        ; $CFCB  4A
    BCS loc_3E_CFC9              ; $CFCC  B0 FB
    LDA #$48                     ; $CFCE  A9 48
    STA $00                      ; $CFD0  85 00
    LDA $01                      ; $CFD2  A5 01
    BMI loc_3E_D021              ; $CFD4  30 4B
    LSR A                        ; $CFD6  4A
    LSR A                        ; $CFD7  4A
    BEQ loc_3E_CFFD              ; $CFD8  F0 23
    TAX                          ; $CFDA  AA

loc_3E_CFDB:
    LDA #$84                     ; $CFDB  A9 84
    STA $0201,Y                  ; $CFDD  99 01 02
    LDA $00                      ; $CFE0  A5 00
    STA $0200,Y                  ; $CFE2  99 00 02
    SEC                          ; $CFE5  38
    SBC #$08                     ; $CFE6  E9 08
    STA $00                      ; $CFE8  85 00
    LDA $02                      ; $CFEA  A5 02
    STA $0203,Y                  ; $CFEC  99 03 02
    LDA $04                      ; $CFEF  A5 04
    STA $0202,Y                  ; $CFF1  99 02 02
    INY                          ; $CFF4  C8
    INY                          ; $CFF5  C8
    INY                          ; $CFF6  C8
    INY                          ; $CFF7  C8
    BEQ loc_3E_D04B              ; $CFF8  F0 51
    DEX                          ; $CFFA  CA
    BNE loc_3E_CFDB              ; $CFFB  D0 DE

loc_3E_CFFD:
    LDA $01                      ; $CFFD  A5 01
    AND #$03                     ; $CFFF  29 03
    CLC                          ; $D001  18
    ADC #$81                     ; $D002  69 81
    STA $0201,Y                  ; $D004  99 01 02
    LDA $00                      ; $D007  A5 00
    STA $0200,Y                  ; $D009  99 00 02
    SEC                          ; $D00C  38
    SBC #$08                     ; $D00D  E9 08
    STA $00                      ; $D00F  85 00
    LDA $02                      ; $D011  A5 02
    STA $0203,Y                  ; $D013  99 03 02
    LDA $04                      ; $D016  A5 04
    STA $0202,Y                  ; $D018  99 02 02
    INY                          ; $D01B  C8
    INY                          ; $D01C  C8
    INY                          ; $D01D  C8
    INY                          ; $D01E  C8
    BEQ loc_3E_D04B              ; $D01F  F0 2A

loc_3E_D021:
    LDA $00                      ; $D021  A5 00
    CMP $03                      ; $D023  C5 03
    BEQ loc_3E_D048              ; $D025  F0 21
    LDA #$9F                     ; $D027  A9 9F
    STA $0201,Y                  ; $D029  99 01 02
    LDA $00                      ; $D02C  A5 00
    STA $0200,Y                  ; $D02E  99 00 02
    SEC                          ; $D031  38
    SBC #$08                     ; $D032  E9 08
    STA $00                      ; $D034  85 00
    LDA $02                      ; $D036  A5 02
    STA $0203,Y                  ; $D038  99 03 02
    LDA $04                      ; $D03B  A5 04
    STA $0202,Y                  ; $D03D  99 02 02
    INY                          ; $D040  C8
    INY                          ; $D041  C8
    INY                          ; $D042  C8
    INY                          ; $D043  C8
    BEQ loc_3E_D04B              ; $D044  F0 05
    BNE loc_3E_D021              ; $D046  D0 D9

loc_3E_D048:
    STY $8C                      ; $D048  84 8C
    RTS                          ; $D04A  60


loc_3E_D04B:
    INC $8C                      ; $D04B  E6 8C
    RTS                          ; $D04D  60


sub_3E_D04E:
    JSR sub_3E_CA3D              ; $D04E  20 3D CA
    LDA #$77                     ; $D051  A9 77
    JSR sub_3E_CAA4              ; $D053  20 A4 CA
    LDA #$00                     ; $D056  A9 00
    JSR sub_3E_C9EF              ; $D058  20 EF C9
    JSR sub_3E_C9BF              ; $D05B  20 BF C9
    LDA #$01                     ; $D05E  A9 01
    JSR sub_3E_CB28              ; $D060  20 28 CB
    BRK                          ; $D063  00
    LDA #$81                     ; $D064  A9 81
    JSR sub_3E_CAA4              ; $D066  20 A4 CA
    LDA #$0E                     ; $D069  A9 0E
    STA $DC                      ; $D06B  85 DC
    JSR sub_3E_CA89              ; $D06D  20 89 CA
    LDA #$10                     ; $D070  A9 10
    JSR sub_3E_C5F6              ; $D072  20 F6 C5
    LDA #$02                     ; $D075  A9 02
    STA $0624                    ; $D077  8D 24 06

loc_3E_D07A:
    LDY #$CD                     ; $D07A  A0 CD
    LDX #$01                     ; $D07C  A2 01
    JSR sub_3E_CB28              ; $D07E  20 28 CB
    EOR ($A9,X)                  ; $D081  41 A9
    ROL $9B85                    ; $D083  2E 85 9B

loc_3E_D086:
    JSR sub_3E_C62B              ; $D086  20 2B C6
    JSR sub_3F_E41C              ; $D089  20 1C E4
    JSR sub_3F_E1DD              ; $D08C  20 DD E1
    DEC $9B                      ; $D08F  C6 9B
    BNE loc_3E_D086              ; $D091  D0 F3
    DEC $0624                    ; $D093  CE 24 06
    BNE loc_3E_D07A              ; $D096  D0 E2
    LDA #$40                     ; $D098  A9 40
    JSR sub_3E_C5F6              ; $D09A  20 F6 C5
    JSR sub_3E_CA3D              ; $D09D  20 3D CA
    LDA #$00                     ; $D0A0  A9 00
    STA $03A0                    ; $D0A2  8D A0 03
    RTS                          ; $D0A5  60


sub_3E_D0A6:
    LDA #$00                     ; $D0A6  A9 00
    STA $F7                      ; $D0A8  85 F7
    STA $F9                      ; $D0AA  85 F9
    JSR sub_3E_CB28              ; $D0AC  20 28 CB
    KIL                          ; $D0AF  42
    JSR sub_3E_C9BF              ; $D0B0  20 BF C9
    LDA #$0C                     ; $D0B3  A9 0C
    JSR sub_3E_CAA4              ; $D0B5  20 A4 CA
    LDA #$2D                     ; $D0B8  A9 2D
    JSR sub_3E_CAA4              ; $D0BA  20 A4 CA
    LDX #$02                     ; $D0BD  A2 02
    LDY #$10                     ; $D0BF  A0 10
    JSR sub_3E_CB28              ; $D0C1  20 28 CB
    EOR ($A0,X)                  ; $D0C4  41 A0
    TAS $2220,Y                  ; $D0C6  9B 20 22
    SBC $A2                      ; $D0C9  E5 A2
    KIL                          ; $D0CB  02
    LDY #$05                     ; $D0CC  A0 05
    JSR sub_3F_E4A7              ; $D0CE  20 A7 E4
    LDA #$80                     ; $D0D1  A9 80
    JSR sub_3E_CAA4              ; $D0D3  20 A4 CA
    LDA #$20                     ; $D0D6  A9 20
    JSR sub_3E_C9EF              ; $D0D8  20 EF C9
    LDA #$00                     ; $D0DB  A9 00
    JSR sub_3E_CB28              ; $D0DD  20 28 CB
    BRK                          ; $D0E0  00
    LDX #$00                     ; $D0E1  A2 00
    LDY #$10                     ; $D0E3  A0 10
    JSR sub_3E_CB28              ; $D0E5  20 28 CB
    EOR ($A0,X)                  ; $D0E8  41 A0
    SRE $20,X                    ; $D0EA  57 20
    KIL                          ; $D0EC  22
    .byte $E5  ; $D0ED
    INX                          ; $D0EE  E8
    LDY #$10                     ; $D0EF  A0 10
    JSR sub_3E_CB28              ; $D0F1  20 28 CB
    EOR ($A0,X)                  ; $D0F4  41 A0
    INY                          ; $D0F6  C8
    JSR sub_3F_E522              ; $D0F7  20 22 E5
    LDX #$00                     ; $D0FA  A2 00
    LDY #$02                     ; $D0FC  A0 02
    JSR sub_3F_E4A7              ; $D0FE  20 A7 E4
    INX                          ; $D101  E8
    LDY #$03                     ; $D102  A0 03
    JSR sub_3F_E4A7              ; $D104  20 A7 E4
    JSR sub_3F_E1DD              ; $D107  20 DD E1
    RTS                          ; $D10A  60

    .byte $A9,$0A,$8D,$77,$06,$A9,$D0,$8D,$F7,$05,$A9,$00,$8D,$E0,$05,$A9  ; $D10B
    .byte $00,$85,$FB,$8D,$B2,$05,$A9,$05,$8D,$C9,$05,$A9,$82,$8D,$72,$06  ; $D11B
    .byte $60,$A9,$00,$85,$F4,$60,$A5,$F4,$D0,$2F,$A9,$1C,$8D,$B4,$05,$A9  ; $D12B
    .byte $01,$8D,$72,$06,$A9,$08,$8D,$77,$06,$A9,$20,$8D,$CA,$05,$A9,$E0  ; $D13B
    .byte $8D,$E1,$05,$A9,$03,$8D,$B3,$05,$A9,$00,$85,$FA,$A9,$67,$8D,$24  ; $D14B
    .byte $06,$8D,$78,$06,$A9,$02,$8D,$0D,$06,$AD,$B4,$05,$C9,$2C,$D0,$06  ; $D15B
    .byte $8D,$A0,$03,$20,$DD,$E1,$AD,$77,$06,$C9,$0A,$F0,$3D,$AD,$B4,$05  ; $D16B
    .byte $C9,$5A,$B0,$8C,$A9,$03,$8D,$B3,$05,$18,$A9,$00,$85,$00,$AD,$B4  ; $D17B
    .byte $05,$0A,$26,$00,$0A,$26,$00,$29,$E0,$69,$00,$8D,$E1,$05,$A9,$20  ; $D18B
    .byte $65,$00,$8D,$CA,$05,$EE,$B4,$05,$CE,$0D,$06,$D0,$08,$A9,$02,$8D  ; $D19B
    .byte $0D,$06,$CE,$24,$06,$A9,$01,$85,$F4,$60,$A9,$01,$8D,$B2,$05,$18  ; $D1AB
    .byte $AD,$E0,$05,$69,$10,$8D,$E0,$05,$38,$AD,$F7,$05,$E9,$10,$8D,$F7  ; $D1BB
    .byte $05,$F0,$01,$60,$A9,$00,$85,$F4,$60  ; $D1CB

sub_3E_D1D4:
    LDA #$00                     ; $D1D4  A9 00
    STA $8C                      ; $D1D6  85 8C
    LDA $F3                      ; $D1D8  A5 F3
    AND #$01                     ; $D1DA  29 01
    BEQ loc_3E_D1EC              ; $D1DC  F0 0E
    JSR sub_3F_E1E1              ; $D1DE  20 E1 E1
    LDA $8C                      ; $D1E1  A5 8C
    LSR A                        ; $D1E3  4A
    BCS loc_3E_D1F2              ; $D1E4  B0 0C
    JSR sub_3E_CF4A              ; $D1E6  20 4A CF
    JMP loc_3E_D1F2              ; $D1E9  4C F2 D1


loc_3E_D1EC:
    JSR sub_3E_CF4A              ; $D1EC  20 4A CF
    JSR sub_3F_E1E1              ; $D1EF  20 E1 E1

loc_3E_D1F2:
    RTS                          ; $D1F2  60

    .byte $A9,$3B,$20,$91,$CB,$4C,$6E,$87  ; $D1F3

sub_3E_D1FB:
    LDA #$00                     ; $D1FB  A9 00
    STA $FB                      ; $D1FD  85 FB
    LDA #$68                     ; $D1FF  A9 68
    STA $60                      ; $D201  85 60
    LDA $6E                      ; $D203  A5 6E
    JSR sub_3E_CB91              ; $D205  20 91 CB
    LDA $6F                      ; $D208  A5 6F
    JSR sub_3E_CBDA              ; $D20A  20 DA CB
    LDA $5A                      ; $D20D  A5 5A
    AND #$03                     ; $D20F  29 03
    ORA #$20                     ; $D211  09 20
    STA $01                      ; $D213  85 01
    LDA $5B                      ; $D215  A5 5B
    AND #$02                     ; $D217  29 02
    ORA $66                      ; $D219  05 66
    STA $66                      ; $D21B  85 66
    LDA $63                      ; $D21D  A5 63
    PHA                          ; $D21F  48
    CLC                          ; $D220  18
    ADC #$04                     ; $D221  69 04
    STA $09                      ; $D223  85 09
    LDA $5B                      ; $D225  A5 5B
    AND #$01                     ; $D227  29 01
    ASL A                        ; $D229  0A
    PHA                          ; $D22A  48
    CLC                          ; $D22B  18
    ADC $63                      ; $D22C  65 63
    STA $63                      ; $D22E  85 63
    PLA                          ; $D230  68
    CLC                          ; $D231  18
    ADC #$9B                     ; $D232  69 9B
    STA $8D                      ; $D234  85 8D
    LDA $62                      ; $D236  A5 62
    STA $64                      ; $D238  85 64
    STA $08                      ; $D23A  85 08
    LDA $5A                      ; $D23C  A5 5A
    AND #$1C                     ; $D23E  29 1C
    STA $5A                      ; $D240  85 5A
    STA $61                      ; $D242  85 61
    LDA $6B                      ; $D244  A5 6B
    AND #$01                     ; $D246  29 01
    STA $6B                      ; $D248  85 6B
    TAY                          ; $D24A  A8
    LDA $DF1D,Y                  ; $D24B  B9 1D DF
    STA $00                      ; $D24E  85 00
    LDA $6A                      ; $D250  A5 6A
    AND #$F8                     ; $D252  29 F8
    TAY                          ; $D254  A8
    ORA #$00                     ; $D255  09 00
    STA $0A                      ; $D257  85 0A
    ORA #$40                     ; $D259  09 40
    STA $04                      ; $D25B  85 04
    LDX #$08                     ; $D25D  A2 08

loc_3E_D25F:
    LDA $0300,Y                  ; $D25F  B9 00 03
    AND $00                      ; $D262  25 00
    STA $0300,Y                  ; $D264  99 00 03
    INY                          ; $D267  C8
    DEX                          ; $D268  CA
    BNE loc_3E_D25F              ; $D269  D0 F4
    LDA $6A                      ; $D26B  A5 6A
    AND #$07                     ; $D26D  29 07
    STA $03                      ; $D26F  85 03
    LDA #$03                     ; $D271  A9 03
    STA $0B                      ; $D273  85 0B
    STA $05                      ; $D275  85 05
    LDA $6B                      ; $D277  A5 6B
    ASL A                        ; $D279  0A
    ASL A                        ; $D27A  0A
    ASL A                        ; $D27B  0A
    ORA #$60                     ; $D27C  09 60
    STA $0C                      ; $D27E  85 0C
    LDA #$FF                     ; $D280  A9 FF
    STA $0D                      ; $D282  85 0D

loc_3E_D284:
    LDY #$00                     ; $D284  A0 00
    STY $69                      ; $D286  84 69
    LDA ($54),Y                  ; $D288  B1 54
    ASL A                        ; $D28A  0A
    ROL $69                      ; $D28B  26 69
    ASL A                        ; $D28D  0A
    ROL $69                      ; $D28E  26 69
    CLC                          ; $D290  18
    ADC $66                      ; $D291  65 66
    STA $68                      ; $D293  85 68
    LDA $67                      ; $D295  A5 67
    ADC $69                      ; $D297  65 69
    STA $69                      ; $D299  85 69

loc_3E_D29B:
    LDA $63                      ; $D29B  A5 63
    STA $65                      ; $D29D  85 65
    LDY #$00                     ; $D29F  A0 00
    LDA ($68),Y                  ; $D2A1  B1 68
    STA $02                      ; $D2A3  85 02
    TAY                          ; $D2A5  A8
    AND #$07                     ; $D2A6  29 07
    TAX                          ; $D2A8  AA
    LDA $DFB1,X                  ; $D2A9  BD B1 DF
    STA $00                      ; $D2AC  85 00
    TYA                          ; $D2AE  98
    LSR A                        ; $D2AF  4A
    LSR A                        ; $D2B0  4A
    LSR A                        ; $D2B1  4A
    TAX                          ; $D2B2  AA
    LDA $0340,X                  ; $D2B3  BD 40 03
    AND $00                      ; $D2B6  25 00
    BEQ loc_3E_D2C4              ; $D2B8  F0 0A
    LDA $8D                      ; $D2BA  A5 8D
    STA $65                      ; $D2BC  85 65
    LDA $9F00,Y                  ; $D2BE  B9 00 9F
    JMP loc_3E_D2C6              ; $D2C1  4C C6 D2


loc_3E_D2C4:
    LDA ($08),Y                  ; $D2C4  B1 08

loc_3E_D2C6:
    STA $06                      ; $D2C6  85 06
    AND #$03                     ; $D2C8  29 03
    TAY                          ; $D2CA  A8
    LDA $01                      ; $D2CB  A5 01
    CMP #$21                     ; $D2CD  C9 21
    BCS loc_3E_D2D9              ; $D2CF  B0 08
    LDA ($0C),Y                  ; $D2D1  B1 0C
    LDY $03                      ; $D2D3  A4 03
    ORA ($0A),Y                  ; $D2D5  11 0A
    STA ($0A),Y                  ; $D2D7  91 0A

loc_3E_D2D9:
    LDA $0C                      ; $D2D9  A5 0C
    EOR #$04                     ; $D2DB  49 04
    STA $0C                      ; $D2DD  85 0C

loc_3E_D2DF:
    LDY $02                      ; $D2DF  A4 02
    LDA ($64),Y                  ; $D2E1  B1 64
    LDY $61                      ; $D2E3  A4 61
    STA $07B0,Y                  ; $D2E5  99 B0 07
    INY                          ; $D2E8  C8
    TYA                          ; $D2E9  98
    AND #$1F                     ; $D2EA  29 1F
    STA $61                      ; $D2EC  85 61
    DEC $01                      ; $D2EE  C6 01
    BEQ loc_3E_D311              ; $D2F0  F0 1F
    TYA                          ; $D2F2  98
    AND #$03                     ; $D2F3  29 03
    BNE loc_3E_D304              ; $D2F5  D0 0D
    INC $03                      ; $D2F7  E6 03
    LDA $03                      ; $D2F9  A5 03
    AND #$07                     ; $D2FB  29 07
    STA $03                      ; $D2FD  85 03
    INC $54                      ; $D2FF  E6 54
    JMP loc_3E_D284              ; $D301  4C 84 D2


loc_3E_D304:
    AND #$01                     ; $D304  29 01
    BNE loc_3E_D30D              ; $D306  D0 05
    INC $68                      ; $D308  E6 68
    JMP loc_3E_D29B              ; $D30A  4C 9B D2


loc_3E_D30D:
    INC $65                      ; $D30D  E6 65
    BNE loc_3E_D2DF              ; $D30F  D0 CE

loc_3E_D311:
    PLA                          ; $D311  68
    STA $63                      ; $D312  85 63
    LDA $66                      ; $D314  A5 66
    AND #$FC                     ; $D316  29 FC
    STA $66                      ; $D318  85 66
    JSR sub_3E_CBE9              ; $D31A  20 E9 CB
    RTS                          ; $D31D  60


sub_3E_D31E:
    LDA #$01                     ; $D31E  A9 01
    STA $FB                      ; $D320  85 FB
    LDA $6E                      ; $D322  A5 6E
    JSR sub_3E_CB91              ; $D324  20 91 CB
    LDA $6F                      ; $D327  A5 6F
    JSR sub_3E_CBDA              ; $D329  20 DA CB
    LDA $5B                      ; $D32C  A5 5B
    AND #$03                     ; $D32E  29 03
    CLC                          ; $D330  18
    ADC #$20                     ; $D331  69 20
    STA $01                      ; $D333  85 01
    LDA $5A                      ; $D335  A5 5A
    AND #$02                     ; $D337  29 02
    LSR A                        ; $D339  4A
    ORA $66                      ; $D33A  05 66
    STA $66                      ; $D33C  85 66
    LDA $63                      ; $D33E  A5 63
    PHA                          ; $D340  48
    CLC                          ; $D341  18
    ADC #$04                     ; $D342  69 04
    STA $09                      ; $D344  85 09
    LDA $5A                      ; $D346  A5 5A
    AND #$01                     ; $D348  29 01
    PHA                          ; $D34A  48
    CLC                          ; $D34B  18
    ADC $63                      ; $D34C  65 63
    STA $63                      ; $D34E  85 63
    PLA                          ; $D350  68
    CLC                          ; $D351  18
    ADC #$9B                     ; $D352  69 9B
    STA $8D                      ; $D354  85 8D
    LDA $62                      ; $D356  A5 62
    STA $64                      ; $D358  85 64
    STA $08                      ; $D35A  85 08
    LDA #$00                     ; $D35C  A9 00
    STA $61                      ; $D35E  85 61
    LDA $6B                      ; $D360  A5 6B
    AND #$02                     ; $D362  29 02
    ASL A                        ; $D364  0A
    ORA #$60                     ; $D365  09 60
    STA $0C                      ; $D367  85 0C
    LDA #$FF                     ; $D369  A9 FF
    STA $0D                      ; $D36B  85 0D
    LSR $6B                      ; $D36D  46 6B
    LDY $6B                      ; $D36F  A4 6B
    LDA $DF1F,Y                  ; $D371  B9 1F DF
    STA $00                      ; $D374  85 00
    LDY $6A                      ; $D376  A4 6A
    STY $03                      ; $D378  84 03
    LDX #$09                     ; $D37A  A2 09

loc_3E_D37C:
    LDA $0300,Y                  ; $D37C  B9 00 03
    AND $00                      ; $D37F  25 00
    STA $0300,Y                  ; $D381  99 00 03
    TYA                          ; $D384  98
    CLC                          ; $D385  18
    ADC #$08                     ; $D386  69 08
    AND #$3F                     ; $D388  29 3F
    TAY                          ; $D38A  A8
    DEX                          ; $D38B  CA
    BNE loc_3E_D37C              ; $D38C  D0 EE

loc_3E_D38E:
    LDY #$00                     ; $D38E  A0 00
    STY $69                      ; $D390  84 69
    LDA ($54),Y                  ; $D392  B1 54
    ASL A                        ; $D394  0A
    ROL $69                      ; $D395  26 69
    ASL A                        ; $D397  0A
    ROL $69                      ; $D398  26 69
    CLC                          ; $D39A  18
    ADC $66                      ; $D39B  65 66
    STA $68                      ; $D39D  85 68
    LDA $67                      ; $D39F  A5 67
    ADC $69                      ; $D3A1  65 69
    STA $69                      ; $D3A3  85 69

loc_3E_D3A5:
    LDA $63                      ; $D3A5  A5 63
    STA $65                      ; $D3A7  85 65
    LDY #$00                     ; $D3A9  A0 00
    LDA ($68),Y                  ; $D3AB  B1 68
    STA $02                      ; $D3AD  85 02
    TAY                          ; $D3AF  A8
    AND #$07                     ; $D3B0  29 07
    TAX                          ; $D3B2  AA
    LDA $DFB1,X                  ; $D3B3  BD B1 DF
    STA $00                      ; $D3B6  85 00
    TYA                          ; $D3B8  98
    LSR A                        ; $D3B9  4A
    LSR A                        ; $D3BA  4A
    LSR A                        ; $D3BB  4A
    TAX                          ; $D3BC  AA
    LDA $0340,X                  ; $D3BD  BD 40 03
    AND $00                      ; $D3C0  25 00
    BEQ loc_3E_D3CE              ; $D3C2  F0 0A
    LDA $8D                      ; $D3C4  A5 8D
    STA $65                      ; $D3C6  85 65
    LDA $9F00,Y                  ; $D3C8  B9 00 9F
    JMP loc_3E_D3D0              ; $D3CB  4C D0 D3


loc_3E_D3CE:
    LDA ($08),Y                  ; $D3CE  B1 08

loc_3E_D3D0:
    STA $06                      ; $D3D0  85 06
    AND #$03                     ; $D3D2  29 03
    TAY                          ; $D3D4  A8
    LDA ($0C),Y                  ; $D3D5  B1 0C
    LDX $03                      ; $D3D7  A6 03
    ORA $0300,X                  ; $D3D9  1D 00 03
    STA $0300,X                  ; $D3DC  9D 00 03
    LDA $0C                      ; $D3DF  A5 0C
    EOR #$08                     ; $D3E1  49 08
    STA $0C                      ; $D3E3  85 0C

loc_3E_D3E5:
    LDY $02                      ; $D3E5  A4 02
    LDA ($64),Y                  ; $D3E7  B1 64
    LDY $61                      ; $D3E9  A4 61
    STA $07B0,Y                  ; $D3EB  99 B0 07
    INY                          ; $D3EE  C8
    STY $61                      ; $D3EF  84 61
    DEC $01                      ; $D3F1  C6 01
    BEQ loc_3E_D419              ; $D3F3  F0 24
    TYA                          ; $D3F5  98
    AND #$03                     ; $D3F6  29 03
    BNE loc_3E_D408              ; $D3F8  D0 0E
    LDA $03                      ; $D3FA  A5 03
    CLC                          ; $D3FC  18
    ADC #$08                     ; $D3FD  69 08
    AND #$7F                     ; $D3FF  29 7F
    STA $03                      ; $D401  85 03
    INC $55                      ; $D403  E6 55
    JMP loc_3E_D38E              ; $D405  4C 8E D3


loc_3E_D408:
    AND #$01                     ; $D408  29 01
    BNE loc_3E_D413              ; $D40A  D0 07
    INC $68                      ; $D40C  E6 68
    INC $68                      ; $D40E  E6 68
    JMP loc_3E_D3A5              ; $D410  4C A5 D3


loc_3E_D413:
    INC $65                      ; $D413  E6 65
    INC $65                      ; $D415  E6 65
    BNE loc_3E_D3E5              ; $D417  D0 CC

loc_3E_D419:
    LDA #$76                     ; $D419  A9 76
    STA $60                      ; $D41B  85 60
    PLA                          ; $D41D  68
    STA $63                      ; $D41E  85 63
    LDA $66                      ; $D420  A5 66
    AND #$FC                     ; $D422  29 FC
    STA $66                      ; $D424  85 66
    JSR sub_3E_CBE9              ; $D426  20 E9 CB
    RTS                          ; $D429  60

    .byte $48,$A9,$00,$85,$40,$68,$85,$99,$A5,$40,$29,$40,$05,$99,$85,$40  ; $D42A
    .byte $A9,$00,$85,$42,$85,$9A,$60,$AD,$86,$04,$C9,$F0,$90,$72,$A9,$00  ; $D43A
    .byte $85,$EF,$46,$80,$08,$06,$80,$A9,$19,$85,$A8,$A9,$90,$85,$07,$A9  ; $D44A
    .byte $04,$85,$06,$A9,$30,$85,$DC,$A5,$07,$85,$4E,$38,$E9,$10,$85,$07  ; $D45A
    .byte $A9,$F0,$85,$4D,$20,$AB,$D8,$20,$2E,$D9,$A9,$08,$20,$F6,$C5,$C6  ; $D46A
    .byte $06,$D0,$E4,$A9,$01,$85,$70,$20,$1C,$D7,$28,$B0,$2E,$A9,$60,$85  ; $D47A
    .byte $EF,$85,$07,$A9,$04,$85,$06,$A9,$30,$85,$DC,$A9,$FF,$85,$80,$A5  ; $D48A
    .byte $07,$85,$4E,$18,$69,$10,$85,$07,$A9,$00,$85,$4D,$20,$AB,$D8,$20  ; $D49A
    .byte $2E,$D9,$A9,$08,$20,$F6,$C5,$C6,$06,$D0,$E0,$A9,$01,$20,$30,$D4  ; $D4AA
    .byte $60,$A9,$2F,$8D,$72,$06,$A9,$01,$8D,$77,$06,$A9,$09,$8D,$73,$06  ; $D4BA
    .byte $A9,$7F,$8D,$74,$06,$A9,$41,$85,$DC,$A9,$01,$8D,$78,$06,$E6,$F4  ; $D4CA
    .byte $A9,$00,$8D,$7A,$06,$AD,$E5,$03,$30,$52,$A5,$F3,$29,$01,$D0,$4C  ; $D4DA
    .byte $A5,$8F,$10,$48,$AD,$78,$06,$8D,$7A,$06,$AD,$4B,$06,$C9,$06,$F0  ; $D4EA
    .byte $04,$29,$01,$F0,$0A,$AD,$7A,$06,$18,$6D,$CB,$04,$8D,$CB,$04,$AD  ; $D4FA
    .byte $73,$06,$18,$6D,$78,$06,$8D,$73,$06,$C9,$3C,$90,$09,$A0,$FF,$8C  ; $D50A
    .byte $78,$06,$A0,$40,$84,$DC,$C9,$09,$B0,$09,$A0,$01,$8C,$78,$06,$A0  ; $D51A
    .byte $41,$84,$DC,$AD,$73,$06,$38,$E9,$0A,$8D,$7B,$06,$20,$2B,$C6,$4C  ; $D52A
    .byte $DA,$D4  ; $D53A
    LDA $04CB                    ; $D53C  AD CB 04
    CMP #$E3                     ; $D53F  C9 E3
    BCC loc_3E_D57B              ; $D541  90 38
    LDA #$00                     ; $D543  A9 00
    STA $F4                      ; $D545  85 F4
    STA $067B                    ; $D547  8D 7B 06
    LDA $73                      ; $D54A  A5 73
    BEQ loc_3E_D554              ; $D54C  F0 06
    STA $064F                    ; $D54E  8D 4F 06
    JSR sub_3E_CAAA              ; $D551  20 AA CA

loc_3E_D554:
    LDA $72                      ; $D554  A5 72
    BEQ loc_3E_D560              ; $D556  F0 08
    BPL loc_3E_D560              ; $D558  10 06
    STA $069E                    ; $D55A  8D 9E 06
    JSR sub_3E_C9EF              ; $D55D  20 EF C9

loc_3E_D560:
    LDA $0697                    ; $D560  AD 97 06
    STA $57                      ; $D563  85 57
    STA $046F                    ; $D565  8D 6F 04
    INC $04CA                    ; $D568  EE CA 04
    JSR sub_3E_D7EC              ; $D56B  20 EC D7
    LDA $72                      ; $D56E  A5 72
    BEQ loc_3E_D578              ; $D570  F0 06
    STA $069E                    ; $D572  8D 9E 06
    JSR sub_3E_C9EF              ; $D575  20 EF C9

loc_3E_D578:
    SEC                          ; $D578  38
    BCS loc_3E_D57C              ; $D579  B0 01

loc_3E_D57B:
    CLC                          ; $D57B  18

loc_3E_D57C:
    LDA #$00                     ; $D57C  A9 00
    STA $72                      ; $D57E  85 72
    STA $73                      ; $D580  85 73
    RTS                          ; $D582  60

    LDA $04CB                    ; $D583  AD CB 04
    CMP #$E3                     ; $D586  C9 E3
    BCC loc_3E_D5C5              ; $D588  90 3B
    LDA #$00                     ; $D58A  A9 00
    STA $F4                      ; $D58C  85 F4
    STA $067B                    ; $D58E  8D 7B 06
    JSR sub_3E_C62B              ; $D591  20 2B C6
    LDA $72                      ; $D594  A5 72
    BEQ loc_3E_D5A0              ; $D596  F0 08
    BPL loc_3E_D5A0              ; $D598  10 06
    STA $069E                    ; $D59A  8D 9E 06
    JSR sub_3E_C9EF              ; $D59D  20 EF C9

loc_3E_D5A0:
    LDA $73                      ; $D5A0  A5 73
    BEQ loc_3E_D5AA              ; $D5A2  F0 06
    STA $064F                    ; $D5A4  8D 4F 06
    JSR sub_3E_CAAA              ; $D5A7  20 AA CA

loc_3E_D5AA:
    LDA $0697                    ; $D5AA  AD 97 06
    STA $57                      ; $D5AD  85 57
    STA $046F                    ; $D5AF  8D 6F 04
    INC $04CA                    ; $D5B2  EE CA 04
    JSR sub_3E_D7AF              ; $D5B5  20 AF D7
    LDA $72                      ; $D5B8  A5 72
    BEQ loc_3E_D5C2              ; $D5BA  F0 06
    STA $069E                    ; $D5BC  8D 9E 06
    JSR sub_3E_C9EF              ; $D5BF  20 EF C9

loc_3E_D5C2:
    SEC                          ; $D5C2  38
    BCS loc_3E_D5C6              ; $D5C3  B0 01

loc_3E_D5C5:
    CLC                          ; $D5C5  18

loc_3E_D5C6:
    LDA #$00                     ; $D5C6  A9 00
    STA $72                      ; $D5C8  85 72
    STA $73                      ; $D5CA  85 73
    RTS                          ; $D5CC  60

    LDA $94                      ; $D5CD  A5 94
    CMP #$04                     ; $D5CF  C9 04
    BNE loc_3E_D606              ; $D5D1  D0 33
    LDA $04CB                    ; $D5D3  AD CB 04
    CMP #$0B                     ; $D5D6  C9 0B
    BCS loc_3E_D606              ; $D5D8  B0 2C
    LDA $73                      ; $D5DA  A5 73
    BEQ loc_3E_D5E4              ; $D5DC  F0 06
    STA $064F                    ; $D5DE  8D 4F 06
    JSR sub_3E_CAAA              ; $D5E1  20 AA CA

loc_3E_D5E4:
    LDA $72                      ; $D5E4  A5 72
    BEQ loc_3E_D5EE              ; $D5E6  F0 06
    STA $069E                    ; $D5E8  8D 9E 06
    JSR sub_3E_C9EF              ; $D5EB  20 EF C9

loc_3E_D5EE:
    LDA #$00                     ; $D5EE  A9 00
    STA $F4                      ; $D5F0  85 F4
    STA $067B                    ; $D5F2  8D 7B 06
    LDA $0697                    ; $D5F5  AD 97 06
    STA $57                      ; $D5F8  85 57
    STA $046F                    ; $D5FA  8D 6F 04
    INC $04CA                    ; $D5FD  EE CA 04
    JSR sub_3E_D86E              ; $D600  20 6E D8
    SEC                          ; $D603  38
    BCS loc_3E_D607              ; $D604  B0 01

loc_3E_D606:
    CLC                          ; $D606  18

loc_3E_D607:
    LDA #$00                     ; $D607  A9 00
    STA $72                      ; $D609  85 72
    STA $73                      ; $D60B  85 73
    RTS                          ; $D60D  60

    LDA $94                      ; $D60E  A5 94
    CMP #$04                     ; $D610  C9 04
    BNE loc_3E_D647              ; $D612  D0 33
    LDA $04CB                    ; $D614  AD CB 04
    CMP #$0B                     ; $D617  C9 0B
    BCS loc_3E_D647              ; $D619  B0 2C
    LDA $73                      ; $D61B  A5 73
    BEQ loc_3E_D625              ; $D61D  F0 06
    STA $064F                    ; $D61F  8D 4F 06
    JSR sub_3E_CAAA              ; $D622  20 AA CA

loc_3E_D625:
    LDA $72                      ; $D625  A5 72
    BEQ loc_3E_D62F              ; $D627  F0 06
    STA $069E                    ; $D629  8D 9E 06
    JSR sub_3E_C9EF              ; $D62C  20 EF C9

loc_3E_D62F:
    LDA #$00                     ; $D62F  A9 00
    STA $F4                      ; $D631  85 F4
    STA $067B                    ; $D633  8D 7B 06
    LDA $0697                    ; $D636  AD 97 06
    STA $57                      ; $D639  85 57
    STA $046F                    ; $D63B  8D 6F 04
    INC $04CA                    ; $D63E  EE CA 04
    JSR sub_3E_D829              ; $D641  20 29 D8
    SEC                          ; $D644  38
    BCS loc_3E_D648              ; $D645  B0 01

loc_3E_D647:
    CLC                          ; $D647  18

loc_3E_D648:
    LDA #$00                     ; $D648  A9 00
    STA $72                      ; $D64A  85 72
    STA $73                      ; $D64C  85 73
    RTS                          ; $D64E  60

    LDA $0486                    ; $D64F  AD 86 04
    CMP #$F0                     ; $D652  C9 F0
    BCC loc_3E_D6A7              ; $D654  90 51
    LDA $73                      ; $D656  A5 73
    BEQ loc_3E_D662              ; $D658  F0 08
    BPL loc_3E_D65F              ; $D65A  10 03
    STA $064F                    ; $D65C  8D 4F 06

loc_3E_D65F:
    JSR sub_3E_CAAA              ; $D65F  20 AA CA

loc_3E_D662:
    LDA $72                      ; $D662  A5 72
    BEQ loc_3E_D66E              ; $D664  F0 08
    BMI loc_3E_D66E              ; $D666  30 06
    STA $069E                    ; $D668  8D 9E 06
    JSR sub_3E_C9EF              ; $D66B  20 EF C9

loc_3E_D66E:
    LDA #$00                     ; $D66E  A9 00
    STA $F4                      ; $D670  85 F4
    STA $067B                    ; $D672  8D 7B 06
    STA $069C                    ; $D675  8D 9C 06
    JSR sub_3E_C62B              ; $D678  20 2B C6
    LDA #$00                     ; $D67B  A9 00
    STA $069C                    ; $D67D  8D 9C 06
    STA $0682                    ; $D680  8D 82 06
    LDY #$01                     ; $D683  A0 01
    LDA $0697                    ; $D685  AD 97 06
    CMP $57                      ; $D688  C5 57
    BCS loc_3E_D68E              ; $D68A  B0 02
    LDY #$02                     ; $D68C  A0 02

loc_3E_D68E:
    STY $70                      ; $D68E  84 70
    STA $57                      ; $D690  85 57
    STA $046F                    ; $D692  8D 6F 04
    JSR sub_3E_D71C              ; $D695  20 1C D7
    LDA $72                      ; $D698  A5 72
    BEQ loc_3E_D6A4              ; $D69A  F0 08
    BPL loc_3E_D6A4              ; $D69C  10 06
    STA $069E                    ; $D69E  8D 9E 06
    JSR sub_3E_C9EF              ; $D6A1  20 EF C9

loc_3E_D6A4:
    SEC                          ; $D6A4  38
    BCS loc_3E_D6A8              ; $D6A5  B0 01

loc_3E_D6A7:
    CLC                          ; $D6A7  18

loc_3E_D6A8:
    LDA #$00                     ; $D6A8  A9 00
    STA $72                      ; $D6AA  85 72
    STA $73                      ; $D6AC  85 73
    RTS                          ; $D6AE  60

    .byte $AD,$86,$04,$C9,$11,$B0,$33,$A5,$73,$F0,$06,$8D,$4F,$06,$20,$AA  ; $D6AF
    .byte $CA,$A5,$72,$F0,$06,$8D,$9E,$06,$20,$EF,$C9,$A9,$00,$85,$F4,$8D  ; $D6BF
    .byte $7B,$06,$A0,$02,$AD,$97,$06,$C5,$57,$90,$02,$A0,$01,$84,$70,$85  ; $D6CF
    .byte $57,$8D,$6F,$04,$20,$5B,$D7,$38,$B0,$01,$18,$A9,$00,$85,$72,$85  ; $D6DF
    .byte $73,$60  ; $D6EF

sub_3E_D6F1:
    LDX #$15                     ; $D6F1  A2 15

loc_3E_D6F3:
    LDA #$00                     ; $D6F3  A9 00
    STA $03A0,X                  ; $D6F5  9D A0 03
    LDA #$FF                     ; $D6F8  A9 FF
    STA $03FC,X                  ; $D6FA  9D FC 03
    DEX                          ; $D6FD  CA
    BNE loc_3E_D6F3              ; $D6FE  D0 F3
    RTS                          ; $D700  60


sub_3E_D701:
    JSR sub_3E_DBAD              ; $D701  20 AD DB
    JSR sub_3F_E1DD              ; $D704  20 DD E1
    TXA                          ; $D707  8A
    PHA                          ; $D708  48
    JSR sub_3E_CF4A              ; $D709  20 4A CF
    PLA                          ; $D70C  68
    TAX                          ; $D70D  AA
    JSR sub_3E_C62B              ; $D70E  20 2B C6
    RTS                          ; $D711  60


sub_3E_D712:
    LDA #$FF                     ; $D712  A9 FF
    STA $0680                    ; $D714  8D 80 06
    JSR sub_3E_CB28              ; $D717  20 28 CB
    LSR $60                      ; $D71A  46 60

sub_3E_D71C:
    LDA $70                      ; $D71C  A5 70
    PHA                          ; $D71E  48
    LDA #$01                     ; $D71F  A9 01
    STA $71                      ; $D721  85 71
    JSR sub_3E_D6F1              ; $D723  20 F1 D6
    JSR sub_3F_E1DD              ; $D726  20 DD E1
    JSR sub_3E_CF4A              ; $D729  20 4A CF
    JSR sub_3E_C62B              ; $D72C  20 2B C6
    LDA #$02                     ; $D72F  A9 02
    STA $6D                      ; $D731  85 6D
    LDY $57                      ; $D733  A4 57
    INY                          ; $D735  C8
    JSR sub_3E_D712              ; $D736  20 12 D7
    LDY #$80                     ; $D739  A0 80
    STY $07                      ; $D73B  84 07

loc_3E_D73D:
    LDA #$01                     ; $D73D  A9 01
    JSR sub_3E_D701              ; $D73F  20 01 D7
    LDA #$42                     ; $D742  A9 42
    STA $EB                      ; $D744  85 EB
    LDA #$00                     ; $D746  A9 00
    STA $ED                      ; $D748  85 ED
    STA $EE                      ; $D74A  85 EE
    STA $EC                      ; $D74C  85 EC
    LDX #$00                     ; $D74E  A2 00
    JSR sub_3F_E4D3              ; $D750  20 D3 E4
    DEC $07                      ; $D753  C6 07
    BNE loc_3E_D73D              ; $D755  D0 E6
    PLA                          ; $D757  68
    STA $70                      ; $D758  85 70
    RTS                          ; $D75A  60

    .byte $A5,$70,$48,$A9,$02,$85,$71,$20,$F1,$D6,$A9,$02,$85,$6D,$A4,$57  ; $D75B
    .byte $88,$84,$57,$20,$12,$D7,$A9,$FE,$85,$56,$A9,$01,$85,$FB,$A0,$7F  ; $D76B
    .byte $84,$07,$A5,$56,$C9,$F5,$90,$0E,$C6,$56,$C6,$56,$C6,$F7,$C6,$F7  ; $D77B
    .byte $20,$04,$D7,$4C,$96,$D7,$A9,$02,$20,$01,$D7,$A9,$B0,$85,$EB,$A9  ; $D78B
    .byte $FF,$85,$ED,$85,$EE,$85,$EC,$A2,$00,$20,$D3,$E4,$C6,$07,$D0,$D2  ; $D79B
    .byte $68,$85,$70,$60  ; $D7AB

sub_3E_D7AF:
    JSR sub_3E_D6F1              ; $D7AF  20 F1 D6
    INC $57                      ; $D7B2  E6 57
    INC $046F                    ; $D7B4  EE 6F 04
    LDA #$01                     ; $D7B7  A9 01
    STA $70                      ; $D7B9  85 70
    LDY $57                      ; $D7BB  A4 57
    JSR sub_3E_D712              ; $D7BD  20 12 D7
    LDA #$EF                     ; $D7C0  A9 EF
    STA $58                      ; $D7C2  85 58
    LDX #$78                     ; $D7C4  A2 78
    LDA #$02                     ; $D7C6  A9 02
    STA $6D                      ; $D7C8  85 6D

loc_3E_D7CA:
    LDA #$03                     ; $D7CA  A9 03
    JSR sub_3E_D701              ; $D7CC  20 01 D7
    TXA                          ; $D7CF  8A
    AND #$03                     ; $D7D0  29 03
    BNE loc_3E_D7D7              ; $D7D2  D0 03
    INC $04CB                    ; $D7D4  EE CB 04

loc_3E_D7D7:
    DEX                          ; $D7D7  CA
    BNE loc_3E_D7CA              ; $D7D8  D0 F0
    LDA $04CB                    ; $D7DA  AD CB 04
    CLC                          ; $D7DD  18
    ADC #$10                     ; $D7DE  69 10
    STA $04CB                    ; $D7E0  8D CB 04
    STX $58                      ; $D7E3  86 58
    STX $F9                      ; $D7E5  86 F9
    LDA #$01                     ; $D7E7  A9 01
    STA $FB                      ; $D7E9  85 FB
    RTS                          ; $D7EB  60


sub_3E_D7EC:
    JSR sub_3E_D6F1              ; $D7EC  20 F1 D6
    DEC $57                      ; $D7EF  C6 57
    DEC $046F                    ; $D7F1  CE 6F 04
    LDA #$02                     ; $D7F4  A9 02
    STA $70                      ; $D7F6  85 70
    LDY $57                      ; $D7F8  A4 57
    JSR sub_3E_D712              ; $D7FA  20 12 D7
    LDA #$EF                     ; $D7FD  A9 EF
    STA $58                      ; $D7FF  85 58
    LDX #$78                     ; $D801  A2 78
    LDA #$02                     ; $D803  A9 02
    STA $6D                      ; $D805  85 6D

loc_3E_D807:
    LDA #$03                     ; $D807  A9 03
    JSR sub_3E_D701              ; $D809  20 01 D7
    TXA                          ; $D80C  8A
    AND #$03                     ; $D80D  29 03
    BNE loc_3E_D814              ; $D80F  D0 03
    INC $04CB                    ; $D811  EE CB 04

loc_3E_D814:
    DEX                          ; $D814  CA
    BNE loc_3E_D807              ; $D815  D0 F0
    LDA $04CB                    ; $D817  AD CB 04
    CLC                          ; $D81A  18
    ADC #$10                     ; $D81B  69 10
    STA $04CB                    ; $D81D  8D CB 04
    STX $58                      ; $D820  86 58
    STX $F9                      ; $D822  86 F9
    LDA #$01                     ; $D824  A9 01
    STA $FB                      ; $D826  85 FB
    RTS                          ; $D828  60


sub_3E_D829:
    JSR sub_3E_D6F1              ; $D829  20 F1 D6
    INC $57                      ; $D82C  E6 57
    LDA $03B7                    ; $D82E  AD B7 03
    AND #$FE                     ; $D831  29 FE
    STA $03B7                    ; $D833  8D B7 03
    LDA #$01                     ; $D836  A9 01
    STA $70                      ; $D838  85 70
    LDY $57                      ; $D83A  A4 57
    JSR sub_3E_D712              ; $D83C  20 12 D7
    LDA #$00                     ; $D83F  A9 00
    STA $58                      ; $D841  85 58
    INC $046F                    ; $D843  EE 6F 04
    LDA $04CB                    ; $D846  AD CB 04
    SEC                          ; $D849  38
    SBC #$10                     ; $D84A  E9 10
    STA $04CB                    ; $D84C  8D CB 04
    LDX #$78                     ; $D84F  A2 78
    LDA #$FE                     ; $D851  A9 FE
    STA $6D                      ; $D853  85 6D

loc_3E_D855:
    LDA #$04                     ; $D855  A9 04
    JSR sub_3E_D701              ; $D857  20 01 D7
    TXA                          ; $D85A  8A
    AND #$03                     ; $D85B  29 03
    BNE loc_3E_D862              ; $D85D  D0 03
    DEC $04CB                    ; $D85F  CE CB 04

loc_3E_D862:
    DEX                          ; $D862  CA
    BNE loc_3E_D855              ; $D863  D0 F0
    STX $58                      ; $D865  86 58
    STX $F9                      ; $D867  86 F9
    LDA #$01                     ; $D869  A9 01
    STA $FB                      ; $D86B  85 FB
    RTS                          ; $D86D  60


sub_3E_D86E:
    JSR sub_3E_D6F1              ; $D86E  20 F1 D6
    DEC $57                      ; $D871  C6 57
    LDY $57                      ; $D873  A4 57
    LDA #$02                     ; $D875  A9 02
    STA $70                      ; $D877  85 70
    JSR sub_3E_D712              ; $D879  20 12 D7
    LDA #$00                     ; $D87C  A9 00
    STA $58                      ; $D87E  85 58
    DEC $046F                    ; $D880  CE 6F 04
    LDA $04CB                    ; $D883  AD CB 04
    SEC                          ; $D886  38
    SBC #$10                     ; $D887  E9 10
    STA $04CB                    ; $D889  8D CB 04
    LDX #$78                     ; $D88C  A2 78
    LDA #$FE                     ; $D88E  A9 FE
    STA $6D                      ; $D890  85 6D

loc_3E_D892:
    LDA #$04                     ; $D892  A9 04
    JSR sub_3E_D701              ; $D894  20 01 D7
    TXA                          ; $D897  8A
    AND #$03                     ; $D898  29 03
    BNE loc_3E_D89F              ; $D89A  D0 03
    DEC $04CB                    ; $D89C  CE CB 04

loc_3E_D89F:
    DEX                          ; $D89F  CA
    BNE loc_3E_D892              ; $D8A0  D0 F0
    STX $58                      ; $D8A2  86 58
    STX $F9                      ; $D8A4  86 F9
    LDA #$01                     ; $D8A6  A9 01
    STA $FB                      ; $D8A8  85 FB
    RTS                          ; $D8AA  60


sub_3E_D8AB:
    LDA #$08                     ; $D8AB  A9 08
    STA $5D                      ; $D8AD  85 5D
    LDA $4E                      ; $D8AF  A5 4E
    AND #$F8                     ; $D8B1  29 F8
    ASL A                        ; $D8B3  0A
    ROL $5D                      ; $D8B4  26 5D
    ASL A                        ; $D8B6  0A
    ROL $5D                      ; $D8B7  26 5D
    STA $5C                      ; $D8B9  85 5C
    LDA $4D                      ; $D8BB  A5 4D
    LSR A                        ; $D8BD  4A
    LSR A                        ; $D8BE  4A
    LSR A                        ; $D8BF  4A
    STA $5A                      ; $D8C0  85 5A
    ORA $5C                      ; $D8C2  05 5C
    STA $5C                      ; $D8C4  85 5C
    LDA $5C                      ; $D8C6  A5 5C
    AND #$40                     ; $D8C8  29 40
    ASL A                        ; $D8CA  0A
    ASL A                        ; $D8CB  0A
    ROL A                        ; $D8CC  2A
    STA $6B                      ; $D8CD  85 6B
    LDA $5C                      ; $D8CF  A5 5C
    AND #$02                     ; $D8D1  29 02
    ORA $6B                      ; $D8D3  05 6B
    STA $6B                      ; $D8D5  85 6B
    LDA $5D                      ; $D8D7  A5 5D
    STA $00                      ; $D8D9  85 00
    LDA $5C                      ; $D8DB  A5 5C
    LSR $00                      ; $D8DD  46 00
    ROR A                        ; $D8DF  6A
    LSR $00                      ; $D8E0  46 00
    ROR A                        ; $D8E2  6A
    LSR A                        ; $D8E3  4A
    LSR A                        ; $D8E4  4A
    STA $6C                      ; $D8E5  85 6C
    LSR $6C                      ; $D8E7  46 6C
    AND #$F8                     ; $D8E9  29 F8
    STA $5E                      ; $D8EB  85 5E
    LDA $5C                      ; $D8ED  A5 5C
    AND #$1F                     ; $D8EF  29 1F
    LSR A                        ; $D8F1  4A
    LSR A                        ; $D8F2  4A
    ORA $5E                      ; $D8F3  05 5E
    STA $6A                      ; $D8F5  85 6A
    ORA #$C0                     ; $D8F7  09 C0
    STA $5E                      ; $D8F9  85 5E
    LDA #$23                     ; $D8FB  A9 23
    STA $5F                      ; $D8FD  85 5F
    RTS                          ; $D8FF  60


sub_3E_D900:
    LDA $4D                      ; $D900  A5 4D
    STA $54                      ; $D902  85 54
    LDA $4F                      ; $D904  A5 4F
    CLC                          ; $D906  18
    ADC $50                      ; $D907  65 50
    ASL $54                      ; $D909  06 54
    ROL A                        ; $D90B  2A
    ASL $54                      ; $D90C  06 54
    ROL A                        ; $D90E  2A
    ASL $54                      ; $D90F  06 54
    ROL A                        ; $D911  2A
    CLC                          ; $D912  18
    ADC $52                      ; $D913  65 52
    STA $54                      ; $D915  85 54
    LDA #$00                     ; $D917  A9 00
    STA $55                      ; $D919  85 55
    LDA $4E                      ; $D91B  A5 4E
    LSR $55                      ; $D91D  46 55
    ROR A                        ; $D91F  6A
    LSR $55                      ; $D920  46 55
    ROR A                        ; $D922  6A
    LSR A                        ; $D923  4A
    STA $5B                      ; $D924  85 5B
    LSR A                        ; $D926  4A
    LSR A                        ; $D927  4A
    CLC                          ; $D928  18
    ADC $53                      ; $D929  65 53
    STA $55                      ; $D92B  85 55
    RTS                          ; $D92D  60


sub_3E_D92E:
    LDA $6E                      ; $D92E  A5 6E
    JSR sub_3E_CB91              ; $D930  20 91 CB
    LDA #$9B                     ; $D933  A9 9B
    STA $65                      ; $D935  85 65
    LDA #$00                     ; $D937  A9 00
    STA $64                      ; $D939  85 64
    LDX $47                      ; $D93B  A6 47
    LDA #$02                     ; $D93D  A9 02
    STA $0780,X                  ; $D93F  9D 80 07
    STA $0785,X                  ; $D942  9D 85 07
    LDA $5D                      ; $D945  A5 5D
    STA $0781,X                  ; $D947  9D 81 07
    STA $0786,X                  ; $D94A  9D 86 07
    LDA $5C                      ; $D94D  A5 5C
    STA $0782,X                  ; $D94F  9D 82 07
    CLC                          ; $D952  18
    ADC #$20                     ; $D953  69 20
    STA $0787,X                  ; $D955  9D 87 07
    LDY $80                      ; $D958  A4 80
    INC $80                      ; $D95A  E6 80
    LDA ($64),Y                  ; $D95C  B1 64
    INC $65                      ; $D95E  E6 65
    STA $0783,X                  ; $D960  9D 83 07
    LDA ($64),Y                  ; $D963  B1 64
    INC $65                      ; $D965  E6 65
    STA $0784,X                  ; $D967  9D 84 07
    LDA ($64),Y                  ; $D96A  B1 64
    INC $65                      ; $D96C  E6 65
    STA $0788,X                  ; $D96E  9D 88 07
    LDA ($64),Y                  ; $D971  B1 64
    INC $65                      ; $D973  E6 65
    STA $0789,X                  ; $D975  9D 89 07
    LDA #$01                     ; $D978  A9 01
    STA $078A,X                  ; $D97A  9D 8A 07
    LDA $5F                      ; $D97D  A5 5F
    STA $078B,X                  ; $D97F  9D 8B 07
    LDA $5E                      ; $D982  A5 5E
    STA $078C,X                  ; $D984  9D 8C 07
    LDA $6B                      ; $D987  A5 6B
    ASL A                        ; $D989  0A
    ASL A                        ; $D98A  0A
    ORA ($64),Y                  ; $D98B  11 64
    AND #$0F                     ; $D98D  29 0F
    TAX                          ; $D98F  AA
    LDY $6A                      ; $D990  A4 6A
    LDA $0300,Y                  ; $D992  B9 00 03
    AND $D9AD,X                  ; $D995  3D AD D9
    ORA $D9BD,X                  ; $D998  1D BD D9
    STA $0300,Y                  ; $D99B  99 00 03
    LDX $47                      ; $D99E  A6 47
    STA $078D,X                  ; $D9A0  9D 8D 07
    TXA                          ; $D9A3  8A
    CLC                          ; $D9A4  18
    ADC #$0E                     ; $D9A5  69 0E
    STA $47                      ; $D9A7  85 47
    JSR sub_3E_CBE9              ; $D9A9  20 E9 CB
    RTS                          ; $D9AC  60

    .byte $FC,$FC,$FC,$FC,$CF,$CF,$CF,$CF,$F3,$F3,$F3,$F3,$3F,$3F,$3F,$3F  ; $D9AD
    .byte $00,$01,$02,$03,$00,$10,$20,$30,$00,$04,$08,$0C,$00,$40,$80,$C0  ; $D9BD

sub_3E_D9CD:
    LDX $8F                      ; $D9CD  A6 8F

sub_3E_D9CF:
    LDA $046F,X                  ; $D9CF  BD 6F 04
    STA $4F                      ; $D9D2  85 4F
    LDA $00                      ; $D9D4  A5 00
    BPL loc_3E_D9DA              ; $D9D6  10 02
    DEC $4F                      ; $D9D8  C6 4F

loc_3E_D9DA:
    CLC                          ; $D9DA  18
    ADC $0486,X                  ; $D9DB  7D 86 04
    STA $4D                      ; $D9DE  85 4D
    LDA #$00                     ; $D9E0  A9 00
    ADC $4F                      ; $D9E2  65 4F
    STA $4F                      ; $D9E4  85 4F
    LDA $04B4,X                  ; $D9E6  BD B4 04
    STA $50                      ; $D9E9  85 50
    LDA $01                      ; $D9EB  A5 01
    BPL loc_3E_D9F1              ; $D9ED  10 02
    DEC $50                      ; $D9EF  C6 50

loc_3E_D9F1:
    CLC                          ; $D9F1  18
    ADC $04CB,X                  ; $D9F2  7D CB 04
    STA $4E                      ; $D9F5  85 4E
    LDA #$00                     ; $D9F7  A9 00
    ADC $50                      ; $D9F9  65 50
    BEQ loc_3E_DA01              ; $D9FB  F0 04
    BPL loc_3E_DA07              ; $D9FD  10 08
    BMI loc_3E_DA0D              ; $D9FF  30 0C

loc_3E_DA01:
    LDA $4E                      ; $DA01  A5 4E
    CMP #$F0                     ; $DA03  C9 F0
    BCC loc_3E_DA11              ; $DA05  90 0A

loc_3E_DA07:
    LDA #$E8                     ; $DA07  A9 E8
    STA $4E                      ; $DA09  85 4E
    BNE loc_3E_DA11              ; $DA0B  D0 04

loc_3E_DA0D:
    LDA #$00                     ; $DA0D  A9 00
    STA $4E                      ; $DA0F  85 4E

loc_3E_DA11:
    LDA $F4                      ; $DA11  A5 F4
    BNE loc_3E_DA18              ; $DA13  D0 03
    JMP loc_3E_DA68              ; $DA15  4C 68 DA


loc_3E_DA18:
    LDA $51                      ; $DA18  A5 51
    BNE loc_3E_DA3C              ; $DA1A  D0 20
    LDA #$40                     ; $DA1C  A9 40
    CLC                          ; $DA1E  18
    ADC $067B                    ; $DA1F  6D 7B 06
    STA $02                      ; $DA22  85 02
    LDA $4E                      ; $DA24  A5 4E
    CMP #$38                     ; $DA26  C9 38
    BCC loc_3E_DA39              ; $DA28  90 0F
    CMP #$C0                     ; $DA2A  C9 C0
    BCS loc_3E_DA39              ; $DA2C  B0 0B
    CMP $02                      ; $DA2E  C5 02
    BCS loc_3E_DA33              ; $DA30  B0 01
    RTS                          ; $DA32  60


loc_3E_DA33:
    SEC                          ; $DA33  38
    SBC $067B                    ; $DA34  ED 7B 06
    STA $4E                      ; $DA37  85 4E

loc_3E_DA39:
    JMP loc_3E_DA68              ; $DA39  4C 68 DA


loc_3E_DA3C:
    CMP #$06                     ; $DA3C  C9 06
    BNE loc_3E_DA52              ; $DA3E  D0 12
    LDA $4E                      ; $DA40  A5 4E
    CMP #$BF                     ; $DA42  C9 BF
    BCS loc_3E_DA52              ; $DA44  B0 0C
    CMP $0672                    ; $DA46  CD 72 06
    BCC loc_3E_DA4C              ; $DA49  90 01
    RTS                          ; $DA4B  60


loc_3E_DA4C:
    CLC                          ; $DA4C  18
    ADC $069C                    ; $DA4D  6D 9C 06
    STA $4E                      ; $DA50  85 4E

loc_3E_DA52:
    CMP #$07                     ; $DA52  C9 07
    BNE loc_3E_DA68              ; $DA54  D0 12
    LDA $4E                      ; $DA56  A5 4E
    CMP #$7F                     ; $DA58  C9 7F
    BCS loc_3E_DA68              ; $DA5A  B0 0C
    CMP $0672                    ; $DA5C  CD 72 06
    BCC loc_3E_DA62              ; $DA5F  90 01
    RTS                          ; $DA61  60


loc_3E_DA62:
    CLC                          ; $DA62  18
    ADC $069C                    ; $DA63  6D 9C 06
    STA $4E                      ; $DA66  85 4E

loc_3E_DA68:
    LDA $6E                      ; $DA68  A5 6E
    JSR sub_3E_CB91              ; $DA6A  20 91 CB
    LDA $6F                      ; $DA6D  A5 6F
    JSR sub_3E_CBDA              ; $DA6F  20 DA CB
    LDA #$00                     ; $DA72  A9 00
    STA $03                      ; $DA74  85 03
    STA $64                      ; $DA76  85 64
    LDA $4D                      ; $DA78  A5 4D
    LSR $4F                      ; $DA7A  46 4F
    ROR A                        ; $DA7C  6A
    LSR $4F                      ; $DA7D  46 4F
    ROR A                        ; $DA7F  6A
    LSR $4F                      ; $DA80  46 4F
    ROR A                        ; $DA82  6A
    LSR $4F                      ; $DA83  46 4F
    ROR A                        ; $DA85  6A
    LSR $4F                      ; $DA86  46 4F
    ROR A                        ; $DA88  6A
    BCC loc_3E_DA8D              ; $DA89  90 02
    INC $03                      ; $DA8B  E6 03

loc_3E_DA8D:
    TAY                          ; $DA8D  A8
    LDA $4E                      ; $DA8E  A5 4E
    LSR A                        ; $DA90  4A
    LSR A                        ; $DA91  4A
    LSR A                        ; $DA92  4A
    LSR A                        ; $DA93  4A
    LSR A                        ; $DA94  4A
    BCC loc_3E_DA9B              ; $DA95  90 04
    INC $03                      ; $DA97  E6 03
    INC $03                      ; $DA99  E6 03

loc_3E_DA9B:
    CLC                          ; $DA9B  18
    ADC $53                      ; $DA9C  65 53
    STA $55                      ; $DA9E  85 55
    LDA $52                      ; $DAA0  A5 52
    STA $54                      ; $DAA2  85 54
    LDA ($54),Y                  ; $DAA4  B1 54
    STA $68                      ; $DAA6  85 68
    LDA #$00                     ; $DAA8  A9 00
    ASL $68                      ; $DAAA  06 68
    ROL A                        ; $DAAC  2A
    ASL $68                      ; $DAAD  06 68
    ROL A                        ; $DAAF  2A
    ADC $67                      ; $DAB0  65 67
    STA $69                      ; $DAB2  85 69
    LDY $03                      ; $DAB4  A4 03
    LDA ($68),Y                  ; $DAB6  B1 68
    LDY $63                      ; $DAB8  A4 63
    INY                          ; $DABA  C8
    INY                          ; $DABB  C8
    INY                          ; $DABC  C8
    INY                          ; $DABD  C8
    STY $65                      ; $DABE  84 65
    PHA                          ; $DAC0  48
    PHA                          ; $DAC1  48
    AND #$07                     ; $DAC2  29 07
    TAY                          ; $DAC4  A8
    LDA $DFB1,Y                  ; $DAC5  B9 B1 DF
    STA $02                      ; $DAC8  85 02
    PLA                          ; $DACA  68
    LSR A                        ; $DACB  4A
    LSR A                        ; $DACC  4A
    LSR A                        ; $DACD  4A
    TAY                          ; $DACE  A8
    LDA $0340,Y                  ; $DACF  B9 40 03
    AND $02                      ; $DAD2  25 02
    BEQ loc_3E_DADA              ; $DAD4  F0 04
    LDA #$9F                     ; $DAD6  A9 9F
    STA $65                      ; $DAD8  85 65

loc_3E_DADA:
    PLA                          ; $DADA  68
    TAY                          ; $DADB  A8
    LDA ($64),Y                  ; $DADC  B1 64
    LSR A                        ; $DADE  4A
    LSR A                        ; $DADF  4A
    LSR A                        ; $DAE0  4A
    LSR A                        ; $DAE1  4A
    CMP $11                      ; $DAE2  C5 11
    BCC loc_3E_DAFB              ; $DAE4  90 15
    STY $13                      ; $DAE6  84 13
    STA $11                      ; $DAE8  85 11
    LDY $51                      ; $DAEA  A4 51
    LDA $DAFF,Y                  ; $DAEC  B9 FF DA
    ASL A                        ; $DAEF  0A
    ASL A                        ; $DAF0  0A
    ASL A                        ; $DAF1  0A
    ASL A                        ; $DAF2  0A
    ORA $11                      ; $DAF3  05 11
    TAY                          ; $DAF5  A8
    LDA $DB0F,Y                  ; $DAF6  B9 0F DB
    STA $11                      ; $DAF9  85 11

loc_3E_DAFB:
    JSR sub_3E_CBE9              ; $DAFB  20 E9 CB
    RTS                          ; $DAFE  60

    .byte $00,$00,$01,$00,$02,$00,$02,$00,$03,$03,$03,$03,$00,$00,$01,$00  ; $DAFF
    .byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F  ; $DB0F
    .byte $00,$01,$02,$03,$04,$11,$06,$07,$08,$09,$0A,$0B,$0C,$1F,$10,$0F  ; $DB1F
    .byte $00,$01,$02,$03,$04,$13,$06,$15,$08,$17,$0A,$0B,$0C,$19,$0E,$0F  ; $DB2F
    .byte $00,$01,$02,$03,$04,$1D,$06,$07,$08,$01,$0A,$0B,$0C,$1B,$0E,$0F  ; $DB3F

sub_3E_DB4F:
    LDA #$00                     ; $DB4F  A9 00
    STA $EE                      ; $DB51  85 EE
    LDA $4D                      ; $DB53  A5 4D
    AND #$0F                     ; $DB55  29 0F
    TAY                          ; $DB57  A8
    LDA $DB7C,Y                  ; $DB58  B9 7C DB
    STA $ED                      ; $DB5B  85 ED
    RTS                          ; $DB5D  60


sub_3E_DB5E:
    LDA #$00                     ; $DB5E  A9 00
    STA $EE                      ; $DB60  85 EE
    LDA $4D                      ; $DB62  A5 4D
    AND #$0F                     ; $DB64  29 0F
    TAY                          ; $DB66  A8
    LDA $DB84,Y                  ; $DB67  B9 84 DB
    STA $ED                      ; $DB6A  85 ED
    RTS                          ; $DB6C  60


sub_3E_DB6D:
    LDA #$00                     ; $DB6D  A9 00
    STA $ED                      ; $DB6F  85 ED
    LDA $4E                      ; $DB71  A5 4E
    AND #$0F                     ; $DB73  29 0F
    TAY                          ; $DB75  A8
    LDA $DB7C,Y                  ; $DB76  B9 7C DB
    STA $EE                      ; $DB79  85 EE
    RTS                          ; $DB7B  60

    .byte $FF,$FE,$FD,$FC,$FB,$FA,$F9,$F8,$08,$07,$06,$05,$04,$03,$02,$01  ; $DB7C
    .byte $FF,$FE,$FD,$FC,$FB,$FA,$F9,$F8  ; $DB8C

sub_3E_DB94:
    LDA $80                      ; $DB94  A5 80
    AND #$07                     ; $DB96  29 07
    TAY                          ; $DB98  A8
    LDA $DFB1,Y                  ; $DB99  B9 B1 DF
    STA $00                      ; $DB9C  85 00
    LDA $80                      ; $DB9E  A5 80
    LSR A                        ; $DBA0  4A
    LSR A                        ; $DBA1  4A
    LSR A                        ; $DBA2  4A
    TAY                          ; $DBA3  A8
    LDA $0340,Y                  ; $DBA4  B9 40 03
    ORA $00                      ; $DBA7  05 00
    STA $0340,Y                  ; $DBA9  99 40 03
    RTS                          ; $DBAC  60


sub_3E_DBAD:
    ORA #$00                     ; $DBAD  09 00
    BEQ loc_3E_DBCE              ; $DBAF  F0 1D
    ASL A                        ; $DBB1  0A
    TAY                          ; $DBB2  A8
    DEY                          ; $DBB3  88
    DEY                          ; $DBB4  88
    LDA $DBCF,Y                  ; $DBB5  B9 CF DB
    STA $08                      ; $DBB8  85 08
    LDA $DBD0,Y                  ; $DBBA  B9 D0 DB
    STA $09                      ; $DBBD  85 09
    LDA $6D                      ; $DBBF  A5 6D
    STA $EB                      ; $DBC1  85 EB
    STA $ED                      ; $DBC3  85 ED
    LDA #$00                     ; $DBC5  A9 00
    STA $EC                      ; $DBC7  85 EC
    STA $EE                      ; $DBC9  85 EE
    JMP ($0008)                  ; $DBCB  6C 08 00


loc_3E_DBCE:
    RTS                          ; $DBCE  60

    .byte $DE,$DC,$3E,$DD,$8E,$DD,$CE,$DD  ; $DBCF

sub_3E_DBD7:
    PHA                          ; $DBD7  48
    TAY                          ; $DBD8  A8
    STA $51                      ; $DBD9  85 51
    AND #$07                     ; $DBDB  29 07
    STA $063D                    ; $DBDD  8D 3D 06
    LDA $FD                      ; $DBE0  A5 FD
    PHA                          ; $DBE2  48
    JSR sub_3E_CB28              ; $DBE3  20 28 CB
    KIL                          ; $DBE6  42
    LDA $DF91,Y                  ; $DBE7  B9 91 DF
    JSR sub_3E_C9EF              ; $DBEA  20 EF C9
    LDA $DFA1,Y                  ; $DBED  B9 A1 DF
    STA $DC                      ; $DBF0  85 DC
    LDA #$1B                     ; $DBF2  A9 1B
    STA $03E5                    ; $DBF4  8D E5 03
    LDA $DF51,Y                  ; $DBF7  B9 51 DF
    STA $6E                      ; $DBFA  85 6E
    LDA $DF21,Y                  ; $DBFC  B9 21 DF
    STA $6F                      ; $DBFF  85 6F
    LDA $DF31,Y                  ; $DC01  B9 31 DF
    STA $52                      ; $DC04  85 52
    LDA $DF41,Y                  ; $DC06  B9 41 DF
    STA $53                      ; $DC09  85 53
    LDA $DF71,Y                  ; $DC0B  B9 71 DF
    STA $67                      ; $DC0E  85 67
    LDA $DF61,Y                  ; $DC10  B9 61 DF
    STA $63                      ; $DC13  85 63
    LDA $DF81,Y                  ; $DC15  B9 81 DF
    STA $064E                    ; $DC18  8D 4E 06
    LDY #$01                     ; $DC1B  A0 01
    JSR sub_3E_C5F0              ; $DC1D  20 F0 C5
    LDY #$02                     ; $DC20  A0 02
    JSR sub_3E_C5F0              ; $DC22  20 F0 C5
    LDA #$00                     ; $DC25  A9 00
    STA $FD                      ; $DC27  85 FD
    STA $2001                    ; $DC29  8D 01 20
    STA $F0                      ; $DC2C  85 F0
    STA $9B                      ; $DC2E  85 9B
    STA $067B                    ; $DC30  8D 7B 06
    STA $F4                      ; $DC33  85 F4
    STA $067A                    ; $DC35  8D 7A 06
    STA $56                      ; $DC38  85 56
    STA $F7                      ; $DC3A  85 F7
    STA $4D                      ; $DC3C  85 4D
    STA $59                      ; $DC3E  85 59
    STA $58                      ; $DC40  85 58
    STA $F9                      ; $DC42  85 F9
    STA $FA                      ; $DC44  85 FA
    STA $4F                      ; $DC46  85 4F
    LDA $0684                    ; $DC48  AD 84 06
    STA $57                      ; $DC4B  85 57
    TAY                          ; $DC4D  A8
    JSR sub_3E_CB28              ; $DC4E  20 28 CB
    LSR $A9                      ; $DC51  46 A9
    ISC $808D,X                  ; $DC53  FF 8D 80
    ASL $20                      ; $DC56  06 20
    ROR $DC                      ; $DC58  66 DC
    JSR sub_3F_E1DD              ; $DC5A  20 DD E1
    PLA                          ; $DC5D  68
    STA $FD                      ; $DC5E  85 FD
    LDA #$01                     ; $DC60  A9 01
    STA $FB                      ; $DC62  85 FB
    PLA                          ; $DC64  68
    RTS                          ; $DC65  60


sub_3E_DC66:
    LDA $064E                    ; $DC66  AD 4E 06
    JSR sub_3E_CAA4              ; $DC69  20 A4 CA
    LDA $064F                    ; $DC6C  AD 4F 06
    BEQ loc_3E_DC74              ; $DC6F  F0 03
    JSR sub_3E_CAA4              ; $DC71  20 A4 CA

loc_3E_DC74:
    LDA $56                      ; $DC74  A5 56
    STA $F7                      ; $DC76  85 F7
    CLC                          ; $DC78  18
    ADC #$04                     ; $DC79  69 04
    STA $4D                      ; $DC7B  85 4D
    LDA $57                      ; $DC7D  A5 57
    ADC #$00                     ; $DC7F  69 00
    STA $4F                      ; $DC81  85 4F
    LDA $58                      ; $DC83  A5 58
    STA $F9                      ; $DC85  85 F9
    STA $4E                      ; $DC87  85 4E
    LDA $59                      ; $DC89  A5 59
    STA $50                      ; $DC8B  85 50
    LDA #$1E                     ; $DC8D  A9 1E
    STA $07                      ; $DC8F  85 07

loc_3E_DC91:
    JSR sub_3E_D8AB              ; $DC91  20 AB D8
    JSR sub_3E_D900              ; $DC94  20 00 D9
    JSR sub_3E_D1FB              ; $DC97  20 FB D1
    LDA $4E                      ; $DC9A  A5 4E
    CLC                          ; $DC9C  18
    ADC #$08                     ; $DC9D  69 08
    STA $4E                      ; $DC9F  85 4E
    CMP #$EF                     ; $DCA1  C9 EF
    BCC loc_3E_DCAB              ; $DCA3  90 06
    LDA #$00                     ; $DCA5  A9 00
    STA $4E                      ; $DCA7  85 4E
    INC $50                      ; $DCA9  E6 50

loc_3E_DCAB:
    JSR sub_3E_C7DE              ; $DCAB  20 DE C7
    DEC $07                      ; $DCAE  C6 07
    BNE loc_3E_DC91              ; $DCB0  D0 DF
    LDA $EF                      ; $DCB2  A5 EF
    BEQ loc_3E_DCB9              ; $DCB4  F0 03
    JSR sub_3E_DCBA              ; $DCB6  20 BA DC

loc_3E_DCB9:
    RTS                          ; $DCB9  60


sub_3E_DCBA:
    LDA #$60                     ; $DCBA  A9 60
    STA $07                      ; $DCBC  85 07
    LDA #$04                     ; $DCBE  A9 04
    STA $06                      ; $DCC0  85 06

loc_3E_DCC2:
    LDA #$FF                     ; $DCC2  A9 FF
    STA $80                      ; $DCC4  85 80
    LDA $07                      ; $DCC6  A5 07
    STA $4E                      ; $DCC8  85 4E
    CLC                          ; $DCCA  18
    ADC #$10                     ; $DCCB  69 10
    STA $07                      ; $DCCD  85 07
    LDA #$00                     ; $DCCF  A9 00
    STA $4D                      ; $DCD1  85 4D
    JSR sub_3E_D8AB              ; $DCD3  20 AB D8
    JSR sub_3E_D92E              ; $DCD6  20 2E D9
    DEC $06                      ; $DCD9  C6 06
    BNE loc_3E_DCC2              ; $DCDB  D0 E5
    RTS                          ; $DCDD  60

    TXA                          ; $DCDE  8A
    PHA                          ; $DCDF  48
    LDA $56                      ; $DCE0  A5 56
    CLC                          ; $DCE2  18
    ADC #$04                     ; $DCE3  69 04
    AND #$08                     ; $DCE5  29 08
    STA $00                      ; $DCE7  85 00
    LDA $56                      ; $DCE9  A5 56
    CLC                          ; $DCEB  18
    ADC $EB                      ; $DCEC  65 EB
    STA $56                      ; $DCEE  85 56
    STA $4D                      ; $DCF0  85 4D
    LDA $57                      ; $DCF2  A5 57
    ADC $EC                      ; $DCF4  65 EC
    STA $57                      ; $DCF6  85 57
    LDA $71                      ; $DCF8  A5 71
    AND #$01                     ; $DCFA  29 01
    BNE loc_3E_DD0C              ; $DCFC  D0 0E
    LDA $56                      ; $DCFE  A5 56
    CMP #$10                     ; $DD00  C9 10
    BCS loc_3E_DD0C              ; $DD02  B0 08
    LDA #$00                     ; $DD04  A9 00
    STA $56                      ; $DD06  85 56
    STA $F7                      ; $DD08  85 F7
    BEQ loc_3E_DD10              ; $DD0A  F0 04

loc_3E_DD0C:
    LDA #$01                     ; $DD0C  A9 01
    STA $70                      ; $DD0E  85 70

loc_3E_DD10:
    LDA $56                      ; $DD10  A5 56
    STA $F7                      ; $DD12  85 F7
    CLC                          ; $DD14  18
    ADC #$04                     ; $DD15  69 04
    AND #$08                     ; $DD17  29 08
    CMP $00                      ; $DD19  C5 00
    BEQ loc_3E_DD3B              ; $DD1B  F0 1E
    LDA $56                      ; $DD1D  A5 56
    CLC                          ; $DD1F  18
    ADC #$FC                     ; $DD20  69 FC
    STA $4D                      ; $DD22  85 4D
    LDA $57                      ; $DD24  A5 57
    ADC #$00                     ; $DD26  69 00
    STA $4F                      ; $DD28  85 4F

loc_3E_DD2A:
    LDA $59                      ; $DD2A  A5 59
    STA $50                      ; $DD2C  85 50
    LDA $58                      ; $DD2E  A5 58
    STA $4E                      ; $DD30  85 4E
    JSR sub_3E_D8AB              ; $DD32  20 AB D8
    JSR sub_3E_D900              ; $DD35  20 00 D9
    JSR sub_3E_D31E              ; $DD38  20 1E D3

loc_3E_DD3B:
    PLA                          ; $DD3B  68
    TAX                          ; $DD3C  AA
    RTS                          ; $DD3D  60

    TXA                          ; $DD3E  8A
    PHA                          ; $DD3F  48
    LDA $56                      ; $DD40  A5 56
    CLC                          ; $DD42  18
    ADC #$04                     ; $DD43  69 04
    AND #$08                     ; $DD45  29 08
    STA $00                      ; $DD47  85 00
    LDA $56                      ; $DD49  A5 56
    SEC                          ; $DD4B  38
    SBC $EB                      ; $DD4C  E5 EB
    STA $56                      ; $DD4E  85 56
    LDA $57                      ; $DD50  A5 57
    SBC $EC                      ; $DD52  E5 EC
    STA $57                      ; $DD54  85 57
    LDA $71                      ; $DD56  A5 71
    AND #$02                     ; $DD58  29 02
    BNE loc_3E_DD6D              ; $DD5A  D0 11
    LDA $56                      ; $DD5C  A5 56
    CMP #$F0                     ; $DD5E  C9 F0
    BCC loc_3E_DD6D              ; $DD60  90 0B
    INC $57                      ; $DD62  E6 57
    LDA #$00                     ; $DD64  A9 00
    STA $56                      ; $DD66  85 56
    STA $F7                      ; $DD68  85 F7
    PLA                          ; $DD6A  68
    TAX                          ; $DD6B  AA
    RTS                          ; $DD6C  60


loc_3E_DD6D:
    LDA #$02                     ; $DD6D  A9 02
    STA $70                      ; $DD6F  85 70
    LDA $56                      ; $DD71  A5 56
    STA $F7                      ; $DD73  85 F7
    CLC                          ; $DD75  18
    ADC #$04                     ; $DD76  69 04
    AND #$08                     ; $DD78  29 08
    CMP $00                      ; $DD7A  C5 00
    BEQ loc_3E_DD3B              ; $DD7C  F0 BD
    LDA $56                      ; $DD7E  A5 56
    CLC                          ; $DD80  18
    ADC #$0C                     ; $DD81  69 0C
    STA $4D                      ; $DD83  85 4D
    LDA $57                      ; $DD85  A5 57
    ADC #$00                     ; $DD87  69 00
    STA $4F                      ; $DD89  85 4F
    JMP loc_3E_DD2A              ; $DD8B  4C 2A DD

    TXA                          ; $DD8E  8A
    PHA                          ; $DD8F  48
    LDA $58                      ; $DD90  A5 58
    AND #$08                     ; $DD92  29 08
    STA $00                      ; $DD94  85 00
    LDA $58                      ; $DD96  A5 58
    CLC                          ; $DD98  18
    ADC $ED                      ; $DD99  65 ED
    CMP #$F0                     ; $DD9B  C9 F0
    BCC loc_3E_DDA1              ; $DD9D  90 02
    SBC #$F0                     ; $DD9F  E9 F0

loc_3E_DDA1:
    STA $58                      ; $DDA1  85 58
    STA $F9                      ; $DDA3  85 F9
    STA $4E                      ; $DDA5  85 4E
    LDA $58                      ; $DDA7  A5 58
    AND #$08                     ; $DDA9  29 08
    CMP $00                      ; $DDAB  C5 00
    BEQ loc_3E_DDCB              ; $DDAD  F0 1C
    LDX $59                      ; $DDAF  A6 59
    STX $50                      ; $DDB1  86 50

loc_3E_DDB3:
    LDA $56                      ; $DDB3  A5 56
    CLC                          ; $DDB5  18
    ADC #$07                     ; $DDB6  69 07
    AND #$F8                     ; $DDB8  29 F8
    STA $4D                      ; $DDBA  85 4D
    LDA $57                      ; $DDBC  A5 57
    ADC #$00                     ; $DDBE  69 00
    STA $4F                      ; $DDC0  85 4F
    JSR sub_3E_D8AB              ; $DDC2  20 AB D8
    JSR sub_3E_D900              ; $DDC5  20 00 D9
    JSR sub_3E_D1FB              ; $DDC8  20 FB D1

loc_3E_DDCB:
    PLA                          ; $DDCB  68
    TAX                          ; $DDCC  AA
    RTS                          ; $DDCD  60

    TXA                          ; $DDCE  8A
    PHA                          ; $DDCF  48
    LDA $58                      ; $DDD0  A5 58
    AND #$08                     ; $DDD2  29 08
    STA $00                      ; $DDD4  85 00
    LDA $58                      ; $DDD6  A5 58
    CLC                          ; $DDD8  18
    ADC $ED                      ; $DDD9  65 ED
    CMP #$F0                     ; $DDDB  C9 F0
    BCC loc_3E_DDE3              ; $DDDD  90 04
    AND #$0F                     ; $DDDF  29 0F
    ORA #$E0                     ; $DDE1  09 E0

loc_3E_DDE3:
    STA $58                      ; $DDE3  85 58
    STA $F9                      ; $DDE5  85 F9
    STA $4E                      ; $DDE7  85 4E
    LDA $58                      ; $DDE9  A5 58
    AND #$08                     ; $DDEB  29 08
    CMP $00                      ; $DDED  C5 00
    BEQ loc_3E_DDCB              ; $DDEF  F0 DA
    LDX $59                      ; $DDF1  A6 59
    STX $50                      ; $DDF3  86 50
    JMP loc_3E_DDB3              ; $DDF5  4C B3 DD


sub_3E_DDF8:
    LDA $13                      ; $DDF8  A5 13
    STA $80                      ; $DDFA  85 80
    JSR sub_3E_DB94              ; $DDFC  20 94 DB
    LDA $56                      ; $DDFF  A5 56
    CLC                          ; $DE01  18
    ADC #$04                     ; $DE02  69 04
    STA $4D                      ; $DE04  85 4D
    LDA $57                      ; $DE06  A5 57
    ADC #$00                     ; $DE08  69 00
    STA $4F                      ; $DE0A  85 4F
    LDA $04CB,X                  ; $DE0C  BD CB 04
    AND #$F0                     ; $DE0F  29 F0
    STA $4E                      ; $DE11  85 4E
    LDA $59                      ; $DE13  A5 59
    STA $50                      ; $DE15  85 50
    LDX #$04                     ; $DE17  A2 04
    JSR sub_3E_C5C7              ; $DE19  20 C7 C5
    JSR sub_3E_D8AB              ; $DE1C  20 AB D8
    JSR sub_3E_D900              ; $DE1F  20 00 D9
    JSR sub_3E_D1FB              ; $DE22  20 FB D1
    LDA #$01                     ; $DE25  A9 01
    STA $FB                      ; $DE27  85 FB
    JSR sub_3E_C62B              ; $DE29  20 2B C6
    LDA $56                      ; $DE2C  A5 56
    CLC                          ; $DE2E  18
    ADC #$04                     ; $DE2F  69 04
    STA $4D                      ; $DE31  85 4D
    LDA $57                      ; $DE33  A5 57
    ADC #$00                     ; $DE35  69 00
    STA $4F                      ; $DE37  85 4F
    LDX $8F                      ; $DE39  A6 8F
    LDA $04CB,X                  ; $DE3B  BD CB 04
    AND #$F0                     ; $DE3E  29 F0
    ORA #$08                     ; $DE40  09 08
    STA $4E                      ; $DE42  85 4E
    LDA $59                      ; $DE44  A5 59
    STA $50                      ; $DE46  85 50
    JSR sub_3E_D8AB              ; $DE48  20 AB D8
    JSR sub_3E_D900              ; $DE4B  20 00 D9
    JSR sub_3E_D1FB              ; $DE4E  20 FB D1
    LDA #$01                     ; $DE51  A9 01
    STA $FB                      ; $DE53  85 FB
    JSR sub_3E_C62B              ; $DE55  20 2B C6
    RTS                          ; $DE58  60

    .byte $20,$A3,$DE,$A9,$02,$8D,$AD,$06,$A2,$0F,$20,$59,$CA,$20,$59,$CA  ; $DE59
    .byte $20,$59,$CA,$20,$59,$CA,$A9,$08,$20,$F6,$C5,$CE,$AD,$06,$D0,$E8  ; $DE69
    .byte $60,$A9,$30,$85,$49,$A9,$04,$8D,$AD,$06,$A2,$0F,$20,$71,$CA,$20  ; $DE79
    .byte $71,$CA,$20,$71,$CA,$20,$71,$CA,$A9,$08,$20,$F6,$C5,$A5,$49,$38  ; $DE89
    .byte $E9,$10,$85,$49,$CE,$AD,$06,$D0,$E1,$60  ; $DE99

sub_3E_DEA3:
    LDX #$1F                     ; $DEA3  A2 1F

loc_3E_DEA5:
    LDA $0360,X                  ; $DEA5  BD 60 03
    STA $0380,X                  ; $DEA8  9D 80 03
    DEX                          ; $DEAB  CA
    BPL loc_3E_DEA5              ; $DEAC  10 F7
    RTS                          ; $DEAE  60


sub_3E_DEAF:
    LDX #$1F                     ; $DEAF  A2 1F

loc_3E_DEB1:
    LDA $0380,X                  ; $DEB1  BD 80 03
    STA $0360,X                  ; $DEB4  9D 60 03
    DEX                          ; $DEB7  CA
    BPL loc_3E_DEB1              ; $DEB8  10 F7
    INC $46                      ; $DEBA  E6 46
    RTS                          ; $DEBC  60


sub_3E_DEBD:
    LDX #$02                     ; $DEBD  A2 02

loc_3E_DEBF:
    LDA $21,X                    ; $DEBF  B5 21
    ORA #$80                     ; $DEC1  09 80
    STA $21,X                    ; $DEC3  95 21
    DEX                          ; $DEC5  CA
    BNE loc_3E_DEBF              ; $DEC6  D0 F7
    RTS                          ; $DEC8  60

    .byte $A5,$42,$48,$20,$BD,$DE,$A9,$58,$85,$DC,$20,$A3,$DE,$20,$EE,$DE  ; $DEC9
    .byte $20,$EE,$DE,$20,$EE,$DE,$20,$EE,$DE,$20,$EE,$DE,$20,$EE,$DE,$68  ; $DED9
    .byte $85,$42,$4C,$11,$DF,$A0,$0F,$B9,$60,$03,$C9,$0F,$F0,$05,$A9,$30  ; $DEE9
    .byte $99,$60,$03,$88,$10,$F1,$E6,$46,$A9,$02,$20,$F6,$C5,$20,$AF,$DE  ; $DEF9
    .byte $E6,$46,$A9,$02,$20,$F6,$C5,$60  ; $DF09

loc_3E_DF11:
    LDX #$03                     ; $DF11  A2 03

loc_3E_DF13:
    LDA $21,X                    ; $DF13  B5 21
    AND #$7F                     ; $DF15  29 7F
    STA $21,X                    ; $DF17  95 21
    DEX                          ; $DF19  CA
    BNE loc_3E_DF13              ; $DF1A  D0 F7
    RTS                          ; $DF1C  60

    .byte $F0,$0F,$CC,$33,$32,$32,$32,$32,$33,$33,$33,$33,$26,$26,$26,$26  ; $DF1D
    .byte $27,$27,$27,$27,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $DF2D
    .byte $00,$00,$00,$00,$A0,$A8,$B0,$B8,$A0,$A8,$B0,$B8,$A0,$A8,$B0,$B8  ; $DF3D
    .byte $A0,$A8,$B0,$B8,$2E,$2C,$2E,$2F,$2E,$2C,$2D,$2D,$2C,$2F,$2F,$2B  ; $DF4D
    .byte $2A,$2A,$2A,$2B,$80,$80,$92,$80,$89,$89,$80,$89,$92,$89,$92,$80  ; $DF5D
    .byte $80,$89,$92,$89,$85,$85,$97,$85,$8E,$8E,$85,$8E,$97,$8E,$97,$85  ; $DF6D
    .byte $85,$8E,$97,$8E,$82,$83,$90,$86,$97,$94,$9E,$AA,$9D,$A4,$B1,$C3  ; $DF7D
    .byte $89,$A2,$A2,$BA,$15,$17,$32,$1E,$57,$50,$74,$A6,$68,$88,$AB,$C8  ; $DF8D
    .byte $7C,$89,$96,$18,$01,$00,$04,$03,$02,$06,$07,$05,$09,$09,$09,$09  ; $DF9D
    .byte $0B,$0B,$0B,$0B,$01,$02,$04,$08,$10,$20,$40,$80,$A9,$2A,$20,$A4  ; $DFAD
    .byte $CA,$20,$2B,$C6,$A9,$3A,$85,$DC,$20,$24,$E0,$A2,$00,$A0,$66,$20  ; $DFBD
    .byte $22,$E5,$A9,$00,$9D,$0D,$06,$A9,$FE,$9D,$24,$06,$20,$05,$E0,$A9  ; $DFCD
    .byte $00,$85,$EB,$85,$ED,$A2,$00,$A0,$02,$20,$C9,$EE,$20,$D3,$E4,$AD  ; $DFDD
    .byte $CB,$04,$C9,$08,$B0,$E6,$20,$1B,$E0,$20,$05,$E0,$20,$12,$E0,$A9  ; $DFED
    .byte $00,$8D,$B1  ; $DFFD
