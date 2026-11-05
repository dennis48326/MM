; PRG 8 KB bank $1D at $A000
.segment "BANK1D"
.org $A000

    .byte $00  ; $A000
    STA $0680,X                  ; $A001  9D 80 06
    LDA $04E0,X                  ; $A004  BD E0 04
    BNE loc_1D_A028              ; $A007  D0 1F
    LDA #$1B                     ; $A009  A9 1B
    JSR sub_1F_F159              ; $A00B  20 59 F1
    BCS loc_1D_A019              ; $A00E  B0 09
    CLC                          ; $A010  18
    LDA $04B0,Y                  ; $A011  B9 B0 04
    ADC #$0C                     ; $A014  69 0C
    STA $04B0,Y                  ; $A016  99 B0 04

loc_1D_A019:
    LDA #$02                     ; $A019  A9 02
    STA $04E0,X                  ; $A01B  9D E0 04
    DEC $0600,X                  ; $A01E  DE 00 06
    BNE loc_1D_A050              ; $A021  D0 2D
    INC $0620,X                  ; $A023  FE 20 06
    BNE loc_1D_A050              ; $A026  D0 28

loc_1D_A028:
    DEC $04E0,X                  ; $A028  DE E0 04

loc_1D_A02B:
    LDA $06A0,X                  ; $A02B  BD A0 06
    BNE loc_1D_A050              ; $A02E  D0 20
    LDA #$00                     ; $A030  A9 00
    STA $0620,X                  ; $A032  9D 20 06
    LDA #$03                     ; $A035  A9 03
    STA $0600,X                  ; $A037  9D 00 06
    LDA $4A                      ; $A03A  A5 4A
    AND #$03                     ; $A03C  29 03
    BEQ loc_1D_A050              ; $A03E  F0 10
    ASL $0600,X                  ; $A040  1E 00 06
    AND #$01                     ; $A043  29 01
    BNE loc_1D_A050              ; $A045  D0 09
    CLC                          ; $A047  18
    LDA $0600,X                  ; $A048  BD 00 06
    ADC #$03                     ; $A04B  69 03
    STA $0600,X                  ; $A04D  9D 00 06

loc_1D_A050:
    JSR sub_1F_EFB3              ; $A050  20 B3 EF
    BCC loc_1D_A06A              ; $A053  90 15
    LDA #$80                     ; $A055  A9 80
    STA $0420,X                  ; $A057  9D 20 04
    LDA #$19                     ; $A05A  A9 19
    STA $0400,X                  ; $A05C  9D 00 04
    LDA #$00                     ; $A05F  A9 00
    STA $04E0,X                  ; $A061  9D E0 04
    STA $0620,X                  ; $A064  9D 20 06
    STA $0100,X                  ; $A067  9D 00 01

loc_1D_A06A:
    RTS                          ; $A06A  60


loc_1D_A06B:
    LDA #$00                     ; $A06B  A9 00
    STA $06A0,X                  ; $A06D  9D A0 06
    STA $0680,X                  ; $A070  9D 80 06
    LDA $0620,X                  ; $A073  BD 20 06
    BEQ loc_1D_A07B              ; $A076  F0 03
    JMP loc_1D_A104              ; $A078  4C 04 A1


loc_1D_A07B:
    LDA $04E0,X                  ; $A07B  BD E0 04
    AND #$03                     ; $A07E  29 03
    STA $00                      ; $A080  85 00
    ASL A                        ; $A082  0A
    ASL A                        ; $A083  0A
    ADC $00                      ; $A084  65 00
    STA $01                      ; $A086  85 01
    LDA #$2B                     ; $A088  A9 2B
    JSR sub_1E_C051              ; $A08A  20 51 C0
    LDA #$05                     ; $A08D  A9 05
    STA $02                      ; $A08F  85 02

loc_1D_A091:
    LDA #$06                     ; $A091  A9 06
    JSR sub_1F_F159              ; $A093  20 59 F1
    BCS loc_1D_A0B4              ; $A096  B0 1C
    LDX $01                      ; $A098  A6 01
    CLC                          ; $A09A  18
    LDA $0470,Y                  ; $A09B  B9 70 04
    ADC $A10E,Y                  ; $A09E  79 0E A1
    STA $0470,Y                  ; $A0A1  99 70 04
    CLC                          ; $A0A4  18
    LDA $04B0,Y                  ; $A0A5  B9 B0 04
    ADC $A122,Y                  ; $A0A8  79 22 A1
    STA $04B0,Y                  ; $A0AB  99 B0 04
    INC $01                      ; $A0AE  E6 01
    DEC $02                      ; $A0B0  C6 02
    BNE loc_1D_A091              ; $A0B2  D0 DD

loc_1D_A0B4:
    LDX $2B                      ; $A0B4  A6 2B
    INC $04E0,X                  ; $A0B6  FE E0 04
    LDA $04E0,X                  ; $A0B9  BD E0 04
    CMP #$08                     ; $A0BC  C9 08
    BNE loc_1D_A0FF              ; $A0BE  D0 3F
    LDA #$1A                     ; $A0C0  A9 1A
    JSR sub_1F_F010              ; $A0C2  20 10 F0
    BCS loc_1D_A0D1              ; $A0C5  B0 0A
    LDA #$00                     ; $A0C7  A9 00
    STA $0430,Y                  ; $A0C9  99 30 04
    LDA #$FF                     ; $A0CC  A9 FF
    STA $0100,Y                  ; $A0CE  99 00 01

loc_1D_A0D1:
    LDA #$1C                     ; $A0D1  A9 1C
    JSR sub_1F_F010              ; $A0D3  20 10 F0
    BCS loc_1D_A0DD              ; $A0D6  B0 05
    LDA #$FF                     ; $A0D8  A9 FF
    STA $04F0,Y                  ; $A0DA  99 F0 04

loc_1D_A0DD:
    LDA #$2E                     ; $A0DD  A9 2E
    JSR sub_1F_F010              ; $A0DF  20 10 F0
    BCS loc_1D_A0F9              ; $A0E2  B0 15
    LDA #$00                     ; $A0E4  A9 00
    STA $0430,Y                  ; $A0E6  99 30 04
    LDA #$FF                     ; $A0E9  A9 FF
    STA $0130,Y                  ; $A0EB  99 30 01
    LDA $0120,Y                  ; $A0EE  B9 20 01
    TAY                          ; $A0F1  A8
    LDA #$00                     ; $A0F2  A9 00
    STA $0140,Y                  ; $A0F4  99 40 01
    BEQ loc_1D_A0DD              ; $A0F7  F0 E4

loc_1D_A0F9:
    STA $00F0,X                  ; $A0F9  9D F0 00
    ASL $0420,X                  ; $A0FC  1E 20 04

loc_1D_A0FF:
    LDA #$08                     ; $A0FF  A9 08
    STA $0620,X                  ; $A101  9D 20 06

loc_1D_A104:
    DEC $0620,X                  ; $A104  DE 20 06
    RTS                          ; $A107  60

    .byte $08,$2C,$12,$08,$20,$20,$FC,$FC,$14,$1C,$2C,$F4,$04,$0C,$14,$24  ; $A108
    .byte $F4,$04,$14,$2C,$2C,$04,$0C,$14,$24,$24,$F8,$10,$08,$F0,$F8,$00  ; $A118
    .byte $E8,$10,$F8,$08,$08,$F8,$00,$E8,$08,$00,$E8,$F8,$F0,$08  ; $A128
    LDA $04E0,X                  ; $A136  BD E0 04
    BNE loc_1D_A145              ; $A139  D0 0A
    LDA #$6E                     ; $A13B  A9 6E
    STA $04E0,X                  ; $A13D  9D E0 04
    LDA #$01                     ; $A140  A9 01
    STA $06A0,X                  ; $A142  9D A0 06

loc_1D_A145:
    LDA $06A0,X                  ; $A145  BD A0 06
    BNE loc_1D_A14D              ; $A148  D0 03
    STA $0680,X                  ; $A14A  9D 80 06

loc_1D_A14D:
    DEC $04E0,X                  ; $A14D  DE E0 04
    JSR sub_1F_EFB3              ; $A150  20 B3 EF
    RTS                          ; $A153  60

    CLC                          ; $A154  18
    LDA $0660,X                  ; $A155  BD 60 06
    ADC #$40                     ; $A158  69 40
    STA $0660,X                  ; $A15A  9D 60 06
    LDA $0640,X                  ; $A15D  BD 40 06
    ADC #$00                     ; $A160  69 00
    STA $0640,X                  ; $A162  9D 40 06
    JSR sub_1F_EEBA              ; $A165  20 BA EE
    RTS                          ; $A168  60

    SEC                          ; $A169  38
    LDA $0440,X                  ; $A16A  BD 40 04
    SBC #$06                     ; $A16D  E9 06
    TAY                          ; $A16F  A8
    LDA $A269,Y                  ; $A170  B9 69 A2
    CMP $04A0,X                  ; $A173  DD A0 04
    BEQ loc_1D_A18C              ; $A176  F0 14
    LDA $0420,X                  ; $A178  BD 20 04
    AND #$DF                     ; $A17B  29 DF
    STA $0420,X                  ; $A17D  9D 20 04
    LDA #$00                     ; $A180  A9 00
    STA $06A0,X                  ; $A182  9D A0 06
    STA $0680,X                  ; $A185  9D 80 06
    JSR sub_1F_EEBA              ; $A188  20 BA EE
    RTS                          ; $A18B  60


loc_1D_A18C:
    LDA #$00                     ; $A18C  A9 00
    STA $0640,X                  ; $A18E  9D 40 06
    JSR sub_1F_EFB3              ; $A191  20 B3 EF
    LDA $06A0,X                  ; $A194  BD A0 06
    PHA                          ; $A197  48
    TAY                          ; $A198  A8
    CLC                          ; $A199  18
    LDA $04A0,X                  ; $A19A  BD A0 04
    ADC $A26C,Y                  ; $A19D  79 6C A2
    AND #$E0                     ; $A1A0  29 E0
    STA $0A                      ; $A1A2  85 0A
    CLC                          ; $A1A4  18
    LDA $0460,X                  ; $A1A5  BD 60 04
    ADC $A270,Y                  ; $A1A8  79 70 A2
    AND #$E0                     ; $A1AB  29 E0
    STA $08                      ; $A1AD  85 08
    LDA $0440,X                  ; $A1AF  BD 40 04
    STA $09                      ; $A1B2  85 09
    JSR sub_1E_C8EF              ; $A1B4  20 EF C8
    JSR sub_1E_C91B              ; $A1B7  20 1B C9
    LDY $1B                      ; $A1BA  A4 1B
    LDA $03B6                    ; $A1BC  AD B6 03
    STA $0300,Y                  ; $A1BF  99 00 03
    LDA $03BC                    ; $A1C2  AD BC 03
    STA $0304,Y                  ; $A1C5  99 04 03
    LDA $03C2                    ; $A1C8  AD C2 03
    STA $0308,Y                  ; $A1CB  99 08 03
    LDA $03C8                    ; $A1CE  AD C8 03
    STA $030C,Y                  ; $A1D1  99 0C 03
    LDA #$FF                     ; $A1D4  A9 FF
    STA $0350,Y                  ; $A1D6  99 50 03
    TYA                          ; $A1D9  98
    ASL A                        ; $A1DA  0A
    ASL A                        ; $A1DB  0A
    ASL A                        ; $A1DC  0A
    ASL A                        ; $A1DD  0A
    TAY                          ; $A1DE  A8
    PLA                          ; $A1DF  68
    STA $00                      ; $A1E0  85 00
    LDX $2B                      ; $A1E2  A6 2B
    LDA $04E0,X                  ; $A1E4  BD E0 04
    CMP #$FF                     ; $A1E7  C9 FF
    BNE loc_1D_A1F2              ; $A1E9  D0 07
    CLC                          ; $A1EB  18
    LDA $00                      ; $A1EC  A5 00
    ADC #$04                     ; $A1EE  69 04
    STA $00                      ; $A1F0  85 00

loc_1D_A1F2:
    LDA $00                      ; $A1F2  A5 00
    ASL A                        ; $A1F4  0A
    ASL A                        ; $A1F5  0A
    ASL A                        ; $A1F6  0A
    ASL A                        ; $A1F7  0A
    TAX                          ; $A1F8  AA
    LDA #$10                     ; $A1F9  A9 10
    STA $00                      ; $A1FB  85 00

loc_1D_A1FD:
    LDA $A274,X                  ; $A1FD  BD 74 A2
    STA $0310,Y                  ; $A200  99 10 03
    INX                          ; $A203  E8
    INY                          ; $A204  C8
    DEC $00                      ; $A205  C6 00
    BNE loc_1D_A1FD              ; $A207  D0 F4
    INC $1B                      ; $A209  E6 1B
    LDX $2B                      ; $A20B  A6 2B
    LDA $06A0,X                  ; $A20D  BD A0 06
    CMP #$03                     ; $A210  C9 03
    BNE loc_1D_A268              ; $A212  D0 54
    LDA $04E0,X                  ; $A214  BD E0 04
    BNE loc_1D_A268              ; $A217  D0 4F
    LDA #$19                     ; $A219  A9 19
    JSR sub_1F_F159              ; $A21B  20 59 F1
    LDA #$08                     ; $A21E  A9 08
    STA $04F0,Y                  ; $A220  99 F0 04
    LDA #$03                     ; $A223  A9 03
    STA $0610,Y                  ; $A225  99 10 06
    LDA #$14                     ; $A228  A9 14
    STA $04C0,X                  ; $A22A  9D C0 04
    LDA $4A                      ; $A22D  A5 4A
    AND #$03                     ; $A22F  29 03
    BEQ loc_1D_A249              ; $A231  F0 16
    PHA                          ; $A233  48
    LDA $0610,Y                  ; $A234  B9 10 06
    ASL A                        ; $A237  0A
    STA $0610,Y                  ; $A238  99 10 06
    PLA                          ; $A23B  68
    AND #$01                     ; $A23C  29 01
    BNE loc_1D_A249              ; $A23E  D0 09
    CLC                          ; $A240  18
    LDA $0610,Y                  ; $A241  B9 10 06
    ADC #$03                     ; $A244  69 03
    STA $0610,Y                  ; $A246  99 10 06

loc_1D_A249:
    LDA #$1A                     ; $A249  A9 1A
    JSR sub_1F_F159              ; $A24B  20 59 F1
    CLC                          ; $A24E  18
    LDA $0470,Y                  ; $A24F  B9 70 04
    ADC #$2F                     ; $A252  69 2F
    STA $0470,Y                  ; $A254  99 70 04
    SEC                          ; $A257  38
    LDA $04B0,Y                  ; $A258  B9 B0 04
    SBC #$0C                     ; $A25B  E9 0C
    STA $04B0,Y                  ; $A25D  99 B0 04
    INC $04E0,X                  ; $A260  FE E0 04
    LDA #$A0                     ; $A263  A9 A0
    STA $0420,X                  ; $A265  9D 20 04

loc_1D_A268:
    RTS                          ; $A268  60

    .byte $88,$68,$48,$F0,$00,$F0,$00,$00,$00,$20,$20,$88,$8A,$84,$86,$89  ; $A269
    .byte $8B,$85,$87,$84,$86,$8C,$8E,$85,$87,$8D,$8F,$84,$86,$74,$76,$85  ; $A279
    .byte $87,$75,$77,$90,$92,$94,$96,$91,$93,$95,$97,$84,$86,$84,$86,$85  ; $A289
    .byte $87,$85,$87,$6C,$6E,$70,$72,$6D,$6F,$71,$73,$78,$7A,$7C,$7E,$79  ; $A299
    .byte $7B,$7D,$7F,$98,$9A,$9C,$9E,$99,$9B,$9D,$9F,$88,$8A,$84,$86,$89  ; $A2A9
    .byte $8B,$85,$87,$84,$86,$84,$86,$85,$87,$85,$87,$84,$86,$84,$86,$85  ; $A2B9
    .byte $87,$85,$87,$84,$86,$84,$86,$85,$87,$85,$87,$84,$86,$84,$86,$85  ; $A2C9
    .byte $87,$85,$87,$84,$86,$84,$86,$85,$87,$85,$87,$84,$86,$84,$86,$85  ; $A2D9
    .byte $87,$85,$87,$84,$86,$84,$86,$85,$87,$85,$87,$20,$EE,$EF,$BD,$20  ; $A2E9
    .byte $04,$29,$20,$F0,$1F,$A5,$00,$C9,$50,$90,$04,$20,$B3,$EF,$60,$A9  ; $A2F9
    .byte $00,$9D,$A0,$06,$9D,$80,$06,$BD,$20,$04,$29,$DF,$9D,$20,$04,$A9  ; $A309
    .byte $04,$9D,$40,$06,$BD,$A0,$06,$D0,$22,$A9,$00,$9D,$80,$06,$A9,$07  ; $A319
    .byte $85,$01,$A9,$01,$85,$02,$20,$2C,$F0,$A5,$00,$D0,$03,$4C,$E9,$A3  ; $A329
    .byte $A9,$00,$9D,$40,$06,$FE,$A0,$06,$4C,$E9,$A3,$BD,$A0,$06,$C9,$02  ; $A339
    .byte $D0,$0C,$18,$BD,$A0,$04,$69,$05,$9D,$A0,$04,$FE,$A0,$06,$BD,$A0  ; $A349
    .byte $06,$C9,$08,$B0,$40,$A5,$00,$C9,$20,$90,$18,$FE,$E0,$04,$BD,$E0  ; $A359
    .byte $04,$C9,$7D,$F0,$0E,$BD,$A0,$06,$C9,$07,$D0,$74,$A9,$03,$9D,$A0  ; $A369
    .byte $06,$D0,$6D,$38,$BD,$A0,$04,$E9,$20,$9D,$A0,$04,$BD,$20,$04,$09  ; $A379
    .byte $04,$9D,$20,$04,$A9,$02,$9D,$E0,$04,$A9,$08,$9D,$A0,$06,$A9,$00  ; $A389
    .byte $9D,$80,$06,$D0,$4B,$A9,$08,$85,$01,$A9,$10,$85,$02,$20,$2C,$F0  ; $A399
    .byte $A9,$00,$9D,$80,$06,$BD,$A0,$06,$C9,$09,$F0,$1E,$DE,$E0,$04,$D0  ; $A3A9
    .byte $2F,$A9,$03,$9D,$40,$06,$A9,$76,$9D,$60,$06,$A9,$01,$9D,$00,$06  ; $A3B9
    .byte $A9,$7B,$9D,$20,$06,$FE,$A0,$06,$D0,$16,$A5,$00,$F0,$12,$A9,$08  ; $A3C9
    .byte $9D,$A0,$06,$A9,$32,$9D,$E0,$04,$A9,$00,$9D,$20,$06,$9D,$00,$06  ; $A3D9
    .byte $20,$BA,$EE,$60,$BD,$20,$06,$D0,$08,$A9,$1E,$20,$B5,$95,$90,$01  ; $A3E9
    .byte $60,$AD,$60,$04,$9D,$60,$04,$AD,$40,$04,$9D,$40,$04,$BD,$E0,$04  ; $A3F9
    .byte $D0,$37,$A9,$01,$85,$01,$A9,$1F,$20,$CF,$96,$B0,$27,$A9,$1F,$20  ; $A409
    .byte $59,$F1,$B0,$20,$18,$B9,$70,$04,$69,$78,$99,$70,$04,$B9,$50,$04  ; $A419
    .byte $69,$00,$99,$50,$04,$38,$AD,$A0,$04,$E9,$2C,$B0,$02,$A9,$08,$99  ; $A429
    .byte $B0,$04,$A6,$2B,$A9,$1F,$9D,$E0,$04,$DE,$E0,$04,$60,$A9,$08,$85  ; $A439
    .byte $01,$A9,$14,$85,$02,$20,$2C,$F0,$A5,$00,$F0,$1B,$BD,$E0,$04,$C9  ; $A449
    .byte $13,$D0,$0F,$A9,$04,$9D,$40,$06,$A9,$78,$9D,$60,$06,$A9,$00,$9D  ; $A459
    .byte $E0,$04,$FE,$E0,$04,$D0,$0A,$A9,$02,$9D,$A0,$06,$A9,$03,$9D,$80  ; $A469
    .byte $06,$20,$BA,$EE,$60,$A9,$1E,$85,$00,$4C,$52,$96  ; $A479
    LDA $04E0,X                  ; $A485  BD E0 04
    BNE loc_1D_A49F              ; $A488  D0 15
    LDA #$03                     ; $A48A  A9 03
    STA $01                      ; $A48C  85 01
    LDA #$22                     ; $A48E  A9 22
    JSR sub_1C_96CF              ; $A490  20 CF 96
    BCS loc_1D_A49A              ; $A493  B0 05
    LDA #$22                     ; $A495  A9 22
    JSR sub_1F_F159              ; $A497  20 59 F1

loc_1D_A49A:
    LDA #$DA                     ; $A49A  A9 DA
    STA $04E0,X                  ; $A49C  9D E0 04

loc_1D_A49F:
    DEC $04E0,X                  ; $A49F  DE E0 04
    JSR sub_1F_EFB3              ; $A4A2  20 B3 EF
    RTS                          ; $A4A5  60


loc_1D_A4A6:
    LDA $04E0,X                  ; $A4A6  BD E0 04
    BNE loc_1D_A4BB              ; $A4A9  D0 10
    LDA #$00                     ; $A4AB  A9 00
    STA $09                      ; $A4AD  85 09
    LDA #$42                     ; $A4AF  A9 42
    STA $08                      ; $A4B1  85 08
    JSR sub_1F_F197              ; $A4B3  20 97 F1
    LDA #$10                     ; $A4B6  A9 10
    STA $04E0,X                  ; $A4B8  9D E0 04

loc_1D_A4BB:
    DEC $04E0,X                  ; $A4BB  DE E0 04
    JSR sub_1F_EEBA              ; $A4BE  20 BA EE
    RTS                          ; $A4C1  60

    .byte $BD,$20,$06,$D0,$25,$A9,$6E,$9D,$E0,$04,$FE,$20,$06,$A9,$00,$9D  ; $A4C2
    .byte $20,$04,$A9,$01,$85,$01,$A9,$23,$20,$CF,$96,$A9,$83,$9D,$20,$04  ; $A4D2
    .byte $B0,$5D,$A9,$26,$20,$59,$F1,$4C,$41,$A5,$BD,$E0,$04,$F0,$0E,$BD  ; $A4E2
    .byte $A0,$06,$C9,$02,$D0,$49,$A9,$00,$9D,$A0,$06,$F0,$42,$BD,$A0,$06  ; $A4F2
    .byte $C9,$04,$D0,$3E,$BD,$80,$06,$D0,$39,$20,$EE,$EF,$A9,$24,$20,$59  ; $A502
    .byte $F1,$B0,$21,$38,$A5,$4A,$29,$1F,$85,$4A,$38,$A5,$00,$E5,$4A,$85  ; $A512
    .byte $00,$A9,$00,$06,$00,$2A,$06,$00,$2A,$06,$00,$2A,$99,$10,$06,$A5  ; $A522
    .byte $00,$99,$30,$06,$A5,$4A,$29,$03,$A8,$B9,$56,$A5,$9D,$E0,$04,$DE  ; $A532
    .byte $E0,$04,$20,$B3,$EF,$90,$0C,$A9,$23,$20,$10,$F0,$90,$05,$A9,$28  ; $A542
    .byte $20,$59,$F1,$60,$12,$1F,$1F,$3D,$AD,$57,$03,$C9,$0F,$F0,$37,$A9  ; $A552
    .byte $23,$20,$10,$F0,$90,$30,$A9,$26,$20,$10,$F0,$90,$29,$BD,$E0,$04  ; $A562
    .byte $D0,$33,$BD,$20,$06,$0A,$0A,$85,$00,$0A,$18,$65,$00,$AA,$A0,$00  ; $A572
    .byte $BD,$D6,$A5,$99,$56,$03,$E8,$C8,$C0,$0C,$D0,$F4,$A6,$2B,$FE,$20  ; $A582
    .byte $06,$BD,$20,$06,$C9,$04,$D0,$08,$5E,$20,$04,$A9,$FF,$9D,$F0,$00  ; $A592
    .byte $A9,$08,$9D,$E0,$04,$DE,$E0,$04,$60,$BD,$E0,$04,$D0,$F7,$18,$BD  ; $A5A2
    .byte $20,$06,$69,$03,$D0,$BF,$BD,$E0,$04,$D0,$EA,$BD,$20,$06,$49,$03  ; $A5B2
    .byte $4C,$77,$A5,$BD,$E0,$04,$D0,$DD,$38,$BD,$20,$06,$49,$03,$18,$69  ; $A5C2
    .byte $03,$4C,$77,$A5,$0F,$2C,$10,$1C,$0F,$37,$27,$07,$0F,$28,$16,$07  ; $A5D2
    .byte $0F,$1C,$00,$0C,$0F,$37,$27,$08,$0F,$17,$06,$08,$0F,$0C,$0C,$0F  ; $A5E2
    .byte $0F,$37,$27,$08,$0F,$07,$07,$08,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F  ; $A5F2
    .byte $0F,$0F,$0F,$0F,$0F,$16,$07,$08,$0F,$37,$27,$08,$0F,$07,$07,$08  ; $A602
    .byte $0F,$26,$16,$06,$0F,$37,$27,$08,$0F,$17,$06,$08,$0F,$36,$26,$16  ; $A612
    .byte $0F,$37,$27,$07,$0F,$27,$16,$07,$BD,$10,$01,$D0,$28,$FE,$E0,$04  ; $A622
    .byte $BD,$E0,$04,$C9,$3E,$D0,$1A,$A9,$2A,$20,$59,$F1,$B0,$13,$A9,$08  ; $A632
    .byte $99,$B0,$04,$A5,$2B,$99,$20,$01,$98,$9D,$10,$01,$A9,$00,$9D,$E0  ; $A642
    .byte $04,$20,$B3,$EF,$60,$BC,$10,$01,$C0,$FF,$F0,$45,$BD,$E0,$04,$C9  ; $A652
    .byte $04,$B0,$24,$38,$BD,$A0,$04,$F9,$B0,$04,$C9,$20,$B0,$E3,$A9,$D4  ; $A662
    .byte $99,$70,$06,$A9,$02,$99,$50,$06,$FE,$E0,$04,$BD,$E0,$04,$C9,$04  ; $A672
    .byte $D0,$CF,$A9,$87,$9D,$20,$04,$38,$BD,$A0,$04,$E9,$20,$99,$B0,$04  ; $A682
    .byte $BD,$60,$04,$99,$70,$04,$BD,$40,$04,$99,$50,$04,$A9,$00,$99,$50  ; $A692
    .byte $06,$A9,$0F,$85,$01,$A9,$0E,$85,$02,$20,$CF,$F0,$BD,$E0,$04,$C9  ; $A6A2
    .byte $04,$D0,$14,$A5,$00,$F0,$10,$20,$EE,$EF,$A9,$47,$9D,$20,$06,$A9  ; $A6B2
    .byte $01,$9D,$00,$06,$FE,$E0,$04,$A5,$03,$F0,$08,$BD,$20,$04,$49,$40  ; $A6C2
    .byte $9D,$20,$04,$20,$BA,$EE,$90,$16,$BC,$10,$01,$C0,$FF,$F0,$0F,$A9  ; $A6D2
    .byte $FF,$99,$20,$01,$A9,$D4,$99,$70,$06,$A9,$02,$99,$50,$06,$60,$20  ; $A6E2
    .byte $BA,$EE,$90,$16,$BC,$10,$01,$C0,$FF,$F0,$0F,$A9,$00,$99,$00,$06  ; $A6F2
    .byte $A9,$A3,$99,$20,$06,$A9,$FF,$99,$10,$01,$60  ; $A702
    LDA $04E0,X                  ; $A70D  BD E0 04
    BNE loc_1D_A727              ; $A710  D0 15
    LDA #$02                     ; $A712  A9 02
    STA $01                      ; $A714  85 01
    LDA #$2C                     ; $A716  A9 2C
    JSR sub_1C_96CF              ; $A718  20 CF 96
    BCS loc_1D_A722              ; $A71B  B0 05
    LDA #$2C                     ; $A71D  A9 2C
    JSR sub_1F_F159              ; $A71F  20 59 F1

loc_1D_A722:
    LDA #$7D                     ; $A722  A9 7D
    STA $04E0,X                  ; $A724  9D E0 04

loc_1D_A727:
    DEC $04E0,X                  ; $A727  DE E0 04
    JSR sub_1F_EFB3              ; $A72A  20 B3 EF
    RTS                          ; $A72D  60

    LDA $0110,X                  ; $A72E  BD 10 01
    BNE loc_1D_A736              ; $A731  D0 03
    INC $0110,X                  ; $A733  FE 10 01

loc_1D_A736:
    LDA $0110,X                  ; $A736  BD 10 01
    CMP #$02                     ; $A739  C9 02
    BCS loc_1D_A779              ; $A73B  B0 3C
    LDA #$00                     ; $A73D  A9 00
    STA $06A0,X                  ; $A73F  9D A0 06
    STA $0680,X                  ; $A742  9D 80 06
    LDA #$08                     ; $A745  A9 08
    STA $01                      ; $A747  85 01
    LDA #$14                     ; $A749  A9 14
    STA $02                      ; $A74B  85 02
    LDA $0640,X                  ; $A74D  BD 40 06
    PHP                          ; $A750  08
    JSR sub_1F_F0CF              ; $A751  20 CF F0
    PLP                          ; $A754  28
    BPL loc_1D_A7CF              ; $A755  10 78
    LDA $00                      ; $A757  A5 00
    BEQ loc_1D_A7CF              ; $A759  F0 74
    LDA #$39                     ; $A75B  A9 39
    JSR sub_1E_C051              ; $A75D  20 51 C0
    LDA #$00                     ; $A760  A9 00
    STA $0640,X                  ; $A762  9D 40 06
    STA $0660,X                  ; $A765  9D 60 06
    STA $0600,X                  ; $A768  9D 00 06
    STA $0620,X                  ; $A76B  9D 20 06
    LDA $0420,X                  ; $A76E  BD 20 04
    AND #$FB                     ; $A771  29 FB
    STA $0420,X                  ; $A773  9D 20 04
    INC $0110,X                  ; $A776  FE 10 01

loc_1D_A779:
    LDA $0110,X                  ; $A779  BD 10 01
    CMP #$02                     ; $A77C  C9 02
    BNE loc_1D_A794              ; $A77E  D0 14
    LDA $06A0,X                  ; $A780  BD A0 06
    CMP #$09                     ; $A783  C9 09
    BNE loc_1D_A7CF              ; $A785  D0 48
    LDA #$E5                     ; $A787  A9 E5
    STA $0660,X                  ; $A789  9D 60 06
    LDA #$47                     ; $A78C  A9 47
    STA $04E0,X                  ; $A78E  9D E0 04
    INC $0110,X                  ; $A791  FE 10 01

loc_1D_A794:
    LDA $06A0,X                  ; $A794  BD A0 06
    CMP #$0B                     ; $A797  C9 0B
    BNE loc_1D_A7A0              ; $A799  D0 05
    LDA #$09                     ; $A79B  A9 09
    STA $06A0,X                  ; $A79D  9D A0 06

loc_1D_A7A0:
    DEC $04E0,X                  ; $A7A0  DE E0 04
    BNE loc_1D_A7CF              ; $A7A3  D0 2A
    LDA #$87                     ; $A7A5  A9 87
    STA $0420,X                  ; $A7A7  9D 20 04
    JSR sub_1F_EFEE              ; $A7AA  20 EE EF
    LDA #$00                     ; $A7AD  A9 00
    ASL $00                      ; $A7AF  06 00
    ROL A                        ; $A7B1  2A
    ASL $00                      ; $A7B2  06 00
    ROL A                        ; $A7B4  2A
    ASL $00                      ; $A7B5  06 00
    ROL A                        ; $A7B7  2A
    STA $0600,X                  ; $A7B8  9D 00 06
    LDA $00                      ; $A7BB  A5 00
    STA $0620,X                  ; $A7BD  9D 20 06
    LDA #$03                     ; $A7C0  A9 03
    STA $0640,X                  ; $A7C2  9D 40 06
    LDA #$76                     ; $A7C5  A9 76
    STA $0660,X                  ; $A7C7  9D 60 06
    LDA #$01                     ; $A7CA  A9 01
    STA $0110,X                  ; $A7CC  9D 10 01

loc_1D_A7CF:
    JSR sub_1F_EEBA              ; $A7CF  20 BA EE
    RTS                          ; $A7D2  60

    .byte $A9,$08,$D0,$02  ; $A7D3
    LDA #$01                     ; $A7D7  A9 01
    STA $04E0,X                  ; $A7D9  9D E0 04
    LDA $0460,X                  ; $A7DC  BD 60 04
    AND $0600,X                  ; $A7DF  3D 00 06
    STA $0640,X                  ; $A7E2  9D 40 06
    LDA $04A0,X                  ; $A7E5  BD A0 04
    AND $0620,X                  ; $A7E8  3D 20 06
    STA $0660,X                  ; $A7EB  9D 60 06
    JSR sub_1F_EFAF              ; $A7EE  20 AF EF
    RTS                          ; $A7F1  60

    .byte $BD,$10,$01,$D0,$1F,$20,$EE,$EF,$A5,$00,$C9,$28,$B0,$12,$A9,$87  ; $A7F2
    .byte $9D,$20,$04,$A9,$FF,$9D,$40,$06,$A9,$C0,$9D,$60,$06,$FE,$10,$01  ; $A802
    .byte $20,$B3,$EF,$60,$A9,$08,$85,$01,$85,$02,$20,$2C,$F0,$BD,$10,$01  ; $A812
    .byte $C9,$02,$B0,$26,$A5,$00,$F0,$49,$A9,$21,$20,$51,$C0,$A9,$2B,$9D  ; $A822
    .byte $E0,$04,$FE,$10,$01,$A9,$52,$20,$59,$F1,$38,$B9,$B0,$04,$E9,$28  ; $A832
    .byte $99,$B0,$04,$A9,$2B,$99,$F0,$04,$D0,$27,$BD,$E0,$04,$F0,$16,$DE  ; $A842
    .byte $E0,$04,$D0,$1D,$A9,$00,$9D,$40,$06,$A9,$62,$9D,$60,$06,$A9,$83  ; $A852
    .byte $9D,$20,$04,$D0,$0C,$A5,$00,$F0,$08,$A9,$00,$9D,$60,$06,$9D,$10  ; $A862
    .byte $01,$20,$BA,$EE,$60,$A9,$07,$85,$01,$A9,$08,$85,$02,$20,$CF,$F0  ; $A872
    .byte $BD,$A0,$06,$C9,$0F,$D0,$05,$A9,$0E,$9D,$A0,$06,$BD,$E0,$04,$F0  ; $A882
    .byte $2E,$DE,$E0,$04,$D0,$29,$A9,$02,$85,$01,$A9,$33,$20,$59,$F1,$B0  ; $A892
    .byte $1C,$A9,$E0,$99,$B0,$04,$A9,$A8,$99,$30,$04,$A6,$01,$BD,$C0,$A9  ; $A8A2
    .byte $99,$F0,$04,$A6,$2B,$8A,$99,$20,$01,$C6,$01,$10,$DD,$A6,$2B,$BD  ; $A8B2
    .byte $10,$01,$C9,$04,$D0,$1E,$38,$BD,$A0,$04,$E9,$20,$9D,$A0,$04,$A9  ; $A8C2
    .byte $87,$9D,$20,$04,$A9,$41,$9D,$20,$06,$A9,$00,$9D,$80,$06,$9D,$A0  ; $A8D2
    .byte $06,$9D,$10,$01,$20,$BA,$EE,$60,$BD,$10,$01,$D0,$0C,$A9,$32,$20  ; $A8E2
    .byte $59,$F1,$8A,$99,$F0,$04,$FE,$10,$01,$BD,$20,$04,$29,$08,$F0,$03  ; $A8F2
    .byte $4C,$77,$A8,$A9,$07,$85,$01,$A9,$28,$85,$02,$38,$BD,$60,$04,$E9  ; $A902
    .byte $07,$85,$08,$BD,$40,$04,$E9,$00,$85,$09,$18,$A9,$00,$85,$0B,$BD  ; $A912
    .byte $A0,$04,$69,$20,$85,$0A,$20,$C3,$CB,$A6,$2B,$A4,$00,$F0,$15,$A5  ; $A922
    .byte $08,$29,$0F,$49,$0F,$38,$7D,$60,$04,$9D,$60,$04,$BD,$40,$04,$69  ; $A932
    .byte $00,$9D,$40,$04,$20,$2C,$F0,$BD,$A0,$06,$C9,$0C,$D0,$05,$A9,$00  ; $A942
    .byte $9D,$A0,$06,$20,$BA,$EE,$B0,$5C,$BD,$00,$01,$F0,$57,$A9,$0D,$9D  ; $A952
    .byte $A0,$06,$A9,$00,$9D,$80,$06,$9D,$20,$06,$9D,$00,$06,$A9,$7E,$9D  ; $A962
    .byte $E0,$04,$20,$EE,$EF,$A9,$02,$85,$01,$A9,$33,$20,$59,$F1,$B0,$2D  ; $A972
    .byte $A6,$01,$18,$B9,$B0,$04,$7D,$B7,$A9,$99,$B0,$04,$BD,$BA,$A9,$99  ; $A982
    .byte $10,$06,$BD,$BD,$A9,$99,$30,$06,$A9,$04,$99,$50,$06,$A9,$00,$99  ; $A992
    .byte $70,$06,$A9,$FF,$99,$20,$01,$A6,$2B,$C6,$01,$10,$CC,$A6,$2B,$A9  ; $A9A2
    .byte $8F,$9D,$20,$04,$60,$F0,$10,$20,$03,$02,$01,$00,$40,$00,$01,$06  ; $A9B2
    .byte $0B,$BC,$E0,$04,$B9,$20,$04,$10,$04,$29,$08,$F0,$04,$5E,$20,$04  ; $A9C2
    .byte $60,$B9,$60,$04,$9D,$60,$04,$B9,$40,$04,$9D,$40,$04,$18,$B9,$A0  ; $A9D2
    .byte $04,$69,$08,$9D,$A0,$04,$20,$B3,$EF,$60,$BC,$10,$01,$10,$30,$A9  ; $A9E2
    .byte $07,$85,$01,$A9,$08,$85,$02,$20,$CF,$F0,$A5,$00,$F0,$4A,$BD,$E0  ; $A9F2
    .byte $04,$F0,$07,$A9,$00,$85,$4E,$4C,$DA,$EE,$A9,$00,$9D,$20,$06,$9D  ; $AA02
    .byte $00,$06,$9D,$60,$06,$A9,$02,$9D,$40,$06,$FE,$E0,$04,$D0,$29,$BD  ; $AA12
    .byte $E0,$04,$F0,$0F,$DE,$E0,$04,$D0,$1F,$A9,$8B,$9D,$20,$04,$A9,$04  ; $AA22
    .byte $9D,$40,$06,$BD,$A0,$04,$D9,$A0,$04,$B0,$0D,$18,$B9,$10,$01,$69  ; $AA32
    .byte $01,$99,$10,$01,$5E,$20,$04,$60,$20,$BA,$EE,$60,$A5,$2A,$C9,$0A  ; $AA42
    .byte $D0,$03,$4C,$44,$AB,$A0,$08,$BD,$A0,$06,$C9,$03,$90,$02,$A0,$10  ; $AA52
    .byte $84,$02,$A9,$07,$85,$01,$20,$CF,$F0,$BD,$10,$01,$D0,$31,$20,$EE  ; $AA62
    .byte $EF,$A5,$00,$C9,$40,$B0,$1D,$BD,$E0,$04,$D0,$15,$FE,$A0,$06,$FE  ; $AA72
    .byte $10,$01,$BD,$20,$04,$29,$F7,$9D,$20,$04,$A9,$3E,$9D,$E0,$04,$D0  ; $AA82
    .byte $0B,$DE,$E0,$04,$A9,$00,$9D,$80,$06,$9D,$A0,$06,$4C,$30,$AB,$C9  ; $AA92
    .byte $02,$B0,$5C,$BD,$A0,$06,$C9,$02,$D0,$3E,$A9,$25,$20,$51,$C0,$A9  ; $AAA2
    .byte $02,$85,$01,$A9,$35,$20,$59,$F1,$B0,$20,$A6,$01,$BD,$38,$AB,$99  ; $AAB2
    .byte $70,$06,$BD,$3B,$AB,$99,$50,$06,$BD,$3E,$AB,$99,$30,$06,$BD,$41  ; $AAC2
    .byte $AB,$99,$10,$06,$A6,$2B,$C6,$01,$10,$D9,$A9,$03,$9D,$A0,$06,$38  ; $AAD2
    .byte $BD,$A0,$04,$E9,$08,$9D,$A0,$04,$DE,$E0,$04,$D0,$35,$20,$EE,$EF  ; $AAE2
    .byte $A9,$02,$9D,$00,$06,$A9,$14,$9D,$E0,$04,$FE,$10,$01,$D0,$23,$DE  ; $AAF2
    .byte $E0,$04,$D0,$1E,$A9,$00,$9D,$00,$06,$9D,$A0,$06,$9D,$10,$01,$A5  ; $AB02
    .byte $4A,$29,$03,$A8,$B9,$34,$AB,$9D,$E0,$04,$BD,$20,$04,$09,$08,$9D  ; $AB12
    .byte $20,$04,$BD,$A0,$06,$C9,$05,$D0,$05,$A9,$03,$9D,$A0,$06,$20,$BA  ; $AB22
    .byte $EE,$60,$1F,$3E,$9B,$1F,$25,$00,$DB,$01,$00,$FE,$A3,$00,$A3,$01  ; $AB32
    .byte $02,$01,$BD,$E0,$04,$D0,$0F,$BD,$A0,$04,$C9,$80,$90,$29,$FE,$E0  ; $AB42
    .byte $04,$A9,$03,$9D,$40,$06,$A9,$08,$85,$01,$A9,$10,$85,$02,$20,$2C  ; $AB52
    .byte $F0,$A5,$00,$F0,$12,$A9,$FF,$9D,$40,$06,$A9,$01,$9D,$00,$06,$A9  ; $AB62
    .byte $00,$9D,$60,$06,$9D,$20,$06,$BD,$A0,$06,$C9,$05,$D0,$05,$A9,$03  ; $AB72
    .byte $9D,$A0,$06,$20,$BA,$EE,$60,$38,$A5,$2D,$E5,$2E,$B0,$10,$A9,$01  ; $AB82
    .byte $85,$40,$A9,$00,$85,$AF,$A9,$A3,$85,$4F,$A9,$00,$85,$50,$20,$B3  ; $AB92
    .byte $EF,$60  ; $ABA2
    LDA $0620,X                  ; $ABA4  BD 20 06
    BNE loc_1D_ABB1              ; $ABA7  D0 08
    LDA #$37                     ; $ABA9  A9 37
    JSR sub_1C_95B5              ; $ABAB  20 B5 95
    BCC loc_1D_ABB1              ; $ABAE  90 01
    RTS                          ; $ABB0  60


loc_1D_ABB1:
    LDA $0460                    ; $ABB1  AD 60 04
    STA $0460,X                  ; $ABB4  9D 60 04
    LDA $0440                    ; $ABB7  AD 40 04
    STA $0440,X                  ; $ABBA  9D 40 04
    LDA $04E0,X                  ; $ABBD  BD E0 04
    BNE loc_1D_AC04              ; $ABC0  D0 42
    LDA #$BB                     ; $ABC2  A9 BB
    STA $04E0,X                  ; $ABC4  9D E0 04
    LDA #$01                     ; $ABC7  A9 01
    STA $01                      ; $ABC9  85 01
    LDA #$38                     ; $ABCB  A9 38
    JSR sub_1C_96CF              ; $ABCD  20 CF 96
    BCS loc_1D_AC04              ; $ABD0  B0 32
    LDA #$02                     ; $ABD2  A9 02
    STA $01                      ; $ABD4  85 01
    LDA #$3C                     ; $ABD6  A9 3C
    JSR sub_1C_96CF              ; $ABD8  20 CF 96
    BCS loc_1D_AC04              ; $ABDB  B0 27
    LDA #$38                     ; $ABDD  A9 38
    JSR sub_1F_F159              ; $ABDF  20 59 F1
    BCS loc_1D_AC04              ; $ABE2  B0 20
    LDX #$00                     ; $ABE4  A2 00
    LDA $0420                    ; $ABE6  AD 20 04
    AND #$40                     ; $ABE9  29 40
    BNE loc_1D_ABEE              ; $ABEB  D0 01
    INX                          ; $ABED  E8

loc_1D_ABEE:
    LDA $AC0C,X                  ; $ABEE  BD 0C AC
    STA $0430,Y                  ; $ABF1  99 30 04
    CLC                          ; $ABF4  18
    LDA $1F                      ; $ABF5  A5 1F
    ADC $AC0A,X                  ; $ABF7  7D 0A AC
    STA $0470,Y                  ; $ABFA  99 70 04
    LDA $20                      ; $ABFD  A5 20
    ADC #$00                     ; $ABFF  69 00
    STA $0450,Y                  ; $AC01  99 50 04

loc_1D_AC04:
    LDX $2B                      ; $AC04  A6 2B
    DEC $04E0,X                  ; $AC06  DE E0 04
    RTS                          ; $AC09  60

    .byte $F8,$08,$83,$C3  ; $AC0A

loc_1D_AC0E:
    LSR $0420,X                  ; $AC0E  5E 20 04
    RTS                          ; $AC11  60

    LDA $0110,X                  ; $AC12  BD 10 01
    BNE loc_1D_AC27              ; $AC15  D0 10
    LDA #$3A                     ; $AC17  A9 3A
    JSR sub_1F_F159              ; $AC19  20 59 F1
    BCS loc_1D_AC0E              ; $AC1C  B0 F0
    TXA                          ; $AC1E  8A
    STA $0120,Y                  ; $AC1F  99 20 01
    INY                          ; $AC22  C8
    TYA                          ; $AC23  98
    STA $0110,X                  ; $AC24  9D 10 01

loc_1D_AC27:
    LDA $04E0,X                  ; $AC27  BD E0 04
    BNE loc_1D_AC74              ; $AC2A  D0 48
    LDA $0420,X                  ; $AC2C  BD 20 04
    PHA                          ; $AC2F  48
    JSR sub_1F_EFEE              ; $AC30  20 EE EF
    PLA                          ; $AC33  68
    STA $0420,X                  ; $AC34  9D 20 04
    LDY $0110,X                  ; $AC37  BC 10 01
    DEY                          ; $AC3A  88
    CLC                          ; $AC3B  18
    LDA $04A0,X                  ; $AC3C  BD A0 04
    ADC #$10                     ; $AC3F  69 10
    STA $04B0,Y                  ; $AC41  99 B0 04
    LDA $0460,X                  ; $AC44  BD 60 04
    STA $0470,Y                  ; $AC47  99 70 04
    LDA $0440,X                  ; $AC4A  BD 40 04
    STA $0450,Y                  ; $AC4D  99 50 04
    LDA $00                      ; $AC50  A5 00
    CMP #$30                     ; $AC52  C9 30
    BCC loc_1D_AC64              ; $AC54  90 0E
    LDA $06A0,X                  ; $AC56  BD A0 06
    CMP #$02                     ; $AC59  C9 02
    BNE loc_1D_AC80              ; $AC5B  D0 23
    LDA #$00                     ; $AC5D  A9 00
    STA $06A0,X                  ; $AC5F  9D A0 06
    BEQ loc_1D_AC80              ; $AC62  F0 1C

loc_1D_AC64:
    LDA #$87                     ; $AC64  A9 87
    STA $0430,Y                  ; $AC66  99 30 04
    INC $04E0,X                  ; $AC69  FE E0 04
    LDA #$02                     ; $AC6C  A9 02
    STA $06A0,X                  ; $AC6E  9D A0 06
    STA $0680,X                  ; $AC71  9D 80 06

loc_1D_AC74:
    LDA $06A0,X                  ; $AC74  BD A0 06
    CMP #$03                     ; $AC77  C9 03
    BNE loc_1D_AC80              ; $AC79  D0 05
    LDA #$00                     ; $AC7B  A9 00
    STA $0680,X                  ; $AC7D  9D 80 06

loc_1D_AC80:
    JSR sub_1F_EEBA              ; $AC80  20 BA EE
    BCC loc_1D_AC8E              ; $AC83  90 09
    LDY $0110,X                  ; $AC85  BC 10 01
    DEY                          ; $AC88  88
    LDA #$00                     ; $AC89  A9 00
    STA $0430,Y                  ; $AC8B  99 30 04

loc_1D_AC8E:
    RTS                          ; $AC8E  60

    LDA #$37                     ; $AC8F  A9 37
    STA $00                      ; $AC91  85 00
    JMP loc_1C_9652              ; $AC93  4C 52 96

    LDA $0420,X                  ; $AC96  BD 20 04
    AND #$04                     ; $AC99  29 04
    BNE loc_1D_ACA1              ; $AC9B  D0 04
    JSR sub_1F_EFB3              ; $AC9D  20 B3 EF
    RTS                          ; $ACA0  60


loc_1D_ACA1:
    LDA #$07                     ; $ACA1  A9 07
    STA $01                      ; $ACA3  85 01
    STA $02                      ; $ACA5  85 02
    JSR sub_1F_F02C              ; $ACA7  20 2C F0
    LDA $00                      ; $ACAA  A5 00
    BNE loc_1D_ACB6              ; $ACAC  D0 08
    JSR sub_1F_EEBA              ; $ACAE  20 BA EE
    LDA $01                      ; $ACB1  A5 01
    BNE loc_1D_ACB6              ; $ACB3  D0 01
    RTS                          ; $ACB5  60


loc_1D_ACB6:
    LDA #$3B                     ; $ACB6  A9 3B
    JSR sub_1F_F159              ; $ACB8  20 59 F1
    LDA #$3B                     ; $ACBB  A9 3B
    JSR sub_1F_F159              ; $ACBD  20 59 F1
    LDA #$C4                     ; $ACC0  A9 C4
    STA $0430,Y                  ; $ACC2  99 30 04
    LDA #$07                     ; $ACC5  A9 07
    STA $01                      ; $ACC7  85 01

loc_1D_ACC9:
    LDA #$3C                     ; $ACC9  A9 3C
    JSR sub_1F_F159              ; $ACCB  20 59 F1
    BCS loc_1D_ACFC              ; $ACCE  B0 2C
    LDX $01                      ; $ACD0  A6 01
    LDA $AD00,X                  ; $ACD2  BD 00 AD
    STA $0430,Y                  ; $ACD5  99 30 04
    LDA $AD08,X                  ; $ACD8  BD 08 AD
    STA $0670,Y                  ; $ACDB  99 70 06
    LDA $AD10,X                  ; $ACDE  BD 10 AD
    STA $0650,Y                  ; $ACE1  99 50 06
    LDA $AD18,X                  ; $ACE4  BD 18 AD
    STA $0630,Y                  ; $ACE7  99 30 06
    LDA $AD20,X                  ; $ACEA  BD 20 AD
    STA $0610,Y                  ; $ACED  99 10 06
    LDA $AD28,X                  ; $ACF0  BD 28 AD
    STA $04F0,Y                  ; $ACF3  99 F0 04
    LDX $2B                      ; $ACF6  A6 2B
    DEC $01                      ; $ACF8  C6 01
    BPL loc_1D_ACC9              ; $ACFA  10 CD

loc_1D_ACFC:
    LSR $0420,X                  ; $ACFC  5E 20 04
    RTS                          ; $ACFF  60

    .byte $C3,$C3,$C3,$C3,$C3,$83,$83,$83,$96,$7B,$1E,$6A,$F0,$00,$E6,$9E  ; $AD00
    .byte $FE,$00,$01,$01,$01,$02,$01,$00,$6A,$F0,$A8,$6A,$7B,$00,$9E,$E6  ; $AD10
    .byte $01,$01,$01,$01,$00,$00,$00,$01,$0B,$21,$1C,$0B,$21,$10,$19,$19  ; $AD20
    LDA $0110,X                  ; $AD30  BD 10 01
    BNE loc_1D_AD48              ; $AD33  D0 13
    DEC $04E0,X                  ; $AD35  DE E0 04
    BNE loc_1D_AD48              ; $AD38  D0 0E
    LDA #$47                     ; $AD3A  A9 47
    STA $08                      ; $AD3C  85 08
    LDA #$01                     ; $AD3E  A9 01
    STA $09                      ; $AD40  85 09
    JSR sub_1F_F197              ; $AD42  20 97 F1
    INC $0110,X                  ; $AD45  FE 10 01

loc_1D_AD48:
    JSR sub_1F_EEBA              ; $AD48  20 BA EE
    RTS                          ; $AD4B  60

    .byte $BC,$10,$01,$B9,$20,$04,$10,$4B,$B9,$00,$04,$C9,$3E,$D0,$44,$38  ; $AD4C
    .byte $B9,$A0,$04,$E9,$14,$9D,$A0,$04,$B9,$60,$04,$9D,$60,$04,$B9,$40  ; $AD5C
    .byte $04,$9D,$40,$04,$20,$EE,$EF,$FE,$E0,$04,$BD,$E0,$04,$C9,$9D,$D0  ; $AD6C
    .byte $12,$A9,$3F,$20,$59,$F1,$A9,$03,$9D,$A0,$06,$A9,$00,$9D,$80,$06  ; $AD7C
    .byte $9D,$E0,$04,$BD,$A0,$06,$C9,$02,$D0,$05,$A9,$00,$9D,$A0,$06,$20  ; $AD8C
    .byte $BA,$EE,$60,$5E,$20,$04,$60,$A9,$18,$9D,$50,$01,$BD,$20,$06,$1D  ; $AD9C
    .byte $60,$06,$D0,$14,$A9,$3D,$20,$59,$F1,$B0,$0D,$8A,$99,$20,$01,$38  ; $ADAC
    .byte $BD,$A0,$04,$E9,$14,$99,$B0,$04,$BD,$E0,$04,$D0,$29,$BD,$10,$01  ; $ADBC
    .byte $29,$0F,$A8,$18,$69,$01,$9D,$10,$01,$B9,$09,$AE,$9D,$60,$06,$B9  ; $ADCC
    .byte $19,$AE,$9D,$40,$06,$B9,$29,$AE,$9D,$20,$06,$B9,$39,$AE,$9D,$20  ; $ADDC
    .byte $04,$A9,$2A,$9D,$E0,$04,$DE,$E0,$04,$20,$BA,$EE,$90,$05,$A9,$00  ; $ADEC
    .byte $9D,$50,$01,$38,$BD,$A0,$04,$E9,$08,$9D,$60,$01,$60,$00,$CE,$A4  ; $ADFC
    .byte $87,$75,$87,$A4,$CE,$00,$32,$5C,$79,$8B,$79,$5C,$32,$00,$FF,$FF  ; $AE0C
    .byte $FF,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$8B,$79,$5C  ; $AE1C
    .byte $32,$00,$32,$5C,$79,$8B,$79,$5C,$32,$00,$32,$5C,$79,$80,$80,$80  ; $AE2C
    .byte $80,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$80,$80,$80,$80  ; $AE3C
    JSR sub_1F_EFEE              ; $AE49  20 EE EF
    SEC                          ; $AE4C  38
    LDA $0400,X                  ; $AE4D  BD 00 04
    SBC #$40                     ; $AE50  E9 40
    TAY                          ; $AE52  A8
    LDA $AF79,Y                  ; $AE53  B9 79 AF
    STA $01                      ; $AE56  85 01
    LDA $0420,X                  ; $AE58  BD 20 04
    AND #$20                     ; $AE5B  29 20
    BEQ loc_1D_AE7A              ; $AE5D  F0 1B
    LDY $01                      ; $AE5F  A4 01
    LDA #$15                     ; $AE61  A9 15
    CMP $0358,Y                  ; $AE63  D9 58 03
    BNE loc_1D_AE6F              ; $AE66  D0 07
    LDA #$04                     ; $AE68  A9 04
    STA $0620,X                  ; $AE6A  9D 20 06
    BNE loc_1D_AE75              ; $AE6D  D0 06

loc_1D_AE6F:
    LDA $00                      ; $AE6F  A5 00
    CMP #$60                     ; $AE71  C9 60
    BCS loc_1D_AE9B              ; $AE73  B0 26

loc_1D_AE75:
    LDA #$82                     ; $AE75  A9 82
    STA $0420,X                  ; $AE77  9D 20 04

loc_1D_AE7A:
    LDA $0620,X                  ; $AE7A  BD 20 06
    CMP #$04                     ; $AE7D  C9 04
    BCS loc_1D_AE9E              ; $AE7F  B0 1D
    LDA $04E0,X                  ; $AE81  BD E0 04
    AND #$03                     ; $AE84  29 03
    BNE loc_1D_AE9B              ; $AE86  D0 13
    STA $04E0,X                  ; $AE88  9D E0 04
    LDA $0620,X                  ; $AE8B  BD 20 06
    INC $0620,X                  ; $AE8E  FE 20 06
    ASL A                        ; $AE91  0A
    ASL A                        ; $AE92  0A
    TAY                          ; $AE93  A8
    LDX $01                      ; $AE94  A6 01
    JSR sub_1D_AF4C              ; $AE96  20 4C AF
    LDX $2B                      ; $AE99  A6 2B

loc_1D_AE9B:
    JMP loc_1D_AF45              ; $AE9B  4C 45 AF


loc_1D_AE9E:
    LDA $00                      ; $AE9E  A5 00
    CMP #$28                     ; $AEA0  C9 28
    BCS loc_1D_AEEF              ; $AEA2  B0 4B
    LDA $04E0,X                  ; $AEA4  BD E0 04
    AND #$3F                     ; $AEA7  29 3F
    BNE loc_1D_AEEF              ; $AEA9  D0 44
    LDA #$03                     ; $AEAB  A9 03
    STA $01                      ; $AEAD  85 01
    LDA #$45                     ; $AEAF  A9 45
    JSR sub_1C_96CF              ; $AEB1  20 CF 96
    BCS loc_1D_AEEF              ; $AEB4  B0 39
    LDA #$45                     ; $AEB6  A9 45
    JSR sub_1F_F159              ; $AEB8  20 59 F1
    BCS loc_1D_AEEF              ; $AEBB  B0 32
    LDA $0600,X                  ; $AEBD  BD 00 06
    AND #$01                     ; $AEC0  29 01
    TAX                          ; $AEC2  AA
    LDA $AF7B,X                  ; $AEC3  BD 7B AF
    STA $0430,Y                  ; $AEC6  99 30 04
    CLC                          ; $AEC9  18
    LDA $04B0,Y                  ; $AECA  B9 B0 04
    ADC #$03                     ; $AECD  69 03
    STA $04B0,Y                  ; $AECF  99 B0 04
    CLC                          ; $AED2  18
    LDA $0470,Y                  ; $AED3  B9 70 04
    ADC $AF7D,X                  ; $AED6  7D 7D AF
    STA $0470,Y                  ; $AED9  99 70 04
    LDA $0450,Y                  ; $AEDC  B9 50 04
    ADC $AF7F,X                  ; $AEDF  7D 7F AF
    STA $0450,Y                  ; $AEE2  99 50 04
    LDA #$3F                     ; $AEE5  A9 3F
    STA $04F0,Y                  ; $AEE7  99 F0 04
    LDX $2B                      ; $AEEA  A6 2B
    INC $0600,X                  ; $AEEC  FE 00 06

loc_1D_AEEF:
    LDA $0660,X                  ; $AEEF  BD 60 06
    ORA $0640,X                  ; $AEF2  1D 40 06
    BNE loc_1D_AF34              ; $AEF5  D0 3D
    LDA #$01                     ; $AEF7  A9 01
    STA $01                      ; $AEF9  85 01

loc_1D_AEFB:
    LDA #$44                     ; $AEFB  A9 44
    JSR sub_1F_F159              ; $AEFD  20 59 F1
    BCS loc_1D_AF2A              ; $AF00  B0 28
    LDA $04B0,Y                  ; $AF02  B9 B0 04
    SBC #$24                     ; $AF05  E9 24
    STA $04B0,Y                  ; $AF07  99 B0 04
    LDX $01                      ; $AF0A  A6 01
    CLC                          ; $AF0C  18
    LDA $0470,Y                  ; $AF0D  B9 70 04
    ADC $AF7D,X                  ; $AF10  7D 7D AF
    STA $0470,Y                  ; $AF13  99 70 04
    LDA $0450,Y                  ; $AF16  B9 50 04
    ADC $AF7F,X                  ; $AF19  7D 7F AF
    STA $0450,Y                  ; $AF1C  99 50 04
    LDA #$78                     ; $AF1F  A9 78
    STA $04F0,Y                  ; $AF21  99 F0 04
    LDX $2B                      ; $AF24  A6 2B
    DEC $01                      ; $AF26  C6 01
    BPL loc_1D_AEFB              ; $AF28  10 D1

loc_1D_AF2A:
    LDA #$48                     ; $AF2A  A9 48
    STA $0660,X                  ; $AF2C  9D 60 06
    LDA #$01                     ; $AF2F  A9 01
    STA $0640,X                  ; $AF31  9D 40 06

loc_1D_AF34:
    SEC                          ; $AF34  38
    LDA $0660,X                  ; $AF35  BD 60 06
    SBC #$01                     ; $AF38  E9 01
    STA $0660,X                  ; $AF3A  9D 60 06
    LDA $0640,X                  ; $AF3D  BD 40 06
    SBC #$00                     ; $AF40  E9 00
    STA $0640,X                  ; $AF42  9D 40 06

loc_1D_AF45:
    INC $04E0,X                  ; $AF45  FE E0 04
    JSR sub_1F_EFB3              ; $AF48  20 B3 EF
    RTS                          ; $AF4B  60


sub_1D_AF4C:
    LDA #$03                     ; $AF4C  A9 03
    STA $02                      ; $AF4E  85 02

loc_1D_AF50:
    LDA $AF69,Y                  ; $AF50  B9 69 AF
    STA $0356,X                  ; $AF53  9D 56 03
    STA $0376,X                  ; $AF56  9D 76 03
    STA $0386,X                  ; $AF59  9D 86 03
    STA $0396,X                  ; $AF5C  9D 96 03
    STA $03A6,X                  ; $AF5F  9D A6 03
    INY                          ; $AF62  C8
    INX                          ; $AF63  E8
    DEC $02                      ; $AF64  C6 02
    BPL loc_1D_AF50              ; $AF66  10 E8
    RTS                          ; $AF68  60

    .byte $0F,$21,$21,$21,$0F,$31,$35,$21,$0F,$30,$25,$10,$0F,$30,$15,$0F  ; $AF69
    .byte $08,$0C,$C3,$83,$1D,$E3,$00,$FF,$5E,$20,$04,$A9,$FF,$9D,$20,$01  ; $AF79
    .byte $BC,$10,$01,$A9,$00,$99,$40,$01,$38,$BD,$00,$04,$E9,$42,$A8,$BE  ; $AF89
    .byte $79,$AF,$A0,$00,$20,$4C,$AF,$60  ; $AF99
    LDA $04E0,X                  ; $AFA1  BD E0 04
    BNE loc_1D_AFD9              ; $AFA4  D0 33
    LDA $0110,X                  ; $AFA6  BD 10 01
    CMP #$01                     ; $AFA9  C9 01
    BCS loc_1D_AFBF              ; $AFAB  B0 12
    LDA #$3E                     ; $AFAD  A9 3E
    STA $04E0,X                  ; $AFAF  9D E0 04
    LDA #$00                     ; $AFB2  A9 00
    STA $0640,X                  ; $AFB4  9D 40 06
    STA $0660,X                  ; $AFB7  9D 60 06
    INC $0110,X                  ; $AFBA  FE 10 01
    BNE loc_1D_AFD9              ; $AFBD  D0 1A

loc_1D_AFBF:
    BNE loc_1D_AFD5              ; $AFBF  D0 14
    LDA #$C0                     ; $AFC1  A9 C0
    STA $0660,X                  ; $AFC3  9D 60 06
    LDA #$FE                     ; $AFC6  A9 FE
    STA $0640,X                  ; $AFC8  9D 40 06
    LDA #$0B                     ; $AFCB  A9 0B
    STA $04E0,X                  ; $AFCD  9D E0 04
    INC $0110,X                  ; $AFD0  FE 10 01
    BNE loc_1D_AFD9              ; $AFD3  D0 04

loc_1D_AFD5:
    LSR $0420,X                  ; $AFD5  5E 20 04
    RTS                          ; $AFD8  60


loc_1D_AFD9:
    DEC $04E0,X                  ; $AFD9  DE E0 04
    JSR sub_1F_EEBA              ; $AFDC  20 BA EE
    RTS                          ; $AFDF  60

    LDA $0110,X                  ; $AFE0  BD 10 01
    CMP #$02                     ; $AFE3  C9 02
    BNE loc_1D_AFEA              ; $AFE5  D0 03
    JMP loc_1D_A4A6              ; $AFE7  4C A6 A4


loc_1D_AFEA:
    LDA $04E0,X                  ; $AFEA  BD E0 04
    BNE loc_1D_B014              ; $AFED  D0 25
    LDA $0110,X                  ; $AFEF  BD 10 01
    BNE loc_1D_B010              ; $AFF2  D0 1C
    LDA #$1A                     ; $AFF4  A9 1A
    STA $04E0,X                  ; $AFF6  9D E0 04
    LDA #$00                     ; $AFF9  A9 00
    STA $0600,X                  ; $AFFB  9D 00 06
    STA $0620,X                  ; $AFFE  9D 20 06
    LDA #$03                     ; $B001  A9 03
    STA $0640,X                  ; $B003  9D 40 06
    LDA #$33                     ; $B006  A9 33
    STA $0660,X                  ; $B008  9D 60 06
    INC $0110,X                  ; $B00B  FE 10 01
    BNE loc_1D_B014              ; $B00E  D0 04

loc_1D_B010:
    INC $0110,X                  ; $B010  FE 10 01
    RTS                          ; $B013  60


loc_1D_B014:
    DEC $04E0,X                  ; $B014  DE E0 04
    JSR sub_1F_EEBA              ; $B017  20 BA EE
    RTS                          ; $B01A  60

    LDA $0110,X                  ; $B01B  BD 10 01
    BEQ loc_1D_B023              ; $B01E  F0 03
    JMP loc_1D_B0CB              ; $B020  4C CB B0


loc_1D_B023:
    LDY #$00                     ; $B023  A0 00
    STY $0B                      ; $B025  84 0B
    LDA $0420,X                  ; $B027  BD 20 04
    AND #$40                     ; $B02A  29 40
    BNE loc_1D_B02F              ; $B02C  D0 01
    INY                          ; $B02E  C8

loc_1D_B02F:
    CLC                          ; $B02F  18
    LDA $0460,X                  ; $B030  BD 60 04
    ADC $B0F6,Y                  ; $B033  79 F6 B0
    STA $08                      ; $B036  85 08
    LDA $0440,X                  ; $B038  BD 40 04
    ADC $B0F8,Y                  ; $B03B  79 F8 B0
    STA $09                      ; $B03E  85 09
    CLC                          ; $B040  18
    LDA $04A0,X                  ; $B041  BD A0 04
    ADC #$09                     ; $B044  69 09
    STA $0A                      ; $B046  85 0A
    JSR sub_1E_CBC3              ; $B048  20 C3 CB
    LDX $2B                      ; $B04B  A6 2B
    LDA $00                      ; $B04D  A5 00
    BEQ loc_1D_B05F              ; $B04F  F0 0E
    LDA $04A0,X                  ; $B051  BD A0 04
    STA $0A                      ; $B054  85 0A
    JSR sub_1E_CBC3              ; $B056  20 C3 CB
    LDX $2B                      ; $B059  A6 2B
    LDA $00                      ; $B05B  A5 00
    BEQ loc_1D_B067              ; $B05D  F0 08

loc_1D_B05F:
    LDA $0420,X                  ; $B05F  BD 20 04
    EOR #$40                     ; $B062  49 40
    STA $0420,X                  ; $B064  9D 20 04

loc_1D_B067:
    LDA #$00                     ; $B067  A9 00
    STA $0600,X                  ; $B069  9D 00 06
    LDA #$41                     ; $B06C  A9 41
    STA $0620,X                  ; $B06E  9D 20 06
    SEC                          ; $B071  38
    LDA $04A0                    ; $B072  AD A0 04
    SBC $04A0,X                  ; $B075  FD A0 04
    BCS loc_1D_B07E              ; $B078  B0 04
    EOR #$FF                     ; $B07A  49 FF
    ADC #$01                     ; $B07C  69 01

loc_1D_B07E:
    CMP #$05                     ; $B07E  C9 05
    BCS loc_1D_B0BD              ; $B080  B0 3B
    LDA #$00                     ; $B082  A9 00
    STA $0620,X                  ; $B084  9D 20 06
    LDA #$02                     ; $B087  A9 02
    STA $0600,X                  ; $B089  9D 00 06
    LDA $0420,X                  ; $B08C  BD 20 04
    PHA                          ; $B08F  48
    JSR sub_1F_EFEE              ; $B090  20 EE EF
    PLA                          ; $B093  68
    STA $0420,X                  ; $B094  9D 20 04
    LDA $00                      ; $B097  A5 00
    CMP #$11                     ; $B099  C9 11
    BCS loc_1D_B0BD              ; $B09B  B0 20
    LDA #$01                     ; $B09D  A9 01
    STA $06A0,X                  ; $B09F  9D A0 06
    SEC                          ; $B0A2  38
    LDA $04A0,X                  ; $B0A3  BD A0 04
    SBC #$08                     ; $B0A6  E9 08
    STA $04A0,X                  ; $B0A8  9D A0 04
    LDA #$70                     ; $B0AB  A9 70
    STA $04E0,X                  ; $B0AD  9D E0 04
    LDA $0420,X                  ; $B0B0  BD 20 04
    AND #$F7                     ; $B0B3  29 F7
    STA $0420,X                  ; $B0B5  9D 20 04
    INC $0110,X                  ; $B0B8  FE 10 01
    BNE loc_1D_B0CB              ; $B0BB  D0 0E

loc_1D_B0BD:
    LDA #$00                     ; $B0BD  A9 00
    STA $06A0,X                  ; $B0BF  9D A0 06
    LDA #$07                     ; $B0C2  A9 07
    STA $06E0,X                  ; $B0C4  9D E0 06
    JSR sub_1F_EEBA              ; $B0C7  20 BA EE
    RTS                          ; $B0CA  60


loc_1D_B0CB:
    LDA $06A0,X                  ; $B0CB  BD A0 06
    CMP #$05                     ; $B0CE  C9 05
    BNE loc_1D_B0D7              ; $B0D0  D0 05
    LDA #$01                     ; $B0D2  A9 01
    STA $06A0,X                  ; $B0D4  9D A0 06

loc_1D_B0D7:
    LDA #$09                     ; $B0D7  A9 09
    STA $06E0,X                  ; $B0D9  9D E0 06
    DEC $04E0,X                  ; $B0DC  DE E0 04
    BNE loc_1D_B0F2              ; $B0DF  D0 11
    DEC $0110,X                  ; $B0E1  DE 10 01
    LDA #$00                     ; $B0E4  A9 00
    STA $06A0,X                  ; $B0E6  9D A0 06
    CLC                          ; $B0E9  18
    LDA $04A0,X                  ; $B0EA  BD A0 04
    ADC #$08                     ; $B0ED  69 08
    STA $04A0,X                  ; $B0EF  9D A0 04

loc_1D_B0F2:
    JSR sub_1F_EFB3              ; $B0F2  20 B3 EF
    RTS                          ; $B0F5  60

    .byte $08,$F8,$00,$FF,$BD,$20,$06,$D0,$08,$A9,$47,$20,$B5,$95,$90,$01  ; $B0F6
    .byte $60,$AD,$60,$04,$9D,$60,$04,$AD,$40,$04,$9D,$40,$04,$BD,$E0,$04  ; $B106
    .byte $D0,$5A,$A9,$3E,$9D,$E0,$04,$A9,$06,$85,$01,$A9,$48,$20,$CF,$96  ; $B116
    .byte $A9,$49,$20,$CF,$96,$B0,$45,$BD,$00,$06,$0A,$85,$01,$A9,$02,$85  ; $B126
    .byte $02,$A4,$01,$B9,$78,$B1,$20,$59,$F1,$B0,$31,$A6,$01,$18,$B9,$70  ; $B136
    .byte $04,$7D,$7E,$B1,$99,$70,$04,$B9,$50,$04,$69,$00,$99,$50,$04,$BD  ; $B146
    .byte $84,$B1,$99,$B0,$04,$A6,$2B,$E6,$01,$C6,$02,$D0,$D4,$FE,$00,$06  ; $B156
    .byte $BD,$00,$06,$C9,$03,$D0,$05,$A9,$00,$9D,$00,$06,$A6,$2B,$DE,$E0  ; $B166
    .byte $04,$60,$49,$48,$49,$48,$49,$48,$18,$58,$50,$20,$28,$60,$10,$D0  ; $B176
    .byte $10,$D0,$10,$D0,$A9,$00,$85,$01,$38,$BD,$A0,$04,$E9,$0C,$4C,$A1  ; $B186
    .byte $B1,$A9,$04,$85,$01,$18,$BD,$A0,$04,$69,$0C,$85,$0A,$A9,$00,$85  ; $B196
    .byte $0B,$BD,$60,$04,$85,$08,$BD,$40,$04,$85,$09,$20,$C3,$CB,$A6,$2B  ; $B1A6
    .byte $BD,$10,$01,$D0,$1C,$A5,$00,$D0,$40,$A4,$01,$B9,$03,$B2,$9D,$60  ; $B1B6
    .byte $06,$B9,$05,$B2,$9D,$40,$06,$FE,$10,$01,$A9,$4B,$9D,$E0,$04,$D0  ; $B1C6
    .byte $28,$A4,$01,$BD,$E0,$04,$F0,$05,$DE,$E0,$04,$D0,$0C,$B9,$04,$B2  ; $B1D6
    .byte $9D,$60,$06,$B9,$06,$B2,$9D,$40,$06,$A5,$00,$F0,$0C,$B9,$03,$B2  ; $B1E6
    .byte $9D,$60,$06,$B9,$05,$B2,$9D,$40,$06,$20,$BA,$EE,$60,$41,$E5,$00  ; $B1F6
    .byte $00,$BF,$1B,$FF,$FF,$A9,$47,$85,$00,$4C,$52,$96  ; $B206
    LDA $0110,X                  ; $B212  BD 10 01
    BEQ loc_1D_B241              ; $B215  F0 2A
    LDA $06A0,X                  ; $B217  BD A0 06
    CMP #$05                     ; $B21A  C9 05
    BNE loc_1D_B23E              ; $B21C  D0 20
    LDA #$00                     ; $B21E  A9 00
    STA $0680,X                  ; $B220  9D 80 06
    LDA $04E0,X                  ; $B223  BD E0 04
    BNE loc_1D_B26B              ; $B226  D0 43
    LDA #$00                     ; $B228  A9 00
    STA $01                      ; $B22A  85 01
    JSR sub_1D_B272              ; $B22C  20 72 B2
    DEC $0620,X                  ; $B22F  DE 20 06
    BEQ loc_1D_B23B              ; $B232  F0 07
    LDA #$1F                     ; $B234  A9 1F
    STA $04E0,X                  ; $B236  9D E0 04
    BNE loc_1D_B26B              ; $B239  D0 30

loc_1D_B23B:
    DEC $0110,X                  ; $B23B  DE 10 01

loc_1D_B23E:
    JMP loc_1D_B26E              ; $B23E  4C 6E B2


loc_1D_B241:
    LDA $06A0,X                  ; $B241  BD A0 06
    BNE loc_1D_B26E              ; $B244  D0 28
    LDA #$00                     ; $B246  A9 00
    STA $0680,X                  ; $B248  9D 80 06
    LDA $04E0,X                  ; $B24B  BD E0 04
    BNE loc_1D_B26B              ; $B24E  D0 1B
    LDA #$0A                     ; $B250  A9 0A
    STA $01                      ; $B252  85 01
    JSR sub_1D_B272              ; $B254  20 72 B2
    INC $0620,X                  ; $B257  FE 20 06
    LDA $0620,X                  ; $B25A  BD 20 06
    CMP #$06                     ; $B25D  C9 06
    BNE loc_1D_B266              ; $B25F  D0 05
    INC $0110,X                  ; $B261  FE 10 01
    BNE loc_1D_B26E              ; $B264  D0 08

loc_1D_B266:
    LDA #$1F                     ; $B266  A9 1F
    STA $04E0,X                  ; $B268  9D E0 04

loc_1D_B26B:
    DEC $04E0,X                  ; $B26B  DE E0 04

loc_1D_B26E:
    JSR sub_1F_EFB3              ; $B26E  20 B3 EF
    RTS                          ; $B271  60


sub_1D_B272:
    LDX $01                      ; $B272  A6 01
    LDA $4A                      ; $B274  A5 4A
    AND $B2DC,X                  ; $B276  3D DC B2
    CLC                          ; $B279  18
    ADC $B2DD,X                  ; $B27A  7D DD B2
    STA $0B                      ; $B27D  85 0B
    LDA $B2DE,X                  ; $B27F  BD DE B2
    STA $0D                      ; $B282  85 0D
    LDA #$00                     ; $B284  A9 00
    STA $0A                      ; $B286  85 0A
    STA $0C                      ; $B288  85 0C
    JSR sub_1E_C874              ; $B28A  20 74 C8
    LDX $2B                      ; $B28D  A6 2B
    LDA #$25                     ; $B28F  A9 25
    JSR sub_1E_C051              ; $B291  20 51 C0
    LDA #$4D                     ; $B294  A9 4D
    JSR sub_1F_F159              ; $B296  20 59 F1
    BCS loc_1D_B2D9              ; $B299  B0 3E
    LDX $01                      ; $B29B  A6 01
    LDA $B2DF,X                  ; $B29D  BD DF B2
    STA $0670,Y                  ; $B2A0  99 70 06
    LDA $B2E0,X                  ; $B2A3  BD E0 B2
    STA $0650,Y                  ; $B2A6  99 50 06
    LDA $0E                      ; $B2A9  A5 0E
    STA $0630,Y                  ; $B2AB  99 30 06
    LDA $0F                      ; $B2AE  A5 0F
    STA $0610,Y                  ; $B2B0  99 10 06
    SEC                          ; $B2B3  38
    LDA $04B0,Y                  ; $B2B4  B9 B0 04
    SBC $B2E1,X                  ; $B2B7  FD E1 B2
    STA $04B0,Y                  ; $B2BA  99 B0 04
    LDA $0430,Y                  ; $B2BD  B9 30 04
    AND #$40                     ; $B2C0  29 40
    BNE loc_1D_B2C6              ; $B2C2  D0 02
    INX                          ; $B2C4  E8
    INX                          ; $B2C5  E8

loc_1D_B2C6:
    CLC                          ; $B2C6  18
    LDA $0470,Y                  ; $B2C7  B9 70 04
    ADC $B2E2,X                  ; $B2CA  7D E2 B2
    STA $0470,Y                  ; $B2CD  99 70 04
    LDA $0450,Y                  ; $B2D0  B9 50 04
    ADC $B2E3,X                  ; $B2D3  7D E3 B2
    STA $0450,Y                  ; $B2D6  99 50 04

loc_1D_B2D9:
    LDX $2B                      ; $B2D9  A6 2B
    RTS                          ; $B2DB  60

    .byte $23,$18,$30,$E6,$04,$0C,$0C,$00,$F4,$FF,$1F,$60,$18,$D4,$02,$00  ; $B2DC
    .byte $08,$00,$F8,$FF  ; $B2EC
    LDA $0110,X                  ; $B2F0  BD 10 01
    BNE loc_1D_B339              ; $B2F3  D0 44
    LDA $04E0,X                  ; $B2F5  BD E0 04
    BNE loc_1D_B322              ; $B2F8  D0 28
    LDA $06A0,X                  ; $B2FA  BD A0 06
    CMP #$02                     ; $B2FD  C9 02
    BNE loc_1D_B32D              ; $B2FF  D0 2C
    LDA #$87                     ; $B301  A9 87
    STA $0420,X                  ; $B303  9D 20 04
    JSR sub_1F_EFEE              ; $B306  20 EE EF
    LDA #$78                     ; $B309  A9 78
    STA $0660,X                  ; $B30B  9D 60 06
    LDA #$04                     ; $B30E  A9 04
    STA $0640,X                  ; $B310  9D 40 06
    LDA #$C9                     ; $B313  A9 C9
    STA $0620,X                  ; $B315  9D 20 06
    LDA #$01                     ; $B318  A9 01
    STA $0600,X                  ; $B31A  9D 00 06
    INC $0110,X                  ; $B31D  FE 10 01
    BNE loc_1D_B32D              ; $B320  D0 0B

loc_1D_B322:
    LDA $06A0,X                  ; $B322  BD A0 06
    BNE loc_1D_B32A              ; $B325  D0 03
    STA $0680,X                  ; $B327  9D 80 06

loc_1D_B32A:
    DEC $04E0,X                  ; $B32A  DE E0 04

loc_1D_B32D:
    JSR sub_1F_EFB3              ; $B32D  20 B3 EF
    BCC loc_1D_B335              ; $B330  90 03
    JMP loc_1D_B3FB              ; $B332  4C FB B3


loc_1D_B335:
    RTS                          ; $B335  60


loc_1D_B336:
    JMP loc_1D_B3F2              ; $B336  4C F2 B3


loc_1D_B339:
    CMP #$01                     ; $B339  C9 01
    BNE loc_1D_B39A              ; $B33B  D0 5D
    LDA #$02                     ; $B33D  A9 02
    STA $06A0,X                  ; $B33F  9D A0 06
    LDA $0640,X                  ; $B342  BD 40 06
    PHP                          ; $B345  08
    LDA #$0F                     ; $B346  A9 0F
    STA $01                      ; $B348  85 01
    LDA #$1C                     ; $B34A  A9 1C
    STA $02                      ; $B34C  85 02
    JSR sub_1F_F0CF              ; $B34E  20 CF F0
    PLP                          ; $B351  28
    BPL loc_1D_B336              ; $B352  10 E2
    LDA $00                      ; $B354  A5 00
    BEQ loc_1D_B336              ; $B356  F0 DE
    LDA #$21                     ; $B358  A9 21
    JSR sub_1E_C051              ; $B35A  20 51 C0
    LDA #$03                     ; $B35D  A9 03
    STA $06A0,X                  ; $B35F  9D A0 06
    LDA #$00                     ; $B362  A9 00
    STA $0600,X                  ; $B364  9D 00 06
    STA $0620,X                  ; $B367  9D 20 06
    STA $0660,X                  ; $B36A  9D 60 06
    STA $0640,X                  ; $B36D  9D 40 06
    STA $0680,X                  ; $B370  9D 80 06
    LDA $0420,X                  ; $B373  BD 20 04
    AND #$FB                     ; $B376  29 FB
    STA $0420,X                  ; $B378  9D 20 04
    LDA #$3E                     ; $B37B  A9 3E
    STA $04E0,X                  ; $B37D  9D E0 04
    DEC $0110,X                  ; $B380  DE 10 01
    SEC                          ; $B383  38
    LDA $04A0                    ; $B384  AD A0 04
    SBC $04A0,X                  ; $B387  FD A0 04
    CMP #$10                     ; $B38A  C9 10
    BNE loc_1D_B3EF              ; $B38C  D0 61
    LDA #$12                     ; $B38E  A9 12
    STA $04E0,X                  ; $B390  9D E0 04
    LDA #$02                     ; $B393  A9 02
    STA $0110,X                  ; $B395  9D 10 01
    BNE loc_1D_B3EF              ; $B398  D0 55

loc_1D_B39A:
    LDA $06A0,X                  ; $B39A  BD A0 06
    BNE loc_1D_B3A4              ; $B39D  D0 05
    LDA #$00                     ; $B39F  A9 00
    STA $0680,X                  ; $B3A1  9D 80 06

loc_1D_B3A4:
    LDA $04E0,X                  ; $B3A4  BD E0 04
    BNE loc_1D_B3EF              ; $B3A7  D0 46
    LDA #$25                     ; $B3A9  A9 25
    JSR sub_1E_C051              ; $B3AB  20 51 C0
    JSR sub_1F_EFEE              ; $B3AE  20 EE EF
    LDA #$35                     ; $B3B1  A9 35
    JSR sub_1F_F159              ; $B3B3  20 59 F1
    BCS loc_1D_B3D4              ; $B3B6  B0 1C
    LDA $0110,X                  ; $B3B8  BD 10 01
    TAX                          ; $B3BB  AA
    LDA $B40B,X                  ; $B3BC  BD 0B B4
    STA $0670,Y                  ; $B3BF  99 70 06
    LDA $B410,X                  ; $B3C2  BD 10 B4
    STA $0650,Y                  ; $B3C5  99 50 06
    LDA $B415,X                  ; $B3C8  BD 15 B4
    STA $0630,Y                  ; $B3CB  99 30 06
    LDA $B41A,X                  ; $B3CE  BD 1A B4
    STA $0610,Y                  ; $B3D1  99 10 06

loc_1D_B3D4:
    TXA                          ; $B3D4  8A
    LDX $2B                      ; $B3D5  A6 2B
    CMP #$06                     ; $B3D7  C9 06
    BNE loc_1D_B3E7              ; $B3D9  D0 0C
    LDA #$00                     ; $B3DB  A9 00
    STA $0110,X                  ; $B3DD  9D 10 01
    LDA #$3F                     ; $B3E0  A9 3F
    STA $04E0,X                  ; $B3E2  9D E0 04
    BNE loc_1D_B3EF              ; $B3E5  D0 08

loc_1D_B3E7:
    LDA #$12                     ; $B3E7  A9 12
    STA $04E0,X                  ; $B3E9  9D E0 04
    INC $0110,X                  ; $B3EC  FE 10 01

loc_1D_B3EF:
    DEC $04E0,X                  ; $B3EF  DE E0 04

loc_1D_B3F2:
    JSR sub_1F_EEBA              ; $B3F2  20 BA EE
    BCC loc_1D_B3FA              ; $B3F5  90 03
    JMP loc_1D_B3FB              ; $B3F7  4C FB B3


loc_1D_B3FA:
    RTS                          ; $B3FA  60


loc_1D_B3FB:
    LDA $06C0,X                  ; $B3FB  BD C0 06
    BNE loc_1D_B3FA              ; $B3FE  D0 FA
    LDA #$4F                     ; $B400  A9 4F
    JSR sub_1F_F159              ; $B402  20 59 F1
    BCS loc_1D_B3FA              ; $B405  B0 F3
    LDA #$7E                     ; $B407  A9 7E
    STA $04F0,Y                  ; $B409  99 F0 04
    RTS                          ; $B40C  60

    .byte $6A,$A0,$88,$12,$58,$FB,$FC,$FD,$FE,$FF,$8C,$4E,$9A,$C2,$D2,$06  ; $B40D
    .byte $07,$07,$07,$07,$20,$EE,$EF,$A9,$00,$9D,$80,$06,$A9,$0B,$85,$01  ; $B41D
    .byte $A9,$0C,$85,$02,$20,$CF,$F0,$BD,$A0,$06,$D0,$1A,$A9,$00,$9D,$A0  ; $B42D
    .byte $06,$BD,$E0,$04,$D0,$4C,$FE,$A0,$06,$A9,$1F,$9D,$E0,$04,$BD,$20  ; $B43D
    .byte $04,$29,$F7,$9D,$20,$04,$BD,$E0,$04,$D0,$37,$A9,$25,$20,$51,$C0  ; $B44D
    .byte $A9,$35,$20,$59,$F1,$B0,$05,$A9,$02,$99,$10,$06,$FE,$10,$01,$BD  ; $B45D
    .byte $10,$01,$C9,$03,$D0,$17,$A9,$00,$9D,$10,$01,$9D,$A0,$06,$A9,$7E  ; $B46D
    .byte $9D,$E0,$04,$BD,$20,$04,$09,$08,$9D,$20,$04,$D0,$05,$A9,$1F,$9D  ; $B47D
    .byte $E0,$04,$DE,$E0,$04,$20,$BA,$EE,$60  ; $B48D
    LDA $04E0,X                  ; $B496  BD E0 04
    BNE loc_1D_B4C9              ; $B499  D0 2E
    LDA #$20                     ; $B49B  A9 20
    STA $04E0,X                  ; $B49D  9D E0 04
    LDA #$03                     ; $B4A0  A9 03
    STA $01                      ; $B4A2  85 01
    LDA #$51                     ; $B4A4  A9 51
    JSR sub_1C_96CF              ; $B4A6  20 CF 96
    BCS loc_1D_B4C9              ; $B4A9  B0 1E
    JSR sub_1F_EFEE              ; $B4AB  20 EE EF
    LDA $00                      ; $B4AE  A5 00
    CMP #$48                     ; $B4B0  C9 48
    BCS loc_1D_B4C9              ; $B4B2  B0 15
    LDA #$51                     ; $B4B4  A9 51
    JSR sub_1F_F159              ; $B4B6  20 59 F1
    BCS loc_1D_B4C9              ; $B4B9  B0 0E
    SEC                          ; $B4BB  38
    LDA $04B0,Y                  ; $B4BC  B9 B0 04
    SBC #$0C                     ; $B4BF  E9 0C
    STA $04B0,Y                  ; $B4C1  99 B0 04
    LDA #$1F                     ; $B4C4  A9 1F
    STA $04F0,Y                  ; $B4C6  99 F0 04

loc_1D_B4C9:
    DEC $04E0,X                  ; $B4C9  DE E0 04
    JSR sub_1F_EFB3              ; $B4CC  20 B3 EF
    RTS                          ; $B4CF  60

    LDA $0110,X                  ; $B4D0  BD 10 01
    BNE loc_1D_B510              ; $B4D3  D0 3B
    DEC $04E0,X                  ; $B4D5  DE E0 04
    BNE loc_1D_B534              ; $B4D8  D0 5A
    LDA #$87                     ; $B4DA  A9 87
    STA $0420,X                  ; $B4DC  9D 20 04
    JSR sub_1F_EFEE              ; $B4DF  20 EE EF
    LDA $4A                      ; $B4E2  A5 4A
    AND #$1F                     ; $B4E4  29 1F
    STA $01                      ; $B4E6  85 01
    SEC                          ; $B4E8  38
    LDA $00                      ; $B4E9  A5 00
    SBC $01                      ; $B4EB  E5 01
    BCS loc_1D_B4F1              ; $B4ED  B0 02
    LDA #$00                     ; $B4EF  A9 00

loc_1D_B4F1:
    STA $00                      ; $B4F1  85 00
    LDA #$00                     ; $B4F3  A9 00
    ASL $00                      ; $B4F5  06 00
    ROL A                        ; $B4F7  2A
    ASL $00                      ; $B4F8  06 00
    ROL A                        ; $B4FA  2A
    ASL $00                      ; $B4FB  06 00
    ROL A                        ; $B4FD  2A
    STA $0600,X                  ; $B4FE  9D 00 06
    LDA $00                      ; $B501  A5 00
    STA $0620,X                  ; $B503  9D 20 06
    LDA #$04                     ; $B506  A9 04
    STA $0640,X                  ; $B508  9D 40 06
    INC $0110,X                  ; $B50B  FE 10 01
    BNE loc_1D_B534              ; $B50E  D0 24

loc_1D_B510:
    CMP #$02                     ; $B510  C9 02
    BCS loc_1D_B544              ; $B512  B0 30
    LDA $0640,X                  ; $B514  BD 40 06
    PHP                          ; $B517  08
    LDA #$05                     ; $B518  A9 05
    STA $01                      ; $B51A  85 01
    LDA #$08                     ; $B51C  A9 08
    STA $02                      ; $B51E  85 02
    JSR sub_1F_F0CF              ; $B520  20 CF F0
    PLP                          ; $B523  28
    BPL loc_1D_B534              ; $B524  10 0E
    LDA $00                      ; $B526  A5 00
    BEQ loc_1D_B534              ; $B528  F0 0A
    LDA #$5D                     ; $B52A  A9 5D
    STA $04E0,X                  ; $B52C  9D E0 04
    INC $0110,X                  ; $B52F  FE 10 01
    BNE loc_1D_B544              ; $B532  D0 10

loc_1D_B534:
    LDA $06A0,X                  ; $B534  BD A0 06
    CMP #$0A                     ; $B537  C9 0A
    BNE loc_1D_B540              ; $B539  D0 05
    LDA #$06                     ; $B53B  A9 06
    STA $06A0,X                  ; $B53D  9D A0 06

loc_1D_B540:
    JSR sub_1F_EEBA              ; $B540  20 BA EE
    RTS                          ; $B543  60


loc_1D_B544:
    LDA $04E0,X                  ; $B544  BD E0 04
    BEQ loc_1D_B558              ; $B547  F0 0F
    DEC $04E0,X                  ; $B549  DE E0 04
    LDA $06A0,X                  ; $B54C  BD A0 06
    CMP #$0A                     ; $B54F  C9 0A
    BNE loc_1D_B558              ; $B551  D0 05
    LDA #$06                     ; $B553  A9 06
    STA $06A0,X                  ; $B555  9D A0 06

loc_1D_B558:
    JSR sub_1F_EFB3              ; $B558  20 B3 EF
    RTS                          ; $B55B  60

    .byte $DE,$E0,$04,$F0,$04,$20,$B3,$EF,$60,$5E,$20,$04,$60,$A9,$7D,$D0  ; $B55C
    .byte $06,$A9,$BB,$D0,$02,$A9,$FA,$85,$00,$BD,$10,$01,$D0,$0A,$A5,$00  ; $B56C
    .byte $9D,$60,$01,$FE,$10,$01,$D0,$5A,$C9,$01,$D0,$21,$BD,$60,$01,$D0  ; $B57C
    .byte $51,$A9,$90,$9D,$20,$04,$A9,$3C,$20,$51,$C0,$A9,$7D,$9D,$60,$01  ; $B58C
    .byte $FE,$10,$01,$A9,$00,$9D,$80,$06,$9D,$A0,$06,$F0,$35,$BD,$A0,$06  ; $B59C
    .byte $C9,$05,$D0,$05,$A9,$00,$9D,$80,$06,$A9,$01,$9D,$E0,$04,$BD,$60  ; $B5AC
    .byte $04,$3D,$00,$06,$9D,$40,$06,$BD,$A0,$04,$3D,$20,$06,$9D,$60,$06  ; $B5BC
    .byte $BD,$60,$01,$D0,$0D,$A9,$A0,$9D,$20,$04,$A9,$7D,$9D,$60,$01,$DE  ; $B5CC
    .byte $10,$01,$DE,$60,$01,$20,$B3,$EF,$60,$A5,$2A,$C9,$0C,$F0,$33,$5E  ; $B5DC
    .byte $20,$04,$A9,$FF,$9D,$F0,$00,$A5,$2A,$C9,$0A,$F0,$19,$38,$BD,$40  ; $B5EC
    .byte $04,$E9,$0A,$0A,$0A,$0A,$A8,$A2,$00,$B9,$29,$B6,$9D,$5E,$03,$C8  ; $B5FC
    .byte $E8,$E0,$08,$D0,$F4,$60,$A9,$0F,$8D,$63,$03,$8D,$64,$03,$8D,$65  ; $B60C
    .byte $03,$60,$A5,$AA,$F0,$04,$20,$B3,$EF,$60,$4C,$7A,$B9,$0F,$39,$18  ; $B61C
    .byte $12,$0F,$39,$18,$01,$0F,$39,$18,$01,$0F,$39,$18,$01,$0F,$39,$18  ; $B62C
    .byte $01,$0F,$39,$18,$0F,$BD,$10,$01,$D0,$5B,$A9,$03,$85,$01,$A9,$04  ; $B63C
    .byte $85,$02,$20,$CF,$F0,$A5,$03,$F0,$04,$5E,$20,$04,$60,$A5,$00,$F0  ; $B64C
    .byte $78,$A9,$04,$85,$01,$A9,$58,$20,$59,$F1,$B0,$1E,$A6,$01,$BD,$D9  ; $B65C
    .byte $B6,$99,$70,$06,$BD,$DE,$B6,$99,$50,$06,$A9,$01,$99,$20,$01,$A9  ; $B66C
    .byte $1F,$99,$F0,$04,$A6,$2B,$C6,$01,$D0,$DB,$A9,$81,$9D,$20,$04,$A9  ; $B67C
    .byte $00,$9D,$60,$06,$9D,$40,$06,$9D,$20,$06,$9D,$00,$06,$A9,$1F,$9D  ; $B68C
    .byte $E0,$04,$FE,$10,$01,$BD,$10,$01,$C9,$01,$D0,$24,$DE,$E0,$04,$D0  ; $B69C
    .byte $28,$18,$BD,$60,$06,$49,$FF,$69,$01,$9D,$60,$06,$BD,$40,$06,$49  ; $B6AC
    .byte $FF,$69,$00,$9D,$40,$06,$FE,$10,$01,$A9,$1F,$9D,$E0,$04,$D0,$09  ; $B6BC
    .byte $DE,$E0,$04,$D0,$04,$5E,$20,$04,$60,$20,$BA,$EE,$60,$00,$41,$82  ; $B6CC
    .byte $C4,$06,$00,$00,$00,$00,$01,$BD,$10,$01,$D0,$1D,$DE,$E0,$04,$D0  ; $B6DC
    .byte $2F,$FE,$10,$01,$A9,$1F,$9D,$E0,$04,$A9,$00,$9D,$00,$06,$9D,$20  ; $B6EC
    .byte $06,$9D,$40,$06,$9D,$60,$06,$F0,$17,$C9,$01,$D0,$13,$DE,$E0,$04  ; $B6FC
    .byte $D0,$0E,$FE,$10,$01,$A9,$00,$85,$08,$A9,$04,$85,$09,$20,$97,$F1  ; $B70C
    .byte $20,$BA,$EE,$60,$BD,$40,$06,$08,$A9,$07,$85,$00,$A9,$08,$85,$02  ; $B71C
    .byte $20,$CF,$F0,$28,$10,$0E,$A5,$00,$F0,$0A,$A9,$03,$9D,$40,$06,$A9  ; $B72C
    .byte $76,$9D,$60,$06,$A5,$03,$F0,$03,$5E,$20,$04,$20,$BA,$EE,$60,$BD  ; $B73C
    .byte $E0,$04,$F0,$13,$DE,$E0,$04,$D0,$0E,$A9,$00,$9D,$00,$06,$9D,$20  ; $B74C
    .byte $06,$9D,$60,$06,$9D,$40,$06,$20,$BA,$EE,$60,$BD,$E0,$04,$D0,$3A  ; $B75C
    .byte $A9,$00,$9D,$A0,$06,$9D,$80,$06,$A9,$07,$85,$01,$A9,$08,$85,$02  ; $B76C
    .byte $20,$2C,$F0,$A5,$00,$D0,$03,$4C,$08,$B8,$A9,$00,$9D,$20,$06,$9D  ; $B77C
    .byte $00,$06,$9D,$60,$06,$9D,$40,$06,$FE,$A0,$06,$A9,$2E,$20,$51,$C0  ; $B78C
    .byte $A9,$1F,$9D,$10,$01,$FE,$E0,$04,$D0,$62,$C9,$01,$D0,$0D,$DE,$10  ; $B79C
    .byte $01,$D0,$59,$FE,$E0,$04,$A9,$38,$9D,$10,$01,$BD,$10,$01,$29,$07  ; $B7AC
    .byte $D0,$3F,$A9,$2B,$20,$51,$C0,$BD,$10,$01,$4A,$29,$0C,$85,$02,$A2  ; $B7BC
    .byte $04,$85,$01,$A9,$5F,$20,$59,$F1,$B0,$27,$A6,$02,$18,$B9,$B0,$04  ; $B7CC
    .byte $7D,$1F,$E1,$99,$B0,$04,$18,$B9,$70,$04,$7D,$2F,$E1,$99,$70,$04  ; $B7DC
    .byte $B9,$50,$04,$7D,$3F,$E1,$99,$50,$04,$A6,$2B,$E6,$02,$C6,$01,$D0  ; $B7EC
    .byte $D2,$A6,$2B,$DE,$10,$01,$10,$04,$5E,$20,$04,$60,$BD,$A0,$06,$C9  ; $B7FC
    .byte $04,$D0,$05,$A9,$02,$9D,$A0,$06,$20,$BA,$EE,$60,$BD,$E0,$04,$D0  ; $B80C
    .byte $09,$A9,$00,$9D,$80,$06,$20,$BA,$EE,$60,$BD,$A0,$06,$1D,$80,$06  ; $B81C
    .byte $D0,$12,$BD,$20,$04,$49,$40,$9D,$20,$04,$A9,$FE,$9D,$40,$06,$A9  ; $B82C
    .byte $00,$9D,$60,$06,$18,$BD,$60,$06,$69,$20,$9D,$60,$06,$BD,$40,$06  ; $B83C
    .byte $69,$00,$9D,$40,$06,$20,$BA,$EE,$60,$A5,$2A,$C9,$08,$F0,$15,$A9  ; $B84C
    .byte $58,$9D,$50,$01,$38,$BD,$A0,$04,$E9,$18,$9D,$60,$01,$A5,$AA,$D0  ; $B85C
    .byte $20,$4C,$7A,$B9,$A9,$10,$9D,$50,$01,$38,$BD,$A0,$04,$E9,$08,$9D  ; $B86C
    .byte $60,$01,$A5,$AA,$D0,$0B,$20,$BA,$EE,$90,$05,$A9,$00,$9D,$50,$01  ; $B87C
    .byte $60,$20,$B3,$EF,$60,$BD,$E0,$04,$10,$01,$60,$D0,$57,$A5,$15,$85  ; $B88C
    .byte $14,$E6,$38,$A9,$07,$9D,$C0,$06,$A9,$08,$85,$B3,$A9,$01,$85,$B1  ; $B89C
    .byte $A9,$17,$8D,$B6,$03,$A9,$E0,$8D,$B7,$03,$A9,$00,$8D,$E1,$04,$8D  ; $B8AC
    .byte $C1,$06,$8D,$A9,$05,$85,$B2,$A9,$B8,$8D,$A7,$05,$A9,$0F,$A2,$0F  ; $B8BC
    .byte $9D,$56,$03,$CA,$10,$FA,$A6,$2B,$FE,$E0,$04,$A9,$18,$9D,$10,$01  ; $B8CC
    .byte $A9,$63,$85,$00,$A0,$0F,$20,$14,$F0,$B0,$08,$A9,$01,$99,$10,$06  ; $B8DC
    .byte $88,$10,$F3,$60,$A9,$01,$85,$40,$A9,$00,$85,$AF,$A9,$00,$85,$4F  ; $B8EC
    .byte $A9,$01,$85,$50,$BD,$E0,$04,$C9,$01,$D0,$20,$DE,$10,$01,$D0,$42  ; $B8FC
    .byte $A9,$40,$9D,$10,$01,$A9,$63,$20,$59,$F1,$A9,$01,$99,$10,$06,$99  ; $B90C
    .byte $F0,$04,$DE,$C0,$06,$D0,$2B,$FE,$E0,$04,$60,$DE,$10,$01,$D0,$22  ; $B91C
    .byte $BC,$C0,$06,$B9,$71,$B9,$9D,$10,$01,$30,$18,$B9,$76,$B9,$85,$02  ; $B92C
    .byte $A9,$63,$20,$59,$F1,$A5,$02,$99,$B0,$04,$A9,$01,$99,$10,$06,$FE  ; $B93C
    .byte $C0,$06,$60,$A9,$63,$85,$00,$A0,$0F,$20,$14,$F0,$B0,$08,$A9,$00  ; $B94C
    .byte $99,$10,$06,$88,$10,$F3,$A6,$2B,$A9,$FF,$9D,$E0,$04,$E6,$B1,$A9  ; $B95C
    .byte $0B,$20,$51,$C0,$60,$40,$01,$20,$28,$FF,$98,$98,$48,$78,$AD,$41  ; $B96C
    .byte $06,$9D,$40,$06,$AD,$61,$06,$9D,$60,$06,$AD,$01,$06,$9D,$00,$06  ; $B97C
    .byte $AD,$21,$06,$9D,$20,$06,$AD,$A7,$05,$9D,$20,$04,$20,$BA,$EE,$A5  ; $B98C
    .byte $B3,$C9,$08,$F0,$10,$BD,$00,$04,$C9,$69,$F0,$09,$BD,$20,$04,$09  ; $B99C
    .byte $23,$9D,$20,$04,$60,$A9,$8B,$9D,$20,$04,$60,$A9,$00,$9D,$A0,$06  ; $B9AC
    .byte $AD,$A7,$05,$29,$40,$F0,$03,$FE,$A0,$06,$A9,$00,$9D,$80,$06,$4C  ; $B9BC
    .byte $7A,$B9,$A5,$2A,$C9,$08,$F0,$03,$4C,$7A,$B9,$20,$BA,$EE,$BD,$A0  ; $B9CC
    .byte $04,$C9,$80,$D0,$14,$A9,$00,$9D,$40,$06,$BD,$A0,$06,$1D,$80,$06  ; $B9DC
    .byte $D0,$06,$EE,$E1,$04,$5E,$20,$04,$60,$A9,$00,$9D,$A0,$06,$9D,$80  ; $B9EC
    .byte $06,$60,$BD,$E0,$04,$D0,$13,$A9,$80,$9D,$60,$06,$A9,$FF,$9D,$40  ; $B9FC
    .byte $06,$BD,$A0,$04,$C9,$7F,$90,$1B,$B0,$11,$A9,$80,$9D,$60,$06,$A9  ; $BA0C
    .byte $00,$9D,$40,$06,$BD,$A0,$04,$C9,$68,$B0,$08,$A9,$00,$9D,$40,$06  ; $BA1C
    .byte $9D,$60,$06,$4C,$86,$B9,$BD,$A0,$06,$D0,$2F,$9D,$80,$06,$DE,$10  ; $BA2C
    .byte $01,$D0,$23,$BD,$20,$04,$29,$40,$D0,$04,$5E,$20,$04,$60,$18,$BD  ; $BA3C
    .byte $60,$04,$69,$08,$9D,$60,$04,$FE,$A0,$06,$A9,$01,$9D,$60,$01,$A9  ; $BA4C
    .byte $0F,$9D,$10,$01,$D0,$04,$20,$BA,$EE,$60,$BD,$60,$01,$D0,$25,$DE  ; $BA5C
    .byte $10,$01,$F0,$16,$BD,$60,$04,$C9,$30,$90,$0F,$C9,$D0,$B0,$0B,$BD  ; $BA6C
    .byte $A0,$04,$C9,$30,$90,$04,$C9,$C0,$90,$42,$A9,$01,$9D,$60,$01,$A9  ; $BA7C
    .byte $3E,$9D,$10,$01,$A9,$00,$9D,$00,$06,$9D,$20,$06,$9D,$60,$06,$9D  ; $BA8C
    .byte $40,$06,$DE,$10,$01,$D0,$25,$A9,$83,$9D,$20,$04,$A9,$01,$9D,$E0  ; $BA9C
    .byte $06,$A9,$00,$9D,$60,$01,$BC,$E0,$04,$B9,$E3,$BA,$9D,$10,$01,$B9  ; $BAAC
    .byte $E7,$BA,$85,$08,$B9,$EB,$BA,$85,$09,$20,$97,$F1,$BD,$A0,$06,$C9  ; $BABC
    .byte $06,$D0,$05,$A9,$04,$9D,$A0,$06,$20,$BA,$EE,$90,$09,$38,$AD,$C1  ; $BACC
    .byte $06,$E9,$02,$8D,$C1,$06,$60,$3E,$1F,$1F,$1F,$00,$68,$00,$80,$01  ; $BADC
    .byte $01,$02,$02,$A5,$B1,$C9,$04,$B0,$15,$18,$BD,$60,$06,$69,$40,$9D  ; $BAEC
    .byte $60,$06,$BD,$40,$06,$69,$00,$9D,$40,$06,$20,$BA,$EE,$60,$A9,$07  ; $BAFC
    .byte $85,$01,$A9,$08,$85,$02,$20,$2C,$F0,$A5,$00,$F0,$ED,$A9,$04,$9D  ; $BB0C
    .byte $40,$06,$A9,$78,$9D,$60,$06,$D0,$E1,$38,$BD,$20,$06,$E9,$01,$9D  ; $BB1C
    .byte $20,$06,$A8,$BD,$00,$06,$E9,$00,$9D,$00,$06,$D0,$3D,$C0,$00,$F0  ; $BB2C
    .byte $0F,$C0,$3E,$B0,$35,$BD,$A0,$06,$C9,$06,$D0,$3A,$A9,$04,$D0,$33  ; $BB3C
    .byte $A9,$77,$9D,$20,$06,$A9,$01,$9D,$00,$06,$A9,$6E,$A2,$01,$20,$59  ; $BB4C
    .byte $F1,$B0,$17,$8A,$48,$98,$69,$10,$AA,$86,$2B,$A9,$08,$85,$09,$A9  ; $BB5C
    .byte $00,$85,$08,$20,$97,$F1,$68,$AA,$86,$2B,$BD,$A0,$06,$C9,$04,$D0  ; $BB6C
    .byte $05,$A9,$00,$9D,$A0,$06,$20,$B3,$EF,$90,$10,$38,$AD,$C1,$06,$E9  ; $BB7C
    .byte $06,$8D,$C1,$06,$B0,$05,$A9,$00,$8D,$C1,$06,$60,$A9,$00,$9D,$80  ; $BB8C
    .byte $06,$BC,$A0,$06,$18,$BD,$60,$04,$79,$AB,$BB,$9D,$60,$04,$60,$03  ; $BB9C
    .byte $02,$20,$EE,$EF,$BD,$E0,$04,$D0,$22,$A5,$00,$C9,$38,$B0,$18,$A5  ; $BBAC
    .byte $4A,$85,$01,$A9,$03,$85,$02,$20,$4E,$C8,$A4,$04,$A6,$2B,$B9,$2D  ; $BBBC
    .byte $BC,$9D,$10,$01,$FE,$E0,$04,$20,$B3,$EF,$60,$C9,$02,$B0,$22,$A5  ; $BBCC
    .byte $00,$C9,$38,$90,$05,$DE,$E0,$04,$F0,$ED,$DE,$10,$01,$D0,$E8,$A9  ; $BBDC
    .byte $02,$9D,$40,$06,$A9,$00,$9D,$60,$06,$A9,$83,$9D,$20,$04,$FE,$E0  ; $BBEC
    .byte $04,$BD,$40,$06,$10,$13,$BD,$A0,$04,$C9,$E0,$90,$20,$A9,$00,$9D  ; $BBFC
    .byte $E0,$04,$A9,$A0,$9D,$20,$04,$D0,$14,$BD,$A0,$04,$C9,$80,$B0,$0D  ; $BC0C
    .byte $A9,$FF,$9D,$60,$06,$9D,$40,$06,$A9,$87,$9D,$20,$04,$20,$BA,$EE  ; $BC1C
    .byte $60,$1F,$2E,$7D,$BD,$E0,$04,$C9,$3E,$D0,$2F,$BD,$A0,$06,$C9,$05  ; $BC2C
    .byte $D0,$37,$BD,$80,$06,$D0,$32,$A9,$74,$20,$59,$F1,$B0,$17,$BD,$00  ; $BC3C
    .byte $04,$99,$F0,$04,$18,$B9,$B0,$04,$69,$04,$99,$B0,$04,$A9,$FF,$99  ; $BC4C
    .byte $50,$06,$99,$70,$06,$A9,$00,$9D,$E0,$04,$FE,$E0,$04,$BD,$A0,$06  ; $BC5C
    .byte $C9,$02,$D0,$05,$A9,$00,$9D,$A0,$06,$20,$B3,$EF,$60,$BD,$A0,$06  ; $BC6C
    .byte $F0,$04,$20,$B3,$EF,$60,$A9,$00,$9D,$80,$06,$A9,$03,$85,$01,$A9  ; $BC7C
    .byte $04,$85,$02,$20,$2C,$F0,$A5,$00,$F0,$0D,$BC,$E0,$04,$B9,$35,$BC  ; $BC8C
    .byte $20,$51,$C0,$FE,$A0,$06,$60,$20,$BA,$EE,$60,$3D,$3E  ; $BC9C
    LDA #$07                     ; $BCA9  A9 07
    STA $01                      ; $BCAB  85 01
    LDY #$08                     ; $BCAD  A0 08
    BNE loc_1D_BCB7              ; $BCAF  D0 06
    LDA #$03                     ; $BCB1  A9 03
    STA $01                      ; $BCB3  85 01
    LDY #$04                     ; $BCB5  A0 04

loc_1D_BCB7:
    LDA $0420,X                  ; $BCB7  BD 20 04
    CMP #$81                     ; $BCBA  C9 81
    BEQ loc_1D_BCF2              ; $BCBC  F0 34
    LDA $01                      ; $BCBE  A5 01
    PHA                          ; $BCC0  48
    TYA                          ; $BCC1  98
    PHA                          ; $BCC2  48
    JSR sub_1F_EEBA              ; $BCC3  20 BA EE
    PLA                          ; $BCC6  68
    STA $02                      ; $BCC7  85 02
    PLA                          ; $BCC9  68
    STA $01                      ; $BCCA  85 01
    LDA $0420,X                  ; $BCCC  BD 20 04
    BPL loc_1D_BCF1              ; $BCCF  10 20
    LDA $0640,X                  ; $BCD1  BD 40 06
    PHP                          ; $BCD4  08
    JSR sub_1F_F0CF              ; $BCD5  20 CF F0
    PLP                          ; $BCD8  28
    BPL loc_1D_BCF1              ; $BCD9  10 16
    LDA $00                      ; $BCDB  A5 00
    BEQ loc_1D_BCF1              ; $BCDD  F0 12
    LDA #$FA                     ; $BCDF  A9 FA
    STA $0110,X                  ; $BCE1  9D 10 01
    LDA #$00                     ; $BCE4  A9 00
    STA $0640,X                  ; $BCE6  9D 40 06
    STA $0660,X                  ; $BCE9  9D 60 06
    LDA #$81                     ; $BCEC  A9 81
    STA $0420,X                  ; $BCEE  9D 20 04

loc_1D_BCF1:
    RTS                          ; $BCF1  60


loc_1D_BCF2:
    LDA $04E0,X                  ; $BCF2  BD E0 04
    BEQ loc_1D_BD04              ; $BCF5  F0 0D
    DEC $0110,X                  ; $BCF7  DE 10 01
    BNE loc_1D_BD00              ; $BCFA  D0 04
    LSR $0420,X                  ; $BCFC  5E 20 04
    RTS                          ; $BCFF  60


loc_1D_BD00:
    JSR sub_1F_EFB3              ; $BD00  20 B3 EF
    RTS                          ; $BD03  60


loc_1D_BD04:
    JSR sub_1F_EFAF              ; $BD04  20 AF EF
    RTS                          ; $BD07  60

    .byte $A0,$25,$A5,$1C,$29,$08,$D0,$02,$A0,$0F,$8C,$71,$03,$20,$B3,$EF  ; $BD08
    .byte $A5,$01,$F0,$07,$8A,$29,$0F,$85,$BA,$E6,$BA,$60,$FF,$FF,$FF,$FF  ; $BD18
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BD28
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BD38
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BD48
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BD58
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BD68
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BD78
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BD88
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BD98
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BDA8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BDB8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BDC8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BDD8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BDE8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BDF8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BE08
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BE18
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BE28
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BE38
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BE48
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BE58
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BE68
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BE78
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BE88
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BE98
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BEA8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BEB8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BEC8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BED8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BEE8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BEF8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF08
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF18
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF28
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF38
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF48
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF58
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF68
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF78
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF88
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BF98
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BFA8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BFB8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BFC8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$78,$EE,$E1,$BF,$4C,$D1,$F2,$FF  ; $BFD8
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $BFE8
    .byte $FF,$FF,$F0,$CF,$E0,$FF,$E0,$FF  ; $BFF8
