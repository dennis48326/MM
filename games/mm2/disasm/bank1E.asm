; PRG 8 KB bank $1E at $C000
.segment "BANK1E"
.org $C000


sub_1E_C000:
    STA $29                      ; $C000  85 29
    STA $69                      ; $C002  85 69
    INC $68                      ; $C004  E6 68
    STA $FFF0                    ; $C006  8D F0 FF
    LSR A                        ; $C009  4A
    STA $FFF0                    ; $C00A  8D F0 FF
    LSR A                        ; $C00D  4A
    STA $FFF0                    ; $C00E  8D F0 FF
    LSR A                        ; $C011  4A
    STA $FFF0                    ; $C012  8D F0 FF
    LSR A                        ; $C015  4A
    STA $FFF0                    ; $C016  8D F0 FF
    LDA #$00                     ; $C019  A9 00
    STA $68                      ; $C01B  85 68
    LDA $67                      ; $C01D  A5 67
    BNE loc_1E_C022              ; $C01F  D0 01
    RTS                          ; $C021  60


loc_1E_C022:
    LDA #$0C                     ; $C022  A9 0C
    STA $FFF0                    ; $C024  8D F0 FF
    LSR A                        ; $C027  4A
    STA $FFF0                    ; $C028  8D F0 FF
    LSR A                        ; $C02B  4A
    STA $FFF0                    ; $C02C  8D F0 FF
    LSR A                        ; $C02F  4A
    STA $FFF0                    ; $C030  8D F0 FF
    LSR A                        ; $C033  4A
    STA $FFF0                    ; $C034  8D F0 FF
    JSR $8000                    ; $C037  20 00 80

loc_1E_C03A:
    LDX $66                      ; $C03A  A6 66
    BEQ loc_1E_C048              ; $C03C  F0 0A
    LDA $057F,X                  ; $C03E  BD 7F 05
    JSR $8003                    ; $C041  20 03 80
    DEC $66                      ; $C044  C6 66
    BNE loc_1E_C03A              ; $C046  D0 F2

loc_1E_C048:
    LDA #$00                     ; $C048  A9 00
    STA $67                      ; $C04A  85 67
    LDA $69                      ; $C04C  A5 69
    JMP sub_1E_C000              ; $C04E  4C 00 C0


sub_1E_C051:
    LDY $66                      ; $C051  A4 66
    CPY #$10                     ; $C053  C0 10
    BCS loc_1E_C05C              ; $C055  B0 05
    STA $0580,Y                  ; $C057  99 80 05
    INC $66                      ; $C05A  E6 66

loc_1E_C05C:
    RTS                          ; $C05C  60


sub_1E_C05D:
    STA $9FFF                    ; $C05D  8D FF 9F
    LSR A                        ; $C060  4A
    STA $9FFF                    ; $C061  8D FF 9F
    LSR A                        ; $C064  4A
    STA $9FFF                    ; $C065  8D FF 9F
    LSR A                        ; $C068  4A
    STA $9FFF                    ; $C069  8D FF 9F
    LSR A                        ; $C06C  4A
    STA $9FFF                    ; $C06D  8D FF 9F
    RTS                          ; $C070  60


sub_1E_C071:
    LDA #$0D                     ; $C071  A9 0D
    JSR sub_1E_C000              ; $C073  20 00 C0
    JSR $8006                    ; $C076  20 06 80
    LDA #$0E                     ; $C079  A9 0E
    JSR sub_1E_C000              ; $C07B  20 00 C0
    RTS                          ; $C07E  60


sub_1E_C07F:
    LDA $23                      ; $C07F  A5 23
    STA $25                      ; $C081  85 25
    LDA $24                      ; $C083  A5 24
    STA $26                      ; $C085  85 26
    JSR sub_1E_C427              ; $C087  20 27 C4
    LDA #$00                     ; $C08A  A9 00
    STA $1D                      ; $C08C  85 1D

loc_1E_C08E:
    LDA $1D                      ; $C08E  A5 1D
    BEQ loc_1E_C08E              ; $C090  F0 FC
    JSR sub_1E_D0D7              ; $C092  20 D7 D0
    LDA $23                      ; $C095  A5 23
    EOR $25                      ; $C097  45 25
    AND $23                      ; $C099  25 23
    STA $27                      ; $C09B  85 27
    LDA $24                      ; $C09D  A5 24
    EOR $26                      ; $C09F  45 26
    AND $24                      ; $C0A1  25 24
    STA $28                      ; $C0A3  85 28
    LDA #$0E                     ; $C0A5  A9 0E
    JSR sub_1E_C000              ; $C0A7  20 00 C0
    RTS                          ; $C0AA  60


sub_1E_C0AB:
    LDA $23                      ; $C0AB  A5 23
    STA $25                      ; $C0AD  85 25
    LDA $24                      ; $C0AF  A5 24
    STA $26                      ; $C0B1  85 26
    JSR sub_1E_C427              ; $C0B3  20 27 C4
    LDA #$00                     ; $C0B6  A9 00
    STA $1D                      ; $C0B8  85 1D

loc_1E_C0BA:
    LDA $1D                      ; $C0BA  A5 1D
    BEQ loc_1E_C0BA              ; $C0BC  F0 FC
    JSR sub_1E_D0D7              ; $C0BE  20 D7 D0
    LDA $23                      ; $C0C1  A5 23
    EOR $25                      ; $C0C3  45 25
    AND $23                      ; $C0C5  25 23
    STA $27                      ; $C0C7  85 27
    LDA $24                      ; $C0C9  A5 24
    EOR $26                      ; $C0CB  45 26
    AND $24                      ; $C0CD  25 24
    STA $28                      ; $C0CF  85 28
    LDA #$0D                     ; $C0D1  A9 0D
    JSR sub_1E_C000              ; $C0D3  20 00 C0
    RTS                          ; $C0D6  60


sub_1E_C0D7:
    LDA $23                      ; $C0D7  A5 23
    PHA                          ; $C0D9  48
    LDA $24                      ; $C0DA  A5 24
    PHA                          ; $C0DC  48
    LDA $27                      ; $C0DD  A5 27
    PHA                          ; $C0DF  48
    LDA #$1E                     ; $C0E0  A9 1E
    ORA $F8                      ; $C0E2  05 F8
    STA $F8                      ; $C0E4  85 F8
    STA $2001                    ; $C0E6  8D 01 20
    LDA #$00                     ; $C0E9  A9 00
    STA $1D                      ; $C0EB  85 1D

loc_1E_C0ED:
    LDA $1D                      ; $C0ED  A5 1D
    BEQ loc_1E_C0ED              ; $C0EF  F0 FC
    PLA                          ; $C0F1  68
    STA $27                      ; $C0F2  85 27
    PLA                          ; $C0F4  68
    STA $24                      ; $C0F5  85 24
    PLA                          ; $C0F7  68
    STA $23                      ; $C0F8  85 23
    LDA #$0E                     ; $C0FA  A9 0E
    JSR sub_1E_C000              ; $C0FC  20 00 C0
    RTS                          ; $C0FF  60

    .byte $48,$20,$7F,$C0,$68,$38,$E9,$01,$D0,$F6,$60  ; $C100

loc_1E_C10B:
    LDA #$41                     ; $C10B  A9 41
    JSR sub_1E_C051              ; $C10D  20 51 C0
    LDA #$FF                     ; $C110  A9 FF
    JSR sub_1E_C051              ; $C112  20 51 C0
    LDA $2C                      ; $C115  A5 2C
    BNE loc_1E_C17E              ; $C117  D0 65
    STA $36                      ; $C119  85 36

loc_1E_C11B:
    AND #$01                     ; $C11B  29 01
    BNE loc_1E_C166              ; $C11D  D0 47
    LDA $36                      ; $C11F  A5 36
    AND #$07                     ; $C121  29 07
    TAX                          ; $C123  AA
    LDY #$01                     ; $C124  A0 01

loc_1E_C126:
    LDA #$25                     ; $C126  A9 25
    STA $040E,Y                  ; $C128  99 0E 04
    LDA #$80                     ; $C12B  A9 80
    STA $042E,Y                  ; $C12D  99 2E 04
    CLC                          ; $C130  18
    LDA $0460                    ; $C131  AD 60 04
    ADC $C1E0,X                  ; $C134  7D E0 C1
    STA $046E,Y                  ; $C137  99 6E 04
    LDA $0440                    ; $C13A  AD 40 04
    ADC $C1E8,X                  ; $C13D  7D E8 C1
    STA $044E,Y                  ; $C140  99 4E 04
    LDA $04A0                    ; $C143  AD A0 04
    ADC $C1D8,X                  ; $C146  7D D8 C1
    STA $04AE,Y                  ; $C149  99 AE 04
    LDA #$01                     ; $C14C  A9 01
    STA $06AE,Y                  ; $C14E  99 AE 06
    LDA #$00                     ; $C151  A9 00
    STA $062E,Y                  ; $C153  99 2E 06
    STA $060E,Y                  ; $C156  99 0E 06
    STA $066E,Y                  ; $C159  99 6E 06
    STA $064E,Y                  ; $C15C  99 4E 06
    STA $068E,Y                  ; $C15F  99 8E 06
    INX                          ; $C162  E8
    DEY                          ; $C163  88
    BPL loc_1E_C126              ; $C164  10 C0

loc_1E_C166:
    JSR sub_1E_C352              ; $C166  20 52 C3
    INC $36                      ; $C169  E6 36
    LDA $36                      ; $C16B  A5 36
    CMP #$10                     ; $C16D  C9 10
    BCC loc_1E_C11B              ; $C16F  90 AA
    LSR $042E                    ; $C171  4E 2E 04
    LSR $042F                    ; $C174  4E 2F 04
    JSR sub_1E_C393              ; $C177  20 93 C3
    LDA #$A0                     ; $C17A  A9 A0
    BNE loc_1E_C180              ; $C17C  D0 02

loc_1E_C17E:
    LDA #$E0                     ; $C17E  A9 E0

loc_1E_C180:
    STA $36                      ; $C180  85 36

loc_1E_C182:
    LSR $0420                    ; $C182  4E 20 04
    JSR sub_1E_C352              ; $C185  20 52 C3
    DEC $36                      ; $C188  C6 36
    BNE loc_1E_C182              ; $C18A  D0 F6
    LDA #$10                     ; $C18C  A9 10
    STA $2000                    ; $C18E  8D 00 20
    LDA #$06                     ; $C191  A9 06
    STA $2001                    ; $C193  8D 01 20
    LDA $2A                      ; $C196  A5 2A
    AND #$07                     ; $C198  29 07
    JSR sub_1E_C000              ; $C19A  20 00 C0
    LDX #$00                     ; $C19D  A2 00
    LDA $0440                    ; $C19F  AD 40 04

loc_1E_C1A2:
    CMP $BB07,X                  ; $C1A2  DD 07 BB
    BCC loc_1E_C1AC              ; $C1A5  90 05
    INX                          ; $C1A7  E8
    CPX #$05                     ; $C1A8  E0 05
    BNE loc_1E_C1A2              ; $C1AA  D0 F6

loc_1E_C1AC:
    STX $B0                      ; $C1AC  86 B0
    LDX #$FF                     ; $C1AE  A2 FF
    TXS                          ; $C1B0  9A
    LDA #$0E                     ; $C1B1  A9 0E
    JSR sub_1E_C000              ; $C1B3  20 00 C0
    DEC $A8                      ; $C1B6  C6 A8
    BNE loc_1E_C1D5              ; $C1B8  D0 1B
    LDA #$00                     ; $C1BA  A9 00
    STA $A7                      ; $C1BC  85 A7
    LDA #$0D                     ; $C1BE  A9 0D
    JSR sub_1E_C000              ; $C1C0  20 00 C0
    JSR $800C                    ; $C1C3  20 0C 80
    LDA #$0E                     ; $C1C6  A9 0E
    JSR sub_1E_C000              ; $C1C8  20 00 C0
    LDA $FD                      ; $C1CB  A5 FD
    BNE loc_1E_C1D2              ; $C1CD  D0 03
    JMP $8088                    ; $C1CF  4C 88 80


loc_1E_C1D2:
    JMP $8072                    ; $C1D2  4C 72 80


loc_1E_C1D5:
    JMP $80AB                    ; $C1D5  4C AB 80

    .byte $F8,$08,$FB,$05,$00,$00,$05,$FB,$00,$00,$FB,$05,$FB,$08,$FB,$05  ; $C1D8
    .byte $00,$00,$FF,$00,$FF,$00,$FF,$00  ; $C1E8

loc_1E_C1F0:
    JSR sub_1E_C289              ; $C1F0  20 89 C2
    INC $BD                      ; $C1F3  E6 BD

loc_1E_C1F5:
    JSR sub_1E_C819              ; $C1F5  20 19 C8
    LDA $2A                      ; $C1F8  A5 2A
    CMP #$08                     ; $C1FA  C9 08
    BNE loc_1E_C20F              ; $C1FC  D0 11
    LDA $37                      ; $C1FE  A5 37
    CMP #$03                     ; $C200  C9 03
    BNE loc_1E_C20F              ; $C202  D0 0B
    LDA #$00                     ; $C204  A9 00
    STA $BD                      ; $C206  85 BD
    LDA #$01                     ; $C208  A9 01
    STA $2C                      ; $C20A  85 2C
    JMP loc_1E_C10B              ; $C20C  4C 0B C1


loc_1E_C20F:
    LDA $B1                      ; $C20F  A5 B1
    CMP #$FF                     ; $C211  C9 FF
    BNE loc_1E_C1F5              ; $C213  D0 E0
    LDA #$00                     ; $C215  A9 00
    STA $BD                      ; $C217  85 BD
    LDA #$10                     ; $C219  A9 10
    STA $F7                      ; $C21B  85 F7
    STA $2000                    ; $C21D  8D 00 20
    LDA #$06                     ; $C220  A9 06
    STA $F8                      ; $C222  85 F8
    STA $2001                    ; $C224  8D 01 20
    LDA #$00                     ; $C227  A9 00
    STA $B0                      ; $C229  85 B0
    LDX #$FF                     ; $C22B  A2 FF
    TXS                          ; $C22D  9A
    LDA #$0E                     ; $C22E  A9 0E
    JSR sub_1E_C000              ; $C230  20 00 C0
    LDX $2A                      ; $C233  A6 2A
    CPX #$08                     ; $C235  E0 08
    BCS loc_1E_C261              ; $C237  B0 28
    LDA $C279,X                  ; $C239  BD 79 C2
    ORA $9A                      ; $C23C  05 9A
    STA $9A                      ; $C23E  85 9A
    LDA $C281,X                  ; $C240  BD 81 C2
    ORA $9B                      ; $C243  05 9B
    STA $9B                      ; $C245  85 9B
    LDA #$0D                     ; $C247  A9 0D
    JSR sub_1E_C000              ; $C249  20 00 C0
    JSR $8012                    ; $C24C  20 12 80
    LDA #$0E                     ; $C24F  A9 0E
    JSR sub_1E_C000              ; $C251  20 00 C0
    LDA $9A                      ; $C254  A5 9A
    CMP #$FF                     ; $C256  C9 FF
    BEQ loc_1E_C25D              ; $C258  F0 03
    JMP $8076                    ; $C25A  4C 76 80


loc_1E_C25D:
    LDA #$07                     ; $C25D  A9 07
    STA $2A                      ; $C25F  85 2A

loc_1E_C261:
    INC $2A                      ; $C261  E6 2A
    LDA $2A                      ; $C263  A5 2A
    CMP #$0E                     ; $C265  C9 0E
    BNE loc_1E_C276              ; $C267  D0 0D
    LDA #$0D                     ; $C269  A9 0D
    JSR sub_1E_C000              ; $C26B  20 00 C0
    JSR $800F                    ; $C26E  20 0F 80
    LDA #$0E                     ; $C271  A9 0E
    JMP loc_1F_F2D1              ; $C273  4C D1 F2


loc_1E_C276:
    JMP $8079                    ; $C276  4C 79 80

    .byte $01,$02,$04,$08,$10,$20,$40,$80,$01,$02,$00,$00,$00,$04,$00,$00  ; $C279

sub_1E_C289:
    LDA #$00                     ; $C289  A9 00
    STA $05AA                    ; $C28B  8D AA 05
    STA $05A7                    ; $C28E  8D A7 05
    STA $05A9                    ; $C291  8D A9 05
    STA $05A8                    ; $C294  8D A8 05
    STA $AA                      ; $C297  85 AA
    LDA #$FE                     ; $C299  A9 FE
    STA $B1                      ; $C29B  85 B1
    RTS                          ; $C29D  60

    .byte $A9,$00,$85,$FD,$A9,$02,$8D,$54,$03,$A9,$04,$8D,$55,$03,$A9,$BB  ; $C29E
    .byte $85,$FD,$20,$86,$C3,$C6,$FD,$D0,$F9,$A9,$00,$8D,$55,$03,$8D,$54  ; $C2AE
    .byte $03,$A2,$02,$BD,$21,$C3,$9D,$57,$03,$CA,$10,$F7,$A9,$86,$85,$FF  ; $C2BE
    .byte $A9,$00,$85,$FE,$A9,$09,$20,$00,$C0,$A5,$FD,$4A,$AA,$BD,$24,$C3  ; $C2CE
    .byte $8D,$B6,$03,$BD,$3B,$C3,$8D,$B7,$03,$A5,$FD,$29,$01,$F0,$08,$AD  ; $C2DE
    .byte $B7,$03,$09,$20,$8D,$B7,$03,$A0,$20,$B1,$FE,$99,$B8,$03,$88,$10  ; $C2EE
    .byte $F8,$A9,$20,$85,$47,$18,$A5,$FE,$69,$20,$85,$FE,$A5,$FF,$69,$00  ; $C2FE
    .byte $85,$FF,$20,$86,$C3,$E6,$FD,$A5,$FD,$C9,$2E,$D0,$B7,$A9,$0E,$20  ; $C30E
    .byte $00,$C0,$60,$28,$18,$2C,$10,$1A,$1A,$1B,$1B,$1B,$1B,$1C,$1C,$1C  ; $C31E
    .byte $1C,$1D,$1D,$1D,$1D,$1E,$1E,$1E,$1E,$1F,$1F,$1F,$1F,$00,$80,$C0  ; $C32E
    .byte $00,$40,$80,$C0,$00,$40,$80,$C0,$00,$40,$80,$C0,$00,$40,$80,$C0  ; $C33E
    .byte $00,$40,$80,$C0  ; $C34E

sub_1E_C352:
    LDA #$0E                     ; $C352  A9 0E
    JSR sub_1E_C000              ; $C354  20 00 C0
    LDA #$00                     ; $C357  A9 00
    STA $0680                    ; $C359  8D 80 06
    LDA #$01                     ; $C35C  A9 01
    STA $4B                      ; $C35E  85 4B
    JSR sub_1E_DCD0              ; $C360  20 D0 DC
    JSR sub_1E_D658              ; $C363  20 58 D6
    JSR sub_1E_C5A9              ; $C366  20 A9 C5
    JSR $925B                    ; $C369  20 5B 92
    JSR sub_1E_CC77              ; $C36C  20 77 CC
    LDA $FB                      ; $C36F  A5 FB
    BEQ loc_1E_C382              ; $C371  F0 0F
    INC $FC                      ; $C373  E6 FC
    CMP $FC                      ; $C375  C5 FC
    BEQ loc_1E_C37B              ; $C377  F0 02
    BCS loc_1E_C382              ; $C379  B0 07

loc_1E_C37B:
    JSR sub_1E_C0D7              ; $C37B  20 D7 C0
    LDA #$00                     ; $C37E  A9 00
    STA $FC                      ; $C380  85 FC

loc_1E_C382:
    JSR sub_1E_C07F              ; $C382  20 7F C0
    RTS                          ; $C385  60

    .byte $A2,$1F,$A9,$00,$9D,$80,$06,$CA,$10,$FA,$4C,$6C,$C3  ; $C386

sub_1E_C393:
    LDA $0440                    ; $C393  AD 40 04
    STA $09                      ; $C396  85 09
    LDA $0460                    ; $C398  AD 60 04
    STA $08                      ; $C39B  85 08
    LDA $04A0                    ; $C39D  AD A0 04
    STA $0A                      ; $C3A0  85 0A
    LDA #$25                     ; $C3A2  A9 25
    STA $0B                      ; $C3A4  85 0B
    LDX #$0D                     ; $C3A6  A2 0D
    LDY #$0B                     ; $C3A8  A0 0B

loc_1E_C3AA:
    LDA #$80                     ; $C3AA  A9 80
    ORA $C41B,Y                  ; $C3AC  19 1B C4
    STA $0420,X                  ; $C3AF  9D 20 04
    LDA $0B                      ; $C3B2  A5 0B
    STA $0400,X                  ; $C3B4  9D 00 04
    LDA $09                      ; $C3B7  A5 09
    STA $0440,X                  ; $C3B9  9D 40 04
    LDA $08                      ; $C3BC  A5 08
    STA $0460,X                  ; $C3BE  9D 60 04
    LDA $0A                      ; $C3C1  A5 0A
    STA $04A0,X                  ; $C3C3  9D A0 04
    LDA $C3EB,Y                  ; $C3C6  B9 EB C3
    STA $0620,X                  ; $C3C9  9D 20 06
    LDA $C3F7,Y                  ; $C3CC  B9 F7 C3
    STA $0600,X                  ; $C3CF  9D 00 06
    LDA $C403,Y                  ; $C3D2  B9 03 C4
    STA $0660,X                  ; $C3D5  9D 60 06
    LDA $C40F,Y                  ; $C3D8  B9 0F C4
    STA $0640,X                  ; $C3DB  9D 40 06
    LDA #$00                     ; $C3DE  A9 00
    STA $0680,X                  ; $C3E0  9D 80 06
    STA $06A0,X                  ; $C3E3  9D A0 06
    DEX                          ; $C3E6  CA
    DEY                          ; $C3E7  88
    BPL loc_1E_C3AA              ; $C3E8  10 C0
    RTS                          ; $C3EA  60

    .byte $00,$00,$00,$00,$60,$60,$60,$60,$00,$C0,$00,$E0,$00,$02,$00,$02  ; $C3EB
    .byte $01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$60,$A0,$A0,$60  ; $C3FB
    .byte $C0,$00,$40,$00,$02,$00,$FE,$00,$01,$FE,$FE,$01,$00,$00,$FF,$00  ; $C40B
    .byte $00,$40,$00,$00,$40,$40,$00,$00,$00,$40,$00,$00  ; $C41B

sub_1E_C427:
    LDA $AA                      ; $C427  A5 AA
    BNE loc_1E_C45C              ; $C429  D0 31
    LDA $0355                    ; $C42B  AD 55 03
    BEQ loc_1E_C45C              ; $C42E  F0 2C
    INC $44                      ; $C430  E6 44
    CMP $44                      ; $C432  C5 44
    BCS loc_1E_C45C              ; $C434  B0 26
    LDA #$00                     ; $C436  A9 00
    STA $44                      ; $C438  85 44
    INC $43                      ; $C43A  E6 43
    LDA $43                      ; $C43C  A5 43
    CMP $0354                    ; $C43E  CD 54 03
    BCC loc_1E_C447              ; $C441  90 04
    LDA #$00                     ; $C443  A9 00
    STA $43                      ; $C445  85 43

loc_1E_C447:
    ASL A                        ; $C447  0A
    ASL A                        ; $C448  0A
    ASL A                        ; $C449  0A
    ASL A                        ; $C44A  0A
    TAX                          ; $C44B  AA
    LDY #$00                     ; $C44C  A0 00

loc_1E_C44E:
    LDA $0376,X                  ; $C44E  BD 76 03
    STA $0356,Y                  ; $C451  99 56 03
    INX                          ; $C454  E8
    INY                          ; $C455  C8
    CPY #$10                     ; $C456  C0 10
    BNE loc_1E_C44E              ; $C458  D0 F4
    INC $3A                      ; $C45A  E6 3A

loc_1E_C45C:
    RTS                          ; $C45C  60


sub_1E_C45D:
    LDA $2A                      ; $C45D  A5 2A
    AND #$07                     ; $C45F  29 07
    JSR sub_1E_C000              ; $C461  20 00 C0
    LDA #$00                     ; $C464  A9 00
    STA $0A                      ; $C466  85 0A
    LDA #$BC                     ; $C468  A9 BC
    STA $0B                      ; $C46A  85 0B
    LDA $2A                      ; $C46C  A5 2A
    AND #$08                     ; $C46E  29 08
    BEQ loc_1E_C474              ; $C470  F0 02
    INC $0B                      ; $C472  E6 0B

loc_1E_C474:
    LDY #$00                     ; $C474  A0 00
    LDA ($0A),Y                  ; $C476  B1 0A
    STA $00                      ; $C478  85 00
    LDA #$00                     ; $C47A  A9 00
    STA $2006                    ; $C47C  8D 06 20
    STA $2006                    ; $C47F  8D 06 20
    STA $08                      ; $C482  85 08
    INY                          ; $C484  C8
    STY $01                      ; $C485  84 01

loc_1E_C487:
    LDY $01                      ; $C487  A4 01
    LDA ($0A),Y                  ; $C489  B1 0A
    STA $09                      ; $C48B  85 09
    INY                          ; $C48D  C8
    LDA ($0A),Y                  ; $C48E  B1 0A
    STA $02                      ; $C490  85 02
    INY                          ; $C492  C8
    LDA ($0A),Y                  ; $C493  B1 0A
    INY                          ; $C495  C8
    STY $01                      ; $C496  84 01
    JSR sub_1E_C000              ; $C498  20 00 C0

loc_1E_C49B:
    LDY #$00                     ; $C49B  A0 00

loc_1E_C49D:
    LDA ($08),Y                  ; $C49D  B1 08
    STA $2007                    ; $C49F  8D 07 20
    INY                          ; $C4A2  C8
    BNE loc_1E_C49D              ; $C4A3  D0 F8
    INC $09                      ; $C4A5  E6 09
    DEC $02                      ; $C4A7  C6 02
    BNE loc_1E_C49B              ; $C4A9  D0 F0
    LDA $2A                      ; $C4AB  A5 2A
    AND #$07                     ; $C4AD  29 07
    JSR sub_1E_C000              ; $C4AF  20 00 C0
    DEC $00                      ; $C4B2  C6 00
    BNE loc_1E_C487              ; $C4B4  D0 D1
    INC $0B                      ; $C4B6  E6 0B
    INC $0B                      ; $C4B8  E6 0B
    LDY #$61                     ; $C4BA  A0 61

loc_1E_C4BC:
    LDA ($0A),Y                  ; $C4BC  B1 0A
    STA $0354,Y                  ; $C4BE  99 54 03
    DEY                          ; $C4C1  88
    BPL loc_1E_C4BC              ; $C4C2  10 F8
    JSR sub_1E_D0F5              ; $C4C4  20 F5 D0
    LDA #$0E                     ; $C4C7  A9 0E
    JSR sub_1E_C000              ; $C4C9  20 00 C0
    RTS                          ; $C4CC  60


sub_1E_C4CD:
    LDA $2A                      ; $C4CD  A5 2A
    AND #$07                     ; $C4CF  29 07
    JSR sub_1E_C000              ; $C4D1  20 00 C0
    LDY $B0                      ; $C4D4  A4 B0
    LDA $BB06,Y                  ; $C4D6  B9 06 BB
    STA $20                      ; $C4D9  85 20
    STA $0440                    ; $C4DB  8D 40 04
    LDA $BB0C,Y                  ; $C4DE  B9 0C BB
    STA $48                      ; $C4E1  85 48
    STA $49                      ; $C4E3  85 49
    LDA $BB12,Y                  ; $C4E5  B9 12 BB
    STA $4C                      ; $C4E8  85 4C
    STA $4D                      ; $C4EA  85 4D
    LDA $BB18,Y                  ; $C4EC  B9 18 BB
    STA $17                      ; $C4EF  85 17
    LDA $BB1E,Y                  ; $C4F1  B9 1E BB
    STA $16                      ; $C4F4  85 16
    LDA $BB24,Y                  ; $C4F6  B9 24 BB
    STA $19                      ; $C4F9  85 19
    LDA $BB2A,Y                  ; $C4FB  B9 2A BB
    STA $18                      ; $C4FE  85 18
    LDA $BB30,Y                  ; $C500  B9 30 BB
    STA $38                      ; $C503  85 38
    LDA $BB36,Y                  ; $C505  B9 36 BB
    STA $14                      ; $C508  85 14
    LDA $BB3C,Y                  ; $C50A  B9 3C BB
    STA $15                      ; $C50D  85 15
    LDX $38                      ; $C50F  A6 38
    JSR sub_1E_CB64              ; $C511  20 64 CB
    TYA                          ; $C514  98
    CLC                          ; $C515  18
    ADC #$0B                     ; $C516  69 0B
    TAY                          ; $C518  A8
    LDX #$0C                     ; $C519  A2 0C

loc_1E_C51B:
    LDA $B460,Y                  ; $C51B  B9 60 B4
    PHA                          ; $C51E  48
    DEY                          ; $C51F  88
    DEX                          ; $C520  CA
    BNE loc_1E_C51B              ; $C521  D0 F8
    LDA #$0A                     ; $C523  A9 0A
    STA $2006                    ; $C525  8D 06 20
    LDA #$00                     ; $C528  A9 00
    STA $2006                    ; $C52A  8D 06 20
    STA $08                      ; $C52D  85 08
    LDA #$06                     ; $C52F  A9 06
    STA $00                      ; $C531  85 00

loc_1E_C533:
    PLA                          ; $C533  68
    STA $09                      ; $C534  85 09
    PLA                          ; $C536  68
    JSR sub_1E_C000              ; $C537  20 00 C0
    LDY #$00                     ; $C53A  A0 00

loc_1E_C53C:
    LDA ($08),Y                  ; $C53C  B1 08
    STA $2007                    ; $C53E  8D 07 20
    INY                          ; $C541  C8
    BNE loc_1E_C53C              ; $C542  D0 F8
    DEC $00                      ; $C544  C6 00
    BNE loc_1E_C533              ; $C546  D0 EB
    LDA #$0E                     ; $C548  A9 0E
    JSR sub_1E_C000              ; $C54A  20 00 C0
    LDA $B0                      ; $C54D  A5 B0
    CMP #$02                     ; $C54F  C9 02
    BNE loc_1E_C556              ; $C551  D0 03
    JSR $9115                    ; $C553  20 15 91

loc_1E_C556:
    RTS                          ; $C556  60


sub_1E_C557:
    LDA #$0D                     ; $C557  A9 0D
    JSR sub_1E_C000              ; $C559  20 00 C0
    JSR $8009                    ; $C55C  20 09 80
    LDA #$0E                     ; $C55F  A9 0E
    JSR sub_1E_C000              ; $C561  20 00 C0
    RTS                          ; $C564  60


sub_1E_C565:
    LDA #$0D                     ; $C565  A9 0D
    JSR sub_1E_C000              ; $C567  20 00 C0
    JSR $8000                    ; $C56A  20 00 80
    LDA #$0E                     ; $C56D  A9 0E
    JSR sub_1E_C000              ; $C56F  20 00 C0
    RTS                          ; $C572  60


sub_1E_C573:
    LDX #$0F                     ; $C573  A2 0F

loc_1E_C575:
    LDA $0420,X                  ; $C575  BD 20 04
    BMI loc_1E_C5A8              ; $C578  30 2E
    DEX                          ; $C57A  CA
    CPX #$01                     ; $C57B  E0 01
    BNE loc_1E_C575              ; $C57D  D0 F6
    LDA $47                      ; $C57F  A5 47
    BEQ loc_1E_C586              ; $C581  F0 03
    JSR sub_1E_C07F              ; $C583  20 7F C0

loc_1E_C586:
    LDA $03B6                    ; $C586  AD B6 03
    PHA                          ; $C589  48
    LDA $03B7                    ; $C58A  AD B7 03
    PHA                          ; $C58D  48
    LDA #$32                     ; $C58E  A9 32
    JSR sub_1E_C051              ; $C590  20 51 C0
    LDA #$0D                     ; $C593  A9 0D
    JSR sub_1E_C000              ; $C595  20 00 C0
    JSR $8003                    ; $C598  20 03 80
    PLA                          ; $C59B  68
    STA $03B7                    ; $C59C  8D B7 03
    PLA                          ; $C59F  68
    STA $03B6                    ; $C5A0  8D B6 03
    LDA #$0E                     ; $C5A3  A9 0E
    JSR sub_1E_C000              ; $C5A5  20 00 C0

loc_1E_C5A8:
    RTS                          ; $C5A8  60


sub_1E_C5A9:
    LDA $B1                      ; $C5A9  A5 B1
    BEQ loc_1E_C5F0              ; $C5AB  F0 43
    LDA #$0B                     ; $C5AD  A9 0B
    JSR sub_1E_C000              ; $C5AF  20 00 C0
    JSR $8003                    ; $C5B2  20 03 80
    LDA #$0E                     ; $C5B5  A9 0E
    JSR sub_1E_C000              ; $C5B7  20 00 C0
    LDA $05AA                    ; $C5BA  AD AA 05
    BEQ loc_1E_C5F0              ; $C5BD  F0 31
    LDA $2A                      ; $C5BF  A5 2A
    CMP #$0C                     ; $C5C1  C9 0C
    BNE loc_1E_C5ED              ; $C5C3  D0 28
    LDA $BC                      ; $C5C5  A5 BC
    CMP #$FF                     ; $C5C7  C9 FF
    BEQ loc_1E_C5ED              ; $C5C9  F0 22
    LDX #$0F                     ; $C5CB  A2 0F

loc_1E_C5CD:
    LSR $0430,X                  ; $C5CD  5E 30 04
    DEX                          ; $C5D0  CA
    BPL loc_1E_C5CD              ; $C5D1  10 FA
    JSR sub_1E_C289              ; $C5D3  20 89 C2
    LDA #$00                     ; $C5D6  A9 00
    STA $2B                      ; $C5D8  85 2B
    LDA #$7D                     ; $C5DA  A9 7D
    LDX #$0F                     ; $C5DC  A2 0F
    JSR sub_1F_F160              ; $C5DE  20 60 F1
    LDA #$20                     ; $C5E1  A9 20
    STA $047F                    ; $C5E3  8D 7F 04
    LDA #$AB                     ; $C5E6  A9 AB
    STA $04BF                    ; $C5E8  8D BF 04
    BNE loc_1E_C5F0              ; $C5EB  D0 03

loc_1E_C5ED:
    JMP loc_1E_C1F0              ; $C5ED  4C F0 C1


loc_1E_C5F0:
    RTS                          ; $C5F0  60

    .byte $48,$AD,$A7,$05,$85,$09,$AD,$A9,$05,$85,$08,$68,$20,$0C,$C7,$18  ; $C5F1
    .byte $AD,$B7,$03,$69,$20,$8D,$B7,$03,$AD,$B6,$03,$69,$00,$8D,$B6,$03  ; $C601
    .byte $18,$AD,$A9,$05,$69,$20,$8D,$A9,$05,$AD,$A7,$05,$69,$00,$8D,$A7  ; $C611
    .byte $05,$A9,$0B,$20,$00,$C0,$60  ; $C621

sub_1E_C628:
    JSR sub_1E_C000              ; $C628  20 00 C0
    LDA #$00                     ; $C62B  A9 00
    STA $08                      ; $C62D  85 08
    LDX #$04                     ; $C62F  A2 04

loc_1E_C631:
    LDA ($08),Y                  ; $C631  B1 08
    STA $2007                    ; $C633  8D 07 20
    INY                          ; $C636  C8
    BNE loc_1E_C631              ; $C637  D0 F8
    INC $09                      ; $C639  E6 09
    DEX                          ; $C63B  CA
    BNE loc_1E_C631              ; $C63C  D0 F3
    LDA #$0D                     ; $C63E  A9 0D
    JSR sub_1E_C000              ; $C640  20 00 C0
    RTS                          ; $C643  60


sub_1E_C644:
    STA $00                      ; $C644  85 00
    TAX                          ; $C646  AA
    LDA $C689,X                  ; $C647  BD 89 C6
    STA $01                      ; $C64A  85 01
    LDA $C690,X                  ; $C64C  BD 90 C6
    STA $02                      ; $C64F  85 02
    LDA #$00                     ; $C651  A9 00
    STA $08                      ; $C653  85 08
    STA $2006                    ; $C655  8D 06 20
    STA $2006                    ; $C658  8D 06 20

loc_1E_C65B:
    LDX $02                      ; $C65B  A6 02
    LDA $C6BE,X                  ; $C65D  BD BE C6
    STA $09                      ; $C660  85 09
    LDA $C6E5,X                  ; $C662  BD E5 C6
    STA $03                      ; $C665  85 03
    LDA $C697,X                  ; $C667  BD 97 C6
    JSR sub_1E_C000              ; $C66A  20 00 C0
    LDY #$00                     ; $C66D  A0 00

loc_1E_C66F:
    LDA ($08),Y                  ; $C66F  B1 08
    STA $2007                    ; $C671  8D 07 20
    INY                          ; $C674  C8
    BNE loc_1E_C66F              ; $C675  D0 F8
    INC $09                      ; $C677  E6 09
    DEC $03                      ; $C679  C6 03
    BNE loc_1E_C66F              ; $C67B  D0 F2
    INC $02                      ; $C67D  E6 02
    DEC $01                      ; $C67F  C6 01
    BNE loc_1E_C65B              ; $C681  D0 D8
    LDA #$0D                     ; $C683  A9 0D
    JSR sub_1E_C000              ; $C685  20 00 C0
    RTS                          ; $C688  60

    .byte $02,$02,$03,$06,$0E,$04,$08,$00,$02,$04,$07,$0D,$1B,$1F,$05,$08  ; $C689
    .byte $06,$09,$06,$00,$09,$00,$09,$08,$09,$08,$09,$03,$03,$04,$04,$06  ; $C699
    .byte $04,$05,$05,$05,$07,$07,$02,$08,$07,$05,$08,$09,$08,$00,$06,$07  ; $C6A9
    .byte $07,$07,$02,$02,$09,$90,$88,$90,$90,$90,$98,$A0,$98,$AC,$80,$AC  ; $C6B9
    .byte $84,$9F,$99,$9C,$9D,$9B,$B2,$97,$93,$96,$9C,$9D,$9F,$95,$A4,$B2  ; $C6C9
    .byte $90,$88,$9F,$8C,$98,$B2,$9D,$9F,$AE,$96,$94,$AC,$10,$10,$10,$10  ; $C6D9
    .byte $08,$08,$10,$0E,$02,$04,$02,$04,$06,$02,$01,$01,$01,$02,$01,$01  ; $C6E9
    .byte $02,$01,$01,$01,$02,$0C,$02,$10,$03,$01,$0C,$08,$01,$01,$01,$01  ; $C6F9
    .byte $01,$01,$02  ; $C709

sub_1E_C70C:
    JSR sub_1E_C000              ; $C70C  20 00 C0
    LDY #$1F                     ; $C70F  A0 1F

loc_1E_C711:
    LDA ($08),Y                  ; $C711  B1 08
    STA $03B8,Y                  ; $C713  99 B8 03
    DEY                          ; $C716  88
    BPL loc_1E_C711              ; $C717  10 F8
    LDA #$20                     ; $C719  A9 20
    STA $47                      ; $C71B  85 47
    LDA #$0D                     ; $C71D  A9 0D
    JSR sub_1E_C000              ; $C71F  20 00 C0
    RTS                          ; $C722  60


sub_1E_C723:
    LDA #$01                     ; $C723  A9 01
    JSR sub_1E_C000              ; $C725  20 00 C0
    LDX #$1F                     ; $C728  A2 1F

loc_1E_C72A:
    LDA $9CD0,X                  ; $C72A  BD D0 9C
    STA $03B8,X                  ; $C72D  9D B8 03
    DEX                          ; $C730  CA
    BPL loc_1E_C72A              ; $C731  10 F7
    LDA #$08                     ; $C733  A9 08
    STA $03B6                    ; $C735  8D B6 03
    LDA #$00                     ; $C738  A9 00
    STA $03B7                    ; $C73A  8D B7 03
    LDA #$20                     ; $C73D  A9 20
    STA $47                      ; $C73F  85 47
    LDA #$0D                     ; $C741  A9 0D
    JSR sub_1E_C000              ; $C743  20 00 C0
    RTS                          ; $C746  60


sub_1E_C747:
    LDA #$09                     ; $C747  A9 09
    JSR sub_1E_C000              ; $C749  20 00 C0
    LDY #$1F                     ; $C74C  A0 1F

loc_1E_C74E:
    LDA ($FE),Y                  ; $C74E  B1 FE
    STA $03B8,Y                  ; $C750  99 B8 03
    DEY                          ; $C753  88
    BPL loc_1E_C74E              ; $C754  10 F8
    LDA #$20                     ; $C756  A9 20
    STA $47                      ; $C758  85 47
    LDA #$0D                     ; $C75A  A9 0D
    JSR sub_1E_C000              ; $C75C  20 00 C0
    RTS                          ; $C75F  60


sub_1E_C760:
    LDA $FD                      ; $C760  A5 FD
    STA $09                      ; $C762  85 09
    LDA #$00                     ; $C764  A9 00
    LSR $09                      ; $C766  46 09
    ROR A                        ; $C768  6A
    LSR $09                      ; $C769  46 09
    ROR A                        ; $C76B  6A
    LSR $09                      ; $C76C  46 09
    ROR A                        ; $C76E  6A
    STA $03B7                    ; $C76F  8D B7 03
    STA $08                      ; $C772  85 08
    LDA $FD                      ; $C774  A5 FD
    CMP #$08                     ; $C776  C9 08
    BCC loc_1E_C77F              ; $C778  90 05
    LDA $09                      ; $C77A  A5 09
    JMP loc_1E_C783              ; $C77C  4C 83 C7


loc_1E_C77F:
    LDA $09                      ; $C77F  A5 09
    ADC #$09                     ; $C781  69 09

loc_1E_C783:
    STA $03B6                    ; $C783  8D B6 03
    CLC                          ; $C786  18
    TYA                          ; $C787  98
    ADC $09                      ; $C788  65 09
    STA $09                      ; $C78A  85 09
    TXA                          ; $C78C  8A
    JSR sub_1E_C000              ; $C78D  20 00 C0
    LDY #$1F                     ; $C790  A0 1F

loc_1E_C792:
    LDA ($08),Y                  ; $C792  B1 08
    STA $03B8,Y                  ; $C794  99 B8 03
    DEY                          ; $C797  88
    BPL loc_1E_C792              ; $C798  10 F8
    LDA #$20                     ; $C79A  A9 20
    STA $47                      ; $C79C  85 47
    LDA #$0D                     ; $C79E  A9 0D
    JSR sub_1E_C000              ; $C7A0  20 00 C0
    RTS                          ; $C7A3  60


sub_1E_C7A4:
    LDA $2A                      ; $C7A4  A5 2A
    AND #$07                     ; $C7A6  29 07
    JSR sub_1E_C000              ; $C7A8  20 00 C0
    LDA $B400,Y                  ; $C7AB  B9 00 B4
    TAY                          ; $C7AE  A8
    LDA #$0E                     ; $C7AF  A9 0E
    JSR sub_1E_C000              ; $C7B1  20 00 C0
    RTS                          ; $C7B4  60


sub_1E_C7B5:
    LDA #$C0                     ; $C7B5  A9 C0
    STA $0420                    ; $C7B7  8D 20 04
    LDA #$80                     ; $C7BA  A9 80
    STA $0460                    ; $C7BC  8D 60 04
    LDA #$14                     ; $C7BF  A9 14
    STA $04A0                    ; $C7C1  8D A0 04
    LDA #$1A                     ; $C7C4  A9 1A
    STA $0400                    ; $C7C6  8D 00 04

loc_1E_C7C9:
    LDA $2A                      ; $C7C9  A5 2A
    AND #$07                     ; $C7CB  29 07
    JSR sub_1E_C000              ; $C7CD  20 00 C0
    LDA #$00                     ; $C7D0  A9 00
    STA $0680                    ; $C7D2  8D 80 06
    STA $06A0                    ; $C7D5  8D A0 06
    CLC                          ; $C7D8  18
    LDA $04A0                    ; $C7D9  AD A0 04
    ADC #$10                     ; $C7DC  69 10
    STA $04A0                    ; $C7DE  8D A0 04
    LDX $B0                      ; $C7E1  A6 B0
    CMP $BB00,X                  ; $C7E3  DD 00 BB
    BEQ loc_1E_C7F1              ; $C7E6  F0 09
    JSR sub_1E_CC77              ; $C7E8  20 77 CC
    JSR sub_1E_C07F              ; $C7EB  20 7F C0
    JMP loc_1E_C7C9              ; $C7EE  4C C9 C7


loc_1E_C7F1:
    LDA #$30                     ; $C7F1  A9 30
    JSR sub_1E_C051              ; $C7F3  20 51 C0
    LDA #$00                     ; $C7F6  A9 00
    STA $2C                      ; $C7F8  85 2C
    STA $3E                      ; $C7FA  85 3E
    STA $3F                      ; $C7FC  85 3F
    LDA #$40                     ; $C7FE  A9 40
    STA $42                      ; $C800  85 42
    LDA #$0E                     ; $C802  A9 0E
    JSR sub_1E_C000              ; $C804  20 00 C0
    RTS                          ; $C807  60


sub_1E_C808:
    LDA $2A                      ; $C808  A5 2A
    STA $B3                      ; $C80A  85 B3
    LDA #$0B                     ; $C80C  A9 0B
    JSR sub_1E_C000              ; $C80E  20 00 C0
    JSR $8000                    ; $C811  20 00 80
    LDA #$0E                     ; $C814  A9 0E
    JSR sub_1E_C000              ; $C816  20 00 C0

sub_1E_C819:
    LDA #$00                     ; $C819  A9 00
    STA $23                      ; $C81B  85 23
    STA $27                      ; $C81D  85 27
    JSR $84EE                    ; $C81F  20 EE 84
    JSR sub_1E_DCD0              ; $C822  20 D0 DC
    JSR sub_1E_D658              ; $C825  20 58 D6
    JSR sub_1E_C5A9              ; $C828  20 A9 C5
    JSR $925B                    ; $C82B  20 5B 92
    JSR sub_1E_CC77              ; $C82E  20 77 CC
    LDA $FB                      ; $C831  A5 FB
    BEQ loc_1E_C844              ; $C833  F0 0F
    INC $FC                      ; $C835  E6 FC
    CMP $FC                      ; $C837  C5 FC
    BEQ loc_1E_C83D              ; $C839  F0 02
    BCS loc_1E_C844              ; $C83B  B0 07

loc_1E_C83D:
    JSR sub_1E_C0D7              ; $C83D  20 D7 C0
    LDA #$00                     ; $C840  A9 00
    STA $FC                      ; $C842  85 FC

loc_1E_C844:
    JSR sub_1E_C07F              ; $C844  20 7F C0
    LDA $B1                      ; $C847  A5 B1
    CMP #$02                     ; $C849  C9 02
    BCC sub_1E_C819              ; $C84B  90 CC
    RTS                          ; $C84D  60


sub_1E_C84E:
    LDA #$00                     ; $C84E  A9 00
    STA $03                      ; $C850  85 03
    STA $04                      ; $C852  85 04
    LDA $01                      ; $C854  A5 01
    ORA $02                      ; $C856  05 02
    BNE loc_1E_C85D              ; $C858  D0 03
    STA $03                      ; $C85A  85 03
    RTS                          ; $C85C  60


loc_1E_C85D:
    LDY #$08                     ; $C85D  A0 08

loc_1E_C85F:
    ASL $03                      ; $C85F  06 03
    ROL $01                      ; $C861  26 01
    ROL $04                      ; $C863  26 04
    SEC                          ; $C865  38
    LDA $04                      ; $C866  A5 04
    SBC $02                      ; $C868  E5 02
    BCC loc_1E_C870              ; $C86A  90 04
    STA $04                      ; $C86C  85 04
    INC $03                      ; $C86E  E6 03

loc_1E_C870:
    DEY                          ; $C870  88
    BNE loc_1E_C85F              ; $C871  D0 EC
    RTS                          ; $C873  60


sub_1E_C874:
    LDA #$00                     ; $C874  A9 00
    STA $11                      ; $C876  85 11
    STA $10                      ; $C878  85 10
    LDA $0B                      ; $C87A  A5 0B
    ORA $0A                      ; $C87C  05 0A
    ORA $0D                      ; $C87E  05 0D
    ORA $0C                      ; $C880  05 0C
    BNE loc_1E_C889              ; $C882  D0 05
    STA $0F                      ; $C884  85 0F
    STA $0E                      ; $C886  85 0E
    RTS                          ; $C888  60


loc_1E_C889:
    LDY #$10                     ; $C889  A0 10

loc_1E_C88B:
    ASL $10                      ; $C88B  06 10
    ROL $0A                      ; $C88D  26 0A
    ROL $0B                      ; $C88F  26 0B
    ROL $11                      ; $C891  26 11
    SEC                          ; $C893  38
    LDA $0B                      ; $C894  A5 0B
    SBC $0C                      ; $C896  E5 0C
    TAX                          ; $C898  AA
    LDA $11                      ; $C899  A5 11
    SBC $0D                      ; $C89B  E5 0D
    BCC loc_1E_C8A5              ; $C89D  90 06
    STX $09                      ; $C89F  86 09
    STA $11                      ; $C8A1  85 11
    INC $10                      ; $C8A3  E6 10

loc_1E_C8A5:
    DEY                          ; $C8A5  88
    BNE loc_1E_C88B              ; $C8A6  D0 E3
    LDA $0A                      ; $C8A8  A5 0A
    STA $0F                      ; $C8AA  85 0F
    LDA $10                      ; $C8AC  A5 10
    STA $0E                      ; $C8AE  85 0E
    RTS                          ; $C8B0  60


sub_1E_C8B1:
    LDX $1B                      ; $C8B1  A6 1B
    LDY #$20                     ; $C8B3  A0 20
    LDA $09                      ; $C8B5  A5 09
    AND #$01                     ; $C8B7  29 01
    BEQ loc_1E_C8BD              ; $C8B9  F0 02
    LDY #$24                     ; $C8BB  A0 24

loc_1E_C8BD:
    STY $0B                      ; $C8BD  84 0B
    LDA $08                      ; $C8BF  A5 08
    LSR A                        ; $C8C1  4A
    LSR A                        ; $C8C2  4A
    PHA                          ; $C8C3  48
    LSR A                        ; $C8C4  4A
    AND #$03                     ; $C8C5  29 03
    ORA $0B                      ; $C8C7  05 0B
    STA $0300,X                  ; $C8C9  9D 00 03
    PLA                          ; $C8CC  68
    PHA                          ; $C8CD  48
    ROR A                        ; $C8CE  6A
    AND #$FC                     ; $C8CF  29 FC
    STA $0304,X                  ; $C8D1  9D 04 03
    LDA $0B                      ; $C8D4  A5 0B
    ORA #$03                     ; $C8D6  09 03
    STA $0308,X                  ; $C8D8  9D 08 03
    PLA                          ; $C8DB  68
    STA $0A                      ; $C8DC  85 0A
    LSR A                        ; $C8DE  4A
    LSR A                        ; $C8DF  4A
    LSR A                        ; $C8E0  4A
    ASL $0A                      ; $C8E1  06 0A
    ASL $0A                      ; $C8E3  06 0A
    ASL $0A                      ; $C8E5  06 0A
    ORA $0A                      ; $C8E7  05 0A
    ORA #$C0                     ; $C8E9  09 C0
    STA $030C,X                  ; $C8EB  9D 0C 03
    RTS                          ; $C8EE  60


sub_1E_C8EF:
    LDX $51                      ; $C8EF  A6 51
    LDY #$08                     ; $C8F1  A0 08
    LDA $09                      ; $C8F3  A5 09
    AND #$01                     ; $C8F5  29 01
    BEQ loc_1E_C8FB              ; $C8F7  F0 02
    LDY #$09                     ; $C8F9  A0 09

loc_1E_C8FB:
    STY $0B                      ; $C8FB  84 0B
    LDA $0A                      ; $C8FD  A5 0A
    AND #$F8                     ; $C8FF  29 F8
    ASL A                        ; $C901  0A
    ROL $0B                      ; $C902  26 0B
    ASL A                        ; $C904  0A
    ROL $0B                      ; $C905  26 0B
    STA $03BC,X                  ; $C907  9D BC 03
    LDA $08                      ; $C90A  A5 08
    LSR A                        ; $C90C  4A
    LSR A                        ; $C90D  4A
    LSR A                        ; $C90E  4A
    ORA $03BC,X                  ; $C90F  1D BC 03
    STA $03BC,X                  ; $C912  9D BC 03
    LDA $0B                      ; $C915  A5 0B
    STA $03B6,X                  ; $C917  9D B6 03
    RTS                          ; $C91A  60


sub_1E_C91B:
    PHA                          ; $C91B  48
    LDA $08                      ; $C91C  A5 08
    PHA                          ; $C91E  48
    LDX $51                      ; $C91F  A6 51
    LDA $0A                      ; $C921  A5 0A
    AND #$E0                     ; $C923  29 E0
    LSR A                        ; $C925  4A
    LSR A                        ; $C926  4A
    STA $0B                      ; $C927  85 0B
    ASL $08                      ; $C929  06 08
    ROL A                        ; $C92B  2A
    ASL $08                      ; $C92C  06 08
    ROL A                        ; $C92E  2A
    ASL $08                      ; $C92F  06 08
    ROL A                        ; $C931  2A
    ORA $0B                      ; $C932  05 0B
    ORA #$C0                     ; $C934  09 C0
    STA $03C8,X                  ; $C936  9D C8 03
    LDY #$23                     ; $C939  A0 23
    LDA $09                      ; $C93B  A5 09
    AND #$01                     ; $C93D  29 01
    BEQ loc_1E_C943              ; $C93F  F0 02
    LDY #$27                     ; $C941  A0 27

loc_1E_C943:
    TYA                          ; $C943  98
    STA $03C2,X                  ; $C944  9D C2 03
    LDY #$00                     ; $C947  A0 00
    PLA                          ; $C949  68
    AND #$10                     ; $C94A  29 10
    BEQ loc_1E_C94F              ; $C94C  F0 01
    INY                          ; $C94E  C8

loc_1E_C94F:
    LDA $0A                      ; $C94F  A5 0A
    AND #$10                     ; $C951  29 10
    BEQ loc_1E_C957              ; $C953  F0 02
    INY                          ; $C955  C8
    INY                          ; $C956  C8

loc_1E_C957:
    PLA                          ; $C957  68
    AND $C967,Y                  ; $C958  39 67 C9
    STA $03CE,X                  ; $C95B  9D CE 03
    LDA $C967,Y                  ; $C95E  B9 67 C9
    EOR #$FF                     ; $C961  49 FF
    STA $03D4,X                  ; $C963  9D D4 03
    RTS                          ; $C966  60

    .byte $03,$0C,$30,$C0  ; $C967

sub_1E_C96B:
    LDA $2A                      ; $C96B  A5 2A
    AND #$07                     ; $C96D  29 07
    JSR sub_1E_C000              ; $C96F  20 00 C0
    LDA #$20                     ; $C972  A9 20
    STA $0B                      ; $C974  85 0B
    LDY #$00                     ; $C976  A0 00
    LDA ($08),Y                  ; $C978  B1 08
    TAX                          ; $C97A  AA
    TAY                          ; $C97B  A8
    LDA $8400,Y                  ; $C97C  B9 00 84
    PHA                          ; $C97F  48
    TXA                          ; $C980  8A
    ASL A                        ; $C981  0A
    ROL $0B                      ; $C982  26 0B
    ASL A                        ; $C984  0A
    ROL $0B                      ; $C985  26 0B
    STA $0A                      ; $C987  85 0A
    LDA $1B                      ; $C989  A5 1B
    ASL A                        ; $C98B  0A
    ASL A                        ; $C98C  0A
    ASL A                        ; $C98D  0A
    ASL A                        ; $C98E  0A
    TAX                          ; $C98F  AA
    PHA                          ; $C990  48
    LDY #$00                     ; $C991  A0 00

loc_1E_C993:
    CLC                          ; $C993  18
    PLA                          ; $C994  68
    PHA                          ; $C995  48
    ADC $CA07,Y                  ; $C996  79 07 CA
    TAX                          ; $C999  AA
    LDA ($0A),Y                  ; $C99A  B1 0A
    ASL A                        ; $C99C  0A
    ASL A                        ; $C99D  0A
    CLC                          ; $C99E  18
    STA $0310,X                  ; $C99F  9D 10 03
    ADC #$01                     ; $C9A2  69 01
    STA $0314,X                  ; $C9A4  9D 14 03
    ADC #$01                     ; $C9A7  69 01
    STA $0311,X                  ; $C9A9  9D 11 03
    ADC #$01                     ; $C9AC  69 01
    STA $0315,X                  ; $C9AE  9D 15 03
    INY                          ; $C9B1  C8
    CPY #$04                     ; $C9B2  C0 04
    BNE loc_1E_C993              ; $C9B4  D0 DD
    PLA                          ; $C9B6  68
    LDY #$20                     ; $C9B7  A0 20
    LDA $08                      ; $C9B9  A5 08
    AND #$40                     ; $C9BB  29 40
    BEQ loc_1E_C9C1              ; $C9BD  F0 02
    LDY #$24                     ; $C9BF  A0 24

loc_1E_C9C1:
    STY $0D                      ; $C9C1  84 0D
    LDA $1A                      ; $C9C3  A5 1A
    STA $0C                      ; $C9C5  85 0C
    LSR A                        ; $C9C7  4A
    ROR $0C                      ; $C9C8  66 0C
    LDA $0C                      ; $C9CA  A5 0C
    PHA                          ; $C9CC  48
    AND #$03                     ; $C9CD  29 03
    ORA $0D                      ; $C9CF  05 0D
    STA $0D                      ; $C9D1  85 0D
    PLA                          ; $C9D3  68
    AND #$FC                     ; $C9D4  29 FC
    LDX $1B                      ; $C9D6  A6 1B
    STA $0304,X                  ; $C9D8  9D 04 03
    LDA $0D                      ; $C9DB  A5 0D
    STA $0300,X                  ; $C9DD  9D 00 03
    LDA $0D                      ; $C9E0  A5 0D
    ORA #$03                     ; $C9E2  09 03
    STA $0308,X                  ; $C9E4  9D 08 03
    LDA $1A                      ; $C9E7  A5 1A
    STA $0C                      ; $C9E9  85 0C
    LSR A                        ; $C9EB  4A
    LSR A                        ; $C9EC  4A
    LSR A                        ; $C9ED  4A
    ASL $0C                      ; $C9EE  06 0C
    ASL $0C                      ; $C9F0  06 0C
    ASL $0C                      ; $C9F2  06 0C
    ORA #$C0                     ; $C9F4  09 C0
    ORA $0C                      ; $C9F6  05 0C
    STA $030C,X                  ; $C9F8  9D 0C 03
    PLA                          ; $C9FB  68
    STA $0350,X                  ; $C9FC  9D 50 03
    INC $1B                      ; $C9FF  E6 1B
    LDA #$0E                     ; $CA01  A9 0E
    JSR sub_1E_C000              ; $CA03  20 00 C0
    RTS                          ; $CA06  60

    .byte $00,$08,$02,$0A  ; $CA07

sub_1E_CA0B:
    LDA $29                      ; $CA0B  A5 29
    PHA                          ; $CA0D  48
    JSR sub_1E_C96B              ; $CA0E  20 6B C9
    PLA                          ; $CA11  68
    JSR sub_1E_C000              ; $CA12  20 00 C0
    RTS                          ; $CA15  60


sub_1E_CA16:
    LDA $2A                      ; $CA16  A5 2A
    AND #$07                     ; $CA18  29 07
    JSR sub_1E_C000              ; $CA1A  20 00 C0
    LDA $39                      ; $CA1D  A5 39
    LSR A                        ; $CA1F  4A
    LSR A                        ; $CA20  4A
    LSR A                        ; $CA21  4A
    LSR A                        ; $CA22  4A
    STA $0300                    ; $CA23  8D 00 03
    LDA $39                      ; $CA26  A5 39
    ASL A                        ; $CA28  0A
    ASL A                        ; $CA29  0A
    ASL A                        ; $CA2A  0A
    PHA                          ; $CA2B  48
    AND #$18                     ; $CA2C  29 18
    STA $0301                    ; $CA2E  8D 01 03
    PLA                          ; $CA31  68
    ASL A                        ; $CA32  0A
    AND #$C0                     ; $CA33  29 C0
    ORA $0301                    ; $CA35  0D 01 03
    STA $0301                    ; $CA38  8D 01 03
    LDA $39                      ; $CA3B  A5 39
    AND #$F8                     ; $CA3D  29 F8
    ORA #$C0                     ; $CA3F  09 C0
    STA $0313                    ; $CA41  8D 13 03
    LDA $39                      ; $CA44  A5 39
    AND #$03                     ; $CA46  29 03
    ASL A                        ; $CA48  0A
    ORA $0313                    ; $CA49  0D 13 03
    STA $0313                    ; $CA4C  8D 13 03
    LDX #$20                     ; $CA4F  A2 20
    LDA $20                      ; $CA51  A5 20
    AND #$01                     ; $CA53  29 01
    BEQ loc_1E_CA59              ; $CA55  F0 02
    LDX #$24                     ; $CA57  A2 24

loc_1E_CA59:
    TXA                          ; $CA59  8A
    ORA $0300                    ; $CA5A  0D 00 03
    STA $0300                    ; $CA5D  8D 00 03
    TXA                          ; $CA60  8A
    ORA #$03                     ; $CA61  09 03
    STA $0312                    ; $CA63  8D 12 03
    LDA #$00                     ; $CA66  A9 00
    STA $00                      ; $CA68  85 00
    LDA $39                      ; $CA6A  A5 39
    AND #$3B                     ; $CA6C  29 3B
    LSR A                        ; $CA6E  4A
    ROR $00                      ; $CA6F  66 00
    LSR A                        ; $CA71  4A
    ROR $00                      ; $CA72  66 00
    LSR A                        ; $CA74  4A
    ROR $00                      ; $CA75  66 00
    LSR $00                      ; $CA77  46 00
    ORA $00                      ; $CA79  05 00
    STA $00                      ; $CA7B  85 00
    LDA $0440                    ; $CA7D  AD 40 04
    LDX #$00                     ; $CA80  A2 00
    STX $08                      ; $CA82  86 08
    LSR A                        ; $CA84  4A
    ROR $08                      ; $CA85  66 08
    LSR A                        ; $CA87  4A
    ROR $08                      ; $CA88  66 08
    CLC                          ; $CA8A  18
    ADC #$85                     ; $CA8B  69 85
    STA $09                      ; $CA8D  85 09
    STX $01                      ; $CA8F  86 01

loc_1E_CA91:
    LDY $00                      ; $CA91  A4 00
    LDA ($08),Y                  ; $CA93  B1 08
    STA $03                      ; $CA95  85 03
    STA $0A                      ; $CA97  85 0A
    LDA #$20                     ; $CA99  A9 20
    ASL $0A                      ; $CA9B  06 0A
    ROL A                        ; $CA9D  2A
    ASL $0A                      ; $CA9E  06 0A
    ROL A                        ; $CAA0  2A
    STA $0B                      ; $CAA1  85 0B
    LDY #$00                     ; $CAA3  A0 00
    LDA $39                      ; $CAA5  A5 39
    AND #$04                     ; $CAA7  29 04
    BEQ loc_1E_CAAC              ; $CAA9  F0 01
    INY                          ; $CAAB  C8

loc_1E_CAAC:
    LDA #$02                     ; $CAAC  A9 02
    STA $02                      ; $CAAE  85 02

loc_1E_CAB0:
    LDA ($0A),Y                  ; $CAB0  B1 0A
    ASL A                        ; $CAB2  0A
    ASL A                        ; $CAB3  0A
    CLC                          ; $CAB4  18
    STA $0302,X                  ; $CAB5  9D 02 03
    ADC #$01                     ; $CAB8  69 01
    STA $030A,X                  ; $CABA  9D 0A 03
    ADC #$01                     ; $CABD  69 01
    STA $0303,X                  ; $CABF  9D 03 03
    ADC #$01                     ; $CAC2  69 01
    STA $030B,X                  ; $CAC4  9D 0B 03
    INX                          ; $CAC7  E8
    INX                          ; $CAC8  E8
    INY                          ; $CAC9  C8
    INY                          ; $CACA  C8
    DEC $02                      ; $CACB  C6 02
    BNE loc_1E_CAB0              ; $CACD  D0 E1
    LDA $39                      ; $CACF  A5 39
    LDY #$0F                     ; $CAD1  A0 0F
    AND #$04                     ; $CAD3  29 04
    BEQ loc_1E_CAD9              ; $CAD5  F0 02
    LDY #$F0                     ; $CAD7  A0 F0

loc_1E_CAD9:
    STY $0314                    ; $CAD9  8C 14 03
    LDY $03                      ; $CADC  A4 03
    LDA $8400,Y                  ; $CADE  B9 00 84
    AND $0314                    ; $CAE1  2D 14 03
    LDY $01                      ; $CAE4  A4 01
    STA $0315,Y                  ; $CAE6  99 15 03
    LDA $00                      ; $CAE9  A5 00
    ORA #$08                     ; $CAEB  09 08
    STA $00                      ; $CAED  85 00
    INC $01                      ; $CAEF  E6 01
    LDA $01                      ; $CAF1  A5 01
    CMP #$02                     ; $CAF3  C9 02
    BEQ loc_1E_CAFA              ; $CAF5  F0 03
    JMP loc_1E_CA91              ; $CAF7  4C 91 CA


loc_1E_CAFA:
    LDA #$80                     ; $CAFA  A9 80
    STA $1B                      ; $CAFC  85 1B
    LDA #$FF                     ; $CAFE  A9 FF
    EOR $0314                    ; $CB00  4D 14 03
    STA $0314                    ; $CB03  8D 14 03
    LDA #$0E                     ; $CB06  A9 0E
    JSR sub_1E_C000              ; $CB08  20 00 C0
    RTS                          ; $CB0B  60


sub_1E_CB0C:
    LDA $FD                      ; $CB0C  A5 FD
    CMP #$60                     ; $CB0E  C9 60
    BCC loc_1E_CB13              ; $CB10  90 01
    RTS                          ; $CB12  60


loc_1E_CB13:
    LDA $29                      ; $CB13  A5 29
    PHA                          ; $CB15  48
    LDA $FD                      ; $CB16  A5 FD
    AND #$F0                     ; $CB18  29 F0
    LSR A                        ; $CB1A  4A
    LSR A                        ; $CB1B  4A
    LSR A                        ; $CB1C  4A
    PHA                          ; $CB1D  48
    LSR A                        ; $CB1E  4A
    CLC                          ; $CB1F  18
    ADC #$0A                     ; $CB20  69 0A
    STA $03B6                    ; $CB22  8D B6 03
    LDA $FD                      ; $CB25  A5 FD
    ASL A                        ; $CB27  0A
    ASL A                        ; $CB28  0A
    ASL A                        ; $CB29  0A
    ASL A                        ; $CB2A  0A
    STA $03B7                    ; $CB2B  8D B7 03
    STA $08                      ; $CB2E  85 08
    LDA $2A                      ; $CB30  A5 2A
    AND #$07                     ; $CB32  29 07
    JSR sub_1E_C000              ; $CB34  20 00 C0
    LDX $FE                      ; $CB37  A6 FE
    JSR sub_1E_CB64              ; $CB39  20 64 CB
    CLC                          ; $CB3C  18
    PLA                          ; $CB3D  68
    ADC $B42C,X                  ; $CB3E  7D 2C B4
    TAX                          ; $CB41  AA
    LDA $B460,X                  ; $CB42  BD 60 B4
    STA $09                      ; $CB45  85 09
    LDA $B461,X                  ; $CB47  BD 61 B4
    JSR sub_1E_C000              ; $CB4A  20 00 C0
    LDY #$1F                     ; $CB4D  A0 1F

loc_1E_CB4F:
    LDA ($08),Y                  ; $CB4F  B1 08
    STA $03B8,Y                  ; $CB51  99 B8 03
    DEY                          ; $CB54  88
    BPL loc_1E_CB4F              ; $CB55  10 F8
    LDA #$20                     ; $CB57  A9 20
    STA $47                      ; $CB59  85 47
    INC $FD                      ; $CB5B  E6 FD
    INC $FD                      ; $CB5D  E6 FD
    PLA                          ; $CB5F  68
    JSR sub_1E_C000              ; $CB60  20 00 C0
    RTS                          ; $CB63  60


sub_1E_CB64:
    LDY $B42C,X                  ; $CB64  BC 2C B4
    LDA $B46C,Y                  ; $CB67  B9 6C B4
    STA $036F                    ; $CB6A  8D 6F 03
    LDA $B46D,Y                  ; $CB6D  B9 6D B4
    STA $0370                    ; $CB70  8D 70 03
    LDA $B46E,Y                  ; $CB73  B9 6E B4
    STA $0371                    ; $CB76  8D 71 03
    LDA $B46F,Y                  ; $CB79  B9 6F B4
    STA $0373                    ; $CB7C  8D 73 03
    LDA $B470,Y                  ; $CB7F  B9 70 B4
    STA $0374                    ; $CB82  8D 74 03
    LDA $B471,Y                  ; $CB85  B9 71 B4
    STA $0375                    ; $CB88  8D 75 03
    RTS                          ; $CB8B  60


sub_1E_CB8C:
    LDX #$0F                     ; $CB8C  A2 0F
    LDY #$00                     ; $CB8E  A0 00

loc_1E_CB90:
    LDA $0430,X                  ; $CB90  BD 30 04
    BPL loc_1E_CB9C              ; $CB93  10 07
    AND #$10                     ; $CB95  29 10
    BEQ loc_1E_CB9C              ; $CB97  F0 03
    STX $56,Y                    ; $CB99  96 56
    INY                          ; $CB9B  C8

loc_1E_CB9C:
    DEX                          ; $CB9C  CA
    BPL loc_1E_CB90              ; $CB9D  10 F1
    STY $55                      ; $CB9F  84 55
    RTS                          ; $CBA1  60


sub_1E_CBA2:
    LDY $55                      ; $CBA2  A4 55

loc_1E_CBA4:
    DEY                          ; $CBA4  88
    BMI sub_1E_CBC3              ; $CBA5  30 1C
    LDX $56,Y                    ; $CBA7  B6 56
    LDA $08                      ; $CBA9  A5 08
    AND $0610,X                  ; $CBAB  3D 10 06
    CMP $0650,X                  ; $CBAE  DD 50 06
    BNE loc_1E_CBA4              ; $CBB1  D0 F1
    LDA $0A                      ; $CBB3  A5 0A
    AND $0630,X                  ; $CBB5  3D 30 06
    CMP $0670,X                  ; $CBB8  DD 70 06
    BNE loc_1E_CBA4              ; $CBBB  D0 E7
    LDA $04F0,X                  ; $CBBD  BD F0 04
    STA $00                      ; $CBC0  85 00
    RTS                          ; $CBC2  60


sub_1E_CBC3:
    LDA $2A                      ; $CBC3  A5 2A
    AND #$07                     ; $CBC5  29 07
    JSR sub_1E_C000              ; $CBC7  20 00 C0
    LDA #$00                     ; $CBCA  A9 00
    STA $00                      ; $CBCC  85 00
    LDA $0B                      ; $CBCE  A5 0B
    BEQ loc_1E_CBDB              ; $CBD0  F0 09
    BMI loc_1E_CBD7              ; $CBD2  30 03
    JMP loc_1E_CC41              ; $CBD4  4C 41 CC


loc_1E_CBD7:
    LDA #$00                     ; $CBD7  A9 00
    STA $0A                      ; $CBD9  85 0A

loc_1E_CBDB:
    LDA $08                      ; $CBDB  A5 08
    LSR A                        ; $CBDD  4A
    LSR A                        ; $CBDE  4A
    AND #$38                     ; $CBDF  29 38
    STA $00                      ; $CBE1  85 00
    LDA $0A                      ; $CBE3  A5 0A
    ASL A                        ; $CBE5  0A
    ROL A                        ; $CBE6  2A
    ROL A                        ; $CBE7  2A
    ROL A                        ; $CBE8  2A
    AND #$07                     ; $CBE9  29 07
    ORA $00                      ; $CBEB  05 00
    STA $00                      ; $CBED  85 00
    LDA #$00                     ; $CBEF  A9 00
    STA $0C                      ; $CBF1  85 0C
    LDA $09                      ; $CBF3  A5 09
    LSR A                        ; $CBF5  4A
    ROR $0C                      ; $CBF6  66 0C
    LSR A                        ; $CBF8  4A
    ROR $0C                      ; $CBF9  66 0C
    CLC                          ; $CBFB  18
    ADC #$85                     ; $CBFC  69 85
    STA $0D                      ; $CBFE  85 0D
    LDY $00                      ; $CC00  A4 00
    LDA ($0C),Y                  ; $CC02  B1 0C
    STA $0C                      ; $CC04  85 0C
    LDA #$20                     ; $CC06  A9 20
    ASL $0C                      ; $CC08  06 0C
    ROL A                        ; $CC0A  2A
    ASL $0C                      ; $CC0B  06 0C
    ROL A                        ; $CC0D  2A
    STA $0D                      ; $CC0E  85 0D
    LDY #$00                     ; $CC10  A0 00
    LDA $08                      ; $CC12  A5 08
    AND #$10                     ; $CC14  29 10
    BEQ loc_1E_CC1A              ; $CC16  F0 02
    INY                          ; $CC18  C8
    INY                          ; $CC19  C8

loc_1E_CC1A:
    LDA $0A                      ; $CC1A  A5 0A
    AND #$10                     ; $CC1C  29 10
    BEQ loc_1E_CC21              ; $CC1E  F0 01
    INY                          ; $CC20  C8

loc_1E_CC21:
    LDA ($0C),Y                  ; $CC21  B1 0C
    STA $00                      ; $CC23  85 00
    ASL $00                      ; $CC25  06 00
    ROL A                        ; $CC27  2A
    ASL $00                      ; $CC28  06 00
    ROL A                        ; $CC2A  2A
    AND #$03                     ; $CC2B  29 03
    STA $00                      ; $CC2D  85 00
    LSR A                        ; $CC2F  4A
    BEQ loc_1E_CC41              ; $CC30  F0 0F
    DEC $00                      ; $CC32  C6 00
    DEC $00                      ; $CC34  C6 00
    LDA $2A                      ; $CC36  A5 2A
    ASL A                        ; $CC38  0A
    ADC $00                      ; $CC39  65 00
    TAX                          ; $CC3B  AA
    LDA $CC47,X                  ; $CC3C  BD 47 CC
    STA $00                      ; $CC3F  85 00

loc_1E_CC41:
    LDA #$0E                     ; $CC41  A9 0E
    JSR sub_1E_C000              ; $CC43  20 00 C0
    RTS                          ; $CC46  60

    .byte $02,$03,$02,$03,$02,$00,$04,$03,$00,$03,$02,$07,$05,$06,$02,$03  ; $CC47
    .byte $02,$00,$02,$03,$04,$03,$02,$03,$00,$00,$00,$00,$20,$A2,$CB,$A9  ; $CC57
    .byte $0B,$20,$00,$C0,$60  ; $CC67

sub_1E_CC6C:
    LDA #$F8                     ; $CC6C  A9 F8
    LDX #$00                     ; $CC6E  A2 00

loc_1E_CC70:
    STA $0200,X                  ; $CC70  9D 00 02
    INX                          ; $CC73  E8
    BNE loc_1E_CC70              ; $CC74  D0 FA
    RTS                          ; $CC76  60


sub_1E_CC77:
    LDA #$0A                     ; $CC77  A9 0A
    JSR sub_1E_C000              ; $CC79  20 00 C0
    JSR sub_1E_CC6C              ; $CC7C  20 6C CC
    LDA #$00                     ; $CC7F  A9 00
    STA $06                      ; $CC81  85 06
    STA $0D                      ; $CC83  85 0D
    STA $0C                      ; $CC85  85 0C
    LDA $AA                      ; $CC87  A5 AA
    BEQ loc_1E_CC8E              ; $CC89  F0 03
    JMP loc_1E_CD05              ; $CC8B  4C 05 CD


loc_1E_CC8E:
    LDA $1C                      ; $CC8E  A5 1C
    AND #$01                     ; $CC90  29 01
    BNE loc_1E_CCC0              ; $CC92  D0 2C
    LDA #$FF                     ; $CC94  A9 FF
    STA $0C                      ; $CC96  85 0C
    LDA #$00                     ; $CC98  A9 00
    STA $2B                      ; $CC9A  85 2B

loc_1E_CC9C:
    JSR sub_1E_CDE7              ; $CC9C  20 E7 CD
    BCS loc_1E_CCBD              ; $CC9F  B0 1C
    INC $2B                      ; $CCA1  E6 2B
    LDA $2B                      ; $CCA3  A5 2B
    CMP #$10                     ; $CCA5  C9 10
    BNE loc_1E_CC9C              ; $CCA7  D0 F3

loc_1E_CCA9:
    JSR sub_1E_CEF9              ; $CCA9  20 F9 CE
    BCS loc_1E_CCBD              ; $CCAC  B0 0F
    INC $2B                      ; $CCAE  E6 2B
    LDA $2B                      ; $CCB0  A5 2B
    CMP #$20                     ; $CCB2  C9 20
    BNE loc_1E_CCA9              ; $CCB4  D0 F3
    LDA $06                      ; $CCB6  A5 06
    STA $0C                      ; $CCB8  85 0C
    JSR sub_1E_CF5D              ; $CCBA  20 5D CF

loc_1E_CCBD:
    JMP loc_1E_CCE5              ; $CCBD  4C E5 CC


loc_1E_CCC0:
    JSR sub_1E_CF5D              ; $CCC0  20 5D CF
    LDA $06                      ; $CCC3  A5 06
    STA $0D                      ; $CCC5  85 0D
    LDA #$1F                     ; $CCC7  A9 1F
    STA $2B                      ; $CCC9  85 2B

loc_1E_CCCB:
    JSR sub_1E_CEF9              ; $CCCB  20 F9 CE
    BCS loc_1E_CCE5              ; $CCCE  B0 15
    DEC $2B                      ; $CCD0  C6 2B
    LDA $2B                      ; $CCD2  A5 2B
    CMP #$0F                     ; $CCD4  C9 0F
    BNE loc_1E_CCCB              ; $CCD6  D0 F3

loc_1E_CCD8:
    JSR sub_1E_CDE7              ; $CCD8  20 E7 CD
    BCS loc_1E_CCE5              ; $CCDB  B0 08
    DEC $2B                      ; $CCDD  C6 2B
    BPL loc_1E_CCD8              ; $CCDF  10 F7
    LDA $06                      ; $CCE1  A5 06
    STA $0C                      ; $CCE3  85 0C

loc_1E_CCE5:
    LDA $2A                      ; $CCE5  A5 2A
    CMP #$01                     ; $CCE7  C9 01
    BNE loc_1E_CCFF              ; $CCE9  D0 14
    LDX $0D                      ; $CCEB  A6 0D

loc_1E_CCED:
    CPX $0C                      ; $CCED  E4 0C
    BEQ loc_1E_CCFF              ; $CCEF  F0 0E
    LDA $0202,X                  ; $CCF1  BD 02 02
    ORA #$20                     ; $CCF4  09 20
    STA $0202,X                  ; $CCF6  9D 02 02
    INX                          ; $CCF9  E8
    INX                          ; $CCFA  E8
    INX                          ; $CCFB  E8
    INX                          ; $CCFC  E8
    BNE loc_1E_CCED              ; $CCFD  D0 EE

loc_1E_CCFF:
    LDA #$0E                     ; $CCFF  A9 0E
    JSR sub_1E_C000              ; $CD01  20 00 C0
    RTS                          ; $CD04  60


loc_1E_CD05:
    LDA $1C                      ; $CD05  A5 1C
    AND #$01                     ; $CD07  29 01
    BNE loc_1E_CD54              ; $CD09  D0 49
    LDA #$FF                     ; $CD0B  A9 FF
    STA $0C                      ; $CD0D  85 0C
    LDA #$00                     ; $CD0F  A9 00
    STA $2B                      ; $CD11  85 2B
    LDA $AA                      ; $CD13  A5 AA
    AND #$04                     ; $CD15  29 04
    BEQ loc_1E_CD1F              ; $CD17  F0 06
    JSR sub_1E_CD97              ; $CD19  20 97 CD
    JMP loc_1E_CD22              ; $CD1C  4C 22 CD


loc_1E_CD1F:
    JSR sub_1E_CDE7              ; $CD1F  20 E7 CD

loc_1E_CD22:
    INC $2B                      ; $CD22  E6 2B

loc_1E_CD24:
    LDA $AA                      ; $CD24  A5 AA
    AND #$02                     ; $CD26  29 02
    BNE loc_1E_CD30              ; $CD28  D0 06
    JSR sub_1E_CDE7              ; $CD2A  20 E7 CD
    JMP loc_1E_CD33              ; $CD2D  4C 33 CD


loc_1E_CD30:
    JSR sub_1E_CD97              ; $CD30  20 97 CD

loc_1E_CD33:
    BCS loc_1E_CD51              ; $CD33  B0 1C
    INC $2B                      ; $CD35  E6 2B
    LDA $2B                      ; $CD37  A5 2B
    CMP #$10                     ; $CD39  C9 10
    BNE loc_1E_CD24              ; $CD3B  D0 E7

loc_1E_CD3D:
    JSR sub_1E_CDBF              ; $CD3D  20 BF CD
    BCS loc_1E_CD51              ; $CD40  B0 0F
    INC $2B                      ; $CD42  E6 2B
    LDA $2B                      ; $CD44  A5 2B
    CMP #$20                     ; $CD46  C9 20
    BNE loc_1E_CD3D              ; $CD48  D0 F3
    LDA $06                      ; $CD4A  A5 06
    STA $0C                      ; $CD4C  85 0C
    JSR sub_1E_CF5D              ; $CD4E  20 5D CF

loc_1E_CD51:
    JMP loc_1E_CCE5              ; $CD51  4C E5 CC


loc_1E_CD54:
    JSR sub_1E_CF5D              ; $CD54  20 5D CF
    LDA $06                      ; $CD57  A5 06
    STA $0D                      ; $CD59  85 0D
    LDA #$1F                     ; $CD5B  A9 1F
    STA $2B                      ; $CD5D  85 2B

loc_1E_CD5F:
    JSR sub_1E_CDBF              ; $CD5F  20 BF CD
    BCS loc_1E_CD94              ; $CD62  B0 30
    DEC $2B                      ; $CD64  C6 2B
    LDA $2B                      ; $CD66  A5 2B
    CMP #$0F                     ; $CD68  C9 0F
    BNE loc_1E_CD5F              ; $CD6A  D0 F3

loc_1E_CD6C:
    LDA $AA                      ; $CD6C  A5 AA
    AND #$02                     ; $CD6E  29 02
    BNE loc_1E_CD78              ; $CD70  D0 06
    JSR sub_1E_CDE7              ; $CD72  20 E7 CD
    JMP loc_1E_CD7B              ; $CD75  4C 7B CD


loc_1E_CD78:
    JSR sub_1E_CD97              ; $CD78  20 97 CD

loc_1E_CD7B:
    BCS loc_1E_CD94              ; $CD7B  B0 17
    DEC $2B                      ; $CD7D  C6 2B
    BNE loc_1E_CD6C              ; $CD7F  D0 EB
    LDA $AA                      ; $CD81  A5 AA
    AND #$04                     ; $CD83  29 04
    BEQ loc_1E_CD8D              ; $CD85  F0 06
    JSR sub_1E_CD97              ; $CD87  20 97 CD
    JMP loc_1E_CD90              ; $CD8A  4C 90 CD


loc_1E_CD8D:
    JSR sub_1E_CDE7              ; $CD8D  20 E7 CD

loc_1E_CD90:
    LDA $06                      ; $CD90  A5 06
    STA $0C                      ; $CD92  85 0C

loc_1E_CD94:
    JMP loc_1E_CCE5              ; $CD94  4C E5 CC


sub_1E_CD97:
    LDX $2B                      ; $CD97  A6 2B
    LDA $0420,X                  ; $CD99  BD 20 04
    BMI loc_1E_CDA0              ; $CD9C  30 02
    CLC                          ; $CD9E  18
    RTS                          ; $CD9F  60


loc_1E_CDA0:
    LDY $0400,X                  ; $CDA0  BC 00 04
    LDA $F900,Y                  ; $CDA3  B9 00 F9
    STA $08                      ; $CDA6  85 08
    LDA $FA00,Y                  ; $CDA8  B9 00 FA
    STA $09                      ; $CDAB  85 09
    LDA $06A0,X                  ; $CDAD  BD A0 06
    CLC                          ; $CDB0  18
    ADC #$02                     ; $CDB1  69 02
    TAY                          ; $CDB3  A8
    LDA ($08),Y                  ; $CDB4  B1 08
    BEQ loc_1E_CDBB              ; $CDB6  F0 03
    JMP loc_1E_CE2F              ; $CDB8  4C 2F CE


loc_1E_CDBB:
    LSR $0420,X                  ; $CDBB  5E 20 04
    RTS                          ; $CDBE  60


sub_1E_CDBF:
    LDX $2B                      ; $CDBF  A6 2B
    LDA $0420,X                  ; $CDC1  BD 20 04
    BMI loc_1E_CDC8              ; $CDC4  30 02
    CLC                          ; $CDC6  18
    RTS                          ; $CDC7  60


loc_1E_CDC8:
    LDY $0400,X                  ; $CDC8  BC 00 04
    LDA $F980,Y                  ; $CDCB  B9 80 F9
    STA $08                      ; $CDCE  85 08
    LDA $FA80,Y                  ; $CDD0  B9 80 FA
    STA $09                      ; $CDD3  85 09
    LDA $06A0,X                  ; $CDD5  BD A0 06
    CLC                          ; $CDD8  18
    ADC #$02                     ; $CDD9  69 02
    TAY                          ; $CDDB  A8
    LDA ($08),Y                  ; $CDDC  B1 08
    BEQ loc_1E_CDE3              ; $CDDE  F0 03
    JMP loc_1E_CF41              ; $CDE0  4C 41 CF


loc_1E_CDE3:
    LSR $0420,X                  ; $CDE3  5E 20 04
    RTS                          ; $CDE6  60


sub_1E_CDE7:
    LDX $2B                      ; $CDE7  A6 2B
    LDA $0420,X                  ; $CDE9  BD 20 04
    BMI loc_1E_CDF0              ; $CDEC  30 02
    CLC                          ; $CDEE  18
    RTS                          ; $CDEF  60


loc_1E_CDF0:
    LDY $0400,X                  ; $CDF0  BC 00 04
    LDA $F900,Y                  ; $CDF3  B9 00 F9
    STA $08                      ; $CDF6  85 08
    LDA $FA00,Y                  ; $CDF8  B9 00 FA
    STA $09                      ; $CDFB  85 09
    LDA $06A0,X                  ; $CDFD  BD A0 06
    PHA                          ; $CE00  48
    INC $0680,X                  ; $CE01  FE 80 06
    LDY #$01                     ; $CE04  A0 01
    LDA ($08),Y                  ; $CE06  B1 08
    CMP $0680,X                  ; $CE08  DD 80 06
    BCS loc_1E_CE22              ; $CE0B  B0 15
    LDA #$00                     ; $CE0D  A9 00
    STA $0680,X                  ; $CE0F  9D 80 06
    INC $06A0,X                  ; $CE12  FE A0 06
    DEY                          ; $CE15  88
    LDA ($08),Y                  ; $CE16  B1 08
    CMP $06A0,X                  ; $CE18  DD A0 06
    BCS loc_1E_CE22              ; $CE1B  B0 05
    LDA #$00                     ; $CE1D  A9 00
    STA $06A0,X                  ; $CE1F  9D A0 06

loc_1E_CE22:
    PLA                          ; $CE22  68
    CLC                          ; $CE23  18
    ADC #$02                     ; $CE24  69 02
    TAY                          ; $CE26  A8
    LDA ($08),Y                  ; $CE27  B1 08
    BNE loc_1E_CE2F              ; $CE29  D0 04
    LSR $0420,X                  ; $CE2B  5E 20 04
    RTS                          ; $CE2E  60


loc_1E_CE2F:
    TAY                          ; $CE2F  A8
    CPX #$01                     ; $CE30  E0 01
    BCS loc_1E_CE49              ; $CE32  B0 15
    LDA $4B                      ; $CE34  A5 4B
    BEQ loc_1E_CE43              ; $CE36  F0 0B
    DEC $4B                      ; $CE38  C6 4B
    LDA $1C                      ; $CE3A  A5 1C
    AND #$02                     ; $CE3C  29 02
    BEQ loc_1E_CE43              ; $CE3E  F0 03

loc_1E_CE40:
    JMP loc_1E_CEF5              ; $CE40  4C F5 CE


loc_1E_CE43:
    LDA $F9                      ; $CE43  A5 F9
    BNE loc_1E_CE40              ; $CE45  D0 F9
    BEQ loc_1E_CE5B              ; $CE47  F0 12

loc_1E_CE49:
    BNE loc_1E_CE5B              ; $CE49  D0 10
    LDA $05A8                    ; $CE4B  AD A8 05
    BEQ loc_1E_CE5B              ; $CE4E  F0 0B
    LDA $1C                      ; $CE50  A5 1C
    AND #$02                     ; $CE52  29 02
    BNE loc_1E_CE58              ; $CE54  D0 02
    LDY #$18                     ; $CE56  A0 18

loc_1E_CE58:
    DEC $05A8                    ; $CE58  CE A8 05

loc_1E_CE5B:
    LDA $8000,Y                  ; $CE5B  B9 00 80
    STA $08                      ; $CE5E  85 08
    LDA $8200,Y                  ; $CE60  B9 00 82
    STA $09                      ; $CE63  85 09
    LDA #$00                     ; $CE65  A9 00
    STA $03                      ; $CE67  85 03

loc_1E_CE69:
    LDY #$00                     ; $CE69  A0 00
    LDA ($08),Y                  ; $CE6B  B1 08
    STA $04                      ; $CE6D  85 04
    INY                          ; $CE6F  C8
    LDA ($08),Y                  ; $CE70  B1 08
    TAY                          ; $CE72  A8
    LDA $8400,Y                  ; $CE73  B9 00 84
    STA $0A                      ; $CE76  85 0A
    LDA $8500,Y                  ; $CE78  B9 00 85
    STA $0B                      ; $CE7B  85 0B
    SEC                          ; $CE7D  38
    LDA $0460,X                  ; $CE7E  BD 60 04
    SBC $1F                      ; $CE81  E5 1F
    STA $00                      ; $CE83  85 00
    LDA $0440,X                  ; $CE85  BD 40 04
    SBC $20                      ; $CE88  E5 20
    LDA $04A0,X                  ; $CE8A  BD A0 04
    STA $01                      ; $CE8D  85 01
    LDA $0420,X                  ; $CE8F  BD 20 04
    AND #$40                     ; $CE92  29 40
    STA $02                      ; $CE94  85 02
    LDA #$02                     ; $CE96  A9 02
    STA $07                      ; $CE98  85 07

loc_1E_CE9A:
    LDX $06                      ; $CE9A  A6 06
    LDY $07                      ; $CE9C  A4 07
    LDA ($08),Y                  ; $CE9E  B1 08
    STA $0201,X                  ; $CEA0  9D 01 02
    CLC                          ; $CEA3  18
    LDA ($0A),Y                  ; $CEA4  B1 0A
    ADC $01                      ; $CEA6  65 01
    STA $0200,X                  ; $CEA8  9D 00 02
    INY                          ; $CEAB  C8
    LDA $03                      ; $CEAC  A5 03
    BEQ loc_1E_CEB8              ; $CEAE  F0 08
    LDA ($08),Y                  ; $CEB0  B1 08
    AND #$F0                     ; $CEB2  29 F0
    ORA $03                      ; $CEB4  05 03
    BNE loc_1E_CEBA              ; $CEB6  D0 02

loc_1E_CEB8:
    LDA ($08),Y                  ; $CEB8  B1 08

loc_1E_CEBA:
    EOR $02                      ; $CEBA  45 02
    STA $0202,X                  ; $CEBC  9D 02 02
    LDA $02                      ; $CEBF  A5 02
    BEQ loc_1E_CECC              ; $CEC1  F0 09
    LDA ($0A),Y                  ; $CEC3  B1 0A
    TAY                          ; $CEC5  A8
    LDA $8600,Y                  ; $CEC6  B9 00 86
    JMP loc_1E_CECE              ; $CEC9  4C CE CE


loc_1E_CECC:
    LDA ($0A),Y                  ; $CECC  B1 0A

loc_1E_CECE:
    CLC                          ; $CECE  18
    BMI loc_1E_CED7              ; $CECF  30 06
    ADC $00                      ; $CED1  65 00
    BCC loc_1E_CEE2              ; $CED3  90 0D
    BCS loc_1E_CEDB              ; $CED5  B0 04

loc_1E_CED7:
    ADC $00                      ; $CED7  65 00
    BCS loc_1E_CEE2              ; $CED9  B0 07

loc_1E_CEDB:
    LDA #$F8                     ; $CEDB  A9 F8
    STA $0200,X                  ; $CEDD  9D 00 02
    BNE loc_1E_CEED              ; $CEE0  D0 0B

loc_1E_CEE2:
    STA $0203,X                  ; $CEE2  9D 03 02
    CLC                          ; $CEE5  18
    TXA                          ; $CEE6  8A
    ADC #$04                     ; $CEE7  69 04
    STA $06                      ; $CEE9  85 06
    BEQ loc_1E_CEF7              ; $CEEB  F0 0A

loc_1E_CEED:
    INC $07                      ; $CEED  E6 07
    INC $07                      ; $CEEF  E6 07
    DEC $04                      ; $CEF1  C6 04
    BNE loc_1E_CE9A              ; $CEF3  D0 A5

loc_1E_CEF5:
    CLC                          ; $CEF5  18
    RTS                          ; $CEF6  60


loc_1E_CEF7:
    SEC                          ; $CEF7  38
    RTS                          ; $CEF8  60


sub_1E_CEF9:
    LDX $2B                      ; $CEF9  A6 2B
    LDA $0420,X                  ; $CEFB  BD 20 04
    BMI loc_1E_CF02              ; $CEFE  30 02
    CLC                          ; $CF00  18
    RTS                          ; $CF01  60


loc_1E_CF02:
    LDY $0400,X                  ; $CF02  BC 00 04
    LDA $F980,Y                  ; $CF05  B9 80 F9
    STA $08                      ; $CF08  85 08
    LDA $FA80,Y                  ; $CF0A  B9 80 FA
    STA $09                      ; $CF0D  85 09
    LDA $06A0,X                  ; $CF0F  BD A0 06
    PHA                          ; $CF12  48
    INC $0680,X                  ; $CF13  FE 80 06
    LDY #$01                     ; $CF16  A0 01
    LDA ($08),Y                  ; $CF18  B1 08
    CMP $0680,X                  ; $CF1A  DD 80 06
    BCS loc_1E_CF34              ; $CF1D  B0 15
    LDA #$00                     ; $CF1F  A9 00
    STA $0680,X                  ; $CF21  9D 80 06
    INC $06A0,X                  ; $CF24  FE A0 06
    DEY                          ; $CF27  88
    LDA ($08),Y                  ; $CF28  B1 08
    CMP $06A0,X                  ; $CF2A  DD A0 06
    BCS loc_1E_CF34              ; $CF2D  B0 05
    LDA #$00                     ; $CF2F  A9 00
    STA $06A0,X                  ; $CF31  9D A0 06

loc_1E_CF34:
    PLA                          ; $CF34  68
    CLC                          ; $CF35  18
    ADC #$02                     ; $CF36  69 02
    TAY                          ; $CF38  A8
    LDA ($08),Y                  ; $CF39  B1 08
    BNE loc_1E_CF41              ; $CF3B  D0 04
    LSR $0420,X                  ; $CF3D  5E 20 04
    RTS                          ; $CF40  60


loc_1E_CF41:
    TAY                          ; $CF41  A8
    LDA $0420,X                  ; $CF42  BD 20 04
    AND #$20                     ; $CF45  29 20
    BNE loc_1E_CF5B              ; $CF47  D0 12
    LDA $8100,Y                  ; $CF49  B9 00 81
    STA $08                      ; $CF4C  85 08
    LDA $8300,Y                  ; $CF4E  B9 00 83
    STA $09                      ; $CF51  85 09
    LDA $0100,X                  ; $CF53  BD 00 01
    STA $03                      ; $CF56  85 03
    JMP loc_1E_CE69              ; $CF58  4C 69 CE


loc_1E_CF5B:
    CLC                          ; $CF5B  18
    RTS                          ; $CF5C  60


sub_1E_CF5D:
    LDA $06C0                    ; $CF5D  AD C0 06
    STA $00                      ; $CF60  85 00
    LDX $06                      ; $CF62  A6 06
    LDA #$01                     ; $CF64  A9 01
    STA $02                      ; $CF66  85 02
    LDA #$18                     ; $CF68  A9 18
    STA $01                      ; $CF6A  85 01
    JSR sub_1E_CFA8              ; $CF6C  20 A8 CF
    BCS loc_1E_CFA7              ; $CF6F  B0 36
    LDY $A9                      ; $CF71  A4 A9
    BEQ loc_1E_CF87              ; $CF73  F0 12
    LDA $009B,Y                  ; $CF75  B9 9B 00
    STA $00                      ; $CF78  85 00
    LDA #$00                     ; $CF7A  A9 00
    STA $02                      ; $CF7C  85 02
    LDA #$10                     ; $CF7E  A9 10
    STA $01                      ; $CF80  85 01
    JSR sub_1E_CFA8              ; $CF82  20 A8 CF
    BCS loc_1E_CFA7              ; $CF85  B0 20

loc_1E_CF87:
    LDA $B1                      ; $CF87  A5 B1
    BEQ loc_1E_CFA7              ; $CF89  F0 1C
    LDA $06C1                    ; $CF8B  AD C1 06
    STA $00                      ; $CF8E  85 00
    LDA #$03                     ; $CF90  A9 03
    LDY $B3                      ; $CF92  A4 B3
    CPY #$08                     ; $CF94  C0 08
    BEQ loc_1E_CF9C              ; $CF96  F0 04
    CPY #$0D                     ; $CF98  C0 0D
    BNE loc_1E_CF9E              ; $CF9A  D0 02

loc_1E_CF9C:
    LDA #$01                     ; $CF9C  A9 01

loc_1E_CF9E:
    STA $02                      ; $CF9E  85 02
    LDA #$28                     ; $CFA0  A9 28
    STA $01                      ; $CFA2  85 01
    JSR sub_1E_CFA8              ; $CFA4  20 A8 CF

loc_1E_CFA7:
    RTS                          ; $CFA7  60


sub_1E_CFA8:
    LDY #$06                     ; $CFA8  A0 06

loc_1E_CFAA:
    LDA $CFE5,Y                  ; $CFAA  B9 E5 CF
    STA $0200,X                  ; $CFAD  9D 00 02
    SEC                          ; $CFB0  38
    LDA $00                      ; $CFB1  A5 00
    SBC #$04                     ; $CFB3  E9 04
    BCS loc_1E_CFC5              ; $CFB5  B0 0E
    LDX $00                      ; $CFB7  A6 00
    LDA #$00                     ; $CFB9  A9 00
    STA $00                      ; $CFBB  85 00
    LDA $CFEC,X                  ; $CFBD  BD EC CF
    LDX $06                      ; $CFC0  A6 06
    JMP loc_1E_CFC9              ; $CFC2  4C C9 CF


loc_1E_CFC5:
    STA $00                      ; $CFC5  85 00
    LDA #$87                     ; $CFC7  A9 87

loc_1E_CFC9:
    STA $0201,X                  ; $CFC9  9D 01 02
    LDA $02                      ; $CFCC  A5 02
    STA $0202,X                  ; $CFCE  9D 02 02
    LDA $01                      ; $CFD1  A5 01
    STA $0203,X                  ; $CFD3  9D 03 02
    INX                          ; $CFD6  E8
    INX                          ; $CFD7  E8
    INX                          ; $CFD8  E8
    INX                          ; $CFD9  E8
    STX $06                      ; $CFDA  86 06
    BEQ loc_1E_CFE3              ; $CFDC  F0 05
    DEY                          ; $CFDE  88
    BPL loc_1E_CFAA              ; $CFDF  10 C9
    CLC                          ; $CFE1  18
    RTS                          ; $CFE2  60


loc_1E_CFE3:
    SEC                          ; $CFE3  38
    RTS                          ; $CFE4  60

    .byte $18,$20,$28,$30,$38,$40,$48,$8B,$8A,$89,$88  ; $CFE5

nmi_vector:
    PHA                          ; $CFF0  48
    PHP                          ; $CFF1  08
    TXA                          ; $CFF2  8A
    PHA                          ; $CFF3  48
    TYA                          ; $CFF4  98
    PHA                          ; $CFF5  48
    LDA $1D                      ; $CFF6  A5 1D
    BEQ loc_1E_CFFD              ; $CFF8  F0 03
    JMP loc_1E_D08D              ; $CFFA  4C 8D D0


loc_1E_CFFD:
    LDA $F7                      ; $CFFD  A5 F7
    AND #$7C                     ; $CFFF  29 7C
    STA $F7                      ; $D001  85 F7
    STA $2000                    ; $D003  8D 00 20
    LDA $F8                      ; $D006  A5 F8
    AND #$E7                     ; $D008  29 E7
    STA $F8                      ; $D00A  85 F8
    STA $2001                    ; $D00C  8D 01 20
    LDA $2002                    ; $D00F  AD 02 20
    LDA #$00                     ; $D012  A9 00
    STA $2003                    ; $D014  8D 03 20
    LDA #$02                     ; $D017  A9 02
    STA $4014                    ; $D019  8D 14 40
    LDA $1B                      ; $D01C  A5 1B
    BEQ loc_1E_D023              ; $D01E  F0 03
    JSR sub_1E_D11B              ; $D020  20 1B D1

loc_1E_D023:
    JSR sub_1E_D0F5              ; $D023  20 F5 D0
    LDA $47                      ; $D026  A5 47
    BEQ loc_1E_D02D              ; $D028  F0 03
    JSR sub_1E_D1DF              ; $D02A  20 DF D1

loc_1E_D02D:
    LDA $51                      ; $D02D  A5 51
    BEQ loc_1E_D034              ; $D02F  F0 03
    JSR sub_1E_D1F9              ; $D031  20 F9 D1

loc_1E_D034:
    LDA $2002                    ; $D034  AD 02 20
    LDA #$00                     ; $D037  A9 00
    STA $01                      ; $D039  85 01
    LDA $1F                      ; $D03B  A5 1F
    STA $00                      ; $D03D  85 00
    LDA $B8                      ; $D03F  A5 B8
    BEQ loc_1E_D052              ; $D041  F0 0F
    SEC                          ; $D043  38
    LDA $00                      ; $D044  A5 00
    SBC $B8                      ; $D046  E5 B8
    STA $00                      ; $D048  85 00
    LDA #$00                     ; $D04A  A9 00
    SBC $B9                      ; $D04C  E5 B9
    AND #$01                     ; $D04E  29 01
    STA $01                      ; $D050  85 01

loc_1E_D052:
    LDA $00                      ; $D052  A5 00
    STA $2005                    ; $D054  8D 05 20
    LDA $22                      ; $D057  A5 22
    STA $00                      ; $D059  85 00
    LDA $B6                      ; $D05B  A5 B6
    BEQ loc_1E_D066              ; $D05D  F0 07
    SEC                          ; $D05F  38
    LDA $00                      ; $D060  A5 00
    SBC $B6                      ; $D062  E5 B6
    STA $00                      ; $D064  85 00

loc_1E_D066:
    LDA $00                      ; $D066  A5 00
    STA $2005                    ; $D068  8D 05 20
    LDA $F8                      ; $D06B  A5 F8
    ORA #$1E                     ; $D06D  09 1E
    STA $F8                      ; $D06F  85 F8
    STA $2001                    ; $D071  8D 01 20
    LDA $F7                      ; $D074  A5 F7
    ORA #$80                     ; $D076  09 80
    STA $F7                      ; $D078  85 F7
    LDA $20                      ; $D07A  A5 20
    EOR $01                      ; $D07C  45 01
    AND #$01                     ; $D07E  29 01
    ORA $F7                      ; $D080  05 F7
    ORA $AE                      ; $D082  05 AE
    STA $F7                      ; $D084  85 F7
    STA $2000                    ; $D086  8D 00 20
    STA $1D                      ; $D089  85 1D
    INC $1C                      ; $D08B  E6 1C

loc_1E_D08D:
    LDA $68                      ; $D08D  A5 68
    BEQ loc_1E_D095              ; $D08F  F0 04
    INC $67                      ; $D091  E6 67
    BNE loc_1E_D0C6              ; $D093  D0 31

loc_1E_D095:
    LDA #$0C                     ; $D095  A9 0C
    STA $FFF0                    ; $D097  8D F0 FF
    LSR A                        ; $D09A  4A
    STA $FFF0                    ; $D09B  8D F0 FF
    LSR A                        ; $D09E  4A
    STA $FFF0                    ; $D09F  8D F0 FF
    LSR A                        ; $D0A2  4A
    STA $FFF0                    ; $D0A3  8D F0 FF
    LSR A                        ; $D0A6  4A
    STA $FFF0                    ; $D0A7  8D F0 FF
    JSR $8000                    ; $D0AA  20 00 80

loc_1E_D0AD:
    LDX $66                      ; $D0AD  A6 66
    BEQ loc_1E_D0C1              ; $D0AF  F0 10
    LDA $057F,X                  ; $D0B1  BD 7F 05
    CMP #$FD                     ; $D0B4  C9 FD
    BNE loc_1E_D0BA              ; $D0B6  D0 02
    LDY #$A0                     ; $D0B8  A0 A0

loc_1E_D0BA:
    JSR $8003                    ; $D0BA  20 03 80
    DEC $66                      ; $D0BD  C6 66
    BNE loc_1E_D0AD              ; $D0BF  D0 EC

loc_1E_D0C1:
    LDA $29                      ; $D0C1  A5 29
    JSR sub_1E_C000              ; $D0C3  20 00 C0

loc_1E_D0C6:
    LDA $0480                    ; $D0C6  AD 80 04
    EOR $4A                      ; $D0C9  45 4A
    ADC $1C                      ; $D0CB  65 1C
    LSR A                        ; $D0CD  4A
    STA $4A                      ; $D0CE  85 4A
    PLA                          ; $D0D0  68
    TAY                          ; $D0D1  A8
    PLA                          ; $D0D2  68
    TAX                          ; $D0D3  AA
    PLP                          ; $D0D4  28
    PLA                          ; $D0D5  68
    RTI                          ; $D0D6  40


sub_1E_D0D7:
    LDX #$01                     ; $D0D7  A2 01
    STX $4016                    ; $D0D9  8E 16 40
    DEX                          ; $D0DC  CA
    STX $4016                    ; $D0DD  8E 16 40
    INX                          ; $D0E0  E8

loc_1E_D0E1:
    LDY #$08                     ; $D0E1  A0 08

loc_1E_D0E3:
    LDA $4016,X                  ; $D0E3  BD 16 40
    STA $27                      ; $D0E6  85 27
    LSR A                        ; $D0E8  4A
    ORA $27                      ; $D0E9  05 27
    LSR A                        ; $D0EB  4A
    ROR $23,X                    ; $D0EC  76 23
    DEY                          ; $D0EE  88
    BNE loc_1E_D0E3              ; $D0EF  D0 F2
    DEX                          ; $D0F1  CA
    BPL loc_1E_D0E1              ; $D0F2  10 ED
    RTS                          ; $D0F4  60


sub_1E_D0F5:
    LDY #$3F                     ; $D0F5  A0 3F
    STY $2006                    ; $D0F7  8C 06 20
    LDX #$00                     ; $D0FA  A2 00
    STX $2006                    ; $D0FC  8E 06 20

loc_1E_D0FF:
    LDA $0356,X                  ; $D0FF  BD 56 03
    STA $2007                    ; $D102  8D 07 20
    INX                          ; $D105  E8
    CPX #$20                     ; $D106  E0 20
    BNE loc_1E_D0FF              ; $D108  D0 F5
    STY $2006                    ; $D10A  8C 06 20
    LDA #$00                     ; $D10D  A9 00
    STA $2006                    ; $D10F  8D 06 20
    STA $2006                    ; $D112  8D 06 20
    STA $2006                    ; $D115  8D 06 20
    STA $3A                      ; $D118  85 3A
    RTS                          ; $D11A  60


sub_1E_D11B:
    BPL loc_1E_D120              ; $D11B  10 03
    JMP loc_1E_D181              ; $D11D  4C 81 D1


loc_1E_D120:
    LDY #$00                     ; $D120  A0 00

loc_1E_D122:
    STY $00                      ; $D122  84 00
    TYA                          ; $D124  98
    ASL A                        ; $D125  0A
    ASL A                        ; $D126  0A
    ASL A                        ; $D127  0A
    ASL A                        ; $D128  0A
    TAX                          ; $D129  AA
    LDA #$04                     ; $D12A  A9 04
    STA $01                      ; $D12C  85 01
    LDA $0300,Y                  ; $D12E  B9 00 03
    STA $0B                      ; $D131  85 0B
    LDA $0304,Y                  ; $D133  B9 04 03
    STA $0A                      ; $D136  85 0A
    CMP #$80                     ; $D138  C9 80
    BCC loc_1E_D148              ; $D13A  90 0C
    LDA $0B                      ; $D13C  A5 0B
    AND #$03                     ; $D13E  29 03
    CMP #$03                     ; $D140  C9 03
    BNE loc_1E_D148              ; $D142  D0 04
    LDA #$02                     ; $D144  A9 02
    STA $01                      ; $D146  85 01

loc_1E_D148:
    LDA $0308,Y                  ; $D148  B9 08 03
    STA $2006                    ; $D14B  8D 06 20
    LDA $030C,Y                  ; $D14E  B9 0C 03
    STA $2006                    ; $D151  8D 06 20
    LDA $0350,Y                  ; $D154  B9 50 03
    STA $2007                    ; $D157  8D 07 20

loc_1E_D15A:
    LDA $0B                      ; $D15A  A5 0B
    STA $2006                    ; $D15C  8D 06 20
    CLC                          ; $D15F  18
    LDA $0A                      ; $D160  A5 0A
    STA $2006                    ; $D162  8D 06 20
    ADC #$20                     ; $D165  69 20
    STA $0A                      ; $D167  85 0A
    LDY #$04                     ; $D169  A0 04

loc_1E_D16B:
    LDA $0310,X                  ; $D16B  BD 10 03
    STA $2007                    ; $D16E  8D 07 20
    INX                          ; $D171  E8
    DEY                          ; $D172  88
    BNE loc_1E_D16B              ; $D173  D0 F6
    DEC $01                      ; $D175  C6 01
    BNE loc_1E_D15A              ; $D177  D0 E1
    LDY $00                      ; $D179  A4 00
    INY                          ; $D17B  C8
    DEC $1B                      ; $D17C  C6 1B
    BNE loc_1E_D122              ; $D17E  D0 A2
    RTS                          ; $D180  60


loc_1E_D181:
    LDX #$00                     ; $D181  A2 00
    STX $1B                      ; $D183  86 1B

loc_1E_D185:
    LDA $0300                    ; $D185  AD 00 03
    STA $2006                    ; $D188  8D 06 20
    LDA $0301                    ; $D18B  AD 01 03
    STA $2006                    ; $D18E  8D 06 20

loc_1E_D191:
    LDA $0302,X                  ; $D191  BD 02 03
    STA $2007                    ; $D194  8D 07 20
    INX                          ; $D197  E8
    TXA                          ; $D198  8A
    AND #$07                     ; $D199  29 07
    BNE loc_1E_D191              ; $D19B  D0 F4
    CLC                          ; $D19D  18
    LDA $0301                    ; $D19E  AD 01 03
    ADC #$20                     ; $D1A1  69 20
    STA $0301                    ; $D1A3  8D 01 03
    LDA $0312                    ; $D1A6  AD 12 03
    STA $2006                    ; $D1A9  8D 06 20
    LDA $0313                    ; $D1AC  AD 13 03
    STA $2006                    ; $D1AF  8D 06 20
    LDA $2007                    ; $D1B2  AD 07 20
    LDA $2007                    ; $D1B5  AD 07 20
    LDY $1B                      ; $D1B8  A4 1B
    AND $0314                    ; $D1BA  2D 14 03
    ORA $0315,Y                  ; $D1BD  19 15 03
    PHA                          ; $D1C0  48
    LDA $0312                    ; $D1C1  AD 12 03
    STA $2006                    ; $D1C4  8D 06 20
    LDA $0313                    ; $D1C7  AD 13 03
    STA $2006                    ; $D1CA  8D 06 20
    PLA                          ; $D1CD  68
    STA $2007                    ; $D1CE  8D 07 20
    INC $1B                      ; $D1D1  E6 1B
    INC $0313                    ; $D1D3  EE 13 03
    CPX #$10                     ; $D1D6  E0 10
    BNE loc_1E_D185              ; $D1D8  D0 AB
    LDA #$00                     ; $D1DA  A9 00
    STA $1B                      ; $D1DC  85 1B
    RTS                          ; $D1DE  60


sub_1E_D1DF:
    LDA $03B6                    ; $D1DF  AD B6 03
    STA $2006                    ; $D1E2  8D 06 20
    LDA $03B7                    ; $D1E5  AD B7 03
    STA $2006                    ; $D1E8  8D 06 20
    LDX #$00                     ; $D1EB  A2 00

loc_1E_D1ED:
    LDA $03B8,X                  ; $D1ED  BD B8 03
    STA $2007                    ; $D1F0  8D 07 20
    INX                          ; $D1F3  E8
    DEC $47                      ; $D1F4  C6 47
    BNE loc_1E_D1ED              ; $D1F6  D0 F5
    RTS                          ; $D1F8  60


sub_1E_D1F9:
    LDA $F7                      ; $D1F9  A5 F7
    ORA #$04                     ; $D1FB  09 04
    STA $2000                    ; $D1FD  8D 00 20
    LDA $54                      ; $D200  A5 54
    BNE loc_1E_D269              ; $D202  D0 65
    LDY $51                      ; $D204  A4 51
    BMI loc_1E_D22D              ; $D206  30 25

loc_1E_D208:
    LDA $03B5,Y                  ; $D208  B9 B5 03
    STA $2006                    ; $D20B  8D 06 20
    LDA $03BB,Y                  ; $D20E  B9 BB 03
    STA $2006                    ; $D211  8D 06 20
    LDA $03C1,Y                  ; $D214  B9 C1 03
    STA $2007                    ; $D217  8D 07 20
    CLC                          ; $D21A  18
    ADC #$01                     ; $D21B  69 01
    STA $2007                    ; $D21D  8D 07 20
    DEY                          ; $D220  88
    BNE loc_1E_D208              ; $D221  D0 E5

loc_1E_D223:
    STY $51                      ; $D223  84 51
    LDA $F7                      ; $D225  A5 F7
    AND #$FB                     ; $D227  29 FB
    STA $2000                    ; $D229  8D 00 20
    RTS                          ; $D22C  60


loc_1E_D22D:
    TYA                          ; $D22D  98
    AND #$7F                     ; $D22E  29 7F
    TAY                          ; $D230  A8

loc_1E_D231:
    LDA #$02                     ; $D231  A9 02
    STA $00                      ; $D233  85 00
    LDA #$E4                     ; $D235  A9 E4
    STA $01                      ; $D237  85 01

loc_1E_D239:
    LDA $03B5,Y                  ; $D239  B9 B5 03
    STA $2006                    ; $D23C  8D 06 20
    LDA $03BB,Y                  ; $D23F  B9 BB 03
    STA $2006                    ; $D242  8D 06 20
    LDA #$02                     ; $D245  A9 02
    STA $02                      ; $D247  85 02

loc_1E_D249:
    LDA $01                      ; $D249  A5 01
    STA $2007                    ; $D24B  8D 07 20
    INC $01                      ; $D24E  E6 01
    DEC $02                      ; $D250  C6 02
    BNE loc_1E_D249              ; $D252  D0 F5
    DEC $00                      ; $D254  C6 00
    BEQ loc_1E_D264              ; $D256  F0 0C
    CLC                          ; $D258  18
    LDA $03BB,Y                  ; $D259  B9 BB 03
    ADC #$01                     ; $D25C  69 01
    STA $03BB,Y                  ; $D25E  99 BB 03
    JMP loc_1E_D239              ; $D261  4C 39 D2


loc_1E_D264:
    DEY                          ; $D264  88
    BNE loc_1E_D231              ; $D265  D0 CA
    BEQ loc_1E_D223              ; $D267  F0 BA

loc_1E_D269:
    BPL loc_1E_D283              ; $D269  10 18
    LDA $03B6                    ; $D26B  AD B6 03
    STA $2006                    ; $D26E  8D 06 20
    LDX $03BC                    ; $D271  AE BC 03
    DEX                          ; $D274  CA
    DEX                          ; $D275  CA
    STX $2006                    ; $D276  8E 06 20
    LDA $2007                    ; $D279  AD 07 20
    LDA $2007                    ; $D27C  AD 07 20
    TAX                          ; $D27F  AA
    JMP loc_1E_D285              ; $D280  4C 85 D2


loc_1E_D283:
    LDX #$20                     ; $D283  A2 20

loc_1E_D285:
    LDY #$02                     ; $D285  A0 02

loc_1E_D287:
    LDA $03B6                    ; $D287  AD B6 03
    STA $2006                    ; $D28A  8D 06 20
    LDA $03BC                    ; $D28D  AD BC 03
    STA $2006                    ; $D290  8D 06 20
    STX $2007                    ; $D293  8E 07 20
    INX                          ; $D296  E8
    STX $2007                    ; $D297  8E 07 20
    INX                          ; $D29A  E8
    INC $03BC                    ; $D29B  EE BC 03
    DEY                          ; $D29E  88
    BNE loc_1E_D287              ; $D29F  D0 E6
    LDA $03C2                    ; $D2A1  AD C2 03
    STA $2006                    ; $D2A4  8D 06 20
    LDA $03C8                    ; $D2A7  AD C8 03
    STA $2006                    ; $D2AA  8D 06 20
    LDA $54                      ; $D2AD  A5 54
    BPL loc_1E_D2CC              ; $D2AF  10 1B
    LDA $2007                    ; $D2B1  AD 07 20
    LDA $2007                    ; $D2B4  AD 07 20
    STA $00                      ; $D2B7  85 00
    LDA $03D4                    ; $D2B9  AD D4 03
    EOR #$FF                     ; $D2BC  49 FF
    LSR A                        ; $D2BE  4A
    LSR A                        ; $D2BF  4A
    AND $00                      ; $D2C0  25 00
    ASL A                        ; $D2C2  0A
    ASL A                        ; $D2C3  0A
    STA $03CE                    ; $D2C4  8D CE 03
    LDA $00                      ; $D2C7  A5 00
    JMP loc_1E_D2D2              ; $D2C9  4C D2 D2


loc_1E_D2CC:
    LDA $2007                    ; $D2CC  AD 07 20
    LDA $2007                    ; $D2CF  AD 07 20

loc_1E_D2D2:
    AND $03D4                    ; $D2D2  2D D4 03
    ORA $03CE                    ; $D2D5  0D CE 03
    TAX                          ; $D2D8  AA
    LDA $03C2                    ; $D2D9  AD C2 03
    STA $2006                    ; $D2DC  8D 06 20
    LDA $03C8                    ; $D2DF  AD C8 03
    STA $2006                    ; $D2E2  8D 06 20
    STX $2007                    ; $D2E5  8E 07 20
    STY $54                      ; $D2E8  84 54
    JMP loc_1E_D223              ; $D2EA  4C 23 D2


sub_1E_D2ED:
    LDA $A9                      ; $D2ED  A5 A9

sub_1E_D2EF:
    ASL A                        ; $D2EF  0A
    ASL A                        ; $D2F0  0A
    TAX                          ; $D2F1  AA
    INX                          ; $D2F2  E8
    LDY #$01                     ; $D2F3  A0 01

loc_1E_D2F5:
    LDA $D302,X                  ; $D2F5  BD 02 D3
    STA $0366,Y                  ; $D2F8  99 66 03
    INY                          ; $D2FB  C8
    INX                          ; $D2FC  E8
    CPY #$04                     ; $D2FD  C0 04
    BNE loc_1E_D2F5              ; $D2FF  D0 F4
    RTS                          ; $D301  60

    .byte $0F,$0F,$2C,$11,$0F,$0F,$28,$15,$0F,$0F,$30,$11,$0F,$0F,$30,$19  ; $D302
    .byte $0F,$0F,$30,$00,$0F,$0F,$34,$25,$0F,$0F,$34,$14,$0F,$0F,$37,$18  ; $D312
    .byte $0F,$0F,$30,$26,$0F,$0F,$30,$16,$0F,$0F,$30,$16,$0F,$0F,$30,$16  ; $D322

sub_1E_D332:
    LDA #$26                     ; $D332  A9 26
    JSR sub_1E_C051              ; $D334  20 51 C0
    LDA #$00                     ; $D337  A9 00
    STA $3D                      ; $D339  85 3D
    STA $36                      ; $D33B  85 36
    LDA #$02                     ; $D33D  A9 02
    STA $2C                      ; $D33F  85 2C
    JSR sub_1E_D3A8              ; $D341  20 A8 D3
    LDA #$01                     ; $D344  A9 01
    STA $06A0                    ; $D346  8D A0 06
    LDA #$6F                     ; $D349  A9 6F
    STA $4B                      ; $D34B  85 4B
    LDA #$01                     ; $D34D  A9 01
    STA $0640                    ; $D34F  8D 40 06
    LDA #$40                     ; $D352  A9 40
    STA $0660                    ; $D354  8D 60 06
    LDA #$00                     ; $D357  A9 00
    STA $0600                    ; $D359  8D 00 06
    LDA #$90                     ; $D35C  A9 90
    STA $0620                    ; $D35E  8D 20 06
    LSR $042F                    ; $D361  4E 2F 04
    LDA #$00                     ; $D364  A9 00
    STA $AA                      ; $D366  85 AA
    LDX #$0E                     ; $D368  A2 0E

loc_1E_D36A:
    LDA $0420,X                  ; $D36A  BD 20 04
    BPL loc_1E_D375              ; $D36D  10 06
    DEX                          ; $D36F  CA
    CPX #$01                     ; $D370  E0 01
    BNE loc_1E_D36A              ; $D372  D0 F6
    RTS                          ; $D374  60


loc_1E_D375:
    LDA #$80                     ; $D375  A9 80
    STA $0420,X                  ; $D377  9D 20 04
    LDA #$24                     ; $D37A  A9 24
    STA $0400,X                  ; $D37C  9D 00 04
    LDA $0440                    ; $D37F  AD 40 04
    STA $0440,X                  ; $D382  9D 40 04
    LDA $0460                    ; $D385  AD 60 04
    STA $0460,X                  ; $D388  9D 60 04
    LDA $04A0                    ; $D38B  AD A0 04
    STA $04A0,X                  ; $D38E  9D A0 04
    LDA #$08                     ; $D391  A9 08
    STA $0660,X                  ; $D393  9D 60 06
    LDA #$00                     ; $D396  A9 00
    STA $0640,X                  ; $D398  9D 40 06
    STA $0620,X                  ; $D39B  9D 20 06
    STA $0600,X                  ; $D39E  9D 00 06
    STA $0680,X                  ; $D3A1  9D 80 06
    STA $06A0,X                  ; $D3A4  9D A0 06
    RTS                          ; $D3A7  60


sub_1E_D3A8:
    LDX $2C                      ; $D3A8  A6 2C
    CLC                          ; $D3AA  18
    LDA $D3D4,X                  ; $D3AB  BD D4 D3
    ADC $3D                      ; $D3AE  65 3D
    CMP $0400                    ; $D3B0  CD 00 04
    BEQ loc_1E_D3BD              ; $D3B3  F0 08
    LDX #$00                     ; $D3B5  A2 00
    STX $06A0                    ; $D3B7  8E A0 06
    STX $0680                    ; $D3BA  8E 80 06

loc_1E_D3BD:
    STA $0400                    ; $D3BD  8D 00 04
    LDA $36                      ; $D3C0  A5 36
    BEQ loc_1E_D3C7              ; $D3C2  F0 03
    DEC $36                      ; $D3C4  C6 36
    RTS                          ; $D3C6  60


loc_1E_D3C7:
    LDA #$00                     ; $D3C7  A9 00
    STA $3D                      ; $D3C9  85 3D
    LDX $2C                      ; $D3CB  A6 2C
    LDA $D3D4,X                  ; $D3CD  BD D4 D3
    STA $0400                    ; $D3D0  8D 00 04
    RTS                          ; $D3D3  60

    .byte $1A,$19,$18,$00,$04,$08,$0C,$10,$14,$1B,$1F,$26  ; $D3D4

sub_1E_D3E0:
    LDA $D44F,Y                  ; $D3E0  B9 4F D4
    STA $0400,X                  ; $D3E3  9D 00 04
    LDA $0420                    ; $D3E6  AD 20 04
    AND #$40                     ; $D3E9  29 40
    PHP                          ; $D3EB  08
    ORA $D461,Y                  ; $D3EC  19 61 D4
    STA $0420,X                  ; $D3EF  9D 20 04
    PLP                          ; $D3F2  28
    BNE loc_1E_D40A              ; $D3F3  D0 15
    SEC                          ; $D3F5  38
    LDA $0460                    ; $D3F6  AD 60 04
    SBC $D473,Y                  ; $D3F9  F9 73 D4
    STA $0460,X                  ; $D3FC  9D 60 04
    LDA $0440                    ; $D3FF  AD 40 04
    SBC #$00                     ; $D402  E9 00
    STA $0440,X                  ; $D404  9D 40 04
    JMP loc_1E_D41C              ; $D407  4C 1C D4


loc_1E_D40A:
    CLC                          ; $D40A  18
    LDA $0460                    ; $D40B  AD 60 04
    ADC $D473,Y                  ; $D40E  79 73 D4
    STA $0460,X                  ; $D411  9D 60 04
    LDA $0440                    ; $D414  AD 40 04
    ADC #$00                     ; $D417  69 00
    STA $0440,X                  ; $D419  9D 40 04

loc_1E_D41C:
    LDA $04A0                    ; $D41C  AD A0 04
    STA $04A0,X                  ; $D41F  9D A0 04
    LDA $D485,Y                  ; $D422  B9 85 D4
    STA $0620,X                  ; $D425  9D 20 06
    LDA $D497,Y                  ; $D428  B9 97 D4
    STA $0600,X                  ; $D42B  9D 00 06
    LDA $D4A9,Y                  ; $D42E  B9 A9 D4
    STA $0660,X                  ; $D431  9D 60 06
    LDA $D4BB,Y                  ; $D434  B9 BB D4
    STA $0640,X                  ; $D437  9D 40 06
    LDA $D4CD,Y                  ; $D43A  B9 CD D4
    STA $0590,X                  ; $D43D  9D 90 05
    LDA #$00                     ; $D440  A9 00
    STA $06A0,X                  ; $D442  9D A0 06
    STA $0680,X                  ; $D445  9D 80 06
    STA $04E0,X                  ; $D448  9D E0 04
    STA $06C0,X                  ; $D44B  9D C0 06
    RTS                          ; $D44E  60

    .byte $23,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$2F,$3E,$3F,$74  ; $D44F
    .byte $79,$7C,$81,$83,$83,$82,$87,$83,$83,$81,$82,$82,$82,$86,$81,$82  ; $D45F
    .byte $80,$80,$80,$80,$10,$00,$10,$00,$10,$10,$10,$00,$00,$20,$20,$00  ; $D46F
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$71,$00,$00,$0F,$00  ; $D47F
    .byte $00,$27,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$01,$04,$04,$00  ; $D48F
    .byte $00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$AA  ; $D49F
    .byte $00,$00,$00,$41,$00,$76,$00,$00,$00,$C0,$00,$00,$00,$00,$00,$00  ; $D4AF
    .byte $02,$02,$00,$00,$00,$00,$00,$03,$00,$00,$00,$FE,$00,$00,$01,$01  ; $D4BF
    .byte $02,$04,$02,$01,$02,$02,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00  ; $D4CF
    .byte $00,$20,$40,$60,$80,$0E,$12,$12,$12,$0A,$16,$2E,$0E,$12,$16,$09  ; $D4DF
    .byte $2E,$0A,$16,$0E,$0C,$0A,$1E,$1E,$26,$46,$02,$06,$06,$06,$06,$06  ; $D4EF
    .byte $06,$06,$06,$06,$06,$0C,$10,$10,$10,$08,$14,$2C,$0C,$10,$14,$04  ; $D4FF
    .byte $2C,$08,$14,$0C,$0A,$08,$1C,$1C,$24,$44,$02,$04,$04,$04,$04,$04  ; $D50F
    .byte $04,$04,$04,$04,$04,$10,$14,$14,$14,$0C,$18,$30,$10,$14,$18,$08  ; $D51F
    .byte $30,$0C,$18,$10,$0E,$0A,$20,$20,$28,$48,$02,$08,$08,$08,$08,$08  ; $D52F
    .byte $08,$08,$08,$08,$08,$14,$18,$18,$18,$10,$1C,$34,$14,$18,$1C,$0C  ; $D53F
    .byte $34,$10,$1C,$14,$12,$10,$24,$24,$2C,$4C,$02,$0C,$0C,$0C,$0C,$0C  ; $D54F
    .byte $0C,$0C,$0C,$0C,$0C,$18,$1C,$1C,$1C,$14,$20,$38,$18,$1C,$20,$10  ; $D55F
    .byte $38,$14,$20,$18,$16,$14,$28,$28,$30,$50,$02,$10,$10,$10,$10,$10  ; $D56F
    .byte $10,$10,$10,$10,$10,$18,$14,$10,$0C,$0C,$10,$28,$10,$1E,$18,$28  ; $D57F
    .byte $30,$14,$24,$0C,$10,$18,$10,$20,$38,$18,$18,$08,$08,$08,$08,$08  ; $D58F
    .byte $08,$08,$08,$08,$08,$14,$10,$0C,$08,$08,$0C,$24,$0C,$1A,$14,$24  ; $D59F
    .byte $2C,$10,$20,$08,$0C,$14,$0C,$1C,$34,$14,$14,$04,$04,$04,$04,$04  ; $D5AF
    .byte $04,$04,$04,$04,$04,$18,$14,$10,$0C,$0C,$10,$28,$10,$1E,$18,$28  ; $D5BF
    .byte $30,$14,$24,$0C,$10,$18,$10,$20,$38,$18,$18,$08,$08,$08,$08,$08  ; $D5CF
    .byte $08,$08,$08,$08,$08,$1C,$18,$14,$10,$10,$14,$2C,$14,$22,$1C,$2C  ; $D5DF
    .byte $34,$18,$28,$10,$14,$1C,$14,$24,$3C,$1C,$1C,$0C,$0C,$0C,$0C,$0C  ; $D5EF
    .byte $0C,$0C,$0C,$0C,$0C,$20,$1C,$18,$14,$14,$18,$30,$18,$26,$20,$30  ; $D5FF
    .byte $38,$1C,$2C,$14,$18,$20,$18,$28,$40,$20,$20,$10,$10,$10,$10,$10  ; $D60F
    .byte $10,$10,$10,$10,$10,$AC,$00,$04,$84,$01,$A9,$09,$20,$00,$C0,$20  ; $D61F
    .byte $00,$86,$A9,$0D,$20,$00,$C0,$60,$A9,$09,$20,$00,$C0,$20,$03,$86  ; $D62F
    .byte $4C,$31,$D6,$A9,$09,$20,$00,$C0,$20,$06,$86,$4C,$31,$D6,$A9,$09  ; $D63F
    .byte $20,$00,$C0,$20,$09,$86,$4C,$31,$D6  ; $D64F

sub_1E_D658:
    LDA $2A                      ; $D658  A5 2A
    AND #$07                     ; $D65A  29 07
    JSR sub_1E_C000              ; $D65C  20 00 C0
    CLC                          ; $D65F  18
    LDA $1F                      ; $D660  A5 1F
    STA $0A                      ; $D662  85 0A
    ADC #$FF                     ; $D664  69 FF
    STA $08                      ; $D666  85 08
    LDA $20                      ; $D668  A5 20
    STA $0B                      ; $D66A  85 0B
    ADC #$00                     ; $D66C  69 00
    STA $09                      ; $D66E  85 09
    LDA $42                      ; $D670  A5 42
    AND #$40                     ; $D672  29 40
    BNE loc_1E_D6E8              ; $D674  D0 72

loc_1E_D676:
    LDY $48                      ; $D676  A4 48
    BEQ loc_1E_D692              ; $D678  F0 18
    LDA $B5FF,Y                  ; $D67A  B9 FF B5
    CMP $0B                      ; $D67D  C5 0B
    BCC loc_1E_D692              ; $D67F  90 11
    BNE loc_1E_D68A              ; $D681  D0 07
    LDA $B6FF,Y                  ; $D683  B9 FF B6
    CMP $0A                      ; $D686  C5 0A
    BCC loc_1E_D692              ; $D688  90 08

loc_1E_D68A:
    DEY                          ; $D68A  88
    JSR sub_1E_D753              ; $D68B  20 53 D7
    DEC $48                      ; $D68E  C6 48
    BNE loc_1E_D676              ; $D690  D0 E4

loc_1E_D692:
    LDY $49                      ; $D692  A4 49
    BEQ loc_1E_D6A9              ; $D694  F0 13

loc_1E_D696:
    LDA $B5FF,Y                  ; $D696  B9 FF B5
    CMP $09                      ; $D699  C5 09
    BCC loc_1E_D6A9              ; $D69B  90 0C
    BNE loc_1E_D6A6              ; $D69D  D0 07
    LDA $B6FF,Y                  ; $D69F  B9 FF B6
    CMP $08                      ; $D6A2  C5 08
    BCC loc_1E_D6A9              ; $D6A4  90 03

loc_1E_D6A6:
    DEY                          ; $D6A6  88
    BNE loc_1E_D696              ; $D6A7  D0 ED

loc_1E_D6A9:
    STY $49                      ; $D6A9  84 49

loc_1E_D6AB:
    LDY $4C                      ; $D6AB  A4 4C
    BEQ loc_1E_D6CC              ; $D6AD  F0 1D
    LDA $B9FF,Y                  ; $D6AF  B9 FF B9
    CMP $0B                      ; $D6B2  C5 0B
    BCC loc_1E_D6CC              ; $D6B4  90 16
    BNE loc_1E_D6BF              ; $D6B6  D0 07
    LDA $BA3F,Y                  ; $D6B8  B9 3F BA
    CMP $0A                      ; $D6BB  C5 0A
    BCC loc_1E_D6CC              ; $D6BD  90 0D

loc_1E_D6BF:
    LDA $013F,Y                  ; $D6BF  B9 3F 01
    BEQ loc_1E_D6C8              ; $D6C2  F0 04
    DEY                          ; $D6C4  88
    JSR sub_1E_D7CC              ; $D6C5  20 CC D7

loc_1E_D6C8:
    DEC $4C                      ; $D6C8  C6 4C
    BNE loc_1E_D6AB              ; $D6CA  D0 DF

loc_1E_D6CC:
    LDY $4D                      ; $D6CC  A4 4D
    BEQ loc_1E_D6E3              ; $D6CE  F0 13

loc_1E_D6D0:
    LDA $B9FF,Y                  ; $D6D0  B9 FF B9
    CMP $09                      ; $D6D3  C5 09
    BCC loc_1E_D6E3              ; $D6D5  90 0C
    BNE loc_1E_D6E0              ; $D6D7  D0 07
    LDA $BA3F,Y                  ; $D6D9  B9 3F BA
    CMP $08                      ; $D6DC  C5 08
    BCC loc_1E_D6E3              ; $D6DE  90 03

loc_1E_D6E0:
    DEY                          ; $D6E0  88
    BNE loc_1E_D6D0              ; $D6E1  D0 ED

loc_1E_D6E3:
    STY $4D                      ; $D6E3  84 4D
    JMP loc_1E_D74D              ; $D6E5  4C 4D D7


loc_1E_D6E8:
    LDY $49                      ; $D6E8  A4 49
    LDA $09                      ; $D6EA  A5 09
    CMP $B600,Y                  ; $D6EC  D9 00 B6
    BCC loc_1E_D701              ; $D6EF  90 10
    BNE loc_1E_D6FA              ; $D6F1  D0 07
    LDA $08                      ; $D6F3  A5 08
    CMP $B700,Y                  ; $D6F5  D9 00 B7
    BCC loc_1E_D701              ; $D6F8  90 07

loc_1E_D6FA:
    JSR sub_1E_D753              ; $D6FA  20 53 D7
    INC $49                      ; $D6FD  E6 49
    BNE loc_1E_D6E8              ; $D6FF  D0 E7

loc_1E_D701:
    LDY $48                      ; $D701  A4 48

loc_1E_D703:
    LDA $0B                      ; $D703  A5 0B
    CMP $B600,Y                  ; $D705  D9 00 B6
    BCC loc_1E_D716              ; $D708  90 0C
    BNE loc_1E_D713              ; $D70A  D0 07
    LDA $0A                      ; $D70C  A5 0A
    CMP $B700,Y                  ; $D70E  D9 00 B7
    BCC loc_1E_D716              ; $D711  90 03

loc_1E_D713:
    INY                          ; $D713  C8
    BNE loc_1E_D703              ; $D714  D0 ED

loc_1E_D716:
    STY $48                      ; $D716  84 48

loc_1E_D718:
    LDY $4D                      ; $D718  A4 4D
    LDA $09                      ; $D71A  A5 09
    CMP $BA00,Y                  ; $D71C  D9 00 BA
    BCC loc_1E_D736              ; $D71F  90 15
    BNE loc_1E_D72A              ; $D721  D0 07
    LDA $08                      ; $D723  A5 08
    CMP $BA40,Y                  ; $D725  D9 40 BA
    BCC loc_1E_D736              ; $D728  90 0C

loc_1E_D72A:
    LDA $0140,Y                  ; $D72A  B9 40 01
    BEQ loc_1E_D732              ; $D72D  F0 03
    JSR sub_1E_D7CC              ; $D72F  20 CC D7

loc_1E_D732:
    INC $4D                      ; $D732  E6 4D
    BNE loc_1E_D718              ; $D734  D0 E2

loc_1E_D736:
    LDY $4C                      ; $D736  A4 4C

loc_1E_D738:
    LDA $0B                      ; $D738  A5 0B
    CMP $BA00,Y                  ; $D73A  D9 00 BA
    BCC loc_1E_D74B              ; $D73D  90 0C
    BNE loc_1E_D748              ; $D73F  D0 07
    LDA $0A                      ; $D741  A5 0A
    CMP $BA40,Y                  ; $D743  D9 40 BA
    BCC loc_1E_D74B              ; $D746  90 03

loc_1E_D748:
    INY                          ; $D748  C8
    BNE loc_1E_D738              ; $D749  D0 ED

loc_1E_D74B:
    STY $4C                      ; $D74B  84 4C

loc_1E_D74D:
    LDA #$0E                     ; $D74D  A9 0E
    JSR sub_1E_C000              ; $D74F  20 00 C0
    RTS                          ; $D752  60


sub_1E_D753:
    TYA                          ; $D753  98
    LDX #$0F                     ; $D754  A2 0F

loc_1E_D756:
    CMP $0100,X                  ; $D756  DD 00 01
    BEQ loc_1E_D7CB              ; $D759  F0 70
    DEX                          ; $D75B  CA
    BPL loc_1E_D756              ; $D75C  10 F8
    JSR sub_1E_DA43              ; $D75E  20 43 DA
    BCS loc_1E_D7CB              ; $D761  B0 68
    TYA                          ; $D763  98
    STA $0100,X                  ; $D764  9D 00 01
    LDA $B600,Y                  ; $D767  B9 00 B6
    STA $0450,X                  ; $D76A  9D 50 04
    LDA $B700,Y                  ; $D76D  B9 00 B7
    STA $0470,X                  ; $D770  9D 70 04
    LDA $B800,Y                  ; $D773  B9 00 B8
    STA $04B0,X                  ; $D776  9D B0 04
    LDA $B900,Y                  ; $D779  B9 00 B9

sub_1E_D77C:
    STA $0410,X                  ; $D77C  9D 10 04
    TAY                          ; $D77F  A8
    PHA                          ; $D780  48
    LDA $D805,Y                  ; $D781  B9 05 D8
    STA $0430,X                  ; $D784  9D 30 04
    LDA $D981,Y                  ; $D787  B9 81 D9
    STA $06F0,X                  ; $D78A  9D F0 06
    LDA #$14                     ; $D78D  A9 14
    STA $06D0,X                  ; $D78F  9D D0 06
    LDA $D885,Y                  ; $D792  B9 85 D8
    TAY                          ; $D795  A8
    LDA $DA01,Y                  ; $D796  B9 01 DA
    STA $0610,X                  ; $D799  9D 10 06
    LDA $DA02,Y                  ; $D79C  B9 02 DA
    STA $0630,X                  ; $D79F  9D 30 06
    PLA                          ; $D7A2  68
    TAY                          ; $D7A3  A8
    LDA $D901,Y                  ; $D7A4  B9 01 D9
    TAY                          ; $D7A7  A8
    LDA $DA21,Y                  ; $D7A8  B9 21 DA
    STA $0650,X                  ; $D7AB  9D 50 06
    LDA $DA22,Y                  ; $D7AE  B9 22 DA
    STA $0670,X                  ; $D7B1  9D 70 06
    LDA #$00                     ; $D7B4  A9 00
    STA $06B0,X                  ; $D7B6  9D B0 06
    STA $0690,X                  ; $D7B9  9D 90 06
    STA $04F0,X                  ; $D7BC  9D F0 04
    STA $0120,X                  ; $D7BF  9D 20 01
    STA $0490,X                  ; $D7C2  9D 90 04
    STA $04D0,X                  ; $D7C5  9D D0 04
    STA $0110,X                  ; $D7C8  9D 10 01

loc_1E_D7CB:
    RTS                          ; $D7CB  60


sub_1E_D7CC:
    TYA                          ; $D7CC  98
    LDX #$0F                     ; $D7CD  A2 0F

loc_1E_D7CF:
    CMP $0130,X                  ; $D7CF  DD 30 01
    BEQ loc_1E_D7CB              ; $D7D2  F0 F7
    DEX                          ; $D7D4  CA
    BPL loc_1E_D7CF              ; $D7D5  10 F8
    JSR sub_1E_DA43              ; $D7D7  20 43 DA
    BCS loc_1E_D7CB              ; $D7DA  B0 EF
    TYA                          ; $D7DC  98
    PHA                          ; $D7DD  48
    STA $0130,X                  ; $D7DE  9D 30 01
    LDA $BA00,Y                  ; $D7E1  B9 00 BA
    STA $0450,X                  ; $D7E4  9D 50 04
    LDA $BA40,Y                  ; $D7E7  B9 40 BA
    STA $0470,X                  ; $D7EA  9D 70 04
    LDA $BA80,Y                  ; $D7ED  B9 80 BA
    STA $04B0,X                  ; $D7F0  9D B0 04
    LDA $BAC0,Y                  ; $D7F3  B9 C0 BA
    JSR sub_1E_D77C              ; $D7F6  20 7C D7
    PLA                          ; $D7F9  68
    STA $0120,X                  ; $D7FA  9D 20 01
    TAY                          ; $D7FD  A8
    LDA $0140,Y                  ; $D7FE  B9 40 01
    STA $06D0,X                  ; $D801  9D D0 06
    RTS                          ; $D804  60

    .byte $83,$83,$A0,$A0,$83,$A0,$80,$A0,$83,$A0,$83,$83,$83,$87,$80,$83  ; $D805
    .byte $83,$A0,$80,$80,$A0,$A0,$8B,$87,$81,$83,$80,$81,$A0,$A3,$A0,$87  ; $D815
    .byte $A0,$A0,$83,$83,$85,$A0,$A0,$A0,$A0,$83,$87,$A0,$87,$92,$B0,$B0  ; $D825
    .byte $83,$87,$AB,$87,$8F,$81,$83,$A0,$83,$A0,$80,$84,$83,$83,$80,$85  ; $D835
    .byte $A0,$A0,$A0,$A0,$8B,$83,$83,$A0,$83,$83,$A0,$83,$C3,$85,$83,$8F  ; $D845
    .byte $83,$83,$A1,$A0,$A0,$A0,$A0,$92,$81,$81,$81,$85,$81,$8B,$81,$81  ; $D855
    .byte $80,$8B,$81,$80,$A0,$8B,$8B,$80,$81,$8B,$87,$81,$80,$83,$81,$81  ; $D865
    .byte $80,$A3,$81,$81,$85,$00,$81,$81,$81,$81,$81,$81,$81,$81,$81,$00  ; $D875
    .byte $00,$02,$02,$02,$02,$02,$02,$02,$02,$02,$04,$06,$02,$02,$02,$02  ; $D885
    .byte $02,$02,$02,$02,$02,$08,$02,$02,$02,$02,$02,$0A,$02,$02,$02,$0C  ; $D895
    .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$1C,$0E,$0E  ; $D8A5
    .byte $02,$10,$02,$02,$02,$02,$02,$02,$12,$02,$02,$14,$02,$02,$02,$16  ; $D8B5
    .byte $02,$02,$02,$02,$02,$18,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02  ; $D8C5
    .byte $02,$02,$02,$1A,$1A,$1A,$02,$0E,$02,$02,$08,$14,$02,$02,$02,$02  ; $D8D5
    .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$1E,$02,$02  ; $D8E5
    .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$02,$02,$02  ; $D8F5
    .byte $04,$02,$04,$04,$06,$04,$02,$08,$02,$08,$0A,$02,$02,$02,$02,$02  ; $D905
    .byte $02,$02,$02,$02,$02,$01,$02,$0E,$0C,$02,$02,$02,$02,$02,$02,$02  ; $D915
    .byte $10,$02,$02,$02,$02,$02,$02,$02,$04,$02,$02,$02,$02,$02,$02,$02  ; $D925
    .byte $02,$02,$02,$02,$02,$02,$0A,$10,$02,$02,$02,$10,$02,$02,$02,$02  ; $D935
    .byte $20,$02,$02,$02,$14,$16,$02,$02,$02,$02,$02,$18,$02,$02,$02,$02  ; $D945
    .byte $02,$02,$02,$02,$02,$02,$02,$1C,$02,$02,$02,$02,$02,$02,$10,$02  ; $D955
    .byte $02,$02,$02,$14,$02,$02,$02,$1E,$02,$02,$02,$02,$02,$02,$02,$02  ; $D965
    .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$00,$00,$00,$01  ; $D975
    .byte $01,$01,$01,$01,$02,$02,$01,$01,$01,$04,$00,$05,$06,$01,$01,$01  ; $D985
    .byte $07,$07,$02,$01,$04,$08,$02,$04,$08,$09,$00,$00,$00,$00,$07,$09  ; $D995
    .byte $07,$00,$00,$00,$00,$09,$00,$00,$00,$10,$00,$00,$05,$07,$0A,$07  ; $D9A5
    .byte $07,$04,$09,$00,$07,$00,$07,$04,$04,$01,$03,$07,$0B,$0B,$00,$00  ; $D9B5
    .byte $07,$07,$07,$00,$0C,$0C,$00,$01,$01,$04,$0D,$01,$0E,$0F,$0A,$00  ; $D9C5
    .byte $00,$00,$13,$10,$04,$04,$0E,$07,$07,$07,$07,$07,$00,$12,$07,$00  ; $D9D5
    .byte $00,$13,$00,$00,$02,$00,$07,$09,$00,$04,$04,$04,$00,$0D,$04,$04  ; $D9E5
    .byte $04,$00,$07,$04,$07,$04,$07,$07,$15,$15,$15,$00,$01,$E3,$00,$00  ; $D9F5
    .byte $00,$83,$00,$C4,$04,$40,$03,$80,$01,$A9,$F0,$E0,$00,$41,$02,$0C  ; $DA05
    .byte $01,$00,$01,$40,$00,$6C,$F0,$F0,$F0,$C0,$01,$77,$00,$C7,$00,$00  ; $DA15
    .byte $FF,$5D,$FE,$98,$04,$E6,$01,$00,$F8,$00,$FC,$00,$04,$00,$01,$47  ; $DA25
    .byte $08,$00,$F8,$00,$02,$D4,$02,$00,$03,$76,$FC,$8A,$00,$20  ; $DA35

sub_1E_DA43:
    LDX #$0F                     ; $DA43  A2 0F

loc_1E_DA45:
    LDA $0430,X                  ; $DA45  BD 30 04
    BPL loc_1E_DA4F              ; $DA48  10 05
    DEX                          ; $DA4A  CA
    BPL loc_1E_DA45              ; $DA4B  10 F8
    SEC                          ; $DA4D  38
    RTS                          ; $DA4E  60


loc_1E_DA4F:
    CLC                          ; $DA4F  18
    RTS                          ; $DA50  60


sub_1E_DA51:
    LDA $F9                      ; $DA51  A5 F9
    BNE loc_1E_DA6A              ; $DA53  D0 15
    LDX $A9                      ; $DA55  A6 A9
    BEQ loc_1E_DA5D              ; $DA57  F0 04
    LDA $9B,X                    ; $DA59  B5 9B
    BEQ loc_1E_DA6A              ; $DA5B  F0 0D

loc_1E_DA5D:
    LDA $DCB8,X                  ; $DA5D  BD B8 DC
    STA $08                      ; $DA60  85 08
    LDA $DCC4,X                  ; $DA62  BD C4 DC
    STA $09                      ; $DA65  85 09
    JMP ($0008)                  ; $DA67  6C 08 00


loc_1E_DA6A:
    SEC                          ; $DA6A  38
    RTS                          ; $DA6B  60

    LDA $27                      ; $DA6C  A5 27
    AND #$02                     ; $DA6E  29 02
    BEQ loc_1E_DA9D              ; $DA70  F0 2B
    LDX #$04                     ; $DA72  A2 04

loc_1E_DA74:
    LDA $0420,X                  ; $DA74  BD 20 04
    BPL loc_1E_DA80              ; $DA77  10 07
    DEX                          ; $DA79  CA
    CPX #$01                     ; $DA7A  E0 01
    BNE loc_1E_DA74              ; $DA7C  D0 F6
    BEQ loc_1E_DA9D              ; $DA7E  F0 1D

loc_1E_DA80:
    LDA #$24                     ; $DA80  A9 24
    JSR sub_1E_C051              ; $DA82  20 51 C0
    LDY #$00                     ; $DA85  A0 00
    JSR sub_1E_D3E0              ; $DA87  20 E0 D3

loc_1E_DA8A:
    LDA #$0F                     ; $DA8A  A9 0F
    STA $36                      ; $DA8C  85 36
    LDA #$01                     ; $DA8E  A9 01

loc_1E_DA90:
    STA $3D                      ; $DA90  85 3D
    LDX $2C                      ; $DA92  A6 2C
    CLC                          ; $DA94  18
    ADC $D3D4,X                  ; $DA95  7D D4 D3
    STA $0400                    ; $DA98  8D 00 04
    CLC                          ; $DA9B  18
    RTS                          ; $DA9C  60


loc_1E_DA9D:
    SEC                          ; $DA9D  38
    RTS                          ; $DA9E  60

    LDA $27                      ; $DA9F  A5 27
    AND #$02                     ; $DAA1  29 02
    BEQ loc_1E_DAB1              ; $DAA3  F0 0C
    LDX #$02                     ; $DAA5  A2 02
    LDY #$01                     ; $DAA7  A0 01
    JSR sub_1E_D3E0              ; $DAA9  20 E0 D3
    LDA #$82                     ; $DAAC  A9 82
    STA $0420,X                  ; $DAAE  9D 20 04

loc_1E_DAB1:
    SEC                          ; $DAB1  38
    RTS                          ; $DAB2  60

    LDA $27                      ; $DAB3  A5 27
    AND #$02                     ; $DAB5  29 02
    BEQ loc_1E_DAE4              ; $DAB7  F0 2B
    LDX #$04                     ; $DAB9  A2 04

loc_1E_DABB:
    LDA $0420,X                  ; $DABB  BD 20 04
    BMI loc_1E_DAE4              ; $DABE  30 24
    DEX                          ; $DAC0  CA
    CPX #$01                     ; $DAC1  E0 01
    BNE loc_1E_DABB              ; $DAC3  D0 F6
    LDX #$04                     ; $DAC5  A2 04

loc_1E_DAC7:
    STX $01                      ; $DAC7  86 01
    LDY #$02                     ; $DAC9  A0 02
    JSR sub_1E_D3E0              ; $DACB  20 E0 D3
    LDX $01                      ; $DACE  A6 01
    DEX                          ; $DAD0  CA
    CPX #$01                     ; $DAD1  E0 01
    BNE loc_1E_DAC7              ; $DAD3  D0 F2
    LDA #$3F                     ; $DAD5  A9 3F
    JSR sub_1E_C051              ; $DAD7  20 51 C0
    SEC                          ; $DADA  38
    LDA $9D                      ; $DADB  A5 9D
    SBC #$02                     ; $DADD  E9 02
    STA $9D                      ; $DADF  85 9D
    JMP loc_1E_DA8A              ; $DAE1  4C 8A DA


loc_1E_DAE4:
    SEC                          ; $DAE4  38
    RTS                          ; $DAE5  60

    .byte $A5,$27,$29,$02,$F0,$1C,$AD,$22,$04,$30,$17,$38,$A5,$9E,$E9,$03  ; $DAE6
    .byte $90,$10,$A2,$05,$86,$02,$A0,$03,$20,$E0,$D3,$A6,$02,$CA,$E0,$01  ; $DAF6
    .byte $D0,$F2,$38,$60  ; $DB06
    LDA $27                      ; $DB0A  A5 27
    AND #$02                     ; $DB0C  29 02
    BEQ loc_1E_DB39              ; $DB0E  F0 29
    LDX #$03                     ; $DB10  A2 03

loc_1E_DB12:
    LDA $0420,X                  ; $DB12  BD 20 04
    BPL loc_1E_DB1E              ; $DB15  10 07
    DEX                          ; $DB17  CA
    CPX #$01                     ; $DB18  E0 01
    BNE loc_1E_DB12              ; $DB1A  D0 F6
    BEQ loc_1E_DB39              ; $DB1C  F0 1B

loc_1E_DB1E:
    LDY #$04                     ; $DB1E  A0 04
    JSR sub_1E_D3E0              ; $DB20  20 E0 D3
    LDA #$24                     ; $DB23  A9 24
    JSR sub_1E_C051              ; $DB25  20 51 C0
    INC $AC                      ; $DB28  E6 AC
    LDA $AC                      ; $DB2A  A5 AC
    CMP #$02                     ; $DB2C  C9 02
    BNE loc_1E_DB36              ; $DB2E  D0 06
    LDA #$00                     ; $DB30  A9 00
    STA $AC                      ; $DB32  85 AC
    DEC $9F                      ; $DB34  C6 9F

loc_1E_DB36:
    JMP loc_1E_DA8A              ; $DB36  4C 8A DA


loc_1E_DB39:
    SEC                          ; $DB39  38
    RTS                          ; $DB3A  60

    LDA $27                      ; $DB3B  A5 27
    AND #$02                     ; $DB3D  29 02
    BNE loc_1E_DB4B              ; $DB3F  D0 0A
    LDA $AB                      ; $DB41  A5 AB
    CMP #$0B                     ; $DB43  C9 0B
    BEQ loc_1E_DB4B              ; $DB45  F0 04
    INC $AB                      ; $DB47  E6 AB
    CLC                          ; $DB49  18
    RTS                          ; $DB4A  60


loc_1E_DB4B:
    LDX #$05                     ; $DB4B  A2 05

loc_1E_DB4D:
    LDA $0420,X                  ; $DB4D  BD 20 04
    BPL loc_1E_DB59              ; $DB50  10 07
    DEX                          ; $DB52  CA
    CPX #$01                     ; $DB53  E0 01
    BNE loc_1E_DB4D              ; $DB55  D0 F6
    BEQ loc_1E_DB78              ; $DB57  F0 1F

loc_1E_DB59:
    LDY #$05                     ; $DB59  A0 05
    JSR sub_1E_D3E0              ; $DB5B  20 E0 D3
    LDA #$24                     ; $DB5E  A9 24
    JSR sub_1E_C051              ; $DB60  20 51 C0
    INC $AC                      ; $DB63  E6 AC
    LDA $AC                      ; $DB65  A5 AC
    CMP #$08                     ; $DB67  C9 08
    BNE loc_1E_DB71              ; $DB69  D0 06
    LDA #$00                     ; $DB6B  A9 00
    STA $AC                      ; $DB6D  85 AC
    DEC $A0                      ; $DB6F  C6 A0

loc_1E_DB71:
    LDA #$00                     ; $DB71  A9 00
    STA $AB                      ; $DB73  85 AB
    JMP loc_1E_DA8A              ; $DB75  4C 8A DA


loc_1E_DB78:
    SEC                          ; $DB78  38
    RTS                          ; $DB79  60

    .byte $A5,$27,$29,$02,$F0,$1D,$AD,$22,$04,$30,$18,$38,$A5,$A3,$E9,$04  ; $DB7A
    .byte $90,$11,$85,$A3,$A2,$02,$A0,$06,$20,$E0,$D3,$A9,$24,$20,$51,$C0  ; $DB8A
    .byte $4C,$8A,$DA,$38,$60  ; $DB9A
    LDA $27                      ; $DB9F  A5 27
    AND #$02                     ; $DBA1  29 02
    BEQ loc_1E_DBEF              ; $DBA3  F0 4A
    LDX #$04                     ; $DBA5  A2 04

loc_1E_DBA7:
    LDA $0420,X                  ; $DBA7  BD 20 04
    BPL loc_1E_DBB3              ; $DBAA  10 07
    DEX                          ; $DBAC  CA
    CPX #$01                     ; $DBAD  E0 01
    BNE loc_1E_DBA7              ; $DBAF  D0 F6
    BEQ loc_1E_DBEF              ; $DBB1  F0 3C

loc_1E_DBB3:
    LDY #$07                     ; $DBB3  A0 07
    JSR sub_1E_D3E0              ; $DBB5  20 E0 D3
    LDA #$23                     ; $DBB8  A9 23
    JSR sub_1E_C051              ; $DBBA  20 51 C0
    INC $AC                      ; $DBBD  E6 AC
    LDA $AC                      ; $DBBF  A5 AC
    CMP #$04                     ; $DBC1  C9 04
    BNE loc_1E_DBCB              ; $DBC3  D0 06
    LDA #$00                     ; $DBC5  A9 00
    STA $AC                      ; $DBC7  85 AC
    DEC $A2                      ; $DBC9  C6 A2

loc_1E_DBCB:
    LDA $23                      ; $DBCB  A5 23
    AND #$F0                     ; $DBCD  29 F0
    LSR A                        ; $DBCF  4A
    LSR A                        ; $DBD0  4A
    LSR A                        ; $DBD1  4A
    LSR A                        ; $DBD2  4A
    TAY                          ; $DBD3  A8
    LDA $DBF1,Y                  ; $DBD4  B9 F1 DB
    STA $0660,X                  ; $DBD7  9D 60 06
    LDA $DC01,Y                  ; $DBDA  B9 01 DC
    STA $0640,X                  ; $DBDD  9D 40 06
    LDA $DC11,Y                  ; $DBE0  B9 11 DC
    STA $0620,X                  ; $DBE3  9D 20 06
    LDA $DC21,Y                  ; $DBE6  B9 21 DC
    STA $0600,X                  ; $DBE9  9D 00 06
    JMP loc_1E_DC4D              ; $DBEC  4C 4D DC


loc_1E_DBEF:
    SEC                          ; $DBEF  38
    RTS                          ; $DBF0  60

    .byte $00,$00,$00,$00,$00,$D4,$2C,$00,$00,$D4,$2C,$00,$00,$00,$00,$00  ; $DBF1
    .byte $00,$04,$FC,$00,$00,$02,$FD,$00,$00,$02,$FD,$00,$00,$00,$00,$00  ; $DC01
    .byte $00,$00,$00,$00,$00,$D4,$D4,$00,$00,$D4,$D4,$00,$00,$00,$00,$00  ; $DC11
    .byte $04,$00,$00,$00,$04,$02,$02,$00,$04,$02,$02,$00,$00,$00,$00,$00  ; $DC21
    LDA $27                      ; $DC31  A5 27
    AND #$02                     ; $DC33  29 02
    BEQ loc_1E_DC56              ; $DC35  F0 1F
    LDX #$02                     ; $DC37  A2 02
    LDA $0422                    ; $DC39  AD 22 04
    BMI loc_1E_DC56              ; $DC3C  30 18
    LDY #$08                     ; $DC3E  A0 08
    JSR sub_1E_D3E0              ; $DC40  20 E0 D3
    LDA #$01                     ; $DC43  A9 01
    STA $05A6                    ; $DC45  8D A6 05
    LDA #$21                     ; $DC48  A9 21
    JSR sub_1E_C051              ; $DC4A  20 51 C0

loc_1E_DC4D:
    LDA #$0F                     ; $DC4D  A9 0F
    STA $36                      ; $DC4F  85 36
    LDA #$03                     ; $DC51  A9 03
    JMP loc_1E_DA90              ; $DC53  4C 90 DA


loc_1E_DC56:
    SEC                          ; $DC56  38
    RTS                          ; $DC57  60

    .byte $A5,$27,$29,$02,$F0,$F8,$A2,$04,$BD,$20,$04,$10,$07,$CA,$E0,$01  ; $DC58
    .byte $D0,$F6,$F0,$0F,$A0,$09,$20,$E0,$D3,$38,$A5,$A4,$E9,$02,$85,$A4  ; $DC68
    .byte $4C,$4D,$DC,$38,$60  ; $DC78
    LDA $27                      ; $DC7D  A5 27
    AND #$02                     ; $DC7F  29 02
    BEQ loc_1E_DC9C              ; $DC81  F0 19
    LDA $0422                    ; $DC83  AD 22 04
    BMI loc_1E_DC9C              ; $DC86  30 14
    LDX #$02                     ; $DC88  A2 02
    LDY #$0A                     ; $DC8A  A0 0A
    JSR sub_1E_D3E0              ; $DC8C  20 E0 D3
    LDA #$3E                     ; $DC8F  A9 3E
    STA $04E2                    ; $DC91  8D E2 04
    LDA #$13                     ; $DC94  A9 13
    STA $06C2                    ; $DC96  8D C2 06
    JMP loc_1E_DC4D              ; $DC99  4C 4D DC


loc_1E_DC9C:
    RTS                          ; $DC9C  60

    LDA $27                      ; $DC9D  A5 27
    AND #$02                     ; $DC9F  29 02
    BEQ loc_1E_DCB7              ; $DCA1  F0 14
    LDA $0422                    ; $DCA3  AD 22 04
    BMI loc_1E_DCB7              ; $DCA6  30 0F
    LDX #$02                     ; $DCA8  A2 02
    LDY #$0B                     ; $DCAA  A0 0B
    JSR sub_1E_D3E0              ; $DCAC  20 E0 D3
    LDA #$1F                     ; $DCAF  A9 1F
    STA $06C2                    ; $DCB1  8D C2 06
    JMP loc_1E_DC4D              ; $DCB4  4C 4D DC


loc_1E_DCB7:
    RTS                          ; $DCB7  60

    .byte $6C,$9F,$B3,$E6,$0A,$3B,$31,$9F,$7A,$58,$7D,$9D,$DA,$DA,$DA,$DA  ; $DCB8
    .byte $DB,$DB,$DC,$DB,$DB,$DC,$DC,$DC  ; $DCC8

sub_1E_DCD0:
    LDX #$0F                     ; $DCD0  A2 0F

loc_1E_DCD2:
    STX $2B                      ; $DCD2  86 2B
    LDA $0420,X                  ; $DCD4  BD 20 04
    BPL loc_1E_DCE9              ; $DCD7  10 10
    AND #$02                     ; $DCD9  29 02
    BNE loc_1E_DCF1              ; $DCDB  D0 14
    SEC                          ; $DCDD  38
    LDA $0460,X                  ; $DCDE  BD 60 04
    SBC $1F                      ; $DCE1  E5 1F
    STA $06E0,X                  ; $DCE3  9D E0 06
    JSR sub_1F_EEEF              ; $DCE6  20 EF EE

loc_1E_DCE9:
    LDX $2B                      ; $DCE9  A6 2B
    DEX                          ; $DCEB  CA
    CPX #$01                     ; $DCEC  E0 01
    BNE loc_1E_DCD2              ; $DCEE  D0 E2
    RTS                          ; $DCF0  60


loc_1E_DCF1:
    LDA #$DC                     ; $DCF1  A9 DC
    PHA                          ; $DCF3  48
    LDA #$E8                     ; $DCF4  A9 E8
    PHA                          ; $DCF6  48
    SEC                          ; $DCF7  38
    LDA $0460,X                  ; $DCF8  BD 60 04
    SBC $1F                      ; $DCFB  E5 1F
    STA $06E0,X                  ; $DCFD  9D E0 06
    SEC                          ; $DD00  38
    LDA $0400,X                  ; $DD01  BD 00 04
    SBC #$2F                     ; $DD04  E9 2F
    TAY                          ; $DD06  A8
    LDA $DD14,Y                  ; $DD07  B9 14 DD
    STA $08                      ; $DD0A  85 08
    LDA $DD24,Y                  ; $DD0C  B9 24 DD
    STA $09                      ; $DD0F  85 09
    JMP ($0008)                  ; $DD11  6C 08 00

    .byte $34,$34,$48,$74,$6F,$CE,$16,$58,$58,$90,$10,$DD,$71,$E4,$E4,$E8  ; $DD14
    .byte $DD,$DD,$DE,$DE,$DF,$DF,$E0,$E1,$E1,$E1,$E2,$E2,$E4,$E4,$E4,$E4  ; $DD24
    LDA $04E0,X                  ; $DD34  BD E0 04
    BEQ loc_1E_DD3C              ; $DD37  F0 03
    JMP loc_1E_DDEC              ; $DD39  4C EC DD


loc_1E_DD3C:
    LDA #$00                     ; $DD3C  A9 00
    STA $06A0,X                  ; $DD3E  9D A0 06
    STA $0680,X                  ; $DD41  9D 80 06
    LDA $AC                      ; $DD44  A5 AC
    CMP #$FF                     ; $DD46  C9 FF
    BEQ loc_1E_DD4C              ; $DD48  F0 02
    INC $AC                      ; $DD4A  E6 AC

loc_1E_DD4C:
    LDY #$02                     ; $DD4C  A0 02
    LDA $AC                      ; $DD4E  A5 AC
    CMP #$7D                     ; $DD50  C9 7D
    BCC loc_1E_DD5C              ; $DD52  90 08
    INY                          ; $DD54  C8
    INY                          ; $DD55  C8
    CMP #$BB                     ; $DD56  C9 BB
    BCC loc_1E_DD5C              ; $DD58  90 02
    INY                          ; $DD5A  C8
    INY                          ; $DD5B  C8

loc_1E_DD5C:
    STY $00                      ; $DD5C  84 00
    LDA $1C                      ; $DD5E  A5 1C
    AND #$04                     ; $DD60  29 04
    BNE loc_1E_DD66              ; $DD62  D0 02
    LDY #$00                     ; $DD64  A0 00

loc_1E_DD66:
    JSR sub_1E_DE18              ; $DD66  20 18 DE
    LDA $04A0                    ; $DD69  AD A0 04
    STA $04A0,X                  ; $DD6C  9D A0 04
    LDA $0460                    ; $DD6F  AD 60 04
    STA $0460,X                  ; $DD72  9D 60 04
    LDA $0440                    ; $DD75  AD 40 04
    STA $0440,X                  ; $DD78  9D 40 04
    LDA $00                      ; $DD7B  A5 00
    LSR A                        ; $DD7D  4A
    TAY                          ; $DD7E  A8
    LDA $DE44,Y                  ; $DD7F  B9 44 DE
    CMP $9C                      ; $DD82  C5 9C
    BCC loc_1E_DD93              ; $DD84  90 0D
    BEQ loc_1E_DD93              ; $DD86  F0 0B
    LDY #$00                     ; $DD88  A0 00
    STY $AC                      ; $DD8A  84 AC
    JSR sub_1E_DE18              ; $DD8C  20 18 DE
    LSR $0420,X                  ; $DD8F  5E 20 04
    RTS                          ; $DD92  60


loc_1E_DD93:
    LDA $23                      ; $DD93  A5 23
    AND #$02                     ; $DD95  29 02
    BEQ loc_1E_DD9A              ; $DD97  F0 01
    RTS                          ; $DD99  60


loc_1E_DD9A:
    LDY #$00                     ; $DD9A  A0 00
    STY $AC                      ; $DD9C  84 AC
    JSR sub_1E_DE18              ; $DD9E  20 18 DE
    LSR $0422                    ; $DDA1  4E 22 04
    LDX #$04                     ; $DDA4  A2 04

loc_1E_DDA6:
    LDA $0420,X                  ; $DDA6  BD 20 04
    BPL loc_1E_DDB1              ; $DDA9  10 06
    DEX                          ; $DDAB  CA
    CPX #$02                     ; $DDAC  E0 02
    BNE loc_1E_DDA6              ; $DDAE  D0 F6

loc_1E_DDB0:
    RTS                          ; $DDB0  60


loc_1E_DDB1:
    LDA $F9                      ; $DDB1  A5 F9
    BNE loc_1E_DDD3              ; $DDB3  D0 1E
    LDY #$01                     ; $DDB5  A0 01
    JSR sub_1E_D3E0              ; $DDB7  20 E0 D3
    LDA $00                      ; $DDBA  A5 00
    LSR A                        ; $DDBC  4A
    STA $04E0,X                  ; $DDBD  9D E0 04
    STA $0590,X                  ; $DDC0  9D 90 05
    TAY                          ; $DDC3  A8
    LDA $DE41,Y                  ; $DDC4  B9 41 DE
    STA $06A0,X                  ; $DDC7  9D A0 06
    SEC                          ; $DDCA  38
    LDA $0460,X                  ; $DDCB  BD 60 04
    SBC $1F                      ; $DDCE  E5 1F
    STA $06E0,X                  ; $DDD0  9D E0 06

loc_1E_DDD3:
    SEC                          ; $DDD3  38
    LDA $9C                      ; $DDD4  A5 9C
    SBC $DE44,Y                  ; $DDD6  F9 44 DE
    STA $9C                      ; $DDD9  85 9C
    LDA #$38                     ; $DDDB  A9 38
    JSR sub_1E_C051              ; $DDDD  20 51 C0
    LDA #$04                     ; $DDE0  A9 04
    STA $0600,X                  ; $DDE2  9D 00 06
    LDA $2C                      ; $DDE5  A5 2C
    BEQ loc_1E_DDB0              ; $DDE7  F0 C7
    JMP loc_1E_DA8A              ; $DDE9  4C 8A DA


loc_1E_DDEC:
    CMP #$02                     ; $DDEC  C9 02
    BCS loc_1E_DDFB              ; $DDEE  B0 0B
    LDA $06A0,X                  ; $DDF0  BD A0 06
    CMP #$03                     ; $DDF3  C9 03
    BNE loc_1E_DE14              ; $DDF5  D0 1D
    LDA #$01                     ; $DDF7  A9 01
    BNE loc_1E_DE11              ; $DDF9  D0 16

loc_1E_DDFB:
    BNE loc_1E_DE08              ; $DDFB  D0 0B
    LDA $06A0,X                  ; $DDFD  BD A0 06
    CMP #$06                     ; $DE00  C9 06
    BNE loc_1E_DE14              ; $DE02  D0 10
    LDA #$04                     ; $DE04  A9 04
    BNE loc_1E_DE11              ; $DE06  D0 09

loc_1E_DE08:
    LDA $06A0,X                  ; $DE08  BD A0 06
    CMP #$09                     ; $DE0B  C9 09
    BNE loc_1E_DE14              ; $DE0D  D0 05
    LDA #$07                     ; $DE0F  A9 07

loc_1E_DE11:
    STA $06A0,X                  ; $DE11  9D A0 06

loc_1E_DE14:
    JSR sub_1F_EEEF              ; $DE14  20 EF EE
    RTS                          ; $DE17  60


sub_1E_DE18:
    LDA $DE39,Y                  ; $DE18  B9 39 DE
    STA $0367                    ; $DE1B  8D 67 03
    LDA $DE3A,Y                  ; $DE1E  B9 3A DE
    STA $0369                    ; $DE21  8D 69 03
    LDA $1C                      ; $DE24  A5 1C
    AND #$07                     ; $DE26  29 07
    BNE loc_1E_DE34              ; $DE28  D0 0A
    LDA $00                      ; $DE2A  A5 00
    LSR A                        ; $DE2C  4A
    TAY                          ; $DE2D  A8
    LDA $DE35,Y                  ; $DE2E  B9 35 DE
    JSR sub_1E_C051              ; $DE31  20 51 C0

loc_1E_DE34:
    RTS                          ; $DE34  60

    .byte $35,$35,$36,$37,$0F,$15,$31,$15,$35,$2C,$30,$30,$00,$01,$04,$07  ; $DE35
    .byte $01,$06,$0A  ; $DE45
    TXA                          ; $DE48  8A
    SEC                          ; $DE49  38
    SBC #$02                     ; $DE4A  E9 02
    TAY                          ; $DE4C  A8
    LDA $DE6E,Y                  ; $DE4D  B9 6E DE
    STA $0620,X                  ; $DE50  9D 20 06
    LDA $DE71,Y                  ; $DE53  B9 71 DE
    STA $0600,X                  ; $DE56  9D 00 06
    CLC                          ; $DE59  18
    LDA $0660,X                  ; $DE5A  BD 60 06
    ADC #$10                     ; $DE5D  69 10
    STA $0660,X                  ; $DE5F  9D 60 06
    LDA $0640,X                  ; $DE62  BD 40 06
    ADC #$00                     ; $DE65  69 00
    STA $0640,X                  ; $DE67  9D 40 06
    JSR sub_1F_EEEF              ; $DE6A  20 EF EE
    RTS                          ; $DE6D  60

    .byte $19,$99,$33,$01,$01,$02,$BD,$E0,$04,$D0,$74,$A9,$00,$9D,$80,$06  ; $DE6E
    .byte $BD,$C0,$06,$85,$01,$8A,$38,$E9,$02,$85,$00,$29,$01,$D0,$11,$38  ; $DE7E
    .byte $AD,$60,$04,$E5,$01,$9D,$60,$04,$AD,$40,$04,$E9,$00,$4C,$AC,$DE  ; $DE8E
    .byte $18,$AD,$60,$04,$65,$01,$9D,$60,$04,$AD,$40,$04,$69,$00,$9D,$40  ; $DE9E
    .byte $04,$A5,$00,$29,$02,$D0,$09,$38,$AD,$A0,$04,$E5,$01,$4C,$C4,$DE  ; $DEAE
    .byte $18,$AD,$A0,$04,$65,$01,$9D,$A0,$04,$A5,$01,$C9,$0C,$F0,$07,$18  ; $DEBE
    .byte $69,$02,$9D,$C0,$06,$60,$4E,$23,$04,$4E,$24,$04,$4E,$25,$04,$A9  ; $DECE
    .byte $83,$8D,$22,$04,$A9,$01,$8D,$E2,$04,$A9,$01,$8D,$A2,$06,$60,$A5  ; $DEDE
    .byte $F9,$F0,$04,$A9,$06,$D0,$09,$BD,$A0,$06,$C9,$05,$90,$05,$A9,$01  ; $DEEE
    .byte $9D,$A0,$06,$BD,$E0,$04,$C9,$01,$D0,$61,$A5,$1C,$29,$07,$D0,$05  ; $DEFE
    .byte $A9,$31,$20,$51,$C0,$AD,$60,$04,$9D,$60,$04,$AD,$40,$04,$9D,$40  ; $DF0E
    .byte $04,$AD,$A0,$04,$9D,$A0,$04,$A5,$F9,$F0,$05,$A9,$00,$9D,$A0,$04  ; $DF1E
    .byte $A5,$23,$29,$F0,$F0,$34,$A4,$F9,$F0,$04,$5E,$20,$04,$60,$29,$C0  ; $DF2E
    .byte $F0,$0F,$4A,$29,$40,$09,$83,$9D,$20,$04,$A9,$04,$9D,$00,$06,$D0  ; $DF3E
    .byte $0F,$A0,$00,$A5,$23,$29,$10,$D0,$01,$C8,$B9,$6D,$DF,$9D,$40,$06  ; $DF4E
    .byte $38,$A5,$9E,$E9,$03,$85,$9E,$FE,$E0,$04,$60,$20,$EF,$EE,$60,$04  ; $DF5E
    .byte $FC  ; $DF6E
    LDA #$07                     ; $DF6F  A9 07
    STA $01                      ; $DF71  85 01
    LDA #$07                     ; $DF73  A9 07
    STA $02                      ; $DF75  85 02
    JSR sub_1F_F0CF              ; $DF77  20 CF F0
    LDA $04E0,X                  ; $DF7A  BD E0 04
    BNE loc_1E_DF9F              ; $DF7D  D0 20
    LDA $00                      ; $DF7F  A5 00
    BEQ loc_1E_DFCA              ; $DF81  F0 47
    INC $04E0,X                  ; $DF83  FE E0 04
    LDA $0420,X                  ; $DF86  BD 20 04
    AND #$FB                     ; $DF89  29 FB
    STA $0420,X                  ; $DF8B  9D 20 04

loc_1E_DF8E:
    LDA #$C0                     ; $DF8E  A9 C0
    STA $0660,X                  ; $DF90  9D 60 06
    LDA #$FF                     ; $DF93  A9 FF
    STA $0640,X                  ; $DF95  9D 40 06
    LDA #$02                     ; $DF98  A9 02
    STA $0600,X                  ; $DF9A  9D 00 06
    BNE loc_1E_DFCA              ; $DF9D  D0 2B

loc_1E_DF9F:
    CMP #$01                     ; $DF9F  C9 01
    BNE loc_1E_DFC1              ; $DFA1  D0 1E
    LDA $03                      ; $DFA3  A5 03
    BEQ loc_1E_DFAB              ; $DFA5  F0 04
    LSR $0420,X                  ; $DFA7  5E 20 04
    RTS                          ; $DFAA  60


loc_1E_DFAB:
    LDA $00                      ; $DFAB  A5 00
    BNE loc_1E_DFCA              ; $DFAD  D0 1B
    LDA #$00                     ; $DFAF  A9 00
    STA $0600,X                  ; $DFB1  9D 00 06
    STA $0660,X                  ; $DFB4  9D 60 06
    LDA #$FE                     ; $DFB7  A9 FE
    STA $0640,X                  ; $DFB9  9D 40 06
    INC $04E0,X                  ; $DFBC  FE E0 04
    BNE loc_1E_DFCA              ; $DFBF  D0 09

loc_1E_DFC1:
    LDA $00                      ; $DFC1  A5 00
    BEQ loc_1E_DFCA              ; $DFC3  F0 05
    DEC $04E0,X                  ; $DFC5  DE E0 04
    BNE loc_1E_DF8E              ; $DFC8  D0 C4

loc_1E_DFCA:
    JSR sub_1F_EEEF              ; $DFCA  20 EF EE
    RTS                          ; $DFCD  60

    LDA $04E0,X                  ; $DFCE  BD E0 04
    CMP #$12                     ; $DFD1  C9 12
    BCS loc_1E_DFE9              ; $DFD3  B0 14
    SEC                          ; $DFD5  38
    LDA $0660,X                  ; $DFD6  BD 60 06
    SBC #$4B                     ; $DFD9  E9 4B
    STA $0660,X                  ; $DFDB  9D 60 06
    LDA $0640,X                  ; $DFDE  BD 40 06
    SBC #$00                     ; $DFE1  E9 00
    STA $0640,X                  ; $DFE3  9D 40 06
    JMP loc_1F_E00F              ; $DFE6  4C 0F E0


loc_1E_DFE9:
    BNE loc_1E_DFF3              ; $DFE9  D0 08
    LDA $0420,X                  ; $DFEB  BD 20 04
    EOR #$40                     ; $DFEE  49 40
    STA $0420,X                  ; $DFF0  9D 20 04

loc_1E_DFF3:
    LDA $04E0,X                  ; $DFF3  BD E0 04
    CMP #$23                     ; $DFF6  C9 23
    BNE loc_1E_DFFE              ; $DFF8  D0 04
    LSR $0420,X                  ; $DFFA  5E 20 04
    RTS                          ; $DFFD  60


loc_1E_DFFE:
    CLC                          ; $DFFE  18
    LDA $0660,X                  ; $DFFF  BD 85 29
