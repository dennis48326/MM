; PRG 8 KB bank $0E at $C000
.segment "BANK0E"
.org $C000

    .byte $00,$01,$02,$03,$04,$05,$06,$07  ; $C000

reset_vector:
    SEI                          ; $C008  78
    LDA #$01                     ; $C009  A9 01
    STA $2000                    ; $C00B  8D 00 20
    LDA #$06                     ; $C00E  A9 06
    STA $2001                    ; $C010  8D 01 20
    LDA #$05                     ; $C013  A9 05
    STA $C005                    ; $C015  8D 05 C0
    JMP $9000                    ; $C018  4C 00 90


sub_0E_C01B:
    LDA $95                      ; $C01B  A5 95
    BNE loc_0E_C027              ; $C01D  D0 08
    LDA $14                      ; $C01F  A5 14
    STA $16                      ; $C021  85 16
    LDA $15                      ; $C023  A5 15
    STA $17                      ; $C025  85 17

loc_0E_C027:
    LDA #$00                     ; $C027  A9 00
    STA $1F                      ; $C029  85 1F

loc_0E_C02B:
    LDA $1F                      ; $C02B  A5 1F
    BEQ loc_0E_C02B              ; $C02D  F0 FC
    LDA $68                      ; $C02F  A5 68
    BEQ loc_0E_C03A              ; $C031  F0 07
    LDA $69                      ; $C033  A5 69
    STA $14                      ; $C035  85 14
    JMP loc_0E_C04B              ; $C037  4C 4B C0


loc_0E_C03A:
    LDA $95                      ; $C03A  A5 95
    BNE loc_0E_C059              ; $C03C  D0 1B
    TYA                          ; $C03E  98
    PHA                          ; $C03F  48
    TXA                          ; $C040  8A
    PHA                          ; $C041  48
    JSR sub_0E_D58D              ; $C042  20 8D D5
    PLA                          ; $C045  68
    TAX                          ; $C046  AA
    PLA                          ; $C047  68
    TAY                          ; $C048  A8
    LDA $14                      ; $C049  A5 14

loc_0E_C04B:
    EOR $16                      ; $C04B  45 16
    AND $14                      ; $C04D  25 14
    STA $18                      ; $C04F  85 18
    LDA $15                      ; $C051  A5 15
    EOR $17                      ; $C053  45 17
    AND $15                      ; $C055  25 15
    STA $19                      ; $C057  85 19

loc_0E_C059:
    RTS                          ; $C059  60


loc_0E_C05A:
    LDA #$00                     ; $C05A  A9 00
    STA $3E                      ; $C05C  85 3E
    LDA #$FE                     ; $C05E  A9 FE
    JSR sub_0E_C477              ; $C060  20 77 C4
    LDA $AC                      ; $C063  A5 AC
    CMP #$0A                     ; $C065  C9 0A
    BNE loc_0E_C071              ; $C067  D0 08
    LDA #$00                     ; $C069  A9 00
    JSR sub_0E_C477              ; $C06B  20 77 C4
    JMP loc_0E_C079              ; $C06E  4C 79 C0


loc_0E_C071:
    LDA #$04                     ; $C071  A9 04
    JSR sub_0E_C477              ; $C073  20 77 C4
    JSR sub_0E_C204              ; $C076  20 04 C2

loc_0E_C079:
    LDA #$00                     ; $C079  A9 00
    STA $5C                      ; $C07B  85 5C
    LDA #$B7                     ; $C07D  A9 B7
    LDX #$0B                     ; $C07F  A2 0B
    LDY #$08                     ; $C081  A0 08
    JSR sub_0F_F0BE              ; $C083  20 BE F0
    LDA $AC                      ; $C086  A5 AC
    CMP #$0A                     ; $C088  C9 0A
    BNE loc_0E_C096              ; $C08A  D0 0A
    LDA #$FF                     ; $C08C  A9 FF
    JSR sub_0E_D116              ; $C08E  20 16 D1
    LDA #$FF                     ; $C091  A9 FF
    JSR sub_0E_D116              ; $C093  20 16 D1

loc_0E_C096:
    LDA #$80                     ; $C096  A9 80
    JSR sub_0E_D116              ; $C098  20 16 D1
    LDA #$FF                     ; $C09B  A9 FF
    JSR sub_0E_D116              ; $C09D  20 16 D1
    LDA $AC                      ; $C0A0  A5 AC
    CMP #$0A                     ; $C0A2  C9 0A
    BNE loc_0E_C0AE              ; $C0A4  D0 08
    JSR sub_0E_C204              ; $C0A6  20 04 C2
    LDA #$F8                     ; $C0A9  A9 F8
    STA $0600                    ; $C0AB  8D 00 06

loc_0E_C0AE:
    INC $BB                      ; $C0AE  E6 BB
    LDA #$00                     ; $C0B0  A9 00
    STA $2F                      ; $C0B2  85 2F
    LDX #$02                     ; $C0B4  A2 02
    JSR sub_0E_C163              ; $C0B6  20 63 C1
    LDX #$05                     ; $C0B9  A2 05

loc_0E_C0BB:
    STA $B5,X                    ; $C0BB  95 B5
    DEX                          ; $C0BD  CA
    BPL loc_0E_C0BB              ; $C0BE  10 FB
    INC $06A0                    ; $C0C0  EE A0 06

loc_0E_C0C3:
    LDX #$00                     ; $C0C3  A2 00
    JSR sub_0E_C181              ; $C0C5  20 81 C1
    JSR sub_0E_C1AC              ; $C0C8  20 AC C1
    JSR sub_0E_C01B              ; $C0CB  20 1B C0
    DEC $3D                      ; $C0CE  C6 3D
    BNE loc_0E_C0C3              ; $C0D0  D0 F1
    LDA #$40                     ; $C0D2  A9 40
    JSR sub_0E_C20F              ; $C0D4  20 0F C2
    LDA #$00                     ; $C0D7  A9 00
    STA $2F                      ; $C0D9  85 2F
    LDX #$05                     ; $C0DB  A2 05
    JSR sub_0E_C163              ; $C0DD  20 63 C1
    INC $06A0                    ; $C0E0  EE A0 06
    LDA $AE                      ; $C0E3  A5 AE
    BEQ loc_0E_C0F9              ; $C0E5  F0 12

loc_0E_C0E7:
    LDX #$03                     ; $C0E7  A2 03
    JSR sub_0E_C181              ; $C0E9  20 81 C1
    JSR sub_0E_C1AC              ; $C0EC  20 AC C1
    JSR sub_0E_C1BE              ; $C0EF  20 BE C1
    JSR sub_0E_C01B              ; $C0F2  20 1B C0
    DEC $AE                      ; $C0F5  C6 AE
    BNE loc_0E_C0E7              ; $C0F7  D0 EE

loc_0E_C0F9:
    JSR sub_0E_D131              ; $C0F9  20 31 D1
    JSR sub_0E_C1AC              ; $C0FC  20 AC C1
    JSR sub_0E_C1BE              ; $C0FF  20 BE C1
    LDA #$FF                     ; $C102  A9 FF
    JSR sub_0E_C20F              ; $C104  20 0F C2
    LDA #$80                     ; $C107  A9 80
    JSR sub_0E_C20F              ; $C109  20 0F C2
    JSR sub_0E_D495              ; $C10C  20 95 D4
    DEC $BB                      ; $C10F  C6 BB
    LDX #$FF                     ; $C111  A2 FF
    TXS                          ; $C113  9A
    LDA #$05                     ; $C114  A9 05
    STA $C005                    ; $C116  8D 05 C0
    STA $42                      ; $C119  85 42
    LDX $31                      ; $C11B  A6 31
    CPX #$09                     ; $C11D  E0 09
    BEQ loc_0E_C137              ; $C11F  F0 16
    CPX #$06                     ; $C121  E0 06
    BCS loc_0E_C13B              ; $C123  B0 16
    LDA $5D                      ; $C125  A5 5D
    ORA $C148,X                  ; $C127  1D 48 C1
    STA $5D                      ; $C12A  85 5D
    LDA #$00                     ; $C12C  A9 00
    STA $BC                      ; $C12E  85 BC
    STA $55                      ; $C130  85 55
    STA $68                      ; $C132  85 68
    JMP $905A                    ; $C134  4C 5A 90


loc_0E_C137:
    INC $31                      ; $C137  E6 31
    DEC $BB                      ; $C139  C6 BB

loc_0E_C13B:
    LDA #$00                     ; $C13B  A9 00
    STA $B4                      ; $C13D  85 B4
    STA $AB                      ; $C13F  85 AB
    STA $68                      ; $C141  85 68
    INC $31                      ; $C143  E6 31
    JMP $906A                    ; $C145  4C 6A 90

    .byte $20,$10,$02,$40,$04,$08,$00,$1E,$12,$18,$06,$24,$80,$A0,$80,$88  ; $C148
    .byte $A0,$40,$58,$68,$80,$80,$87,$89,$88,$8A,$89  ; $C158

sub_0E_C163:
    JSR sub_0F_F67B              ; $C163  20 7B F6
    LDA $C153,X                  ; $C166  BD 53 C1
    STA $0480,X                  ; $C169  9D 80 04
    LDA $C158,X                  ; $C16C  BD 58 C1
    STA $0600,X                  ; $C16F  9D 00 06
    LDA $C15D,X                  ; $C172  BD 5D C1
    STA $0400,X                  ; $C175  9D 00 04
    LDA #$00                     ; $C178  A9 00
    STA $0420,X                  ; $C17A  9D 20 04
    DEX                          ; $C17D  CA
    BNE sub_0E_C163              ; $C17E  D0 E3
    RTS                          ; $C180  60


sub_0E_C181:
    LDY #$03                     ; $C181  A0 03
    CLC                          ; $C183  18
    LDA #$01                     ; $C184  A9 01

loc_0E_C186:
    ADC $B5,X                    ; $C186  75 B5
    CMP #$0A                     ; $C188  C9 0A
    BCC loc_0E_C18E              ; $C18A  90 02
    SBC #$0A                     ; $C18C  E9 0A

loc_0E_C18E:
    STA $B5,X                    ; $C18E  95 B5
    LDA #$00                     ; $C190  A9 00
    INX                          ; $C192  E8
    DEY                          ; $C193  88
    BNE loc_0E_C186              ; $C194  D0 F0
    LDA #$10                     ; $C196  A9 10
    STA $05                      ; $C198  85 05
    JSR sub_0E_D440              ; $C19A  20 40 D4
    JSR sub_0E_D131              ; $C19D  20 31 D1
    LDA $23                      ; $C1A0  A5 23
    AND #$03                     ; $C1A2  29 03
    BNE loc_0E_C1AB              ; $C1A4  D0 05
    LDA #$21                     ; $C1A6  A9 21
    JSR sub_0E_C477              ; $C1A8  20 77 C4

loc_0E_C1AB:
    RTS                          ; $C1AB  60


sub_0E_C1AC:
    LDX #$02                     ; $C1AC  A2 02
    STX $0E                      ; $C1AE  86 0E
    LDY #$C0                     ; $C1B0  A0 C0
    LDA #$68                     ; $C1B2  A9 68
    STA $0C                      ; $C1B4  85 0C
    LDA #$50                     ; $C1B6  A9 50
    STA $0D                      ; $C1B8  85 0D
    JSR sub_0E_C1DD              ; $C1BA  20 DD C1
    RTS                          ; $C1BD  60


sub_0E_C1BE:
    LDX #$04                     ; $C1BE  A2 04
    LDA #$01                     ; $C1C0  A9 01
    STA $0E                      ; $C1C2  85 0E
    LDA #$78                     ; $C1C4  A9 78
    STA $0D                      ; $C1C6  85 0D
    LDA #$70                     ; $C1C8  A9 70
    STA $0C                      ; $C1CA  85 0C
    JSR sub_0E_C1DD              ; $C1CC  20 DD C1
    LDX #$04                     ; $C1CF  A2 04
    LDA #$01                     ; $C1D1  A9 01
    STA $0E                      ; $C1D3  85 0E
    LDA #$60                     ; $C1D5  A9 60
    STA $0D                      ; $C1D7  85 0D
    LDA #$90                     ; $C1D9  A9 90
    STA $0C                      ; $C1DB  85 0C

sub_0E_C1DD:
    LDA $B5,X                    ; $C1DD  B5 B5
    ORA #$F0                     ; $C1DF  09 F0
    STA $0205,Y                  ; $C1E1  99 05 02
    LDA $0C                      ; $C1E4  A5 0C
    STA $0207,Y                  ; $C1E6  99 07 02
    LDA $0D                      ; $C1E9  A5 0D
    STA $0204,Y                  ; $C1EB  99 04 02
    LDA #$01                     ; $C1EE  A9 01
    STA $0206,Y                  ; $C1F0  99 06 02
    INY                          ; $C1F3  C8
    INY                          ; $C1F4  C8
    INY                          ; $C1F5  C8
    INY                          ; $C1F6  C8
    DEX                          ; $C1F7  CA
    CLC                          ; $C1F8  18
    LDA $0C                      ; $C1F9  A5 0C
    ADC #$08                     ; $C1FB  69 08
    STA $0C                      ; $C1FD  85 0C
    DEC $0E                      ; $C1FF  C6 0E
    BPL sub_0E_C1DD              ; $C201  10 DA
    RTS                          ; $C203  60


sub_0E_C204:
    LDA #$F8                     ; $C204  A9 F8
    LDX #$1F                     ; $C206  A2 1F

loc_0E_C208:
    STA $0600,X                  ; $C208  9D 00 06
    DEX                          ; $C20B  CA
    BNE loc_0E_C208              ; $C20C  D0 FA
    RTS                          ; $C20E  60


sub_0E_C20F:
    STA $3C                      ; $C20F  85 3C

loc_0E_C211:
    JSR sub_0E_C01B              ; $C211  20 1B C0
    DEC $3C                      ; $C214  C6 3C
    BNE loc_0E_C211              ; $C216  D0 F9
    RTS                          ; $C218  60


loc_0E_C219:
    LDA #$FE                     ; $C219  A9 FE
    JSR sub_0E_C477              ; $C21B  20 77 C4
    LDA #$FF                     ; $C21E  A9 FF
    JSR sub_0E_C477              ; $C220  20 77 C4
    LDA #$20                     ; $C223  A9 20
    JSR sub_0E_D116              ; $C225  20 16 D1
    LDA #$31                     ; $C228  A9 31
    JSR sub_0E_C477              ; $C22A  20 77 C4
    LDA #$00                     ; $C22D  A9 00
    STA $59                      ; $C22F  85 59
    LDA #$7D                     ; $C231  A9 7D
    STA $5A                      ; $C233  85 5A
    JSR sub_0E_C32A              ; $C235  20 2A C3
    LDA #$00                     ; $C238  A9 00
    STA $45                      ; $C23A  85 45
    LDA #$F8                     ; $C23C  A9 F8
    STA $0600                    ; $C23E  8D 00 06
    LDA #$C0                     ; $C241  A9 C0
    STA $3C                      ; $C243  85 3C

loc_0E_C245:
    JSR sub_0E_C317              ; $C245  20 17 C3
    BNE loc_0E_C245              ; $C248  D0 FB
    JSR sub_0E_D495              ; $C24A  20 95 D4
    LDA #$00                     ; $C24D  A9 00
    STA $47                      ; $C24F  85 47
    STA $B4                      ; $C251  85 B4
    STA $55                      ; $C253  85 55
    STA $94                      ; $C255  85 94
    STA $95                      ; $C257  85 95
    DEC $A6                      ; $C259  C6 A6
    LDA $A6                      ; $C25B  A5 A6
    BMI loc_0E_C2D1              ; $C25D  30 72
    JSR sub_0E_C75B              ; $C25F  20 5B C7
    LDA #$00                     ; $C262  A9 00
    STA $AB                      ; $C264  85 AB
    STA $59                      ; $C266  85 59
    LDA $0460                    ; $C268  AD 60 04
    LDX $31                      ; $C26B  A6 31
    CMP $C2D4,X                  ; $C26D  DD D4 C2
    BCC loc_0E_C2A7              ; $C270  90 35
    LDY #$0C                     ; $C272  A0 0C
    CMP $C2E0,X                  ; $C274  DD E0 C2
    BCC loc_0E_C27B              ; $C277  90 02
    LDY #$18                     ; $C279  A0 18

loc_0E_C27B:
    TYA                          ; $C27B  98
    STA $AB                      ; $C27C  85 AB
    CLC                          ; $C27E  18
    ADC $31                      ; $C27F  65 31
    TAX                          ; $C281  AA
    LDA $C2EB,X                  ; $C282  BD EB C2
    STA $0460                    ; $C285  8D 60 04
    JSR sub_0E_C658              ; $C288  20 58 C6

loc_0E_C28B:
    JSR sub_0E_C6C4              ; $C28B  20 C4 C6
    JSR sub_0E_D5AF              ; $C28E  20 AF D5
    LDA $59                      ; $C291  A5 59
    CMP #$28                     ; $C293  C9 28
    BNE loc_0E_C28B              ; $C295  D0 F4
    JSR sub_0E_C6C4              ; $C297  20 C4 C6
    LDA #$2C                     ; $C29A  A9 2C
    STA $03E1                    ; $C29C  8D E1 03
    LDA #$11                     ; $C29F  A9 11
    STA $03E2                    ; $C2A1  8D E2 03
    JSR sub_0E_D60A              ; $C2A4  20 0A D6

loc_0E_C2A7:
    LDA #$00                     ; $C2A7  A9 00
    STA $19                      ; $C2A9  85 19
    LDX #$FF                     ; $C2AB  A2 FF
    TXS                          ; $C2AD  9A
    LDA #$05                     ; $C2AE  A9 05
    STA $42                      ; $C2B0  85 42
    STA $C005                    ; $C2B2  8D 05 C0
    LDA $AB                      ; $C2B5  A5 AB
    CMP #$0C                     ; $C2B7  C9 0C
    BCS loc_0E_C2BE              ; $C2B9  B0 03

loc_0E_C2BB:
    JMP $907E                    ; $C2BB  4C 7E 90


loc_0E_C2BE:
    LDA $31                      ; $C2BE  A5 31
    CMP #$07                     ; $C2C0  C9 07
    BEQ loc_0E_C2C8              ; $C2C2  F0 04
    CMP #$09                     ; $C2C4  C9 09
    BNE loc_0E_C2CE              ; $C2C6  D0 06

loc_0E_C2C8:
    LDA $AB                      ; $C2C8  A5 AB
    CMP #$0D                     ; $C2CA  C9 0D
    BCS loc_0E_C2BB              ; $C2CC  B0 ED

loc_0E_C2CE:
    JMP $9081                    ; $C2CE  4C 81 90


loc_0E_C2D1:
    JMP $9038                    ; $C2D1  4C 38 90

    .byte $0A,$0A,$0E,$08,$07,$0A,$22,$24,$2F,$1D,$1D,$1D,$14,$14,$14,$10  ; $C2D4
    .byte $14,$0F,$27,$29,$2F,$21,$1C,$00,$00,$00,$00,$00,$00,$18,$18,$18  ; $C2E4
    .byte $14,$18,$1E,$0A,$0A,$0E,$08,$07,$0A,$22,$24,$2E,$1D,$1D,$1D,$14  ; $C2F4
    .byte $14,$14,$10,$14,$0F,$26,$28,$2E,$21,$20,$FB,$05,$00,$FF,$00,$00  ; $C304
    .byte $F8,$F4,$06  ; $C314

sub_0E_C317:
    LDA $2F                      ; $C317  A5 2F
    BNE loc_0E_C31E              ; $C319  D0 03
    JSR sub_0E_DB8C              ; $C31B  20 8C DB

loc_0E_C31E:
    JSR $98EA                    ; $C31E  20 EA 98
    JSR sub_0E_D131              ; $C321  20 31 D1
    JSR sub_0E_C01B              ; $C324  20 1B C0
    DEC $3C                      ; $C327  C6 3C
    RTS                          ; $C329  60


sub_0E_C32A:
    LDA #$0C                     ; $C32A  A9 0C
    STA $3C                      ; $C32C  85 3C

loc_0E_C32E:
    LDA $3C                      ; $C32E  A5 3C
    AND #$03                     ; $C330  29 03
    BNE loc_0E_C377              ; $C332  D0 43
    LDA $59                      ; $C334  A5 59
    STA $2F                      ; $C336  85 2F
    LDX #$02                     ; $C338  A2 02
    JSR sub_0E_C576              ; $C33A  20 76 C5
    BCS loc_0E_C377              ; $C33D  B0 38
    JSR sub_0F_F67B              ; $C33F  20 7B F6
    LDA $5A                      ; $C342  A5 5A
    STA $0400,X                  ; $C344  9D 00 04
    LDA #$08                     ; $C347  A9 08
    STA $0420,X                  ; $C349  9D 20 04
    LDA #$10                     ; $C34C  A9 10
    STA $0440,X                  ; $C34E  9D 40 04
    LDA $3C                      ; $C351  A5 3C
    LSR A                        ; $C353  4A
    LSR A                        ; $C354  4A
    TAY                          ; $C355  A8
    LDA $0480,X                  ; $C356  BD 80 04
    ADC $C30D,Y                  ; $C359  79 0D C3
    STA $0480,X                  ; $C35C  9D 80 04
    LDA $0460,X                  ; $C35F  BD 60 04
    ADC $C310,Y                  ; $C362  79 10 C3
    STA $0460,X                  ; $C365  9D 60 04
    CLC                          ; $C368  18
    LDA $0600,X                  ; $C369  BD 00 06
    ADC $C313,Y                  ; $C36C  79 13 C3
    STA $0600,X                  ; $C36F  9D 00 06
    LDY #$08                     ; $C372  A0 08
    JSR sub_0F_F533              ; $C374  20 33 F5

loc_0E_C377:
    JSR sub_0E_C317              ; $C377  20 17 C3
    BNE loc_0E_C32E              ; $C37A  D0 B2
    LDA #$0B                     ; $C37C  A9 0B
    STA $0C                      ; $C37E  85 0C
    LDA $5A                      ; $C380  A5 5A
    STA $0D                      ; $C382  85 0D
    LDA #$00                     ; $C384  A9 00
    STA $0E                      ; $C386  85 0E

loc_0E_C388:
    LDY $59                      ; $C388  A4 59
    LDX #$02                     ; $C38A  A2 02
    JSR sub_0E_C576              ; $C38C  20 76 C5
    BCS loc_0E_C396              ; $C38F  B0 05
    JSR sub_0F_F841              ; $C391  20 41 F8
    BPL loc_0E_C388              ; $C394  10 F2

loc_0E_C396:
    LDA #$12                     ; $C396  A9 12
    JSR sub_0E_C477              ; $C398  20 77 C4
    RTS                          ; $C39B  60


sub_0E_C39C:
    PHP                          ; $C39C  08
    PHA                          ; $C39D  48
    TXA                          ; $C39E  8A
    PHA                          ; $C39F  48
    LDA $31                      ; $C3A0  A5 31
    CMP #$06                     ; $C3A2  C9 06
    BCC loc_0E_C3A8              ; $C3A4  90 02
    SBC #$06                     ; $C3A6  E9 06

loc_0E_C3A8:
    TAX                          ; $C3A8  AA
    STA $42                      ; $C3A9  85 42
    STA $C000,X                  ; $C3AB  9D 00 C0
    PLA                          ; $C3AE  68
    TAX                          ; $C3AF  AA
    PLA                          ; $C3B0  68
    PLP                          ; $C3B1  28
    RTS                          ; $C3B2  60


loc_0E_C3B3:
    PHP                          ; $C3B3  08
    PHA                          ; $C3B4  48
    LDA #$05                     ; $C3B5  A9 05
    STA $42                      ; $C3B7  85 42
    STA $C005                    ; $C3B9  8D 05 C0
    PLA                          ; $C3BC  68
    PLP                          ; $C3BD  28
    RTS                          ; $C3BE  60


sub_0E_C3BF:
    LDA #$06                     ; $C3BF  A9 06
    STA $42                      ; $C3C1  85 42
    STA $C006                    ; $C3C3  8D 06 C0
    LDA $AC                      ; $C3C6  A5 AC
    CMP #$0A                     ; $C3C8  C9 0A
    BEQ loc_0E_C3DA              ; $C3CA  F0 0E
    LDA $31                      ; $C3CC  A5 31
    CMP #$09                     ; $C3CE  C9 09
    BNE loc_0E_C3D6              ; $C3D0  D0 04
    CMP $AC                      ; $C3D2  C5 AC
    BEQ loc_0E_C3DA              ; $C3D4  F0 04

loc_0E_C3D6:
    CMP #$06                     ; $C3D6  C9 06
    BNE loc_0E_C3E0              ; $C3D8  D0 06

loc_0E_C3DA:
    LDA $3E                      ; $C3DA  A5 3E
    BEQ loc_0E_C3E0              ; $C3DC  F0 02
    INC $1B                      ; $C3DE  E6 1B

loc_0E_C3E0:
    JMP $BFF3                    ; $C3E0  4C F3 BF


loc_0E_C3E3:
    LDA $AC                      ; $C3E3  A5 AC
    CMP #$0A                     ; $C3E5  C9 0A
    BEQ loc_0E_C3F7              ; $C3E7  F0 0E
    LDA $31                      ; $C3E9  A5 31
    CMP #$09                     ; $C3EB  C9 09
    BNE loc_0E_C3F3              ; $C3ED  D0 04
    CMP $AC                      ; $C3EF  C5 AC
    BEQ loc_0E_C3F7              ; $C3F1  F0 04

loc_0E_C3F3:
    CMP #$06                     ; $C3F3  C9 06
    BNE loc_0E_C3FD              ; $C3F5  D0 06

loc_0E_C3F7:
    LDA $3E                      ; $C3F7  A5 3E
    BEQ loc_0E_C3FD              ; $C3F9  F0 02
    DEC $1A                      ; $C3FB  C6 1A

loc_0E_C3FD:
    JMP loc_0E_C3B3              ; $C3FD  4C B3 C3


sub_0E_C400:
    TAX                          ; $C400  AA
    STA $42                      ; $C401  85 42
    STA $C000,X                  ; $C403  9D 00 C0
    LDX #$00                     ; $C406  A2 00

loc_0E_C408:
    LDA ($06),Y                  ; $C408  B1 06
    STA $0382,X                  ; $C40A  9D 82 03
    INY                          ; $C40D  C8
    INX                          ; $C40E  E8
    CPX #$10                     ; $C40F  E0 10
    BNE loc_0E_C408              ; $C411  D0 F5
    LDA #$06                     ; $C413  A9 06
    STA $42                      ; $C415  85 42
    STA $C006                    ; $C417  8D 06 C0
    RTS                          ; $C41A  60


sub_0E_C41B:
    JSR sub_0E_CDE8              ; $C41B  20 E8 CD
    LDA #$06                     ; $C41E  A9 06
    STA $42                      ; $C420  85 42
    STA $C006                    ; $C422  8D 06 C0
    RTS                          ; $C425  60


loc_0E_C426:
    LDA #$06                     ; $C426  A9 06
    STA $42                      ; $C428  85 42
    STA $C006                    ; $C42A  8D 06 C0
    JMP $BFF0                    ; $C42D  4C F0 BF

    .byte $20,$E0,$C4,$4C,$56,$C4,$4C,$7B,$F6,$20,$B3,$C3,$20,$6D,$9E,$20  ; $C430
    .byte $8F,$98,$20,$31,$D1,$20,$1B,$C0,$E6,$BD,$A5,$BD,$C9,$3E,$D0,$06  ; $C440
    .byte $E6,$BE,$A9,$00,$85,$BD,$A9,$06,$85,$42,$8D,$06,$C0,$60,$A9,$00  ; $C450
    .byte $85,$31,$4C,$0C,$C1  ; $C460

sub_0E_C465:
    LDX #$01                     ; $C465  A2 01

loc_0E_C467:
    LDA $0600,X                  ; $C467  BD 00 06
    CMP #$F8                     ; $C46A  C9 F8
    BEQ loc_0E_C471              ; $C46C  F0 03
    INC $06A0,X                  ; $C46E  FE A0 06

loc_0E_C471:
    INX                          ; $C471  E8
    CPX #$20                     ; $C472  E0 20
    BNE loc_0E_C467              ; $C474  D0 F1
    RTS                          ; $C476  60


sub_0E_C477:
    LDX $45                      ; $C477  A6 45
    CPX #$10                     ; $C479  E0 10
    BEQ loc_0E_C482              ; $C47B  F0 05
    STA $0580,X                  ; $C47D  9D 80 05
    INC $45                      ; $C480  E6 45

loc_0E_C482:
    RTS                          ; $C482  60


sub_0E_C483:
    JSR sub_0E_C39C              ; $C483  20 9C C3
    LDA $31                      ; $C486  A5 31
    CMP #$06                     ; $C488  C9 06
    BCC loc_0E_C497              ; $C48A  90 0B
    LDA #$D0                     ; $C48C  A9 D0
    STA $35                      ; $C48E  85 35
    LDA #$8C                     ; $C490  A9 8C
    STA $36                      ; $C492  85 36
    JMP loc_0E_C49F              ; $C494  4C 9F C4


loc_0E_C497:
    LDA #$A0                     ; $C497  A9 A0
    STA $35                      ; $C499  85 35
    LDA #$8C                     ; $C49B  A9 8C
    STA $36                      ; $C49D  85 36

loc_0E_C49F:
    LDA #$20                     ; $C49F  A9 20
    JSR sub_0E_D647              ; $C4A1  20 47 D6
    LDY #$2F                     ; $C4A4  A0 2F

loc_0E_C4A6:
    LDA ($35),Y                  ; $C4A6  B1 35
    STA $03D0,Y                  ; $C4A8  99 D0 03
    DEY                          ; $C4AB  88
    BPL loc_0E_C4A6              ; $C4AC  10 F8
    LDA $31                      ; $C4AE  A5 31
    CMP #$06                     ; $C4B0  C9 06
    BCC loc_0E_C4BE              ; $C4B2  90 0A
    LDA #$9F                     ; $C4B4  A9 9F
    STA $04                      ; $C4B6  85 04
    LDA #$8E                     ; $C4B8  A9 8E
    STA $05                      ; $C4BA  85 05
    BNE loc_0E_C4C6              ; $C4BC  D0 08

loc_0E_C4BE:
    LDA #$FF                     ; $C4BE  A9 FF
    STA $04                      ; $C4C0  85 04
    LDA #$8D                     ; $C4C2  A9 8D
    STA $05                      ; $C4C4  85 05

loc_0E_C4C6:
    LDY #$01                     ; $C4C6  A0 01
    LDA ($04),Y                  ; $C4C8  B1 04
    ASL A                        ; $C4CA  0A
    STA $0720                    ; $C4CB  8D 20 07
    ASL A                        ; $C4CE  0A
    CLC                          ; $C4CF  18
    ADC $0720                    ; $C4D0  6D 20 07
    TAY                          ; $C4D3  A8
    INY                          ; $C4D4  C8

loc_0E_C4D5:
    LDA ($04),Y                  ; $C4D5  B1 04
    STA $071F,Y                  ; $C4D7  99 1F 07
    DEY                          ; $C4DA  88
    BNE loc_0E_C4D5              ; $C4DB  D0 F8
    JMP loc_0E_C3B3              ; $C4DD  4C B3 C3


sub_0E_C4E0:
    CLC                          ; $C4E0  18
    LDA $31                      ; $C4E1  A5 31
    ADC $AB                      ; $C4E3  65 AB
    TAX                          ; $C4E5  AA
    LDA #$14                     ; $C4E6  A9 14
    STA $0400                    ; $C4E8  8D 00 04
    LDA #$41                     ; $C4EB  A9 41
    STA $0420                    ; $C4ED  8D 20 04
    LDA $C51A,X                  ; $C4F0  BD 1A C5
    STA $59                      ; $C4F3  85 59

loc_0E_C4F5:
    LDX #$00                     ; $C4F5  A2 00
    STX $0440                    ; $C4F7  8E 40 04
    CLC                          ; $C4FA  18
    LDA $0600                    ; $C4FB  AD 00 06
    ADC #$10                     ; $C4FE  69 10
    STA $0600                    ; $C500  8D 00 06
    JSR sub_0E_D131              ; $C503  20 31 D1
    JSR sub_0E_C01B              ; $C506  20 1B C0
    LDA $0600                    ; $C509  AD 00 06
    LDX $31                      ; $C50C  A6 31
    CMP $59                      ; $C50E  C5 59
    BNE loc_0E_C4F5              ; $C510  D0 E3
    LDA #$00                     ; $C512  A9 00
    STA $0680                    ; $C514  8D 80 06
    JMP loc_0E_C3B3              ; $C517  4C B3 C3

    .byte $94,$B4,$B4,$B4,$C4,$B4,$B4,$74,$B4,$94,$84,$64,$94,$C4,$B4,$94  ; $C51A
    .byte $94,$54,$24,$64,$B4,$B4,$B4,$B4,$94,$94,$94,$94,$94,$94,$B4,$94  ; $C52A
    .byte $B4,$B4,$B4  ; $C53A

sub_0E_C53D:
    LDA #$06                     ; $C53D  A9 06
    STA $42                      ; $C53F  85 42
    STA $C006                    ; $C541  8D 06 C0
    LDA $0400,X                  ; $C544  BD 00 04
    LDY #$06                     ; $C547  A0 06

loc_0E_C549:
    CMP $8644,Y                  ; $C549  D9 44 86
    BEQ loc_0E_C556              ; $C54C  F0 08
    DEY                          ; $C54E  88
    BPL loc_0E_C549              ; $C54F  10 F8
    LDY #$00                     ; $C551  A0 00
    JMP loc_0E_C564              ; $C553  4C 64 C5


loc_0E_C556:
    LDA $864A,Y                  ; $C556  B9 4A 86
    TAY                          ; $C559  A8
    JMP loc_0E_C564              ; $C55A  4C 64 C5


sub_0E_C55D:
    LDA #$06                     ; $C55D  A9 06
    STA $42                      ; $C55F  85 42
    STA $C006                    ; $C561  8D 06 C0

loc_0E_C564:
    LDA $863A,Y                  ; $C564  B9 3A 86
    PHA                          ; $C567  48
    AND #$F0                     ; $C568  29 F0
    STA $04E0,X                  ; $C56A  9D E0 04
    PLA                          ; $C56D  68
    AND #$0F                     ; $C56E  29 0F
    STA $04C0,X                  ; $C570  9D C0 04
    JMP loc_0E_C3B3              ; $C573  4C B3 C3


sub_0E_C576:
    LDA #$F8                     ; $C576  A9 F8

loc_0E_C578:
    CMP $0600,X                  ; $C578  DD 00 06
    BEQ loc_0E_C584              ; $C57B  F0 07
    INX                          ; $C57D  E8
    CPX $54                      ; $C57E  E4 54
    BNE loc_0E_C578              ; $C580  D0 F6
    SEC                          ; $C582  38
    RTS                          ; $C583  60


loc_0E_C584:
    CLC                          ; $C584  18
    RTS                          ; $C585  60


sub_0E_C586:
    CMP $0400,X                  ; $C586  DD 00 04
    BEQ loc_0E_C592              ; $C589  F0 07

loc_0E_C58B:
    INX                          ; $C58B  E8
    CPX $54                      ; $C58C  E4 54
    BNE sub_0E_C586              ; $C58E  D0 F6
    SEC                          ; $C590  38
    RTS                          ; $C591  60


loc_0E_C592:
    LDA #$F8                     ; $C592  A9 F8
    CMP $0600,X                  ; $C594  DD 00 06
    PHP                          ; $C597  08
    LDA $0400,X                  ; $C598  BD 00 04
    PLP                          ; $C59B  28
    BEQ loc_0E_C58B              ; $C59C  F0 ED
    CLC                          ; $C59E  18
    RTS                          ; $C59F  60


sub_0E_C5A0:
    STA $40                      ; $C5A0  85 40
    LDA $46                      ; $C5A2  A5 46
    SEC                          ; $C5A4  38

loc_0E_C5A5:
    SBC $40                      ; $C5A5  E5 40
    BCS loc_0E_C5A5              ; $C5A7  B0 FC
    ADC $40                      ; $C5A9  65 40
    RTS                          ; $C5AB  60


sub_0E_C5AC:
    STA $4D                      ; $C5AC  85 4D
    STX $4B                      ; $C5AE  86 4B
    STY $4C                      ; $C5B0  84 4C
    LDA #$00                     ; $C5B2  A9 00
    STA $4A                      ; $C5B4  85 4A
    LDY #$10                     ; $C5B6  A0 10

loc_0E_C5B8:
    ASL $4C                      ; $C5B8  06 4C
    ROL $4B                      ; $C5BA  26 4B
    ROL $4A                      ; $C5BC  26 4A
    LDA $4A                      ; $C5BE  A5 4A
    SEC                          ; $C5C0  38
    SBC $4D                      ; $C5C1  E5 4D
    BCC loc_0E_C5C9              ; $C5C3  90 04
    STA $4A                      ; $C5C5  85 4A
    INC $4C                      ; $C5C7  E6 4C

loc_0E_C5C9:
    DEY                          ; $C5C9  88
    BNE loc_0E_C5B8              ; $C5CA  D0 EC
    LDA $4B                      ; $C5CC  A5 4B
    STA $05                      ; $C5CE  85 05
    LDA $4C                      ; $C5D0  A5 4C
    STA $04                      ; $C5D2  85 04
    RTS                          ; $C5D4  60

    .byte $A5,$05,$85,$4B,$A5,$04,$85,$4C,$A5,$07,$85,$4E,$A5,$06,$85,$11  ; $C5D5
    .byte $A9,$00,$85,$4A,$85,$4D,$A0,$10,$06,$4D,$26,$4C,$26,$4B,$26,$4A  ; $C5E5
    .byte $38,$A5,$4B,$E5,$4F,$AA,$A5,$4A,$E5,$4E,$90,$06,$86,$4B,$85,$4A  ; $C5F5
    .byte $E6,$4D,$88,$D0,$E3,$A5,$4D,$85,$08,$A5,$4C,$85,$09,$60  ; $C605

sub_0E_C613:
    JSR sub_0E_C39C              ; $C613  20 9C C3
    CPY #$00                     ; $C616  C0 00
    BMI loc_0E_C620              ; $C618  30 06
    LDA $8C71,Y                  ; $C61A  B9 71 8C
    JMP loc_0E_C3B3              ; $C61D  4C B3 C3


loc_0E_C620:
    LDA #$00                     ; $C620  A9 00
    JMP loc_0E_C3B3              ; $C622  4C B3 C3


sub_0E_C625:
    JSR sub_0E_C39C              ; $C625  20 9C C3
    TAX                          ; $C628  AA
    LDA $0C                      ; $C629  A5 0C
    STA $0721,X                  ; $C62B  9D 21 07
    LDA $0723,X                  ; $C62E  BD 23 07
    ORA #$08                     ; $C631  09 08
    STA $0C                      ; $C633  85 0C
    LDA $0724,X                  ; $C635  BD 24 07
    ORA #$0B                     ; $C638  09 0B
    STA $0D                      ; $C63A  85 0D
    JMP loc_0E_C3B3              ; $C63C  4C B3 C3

    .byte $20,$9C,$C3,$A4,$0C,$99,$24,$07,$4C,$B3,$C3  ; $C63F

sub_0E_C64A:
    JSR sub_0E_C39C              ; $C64A  20 9C C3
    LDY $0C                      ; $C64D  A4 0C
    LDA $0726,Y                  ; $C64F  B9 26 07
    STA $0724,Y                  ; $C652  99 24 07
    JMP loc_0E_C3B3              ; $C655  4C B3 C3


sub_0E_C658:
    JSR sub_0E_C39C              ; $C658  20 9C C3
    LDX $0460                    ; $C65B  AE 60 04
    LDA $8D40,X                  ; $C65E  BD 40 8D
    STA $7A                      ; $C661  85 7A
    JMP loc_0E_C3B3              ; $C663  4C B3 C3


sub_0E_C666:
    LDA $42                      ; $C666  A5 42
    PHA                          ; $C668  48
    LDA $92                      ; $C669  A5 92
    BNE loc_0E_C675              ; $C66B  D0 08
    LDX $01                      ; $C66D  A6 01
    STX $93                      ; $C66F  86 93
    LDA #$10                     ; $C671  A9 10
    STA $92                      ; $C673  85 92

loc_0E_C675:
    LDA $04                      ; $C675  A5 04
    PHA                          ; $C677  48
    LDA $05                      ; $C678  A5 05
    PHA                          ; $C67A  48
    DEC $92                      ; $C67B  C6 92
    LDX $93                      ; $C67D  A6 93
    LDA $C6B0,X                  ; $C67F  BD B0 C6
    STA $0380                    ; $C682  8D 80 03
    LDA $C6B1,X                  ; $C685  BD B1 C6
    JSR sub_0E_C7AE              ; $C688  20 AE C7
    LDA $92                      ; $C68B  A5 92
    ASL A                        ; $C68D  0A
    ASL A                        ; $C68E  0A
    ASL A                        ; $C68F  0A
    ASL A                        ; $C690  0A
    STA $04                      ; $C691  85 04
    STA $0381                    ; $C693  8D 81 03
    LDY #$0F                     ; $C696  A0 0F

loc_0E_C698:
    LDA ($04),Y                  ; $C698  B1 04
    STA $0382,Y                  ; $C69A  99 82 03
    DEY                          ; $C69D  88
    BPL loc_0E_C698              ; $C69E  10 F8
    LDA #$10                     ; $C6A0  A9 10
    STA $5E                      ; $C6A2  85 5E
    PLA                          ; $C6A4  68
    STA $05                      ; $C6A5  85 05
    PLA                          ; $C6A7  68
    STA $04                      ; $C6A8  85 04
    PLA                          ; $C6AA  68
    TAX                          ; $C6AB  AA
    STA $C000,X                  ; $C6AC  9D 00 C0
    RTS                          ; $C6AF  60

    .byte $08,$6E,$08,$A2,$09,$82,$0A,$86,$09,$AE,$0A,$B2,$0B,$62,$00,$FA  ; $C6B0
    .byte $01,$CE,$02,$D2  ; $C6C0

sub_0E_C6C4:
    LDA $59                      ; $C6C4  A5 59
    CMP #$29                     ; $C6C6  C9 29
    BNE loc_0E_C6CB              ; $C6C8  D0 01
    RTS                          ; $C6CA  60


loc_0E_C6CB:
    INC $59                      ; $C6CB  E6 59
    JSR sub_0E_C39C              ; $C6CD  20 9C C3
    LSR A                        ; $C6D0  4A
    ROR $0381                    ; $C6D1  6E 81 03
    LSR A                        ; $C6D4  4A
    ROR $0381                    ; $C6D5  6E 81 03
    LSR A                        ; $C6D8  4A
    ROR $0381                    ; $C6D9  6E 81 03
    PHA                          ; $C6DC  48
    CLC                          ; $C6DD  18
    ADC #$08                     ; $C6DE  69 08
    STA $0380                    ; $C6E0  8D 80 03
    PLA                          ; $C6E3  68
    CMP #$05                     ; $C6E4  C9 05
    PHP                          ; $C6E6  08
    CLC                          ; $C6E7  18
    ADC $7A                      ; $C6E8  65 7A
    TAX                          ; $C6EA  AA
    PLP                          ; $C6EB  28
    BEQ loc_0E_C70F              ; $C6EC  F0 21
    LDA $8D80,X                  ; $C6EE  BD 80 8D
    JSR sub_0E_C7AE              ; $C6F1  20 AE C7
    LDA $0381                    ; $C6F4  AD 81 03
    AND #$E0                     ; $C6F7  29 E0
    STA $0381                    ; $C6F9  8D 81 03
    STA $04                      ; $C6FC  85 04
    LDY #$1F                     ; $C6FE  A0 1F

loc_0E_C700:
    LDA ($04),Y                  ; $C700  B1 04
    STA $0382,Y                  ; $C702  99 82 03
    DEY                          ; $C705  88
    BPL loc_0E_C700              ; $C706  10 F8
    LDA #$20                     ; $C708  A9 20
    STA $5E                      ; $C70A  85 5E
    JMP loc_0E_C3B3              ; $C70C  4C B3 C3


loc_0E_C70F:
    LDY #$00                     ; $C70F  A0 00

loc_0E_C711:
    LDA $8D80,X                  ; $C711  BD 80 8D
    STA $03E9,Y                  ; $C714  99 E9 03
    INX                          ; $C717  E8
    INY                          ; $C718  C8
    CPY #$07                     ; $C719  C0 07
    BEQ loc_0E_C724              ; $C71B  F0 07
    CPY #$03                     ; $C71D  C0 03
    BNE loc_0E_C711              ; $C71F  D0 F0
    INY                          ; $C721  C8
    BNE loc_0E_C711              ; $C722  D0 ED

loc_0E_C724:
    JSR sub_0E_C72A              ; $C724  20 2A C7
    JMP loc_0E_C3B3              ; $C727  4C B3 C3


sub_0E_C72A:
    LDA #$03                     ; $C72A  A9 03
    STA $39                      ; $C72C  85 39
    STA $3B                      ; $C72E  85 3B
    LDA #$E0                     ; $C730  A9 E0
    STA $38                      ; $C732  85 38
    STA $3A                      ; $C734  85 3A
    LDA #$18                     ; $C736  A9 18

loc_0E_C738:
    STA $34                      ; $C738  85 34
    LDA #$01                     ; $C73A  A9 01
    STA $37                      ; $C73C  85 37
    RTS                          ; $C73E  60


sub_0E_C73F:
    LDA #$03                     ; $C73F  A9 03
    STA $39                      ; $C741  85 39
    STA $3B                      ; $C743  85 3B
    LDA #$D0                     ; $C745  A9 D0
    STA $38                      ; $C747  85 38
    STA $3A                      ; $C749  85 3A
    LDA #$10                     ; $C74B  A9 10
    BNE loc_0E_C738              ; $C74D  D0 E9

sub_0E_C74F:
    JSR sub_0E_C73F              ; $C74F  20 3F C7
    LDA #$03                     ; $C752  A9 03
    STA $39                      ; $C754  85 39
    LDA #$F0                     ; $C756  A9 F0
    STA $38                      ; $C758  85 38
    RTS                          ; $C75A  60


sub_0E_C75B:
    JSR sub_0E_C39C              ; $C75B  20 9C C3
    LDA $31                      ; $C75E  A5 31
    CMP #$06                     ; $C760  C9 06
    BCC loc_0E_C769              ; $C762  90 05
    LDA $8D20                    ; $C764  AD 20 8D
    BNE loc_0E_C76C              ; $C767  D0 03

loc_0E_C769:
    LDA $8D00                    ; $C769  AD 00 8D

loc_0E_C76C:
    STA $0C                      ; $C76C  85 0C
    LDA #$00                     ; $C76E  A9 00
    STA $2006                    ; $C770  8D 06 20
    STA $2006                    ; $C773  8D 06 20
    STA $0D                      ; $C776  85 0D

loc_0E_C778:
    JSR sub_0E_C39C              ; $C778  20 9C C3
    LDY $0D                      ; $C77B  A4 0D
    LDA $31                      ; $C77D  A5 31
    CMP #$06                     ; $C77F  C9 06
    BCC loc_0E_C78B              ; $C781  90 08
    LDA $8D21,Y                  ; $C783  B9 21 8D
    LDX $8D22,Y                  ; $C786  BE 22 8D
    BNE loc_0E_C791              ; $C789  D0 06

loc_0E_C78B:
    LDX $8D02,Y                  ; $C78B  BE 02 8D
    LDA $8D01,Y                  ; $C78E  B9 01 8D

loc_0E_C791:
    JSR sub_0E_C7AE              ; $C791  20 AE C7

loc_0E_C794:
    LDY #$00                     ; $C794  A0 00

loc_0E_C796:
    LDA ($04),Y                  ; $C796  B1 04
    STA $2007                    ; $C798  8D 07 20
    INY                          ; $C79B  C8
    BNE loc_0E_C796              ; $C79C  D0 F8
    INC $05                      ; $C79E  E6 05
    DEX                          ; $C7A0  CA
    BNE loc_0E_C794              ; $C7A1  D0 F1
    INC $0D                      ; $C7A3  E6 0D
    INC $0D                      ; $C7A5  E6 0D
    DEC $0C                      ; $C7A7  C6 0C
    BNE loc_0E_C778              ; $C7A9  D0 CD
    JMP loc_0E_C3B3              ; $C7AB  4C B3 C3


sub_0E_C7AE:
    PHA                          ; $C7AE  48
    AND #$FC                     ; $C7AF  29 FC
    LSR A                        ; $C7B1  4A
    LSR A                        ; $C7B2  4A
    ORA #$80                     ; $C7B3  09 80
    STA $05                      ; $C7B5  85 05
    LDA #$00                     ; $C7B7  A9 00
    STA $04                      ; $C7B9  85 04
    PLA                          ; $C7BB  68
    AND #$03                     ; $C7BC  29 03
    TAY                          ; $C7BE  A8
    STA $42                      ; $C7BF  85 42
    STA $C000,Y                  ; $C7C1  99 00 C0
    RTS                          ; $C7C4  60


sub_0E_C7C5:
    LDA #$4C                     ; $C7C5  A9 4C
    STA $0C                      ; $C7C7  85 0C
    LDA #$00                     ; $C7C9  A9 00
    STA $0D                      ; $C7CB  85 0D
    LDA #$08                     ; $C7CD  A9 08
    STA $0E                      ; $C7CF  85 0E

loc_0E_C7D1:
    LDX #$02                     ; $C7D1  A2 02
    LDA $0C                      ; $C7D3  A5 0C
    JSR sub_0E_C586              ; $C7D5  20 86 C5
    BCS loc_0E_C7DD              ; $C7D8  B0 03
    JSR sub_0E_C7FA              ; $C7DA  20 FA C7

loc_0E_C7DD:
    INC $0C                      ; $C7DD  E6 0C
    DEC $0E                      ; $C7DF  C6 0E
    BNE loc_0E_C7D1              ; $C7E1  D0 EE
    RTS                          ; $C7E3  60

    .byte $A2,$05,$A9,$00,$85,$0D,$BD,$00,$06,$C9,$F8,$F0,$03,$20,$FA,$C7  ; $C7E4
    .byte $E8,$E0,$0A,$D0,$F1,$60  ; $C7F4

sub_0E_C7FA:
    LDA $0420,X                  ; $C7FA  BD 20 04
    EOR #$40                     ; $C7FD  49 40
    AND #$F7                     ; $C7FF  29 F7
    STA $0420,X                  ; $C801  9D 20 04
    LDY $0D                      ; $C804  A4 0D
    LDA $C824,Y                  ; $C806  B9 24 C8
    STA $0660,X                  ; $C809  9D 60 06
    LDA $C829,Y                  ; $C80C  B9 29 C8
    STA $0680,X                  ; $C80F  9D 80 06
    LDA $C82E,Y                  ; $C812  B9 2E C8
    PHA                          ; $C815  48
    AND #$F0                     ; $C816  29 F0
    STA $04E0,X                  ; $C818  9D E0 04
    PLA                          ; $C81B  68
    AND #$0F                     ; $C81C  29 0F
    STA $04C0,X                  ; $C81E  9D C0 04
    INC $0D                      ; $C821  E6 0D
    RTS                          ; $C823  60

    .byte $54,$80,$00,$80,$AC,$04,$02,$00,$BD,$FB,$82,$54,$05,$54,$82  ; $C824

loc_0E_C833:
    SEC                          ; $C833  38
    SBC #$3C                     ; $C834  E9 3C
    ASL A                        ; $C836  0A
    TAY                          ; $C837  A8
    LDA #$F8                     ; $C838  A9 F8
    STA $0600,X                  ; $C83A  9D 00 06
    LDA $C89E,Y                  ; $C83D  B9 9E C8
    STA $04                      ; $C840  85 04
    LDA $C89F,Y                  ; $C842  B9 9F C8
    STA $05                      ; $C845  85 05
    JMP ($0004)                  ; $C847  6C 04 00

    CLC                          ; $C84A  18
    LDA $AE                      ; $C84B  A5 AE
    CMP #$63                     ; $C84D  C9 63
    BEQ loc_0E_C87D              ; $C84F  F0 2C
    INC $AE                      ; $C851  E6 AE
    BNE loc_0E_C87D              ; $C853  D0 28
    LDA #$82                     ; $C855  A9 82
    BNE loc_0E_C863              ; $C857  D0 0A
    LDA #$02                     ; $C859  A9 02
    BNE loc_0E_C863              ; $C85B  D0 06
    LDA #$8A                     ; $C85D  A9 8A
    BNE loc_0E_C863              ; $C85F  D0 02
    LDA #$0A                     ; $C861  A9 0A

loc_0E_C863:
    STA $AD                      ; $C863  85 AD
    RTS                          ; $C865  60

    LDA #$32                     ; $C866  A9 32
    CLC                          ; $C868  18
    LDX $A6                      ; $C869  A6 A6
    CPX #$63                     ; $C86B  E0 63
    BCS loc_0E_C87F              ; $C86D  B0 10
    INC $A6                      ; $C86F  E6 A6
    BNE loc_0E_C87F              ; $C871  D0 0C
    LDA #$80                     ; $C873  A9 80
    ORA $5D                      ; $C875  05 5D
    STA $5D                      ; $C877  85 5D
    LDA #$1C                     ; $C879  A9 1C
    STA $71                      ; $C87B  85 71

loc_0E_C87D:
    LDA #$1A                     ; $C87D  A9 1A

loc_0E_C87F:
    JSR sub_0E_C477              ; $C87F  20 77 C4
    RTS                          ; $C882  60

    .byte $A9,$01,$85,$26,$85,$B0,$D0,$F2,$A9,$1A,$20,$77,$C4,$4C,$5A,$C0  ; $C883
    .byte $A9,$1C,$A2,$07,$95,$6A,$CA,$10,$FB,$30,$DF,$4A,$C8,$55,$C8,$59  ; $C893
    .byte $C8,$5D,$C8,$61,$C8,$66,$C8,$73,$C8,$83,$C8,$8B,$C8,$93,$C8  ; $C8A3

sub_0E_C8B2:
    LDX $2F                      ; $C8B2  A6 2F
    LDA $0420,X                  ; $C8B4  BD 20 04
    AND #$20                     ; $C8B7  29 20
    BEQ loc_0E_C8BD              ; $C8B9  F0 02

loc_0E_C8BB:
    CLC                          ; $C8BB  18
    RTS                          ; $C8BC  60


loc_0E_C8BD:
    LDY $0400,X                  ; $C8BD  BC 00 04
    LDA $FAB5,Y                  ; $C8C0  B9 B5 FA
    STA $01                      ; $C8C3  85 01
    LDA $FB83,Y                  ; $C8C5  B9 83 FB
    STA $02                      ; $C8C8  85 02
    LDA $0600,X                  ; $C8CA  BD 00 06
    CMP #$F8                     ; $C8CD  C9 F8
    BEQ loc_0E_C8BB              ; $C8CF  F0 EA
    SEC                          ; $C8D1  38
    SBC $02                      ; $C8D2  E5 02
    STA $03                      ; $C8D4  85 03
    ASL $02                      ; $C8D6  06 02
    CLC                          ; $C8D8  18
    ADC $02                      ; $C8D9  65 02
    STA $02                      ; $C8DB  85 02
    SEC                          ; $C8DD  38
    LDA $0480,X                  ; $C8DE  BD 80 04
    SBC $1A                      ; $C8E1  E5 1A
    SEC                          ; $C8E3  38
    SBC $01                      ; $C8E4  E5 01
    STA $00                      ; $C8E6  85 00
    ASL $01                      ; $C8E8  06 01
    CLC                          ; $C8EA  18
    ADC $01                      ; $C8EB  65 01
    STA $01                      ; $C8ED  85 01
    LDA $3E                      ; $C8EF  A5 3E
    CMP #$05                     ; $C8F1  C9 05
    BCC loc_0E_C91E              ; $C8F3  90 29
    LDA $56                      ; $C8F5  A5 56
    BNE loc_0E_C91E              ; $C8F7  D0 25
    LDX #$01                     ; $C8F9  A2 01
    JSR sub_0E_C9C2              ; $C8FB  20 C2 C9
    BCC loc_0E_C91E              ; $C8FE  90 1E
    STX $0C                      ; $C900  86 0C
    LDA $AC                      ; $C902  A5 AC
    ASL A                        ; $C904  0A
    ASL A                        ; $C905  0A
    ASL A                        ; $C906  0A
    CLC                          ; $C907  18
    ADC $5F                      ; $C908  65 5F
    TAX                          ; $C90A  AA
    SEC                          ; $C90B  38
    LDA $06C1                    ; $C90C  AD C1 06
    SBC $FDEE,X                  ; $C90F  FD EE FD
    BEQ loc_0E_C916              ; $C912  F0 02
    BCS loc_0E_C921              ; $C914  B0 0B

loc_0E_C916:
    LDA #$00                     ; $C916  A9 00
    STA $06C1                    ; $C918  8D C1 06
    JMP loc_0E_CA2D              ; $C91B  4C 2D CA


loc_0E_C91E:
    JMP loc_0E_C96D              ; $C91E  4C 6D C9


loc_0E_C921:
    STA $06C1                    ; $C921  8D C1 06
    LDA $31                      ; $C924  A5 31
    CMP #$06                     ; $C926  C9 06
    BEQ loc_0E_C963              ; $C928  F0 39
    CMP #$09                     ; $C92A  C9 09
    BEQ loc_0E_C963              ; $C92C  F0 35
    LDX #$16                     ; $C92E  A2 16
    JSR sub_0E_C576              ; $C930  20 76 C5
    BCS loc_0E_C963              ; $C933  B0 2E
    LDA $2F                      ; $C935  A5 2F
    PHA                          ; $C937  48
    LDA #$01                     ; $C938  A9 01
    STA $2F                      ; $C93A  85 2F
    JSR sub_0F_F67B              ; $C93C  20 7B F6
    LDA #$19                     ; $C93F  A9 19
    STA $0400,X                  ; $C941  9D 00 04
    INC $0440,X                  ; $C944  FE 40 04
    LDY #$08                     ; $C947  A0 08
    JSR sub_0F_F533              ; $C949  20 33 F5
    LDA #$08                     ; $C94C  A9 08
    STA $0420,X                  ; $C94E  9D 20 04
    STA $0660,X                  ; $C951  9D 60 06
    LDA $0600,X                  ; $C954  BD 00 06
    LDY $31                      ; $C957  A4 31
    SEC                          ; $C959  38
    SBC $C989,Y                  ; $C95A  F9 89 C9
    STA $0600,X                  ; $C95D  9D 00 06
    PLA                          ; $C960  68
    STA $2F                      ; $C961  85 2F

loc_0E_C963:
    LDY $AC                      ; $C963  A4 AC
    LDA $C994,Y                  ; $C965  B9 94 C9
    STA $56                      ; $C968  85 56
    JMP loc_0E_C9A9              ; $C96A  4C A9 C9


loc_0E_C96D:
    LDA $23                      ; $C96D  A5 23
    AND #$01                     ; $C96F  29 01
    CLC                          ; $C971  18
    ADC #$10                     ; $C972  69 10
    TAX                          ; $C974  AA

loc_0E_C975:
    LDA $0420,X                  ; $C975  BD 20 04
    AND #$80                     ; $C978  29 80
    BNE loc_0E_C981              ; $C97A  D0 05
    JSR sub_0E_C9C2              ; $C97C  20 C2 C9
    BCS loc_0E_C99F              ; $C97F  B0 1E

loc_0E_C981:
    INX                          ; $C981  E8
    INX                          ; $C982  E8
    CPX $54                      ; $C983  E4 54
    BCC loc_0E_C975              ; $C985  90 EE
    CLC                          ; $C987  18
    RTS                          ; $C988  60

    .byte $04,$00,$00,$08,$00,$04,$00,$00,$00,$00,$00,$3F,$1E,$1E,$1E,$3F  ; $C989
    .byte $1E,$09,$3F,$1E,$09,$09  ; $C999

loc_0E_C99F:
    STX $0C                      ; $C99F  86 0C
    LDA $0420,X                  ; $C9A1  BD 20 04
    ORA #$80                     ; $C9A4  09 80
    STA $0420,X                  ; $C9A6  9D 20 04

loc_0E_C9A9:
    LDA #$1B                     ; $C9A9  A9 1B
    JSR sub_0E_C477              ; $C9AB  20 77 C4
    LDX $2F                      ; $C9AE  A6 2F
    LDA $0420,X                  ; $C9B0  BD 20 04
    AND #$04                     ; $C9B3  29 04
    BNE loc_0E_C9BC              ; $C9B5  D0 05
    LDA #$F8                     ; $C9B7  A9 F8
    STA $0600,X                  ; $C9B9  9D 00 06

loc_0E_C9BC:
    SEC                          ; $C9BC  38
    RTS                          ; $C9BD  60


sub_0E_C9BE:
    LDA #$02                     ; $C9BE  A9 02
    BNE loc_0E_C9C4              ; $C9C0  D0 02

sub_0E_C9C2:
    LDA #$04                     ; $C9C2  A9 04

loc_0E_C9C4:
    AND $0420,X                  ; $C9C4  3D 20 04
    BNE loc_0E_C9CB              ; $C9C7  D0 02
    CLC                          ; $C9C9  18
    RTS                          ; $C9CA  60


loc_0E_C9CB:
    LDA $0600,X                  ; $C9CB  BD 00 06
    CMP #$F8                     ; $C9CE  C9 F8
    BEQ loc_0E_CA2B              ; $C9D0  F0 59
    LDY $0400,X                  ; $C9D2  BC 00 04
    CPY #$FF                     ; $C9D5  C0 FF
    BNE loc_0E_C9E6              ; $C9D7  D0 0D
    LDY $06E0,X                  ; $C9D9  BC E0 06
    LDA $FB38,Y                  ; $C9DC  B9 38 FB
    STA $0E                      ; $C9DF  85 0E
    LDA $FC06,Y                  ; $C9E1  B9 06 FC
    BNE loc_0E_C9EE              ; $C9E4  D0 08

loc_0E_C9E6:
    LDA $FAB5,Y                  ; $C9E6  B9 B5 FA
    STA $0E                      ; $C9E9  85 0E
    LDA $FB83,Y                  ; $C9EB  B9 83 FB

loc_0E_C9EE:
    STA $0D                      ; $C9EE  85 0D
    SEC                          ; $C9F0  38
    LDA $0600,X                  ; $C9F1  BD 00 06
    SBC $0D                      ; $C9F4  E5 0D
    CMP $02                      ; $C9F6  C5 02
    BCS loc_0E_CA2B              ; $C9F8  B0 31
    CLC                          ; $C9FA  18
    LDA $0600,X                  ; $C9FB  BD 00 06
    ADC $0D                      ; $C9FE  65 0D
    CMP $03                      ; $CA00  C5 03
    BCC loc_0E_CA2B              ; $CA02  90 27
    SEC                          ; $CA04  38
    LDA $0480,X                  ; $CA05  BD 80 04
    SBC $1A                      ; $CA08  E5 1A
    STA $0C                      ; $CA0A  85 0C
    LDA $0460,X                  ; $CA0C  BD 60 04
    SBC $1B                      ; $CA0F  E5 1B
    BNE loc_0E_CA2B              ; $CA11  D0 18
    LDA $0C                      ; $CA13  A5 0C
    SEC                          ; $CA15  38
    SBC $0E                      ; $CA16  E5 0E
    BCC loc_0E_CA2B              ; $CA18  90 11
    CMP $01                      ; $CA1A  C5 01
    BEQ loc_0E_CA29              ; $CA1C  F0 0B
    BCS loc_0E_CA2B              ; $CA1E  B0 0B
    CLC                          ; $CA20  18
    LDA $0C                      ; $CA21  A5 0C
    ADC $0E                      ; $CA23  65 0E
    CMP $00                      ; $CA25  C5 00
    BCC loc_0E_CA2B              ; $CA27  90 02

loc_0E_CA29:
    SEC                          ; $CA29  38
    RTS                          ; $CA2A  60


loc_0E_CA2B:
    CLC                          ; $CA2B  18
    RTS                          ; $CA2C  60


loc_0E_CA2D:
    LDA #$20                     ; $CA2D  A9 20
    JSR sub_0E_D116              ; $CA2F  20 16 D1
    LDA #$01                     ; $CA32  A9 01
    STA $59                      ; $CA34  85 59
    LDA #$5F                     ; $CA36  A9 5F
    STA $5A                      ; $CA38  85 5A
    JSR sub_0E_C32A              ; $CA3A  20 2A C3
    LDA $AC                      ; $CA3D  A5 AC
    CMP #$09                     ; $CA3F  C9 09
    BEQ loc_0E_CA7E              ; $CA41  F0 3B
    CMP $31                      ; $CA43  C5 31
    BNE loc_0E_CA7E              ; $CA45  D0 37
    LDA #$FF                     ; $CA47  A9 FF
    JSR sub_0E_C477              ; $CA49  20 77 C4
    LDA #$12                     ; $CA4C  A9 12
    JSR sub_0E_C477              ; $CA4E  20 77 C4
    LDA $31                      ; $CA51  A5 31
    CMP #$06                     ; $CA53  C9 06
    BCS loc_0E_CA7E              ; $CA55  B0 27
    LDA #$01                     ; $CA57  A9 01
    STA $2F                      ; $CA59  85 2F
    LDA #$44                     ; $CA5B  A9 44
    LDX #$1F                     ; $CA5D  A2 1F
    JSR sub_0F_F67B              ; $CA5F  20 7B F6
    LDA #$13                     ; $CA62  A9 13
    STA $0420,X                  ; $CA64  9D 20 04
    LDA #$28                     ; $CA67  A9 28
    STA $0600,X                  ; $CA69  9D 00 06
    LDA #$80                     ; $CA6C  A9 80
    STA $0480,X                  ; $CA6E  9D 80 04
    LDY #$C4                     ; $CA71  A0 C4
    JSR sub_0F_F533              ; $CA73  20 33 F5
    LDA #$F8                     ; $CA76  A9 F8
    STA $0601                    ; $CA78  8D 01 06
    JMP loc_0E_CACE              ; $CA7B  4C CE CA


loc_0E_CA7E:
    LDA $AC                      ; $CA7E  A5 AC
    CMP #$09                     ; $CA80  C9 09
    BNE loc_0E_CA87              ; $CA82  D0 03
    JMP loc_0F_F28E              ; $CA84  4C 8E F2


loc_0E_CA87:
    CMP #$0A                     ; $CA87  C9 0A
    BEQ loc_0E_CB03              ; $CA89  F0 78
    CMP $31                      ; $CA8B  C5 31
    BEQ loc_0E_CADD              ; $CA8D  F0 4E
    LDA #$0A                     ; $CA8F  A9 0A
    STA $0C                      ; $CA91  85 0C

loc_0E_CA93:
    LDA #$10                     ; $CA93  A9 10
    STA $05                      ; $CA95  85 05
    JSR sub_0E_D440              ; $CA97  20 40 D4
    DEC $0C                      ; $CA9A  C6 0C
    BNE loc_0E_CA93              ; $CA9C  D0 F5
    LDA #$00                     ; $CA9E  A9 00
    STA $0C                      ; $CAA0  85 0C
    LDX $AC                      ; $CAA2  A6 AC
    LDA $C14E,X                  ; $CAA4  BD 4E C1
    JSR sub_0E_C625              ; $CAA7  20 25 C6
    LDA $31                      ; $CAAA  A5 31
    CMP #$07                     ; $CAAC  C9 07
    BEQ loc_0E_CACE              ; $CAAE  F0 1E
    LDA #$01                     ; $CAB0  A9 01
    STA $2F                      ; $CAB2  85 2F
    LDA #$43                     ; $CAB4  A9 43
    LDX #$1F                     ; $CAB6  A2 1F
    JSR sub_0F_F67B              ; $CAB8  20 7B F6
    LDA #$08                     ; $CABB  A9 08
    STA $0480,X                  ; $CABD  9D 80 04
    TAY                          ; $CAC0  A8
    JSR sub_0F_F533              ; $CAC1  20 33 F5
    LDA #$B0                     ; $CAC4  A9 B0
    STA $0600,X                  ; $CAC6  9D 00 06
    LDA #$22                     ; $CAC9  A9 22
    STA $0420,X                  ; $CACB  9D 20 04

loc_0E_CACE:
    LDA #$00                     ; $CACE  A9 00
    STA $3E                      ; $CAD0  85 3E
    LDA #$F8                     ; $CAD2  A9 F8
    STA $0601                    ; $CAD4  8D 01 06
    LDX #$FF                     ; $CAD7  A2 FF
    TXS                          ; $CAD9  9A
    JMP $915E                    ; $CADA  4C 5E 91


loc_0E_CADD:
    CMP #$06                     ; $CADD  C9 06
    BNE loc_0E_CAEF              ; $CADF  D0 0E
    LDX #$02                     ; $CAE1  A2 02

loc_0E_CAE3:
    LDA $CB00,X                  ; $CAE3  BD 00 CB
    STA $03D5,X                  ; $CAE6  9D D5 03
    DEX                          ; $CAE9  CA
    BPL loc_0E_CAE3              ; $CAEA  10 F7
    JSR sub_0E_C73F              ; $CAEC  20 3F C7

loc_0E_CAEF:
    LDA #$F8                     ; $CAEF  A9 F8
    STA $0601                    ; $CAF1  8D 01 06
    LDA #$FF                     ; $CAF4  A9 FF
    STA $3C                      ; $CAF6  85 3C

loc_0E_CAF8:
    JSR sub_0E_C317              ; $CAF8  20 17 C3
    BNE loc_0E_CAF8              ; $CAFB  D0 FB
    JMP loc_0E_C05A              ; $CAFD  4C 5A C0

    .byte $00,$10,$0F  ; $CB00

loc_0E_CB03:
    LDX #$10                     ; $CB03  A2 10
    STX $2F                      ; $CB05  86 2F
    JSR $AEFD                    ; $CB07  20 FD AE
    LDA #$F8                     ; $CB0A  A9 F8
    STA $0610                    ; $CB0C  8D 10 06
    STA $0601                    ; $CB0F  8D 01 06
    LDX #$03                     ; $CB12  A2 03

loc_0E_CB14:
    STA $0612,X                  ; $CB14  9D 12 06
    DEX                          ; $CB17  CA
    BPL loc_0E_CB14              ; $CB18  10 FA
    LDA #$0F                     ; $CB1A  A9 0F
    LDX #$07                     ; $CB1C  A2 07

loc_0E_CB1E:
    STA $03D4,X                  ; $CB1E  9D D4 03
    DEX                          ; $CB21  CA
    BPL loc_0E_CB1E              ; $CB22  10 FA
    LDA #$00                     ; $CB24  A9 00
    STA $03D5                    ; $CB26  8D D5 03
    STA $03D9                    ; $CB29  8D D9 03
    JSR sub_0E_C73F              ; $CB2C  20 3F C7
    JSR sub_0E_D131              ; $CB2F  20 31 D1
    LDA #$02                     ; $CB32  A9 02
    STA $5C                      ; $CB34  85 5C
    LDA #$B9                     ; $CB36  A9 B9
    LDX #$09                     ; $CB38  A2 09
    LDY #$08                     ; $CB3A  A0 08
    JSR sub_0F_F0BE              ; $CB3C  20 BE F0
    LDA #$B2                     ; $CB3F  A9 B2
    LDX #$0A                     ; $CB41  A2 0A
    LDY #$08                     ; $CB43  A0 08
    JSR sub_0F_F0BE              ; $CB45  20 BE F0
    LDA #$80                     ; $CB48  A9 80
    STA $3C                      ; $CB4A  85 3C
    INC $06A0                    ; $CB4C  EE A0 06
    INC $06B1                    ; $CB4F  EE B1 06

loc_0E_CB52:
    JSR sub_0E_C317              ; $CB52  20 17 C3
    BNE loc_0E_CB52              ; $CB55  D0 FB
    LDX #$11                     ; $CB57  A2 11
    STX $2F                      ; $CB59  86 2F
    LDA #$4A                     ; $CB5B  A9 4A
    JSR sub_0F_F67B              ; $CB5D  20 7B F6
    LDA #$11                     ; $CB60  A9 11
    STA $0420,X                  ; $CB62  9D 20 04
    LDA #$02                     ; $CB65  A9 02
    STA $0680,X                  ; $CB67  9D 80 06
    INC $68                      ; $CB6A  E6 68
    JMP loc_0E_CACE              ; $CB6C  4C CE CA


sub_0E_CB6F:
    JSR sub_0E_C39C              ; $CB6F  20 9C C3
    LDA $01                      ; $CB72  A5 01
    STA $0C                      ; $CB74  85 0C
    LDA $00                      ; $CB76  A5 00
    STA $0D                      ; $CB78  85 0D
    LDX $2F                      ; $CB7A  A6 2F
    BNE loc_0E_CB99              ; $CB7C  D0 1B
    LDX #$02                     ; $CB7E  A2 02

loc_0E_CB80:
    CLC                          ; $CB80  18
    LDA $03                      ; $CB81  A5 03
    ADC $CB96,X                  ; $CB83  7D 96 CB
    STA $0E                      ; $CB86  85 0E
    JSR sub_0E_CCB7              ; $CB88  20 B7 CC
    STA $2A,X                    ; $CB8B  95 2A
    DEX                          ; $CB8D  CA
    BPL loc_0E_CB80              ; $CB8E  10 F0
    JSR sub_0E_D790              ; $CB90  20 90 D7
    JMP loc_0E_C3B3              ; $CB93  4C B3 C3

    .byte $F4,$FC,$0B  ; $CB96

loc_0E_CB99:
    LDX $2F                      ; $CB99  A6 2F
    LDY $0400,X                  ; $CB9B  BC 00 04
    CPY #$FF                     ; $CB9E  C0 FF
    BNE loc_0E_CBAA              ; $CBA0  D0 08
    LDY $06E0,X                  ; $CBA2  BC E0 06
    LDA $FC06,Y                  ; $CBA5  B9 06 FC
    BNE loc_0E_CBAD              ; $CBA8  D0 03

loc_0E_CBAA:
    LDA $FB83,Y                  ; $CBAA  B9 83 FB

loc_0E_CBAD:
    PHA                          ; $CBAD  48
    EOR #$FF                     ; $CBAE  49 FF
    CLC                          ; $CBB0  18
    ADC #$01                     ; $CBB1  69 01
    CLC                          ; $CBB3  18
    ADC $03                      ; $CBB4  65 03
    STA $0E                      ; $CBB6  85 0E
    JSR sub_0E_CCB7              ; $CBB8  20 B7 CC
    CMP #$01                     ; $CBBB  C9 01
    BEQ loc_0E_CBD6              ; $CBBD  F0 17
    PLA                          ; $CBBF  68
    SEC                          ; $CBC0  38
    SBC #$01                     ; $CBC1  E9 01
    CLC                          ; $CBC3  18
    ADC $03                      ; $CBC4  65 03
    STA $0E                      ; $CBC6  85 0E
    JSR sub_0E_CCB7              ; $CBC8  20 B7 CC
    CMP #$01                     ; $CBCB  C9 01
    BEQ loc_0E_CBD7              ; $CBCD  F0 08
    LDA #$00                     ; $CBCF  A9 00
    STA $2A                      ; $CBD1  85 2A
    JMP loc_0E_C3B3              ; $CBD3  4C B3 C3


loc_0E_CBD6:
    PLA                          ; $CBD6  68

loc_0E_CBD7:
    LDA #$01                     ; $CBD7  A9 01
    STA $2A                      ; $CBD9  85 2A
    JMP loc_0E_C3B3              ; $CBDB  4C B3 C3


sub_0E_CBDE:
    LDA #$00                     ; $CBDE  A9 00
    STA $30                      ; $CBE0  85 30
    LDA $0480                    ; $CBE2  AD 80 04
    STA $00                      ; $CBE5  85 00
    LDA $0460                    ; $CBE7  AD 60 04
    STA $01                      ; $CBEA  85 01
    LDA $0600                    ; $CBEC  AD 00 06
    STA $03                      ; $CBEF  85 03
    JSR sub_0E_CB6F              ; $CBF1  20 6F CB
    SEC                          ; $CBF4  38
    LDA $0620                    ; $CBF5  AD 20 06
    SBC $0660                    ; $CBF8  ED 60 06
    LDA $0600                    ; $CBFB  AD 00 06
    SBC $0680                    ; $CBFE  ED 80 06
    LDX $0680                    ; $CC01  AE 80 06
    BMI loc_0E_CC0C              ; $CC04  30 06
    SEC                          ; $CC06  38
    SBC #$0C                     ; $CC07  E9 0C
    JMP loc_0E_CC0F              ; $CC09  4C 0F CC


loc_0E_CC0C:
    CLC                          ; $CC0C  18
    ADC #$0C                     ; $CC0D  69 0C

loc_0E_CC0F:
    STA $0E                      ; $CC0F  85 0E
    JSR sub_0E_C39C              ; $CC11  20 9C C3
    JSR sub_0E_CCB7              ; $CC14  20 B7 CC
    CMP #$02                     ; $CC17  C9 02
    BNE loc_0E_CC2A              ; $CC19  D0 0F
    LDA $30                      ; $CC1B  A5 30
    LDX $0680                    ; $CC1D  AE 80 06
    BMI loc_0E_CC26              ; $CC20  30 04
    ORA #$10                     ; $CC22  09 10
    BNE loc_0E_CC28              ; $CC24  D0 02

loc_0E_CC26:
    ORA #$01                     ; $CC26  09 01

loc_0E_CC28:
    STA $30                      ; $CC28  85 30

loc_0E_CC2A:
    JMP loc_0E_C3B3              ; $CC2A  4C B3 C3


sub_0E_CC2D:
    JSR sub_0E_C39C              ; $CC2D  20 9C C3
    LDA $03                      ; $CC30  A5 03
    STA $0E                      ; $CC32  85 0E
    LDX $2F                      ; $CC34  A6 2F
    BNE loc_0E_CC60              ; $CC36  D0 28
    LDA #$00                     ; $CC38  A9 00
    STA $2B                      ; $CC3A  85 2B
    LDX #$03                     ; $CC3C  A2 03

loc_0E_CC3E:
    CLC                          ; $CC3E  18
    LDA $00                      ; $CC3F  A5 00
    ADC $CC5C,X                  ; $CC41  7D 5C CC
    STA $0D                      ; $CC44  85 0D
    LDA $01                      ; $CC46  A5 01
    ADC $CC5B,X                  ; $CC48  7D 5B CC
    STA $0C                      ; $CC4B  85 0C
    JSR sub_0E_CCB7              ; $CC4D  20 B7 CC
    DEX                          ; $CC50  CA
    STA $2A,X                    ; $CC51  95 2A
    DEX                          ; $CC53  CA
    BPL loc_0E_CC3E              ; $CC54  10 E8
    JSR sub_0E_D7E1              ; $CC56  20 E1 D7
    JMP loc_0E_C3B3              ; $CC59  4C B3 C3

    .byte $00,$07,$FF,$F9  ; $CC5C

loc_0E_CC60:
    LDX $2F                      ; $CC60  A6 2F
    LDY $0400,X                  ; $CC62  BC 00 04
    CPY #$FF                     ; $CC65  C0 FF
    BNE loc_0E_CC71              ; $CC67  D0 08
    LDY $06E0,X                  ; $CC69  BC E0 06
    LDA $FB38,Y                  ; $CC6C  B9 38 FB
    BNE loc_0E_CC74              ; $CC6F  D0 03

loc_0E_CC71:
    LDA $FAB5,Y                  ; $CC71  B9 B5 FA

loc_0E_CC74:
    SEC                          ; $CC74  38
    SBC #$01                     ; $CC75  E9 01
    STA $0F                      ; $CC77  85 0F
    CLC                          ; $CC79  18
    LDA $00                      ; $CC7A  A5 00
    ADC $0F                      ; $CC7C  65 0F
    STA $0D                      ; $CC7E  85 0D
    LDA $01                      ; $CC80  A5 01
    ADC #$00                     ; $CC82  69 00
    STA $0C                      ; $CC84  85 0C
    JSR sub_0E_CCB7              ; $CC86  20 B7 CC
    CMP #$01                     ; $CC89  C9 01
    BEQ loc_0E_CCB0              ; $CC8B  F0 23
    CMP #$04                     ; $CC8D  C9 04
    BEQ loc_0E_CCB0              ; $CC8F  F0 1F
    SEC                          ; $CC91  38
    LDA $00                      ; $CC92  A5 00
    SBC $0F                      ; $CC94  E5 0F
    STA $0D                      ; $CC96  85 0D
    LDA $01                      ; $CC98  A5 01
    SBC #$00                     ; $CC9A  E9 00
    STA $0C                      ; $CC9C  85 0C
    JSR sub_0E_CCB7              ; $CC9E  20 B7 CC
    CMP #$01                     ; $CCA1  C9 01
    BEQ loc_0E_CCB0              ; $CCA3  F0 0B
    CMP #$04                     ; $CCA5  C9 04
    BEQ loc_0E_CCB0              ; $CCA7  F0 07
    LDA #$00                     ; $CCA9  A9 00
    STA $2B                      ; $CCAB  85 2B
    JMP loc_0E_C3B3              ; $CCAD  4C B3 C3


loc_0E_CCB0:
    LDA #$01                     ; $CCB0  A9 01
    STA $2B                      ; $CCB2  85 2B
    JMP loc_0E_C3B3              ; $CCB4  4C B3 C3


sub_0E_CCB7:
    LDY $8E                      ; $CCB7  A4 8E
    JSR sub_0E_CD8A              ; $CCB9  20 8A CD
    CMP #$00                     ; $CCBC  C9 00
    BEQ loc_0E_CCC1              ; $CCBE  F0 01
    RTS                          ; $CCC0  60


loc_0E_CCC1:
    LDA $0E                      ; $CCC1  A5 0E
    CMP #$F0                     ; $CCC3  C9 F0
    BCC loc_0E_CCD8              ; $CCC5  90 11
    LDY $2F                      ; $CCC7  A4 2F
    LDA $0600,Y                  ; $CCC9  B9 00 06
    CMP #$F1                     ; $CCCC  C9 F1
    BCS loc_0E_CCD4              ; $CCCE  B0 04
    CMP #$80                     ; $CCD0  C9 80
    BCS loc_0E_CCD8              ; $CCD2  B0 04

loc_0E_CCD4:
    LDA #$00                     ; $CCD4  A9 00
    STA $0E                      ; $CCD6  85 0E

loc_0E_CCD8:
    LDY $0C                      ; $CCD8  A4 0C
    LDA $8C00,Y                  ; $CCDA  B9 00 8C
    ASL A                        ; $CCDD  0A
    TAY                          ; $CCDE  A8
    LDA $8C30,Y                  ; $CCDF  B9 30 8C
    STA $04                      ; $CCE2  85 04
    LDA $8C31,Y                  ; $CCE4  B9 31 8C
    STA $05                      ; $CCE7  85 05
    LDA $0D                      ; $CCE9  A5 0D
    LSR A                        ; $CCEB  4A
    LSR A                        ; $CCEC  4A
    AND #$38                     ; $CCED  29 38
    STA $07                      ; $CCEF  85 07
    LDA $0E                      ; $CCF1  A5 0E
    ROL A                        ; $CCF3  2A
    ROL A                        ; $CCF4  2A
    ROL A                        ; $CCF5  2A
    ROL A                        ; $CCF6  2A
    AND #$07                     ; $CCF7  29 07
    ORA $07                      ; $CCF9  05 07
    TAY                          ; $CCFB  A8
    LDA ($04),Y                  ; $CCFC  B1 04
    LDY #$00                     ; $CCFE  A0 00
    STY $09                      ; $CD00  84 09
    ASL A                        ; $CD02  0A
    ROL $09                      ; $CD03  26 09
    ASL A                        ; $CD05  0A
    ROL $09                      ; $CD06  26 09
    TAY                          ; $CD08  A8
    LDA $0E                      ; $CD09  A5 0E
    AND #$10                     ; $CD0B  29 10
    BEQ loc_0E_CD10              ; $CD0D  F0 01
    INY                          ; $CD0F  C8

loc_0E_CD10:
    LDA $0D                      ; $CD10  A5 0D
    AND #$10                     ; $CD12  29 10
    BEQ loc_0E_CD18              ; $CD14  F0 02
    INY                          ; $CD16  C8
    INY                          ; $CD17  C8

loc_0E_CD18:
    LDA #$00                     ; $CD18  A9 00
    STA $08                      ; $CD1A  85 08
    LDA #$80                     ; $CD1C  A9 80
    ORA $09                      ; $CD1E  05 09
    STA $09                      ; $CD20  85 09
    LDA ($08),Y                  ; $CD22  B1 08
    AND #$C0                     ; $CD24  29 C0
    LDY $31                      ; $CD26  A4 31
    STY $06                      ; $CD28  84 06
    ASL A                        ; $CD2A  0A
    ROL $06                      ; $CD2B  26 06
    ASL A                        ; $CD2D  0A
    ROL $06                      ; $CD2E  26 06
    LDY $06                      ; $CD30  A4 06
    LDA $CD46,Y                  ; $CD32  B9 46 CD
    CMP #$02                     ; $CD35  C9 02
    BNE loc_0E_CD45              ; $CD37  D0 0C
    LDA $2F                      ; $CD39  A5 2F
    BNE loc_0E_CD43              ; $CD3B  D0 06
    LDA $0D                      ; $CD3D  A5 0D
    AND #$F0                     ; $CD3F  29 F0
    STA $2E                      ; $CD41  85 2E

loc_0E_CD43:
    LDA #$02                     ; $CD43  A9 02

loc_0E_CD45:
    RTS                          ; $CD45  60

    .byte $00,$01,$02,$03,$00,$01,$04,$05,$00,$01,$02,$03,$00,$01,$02,$06  ; $CD46
    .byte $00,$01,$02,$00,$00,$01,$03,$00,$00,$01,$03,$02,$00,$01,$02,$03  ; $CD56
    .byte $00,$01,$00,$00,$00,$01,$03,$02,$00,$01,$00,$00  ; $CD66

sub_0E_CD72:
    JSR sub_0E_C39C              ; $CD72  20 9C C3
    LDY #$00                     ; $CD75  A0 00

loc_0E_CD77:
    LDA $0722,Y                  ; $CD77  B9 22 07
    CMP $1B                      ; $CD7A  C5 1B
    BCS loc_0E_CD85              ; $CD7C  B0 07
    TYA                          ; $CD7E  98
    CLC                          ; $CD7F  18
    ADC #$06                     ; $CD80  69 06
    TAY                          ; $CD82  A8
    BNE loc_0E_CD77              ; $CD83  D0 F2

loc_0E_CD85:
    STY $8E                      ; $CD85  84 8E
    JMP loc_0E_C3B3              ; $CD87  4C B3 C3


sub_0E_CD8A:
    LDA $68                      ; $CD8A  A5 68
    BNE loc_0E_CDE5              ; $CD8C  D0 57
    LDA $0720                    ; $CD8E  AD 20 07

loc_0E_CD91:
    LDA $0721,Y                  ; $CD91  B9 21 07
    BEQ loc_0E_CDDE              ; $CD94  F0 48
    LDA $0722,Y                  ; $CD96  B9 22 07
    CMP $0C                      ; $CD99  C5 0C
    BEQ loc_0E_CDA2              ; $CD9B  F0 05
    BCC loc_0E_CDDE              ; $CD9D  90 3F
    JMP loc_0E_CDE5              ; $CD9F  4C E5 CD


loc_0E_CDA2:
    LDA $0723,Y                  ; $CDA2  B9 23 07
    CMP $0D                      ; $CDA5  C5 0D
    BEQ loc_0E_CDAB              ; $CDA7  F0 02
    BCS loc_0E_CDDE              ; $CDA9  B0 33

loc_0E_CDAB:
    LDA $0725,Y                  ; $CDAB  B9 25 07
    BEQ loc_0E_CDB6              ; $CDAE  F0 06
    CMP $0D                      ; $CDB0  C5 0D
    BEQ loc_0E_CDDE              ; $CDB2  F0 2A
    BCC loc_0E_CDDE              ; $CDB4  90 28

loc_0E_CDB6:
    LDA $0724,Y                  ; $CDB6  B9 24 07
    CMP $0E                      ; $CDB9  C5 0E
    BEQ loc_0E_CDBF              ; $CDBB  F0 02
    BCS loc_0E_CDDE              ; $CDBD  B0 1F

loc_0E_CDBF:
    LDA $0726,Y                  ; $CDBF  B9 26 07
    BEQ loc_0E_CDCA              ; $CDC2  F0 06
    CMP $0E                      ; $CDC4  C5 0E
    BEQ loc_0E_CDDE              ; $CDC6  F0 16
    BCC loc_0E_CDDE              ; $CDC8  90 14

loc_0E_CDCA:
    LDA $2F                      ; $CDCA  A5 2F
    BNE loc_0E_CDD4              ; $CDCC  D0 06
    LDA $0721,Y                  ; $CDCE  B9 21 07
    ORA #$80                     ; $CDD1  09 80
    RTS                          ; $CDD3  60


loc_0E_CDD4:
    LDA $0721,Y                  ; $CDD4  B9 21 07
    CMP #$04                     ; $CDD7  C9 04
    BEQ loc_0E_CDE5              ; $CDD9  F0 0A
    LDA #$01                     ; $CDDB  A9 01
    RTS                          ; $CDDD  60


loc_0E_CDDE:
    TYA                          ; $CDDE  98
    CLC                          ; $CDDF  18
    ADC #$06                     ; $CDE0  69 06
    TAY                          ; $CDE2  A8
    BNE loc_0E_CD91              ; $CDE3  D0 AC

loc_0E_CDE5:
    LDA #$00                     ; $CDE5  A9 00
    RTS                          ; $CDE7  60


sub_0E_CDE8:
    JSR sub_0E_C39C              ; $CDE8  20 9C C3
    INC $1C                      ; $CDEB  E6 1C
    JSR sub_0E_CE9A              ; $CDED  20 9A CE
    LDA $0C                      ; $CDF0  A5 0C
    PHA                          ; $CDF2  48
    LDA $0D                      ; $CDF3  A5 0D
    PHA                          ; $CDF5  48
    LDA $0E                      ; $CDF6  A5 0E
    PHA                          ; $CDF8  48
    LDA $05                      ; $CDF9  A5 05
    PHA                          ; $CDFB  48
    STA $0C                      ; $CDFC  85 0C
    LDA $04                      ; $CDFE  A5 04
    AND #$E0                     ; $CE00  29 E0
    STA $0D                      ; $CE02  85 0D
    LDA $04                      ; $CE04  A5 04
    AND #$1F                     ; $CE06  29 1F
    ASL A                        ; $CE08  0A
    ASL A                        ; $CE09  0A
    ASL A                        ; $CE0A  0A
    STA $0E                      ; $CE0B  85 0E
    LDY #$00                     ; $CE0D  A0 00
    JSR sub_0E_CD8A              ; $CE0F  20 8A CD
    TAY                          ; $CE12  A8
    PLA                          ; $CE13  68
    STA $05                      ; $CE14  85 05
    PLA                          ; $CE16  68
    STA $0E                      ; $CE17  85 0E
    PLA                          ; $CE19  68
    STA $0D                      ; $CE1A  85 0D
    PLA                          ; $CE1C  68
    STA $0C                      ; $CE1D  85 0C
    CPY #$84                     ; $CE1F  C0 84
    BNE loc_0E_CE58              ; $CE21  D0 35
    LDY $31                      ; $CE23  A4 31
    LDA $05                      ; $CE25  A5 05
    CMP $CE49,Y                  ; $CE27  D9 49 CE
    BNE loc_0E_CE53              ; $CE2A  D0 27
    LDA $CE31,Y                  ; $CE2C  B9 31 CE
    BNE loc_0E_CE70              ; $CE2F  D0 3F
    SRE $0000,Y                  ; $CE31  5B 00 00
    BRK                          ; $CE34  00
    .byte $60,$2B,$8D,$01,$9C,$94,$01,$01,$01,$01,$01,$01,$01,$01,$8D,$01  ; $CE35
    .byte $9C,$94,$01,$01,$17,$17,$17,$13,$17,$12,$27,$28,$2F,$23  ; $CE45

loc_0E_CE53:
    LDA $CE3D,Y                  ; $CE53  B9 3D CE
    BNE loc_0E_CE70              ; $CE56  D0 18

loc_0E_CE58:
    LDY $05                      ; $CE58  A4 05
    LDA $8C00,Y                  ; $CE5A  B9 00 8C
    ASL A                        ; $CE5D  0A
    TAY                          ; $CE5E  A8
    LDA $8C30,Y                  ; $CE5F  B9 30 8C
    STA $06                      ; $CE62  85 06
    LDA $8C31,Y                  ; $CE64  B9 31 8C
    STA $07                      ; $CE67  85 07
    LDA $04                      ; $CE69  A5 04
    LSR A                        ; $CE6B  4A
    LSR A                        ; $CE6C  4A
    TAY                          ; $CE6D  A8
    LDA ($06),Y                  ; $CE6E  B1 06

loc_0E_CE70:
    PHA                          ; $CE70  48
    LDY #$00                     ; $CE71  A0 00
    STY $07                      ; $CE73  84 07
    ASL A                        ; $CE75  0A
    ROL $07                      ; $CE76  26 07
    ASL A                        ; $CE78  0A
    ROL $07                      ; $CE79  26 07
    TAY                          ; $CE7B  A8
    LDA #$00                     ; $CE7C  A9 00
    STA $06                      ; $CE7E  85 06
    LDA #$80                     ; $CE80  A9 80
    ORA $07                      ; $CE82  05 07
    STA $07                      ; $CE84  85 07
    JSR sub_0E_CED7              ; $CE86  20 D7 CE
    JSR sub_0E_CF06              ; $CE89  20 06 CF
    PLA                          ; $CE8C  68
    TAY                          ; $CE8D  A8
    LDA $8300,Y                  ; $CE8E  B9 00 83
    STA $0300,X                  ; $CE91  9D 00 03
    INX                          ; $CE94  E8
    STX $0D                      ; $CE95  86 0D
    JMP loc_0E_C3B3              ; $CE97  4C B3 C3


sub_0E_CE9A:
    LDX #$20                     ; $CE9A  A2 20
    LDY #$23                     ; $CE9C  A0 23
    LDA $05                      ; $CE9E  A5 05
    AND #$01                     ; $CEA0  29 01
    BEQ loc_0E_CEA8              ; $CEA2  F0 04
    LDX #$24                     ; $CEA4  A2 24
    LDY #$27                     ; $CEA6  A0 27

loc_0E_CEA8:
    STX $10                      ; $CEA8  86 10
    STY $09                      ; $CEAA  84 09
    LDA #$00                     ; $CEAC  A9 00
    STA $07                      ; $CEAE  85 07
    LDA $04                      ; $CEB0  A5 04
    AND #$1F                     ; $CEB2  29 1F
    ASL A                        ; $CEB4  0A
    ASL A                        ; $CEB5  0A
    ASL A                        ; $CEB6  0A
    ASL A                        ; $CEB7  0A
    ROL $07                      ; $CEB8  26 07
    ASL A                        ; $CEBA  0A
    ROL $07                      ; $CEBB  26 07
    STA $06                      ; $CEBD  85 06
    LDA $04                      ; $CEBF  A5 04
    AND #$E0                     ; $CEC1  29 E0
    LSR A                        ; $CEC3  4A
    LSR A                        ; $CEC4  4A
    LSR A                        ; $CEC5  4A
    ORA $06                      ; $CEC6  05 06
    LDX $0D                      ; $CEC8  A6 0D
    STA $0301,X                  ; $CECA  9D 01 03
    LDA $10                      ; $CECD  A5 10
    ORA $07                      ; $CECF  05 07
    STA $0300,X                  ; $CED1  9D 00 03
    INX                          ; $CED4  E8
    INX                          ; $CED5  E8
    RTS                          ; $CED6  60


sub_0E_CED7:
    LDA #$02                     ; $CED7  A9 02
    STA $0E                      ; $CED9  85 0E

loc_0E_CEDB:
    LDA #$02                     ; $CEDB  A9 02
    STA $0F                      ; $CEDD  85 0F

loc_0E_CEDF:
    LDA ($06),Y                  ; $CEDF  B1 06
    ASL A                        ; $CEE1  0A
    ASL A                        ; $CEE2  0A
    CLC                          ; $CEE3  18
    STA $0300,X                  ; $CEE4  9D 00 03
    ADC #$01                     ; $CEE7  69 01
    STA $0301,X                  ; $CEE9  9D 01 03
    ADC #$01                     ; $CEEC  69 01
    STA $0304,X                  ; $CEEE  9D 04 03
    ADC #$01                     ; $CEF1  69 01
    STA $0305,X                  ; $CEF3  9D 05 03
    INX                          ; $CEF6  E8
    INX                          ; $CEF7  E8
    INY                          ; $CEF8  C8
    DEC $0F                      ; $CEF9  C6 0F
    BNE loc_0E_CEDF              ; $CEFB  D0 E2
    INX                          ; $CEFD  E8
    INX                          ; $CEFE  E8
    INX                          ; $CEFF  E8
    INX                          ; $CF00  E8
    DEC $0E                      ; $CF01  C6 0E
    BNE loc_0E_CEDB              ; $CF03  D0 D6
    RTS                          ; $CF05  60


sub_0E_CF06:
    LDA $04                      ; $CF06  A5 04
    ROL A                        ; $CF08  2A
    PHA                          ; $CF09  48
    ROL A                        ; $CF0A  2A
    ROL A                        ; $CF0B  2A
    ROL A                        ; $CF0C  2A
    AND #$07                     ; $CF0D  29 07
    STA $08                      ; $CF0F  85 08
    PLA                          ; $CF11  68
    AND #$38                     ; $CF12  29 38
    ORA $08                      ; $CF14  05 08
    ORA #$C0                     ; $CF16  09 C0
    STA $0301,X                  ; $CF18  9D 01 03
    LDA $09                      ; $CF1B  A5 09
    STA $0300,X                  ; $CF1D  9D 00 03
    INX                          ; $CF20  E8
    INX                          ; $CF21  E8
    RTS                          ; $CF22  60


sub_0E_CF23:
    JSR sub_0E_C39C              ; $CF23  20 9C C3
    LDA $33                      ; $CF26  A5 33
    LSR A                        ; $CF28  4A
    LSR A                        ; $CF29  4A
    LSR A                        ; $CF2A  4A
    LSR A                        ; $CF2B  4A
    STA $0300                    ; $CF2C  8D 00 03
    LDA $33                      ; $CF2F  A5 33
    ASL A                        ; $CF31  0A
    ASL A                        ; $CF32  0A
    ASL A                        ; $CF33  0A
    PHA                          ; $CF34  48
    AND #$18                     ; $CF35  29 18
    STA $0301                    ; $CF37  8D 01 03
    PLA                          ; $CF3A  68
    ASL A                        ; $CF3B  0A
    AND #$C0                     ; $CF3C  29 C0
    ORA $0301                    ; $CF3E  0D 01 03
    STA $0301                    ; $CF41  8D 01 03
    LDA $33                      ; $CF44  A5 33
    AND #$F8                     ; $CF46  29 F8
    ORA #$C0                     ; $CF48  09 C0
    STA $0313                    ; $CF4A  8D 13 03
    LDA $33                      ; $CF4D  A5 33
    AND #$03                     ; $CF4F  29 03
    ASL A                        ; $CF51  0A
    ORA $0313                    ; $CF52  0D 13 03
    STA $0313                    ; $CF55  8D 13 03
    LDX #$20                     ; $CF58  A2 20
    LDA $1B                      ; $CF5A  A5 1B
    AND #$01                     ; $CF5C  29 01
    BEQ loc_0E_CF62              ; $CF5E  F0 02
    LDX #$24                     ; $CF60  A2 24

loc_0E_CF62:
    TXA                          ; $CF62  8A
    ORA $0300                    ; $CF63  0D 00 03
    STA $0300                    ; $CF66  8D 00 03
    TXA                          ; $CF69  8A
    ORA #$03                     ; $CF6A  09 03
    STA $0312                    ; $CF6C  8D 12 03
    LDA #$00                     ; $CF6F  A9 00
    STA $0C                      ; $CF71  85 0C
    LDA $33                      ; $CF73  A5 33
    AND #$3B                     ; $CF75  29 3B
    LSR A                        ; $CF77  4A
    ROR $0C                      ; $CF78  66 0C
    LSR A                        ; $CF7A  4A
    ROR $0C                      ; $CF7B  66 0C
    LSR A                        ; $CF7D  4A
    ROR $0C                      ; $CF7E  66 0C
    LSR $0C                      ; $CF80  46 0C
    ORA $0C                      ; $CF82  05 0C
    STA $0C                      ; $CF84  85 0C
    LDX $0460                    ; $CF86  AE 60 04
    LDA $8C00,X                  ; $CF89  BD 00 8C
    ASL A                        ; $CF8C  0A
    TAX                          ; $CF8D  AA
    LDA $8C30,X                  ; $CF8E  BD 30 8C
    STA $04                      ; $CF91  85 04
    LDA $8C31,X                  ; $CF93  BD 31 8C
    STA $05                      ; $CF96  85 05
    LDX #$00                     ; $CF98  A2 00
    STX $0D                      ; $CF9A  86 0D

loc_0E_CF9C:
    LDA #$00                     ; $CF9C  A9 00
    STA $07                      ; $CF9E  85 07
    LDA $0D                      ; $CFA0  A5 0D
    PHA                          ; $CFA2  48
    LDA $0E                      ; $CFA3  A5 0E
    PHA                          ; $CFA5  48
    LDA $05                      ; $CFA6  A5 05
    PHA                          ; $CFA8  48
    LDA $0C                      ; $CFA9  A5 0C
    PHA                          ; $CFAB  48
    AND #$38                     ; $CFAC  29 38
    ASL A                        ; $CFAE  0A
    ASL A                        ; $CFAF  0A
    STA $0D                      ; $CFB0  85 0D
    LDA $0C                      ; $CFB2  A5 0C
    AND #$07                     ; $CFB4  29 07
    LSR A                        ; $CFB6  4A
    ROR A                        ; $CFB7  6A
    ROR A                        ; $CFB8  6A
    ROR A                        ; $CFB9  6A
    STA $0E                      ; $CFBA  85 0E
    LDA $0460                    ; $CFBC  AD 60 04
    STA $0C                      ; $CFBF  85 0C
    LDY #$00                     ; $CFC1  A0 00
    JSR sub_0E_CD8A              ; $CFC3  20 8A CD
    TAY                          ; $CFC6  A8
    PLA                          ; $CFC7  68
    STA $0C                      ; $CFC8  85 0C
    PLA                          ; $CFCA  68
    STA $05                      ; $CFCB  85 05
    PLA                          ; $CFCD  68
    STA $0E                      ; $CFCE  85 0E
    PLA                          ; $CFD0  68
    STA $0D                      ; $CFD1  85 0D
    CPY #$84                     ; $CFD3  C0 84
    BNE loc_0E_CFEB              ; $CFD5  D0 14
    LDY $31                      ; $CFD7  A4 31
    LDA $0460                    ; $CFD9  AD 60 04
    CMP $CE49,X                  ; $CFDC  DD 49 CE
    BNE loc_0E_CFE6              ; $CFDF  D0 05
    LDA $CE31,Y                  ; $CFE1  B9 31 CE
    BNE loc_0E_CFEF              ; $CFE4  D0 09

loc_0E_CFE6:
    LDA $CE3D,Y                  ; $CFE6  B9 3D CE
    BNE loc_0E_CFEF              ; $CFE9  D0 04

loc_0E_CFEB:
    LDY $0C                      ; $CFEB  A4 0C
    LDA ($04),Y                  ; $CFED  B1 04

loc_0E_CFEF:
    STA $0F                      ; $CFEF  85 0F
    ASL A                        ; $CFF1  0A
    ROL $07                      ; $CFF2  26 07
    ASL A                        ; $CFF4  0A
    ROL $07                      ; $CFF5  26 07
    TAY                          ; $CFF7  A8
    LDA #$80                     ; $CFF8  A9 80
    ORA $07                      ; $CFFA  05 07
    STA $07                      ; $CFFC  85 07
    LDA #$00                     ; $CFFE  A9 00
    STA $06                      ; $D000  85 06
    LDA $33                      ; $D002  A5 33
    AND #$04                     ; $D004  29 04
    BEQ loc_0E_D009              ; $D006  F0 01
    INY                          ; $D008  C8

loc_0E_D009:
    LDA #$02                     ; $D009  A9 02
    STA $0E                      ; $D00B  85 0E

loc_0E_D00D:
    LDA ($06),Y                  ; $D00D  B1 06
    ASL A                        ; $D00F  0A
    ASL A                        ; $D010  0A
    CLC                          ; $D011  18
    STA $0302,X                  ; $D012  9D 02 03
    ADC #$01                     ; $D015  69 01
    STA $030A,X                  ; $D017  9D 0A 03
    ADC #$01                     ; $D01A  69 01
    STA $0303,X                  ; $D01C  9D 03 03
    ADC #$01                     ; $D01F  69 01
    STA $030B,X                  ; $D021  9D 0B 03
    INX                          ; $D024  E8
    INX                          ; $D025  E8
    INY                          ; $D026  C8
    INY                          ; $D027  C8
    DEC $0E                      ; $D028  C6 0E
    BNE loc_0E_D00D              ; $D02A  D0 E1
    LDA $33                      ; $D02C  A5 33
    LDY #$0F                     ; $D02E  A0 0F
    AND #$04                     ; $D030  29 04
    BEQ loc_0E_D036              ; $D032  F0 02
    LDY #$F0                     ; $D034  A0 F0

loc_0E_D036:
    STY $0314                    ; $D036  8C 14 03
    LDY $0F                      ; $D039  A4 0F
    LDA $8300,Y                  ; $D03B  B9 00 83
    AND $0314                    ; $D03E  2D 14 03
    LDY $0D                      ; $D041  A4 0D
    STA $0315,Y                  ; $D043  99 15 03
    LDA $0C                      ; $D046  A5 0C
    ORA #$08                     ; $D048  09 08
    STA $0C                      ; $D04A  85 0C
    INC $0D                      ; $D04C  E6 0D
    LDA $0D                      ; $D04E  A5 0D
    CMP #$02                     ; $D050  C9 02
    BEQ loc_0E_D057              ; $D052  F0 03
    JMP loc_0E_CF9C              ; $D054  4C 9C CF


loc_0E_D057:
    LDA #$40                     ; $D057  A9 40
    STA $1C                      ; $D059  85 1C
    LDA #$FF                     ; $D05B  A9 FF
    EOR $0314                    ; $D05D  4D 14 03
    STA $0314                    ; $D060  8D 14 03
    JMP loc_0E_C3B3              ; $D063  4C B3 C3


sub_0E_D066:
    LDX $31                      ; $D066  A6 31
    LDA $D06E,X                  ; $D068  BD 6E D0
    JMP loc_0E_D09B              ; $D06B  4C 9B D0

    .byte $00,$00,$00,$00,$00,$00  ; $D06E

sub_0E_D074:
    LDX $31                      ; $D074  A6 31
    LDA $D07C,X                  ; $D076  BD 7C D0
    JMP loc_0E_D09B              ; $D079  4C 9B D0

    .byte $09,$09,$00,$09,$00,$09,$1B,$00,$00,$1B,$12,$12,$12,$09,$12,$09  ; $D07C
    .byte $12,$1B,$1B,$12,$1B,$1B  ; $D08C

sub_0E_D092:
    LDX $31                      ; $D092  A6 31
    CPX #$09                     ; $D094  E0 09
    BEQ loc_0E_D106              ; $D096  F0 6E
    LDA $D087,X                  ; $D098  BD 87 D0

loc_0E_D09B:
    INC $06A0                    ; $D09B  EE A0 06
    JSR sub_0E_C39C              ; $D09E  20 9C C3
    PHA                          ; $D0A1  48
    LDA #$24                     ; $D0A2  A9 24
    JSR sub_0E_C477              ; $D0A4  20 77 C4
    PLA                          ; $D0A7  68
    TAX                          ; $D0A8  AA
    LDA $8F80,X                  ; $D0A9  BD 80 8F
    STA $5A                      ; $D0AC  85 5A
    INX                          ; $D0AE  E8
    STX $59                      ; $D0AF  86 59

loc_0E_D0B1:
    JSR sub_0E_C39C              ; $D0B1  20 9C C3
    LDX $59                      ; $D0B4  A6 59
    LDA #$00                     ; $D0B6  A9 00
    STA $0D                      ; $D0B8  85 0D
    LDA $0460                    ; $D0BA  AD 60 04
    STA $05                      ; $D0BD  85 05
    LDA $8F80,X                  ; $D0BF  BD 80 8F
    STA $04                      ; $D0C2  85 04
    INX                          ; $D0C4  E8
    STX $59                      ; $D0C5  86 59
    JSR sub_0E_CE9A              ; $D0C7  20 9A CE
    LDY $59                      ; $D0CA  A4 59
    LDA $8F80,Y                  ; $D0CC  B9 80 8F
    ASL A                        ; $D0CF  0A
    ASL A                        ; $D0D0  0A
    ADC #$40                     ; $D0D1  69 40
    STA $06                      ; $D0D3  85 06
    LDA #$8F                     ; $D0D5  A9 8F
    STA $07                      ; $D0D7  85 07
    LDY #$00                     ; $D0D9  A0 00
    JSR sub_0E_CED7              ; $D0DB  20 D7 CE
    JSR sub_0E_CF06              ; $D0DE  20 06 CF
    LDX $59                      ; $D0E1  A6 59
    LDY $8F80,X                  ; $D0E3  BC 80 8F
    LDA $8F70,Y                  ; $D0E6  B9 70 8F
    STA $0314                    ; $D0E9  8D 14 03
    INX                          ; $D0EC  E8
    STX $59                      ; $D0ED  86 59
    LDA #$01                     ; $D0EF  A9 01
    STA $1C                      ; $D0F1  85 1C
    LDA #$06                     ; $D0F3  A9 06
    JSR sub_0E_D109              ; $D0F5  20 09 D1
    DEC $5A                      ; $D0F8  C6 5A
    BNE loc_0E_D0B1              ; $D0FA  D0 B5
    LDA #$FE                     ; $D0FC  A9 FE
    JSR sub_0E_C477              ; $D0FE  20 77 C4
    LDA #$00                     ; $D101  A9 00
    STA $06A0                    ; $D103  8D A0 06

loc_0E_D106:
    JMP loc_0E_C3B3              ; $D106  4C B3 C3


sub_0E_D109:
    STA $3C                      ; $D109  85 3C

loc_0E_D10B:
    JSR sub_0E_D131              ; $D10B  20 31 D1
    JSR sub_0E_C01B              ; $D10E  20 1B C0
    DEC $3C                      ; $D111  C6 3C
    BNE loc_0E_D10B              ; $D113  D0 F6
    RTS                          ; $D115  60


sub_0E_D116:
    STA $3C                      ; $D116  85 3C

loc_0E_D118:
    INC $06A0                    ; $D118  EE A0 06
    JSR sub_0E_C465              ; $D11B  20 65 C4
    JSR sub_0E_D131              ; $D11E  20 31 D1
    JSR sub_0E_D46A              ; $D121  20 6A D4
    JSR sub_0E_C01B              ; $D124  20 1B C0
    DEC $3C                      ; $D127  C6 3C
    BNE loc_0E_D118              ; $D129  D0 ED
    LDA #$00                     ; $D12B  A9 00
    STA $06A0                    ; $D12D  8D A0 06
    RTS                          ; $D130  60


sub_0E_D131:
    LDA #$06                     ; $D131  A9 06
    STA $42                      ; $D133  85 42
    STA $C006                    ; $D135  8D 06 C0
    LDY #$00                     ; $D138  A0 00
    STY $0D                      ; $D13A  84 0D
    LDX #$40                     ; $D13C  A2 40
    JSR sub_0E_D478              ; $D13E  20 78 D4
    LDA $23                      ; $D141  A5 23
    AND #$01                     ; $D143  29 01
    BEQ loc_0E_D15C              ; $D145  F0 15
    JSR sub_0E_D36E              ; $D147  20 6E D3
    LDA #$00                     ; $D14A  A9 00
    STA $0C                      ; $D14C  85 0C

loc_0E_D14E:
    JSR sub_0E_D16E              ; $D14E  20 6E D1
    INC $0C                      ; $D151  E6 0C
    LDA $54                      ; $D153  A5 54
    CMP $0C                      ; $D155  C5 0C
    BNE loc_0E_D14E              ; $D157  D0 F5
    JMP loc_0E_C3B3              ; $D159  4C B3 C3


loc_0E_D15C:
    LDX $54                      ; $D15C  A6 54
    DEX                          ; $D15E  CA
    STX $0C                      ; $D15F  86 0C

loc_0E_D161:
    JSR sub_0E_D16E              ; $D161  20 6E D1
    DEC $0C                      ; $D164  C6 0C
    BPL loc_0E_D161              ; $D166  10 F9
    JSR sub_0E_D36E              ; $D168  20 6E D3
    JMP loc_0E_C3B3              ; $D16B  4C B3 C3


sub_0E_D16E:
    LDX $0C                      ; $D16E  A6 0C
    LDA $0600,X                  ; $D170  BD 00 06
    CMP #$F8                     ; $D173  C9 F8
    BNE loc_0E_D178              ; $D175  D0 01
    RTS                          ; $D177  60


loc_0E_D178:
    STA $10                      ; $D178  85 10
    LDA $0400,X                  ; $D17A  BD 00 04
    CMP #$FF                     ; $D17D  C9 FF
    BNE loc_0E_D184              ; $D17F  D0 03
    JMP loc_0E_D2AB              ; $D181  4C AB D2


loc_0E_D184:
    LDA $0640,X                  ; $D184  BD 40 06
    LSR A                        ; $D187  4A
    LSR A                        ; $D188  4A
    LSR A                        ; $D189  4A
    LSR A                        ; $D18A  4A
    CLC                          ; $D18B  18
    ADC $0400,X                  ; $D18C  7D 00 04
    ASL A                        ; $D18F  0A
    TAY                          ; $D190  A8
    LDA #$81                     ; $D191  A9 81
    ADC #$00                     ; $D193  69 00
    STA $05                      ; $D195  85 05
    LDA #$86                     ; $D197  A9 86
    STA $04                      ; $D199  85 04
    LDA ($04),Y                  ; $D19B  B1 04
    STA $00                      ; $D19D  85 00
    INY                          ; $D19F  C8
    LDA ($04),Y                  ; $D1A0  B1 04
    STA $01                      ; $D1A2  85 01
    LDA $0440,X                  ; $D1A4  BD 40 04
    LSR A                        ; $D1A7  4A
    LSR A                        ; $D1A8  4A
    LSR A                        ; $D1A9  4A
    LSR A                        ; $D1AA  4A
    TAY                          ; $D1AB  A8
    INY                          ; $D1AC  C8
    CPX #$01                     ; $D1AD  E0 01
    BNE loc_0E_D1C9              ; $D1AF  D0 18
    LDA $56                      ; $D1B1  A5 56
    BEQ loc_0E_D1C9              ; $D1B3  F0 14
    DEC $56                      ; $D1B5  C6 56
    AND #$02                     ; $D1B7  29 02
    BEQ loc_0E_D1C9              ; $D1B9  F0 0E
    LDA $31                      ; $D1BB  A5 31
    CMP #$05                     ; $D1BD  C9 05
    BEQ loc_0E_D1C5              ; $D1BF  F0 04
    LDA #$1A                     ; $D1C1  A9 1A
    BNE loc_0E_D1CB              ; $D1C3  D0 06

loc_0E_D1C5:
    LDA #$75                     ; $D1C5  A9 75
    BNE loc_0E_D1CB              ; $D1C7  D0 02

loc_0E_D1C9:
    LDA ($00),Y                  ; $D1C9  B1 00

loc_0E_D1CB:
    PHA                          ; $D1CB  48
    LDA $06A0,X                  ; $D1CC  BD A0 06
    BEQ loc_0E_D1D4              ; $D1CF  F0 03
    JMP loc_0E_D1EC              ; $D1D1  4C EC D1


loc_0E_D1D4:
    LDA $0640,X                  ; $D1D4  BD 40 06
    BEQ loc_0E_D1E9              ; $D1D7  F0 10
    AND #$0F                     ; $D1D9  29 0F
    TAY                          ; $D1DB  A8
    DEY                          ; $D1DC  88
    BEQ loc_0E_D1E4              ; $D1DD  F0 05
    DEC $0640,X                  ; $D1DF  DE 40 06
    BNE loc_0E_D1E9              ; $D1E2  D0 05

loc_0E_D1E4:
    LDA #$00                     ; $D1E4  A9 00
    STA $0640,X                  ; $D1E6  9D 40 06

loc_0E_D1E9:
    JSR sub_0E_D2F8              ; $D1E9  20 F8 D2

loc_0E_D1EC:
    LDA #$00                     ; $D1EC  A9 00
    STA $05                      ; $D1EE  85 05
    PLA                          ; $D1F0  68
    ASL A                        ; $D1F1  0A
    ROL $05                      ; $D1F2  26 05
    TAY                          ; $D1F4  A8
    LDA #$80                     ; $D1F5  A9 80
    ORA $05                      ; $D1F7  05 05
    STA $05                      ; $D1F9  85 05
    LDA #$00                     ; $D1FB  A9 00
    STA $04                      ; $D1FD  85 04
    LDA ($04),Y                  ; $D1FF  B1 04
    STA $00                      ; $D201  85 00
    INY                          ; $D203  C8
    LDA ($04),Y                  ; $D204  B1 04
    STA $01                      ; $D206  85 01

loc_0E_D208:
    LDY #$00                     ; $D208  A0 00
    STY $12                      ; $D20A  84 12
    LDA ($00),Y                  ; $D20C  B1 00
    STA $0E                      ; $D20E  85 0E
    INY                          ; $D210  C8
    LDA ($00),Y                  ; $D211  B1 00
    ASL A                        ; $D213  0A
    TAY                          ; $D214  A8
    LDA $82AA,Y                  ; $D215  B9 AA 82
    STA $02                      ; $D218  85 02
    LDA $82AB,Y                  ; $D21A  B9 AB 82
    STA $03                      ; $D21D  85 03
    LDY #$02                     ; $D21F  A0 02
    SEC                          ; $D221  38
    LDA $0480,X                  ; $D222  BD 80 04
    SBC $1A                      ; $D225  E5 1A
    STA $0F                      ; $D227  85 0F
    LDA $0420,X                  ; $D229  BD 20 04
    AND #$40                     ; $D22C  29 40
    STA $11                      ; $D22E  85 11
    JSR sub_0E_D328              ; $D230  20 28 D3
    LDX $0D                      ; $D233  A6 0D
    LDA $0C                      ; $D235  A5 0C
    BNE loc_0E_D242              ; $D237  D0 09
    LDA $55                      ; $D239  A5 55
    AND #$02                     ; $D23B  29 02
    BEQ loc_0E_D242              ; $D23D  F0 03
    JMP loc_0E_D2A3              ; $D23F  4C A3 D2


loc_0E_D242:
    LDA ($00),Y                  ; $D242  B1 00
    STA $0205,X                  ; $D244  9D 05 02
    INY                          ; $D247  C8
    LDA ($00),Y                  ; $D248  B1 00
    EOR $11                      ; $D24A  45 11
    ORA $13                      ; $D24C  05 13
    STA $0206,X                  ; $D24E  9D 06 02
    INY                          ; $D251  C8
    STY $0D                      ; $D252  84 0D
    LDY $12                      ; $D254  A4 12
    LDA ($02),Y                  ; $D256  B1 02
    TAY                          ; $D258  A8
    CLC                          ; $D259  18
    LDA $833A,Y                  ; $D25A  B9 3A 83
    BMI loc_0E_D265              ; $D25D  30 06
    ADC $10                      ; $D25F  65 10
    BCC loc_0E_D273              ; $D261  90 10
    BCS loc_0E_D269              ; $D263  B0 04

loc_0E_D265:
    ADC $10                      ; $D265  65 10
    BCS loc_0E_D273              ; $D267  B0 0A

loc_0E_D269:
    LDA #$F8                     ; $D269  A9 F8
    STA $0204,X                  ; $D26B  9D 04 02
    LDY $0D                      ; $D26E  A4 0D
    JMP loc_0E_D29D              ; $D270  4C 9D D2


loc_0E_D273:
    STA $0204,X                  ; $D273  9D 04 02
    LDA $11                      ; $D276  A5 11
    BEQ loc_0E_D280              ; $D278  F0 06
    LDA $853A,Y                  ; $D27A  B9 3A 85
    JMP loc_0E_D283              ; $D27D  4C 83 D2


loc_0E_D280:
    LDA $843A,Y                  ; $D280  B9 3A 84

loc_0E_D283:
    CLC                          ; $D283  18
    BMI loc_0E_D28C              ; $D284  30 06
    ADC $0F                      ; $D286  65 0F
    BCC loc_0E_D290              ; $D288  90 06
    BCS loc_0E_D269              ; $D28A  B0 DD

loc_0E_D28C:
    ADC $0F                      ; $D28C  65 0F
    BCC loc_0E_D269              ; $D28E  90 D9

loc_0E_D290:
    STA $0207,X                  ; $D290  9D 07 02
    LDY $0D                      ; $D293  A4 0D
    INX                          ; $D295  E8
    INX                          ; $D296  E8
    INX                          ; $D297  E8
    INX                          ; $D298  E8
    CPX #$FC                     ; $D299  E0 FC
    BEQ loc_0E_D2A6              ; $D29B  F0 09

loc_0E_D29D:
    INC $12                      ; $D29D  E6 12
    DEC $0E                      ; $D29F  C6 0E
    BNE loc_0E_D242              ; $D2A1  D0 9F

loc_0E_D2A3:
    STX $0D                      ; $D2A3  86 0D
    RTS                          ; $D2A5  60


loc_0E_D2A6:
    PLA                          ; $D2A6  68
    PLA                          ; $D2A7  68
    JMP loc_0E_C3B3              ; $D2A8  4C B3 C3


loc_0E_D2AB:
    LDA $0420,X                  ; $D2AB  BD 20 04
    AND #$20                     ; $D2AE  29 20
    BEQ loc_0E_D2B3              ; $D2B0  F0 01
    RTS                          ; $D2B2  60


loc_0E_D2B3:
    LDA $06E0,X                  ; $D2B3  BD E0 06
    ASL A                        ; $D2B6  0A
    TAY                          ; $D2B7  A8
    LDA $8770,Y                  ; $D2B8  B9 70 87
    STA $00                      ; $D2BB  85 00
    LDA $8771,Y                  ; $D2BD  B9 71 87
    STA $01                      ; $D2C0  85 01
    LDA $0440,X                  ; $D2C2  BD 40 04
    LSR A                        ; $D2C5  4A
    LSR A                        ; $D2C6  4A
    LSR A                        ; $D2C7  4A
    LSR A                        ; $D2C8  4A
    TAY                          ; $D2C9  A8
    INY                          ; $D2CA  C8
    LDA ($00),Y                  ; $D2CB  B1 00
    PHA                          ; $D2CD  48
    LDA $06A0,X                  ; $D2CE  BD A0 06
    BEQ loc_0E_D2D6              ; $D2D1  F0 03
    JMP loc_0E_D2D9              ; $D2D3  4C D9 D2


loc_0E_D2D6:
    JSR sub_0E_D2F8              ; $D2D6  20 F8 D2

loc_0E_D2D9:
    PLA                          ; $D2D9  68
    ASL A                        ; $D2DA  0A
    TAY                          ; $D2DB  A8
    BCS loc_0E_D2EB              ; $D2DC  B0 0D
    LDA $8650,Y                  ; $D2DE  B9 50 86
    STA $00                      ; $D2E1  85 00
    LDA $8651,Y                  ; $D2E3  B9 51 86
    STA $01                      ; $D2E6  85 01
    JMP loc_0E_D208              ; $D2E8  4C 08 D2


loc_0E_D2EB:
    LDA $8750,Y                  ; $D2EB  B9 50 87
    STA $00                      ; $D2EE  85 00
    LDA $8751,Y                  ; $D2F0  B9 51 87
    STA $01                      ; $D2F3  85 01
    JMP loc_0E_D208              ; $D2F5  4C 08 D2


sub_0E_D2F8:
    LDY #$00                     ; $D2F8  A0 00
    LDA ($00),Y                  ; $D2FA  B1 00
    PHA                          ; $D2FC  48
    AND #$0F                     ; $D2FD  29 0F
    STA $0F                      ; $D2FF  85 0F
    PLA                          ; $D301  68
    AND #$F0                     ; $D302  29 F0
    STA $11                      ; $D304  85 11
    LDA $0440,X                  ; $D306  BD 40 04
    AND #$0F                     ; $D309  29 0F
    CMP $0F                      ; $D30B  C5 0F
    BCS loc_0E_D314              ; $D30D  B0 05
    INC $0440,X                  ; $D30F  FE 40 04
    BNE loc_0E_D327              ; $D312  D0 13

loc_0E_D314:
    LDA $0440,X                  ; $D314  BD 40 04
    AND #$F0                     ; $D317  29 F0
    CMP $11                      ; $D319  C5 11
    BCS loc_0E_D322              ; $D31B  B0 05
    CLC                          ; $D31D  18
    ADC #$10                     ; $D31E  69 10
    BNE loc_0E_D324              ; $D320  D0 02

loc_0E_D322:
    LDA #$00                     ; $D322  A9 00

loc_0E_D324:
    STA $0440,X                  ; $D324  9D 40 04

loc_0E_D327:
    RTS                          ; $D327  60


sub_0E_D328:
    LDA $31                      ; $D328  A5 31
    CMP #$03                     ; $D32A  C9 03
    BEQ loc_0E_D337              ; $D32C  F0 09
    CMP #$07                     ; $D32E  C9 07
    BEQ loc_0E_D34F              ; $D330  F0 1D

loc_0E_D332:
    LDA #$00                     ; $D332  A9 00
    STA $13                      ; $D334  85 13
    RTS                          ; $D336  60


loc_0E_D337:
    LDA $0460,X                  ; $D337  BD 60 04
    CMP #$08                     ; $D33A  C9 08
    BCC loc_0E_D332              ; $D33C  90 F4
    CMP #$0A                     ; $D33E  C9 0A
    BCS loc_0E_D332              ; $D340  B0 F0
    LDA $0600,X                  ; $D342  BD 00 06
    CMP #$69                     ; $D345  C9 69
    BCS loc_0E_D332              ; $D347  B0 E9
    CMP #$4C                     ; $D349  C9 4C
    BCC loc_0E_D332              ; $D34B  90 E5
    BCS loc_0E_D369              ; $D34D  B0 1A

loc_0E_D34F:
    LDA $0460,X                  ; $D34F  BD 60 04
    CMP #$1B                     ; $D352  C9 1B
    BEQ loc_0E_D362              ; $D354  F0 0C
    CMP #$1C                     ; $D356  C9 1C
    BEQ loc_0E_D362              ; $D358  F0 08
    CMP #$1F                     ; $D35A  C9 1F
    BEQ loc_0E_D362              ; $D35C  F0 04
    CMP #$20                     ; $D35E  C9 20
    BNE loc_0E_D332              ; $D360  D0 D0

loc_0E_D362:
    LDA $0600,X                  ; $D362  BD 00 06
    CMP #$B9                     ; $D365  C9 B9
    BCC loc_0E_D332              ; $D367  90 C9

loc_0E_D369:
    LDA #$20                     ; $D369  A9 20
    STA $13                      ; $D36B  85 13
    RTS                          ; $D36D  60


sub_0E_D36E:
    LDY $0D                      ; $D36E  A4 0D
    LDA $BB                      ; $D370  A5 BB
    BMI loc_0E_D3E9              ; $D372  30 75
    LDA #$68                     ; $D374  A9 68
    STA $0C                      ; $D376  85 0C
    LDX #$06                     ; $D378  A2 06
    LDA #$01                     ; $D37A  A9 01
    STA $12                      ; $D37C  85 12

loc_0E_D37E:
    LDA #$10                     ; $D37E  A9 10
    STA $0E                      ; $D380  85 0E
    LDA $72,X                    ; $D382  B5 72
    ORA #$F0                     ; $D384  09 F0
    STA $0F                      ; $D386  85 0F
    JSR sub_0E_D41A              ; $D388  20 1A D4
    CLC                          ; $D38B  18
    LDA $0C                      ; $D38C  A5 0C
    ADC #$08                     ; $D38E  69 08
    STA $0C                      ; $D390  85 0C
    DEX                          ; $D392  CA
    BPL loc_0E_D37E              ; $D393  10 E9
    LDA $BB                      ; $D395  A5 BB
    BNE loc_0E_D3E9              ; $D397  D0 50
    LDA #$FE                     ; $D399  A9 FE
    STA $05                      ; $D39B  85 05
    LDA #$FA                     ; $D39D  A9 FA
    STA $04                      ; $D39F  85 04
    LDA #$01                     ; $D3A1  A9 01
    STA $12                      ; $D3A3  85 12
    LDA #$18                     ; $D3A5  A9 18
    STA $0C                      ; $D3A7  85 0C
    LDA #$48                     ; $D3A9  A9 48
    STA $0E                      ; $D3AB  85 0E
    LDA $6A                      ; $D3AD  A5 6A
    JSR sub_0E_D3EC              ; $D3AF  20 EC D3
    LDA #$00                     ; $D3B2  A9 00
    STA $12                      ; $D3B4  85 12
    LDA #$10                     ; $D3B6  A9 10
    STA $0C                      ; $D3B8  85 0C
    LDX $5F                      ; $D3BA  A6 5F
    BEQ loc_0E_D3C2              ; $D3BC  F0 04
    LDA #$48                     ; $D3BE  A9 48
    BNE loc_0E_D3C4              ; $D3C0  D0 02

loc_0E_D3C2:
    LDA #$F8                     ; $D3C2  A9 F8

loc_0E_D3C4:
    STA $0E                      ; $D3C4  85 0E
    LDA #$DF                     ; $D3C6  A9 DF
    STA $05                      ; $D3C8  85 05
    LDA #$DB                     ; $D3CA  A9 DB
    STA $04                      ; $D3CC  85 04
    LDA $6A,X                    ; $D3CE  B5 6A
    JSR sub_0E_D3EC              ; $D3D0  20 EC D3
    LDA $3E                      ; $D3D3  A5 3E
    BEQ loc_0E_D3E9              ; $D3D5  F0 12
    LDA #$02                     ; $D3D7  A9 02
    STA $12                      ; $D3D9  85 12
    LDA #$28                     ; $D3DB  A9 28
    STA $0C                      ; $D3DD  85 0C
    LDA #$48                     ; $D3DF  A9 48
    STA $0E                      ; $D3E1  85 0E
    LDA $06C1                    ; $D3E3  AD C1 06
    JSR sub_0E_D3EC              ; $D3E6  20 EC D3

loc_0E_D3E9:
    STY $0D                      ; $D3E9  84 0D
    RTS                          ; $D3EB  60


sub_0E_D3EC:
    PHA                          ; $D3EC  48
    LSR A                        ; $D3ED  4A
    LSR A                        ; $D3EE  4A
    STA $10                      ; $D3EF  85 10
    PLA                          ; $D3F1  68
    AND #$03                     ; $D3F2  29 03
    STA $11                      ; $D3F4  85 11
    SEC                          ; $D3F6  38
    LDA $05                      ; $D3F7  A5 05
    SBC $11                      ; $D3F9  E5 11
    STA $11                      ; $D3FB  85 11
    LDX #$00                     ; $D3FD  A2 00

loc_0E_D3FF:
    CPX $10                      ; $D3FF  E4 10
    BCS loc_0E_D407              ; $D401  B0 04
    LDA $04                      ; $D403  A5 04
    BNE loc_0E_D40F              ; $D405  D0 08

loc_0E_D407:
    BNE loc_0E_D40D              ; $D407  D0 04
    LDA $11                      ; $D409  A5 11
    BNE loc_0E_D40F              ; $D40B  D0 02

loc_0E_D40D:
    LDA $05                      ; $D40D  A5 05

loc_0E_D40F:
    STA $0F                      ; $D40F  85 0F
    JSR sub_0E_D41A              ; $D411  20 1A D4
    INX                          ; $D414  E8
    CPX #$07                     ; $D415  E0 07
    BNE loc_0E_D3FF              ; $D417  D0 E6
    RTS                          ; $D419  60


sub_0E_D41A:
    LDA $0C                      ; $D41A  A5 0C
    STA $0207,Y                  ; $D41C  99 07 02
    LDA $0F                      ; $D41F  A5 0F
    STA $0205,Y                  ; $D421  99 05 02
    LDA $12                      ; $D424  A5 12
    STA $0206,Y                  ; $D426  99 06 02
    LDA $0E                      ; $D429  A5 0E
    STA $0204,Y                  ; $D42B  99 04 02
    CPY #$F8                     ; $D42E  C0 F8
    BEQ loc_0E_D43F              ; $D430  F0 0D
    INY                          ; $D432  C8
    INY                          ; $D433  C8
    INY                          ; $D434  C8
    INY                          ; $D435  C8
    CMP #$F8                     ; $D436  C9 F8
    BEQ loc_0E_D43F              ; $D438  F0 05
    SEC                          ; $D43A  38
    SBC #$08                     ; $D43B  E9 08
    STA $0E                      ; $D43D  85 0E

loc_0E_D43F:
    RTS                          ; $D43F  60


sub_0E_D440:
    LDA $05                      ; $D440  A5 05
    AND #$0F                     ; $D442  29 0F
    STA $4A                      ; $D444  85 4A
    LDA $05                      ; $D446  A5 05
    LSR A                        ; $D448  4A
    LSR A                        ; $D449  4A
    LSR A                        ; $D44A  4A
    LSR A                        ; $D44B  4A
    STA $4B                      ; $D44C  85 4B
    LDX #$00                     ; $D44E  A2 00
    STX $4C                      ; $D450  86 4C
    STX $4D                      ; $D452  86 4D
    STX $4E                      ; $D454  86 4E
    LDY #$05                     ; $D456  A0 05
    CLC                          ; $D458  18

loc_0E_D459:
    LDA $74,X                    ; $D459  B5 74
    ADC $4A,X                    ; $D45B  75 4A
    CMP #$0A                     ; $D45D  C9 0A
    BCC loc_0E_D463              ; $D45F  90 02
    SBC #$0A                     ; $D461  E9 0A

loc_0E_D463:
    STA $74,X                    ; $D463  95 74
    INX                          ; $D465  E8
    DEY                          ; $D466  88
    BNE loc_0E_D459              ; $D467  D0 F0
    RTS                          ; $D469  60


sub_0E_D46A:
    LDX #$1F                     ; $D46A  A2 1F

loc_0E_D46C:
    LDA $06A0,X                  ; $D46C  BD A0 06
    BEQ loc_0E_D474              ; $D46F  F0 03
    DEC $06A0,X                  ; $D471  DE A0 06

loc_0E_D474:
    DEX                          ; $D474  CA
    BPL loc_0E_D46C              ; $D475  10 F5
    RTS                          ; $D477  60


sub_0E_D478:
    LDA #$F8                     ; $D478  A9 F8

loc_0E_D47A:
    STA $0200,Y                  ; $D47A  99 00 02
    INY                          ; $D47D  C8
    INY                          ; $D47E  C8
    INY                          ; $D47F  C8
    INY                          ; $D480  C8
    DEX                          ; $D481  CA
    BNE loc_0E_D47A              ; $D482  D0 F6
    RTS                          ; $D484  60

    .byte $2C,$11,$30,$00,$30,$12,$30,$19,$28,$16,$38,$00,$30,$17,$2C,$11  ; $D485

sub_0E_D495:
    LDA $FF                      ; $D495  A5 FF
    AND #$7F                     ; $D497  29 7F
    STA $FF                      ; $D499  85 FF
    STA $2000                    ; $D49B  8D 00 20
    LDA $FE                      ; $D49E  A5 FE
    AND #$E7                     ; $D4A0  29 E7
    STA $FE                      ; $D4A2  85 FE
    STA $2001                    ; $D4A4  8D 01 20
    RTS                          ; $D4A7  60


nmi_vector:
    PHA                          ; $D4A8  48
    TXA                          ; $D4A9  8A
    PHA                          ; $D4AA  48
    TYA                          ; $D4AB  98
    PHA                          ; $D4AC  48
    LDA $1F                      ; $D4AD  A5 1F
    BEQ loc_0E_D4B4              ; $D4AF  F0 03
    JMP loc_0E_D54C              ; $D4B1  4C 4C D5


loc_0E_D4B4:
    JSR sub_0E_D495              ; $D4B4  20 95 D4
    LDA $2002                    ; $D4B7  AD 02 20
    LDA #$00                     ; $D4BA  A9 00
    STA $2003                    ; $D4BC  8D 03 20
    LDA #$02                     ; $D4BF  A9 02
    STA $4014                    ; $D4C1  8D 14 40
    JSR sub_0E_D673              ; $D4C4  20 73 D6
    LDA $37                      ; $D4C7  A5 37
    BEQ loc_0E_D4CE              ; $D4C9  F0 03
    JSR sub_0E_D60A              ; $D4CB  20 0A D6

loc_0E_D4CE:
    LDA $5E                      ; $D4CE  A5 5E
    BEQ loc_0E_D4D5              ; $D4D0  F0 03
    JSR sub_0E_D5AB              ; $D4D2  20 AB D5

loc_0E_D4D5:
    LDA $1B                      ; $D4D5  A5 1B
    PHA                          ; $D4D7  48
    LDA $1A                      ; $D4D8  A5 1A
    PHA                          ; $D4DA  48
    LDA $B4                      ; $D4DB  A5 B4
    BEQ loc_0E_D4E7              ; $D4DD  F0 08
    LDA $B3                      ; $D4DF  A5 B3
    STA $1B                      ; $D4E1  85 1B
    LDA $B2                      ; $D4E3  A5 B2
    STA $1A                      ; $D4E5  85 1A

loc_0E_D4E7:
    LDA $FF                      ; $D4E7  A5 FF
    AND #$FC                     ; $D4E9  29 FC
    STA $FF                      ; $D4EB  85 FF
    LDA $1B                      ; $D4ED  A5 1B
    AND #$01                     ; $D4EF  29 01
    ORA $FF                      ; $D4F1  05 FF
    STA $2000                    ; $D4F3  8D 00 20
    PHA                          ; $D4F6  48
    LDA $2002                    ; $D4F7  AD 02 20
    LDX #$04                     ; $D4FA  A2 04
    LDA $47                      ; $D4FC  A5 47
    BEQ loc_0E_D51D              ; $D4FE  F0 1D
    DEC $47                      ; $D500  C6 47
    LSR A                        ; $D502  4A
    BCC loc_0E_D508              ; $D503  90 03
    AND #$03                     ; $D505  29 03
    TAX                          ; $D507  AA

loc_0E_D508:
    LDA $0400                    ; $D508  AD 00 04
    CMP #$09                     ; $D50B  C9 09
    BEQ loc_0E_D51D              ; $D50D  F0 0E
    CMP #$6F                     ; $D50F  C9 6F
    BEQ loc_0E_D51D              ; $D511  F0 0A
    LDA $0420                    ; $D513  AD 20 04
    AND #$F0                     ; $D516  29 F0
    ORA #$02                     ; $D518  09 02
    STA $0420                    ; $D51A  8D 20 04

loc_0E_D51D:
    CLC                          ; $D51D  18
    LDA $1A                      ; $D51E  A5 1A
    ADC $D583,X                  ; $D520  7D 83 D5
    STA $2005                    ; $D523  8D 05 20
    CLC                          ; $D526  18
    LDA $1E                      ; $D527  A5 1E
    ADC $D588,X                  ; $D529  7D 88 D5
    STA $2005                    ; $D52C  8D 05 20
    LDA $FE                      ; $D52F  A5 FE
    ORA #$1E                     ; $D531  09 1E
    STA $FE                      ; $D533  85 FE
    STA $2001                    ; $D535  8D 01 20
    PLA                          ; $D538  68
    ORA #$80                     ; $D539  09 80
    STA $FF                      ; $D53B  85 FF
    STA $2000                    ; $D53D  8D 00 20
    PLA                          ; $D540  68
    STA $1A                      ; $D541  85 1A
    PLA                          ; $D543  68
    STA $1B                      ; $D544  85 1B
    LDA #$01                     ; $D546  A9 01
    STA $1F                      ; $D548  85 1F
    INC $23                      ; $D54A  E6 23

loc_0E_D54C:
    LDA #$04                     ; $D54C  A9 04
    STA $C004                    ; $D54E  8D 04 C0
    JSR $9000                    ; $D551  20 00 90

loc_0E_D554:
    LDX $45                      ; $D554  A6 45
    BEQ loc_0E_D56E              ; $D556  F0 16
    LDA $057F,X                  ; $D558  BD 7F 05
    CMP #$FD                     ; $D55B  C9 FD
    BCS loc_0E_D563              ; $D55D  B0 04
    CMP #$33                     ; $D55F  C9 33
    BCS loc_0E_D56A              ; $D561  B0 07

loc_0E_D563:
    BNE loc_0E_D567              ; $D563  D0 02
    LDY $A7                      ; $D565  A4 A7

loc_0E_D567:
    JSR $9003                    ; $D567  20 03 90

loc_0E_D56A:
    DEC $45                      ; $D56A  C6 45
    BNE loc_0E_D554              ; $D56C  D0 E6

loc_0E_D56E:
    LDA $42                      ; $D56E  A5 42
    TAX                          ; $D570  AA
    STA $C000,X                  ; $D571  9D 00 C0
    LDA $0D                      ; $D574  A5 0D
    EOR $46                      ; $D576  45 46
    ADC $23                      ; $D578  65 23
    LSR A                        ; $D57A  4A
    STA $46                      ; $D57B  85 46
    PLA                          ; $D57D  68
    TAY                          ; $D57E  A8
    PLA                          ; $D57F  68
    TAX                          ; $D580  AA
    PLA                          ; $D581  68
    RTI                          ; $D582  40

    .byte $00,$08,$00,$F8,$00,$E8,$00,$08,$00,$00  ; $D583

sub_0E_D58D:
    LDX #$01                     ; $D58D  A2 01
    STX $4016                    ; $D58F  8E 16 40
    DEX                          ; $D592  CA
    STX $4016                    ; $D593  8E 16 40
    INX                          ; $D596  E8

loc_0E_D597:
    LDY #$08                     ; $D597  A0 08

loc_0E_D599:
    LDA $4016,X                  ; $D599  BD 16 40
    STA $18                      ; $D59C  85 18
    LSR A                        ; $D59E  4A
    ORA $18                      ; $D59F  05 18
    LSR A                        ; $D5A1  4A
    ROR $14,X                    ; $D5A2  76 14
    DEY                          ; $D5A4  88
    BNE loc_0E_D599              ; $D5A5  D0 F2
    DEX                          ; $D5A7  CA
    BPL loc_0E_D597              ; $D5A8  10 ED
    RTS                          ; $D5AA  60


sub_0E_D5AB:
    CMP #$FF                     ; $D5AB  C9 FF
    BEQ loc_0E_D5C9              ; $D5AD  F0 1A

sub_0E_D5AF:
    LDA $0380                    ; $D5AF  AD 80 03
    STA $2006                    ; $D5B2  8D 06 20
    LDA $0381                    ; $D5B5  AD 81 03
    STA $2006                    ; $D5B8  8D 06 20
    LDX #$00                     ; $D5BB  A2 00

loc_0E_D5BD:
    LDA $0382,X                  ; $D5BD  BD 82 03
    STA $2007                    ; $D5C0  8D 07 20
    INX                          ; $D5C3  E8
    DEC $5E                      ; $D5C4  C6 5E
    BNE loc_0E_D5BD              ; $D5C6  D0 F5
    RTS                          ; $D5C8  60


loc_0E_D5C9:
    LDX #$00                     ; $D5C9  A2 00
    LDY #$00                     ; $D5CB  A0 00

loc_0E_D5CD:
    LDA $0380,X                  ; $D5CD  BD 80 03
    STA $2006                    ; $D5D0  8D 06 20
    LDA $0381,X                  ; $D5D3  BD 81 03
    STA $2006                    ; $D5D6  8D 06 20
    LDA $0394,Y                  ; $D5D9  B9 94 03
    STA $2007                    ; $D5DC  8D 07 20
    LDA $0395,Y                  ; $D5DF  B9 95 03
    STA $2007                    ; $D5E2  8D 07 20
    INY                          ; $D5E5  C8
    INY                          ; $D5E6  C8
    TYA                          ; $D5E7  98
    AND #$03                     ; $D5E8  29 03
    BEQ loc_0E_D5FF              ; $D5EA  F0 13
    CLC                          ; $D5EC  18
    LDA $0381,X                  ; $D5ED  BD 81 03
    ADC #$20                     ; $D5F0  69 20
    STA $0381,X                  ; $D5F2  9D 81 03
    LDA $0380,X                  ; $D5F5  BD 80 03
    ADC #$00                     ; $D5F8  69 00
    STA $0380,X                  ; $D5FA  9D 80 03
    BNE loc_0E_D5CD              ; $D5FD  D0 CE

loc_0E_D5FF:
    INX                          ; $D5FF  E8
    INX                          ; $D600  E8
    DEC $AA                      ; $D601  C6 AA
    BNE loc_0E_D5CD              ; $D603  D0 C8
    LDA #$00                     ; $D605  A9 00
    STA $5E                      ; $D607  85 5E
    RTS                          ; $D609  60


sub_0E_D60A:
    LDA $37                      ; $D60A  A5 37
    AND #$07                     ; $D60C  29 07
    BNE loc_0E_D62B              ; $D60E  D0 1B
    LDX $3A                      ; $D610  A6 3A
    LDY $3B                      ; $D612  A4 3B
    LDA $37                      ; $D614  A5 37
    AND #$08                     ; $D616  29 08
    BEQ loc_0E_D61E              ; $D618  F0 04
    LDX $38                      ; $D61A  A6 38
    LDY $39                      ; $D61C  A4 39

loc_0E_D61E:
    STX $35                      ; $D61E  86 35
    STY $36                      ; $D620  84 36
    LDA $34                      ; $D622  A5 34
    PHA                          ; $D624  48
    JSR sub_0E_D647              ; $D625  20 47 D6
    PLA                          ; $D628  68
    STA $34                      ; $D629  85 34

loc_0E_D62B:
    DEC $37                      ; $D62B  C6 37
    BNE loc_0E_D646              ; $D62D  D0 17
    LDA $3A                      ; $D62F  A5 3A
    STA $35                      ; $D631  85 35
    LDA $3B                      ; $D633  A5 3B
    STA $36                      ; $D635  85 36
    LDA $34                      ; $D637  A5 34
    JSR sub_0E_D647              ; $D639  20 47 D6
    LDA $3E                      ; $D63C  A5 3E
    BEQ loc_0E_D646              ; $D63E  F0 06
    CMP #$05                     ; $D640  C9 05
    BCS loc_0E_D646              ; $D642  B0 02
    INC $3E                      ; $D644  E6 3E

loc_0E_D646:
    RTS                          ; $D646  60


sub_0E_D647:
    PHA                          ; $D647  48
    AND #$F0                     ; $D648  29 F0
    TAX                          ; $D64A  AA
    LDA #$3F                     ; $D64B  A9 3F
    STA $2006                    ; $D64D  8D 06 20
    PLA                          ; $D650  68
    ASL A                        ; $D651  0A
    AND #$10                     ; $D652  29 10
    STA $2006                    ; $D654  8D 06 20
    LDY #$00                     ; $D657  A0 00

loc_0E_D659:
    LDA ($35),Y                  ; $D659  B1 35
    STA $2007                    ; $D65B  8D 07 20
    INY                          ; $D65E  C8
    DEX                          ; $D65F  CA
    BNE loc_0E_D659              ; $D660  D0 F7
    LDA #$3F                     ; $D662  A9 3F
    STA $2006                    ; $D664  8D 06 20
    STX $2006                    ; $D667  8E 06 20
    STX $2006                    ; $D66A  8E 06 20
    STX $2006                    ; $D66D  8E 06 20
    STX $34                      ; $D670  86 34
    RTS                          ; $D672  60


sub_0E_D673:
    LDA $1C                      ; $D673  A5 1C
    BNE loc_0E_D67A              ; $D675  D0 03
    JMP loc_0E_D6FD              ; $D677  4C FD D6


loc_0E_D67A:
    AND #$C0                     ; $D67A  29 C0
    BEQ loc_0E_D681              ; $D67C  F0 03
    JMP loc_0E_D707              ; $D67E  4C 07 D7


loc_0E_D681:
    LDA $FF                      ; $D681  A5 FF
    ORA #$04                     ; $D683  09 04
    STA $FF                      ; $D685  85 FF
    STA $2000                    ; $D687  8D 00 20
    LDA #$02                     ; $D68A  A9 02
    STA $0E                      ; $D68C  85 0E
    LDA #$03                     ; $D68E  A9 03
    STA $0F                      ; $D690  85 0F
    LDA #$00                     ; $D692  A9 00

loc_0E_D694:
    STA $0C                      ; $D694  85 0C
    TAX                          ; $D696  AA
    LDY #$00                     ; $D697  A0 00
    LDA #$03                     ; $D699  A9 03
    STA $0D                      ; $D69B  85 0D
    LDA $0301,X                  ; $D69D  BD 01 03
    AND #$80                     ; $D6A0  29 80
    ORA $0300,X                  ; $D6A2  1D 00 03
    AND #$83                     ; $D6A5  29 83
    CMP #$83                     ; $D6A7  C9 83
    BNE loc_0E_D6AF              ; $D6A9  D0 04
    LDA #$01                     ; $D6AB  A9 01
    STA $0D                      ; $D6AD  85 0D

loc_0E_D6AF:
    LDA $0300,X                  ; $D6AF  BD 00 03
    STA $2006                    ; $D6B2  8D 06 20
    LDA $0301,X                  ; $D6B5  BD 01 03
    STA $2006                    ; $D6B8  8D 06 20

loc_0E_D6BB:
    LDA ($0E),Y                  ; $D6BB  B1 0E
    STA $2007                    ; $D6BD  8D 07 20
    INY                          ; $D6C0  C8
    TYA                          ; $D6C1  98
    AND $0D                      ; $D6C2  25 0D
    BNE loc_0E_D6BB              ; $D6C4  D0 F5
    LDA $0D                      ; $D6C6  A5 0D
    CMP #$03                     ; $D6C8  C9 03
    BEQ loc_0E_D6CE              ; $D6CA  F0 02
    INY                          ; $D6CC  C8
    INY                          ; $D6CD  C8

loc_0E_D6CE:
    TYA                          ; $D6CE  98
    AND #$0F                     ; $D6CF  29 0F
    BEQ loc_0E_D6D9              ; $D6D1  F0 06
    INC $0301,X                  ; $D6D3  FE 01 03
    JMP loc_0E_D6AF              ; $D6D6  4C AF D6


loc_0E_D6D9:
    LDA $0312,X                  ; $D6D9  BD 12 03
    STA $2006                    ; $D6DC  8D 06 20
    LDA $0313,X                  ; $D6DF  BD 13 03
    STA $2006                    ; $D6E2  8D 06 20
    LDA $0314,X                  ; $D6E5  BD 14 03
    STA $2007                    ; $D6E8  8D 07 20
    DEC $1C                      ; $D6EB  C6 1C
    BEQ loc_0E_D6FD              ; $D6ED  F0 0E
    CLC                          ; $D6EF  18
    LDA $0E                      ; $D6F0  A5 0E
    ADC #$15                     ; $D6F2  69 15
    STA $0E                      ; $D6F4  85 0E
    CLC                          ; $D6F6  18
    LDA $0C                      ; $D6F7  A5 0C
    ADC #$15                     ; $D6F9  69 15
    BNE loc_0E_D694              ; $D6FB  D0 97

loc_0E_D6FD:
    LDA $FF                      ; $D6FD  A5 FF
    AND #$FB                     ; $D6FF  29 FB
    STA $FF                      ; $D701  85 FF
    STA $2000                    ; $D703  8D 00 20
    RTS                          ; $D706  60


loc_0E_D707:
    LDA $1C                      ; $D707  A5 1C
    CMP #$40                     ; $D709  C9 40
    BEQ loc_0E_D710              ; $D70B  F0 03
    JMP loc_0E_D750              ; $D70D  4C 50 D7


loc_0E_D710:
    LDX #$00                     ; $D710  A2 00
    STX $1C                      ; $D712  86 1C

loc_0E_D714:
    LDA $0300                    ; $D714  AD 00 03
    STA $2006                    ; $D717  8D 06 20
    LDA $0301                    ; $D71A  AD 01 03
    STA $2006                    ; $D71D  8D 06 20

loc_0E_D720:
    LDA $0302,X                  ; $D720  BD 02 03
    STA $2007                    ; $D723  8D 07 20
    INX                          ; $D726  E8
    TXA                          ; $D727  8A
    AND #$07                     ; $D728  29 07
    BNE loc_0E_D720              ; $D72A  D0 F4
    CLC                          ; $D72C  18
    LDA $0301                    ; $D72D  AD 01 03
    ADC #$20                     ; $D730  69 20
    STA $0301                    ; $D732  8D 01 03
    LDY $1C                      ; $D735  A4 1C
    LDA $0315,Y                  ; $D737  B9 15 03
    STA $0315                    ; $D73A  8D 15 03
    LDY #$00                     ; $D73D  A0 00
    JSR sub_0E_D766              ; $D73F  20 66 D7
    INC $1C                      ; $D742  E6 1C
    INC $0313                    ; $D744  EE 13 03
    CPX #$10                     ; $D747  E0 10
    BNE loc_0E_D714              ; $D749  D0 C9
    LDA #$00                     ; $D74B  A9 00
    STA $1C                      ; $D74D  85 1C
    RTS                          ; $D74F  60


loc_0E_D750:
    LDA $1C                      ; $D750  A5 1C
    AND #$0F                     ; $D752  29 0F
    TAX                          ; $D754  AA
    LDY #$00                     ; $D755  A0 00

loc_0E_D757:
    JSR sub_0E_D766              ; $D757  20 66 D7
    INY                          ; $D75A  C8
    INY                          ; $D75B  C8
    INY                          ; $D75C  C8
    INY                          ; $D75D  C8
    DEX                          ; $D75E  CA
    BNE loc_0E_D757              ; $D75F  D0 F6
    LDA #$00                     ; $D761  A9 00
    STA $1C                      ; $D763  85 1C
    RTS                          ; $D765  60


sub_0E_D766:
    LDA $0312,Y                  ; $D766  B9 12 03
    STA $2006                    ; $D769  8D 06 20
    LDA $0313,Y                  ; $D76C  B9 13 03
    STA $2006                    ; $D76F  8D 06 20
    LDA $2007                    ; $D772  AD 07 20
    LDA $2007                    ; $D775  AD 07 20
    AND $0314,Y                  ; $D778  39 14 03
    ORA $0315,Y                  ; $D77B  19 15 03
    PHA                          ; $D77E  48
    LDA $0312,Y                  ; $D77F  B9 12 03
    STA $2006                    ; $D782  8D 06 20
    LDA $0313,Y                  ; $D785  B9 13 03
    STA $2006                    ; $D788  8D 06 20
    PLA                          ; $D78B  68
    STA $2007                    ; $D78C  8D 07 20
    RTS                          ; $D78F  60


sub_0E_D790:
    LDX #$02                     ; $D790  A2 02
    LDY #$00                     ; $D792  A0 00
    LDA $0420                    ; $D794  AD 20 04
    AND #$DF                     ; $D797  29 DF
    STA $0420                    ; $D799  8D 20 04

loc_0E_D79C:
    LDA $2A,X                    ; $D79C  B5 2A
    BPL loc_0E_D7B2              ; $D79E  10 12
    AND #$7F                     ; $D7A0  29 7F
    CMP #$03                     ; $D7A2  C9 03
    BNE loc_0E_D7AC              ; $D7A4  D0 06
    LDA #$02                     ; $D7A6  A9 02
    STA $26                      ; $D7A8  85 26
    BNE loc_0E_D7BA              ; $D7AA  D0 0E

loc_0E_D7AC:
    CMP #$04                     ; $D7AC  C9 04
    BEQ loc_0E_D7D6              ; $D7AE  F0 26
    BNE loc_0E_D7BA              ; $D7B0  D0 08

loc_0E_D7B2:
    CMP #$01                     ; $D7B2  C9 01
    BEQ loc_0E_D7BA              ; $D7B4  F0 04
    CMP #$04                     ; $D7B6  C9 04
    BNE loc_0E_D7BE              ; $D7B8  D0 04

loc_0E_D7BA:
    LDY #$01                     ; $D7BA  A0 01
    BNE loc_0E_D7D9              ; $D7BC  D0 1B

loc_0E_D7BE:
    CMP #$03                     ; $D7BE  C9 03
    BEQ loc_0E_D7DE              ; $D7C0  F0 1C
    CMP #$02                     ; $D7C2  C9 02
    BNE loc_0E_D7D0              ; $D7C4  D0 0A
    LDA $30                      ; $D7C6  A5 30
    ORA $D7DB,X                  ; $D7C8  1D DB D7
    STA $30                      ; $D7CB  85 30
    JMP loc_0E_D7D6              ; $D7CD  4C D6 D7


loc_0E_D7D0:
    CMP #$05                     ; $D7D0  C9 05
    BNE loc_0E_D7D6              ; $D7D2  D0 02
    STA $94                      ; $D7D4  85 94

loc_0E_D7D6:
    DEX                          ; $D7D6  CA
    BPL loc_0E_D79C              ; $D7D7  10 C3

loc_0E_D7D9:
    TYA                          ; $D7D9  98
    RTS                          ; $D7DA  60

    .byte $08,$04,$02  ; $D7DB

loc_0E_D7DE:
    JMP loc_0E_C219              ; $D7DE  4C 19 C2


sub_0E_D7E1:
    LDX #$02                     ; $D7E1  A2 02
    LDA #$00                     ; $D7E3  A9 00
    STA $96                      ; $D7E5  85 96

loc_0E_D7E7:
    LDY $2A,X                    ; $D7E7  B4 2A
    BPL loc_0E_D7F1              ; $D7E9  10 06
    CPY #$84                     ; $D7EB  C0 84
    BNE loc_0E_D7FF              ; $D7ED  D0 10
    BEQ loc_0E_D801              ; $D7EF  F0 10

loc_0E_D7F1:
    CPY #$03                     ; $D7F1  C0 03
    BEQ loc_0E_D81B              ; $D7F3  F0 26
    CPY #$01                     ; $D7F5  C0 01
    BEQ loc_0E_D7FF              ; $D7F7  F0 06
    CPY #$04                     ; $D7F9  C0 04
    BNE loc_0E_D801              ; $D7FB  D0 04
    STA $96                      ; $D7FD  85 96

loc_0E_D7FF:
    ORA #$01                     ; $D7FF  09 01

loc_0E_D801:
    DEX                          ; $D801  CA
    BPL loc_0E_D7E7              ; $D802  10 E3
    TAY                          ; $D804  A8
    LDX $2F                      ; $D805  A6 2F
    BNE loc_0E_D819              ; $D807  D0 10
    TYA                          ; $D809  98
    BNE loc_0E_D819              ; $D80A  D0 0D
    LDA $0680                    ; $D80C  AD 80 06
    BPL loc_0E_D819              ; $D80F  10 08
    LDA $30                      ; $D811  A5 30
    CMP #$01                     ; $D813  C9 01
    BNE loc_0E_D819              ; $D815  D0 02
    LDY #$01                     ; $D817  A0 01

loc_0E_D819:
    TYA                          ; $D819  98
    RTS                          ; $D81A  60


loc_0E_D81B:
    JMP loc_0E_C219              ; $D81B  4C 19 C2

    .byte $00,$02,$00,$02,$00,$02,$00,$01,$00,$01,$00,$03,$00,$03,$02,$01  ; $D81E
    .byte $02,$01,$00,$08,$00,$98,$00,$A8,$00,$A0,$00,$A4,$00,$A7,$00,$AC  ; $D82E
    .byte $00,$9C,$00,$BA,$00,$97,$00,$B8  ; $D83E

sub_0E_D846:
    LDA #$06                     ; $D846  A9 06
    STA $42                      ; $D848  85 42
    STA $C006                    ; $D84A  8D 06 C0
    LDA #$00                     ; $D84D  A9 00
    STA $2006                    ; $D84F  8D 06 20
    STA $2006                    ; $D852  8D 06 20
    LDA #$00                     ; $D855  A9 00
    STA $0C                      ; $D857  85 0C

loc_0E_D859:
    ASL A                        ; $D859  0A
    TAX                          ; $D85A  AA
    LDA $D81E,X                  ; $D85B  BD 1E D8
    TAY                          ; $D85E  A8
    STA $42                      ; $D85F  85 42
    STA $C000,Y                  ; $D861  99 00 C0
    LDA $D832,X                  ; $D864  BD 32 D8
    STA $04                      ; $D867  85 04
    LDA $D833,X                  ; $D869  BD 33 D8
    STA $05                      ; $D86C  85 05
    LDA $D81F,X                  ; $D86E  BD 1F D8
    TAX                          ; $D871  AA

loc_0E_D872:
    LDY #$00                     ; $D872  A0 00

loc_0E_D874:
    LDA ($04),Y                  ; $D874  B1 04
    STA $2007                    ; $D876  8D 07 20
    INY                          ; $D879  C8
    BNE loc_0E_D874              ; $D87A  D0 F8
    INC $05                      ; $D87C  E6 05
    DEX                          ; $D87E  CA
    BNE loc_0E_D872              ; $D87F  D0 F1
    INC $0C                      ; $D881  E6 0C
    LDA $0C                      ; $D883  A5 0C
    CMP #$0A                     ; $D885  C9 0A
    BNE loc_0E_D859              ; $D887  D0 D0
    LDA #$06                     ; $D889  A9 06
    STA $42                      ; $D88B  85 42
    STA $C006                    ; $D88D  8D 06 C0
    JSR $BFF6                    ; $D890  20 F6 BF
    JMP loc_0E_C3B3              ; $D893  4C B3 C3


sub_0E_D896:
    LDA $3E                      ; $D896  A5 3E
    BEQ loc_0E_D89B              ; $D898  F0 01

loc_0E_D89A:
    RTS                          ; $D89A  60


loc_0E_D89B:
    LDA #$06                     ; $D89B  A9 06
    STA $C006                    ; $D89D  8D 06 C0
    STA $42                      ; $D8A0  85 42
    LDA $8F                      ; $D8A2  A5 8F
    BEQ loc_0E_D8A9              ; $D8A4  F0 03
    JSR sub_0E_DB02              ; $D8A6  20 02 DB

loc_0E_D8A9:
    LDA $92                      ; $D8A9  A5 92
    BEQ loc_0E_D8B0              ; $D8AB  F0 03
    JSR sub_0E_C666              ; $D8AD  20 66 C6

loc_0E_D8B0:
    LDA $8D                      ; $D8B0  A5 8D
    AND #$01                     ; $D8B2  29 01
    BEQ loc_0E_D89A              ; $D8B4  F0 E4
    LDA $8D                      ; $D8B6  A5 8D
    AND #$FE                     ; $D8B8  29 FE
    BNE loc_0E_D8BF              ; $D8BA  D0 03
    JMP loc_0E_D921              ; $D8BC  4C 21 D9


loc_0E_D8BF:
    CLC                          ; $D8BF  18
    LDA $1A                      ; $D8C0  A5 1A
    ADC #$FF                     ; $D8C2  69 FF
    STA $04                      ; $D8C4  85 04
    LDA $1B                      ; $D8C6  A5 1B
    ADC #$00                     ; $D8C8  69 00
    STA $05                      ; $D8CA  85 05
    LDA $8C                      ; $D8CC  A5 8C
    JSR sub_0E_D989              ; $D8CE  20 89 D9
    LDY #$00                     ; $D8D1  A0 00

loc_0E_D8D3:
    LDA ($06),Y                  ; $D8D3  B1 06
    CMP $05                      ; $D8D5  C5 05
    BCC loc_0E_D8E5              ; $D8D7  90 0C
    BNE loc_0E_D8FC              ; $D8D9  D0 21
    INY                          ; $D8DB  C8
    LDA ($06),Y                  ; $D8DC  B1 06
    DEY                          ; $D8DE  88
    CMP $04                      ; $D8DF  C5 04
    BEQ loc_0E_D8E5              ; $D8E1  F0 02
    BCS loc_0E_D8FC              ; $D8E3  B0 17

loc_0E_D8E5:
    INY                          ; $D8E5  C8
    LDA ($06),Y                  ; $D8E6  B1 06
    STA $00                      ; $D8E8  85 00
    INY                          ; $D8EA  C8
    LDA ($06),Y                  ; $D8EB  B1 06
    STA $01                      ; $D8ED  85 01
    INY                          ; $D8EF  C8
    LDA ($06),Y                  ; $D8F0  B1 06
    INY                          ; $D8F2  C8
    LDX $8C                      ; $D8F3  A6 8C
    JSR sub_0E_D9AD              ; $D8F5  20 AD D9
    INC $8C                      ; $D8F8  E6 8C
    BNE loc_0E_D8D3              ; $D8FA  D0 D7

loc_0E_D8FC:
    LDA $8B                      ; $D8FC  A5 8B
    CLC                          ; $D8FE  18
    ADC #$01                     ; $D8FF  69 01
    JSR sub_0E_D989              ; $D901  20 89 D9

loc_0E_D904:
    LDA ($06),Y                  ; $D904  B1 06
    CMP $1B                      ; $D906  C5 1B
    BCC loc_0E_D916              ; $D908  90 0C
    BNE loc_0E_D91E              ; $D90A  D0 12
    INY                          ; $D90C  C8
    LDA ($06),Y                  ; $D90D  B1 06
    CMP $1A                      ; $D90F  C5 1A
    BCC loc_0E_D915              ; $D911  90 02
    BNE loc_0E_D91E              ; $D913  D0 09

loc_0E_D915:
    DEY                          ; $D915  88

loc_0E_D916:
    INY                          ; $D916  C8
    INY                          ; $D917  C8
    INY                          ; $D918  C8
    INY                          ; $D919  C8
    INC $8B                      ; $D91A  E6 8B
    BNE loc_0E_D904              ; $D91C  D0 E6

loc_0E_D91E:
    JMP loc_0E_C3B3              ; $D91E  4C B3 C3


loc_0E_D921:
    LDA $1B                      ; $D921  A5 1B
    STA $05                      ; $D923  85 05
    LDA $1A                      ; $D925  A5 1A
    STA $04                      ; $D927  85 04

loc_0E_D929:
    LDA $8B                      ; $D929  A5 8B
    CMP #$FF                     ; $D92B  C9 FF
    BEQ loc_0E_D95A              ; $D92D  F0 2B
    JSR sub_0E_D989              ; $D92F  20 89 D9
    LDA ($06),Y                  ; $D932  B1 06
    CMP $1B                      ; $D934  C5 1B
    BCC loc_0E_D95A              ; $D936  90 22
    BNE loc_0E_D942              ; $D938  D0 08
    INY                          ; $D93A  C8
    LDA ($06),Y                  ; $D93B  B1 06
    DEY                          ; $D93D  88
    CMP $1A                      ; $D93E  C5 1A
    BCC loc_0E_D95A              ; $D940  90 18

loc_0E_D942:
    INY                          ; $D942  C8
    LDA ($06),Y                  ; $D943  B1 06
    STA $00                      ; $D945  85 00
    INY                          ; $D947  C8
    LDA ($06),Y                  ; $D948  B1 06
    STA $01                      ; $D94A  85 01
    INY                          ; $D94C  C8
    LDA ($06),Y                  ; $D94D  B1 06
    INY                          ; $D94F  C8
    LDX $8B                      ; $D950  A6 8B
    JSR sub_0E_D9AD              ; $D952  20 AD D9
    DEC $8B                      ; $D955  C6 8B
    JMP loc_0E_D929              ; $D957  4C 29 D9


loc_0E_D95A:
    CLC                          ; $D95A  18
    LDA $1A                      ; $D95B  A5 1A
    ADC #$FF                     ; $D95D  69 FF
    STA $04                      ; $D95F  85 04
    LDA $1B                      ; $D961  A5 1B
    ADC #$00                     ; $D963  69 00
    STA $05                      ; $D965  85 05

loc_0E_D967:
    LDA $8C                      ; $D967  A5 8C
    BEQ loc_0E_D986              ; $D969  F0 1B
    SEC                          ; $D96B  38
    SBC #$01                     ; $D96C  E9 01
    JSR sub_0E_D989              ; $D96E  20 89 D9
    LDA ($06),Y                  ; $D971  B1 06
    CMP $05                      ; $D973  C5 05
    BCC loc_0E_D986              ; $D975  90 0F
    BNE loc_0E_D982              ; $D977  D0 09
    INY                          ; $D979  C8
    LDA ($06),Y                  ; $D97A  B1 06
    CMP $04                      ; $D97C  C5 04
    BCC loc_0E_D986              ; $D97E  90 06
    BEQ loc_0E_D986              ; $D980  F0 04

loc_0E_D982:
    DEC $8C                      ; $D982  C6 8C
    BNE loc_0E_D967              ; $D984  D0 E1

loc_0E_D986:
    JMP loc_0E_C3B3              ; $D986  4C B3 C3


sub_0E_D989:
    LDX $00                      ; $D989  A6 00
    STX $07                      ; $D98B  86 07
    ASL A                        ; $D98D  0A
    ROL $07                      ; $D98E  26 07
    ASL A                        ; $D990  0A
    ROL $07                      ; $D991  26 07
    STA $06                      ; $D993  85 06
    LDA $31                      ; $D995  A5 31
    ASL A                        ; $D997  0A
    TAX                          ; $D998  AA
    CLC                          ; $D999  18
    LDA $A452,X                  ; $D99A  BD 52 A4
    ADC $06                      ; $D99D  65 06
    STA $06                      ; $D99F  85 06
    LDA $07                      ; $D9A1  A5 07
    AND #$03                     ; $D9A3  29 03
    ADC $A453,X                  ; $D9A5  7D 53 A4
    STA $07                      ; $D9A8  85 07
    LDY #$00                     ; $D9AA  A0 00
    RTS                          ; $D9AC  60


sub_0E_D9AD:
    STA $02                      ; $D9AD  85 02
    STY $03                      ; $D9AF  84 03
    CMP #$FF                     ; $D9B1  C9 FF
    BNE loc_0E_D9BB              ; $D9B3  D0 06
    JSR sub_0E_C666              ; $D9B5  20 66 C6
    JMP loc_0E_DA2F              ; $D9B8  4C 2F DA


loc_0E_D9BB:
    STX $0C                      ; $D9BB  86 0C
    LDA $01                      ; $D9BD  A5 01
    CMP #$FE                     ; $D9BF  C9 FE
    BNE loc_0E_D9C6              ; $D9C1  D0 03
    JMP loc_0E_DA32              ; $D9C3  4C 32 DA


loc_0E_D9C6:
    TXA                          ; $D9C6  8A
    LDX #$0F                     ; $D9C7  A2 0F

loc_0E_D9C9:
    CMP $7B,X                    ; $D9C9  D5 7B
    BEQ loc_0E_D9D2              ; $D9CB  F0 05
    DEX                          ; $D9CD  CA
    BPL loc_0E_D9C9              ; $D9CE  10 F9
    BMI loc_0E_D9D5              ; $D9D0  30 03

loc_0E_D9D2:
    LDY $03                      ; $D9D2  A4 03
    RTS                          ; $D9D4  60


loc_0E_D9D5:
    LDX #$10                     ; $D9D5  A2 10
    JSR sub_0E_C576              ; $D9D7  20 76 C5
    BCS loc_0E_D9D2              ; $D9DA  B0 F6
    LDA $0C                      ; $D9DC  A5 0C
    STA $6B,X                    ; $D9DE  95 6B

sub_0E_D9E0:
    LDA #$FF                     ; $D9E0  A9 FF
    STA $0400,X                  ; $D9E2  9D 00 04
    LDA $02                      ; $D9E5  A5 02
    STA $06E0,X                  ; $D9E7  9D E0 06
    LDA $05                      ; $D9EA  A5 05
    STA $0460,X                  ; $D9EC  9D 60 04
    LDA $00                      ; $D9EF  A5 00
    STA $0480,X                  ; $D9F1  9D 80 04
    LDA $01                      ; $D9F4  A5 01
    CMP #$FF                     ; $D9F6  C9 FF
    BNE loc_0E_D9FD              ; $D9F8  D0 03
    JMP loc_0E_DA64              ; $D9FA  4C 64 DA


loc_0E_D9FD:
    STA $0600,X                  ; $D9FD  9D 00 06
    LDY $02                      ; $DA00  A4 02
    LDA $A380,Y                  ; $DA02  B9 80 A3
    STA $0420,X                  ; $DA05  9D 20 04
    TYA                          ; $DA08  98
    PHA                          ; $DA09  48
    LDA $A3C6,Y                  ; $DA0A  B9 C6 A3
    TAY                          ; $DA0D  A8
    JSR sub_0F_F533              ; $DA0E  20 33 F5
    PLA                          ; $DA11  68
    TAY                          ; $DA12  A8
    LDA $A40C,Y                  ; $DA13  B9 0C A4
    STA $0640,X                  ; $DA16  9D 40 06
    LDA #$14                     ; $DA19  A9 14
    STA $06C0,X                  ; $DA1B  9D C0 06
    LDA #$00                     ; $DA1E  A9 00
    STA $0440,X                  ; $DA20  9D 40 04
    STA $06A0,X                  ; $DA23  9D A0 06
    STA $0620,X                  ; $DA26  9D 20 06
    STA $04A0,X                  ; $DA29  9D A0 04
    STA $0580,X                  ; $DA2C  9D 80 05

loc_0E_DA2F:
    LDY $03                      ; $DA2F  A4 03
    RTS                          ; $DA31  60


loc_0E_DA32:
    LDA $02                      ; $DA32  A5 02
    STA $0C                      ; $DA34  85 0C
    LDX #$10                     ; $DA36  A2 10

loc_0E_DA38:
    JSR sub_0F_F516              ; $DA38  20 16 F5
    BCS loc_0E_DA61              ; $DA3B  B0 24
    LDA $0420,X                  ; $DA3D  BD 20 04
    ORA #$08                     ; $DA40  09 08
    STA $0420,X                  ; $DA42  9D 20 04
    LDA $02                      ; $DA45  A5 02
    CMP #$1F                     ; $DA47  C9 1F
    BEQ loc_0E_DA54              ; $DA49  F0 09
    CMP #$09                     ; $DA4B  C9 09
    BNE loc_0E_DA5E              ; $DA4D  D0 0F
    LDA #$40                     ; $DA4F  A9 40
    STA $0640,X                  ; $DA51  9D 40 06

loc_0E_DA54:
    LDA #$04                     ; $DA54  A9 04
    STA $0680,X                  ; $DA56  9D 80 06
    LDA #$00                     ; $DA59  A9 00
    STA $0660,X                  ; $DA5B  9D 60 06

loc_0E_DA5E:
    INX                          ; $DA5E  E8
    BNE loc_0E_DA38              ; $DA5F  D0 D7

loc_0E_DA61:
    LDY $03                      ; $DA61  A4 03
    RTS                          ; $DA63  60


loc_0E_DA64:
    TXA                          ; $DA64  8A
    PHA                          ; $DA65  48
    LDA #$00                     ; $DA66  A9 00
    STA $8F                      ; $DA68  85 8F
    LDA $02                      ; $DA6A  A5 02
    CMP #$2C                     ; $DA6C  C9 2C
    BEQ loc_0E_DA86              ; $DA6E  F0 16
    STA $90                      ; $DA70  85 90
    LDX #$01                     ; $DA72  A2 01
    CMP #$06                     ; $DA74  C9 06
    BNE loc_0E_DA7E              ; $DA76  D0 06
    LDX #$7E                     ; $DA78  A2 7E
    LDA #$04                     ; $DA7A  A9 04
    STA $8F                      ; $DA7C  85 8F

loc_0E_DA7E:
    STX $91                      ; $DA7E  86 91
    JSR sub_0E_DB02              ; $DA80  20 02 DB
    PLA                          ; $DA83  68
    TAX                          ; $DA84  AA
    RTS                          ; $DA85  60


loc_0E_DA86:
    LDA $31                      ; $DA86  A5 31
    CMP #$05                     ; $DA88  C9 05
    BNE loc_0E_DA92              ; $DA8A  D0 06
    LDY #$02                     ; $DA8C  A0 02
    LDX #$00                     ; $DA8E  A2 00
    BEQ loc_0E_DA96              ; $DA90  F0 04

loc_0E_DA92:
    LDX #$15                     ; $DA92  A2 15
    LDY #$00                     ; $DA94  A0 00

loc_0E_DA96:
    STX $0C                      ; $DA96  86 0C
    STY $0D                      ; $DA98  84 0D

loc_0E_DA9A:
    LDA #$2C                     ; $DA9A  A9 2C
    JSR sub_0F_F663              ; $DA9C  20 63 F6
    LDY $0C                      ; $DA9F  A4 0C
    LDA $DAEC,Y                  ; $DAA1  B9 EC DA
    STA $6B,X                    ; $DAA4  95 6B
    LDA #$20                     ; $DAA6  A9 20
    STA $0420,X                  ; $DAA8  9D 20 04
    LDA $DAE6,Y                  ; $DAAB  B9 E6 DA
    STA $0480,X                  ; $DAAE  9D 80 04
    LDA $DAE7,Y                  ; $DAB1  B9 E7 DA
    STA $0460,X                  ; $DAB4  9D 60 04
    LDA $DAE8,Y                  ; $DAB7  B9 E8 DA
    STA $0600,X                  ; $DABA  9D 00 06
    LDA $DAE9,Y                  ; $DABD  B9 E9 DA
    STA $0640,X                  ; $DAC0  9D 40 06
    LDA $DAEA,Y                  ; $DAC3  B9 EA DA
    STA $0660,X                  ; $DAC6  9D 60 06
    LDA $DAEB,Y                  ; $DAC9  B9 EB DA
    STA $06C0,X                  ; $DACC  9D C0 06
    TYA                          ; $DACF  98
    CLC                          ; $DAD0  18
    ADC #$07                     ; $DAD1  69 07
    STA $0C                      ; $DAD3  85 0C
    LDA #$00                     ; $DAD5  A9 00
    STA $04E0,X                  ; $DAD7  9D E0 04
    LDA #$01                     ; $DADA  A9 01
    STA $04C0,X                  ; $DADC  9D C0 04
    DEC $0D                      ; $DADF  C6 0D
    BPL loc_0E_DA9A              ; $DAE1  10 B7
    PLA                          ; $DAE3  68
    TAX                          ; $DAE4  AA
    RTS                          ; $DAE5  60

    .byte $F0,$03,$47,$40,$00,$00,$00,$88,$03,$87,$40,$00,$01,$00,$20,$04  ; $DAE6
    .byte $C7,$40,$08,$02,$00,$78,$1B,$87,$40,$00,$03,$02  ; $DAF6

sub_0E_DB02:
    DEC $91                      ; $DB02  C6 91
    BEQ loc_0E_DB07              ; $DB04  F0 01
    RTS                          ; $DB06  60


loc_0E_DB07:
    LDX #$10                     ; $DB07  A2 10
    JSR sub_0E_C576              ; $DB09  20 76 C5
    BCS loc_0E_DB52              ; $DB0C  B0 44
    LDY #$03                     ; $DB0E  A0 03
    LDA $90                      ; $DB10  A5 90
    STA $02                      ; $DB12  85 02

loc_0E_DB14:
    CMP $DB53,Y                  ; $DB14  D9 53 DB
    BEQ loc_0E_DB1C              ; $DB17  F0 03
    DEY                          ; $DB19  88
    BPL loc_0E_DB14              ; $DB1A  10 F8

loc_0E_DB1C:
    TYA                          ; $DB1C  98
    ASL A                        ; $DB1D  0A
    TAY                          ; $DB1E  A8
    LDA $DB57,Y                  ; $DB1F  B9 57 DB
    STA $04                      ; $DB22  85 04
    LDA $DB58,Y                  ; $DB24  B9 58 DB
    STA $05                      ; $DB27  85 05
    LDY $8F                      ; $DB29  A4 8F
    LDA ($04),Y                  ; $DB2B  B1 04
    STA $91                      ; $DB2D  85 91
    INY                          ; $DB2F  C8
    LDA ($04),Y                  ; $DB30  B1 04
    STA $00                      ; $DB32  85 00
    INY                          ; $DB34  C8
    LDA ($04),Y                  ; $DB35  B1 04
    STA $01                      ; $DB37  85 01
    INY                          ; $DB39  C8
    STY $8F                      ; $DB3A  84 8F
    CLC                          ; $DB3C  18
    LDA $1A                      ; $DB3D  A5 1A
    ADC $00                      ; $DB3F  65 00
    STA $00                      ; $DB41  85 00
    LDA $1B                      ; $DB43  A5 1B
    ADC #$00                     ; $DB45  69 00
    STA $05                      ; $DB47  85 05
    JSR sub_0E_D9E0              ; $DB49  20 E0 D9
    LDA $91                      ; $DB4C  A5 91
    BNE loc_0E_DB52              ; $DB4E  D0 02
    STA $8F                      ; $DB50  85 8F

loc_0E_DB52:
    RTS                          ; $DB52  60

    .byte $00,$09,$06,$0E,$5F,$DB,$68,$DB,$6A,$DB,$80,$DB,$31,$04,$4C,$23  ; $DB53
    .byte $04,$8C,$00,$04,$5C,$02,$78,$08,$00,$88,$08,$02,$58,$08,$30,$A8  ; $DB63
    .byte $E0,$30,$38,$08,$18,$C8,$E0,$18,$50,$08,$00,$98,$E0,$1F,$B0,$04  ; $DB73
    .byte $1F,$B0,$04,$1F,$B0,$04,$00,$B0,$04  ; $DB83

sub_0E_DB8C:
    LDA $3E                      ; $DB8C  A5 3E
    CMP #$02                     ; $DB8E  C9 02
    BCS loc_0E_DB9B              ; $DB90  B0 09
    LDA #$00                     ; $DB92  A9 00
    STA $06C1                    ; $DB94  8D C1 06
    RTS                          ; $DB97  60


loc_0E_DB98:
    JMP loc_0E_DC21              ; $DB98  4C 21 DC


loc_0E_DB9B:
    BNE loc_0E_DB98              ; $DB9B  D0 FB
    LDA $31                      ; $DB9D  A5 31
    CMP $AC                      ; $DB9F  C5 AC
    BNE loc_0E_DBAF              ; $DBA1  D0 0C
    LDA $3C                      ; $DBA3  A5 3C
    BEQ loc_0E_DBAF              ; $DBA5  F0 08
    DEC $3C                      ; $DBA7  C6 3C
    BNE loc_0E_DBAE              ; $DBA9  D0 03
    JSR sub_0E_D092              ; $DBAB  20 92 D0

loc_0E_DBAE:
    RTS                          ; $DBAE  60


loc_0E_DBAF:
    LDA $AC                      ; $DBAF  A5 AC
    CMP #$06                     ; $DBB1  C9 06
    BCC sub_0E_DBC4              ; $DBB3  90 0F
    BEQ loc_0E_DBC1              ; $DBB5  F0 0A
    CMP #$08                     ; $DBB7  C9 08
    BCC loc_0E_DBBE              ; $DBB9  90 03
    JMP loc_0F_F105              ; $DBBB  4C 05 F1


loc_0E_DBBE:
    JMP loc_0F_EF57              ; $DBBE  4C 57 EF


loc_0E_DBC1:
    JMP loc_0F_F094              ; $DBC1  4C 94 F0


sub_0E_DBC4:
    LDX #$00                     ; $DBC4  A2 00
    STX $2F                      ; $DBC6  86 2F
    STX $43                      ; $DBC8  86 43
    STX $44                      ; $DBCA  86 44
    INX                          ; $DBCC  E8
    LDY #$C4                     ; $DBCD  A0 C4
    JSR sub_0F_F533              ; $DBCF  20 33 F5
    JSR sub_0F_F67B              ; $DBD2  20 7B F6
    DEX                          ; $DBD5  CA
    STX $06C1                    ; $DBD6  8E C1 06
    LDX $AC                      ; $DBD9  A6 AC
    LDA $ED91,X                  ; $DBDB  BD 91 ED
    STA $0401                    ; $DBDE  8D 01 04
    LDA $ED9A,X                  ; $DBE1  BD 9A ED
    STA $0481                    ; $DBE4  8D 81 04
    LDA $EDA3,X                  ; $DBE7  BD A3 ED
    STA $0601                    ; $DBEA  8D 01 06
    LDA #$17                     ; $DBED  A9 17
    STA $0421                    ; $DBEF  8D 21 04
    INC $0441                    ; $DBF2  EE 41 04
    INC $3E                      ; $DBF5  E6 3E
    LDA #$5E                     ; $DBF7  A9 5E
    STA $3F                      ; $DBF9  85 3F
    INC $2F                      ; $DBFB  E6 2F
    JSR sub_0E_C53D              ; $DBFD  20 3D C5
    LDA $AC                      ; $DC00  A5 AC
    BNE loc_0E_DC09              ; $DC02  D0 05
    LDA #$26                     ; $DC04  A9 26
    JSR sub_0E_C477              ; $DC06  20 77 C4

loc_0E_DC09:
    CMP $31                      ; $DC09  C5 31
    BEQ loc_0E_DC20              ; $DC0B  F0 13
    LDA $31                      ; $DC0D  A5 31
    CMP #$07                     ; $DC0F  C9 07
    BNE loc_0E_DC20              ; $DC11  D0 0D
    LDA #$40                     ; $DC13  A9 40
    STA $0481                    ; $DC15  8D 81 04
    LDA $0421                    ; $DC18  AD 21 04
    ORA #$40                     ; $DC1B  09 40
    STA $0421                    ; $DC1D  8D 21 04

loc_0E_DC20:
    RTS                          ; $DC20  60


loc_0E_DC21:
    CMP #$03                     ; $DC21  C9 03
    BNE loc_0E_DC5F              ; $DC23  D0 3A
    LDA $AC                      ; $DC25  A5 AC
    CMP #$02                     ; $DC27  C9 02
    BNE loc_0E_DC4C              ; $DC29  D0 21
    LDA $0441                    ; $DC2B  AD 41 04
    CMP #$3C                     ; $DC2E  C9 3C
    BNE loc_0E_DC43              ; $DC30  D0 11
    LDA #$0C                     ; $DC32  A9 0C
    JSR sub_0F_EE17              ; $DC34  20 17 EE
    LDA #$30                     ; $DC37  A9 30
    STA $0660,X                  ; $DC39  9D 60 06
    LDA #$03                     ; $DC3C  A9 03
    STA $0680,X                  ; $DC3E  9D 80 06
    INC $44                      ; $DC41  E6 44

loc_0E_DC43:
    LDA $3F                      ; $DC43  A5 3F
    CMP #$3A                     ; $DC45  C9 3A
    BCS loc_0E_DC4C              ; $DC47  B0 03
    JSR sub_0F_F39B              ; $DC49  20 9B F3

loc_0E_DC4C:
    DEC $3F                      ; $DC4C  C6 3F
    LDA $0441                    ; $DC4E  AD 41 04
    BNE loc_0E_DC5E              ; $DC51  D0 0B
    INC $3E                      ; $DC53  E6 3E
    LDA $AC                      ; $DC55  A5 AC
    CMP #$06                     ; $DC57  C9 06
    BCS loc_0E_DC5E              ; $DC59  B0 03
    DEC $0401                    ; $DC5B  CE 01 04

loc_0E_DC5E:
    RTS                          ; $DC5E  60


loc_0E_DC5F:
    LDA $3E                      ; $DC5F  A5 3E
    CMP #$04                     ; $DC61  C9 04
    BNE loc_0E_DC6F              ; $DC63  D0 0A
    JSR sub_0F_F39B              ; $DC65  20 9B F3
    DEC $3F                      ; $DC68  C6 3F
    BNE loc_0E_DC6E              ; $DC6A  D0 02
    INC $3E                      ; $DC6C  E6 3E

loc_0E_DC6E:
    RTS                          ; $DC6E  60


loc_0E_DC6F:
    LDA #$00                     ; $DC6F  A9 00
    STA $68                      ; $DC71  85 68
    SEC                          ; $DC73  38
    LDA $3E                      ; $DC74  A5 3E
    SBC #$05                     ; $DC76  E9 05
    ASL A                        ; $DC78  0A
    TAY                          ; $DC79  A8
    LDA $AC                      ; $DC7A  A5 AC
    ASL A                        ; $DC7C  0A
    TAX                          ; $DC7D  AA
    LDA $EDAC,X                  ; $DC7E  BD AC ED
    STA $00                      ; $DC81  85 00
    LDA $EDAD,X                  ; $DC83  BD AD ED
    STA $01                      ; $DC86  85 01
    JMP ($0000)                  ; $DC88  6C 00 00

    .byte $A5,$56,$F0,$06,$C9,$1F,$90,$02,$A0,$28,$B9,$C0,$DF,$48,$B9,$C1  ; $DC8B
    .byte $DF,$48,$A5,$44,$D0,$03,$4C,$55,$DD,$A9,$12,$8D,$41,$06,$A9,$45  ; $DC9B
    .byte $A2,$04,$20,$86,$C5,$A5,$44,$C9,$02,$F0,$41,$BD,$00,$06,$C9,$18  ; $DCAB
    .byte $90,$12,$C9,$D8,$B0,$0E,$BD,$80,$04,$C9,$18,$90,$07,$C9,$E8,$B0  ; $DCBB
    .byte $03,$4C,$55,$DD,$E6,$44,$BD,$20,$04,$49,$40,$9D,$20,$04,$BD,$80  ; $DCCB
    .byte $06,$49,$FF,$9D,$80,$06,$BD,$60,$06,$49,$FF,$18,$69,$01,$9D,$60  ; $DCDB
    .byte $06,$A9,$60,$85,$48,$A9,$02,$85,$49,$4C,$55,$DD,$A5,$23,$29,$03  ; $DCEB
    .byte $D0,$58,$BD,$20,$04,$29,$BF,$9D,$20,$04,$38,$AD,$81,$04,$FD,$80  ; $DCFB
    .byte $04,$90,$0C,$85,$02,$BD,$20,$04,$09,$40,$9D,$20,$04,$D0,$06,$49  ; $DD0B
    .byte $FF,$69,$01,$85,$02,$18,$A5,$48,$69,$04,$85,$48,$85,$00,$A5,$49  ; $DD1B
    .byte $69,$00,$85,$49,$85,$01,$38,$BD,$00,$06,$ED,$01,$06,$85,$03,$20  ; $DD2B
    .byte $C6,$F8,$A5,$03,$C9,$08,$B0,$12,$A5,$02,$C9,$08,$B0,$0C,$A9,$F8  ; $DD3B
    .byte $9D,$00,$06,$A9,$00,$85,$44,$8D,$41,$06,$68,$85,$05,$68,$85,$04  ; $DD4B
    .byte $AD,$A1,$06,$F0,$01,$60,$6C,$04,$00,$A2,$06,$20,$D5,$ED,$C9,$40  ; $DD5B
    .byte $B0,$12,$E8,$AD,$01,$06,$CD,$00,$06,$F0,$09,$AD,$00,$04,$C9,$09  ; $DD6B
    .byte $F0,$02,$A2,$18,$86,$3E,$60,$20,$C2,$ED,$A9,$3F,$CD,$01,$04,$F0  ; $DD7B
    .byte $1E,$8D,$01,$04,$A9,$00,$8D,$41,$04,$8D,$41,$06,$A9,$20,$8D,$E1  ; $DD8B
    .byte $04,$A9,$01,$8D,$C1,$04,$A5,$44,$F0,$05,$A9,$11,$8D,$41,$06,$20  ; $DD9B
    .byte $F8,$ED,$A5,$2A,$D0,$03,$4C,$64,$DD,$A9,$07,$85,$3E,$60,$20,$C2  ; $DDAB
    .byte $ED,$A9,$41,$8D,$01,$04,$A9,$00,$8D,$41,$06,$8D,$41,$04,$A5,$44  ; $DDBB
    .byte $F0,$05,$A9,$1F,$8D,$41,$06,$A9,$06,$20,$A0,$C5,$A0,$02,$4A,$B0  ; $DDCB
    .byte $05,$88,$4A,$90,$01,$88,$B9,$EA,$DF,$85,$3E,$A9,$06,$8D,$81,$06  ; $DDDB
    .byte $A9,$40,$8D,$61,$06,$20,$D5,$ED,$18,$79,$ED,$DF,$10,$05,$49,$FF  ; $DDEB
    .byte $18,$69,$01,$AA,$A9,$32,$A0,$00,$20,$AC,$C5,$A5,$04,$8D,$E1,$04  ; $DDFB
    .byte $A5,$05,$8D,$C1,$04,$60,$20,$90,$DE,$A2,$0E,$29,$01,$D0,$0A,$A5  ; $DE0B
    .byte $44,$D0,$06,$A2,$10,$A9,$08,$85,$3F,$86,$3E,$60,$20,$90,$DE,$E6  ; $DE1B
    .byte $3E,$29,$01,$D0,$0C,$A5,$44,$D0,$08,$A9,$12,$85,$3E,$A9,$12,$85  ; $DE2B
    .byte $3F,$60,$20,$F8,$ED,$F0,$37,$E6,$3E,$20,$D5,$ED,$C9,$0E,$90,$05  ; $DE3B
    .byte $A9,$05,$85,$3E,$60,$A9,$03,$20,$A0,$C5,$29,$01,$F0,$0C,$A5,$44  ; $DE4B
    .byte $D0,$08,$A9,$14,$85,$3E,$A9,$12,$85,$3F,$A9,$E0,$8D,$61,$06,$A9  ; $DE5B
    .byte $04,$8D,$81,$06,$A9,$C0,$8D,$E1,$04,$A9,$00,$8D,$C1,$04,$60,$20  ; $DE6B
    .byte $90,$DE,$A2,$0D,$29,$01,$D0,$0A,$A5,$44,$D0,$06,$A2,$16,$A9,$15  ; $DE7B
    .byte $85,$3F,$86,$3E,$60,$20,$F8,$ED,$A9,$03,$20,$A0,$C5,$60,$20,$F8  ; $DE8B
    .byte $ED,$F0,$04,$A9,$05,$85,$3E,$60,$20,$F8,$ED,$F0,$08,$A5,$46,$29  ; $DE9B
    .byte $01,$D0,$F0,$E6,$3E,$60,$20,$F8,$ED,$F0,$2A,$A5,$44,$D0,$2F,$AD  ; $DEAB
    .byte $01,$06,$CD,$00,$06,$F0,$0C,$AD,$00,$04,$C9,$09,$F0,$05,$A9,$18  ; $DEBB
    .byte $85,$3E,$60,$A9,$43,$8D,$01,$04,$A9,$00,$8D,$E1,$04,$8D,$C1,$04  ; $DECB
    .byte $8D,$41,$06,$E6,$3E,$60,$20,$F8,$ED,$AD,$41,$04,$D0,$05,$A9,$05  ; $DEDB
    .byte $85,$3E,$60,$C9,$10,$D0,$05,$A9,$06,$20,$8F,$DF,$60,$20,$F8,$ED  ; $DEEB
    .byte $C6,$3F,$D0,$0F,$A9,$43,$8D,$01,$04,$A9,$00,$8D,$41,$04,$8D,$41  ; $DEFB
    .byte $06,$E6,$3E,$60,$AD,$41,$04,$D0,$07,$A9,$41,$8D,$01,$04,$D0,$07  ; $DF0B
    .byte $C9,$10,$D0,$03,$20,$8F,$DF,$20,$F8,$ED,$F0,$1F,$AD,$01,$06,$CD  ; $DF1B
    .byte $00,$06,$F0,$0C,$AD,$00,$04,$C9,$09,$F0,$05,$A9,$18,$85,$3E,$60  ; $DF2B
    .byte $A5,$3E,$29,$07,$4A,$AA,$BD,$47,$DF,$85,$3E,$60,$0E,$0A,$05,$05  ; $DF3B
    .byte $A9,$46,$CD,$01,$04,$F0,$17,$8D,$01,$04,$A9,$3F,$85,$3F,$A9,$00  ; $DF4B
    .byte $8D,$41,$04,$8D,$E1,$04,$8D,$C1,$04,$A9,$26,$20,$77,$C4,$20,$F8  ; $DF5B
    .byte $ED,$AD,$01,$06,$CD,$00,$06,$D0,$07,$AD,$00,$04,$C9,$09,$D0,$08  ; $DF6B
    .byte $A5,$3F,$F0,$04,$C6,$3F,$D0,$0B,$A5,$44,$D0,$07,$A2,$0E,$86,$3E  ; $DF7B
    .byte $4C,$CE,$DE,$60,$A9,$06,$20,$17,$EE,$B0,$23,$20,$D5,$ED,$85,$02  ; $DF8B
    .byte $A9,$02,$85,$01,$A9,$60,$85,$00,$38,$AD,$01,$06,$E9,$0A,$38,$ED  ; $DF9B
    .byte $00,$06,$85,$03,$20,$C6,$F8,$E6,$44,$A9,$25,$20,$77,$C4,$60,$A9  ; $DFAB
    .byte $57,$20,$16,$EF,$60,$64,$DD,$82,$DD,$B9,$DD,$11,$DE,$27,$DE,$3D  ; $DFBB
    .byte $DE,$99,$DE,$7A,$DE,$A3,$DE,$B1,$DE,$E1,$DE,$F8,$DE,$0F,$DF,$F8  ; $DFCB
    .byte $DE,$0F,$DF,$F8,$DE,$0F,$DF,$F8,$DE,$0F,$DF,$4B,$DF,$BA,$DF,$08  ; $DFDB
    .byte $09,$0C,$E0,$00,$20,$AD,$A1,$06,$F0,$01,$60,$B9,$ED,$E0,$85,$04  ; $DFEB
    .byte $B9,$EE,$E0,$85,$05  ; $DFFB
