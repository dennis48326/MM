; PRG 8 KB bank $0B at $A000
.segment "BANK0B"
.org $A000

    .byte $01  ; $A000
    LSR A                        ; $A001  4A
    TAX                          ; $A002  AA
    LDA $A06A,X                  ; $A003  BD 6A A0
    STA $5A                      ; $A006  85 5A
    LDA $A06C,X                  ; $A008  BD 6C A0
    STA $5B                      ; $A00B  85 5B
    LDA $0480                    ; $A00D  AD 80 04
    CMP #$E0                     ; $A010  C9 E0
    BCC loc_0B_A01E              ; $A012  90 0A
    LDA $A06E,X                  ; $A014  BD 6E A0
    STA $5A                      ; $A017  85 5A
    LDA $A070,X                  ; $A019  BD 70 A0
    STA $5B                      ; $A01C  85 5B

loc_0B_A01E:
    LDA #$00                     ; $A01E  A9 00
    STA $1A                      ; $A020  85 1A
    STA $1E                      ; $A022  85 1E
    LDY $A066,X                  ; $A024  BC 66 A0

loc_0B_A027:
    CLC                          ; $A027  18
    LDA $04A0                    ; $A028  AD A0 04
    ADC $5A                      ; $A02B  65 5A
    STA $04A0                    ; $A02D  8D A0 04
    LDA $0480                    ; $A030  AD 80 04
    ADC $5B                      ; $A033  65 5B
    STA $0480                    ; $A035  8D 80 04
    CLC                          ; $A038  18
    LDA $1A                      ; $A039  A5 1A
    ADC $A068,X                  ; $A03B  7D 68 A0
    STA $1A                      ; $A03E  85 1A
    TYA                          ; $A040  98
    PHA                          ; $A041  48
    TXA                          ; $A042  8A
    PHA                          ; $A043  48
    JSR sub_0E_D131              ; $A044  20 31 D1
    JSR sub_0E_C6C4              ; $A047  20 C4 C6
    JSR sub_0E_C01B              ; $A04A  20 1B C0
    PLA                          ; $A04D  68
    TAX                          ; $A04E  AA
    PLA                          ; $A04F  68
    TAY                          ; $A050  A8
    DEY                          ; $A051  88
    BNE loc_0B_A027              ; $A052  D0 D3
    LDA #$18                     ; $A054  A9 18
    STA $0480                    ; $A056  8D 80 04
    LDA #$00                     ; $A059  A9 00
    STA $1E                      ; $A05B  85 1E
    STA $1A                      ; $A05D  85 1A
    STA $0400                    ; $A05F  8D 00 04
    STA $0440                    ; $A062  8D 40 04
    RTS                          ; $A065  60

    .byte $3F,$40,$04,$FC,$00,$00,$01,$FF,$B0,$50,$00,$FF  ; $A066

loc_0B_A072:
    LDA $26                      ; $A072  A5 26
    LSR A                        ; $A074  4A
    TAX                          ; $A075  AA
    LDA $A0CC,X                  ; $A076  BD CC A0
    STA $33                      ; $A079  85 33
    LDA $A0D6,X                  ; $A07B  BD D6 A0
    STA $1E                      ; $A07E  85 1E

loc_0B_A080:
    TXA                          ; $A080  8A
    PHA                          ; $A081  48
    JSR sub_0E_D131              ; $A082  20 31 D1
    JSR sub_0E_CF23              ; $A085  20 23 CF
    JSR sub_0E_C6C4              ; $A088  20 C4 C6
    JSR sub_0E_C01B              ; $A08B  20 1B C0
    PLA                          ; $A08E  68
    TAX                          ; $A08F  AA
    LDA $B0                      ; $A090  A5 B0
    BNE loc_0B_A0A7              ; $A092  D0 13
    CLC                          ; $A094  18
    LDA $0620                    ; $A095  AD 20 06
    ADC $A0D0,X                  ; $A098  7D D0 A0
    STA $0620                    ; $A09B  8D 20 06
    LDA $0600                    ; $A09E  AD 00 06
    ADC $A0D2,X                  ; $A0A1  7D D2 A0
    STA $0600                    ; $A0A4  8D 00 06

loc_0B_A0A7:
    CLC                          ; $A0A7  18
    LDA $1E                      ; $A0A8  A5 1E
    ADC $A0D4,X                  ; $A0AA  7D D4 A0
    STA $1E                      ; $A0AD  85 1E
    CLC                          ; $A0AF  18
    LDA $33                      ; $A0B0  A5 33
    ADC $A0CE,X                  ; $A0B2  7D CE A0
    STA $33                      ; $A0B5  85 33
    BMI loc_0B_A0BF              ; $A0B7  30 06
    CMP #$3C                     ; $A0B9  C9 3C
    BEQ loc_0B_A0BF              ; $A0BB  F0 02
    BNE loc_0B_A080              ; $A0BD  D0 C1

loc_0B_A0BF:
    LDA #$00                     ; $A0BF  A9 00
    STA $1D                      ; $A0C1  85 1D
    STA $1E                      ; $A0C3  85 1E
    STA $0620                    ; $A0C5  8D 20 06
    JSR sub_0E_D131              ; $A0C8  20 31 D1
    RTS                          ; $A0CB  60

    .byte $3B,$00,$FF,$01,$BF,$41,$03,$FC,$FC,$04,$EF,$00  ; $A0CC

sub_0B_A0D8:
    STA $05                      ; $A0D8  85 05
    LDX #$FF                     ; $A0DA  A2 FF
    STX $04                      ; $A0DC  86 04
    LDA #$00                     ; $A0DE  A9 00
    STA $2F                      ; $A0E0  85 2F

loc_0B_A0E2:
    LDA #$00                     ; $A0E2  A9 00
    STA $0D                      ; $A0E4  85 0D
    STA $1C                      ; $A0E6  85 1C
    LDA #$08                     ; $A0E8  A9 08
    STA $0C                      ; $A0EA  85 0C
    JSR sub_0A_9FB3              ; $A0EC  20 B3 9F
    LDA $FF                      ; $A0EF  A5 FF
    AND #$80                     ; $A0F1  29 80
    BEQ loc_0B_A0FB              ; $A0F3  F0 06
    JSR sub_0E_C01B              ; $A0F5  20 1B C0
    JMP loc_0B_A0FE              ; $A0F8  4C FE A0


loc_0B_A0FB:
    JSR sub_0E_D673              ; $A0FB  20 73 D6

loc_0B_A0FE:
    LDA $04                      ; $A0FE  A5 04
    CMP #$FF                     ; $A100  C9 FF
    BNE loc_0B_A0E2              ; $A102  D0 DE
    RTS                          ; $A104  60


sub_0B_A105:
    LDX #$1F                     ; $A105  A2 1F
    LDA #$F8                     ; $A107  A9 F8

loc_0B_A109:
    STA $0601,X                  ; $A109  9D 01 06
    DEX                          ; $A10C  CA
    BPL loc_0B_A109              ; $A10D  10 FA
    LDX #$0F                     ; $A10F  A2 0F
    LDA #$FF                     ; $A111  A9 FF

loc_0B_A113:
    STA $7B,X                    ; $A113  95 7B
    DEX                          ; $A115  CA
    BPL loc_0B_A113              ; $A116  10 FB
    LDA $31                      ; $A118  A5 31
    CMP #$01                     ; $A11A  C9 01
    BEQ loc_0B_A12B              ; $A11C  F0 0D
    CMP #$04                     ; $A11E  C9 04
    BEQ loc_0B_A12F              ; $A120  F0 0D
    CMP #$03                     ; $A122  C9 03
    BEQ loc_0B_A157              ; $A124  F0 31
    CMP #$06                     ; $A126  C9 06
    BEQ loc_0B_A144              ; $A128  F0 1A
    RTS                          ; $A12A  60


loc_0B_A12B:
    LDA #$66                     ; $A12B  A9 66
    BNE loc_0B_A131              ; $A12D  D0 02

loc_0B_A12F:
    LDA #$2A                     ; $A12F  A9 2A

loc_0B_A131:
    STA $0E                      ; $A131  85 0E
    LDA #$00                     ; $A133  A9 00
    STA $0C                      ; $A135  85 0C
    LDA $0E                      ; $A137  A5 0E
    JSR sub_0E_C625              ; $A139  20 25 C6
    SEC                          ; $A13C  38
    LDA $0E                      ; $A13D  A5 0E
    SBC #$06                     ; $A13F  E9 06
    BPL loc_0B_A131              ; $A141  10 EE
    RTS                          ; $A143  60


loc_0B_A144:
    LDA #$1E                     ; $A144  A9 1E

loc_0B_A146:
    STA $0C                      ; $A146  85 0C
    JSR sub_0E_C64A              ; $A148  20 4A C6
    LDA $0C                      ; $A14B  A5 0C
    CMP #$2A                     ; $A14D  C9 2A
    BEQ loc_0B_A156              ; $A14F  F0 05
    CLC                          ; $A151  18
    ADC #$06                     ; $A152  69 06
    BNE loc_0B_A146              ; $A154  D0 F0

loc_0B_A156:
    RTS                          ; $A156  60


loc_0B_A157:
    LDA #$54                     ; $A157  A9 54

loc_0B_A159:
    STA $0C                      ; $A159  85 0C
    JSR sub_0E_C64A              ; $A15B  20 4A C6
    SEC                          ; $A15E  38
    LDA $0C                      ; $A15F  A5 0C
    SBC #$06                     ; $A161  E9 06
    BPL loc_0B_A159              ; $A163  10 F4
    LDA $1B                      ; $A165  A5 1B
    CMP #$0F                     ; $A167  C9 0F
    BCS loc_0B_A18A              ; $A169  B0 1F
    LDA #$FF                     ; $A16B  A9 FF
    STA $0410                    ; $A16D  8D 10 04
    LDA #$32                     ; $A170  A9 32
    STA $06F0                    ; $A172  8D F0 06
    LDA #$20                     ; $A175  A9 20
    STA $0430                    ; $A177  8D 30 04
    LDX #$10                     ; $A17A  A2 10
    JSR sub_0B_B045              ; $A17C  20 45 B0
    STA $0450                    ; $A17F  8D 50 04
    STA $0650                    ; $A182  8D 50 06
    LDA #$E0                     ; $A185  A9 E0
    STA $0610                    ; $A187  8D 10 06

loc_0B_A18A:
    RTS                          ; $A18A  60


sub_0B_A18B:
    SEC                          ; $A18B  38
    LDA $0480                    ; $A18C  AD 80 04
    SBC $1A                      ; $A18F  E5 1A
    SEC                          ; $A191  38
    SBC #$07                     ; $A192  E9 07
    STA $00                      ; $A194  85 00
    CLC                          ; $A196  18
    ADC #$0E                     ; $A197  69 0E
    STA $01                      ; $A199  85 01
    SEC                          ; $A19B  38
    LDA $0600                    ; $A19C  AD 00 06
    SBC #$0B                     ; $A19F  E9 0B
    STA $03                      ; $A1A1  85 03
    CLC                          ; $A1A3  18
    ADC #$16                     ; $A1A4  69 16
    STA $02                      ; $A1A6  85 02
    LDA $55                      ; $A1A8  A5 55
    BNE loc_0B_A1C2              ; $A1AA  D0 16
    LDA $3E                      ; $A1AC  A5 3E
    CMP #$05                     ; $A1AE  C9 05
    BCC loc_0B_A1C2              ; $A1B0  90 10
    LDX #$01                     ; $A1B2  A2 01
    JSR sub_0E_C9BE              ; $A1B4  20 BE C9
    BCC loc_0B_A1C2              ; $A1B7  90 09
    LDA #$04                     ; $A1B9  A9 04
    STA $0C                      ; $A1BB  85 0C
    LDA $43                      ; $A1BD  A5 43
    JMP loc_0B_A23D              ; $A1BF  4C 3D A2


loc_0B_A1C2:
    LDA $23                      ; $A1C2  A5 23
    AND #$01                     ; $A1C4  29 01
    CLC                          ; $A1C6  18
    ADC #$10                     ; $A1C7  69 10
    TAX                          ; $A1C9  AA

loc_0B_A1CA:
    JSR sub_0E_C9BE              ; $A1CA  20 BE C9
    BCS loc_0B_A1D6              ; $A1CD  B0 07

loc_0B_A1CF:
    INX                          ; $A1CF  E8
    INX                          ; $A1D0  E8
    CPX $54                      ; $A1D1  E4 54
    BCC loc_0B_A1CA              ; $A1D3  90 F5
    RTS                          ; $A1D5  60


loc_0B_A1D6:
    LDA $0400,X                  ; $A1D6  BD 00 04
    CMP #$FF                     ; $A1D9  C9 FF
    BNE loc_0B_A1EB              ; $A1DB  D0 0E
    LDA $06E0,X                  ; $A1DD  BD E0 06
    CMP #$48                     ; $A1E0  C9 48
    BCS loc_0B_A1EB              ; $A1E2  B0 07
    CMP #$3C                     ; $A1E4  C9 3C
    BCC loc_0B_A1EB              ; $A1E6  90 03
    JMP loc_0E_C833              ; $A1E8  4C 33 C8


loc_0B_A1EB:
    LDA $55                      ; $A1EB  A5 55
    BNE loc_0B_A1CF              ; $A1ED  D0 E0
    LDA $0400,X                  ; $A1EF  BD 00 04
    CMP #$FF                     ; $A1F2  C9 FF
    BEQ loc_0B_A22D              ; $A1F4  F0 37
    CMP #$27                     ; $A1F6  C9 27
    BEQ loc_0B_A21E              ; $A1F8  F0 24
    CMP #$32                     ; $A1FA  C9 32
    BEQ loc_0B_A21E              ; $A1FC  F0 20
    CMP #$4C                     ; $A1FE  C9 4C
    BCC loc_0B_A226              ; $A200  90 24
    CMP #$54                     ; $A202  C9 54
    BCS loc_0B_A226              ; $A204  B0 20
    LDA $5F                      ; $A206  A5 5F
    CMP #$01                     ; $A208  C9 01
    BNE loc_0B_A226              ; $A20A  D0 1A
    TXA                          ; $A20C  8A
    PHA                          ; $A20D  48
    JSR sub_0E_C7C5              ; $A20E  20 C5 C7
    PLA                          ; $A211  68
    TAX                          ; $A212  AA
    LDA #$0A                     ; $A213  A9 0A
    STA $0C                      ; $A215  85 0C
    LDA $0420,X                  ; $A217  BD 20 04
    EOR #$40                     ; $A21A  49 40
    BNE loc_0B_A23D              ; $A21C  D0 1F

loc_0B_A21E:
    LDA $0420,X                  ; $A21E  BD 20 04
    ORA #$80                     ; $A221  09 80
    STA $0420,X                  ; $A223  9D 20 04

loc_0B_A226:
    LDY $AC                      ; $A226  A4 AC
    LDA $FEBB,Y                  ; $A228  B9 BB FE
    BNE loc_0B_A238              ; $A22B  D0 0B

loc_0B_A22D:
    LDA $3E                      ; $A22D  A5 3E
    BNE loc_0B_A226              ; $A22F  D0 F5
    LDA $06E0,X                  ; $A231  BD E0 06
    TAY                          ; $A234  A8
    LDA $FE89,Y                  ; $A235  B9 89 FE

loc_0B_A238:
    STA $0C                      ; $A238  85 0C
    LDA $0420,X                  ; $A23A  BD 20 04

loc_0B_A23D:
    STA $0D                      ; $A23D  85 0D
    SEC                          ; $A23F  38
    LDA $6A                      ; $A240  A5 6A
    SBC $0C                      ; $A242  E5 0C
    STA $6A                      ; $A244  85 6A
    BEQ loc_0B_A24A              ; $A246  F0 02
    BCS loc_0B_A251              ; $A248  B0 07

loc_0B_A24A:
    LDA #$00                     ; $A24A  A9 00
    STA $6A                      ; $A24C  85 6A
    JMP loc_0E_C219              ; $A24E  4C 19 C2


loc_0B_A251:
    LDA $0D                      ; $A251  A5 0D
    AND #$40                     ; $A253  29 40
    EOR #$40                     ; $A255  49 40
    ORA #$03                     ; $A257  09 03
    STA $0420                    ; $A259  8D 20 04
    LDA #$6F                     ; $A25C  A9 6F
    STA $55                      ; $A25E  85 55
    RTS                          ; $A260  60


sub_0B_A261:
    LDA $23                      ; $A261  A5 23
    AND #$01                     ; $A263  29 01
    CLC                          ; $A265  18
    ADC #$10                     ; $A266  69 10
    TAX                          ; $A268  AA

loc_0B_A269:
    LDA $0420,X                  ; $A269  BD 20 04
    AND #$7F                     ; $A26C  29 7F
    STA $0420,X                  ; $A26E  9D 20 04
    INX                          ; $A271  E8
    INX                          ; $A272  E8
    CPX #$20                     ; $A273  E0 20
    BCC loc_0B_A269              ; $A275  90 F2
    LDA $5F                      ; $A277  A5 5F
    ASL A                        ; $A279  0A
    TAY                          ; $A27A  A8
    LDA $A288,Y                  ; $A27B  B9 88 A2
    STA $04                      ; $A27E  85 04
    LDA $A289,Y                  ; $A280  B9 89 A2
    STA $05                      ; $A283  85 05
    JMP ($0004)                  ; $A285  6C 04 00

    .byte $98,$A2,$AB,$A2,$B1,$A2,$C7,$A2,$D4,$A2,$DA,$A2,$18,$A3,$5A,$A3  ; $A288
    LDX #$02                     ; $A298  A2 02
    LDA #$05                     ; $A29A  A9 05
    STA $59                      ; $A29C  85 59

loc_0B_A29E:
    STX $2F                      ; $A29E  86 2F
    JSR sub_0E_C8B2              ; $A2A0  20 B2 C8
    LDX $2F                      ; $A2A3  A6 2F
    INX                          ; $A2A5  E8
    CPX $59                      ; $A2A6  E4 59
    BNE loc_0B_A29E              ; $A2A8  D0 F4
    RTS                          ; $A2AA  60

    .byte $A2,$05,$A9,$06,$D0,$EB,$A2,$05,$86,$2F,$20,$B2,$C8,$B0,$01,$60  ; $A2AB
    .byte $A5,$3E,$D0,$07,$A6,$0C,$A9,$FF,$9D,$A0,$06,$60,$A5,$61,$C9,$92  ; $A2BB
    .byte $90,$06,$A2,$02,$A9,$0E,$D0,$C9,$60,$A2,$05,$A9,$07,$D0,$C2,$A2  ; $A2CB
    .byte $05,$A5,$61,$C9,$FF,$F0,$32,$86,$2F,$20,$B2,$C8,$90,$23,$A6,$0C  ; $A2DB
    .byte $BD,$00,$04,$C9,$3F,$90,$1A,$C9,$48,$90,$0F,$C9,$FF,$D0,$12,$BD  ; $A2EB
    .byte $E0,$06,$C9,$11,$F0,$04,$C9,$1C,$D0,$07,$20,$E4,$C7,$A9,$FE,$85  ; $A2FB
    .byte $61,$A6,$2F,$E8,$E0,$0C,$D0,$CF,$60,$A9,$08,$D0,$84,$A2,$05,$86  ; $A30B
    .byte $2F,$20,$B2,$C8,$B0,$08,$A6,$2F,$E8,$E0,$08,$D0,$F2,$60,$A6,$2F  ; $A31B
    .byte $A4,$31,$BD,$00,$04,$D9,$88,$A8,$D0,$EE,$38,$BD,$00,$06,$E9,$10  ; $A32B
    .byte $85,$03,$38,$BD,$80,$04,$E9,$10,$85,$00,$BD,$60,$04,$E9,$00,$85  ; $A33B
    .byte $01,$20,$B5,$F7,$A5,$61,$C9,$10,$B0,$04,$A9,$1F,$85,$61,$60,$18  ; $A34B
    .byte $60  ; $A35B

sub_0B_A35C:
    LDA $60                      ; $A35C  A5 60
    BMI loc_0B_A36A              ; $A35E  30 0A
    LDA $5F                      ; $A360  A5 5F
    CMP #$06                     ; $A362  C9 06
    BNE loc_0B_A369              ; $A364  D0 03
    JSR sub_0F_F6FD              ; $A366  20 FD F6

loc_0B_A369:
    RTS                          ; $A369  60


loc_0B_A36A:
    LDA $60                      ; $A36A  A5 60
    ORA #$40                     ; $A36C  09 40
    STA $60                      ; $A36E  85 60
    LDA $5F                      ; $A370  A5 5F
    AND #$3F                     ; $A372  29 3F
    ASL A                        ; $A374  0A
    TAX                          ; $A375  AA
    LDA $A383,X                  ; $A376  BD 83 A3
    STA $04                      ; $A379  85 04
    LDA $A384,X                  ; $A37B  BD 84 A3
    STA $05                      ; $A37E  85 05
    JMP ($0004)                  ; $A380  6C 04 00

    .byte $09,$A7,$93,$A3,$09,$A7,$65,$A4,$C7,$A4,$12,$A5,$C1,$A5,$20,$A6  ; $A383
    .byte $A5,$61,$C9,$0F,$B0,$16,$AD,$00,$04,$C9,$09,$F0,$08,$C9,$15,$F0  ; $A393
    .byte $04,$C9,$17,$D0,$07,$A9,$6F,$8D,$00,$04,$D0,$0E,$A9,$00,$8D,$40  ; $A3A3
    .byte $06,$A5,$61,$C9,$2A,$B0,$17,$20,$09,$A7,$E6,$61,$38,$AD,$65,$06  ; $A3B3
    .byte $E9,$1A,$8D,$65,$06,$AD,$85,$06,$E9,$00,$8D,$85,$06,$60,$D0,$0A  ; $A3C3
    .byte $A9,$80,$85,$65,$A9,$02,$85,$66,$E6,$61,$AD,$25,$04,$29,$BF,$8D  ; $A3D3
    .byte $25,$04,$38,$AD,$80,$04,$ED,$85,$04,$85,$02,$AD,$60,$04,$ED,$65  ; $A3E3
    .byte $04,$90,$0A,$AD,$25,$04,$09,$40,$8D,$25,$04,$D0,$08,$A5,$02,$49  ; $A3F3
    .byte $FF,$69,$01,$85,$02,$18,$A5,$65,$69,$08,$85,$65,$85,$00,$A5,$66  ; $A403
    .byte $69,$00,$85,$66,$85,$01,$38,$AD,$05,$06,$ED,$00,$06,$85,$03,$A2  ; $A413
    .byte $05,$20,$C6,$F8,$A5,$03,$C9,$0C,$B0,$06,$A5,$02,$C9,$0C,$90,$28  ; $A423
    .byte $A5,$63,$05,$64,$F0,$1E,$38,$A5,$63,$E9,$20,$85,$63,$A5,$64,$E9  ; $A433
    .byte $00,$85,$64,$38,$AD,$65,$06,$E5,$63,$8D,$65,$06,$AD,$85,$06,$E5  ; $A443
    .byte $64,$8D,$85,$06,$20,$09,$A7,$60,$A9,$F8,$8D,$05,$06,$A9,$00,$85  ; $A453
    .byte $60,$60,$E6,$61,$A5,$61,$C9,$0F,$B0,$15,$AD,$00,$04,$C9,$09,$F0  ; $A463
    .byte $08,$C9,$15,$F0,$04,$C9,$17,$D0,$06,$A9,$6F,$8D,$00,$04,$60,$A9  ; $A473
    .byte $00,$8D,$40,$06,$A5,$61,$C9,$92,$B0,$04,$20,$09,$A7,$60,$D0,$1F  ; $A483
    .byte $A9,$0B,$85,$0C,$A9,$5F,$85,$0D,$A9,$00,$85,$0E,$A2,$01,$A0,$05  ; $A493
    .byte $E8,$20,$41,$F8,$10,$F8,$A9,$12,$20,$77,$C4,$20,$09,$A7,$60,$C9  ; $A4A3
    .byte $A0,$D0,$F8,$A9,$F8,$A2,$02,$9D,$00,$06,$E8,$E0,$10,$D0,$F8,$A9  ; $A4B3
    .byte $00,$85,$60,$60,$E6,$61,$A5,$61,$C9,$20,$D0,$0A,$A9,$F8,$8D,$06  ; $A4C3
    .byte $06,$A9,$00,$85,$60,$60,$29,$07,$AA,$18,$AD,$00,$06,$7D,$FA,$A4  ; $A4D3
    .byte $8D,$06,$06,$18,$AD,$80,$04,$7D,$02,$A5,$8D,$86,$04,$AD,$60,$04  ; $A4E3
    .byte $7D,$0A,$A5,$8D,$66,$04,$60,$14,$0E,$00,$F2,$EC,$F2,$00,$0E,$00  ; $A4F3
    .byte $F2,$EC,$F2,$00,$0E,$14,$0E,$00,$FF,$FF,$FF,$00,$00,$00,$00,$A5  ; $A503
    .byte $61,$C9,$FF,$F0,$04,$C9,$FE,$D0,$03,$4C,$A6,$A5,$A2,$05,$BD,$40  ; $A513
    .byte $04,$F0,$07,$E8,$E0,$0A,$D0,$F6,$F0,$4C,$BD,$00,$06,$C9,$F8,$F0  ; $A523
    .byte $F2,$BD,$00,$04,$38,$E9,$62,$A8,$B9,$B9,$A5,$9D,$00,$04,$18,$BD  ; $A533
    .byte $00,$06,$79,$B1,$A5,$9D,$00,$06,$BD,$20,$04,$29,$40,$F0,$12,$18  ; $A543
    .byte $BD,$80,$04,$79,$A9,$A5,$9D,$80,$04,$BD,$60,$04,$69,$00,$4C,$73  ; $A553
    .byte $A5,$38,$BD,$80,$04,$F9,$A9,$A5,$9D,$80,$04,$BD,$60,$04,$E9,$00  ; $A563
    .byte $9D,$60,$04,$4C,$26,$A5,$A5,$23,$29,$01,$18,$69,$05,$AA,$BD,$00  ; $A573
    .byte $06,$C9,$F8,$F0,$18,$85,$0E,$BD,$60,$04,$85,$0C,$BD,$80,$04,$85  ; $A583
    .byte $0D,$A4,$8E,$20,$8A,$CD,$C9,$82,$D0,$03,$4C,$8F,$F7,$E8,$E8,$E0  ; $A593
    .byte $0C,$90,$DB,$4C,$09,$A7,$1C,$20,$20,$1C,$18,$1C,$1C,$1C,$FC,$E8  ; $A5A3
    .byte $00,$1C,$10,$F4,$FC,$FC,$67,$68,$69,$63,$64,$65,$66,$67,$A5,$61  ; $A5B3
    .byte $D0,$03,$E6,$61,$60,$C9,$10,$B0,$3C,$AD,$00,$04,$C9,$12,$F0,$04  ; $A5C3
    .byte $C9,$13,$D0,$04,$A9,$00,$F0,$02,$A9,$2F,$8D,$40,$06,$AD,$20,$04  ; $A5D3
    .byte $29,$40,$09,$24,$8D,$25,$04,$AD,$60,$04,$8D,$65,$04,$AD,$80,$04  ; $A5E3
    .byte $8D,$85,$04,$AD,$00,$06,$38,$E9,$1A,$8D,$05,$06,$A9,$00,$8D,$65  ; $A5F3
    .byte $06,$8D,$85,$06,$60,$AD,$00,$04,$C9,$09,$D0,$0D,$A5,$61,$C9,$1F  ; $A603
    .byte $F0,$07,$E6,$61,$A9,$6F,$8D,$00,$04,$20,$09,$A7,$60,$A9,$05,$85  ; $A613
    .byte $2F,$AE,$A0,$05,$F0,$63,$A5,$14,$29,$02,$F0,$58,$A9,$1F,$8D,$40  ; $A623
    .byte $06,$BD,$A0,$05,$C9,$41,$F0,$03,$FE,$A0,$05,$0A,$69,$10,$85,$0C  ; $A633
    .byte $29,$07,$D0,$07,$18,$A5,$0C,$69,$08,$85,$0C,$AD,$20,$04,$29,$40  ; $A643
    .byte $9D,$20,$04,$F0,$11,$18,$AD,$80,$04,$65,$0C,$9D,$C0,$05,$AD,$60  ; $A653
    .byte $04,$69,$00,$4C,$77,$A6,$38,$AD,$80,$04,$E5,$0C,$9D,$C0,$05,$AD  ; $A663
    .byte $60,$04,$E9,$00,$9D,$D0,$05,$AD,$00,$06,$9D,$F0,$05,$20,$BC,$F6  ; $A673
    .byte $C0,$01,$D0,$05,$A9,$00,$8D,$A0,$05,$A2,$05,$EC,$A0,$05,$F0,$12  ; $A683
    .byte $BD,$B0,$05,$F0,$58,$DE,$B0,$05,$D0,$08,$A9,$F8,$9D,$00,$06,$4C  ; $A693
    .byte $F0,$A6,$BD,$A0,$05,$29,$7C,$0A,$85,$0D,$69,$08,$85,$0C,$38,$BD  ; $A6A3
    .byte $C0,$05,$E5,$0C,$9D,$80,$04,$BD,$D0,$05,$E9,$00,$9D,$60,$04,$BD  ; $A6B3
    .byte $E0,$05,$0A,$0A,$0A,$48,$C5,$0D,$F0,$05,$FE,$E0,$05,$D0,$05,$A9  ; $A6C3
    .byte $00,$9D,$E0,$05,$68,$0A,$09,$08,$18,$7D,$80,$04,$9D,$80,$04,$BD  ; $A6D3
    .byte $60,$04,$69,$00,$9D,$60,$04,$BD,$F0,$05,$9D,$00,$06,$E8,$E0,$10  ; $A6E3
    .byte $D0,$11,$A2,$05,$BD,$B0,$05,$D0,$09,$E8,$E0,$10,$D0,$F6,$A9,$00  ; $A6F3
    .byte $85,$60,$60,$4C,$8E,$A6  ; $A703
    LDX #$02                     ; $A709  A2 02

loc_0B_A70B:
    LDA $0600,X                  ; $A70B  BD 00 06
    CMP #$F8                     ; $A70E  C9 F8
    BNE loc_0B_A71D              ; $A710  D0 0B
    INX                          ; $A712  E8
    CPX #$10                     ; $A713  E0 10
    BNE loc_0B_A70B              ; $A715  D0 F4
    LDA #$00                     ; $A717  A9 00
    STA $60                      ; $A719  85 60
    STA $61                      ; $A71B  85 61

loc_0B_A71D:
    RTS                          ; $A71D  60


sub_0B_A71E:
    LDA $5F                      ; $A71E  A5 5F
    TAX                          ; $A720  AA
    ASL A                        ; $A721  0A
    TAY                          ; $A722  A8
    BEQ loc_0B_A72A              ; $A723  F0 05
    LDA $6A,X                    ; $A725  B5 6A
    BNE loc_0B_A72A              ; $A727  D0 01
    RTS                          ; $A729  60


loc_0B_A72A:
    LDA $A737,Y                  ; $A72A  B9 37 A7
    STA $04                      ; $A72D  85 04
    LDA $A738,Y                  ; $A72F  B9 38 A7
    STA $05                      ; $A732  85 05
    JMP ($0004)                  ; $A734  6C 04 00

    .byte $47,$A7,$6D,$A7,$84,$A7,$A1,$A7,$CD,$A7,$FA,$A7,$27,$A8,$93,$A8  ; $A737
    LDX #$02                     ; $A747  A2 02

loc_0B_A749:
    LDA $0600,X                  ; $A749  BD 00 06
    CMP #$F8                     ; $A74C  C9 F8
    BEQ loc_0B_A757              ; $A74E  F0 07
    INX                          ; $A750  E8
    CPX #$05                     ; $A751  E0 05
    BNE loc_0B_A749              ; $A753  D0 F4
    BEQ loc_0B_A76A              ; $A755  F0 13

loc_0B_A757:
    LDA #$04                     ; $A757  A9 04
    JSR sub_0B_A913              ; $A759  20 13 A9
    LDA #$1F                     ; $A75C  A9 1F
    STA $0640                    ; $A75E  8D 40 06
    LDA #$14                     ; $A761  A9 14
    JSR sub_0E_C477              ; $A763  20 77 C4
    LDA #$C0                     ; $A766  A9 C0
    STA $60                      ; $A768  85 60

loc_0B_A76A:
    LDX $2F                      ; $A76A  A6 2F
    RTS                          ; $A76C  60

    .byte $A9,$0E,$85,$0C,$20,$AF,$A7,$A9,$80,$85,$63,$A9,$02,$85,$64,$A9  ; $A76D
    .byte $25,$20,$77,$C4,$4C,$C0,$A8,$A5,$5F,$09,$C0,$85,$60,$A9,$05,$A2  ; $A77D
    .byte $05,$20,$13,$A9,$B0,$0D,$A9,$1F,$8D,$40,$06,$A9,$2A,$20,$77,$C4  ; $A78D
    .byte $4C,$C0,$A8,$60,$A9,$0D,$85,$0C,$20,$AF,$A7,$A9,$03,$85,$62,$20  ; $A79D
    .byte $C0,$A8,$A5,$60,$D0,$17,$A5,$5F,$09,$C0,$85,$60,$A5,$0C,$A2,$05  ; $A7AD
    .byte $20,$13,$A9,$B0,$08,$A9,$00,$85,$61,$20,$E6,$A8,$60,$68,$68,$60  ; $A7BD
    .byte $A5,$5F,$09,$C0,$85,$60,$A9,$00,$A2,$05,$20,$13,$A9,$B0,$18,$A9  ; $A7CD
    .byte $01,$A2,$06,$20,$13,$A9,$A9,$1F,$8D,$40,$06,$A9,$00,$85,$61,$A9  ; $A7DD
    .byte $2E,$20,$77,$C4,$4C,$C0,$A8,$A9,$00,$8D,$40,$06,$60,$A5,$60,$D0  ; $A7ED
    .byte $28,$A5,$5F,$09,$C0,$85,$60,$A9,$06,$85,$0C,$AA,$CA,$20,$13,$A9  ; $A7FD
    .byte $E6,$0C,$A5,$0C,$C9,$0D,$D0,$F1,$A9,$00,$85,$61,$A9,$1F,$8D,$40  ; $A80D
    .byte $06,$A9,$1E,$20,$77,$C4,$4C,$C0,$A8,$60,$A5,$60,$29,$40,$D0,$36  ; $A81D
    .byte $A4,$52,$C0,$FF,$F0,$2A,$A5,$5F,$09,$80,$85,$60,$A9,$00,$85,$61  ; $A82D
    .byte $A9,$04,$99,$21,$07,$20,$6A,$F7,$20,$E8,$CD,$A9,$F8,$8D,$05,$06  ; $A83D
    .byte $A9,$02,$A2,$05,$20,$13,$A9,$A4,$31,$B9,$88,$A8,$9D,$00,$04,$60  ; $A84D
    .byte $A9,$00,$8D,$40,$06,$60,$A5,$61,$C9,$10,$B0,$1E,$A9,$F8,$A2,$05  ; $A85D
    .byte $9D,$00,$06,$A9,$03,$20,$13,$A9,$A9,$10,$85,$61,$20,$E6,$A8,$A4  ; $A86D
    .byte $31,$B9,$88,$A8,$9D,$00,$04,$4C,$C0,$A8,$60,$6C,$00,$00,$00,$6C  ; $A87D
    .byte $32,$6C,$6C,$6C,$6C,$6C,$A2,$05,$BD,$B0,$05,$F0,$06,$E8,$E0,$0A  ; $A88D
    .byte $D0,$F6,$60,$8E,$A0,$05,$A9,$0F,$20,$13,$A9,$A9,$00,$9D,$A0,$05  ; $A89D
    .byte $9D,$E0,$05,$A9,$9C,$9D,$B0,$05,$A5,$5F,$09,$C0,$85,$60,$A9,$13  ; $A8AD
    .byte $20,$77,$C4,$A6,$5F,$F6,$9E,$B5,$9E,$DD,$D7,$A8,$D0,$0C,$A9,$00  ; $A8BD
    .byte $95,$9E,$38,$B5,$6A,$FD,$DE,$A8,$95,$6A,$60,$01,$01,$01,$01,$01  ; $A8CD
    .byte $01,$01,$01,$01,$02,$01,$01,$02,$02,$A9,$00,$8D,$40,$04,$AD,$00  ; $A8DD
    .byte $04,$C9,$09,$D0,$07,$A9,$00,$8D,$40,$06,$F0,$19,$C9,$15,$F0,$04  ; $A8ED
    .byte $C9,$17,$D0,$07,$A9,$1F,$8D,$40,$06,$D0,$0A,$AD,$20,$04,$29,$F0  ; $A8FD
    .byte $09,$04,$8D,$20,$04,$60  ; $A90D

sub_0B_A913:
    STA $0C                      ; $A913  85 0C
    ASL A                        ; $A915  0A
    ASL A                        ; $A916  0A
    ASL A                        ; $A917  0A
    CLC                          ; $A918  18
    ADC $0C                      ; $A919  65 0C
    TAY                          ; $A91B  A8
    LDA $0600,X                  ; $A91C  BD 00 06
    CMP #$F8                     ; $A91F  C9 F8
    BEQ loc_0B_A925              ; $A921  F0 02
    SEC                          ; $A923  38
    RTS                          ; $A924  60


loc_0B_A925:
    LDA $A999,Y                  ; $A925  B9 99 A9
    STA $0400,X                  ; $A928  9D 00 04
    LDA $A99A,Y                  ; $A92B  B9 9A A9
    STA $0440,X                  ; $A92E  9D 40 04
    LDA $0420                    ; $A931  AD 20 04
    AND #$40                     ; $A934  29 40
    PHP                          ; $A936  08
    ORA $A99B,Y                  ; $A937  19 9B A9
    STA $0420,X                  ; $A93A  9D 20 04
    LDA #$00                     ; $A93D  A9 00
    STA $06A0,X                  ; $A93F  9D A0 06
    STA $0640,X                  ; $A942  9D 40 06
    STA $04A0,X                  ; $A945  9D A0 04
    STA $0620,X                  ; $A948  9D 20 06
    LDA $A99C,Y                  ; $A94B  B9 9C A9
    STA $0660,X                  ; $A94E  9D 60 06
    LDA $A99D,Y                  ; $A951  B9 9D A9
    STA $0680,X                  ; $A954  9D 80 06
    LDA $A99E,Y                  ; $A957  B9 9E A9
    STA $04E0,X                  ; $A95A  9D E0 04
    LDA $A99F,Y                  ; $A95D  B9 9F A9
    STA $04C0,X                  ; $A960  9D C0 04
    CLC                          ; $A963  18
    LDA $0600                    ; $A964  AD 00 06
    ADC $A9A0,Y                  ; $A967  79 A0 A9
    CMP #$F8                     ; $A96A  C9 F8
    BNE loc_0B_A970              ; $A96C  D0 02
    LDA #$F9                     ; $A96E  A9 F9

loc_0B_A970:
    STA $0600,X                  ; $A970  9D 00 06
    LDA $0480                    ; $A973  AD 80 04
    PLP                          ; $A976  28
    BEQ loc_0B_A988              ; $A977  F0 0F
    CLC                          ; $A979  18
    ADC $A9A1,Y                  ; $A97A  79 A1 A9
    STA $0480,X                  ; $A97D  9D 80 04
    LDA $0460                    ; $A980  AD 60 04
    ADC #$00                     ; $A983  69 00
    JMP loc_0B_A994              ; $A985  4C 94 A9


loc_0B_A988:
    SEC                          ; $A988  38
    SBC $A9A1,Y                  ; $A989  F9 A1 A9
    STA $0480,X                  ; $A98C  9D 80 04
    LDA $0460                    ; $A98F  AD 60 04
    SBC #$00                     ; $A992  E9 00

loc_0B_A994:
    STA $0460,X                  ; $A994  9D 60 04
    CLC                          ; $A997  18
    RTS                          ; $A998  60

    .byte $60,$00,$04,$00,$00,$00,$04,$00,$10,$61,$00,$04,$00,$00,$00,$00  ; $A999
    .byte $EC,$00,$00,$00,$24,$00,$00,$00,$00,$F0,$10,$6C,$00,$15,$00,$03  ; $A9A9
    .byte $A0,$03,$F0,$10,$1A,$00,$00,$00,$00,$00,$04,$00,$10,$5C,$00,$04  ; $A9B9
    .byte $00,$00,$00,$04,$00,$10,$62,$40,$04,$00,$00,$50,$01,$FC,$10,$63  ; $A9C9
    .byte $30,$04,$00,$00,$50,$01,$08,$14,$64,$20,$04,$00,$00,$50,$01,$FC  ; $A9D9
    .byte $18,$65,$10,$04,$00,$00,$50,$01,$EC,$20,$66,$01,$04,$00,$00,$50  ; $A9E9
    .byte $01,$EC,$28,$6A,$00,$04,$00,$06,$00,$00,$F0,$10,$6B,$00,$04,$00  ; $A9F9
    .byte $FA,$00,$00,$10,$10,$5D,$00,$11,$00,$03,$80,$01,$FC,$0C,$5B,$00  ; $AA09
    .byte $04,$00,$02,$00,$02,$FC,$0C,$5E,$00,$00,$00,$00,$00,$00,$00,$00  ; $AA19

sub_0B_AA29:
    LDA $06E0,X                  ; $AA29  BD E0 06
    ASL A                        ; $AA2C  0A
    TAY                          ; $AA2D  A8
    LDA $AA3B,Y                  ; $AA2E  B9 3B AA
    STA $04                      ; $AA31  85 04
    LDA $AA3C,Y                  ; $AA33  B9 3C AA
    STA $05                      ; $AA36  85 05
    JMP ($0004)                  ; $AA38  6C 04 00

    .byte $D1,$AA,$79,$AB,$F6,$AB,$5E,$AC,$CA,$AC,$CA,$B2,$28,$AD,$77,$AD  ; $AA3B
    .byte $77,$AD,$F2,$AB,$11,$AE,$26,$AF,$B0,$B3,$B5,$AF,$E6,$B4,$9B,$B5  ; $AA4B
    .byte $F9,$B3,$C3,$B6,$54,$B0,$17,$B1,$DA,$B1,$3C,$B2,$D6,$B2,$26,$AF  ; $AA5B
    .byte $AF,$B6,$B0,$B3,$C3,$B6,$C7,$B6,$CF,$B6,$0F,$B7,$56,$B7,$0A,$B8  ; $AA6B
    .byte $68,$B8,$CA,$AC,$26,$AF,$26,$AF,$B0,$B3,$B0,$B3,$76,$B8,$C2,$B4  ; $AA7B
    .byte $98,$B8,$A8,$B8,$AF,$B8,$C3,$B6,$21,$B9,$C3,$B6,$C3,$B6,$6E,$BA  ; $AA8B
    .byte $D0,$BA,$3F,$BB,$BD,$F3,$01,$BC,$C3,$B6,$A5,$BC,$C3,$B6,$C8,$BC  ; $AA9B
    .byte $F4,$BC,$83,$BD,$FC,$F3,$98,$BD,$AF,$B6,$AF,$B6,$AF,$B6,$AF,$B6  ; $AAAB
    .byte $AF,$B6,$AF,$B6,$C3,$B6,$C3,$B6,$C3,$B6,$C3,$B6,$C3,$B6,$C3,$B6  ; $AABB
    .byte $EB,$BD,$C3,$B6,$26,$BE  ; $AACB

sub_0B_AAD1:
    LDA $0640,X                  ; $AAD1  BD 40 06
    BNE loc_0B_AB15              ; $AAD4  D0 3F
    JSR sub_0F_F63B              ; $AAD6  20 3B F6
    CMP #$28                     ; $AAD9  C9 28
    BCC loc_0B_AAE0              ; $AADB  90 03
    JMP loc_0B_AB5F              ; $AADD  4C 5F AB


loc_0B_AAE0:
    SEC                          ; $AAE0  38
    LDA $0600                    ; $AAE1  AD 00 06
    SBC $0600,X                  ; $AAE4  FD 00 06
    PHP                          ; $AAE7  08
    BCS loc_0B_AAEE              ; $AAE8  B0 04
    EOR #$FF                     ; $AAEA  49 FF
    ADC #$01                     ; $AAEC  69 01

loc_0B_AAEE:
    TAX                          ; $AAEE  AA
    LDY #$00                     ; $AAEF  A0 00
    LDA #$18                     ; $AAF1  A9 18
    JSR sub_0E_C5AC              ; $AAF3  20 AC C5
    LDX $2F                      ; $AAF6  A6 2F
    LDA $04                      ; $AAF8  A5 04
    STA $0660,X                  ; $AAFA  9D 60 06
    LDA $05                      ; $AAFD  A5 05
    STA $0680,X                  ; $AAFF  9D 80 06
    PLP                          ; $AB02  28
    BCC loc_0B_AB08              ; $AB03  90 03
    JSR sub_0B_AB63              ; $AB05  20 63 AB

loc_0B_AB08:
    LDA #$33                     ; $AB08  A9 33
    STA $0640,X                  ; $AB0A  9D 40 06
    LDA #$00                     ; $AB0D  A9 00
    STA $04E0,X                  ; $AB0F  9D E0 04
    STA $04C0,X                  ; $AB12  9D C0 04

loc_0B_AB15:
    LDA $0640,X                  ; $AB15  BD 40 06
    CMP #$1B                     ; $AB18  C9 1B
    BCC loc_0B_AB30              ; $AB1A  90 14
    CLC                          ; $AB1C  18
    LDA $04E0,X                  ; $AB1D  BD E0 04
    ADC #$18                     ; $AB20  69 18
    STA $04E0,X                  ; $AB22  9D E0 04
    LDA $04C0,X                  ; $AB25  BD C0 04
    ADC #$00                     ; $AB28  69 00
    STA $04C0,X                  ; $AB2A  9D C0 04
    JMP loc_0B_AB48              ; $AB2D  4C 48 AB


loc_0B_AB30:
    CMP #$1A                     ; $AB30  C9 1A
    BNE loc_0B_AB37              ; $AB32  D0 03
    JSR sub_0B_AB63              ; $AB34  20 63 AB

loc_0B_AB37:
    CLC                          ; $AB37  18
    LDA $04E0,X                  ; $AB38  BD E0 04
    ADC #$04                     ; $AB3B  69 04
    STA $04E0,X                  ; $AB3D  9D E0 04
    LDA $04C0,X                  ; $AB40  BD C0 04
    ADC #$00                     ; $AB43  69 00
    STA $04C0,X                  ; $AB45  9D C0 04

loc_0B_AB48:
    DEC $0640,X                  ; $AB48  DE 40 06
    BNE loc_0B_AB5F              ; $AB4B  D0 12
    LDA #$00                     ; $AB4D  A9 00
    STA $0680,X                  ; $AB4F  9D 80 06
    STA $0660,X                  ; $AB52  9D 60 06
    LDA #$01                     ; $AB55  A9 01
    STA $04C0,X                  ; $AB57  9D C0 04
    LDA #$20                     ; $AB5A  A9 20
    STA $04E0,X                  ; $AB5C  9D E0 04

loc_0B_AB5F:
    JSR sub_0B_BE49              ; $AB5F  20 49 BE
    RTS                          ; $AB62  60


sub_0B_AB63:
    CLC                          ; $AB63  18
    LDA $0660,X                  ; $AB64  BD 60 06
    EOR #$FF                     ; $AB67  49 FF
    ADC #$01                     ; $AB69  69 01
    STA $0660,X                  ; $AB6B  9D 60 06
    LDA $0680,X                  ; $AB6E  BD 80 06
    EOR #$FF                     ; $AB71  49 FF
    ADC #$00                     ; $AB73  69 00
    STA $0680,X                  ; $AB75  9D 80 06
    RTS                          ; $AB78  60

    JSR sub_0B_B3A5              ; $AB79  20 A5 B3
    LDA $0440,X                  ; $AB7C  BD 40 04
    AND #$F0                     ; $AB7F  29 F0
    BEQ loc_0B_ABC8              ; $AB81  F0 45
    LDY #$10                     ; $AB83  A0 10
    LDA $0640,X                  ; $AB85  BD 40 06
    BEQ loc_0B_ABB6              ; $AB88  F0 2C
    CMP #$10                     ; $AB8A  C9 10
    BNE loc_0B_ABE1              ; $AB8C  D0 53
    LDA #$02                     ; $AB8E  A9 02
    STA $0C                      ; $AB90  85 0C

loc_0B_AB92:
    LDA #$2D                     ; $AB92  A9 2D
    JSR sub_0F_F663              ; $AB94  20 63 F6
    BCS loc_0B_ABB0              ; $AB97  B0 17
    SEC                          ; $AB99  38
    LDA $0600,X                  ; $AB9A  BD 00 06
    SBC #$04                     ; $AB9D  E9 04
    STA $0600,X                  ; $AB9F  9D 00 06
    LDA $0C                      ; $ABA2  A5 0C
    ASL A                        ; $ABA4  0A
    ASL A                        ; $ABA5  0A
    ADC #$4C                     ; $ABA6  69 4C
    TAY                          ; $ABA8  A8
    JSR sub_0F_F533              ; $ABA9  20 33 F5
    DEC $0C                      ; $ABAC  C6 0C
    BPL loc_0B_AB92              ; $ABAE  10 E2

loc_0B_ABB0:
    LDX $2F                      ; $ABB0  A6 2F
    LDY #$10                     ; $ABB2  A0 10
    BNE loc_0B_ABE1              ; $ABB4  D0 2B

loc_0B_ABB6:
    LDA #$03                     ; $ABB6  A9 03
    JSR sub_0E_C5A0              ; $ABB8  20 A0 C5
    LDX $2F                      ; $ABBB  A6 2F
    TAY                          ; $ABBD  A8
    LDA $ABEF,Y                  ; $ABBE  B9 EF AB
    STA $0640,X                  ; $ABC1  9D 40 06
    LDY #$00                     ; $ABC4  A0 00
    BEQ loc_0B_ABE1              ; $ABC6  F0 19

loc_0B_ABC8:
    JSR sub_0F_F63B              ; $ABC8  20 3B F6
    STA $0C                      ; $ABCB  85 0C
    LDY #$00                     ; $ABCD  A0 00
    LDA $0640,X                  ; $ABCF  BD 40 06
    BNE loc_0B_ABE1              ; $ABD2  D0 0D
    LDA $0C                      ; $ABD4  A5 0C
    CMP #$58                     ; $ABD6  C9 58
    BCS loc_0B_ABE4              ; $ABD8  B0 0A
    LDA #$20                     ; $ABDA  A9 20
    STA $0640,X                  ; $ABDC  9D 40 06
    LDY #$10                     ; $ABDF  A0 10

loc_0B_ABE1:
    DEC $0640,X                  ; $ABE1  DE 40 06

loc_0B_ABE4:
    TYA                          ; $ABE4  98
    STA $0440,X                  ; $ABE5  9D 40 04
    JSR sub_0B_AFA3              ; $ABE8  20 A3 AF
    JSR sub_0B_BE49              ; $ABEB  20 49 BE
    RTS                          ; $ABEE  60

    .byte $1F,$3E,$9C,$A9,$6C,$D0,$02  ; $ABEF
    LDA #$00                     ; $ABF6  A9 00
    STA $0C                      ; $ABF8  85 0C
    LDA $0440,X                  ; $ABFA  BD 40 04
    CMP #$10                     ; $ABFD  C9 10
    BCC loc_0B_AC3F              ; $ABFF  90 3E
    LDA $23                      ; $AC01  A5 23
    AND #$03                     ; $AC03  29 03
    BEQ loc_0B_AC3E              ; $AC05  F0 37
    LDA $0680,X                  ; $AC07  BD 80 06
    PHP                          ; $AC0A  08
    JSR sub_0B_BE49              ; $AC0B  20 49 BE
    PLP                          ; $AC0E  28
    BPL loc_0B_AC32              ; $AC0F  10 21
    LDA $2B                      ; $AC11  A5 2B
    BEQ loc_0B_AC32              ; $AC13  F0 1D
    LDA $06E0,X                  ; $AC15  BD E0 06
    CMP #$09                     ; $AC18  C9 09
    BNE loc_0B_AC23              ; $AC1A  D0 07
    LDA #$29                     ; $AC1C  A9 29
    JSR sub_0E_C477              ; $AC1E  20 77 C4
    LDX $2F                      ; $AC21  A6 2F

loc_0B_AC23:
    LDA #$0F                     ; $AC23  A9 0F
    STA $0640,X                  ; $AC25  9D 40 06
    LDA #$00                     ; $AC28  A9 00
    STA $04E0,X                  ; $AC2A  9D E0 04
    STA $04C0,X                  ; $AC2D  9D C0 04
    BEQ loc_0B_AC3B              ; $AC30  F0 09

loc_0B_AC32:
    LDA $06E0,X                  ; $AC32  BD E0 06
    CMP #$1B                     ; $AC35  C9 1B
    BEQ loc_0B_AC3E              ; $AC37  F0 05
    LDA #$10                     ; $AC39  A9 10

loc_0B_AC3B:
    STA $0440,X                  ; $AC3B  9D 40 04

loc_0B_AC3E:
    RTS                          ; $AC3E  60


loc_0B_AC3F:
    LDA #$00                     ; $AC3F  A9 00
    DEC $0640,X                  ; $AC41  DE 40 06
    BNE loc_0B_AC57              ; $AC44  D0 11
    JSR sub_0F_F63B              ; $AC46  20 3B F6
    LDA $46                      ; $AC49  A5 46
    AND #$01                     ; $AC4B  29 01
    ASL A                        ; $AC4D  0A
    ASL A                        ; $AC4E  0A
    ADC $0C                      ; $AC4F  65 0C
    TAY                          ; $AC51  A8
    JSR sub_0F_F533              ; $AC52  20 33 F5
    LDA #$10                     ; $AC55  A9 10

loc_0B_AC57:
    STA $0440,X                  ; $AC57  9D 40 04
    JSR sub_0B_BE49              ; $AC5A  20 49 BE
    RTS                          ; $AC5D  60

    LDA $0420,X                  ; $AC5E  BD 20 04
    AND #$80                     ; $AC61  29 80
    BEQ loc_0B_AC6A              ; $AC63  F0 05
    LDA #$7E                     ; $AC65  A9 7E
    STA $06A0,X                  ; $AC67  9D A0 06

loc_0B_AC6A:
    LDY #$00                     ; $AC6A  A0 00
    SEC                          ; $AC6C  38
    LDA $0600,X                  ; $AC6D  BD 00 06
    SBC #$08                     ; $AC70  E9 08
    CMP $0600                    ; $AC72  CD 00 06
    BNE loc_0B_AC78              ; $AC75  D0 01
    INY                          ; $AC77  C8

loc_0B_AC78:
    LDA $ACC6,Y                  ; $AC78  B9 C6 AC
    STA $04E0,X                  ; $AC7B  9D E0 04
    LDA $ACC8,Y                  ; $AC7E  B9 C8 AC
    STA $04C0,X                  ; $AC81  9D C0 04
    JSR sub_0B_BE49              ; $AC84  20 49 BE
    LDA $2A                      ; $AC87  A5 2A
    BEQ loc_0B_AC94              ; $AC89  F0 09

loc_0B_AC8B:
    LDA $0420,X                  ; $AC8B  BD 20 04
    EOR #$40                     ; $AC8E  49 40
    STA $0420,X                  ; $AC90  9D 20 04
    RTS                          ; $AC93  60


loc_0B_AC94:
    LDY #$00                     ; $AC94  A0 00
    LDA $0420,X                  ; $AC96  BD 20 04
    AND #$40                     ; $AC99  29 40
    BNE loc_0B_AC9F              ; $AC9B  D0 02
    LDY #$02                     ; $AC9D  A0 02

loc_0B_AC9F:
    CLC                          ; $AC9F  18
    LDA $0480,X                  ; $ACA0  BD 80 04
    ADC $ACC3,Y                  ; $ACA3  79 C3 AC
    STA $00                      ; $ACA6  85 00
    LDA $0460,X                  ; $ACA8  BD 60 04
    ADC $ACC2,Y                  ; $ACAB  79 C2 AC
    STA $01                      ; $ACAE  85 01
    CLC                          ; $ACB0  18
    LDA $0600,X                  ; $ACB1  BD 00 06
    ADC #$06                     ; $ACB4  69 06
    STA $03                      ; $ACB6  85 03
    JSR sub_0E_CC2D              ; $ACB8  20 2D CC
    LDA $2B                      ; $ACBB  A5 2B
    CMP #$01                     ; $ACBD  C9 01
    BNE loc_0B_AC8B              ; $ACBF  D0 CA
    RTS                          ; $ACC1  60

    .byte $00,$10,$FF,$F0,$61,$E0,$00,$01,$BD,$80,$06,$48,$20,$49,$BE,$B0  ; $ACC2
    .byte $51,$BD,$E0,$06,$C9,$1B,$F0,$4A,$68,$9D,$80,$06,$A9,$00,$9D,$60  ; $ACD2
    .byte $06,$BD,$40,$06,$F0,$16,$DE,$40,$06,$D0,$27,$A9,$30,$9D,$40,$04  ; $ACE2
    .byte $BD,$20,$04,$49,$40,$9D,$20,$04,$20,$63,$AB,$60,$A5,$2A,$05,$2B  ; $ACF2
    .byte $F0,$10,$A9,$10,$9D,$40,$04,$A5,$46,$29,$01,$A8,$B9,$26,$AD,$9D  ; $AD02
    .byte $40,$06,$BD,$40,$04,$29,$10,$D0,$08,$BD,$40,$04,$29,$F0,$9D,$40  ; $AD12
    .byte $04,$60,$68,$60,$3F,$7E,$BD,$40,$04,$29,$F0,$D0,$2F,$BD,$20,$04  ; $AD22
    .byte $29,$08,$D0,$23,$A0,$00,$38,$AD,$00,$06,$FD,$00,$06,$B0,$06,$49  ; $AD32
    .byte $FF,$69,$01,$A0,$02,$C9,$28,$08,$B9,$73,$AD,$9D,$60,$06,$B9,$74  ; $AD42
    .byte $AD,$9D,$80,$06,$28,$90,$05,$A9,$00,$9D,$40,$04,$20,$49,$BE,$BD  ; $AD52
    .byte $40,$04,$C9,$20,$D0,$0A,$A9,$2A,$9D,$E0,$06,$A9,$00,$9D,$40,$04  ; $AD62
    .byte $60,$60,$FF,$A0,$00  ; $AD72
    LDA $0420,X                  ; $AD77  BD 20 04
    AND #$20                     ; $AD7A  29 20
    BNE loc_0B_ADB5              ; $AD7C  D0 37
    JSR sub_0B_AEA6              ; $AD7E  20 A6 AE
    BCS loc_0B_ADB5              ; $AD81  B0 32
    LDY #$00                     ; $AD83  A0 00
    LDA $0640,X                  ; $AD85  BD 40 06
    CMP #$40                     ; $AD88  C9 40
    BCC loc_0B_AD9A              ; $AD8A  90 0E
    CMP #$80                     ; $AD8C  C9 80
    BCC loc_0B_AD98              ; $AD8E  90 08
    LDA #$00                     ; $AD90  A9 00
    STA $0640,X                  ; $AD92  9D 40 06
    TAY                          ; $AD95  A8
    BEQ loc_0B_AD9A              ; $AD96  F0 02

loc_0B_AD98:
    LDY #$02                     ; $AD98  A0 02

loc_0B_AD9A:
    CLC                          ; $AD9A  18
    LDA $0660,X                  ; $AD9B  BD 60 06
    ADC $ADB1,Y                  ; $AD9E  79 B1 AD
    STA $0660,X                  ; $ADA1  9D 60 06
    LDA $0680,X                  ; $ADA4  BD 80 06
    ADC $ADB2,Y                  ; $ADA7  79 B2 AD
    STA $0680,X                  ; $ADAA  9D 80 06
    INC $0640,X                  ; $ADAD  FE 40 06
    RTS                          ; $ADB0  60

    .byte $10,$00,$F0,$FF  ; $ADB1

loc_0B_ADB5:
    JSR sub_0B_ADD4              ; $ADB5  20 D4 AD
    LDY #$10                     ; $ADB8  A0 10
    LDA $06E0,X                  ; $ADBA  BD E0 06
    CMP #$07                     ; $ADBD  C9 07
    BEQ loc_0B_ADC3              ; $ADBF  F0 02
    LDY #$16                     ; $ADC1  A0 16

loc_0B_ADC3:
    SEC                          ; $ADC3  38
    STY $0C                      ; $ADC4  84 0C
    LDA $0600                    ; $ADC6  AD 00 06
    SBC $0C                      ; $ADC9  E5 0C
    STA $0600,X                  ; $ADCB  9D 00 06
    LDY #$40                     ; $ADCE  A0 40
    JSR sub_0F_F533              ; $ADD0  20 33 F5
    RTS                          ; $ADD3  60


sub_0B_ADD4:
    LDA $0420,X                  ; $ADD4  BD 20 04
    AND #$08                     ; $ADD7  29 08
    BNE loc_0B_AE09              ; $ADD9  D0 2E
    DEC $0640,X                  ; $ADDB  DE 40 06
    BNE loc_0B_ADF5              ; $ADDE  D0 15
    CLC                          ; $ADE0  18
    LDA #$06                     ; $ADE1  A9 06
    STA $0420,X                  ; $ADE3  9D 20 04
    LDA $1A                      ; $ADE6  A5 1A
    ADC #$F8                     ; $ADE8  69 F8
    STA $0480,X                  ; $ADEA  9D 80 04
    LDA $1B                      ; $ADED  A5 1B
    ADC #$00                     ; $ADEF  69 00
    STA $0460,X                  ; $ADF1  9D 60 04
    RTS                          ; $ADF4  60


loc_0B_ADF5:
    LDA #$D8                     ; $ADF5  A9 D8
    STA $0600,X                  ; $ADF7  9D 00 06
    LDA $0480                    ; $ADFA  AD 80 04
    STA $0480,X                  ; $ADFD  9D 80 04
    LDA $0460                    ; $AE00  AD 60 04
    STA $0460,X                  ; $AE03  9D 60 04
    PLA                          ; $AE06  68
    PLA                          ; $AE07  68
    RTS                          ; $AE08  60


loc_0B_AE09:
    LDA #$F8                     ; $AE09  A9 F8
    STA $0600,X                  ; $AE0B  9D 00 06
    PLA                          ; $AE0E  68
    PLA                          ; $AE0F  68
    RTS                          ; $AE10  60

    .byte $20,$A5,$B3,$BD,$20,$04,$29,$20,$D0,$0B,$FE,$40,$06,$20,$A3,$AF  ; $AE11
    .byte $20,$A6,$AE,$90,$1B,$20,$D4,$AD,$A9,$80,$9D,$00,$06,$A9,$20,$9D  ; $AE21
    .byte $E0,$04,$A9,$01,$9D,$C0,$04,$A9,$00,$9D,$60,$06,$9D,$80,$06,$60  ; $AE31
    .byte $BD,$40,$06,$C9,$38,$90,$55,$D0,$0C,$A9,$00,$9D,$C0,$04,$9D,$E0  ; $AE41
    .byte $04,$A9,$10,$D0,$4C,$C9,$48,$90,$43,$D0,$2C,$BD,$A0,$06,$D0,$26  ; $AE51
    .byte $A9,$1C,$85,$0D,$A9,$2D,$20,$63,$F6,$B0,$1B,$A4,$0D,$20,$33,$F5  ; $AE61
    .byte $98,$18,$69,$10,$29,$40,$5D,$20,$04,$9D,$20,$04,$C8,$C8,$C8,$C8  ; $AE71
    .byte $84,$0D,$C0,$3C,$90,$DE,$60,$C9,$58,$90,$11,$A9,$20,$9D,$E0,$04  ; $AE81
    .byte $A9,$01,$9D,$C0,$04,$A9,$00,$9D,$40,$06,$F0,$05,$BD,$40,$04,$29  ; $AE91
    .byte $F0,$9D,$40,$04,$60  ; $AEA1

sub_0B_AEA6:
    LDA $6B,X                    ; $AEA6  B5 6B
    PHA                          ; $AEA8  48
    LDA $06E0,X                  ; $AEA9  BD E0 06
    PHA                          ; $AEAC  48
    JSR sub_0B_BE49              ; $AEAD  20 49 BE
    LDA $0420,X                  ; $AEB0  BD 20 04
    AND #$08                     ; $AEB3  29 08
    BNE loc_0B_AEEE              ; $AEB5  D0 37
    BCS loc_0B_AED6              ; $AEB7  B0 1D
    LDA $06E0,X                  ; $AEB9  BD E0 06
    CMP #$1B                     ; $AEBC  C9 1B
    BNE loc_0B_AEEE              ; $AEBE  D0 2E
    PLA                          ; $AEC0  68
    PHA                          ; $AEC1  48
    CMP #$08                     ; $AEC2  C9 08
    BEQ loc_0B_AEF7              ; $AEC4  F0 31

loc_0B_AEC6:
    LDA #$00                     ; $AEC6  A9 00
    JSR sub_0F_F663              ; $AEC8  20 63 F6
    BCS loc_0B_AEF2              ; $AECB  B0 25
    LDA #$20                     ; $AECD  A9 20
    STA $0420,X                  ; $AECF  9D 20 04
    LDA #$48                     ; $AED2  A9 48
    BNE loc_0B_AED8              ; $AED4  D0 02

loc_0B_AED6:
    LDA #$01                     ; $AED6  A9 01

loc_0B_AED8:
    STA $0640,X                  ; $AED8  9D 40 06
    LDA #$00                     ; $AEDB  A9 00
    STA $06A0,X                  ; $AEDD  9D A0 06
    PLA                          ; $AEE0  68
    STA $06E0,X                  ; $AEE1  9D E0 06
    PLA                          ; $AEE4  68
    STA $6B,X                    ; $AEE5  95 6B
    LDA #$14                     ; $AEE7  A9 14
    STA $06C0,X                  ; $AEE9  9D C0 06
    SEC                          ; $AEEC  38
    RTS                          ; $AEED  60


loc_0B_AEEE:
    PLA                          ; $AEEE  68
    PLA                          ; $AEEF  68
    CLC                          ; $AEF0  18
    RTS                          ; $AEF1  60


loc_0B_AEF2:
    PLA                          ; $AEF2  68
    PLA                          ; $AEF3  68
    PLA                          ; $AEF4  68
    PLA                          ; $AEF5  68
    RTS                          ; $AEF6  60


loc_0B_AEF7:
    JSR sub_0B_AEFD              ; $AEF7  20 FD AE
    JMP loc_0B_AEC6              ; $AEFA  4C C6 AE


sub_0B_AEFD:
    LDA #$0B                     ; $AEFD  A9 0B
    STA $0C                      ; $AEFF  85 0C
    LDA #$FF                     ; $AF01  A9 FF
    STA $0D                      ; $AF03  85 0D
    LDA #$02                     ; $AF05  A9 02
    STA $0E                      ; $AF07  85 0E
    BNE loc_0B_AF12              ; $AF09  D0 07

loc_0B_AF0B:
    LDX #$10                     ; $AF0B  A2 10
    JSR sub_0E_C576              ; $AF0D  20 76 C5
    BCS loc_0B_AF20              ; $AF10  B0 0E

loc_0B_AF12:
    LDY $2F                      ; $AF12  A4 2F
    JSR sub_0F_F841              ; $AF14  20 41 F8
    LDA #$28                     ; $AF17  A9 28
    STA $06E0,X                  ; $AF19  9D E0 06
    LDA $0C                      ; $AF1C  A5 0C
    BPL loc_0B_AF0B              ; $AF1E  10 EB

loc_0B_AF20:
    LDA #$12                     ; $AF20  A9 12
    JSR sub_0E_C477              ; $AF22  20 77 C4
    RTS                          ; $AF25  60

    .byte $20,$A5,$B3,$20,$A3,$AF,$20,$49,$BE,$FE,$40,$06,$BD,$40,$04,$C9  ; $AF26
    .byte $40,$B0,$51,$C9,$30,$B0,$09,$BD,$40,$06,$C9,$4D,$90,$59,$B0,$5C  ; $AF36
    .byte $D0,$05,$A9,$00,$9D,$40,$06,$BD,$40,$06,$85,$0C,$29,$1F,$D0,$2E  ; $AF46
    .byte $A9,$2D,$20,$63,$F6,$B0,$1E,$A0,$F9,$BD,$20,$04,$29,$40,$F0,$02  ; $AF56
    .byte $A0,$07,$18,$98,$7D,$80,$04,$9D,$80,$04,$A5,$0C,$4A,$4A,$4A,$69  ; $AF66
    .byte $0C,$A8,$20,$33,$F5,$A6,$2F,$BD,$40,$06,$C9,$60,$F0,$13,$A9,$31  ; $AF76
    .byte $9D,$40,$04,$60,$C9,$60,$90,$14,$A9,$00,$9D,$40,$04,$9D,$40,$06  ; $AF86
    .byte $60,$A9,$40,$9D,$40,$04,$60,$A9,$00,$9D,$40,$04,$60  ; $AF96

sub_0B_AFA3:
    LDA $0440,X                  ; $AFA3  BD 40 04
    AND #$F0                     ; $AFA6  29 F0
    BNE loc_0B_AFB4              ; $AFA8  D0 0A
    LDA $0420,X                  ; $AFAA  BD 20 04
    AND #$80                     ; $AFAD  29 80
    BEQ loc_0B_AFB4              ; $AFAF  F0 03
    JSR sub_0B_BF52              ; $AFB1  20 52 BF

loc_0B_AFB4:
    RTS                          ; $AFB4  60

    LDA $0640,X                  ; $AFB5  BD 40 06
    BNE loc_0B_B009              ; $AFB8  D0 4F
    JSR sub_0B_BE49              ; $AFBA  20 49 BE
    LDA $0680,X                  ; $AFBD  BD 80 06
    BPL loc_0B_B008              ; $AFC0  10 46
    LDA #$1B                     ; $AFC2  A9 1B
    JSR sub_0F_F663              ; $AFC4  20 63 F6
    BCS loc_0B_AFCF              ; $AFC7  B0 06
    INC $0440,X                  ; $AFC9  FE 40 04
    JSR sub_0B_B045              ; $AFCC  20 45 B0

loc_0B_AFCF:
    LDX $2F                      ; $AFCF  A6 2F
    LDA #$03                     ; $AFD1  A9 03
    STA $0C                      ; $AFD3  85 0C

loc_0B_AFD5:
    LDA #$26                     ; $AFD5  A9 26
    JSR sub_0F_F663              ; $AFD7  20 63 F6
    JSR sub_0B_B045              ; $AFDA  20 45 B0
    LDA $0C                      ; $AFDD  A5 0C
    AND #$0E                     ; $AFDF  29 0E
    ASL A                        ; $AFE1  0A
    ADC #$44                     ; $AFE2  69 44
    TAY                          ; $AFE4  A8
    JSR sub_0F_F533              ; $AFE5  20 33 F5
    LDA $0C                      ; $AFE8  A5 0C
    AND #$01                     ; $AFEA  29 01
    TAY                          ; $AFEC  A8
    LDA $B043,Y                  ; $AFED  B9 43 B0
    STA $0420,X                  ; $AFF0  9D 20 04
    DEC $0C                      ; $AFF3  C6 0C
    BPL loc_0B_AFD5              ; $AFF5  10 DE
    LDX $2F                      ; $AFF7  A6 2F
    LDA #$BB                     ; $AFF9  A9 BB
    STA $0640,X                  ; $AFFB  9D 40 06
    LDA #$22                     ; $AFFE  A9 22
    STA $0420,X                  ; $B000  9D 20 04
    LDA #$D8                     ; $B003  A9 D8
    STA $0600,X                  ; $B005  9D 00 06

loc_0B_B008:
    RTS                          ; $B008  60


loc_0B_B009:
    DEC $0640,X                  ; $B009  DE 40 06
    BNE loc_0B_B036              ; $B00C  D0 28
    LDA #$0D                     ; $B00E  A9 0D
    STA $0C                      ; $B010  85 0C
    LDX #$10                     ; $B012  A2 10

loc_0B_B014:
    JSR sub_0F_F516              ; $B014  20 16 F5
    BCS loc_0B_B025              ; $B017  B0 0C
    LDA $0420,X                  ; $B019  BD 20 04
    AND #$20                     ; $B01C  29 20
    BEQ loc_0B_B03A              ; $B01E  F0 1A
    INX                          ; $B020  E8
    CPX #$20                     ; $B021  E0 20
    BNE loc_0B_B014              ; $B023  D0 EF

loc_0B_B025:
    LDX $2F                      ; $B025  A6 2F
    LDA #$13                     ; $B027  A9 13
    STA $0420,X                  ; $B029  9D 20 04
    LDA #$F1                     ; $B02C  A9 F1
    STA $0660,X                  ; $B02E  9D 60 06
    LDA #$08                     ; $B031  A9 08
    STA $0680,X                  ; $B033  9D 80 06

loc_0B_B036:
    JSR sub_0B_BE49              ; $B036  20 49 BE
    RTS                          ; $B039  60


loc_0B_B03A:
    LDX $2F                      ; $B03A  A6 2F
    INC $0640,X                  ; $B03C  FE 40 06
    JSR sub_0B_BE49              ; $B03F  20 49 BE
    RTS                          ; $B042  60

    .byte $13,$53  ; $B043

sub_0B_B045:
    LDA #$00                     ; $B045  A9 00
    STA $0660,X                  ; $B047  9D 60 06
    STA $0680,X                  ; $B04A  9D 80 06
    STA $04E0,X                  ; $B04D  9D E0 04
    STA $04C0,X                  ; $B050  9D C0 04
    RTS                          ; $B053  60

    .byte $BD,$40,$04,$29,$F0,$C9,$30,$D0,$15,$BD,$20,$04,$29,$80,$F0,$08  ; $B054
    .byte $A9,$20,$9D,$40,$06,$20,$52,$BF,$20,$E0,$B0,$4C,$92,$B0,$C9,$00  ; $B064
    .byte $F0,$25,$C9,$20,$08,$20,$E0,$B0,$28,$D0,$5A,$BD,$40,$06,$C9,$10  ; $B074
    .byte $D0,$0C,$A9,$1A,$20,$63,$F6,$B0,$05,$A0,$24,$20,$33,$F5,$A6,$2F  ; $B084
    .byte $DE,$40,$06,$D0,$38,$F0,$0F,$20,$49,$BE,$A5,$2B,$F0,$2F,$A9,$00  ; $B094
    .byte $9D,$C0,$04,$9D,$E0,$04,$A9,$06,$20,$A0,$C5,$A6,$2F,$A0,$00,$4A  ; $B0A4
    .byte $B0,$0F,$C8,$4A,$90,$0B,$C8,$A9,$CC,$9D,$60,$06,$A9,$04,$9D,$80  ; $B0B4
    .byte $06,$B9,$DA,$B0,$9D,$40,$04,$B9,$DD,$B0,$9D,$40,$06,$BD,$40,$04  ; $B0C4
    .byte $29,$F0,$9D,$40,$04,$60,$30,$10,$00,$20,$20,$20,$20,$3B,$F6,$18  ; $B0D4
    .byte $69,$38,$85,$0C,$BD,$20,$04,$29,$40,$F0,$24,$A9,$00,$9D,$40,$04  ; $B0E4
    .byte $A9,$85,$9D,$60,$06,$A9,$05,$9D,$80,$06,$A6,$0C,$A0,$00,$A9,$2A  ; $B0F4
    .byte $20,$AC,$C5,$A6,$2F,$A5,$04,$9D,$E0,$04,$A5,$05,$9D,$C0,$04,$20  ; $B104
    .byte $49,$BE,$60,$BD,$40,$06,$29,$3F,$D0,$78,$A9,$03,$20,$A0,$C5,$A6  ; $B114
    .byte $2F,$85,$0C,$BD,$00,$06,$C9,$58,$B0,$0B,$A5,$0C,$C9,$02,$F0,$11  ; $B124
    .byte $06,$0C,$4C,$45,$B1,$C9,$C0,$90,$08,$A5,$0C,$C9,$01,$F0,$02,$46  ; $B134
    .byte $0C,$A4,$0C,$B9,$A2,$B1,$9D,$80,$06,$B9,$A5,$B1,$9D,$60,$06,$BD  ; $B144
    .byte $40,$06,$D0,$3E,$A9,$80,$9D,$40,$06,$BD,$20,$04,$49,$40,$9D,$20  ; $B154
    .byte $04,$A9,$01,$85,$0C,$A9,$2D,$20,$63,$F6,$B0,$24,$A4,$0C,$B9,$A8  ; $B164
    .byte $B1,$9D,$20,$04,$18,$BD,$80,$04,$79,$AA,$B1,$9D,$80,$04,$BD,$60  ; $B174
    .byte $04,$79,$AC,$B1,$9D,$60,$04,$A0,$D0,$20,$33,$F5,$C6,$0C,$10,$D5  ; $B184
    .byte $A6,$2F,$DE,$40,$06,$20,$49,$BE,$B0,$03,$20,$AE,$B1,$60,$00,$00  ; $B194
    .byte $FF,$00,$60,$A0,$02,$42,$0C,$F4,$00,$FF  ; $B1A4

sub_0B_B1AE:
    LDY $9A                      ; $B1AE  A4 9A
    LDA $0460,X                  ; $B1B0  BD 60 04
    STA $0700,Y                  ; $B1B3  99 00 07
    LDA $0480,X                  ; $B1B6  BD 80 04
    STA $0708,Y                  ; $B1B9  99 08 07
    SEC                          ; $B1BC  38
    LDA $0600,X                  ; $B1BD  BD 00 06
    SBC #$08                     ; $B1C0  E9 08
    STA $0710,Y                  ; $B1C2  99 10 07
    LDA $04E0,X                  ; $B1C5  BD E0 04
    STA $9C                      ; $B1C8  85 9C
    LDA $04C0,X                  ; $B1CA  BD C0 04
    STA $9D                      ; $B1CD  85 9D
    LDA $0420,X                  ; $B1CF  BD 20 04
    AND #$40                     ; $B1D2  29 40
    STA $0718,Y                  ; $B1D4  99 18 07
    INC $9A                      ; $B1D7  E6 9A
    RTS                          ; $B1D9  60

    JSR sub_0F_F63B              ; $B1DA  20 3B F6
    LDA #$1E                     ; $B1DD  A9 1E
    STA $06E0,X                  ; $B1DF  9D E0 06
    CLC                          ; $B1E2  18
    LDA $0600,X                  ; $B1E3  BD 00 06
    ADC #$04                     ; $B1E6  69 04
    STA $0600,X                  ; $B1E8  9D 00 06
    LDA #$1D                     ; $B1EB  A9 1D
    JSR sub_0F_F663              ; $B1ED  20 63 F6
    BCS loc_0B_B230              ; $B1F0  B0 3E
    LDY $2F                      ; $B1F2  A4 2F
    LDA $006B,Y                  ; $B1F4  B9 6B 00
    STA $6B,X                    ; $B1F7  95 6B
    LDA $0420,X                  ; $B1F9  BD 20 04
    ORA #$04                     ; $B1FC  09 04
    STA $0420,X                  ; $B1FE  9D 20 04
    SEC                          ; $B201  38
    LDA $0600,X                  ; $B202  BD 00 06
    SBC #$10                     ; $B205  E9 10
    STA $0600,X                  ; $B207  9D 00 06
    JSR sub_0B_B045              ; $B20A  20 45 B0
    LDY $2F                      ; $B20D  A4 2F
    LDA $0420,Y                  ; $B20F  B9 20 04
    AND #$40                     ; $B212  29 40
    BEQ loc_0B_B22F              ; $B214  F0 19
    LDA #$29                     ; $B216  A9 29
    STA $06E0,Y                  ; $B218  99 E0 06
    LDA #$1F                     ; $B21B  A9 1F
    STA $0640,Y                  ; $B21D  99 40 06
    LDA #$1D                     ; $B220  A9 1D
    STA $06E0,X                  ; $B222  9D E0 06
    LDA #$09                     ; $B225  A9 09
    STA $0640,X                  ; $B227  9D 40 06
    LDA #$04                     ; $B22A  A9 04
    STA $0680,X                  ; $B22C  9D 80 06

loc_0B_B22F:
    RTS                          ; $B22F  60


loc_0B_B230:
    LDX $2F                      ; $B230  A6 2F
    LDA #$F8                     ; $B232  A9 F8
    STA $0600,X                  ; $B234  9D 00 06
    LDA #$FF                     ; $B237  A9 FF
    STA $6B,X                    ; $B239  95 6B
    RTS                          ; $B23B  60

    .byte $20,$3B,$F6,$85,$0C,$BD,$40,$04,$29,$F0,$F0,$58,$BD,$40,$04,$C9  ; $B23C
    .byte $20,$D0,$32,$A9,$2E,$20,$63,$F6,$B0,$24,$BD,$20,$04,$09,$10,$9D  ; $B24C
    .byte $20,$04,$A0,$70,$20,$33,$F5,$8A,$48,$A6,$0C,$A0,$00,$A9,$27,$20  ; $B25C
    .byte $AC,$C5,$68,$AA,$A5,$04,$9D,$E0,$04,$A5,$05,$9D,$C0,$04,$A6,$2F  ; $B26C
    .byte $DE,$40,$06,$D0,$37,$C9,$30,$D0,$33,$BD,$40,$06,$D0,$0F,$A5,$46  ; $B27C
    .byte $29,$01,$A8,$B9,$C8,$B2,$9D,$40,$06,$A9,$00,$F0,$07,$A9,$10,$9D  ; $B28C
    .byte $40,$04,$D0,$18,$9D,$40,$04,$DE,$40,$06,$D0,$10,$A9,$10,$9D,$40  ; $B29C
    .byte $04,$A5,$46,$29,$01,$A8,$B9,$C6,$B2,$9D,$40,$06,$20,$A3,$AF,$20  ; $B2AC
    .byte $49,$BE,$A5,$2B,$F0,$03,$20,$45,$B0,$60,$05,$0A,$3F,$BB  ; $B2BC
    LDA #$08                     ; $B2CA  A9 08
    STA $0D                      ; $B2CC  85 0D
    STA $0E                      ; $B2CE  85 0E
    LDA #$04                     ; $B2D0  A9 04
    STA $0F                      ; $B2D2  85 0F
    BNE loc_0B_B2E2              ; $B2D4  D0 0C
    LDA #$F8                     ; $B2D6  A9 F8
    STA $0D                      ; $B2D8  85 0D
    LDA #$09                     ; $B2DA  A9 09
    STA $0E                      ; $B2DC  85 0E
    LDA #$FC                     ; $B2DE  A9 FC
    STA $0F                      ; $B2E0  85 0F

loc_0B_B2E2:
    JSR sub_0B_B3A5              ; $B2E2  20 A5 B3
    LDA $0440,X                  ; $B2E5  BD 40 04
    BEQ loc_0B_B2EE              ; $B2E8  F0 04
    CMP #$01                     ; $B2EA  C9 01
    BNE loc_0B_B327              ; $B2EC  D0 39

loc_0B_B2EE:
    LDA $0640,X                  ; $B2EE  BD 40 06
    BEQ loc_0B_B2FA              ; $B2F1  F0 07
    LDA #$00                     ; $B2F3  A9 00
    STA $0440,X                  ; $B2F5  9D 40 04
    BEQ loc_0B_B377              ; $B2F8  F0 7D

loc_0B_B2FA:
    JSR sub_0F_F63B              ; $B2FA  20 3B F6
    PHA                          ; $B2FD  48
    LDA $0420,X                  ; $B2FE  BD 20 04
    AND #$BF                     ; $B301  29 BF
    STA $0420,X                  ; $B303  9D 20 04
    PLA                          ; $B306  68
    CMP #$50                     ; $B307  C9 50
    BCC loc_0B_B312              ; $B309  90 07
    LDA #$00                     ; $B30B  A9 00
    STA $0440,X                  ; $B30D  9D 40 04
    BEQ loc_0B_B38A              ; $B310  F0 78

loc_0B_B312:
    LDA #$10                     ; $B312  A9 10
    STA $0440,X                  ; $B314  9D 40 04
    SEC                          ; $B317  38
    LDA $0600,X                  ; $B318  BD 00 06
    SBC $0D                      ; $B31B  E5 0D
    STA $0600,X                  ; $B31D  9D 00 06
    LDA #$60                     ; $B320  A9 60
    STA $0640,X                  ; $B322  9D 40 06
    BNE loc_0B_B377              ; $B325  D0 50

loc_0B_B327:
    CMP #$50                     ; $B327  C9 50
    BNE loc_0B_B330              ; $B329  D0 05
    LDA #$20                     ; $B32B  A9 20
    STA $0440,X                  ; $B32D  9D 40 04

loc_0B_B330:
    BCS loc_0B_B377              ; $B330  B0 45
    LDA $0640,X                  ; $B332  BD 40 06
    BEQ loc_0B_B364              ; $B335  F0 2D
    AND #$1F                     ; $B337  29 1F
    BNE loc_0B_B387              ; $B339  D0 4C

loc_0B_B33B:
    LDA #$2D                     ; $B33B  A9 2D
    JSR sub_0F_F663              ; $B33D  20 63 F6
    BCS loc_0B_B360              ; $B340  B0 1E
    SEC                          ; $B342  38
    LDA $0600,X                  ; $B343  BD 00 06
    SBC $0F                      ; $B346  E5 0F
    STA $0600,X                  ; $B348  9D 00 06
    LDY $0E                      ; $B34B  A4 0E
    LDA $B39B,Y                  ; $B34D  B9 9B B3
    STA $0420,X                  ; $B350  9D 20 04
    LDA $B391,Y                  ; $B353  B9 91 B3
    TAY                          ; $B356  A8
    JSR sub_0F_F533              ; $B357  20 33 F5
    DEC $0E                      ; $B35A  C6 0E
    DEC $0E                      ; $B35C  C6 0E
    BPL loc_0B_B33B              ; $B35E  10 DB

loc_0B_B360:
    LDX $2F                      ; $B360  A6 2F
    BNE loc_0B_B387              ; $B362  D0 23

loc_0B_B364:
    LDA #$03                     ; $B364  A9 03
    JSR sub_0E_C5A0              ; $B366  20 A0 C5
    TAX                          ; $B369  AA
    LDA $B38E,X                  ; $B36A  BD 8E B3
    LDX $2F                      ; $B36D  A6 2F
    STA $0640,X                  ; $B36F  9D 40 06
    LDA #$50                     ; $B372  A9 50
    STA $0440,X                  ; $B374  9D 40 04

loc_0B_B377:
    LDA $0440,X                  ; $B377  BD 40 04
    CMP #$60                     ; $B37A  C9 60
    BNE loc_0B_B387              ; $B37C  D0 09
    CLC                          ; $B37E  18
    LDA $0600,X                  ; $B37F  BD 00 06
    ADC $0D                      ; $B382  65 0D
    STA $0600,X                  ; $B384  9D 00 06

loc_0B_B387:
    DEC $0640,X                  ; $B387  DE 40 06

loc_0B_B38A:
    JSR sub_0B_BE49              ; $B38A  20 49 BE
    RTS                          ; $B38D  60

    .byte $20,$3F,$7D,$60,$60,$5C,$64,$58,$68,$5C,$64,$60,$60,$42,$42,$42  ; $B38E
    .byte $42,$02,$02,$02,$02,$02,$02  ; $B39E

sub_0B_B3A5:
    LDA $06A0,X                  ; $B3A5  BD A0 06
    BEQ loc_0B_B3AF              ; $B3A8  F0 05
    JSR sub_0B_BE49              ; $B3AA  20 49 BE
    PLA                          ; $B3AD  68
    PLA                          ; $B3AE  68

loc_0B_B3AF:
    RTS                          ; $B3AF  60

    .byte $BD,$20,$04,$29,$20,$D0,$18,$DE,$40,$06,$D0,$0F,$BD,$20,$04,$09  ; $B3B0
    .byte $20,$29,$F0,$9D,$20,$04,$A9,$50,$9D,$40,$06,$20,$49,$BE,$60,$DE  ; $B3C0
    .byte $40,$06,$D0,$F7,$BD,$20,$04,$29,$0F,$09,$02,$9D,$20,$04,$A9,$3F  ; $B3D0
    .byte $9D,$40,$06,$20,$49,$BE,$BD,$E0,$06,$29,$01,$D0,$0B,$A5,$31,$C9  ; $B3E0
    .byte $04,$D0,$05,$A9,$13,$20,$77,$C4,$60,$BD,$40,$06,$C9,$BB,$D0,$05  ; $B3F0
    .byte $A9,$00,$9D,$C0,$06,$DE,$40,$06,$D0,$78,$A0,$00,$A5,$31,$C9,$01  ; $B400
    .byte $D0,$0A,$A5,$1B,$C9,$0A,$F0,$0E,$A0,$02,$D0,$0A,$A0,$04,$A5,$1B  ; $B410
    .byte $C9,$05,$F0,$02,$A0,$06,$B9,$86,$B4,$85,$04,$B9,$87,$B4,$85,$05  ; $B420
    .byte $BD,$C0,$06,$0A,$A8,$FE,$C0,$06,$B1,$04,$D0,$00,$C9,$FF,$D0,$07  ; $B430
    .byte $A9,$00,$9D,$C0,$06,$A9,$3F,$9D,$40,$06,$C8,$B1,$04,$85,$0E,$A9  ; $B440
    .byte $01,$85,$0C,$A5,$0E,$20,$25,$C6,$A9,$27,$20,$63,$F6,$B0,$21,$20  ; $B450
    .byte $45,$B0,$A9,$00,$9D,$20,$04,$A9,$70,$9D,$40,$06,$A5,$0C,$9D,$80  ; $B460
    .byte $04,$A5,$0D,$9D,$00,$06,$A5,$0E,$9D,$C0,$06,$A9,$2C,$20,$77,$C4  ; $B470
    .byte $A6,$2F,$20,$49,$BE,$60,$8E,$B4,$9C,$B4,$B2,$B4,$BA,$B4,$3F,$12  ; $B480
    .byte $3F,$00,$3F,$1E,$3F,$24,$3F,$0C,$3F,$18,$FF,$06,$01,$2A,$3F,$30  ; $B490
    .byte $01,$3C,$3F,$48,$01,$42,$3F,$54,$01,$60,$3F,$66,$3F,$5A,$3F,$4E  ; $B4A0
    .byte $FF,$36,$3F,$0C,$3F,$06,$3F,$12,$FF,$00,$3F,$2A,$3F,$24,$3F,$1E  ; $B4B0
    .byte $FF,$18,$BD,$40,$04,$29,$F0,$C9,$50,$D0,$03,$9D,$40,$04,$DE,$40  ; $B4C0
    .byte $06,$F0,$06,$20,$49,$BE,$B0,$01,$60,$A9,$00,$85,$0C,$BD,$C0,$06  ; $B4D0
    .byte $20,$25,$C6,$4C,$B1,$BE,$BD,$60,$04,$C9,$0A,$D0,$05,$A9,$06,$9D  ; $B4E0
    .byte $40,$06,$BD,$40,$06,$29,$01,$F0,$41,$BD,$40,$04,$D0,$05,$A9,$30  ; $B4F0
    .byte $9D,$40,$04,$BD,$40,$06,$A8,$BD,$20,$04,$29,$40,$F0,$0A,$B9,$92  ; $B500
    .byte $B5,$DD,$80,$04,$B0,$56,$90,$08,$B9,$92,$B5,$DD,$80,$04,$90,$4C  ; $B510
    .byte $9D,$80,$04,$A9,$00,$9D,$40,$04,$BD,$20,$04,$09,$10,$9D,$20,$04  ; $B520
    .byte $A0,$68,$20,$33,$F5,$FE,$40,$06,$D0,$32,$BD,$40,$04,$C9,$30,$D0  ; $B530
    .byte $05,$A9,$00,$9D,$40,$04,$BD,$40,$06,$A8,$B9,$92,$B5,$DD,$00,$06  ; $B540
    .byte $B0,$1A,$9D,$00,$06,$A9,$30,$9D,$40,$04,$BD,$20,$04,$49,$40,$29  ; $B550
    .byte $EF,$9D,$20,$04,$A0,$60,$20,$33,$F5,$FE,$40,$06,$BD,$00,$06,$C9  ; $B560
    .byte $D8,$90,$1B,$BD,$60,$04,$E9,$0A,$A8,$B9,$99,$B5,$9D,$80,$04,$A9  ; $B570
    .byte $04,$9D,$00,$06,$A9,$00,$9D,$40,$06,$A0,$2C,$20,$33,$F5,$20,$49  ; $B580
    .byte $BE,$60,$60,$50,$A0,$D0,$FF,$FF,$FF,$D0,$B0,$BD,$20,$04,$29,$20  ; $B590
    .byte $D0,$4D,$BD,$20,$04,$29,$80,$D0,$66,$BD,$A0,$06,$F0,$03,$4C,$57  ; $B5A0
    .byte $B6,$A9,$06,$9D,$20,$04,$BD,$40,$04,$C9,$30,$D0,$05,$A9,$00,$9D  ; $B5B0
    .byte $40,$04,$DE,$40,$06,$D0,$3C,$BD,$80,$06,$F0,$17,$10,$0E,$A9,$00  ; $B5C0
    .byte $9D,$80,$06,$A9,$20,$9D,$20,$04,$A9,$18,$D0,$0E,$A9,$00,$9D,$80  ; $B5D0
    .byte $06,$F0,$05,$A9,$FE,$9D,$80,$06,$A9,$20,$9D,$40,$06,$D0,$14,$DE  ; $B5E0
    .byte $40,$06,$D0,$0F,$A9,$06,$9D,$20,$04,$A9,$02,$9D,$80,$06,$A9,$20  ; $B5F0
    .byte $9D,$40,$06,$20,$49,$BE,$90,$06,$20,$6B,$B6,$20,$4A,$C6,$60,$A9  ; $B600
    .byte $00,$9D,$20,$04,$A5,$5F,$C9,$02,$D0,$8F,$BD,$00,$06,$48,$29,$F0  ; $B610
    .byte $9D,$00,$06,$BD,$80,$06,$10,$14,$68,$29,$0F,$F0,$1E,$18,$49,$0F  ; $B620
    .byte $69,$01,$48,$18,$BD,$00,$06,$69,$10,$9D,$00,$06,$68,$29,$0F,$4A  ; $B630
    .byte $85,$0C,$38,$BD,$40,$06,$E5,$0C,$9D,$40,$06,$20,$6B,$B6,$38,$BD  ; $B640
    .byte $00,$06,$E9,$20,$20,$3F,$C6,$BD,$A0,$06,$C9,$01,$D0,$06,$20,$6B  ; $B650
    .byte $B6,$20,$4A,$C6,$A9,$30,$9D,$40,$04,$D0,$98,$BD,$80,$04,$29,$F0  ; $B660
    .byte $1D,$60,$04,$A0,$00,$48,$A5,$31,$C9,$06,$F0,$13,$68,$D9,$98,$B6  ; $B670
    .byte $F0,$03,$C8,$D0,$F8,$98,$0A,$85,$0C,$0A,$65,$0C,$85,$0C,$60,$68  ; $B680
    .byte $D9,$A7,$B6,$F0,$F0,$C8,$D0,$F8,$72,$33,$53,$74,$94,$56,$76,$97  ; $B690
    .byte $D7,$58,$98,$F9,$3A,$BF,$DF,$00,$00,$00,$00,$00,$7E,$9E,$DE  ; $B6A0
    LDA $0420,X                  ; $B6AF  BD 20 04
    AND #$10                     ; $B6B2  29 10
    BEQ loc_0B_B6C3              ; $B6B4  F0 0D
    INC $0640,X                  ; $B6B6  FE 40 06
    LDA $0640,X                  ; $B6B9  BD 40 06
    CMP #$F0                     ; $B6BC  C9 F0
    BNE loc_0B_B6C3              ; $B6BE  D0 03
    JMP loc_0B_BEB1              ; $B6C0  4C B1 BE


loc_0B_B6C3:
    JSR sub_0B_BE49              ; $B6C3  20 49 BE
    RTS                          ; $B6C6  60

    LDA $0440,X                  ; $B6C7  BD 40 04
    BNE loc_0B_B6C3              ; $B6CA  D0 F7
    JMP loc_0B_BEB1              ; $B6CC  4C B1 BE

    .byte $BD,$40,$06,$D0,$34,$20,$3B,$F6,$C9,$50,$B0,$30,$AA,$A0,$00,$A9  ; $B6CF
    .byte $33,$20,$AC,$C5,$A9,$11,$20,$63,$F6,$B0,$17,$BD,$20,$04,$09,$14  ; $B6DF
    .byte $9D,$20,$04,$A0,$70,$20,$33,$F5,$A5,$05,$9D,$C0,$04,$A5,$04,$9D  ; $B6EF
    .byte $E0,$04,$A6,$2F,$A9,$20,$9D,$40,$06,$DE,$40,$06,$20,$49,$BE,$60  ; $B6FF
    LDA $6B,X                    ; $B70F  B5 6B
    PHA                          ; $B711  48
    JSR sub_0B_BE49              ; $B712  20 49 BE
    PLA                          ; $B715  68
    STA $0D                      ; $B716  85 0D
    LDA $0640,X                  ; $B718  BD 40 06
    BNE loc_0B_B73C              ; $B71B  D0 1F
    LDA $06E0,X                  ; $B71D  BD E0 06
    CMP #$1B                     ; $B720  C9 1B
    BNE loc_0B_B73B              ; $B722  D0 17
    LDA #$1E                     ; $B724  A9 1E
    STA $0C                      ; $B726  85 0C
    LDX #$10                     ; $B728  A2 10

loc_0B_B72A:
    JSR sub_0F_F516              ; $B72A  20 16 F5
    BCS loc_0B_B73B              ; $B72D  B0 0C
    LDA $6B,X                    ; $B72F  B5 6B
    CMP $0D                      ; $B731  C5 0D
    BEQ loc_0B_B738              ; $B733  F0 03
    INX                          ; $B735  E8
    BNE loc_0B_B72A              ; $B736  D0 F2

loc_0B_B738:
    JSR sub_0B_BEE9              ; $B738  20 E9 BE

loc_0B_B73B:
    RTS                          ; $B73B  60


loc_0B_B73C:
    DEC $0640,X                  ; $B73C  DE 40 06
    BNE loc_0B_B73B              ; $B73F  D0 FA
    LDA #$00                     ; $B741  A9 00
    STA $0680,X                  ; $B743  9D 80 06
    LDA #$01                     ; $B746  A9 01
    STA $04C0,X                  ; $B748  9D C0 04
    LDA #$20                     ; $B74B  A9 20
    STA $04E0,X                  ; $B74D  9D E0 04
    LDA #$1F                     ; $B750  A9 1F
    STA $06E0,X                  ; $B752  9D E0 06
    RTS                          ; $B755  60

    JSR sub_0F_F63B              ; $B756  20 3B F6
    LDA $0420,X                  ; $B759  BD 20 04
    AND #$40                     ; $B75C  29 40
    BEQ loc_0B_B76F              ; $B75E  F0 0F
    LDA #$29                     ; $B760  A9 29
    STA $06E0,X                  ; $B762  9D E0 06
    LDA #$1F                     ; $B765  A9 1F
    STA $0640,X                  ; $B767  9D 40 06
    LDA #$17                     ; $B76A  A9 17
    STA $0420,X                  ; $B76C  9D 20 04

loc_0B_B76F:
    LDA $6B,X                    ; $B76F  B5 6B
    PHA                          ; $B771  48
    JSR sub_0B_BE49              ; $B772  20 49 BE
    PLA                          ; $B775  68
    STA $0D                      ; $B776  85 0D
    LDA #$1D                     ; $B778  A9 1D
    STA $0C                      ; $B77A  85 0C
    LDX #$10                     ; $B77C  A2 10

loc_0B_B77E:
    JSR sub_0F_F516              ; $B77E  20 16 F5
    BCS loc_0B_B7DE              ; $B781  B0 5B
    LDA $6B,X                    ; $B783  B5 6B
    CMP $0D                      ; $B785  C5 0D
    BEQ loc_0B_B78C              ; $B787  F0 03
    INX                          ; $B789  E8
    BNE loc_0B_B77E              ; $B78A  D0 F2

loc_0B_B78C:
    LDY $2F                      ; $B78C  A4 2F
    SEC                          ; $B78E  38
    LDA $0600,Y                  ; $B78F  B9 00 06
    SBC #$10                     ; $B792  E9 10
    STA $0600,X                  ; $B794  9D 00 06
    LDA $0480,Y                  ; $B797  B9 80 04
    STA $0480,X                  ; $B79A  9D 80 04
    LDA $0460,Y                  ; $B79D  B9 60 04
    STA $0460,X                  ; $B7A0  9D 60 04
    LDA $06A0,X                  ; $B7A3  BD A0 06
    BEQ loc_0B_B7AB              ; $B7A6  F0 03
    STA $06A0,Y                  ; $B7A8  99 A0 06

loc_0B_B7AB:
    LDA $06A0,Y                  ; $B7AB  B9 A0 06
    BEQ loc_0B_B7B3              ; $B7AE  F0 03
    STA $06A0,X                  ; $B7B0  9D A0 06

loc_0B_B7B3:
    LDA $06E0,Y                  ; $B7B3  B9 E0 06
    CMP #$1B                     ; $B7B6  C9 1B
    BEQ loc_0B_B7C1              ; $B7B8  F0 07
    LDA $06E0,Y                  ; $B7BA  B9 E0 06
    CMP #$29                     ; $B7BD  C9 29
    BNE loc_0B_B7DE              ; $B7BF  D0 1D

loc_0B_B7C1:
    LDA #$1D                     ; $B7C1  A9 1D
    STA $06E0,X                  ; $B7C3  9D E0 06
    LDA #$09                     ; $B7C6  A9 09
    STA $0640,X                  ; $B7C8  9D 40 06
    LDA #$00                     ; $B7CB  A9 00
    STA $0440,X                  ; $B7CD  9D 40 04
    STA $04E0,X                  ; $B7D0  9D E0 04
    STA $04C0,X                  ; $B7D3  9D C0 04
    STA $0660,X                  ; $B7D6  9D 60 06
    LDA #$04                     ; $B7D9  A9 04
    STA $0680,X                  ; $B7DB  9D 80 06

loc_0B_B7DE:
    LDX $2F                      ; $B7DE  A6 2F
    INC $0640,X                  ; $B7E0  FE 40 06
    LDA $0640,X                  ; $B7E3  BD 40 06
    CMP #$3F                     ; $B7E6  C9 3F
    BNE loc_0B_B809              ; $B7E8  D0 1F
    LDA #$00                     ; $B7EA  A9 00
    STA $0640,X                  ; $B7EC  9D 40 06
    LDA $06A0,X                  ; $B7EF  BD A0 06
    BNE loc_0B_B809              ; $B7F2  D0 15
    LDA #$1A                     ; $B7F4  A9 1A
    JSR sub_0F_F663              ; $B7F6  20 63 F6
    BCS loc_0B_B809              ; $B7F9  B0 0E
    SEC                          ; $B7FB  38
    LDA $0600,X                  ; $B7FC  BD 00 06
    SBC #$0C                     ; $B7FF  E9 0C
    STA $0600,X                  ; $B801  9D 00 06
    LDY #$24                     ; $B804  A0 24
    JSR sub_0F_F533              ; $B806  20 33 F5

loc_0B_B809:
    RTS                          ; $B809  60

    LDA $0420,X                  ; $B80A  BD 20 04
    AND #$08                     ; $B80D  29 08
    BEQ loc_0B_B818              ; $B80F  F0 07
    JSR sub_0B_BE49              ; $B811  20 49 BE
    LDA #$00                     ; $B814  A9 00
    BEQ loc_0B_B860              ; $B816  F0 48

loc_0B_B818:
    JSR sub_0B_AAD1              ; $B818  20 D1 AA
    LDA $0640,X                  ; $B81B  BD 40 06
    CMP #$32                     ; $B81E  C9 32
    BNE loc_0B_B827              ; $B820  D0 05
    LDA #$10                     ; $B822  A9 10
    STA $0440,X                  ; $B824  9D 40 04

loc_0B_B827:
    LDA $0440,X                  ; $B827  BD 40 04
    AND #$F0                     ; $B82A  29 F0
    BEQ loc_0B_B860              ; $B82C  F0 32
    CMP #$20                     ; $B82E  C9 20
    BNE loc_0B_B85F              ; $B830  D0 2D
    LDA #$20                     ; $B832  A9 20
    JSR sub_0F_F663              ; $B834  20 63 F6
    BCS loc_0B_B85F              ; $B837  B0 26
    CLC                          ; $B839  18
    LDA $0600,X                  ; $B83A  BD 00 06
    ADC #$10                     ; $B83D  69 10
    STA $0600,X                  ; $B83F  9D 00 06
    LDY #$00                     ; $B842  A0 00
    LDA $0420,X                  ; $B844  BD 20 04
    AND #$40                     ; $B847  29 40
    BEQ loc_0B_B84C              ; $B849  F0 01
    INY                          ; $B84B  C8

loc_0B_B84C:
    CLC                          ; $B84C  18
    LDA $0480,X                  ; $B84D  BD 80 04
    ADC $B866,Y                  ; $B850  79 66 B8
    STA $0480,X                  ; $B853  9D 80 04
    LDA $0460,X                  ; $B856  BD 60 04
    ADC $B864,Y                  ; $B859  79 64 B8
    STA $0460,X                  ; $B85C  9D 60 04

loc_0B_B85F:
    RTS                          ; $B85F  60


loc_0B_B860:
    STA $0440,X                  ; $B860  9D 40 04
    RTS                          ; $B863  60

    .byte $FF,$00,$F5,$0B  ; $B864
    LDA $0440,X                  ; $B868  BD 40 04
    BEQ loc_0B_B872              ; $B86B  F0 05
    LDA #$F8                     ; $B86D  A9 F8
    STA $0600,X                  ; $B86F  9D 00 06

loc_0B_B872:
    JSR sub_0B_BE49              ; $B872  20 49 BE
    RTS                          ; $B875  60

    JSR sub_0B_BE49              ; $B876  20 49 BE
    LDA $2A                      ; $B879  A5 2A
    ORA $2B                      ; $B87B  05 2B
    BEQ loc_0B_B897              ; $B87D  F0 18

loc_0B_B87F:
    LDA #$02                     ; $B87F  A9 02
    STA $0420,X                  ; $B881  9D 20 04
    LDA #$1B                     ; $B884  A9 1B
    STA $06E0,X                  ; $B886  9D E0 06
    JSR sub_0B_B045              ; $B889  20 45 B0
    STA $0440,X                  ; $B88C  9D 40 04
    STA $0640,X                  ; $B88F  9D 40 06
    LDA #$12                     ; $B892  A9 12
    JSR sub_0E_C477              ; $B894  20 77 C4

loc_0B_B897:
    RTS                          ; $B897  60

    .byte $FE,$40,$06,$BD,$40,$06,$C9,$0E,$D0,$D0,$A9,$F8,$9D,$00,$06,$60  ; $B898
    DEC $0640,X                  ; $B8A8  DE 40 06
    BNE loc_0B_B872              ; $B8AB  D0 C5
    BEQ loc_0B_B87F              ; $B8AD  F0 D0
    JSR sub_0F_F63B              ; $B8AF  20 3B F6
    SEC                          ; $B8B2  38
    LDA $0600                    ; $B8B3  AD 00 06
    SBC $0600,X                  ; $B8B6  FD 00 06
    BCS loc_0B_B8BF              ; $B8B9  B0 04
    EOR #$FF                     ; $B8BB  49 FF
    ADC #$01                     ; $B8BD  69 01

loc_0B_B8BF:
    STA $0C                      ; $B8BF  85 0C
    CMP #$28                     ; $B8C1  C9 28
    BCS loc_0B_B914              ; $B8C3  B0 4F
    LDA $0640,X                  ; $B8C5  BD 40 06
    CMP #$10                     ; $B8C8  C9 10
    BNE loc_0B_B90D              ; $B8CA  D0 41
    LDA $0C                      ; $B8CC  A5 0C
    CMP #$1C                     ; $B8CE  C9 1C
    BCS loc_0B_B910              ; $B8D0  B0 3E
    LDA #$01                     ; $B8D2  A9 01
    STA $0C                      ; $B8D4  85 0C

loc_0B_B8D6:
    LDA #$2B                     ; $B8D6  A9 2B
    JSR sub_0F_F663              ; $B8D8  20 63 F6
    BCS loc_0B_B8F5              ; $B8DB  B0 18
    JSR sub_0B_B045              ; $B8DD  20 45 B0
    LDY $0C                      ; $B8E0  A4 0C
    CLC                          ; $B8E2  18
    LDA $0600,X                  ; $B8E3  BD 00 06
    ADC $B91F,Y                  ; $B8E6  79 1F B9
    STA $0600,X                  ; $B8E9  9D 00 06
    LDA #$04                     ; $B8EC  A9 04
    STA $04C0,X                  ; $B8EE  9D C0 04
    DEC $0C                      ; $B8F1  C6 0C
    BPL loc_0B_B8D6              ; $B8F3  10 E1

loc_0B_B8F5:
    LDX $2F                      ; $B8F5  A6 2F
    LDA $0640,X                  ; $B8F7  BD 40 06
    JSR sub_0B_AB63              ; $B8FA  20 63 AB
    ASL $0660,X                  ; $B8FD  1E 60 06
    ROL $0680,X                  ; $B900  3E 80 06
    LDA $0420,X                  ; $B903  BD 20 04
    ORA #$08                     ; $B906  09 08
    STA $0420,X                  ; $B908  9D 20 04
    BNE loc_0B_B914              ; $B90B  D0 07

loc_0B_B90D:
    INC $0640,X                  ; $B90D  FE 40 06

loc_0B_B910:
    JSR sub_0B_BE49              ; $B910  20 49 BE
    RTS                          ; $B913  60


loc_0B_B914:
    LDA #$30                     ; $B914  A9 30
    STA $0440,X                  ; $B916  9D 40 04
    LDA #$06                     ; $B919  A9 06
    STA $06E0,X                  ; $B91B  9D E0 06
    RTS                          ; $B91E  60

    .byte $14,$EC  ; $B91F
    LDY #$00                     ; $B921  A0 00
    LDA $0640,X                  ; $B923  BD 40 06
    AND #$40                     ; $B926  29 40
    PHP                          ; $B928  08
    BEQ loc_0B_B92D              ; $B929  F0 02
    LDY #$03                     ; $B92B  A0 03

loc_0B_B92D:
    CLC                          ; $B92D  18
    LDA $04A0,X                  ; $B92E  BD A0 04
    ADC $BA2C,Y                  ; $B931  79 2C BA
    STA $04A0,X                  ; $B934  9D A0 04
    LDA $0480,X                  ; $B937  BD 80 04
    ADC $BA2D,Y                  ; $B93A  79 2D BA
    STA $0480,X                  ; $B93D  9D 80 04
    LDA $0460,X                  ; $B940  BD 60 04
    ADC $BA2E,Y                  ; $B943  79 2E BA
    STA $0460,X                  ; $B946  9D 60 04
    SEC                          ; $B949  38
    LDA $0480,X                  ; $B94A  BD 80 04
    SBC $1A                      ; $B94D  E5 1A
    TAY                          ; $B94F  A8
    LDA $0460,X                  ; $B950  BD 60 04
    SBC $1B                      ; $B953  E5 1B
    BNE loc_0B_B963              ; $B955  D0 0C
    CPY #$F8                     ; $B957  C0 F8
    BCS loc_0B_B963              ; $B959  B0 08
    CPY #$10                     ; $B95B  C0 10
    BCC loc_0B_B963              ; $B95D  90 04
    LDA #$00                     ; $B95F  A9 00
    BEQ loc_0B_B965              ; $B961  F0 02

loc_0B_B963:
    LDA #$20                     ; $B963  A9 20

loc_0B_B965:
    STA $0420,X                  ; $B965  9D 20 04
    LDA $06C0,X                  ; $B968  BD C0 06
    ASL A                        ; $B96B  0A
    TAY                          ; $B96C  A8
    PHA                          ; $B96D  48
    LDA $BA42,Y                  ; $B96E  B9 42 BA
    STA $04                      ; $B971  85 04
    LDA $BA43,Y                  ; $B973  B9 43 BA
    STA $05                      ; $B976  85 05
    PLA                          ; $B978  68
    ASL A                        ; $B979  0A
    PLP                          ; $B97A  28
    PHA                          ; $B97B  48
    BNE loc_0B_B9BB              ; $B97C  D0 3D
    LDA $0660,X                  ; $B97E  BD 60 06
    BEQ loc_0B_B9A8              ; $B981  F0 25
    SEC                          ; $B983  38
    SBC #$01                     ; $B984  E9 01
    ASL A                        ; $B986  0A
    TAY                          ; $B987  A8
    LDA ($04),Y                  ; $B988  B1 04
    STA $07                      ; $B98A  85 07
    INY                          ; $B98C  C8
    LDA ($04),Y                  ; $B98D  B1 04
    STA $06                      ; $B98F  85 06
    JSR sub_0B_BA20              ; $B991  20 20 BA
    BCC loc_0B_B9A8              ; $B994  90 12
    LDA $0660,X                  ; $B996  BD 60 06
    DEC $0660,X                  ; $B999  DE 60 06
    LDY #$10                     ; $B99C  A0 10
    AND #$01                     ; $B99E  29 01
    BEQ loc_0B_B9A4              ; $B9A0  F0 02
    LDY #$30                     ; $B9A2  A0 30

loc_0B_B9A4:
    TYA                          ; $B9A4  98
    STA $0440,X                  ; $B9A5  9D 40 04

loc_0B_B9A8:
    PLA                          ; $B9A8  68
    TAY                          ; $B9A9  A8
    LDA $BA32,Y                  ; $B9AA  B9 32 BA
    STA $06                      ; $B9AD  85 06
    LDA $BA33,Y                  ; $B9AF  B9 33 BA
    STA $07                      ; $B9B2  85 07
    JSR sub_0B_BA20              ; $B9B4  20 20 BA
    BCS loc_0B_B9F1              ; $B9B7  B0 38
    BCC loc_0B_B9F9              ; $B9B9  90 3E

loc_0B_B9BB:
    LDA $0660,X                  ; $B9BB  BD 60 06
    ASL A                        ; $B9BE  0A
    TAY                          ; $B9BF  A8
    LDA ($04),Y                  ; $B9C0  B1 04
    STA $07                      ; $B9C2  85 07
    INY                          ; $B9C4  C8
    LDA ($04),Y                  ; $B9C5  B1 04
    STA $06                      ; $B9C7  85 06
    JSR sub_0B_BA20              ; $B9C9  20 20 BA
    BCS loc_0B_B9E0              ; $B9CC  B0 12
    LDY #$10                     ; $B9CE  A0 10
    LDA $0660,X                  ; $B9D0  BD 60 06
    INC $0660,X                  ; $B9D3  FE 60 06
    AND #$01                     ; $B9D6  29 01
    BEQ loc_0B_B9DC              ; $B9D8  F0 02
    LDY #$30                     ; $B9DA  A0 30

loc_0B_B9DC:
    TYA                          ; $B9DC  98
    STA $0440,X                  ; $B9DD  9D 40 04

loc_0B_B9E0:
    PLA                          ; $B9E0  68
    TAY                          ; $B9E1  A8
    LDA $BA34,Y                  ; $B9E2  B9 34 BA
    STA $06                      ; $B9E5  85 06
    LDA $BA35,Y                  ; $B9E7  B9 35 BA
    STA $07                      ; $B9EA  85 07
    JSR sub_0B_BA20              ; $B9EC  20 20 BA
    BCS loc_0B_B9F9              ; $B9EF  B0 08

loc_0B_B9F1:
    LDA $0640,X                  ; $B9F1  BD 40 06
    EOR #$40                     ; $B9F4  49 40
    STA $0640,X                  ; $B9F6  9D 40 06

loc_0B_B9F9:
    LDA $0440,X                  ; $B9F9  BD 40 04
    AND #$10                     ; $B9FC  29 10
    BNE loc_0B_BA08              ; $B9FE  D0 08
    LDA $0440,X                  ; $BA00  BD 40 04
    AND #$F0                     ; $BA03  29 F0
    STA $0440,X                  ; $BA05  9D 40 04

loc_0B_BA08:
    LDA $0440,X                  ; $BA08  BD 40 04
    AND #$F0                     ; $BA0B  29 F0
    BNE loc_0B_BA1F              ; $BA0D  D0 10
    LDA $0420,X                  ; $BA0F  BD 20 04
    AND #$20                     ; $BA12  29 20
    BNE loc_0B_BA1F              ; $BA14  D0 09
    JSR sub_0B_B1AE              ; $BA16  20 AE B1
    LDA $0640,X                  ; $BA19  BD 40 06
    STA $0718,Y                  ; $BA1C  99 18 07

loc_0B_BA1F:
    RTS                          ; $BA1F  60


sub_0B_BA20:
    SEC                          ; $BA20  38
    LDA $06                      ; $BA21  A5 06
    SBC $0480,X                  ; $BA23  FD 80 04
    LDA $07                      ; $BA26  A5 07
    SBC $0460,X                  ; $BA28  FD 60 04
    RTS                          ; $BA2B  60

    .byte $00,$FF,$FF,$00,$01,$00,$08,$02,$18,$03,$88,$02,$98,$03,$08,$03  ; $BA2C
    .byte $68,$04,$58,$1B,$F0,$1C,$4A,$BA,$4B,$BA,$54,$BA,$69,$BA,$FF,$02  ; $BA3C
    .byte $F0,$03,$00,$03,$70,$03,$80,$FF,$03,$40,$03,$50,$03,$80,$03,$90  ; $BA4C
    .byte $03,$C0,$03,$D0,$04,$00,$04,$10,$04,$40,$04,$50,$FF,$1B,$C0,$1C  ; $BA5C
    .byte $20,$FF  ; $BA6C
    LDA $31                      ; $BA6E  A5 31
    CMP #$05                     ; $BA70  C9 05
    BEQ loc_0B_BAC6              ; $BA72  F0 52
    LDA $0640,X                  ; $BA74  BD 40 06
    BNE loc_0B_BA84              ; $BA77  D0 0B
    LDA #$30                     ; $BA79  A9 30
    JSR sub_0E_C477              ; $BA7B  20 77 C4
    LDX $2F                      ; $BA7E  A6 2F
    LDA #$00                     ; $BA80  A9 00
    BEQ loc_0B_BA88              ; $BA82  F0 04

loc_0B_BA84:
    CMP #$20                     ; $BA84  C9 20
    BEQ loc_0B_BAB9              ; $BA86  F0 31

loc_0B_BA88:
    PHA                          ; $BA88  48
    AND #$F0                     ; $BA89  29 F0
    LSR A                        ; $BA8B  4A
    LSR A                        ; $BA8C  4A
    ORA #$23                     ; $BA8D  09 23
    STA $0380                    ; $BA8F  8D 80 03
    PLA                          ; $BA92  68
    AND #$0F                     ; $BA93  29 0F
    LSR A                        ; $BA95  4A
    BCC loc_0B_BA9C              ; $BA96  90 04
    ORA #$D8                     ; $BA98  09 D8
    BNE loc_0B_BA9E              ; $BA9A  D0 02

loc_0B_BA9C:
    ORA #$E0                     ; $BA9C  09 E0

loc_0B_BA9E:
    STA $0381                    ; $BA9E  8D 81 03
    LDA #$AA                     ; $BAA1  A9 AA
    STA $0382                    ; $BAA3  8D 82 03
    LDA #$01                     ; $BAA6  A9 01
    STA $5E                      ; $BAA8  85 5E
    INC $0640,X                  ; $BAAA  FE 40 06
    LDA $0640,X                  ; $BAAD  BD 40 06
    CMP #$0A                     ; $BAB0  C9 0A
    BEQ loc_0B_BAFD              ; $BAB2  F0 49
    CMP #$10                     ; $BAB4  C9 10
    BCS loc_0B_BAB9              ; $BAB6  B0 01
    RTS                          ; $BAB8  60


loc_0B_BAB9:
    LDA #$01                     ; $BAB9  A9 01
    STA $9D                      ; $BABB  85 9D
    LDA #$80                     ; $BABD  A9 80
    STA $9C                      ; $BABF  85 9C
    LDA #$C0                     ; $BAC1  A9 C0
    STA $9E                      ; $BAC3  85 9E
    RTS                          ; $BAC5  60


loc_0B_BAC6:
    LDA #$23                     ; $BAC6  A9 23

loc_0B_BAC8:
    JSR sub_0E_C477              ; $BAC8  20 77 C4
    LDX $2F                      ; $BACB  A6 2F
    JMP loc_0B_BEB1              ; $BACD  4C B1 BE

    LDA $31                      ; $BAD0  A5 31
    CMP #$05                     ; $BAD2  C9 05
    BEQ loc_0B_BAF9              ; $BAD4  F0 23
    LDX #$02                     ; $BAD6  A2 02

loc_0B_BAD8:
    LDA $BAF6,X                  ; $BAD8  BD F6 BA
    STA $03D5,X                  ; $BADB  9D D5 03
    DEX                          ; $BADE  CA
    BPL loc_0B_BAD8              ; $BADF  10 F7
    JSR sub_0E_C73F              ; $BAE1  20 3F C7
    LDX $2F                      ; $BAE4  A6 2F
    LDA $AB                      ; $BAE6  A5 AB
    BEQ loc_0B_BAF3              ; $BAE8  F0 09
    DEC $06E0,X                  ; $BAEA  DE E0 06
    LDA #$20                     ; $BAED  A9 20
    STA $0640,X                  ; $BAEF  9D 40 06
    RTS                          ; $BAF2  60


loc_0B_BAF3:
    JMP loc_0B_BEB1              ; $BAF3  4C B1 BE

    .byte $2C,$1C,$07  ; $BAF6

loc_0B_BAF9:
    LDA #$FE                     ; $BAF9  A9 FE
    BNE loc_0B_BAC8              ; $BAFB  D0 CB

loc_0B_BAFD:
    LDA #$04                     ; $BAFD  A9 04
    STA $0C                      ; $BAFF  85 0C
    DEC $0460,X                  ; $BB01  DE 60 04
    LDA #$88                     ; $BB04  A9 88
    STA $0480,X                  ; $BB06  9D 80 04
    LDA #$68                     ; $BB09  A9 68
    STA $0600,X                  ; $BB0B  9D 00 06

loc_0B_BB0E:
    LDA #$00                     ; $BB0E  A9 00
    JSR sub_0F_F663              ; $BB10  20 63 F6
    BCS loc_0B_BB3E              ; $BB13  B0 29
    LDA #$7B                     ; $BB15  A9 7B
    STA $0400,X                  ; $BB17  9D 00 04
    LDA #$40                     ; $BB1A  A9 40
    STA $0420,X                  ; $BB1C  9D 20 04
    JSR sub_0B_B045              ; $BB1F  20 45 B0
    LDA #$10                     ; $BB22  A9 10
    STA $04C0,X                  ; $BB24  9D C0 04
    LDX $2F                      ; $BB27  A6 2F
    CLC                          ; $BB29  18
    LDA $0480,X                  ; $BB2A  BD 80 04
    ADC #$08                     ; $BB2D  69 08
    STA $0480,X                  ; $BB2F  9D 80 04
    LDA $0600,X                  ; $BB32  BD 00 06
    ADC #$10                     ; $BB35  69 10
    STA $0600,X                  ; $BB37  9D 00 06
    DEC $0C                      ; $BB3A  C6 0C
    BNE loc_0B_BB0E              ; $BB3C  D0 D0

loc_0B_BB3E:
    RTS                          ; $BB3E  60

    LDA $0640,X                  ; $BB3F  BD 40 06
    BEQ loc_0B_BB7C              ; $BB42  F0 38
    LDA $0680,X                  ; $BB44  BD 80 06
    BPL loc_0B_BB4C              ; $BB47  10 03
    JMP loc_0B_BBE9              ; $BB49  4C E9 BB


loc_0B_BB4C:
    LDA $0640,X                  ; $BB4C  BD 40 06
    CMP #$FF                     ; $BB4F  C9 FF
    BEQ loc_0B_BB80              ; $BB51  F0 2D
    CMP #$83                     ; $BB53  C9 83
    BCS loc_0B_BB9D              ; $BB55  B0 46
    CMP #$08                     ; $BB57  C9 08
    BNE loc_0B_BB67              ; $BB59  D0 0C
    LDA #$00                     ; $BB5B  A9 00
    STA $0640,X                  ; $BB5D  9D 40 06
    LDA #$02                     ; $BB60  A9 02
    STA $0420,X                  ; $BB62  9D 20 04
    BNE loc_0B_BB72              ; $BB65  D0 0B

loc_0B_BB67:
    AND #$07                     ; $BB67  29 07
    BNE loc_0B_BB77              ; $BB69  D0 0C
    LDA #$31                     ; $BB6B  A9 31
    JSR sub_0F_F663              ; $BB6D  20 63 F6
    BCS loc_0B_BB77              ; $BB70  B0 05

loc_0B_BB72:
    LDY #$1C                     ; $BB72  A0 1C
    JSR sub_0F_F533              ; $BB74  20 33 F5

loc_0B_BB77:
    LDX $2F                      ; $BB77  A6 2F
    DEC $0640,X                  ; $BB79  DE 40 06

loc_0B_BB7C:
    JSR sub_0B_BE49              ; $BB7C  20 49 BE
    RTS                          ; $BB7F  60


loc_0B_BB80:
    LDA $0600,X                  ; $BB80  BD 00 06
    CMP #$07                     ; $BB83  C9 07
    BCS loc_0B_BB99              ; $BB85  B0 12
    JSR sub_0B_B045              ; $BB87  20 45 B0
    LDA #$04                     ; $BB8A  A9 04
    STA $0600,X                  ; $BB8C  9D 00 06
    LDA #$20                     ; $BB8F  A9 20
    STA $0420,X                  ; $BB91  9D 20 04
    LDA #$83                     ; $BB94  A9 83
    STA $0640,X                  ; $BB96  9D 40 06

loc_0B_BB99:
    JSR sub_0B_BE49              ; $BB99  20 49 BE
    RTS                          ; $BB9C  60


loc_0B_BB9D:
    CMP #$FE                     ; $BB9D  C9 FE
    BEQ loc_0B_BBA6              ; $BB9F  F0 05
    INC $0640,X                  ; $BBA1  FE 40 06
    BNE loc_0B_BB7C              ; $BBA4  D0 D6

loc_0B_BBA6:
    LDA #$FF                     ; $BBA6  A9 FF
    STA $0680,X                  ; $BBA8  9D 80 06
    LDA #$10                     ; $BBAB  A9 10
    STA $0660,X                  ; $BBAD  9D 60 06
    LDA #$02                     ; $BBB0  A9 02
    STA $0C                      ; $BBB2  85 0C
    LDA $46                      ; $BBB4  A5 46
    STA $0D                      ; $BBB6  85 0D

loc_0B_BBB8:
    LDA #$31                     ; $BBB8  A9 31
    JSR sub_0F_F663              ; $BBBA  20 63 F6
    BCS loc_0B_BBE5              ; $BBBD  B0 26
    LDY #$74                     ; $BBBF  A0 74
    JSR sub_0F_F533              ; $BBC1  20 33 F5
    LDY $0C                      ; $BBC4  A4 0C
    CLC                          ; $BBC6  18
    LDA $1A                      ; $BBC7  A5 1A
    ADC $BBE6,Y                  ; $BBC9  79 E6 BB
    STA $0480,X                  ; $BBCC  9D 80 04
    LDA $1B                      ; $BBCF  A5 1B
    ADC #$00                     ; $BBD1  69 00
    STA $0460,X                  ; $BBD3  9D 60 04
    LDA #$00                     ; $BBD6  A9 00
    LSR $0D                      ; $BBD8  46 0D
    ROR A                        ; $BBDA  6A
    LSR A                        ; $BBDB  4A
    ORA #$06                     ; $BBDC  09 06
    STA $0420,X                  ; $BBDE  9D 20 04
    DEC $0C                      ; $BBE1  C6 0C
    BPL loc_0B_BBB8              ; $BBE3  10 D3

loc_0B_BBE5:
    RTS                          ; $BBE5  60

    .byte $7E,$A8,$D2  ; $BBE6

loc_0B_BBE9:
    LDA $0600,X                  ; $BBE9  BD 00 06
    CMP #$DC                     ; $BBEC  C9 DC
    BCC loc_0B_BBFD              ; $BBEE  90 0D
    LDA #$E0                     ; $BBF0  A9 E0
    STA $0600,X                  ; $BBF2  9D 00 06
    JSR sub_0B_B045              ; $BBF5  20 45 B0
    LDA #$1B                     ; $BBF8  A9 1B
    STA $0640,X                  ; $BBFA  9D 40 06

loc_0B_BBFD:
    JSR sub_0B_BE49              ; $BBFD  20 49 BE
    RTS                          ; $BC00  60

    .byte $BD,$40,$06,$C9,$2A,$B0,$18,$FE,$40,$06,$38,$BD,$60,$06,$E9,$1A  ; $BC01
    .byte $9D,$60,$06,$BD,$80,$06,$E9,$00,$9D,$80,$06,$20,$49,$BE,$60,$D0  ; $BC11
    .byte $0F,$A9,$80,$85,$48,$85,$A8,$A9,$02,$85,$49,$85,$A9,$FE,$40,$06  ; $BC21
    .byte $AD,$80,$04,$48,$AD,$00,$06,$48,$AD,$81,$04,$8D,$80,$04,$AD,$01  ; $BC31
    .byte $06,$8D,$00,$06,$20,$3B,$F6,$85,$0C,$18,$A5,$48,$69,$08,$85,$48  ; $BC41
    .byte $85,$00,$A5,$49,$69,$00,$85,$49,$85,$01,$20,$28,$F6,$A5,$03,$C9  ; $BC51
    .byte $0C,$B0,$06,$A5,$02,$C9,$0C,$90,$32,$A6,$2F,$A5,$A8,$05,$A9,$F0  ; $BC61
    .byte $1E,$38,$A5,$A8,$E9,$20,$85,$A8,$A5,$A9,$E9,$00,$85,$A9,$38,$BD  ; $BC71
    .byte $60,$06,$E5,$A8,$9D,$60,$06,$BD,$80,$06,$E5,$A9,$9D,$80,$06,$20  ; $BC81
    .byte $49,$BE,$68,$8D,$00,$06,$68,$8D,$80,$04,$60,$A6,$2F,$A9,$F8,$9D  ; $BC91
    .byte $00,$06,$D0,$EE,$DE,$40,$06,$F0,$1A,$20,$49,$BE,$A5,$2B,$F0,$12  ; $BCA1
    .byte $A5,$49,$F0,$02,$C6,$49,$9D,$80,$06,$9D,$60,$06,$5E,$C0,$04,$7E  ; $BCB1
    .byte $E0,$04,$60,$20,$FD,$AE,$60,$DE,$40,$06,$F0,$24,$BD,$40,$06,$29  ; $BCC1
    .byte $07,$A8,$18,$AD,$01,$06,$79,$FA,$A4,$9D,$00,$06,$18,$AD,$81,$04  ; $BCD1
    .byte $79,$02,$A5,$9D,$80,$04,$AD,$61,$04,$79,$0A,$A5,$9D,$60,$04,$60  ; $BCE1
    .byte $4C,$B1,$BE,$20,$49,$BE,$BD,$40,$04,$C9,$30,$90,$7C,$F0,$26,$C9  ; $BCF1
    .byte $70,$B0,$39,$C9,$64,$D0,$05,$A9,$30,$9D,$40,$04,$BD,$20,$04,$29  ; $BD01
    .byte $40,$F0,$09,$BD,$80,$04,$DD,$C0,$06,$B0,$13,$60,$BD,$80,$04,$DD  ; $BD11
    .byte $C0,$06,$90,$0A,$60,$A9,$04,$9D,$C0,$04,$20,$C5,$E8,$60,$BD,$C0  ; $BD21
    .byte $06,$9D,$80,$04,$A9,$70,$9D,$40,$04,$20,$45,$B0,$C9,$93,$D0,$32  ; $BD31
    .byte $BD,$40,$06,$A0,$07,$D9,$7B,$BD,$F0,$05,$88,$10,$F8,$30,$1D,$84  ; $BD41
    .byte $0C,$A9,$39,$20,$63,$F6,$B0,$14,$A9,$22,$9D,$20,$04,$A0,$08,$20  ; $BD51
    .byte $33,$F5,$A9,$78,$9D,$00,$06,$A5,$0C,$9D,$40,$06,$A6,$2F,$20,$73  ; $BD61
    .byte $E8,$60,$C9,$94,$D0,$03,$4C,$B1,$BE,$60,$54,$64,$70,$84,$04,$14  ; $BD71
    .byte $24,$99,$BC,$40,$06,$A5,$3F,$D9,$90,$BD,$D0,$ED,$4C,$B1,$BE,$01  ; $BD81
    .byte $05,$09,$11,$15,$19,$1C,$1C,$A5,$31,$C9,$07,$D0,$13,$A0,$00,$A5  ; $BD91
    .byte $1B,$C9,$1C,$F0,$02,$A0,$04,$84,$AC,$A9,$02,$85,$3E,$4C,$BC,$BD  ; $BDA1
    .byte $C9,$06,$F0,$0E,$A6,$1B,$BC,$CA,$BD,$D0,$EC,$A9,$01,$85,$68,$4C  ; $BDB1
    .byte $B1,$BE,$A9,$42,$9D,$20,$04,$A0,$CC,$20,$33,$F5,$A9,$13,$9D,$E0  ; $BDC1
    .byte $06,$20,$63,$F6,$B0,$0F,$A9,$02,$9D,$20,$04,$A0,$CC,$20,$33,$F5  ; $BDD1
    .byte $A9,$4C,$9D,$80,$04,$60,$02,$03,$01,$05,$BC,$C0,$06,$B9,$80,$04  ; $BDE1
    .byte $85,$00,$B9,$60,$04,$85,$01,$B9,$00,$06,$85,$0D,$DE,$40,$06,$BD  ; $BDF1
    .byte $40,$06,$4A,$4A,$29,$07,$A8,$18,$A5,$0D,$79,$FA,$A4,$9D,$00,$06  ; $BE01
    .byte $18,$A5,$00,$79,$02,$A5,$9D,$80,$04,$A5,$01,$79,$0A,$A5,$9D,$60  ; $BE11
    .byte $04,$20,$49,$BE,$60,$BD,$40,$04,$29,$F0,$D0,$11,$9D,$40,$04,$20  ; $BE21
    .byte $49,$BE,$A5,$2B,$D0,$01,$60,$A9,$10,$9D,$40,$04,$60,$C9,$B0,$F0  ; $BE31
    .byte $01,$60,$9D,$40,$04,$4C,$5A,$C0  ; $BE41

sub_0B_BE49:
    LDX $2F                      ; $BE49  A6 2F
    LDA #$00                     ; $BE4B  A9 00
    STA $2A                      ; $BE4D  85 2A
    STA $2B                      ; $BE4F  85 2B
    LDA $0420,X                  ; $BE51  BD 20 04
    AND #$80                     ; $BE54  29 80
    BEQ loc_0B_BE5B              ; $BE56  F0 03
    JSR sub_0B_BEC2              ; $BE58  20 C2 BE

loc_0B_BE5B:
    STA $0580,X                  ; $BE5B  9D 80 05
    LDA $06A0,X                  ; $BE5E  BD A0 06
    BNE loc_0B_BE76              ; $BE61  D0 13
    LDA $0420,X                  ; $BE63  BD 20 04
    AND #$40                     ; $BE66  29 40
    BEQ loc_0B_BE70              ; $BE68  F0 06
    JSR sub_0A_9DEF              ; $BE6A  20 EF 9D
    JMP loc_0B_BE73              ; $BE6D  4C 73 BE


loc_0B_BE70:
    JSR sub_0A_9E6D              ; $BE70  20 6D 9E

loc_0B_BE73:
    JSR sub_0A_98D8              ; $BE73  20 D8 98

loc_0B_BE76:
    SEC                          ; $BE76  38
    LDA $0480,X                  ; $BE77  BD 80 04
    SBC $1A                      ; $BE7A  E5 1A
    LDA $0460,X                  ; $BE7C  BD 60 04
    SBC $1B                      ; $BE7F  E5 1B
    BEQ loc_0B_BE86              ; $BE81  F0 03
    JMP loc_0B_BEB1              ; $BE83  4C B1 BE


loc_0B_BE86:
    LDA $06A0,X                  ; $BE86  BD A0 06
    BNE loc_0B_BEAF              ; $BE89  D0 24
    LDA $0420,X                  ; $BE8B  BD 20 04
    AND #$11                     ; $BE8E  29 11
    BNE loc_0B_BEA3              ; $BE90  D0 11
    JSR sub_0A_9CA1              ; $BE92  20 A1 9C
    BCS loc_0B_BEAC              ; $BE95  B0 15
    LDA $24                      ; $BE97  A5 24
    STA $0620,X                  ; $BE99  9D 20 06
    LDA $25                      ; $BE9C  A5 25
    STA $0600,X                  ; $BE9E  9D 00 06
    BCC loc_0B_BEAF              ; $BEA1  90 0C

loc_0B_BEA3:
    JSR sub_0A_9BC4              ; $BEA3  20 C4 9B
    LDA $2B                      ; $BEA6  A5 2B
    CMP #$FF                     ; $BEA8  C9 FF
    BNE loc_0B_BEAF              ; $BEAA  D0 03

loc_0B_BEAC:
    JMP loc_0B_BEB1              ; $BEAC  4C B1 BE


loc_0B_BEAF:
    CLC                          ; $BEAF  18
    RTS                          ; $BEB0  60


loc_0B_BEB1:
    LDX $2F                      ; $BEB1  A6 2F
    LDA #$F8                     ; $BEB3  A9 F8
    STA $0600,X                  ; $BEB5  9D 00 06
    CPX #$10                     ; $BEB8  E0 10
    BCC loc_0B_BEC0              ; $BEBA  90 04
    LDA #$FF                     ; $BEBC  A9 FF
    STA $6B,X                    ; $BEBE  95 6B

loc_0B_BEC0:
    SEC                          ; $BEC0  38
    RTS                          ; $BEC1  60


sub_0B_BEC2:
    LDA $0580,X                  ; $BEC2  BD 80 05
    BEQ loc_0B_BEC8              ; $BEC5  F0 01
    RTS                          ; $BEC7  60


loc_0B_BEC8:
    LDA $5F                      ; $BEC8  A5 5F
    ASL A                        ; $BECA  0A
    TAY                          ; $BECB  A8
    LDA $BF44,Y                  ; $BECC  B9 44 BF
    STA $04                      ; $BECF  85 04
    LDA $BF45,Y                  ; $BED1  B9 45 BF
    STA $05                      ; $BED4  85 05
    LDY $06E0,X                  ; $BED6  BC E0 06
    SEC                          ; $BED9  38
    LDA $06C0,X                  ; $BEDA  BD C0 06
    SBC ($04),Y                  ; $BEDD  F1 04
    BCC sub_0B_BEE9              ; $BEDF  90 08
    BEQ sub_0B_BEE9              ; $BEE1  F0 06
    STA $06C0,X                  ; $BEE3  9D C0 06
    LDA #$01                     ; $BEE6  A9 01
    RTS                          ; $BEE8  60


sub_0B_BEE9:
    LDA $06E0,X                  ; $BEE9  BD E0 06
    PHA                          ; $BEEC  48
    TAY                          ; $BEED  A8
    LDA #$1B                     ; $BEEE  A9 1B
    STA $06E0,X                  ; $BEF0  9D E0 06
    LDA #$FF                     ; $BEF3  A9 FF
    STA $6B,X                    ; $BEF5  95 6B
    JSR sub_0B_B045              ; $BEF7  20 45 B0
    STA $0440,X                  ; $BEFA  9D 40 04
    STA $0640,X                  ; $BEFD  9D 40 06
    STA $0420,X                  ; $BF00  9D 20 04
    STA $06A0,X                  ; $BF03  9D A0 06
    LDA $FE4E,Y                  ; $BF06  B9 4E FE
    STA $05                      ; $BF09  85 05
    JSR sub_0E_D440              ; $BF0B  20 40 D4
    PLA                          ; $BF0E  68
    CMP #$3A                     ; $BF0F  C9 3A
    BEQ loc_0B_BF39              ; $BF11  F0 26
    LDA #$64                     ; $BF13  A9 64
    JSR sub_0E_C5A0              ; $BF15  20 A0 C5
    LDY #$3B                     ; $BF18  A0 3B
    LDX #$05                     ; $BF1A  A2 05

loc_0B_BF1C:
    CMP $BF3E,X                  ; $BF1C  DD 3E BF
    BCC loc_0B_BF25              ; $BF1F  90 04
    INY                          ; $BF21  C8
    DEX                          ; $BF22  CA
    BPL loc_0B_BF1C              ; $BF23  10 F7

loc_0B_BF25:
    CPY #$3B                     ; $BF25  C0 3B
    BEQ loc_0B_BF39              ; $BF27  F0 10
    TYA                          ; $BF29  98
    JSR sub_0F_F663              ; $BF2A  20 63 F6
    BCS loc_0B_BF39              ; $BF2D  B0 0A
    LDA #$13                     ; $BF2F  A9 13
    STA $0420,X                  ; $BF31  9D 20 04
    LDY #$1C                     ; $BF34  A0 1C
    JSR sub_0F_F533              ; $BF36  20 33 F5

loc_0B_BF39:
    LDX $2F                      ; $BF39  A6 2F
    LDA #$00                     ; $BF3B  A9 00
    RTS                          ; $BF3D  60

    .byte $63,$61,$5F,$50,$41,$0C,$51,$FC,$8C,$FC,$C7,$FC,$02,$FD,$3D,$FD  ; $BF3E
    .byte $78,$FD,$B3,$FD  ; $BF4E

sub_0B_BF52:
    LDA $0420,X                  ; $BF52  BD 20 04
    AND #$7F                     ; $BF55  29 7F
    STA $0420,X                  ; $BF57  9D 20 04
    LDX $45                      ; $BF5A  A6 45
    BEQ loc_0B_BF6B              ; $BF5C  F0 0D
    DEX                          ; $BF5E  CA
    LDA #$1B                     ; $BF5F  A9 1B

loc_0B_BF61:
    CMP $0580,X                  ; $BF61  DD 80 05
    BEQ loc_0B_BF6B              ; $BF64  F0 05
    DEX                          ; $BF66  CA
    BPL loc_0B_BF61              ; $BF67  10 F8
    LDX $45                      ; $BF69  A6 45

loc_0B_BF6B:
    LDA #$1D                     ; $BF6B  A9 1D
    STA $0580,X                  ; $BF6D  9D 80 05
    INX                          ; $BF70  E8
    STX $45                      ; $BF71  86 45
    LDX $2F                      ; $BF73  A6 2F
    RTS                          ; $BF75  60

    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BF76
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BF86
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BF96
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFA6
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFB6
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFC6
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFD6
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFE6
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $BFF6
