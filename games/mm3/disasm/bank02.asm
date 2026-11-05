; PRG 8 KB bank $02 at $A000
.segment "BANK02"
.org $A000

    .byte $4C,$5B,$A1  ; $A000
    LDA $EA                      ; $A003  A5 EA
    PHA                          ; $A005  48
    LDA $EB                      ; $A006  A5 EB
    PHA                          ; $A008  48
    LDA $EC                      ; $A009  A5 EC
    PHA                          ; $A00B  48
    LDA $ED                      ; $A00C  A5 ED
    PHA                          ; $A00E  48
    LDX #$03                     ; $A00F  A2 03

loc_02_A011:
    LDA $0620,X                  ; $A011  BD 20 06
    STA $0600,X                  ; $A014  9D 00 06
    DEX                          ; $A017  CA
    BPL loc_02_A011              ; $A018  10 F7

loc_02_A01A:
    JSR sub_02_A18E              ; $A01A  20 8E A1

loc_02_A01D:
    LDA $14                      ; $A01D  A5 14
    AND #$D0                     ; $A01F  29 D0
    BNE loc_02_A02C              ; $A021  D0 09

loc_02_A023:
    JSR sub_02_A398              ; $A023  20 98 A3
    JSR sub_02_A2EA              ; $A026  20 EA A2
    JMP loc_02_A01D              ; $A029  4C 1D A0


loc_02_A02C:
    AND #$40                     ; $A02C  29 40
    BNE loc_02_A038              ; $A02E  D0 08
    LDA $A1                      ; $A030  A5 A1
    BPL loc_02_A0A0              ; $A032  10 6C
    CMP #$FF                     ; $A034  C9 FF
    BEQ loc_02_A05C              ; $A036  F0 24

loc_02_A038:
    LDA $51                      ; $A038  A5 51
    CMP #$E8                     ; $A03A  C9 E8
    BEQ loc_02_A04B              ; $A03C  F0 0D
    LDA $51                      ; $A03E  A5 51
    CLC                          ; $A040  18
    ADC #$04                     ; $A041  69 04
    STA $51                      ; $A043  85 51
    JSR sub_02_A2EA              ; $A045  20 EA A2
    JMP loc_02_A038              ; $A048  4C 38 A0


loc_02_A04B:
    LDA $B4                      ; $A04B  A5 B4
    EOR #$06                     ; $A04D  49 06
    STA $B4                      ; $A04F  85 B4
    LDA #$00                     ; $A051  A9 00
    STA $50                      ; $A053  85 50
    LDA #$80                     ; $A055  A9 80
    STA $A1                      ; $A057  85 A1
    JMP loc_02_A01A              ; $A059  4C 1A A0


loc_02_A05C:
    LDA $B4                      ; $A05C  A5 B4
    BNE loc_02_A09D              ; $A05E  D0 3D
    STA $95                      ; $A060  85 95
    LDA $AF                      ; $A062  A5 AF
    BEQ loc_02_A09D              ; $A064  F0 37
    SEC                          ; $A066  38
    SBC #$01                     ; $A067  E9 01
    STA $AF                      ; $A069  85 AF
    AND #$0F                     ; $A06B  29 0F
    CMP #$0F                     ; $A06D  C9 0F
    BNE loc_02_A078              ; $A06F  D0 07
    LDA $AF                      ; $A071  A5 AF
    SEC                          ; $A073  38
    SBC #$06                     ; $A074  E9 06
    STA $AF                      ; $A076  85 AF

loc_02_A078:
    LDA #$00                     ; $A078  A9 00
    STA $A1                      ; $A07A  85 A1
    LDA $A2                      ; $A07C  A5 A2
    CMP #$9C                     ; $A07E  C9 9C
    BEQ loc_02_A09D              ; $A080  F0 1B
    LDA $95                      ; $A082  A5 95
    AND #$03                     ; $A084  29 03
    BNE loc_02_A097              ; $A086  D0 0F
    INC $A2                      ; $A088  E6 A2
    LDA $A1                      ; $A08A  A5 A1
    PHA                          ; $A08C  48
    LDX #$00                     ; $A08D  A2 00
    STX $A1                      ; $A08F  86 A1
    JSR sub_02_A50D              ; $A091  20 0D A5
    PLA                          ; $A094  68
    STA $A1                      ; $A095  85 A1

loc_02_A097:
    JSR sub_02_A2EA              ; $A097  20 EA A2
    JMP loc_02_A078              ; $A09A  4C 78 A0


loc_02_A09D:
    JMP loc_02_A023              ; $A09D  4C 23 A0


loc_02_A0A0:
    LDA $A1                      ; $A0A0  A5 A1
    CLC                          ; $A0A2  18
    ADC $B4                      ; $A0A3  65 B4
    CMP $A0                      ; $A0A5  C5 A0
    BEQ loc_02_A0AD              ; $A0A7  F0 04
    LDY #$00                     ; $A0A9  A0 00
    STY $B5                      ; $A0AB  84 B5

loc_02_A0AD:
    STA $A0                      ; $A0AD  85 A0
    LDA $A0                      ; $A0AF  A5 A0
    BNE loc_02_A0B7              ; $A0B1  D0 04
    STA $B1                      ; $A0B3  85 B1
    BEQ loc_02_A0E6              ; $A0B5  F0 2F

loc_02_A0B7:
    ORA #$80                     ; $A0B7  09 80
    STA $B1                      ; $A0B9  85 B1
    LDA $B4                      ; $A0BB  A5 B4
    BEQ loc_02_A0E6              ; $A0BD  F0 27
    LDA $A1                      ; $A0BF  A5 A1
    AND #$01                     ; $A0C1  29 01
    BEQ loc_02_A0E6              ; $A0C3  F0 21
    LDA $A1                      ; $A0C5  A5 A1
    LSR A                        ; $A0C7  4A
    CLC                          ; $A0C8  18
    ADC #$06                     ; $A0C9  69 06
    STA $A1                      ; $A0CB  85 A1
    LDA #$00                     ; $A0CD  A9 00
    STA $95                      ; $A0CF  85 95

loc_02_A0D1:
    JSR sub_02_A2EA              ; $A0D1  20 EA A2
    LDA $95                      ; $A0D4  A5 95
    CMP #$0F                     ; $A0D6  C9 0F
    BNE loc_02_A0D1              ; $A0D8  D0 F7
    LDA #$1E                     ; $A0DA  A9 1E

loc_02_A0DC:
    PHA                          ; $A0DC  48
    JSR sub_1F_FF21              ; $A0DD  20 21 FF
    PLA                          ; $A0E0  68
    SEC                          ; $A0E1  38
    SBC #$01                     ; $A0E2  E9 01
    BNE loc_02_A0DC              ; $A0E4  D0 F6

loc_02_A0E6:
    LDA $51                      ; $A0E6  A5 51
    CMP #$E8                     ; $A0E8  C9 E8
    BEQ loc_02_A0FB              ; $A0EA  F0 0F
    LDA $51                      ; $A0EC  A5 51
    CLC                          ; $A0EE  18
    ADC #$04                     ; $A0EF  69 04
    STA $51                      ; $A0F1  85 51
    JSR sub_02_A2EA              ; $A0F3  20 EA A2
    DEC $95                      ; $A0F6  C6 95
    JMP loc_02_A0E6              ; $A0F8  4C E6 A0


loc_02_A0FB:
    LDA $A1                      ; $A0FB  A5 A1
    CMP #$06                     ; $A0FD  C9 06
    BCC loc_02_A108              ; $A0FF  90 07
    SBC #$06                     ; $A101  E9 06
    ASL A                        ; $A103  0A
    ORA #$01                     ; $A104  09 01
    STA $A1                      ; $A106  85 A1

loc_02_A108:
    PLA                          ; $A108  68
    STA $ED                      ; $A109  85 ED
    PLA                          ; $A10B  68
    STA $EC                      ; $A10C  85 EC
    PLA                          ; $A10E  68
    STA $EB                      ; $A10F  85 EB
    PLA                          ; $A111  68
    STA $EA                      ; $A112  85 EA
    LDY $A0                      ; $A114  A4 A0
    LDA $A634,Y                  ; $A116  B9 34 A6
    STA $EB                      ; $A119  85 EB
    LDA #$00                     ; $A11B  A9 00
    STA $50                      ; $A11D  85 50
    LDY $F8                      ; $A11F  A4 F8
    CPY #$01                     ; $A121  C0 01
    BNE loc_02_A127              ; $A123  D0 02
    STA $F8                      ; $A125  85 F8

loc_02_A127:
    LDX #$0F                     ; $A127  A2 0F

loc_02_A129:
    LDA $0630,X                  ; $A129  BD 30 06
    STA $0610,X                  ; $A12C  9D 10 06
    DEX                          ; $A12F  CA
    BNE loc_02_A129              ; $A130  D0 F7
    LDA $A0                      ; $A132  A5 A0
    ASL A                        ; $A134  0A
    ASL A                        ; $A135  0A
    TAY                          ; $A136  A8
    LDX #$00                     ; $A137  A2 00

loc_02_A139:
    LDA $A641,Y                  ; $A139  B9 41 A6
    STA $0611,X                  ; $A13C  9D 11 06
    STA $0631,X                  ; $A13F  9D 31 06
    INY                          ; $A142  C8
    INX                          ; $A143  E8
    CPX #$03                     ; $A144  E0 03
    BNE loc_02_A139              ; $A146  D0 F1
    STX $18                      ; $A148  86 18
    LDA #$04                     ; $A14A  A9 04
    STA $30                      ; $A14C  85 30
    LDX #$00                     ; $A14E  A2 00
    LDA #$13                     ; $A150  A9 13
    JSR sub_1F_F835              ; $A152  20 35 F8
    INC $05A0                    ; $A155  EE A0 05
    JMP sub_1F_FF3C              ; $A158  4C 3C FF

    .byte $A5,$EA,$48,$A5,$EB,$48,$A5,$EC,$48,$A5,$ED,$48,$20,$8E,$A1,$A9  ; $A15B
    .byte $00,$85,$95,$A5,$95,$29,$03,$D0,$11,$A5,$A1,$18,$65,$B4,$AA,$B5  ; $A16B
    .byte $A2,$C9,$9C,$F0,$0B,$F6,$A2,$20,$0D,$A5,$20,$EA,$A2,$4C,$6E,$A1  ; $A17B
    .byte $4C,$E6,$A0  ; $A18B

sub_02_A18E:
    LDA #$1A                     ; $A18E  A9 1A
    JSR sub_1F_F89A              ; $A190  20 9A F8
    LDA $50                      ; $A193  A5 50
    PHA                          ; $A195  48
    INC $50                      ; $A196  E6 50
    LDA #$04                     ; $A198  A9 04
    STA $97                      ; $A19A  85 97
    JSR sub_1E_C5E9              ; $A19C  20 E9 C5
    PLA                          ; $A19F  68
    STA $50                      ; $A1A0  85 50
    LDA $F8                      ; $A1A2  A5 F8
    BNE loc_02_A1AA              ; $A1A4  D0 04
    LDA #$01                     ; $A1A6  A9 01
    STA $F8                      ; $A1A8  85 F8

loc_02_A1AA:
    LDY $50                      ; $A1AA  A4 50
    CPY #$08                     ; $A1AC  C0 08
    BEQ loc_02_A217              ; $A1AE  F0 67
    LDX $A575,Y                  ; $A1B0  BE 75 A5
    LDY #$00                     ; $A1B3  A0 00

loc_02_A1B5:
    LDA $52                      ; $A1B5  A5 52
    AND #$0C                     ; $A1B7  29 0C
    ORA $A57D,X                  ; $A1B9  1D 7D A5
    STA $0780,Y                  ; $A1BC  99 80 07
    BMI loc_02_A1F7              ; $A1BF  30 36
    LDA $A57E,X                  ; $A1C1  BD 7E A5
    STA $0781,Y                  ; $A1C4  99 81 07
    LDA $A57F,X                  ; $A1C7  BD 7F A5
    STA $0782,Y                  ; $A1CA  99 82 07
    STA $00                      ; $A1CD  85 00

loc_02_A1CF:
    LDA #$00                     ; $A1CF  A9 00
    STA $01                      ; $A1D1  85 01
    LDA $A580,X                  ; $A1D3  BD 80 A5
    BPL loc_02_A1E0              ; $A1D6  10 08
    AND #$7F                     ; $A1D8  29 7F
    STA $01                      ; $A1DA  85 01
    INX                          ; $A1DC  E8
    LDA $A580,X                  ; $A1DD  BD 80 A5

loc_02_A1E0:
    STA $0783,Y                  ; $A1E0  99 83 07
    INY                          ; $A1E3  C8
    DEC $00                      ; $A1E4  C6 00
    DEC $01                      ; $A1E6  C6 01
    BPL loc_02_A1E0              ; $A1E8  10 F6
    INX                          ; $A1EA  E8
    LDA $00                      ; $A1EB  A5 00
    BPL loc_02_A1CF              ; $A1ED  10 E0
    INX                          ; $A1EF  E8
    INX                          ; $A1F0  E8
    INX                          ; $A1F1  E8
    INY                          ; $A1F2  C8
    INY                          ; $A1F3  C8
    INY                          ; $A1F4  C8
    BNE loc_02_A1B5              ; $A1F5  D0 BE

loc_02_A1F7:
    JSR sub_02_A251              ; $A1F7  20 51 A2
    LDA $F8                      ; $A1FA  A5 F8
    CMP #$0B                     ; $A1FC  C9 0B
    BNE loc_02_A213              ; $A1FE  D0 13
    LDA #$20                     ; $A200  A9 20
    STA $0780                    ; $A202  8D 80 07
    LDA $0781                    ; $A205  AD 81 07
    SEC                          ; $A208  38
    SBC #$C0                     ; $A209  E9 C0
    STA $0781                    ; $A20B  8D 81 07
    LDA #$FF                     ; $A20E  A9 FF
    STA $07A3                    ; $A210  8D A3 07

loc_02_A213:
    INC $19                      ; $A213  E6 19
    INC $50                      ; $A215  E6 50

loc_02_A217:
    LDA #$74                     ; $A217  A9 74
    CMP $EA                      ; $A219  C5 EA
    BEQ loc_02_A23D              ; $A21B  F0 20
    STA $EA                      ; $A21D  85 EA
    LDA #$0B                     ; $A21F  A9 0B
    STA $EB                      ; $A221  85 EB
    LDA #$12                     ; $A223  A9 12
    STA $EC                      ; $A225  85 EC
    LDA #$1C                     ; $A227  A9 1C
    STA $ED                      ; $A229  85 ED
    LDX #$0F                     ; $A22B  A2 0F

loc_02_A22D:
    LDA $A624,X                  ; $A22D  BD 24 A6
    STA $0610,X                  ; $A230  9D 10 06
    DEX                          ; $A233  CA
    BNE loc_02_A22D              ; $A234  D0 F7
    LDA #$FF                     ; $A236  A9 FF
    STA $18                      ; $A238  85 18
    JSR sub_1F_FF3C              ; $A23A  20 3C FF

loc_02_A23D:
    JSR sub_02_A2EA              ; $A23D  20 EA A2
    LDA $51                      ; $A240  A5 51
    CMP #$B0                     ; $A242  C9 B0
    BEQ loc_02_A250              ; $A244  F0 0A
    LDA $51                      ; $A246  A5 51
    SEC                          ; $A248  38
    SBC #$04                     ; $A249  E9 04
    STA $51                      ; $A24B  85 51
    JMP loc_02_A1AA              ; $A24D  4C AA A1


loc_02_A250:
    RTS                          ; $A250  60


sub_02_A251:
    LDA $50                      ; $A251  A5 50
    CMP #$06                     ; $A253  C9 06
    BCS loc_02_A2A9              ; $A255  B0 52
    AND #$01                     ; $A257  29 01
    BEQ loc_02_A2A9              ; $A259  F0 4E
    LDA $50                      ; $A25B  A5 50
    CLC                          ; $A25D  18
    ADC $B4                      ; $A25E  65 B4
    AND #$FE                     ; $A260  29 FE
    STA $00                      ; $A262  85 00
    LDX #$08                     ; $A264  A2 08

loc_02_A266:
    LDA #$07                     ; $A266  A9 07
    STA $01                      ; $A268  85 01
    LDY $00                      ; $A26A  A4 00
    LDA $00A2,Y                  ; $A26C  B9 A2 00
    BPL loc_02_A29D              ; $A26F  10 2C
    AND #$7F                     ; $A271  29 7F
    STA $02                      ; $A273  85 02
    LDA $A5D8,Y                  ; $A275  B9 D8 A5
    STA $0780,X                  ; $A278  9D 80 07
    LDA $A5E4,Y                  ; $A27B  B9 E4 A5
    STA $0781,X                  ; $A27E  9D 81 07
    INX                          ; $A281  E8
    INX                          ; $A282  E8

loc_02_A283:
    LDY #$04                     ; $A283  A0 04
    LDA $02                      ; $A285  A5 02
    SEC                          ; $A287  38
    SBC #$04                     ; $A288  E9 04
    BCS loc_02_A290              ; $A28A  B0 04
    LDY $02                      ; $A28C  A4 02
    LDA #$00                     ; $A28E  A9 00

loc_02_A290:
    STA $02                      ; $A290  85 02
    LDA $A5F0,Y                  ; $A292  B9 F0 A5
    STA $0780,X                  ; $A295  9D 80 07
    INX                          ; $A298  E8
    DEC $01                      ; $A299  C6 01
    BNE loc_02_A283              ; $A29B  D0 E6

loc_02_A29D:
    LDA $00                      ; $A29D  A5 00
    AND #$01                     ; $A29F  29 01
    BNE loc_02_A2A9              ; $A2A1  D0 06
    LDX #$13                     ; $A2A3  A2 13
    INC $00                      ; $A2A5  E6 00
    BNE loc_02_A266              ; $A2A7  D0 BD

loc_02_A2A9:
    LDA $50                      ; $A2A9  A5 50
    CMP #$02                     ; $A2AB  C9 02
    BNE loc_02_A2C3              ; $A2AD  D0 14
    LDA $B4                      ; $A2AF  A5 B4
    BNE loc_02_A2DE              ; $A2B1  D0 2B
    LDA $AE                      ; $A2B3  A5 AE
    AND #$0F                     ; $A2B5  29 0F
    STA $07A1                    ; $A2B7  8D A1 07
    LDA $AE                      ; $A2BA  A5 AE
    LSR A                        ; $A2BC  4A
    LSR A                        ; $A2BD  4A
    LSR A                        ; $A2BE  4A
    LSR A                        ; $A2BF  4A
    STA $07A0                    ; $A2C0  8D A0 07

loc_02_A2C3:
    LDA $50                      ; $A2C3  A5 50
    CMP #$05                     ; $A2C5  C9 05
    BNE loc_02_A2E9              ; $A2C7  D0 20
    LDA $B4                      ; $A2C9  A5 B4
    BNE loc_02_A2DE              ; $A2CB  D0 11
    LDA $AF                      ; $A2CD  A5 AF
    AND #$0F                     ; $A2CF  29 0F
    STA $07A1                    ; $A2D1  8D A1 07
    LDA $AF                      ; $A2D4  A5 AF
    LSR A                        ; $A2D6  4A
    LSR A                        ; $A2D7  4A
    LSR A                        ; $A2D8  4A
    LSR A                        ; $A2D9  4A
    STA $07A0                    ; $A2DA  8D A0 07
    RTS                          ; $A2DD  60


loc_02_A2DE:
    LDA #$25                     ; $A2DE  A9 25
    STA $079F                    ; $A2E0  8D 9F 07
    STA $07A0                    ; $A2E3  8D A0 07
    STA $07A1                    ; $A2E6  8D A1 07

loc_02_A2E9:
    RTS                          ; $A2E9  60


sub_02_A2EA:
    LDA $F8                      ; $A2EA  A5 F8
    CMP #$01                     ; $A2EC  C9 01
    BEQ loc_02_A2F6              ; $A2EE  F0 06
    LDA $5E                      ; $A2F0  A5 5E
    CMP $51                      ; $A2F2  C5 51
    BCC loc_02_A2F8              ; $A2F4  90 02

loc_02_A2F6:
    LDA $51                      ; $A2F6  A5 51

loc_02_A2F8:
    STA $7B                      ; $A2F8  85 7B
    JSR sub_1E_C5E9              ; $A2FA  20 E9 C5
    JSR sub_02_A30C              ; $A2FD  20 0C A3
    LDA #$00                     ; $A300  A9 00
    STA $EE                      ; $A302  85 EE
    JSR sub_1F_FF21              ; $A304  20 21 FF
    INC $EE                      ; $A307  E6 EE
    INC $95                      ; $A309  E6 95
    RTS                          ; $A30B  60


sub_02_A30C:
    LDA $B4                      ; $A30C  A5 B4
    BNE loc_02_A347              ; $A30E  D0 37
    LDX #$1C                     ; $A310  A2 1C
    LDA $A1                      ; $A312  A5 A1
    CMP #$FF                     ; $A314  C9 FF
    BNE loc_02_A320              ; $A316  D0 08
    LDA $95                      ; $A318  A5 95
    AND #$08                     ; $A31A  29 08
    BEQ loc_02_A320              ; $A31C  F0 02
    LDX #$0C                     ; $A31E  A2 0C

loc_02_A320:
    LDA $A670,X                  ; $A320  BD 70 A6
    CLC                          ; $A323  18
    ADC $51                      ; $A324  65 51
    BCS loc_02_A341              ; $A326  B0 19
    CMP #$F0                     ; $A328  C9 F0
    BCS loc_02_A341              ; $A32A  B0 15
    STA $0200,X                  ; $A32C  9D 00 02
    LDA $A671,X                  ; $A32F  BD 71 A6
    STA $0201,X                  ; $A332  9D 01 02
    LDA $A672,X                  ; $A335  BD 72 A6
    STA $0202,X                  ; $A338  9D 02 02
    LDA $A673,X                  ; $A33B  BD 73 A6
    STA $0203,X                  ; $A33E  9D 03 02

loc_02_A341:
    DEX                          ; $A341  CA
    DEX                          ; $A342  CA
    DEX                          ; $A343  CA
    DEX                          ; $A344  CA
    BPL loc_02_A320              ; $A345  10 D9

loc_02_A347:
    LDA $A1                      ; $A347  A5 A1
    BPL loc_02_A34C              ; $A349  10 01

loc_02_A34B:
    RTS                          ; $A34B  60


loc_02_A34C:
    CLC                          ; $A34C  18
    ADC $B4                      ; $A34D  65 B4
    BEQ loc_02_A34B              ; $A34F  F0 FA
    ASL A                        ; $A351  0A
    TAX                          ; $A352  AA
    LDA $95                      ; $A353  A5 95
    AND #$08                     ; $A355  29 08
    BEQ loc_02_A35A              ; $A357  F0 01
    INX                          ; $A359  E8

loc_02_A35A:
    LDA $A690,X                  ; $A35A  BD 90 A6
    STA $00                      ; $A35D  85 00
    LDA $A6AE,X                  ; $A35F  BD AE A6
    STA $01                      ; $A362  85 01
    LDX #$20                     ; $A364  A2 20
    LDY #$00                     ; $A366  A0 00

loc_02_A368:
    LDA ($00),Y                  ; $A368  B1 00
    BMI loc_02_A397              ; $A36A  30 2B
    CLC                          ; $A36C  18
    ADC $51                      ; $A36D  65 51
    BCS loc_02_A391              ; $A36F  B0 20
    CMP #$F0                     ; $A371  C9 F0
    BCS loc_02_A391              ; $A373  B0 1C
    STA $0200,X                  ; $A375  9D 00 02
    INY                          ; $A378  C8
    LDA ($00),Y                  ; $A379  B1 00
    STA $0201,X                  ; $A37B  9D 01 02
    INY                          ; $A37E  C8
    LDA ($00),Y                  ; $A37F  B1 00
    STA $0202,X                  ; $A381  9D 02 02
    INY                          ; $A384  C8
    LDA ($00),Y                  ; $A385  B1 00
    STA $0203,X                  ; $A387  9D 03 02
    INY                          ; $A38A  C8

loc_02_A38B:
    INX                          ; $A38B  E8
    INX                          ; $A38C  E8
    INX                          ; $A38D  E8
    INX                          ; $A38E  E8
    BNE loc_02_A368              ; $A38F  D0 D7

loc_02_A391:
    INY                          ; $A391  C8
    INY                          ; $A392  C8
    INY                          ; $A393  C8
    INY                          ; $A394  C8
    BNE loc_02_A38B              ; $A395  D0 F4

loc_02_A397:
    RTS                          ; $A397  60


sub_02_A398:
    LDA $A1                      ; $A398  A5 A1
    PHA                          ; $A39A  48
    LDA $16                      ; $A39B  A5 16
    AND #$0F                     ; $A39D  29 0F
    BNE loc_02_A3A8              ; $A39F  D0 07
    LDA #$F0                     ; $A3A1  A9 F0
    STA $1F                      ; $A3A3  85 1F

loc_02_A3A5:
    JMP loc_02_A477              ; $A3A5  4C 77 A4


loc_02_A3A8:
    LDA $1F                      ; $A3A8  A5 1F
    CLC                          ; $A3AA  18
    ADC #$10                     ; $A3AB  69 10
    STA $1F                      ; $A3AD  85 1F
    BNE loc_02_A3A5              ; $A3AF  D0 F4
    LDA $16                      ; $A3B1  A5 16
    AND #$01                     ; $A3B3  29 01
    BEQ loc_02_A3EC              ; $A3B5  F0 35

loc_02_A3B7:
    LDA $A1                      ; $A3B7  A5 A1
    BPL loc_02_A3C5              ; $A3B9  10 0A
    CMP #$FF                     ; $A3BB  C9 FF
    BEQ loc_02_A3A5              ; $A3BD  F0 E6
    LDA #$00                     ; $A3BF  A9 00
    STA $A1                      ; $A3C1  85 A1
    BEQ loc_02_A3DE              ; $A3C3  F0 19

loc_02_A3C5:
    LDA $B4                      ; $A3C5  A5 B4
    BEQ loc_02_A3CF              ; $A3C7  F0 06
    LDA $A1                      ; $A3C9  A5 A1
    AND #$01                     ; $A3CB  29 01
    BNE loc_02_A3A5              ; $A3CD  D0 D6

loc_02_A3CF:
    INC $A1                      ; $A3CF  E6 A1
    LDA $A1                      ; $A3D1  A5 A1
    AND #$01                     ; $A3D3  29 01
    BNE loc_02_A3DE              ; $A3D5  D0 07
    LDA #$FF                     ; $A3D7  A9 FF
    STA $A1                      ; $A3D9  85 A1
    JMP loc_02_A477              ; $A3DB  4C 77 A4


loc_02_A3DE:
    LDA $A1                      ; $A3DE  A5 A1
    CLC                          ; $A3E0  18
    ADC $B4                      ; $A3E1  65 B4
    TAY                          ; $A3E3  A8
    LDA $00A2,Y                  ; $A3E4  B9 A2 00
    BPL loc_02_A3B7              ; $A3E7  10 CE
    JMP loc_02_A477              ; $A3E9  4C 77 A4


loc_02_A3EC:
    LDA $16                      ; $A3EC  A5 16
    AND #$02                     ; $A3EE  29 02
    BEQ loc_02_A41D              ; $A3F0  F0 2B

loc_02_A3F2:
    LDA $A1                      ; $A3F2  A5 A1
    BPL loc_02_A400              ; $A3F4  10 0A
    CMP #$80                     ; $A3F6  C9 80
    BEQ loc_02_A3A5              ; $A3F8  F0 AB
    LDA #$01                     ; $A3FA  A9 01
    STA $A1                      ; $A3FC  85 A1
    BNE loc_02_A40F              ; $A3FE  D0 0F

loc_02_A400:
    DEC $A1                      ; $A400  C6 A1
    LDA $A1                      ; $A402  A5 A1
    AND #$01                     ; $A404  29 01
    BEQ loc_02_A40F              ; $A406  F0 07
    LDA #$80                     ; $A408  A9 80
    STA $A1                      ; $A40A  85 A1
    JMP loc_02_A3A5              ; $A40C  4C A5 A3


loc_02_A40F:
    LDA $A1                      ; $A40F  A5 A1
    CLC                          ; $A411  18
    ADC $B4                      ; $A412  65 B4
    TAY                          ; $A414  A8
    LDA $00A2,Y                  ; $A415  B9 A2 00
    BPL loc_02_A3F2              ; $A418  10 D8
    JMP loc_02_A477              ; $A41A  4C 77 A4


loc_02_A41D:
    LDA $A1                      ; $A41D  A5 A1
    BMI loc_02_A477              ; $A41F  30 56
    LDA $16                      ; $A421  A5 16
    AND #$08                     ; $A423  29 08
    BEQ loc_02_A44C              ; $A425  F0 25

loc_02_A427:
    LDA $A1                      ; $A427  A5 A1
    BNE loc_02_A431              ; $A429  D0 06
    LDA #$05                     ; $A42B  A9 05
    STA $A1                      ; $A42D  85 A1
    BNE loc_02_A46C              ; $A42F  D0 3B

loc_02_A431:
    CMP #$01                     ; $A431  C9 01
    BNE loc_02_A43B              ; $A433  D0 06
    LDA #$04                     ; $A435  A9 04
    STA $A1                      ; $A437  85 A1
    BNE loc_02_A43F              ; $A439  D0 04

loc_02_A43B:
    DEC $A1                      ; $A43B  C6 A1
    DEC $A1                      ; $A43D  C6 A1

loc_02_A43F:
    LDA $A1                      ; $A43F  A5 A1
    CLC                          ; $A441  18
    ADC $B4                      ; $A442  65 B4
    TAY                          ; $A444  A8
    LDA $00A2,Y                  ; $A445  B9 A2 00
    BPL loc_02_A427              ; $A448  10 DD
    BMI loc_02_A477              ; $A44A  30 2B

loc_02_A44C:
    LDA $16                      ; $A44C  A5 16
    AND #$04                     ; $A44E  29 04
    BEQ loc_02_A477              ; $A450  F0 25

loc_02_A452:
    LDA $A1                      ; $A452  A5 A1
    CMP #$04                     ; $A454  C9 04
    BNE loc_02_A45E              ; $A456  D0 06
    LDA #$01                     ; $A458  A9 01
    STA $A1                      ; $A45A  85 A1
    BNE loc_02_A46C              ; $A45C  D0 0E

loc_02_A45E:
    CMP #$05                     ; $A45E  C9 05
    BNE loc_02_A468              ; $A460  D0 06
    LDA #$00                     ; $A462  A9 00
    STA $A1                      ; $A464  85 A1
    BEQ loc_02_A46C              ; $A466  F0 04

loc_02_A468:
    INC $A1                      ; $A468  E6 A1
    INC $A1                      ; $A46A  E6 A1

loc_02_A46C:
    LDA $A1                      ; $A46C  A5 A1
    CLC                          ; $A46E  18
    ADC $B4                      ; $A46F  65 B4
    TAY                          ; $A471  A8
    LDA $00A2,Y                  ; $A472  B9 A2 00
    BPL loc_02_A452              ; $A475  10 DB

loc_02_A477:
    PLA                          ; $A477  68
    CMP $A1                      ; $A478  C5 A1
    BEQ loc_02_A481              ; $A47A  F0 05
    LDA #$1B                     ; $A47C  A9 1B
    JSR sub_1F_F89A              ; $A47E  20 9A F8

loc_02_A481:
    LDX #$00                     ; $A481  A2 00

loc_02_A483:
    LDA $52                      ; $A483  A5 52
    AND #$2C                     ; $A485  29 2C
    ORA $A5F5,X                  ; $A487  1D F5 A5
    STA $0780,X                  ; $A48A  9D 80 07
    CMP #$FF                     ; $A48D  C9 FF
    BEQ loc_02_A4A0              ; $A48F  F0 0F
    INX                          ; $A491  E8
    LDY #$04                     ; $A492  A0 04

loc_02_A494:
    LDA $A5F5,X                  ; $A494  BD F5 A5
    STA $0780,X                  ; $A497  9D 80 07
    INX                          ; $A49A  E8
    DEY                          ; $A49B  88
    BNE loc_02_A494              ; $A49C  D0 F6
    BEQ loc_02_A483              ; $A49E  F0 E3

loc_02_A4A0:
    LDA #$05                     ; $A4A0  A9 05
    STA $00                      ; $A4A2  85 00
    LDX $B4                      ; $A4A4  A6 B4
    LDY #$03                     ; $A4A6  A0 03

loc_02_A4A8:
    LDA $A2,X                    ; $A4A8  B5 A2
    BPL loc_02_A4B8              ; $A4AA  10 0C
    LDA $A5D8,X                  ; $A4AC  BD D8 A5
    STA $0780,Y                  ; $A4AF  99 80 07
    LDA $A5E4,X                  ; $A4B2  BD E4 A5
    STA $0781,Y                  ; $A4B5  99 81 07

loc_02_A4B8:
    INX                          ; $A4B8  E8
    TYA                          ; $A4B9  98
    CLC                          ; $A4BA  18
    ADC #$05                     ; $A4BB  69 05
    TAY                          ; $A4BD  A8
    DEC $00                      ; $A4BE  C6 00
    BPL loc_02_A4A8              ; $A4C0  10 E6
    LDA $95                      ; $A4C2  A5 95
    AND #$08                     ; $A4C4  29 08
    BEQ loc_02_A4EB              ; $A4C6  F0 23
    LDX $A1                      ; $A4C8  A6 A1
    BPL loc_02_A4E0              ; $A4CA  10 14
    CPX #$FF                     ; $A4CC  E0 FF
    BEQ loc_02_A4EB              ; $A4CE  F0 1B
    LDA #$25                     ; $A4D0  A9 25
    STA $07A1                    ; $A4D2  8D A1 07
    STA $07A2                    ; $A4D5  8D A2 07
    STA $07A6                    ; $A4D8  8D A6 07
    STA $07A7                    ; $A4DB  8D A7 07
    BNE loc_02_A4EB              ; $A4DE  D0 0B

loc_02_A4E0:
    LDY $A61E,X                  ; $A4E0  BC 1E A6
    LDA #$25                     ; $A4E3  A9 25
    STA $0780,Y                  ; $A4E5  99 80 07
    STA $0781,Y                  ; $A4E8  99 81 07

loc_02_A4EB:
    LDA $F8                      ; $A4EB  A5 F8
    CMP #$0B                     ; $A4ED  C9 0B
    BNE loc_02_A50A              ; $A4EF  D0 19
    LDY #$00                     ; $A4F1  A0 00

loc_02_A4F3:
    LDA #$20                     ; $A4F3  A9 20
    STA $0780,Y                  ; $A4F5  99 80 07
    LDA $0781,Y                  ; $A4F8  B9 81 07
    SEC                          ; $A4FB  38
    SBC #$C0                     ; $A4FC  E9 C0
    STA $0781,Y                  ; $A4FE  99 81 07
    INY                          ; $A501  C8
    INY                          ; $A502  C8
    INY                          ; $A503  C8
    INY                          ; $A504  C8
    INY                          ; $A505  C8
    CPY #$28                     ; $A506  C0 28
    BNE loc_02_A4F3              ; $A508  D0 E9

loc_02_A50A:
    INC $19                      ; $A50A  E6 19
    RTS                          ; $A50C  60


sub_02_A50D:
    LDA #$1C                     ; $A50D  A9 1C
    JSR sub_1F_F89A              ; $A50F  20 9A F8
    LDA $A1                      ; $A512  A5 A1
    ASL A                        ; $A514  0A
    TAY                          ; $A515  A8
    LDA $52                      ; $A516  A5 52
    AND #$0C                     ; $A518  29 0C
    ORA $A569,Y                  ; $A51A  19 69 A5
    STA $0780                    ; $A51D  8D 80 07
    LDA $A56A,Y                  ; $A520  B9 6A A5
    STA $0781                    ; $A523  8D 81 07
    LDA #$06                     ; $A526  A9 06
    STA $0782                    ; $A528  8D 82 07
    LDA $A2,X                    ; $A52B  B5 A2
    AND #$1F                     ; $A52D  29 1F
    STA $00                      ; $A52F  85 00
    LDY #$00                     ; $A531  A0 00

loc_02_A533:
    LDX #$04                     ; $A533  A2 04
    LDA $00                      ; $A535  A5 00
    SEC                          ; $A537  38
    SBC #$04                     ; $A538  E9 04
    BCS loc_02_A540              ; $A53A  B0 04
    LDX $00                      ; $A53C  A6 00
    LDA #$00                     ; $A53E  A9 00

loc_02_A540:
    STA $00                      ; $A540  85 00
    LDA $A5F0,X                  ; $A542  BD F0 A5
    STA $0783,Y                  ; $A545  99 83 07
    INY                          ; $A548  C8
    CPY #$07                     ; $A549  C0 07
    BNE loc_02_A533              ; $A54B  D0 E6
    LDA $F8                      ; $A54D  A5 F8
    CMP #$0B                     ; $A54F  C9 0B
    BNE loc_02_A561              ; $A551  D0 0E
    LDA #$20                     ; $A553  A9 20
    STA $0780                    ; $A555  8D 80 07
    LDA $0781                    ; $A558  AD 81 07
    SEC                          ; $A55B  38
    SBC #$C0                     ; $A55C  E9 C0
    STA $0781                    ; $A55E  8D 81 07

loc_02_A561:
    LDA #$FF                     ; $A561  A9 FF
    STA $078A                    ; $A563  8D 8A 07
    STA $19                      ; $A566  85 19
    RTS                          ; $A568  60

    .byte $22,$E7,$22,$F2,$23,$27,$23,$32,$23,$67,$23,$72,$00,$0D,$15,$25  ; $A569
    .byte $2D,$38,$46,$53,$22,$C0,$1F,$30,$9D,$31,$32,$23,$E8,$07,$87,$00  ; $A579
    .byte $FF,$22,$E0,$1F,$33,$9D,$25,$34,$FF,$23,$00,$1F,$33,$9A,$25,$2B  ; $A589
    .byte $00,$00,$34,$23,$F0,$07,$87,$00,$FF,$23,$20,$1F,$33,$9D,$25,$34  ; $A599
    .byte $FF,$23,$40,$1F,$33,$25,$38,$39,$9A,$25,$34,$FF,$23,$60,$1F,$33  ; $A5A9
    .byte $25,$3A,$3B,$97,$25,$2B,$00,$00,$34,$FF,$23,$80,$1F,$33,$9D,$25  ; $A5B9
    .byte $34,$23,$F8,$07,$87,$00,$FF,$23,$A0,$1F,$35,$9D,$36,$37,$FF,$19  ; $A5C9
    .byte $10,$17,$11,$16,$1D,$1C,$1B,$1C,$1B,$1C,$1B,$25,$0E,$0E,$0A,$0A  ; $A5D9
    .byte $18,$17,$0C,$19,$16,$11,$13,$24,$2F,$2E,$2D,$2C,$22,$E5,$01,$25  ; $A5E9
    .byte $25,$22,$F0,$01,$25,$25,$23,$25,$01,$25,$25,$23,$30,$01,$25,$25  ; $A5F9
    .byte $23,$65,$01,$25,$25,$23,$70,$01,$25,$25,$23,$42,$01,$38,$39,$23  ; $A609
    .byte $62,$01,$3A,$3B,$FF,$03,$08,$0D,$12,$17,$1C,$0F,$0F,$30,$15,$0F  ; $A619
    .byte $0F,$30,$37,$0F,$0F,$3C,$11,$0F,$0F,$30,$19,$01,$02,$07,$03,$01  ; $A629
    .byte $07,$01,$04,$06,$02,$06,$03,$0F,$0F,$2C,$11,$0F,$0F,$30,$21,$0F  ; $A639
    .byte $0F,$30,$17,$0F,$0F,$10,$01,$0F,$0F,$10,$16,$0F,$0F,$36,$00,$0F  ; $A649
    .byte $0F,$30,$19,$0F,$0F,$30,$15,$0F,$0F,$30,$26,$0F,$0F,$30,$15,$0F  ; $A659
    .byte $0F,$34,$14,$0F,$0F,$30,$15,$08,$F3,$02,$D0,$08,$F3,$42,$D8,$10  ; $A669
    .byte $F4,$01,$D0,$10,$F4,$41,$D8,$20,$F1,$02,$D0,$20,$F2,$02,$D8,$28  ; $A679
    .byte $F1,$82,$D0,$28,$F2,$82,$D8,$CC,$CC,$CC,$CC,$DD,$DD,$EE,$EE,$FF  ; $A689
    .byte $FF,$10,$10,$21,$21,$56,$83,$5F,$5F,$56,$83,$BA,$BA,$56,$83,$56  ; $A699
    .byte $32,$2D,$CB,$2D,$70,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$A7  ; $A6A9
    .byte $A7,$A7,$A7,$A8,$A8,$A7,$A7,$A8,$A8,$A7,$A7,$A8,$A8,$A8,$A7,$A8  ; $A6B9
    .byte $A7,$A8,$A7,$08,$4F,$03,$10,$08,$5F,$C3,$18,$10,$5F,$03,$10,$10  ; $A6C9
    .byte $4F,$C3,$18,$FF,$08,$F8,$01,$10,$08,$F9,$01,$18,$10,$FA,$01,$10  ; $A6D9
    .byte $10,$FB,$01,$18,$FF,$08,$B8,$00,$10,$08,$B9,$00,$18,$10,$BA,$00  ; $A6E9
    .byte $10,$10,$BB,$00,$18,$FF,$08,$5E,$00,$10,$08,$6F,$00,$18,$10,$5E  ; $A6F9
    .byte $80,$10,$10,$6F,$80,$18,$FF,$08,$BD,$00,$10,$08,$BD,$40,$18,$10  ; $A709
    .byte $BE,$00,$10,$10,$BF,$00,$18,$FF,$08,$FC,$03,$10,$08,$FD,$03,$18  ; $A719
    .byte $10,$FE,$03,$10,$10,$FF,$03,$18,$FF,$0A,$DA,$41,$1C,$09,$DB,$41  ; $A729
    .byte $14,$04,$D6,$40,$19,$04,$E0,$40,$11,$04,$E1,$40,$09,$0C,$DC,$40  ; $A739
    .byte $19,$0C,$E5,$40,$11,$0C,$E6,$40,$09,$14,$E2,$40,$19,$14,$E3,$40  ; $A749
    .byte $11,$14,$E4,$40,$09,$FF,$08,$BC,$01,$10,$08,$BC,$41,$18,$10,$BC  ; $A759
    .byte $81,$10,$10,$BC,$C1,$18,$FF,$13,$D5,$41,$1D,$0C,$CC,$40,$20,$0C  ; $A769
    .byte $CD,$40,$18,$0C,$CE,$40,$10,$0C,$CF,$40,$08,$14,$D0,$40,$20,$14  ; $A779
    .byte $D1,$40,$18,$14,$D2,$40,$10,$14,$D3,$41,$08,$FF,$0F,$D5,$41,$1D  ; $A789
    .byte $08,$CC,$40,$20,$08,$CD,$40,$18,$08,$CE,$40,$10,$08,$CF,$40,$08  ; $A799
    .byte $10,$D0,$40,$20,$10,$D1,$40,$18,$10,$D2,$40,$10,$10,$D4,$41,$08  ; $A7A9
    .byte $FF,$08,$B7,$81,$10,$08,$B7,$C1,$18,$10,$B7,$01,$10,$10,$B7,$41  ; $A7B9
    .byte $18,$FF,$14,$F5,$41,$1D,$04,$CB,$40,$08,$0C,$C0,$40,$20,$0C,$C1  ; $A7C9
    .byte $40,$18,$0C,$C2,$40,$10,$0C,$C3,$40,$08,$0C,$C8,$41,$00,$14,$C4  ; $A7D9
    .byte $40,$20,$14,$C5,$40,$18,$14,$C6,$40,$10,$14,$C7,$40,$08,$14,$C9  ; $A7E9
    .byte $41,$00,$1C,$CA,$41,$00,$FF,$10,$F5,$41,$1D,$00,$CB,$40,$08,$08  ; $A7F9
    .byte $C0,$40,$20,$08,$C1,$40,$18,$08,$C2,$40,$10,$08,$C3,$40,$08,$10  ; $A809
    .byte $C4,$40,$20,$10,$C5,$40,$18,$10,$C6,$40,$10,$10,$F6,$40,$08,$10  ; $A819
    .byte $F7,$41,$00,$FF,$0E,$E7,$41,$1C,$0E,$E8,$41,$14,$04,$E9,$40,$19  ; $A829
    .byte $04,$EA,$40,$11,$0C,$EB,$40,$19,$0C,$EC,$40,$11,$0C,$ED,$40,$09  ; $A839
    .byte $14,$EE,$40,$19,$14,$EF,$40,$11,$14,$F0,$40,$09,$FF,$0A,$DA,$41  ; $A849
    .byte $1C,$09,$DB,$41,$14,$04,$D6,$40,$19,$04,$D7,$40,$11,$04,$D8,$40  ; $A859
    .byte $09,$0C,$DC,$40,$19,$0C,$DD,$40,$11,$0C,$DE,$40,$09,$14,$E2,$40  ; $A869
    .byte $19,$14,$E3,$40,$11,$14,$E4,$40,$09,$FF,$0A,$DA,$41,$1C,$09,$DB  ; $A879
    .byte $41,$14,$04,$D6,$40,$19,$04,$D7,$40,$11,$04,$D9,$40,$09,$0C,$DC  ; $A889
    .byte $40,$19,$0C,$DD,$40,$11,$0C,$DF,$40,$09,$14,$E2,$40,$19,$14,$E3  ; $A899
    .byte $40,$11,$14,$E4,$40,$09,$FF,$08,$00,$00,$0D,$00,$0B,$80,$44,$00  ; $A8A9
    .byte $00,$20,$9E,$00,$00,$80,$20,$00,$60,$08,$02,$80,$00,$00,$00,$22  ; $A8B9
    .byte $10,$00,$00,$00,$42,$20,$80,$02,$02,$80,$00,$20,$02,$00,$3A,$08  ; $A8C9
    .byte $00,$00,$10,$A0,$04,$88,$C0,$00,$02,$00,$11,$28,$B0,$0A,$0A,$08  ; $A8D9
    .byte $40,$02,$08,$20,$01,$08,$60,$0A,$00,$00,$48,$00,$01,$00,$80,$02  ; $A8E9
    .byte $30,$00,$00,$02,$AC,$80,$11,$00,$00,$82,$00,$20,$9C,$08,$00,$20  ; $A8F9
    .byte $00,$80,$32,$00,$20,$02,$01,$00,$02,$80,$80,$00,$22,$80,$44,$00  ; $A909
    .byte $21,$00,$29,$20,$08,$00,$00,$00,$01,$08,$00,$00,$20,$80,$10,$28  ; $A919
    .byte $00,$02,$98,$02,$08,$00,$02,$80,$2C,$20,$50,$22,$06,$20,$10,$08  ; $A929
    .byte $14,$28,$04,$00,$01,$02,$00,$00,$A0,$00,$00,$80,$01,$00,$00,$00  ; $A939
    .byte $00,$00,$20,$00,$1C,$00,$04,$00,$10,$00,$04,$02,$02,$02,$00,$00  ; $A949
    .byte $20,$20,$00,$00,$11,$22,$04,$00,$08,$20,$08,$00,$29,$80,$61,$00  ; $A959
    .byte $00,$00,$48,$00,$21,$08,$40,$08,$40,$18,$32,$82,$00,$20,$01,$20  ; $A969
    .byte $20,$00,$31,$08,$05,$A0,$18,$00,$04,$02,$00,$00,$40,$22,$41,$20  ; $A979
    .byte $20,$00,$04,$00,$60,$A8,$08,$80,$00,$A2,$80,$20,$80,$00,$00,$2A  ; $A989
    .byte $20,$00,$00,$80,$04,$22,$14,$00,$20,$00,$05,$88,$00,$20,$22,$0A  ; $A999
    .byte $00,$02,$11,$82,$11,$00,$02,$00,$00,$20,$00,$20,$62,$00,$00,$02  ; $A9A9
    .byte $00,$00,$88,$00,$40,$08,$00,$22,$04,$00,$01,$02,$B0,$00,$0D,$80  ; $A9B9
    .byte $B0,$28,$81,$20,$48,$80,$80,$00,$41,$00,$80,$02,$2D,$02,$A0,$02  ; $A9C9
    .byte $10,$08,$22,$20,$01,$28,$00,$20,$04,$00,$0C,$22,$F0,$30,$10,$08  ; $A9D9
    .byte $04,$00,$49,$00,$80,$08,$00,$00,$2A,$0A,$56,$80,$09,$20,$5C,$00  ; $A9E9
    .byte $A8,$C2,$59,$02,$60,$00,$15,$18,$19,$1A,$1B,$00,$01,$02,$03,$04  ; $A9F9
    .byte $1D,$05,$06,$07,$08,$17,$09,$0A,$0B,$0C,$1C,$0D,$0E,$0F,$10,$11  ; $AA09
    .byte $12,$13,$14,$15,$16,$80,$04,$00,$00,$80,$2C,$20,$10,$02,$00,$00  ; $AA19
    .byte $04,$02,$00,$02,$00,$20,$21,$1B,$12,$12,$25,$20,$00,$20,$83,$08  ; $AA29
    .byte $08,$00,$90,$90,$02,$20,$30,$28,$20,$62,$80,$A4,$40,$65,$80,$A0  ; $AA39
    .byte $20,$20,$00,$20,$A0,$08,$10,$0A,$14,$00,$01,$08,$00,$2A,$80,$00  ; $AA49
    .byte $02,$00,$09,$80,$40,$00,$02,$04,$00,$16,$00,$03,$01,$03,$01,$33  ; $AA59
    .byte $01,$09,$01,$33,$01,$02,$01,$0B,$01,$00,$02,$27,$02,$00,$40,$20  ; $AA69
    .byte $01,$22,$10,$00,$20,$02,$02,$4C,$4E,$0F,$20,$10,$00,$0F,$10,$00  ; $AA79
    .byte $07,$0F,$36,$27,$07,$0F,$31,$21,$11,$82,$83,$00,$00,$0F,$31,$11  ; $AA89
    .byte $00,$0F,$31,$15,$17,$0F,$22,$12,$12,$0F,$20,$10,$17,$84,$85,$86  ; $AA99
    .byte $00,$0F,$31,$11,$00,$0F,$31,$15,$17,$0F,$22,$12,$12,$0F,$2C,$0B  ; $AAA9
    .byte $09,$84,$85,$86,$00,$0F,$31,$11,$00,$0F,$31,$15,$17,$0F,$22,$12  ; $AAB9
    .byte $12,$0F,$31,$21,$11,$84,$85,$86,$00,$80,$0B,$00,$20,$08,$09,$08  ; $AAC9
    .byte $00,$00,$01,$20,$40,$20,$28,$00,$10,$00,$24,$80,$48,$02,$40,$08  ; $AAD9
    .byte $08,$80,$40,$20,$12,$08,$01,$06,$09,$00,$23,$A0,$11,$8A,$00,$14  ; $AAE9
    .byte $1C,$FF,$69,$A0,$66,$20,$23,$01,$02,$02,$02,$03,$03,$03,$04,$04  ; $AAF9
    .byte $04,$05,$05,$06,$06,$06,$07,$07,$07,$08,$08,$08,$09,$09,$0A,$0A  ; $AB09
    .byte $0B,$0E,$0F,$10,$10,$10,$12,$12,$12,$13,$15,$15,$16,$16,$16,$16  ; $AB19
    .byte $17,$17,$17,$17,$17,$18,$18,$18,$18,$18,$19,$19,$19,$19,$19,$19  ; $AB29
    .byte $1A,$1A,$1B,$1D,$FF,$00,$48,$00,$00,$80,$20,$02,$00,$00,$2A,$28  ; $AB39
    .byte $2A,$00,$02,$00,$00,$00,$82,$00,$02,$80,$86,$02,$14,$00,$00,$00  ; $AB49
    .byte $40,$80,$06,$02,$22,$8A,$60,$00,$04,$22,$10,$20,$C0,$08,$84,$00  ; $AB59
    .byte $21,$04,$00,$02,$00,$88,$C5,$00,$02,$A2,$11,$00,$01,$08,$64,$00  ; $AB69
    .byte $10,$00,$90,$00,$20,$02,$10,$00,$0A,$00,$01,$00,$0E,$20,$70,$00  ; $AB79
    .byte $02,$00,$10,$00,$02,$20,$40,$08,$15,$02,$50,$00,$30,$00,$80,$20  ; $AB89
    .byte $1C,$A0,$00,$08,$00,$82,$00,$00,$08,$80,$0C,$00,$04,$00,$80,$20  ; $AB99
    .byte $00,$00,$00,$08,$00,$02,$08,$08,$0A,$00,$00,$08,$4A,$80,$00,$00  ; $ABA9
    .byte $00,$80,$51,$00,$04,$00,$60,$23,$3C,$00,$00,$0A,$40,$A2,$10,$20  ; $ABB9
    .byte $00,$00,$80,$00,$80,$00,$E5,$08,$13,$20,$12,$20,$51,$00,$41,$28  ; $ABC9
    .byte $00,$08,$10,$82,$00,$02,$11,$00,$00,$0A,$41,$02,$C0,$80,$16,$00  ; $ABD9
    .byte $80,$20,$02,$00,$20,$82,$17,$00,$0E,$00,$34,$20,$40,$02,$44,$82  ; $ABE9
    .byte $B2,$08,$E0,$08,$20,$00,$30,$58,$18,$34,$B8,$28,$78,$88,$28,$48  ; $ABF9
    .byte $A8,$48,$A8,$68,$88,$98,$18,$68,$C8,$38,$58,$88,$80,$80,$48,$B8  ; $AC09
    .byte $90,$30,$E8,$68,$C0,$D8,$18,$20,$D8,$40,$F0,$F8,$98,$A8,$F0,$F8  ; $AC19
    .byte $08,$78,$88,$C8,$F8,$68,$88,$C8,$D8,$F8,$48,$78,$A8,$C8,$E7,$E8  ; $AC29
    .byte $2C,$4C,$A8,$D8,$FF,$01,$00,$08,$00,$00,$00,$00,$00,$41,$00,$03  ; $AC39
    .byte $01,$00,$00,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AC49
    .byte $10,$00,$00,$04,$10,$00,$00,$08,$00,$18,$00,$40,$00,$08,$10,$20  ; $AC59
    .byte $40,$1A,$00,$00,$00,$0C,$00,$44,$00,$20,$00,$20,$00,$00,$41,$08  ; $AC69
    .byte $00,$00,$00,$00,$00,$00,$00,$20,$00,$00,$00,$00,$00,$00,$00,$00  ; $AC79
    .byte $00,$00,$00,$00,$41,$00,$04,$00,$00,$00,$01,$00,$00,$00,$00,$00  ; $AC89
    .byte $00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AC99
    .byte $01,$40,$00,$00,$00,$00,$00,$00,$00,$40,$40,$30,$00,$00,$10,$01  ; $ACA9
    .byte $00,$80,$00,$00,$00,$48,$00,$00,$00,$00,$04,$00,$00,$02,$00,$08  ; $ACB9
    .byte $00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$10,$10,$00,$20,$00,$00  ; $ACC9
    .byte $00,$28,$00,$00,$00,$00,$00,$00,$00,$10,$00,$44,$00,$80,$00,$84  ; $ACD9
    .byte $00,$00,$10,$08,$00,$00,$00,$00,$10,$49,$04,$02,$40,$14,$00,$00  ; $ACE9
    .byte $11,$40,$00,$00,$00,$01,$00,$38,$58,$B4,$48,$58,$A4,$38,$68,$A8  ; $ACF9
    .byte $94,$98,$68,$88,$A8,$B4,$58,$78,$98,$68,$48,$94,$00,$B0,$38,$58  ; $AD09
    .byte $47,$48,$18,$18,$9C,$18,$18,$9C,$18,$48,$D8,$C8,$C8,$18,$D8,$C8  ; $AD19
    .byte $88,$C8,$18,$18,$C8,$C8,$18,$C8,$88,$18,$18,$C8,$C8,$18,$C8,$38  ; $AD29
    .byte $58,$78,$A8,$00,$FF,$00,$00,$04,$04,$00,$10,$00,$00,$00,$00,$80  ; $AD39
    .byte $00,$0C,$10,$00,$00,$00,$00,$80,$00,$50,$00,$00,$00,$04,$00,$00  ; $AD49
    .byte $04,$80,$00,$00,$00,$00,$00,$00,$00,$44,$40,$00,$00,$80,$00,$00  ; $AD59
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$00,$00,$44,$03,$04,$40  ; $AD69
    .byte $00,$00,$00,$02,$00,$00,$41,$00,$00,$00,$00,$10,$00,$00,$00,$00  ; $AD79
    .byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AD89
    .byte $00,$00,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AD99
    .byte $00,$00,$00,$00,$00,$00,$00,$01,$01,$00,$00,$00,$04,$00,$00,$00  ; $ADA9
    .byte $00,$00,$04,$00,$10,$4C,$00,$04,$00,$40,$00,$00,$40,$01,$00,$00  ; $ADB9
    .byte $00,$00,$00,$80,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00  ; $ADC9
    .byte $00,$00,$00,$00,$00,$10,$00,$08,$10,$10,$00,$20,$00,$00,$00,$04  ; $ADD9
    .byte $00,$80,$00,$40,$00,$00,$00,$00,$01,$00,$00,$00,$10,$00,$00,$50  ; $ADE9
    .byte $00,$80,$00,$00,$00,$00,$00,$18,$18,$3B,$18,$18,$3B,$18,$18,$18  ; $ADF9
    .byte $3B,$18,$18,$18,$18,$3B,$18,$18,$18,$18,$18,$3B,$78,$74,$55,$50  ; $AE09
    .byte $56,$52,$08,$08,$1C,$08,$08,$1C,$08,$50,$55,$1A,$1A,$08,$54,$1A  ; $AE19
    .byte $52,$1A,$08,$08,$1A,$1A,$08,$1A,$52,$08,$08,$1A,$1A,$08,$1A,$54  ; $AE29
    .byte $26,$26,$13,$49,$FF,$08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AE39
    .byte $00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$88  ; $AE49
    .byte $10,$20,$00,$08,$04,$04,$00,$00,$00,$00,$00,$20,$00,$40,$00,$20  ; $AE59
    .byte $00,$90,$00,$00,$40,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00  ; $AE69
    .byte $01,$00,$00,$08,$01,$18,$00,$00,$00,$00,$00,$80,$00,$20,$10,$00  ; $AE79
    .byte $00,$00,$00,$80,$00,$00,$10,$00,$00,$00,$00,$00,$00,$03,$00,$00  ; $AE89
    .byte $00,$00,$40,$00,$40,$00,$00,$00,$00,$00,$00,$08,$00,$20,$00,$00  ; $AE99
    .byte $00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$00,$00  ; $AEA9
    .byte $40,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$00,$00,$00,$00,$00  ; $AEB9
    .byte $00,$00,$00,$00,$00,$04,$00,$00,$01,$00,$00,$A0,$00,$00,$00,$80  ; $AEC9
    .byte $00,$00,$00,$00,$00,$01,$00,$01,$00,$10,$01,$00,$00,$20,$00,$00  ; $AED9
    .byte $10,$00,$00,$00,$00,$10,$00,$28,$00,$09,$00,$00,$00,$01,$41,$20  ; $AEE9
    .byte $04,$15,$00,$00,$10,$83,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AEF9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AF09
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01  ; $AF19
    .byte $01,$00,$00,$00,$02,$00,$03,$04,$05,$02,$06,$07,$08,$09,$0A,$0B  ; $AF29
    .byte $0C,$0C,$0D,$0B,$0D,$0E,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AF39
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AF49
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AF59
    .byte $00,$01,$01,$03,$00,$10,$00,$00,$02,$11,$12,$13,$02,$0C,$00,$00  ; $AF69
    .byte $0C,$0D,$0B,$0B,$14,$15,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AF79
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AF89
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10  ; $AF99
    .byte $03,$00,$00,$00,$00,$01,$10,$0C,$16,$09,$02,$01,$00,$17,$18,$0C  ; $AFA9
    .byte $19,$0E,$15,$0A,$00,$0C,$1A,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AFB9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AFC9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AFD9
    .byte $03,$03,$00,$00,$01,$07,$00,$00,$17,$13,$02,$01,$17,$0B,$00,$00  ; $AFE9
    .byte $0C,$0B,$14,$0F,$0C,$0B,$00,$00,$00,$00,$00,$00,$00,$00,$1B,$00  ; $AFF9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B009
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B019
    .byte $00,$1C,$01,$01,$00,$00,$00,$10,$1D,$1E,$04,$11,$07,$10,$02,$0C  ; $B029
    .byte $0D,$0B,$0B,$0D,$0B,$14,$15,$1F,$20,$21,$22,$22,$23,$1F,$20,$24  ; $B039
    .byte $25,$22,$22,$22,$26,$24,$25,$1F,$20,$21,$27,$22,$22,$28,$20,$24  ; $B049
    .byte $25,$26,$00,$27,$26,$24,$25,$1F,$29,$00,$00,$2A,$22,$2B,$2C,$24  ; $B059
    .byte $25,$26,$00,$2D,$22,$22,$22,$1F,$20,$2E,$1F,$20,$2E,$1F,$20,$24  ; $B069
    .byte $25,$26,$24,$25,$26,$24,$25,$2E,$1F,$20,$2E,$1F,$20,$2E,$1F,$26  ; $B079
    .byte $24,$25,$26,$22,$2F,$00,$30,$2E,$31,$22,$32,$33,$34,$30,$35,$26  ; $B089
    .byte $24,$36,$37,$38,$38,$39,$38,$22,$22,$3A,$3B,$38,$38,$38,$3C,$22  ; $B099
    .byte $22,$2B,$37,$24,$25,$26,$24,$2E,$1F,$20,$2E,$1F,$20,$2E,$1F,$26  ; $B0A9
    .byte $24,$25,$26,$24,$25,$26,$24,$20,$2E,$1F,$20,$2E,$1F,$3D,$23,$25  ; $B0B9
    .byte $26,$24,$25,$26,$00,$3E,$26,$3F,$2E,$1F,$29,$40,$00,$3E,$23,$38  ; $B0C9
    .byte $38,$24,$38,$41,$00,$2C,$26,$00,$38,$38,$38,$00,$42,$22,$23,$25  ; $B0D9
    .byte $26,$24,$25,$26,$24,$25,$26,$20,$2E,$1F,$20,$2E,$1F,$20,$2E,$25  ; $B0E9
    .byte $26,$24,$25,$26,$24,$25,$26,$29,$43,$1F,$20,$2E,$1F,$20,$2E,$25  ; $B0F9
    .byte $44,$39,$22,$2B,$2F,$22,$26,$29,$45,$39,$46,$22,$2B,$2D,$23,$25  ; $B109
    .byte $44,$47,$2A,$22,$22,$22,$26,$29,$38,$47,$00,$22,$22,$48,$23,$25  ; $B119
    .byte $38,$38,$47,$46,$49,$00,$26,$20,$2E,$1F,$20,$2E,$1F,$4A,$23,$4B  ; $B129
    .byte $4C,$4D,$4B,$4C,$4D,$4E,$4C,$1F,$29,$2F,$22,$36,$00,$00,$2D,$49  ; $B139
    .byte $25,$00,$27,$22,$2B,$2C,$22,$00,$4F,$00,$2A,$22,$22,$22,$22,$24  ; $B149
    .byte $25,$00,$2D,$22,$22,$22,$22,$1F,$29,$2D,$22,$49,$22,$22,$36,$24  ; $B159
    .byte $25,$22,$49,$46,$22,$22,$00,$1F,$20,$2E,$1F,$20,$2E,$1F,$20,$24  ; $B169
    .byte $25,$26,$24,$25,$26,$24,$25,$22,$22,$49,$00,$00,$00,$27,$22,$22  ; $B179
    .byte $48,$00,$00,$00,$00,$00,$2A,$36,$00,$00,$00,$00,$00,$00,$00,$00  ; $B189
    .byte $00,$00,$00,$00,$50,$51,$00,$00,$00,$00,$00,$00,$52,$53,$00,$00  ; $B199
    .byte $00,$00,$00,$00,$54,$55,$00,$2E,$1F,$20,$2E,$1F,$20,$2E,$1F,$26  ; $B1A9
    .byte $24,$25,$26,$24,$25,$26,$24,$22,$23,$1F,$29,$22,$22,$22,$48,$27  ; $B1B9
    .byte $56,$24,$22,$22,$49,$00,$00,$2A,$57,$22,$22,$36,$00,$00,$00,$00  ; $B1C9
    .byte $26,$58,$22,$00,$00,$00,$00,$59,$23,$31,$48,$00,$00,$00,$00,$25  ; $B1D9
    .byte $26,$24,$00,$00,$00,$00,$00,$20,$2E,$1F,$20,$2E,$1F,$20,$2E,$25  ; $B1E9
    .byte $26,$24,$25,$26,$24,$25,$26,$00,$2F,$22,$3A,$2D,$22,$22,$3F,$00  ; $B1F9
    .byte $00,$46,$22,$22,$49,$27,$25,$00,$00,$00,$2A,$22,$2B,$3A,$3F,$50  ; $B209
    .byte $51,$00,$00,$27,$22,$22,$25,$52,$53,$00,$00,$2C,$22,$48,$3F,$54  ; $B219
    .byte $55,$00,$2C,$2D,$26,$00,$25,$1F,$20,$2E,$1F,$20,$21,$00,$3F,$4D  ; $B229
    .byte $4B,$4C,$4D,$4B,$4C,$00,$4C,$21,$00,$23,$1F,$20,$2E,$5A,$49,$26  ; $B239
    .byte $00,$2F,$22,$22,$22,$49,$00,$21,$00,$00,$00,$2F,$00,$00,$00,$26  ; $B249
    .byte $2B,$00,$00,$00,$00,$00,$00,$21,$22,$36,$00,$00,$00,$00,$00,$26  ; $B259
    .byte $24,$25,$26,$5B,$5B,$5B,$5B,$2E,$1F,$20,$21,$5C,$5D,$5E,$5C,$26  ; $B269
    .byte $24,$25,$26,$24,$25,$26,$24,$00,$00,$27,$22,$2B,$2C,$22,$49,$00  ; $B279
    .byte $00,$2A,$22,$22,$49,$48,$00,$00,$00,$00,$2A,$48,$00,$00,$00,$00  ; $B289
    .byte $00,$00,$00,$00,$00,$5F,$00,$00,$60,$4F,$00,$61,$00,$00,$00,$5B  ; $B299
    .byte $5B,$5B,$5B,$5B,$5B,$5B,$5B,$62,$62,$62,$62,$62,$62,$62,$62,$62  ; $B2A9
    .byte $62,$62,$62,$62,$62,$62,$25,$22,$22,$22,$22,$22,$49,$49,$2F,$00  ; $B2B9
    .byte $27,$22,$27,$49,$48,$00,$00,$63,$00,$48,$00,$00,$00,$00,$00,$00  ; $B2C9
    .byte $00,$59,$00,$64,$00,$65,$00,$66,$00,$00,$00,$00,$00,$00,$00,$5B  ; $B2D9
    .byte $5B,$5B,$5B,$5B,$5B,$5B,$5B,$62,$62,$62,$62,$62,$62,$62,$62,$62  ; $B2E9
    .byte $62,$62,$62,$62,$62,$62,$26,$22,$22,$67,$1F,$20,$2E,$1F,$20,$00  ; $B2F9
    .byte $2F,$68,$25,$22,$49,$49,$00,$69,$00,$5F,$00,$2A,$00,$00,$00,$00  ; $B309
    .byte $00,$00,$00,$00,$6A,$00,$6B,$5F,$00,$65,$00,$6C,$00,$00,$00,$5B  ; $B319
    .byte $5B,$5B,$5B,$5B,$5B,$5B,$5B,$62,$62,$62,$62,$62,$62,$62,$62,$62  ; $B329
    .byte $62,$62,$62,$62,$62,$62,$62,$2E,$1F,$20,$2E,$1F,$20,$2E,$1F,$00  ; $B339
    .byte $00,$2F,$22,$22,$25,$22,$22,$00,$00,$00,$00,$27,$22,$22,$22,$00  ; $B349
    .byte $4F,$6C,$00,$00,$2F,$48,$48,$00,$00,$00,$6D,$00,$66,$63,$00,$5B  ; $B359
    .byte $5B,$5B,$5B,$5B,$5B,$5B,$5B,$62,$62,$62,$62,$62,$62,$62,$62,$62  ; $B369
    .byte $62,$62,$62,$62,$62,$62,$62,$20,$2E,$1F,$20,$2E,$31,$6E,$2E,$22  ; $B379
    .byte $22,$22,$49,$00,$00,$6F,$00,$22,$27,$48,$00,$00,$00,$00,$6C,$00  ; $B389
    .byte $00,$00,$00,$00,$00,$70,$00,$71,$65,$00,$63,$00,$71,$00,$00,$5B  ; $B399
    .byte $5B,$5B,$5B,$5B,$5B,$5B,$5B,$62,$62,$62,$62,$62,$62,$62,$62,$62  ; $B3A9
    .byte $62,$62,$62,$62,$62,$62,$62,$29,$43,$1F,$20,$2E,$1F,$20,$2E,$25  ; $B3B9
    .byte $00,$27,$22,$25,$24,$25,$26,$29,$00,$00,$27,$22,$28,$20,$2E,$25  ; $B3C9
    .byte $26,$42,$22,$22,$22,$25,$26,$20,$2E,$31,$22,$49,$2F,$22,$23,$25  ; $B3D9
    .byte $26,$24,$25,$00,$00,$00,$26,$20,$2E,$1F,$20,$2E,$31,$72,$2E,$4B  ; $B3E9
    .byte $4C,$4D,$4B,$4C,$4D,$73,$4C,$20,$2E,$1F,$20,$2E,$1F,$20,$2E,$25  ; $B3F9
    .byte $22,$2B,$3A,$27,$3A,$25,$26,$29,$00,$27,$22,$22,$22,$3F,$2E,$25  ; $B409
    .byte $74,$24,$22,$22,$49,$25,$26,$29,$43,$31,$27,$22,$2B,$00,$75,$25  ; $B419
    .byte $76,$24,$00,$27,$22,$2B,$75,$29,$43,$1F,$20,$2E,$1F,$20,$2E,$4B  ; $B429
    .byte $76,$4D,$4B,$4C,$4D,$4B,$4C,$1F,$20,$2E,$1F,$20,$2E,$1F,$20,$24  ; $B439
    .byte $25,$26,$24,$25,$26,$24,$25,$1F,$20,$2E,$1F,$20,$2E,$1F,$20,$24  ; $B449
    .byte $25,$26,$24,$25,$26,$24,$25,$77,$2D,$22,$27,$22,$36,$78,$75,$79  ; $B459
    .byte $22,$48,$2A,$22,$22,$48,$75,$1F,$20,$2E,$1F,$20,$2E,$1F,$20,$24  ; $B469
    .byte $25,$26,$24,$25,$26,$24,$25,$2E,$1F,$20,$2E,$1F,$20,$2E,$1F,$7A  ; $B479
    .byte $7B,$7B,$7B,$7B,$7B,$7B,$7C,$7D,$7E,$7E,$7E,$7E,$7E,$7E,$7F,$80  ; $B489
    .byte $7E,$7E,$7E,$7E,$7E,$7E,$81,$82,$7E,$7E,$7E,$7E,$7E,$7E,$7F,$83  ; $B499
    .byte $7E,$7E,$7E,$7E,$7E,$7E,$81,$2E,$1F,$20,$2E,$1F,$20,$2E,$1F,$26  ; $B4A9
    .byte $24,$25,$26,$24,$25,$26,$24,$20,$2E,$1F,$20,$2E,$1F,$20,$2E,$25  ; $B4B9
    .byte $2A,$22,$2B,$37,$38,$47,$00,$29,$6B,$22,$49,$30,$38,$38,$40,$25  ; $B4C9
    .byte $22,$22,$00,$35,$38,$25,$26,$29,$2A,$22,$36,$84,$28,$20,$2E,$25  ; $B4D9
    .byte $00,$46,$22,$26,$24,$25,$26,$29,$85,$1F,$20,$2E,$1F,$20,$2E,$4B  ; $B4E9
    .byte $76,$4D,$4B,$4C,$4D,$4B,$4C,$00,$86,$00,$00,$87,$86,$00,$00,$00  ; $B4F9
    .byte $88,$00,$89,$8A,$00,$87,$00,$8A,$00,$8B,$00,$00,$00,$00,$00,$00  ; $B509
    .byte $00,$88,$8A,$00,$89,$86,$00,$8C,$00,$00,$00,$8D,$00,$00,$00,$10  ; $B519
    .byte $01,$10,$01,$10,$10,$03,$00,$0C,$0F,$14,$04,$0C,$15,$05,$02,$0C  ; $B529
    .byte $8E,$19,$0B,$0C,$0B,$0C,$0C,$8F,$00,$00,$00,$00,$00,$8F,$00,$00  ; $B539
    .byte $90,$89,$91,$92,$93,$00,$00,$8A,$00,$00,$94,$95,$96,$86,$8A,$00  ; $B549
    .byte $8B,$97,$98,$99,$9A,$00,$00,$89,$00,$8A,$00,$00,$8A,$89,$00,$00  ; $B559
    .byte $00,$1C,$01,$01,$00,$03,$00,$01,$10,$0C,$0F,$05,$01,$9B,$02,$14  ; $B569
    .byte $15,$0C,$9C,$0C,$0A,$0B,$0C,$00,$00,$00,$00,$88,$00,$00,$00,$8B  ; $B579
    .byte $86,$8B,$00,$00,$8A,$88,$00,$8A,$00,$00,$86,$90,$00,$00,$89,$00  ; $B589
    .byte $88,$86,$00,$00,$88,$9D,$00,$00,$00,$00,$8A,$00,$00,$00,$00,$00  ; $B599
    .byte $00,$1C,$03,$03,$00,$00,$03,$06,$9E,$0C,$16,$9B,$10,$02,$9F,$0D  ; $B5A9
    .byte $0B,$0C,$0D,$0B,$0C,$0C,$0E,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B5B9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B5C9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10  ; $B5D9
    .byte $01,$10,$03,$00,$1C,$03,$02,$15,$14,$15,$9F,$00,$0C,$11,$1E,$0B  ; $B5E9
    .byte $0D,$0B,$0E,$00,$0C,$0D,$0B,$1F,$20,$2E,$1F,$20,$21,$00,$3F,$24  ; $B5F9
    .byte $49,$27,$22,$27,$49,$00,$25,$31,$A0,$A1,$2B,$00,$00,$00,$3F,$24  ; $B609
    .byte $27,$22,$22,$48,$00,$24,$25,$31,$2A,$49,$00,$00,$23,$1F,$20,$24  ; $B619
    .byte $00,$00,$00,$25,$26,$24,$25,$31,$00,$23,$1F,$20,$2E,$1F,$20,$4D  ; $B629
    .byte $00,$4C,$4D,$4B,$4C,$4D,$4C,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B639
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B649
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B659
    .byte $00,$00,$A2,$A3,$00,$00,$00,$01,$09,$02,$A4,$A5,$06,$07,$02,$0A  ; $B669
    .byte $0E,$0C,$A4,$A5,$0D,$0B,$0C,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B679
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B689
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B699
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B6A9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B6B9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B6C9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B6D9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B6E9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$70,$71,$78,$79,$70  ; $B6F9
    .byte $72,$78,$7A,$00,$00,$70,$71,$71,$79,$79,$7B,$78,$7B,$78,$7A,$70  ; $B709
    .byte $71,$78,$70,$70,$72,$71,$7A,$78,$7A,$78,$70,$70,$71,$71,$79,$78  ; $B719
    .byte $79,$78,$79,$79,$7A,$79,$7A,$78,$7A,$78,$7A,$78,$78,$78,$78,$79  ; $B729
    .byte $79,$79,$79,$71,$79,$79,$79,$70,$71,$78,$7B,$78,$7B,$78,$70,$78  ; $B739
    .byte $79,$71,$7B,$71,$7B,$79,$7A,$78,$70,$78,$78,$71,$7A,$79,$7A,$78  ; $B749
    .byte $79,$78,$70,$78,$79,$78,$7B,$72,$7A,$7A,$7A,$71,$78,$79,$78,$7A  ; $B759
    .byte $7A,$7A,$7A,$60,$60,$00,$00,$00,$00,$70,$72,$70,$72,$78,$70,$78  ; $B769
    .byte $7A,$71,$7A,$11,$12,$19,$1A,$13,$14,$1B,$1C,$15,$16,$1D,$16,$20  ; $B779
    .byte $21,$28,$29,$1F,$10,$1F,$18,$14,$15,$1C,$1D,$10,$11,$18,$19,$12  ; $B789
    .byte $13,$1A,$1B,$20,$21,$00,$29,$16,$12,$16,$1A,$13,$1F,$1B,$1F,$00  ; $B799
    .byte $21,$00,$00,$20,$00,$28,$29,$00,$00,$00,$29,$00,$21,$28,$29,$15  ; $B7A9
    .byte $10,$1D,$18,$20,$21,$00,$00,$00,$00,$00,$09,$11,$17,$19,$17,$1F  ; $B7B9
    .byte $16,$1F,$16,$00,$00,$16,$17,$09,$00,$09,$00,$00,$09,$09,$09,$20  ; $B7C9
    .byte $00,$28,$00,$00,$09,$00,$00,$09,$09,$09,$09,$09,$09,$09,$00,$00  ; $B7D9
    .byte $00,$28,$00,$09,$09,$00,$09,$09,$09,$16,$17,$13,$07,$1B,$07,$00  ; $B7E9
    .byte $07,$00,$07,$17,$14,$17,$1C,$00,$00,$09,$00,$09,$00,$00,$00,$00  ; $B7F9
    .byte $00,$28,$29,$07,$10,$07,$18,$07,$09,$07,$09,$07,$09,$07,$00,$00  ; $B809
    .byte $21,$00,$29,$09,$00,$09,$09,$20,$00,$00,$00,$20,$21,$28,$00,$13  ; $B819
    .byte $0F,$1B,$07,$16,$16,$16,$16,$17,$17,$17,$17,$1F,$1F,$1F,$1F,$16  ; $B829
    .byte $07,$16,$07,$17,$1F,$00,$00,$00,$00,$00,$3A,$00,$00,$3B,$00,$24  ; $B839
    .byte $25,$2C,$2D,$26,$27,$2E,$2F,$34,$35,$3C,$3D,$36,$37,$3E,$3F,$20  ; $B849
    .byte $17,$28,$17,$20,$16,$00,$29,$20,$21,$1F,$1F,$00,$00,$17,$1F,$11  ; $B859
    .byte $21,$19,$29,$00,$00,$22,$23,$2A,$2B,$16,$17,$2A,$2B,$17,$1F,$2A  ; $B869
    .byte $2B,$1F,$16,$00,$00,$17,$00,$1F,$16,$00,$00,$00,$16,$00,$00,$2A  ; $B879
    .byte $2B,$2A,$2B,$00,$00,$00,$16,$16,$17,$00,$00,$00,$1F,$00,$00,$1F  ; $B889
    .byte $00,$00,$00,$20,$10,$28,$18,$20,$1F,$28,$1F,$00,$00,$16,$00,$00  ; $B899
    .byte $00,$00,$17,$00,$00,$1F,$16,$16,$00,$00,$00,$00,$17,$00,$00,$07  ; $B8A9
    .byte $14,$07,$1C,$07,$00,$00,$00,$00,$00,$00,$1F,$17,$00,$00,$00,$0F  ; $B8B9
    .byte $14,$07,$1C,$07,$16,$07,$16,$0F,$17,$07,$17,$00,$06,$00,$06,$07  ; $B8C9
    .byte $17,$07,$17,$05,$00,$05,$00,$00,$21,$28,$00,$05,$21,$05,$29,$17  ; $B8D9
    .byte $31,$17,$30,$31,$31,$30,$30,$31,$1F,$30,$1F,$15,$30,$1D,$30,$30  ; $B8E9
    .byte $30,$30,$30,$30,$12,$30,$1A,$17,$30,$17,$30,$30,$1F,$30,$1F,$04  ; $B8F9
    .byte $30,$03,$30,$03,$30,$03,$30,$09,$09,$00,$00,$0F,$10,$07,$18,$00  ; $B909
    .byte $00,$00,$43,$00,$00,$00,$41,$00,$00,$42,$00,$00,$42,$00,$00,$43  ; $B919
    .byte $00,$00,$00,$41,$00,$00,$00,$00,$43,$00,$00,$00,$41,$00,$00,$79  ; $B929
    .byte $70,$79,$78,$00,$00,$00,$42,$43,$00,$00,$43,$00,$00,$00,$4A,$00  ; $B939
    .byte $44,$4B,$4C,$45,$46,$4D,$4E,$51,$52,$59,$5A,$53,$54,$5B,$5C,$55  ; $B949
    .byte $56,$5D,$00,$00,$00,$00,$68,$61,$62,$69,$6A,$63,$64,$6B,$00,$65  ; $B959
    .byte $00,$00,$00,$78,$7B,$71,$7A,$79,$7B,$79,$7A,$41,$00,$00,$43,$70  ; $B969
    .byte $71,$71,$7B,$78,$79,$71,$79,$00,$00,$28,$16,$20,$21,$17,$29,$00  ; $B979
    .byte $00,$74,$75,$00,$00,$76,$77,$7C,$7D,$7C,$7D,$7E,$7F,$7E,$7F,$20  ; $B989
    .byte $06,$00,$06,$16,$17,$28,$29,$1F,$00,$1F,$00,$11,$00,$19,$00,$00  ; $B999
    .byte $14,$00,$1C,$00,$00,$10,$11,$00,$00,$12,$13,$00,$00,$14,$15,$18  ; $B9A9
    .byte $19,$17,$14,$1A,$1B,$15,$10,$1C,$1D,$11,$17,$17,$1C,$10,$11,$1D  ; $B9B9
    .byte $18,$12,$13,$19,$17,$14,$15,$00,$00,$09,$09,$00,$16,$00,$16,$00  ; $B9C9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B9D9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B9E9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B9F9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BA09
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BA19
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BA29
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BA39
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BA49
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BA59
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BA69
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BA79
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BA89
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BA99
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BAA9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BAB9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BAC9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BAD9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BAE9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$13,$02,$00,$14,$04,$22  ; $BAF9
    .byte $24,$01,$01,$01,$01,$01,$04,$08,$0A,$08,$0A,$0C,$0E,$06,$06,$28  ; $BB09
    .byte $2A,$28,$2A,$2C,$2E,$00,$26,$4C,$4E,$40,$42,$00,$8A,$8C,$00,$6C  ; $BB19
    .byte $6E,$60,$62,$00,$AA,$AC,$AE,$13,$02,$00,$00,$C8,$CA,$CC,$CE,$00  ; $BB29
    .byte $00,$00,$8F,$E8,$EA,$EC,$EE,$44,$77,$76,$00,$00,$68,$6A,$4B,$44  ; $BB39
    .byte $67,$00,$82,$84,$00,$74,$01,$00,$00,$A0,$A2,$94,$A6,$EB,$01,$00  ; $BB49
    .byte $00,$C0,$C1,$B5,$C6,$01,$01,$00,$B0,$E0,$E2,$E4,$E6,$01,$00,$00  ; $BB59
    .byte $D2,$D5,$E1,$01,$01,$01,$00,$48,$4A,$4A,$01,$E0,$E2,$E4,$E6,$58  ; $BB69
    .byte $5A,$5A,$5A,$F8,$FA,$FC,$FE,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BB79
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BB89
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BB99
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BBA9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BBB9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BBC9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BBD9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BBE9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$12,$03,$00,$15,$05,$23  ; $BBF9
    .byte $25,$01,$65,$01,$01,$01,$05,$09,$0B,$09,$0B,$0D,$0F,$07,$07,$29  ; $BC09
    .byte $2B,$29,$2B,$2D,$2F,$00,$27,$4D,$4F,$41,$43,$89,$8B,$8D,$00,$6D  ; $BC19
    .byte $6F,$61,$63,$A9,$AB,$AD,$00,$12,$03,$00,$00,$C9,$CB,$CD,$CF,$00  ; $BC29
    .byte $00,$88,$00,$E9,$00,$ED,$EF,$44,$00,$00,$00,$00,$69,$6B,$00,$66  ; $BC39
    .byte $44,$81,$83,$85,$00,$75,$00,$01,$80,$A1,$A3,$95,$A7,$00,$00,$01  ; $BC49
    .byte $87,$C1,$B4,$C5,$C7,$01,$00,$00,$B1,$D0,$E3,$E5,$00,$00,$00,$C4  ; $BC59
    .byte $D3,$D6,$00,$01,$01,$00,$00,$49,$4B,$4B,$01,$E1,$E3,$E5,$E7,$59  ; $BC69
    .byte $5B,$57,$47,$F9,$FB,$FD,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BC79
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BC89
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BC99
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BCA9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BCB9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BCC9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BCD9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BCE9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$12,$03,$00,$14,$04,$32  ; $BCF9
    .byte $34,$01,$01,$01,$01,$01,$04,$18,$1A,$18,$1A,$1C,$1E,$16,$16,$38  ; $BD09
    .byte $3A,$38,$3A,$3C,$3E,$00,$36,$5C,$5E,$70,$72,$00,$9A,$9C,$9E,$7C  ; $BD19
    .byte $7E,$70,$72,$B8,$BA,$BC,$BE,$12,$03,$00,$00,$D8,$DA,$DC,$DE,$00  ; $BD29
    .byte $00,$00,$9F,$F8,$FA,$FC,$FE,$44,$00,$00,$00,$00,$78,$7A,$5B,$54  ; $BD39
    .byte $01,$90,$92,$94,$96,$AF,$01,$00,$00,$A0,$B2,$B4,$B6,$00,$01,$00  ; $BD49
    .byte $00,$D0,$D1,$D4,$E5,$01,$00,$00,$C2,$00,$F2,$F4,$00,$01,$00,$00  ; $BD59
    .byte $F0,$F7,$00,$01,$00,$00,$00,$58,$5A,$5A,$00,$F0,$F2,$F4,$F6,$58  ; $BD69
    .byte $5A,$5A,$5A,$F8,$FA,$FC,$FE,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BD79
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BD89
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BD99
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BDA9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BDB9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BDC9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BDD9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BDE9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$13,$02,$00,$15,$05,$33  ; $BDF9
    .byte $35,$01,$01,$01,$01,$01,$05,$19,$1B,$19,$1B,$1D,$1F,$17,$17,$39  ; $BE09
    .byte $3B,$39,$3B,$3D,$3F,$00,$37,$5D,$5F,$71,$73,$99,$9B,$9D,$00,$7D  ; $BE19
    .byte $7F,$71,$73,$B9,$BB,$BD,$BF,$13,$02,$00,$00,$D9,$DB,$DD,$DF,$00  ; $BE29
    .byte $00,$98,$00,$F9,$FB,$FD,$FF,$44,$76,$00,$77,$A8,$79,$7B,$00,$01  ; $BE39
    .byte $01,$91,$93,$95,$97,$00,$00,$01,$86,$A1,$B3,$B5,$B7,$00,$00,$01  ; $BE49
    .byte $A5,$D1,$B5,$E4,$D7,$00,$00,$00,$C3,$F1,$F3,$F5,$00,$00,$00,$E7  ; $BE59
    .byte $F6,$A4,$00,$01,$00,$00,$00,$59,$5B,$47,$00,$F1,$F3,$F5,$F7,$59  ; $BE69
    .byte $5B,$57,$57,$F9,$FB,$FD,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BE79
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BE89
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BE99
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BEA9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BEB9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BEC9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BED9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BEE9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$13,$13,$10,$10,$23,$53  ; $BEF9
    .byte $73,$10,$10,$00,$00,$00,$43,$10,$10,$11,$11,$11,$11,$10,$11,$10  ; $BF09
    .byte $10,$11,$11,$11,$11,$00,$11,$62,$62,$82,$82,$03,$03,$03,$03,$62  ; $BF19
    .byte $62,$82,$82,$03,$03,$03,$03,$03,$03,$00,$00,$03,$03,$03,$03,$00  ; $BF29
    .byte $00,$03,$03,$03,$03,$03,$03,$00,$00,$00,$00,$01,$01,$01,$01,$00  ; $BF39
    .byte $00,$02,$02,$02,$01,$01,$00,$00,$02,$02,$02,$02,$01,$00,$00,$00  ; $BF49
    .byte $01,$02,$02,$01,$01,$00,$00,$10,$01,$01,$01,$01,$01,$00,$00,$01  ; $BF59
    .byte $01,$01,$01,$00,$00,$00,$00,$13,$13,$13,$00,$00,$00,$00,$00,$13  ; $BF69
    .byte $13,$13,$13,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BF79
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BF89
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BF99
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFA9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFB9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFC9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFD9
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFE9
    .byte $00,$00,$00,$00,$00,$00,$00  ; $BFF9
