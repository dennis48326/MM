; PRG 8 KB bank $3B at $A000
.segment "BANK3B"
.org $A000

    .byte $99,$00,$03,$A9,$00,$99,$08,$04,$BD,$80,$04,$AA,$BD,$2B,$A0,$85  ; $A000
    .byte $10,$A6,$0F,$A9,$62,$20,$9C,$F4,$A9,$06,$9D,$68,$04,$FE,$80,$04  ; $A010
    .byte $BD,$80,$04,$C9,$05,$D0,$03,$20,$00,$DC,$60,$25,$26,$27,$28,$1C  ; $A020
    .byte $BD,$58,$05,$C9,$0A,$D0,$30,$A0,$0E,$20,$F8,$F0,$B0,$06,$A9,$00  ; $A030
    .byte $9D,$70,$05,$60,$BD,$40,$05,$C9,$08,$D0,$71,$A9,$14,$9D,$68,$04  ; $A040
    .byte $A9,$BD,$9D,$88,$05,$A9,$A0,$9D,$A0,$05,$A9,$00,$9D,$D8,$03,$9D  ; $A050
    .byte $F0,$03,$A9,$0B,$4C,$46,$F4,$20,$E6,$F6,$C9,$50,$90,$12,$20,$34  ; $A060
    .byte $FA,$B0,$49,$A4,$10,$B9,$78,$03,$DD,$78,$03,$B0,$3F,$20,$CF,$FC  ; $A070
    .byte $A9,$0A,$20,$46,$F4,$A9,$02,$9D,$50,$04,$A9,$C0,$9D,$08,$04,$BD  ; $A080
    .byte $78,$03,$18,$69,$08,$9D,$78,$03,$86,$0F,$20,$6C,$FB,$B0,$1D,$A9  ; $A090
    .byte $80,$99,$00,$03,$A9,$00,$99,$08,$04,$99,$50,$04,$A9,$62,$20,$52  ; $A0A0
    .byte $F4,$B9,$78,$03,$38,$E9,$08,$99,$78,$03,$A6,$0F,$60,$BD,$68,$04  ; $A0B0
    .byte $F0,$08,$DE,$68,$04,$D0,$F5,$20,$DC,$F4,$A0,$06,$20,$F8,$F0,$90  ; $A0C0
    .byte $0A,$A0,$1C,$20,$ED,$F3,$90,$E4,$20,$AB,$F6  ; $A0D0

loc_3B_A0DB:
    RTS                          ; $A0DB  60

    LDA $0540,X                  ; $A0DC  BD 40 05
    BNE loc_3B_A12B              ; $A0DF  D0 4A
    LDA #$00                     ; $A0E1  A9 00
    STA $0570,X                  ; $A0E3  9D 70 05
    LDA $0468,X                  ; $A0E6  BD 68 04
    BEQ loc_3B_A0F0              ; $A0E9  F0 05
    DEC $0468,X                  ; $A0EB  DE 68 04
    BNE loc_3B_A0DB              ; $A0EE  D0 EB

loc_3B_A0F0:
    LDA $E4                      ; $A0F0  A5 E4
    ADC $E6                      ; $A0F2  65 E6
    STA $E6                      ; $A0F4  85 E6
    AND #$07                     ; $A0F6  29 07
    TAY                          ; $A0F8  A8
    LDA $A185,Y                  ; $A0F9  B9 85 A1
    STA $0468,X                  ; $A0FC  9D 68 04
    JSR sub_3F_F6D7              ; $A0FF  20 D7 F6
    CMP #$20                     ; $A102  C9 20
    BCS loc_3B_A184              ; $A104  B0 7E
    LDA #$00                     ; $A106  A9 00
    STA $00                      ; $A108  85 00
    LDY #$17                     ; $A10A  A0 17

loc_3B_A10C:
    LDA $05A0,Y                  ; $A10C  B9 A0 05
    BEQ loc_3B_A11A              ; $A10F  F0 09
    LDA $0300,Y                  ; $A111  B9 00 03
    CMP #$3F                     ; $A114  C9 3F
    BNE loc_3B_A11A              ; $A116  D0 02
    INC $00                      ; $A118  E6 00

loc_3B_A11A:
    DEY                          ; $A11A  88
    CPY #$07                     ; $A11B  C0 07
    BNE loc_3B_A10C              ; $A11D  D0 ED
    LDA $00                      ; $A11F  A5 00
    CMP #$03                     ; $A121  C9 03
    BCS loc_3B_A184              ; $A123  B0 5F
    INC $0540,X                  ; $A125  FE 40 05
    LDA $0540,X                  ; $A128  BD 40 05

loc_3B_A12B:
    CMP #$02                     ; $A12B  C9 02
    BEQ loc_3B_A13A              ; $A12D  F0 0B
    BCC loc_3B_A184              ; $A12F  90 53
    LDA #$00                     ; $A131  A9 00
    STA $0540,X                  ; $A133  9D 40 05
    STA $0570,X                  ; $A136  9D 70 05
    RTS                          ; $A139  60


loc_3B_A13A:
    LDA $0570,X                  ; $A13A  BD 70 05
    CMP #$03                     ; $A13D  C9 03
    BNE loc_3B_A184              ; $A13F  D0 43
    STX $0F                      ; $A141  86 0F
    JSR sub_3F_FB6C              ; $A143  20 6C FB
    BCS loc_3B_A184              ; $A146  B0 3C
    LDA #$3F                     ; $A148  A9 3F
    STA $0300,Y                  ; $A14A  99 00 03
    LDA #$CE                     ; $A14D  A9 CE
    STA $0408,Y                  ; $A14F  99 08 04
    LDA #$01                     ; $A152  A9 01
    STA $0450,Y                  ; $A154  99 50 04
    LDA #$6A                     ; $A157  A9 6A
    STA $03D8,Y                  ; $A159  99 D8 03
    STA $03A8,Y                  ; $A15C  99 A8 03
    LDA #$01                     ; $A15F  A9 01
    STA $03F0,Y                  ; $A161  99 F0 03
    STA $03C0,Y                  ; $A164  99 C0 03
    LDA $0528,X                  ; $A167  BD 28 05
    LDX #$0A                     ; $A16A  A2 0A
    AND #$40                     ; $A16C  29 40
    BEQ loc_3B_A172              ; $A16E  F0 02
    LDX #$09                     ; $A170  A2 09

loc_3B_A172:
    TXA                          ; $A172  8A
    STA $0420,Y                  ; $A173  99 20 04
    AND #$01                     ; $A176  29 01
    CLC                          ; $A178  18
    ADC #$29                     ; $A179  69 29
    STA $10                      ; $A17B  85 10
    LDX $0F                      ; $A17D  A6 0F
    LDA #$65                     ; $A17F  A9 65
    JSR sub_3F_F49C              ; $A181  20 9C F4

loc_3B_A184:
    RTS                          ; $A184  60

    .byte $5A,$3C,$28,$78,$5A,$28,$3C,$3C  ; $A185
    LDA $0558,X                  ; $A18D  BD 58 05
    CMP #$66                     ; $A190  C9 66
    BNE loc_3B_A19E              ; $A192  D0 0A
    LDA $0540,X                  ; $A194  BD 40 05
    BEQ loc_3B_A19E              ; $A197  F0 05
    LDA #$65                     ; $A199  A9 65
    JSR sub_3F_F446              ; $A19B  20 46 F4

loc_3B_A19E:
    LDY #$16                     ; $A19E  A0 16
    JSR sub_3F_F400              ; $A1A0  20 00 F4
    BCS loc_3B_A1B2              ; $A1A3  B0 0D
    LDY #$20                     ; $A1A5  A0 20
    JSR sub_3F_F3ED              ; $A1A7  20 ED F3
    BCC loc_3B_A184              ; $A1AA  90 D8
    JSR sub_3F_F6AB              ; $A1AC  20 AB F6
    JMP loc_3B_A1BF              ; $A1AF  4C BF A1


loc_3B_A1B2:
    LDA #$66                     ; $A1B2  A9 66
    JSR sub_3F_F446              ; $A1B4  20 46 F4
    LDA $0420,X                  ; $A1B7  BD 20 04
    EOR #$0C                     ; $A1BA  49 0C
    STA $0420,X                  ; $A1BC  9D 20 04

loc_3B_A1BF:
    LDA $03C0,X                  ; $A1BF  BD C0 03
    CMP #$05                     ; $A1C2  C9 05
    BCS loc_3B_A184              ; $A1C4  B0 BE
    LDA $03A8,X                  ; $A1C6  BD A8 03
    CLC                          ; $A1C9  18
    ADC #$66                     ; $A1CA  69 66
    STA $03A8,X                  ; $A1CC  9D A8 03
    STA $03D8,X                  ; $A1CF  9D D8 03
    LDA $03C0,X                  ; $A1D2  BD C0 03
    ADC #$00                     ; $A1D5  69 00
    STA $03C0,X                  ; $A1D7  9D C0 03
    STA $03F0,X                  ; $A1DA  9D F0 03
    RTS                          ; $A1DD  60

    .byte $AD,$3C,$01,$0D,$3D,$01,$D0,$3C,$20,$E6,$F6,$C9,$20,$90,$06,$A9  ; $A1DE
    .byte $00,$9D,$68,$04,$60,$BD,$68,$04,$F0,$04,$DE,$68,$04,$60,$A9,$78  ; $A1EE
    .byte $9D,$68,$04,$20,$6C,$FB,$B0,$1C,$A9,$98,$99,$00,$03,$A9,$C0,$99  ; $A1FE
    .byte $08,$04,$A9,$01,$99,$50,$04,$A9,$00,$99,$D8,$03,$99,$F0,$03,$A9  ; $A20E
    .byte $67,$20,$52,$F4,$60,$BD,$58,$05,$C9,$6C,$F0,$0C,$A0,$0C,$20,$F8  ; $A21E
    .byte $F0,$90,$55,$A9,$6C,$4C,$46,$F4,$BD,$70,$05,$C9,$05,$90,$49,$20  ; $A22E
    .byte $00,$DC,$A9,$03,$85,$0E,$86,$0F,$20,$6C,$FB,$B0,$3B,$A9,$41,$99  ; $A23E
    .byte $00,$03,$A9,$CF,$99,$08,$04,$A9,$01,$99,$50,$04,$A6,$0E,$BD,$8F  ; $A24E
    .byte $A2,$99,$A8,$03,$BD,$93,$A2,$99,$C0,$03,$BD,$87,$A2,$99,$D8,$03  ; $A25E
    .byte $BD,$8B,$A2,$99,$F0,$03,$BD,$97,$A2,$99,$20,$04,$BD,$9B,$A2,$A6  ; $A26E
    .byte $0F,$20,$52,$F4,$C6,$0E,$10,$C0,$60,$D4,$E5,$00,$74,$02,$04,$02  ; $A27E
    .byte $03,$0F,$68,$80,$26,$01,$00,$00,$01,$02,$02,$02,$01,$68,$6A,$6B  ; $A28E
    .byte $69,$A0,$14,$20,$F8,$F0,$B0,$07,$A0,$1E,$20,$ED,$F3,$90,$03,$4C  ; $A29E
    .byte $00,$DC,$BD,$28,$05,$29,$BF,$9D,$28,$05,$60,$20,$F6,$F4,$A0,$0E  ; $A2AE
    .byte $20,$F8,$F0,$90,$F5,$A0,$22,$20,$ED,$F3,$90,$03,$20,$AB,$F6,$20  ; $A2BE
    .byte $F6,$F4,$BD,$58,$05,$C9,$59,$F0,$16,$20,$E6,$F6,$C9,$20,$B0,$DA  ; $A2CE
    .byte $A9,$CD,$9D,$88,$05,$A9,$A2,$9D,$A0,$05,$A9,$59,$4C,$46,$F4,$BD  ; $A2DE
    .byte $40,$05,$C9,$04,$F0,$20,$C9,$07,$D0,$C0,$A9,$50,$9D,$68,$04,$A9  ; $A2EE
    .byte $78,$9D,$88,$05,$A9,$A3,$9D,$A0,$05,$A9,$00,$9D,$D8,$03,$9D,$F0  ; $A2FE
    .byte $03,$A9,$58,$4C,$46,$F4,$FE,$40,$05,$A9,$00,$9D,$70,$05,$86,$0F  ; $A30E
    .byte $20,$6C,$FB,$B0,$95,$A9,$44,$99,$00,$03,$BD,$38,$04,$99,$38,$04  ; $A31E
    .byte $A9,$00,$99,$08,$04,$A9,$00,$99,$D8,$03,$99,$A8,$03,$A9,$01,$99  ; $A32E
    .byte $C0,$03,$A9,$04,$99,$F0,$03,$BD,$20,$04,$99,$20,$04,$A5,$E5,$65  ; $A33E
    .byte $E7,$85,$E7,$29,$0F,$85,$0E,$BD,$00,$03,$C9,$43,$F0,$08,$A6,$0E  ; $A34E
    .byte $BD,$B5,$A3,$4C,$69,$A3,$A6,$0E,$BD,$C5,$A3,$A6,$0F,$20,$52,$F4  ; $A35E
    .byte $B9,$78,$03,$38,$E9,$0C,$99,$78,$03,$60,$BD,$68,$04,$F0,$0F,$DE  ; $A36E
    .byte $68,$04,$D0,$32,$A9,$08,$9D,$20,$04,$A9,$6D,$4C,$46,$F4,$BD,$40  ; $A37E
    .byte $05,$C9,$04,$D0,$05,$A9,$00,$9D,$70,$05,$BD,$D8,$03,$18,$69,$40  ; $A38E
    .byte $9D,$D8,$03,$BD,$F0,$03,$69,$00,$9D,$F0,$03,$20,$89,$F2,$BD,$90  ; $A39E
    .byte $03,$F0,$03,$20,$00,$DC,$60,$1E,$1F,$1C,$1A,$1A,$1C,$1E,$1F,$1C  ; $A3AE
    .byte $1A,$1F,$1C,$1A,$1E,$1C,$1A,$1E,$1F,$1C,$1E,$1A,$1C,$1E,$1F,$1C  ; $A3BE
    .byte $1E,$1F,$1C,$1A,$1E,$1F,$1A,$A0,$0E,$20,$F8,$F0,$90,$0A,$A9,$FA  ; $A3CE
    .byte $9D,$88,$05,$A9,$A3,$9D,$A0,$05,$A0,$18,$20,$ED,$F3,$BD,$28,$05  ; $A3DE
    .byte $29,$BF,$9D,$28,$05,$90,$05,$A9,$00,$9D,$20,$04,$4C,$4A,$BC  ; $A3EE
    LDA $0558,X                  ; $A3FD  BD 58 05
    CMP #$77                     ; $A400  C9 77
    BEQ loc_3B_A422              ; $A402  F0 1E
    LDA $0468,X                  ; $A404  BD 68 04
    BNE loc_3B_A40E              ; $A407  D0 05
    LDA #$40                     ; $A409  A9 40
    STA $0468,X                  ; $A40B  9D 68 04

loc_3B_A40E:
    LDY #$14                     ; $A40E  A0 14
    JSR sub_3F_F3ED              ; $A410  20 ED F3
    BCS loc_3B_A41A              ; $A413  B0 05
    DEC $0468,X                  ; $A415  DE 68 04
    BNE loc_3B_A436              ; $A418  D0 1C

loc_3B_A41A:
    LDA #$77                     ; $A41A  A9 77
    JSR sub_3F_F446              ; $A41C  20 46 F4
    JMP loc_3B_A436              ; $A41F  4C 36 A4


loc_3B_A422:
    LDA $0540,X                  ; $A422  BD 40 05
    CMP #$06                     ; $A425  C9 06
    BNE loc_3B_A46C              ; $A427  D0 43
    LDA #$40                     ; $A429  A9 40
    STA $0468,X                  ; $A42B  9D 68 04
    LDA #$76                     ; $A42E  A9 76
    JSR sub_3F_F446              ; $A430  20 46 F4
    JSR sub_3F_F6AB              ; $A433  20 AB F6

loc_3B_A436:
    LDA $0408,X                  ; $A436  BD 08 04
    ORA #$40                     ; $A439  09 40
    STA $0408,X                  ; $A43B  9D 08 04
    JSR sub_3F_FA34              ; $A43E  20 34 FA
    BCS loc_3B_A46C              ; $A441  B0 29
    LDY $10                      ; $A443  A4 10
    LDA $0330,X                  ; $A445  BD 30 03
    SEC                          ; $A448  38
    SBC $0330,Y                  ; $A449  F9 30 03
    LDA $0348,X                  ; $A44C  BD 48 03
    SBC $0348,Y                  ; $A44F  F9 48 03
    BCS loc_3B_A45D              ; $A452  B0 09
    LDA $0528,X                  ; $A454  BD 28 05
    AND #$40                     ; $A457  29 40
    BEQ loc_3B_A46C              ; $A459  F0 11
    BNE loc_3B_A464              ; $A45B  D0 07

loc_3B_A45D:
    LDA $0528,X                  ; $A45D  BD 28 05
    AND #$40                     ; $A460  29 40
    BNE loc_3B_A46C              ; $A462  D0 08

loc_3B_A464:
    LDA $0408,X                  ; $A464  BD 08 04
    AND #$BF                     ; $A467  29 BF
    STA $0408,X                  ; $A469  9D 08 04

loc_3B_A46C:
    RTS                          ; $A46C  60

    .byte $BD,$68,$04,$D0,$05,$A9,$14,$9D,$68,$04,$A9,$00,$9D,$70,$05,$20  ; $A46D
    .byte $DC,$F4,$20,$F6,$F4,$20,$E6,$F6,$C9,$04,$B0,$15,$A9,$A9,$9D,$D8  ; $A47D
    .byte $03,$A9,$05,$9D,$F0,$03,$A9,$34,$9D,$88,$05,$A9,$A5,$9D,$A0,$05  ; $A48D
    .byte $60,$DE,$68,$04,$D0,$C9,$A5,$E5,$65,$E7,$85,$E7,$29,$03,$D0,$03  ; $A49D
    .byte $4C,$2E,$A5,$FE,$40,$05,$A9,$BD,$9D,$88,$05,$A9,$A4,$9D,$A0,$05  ; $A4AD
    .byte $BD,$58,$05,$C9,$79,$D0,$18,$BD,$40,$05,$C9,$05,$D0,$68,$A9,$7A  ; $A4BD
    .byte $20,$46,$F4,$A5,$E6,$65,$E4,$85,$E4,$29,$07,$9D,$40,$05,$60,$BD  ; $A4CD
    .byte $70,$05,$C9,$10,$F0,$13,$C9,$20,$D0,$4C,$A9,$77,$9D,$88,$05,$A9  ; $A4DD
    .byte $A4,$9D,$A0,$05,$A9,$79,$4C,$46,$F4,$86,$0F,$20,$6C,$FB,$B0,$36  ; $A4ED
    .byte $A9,$4F,$99,$00,$03,$A9,$8F,$99,$08,$04,$A9,$00,$99,$A8,$03,$A9  ; $A4FD
    .byte $02,$99,$C0,$03,$BD,$20,$04,$99,$20,$04,$29,$01,$85,$00,$BD,$40  ; $A50D
    .byte $05,$AA,$BD,$4D,$A5,$18,$65,$00,$85,$10,$A6,$0F,$A9,$7B,$20,$9C  ; $A51D
    .byte $F4,$A9,$40,$9D,$68,$04  ; $A52D

loc_3B_A533:
    RTS                          ; $A533  60

    .byte $A9,$00,$9D,$70,$05,$A0,$1C,$20,$F8,$F0,$90,$F3,$A9,$77,$9D,$88  ; $A534
    .byte $05,$A9,$A4,$9D,$A0,$05,$4C,$2E,$A5,$33,$35,$31,$35,$37,$35,$33  ; $A544
    .byte $33,$4C,$13,$F4  ; $A554
    LDA $0540,X                  ; $A558  BD 40 05
    BNE loc_3B_A577              ; $A55B  D0 1A
    LDA #$00                     ; $A55D  A9 00
    STA $0570,X                  ; $A55F  9D 70 05
    JSR sub_3F_F4F6              ; $A562  20 F6 F4
    JSR sub_3F_F6E6              ; $A565  20 E6 F6
    CMP #$40                     ; $A568  C9 40
    BCS loc_3B_A533              ; $A56A  B0 C7
    INC $0540,X                  ; $A56C  FE 40 05
    LDA #$C0                     ; $A56F  A9 C0
    STA $0408,X                  ; $A571  9D 08 04
    JMP sub_3F_F324              ; $A574  4C 24 F3


loc_3B_A577:
    LDA $0570,X                  ; $A577  BD 70 05
    CMP #$04                     ; $A57A  C9 04
    BNE loc_3B_A533              ; $A57C  D0 B5
    LDA $0540,X                  ; $A57E  BD 40 05
    CMP #$01                     ; $A581  C9 01
    BEQ loc_3B_A5F4              ; $A583  F0 6F
    CMP #$04                     ; $A585  C9 04
    BNE loc_3B_A5FD              ; $A587  D0 74
    LDA $0300,X                  ; $A589  BD 00 03
    CMP #$5C                     ; $A58C  C9 5C
    BEQ loc_3B_A593              ; $A58E  F0 03
    JSR sub_3B_A5FE              ; $A590  20 FE A5

loc_3B_A593:
    LDA $0300,X                  ; $A593  BD 00 03
    CMP #$50                     ; $A596  C9 50
    BEQ loc_3B_A5E0              ; $A598  F0 46
    CMP #$56                     ; $A59A  C9 56
    BEQ loc_3B_A5B2              ; $A59C  F0 14
    LDA #$05                     ; $A59E  A9 05
    STA $0588,X                  ; $A5A0  9D 88 05
    LDA #$A7                     ; $A5A3  A9 A7
    STA $05A0,X                  ; $A5A5  9D A0 05
    LDA #$03                     ; $A5A8  A9 03
    STA $0498,X                  ; $A5AA  9D 98 04
    LDA #$88                     ; $A5AD  A9 88
    JMP sub_3F_F446              ; $A5AF  4C 46 F4


loc_3B_A5B2:
    LDA #$D3                     ; $A5B2  A9 D3
    STA $0588,X                  ; $A5B4  9D 88 05
    LDA #$A6                     ; $A5B7  A9 A6
    STA $05A0,X                  ; $A5B9  9D A0 05
    LDA $E6                      ; $A5BC  A5 E6
    ADC $E5                      ; $A5BE  65 E5
    STA $E5                      ; $A5C0  85 E5
    AND #$01                     ; $A5C2  29 01
    TAY                          ; $A5C4  A8
    LDA $A690,Y                  ; $A5C5  B9 90 A6
    STA $03D8,X                  ; $A5C8  9D D8 03
    LDA $A692,Y                  ; $A5CB  B9 92 A6
    STA $03F0,X                  ; $A5CE  9D F0 03
    LDA #$CC                     ; $A5D1  A9 CC
    STA $03A8,X                  ; $A5D3  9D A8 03
    LDA #$00                     ; $A5D6  A9 00
    STA $03C0,X                  ; $A5D8  9D C0 03
    LDA #$87                     ; $A5DB  A9 87
    JMP sub_3F_F446              ; $A5DD  4C 46 F4


loc_3B_A5E0:
    LDA #$9D                     ; $A5E0  A9 9D
    STA $0588,X                  ; $A5E2  9D 88 05
    LDA #$A6                     ; $A5E5  A9 A6
    STA $05A0,X                  ; $A5E7  9D A0 05
    LDA #$40                     ; $A5EA  A9 40
    STA $0468,X                  ; $A5EC  9D 68 04
    LDA #$89                     ; $A5EF  A9 89
    JMP sub_3F_F446              ; $A5F1  4C 46 F4


loc_3B_A5F4:
    LDA $0378,X                  ; $A5F4  BD 78 03
    SEC                          ; $A5F7  38
    SBC #$03                     ; $A5F8  E9 03
    STA $0378,X                  ; $A5FA  9D 78 03

loc_3B_A5FD:
    RTS                          ; $A5FD  60


sub_3B_A5FE:
    LDA #$02                     ; $A5FE  A9 02
    STA $0E                      ; $A600  85 0E
    STX $0F                      ; $A602  86 0F

loc_3B_A604:
    JSR sub_3F_FB6C              ; $A604  20 6C FB
    BCS loc_3B_A648              ; $A607  B0 3F
    LDA #$51                     ; $A609  A9 51
    STA $0300,Y                  ; $A60B  99 00 03
    LDA #$8F                     ; $A60E  A9 8F
    STA $0408,Y                  ; $A610  99 08 04
    LDA $0420,X                  ; $A613  BD 20 04
    STA $0420,Y                  ; $A616  99 20 04
    AND #$01                     ; $A619  29 01
    CLC                          ; $A61B  18
    ADC #$39                     ; $A61C  69 39
    STA $10                      ; $A61E  85 10
    LDA #$18                     ; $A620  A9 18
    JSR sub_3F_F49C              ; $A622  20 9C F4
    LDX $0E                      ; $A625  A6 0E
    LDA $A694,X                  ; $A627  BD 94 A6
    STA $03A8,Y                  ; $A62A  99 A8 03
    STA $03D8,Y                  ; $A62D  99 D8 03
    LDA $A697,X                  ; $A630  BD 97 A6
    STA $03C0,Y                  ; $A633  99 C0 03
    STA $03F0,Y                  ; $A636  99 F0 03
    LDA $0420,Y                  ; $A639  B9 20 04
    ORA $A69A,X                  ; $A63C  1D 9A A6
    STA $0420,Y                  ; $A63F  99 20 04
    LDX $0F                      ; $A642  A6 0F
    DEC $0E                      ; $A644  C6 0E
    BPL loc_3B_A604              ; $A646  10 BC

loc_3B_A648:
    RTS                          ; $A648  60

    LDA $0480,X                  ; $A649  BD 80 04
    BEQ loc_3B_A665              ; $A64C  F0 17
    LDA #$00                     ; $A64E  A9 00
    STA $0570,X                  ; $A650  9D 70 05
    DEC $0480,X                  ; $A653  DE 80 04
    BNE loc_3B_A68F              ; $A656  D0 37
    LDA #$58                     ; $A658  A9 58
    STA $0588,X                  ; $A65A  9D 88 05
    LDA #$A5                     ; $A65D  A9 A5
    STA $05A0,X                  ; $A65F  9D A0 05
    JMP sub_3F_F4DC              ; $A662  4C DC F4


loc_3B_A665:
    LDA $0570,X                  ; $A665  BD 70 05
    CMP #$04                     ; $A668  C9 04
    BNE loc_3B_A68F              ; $A66A  D0 23
    LDA $0540,X                  ; $A66C  BD 40 05
    CMP #$01                     ; $A66F  C9 01
    BEQ loc_3B_A686              ; $A671  F0 13
    CMP #$03                     ; $A673  C9 03
    BNE loc_3B_A68F              ; $A675  D0 18
    LDA #$80                     ; $A677  A9 80
    STA $0408,X                  ; $A679  9D 08 04
    LDA #$40                     ; $A67C  A9 40
    STA $0480,X                  ; $A67E  9D 80 04
    LDA #$86                     ; $A681  A9 86
    JMP sub_3F_F446              ; $A683  4C 46 F4


loc_3B_A686:
    LDA $0378,X                  ; $A686  BD 78 03
    CLC                          ; $A689  18
    ADC #$03                     ; $A68A  69 03
    STA $0378,X                  ; $A68C  9D 78 03

loc_3B_A68F:
    RTS                          ; $A68F  60

    .byte $2C,$00,$03,$04,$80,$0F,$0F,$01,$01,$01,$00,$08,$04  ; $A690
    LDY #$1D                     ; $A69D  A0 1D
    JSR sub_3F_F0F8              ; $A69F  20 F8 F0
    BCC loc_3B_A68F              ; $A6A2  90 EB
    LDY #$2A                     ; $A6A4  A0 2A
    JSR sub_3F_F3ED              ; $A6A6  20 ED F3
    BCS loc_3B_A6B9              ; $A6A9  B0 0E
    DEC $0468,X                  ; $A6AB  DE 68 04
    BNE loc_3B_A68F              ; $A6AE  D0 DF
    JSR sub_3F_F4DC              ; $A6B0  20 DC F4
    JSR sub_3F_F4F6              ; $A6B3  20 F6 F4
    JSR sub_3B_A5FE              ; $A6B6  20 FE A5

loc_3B_A6B9:
    LDA #$49                     ; $A6B9  A9 49
    STA $0588,X                  ; $A6BB  9D 88 05
    LDA #$A6                     ; $A6BE  A9 A6
    STA $05A0,X                  ; $A6C0  9D A0 05
    LDA #$A0                     ; $A6C3  A9 A0
    STA $0408,X                  ; $A6C5  9D 08 04
    LDA #$8F                     ; $A6C8  A9 8F
    JMP sub_3F_F446              ; $A6CA  4C 46 F4

    JSR sub_3F_F413              ; $A6CD  20 13 F4
    JMP sub_3F_F434              ; $A6D0  4C 34 F4

    LDA $0540,X                  ; $A6D3  BD 40 05
    AND #$03                     ; $A6D6  29 03
    BNE loc_3B_A6E8              ; $A6D8  D0 0E
    LDA $0540,X                  ; $A6DA  BD 40 05
    BEQ loc_3B_A704              ; $A6DD  F0 25
    LDA $0570,X                  ; $A6DF  BD 70 05
    CMP #$04                     ; $A6E2  C9 04
    BNE loc_3B_A704              ; $A6E4  D0 1E
    BEQ loc_3B_A6B9              ; $A6E6  F0 D1

loc_3B_A6E8:
    LDY #$1D                     ; $A6E8  A0 1D
    JSR sub_3F_F0F8              ; $A6EA  20 F8 F0
    BCC loc_3B_A6FA              ; $A6ED  90 0B
    LDA #$00                     ; $A6EF  A9 00
    STA $0570,X                  ; $A6F1  9D 70 05
    LDA #$04                     ; $A6F4  A9 04
    STA $0540,X                  ; $A6F6  9D 40 05
    RTS                          ; $A6F9  60


loc_3B_A6FA:
    LDA #$00                     ; $A6FA  A9 00
    STA $0570,X                  ; $A6FC  9D 70 05
    LDY #$2A                     ; $A6FF  A0 2A
    JSR sub_3F_F3ED              ; $A701  20 ED F3

loc_3B_A704:
    RTS                          ; $A704  60

    .byte $BD,$68,$04,$F0,$05,$DE,$68,$04,$D0,$19,$86,$0F,$A9,$00,$85,$0E  ; $A705
    .byte $20,$DC,$F4,$20,$04,$A6,$DE,$98,$04,$D0,$03,$4C,$B9,$A6,$A9,$28  ; $A715
    .byte $9D,$68,$04,$60,$20,$F1,$A8,$BD,$40,$05,$D0,$1B,$A9,$00,$9D,$70  ; $A725
    .byte $05,$20,$DC,$F4,$20,$F6,$F4,$20,$E6,$F6,$C9,$40,$B0,$1E,$FE,$40  ; $A735
    .byte $05,$A9,$D1,$9D,$08,$04,$60,$C9,$03,$D0,$11,$BD,$78,$03,$38,$E9  ; $A745
    .byte $08,$9D,$78,$03,$A9,$0C,$9D,$68,$04,$20,$B5,$A8,$60,$20,$F1,$A8  ; $A755
    .byte $BD,$58,$05,$C9,$7C,$D0,$0C,$BD,$40,$05,$C9,$03,$D0,$EE,$A9,$7D  ; $A765
    .byte $4C,$46,$F4,$BD,$68,$04,$F0,$24,$DE,$68,$04,$D0,$1F,$A9,$00,$85  ; $A775
    .byte $00,$A0,$17,$B9,$00,$03,$F0,$06,$C9,$51,$D0,$02,$E6,$00,$88,$C0  ; $A785
    .byte $07,$D0,$F0,$A5,$00,$C9,$06,$B0,$03,$20,$FE,$A5,$A0,$26,$20,$70  ; $A795
    .byte $A8,$BD,$F0,$03,$30,$05,$A0,$2E,$4C,$ED,$F3,$A5,$10,$29,$10,$D0  ; $A7A5
    .byte $18,$A9,$05,$9D,$88,$05,$A9,$A8,$9D,$A0,$05,$A9,$00,$9D,$70,$05  ; $A7B5
    .byte $9D,$40,$05,$A9,$0C,$9D,$68,$04,$60,$A9,$E5,$9D,$88,$05,$A9,$A7  ; $A7C5
    .byte $9D,$A0,$05,$A9,$00,$9D,$A8,$03,$9D,$C0,$03,$A9,$9F,$4C,$46,$F4  ; $A7D5
    .byte $20,$F1,$A8,$BD,$40,$05,$C9,$03,$D0,$05,$A9,$00,$9D,$70,$05,$A0  ; $A7E5
    .byte $0E,$20,$70,$A8,$90,$74,$A9,$05,$9D,$88,$05,$A9,$A8,$9D,$A0,$05  ; $A7F5
    .byte $20,$F1,$A8,$BD,$58,$05,$C9,$9F,$F0,$2C,$A9,$00,$9D,$70,$05,$BD  ; $A805
    .byte $C8,$04,$30,$08,$DE,$68,$04,$D0,$03,$4C,$A5,$A8,$A0,$26,$20,$70  ; $A815
    .byte $A8,$B0,$05,$A0,$2E,$4C,$ED,$F3,$BD,$78,$03,$18,$69,$08,$9D,$78  ; $A825
    .byte $03,$A9,$9F,$4C,$46,$F4,$BD,$B0,$04,$F0,$1E,$A9,$00,$9D,$70,$05  ; $A835
    .byte $DE,$B0,$04,$D0,$25,$A9,$29,$9D,$88,$05,$A9,$A7,$9D,$A0,$05,$A9  ; $A845
    .byte $00,$9D,$C8,$04,$A9,$7C,$4C,$46,$F4,$BD,$40,$05,$C9,$03,$D0,$0A  ; $A855
    .byte $A9,$40,$9D,$B0,$04,$A9,$A0,$9D,$08,$04,$60,$A9,$15,$85,$99,$20  ; $A865
    .byte $F8,$F0,$08,$A5,$22,$C9,$0C,$F0,$08,$AD,$3E,$01,$DD,$78,$03,$B0  ; $A875
    .byte $09,$A5,$10,$C9,$60,$F0,$13,$BD,$78,$03,$9D,$78,$03,$A9,$FF,$9D  ; $A885
    .byte $C8,$04,$BD,$F0,$03,$30,$03,$20,$24,$F3,$28,$A9,$40,$85,$99,$60  ; $A895
    .byte $A9,$20,$9D,$68,$04,$A5,$E6,$65,$E7,$85,$E7,$29,$01,$F0,$01,$60  ; $A8A5
    .byte $A9,$95,$9D,$D8,$03,$A9,$02,$9D,$F0,$03,$A5,$E7,$E5,$E5,$85,$E5  ; $A8B5
    .byte $29,$03,$A8,$B9,$E9,$A8,$9D,$A8,$03,$B9,$ED,$A8,$9D,$C0,$03,$A9  ; $A8C5
    .byte $62,$9D,$88,$05,$A9,$A7,$9D,$A0,$05,$20,$DC,$F4,$20,$F6,$F4,$A9  ; $A8D5
    .byte $7D,$4C,$46,$F4,$00,$CC,$00,$00,$00,$00,$00,$00,$BD,$98,$04,$F0  ; $A8E5
    .byte $04,$DE,$98,$04,$60,$BD,$80,$04,$29,$01,$A8,$B9,$3D,$A9,$9D,$98  ; $A8F5
    .byte $04,$FE,$80,$04,$20,$6C,$FB,$B0,$2E,$A9,$66,$99,$00,$03,$A9,$00  ; $A905
    .byte $99,$08,$04,$BD,$20,$04,$99,$20,$04,$29,$01,$18,$69,$42,$85,$10  ; $A915
    .byte $A9,$7E,$20,$9C,$F4,$B9,$28,$05,$29,$BF,$99,$28,$05,$A9,$00,$99  ; $A925
    .byte $D8,$03,$A9,$01,$99,$F0,$03  ; $A935

loc_3B_A93C:
    RTS                          ; $A93C  60

    .byte $78,$28  ; $A93D
    LDY #$23                     ; $A93F  A0 23
    JSR sub_3F_F0C1              ; $A941  20 C1 F0
    LDA $10                      ; $A944  A5 10
    CMP #$60                     ; $A946  C9 60
    BNE loc_3B_A94F              ; $A948  D0 05
    LDA $0390,X                  ; $A94A  BD 90 03
    BEQ loc_3B_A93C              ; $A94D  F0 ED

loc_3B_A94F:
    JMP sub_3E_DC00              ; $A94F  4C 00 DC

    .byte $BD,$78,$03,$9D,$68,$04,$20,$E6,$F6,$C9,$40,$B0,$47,$A9,$00,$9D  ; $A952
    .byte $D8,$03,$A9,$02,$9D,$F0,$03,$A9,$78,$9D,$88,$05,$A9,$A9,$9D,$A0  ; $A962
    .byte $05,$A9,$04,$9D,$20,$04,$A0,$1F,$20,$00,$F4,$B0,$1D,$BD,$20,$04  ; $A972
    .byte $29,$04,$D0,$20,$BD,$68,$04,$DD,$78,$03,$90,$18,$9D,$78,$03,$A9  ; $A982
    .byte $58,$9D,$88,$05,$A9,$A9,$9D,$A0,$05,$60,$A9,$08,$9D,$20,$04,$A9  ; $A992
    .byte $01,$9D,$F0,$03,$60,$20,$E6,$F6,$C9,$40,$B0,$17,$A9,$11,$9D,$88  ; $A9A2
    .byte $05,$A9,$AA,$9D,$A0,$05,$20,$24,$F3,$A9,$04,$9D,$20,$04,$A9,$91  ; $A9B2
    .byte $4C,$46,$F4,$BD,$68,$04,$F0,$28,$DE,$68,$04,$A0,$22,$20,$C1,$F0  ; $A9C2
    .byte $BD,$20,$04,$29,$01,$0A,$A8,$B9,$45,$00,$29,$10,$F0,$07,$A0,$2C  ; $A9D2
    .byte $20,$ED,$F3,$90,$08,$BD,$20,$04,$49,$03,$9D,$20,$04,$4C,$A5,$AA  ; $A9E2
    .byte $A9,$00,$9D,$D8,$03,$A9,$01,$9D,$F0,$03,$A9,$14,$9D,$68,$04,$BD  ; $A9F2
    .byte $20,$04,$29,$03,$D0,$03,$4C,$DC,$F4,$A9,$00,$9D,$20,$04,$60,$BD  ; $AA02
    .byte $40,$05,$C9,$01,$F0,$3A,$C9,$02,$F0,$51,$C9,$04,$D0,$6C,$BD,$20  ; $AA12
    .byte $04,$C9,$04,$D0,$12,$A9,$8D,$9D,$88,$05,$A9,$AA,$9D,$A0,$05,$20  ; $AA22
    .byte $DC,$F4,$A9,$92,$4C,$46,$F4,$A9,$A7,$9D,$88,$05,$A9,$A9,$9D,$A0  ; $AA32
    .byte $05,$A9,$00,$9D,$D8,$03,$A9,$01,$9D,$F0,$03,$A9,$90,$4C,$46,$F4  ; $AA42
    .byte $BD,$20,$04,$C9,$04,$D0,$08,$BD,$78,$03,$18,$69,$08,$D0,$06,$BD  ; $AA52
    .byte $78,$03,$38,$E9,$08,$9D,$78,$03,$FE,$40,$05,$A9,$00,$9D,$70,$05  ; $AA62
    .byte $BD,$20,$04,$C9,$04,$D0,$09,$A0,$21,$20,$F8,$F0,$90,$0C,$B0,$07  ; $AA72
    .byte $A0,$22,$20,$C1,$F0,$90,$03,$FE,$40,$05,$60,$20,$E6,$F6,$C9,$40  ; $AA82
    .byte $B0,$1A,$A0,$21,$20,$F8,$F0,$90,$F1,$A0,$2C,$20,$ED,$F3,$90,$03  ; $AA92
    .byte $4C,$E7,$A9,$BD,$28,$05,$29,$BF,$9D,$28,$05,$60,$A9,$11,$9D,$88  ; $AAA2
    .byte $05,$A9,$AA,$9D,$A0,$05,$A9,$00,$9D,$D8,$03,$A9,$02,$9D,$F0,$03  ; $AAB2
    .byte $A9,$08,$9D,$20,$04,$A9,$93,$4C,$46,$F4,$A9,$03,$9D,$50,$04,$20  ; $AAC2
    .byte $DC,$F4,$20,$F6,$F4,$20,$34,$FA,$B0,$0F,$A9,$70,$9D,$88,$05,$A9  ; $AAD2
    .byte $AB,$9D,$A0,$05,$A9,$95,$4C,$46,$F4,$BD,$40,$05,$D0,$11,$BD,$68  ; $AAE2
    .byte $04,$F0,$26,$DE,$68,$04,$F0,$03,$4C,$B0,$AB,$FE,$40,$05,$60,$BD  ; $AAF2
    .byte $70,$05,$C9,$03,$D0,$67,$BD,$40,$05,$C9,$04,$F0,$12,$C9,$08,$D0  ; $AB02
    .byte $5C,$A9,$00,$9D,$40,$05,$9D,$70,$05,$A9,$40,$9D,$68,$04,$60,$A0  ; $AB12
    .byte $04,$20,$E6,$F6,$D9,$B6,$AB,$B0,$03,$88,$D0,$F8,$84,$0E,$86,$0F  ; $AB22
    .byte $20,$6C,$FB,$B0,$38,$A9,$63,$99,$00,$03,$A9,$8F,$99,$08,$04,$BD  ; $AB32
    .byte $20,$04,$99,$20,$04,$29,$01,$18,$69,$3D,$85,$10,$A9,$96,$20,$9C  ; $AB42
    .byte $F4,$A6,$0E,$BD,$BB,$AB,$99,$A8,$03,$BD,$C0,$AB,$99,$C0,$03,$BD  ; $AB52
    .byte $C5,$AB,$99,$D8,$03,$BD,$CA,$AB,$99,$F0,$03,$A6,$0F,$60,$A9,$03  ; $AB62
    .byte $9D,$50,$04,$BD,$80,$04,$F0,$08,$DE,$80,$04,$D0,$31,$FE,$40,$05  ; $AB72
    .byte $A9,$8D,$9D,$08,$04,$BD,$40,$05,$C9,$02,$F0,$18,$C9,$0B,$D0,$DD  ; $AB82
    .byte $A9,$CD,$9D,$08,$04,$A9,$CC,$9D,$88,$05,$A9,$AA,$9D,$A0,$05,$A9  ; $AB92
    .byte $94,$4C,$46,$F4,$A9,$00,$9D,$08,$04,$A9,$40,$9D,$80,$04,$A9,$00  ; $ABA2
    .byte $9D,$70,$05,$60,$00,$10,$20,$38,$50,$00,$30,$00,$64,$D0,$00,$01  ; $ABB2
    .byte $02,$02,$02,$00,$D4,$D4,$74,$DE,$02,$02,$02,$03,$03,$20,$13,$F4  ; $ABC2
    .byte $4C,$A7,$F2,$FE,$68,$04,$BD,$68,$04,$29,$07,$D0,$1C,$20,$A6,$F7  ; $ABD2
    .byte $B9,$01,$AC,$9D,$A8,$03,$B9,$15,$AC,$9D,$C0,$03,$B9,$05,$AC,$9D  ; $ABE2
    .byte $D8,$03,$B9,$19,$AC,$9D,$F0,$03,$60,$20,$13,$F4,$4C,$34,$F4,$00  ; $ABF2
    .byte $40,$5A,$6E,$80,$6E,$5A,$40,$00,$40,$5A,$6E,$80,$6E,$5A,$40,$00  ; $AC02
    .byte $40,$5A,$6E,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $AC12
    .byte $00,$00,$00,$00,$00,$00,$00,$BD,$68,$04,$F0,$04,$DE,$68,$04,$60  ; $AC22
    .byte $A9,$50,$9D,$68,$04,$20,$6C,$FB,$B0,$14,$A9,$68,$99,$00,$03,$A9  ; $AC32
    .byte $CF,$99,$08,$04,$A9,$01,$99,$50,$04,$A9,$A0,$20,$52,$F4,$60,$BD  ; $AC42
    .byte $40,$05,$C9,$10,$F0,$1B,$C9,$13,$D0,$F4,$A9,$80,$9D,$88,$05,$A9  ; $AC52
    .byte $AC,$9D,$A0,$05,$A9,$00,$99,$D8,$03,$99,$F0,$03,$A9,$A1,$4C,$46  ; $AC62
    .byte $F4,$BD,$78,$03,$18,$69,$08,$9D,$78,$03,$FE,$40,$05,$60,$BD,$40  ; $AC72
    .byte $05,$D0,$0F,$A0,$14,$20,$F8,$F0,$90,$03,$FE,$40,$05,$A9,$00,$9D  ; $AC82
    .byte $70,$05,$60,$20,$36,$A4,$BD,$68,$04,$F0,$05,$DE,$68,$04,$D0,$36  ; $AC92
    .byte $BD,$28,$05,$29,$40,$F0,$11,$AD,$30,$03,$38,$FD,$30,$03,$AD,$48  ; $ACA2
    .byte $03,$FD,$48,$03,$B0,$20,$90,$0F,$BD,$30,$03,$38,$ED,$30,$03,$BD  ; $ACB2
    .byte $48,$03,$ED,$48,$03,$B0,$0F,$A9,$D9,$9D,$88,$05,$A9,$AC,$9D,$A0  ; $ACC2
    .byte $05,$A9,$73,$20,$46,$F4,$60,$20,$36,$A4,$BD,$70,$05,$C9,$05,$D0  ; $ACD2
    .byte $F5,$BD,$40,$05,$C9,$08,$F0,$18,$C9,$09,$D0,$EA,$A9,$40,$9D,$68  ; $ACE2
    .byte $04,$A9,$95,$9D,$88,$05,$A9,$AC,$9D,$A0,$05,$A9,$72,$4C,$46,$F4  ; $ACF2
    .byte $A0,$00,$20,$E6,$F6,$C9,$40,$B0,$06,$C8,$C9,$30,$B0,$01,$C8,$84  ; $AD02
    .byte $0E,$86,$0F,$20,$6C,$FB,$B0,$43,$A9,$6A,$99,$00,$03,$A9,$8F,$99  ; $AD12
    .byte $08,$04,$A6,$0E,$BD,$5E,$AD,$99,$A8,$03,$BD,$61,$AD,$99,$C0,$03  ; $AD22
    .byte $BD,$64,$AD,$99,$D8,$03,$BD,$67,$AD,$99,$F0,$03,$A6,$0F,$A9,$01  ; $AD32
    .byte $99,$20,$04,$BD,$28,$05,$A2,$45,$29,$40,$F0,$06,$A9,$02,$99,$20  ; $AD42
    .byte $04,$CA,$86,$10,$A6,$0F,$A9,$18,$20,$9C,$F4,$60,$00,$00,$00,$02  ; $AD52
    .byte $02,$01,$A9,$00,$00,$05,$02,$02,$20,$13,$F4,$4C,$A7,$F2,$BD,$68  ; $AD62
    .byte $04,$F0,$2D,$DE,$68,$04,$20,$34,$F4,$A0,$28,$20,$FC,$D2,$A5,$45  ; $AD72
    .byte $29,$10,$F0,$06,$A5,$46,$29,$10,$D0,$03,$4C,$13,$F4,$A9,$C3,$9D  ; $AD82
    .byte $88,$05,$A9,$AD,$9D,$A0,$05,$A9,$00,$9D,$D8,$03,$9D,$F0,$03,$60  ; $AD92
    .byte $A9,$08,$9D,$68,$04,$20,$A6,$F7,$B9,$AA,$90,$9D,$A8,$03,$B9,$BA  ; $ADA2
    .byte $90,$9D,$C0,$03,$B9,$CA,$90,$9D,$D8,$03,$B9,$DA,$90,$9D,$F0,$03  ; $ADB2
    .byte $60,$BD,$58,$05,$C9,$9A,$D0,$0C,$A0,$29,$20,$F8,$F0,$90,$F1,$A9  ; $ADC2
    .byte $9B,$4C,$46,$F4,$BD,$40,$05,$C9,$06,$D0,$E5,$A9,$F1,$9D,$88,$05  ; $ADD2
    .byte $A9,$AD,$9D,$A0,$05,$A9,$1F,$9D,$80,$04,$A9,$9C,$4C,$46,$F4,$20  ; $ADE2
    .byte $DC,$F4,$20,$F6,$F4,$BD,$58,$05,$C9,$9C,$D0,$0A,$DE,$80,$04,$D0  ; $ADF2
    .byte $48,$A9,$9D,$4C,$46,$F4,$BD,$40,$05,$C9,$03,$F0,$0E,$C9,$08,$D0  ; $AE02
    .byte $38,$A9,$50,$9D,$80,$04,$A9,$9C,$4C,$46,$F4,$FE,$40,$05,$20,$6C  ; $AE12
    .byte $FB,$B0,$26,$A9,$6E,$99,$00,$03,$A9,$8F,$99,$08,$04,$A9,$00,$99  ; $AE22
    .byte $A8,$03,$A9,$02,$99,$C0,$03,$BD,$20,$04,$99,$20,$04,$29,$01,$18  ; $AE32
    .byte $69,$33,$85,$10,$A9,$18,$20,$9C,$F4  ; $AE42

loc_3B_AE4B:
    RTS                          ; $AE4B  60

    .byte $4C,$13,$F4  ; $AE4C
    LDY #$1C                     ; $AE4F  A0 1C
    JSR sub_3F_F3ED              ; $AE51  20 ED F3
    BCC loc_3B_AE59              ; $AE54  90 03
    JSR sub_3F_F6AB              ; $AE56  20 AB F6

loc_3B_AE59:
    JSR sub_3F_F4DC              ; $AE59  20 DC F4
    JSR sub_3F_F4F6              ; $AE5C  20 F6 F4
    JSR sub_3F_F6E6              ; $AE5F  20 E6 F6
    CMP #$40                     ; $AE62  C9 40
    BCS loc_3B_AE4B              ; $AE64  B0 E5
    LDA #$52                     ; $AE66  A9 52
    STA $03D8,X                  ; $AE68  9D D8 03
    LDA #$06                     ; $AE6B  A9 06
    STA $03F0,X                  ; $AE6D  9D F0 03
    LDA #$33                     ; $AE70  A9 33
    STA $03A8,X                  ; $AE72  9D A8 03
    LDA #$01                     ; $AE75  A9 01
    STA $03C0,X                  ; $AE77  9D C0 03
    LDA #$94                     ; $AE7A  A9 94
    STA $0588,X                  ; $AE7C  9D 88 05
    LDA #$AE                     ; $AE7F  A9 AE
    STA $05A0,X                  ; $AE81  9D A0 05
    LDA #$60                     ; $AE84  A9 60
    STA $0468,X                  ; $AE86  9D 68 04
    LDA $0378,X                  ; $AE89  BD 78 03
    STA $0480,X                  ; $AE8C  9D 80 04
    LDA #$99                     ; $AE8F  A9 99
    JMP sub_3F_F446              ; $AE91  4C 46 F4

    JSR sub_3F_F2A7              ; $AE94  20 A7 F2
    JSR sub_3F_F413              ; $AE97  20 13 F4
    LDA $0498,X                  ; $AE9A  BD 98 04
    BNE loc_3B_AEFB              ; $AE9D  D0 5C
    LDY #$02                     ; $AE9F  A0 02
    JSR sub_3E_D2FC              ; $AEA1  20 FC D2
    LDA $10                      ; $AEA4  A5 10
    AND #$E0                     ; $AEA6  29 E0
    CMP $0468,X                  ; $AEA8  DD 68 04
    BEQ loc_3B_AEF0              ; $AEAB  F0 43
    STA $0468,X                  ; $AEAD  9D 68 04
    JSR sub_3F_FB6C              ; $AEB0  20 6C FB
    BCS loc_3B_AEFB              ; $AEB3  B0 46
    LDA #$80                     ; $AEB5  A9 80
    STA $0300,Y                  ; $AEB7  99 00 03
    LDA #$00                     ; $AEBA  A9 00
    STA $0408,Y                  ; $AEBC  99 08 04
    LDA #$A4                     ; $AEBF  A9 A4
    JSR sub_3F_F452              ; $AEC1  20 52 F4
    LDA $0378,Y                  ; $AEC4  B9 78 03
    AND #$F0                     ; $AEC7  29 F0
    STA $0378,Y                  ; $AEC9  99 78 03
    LDA $0528,Y                  ; $AECC  B9 28 05
    AND #$BF                     ; $AECF  29 BF
    STA $0528,Y                  ; $AED1  99 28 05
    LDA $0468,X                  ; $AED4  BD 68 04
    CMP #$60                     ; $AED7  C9 60
    BEQ loc_3B_AEE5              ; $AED9  F0 0A
    LDA $0378,Y                  ; $AEDB  B9 78 03
    CLC                          ; $AEDE  18
    ADC #$10                     ; $AEDF  69 10
    STA $0378,Y                  ; $AEE1  99 78 03
    RTS                          ; $AEE4  60


loc_3B_AEE5:
    LDA #$FC                     ; $AEE5  A9 FC
    STA $0588,X                  ; $AEE7  9D 88 05
    LDA #$AE                     ; $AEEA  A9 AE
    STA $05A0,X                  ; $AEEC  9D A0 05
    RTS                          ; $AEEF  60


loc_3B_AEF0:
    LDA $0480,X                  ; $AEF0  BD 80 04
    CMP $0378,X                  ; $AEF3  DD 78 03
    BCS loc_3B_AEFB              ; $AEF6  B0 03
    INC $0498,X                  ; $AEF8  FE 98 04

loc_3B_AEFB:
    RTS                          ; $AEFB  60

    JSR sub_3F_F2A7              ; $AEFC  20 A7 F2
    LDA $0480,X                  ; $AEFF  BD 80 04
    CMP $0378,X                  ; $AF02  DD 78 03
    BCS loc_3B_AEFB              ; $AF05  B0 F4
    STA $0378,X                  ; $AF07  9D 78 03
    LDA #$98                     ; $AF0A  A9 98
    JSR sub_3F_F446              ; $AF0C  20 46 F4
    LDA #$19                     ; $AF0F  A9 19
    STA $0588,X                  ; $AF11  9D 88 05
    LDA #$AF                     ; $AF14  A9 AF
    STA $05A0,X                  ; $AF16  9D A0 05
    LDY #$1C                     ; $AF19  A0 1C
    JSR sub_3F_F3ED              ; $AF1B  20 ED F3
    BCC loc_3B_AEFB              ; $AF1E  90 DB
    LDA #$00                     ; $AF20  A9 00
    STA $03A8,X                  ; $AF22  9D A8 03
    LDA #$02                     ; $AF25  A9 02
    STA $03C0,X                  ; $AF27  9D C0 03
    LDA #$4F                     ; $AF2A  A9 4F
    STA $0588,X                  ; $AF2C  9D 88 05
    LDA #$AE                     ; $AF2F  A9 AE
    STA $05A0,X                  ; $AF31  9D A0 05
    RTS                          ; $AF34  60

    .byte $BD,$68,$04,$D0,$1D,$A0,$01,$BD,$28,$05,$29,$40,$D0,$01,$C8,$98  ; $AF35
    .byte $09,$08,$9D,$20,$04,$A9,$4C,$9D,$D8,$03,$A9,$01,$9D,$F0,$03,$FE  ; $AF45
    .byte $68,$04,$A0,$2A,$20,$88,$F0,$90,$03,$4C,$13,$F4,$BD,$20,$04,$49  ; $AF55
    .byte $0F,$9D,$20,$04,$A9,$79,$9D,$88,$05,$A9,$AF,$9D,$A0,$05,$FE,$78  ; $AF65
    .byte $03,$FE,$78,$03,$A0,$30,$20,$ED,$F3,$90,$03,$4C,$34,$F4,$BD,$20  ; $AF75
    .byte $04,$29,$08,$F0,$1F,$A9,$57,$9D,$88,$05,$A9,$AF,$9D,$A0,$05,$BD  ; $AF85
    .byte $20,$04,$29,$01,$D0,$07,$DE,$30,$03,$DE,$30,$03,$60,$FE,$30,$03  ; $AF95
    .byte $FE,$30,$03,$60,$A9,$C9,$9D,$88,$05,$A9,$AF,$9D,$A0,$05,$BD,$20  ; $AFA5
    .byte $04,$29,$01,$D0,$09,$DE,$30,$03,$DE,$30,$03,$4C,$C9,$AF,$FE,$30  ; $AFB5
    .byte $03,$FE,$30,$03,$A0,$2B,$20,$C1,$F0,$90,$03,$4C,$13,$F4,$BD,$20  ; $AFC5
    .byte $04,$49,$0F,$9D,$20,$04,$DE,$78,$03,$DE,$78,$03,$A9,$79,$9D,$88  ; $AFD5
    .byte $05,$A9,$AF,$9D,$A0,$05,$60  ; $AFE5
    LDA $0468,X                  ; $AFEC  BD 68 04
    BEQ loc_3B_B00A              ; $AFEF  F0 19
    DEC $0468,X                  ; $AFF1  DE 68 04
    BNE loc_3B_B01A              ; $AFF4  D0 24
    LDA #$C0                     ; $AFF6  A9 C0
    STA $0408,X                  ; $AFF8  9D 08 04
    LDA #$1B                     ; $AFFB  A9 1B
    STA $0588,X                  ; $AFFD  9D 88 05
    LDA #$B0                     ; $B000  A9 B0
    STA $05A0,X                  ; $B002  9D A0 05
    LDA #$6A                     ; $B005  A9 6A
    JMP sub_3F_F446              ; $B007  4C 46 F4


loc_3B_B00A:
    LDY #$3C                     ; $B00A  A0 3C
    LDA $E6                      ; $B00C  A5 E6
    SBC $E5                      ; $B00E  E5 E5
    AND #$01                     ; $B010  29 01
    BEQ loc_3B_B016              ; $B012  F0 02
    LDY #$B4                     ; $B014  A0 B4

loc_3B_B016:
    TYA                          ; $B016  98
    STA $0468,X                  ; $B017  9D 68 04

loc_3B_B01A:
    RTS                          ; $B01A  60

    LDA #$6B                     ; $B01B  A9 6B
    CMP $0558,X                  ; $B01D  DD 58 05
    BEQ loc_3B_B02E              ; $B020  F0 0C
    LDA $0540,X                  ; $B022  BD 40 05
    CMP #$02                     ; $B025  C9 02
    BNE loc_3B_B07C              ; $B027  D0 53
    LDA #$6B                     ; $B029  A9 6B
    JSR sub_3F_F446              ; $B02B  20 46 F4

loc_3B_B02E:
    LDA $0480,X                  ; $B02E  BD 80 04
    BNE loc_3B_B05A              ; $B031  D0 27
    JSR sub_3F_F6FD              ; $B033  20 FD F6
    TAY                          ; $B036  A8
    LDA $B0B1,Y                  ; $B037  B9 B1 B0
    STA $03A8,X                  ; $B03A  9D A8 03
    LDA $B0C5,Y                  ; $B03D  B9 C5 B0
    STA $03C0,X                  ; $B040  9D C0 03
    LDA $B0B5,Y                  ; $B043  B9 B5 B0
    STA $03D8,X                  ; $B046  9D D8 03
    LDA $B0C9,Y                  ; $B049  B9 C9 B0
    STA $03F0,X                  ; $B04C  9D F0 03
    LDA $F796,Y                  ; $B04F  B9 96 F7
    STA $0420,X                  ; $B052  9D 20 04
    LDA #$79                     ; $B055  A9 79
    STA $0480,X                  ; $B057  9D 80 04

loc_3B_B05A:
    DEC $0480,X                  ; $B05A  DE 80 04
    JSR sub_3F_F413              ; $B05D  20 13 F4
    JSR sub_3F_F434              ; $B060  20 34 F4
    JSR sub_3F_F95D              ; $B063  20 5D F9
    BCS loc_3B_B07C              ; $B066  B0 14
    LDA #$00                     ; $B068  A9 00
    STA $03D8,X                  ; $B06A  9D D8 03
    LDA #$02                     ; $B06D  A9 02
    STA $03F0,X                  ; $B06F  9D F0 03
    LDA #$7D                     ; $B072  A9 7D
    STA $0588,X                  ; $B074  9D 88 05
    LDA #$B0                     ; $B077  A9 B0
    STA $05A0,X                  ; $B079  9D A0 05

loc_3B_B07C:
    RTS                          ; $B07C  60

    LDY #$3A                     ; $B07D  A0 3A
    JSR sub_3F_F0C1              ; $B07F  20 C1 F0
    BCC loc_3B_B07C              ; $B082  90 F8
    LDA #$6C                     ; $B084  A9 6C
    CMP $0558,X                  ; $B086  DD 58 05
    BEQ loc_3B_B08E              ; $B089  F0 03
    JSR sub_3F_F446              ; $B08B  20 46 F4

loc_3B_B08E:
    LDA $0540,X                  ; $B08E  BD 40 05
    CMP #$02                     ; $B091  C9 02
    BNE loc_3B_B07C              ; $B093  D0 E7
    LDA #$EC                     ; $B095  A9 EC
    STA $0588,X                  ; $B097  9D 88 05
    LDA #$AF                     ; $B09A  A9 AF
    STA $05A0,X                  ; $B09C  9D A0 05
    LDA #$00                     ; $B09F  A9 00
    STA $0468,X                  ; $B0A1  9D 68 04
    STA $0480,X                  ; $B0A4  9D 80 04
    LDA #$80                     ; $B0A7  A9 80
    STA $0408,X                  ; $B0A9  9D 08 04
    LDA #$69                     ; $B0AC  A9 69
    JMP sub_3F_F446              ; $B0AE  4C 46 F4

    .byte $00,$40,$5A,$6E,$80,$6E,$5A,$40,$00,$40,$5A,$6E,$80,$6E,$5A,$40  ; $B0B1
    .byte $00,$40,$5A,$6E,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $B0C1
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$20,$34,$F4,$20,$13,$F4,$AD,$98  ; $B0D1
    .byte $04,$D0,$06,$20,$DC,$F4,$20,$F6,$F4,$FE,$98,$04,$BD,$98,$04,$C9  ; $B0E1
    .byte $30,$D0,$5D,$A9,$21,$9D,$88,$05,$A9,$B1,$9D,$A0,$05,$20,$DC,$F4  ; $B0F1
    .byte $20,$F6,$F4,$20,$FD,$F6,$A8,$29,$07,$85,$00,$B9,$96,$F7,$29,$FC  ; $B101
    .byte $1D,$20,$04,$9D,$20,$04,$A9,$30,$9D,$68,$04,$A4,$00,$20,$52,$B1  ; $B111
    .byte $AD,$3E,$01,$18,$69,$08,$DD,$78,$03,$90,$08,$9D,$78,$03,$A9,$66  ; $B121
    .byte $20,$46,$F4,$20,$34,$F4,$20,$13,$F4,$BD,$68,$04,$F0,$12,$DE,$68  ; $B131
    .byte $04,$D0,$0D,$BD,$20,$04,$29,$03,$9D,$20,$04,$A0,$04,$20,$52,$B1  ; $B141
    .byte $60,$B9,$78,$B1,$9D,$A8,$03,$B9,$80,$B1,$9D,$C0,$03,$B9,$88,$B1  ; $B151
    .byte $9D,$D8,$03,$B9,$90,$B1,$9D,$F0,$03,$B9,$70,$B1,$4C,$46,$F4,$64  ; $B161
    .byte $64,$64,$65,$66,$65,$64,$64,$B5,$B5,$B5,$EC,$00,$EC,$B5,$B5,$00  ; $B171
    .byte $00,$00,$00,$01,$00,$00,$00,$B5,$B5,$B5,$61,$00,$61,$B5,$B5,$00  ; $B181
    .byte $00,$00,$00,$00,$00,$00,$00  ; $B191
    LDA $0468,X                  ; $B198  BD 68 04
    BEQ loc_3B_B1A1              ; $B19B  F0 04
    DEC $0468,X                  ; $B19D  DE 68 04
    RTS                          ; $B1A0  60


loc_3B_B1A1:
    LDA $0528,X                  ; $B1A1  BD 28 05
    AND #$04                     ; $B1A4  29 04
    BNE loc_3B_B1BA              ; $B1A6  D0 12
    LDA $0540,X                  ; $B1A8  BD 40 05
    CMP #$06                     ; $B1AB  C9 06
    BCC loc_3B_B1D6              ; $B1AD  90 27
    LDA #$D7                     ; $B1AF  A9 D7
    STA $0588,X                  ; $B1B1  9D 88 05
    LDA #$B1                     ; $B1B4  A9 B1
    STA $05A0,X                  ; $B1B6  9D A0 05
    RTS                          ; $B1B9  60


loc_3B_B1BA:
    JSR sub_3F_F6E6              ; $B1BA  20 E6 F6
    CMP #$80                     ; $B1BD  C9 80
    BCS loc_3B_B1D6              ; $B1BF  B0 15
    LDA $0528,X                  ; $B1C1  BD 28 05
    AND #$FB                     ; $B1C4  29 FB
    STA $0528,X                  ; $B1C6  9D 28 05
    LDA #$D5                     ; $B1C9  A9 D5
    STA $0408,X                  ; $B1CB  9D 08 04
    LDA #$00                     ; $B1CE  A9 00
    STA $0540,X                  ; $B1D0  9D 40 05
    STA $0570,X                  ; $B1D3  9D 70 05

loc_3B_B1D6:
    RTS                          ; $B1D6  60

    JSR sub_3F_F4DC              ; $B1D7  20 DC F4
    JSR sub_3F_F4F6              ; $B1DA  20 F6 F4
    LDA $0480,X                  ; $B1DD  BD 80 04
    BEQ loc_3B_B1EF              ; $B1E0  F0 0D
    LDA #$00                     ; $B1E2  A9 00
    STA $0570,X                  ; $B1E4  9D 70 05
    DEC $0480,X                  ; $B1E7  DE 80 04
    BNE loc_3B_B1D6              ; $B1EA  D0 EA
    INC $0540,X                  ; $B1EC  FE 40 05

loc_3B_B1EF:
    LDA $0570,X                  ; $B1EF  BD 70 05
    BNE loc_3B_B1D6              ; $B1F2  D0 E2
    LDA $0540,X                  ; $B1F4  BD 40 05
    CMP #$15                     ; $B1F7  C9 15
    BEQ loc_3B_B226              ; $B1F9  F0 2B
    CMP #$1F                     ; $B1FB  C9 1F
    BEQ loc_3B_B220              ; $B1FD  F0 21
    CMP #$26                     ; $B1FF  C9 26
    BNE loc_3B_B1D6              ; $B201  D0 D3
    LDA $0528,X                  ; $B203  BD 28 05
    ORA #$04                     ; $B206  09 04
    STA $0528,X                  ; $B208  9D 28 05
    LDA #$95                     ; $B20B  A9 95
    STA $0408,X                  ; $B20D  9D 08 04
    LDA #$98                     ; $B210  A9 98
    STA $0588,X                  ; $B212  9D 88 05
    LDA #$B1                     ; $B215  A9 B1
    STA $05A0,X                  ; $B217  9D A0 05
    LDA #$1E                     ; $B21A  A9 1E
    STA $0468,X                  ; $B21C  9D 68 04
    RTS                          ; $B21F  60


loc_3B_B220:
    LDA #$40                     ; $B220  A9 40
    STA $0480,X                  ; $B222  9D 80 04
    RTS                          ; $B225  60


loc_3B_B226:
    JSR sub_3F_F6FD              ; $B226  20 FD F6
    TAY                          ; $B229  A8
    LSR A                        ; $B22A  4A
    STA $0E                      ; $B22B  85 0E
    LDA $F796,Y                  ; $B22D  B9 96 F7
    AND #$0C                     ; $B230  29 0C
    ORA $0420,X                  ; $B232  1D 20 04
    STA $0420,X                  ; $B235  9D 20 04
    STX $0F                      ; $B238  86 0F
    JSR sub_3F_FB6C              ; $B23A  20 6C FB
    BCS loc_3B_B1D6              ; $B23D  B0 97
    LDA #$9B                     ; $B23F  A9 9B
    STA $0300,Y                  ; $B241  99 00 03
    LDA #$8E                     ; $B244  A9 8E
    STA $0408,Y                  ; $B246  99 08 04
    LDA #$03                     ; $B249  A9 03
    STA $0450,Y                  ; $B24B  99 50 04
    LDA $0420,X                  ; $B24E  BD 20 04
    STA $0420,Y                  ; $B251  99 20 04
    AND #$01                     ; $B254  29 01
    CLC                          ; $B256  18
    ADC #$33                     ; $B257  69 33
    STA $10                      ; $B259  85 10
    LDA #$99                     ; $B25B  A9 99
    JSR sub_3F_F49C              ; $B25D  20 9C F4
    LDX $0E                      ; $B260  A6 0E
    LDA $B28D,X                  ; $B262  BD 8D B2
    STA $03D8,Y                  ; $B265  99 D8 03
    LDA $B295,X                  ; $B268  BD 95 B2
    STA $03F0,Y                  ; $B26B  99 F0 03
    LDA $B27D,X                  ; $B26E  BD 7D B2
    STA $03A8,Y                  ; $B271  99 A8 03
    LDA $B285,X                  ; $B274  BD 85 B2
    STA $03C0,Y                  ; $B277  99 C0 03
    LDX $0F                      ; $B27A  A6 0F
    RTS                          ; $B27C  60

    .byte $6A,$6A,$6A,$D9,$00,$D9,$6A,$6A,$01,$01,$01,$01,$02,$01,$01,$01  ; $B27D
    .byte $6A,$6A,$6A,$C3,$00,$C3,$6A,$6A,$01,$01,$01,$00,$00,$00,$01,$01  ; $B28D
    JSR sub_3F_F413              ; $B29D  20 13 F4
    JMP sub_3F_F434              ; $B2A0  4C 34 F4

    .byte $20,$E6,$F6,$C9,$40,$B0,$4C,$A9,$00,$9D,$D8,$03,$9D,$F0,$03,$BD  ; $B2A3
    .byte $28,$05,$29,$FB,$9D,$28,$05,$A9,$C5,$9D,$88,$05,$A9,$B2,$9D,$A0  ; $B2B3
    .byte $05,$60,$BD,$68,$04,$F0,$1B,$A9,$00,$9D,$70,$05,$DE,$68,$04,$D0  ; $B2C3
    .byte $22,$20,$DC,$F4,$20,$F6,$F4,$A9,$F7,$9D,$88,$05,$A9,$B2,$9D,$A0  ; $B2D3
    .byte $05,$60,$A0,$06,$20,$F8,$F0,$90,$0A,$A9,$61,$20,$46,$F4,$A9,$14  ; $B2E3
    .byte $9D,$68,$04,$60,$BC,$40,$05,$B9,$76,$B3,$9D,$08,$04,$BD,$70,$05  ; $B2F3
    .byte $C9,$04,$D0,$EF,$BD,$40,$05,$29,$01,$F0,$E8,$BD,$20,$04,$29,$01  ; $B303
    .byte $F0,$14,$BD,$30,$03,$18,$69,$04,$9D,$30,$03,$BD,$48,$03,$69,$00  ; $B313
    .byte $9D,$48,$03,$4C,$3A,$B3,$BD,$30,$03,$38,$E9,$04,$9D,$30,$03,$BD  ; $B323
    .byte $48,$03,$E9,$00,$9D,$48,$03,$A0,$18,$20,$FC,$D2,$A0,$00,$BD,$20  ; $B333
    .byte $04,$29,$01,$F0,$02,$A0,$02,$B9,$45,$00,$29,$10,$D0,$03,$4C,$AB  ; $B343
    .byte $F6,$BC,$40,$05,$BD,$20,$04,$4A,$29,$01,$19,$6E,$B3,$A8,$20,$28  ; $B353
    .byte $D4,$A5,$10,$29,$10,$F0,$03,$20,$AB,$F6,$60,$0E,$0E,$24,$24,$36  ; $B363
    .byte $36,$24,$24,$C0,$C0,$C0,$C0,$F9,$F9,$C0,$C0,$BD,$68,$04,$F0,$38  ; $B373
    .byte $A9,$00,$9D,$70,$05,$DE,$68,$04,$D0,$4B,$A9,$D9,$9D,$88,$05,$A9  ; $B383
    .byte $B3,$9D,$A0,$05,$A9,$01,$9D,$B0,$04,$A9,$00,$9D,$A8,$03,$A9,$02  ; $B393
    .byte $9D,$C0,$03,$A9,$8D,$9D,$08,$04,$A9,$20,$9D,$80,$04,$20,$DC,$F4  ; $B3A3
    .byte $20,$F6,$F4,$A9,$68,$4C,$46,$F4,$A0,$08,$20,$F8,$F0,$90,$16,$A0  ; $B3B3
    .byte $14,$20,$ED,$F3,$90,$03,$4C,$AB,$F6,$20,$E6,$F6,$C9,$30,$B0,$05  ; $B3C3
    .byte $A9,$0A,$9D,$68,$04,$60,$BD,$98,$04,$F0,$0D,$DE,$98,$04,$D0,$F5  ; $B3D3
    .byte $A9,$20,$9D,$80,$04,$20,$AB,$F6,$A0,$08,$20,$F8,$F0,$90,$3D,$A0  ; $B3E3
    .byte $14,$20,$ED,$F3,$90,$03,$4C,$AB,$F6,$DE,$80,$04,$D0,$2E,$DE,$B0  ; $B3F3
    .byte $04,$10,$24,$A9,$7E,$9D,$88,$05,$A9,$B3,$9D,$A0,$05,$A9,$00,$9D  ; $B403
    .byte $A8,$03,$A9,$01,$9D,$C0,$03,$A9,$CD,$9D,$08,$04,$20,$DC,$F4,$20  ; $B413
    .byte $F6,$F4,$A9,$67,$4C,$46,$F4,$A9,$1E,$9D,$98,$04,$60,$A0,$01,$F0  ; $B423
    .byte $28,$BD,$68,$04,$F0,$05,$DE,$68,$04,$D0,$36,$BD,$40,$05,$1D,$70  ; $B433
    .byte $05,$D0,$2E,$A0,$01,$A9,$02,$DD,$98,$04,$F0,$0D,$88,$DD,$B0,$04  ; $B443
    .byte $F0,$07,$A5,$E6,$65,$E7,$29,$01,$A8,$B9,$7D,$B5,$9D,$88,$05,$B9  ; $B453
    .byte $7F,$B5,$9D,$A0,$05,$B9,$81,$B5,$9D,$80,$04,$B9,$7B,$B5,$9D,$58  ; $B463
    .byte $05,$60,$20,$DC,$F4,$20,$F6,$F4,$BD,$68,$04,$F0,$08,$DE,$68,$04  ; $B473
    .byte $D0,$EF,$FE,$58,$05,$BD,$40,$05,$C9,$03,$F0,$1F,$C9,$05,$D0,$E1  ; $B483
    .byte $A9,$60,$20,$46,$F4,$DE,$80,$04,$F0,$06,$A9,$20,$9D,$68,$04,$60  ; $B493
    .byte $A9,$00,$9D,$B0,$04,$FE,$98,$04,$4C,$31,$B5,$FE,$40,$05,$20,$6C  ; $B4A3
    .byte $FB,$B0,$53,$A9,$A9,$99,$00,$03,$A9,$8F,$99,$08,$04,$A9,$00,$99  ; $B4B3
    .byte $50,$04,$BD,$20,$04,$99,$20,$04,$29,$01,$18,$69,$63,$85,$10,$A9  ; $B4C3
    .byte $63,$20,$9C,$F4,$A9,$00,$99,$D8,$03,$A9,$04,$99,$F0,$03,$A9,$28  ; $B4D3
    .byte $85,$03,$20,$E6,$F6,$85,$01,$C9,$60,$90,$04,$A9,$32,$85,$03,$A9  ; $B4E3
    .byte $00,$85,$00,$85,$02,$84,$0F,$20,$3A,$FC,$A4,$0F,$A5,$04,$99,$A8  ; $B4F3
    .byte $03,$A5,$05,$99,$C0,$03,$60,$20,$DC,$F4,$20,$F6,$F4,$BD,$40,$05  ; $B503
    .byte $C9,$09,$F0,$2E,$C9,$0F,$D0,$EE,$DE,$80,$04,$F0,$09,$A9,$00,$9D  ; $B513
    .byte $40,$05,$9D,$70,$05,$60,$A9,$00,$9D,$98,$04,$FE,$B0,$04,$A9,$34  ; $B523
    .byte $9D,$88,$05,$A9,$B4,$9D,$A0,$05,$A9,$3C,$9D,$68,$04,$A9,$60,$4C  ; $B533
    .byte $46,$F4,$FE,$40,$05,$20,$6C,$FB,$B0,$BC,$A9,$A8,$99,$00,$03,$A9  ; $B543
    .byte $8F,$99,$08,$04,$A9,$00,$99,$50,$04,$BD,$20,$04,$99,$20,$04,$29  ; $B553
    .byte $01,$18,$69,$65,$85,$10,$A9,$08,$20,$9C,$F4,$A9,$00,$99,$A8,$03  ; $B563
    .byte $A9,$04,$99,$C0,$03,$A6,$0F,$60,$61,$62,$75,$0A,$B4,$B5,$03,$02  ; $B573
    .byte $28,$40,$4E,$5A,$D4,$00,$E5,$A9,$02,$04,$04,$05,$4C,$13,$F4,$20  ; $B583
    .byte $A7,$F2,$4C,$13,$F4,$20,$F6,$F4,$BD,$68,$04,$F0,$0A,$A9,$00,$9D  ; $B593
    .byte $70,$05,$DE,$68,$04,$D0,$12,$FE,$40,$05,$A9,$C0,$9D,$08,$04,$A9  ; $B5A3
    .byte $BD,$9D,$88,$05,$A9,$B5,$9D,$A0,$05,$60,$BD,$70,$05,$C9,$06,$D0  ; $B5B3
    .byte $F8,$BD,$40,$05,$C9,$01,$F0,$21,$C9,$03,$D0,$ED,$A5,$E7,$65,$E5  ; $B5C3
    .byte $29,$01,$A8,$B9,$1D,$B6,$9D,$68,$04,$A9,$98,$9D,$88,$05,$A9,$B5  ; $B5D3
    .byte $9D,$A0,$05,$A9,$80,$9D,$08,$04,$60,$20,$6C,$FB,$B0,$CB,$A9,$B1  ; $B5E3
    .byte $99,$00,$03,$A9,$8F,$99,$08,$04,$A9,$00,$99,$50,$04,$BD,$20,$04  ; $B5F3
    .byte $99,$20,$04,$29,$01,$18,$69,$39,$85,$10,$A9,$08,$20,$9C,$F4,$A9  ; $B603
    .byte $80,$99,$A8,$03,$A9,$01,$99,$C0,$03,$60,$3C,$5A,$4C,$13,$F4  ; $B613
    LDA $013C                    ; $B622  AD 3C 01
    ORA $013D                    ; $B625  0D 3D 01
    BNE loc_3B_B66B              ; $B628  D0 41
    JSR sub_3F_F4F6              ; $B62A  20 F6 F4
    JSR sub_3F_F6E6              ; $B62D  20 E6 F6
    CMP #$20                     ; $B630  C9 20
    BCS loc_3B_B66B              ; $B632  B0 37
    LDA $0468,X                  ; $B634  BD 68 04
    BEQ loc_3B_B63D              ; $B637  F0 04
    DEC $0468,X                  ; $B639  DE 68 04
    RTS                          ; $B63C  60


loc_3B_B63D:
    JSR sub_3F_FB6C              ; $B63D  20 6C FB
    BCS loc_3B_B66B              ; $B640  B0 29
    LDA #$B2                     ; $B642  A9 B2
    STA $0300,Y                  ; $B644  99 00 03
    LDA #$C0                     ; $B647  A9 C0
    STA $0408,Y                  ; $B649  99 08 04
    LDA #$01                     ; $B64C  A9 01
    STA $0450,Y                  ; $B64E  99 50 04
    LDA $0420,X                  ; $B651  BD 20 04
    STA $0420,Y                  ; $B654  99 20 04
    LDA #$9E                     ; $B657  A9 9E
    JSR sub_3F_F452              ; $B659  20 52 F4
    LDA #$00                     ; $B65C  A9 00
    STA $03D8,Y                  ; $B65E  99 D8 03
    LDA #$03                     ; $B661  A9 03
    STA $03F0,Y                  ; $B663  99 F0 03
    LDA #$78                     ; $B666  A9 78
    STA $0468,X                  ; $B668  9D 68 04

loc_3B_B66B:
    RTS                          ; $B66B  60

    LDA $E6                      ; $B66C  A5 E6
    ADC $E7                      ; $B66E  65 E7
    AND #$03                     ; $B670  29 03
    TAY                          ; $B672  A8
    LDA $B6DD,Y                  ; $B673  B9 DD B6
    STA $0468,X                  ; $B676  9D 68 04
    LDA #$84                     ; $B679  A9 84
    STA $0588,X                  ; $B67B  9D 88 05
    LDA #$B6                     ; $B67E  A9 B6
    STA $05A0,X                  ; $B680  9D A0 05

loc_3B_B683:
    RTS                          ; $B683  60

    JSR sub_3F_F289              ; $B684  20 89 F2
    DEC $0468,X                  ; $B687  DE 68 04
    BNE loc_3B_B683              ; $B68A  D0 F7
    LDA #$B3                     ; $B68C  A9 B3
    STA $03D8,X                  ; $B68E  9D D8 03
    LDA #$00                     ; $B691  A9 00
    STA $03F0,X                  ; $B693  9D F0 03
    LDA #$59                     ; $B696  A9 59
    STA $03A8,X                  ; $B698  9D A8 03
    LDA #$00                     ; $B69B  A9 00
    STA $03C0,X                  ; $B69D  9D C0 03
    LDA #$02                     ; $B6A0  A9 02
    STA $0420,X                  ; $B6A2  9D 20 04
    LDA #$0B                     ; $B6A5  A9 0B
    STA $0480,X                  ; $B6A7  9D 80 04
    LDA #$B5                     ; $B6AA  A9 B5
    STA $0588,X                  ; $B6AC  9D 88 05
    LDA #$B6                     ; $B6AF  A9 B6
    STA $05A0,X                  ; $B6B1  9D A0 05
    RTS                          ; $B6B4  60

    JSR sub_3F_F269              ; $B6B5  20 69 F2
    LDA $0528,X                  ; $B6B8  BD 28 05
    PHA                          ; $B6BB  48
    JSR sub_3F_F413              ; $B6BC  20 13 F4
    PLA                          ; $B6BF  68
    STA $0528,X                  ; $B6C0  9D 28 05
    DEC $0480,X                  ; $B6C3  DE 80 04
    BNE loc_3B_B6DC              ; $B6C6  D0 14
    LDA #$0B                     ; $B6C8  A9 0B
    STA $0480,X                  ; $B6CA  9D 80 04
    INC $0498,X                  ; $B6CD  FE 98 04
    LDA $0498,X                  ; $B6D0  BD 98 04
    AND #$03                     ; $B6D3  29 03
    TAY                          ; $B6D5  A8
    LDA $B6E1,Y                  ; $B6D6  B9 E1 B6
    STA $0420,X                  ; $B6D9  9D 20 04

loc_3B_B6DC:
    RTS                          ; $B6DC  60

    .byte $2A,$35,$40,$35,$02,$01,$01,$02,$A9,$40,$9D,$D8,$03,$A9,$00,$9D  ; $B6DD
    .byte $F0,$03,$A9,$08,$9D,$20,$04,$A9,$40,$9D,$68,$04,$A9,$03,$9D,$88  ; $B6ED
    .byte $05,$A9,$B7,$9D,$A0,$05,$20,$D7,$F6,$C9,$40,$B0,$2D,$20,$E6,$F6  ; $B6FD
    .byte $C9,$40,$B0,$2B,$BD,$98,$04,$F0,$21,$DE,$98,$04,$D0,$21,$A5,$E5  ; $B70D
    .byte $65,$E6,$29,$01,$D0,$14,$A9,$61,$9D,$88,$05,$A9,$B7,$9D,$A0,$05  ; $B71D
    .byte $A9,$40,$9D,$68,$04,$A9,$A8,$4C,$46,$F4,$A9,$40,$9D,$98,$04,$BD  ; $B72D
    .byte $80,$04,$F0,$12,$DE,$80,$04,$D0,$1A,$A9,$40,$9D,$68,$04,$BD,$20  ; $B73D
    .byte $04,$49,$0C,$9D,$20,$04,$20,$34,$F4,$DE,$68,$04,$D0,$05,$A9,$1E  ; $B74D
    .byte $9D,$80,$04,$60,$DE,$68,$04,$D0,$FA,$A9,$00,$9D,$68,$04,$9D,$80  ; $B75D
    .byte $04,$20,$00,$DC,$A9,$83,$9D,$00,$03,$A9,$94,$9D,$08,$04,$A9,$62  ; $B76D
    .byte $4C,$46,$F4  ; $B77D
    LDA #$C0                     ; $B780  A9 C0
    STA $03A8,X                  ; $B782  9D A8 03
    LDA #$00                     ; $B785  A9 00
    STA $03C0,X                  ; $B787  9D C0 03
    JSR sub_3F_F6D7              ; $B78A  20 D7 F6
    CMP #$08                     ; $B78D  C9 08
    BCS loc_3B_B79B              ; $B78F  B0 0A
    LDA #$00                     ; $B791  A9 00
    STA $03A8,X                  ; $B793  9D A8 03
    LDA #$02                     ; $B796  A9 02
    STA $03C0,X                  ; $B798  9D C0 03

loc_3B_B79B:
    LDY #$0E                     ; $B79B  A0 0E
    JSR sub_3F_F0F8              ; $B79D  20 F8 F0
    LDA $0420,X                  ; $B7A0  BD 20 04
    AND #$01                     ; $B7A3  29 01
    TAY                          ; $B7A5  A8
    LDA $0045,Y                  ; $B7A6  B9 45 00
    AND #$10                     ; $B7A9  29 10
    BEQ loc_3B_B7B4              ; $B7AB  F0 07
    LDY #$18                     ; $B7AD  A0 18
    JSR sub_3F_F3ED              ; $B7AF  20 ED F3
    BCC loc_3B_B7BC              ; $B7B2  90 08

loc_3B_B7B4:
    LDA $0420,X                  ; $B7B4  BD 20 04
    EOR #$03                     ; $B7B7  49 03
    STA $0420,X                  ; $B7B9  9D 20 04

loc_3B_B7BC:
    LDA $0528,X                  ; $B7BC  BD 28 05
    AND #$BF                     ; $B7BF  29 BF
    STA $0528,X                  ; $B7C1  9D 28 05
    RTS                          ; $B7C4  60

    .byte $BD,$40,$05,$D0,$37,$A9,$00,$9D,$70,$05,$BD,$68,$04,$F0,$05,$DE  ; $B7C5
    .byte $68,$04,$D0,$21,$A0,$17,$A9,$00,$85,$00,$B9,$00,$03,$F0,$06,$C9  ; $B7D5
    .byte $BA,$D0,$02,$E6,$00,$88,$C0,$07,$D0,$F0,$A5,$00,$C9,$03,$90,$06  ; $B7E5
    .byte $A9,$B4,$9D,$68,$04,$60,$FE,$40,$05,$4C,$1B,$B8,$BD,$70,$05,$D0  ; $B7F5
    .byte $59,$BD,$40,$05,$C9,$03,$D0,$52,$A9,$00,$9D,$70,$05,$9D,$40,$05  ; $B805
    .byte $A9,$B4,$9D,$68,$04,$60,$20,$6C,$FB,$B0,$3F,$A9,$BA,$99,$00,$03  ; $B815
    .byte $A9,$C0,$99,$08,$04,$A9,$01,$99,$50,$04,$A9,$0E,$20,$52,$F4,$B9  ; $B825
    .byte $78,$03,$18,$69,$10,$99,$78,$03,$B9,$90,$03,$69,$00,$99,$90,$03  ; $B835
    .byte $A9,$00,$99,$A8,$03,$99,$D8,$03,$99,$F0,$03,$A9,$01,$99,$C0,$03  ; $B845
    .byte $A9,$01,$99,$80,$04,$A9,$2C,$99,$98,$04,$60,$20,$A3,$B8,$A0,$08  ; $B855
    .byte $20,$F8,$F0,$90,$F5,$BD,$68,$04,$D0,$0E,$A9,$00,$9D,$D8,$03,$A9  ; $B865
    .byte $02,$9D,$F0,$03,$FE,$68,$04,$60,$20,$DC,$F4,$20,$F6,$F4,$A9,$92  ; $B875
    .byte $9D,$88,$05,$A9,$B8,$9D,$A0,$05,$A9,$0F,$4C,$46,$F4,$A0,$08,$20  ; $B885
    .byte $F8,$F0,$90,$0A,$A0,$14,$20,$ED,$F3,$90,$03,$20,$AB,$F6,$BD,$98  ; $B895
    .byte $04,$38,$E9,$01,$9D,$98,$04,$BD,$80,$04,$E9,$00,$9D,$80,$04,$10  ; $B8A5
    .byte $0D,$20,$00,$DC,$A9,$80,$9D,$00,$03,$A9,$62,$20,$46,$F4  ; $B8B5

loc_3B_B8C3:
    RTS                          ; $B8C3  60

    LDA $013C                    ; $B8C4  AD 3C 01
    ORA $013D                    ; $B8C7  0D 3D 01
    BNE loc_3B_B8C3              ; $B8CA  D0 F7
    LDA $0480,X                  ; $B8CC  BD 80 04
    SEC                          ; $B8CF  38
    SBC #$01                     ; $B8D0  E9 01
    STA $0480,X                  ; $B8D2  9D 80 04
    LDA $0468,X                  ; $B8D5  BD 68 04
    SBC #$00                     ; $B8D8  E9 00
    STA $0468,X                  ; $B8DA  9D 68 04
    BPL loc_3B_B94D              ; $B8DD  10 6E
    LDA #$02                     ; $B8DF  A9 02
    STA $0468,X                  ; $B8E1  9D 68 04
    LDA #$2C                     ; $B8E4  A9 2C
    STA $0480,X                  ; $B8E6  9D 80 04
    JSR sub_3F_FB6C              ; $B8E9  20 6C FB
    BCS loc_3B_B94D              ; $B8EC  B0 5F
    LDA #$BE                     ; $B8EE  A9 BE
    STA $0300,Y                  ; $B8F0  99 00 03
    LDA #$D1                     ; $B8F3  A9 D1
    STA $0408,Y                  ; $B8F5  99 08 04
    LDA #$01                     ; $B8F8  A9 01
    STA $0450,Y                  ; $B8FA  99 50 04
    LDA #$1C                     ; $B8FD  A9 1C
    JSR sub_3F_F452              ; $B8FF  20 52 F4
    LDA $0378                    ; $B902  AD 78 03
    STA $0378,Y                  ; $B905  99 78 03
    LDA #$80                     ; $B908  A9 80
    STA $03A8,Y                  ; $B90A  99 A8 03
    STA $03D8,Y                  ; $B90D  99 D8 03
    LDA #$00                     ; $B910  A9 00
    STA $03C0,Y                  ; $B912  99 C0 03
    STA $03F0,Y                  ; $B915  99 F0 03
    LDA #$1E                     ; $B918  A9 1E
    STA $0468,Y                  ; $B91A  99 68 04
    LDA $0300,X                  ; $B91D  BD 00 03
    AND #$01                     ; $B920  29 01
    BEQ loc_3B_B939              ; $B922  F0 15
    LDA #$0A                     ; $B924  A9 0A
    STA $0420,Y                  ; $B926  99 20 04
    LDA $FC                      ; $B929  A5 FC
    CLC                          ; $B92B  18
    ADC #$F8                     ; $B92C  69 F8
    STA $0330,Y                  ; $B92E  99 30 03
    LDA $F9                      ; $B931  A5 F9
    ADC #$00                     ; $B933  69 00
    STA $0348,Y                  ; $B935  99 48 03
    RTS                          ; $B938  60


loc_3B_B939:
    LDA #$09                     ; $B939  A9 09
    STA $0420,Y                  ; $B93B  99 20 04
    LDA $FC                      ; $B93E  A5 FC
    CLC                          ; $B940  18
    ADC #$08                     ; $B941  69 08
    STA $0330,Y                  ; $B943  99 30 03
    LDA $F9                      ; $B946  A5 F9
    ADC #$00                     ; $B948  69 00
    STA $0348,Y                  ; $B94A  99 48 03

loc_3B_B94D:
    RTS                          ; $B94D  60

    JSR sub_3F_F413              ; $B94E  20 13 F4
    JSR sub_3F_F434              ; $B951  20 34 F4
    DEC $0468,X                  ; $B954  DE 68 04
    BNE loc_3B_B94D              ; $B957  D0 F4
    INC $0480,X                  ; $B959  FE 80 04
    LDA $0480,X                  ; $B95C  BD 80 04
    AND #$03                     ; $B95F  29 03
    TAY                          ; $B961  A8
    LDA $0420,X                  ; $B962  BD 20 04
    AND #$03                     ; $B965  29 03
    ORA $B973,Y                  ; $B967  19 73 B9
    STA $0420,X                  ; $B96A  9D 20 04
    LDA #$1E                     ; $B96D  A9 1E
    STA $0468,X                  ; $B96F  9D 68 04
    RTS                          ; $B972  60

    .byte $08,$04,$04,$08,$BD,$40,$05,$F0,$1B,$C9,$08,$D0,$4D,$FE,$58,$05  ; $B973
    .byte $A9,$00,$9D,$70,$05,$9D,$40,$05,$A9,$B1,$9D,$88,$05,$A9,$B9,$9D  ; $B983
    .byte $A0,$05,$D0,$36,$BD,$68,$04,$D0,$05,$A9,$5A,$9D,$68,$04,$A9,$00  ; $B993
    .byte $9D,$70,$05,$DE,$68,$04,$D0,$22,$FE,$40,$05,$4C,$CD,$B9,$BD,$40  ; $B9A3
    .byte $05,$F0,$17,$A9,$77,$9D,$88,$05,$A9,$B9,$9D,$A0,$05,$FE,$58,$05  ; $B9B3
    .byte $BD,$58,$05,$29,$03,$09,$84,$20,$46,$F4,$A5,$30,$C9,$06,$B0,$17  ; $B9C3
    .byte $A5,$3C,$D0,$13,$BC,$58,$05,$B9,$6C,$B9,$F0,$0B,$9D,$08,$04,$20  ; $B9D3
    .byte $5D,$F9,$B0,$03,$20,$CC,$81,$A9,$00,$9D,$08,$04,$60,$B8,$00,$B9  ; $B9E3
    .byte $00  ; $B9F3
    JSR sub_3F_F4DC              ; $B9F4  20 DC F4
    JSR sub_3F_F4F6              ; $B9F7  20 F6 F4
    LDA #$00                     ; $B9FA  A9 00
    STA $0570,X                  ; $B9FC  9D 70 05
    LDA $0468,X                  ; $B9FF  BD 68 04
    BNE loc_3B_BA09              ; $BA02  D0 05
    LDA #$1F                     ; $BA04  A9 1F
    STA $0468,X                  ; $BA06  9D 68 04

loc_3B_BA09:
    DEC $0468,X                  ; $BA09  DE 68 04
    BNE loc_3B_BA4A              ; $BA0C  D0 3C
    LDY #$00                     ; $BA0E  A0 00
    LDA $E5                      ; $BA10  A5 E5
    ADC $E7                      ; $BA12  65 E7
    AND #$01                     ; $BA14  29 01
    BEQ loc_3B_BA25              ; $BA16  F0 0D
    LDY #$02                     ; $BA18  A0 02
    JSR sub_3F_F6E6              ; $BA1A  20 E6 F6

loc_3B_BA1D:
    CMP $BA83,Y                  ; $BA1D  D9 83 BA
    BCS loc_3B_BA25              ; $BA20  B0 03
    DEY                          ; $BA22  88
    BNE loc_3B_BA1D              ; $BA23  D0 F8

loc_3B_BA25:
    LDA $BA8C,Y                  ; $BA25  B9 8C BA
    STA $03D8,X                  ; $BA28  9D D8 03
    LDA $BA8F,Y                  ; $BA2B  B9 8F BA
    STA $03F0,X                  ; $BA2E  9D F0 03
    LDA $BA86,Y                  ; $BA31  B9 86 BA
    STA $03A8,X                  ; $BA34  9D A8 03
    LDA $BA89,Y                  ; $BA37  B9 89 BA
    STA $03C0,X                  ; $BA3A  9D C0 03
    LDA #$4B                     ; $BA3D  A9 4B
    STA $0588,X                  ; $BA3F  9D 88 05
    LDA #$BA                     ; $BA42  A9 BA
    STA $05A0,X                  ; $BA44  9D A0 05
    INC $0540,X                  ; $BA47  FE 40 05

loc_3B_BA4A:
    RTS                          ; $BA4A  60

    LDA $0558,X                  ; $BA4B  BD 58 05
    CMP #$1F                     ; $BA4E  C9 1F
    BEQ loc_3B_BA6D              ; $BA50  F0 1B
    LDA $0540,X                  ; $BA52  BD 40 05
    CMP #$02                     ; $BA55  C9 02
    BNE loc_3B_BA4A              ; $BA57  D0 F1
    LDA #$F4                     ; $BA59  A9 F4
    STA $0588,X                  ; $BA5B  9D 88 05
    LDA #$B9                     ; $BA5E  A9 B9
    STA $05A0,X                  ; $BA60  9D A0 05
    LDA #$3D                     ; $BA63  A9 3D
    STA $0468,X                  ; $BA65  9D 68 04
    LDA #$1F                     ; $BA68  A9 1F
    JMP sub_3F_F446              ; $BA6A  4C 46 F4


loc_3B_BA6D:
    LDA #$00                     ; $BA6D  A9 00
    STA $0570,X                  ; $BA6F  9D 70 05
    LDY #$32                     ; $BA72  A0 32
    JSR sub_3F_F0F8              ; $BA74  20 F8 F0
    BCC loc_3B_BA7E              ; $BA77  90 05
    LDA #$20                     ; $BA79  A9 20
    JMP sub_3F_F446              ; $BA7B  4C 46 F4


loc_3B_BA7E:
    LDY #$3C                     ; $BA7E  A0 3C
    JMP sub_3F_F3ED              ; $BA80  4C ED F3

    .byte $18,$20,$30,$0F,$E4,$39,$01,$00,$01,$D4,$78,$E5,$02,$04,$04,$A9  ; $BA83
    .byte $00,$9D,$70,$05,$BD,$68,$04,$D0,$05,$A9,$1E,$9D,$68,$04,$DE,$68  ; $BA93
    .byte $04,$D0,$A4,$A0,$08,$BD,$78,$03,$CD,$78,$03,$B0,$02,$A0,$04,$98  ; $BAA3
    .byte $9D,$20,$04,$A9,$CC,$9D,$D8,$03,$A9,$00,$9D,$F0,$03,$FE,$98,$04  ; $BAB3
    .byte $BD,$98,$04,$29,$03,$A8,$B9,$66,$BB,$9D,$80,$04,$A9,$D9,$9D,$88  ; $BAC3
    .byte $05,$A9,$BA,$9D,$A0,$05,$A9,$00,$9D,$70,$05,$BD,$00,$03,$29,$01  ; $BAD3
    .byte $0A,$18,$69,$34,$A8,$20,$00,$F4,$A5,$10,$C9,$20,$F0,$04,$C9,$40  ; $BAE3
    .byte $D0,$0B,$BD,$78,$03,$C9,$08,$90,$04,$C9,$E8,$90,$08,$BD,$20,$04  ; $BAF3
    .byte $49,$0C,$9D,$20,$04,$DE,$80,$04,$D0,$12,$A9,$20,$9D,$88,$05,$A9  ; $BB03
    .byte $BB,$9D,$A0,$05,$FE,$40,$05,$BD,$00,$03,$D0,$33,$60,$BD,$80,$04  ; $BB13
    .byte $F0,$0D,$A9,$00,$9D,$70,$05,$DE,$80,$04,$D0,$F0,$FE,$40,$05,$BD  ; $BB23
    .byte $40,$05,$C9,$06,$F0,$27,$C9,$09,$D0,$E2,$A9,$92,$9D,$88,$05,$A9  ; $BB33
    .byte $BA,$9D,$A0,$05,$A9,$00,$9D,$40,$05,$9D,$70,$05,$BD,$58,$05,$29  ; $BB43
    .byte $01,$A8,$BD,$30,$03,$18,$79,$6A,$BB,$9D,$30,$03,$60,$A9,$3C,$9D  ; $BB53
    .byte $80,$04,$60,$3C,$5A,$5A,$3C,$04,$FC  ; $BB63
    LDA $0540,X                  ; $BB6C  BD 40 05
    CMP #$04                     ; $BB6F  C9 04
    BNE loc_3B_BBC2              ; $BB71  D0 4F
    LDA $0132                    ; $BB73  AD 32 01
    BMI loc_3B_BB9B              ; $BB76  30 23
    LDA $E6                      ; $BB78  A5 E6
    ADC $E7                      ; $BB7A  65 E7
    SBC $95                      ; $BB7C  E5 95
    STA $E6                      ; $BB7E  85 E6
    SBC $E5                      ; $BB80  E5 E5
    ADC $92                      ; $BB82  65 92
    STA $E7                      ; $BB84  85 E7
    STA $00                      ; $BB86  85 00
    LDA #$32                     ; $BB88  A9 32
    STA $01                      ; $BB8A  85 01
    JSR sub_3F_FC14              ; $BB8C  20 14 FC
    LDY #$04                     ; $BB8F  A0 04
    LDA $03                      ; $BB91  A5 03

loc_3B_BB93:
    CMP $BC8D,Y                  ; $BB93  D9 8D BC
    BCC loc_3B_BB9E              ; $BB96  90 06
    DEY                          ; $BB98  88
    BPL loc_3B_BB93              ; $BB99  10 F8

loc_3B_BB9B:
    JMP sub_3E_DC00              ; $BB9B  4C 00 DC


loc_3B_BB9E:
    LDA $BC92,Y                  ; $BB9E  B9 92 BC
    JSR sub_3F_F446              ; $BBA1  20 46 F4
    LDA $BC97,Y                  ; $BBA4  B9 97 BC
    STA $0408,X                  ; $BBA7  9D 08 04
    LDA $BC9C,Y                  ; $BBAA  B9 9C BC
    STA $0468,X                  ; $BBAD  9D 68 04
    LDA #$FF                     ; $BBB0  A9 FF
    STA $0480,X                  ; $BBB2  9D 80 04
    JSR sub_3F_F324              ; $BBB5  20 24 F3
    LDA #$C3                     ; $BBB8  A9 C3
    STA $0588,X                  ; $BBBA  9D 88 05
    LDA #$BB                     ; $BBBD  A9 BB
    STA $05A0,X                  ; $BBBF  9D A0 05

loc_3B_BBC2:
    RTS                          ; $BBC2  60

    LDY $0468,X                  ; $BBC3  BC 68 04
    JSR sub_3F_F0F8              ; $BBC6  20 F8 F0
    JSR sub_3F_F95D              ; $BBC9  20 5D F9
    BCC loc_3B_BBDE              ; $BBCC  90 10
    LDA $0480,X                  ; $BBCE  BD 80 04
    CMP #$3C                     ; $BBD1  C9 3C
    BCS loc_3B_BBD8              ; $BBD3  B0 03
    STA $05B8,X                  ; $BBD5  9D B8 05

loc_3B_BBD8:
    DEC $0480,X                  ; $BBD8  DE 80 04
    BEQ loc_3B_BC41              ; $BBDB  F0 64
    RTS                          ; $BBDD  60


loc_3B_BBDE:
    JSR sub_3E_DC00              ; $BBDE  20 00 DC
    LDY $0558,X                  ; $BBE1  BC 58 05
    LDA $BC8C,Y                  ; $BBE4  B9 8C BC
    STA $00                      ; $BBE7  85 00
    LDA $BC92,Y                  ; $BBE9  B9 92 BC
    STA $01                      ; $BBEC  85 01
    JMP ($0000)                  ; $BBEE  6C 00 00

    LDA #$1F                     ; $BBF1  A9 1F
    JSR sub_3F_F6BE              ; $BBF3  20 BE F6
    LDA $A1                      ; $BBF6  A5 A1
    CMP #$09                     ; $BBF8  C9 09
    BEQ loc_3B_BC41              ; $BBFA  F0 45
    INC $A1                      ; $BBFC  E6 A1
    JMP loc_3B_BC41              ; $BBFE  4C 41 BC

    .byte $A9,$1F,$20,$BE,$F6,$A5,$A2,$C9,$09,$F0,$35,$E6,$A2,$4C,$41,$BC  ; $BC01
    LDX #$00                     ; $BC11  A2 00
    BEQ loc_3B_BC19              ; $BC13  F0 04
    LDX $A0                      ; $BC15  A6 A0
    BEQ loc_3B_BC3B              ; $BC17  F0 22

loc_3B_BC19:
    LDA $BC87,Y                  ; $BC19  B9 87 BC
    STA $6B                      ; $BC1C  85 6B

loc_3B_BC1E:
    LDA $B0,X                    ; $BC1E  B5 B0
    CMP #$9C                     ; $BC20  C9 9C
    BEQ loc_3B_BC3B              ; $BC22  F0 17
    INC $B0,X                    ; $BC24  F6 B0
    TXA                          ; $BC26  8A
    PHA                          ; $BC27  48
    JSR sub_3F_FCE3              ; $BC28  20 E3 FC
    LDA #$29                     ; $BC2B  A9 29
    JSR sub_3F_F6BE              ; $BC2D  20 BE F6
    LDX #$03                     ; $BC30  A2 03
    JSR sub_3F_FF15              ; $BC32  20 15 FF
    PLA                          ; $BC35  68
    TAX                          ; $BC36  AA
    DEC $6B                      ; $BC37  C6 6B
    BNE loc_3B_BC1E              ; $BC39  D0 E3

loc_3B_BC3B:
    LDA #$00                     ; $BC3B  A9 00
    STA $6B                      ; $BC3D  85 6B
    LDX $EB                      ; $BC3F  A6 EB

loc_3B_BC41:
    JMP sub_3E_DC00              ; $BC41  4C 00 DC

    .byte $A5,$30,$C9,$04,$F0,$2F  ; $BC44
    JSR sub_3F_F95D              ; $BC4A  20 5D F9
    BCS loc_3B_BC79              ; $BC4D  B0 2A
    LDA $0300,X                  ; $BC4F  BD 00 03
    CMP #$C2                     ; $BC52  C9 C2
    BEQ loc_3B_BC59              ; $BC54  F0 03
    JSR sub_3F_FC9E              ; $BC56  20 9E FC

loc_3B_BC59:
    JSR sub_3E_DC00              ; $BC59  20 00 DC
    LDY $0558,X                  ; $BC5C  BC 58 05
    CPY #$51                     ; $BC5F  C0 51
    BCS loc_3B_BC66              ; $BC61  B0 03
    JMP loc_3B_BBDE              ; $BC63  4C DE BB


loc_3B_BC66:
    LDA #$9C                     ; $BC66  A9 9C
    STA $0064,Y                  ; $BC68  99 64 00
    LDA #$3A                     ; $BC6B  A9 3A
    JSR sub_3F_F6BC              ; $BC6D  20 BC F6
    LDA #$FF                     ; $BC70  A9 FF
    STA $0148                    ; $BC72  8D 48 01
    LDA #$11                     ; $BC75  A9 11
    STA $30                      ; $BC77  85 30

loc_3B_BC79:
    RTS                          ; $BC79  60

    .byte $A0,$18,$20,$F8,$F0,$90,$C9,$A9,$4A,$9D,$88,$05,$A9,$BC,$9D,$A0  ; $BC7A
    .byte $05,$D0,$BD,$0E,$0A,$08,$03,$02,$1D,$1A,$1B,$1E,$1C,$00,$00,$00  ; $BC8A
    .byte $00,$00,$14,$2D,$14,$2D,$2D,$0A,$02,$0A,$02,$00,$11,$11,$15,$15  ; $BC9A
    .byte $F1,$01,$BC,$BC,$BC,$BC,$BB,$BC,$01,$01,$02,$00,$05,$10,$00,$00  ; $BCAA
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$05,$90,$40,$60,$15,$02,$00  ; $BCBA
    .byte $80,$00,$00,$00,$00,$10,$00,$00,$00,$00,$80,$11,$00,$00,$05,$00  ; $BCCA
    .byte $00,$01,$10,$10,$40,$00,$04,$00,$40,$05,$C0,$04,$43,$00,$10,$04  ; $BCDA
    .byte $80,$40,$08,$14,$14,$10,$82,$04,$00,$00,$00,$00,$0A,$00,$00,$00  ; $BCEA
    .byte $40,$05,$00,$00,$04,$00,$00,$00,$20,$11,$28,$40,$00,$40,$00,$00  ; $BCFA
    .byte $00,$00,$00,$41,$00,$00,$00,$00,$00,$00,$90,$00,$00,$00,$20,$00  ; $BD0A
    .byte $00,$00,$00,$04,$00,$04,$00,$00,$10,$01,$02,$00,$3A,$00,$00,$00  ; $BD1A
    .byte $08,$00,$04,$00,$12,$00,$02,$00,$C5,$04,$20,$00,$08,$44,$88,$00  ; $BD2A
    .byte $40,$01,$00,$00,$40,$00,$50,$00,$08,$00,$60,$05,$22,$10,$00,$10  ; $BD3A
    .byte $01,$04,$01,$00,$20,$00,$00,$00,$01,$00,$09,$00,$80,$01,$00,$00  ; $BD4A
    .byte $04,$00,$00,$00,$00,$00,$B1,$14,$00,$40,$02,$04,$00,$50,$01,$01  ; $BD5A
    .byte $04,$04,$1C,$40,$08,$00,$00,$00,$04,$00,$20,$00,$83,$04,$30,$10  ; $BD6A
    .byte $61,$00,$00,$00,$08,$01,$0D,$80,$00,$50,$00,$00,$00,$00,$10,$00  ; $BD7A
    .byte $00,$04,$02,$00,$41,$00,$02,$01,$00,$40,$00,$00,$10,$00,$81,$00  ; $BD8A
    .byte $01,$10,$00,$00,$40,$00,$02,$00,$80,$44,$40,$00,$84,$40,$80,$00  ; $BD9A
    .byte $48,$40,$81,$05,$29,$00,$00,$10,$40,$00,$27,$44,$20,$00,$04,$00  ; $BDAA
    .byte $48,$00,$10,$00,$40,$01,$08,$01,$08,$10,$20,$00,$29,$01,$8A,$00  ; $BDBA
    .byte $21,$10,$61,$00,$50,$00,$80,$01,$00,$04,$58,$01,$00,$40,$82,$01  ; $BDCA
    .byte $00,$04,$01,$01,$01,$00,$07,$00,$54,$05,$21,$14,$06,$14,$29,$00  ; $BDDA
    .byte $10,$00,$00,$10,$10,$00,$44,$00,$21,$00,$02,$41,$11,$00,$01,$00  ; $BDEA
    .byte $20,$00,$00,$10,$01,$10,$00,$40,$01,$00,$80,$00,$00,$00,$80,$04  ; $BDFA
    .byte $04,$00,$00,$00,$09,$00,$02,$00,$80,$00,$20,$00,$00,$01,$0A,$14  ; $BE0A
    .byte $48,$00,$00,$00,$00,$00,$A1,$17,$33,$11,$90,$10,$40,$00,$84,$01  ; $BE1A
    .byte $04,$44,$44,$10,$00,$10,$91,$04,$80,$01,$40,$00,$00,$40,$00,$00  ; $BE2A
    .byte $10,$00,$20,$00,$00,$00,$54,$05,$02,$00,$04,$00,$09,$00,$24,$40  ; $BE3A
    .byte $00,$50,$21,$00,$70,$00,$34,$00,$00,$04,$00,$41,$04,$40,$10,$04  ; $BE4A
    .byte $28,$00,$40,$00,$C0,$10,$10,$00,$21,$00,$00,$00,$20,$00,$24,$40  ; $BE5A
    .byte $20,$04,$41,$00,$50,$00,$00,$10,$02,$00,$20,$00,$08,$10,$00,$00  ; $BE6A
    .byte $20,$00,$02,$10,$08,$04,$00,$00,$40,$00,$04,$41,$00,$41,$00,$00  ; $BE7A
    .byte $11,$00,$00,$01,$00,$01,$00,$10,$60,$01,$00,$10,$00,$00,$80,$02  ; $BE8A
    .byte $40,$00,$20,$00,$40,$00,$48,$00,$04,$00,$30,$11,$80,$04,$00,$00  ; $BE9A
    .byte $A4,$10,$C0,$41,$04,$04,$82,$02,$05,$01,$28,$40,$00,$04,$08,$00  ; $BEAA
    .byte $94,$00,$00,$00,$00,$00,$48,$01,$62,$40,$E0,$04,$A0,$10,$20,$00  ; $BEBA
    .byte $80,$04,$08,$00,$40,$50,$00,$00,$80,$00,$18,$00,$00,$00,$20,$10  ; $BECA
    .byte $10,$00,$00,$00,$44,$00,$10,$50,$00,$00,$81,$40,$A2,$01,$50,$00  ; $BEDA
    .byte $90,$00,$04,$00,$00,$40,$89,$40,$10,$00,$40,$00,$04,$00,$22,$04  ; $BEEA
    .byte $00,$00,$00,$00,$C0,$11,$80,$01,$08,$00,$08,$00,$60,$01,$04,$00  ; $BEFA
    .byte $00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00  ; $BF0A
    .byte $00,$00,$80,$00,$00,$00,$01,$14,$03,$00,$1A,$00,$00,$01,$00,$40  ; $BF1A
    .byte $00,$00,$00,$00,$00,$00,$00,$01,$05,$04,$00,$00,$00,$10,$06,$11  ; $BF2A
    .byte $10,$00,$02,$00,$02,$01,$00,$00,$44,$00,$A4,$04,$00,$00,$00,$04  ; $BF3A
    .byte $00,$01,$18,$00,$8D,$00,$00,$00,$00,$10,$00,$00,$00,$40,$00,$00  ; $BF4A
    .byte $00,$00,$10,$04,$00,$00,$0C,$04,$20,$04,$00,$00,$22,$40,$0A,$40  ; $BF5A
    .byte $00,$01,$11,$10,$04,$00,$90,$00,$45,$04,$82,$00,$00,$00,$00,$01  ; $BF6A
    .byte $0A,$00,$00,$00,$46,$01,$00,$01,$08,$04,$08,$00,$01,$00,$44,$10  ; $BF7A
    .byte $01,$10,$00,$04,$00,$00,$01,$41,$01,$10,$00,$00,$00,$00,$00,$00  ; $BF8A
    .byte $01,$00,$10,$00,$00,$01,$C0,$10,$10,$05,$08,$01,$84,$41,$08,$00  ; $BF9A
    .byte $00,$10,$01,$00,$21,$01,$00,$04,$85,$00,$00,$00,$10,$00,$00,$04  ; $BFAA
    .byte $29,$00,$40,$00,$01,$00,$62,$00,$20,$00,$04,$44,$06,$00,$00,$10  ; $BFBA
    .byte $00,$10,$08,$40,$20,$01,$08,$00,$01,$04,$00,$01,$2B,$05,$00,$00  ; $BFCA
    .byte $40,$00,$20,$10,$0C,$01,$00,$10,$48,$04,$49,$40,$20,$05,$20,$04  ; $BFDA
    .byte $02,$00,$40,$00,$11,$00,$4E,$44,$01,$40,$24,$00,$05,$00,$20,$00  ; $BFEA
    .byte $00,$00,$40,$00,$0B,$FF  ; $BFFA
