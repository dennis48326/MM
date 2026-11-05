; PRG 8 KB bank $39 at $8000
.segment "BANK39"
.org $8000

    JMP loc_39_800C              ; $8000  4C 0C 80

    JMP loc_39_8C7C              ; $8003  4C 7C 8C

    JMP sub_39_85AD              ; $8006  4C AD 85

    .byte $4C,$28,$9A  ; $8009

loc_39_800C:
    LDA #$10                     ; $800C  A9 10
    STA $22                      ; $800E  85 22
    ORA #$20                     ; $8010  09 20
    STA $F6                      ; $8012  85 F6
    JSR sub_3F_FF37              ; $8014  20 37 FF
    LDA #$03                     ; $8017  A9 03
    STA $10                      ; $8019  85 10
    LDA #$04                     ; $801B  A9 04
    STA $2A                      ; $801D  85 2A
    JSR sub_39_8495              ; $801F  20 95 84
    LDX #$78                     ; $8022  A2 78
    JSR sub_3F_FF15              ; $8024  20 15 FF
    LDA #$00                     ; $8027  A9 00
    STA $10                      ; $8029  85 10
    LDA #$01                     ; $802B  A9 01
    STA $2A                      ; $802D  85 2A
    JSR sub_39_8495              ; $802F  20 95 84
    LDX #$78                     ; $8032  A2 78
    JSR sub_3F_FF15              ; $8034  20 15 FF

loc_39_8037:
    JSR sub_3F_FDCD              ; $8037  20 CD FD
    LDA #$01                     ; $803A  A9 01
    STA $10                      ; $803C  85 10
    LDA #$02                     ; $803E  A9 02
    STA $2A                      ; $8040  85 2A
    JSR sub_39_8495              ; $8042  20 95 84
    LDA #$B0                     ; $8045  A9 B0
    STA $10                      ; $8047  85 10
    LDA #$04                     ; $8049  A9 04
    STA $11                      ; $804B  85 11

loc_39_804D:
    LDA $14                      ; $804D  A5 14
    AND #$90                     ; $804F  29 90
    BNE loc_39_808C              ; $8051  D0 39
    LDA $14                      ; $8053  A5 14
    AND #$2C                     ; $8055  29 2C
    BEQ loc_39_8070              ; $8057  F0 17
    LDA #$2E                     ; $8059  A9 2E
    JSR sub_3F_F6BE              ; $805B  20 BE F6
    LDA $0200                    ; $805E  AD 00 02
    CLC                          ; $8061  18
    ADC #$10                     ; $8062  69 10
    STA $0200                    ; $8064  8D 00 02
    CMP #$B7                     ; $8067  C9 B7
    BNE loc_39_8070              ; $8069  D0 05
    LDA #$97                     ; $806B  A9 97
    STA $0200                    ; $806D  8D 00 02

loc_39_8070:
    JSR sub_3F_FF1C              ; $8070  20 1C FF
    LDA $10                      ; $8073  A5 10
    SEC                          ; $8075  38
    SBC #$01                     ; $8076  E9 01
    STA $10                      ; $8078  85 10
    LDA $11                      ; $807A  A5 11
    SBC #$00                     ; $807C  E9 00
    STA $11                      ; $807E  85 11
    ORA $10                      ; $8080  05 10
    BNE loc_39_804D              ; $8082  D0 C9
    LDA #$F0                     ; $8084  A9 F0
    JSR sub_3F_F6BC              ; $8086  20 BC F6
    JMP loc_39_8037              ; $8089  4C 37 80


loc_39_808C:
    LDA #$2A                     ; $808C  A9 2A
    JSR sub_3F_F6BE              ; $808E  20 BE F6
    LDA $0200                    ; $8091  AD 00 02
    CMP #$97                     ; $8094  C9 97
    BEQ loc_39_809D              ; $8096  F0 05
    LDA #$00                     ; $8098  A9 00
    JMP loc_39_9672              ; $809A  4C 72 96


loc_39_809D:
    LDA #$02                     ; $809D  A9 02
    STA $10                      ; $809F  85 10
    LDA #$00                     ; $80A1  A9 00
    STA $2A                      ; $80A3  85 2A
    JSR sub_39_8495              ; $80A5  20 95 84
    LDA #$01                     ; $80A8  A9 01
    STA $10                      ; $80AA  85 10
    LDA #$03                     ; $80AC  A9 03
    STA $11                      ; $80AE  85 11
    LDA #$00                     ; $80B0  A9 00
    STA $95                      ; $80B2  85 95
    JSR sub_39_82FF              ; $80B4  20 FF 82

loc_39_80B7:
    LDA $14                      ; $80B7  A5 14
    AND #$90                     ; $80B9  29 90
    BNE loc_39_80D2              ; $80BB  D0 15
    JSR sub_39_8237              ; $80BD  20 37 82

loc_39_80C0:
    LDA $10                      ; $80C0  A5 10
    PHA                          ; $80C2  48
    LDA $11                      ; $80C3  A5 11
    PHA                          ; $80C5  48
    JSR sub_3F_FF1C              ; $80C6  20 1C FF
    PLA                          ; $80C9  68
    STA $11                      ; $80CA  85 11
    PLA                          ; $80CC  68
    STA $10                      ; $80CD  85 10
    JMP loc_39_80B7              ; $80CF  4C B7 80


loc_39_80D2:
    LDA $10                      ; $80D2  A5 10
    CLC                          ; $80D4  18
    ADC $11                      ; $80D5  65 11
    TAY                          ; $80D7  A8
    LDA $8870,Y                  ; $80D8  B9 70 88
    BMI loc_39_80C0              ; $80DB  30 E3
    CMP #$08                     ; $80DD  C9 08
    BNE loc_39_80E7              ; $80DF  D0 06
    LDY $A9                      ; $80E1  A4 A9
    CPY #$FF                     ; $80E3  C0 FF
    BNE loc_39_80C0              ; $80E5  D0 D9

loc_39_80E7:
    STA $22                      ; $80E7  85 22
    LDA #$2A                     ; $80E9  A9 2A
    JSR sub_3F_F6BE              ; $80EB  20 BE F6
    LDA $22                      ; $80EE  A5 22
    CMP #$08                     ; $80F0  C9 08
    BCS loc_39_80FE              ; $80F2  B0 0A
    JSR sub_39_8F93              ; $80F4  20 93 8F
    LDA #$00                     ; $80F7  A9 00
    STA $2A                      ; $80F9  85 2A
    STA $24                      ; $80FB  85 24
    RTS                          ; $80FD  60


loc_39_80FE:
    LDA $AA                      ; $80FE  A5 AA
    CMP #$0F                     ; $8100  C9 0F
    BCC loc_39_8107              ; $8102  90 03
    JMP loc_39_83E8              ; $8104  4C E8 83


loc_39_8107:
    JSR sub_3E_C457              ; $8107  20 57 C4
    LDA #$04                     ; $810A  A9 04
    STA $97                      ; $810C  85 97
    JSR sub_3E_C421              ; $810E  20 21 C4
    JSR sub_3F_FF1C              ; $8111  20 1C FF
    JSR sub_3E_C369              ; $8114  20 69 C3
    LDX #$3E                     ; $8117  A2 3E
    JSR sub_3E_DA05              ; $8119  20 05 DA
    JSR sub_3E_C373              ; $811C  20 73 C3
    LDA #$12                     ; $811F  A9 12
    STA $22                      ; $8121  85 22
    LDA #$00                     ; $8123  A9 00
    STA $2A                      ; $8125  85 2A
    STA $24                      ; $8127  85 24

loc_39_8129:
    JSR sub_3E_CFB1              ; $8129  20 B1 CF
    JSR sub_3F_FF1C              ; $812C  20 1C FF
    INC $24                      ; $812F  E6 24
    LDA $24                      ; $8131  A5 24
    AND #$1F                     ; $8133  29 1F
    STA $24                      ; $8135  85 24
    BNE loc_39_8129              ; $8137  D0 F0
    LDY #$A0                     ; $8139  A0 A0

loc_39_813B:
    LDA $88F7,Y                  ; $813B  B9 F7 88
    STA $01FF,Y                  ; $813E  99 FF 01
    DEY                          ; $8141  88
    BNE loc_39_813B              ; $8142  D0 F7
    LDA #$00                     ; $8144  A9 00
    STA $95                      ; $8146  85 95
    LDA #$F0                     ; $8148  A9 F0
    JSR sub_3F_F6BC              ; $814A  20 BC F6

loc_39_814D:
    LDX #$00                     ; $814D  A2 00
    LDY #$00                     ; $814F  A0 00
    LDA $95                      ; $8151  A5 95
    AND #$1F                     ; $8153  29 1F
    CMP #$03                     ; $8155  C9 03
    BCS loc_39_8164              ; $8157  B0 0B
    CMP #$00                     ; $8159  C9 00
    BNE loc_39_8162              ; $815B  D0 05
    LDA #$1C                     ; $815D  A9 1C
    JSR sub_3F_F6BE              ; $815F  20 BE F6

loc_39_8162:
    LDY #$10                     ; $8162  A0 10

loc_39_8164:
    LDA $87EE,Y                  ; $8164  B9 EE 87
    STA $0600,X                  ; $8167  9D 00 06
    STA $0604,X                  ; $816A  9D 04 06
    LDA $87F2,Y                  ; $816D  B9 F2 87
    STA $0608,X                  ; $8170  9D 08 06
    STA $060C,X                  ; $8173  9D 0C 06
    LDA $87F6,Y                  ; $8176  B9 F6 87
    STA $0610,X                  ; $8179  9D 10 06
    STA $0614,X                  ; $817C  9D 14 06
    LDA $87FA,Y                  ; $817F  B9 FA 87
    STA $0618,X                  ; $8182  9D 18 06
    STA $061C,X                  ; $8185  9D 1C 06
    INY                          ; $8188  C8
    INX                          ; $8189  E8
    CPX #$04                     ; $818A  E0 04
    BNE loc_39_8164              ; $818C  D0 D6
    LDA #$FF                     ; $818E  A9 FF
    STA $18                      ; $8190  85 18
    JSR sub_3F_FF1C              ; $8192  20 1C FF
    INC $95                      ; $8195  E6 95
    LDA $95                      ; $8197  A5 95
    CMP #$60                     ; $8199  C9 60
    BNE loc_39_814D              ; $819B  D0 B0
    LDY #$1F                     ; $819D  A0 1F

loc_39_819F:
    LDA $87CE,Y                  ; $819F  B9 CE 87
    STA $0620,Y                  ; $81A2  99 20 06
    DEY                          ; $81A5  88
    BPL loc_39_819F              ; $81A6  10 F7
    LDY #$30                     ; $81A8  A0 30
    LDA #$F8                     ; $81AA  A9 F8

loc_39_81AC:
    STA $0200,Y                  ; $81AC  99 00 02
    INY                          ; $81AF  C8
    INY                          ; $81B0  C8
    INY                          ; $81B1  C8
    INY                          ; $81B2  C8
    BNE loc_39_81AC              ; $81B3  D0 F7
    JSR sub_3E_C451              ; $81B5  20 51 C4
    LDA #$3C                     ; $81B8  A9 3C
    JSR sub_3F_F6BC              ; $81BA  20 BC F6
    LDX #$00                     ; $81BD  A2 00
    JSR sub_3F_FF15              ; $81BF  20 15 FF
    LDX #$00                     ; $81C2  A2 00
    JSR sub_3F_FF15              ; $81C4  20 15 FF
    JSR sub_39_821A              ; $81C7  20 1A 82
    LDY #$0F                     ; $81CA  A0 0F

loc_39_81CC:
    LDA $87AE,Y                  ; $81CC  B9 AE 87
    STA $0600,Y                  ; $81CF  99 00 06
    STA $0620,Y                  ; $81D2  99 20 06
    CPY #$08                     ; $81D5  C0 08
    BCS loc_39_81DF              ; $81D7  B0 06
    STA $0610,Y                  ; $81D9  99 10 06
    STA $0630,Y                  ; $81DC  99 30 06

loc_39_81DF:
    DEY                          ; $81DF  88
    BPL loc_39_81CC              ; $81E0  10 EA
    STY $18                      ; $81E2  84 18
    LDY #$20                     ; $81E4  A0 20

loc_39_81E6:
    LDA $8997,Y                  ; $81E6  B9 97 89
    STA $022F,Y                  ; $81E9  99 2F 02
    DEY                          ; $81EC  88
    BNE loc_39_81E6              ; $81ED  D0 F7
    LDA #$50                     ; $81EF  A9 50
    STA $97                      ; $81F1  85 97
    LDA $AA                      ; $81F3  A5 AA
    AND #$0F                     ; $81F5  29 0F
    STA $03                      ; $81F7  85 03
    LDY #$00                     ; $81F9  A0 00
    JSR sub_39_8627              ; $81FB  20 27 86
    LDX #$B4                     ; $81FE  A2 B4
    JSR sub_39_86B7              ; $8200  20 B7 86
    LDA $02                      ; $8203  A5 02
    TAY                          ; $8205  A8
    CLC                          ; $8206  18
    ADC #$08                     ; $8207  69 08
    STA $22                      ; $8209  85 22
    JSR sub_39_866B              ; $820B  20 6B 86
    LDX #$F0                     ; $820E  A2 F0
    JSR sub_39_86B7              ; $8210  20 B7 86
    LDA #$00                     ; $8213  A9 00
    STA $2A                      ; $8215  85 2A
    STA $24                      ; $8217  85 24
    RTS                          ; $8219  60


sub_39_821A:
    LDA #$06                     ; $821A  A9 06
    STA $95                      ; $821C  85 95

loc_39_821E:
    LDA $95                      ; $821E  A5 95
    AND #$01                     ; $8220  29 01
    TAY                          ; $8222  A8
    LDA $889F,Y                  ; $8223  B9 9F 88
    STA $0610                    ; $8226  8D 10 06
    LDA #$FF                     ; $8229  A9 FF
    STA $18                      ; $822B  85 18
    LDX #$0A                     ; $822D  A2 0A
    JSR sub_3F_FF15              ; $822F  20 15 FF
    DEC $95                      ; $8232  C6 95
    BNE loc_39_821E              ; $8234  D0 E8
    RTS                          ; $8236  60


sub_39_8237:
    LDA $14                      ; $8237  A5 14
    AND #$03                     ; $8239  29 03
    BEQ loc_39_8259              ; $823B  F0 1C
    AND #$01                     ; $823D  29 01
    BEQ loc_39_824F              ; $823F  F0 0E
    INC $10                      ; $8241  E6 10
    LDA $10                      ; $8243  A5 10
    CMP #$03                     ; $8245  C9 03
    BNE loc_39_8281              ; $8247  D0 38
    LDA #$00                     ; $8249  A9 00
    STA $10                      ; $824B  85 10
    BEQ loc_39_8281              ; $824D  F0 32

loc_39_824F:
    DEC $10                      ; $824F  C6 10
    BPL loc_39_8281              ; $8251  10 2E
    LDA #$02                     ; $8253  A9 02
    STA $10                      ; $8255  85 10
    BNE loc_39_8281              ; $8257  D0 28

loc_39_8259:
    LDA $14                      ; $8259  A5 14
    AND #$0C                     ; $825B  29 0C
    BEQ loc_39_82BF              ; $825D  F0 60
    AND #$08                     ; $825F  29 08
    BEQ loc_39_8272              ; $8261  F0 0F
    LDA $11                      ; $8263  A5 11
    SEC                          ; $8265  38
    SBC #$03                     ; $8266  E9 03
    STA $11                      ; $8268  85 11
    BCS loc_39_8281              ; $826A  B0 15
    LDA #$06                     ; $826C  A9 06
    STA $11                      ; $826E  85 11
    BNE loc_39_8281              ; $8270  D0 0F

loc_39_8272:
    LDA $11                      ; $8272  A5 11
    CLC                          ; $8274  18
    ADC #$03                     ; $8275  69 03
    STA $11                      ; $8277  85 11
    CMP #$09                     ; $8279  C9 09
    BNE loc_39_8281              ; $827B  D0 04
    LDA #$00                     ; $827D  A9 00
    STA $11                      ; $827F  85 11

loc_39_8281:
    LDA $10                      ; $8281  A5 10
    CLC                          ; $8283  18
    ADC $11                      ; $8284  65 11
    TAX                          ; $8286  AA
    LDA $885E,X                  ; $8287  BD 5E 88
    STA $0200                    ; $828A  8D 00 02
    STA $0204                    ; $828D  8D 04 02
    STA $0208                    ; $8290  8D 08 02
    CLC                          ; $8293  18
    ADC #$28                     ; $8294  69 28
    STA $020C                    ; $8296  8D 0C 02
    STA $0210                    ; $8299  8D 10 02
    STA $0214                    ; $829C  8D 14 02
    LDA $8867,X                  ; $829F  BD 67 88
    STA $0203                    ; $82A2  8D 03 02
    STA $020F                    ; $82A5  8D 0F 02
    CLC                          ; $82A8  18
    ADC #$13                     ; $82A9  69 13
    STA $0207                    ; $82AB  8D 07 02
    STA $0213                    ; $82AE  8D 13 02
    CLC                          ; $82B1  18
    ADC #$13                     ; $82B2  69 13
    STA $020B                    ; $82B4  8D 0B 02
    STA $0217                    ; $82B7  8D 17 02
    LDA #$2E                     ; $82BA  A9 2E
    JSR sub_3F_F6BE              ; $82BC  20 BE F6

loc_39_82BF:
    LDA $92                      ; $82BF  A5 92
    AND #$08                     ; $82C1  29 08
    BEQ loc_39_82EA              ; $82C3  F0 25
    LDA $88C0                    ; $82C5  AD C0 88
    STA $0201                    ; $82C8  8D 01 02
    LDA $88C4                    ; $82CB  AD C4 88
    STA $0205                    ; $82CE  8D 05 02
    LDA $88C8                    ; $82D1  AD C8 88
    STA $0209                    ; $82D4  8D 09 02
    LDA $88CC                    ; $82D7  AD CC 88
    STA $020D                    ; $82DA  8D 0D 02
    LDA $88D0                    ; $82DD  AD D0 88
    STA $0211                    ; $82E0  8D 11 02
    LDA $88D4                    ; $82E3  AD D4 88
    STA $0215                    ; $82E6  8D 15 02
    RTS                          ; $82E9  60


loc_39_82EA:
    LDA #$15                     ; $82EA  A9 15
    STA $0201                    ; $82EC  8D 01 02
    STA $0205                    ; $82EF  8D 05 02
    STA $0209                    ; $82F2  8D 09 02
    STA $020D                    ; $82F5  8D 0D 02
    STA $0211                    ; $82F8  8D 11 02
    STA $0215                    ; $82FB  8D 15 02
    RTS                          ; $82FE  60


sub_39_82FF:
    LDA $A9                      ; $82FF  A5 A9
    CMP #$FF                     ; $8301  C9 FF
    BNE loc_39_833B              ; $8303  D0 36
    LDA $95                      ; $8305  A5 95
    LSR A                        ; $8307  4A
    LSR A                        ; $8308  4A
    AND #$01                     ; $8309  29 01
    TAY                          ; $830B  A8
    LDA $889F,Y                  ; $830C  B9 9F 88
    STA $0610                    ; $830F  8D 10 06
    LDA #$FF                     ; $8312  A9 FF
    STA $18                      ; $8314  85 18
    JSR sub_3F_FF1C              ; $8316  20 1C FF
    INC $95                      ; $8319  E6 95
    LDA $95                      ; $831B  A5 95
    CMP #$28                     ; $831D  C9 28
    BNE sub_39_82FF              ; $831F  D0 DE
    LDY #$20                     ; $8321  A0 20

loc_39_8323:
    LDA $88D7,Y                  ; $8323  B9 D7 88
    STA $021F,Y                  ; $8326  99 1F 02
    DEY                          ; $8329  88
    BNE loc_39_8323              ; $832A  D0 F7

loc_39_832C:
    LDA $887D,Y                  ; $832C  B9 7D 88
    STA $0780,Y                  ; $832F  99 80 07
    CMP #$FF                     ; $8332  C9 FF
    BEQ loc_39_8339              ; $8334  F0 03
    INY                          ; $8336  C8
    BNE loc_39_832C              ; $8337  D0 F3

loc_39_8339:
    STA $19                      ; $8339  85 19

loc_39_833B:
    RTS                          ; $833B  60


loc_39_833C:
    JSR sub_3E_C457              ; $833C  20 57 C4
    LDA #$04                     ; $833F  A9 04
    STA $97                      ; $8341  85 97
    JSR sub_3E_C421              ; $8343  20 21 C4
    JSR sub_3E_C438              ; $8346  20 38 C4
    JSR sub_39_85AD              ; $8349  20 AD 85
    JSR sub_3F_FF1C              ; $834C  20 1C FF
    JSR sub_3E_C369              ; $834F  20 69 C3
    LDX #$3E                     ; $8352  A2 3E
    JSR sub_3E_DA05              ; $8354  20 05 DA
    JSR sub_3E_C373              ; $8357  20 73 C3
    LDA #$12                     ; $835A  A9 12
    STA $22                      ; $835C  85 22
    LDA #$00                     ; $835E  A9 00
    STA $2A                      ; $8360  85 2A
    STA $24                      ; $8362  85 24

loc_39_8364:
    JSR sub_3E_CFB1              ; $8364  20 B1 CF
    JSR sub_3F_FF1C              ; $8367  20 1C FF
    INC $24                      ; $836A  E6 24
    LDA $24                      ; $836C  A5 24
    AND #$1F                     ; $836E  29 1F
    STA $24                      ; $8370  85 24
    BNE loc_39_8364              ; $8372  D0 F0
    LDY #$30                     ; $8374  A0 30

loc_39_8376:
    LDA $88F7,Y                  ; $8376  B9 F7 88
    STA $01FF,Y                  ; $8379  99 FF 01
    DEY                          ; $837C  88
    BNE loc_39_8376              ; $837D  D0 F7
    LDY #$1F                     ; $837F  A0 1F

loc_39_8381:
    LDA $87CE,Y                  ; $8381  B9 CE 87
    STA $0620,Y                  ; $8384  99 20 06
    DEY                          ; $8387  88
    BPL loc_39_8381              ; $8388  10 F7
    LDA #$3C                     ; $838A  A9 3C
    JSR sub_3F_F6BC              ; $838C  20 BC F6
    JSR sub_3F_FF1C              ; $838F  20 1C FF
    JSR sub_3E_C451              ; $8392  20 51 C4
    LDX #$00                     ; $8395  A2 00
    JSR sub_3F_FF15              ; $8397  20 15 FF
    LDX #$00                     ; $839A  A2 00
    JSR sub_3F_FF15              ; $839C  20 15 FF
    JSR sub_39_821A              ; $839F  20 1A 82
    LDY #$1F                     ; $83A2  A0 1F

loc_39_83A4:
    LDA $87AE,Y                  ; $83A4  B9 AE 87
    STA $0600,Y                  ; $83A7  99 00 06
    STA $0620,Y                  ; $83AA  99 20 06
    DEY                          ; $83AD  88
    BPL loc_39_83A4              ; $83AE  10 F4
    STY $18                      ; $83B0  84 18
    LDY #$20                     ; $83B2  A0 20

loc_39_83B4:
    LDA $8997,Y                  ; $83B4  B9 97 89
    STA $022F,Y                  ; $83B7  99 2F 02
    DEY                          ; $83BA  88
    BNE loc_39_83B4              ; $83BB  D0 F7
    LDA #$50                     ; $83BD  A9 50
    STA $97                      ; $83BF  85 97
    LDA $AA                      ; $83C1  A5 AA
    AND #$0F                     ; $83C3  29 0F
    STA $03                      ; $83C5  85 03
    LDY #$00                     ; $83C7  A0 00
    JSR sub_39_8627              ; $83C9  20 27 86
    LDX #$B4                     ; $83CC  A2 B4
    JSR sub_39_86B7              ; $83CE  20 B7 86
    LDA $02                      ; $83D1  A5 02
    TAY                          ; $83D3  A8
    CLC                          ; $83D4  18
    ADC #$08                     ; $83D5  69 08
    STA $22                      ; $83D7  85 22
    JSR sub_39_866B              ; $83D9  20 6B 86
    LDX #$B4                     ; $83DC  A2 B4
    JSR sub_39_86B7              ; $83DE  20 B7 86
    LDA #$00                     ; $83E1  A9 00
    STA $2A                      ; $83E3  85 2A
    STA $24                      ; $83E5  85 24
    RTS                          ; $83E7  60


loc_39_83E8:
    JSR sub_3E_C457              ; $83E8  20 57 C4
    LDA #$04                     ; $83EB  A9 04
    STA $97                      ; $83ED  85 97
    JSR sub_3E_C421              ; $83EF  20 21 C4
    JSR sub_3E_C438              ; $83F2  20 38 C4
    JSR sub_39_85AD              ; $83F5  20 AD 85
    JSR sub_3F_FF1C              ; $83F8  20 1C FF
    JSR sub_3E_C369              ; $83FB  20 69 C3
    LDX #$3F                     ; $83FE  A2 3F
    JSR sub_3E_DA05              ; $8400  20 05 DA
    JSR sub_3E_C373              ; $8403  20 73 C3
    LDA #$12                     ; $8406  A9 12
    STA $22                      ; $8408  85 22
    LDA #$02                     ; $840A  A9 02
    STA $2A                      ; $840C  85 2A
    LDA #$00                     ; $840E  A9 00
    STA $24                      ; $8410  85 24

loc_39_8412:
    JSR sub_3E_CFB1              ; $8412  20 B1 CF
    JSR sub_3F_FF1C              ; $8415  20 1C FF
    INC $24                      ; $8418  E6 24
    LDA $24                      ; $841A  A5 24
    AND #$1F                     ; $841C  29 1F
    STA $24                      ; $841E  85 24
    BNE loc_39_8412              ; $8420  D0 F0
    LDY #$1F                     ; $8422  A0 1F

loc_39_8424:
    LDA $880E,Y                  ; $8424  B9 0E 88
    STA $0620,Y                  ; $8427  99 20 06
    DEY                          ; $842A  88
    BPL loc_39_8424              ; $842B  10 F7
    LDA #$3B                     ; $842D  A9 3B
    JSR sub_3F_F6BC              ; $842F  20 BC F6
    JSR sub_3F_FF1C              ; $8432  20 1C FF
    JSR sub_3E_C451              ; $8435  20 51 C4
    LDA #$00                     ; $8438  A9 00
    JSR sub_3F_FF15              ; $843A  20 15 FF
    LDA #$00                     ; $843D  A9 00
    JSR sub_3F_FF15              ; $843F  20 15 FF
    JSR sub_39_821A              ; $8442  20 1A 82
    LDY #$1F                     ; $8445  A0 1F

loc_39_8447:
    LDA $882E,Y                  ; $8447  B9 2E 88
    STA $0600,Y                  ; $844A  99 00 06
    STA $0620,Y                  ; $844D  99 20 06
    DEY                          ; $8450  88
    BPL loc_39_8447              ; $8451  10 F4
    STY $18                      ; $8453  84 18
    LDY #$2C                     ; $8455  A0 2C
    LDA $AA                      ; $8457  A5 AA
    CMP #$7F                     ; $8459  C9 7F
    BEQ loc_39_845F              ; $845B  F0 02
    LDY #$1C                     ; $845D  A0 1C

loc_39_845F:
    LDA $89DF,Y                  ; $845F  B9 DF 89
    STA $0227,Y                  ; $8462  99 27 02
    DEY                          ; $8465  88
    BNE loc_39_845F              ; $8466  D0 F7
    LDA #$54                     ; $8468  A9 54
    STA $97                      ; $846A  85 97
    LDA $AA                      ; $846C  A5 AA
    LSR A                        ; $846E  4A
    LSR A                        ; $846F  4A
    LSR A                        ; $8470  4A
    LSR A                        ; $8471  4A
    STA $03                      ; $8472  85 03
    LDY #$04                     ; $8474  A0 04
    JSR sub_39_8627              ; $8476  20 27 86
    LDX #$B4                     ; $8479  A2 B4
    JSR sub_39_86B7              ; $847B  20 B7 86
    LDA $02                      ; $847E  A5 02
    TAY                          ; $8480  A8
    CLC                          ; $8481  18
    ADC #$08                     ; $8482  69 08
    STA $22                      ; $8484  85 22
    JSR sub_39_866B              ; $8486  20 6B 86
    LDX #$B4                     ; $8489  A2 B4
    JSR sub_39_86B7              ; $848B  20 B7 86
    LDA #$00                     ; $848E  A9 00
    STA $2A                      ; $8490  85 2A
    STA $24                      ; $8492  85 24
    RTS                          ; $8494  60


sub_39_8495:
    LDA $10                      ; $8495  A5 10
    PHA                          ; $8497  48
    JSR sub_3E_C457              ; $8498  20 57 C4
    LDA #$04                     ; $849B  A9 04
    STA $97                      ; $849D  85 97
    JSR sub_3E_C421              ; $849F  20 21 C4
    JSR sub_3F_FF1C              ; $84A2  20 1C FF
    PLA                          ; $84A5  68
    STA $10                      ; $84A6  85 10
    JSR sub_3E_C369              ; $84A8  20 69 C3
    LDY $10                      ; $84AB  A4 10
    LDX $884E,Y                  ; $84AD  BE 4E 88
    STX $22                      ; $84B0  86 22
    LDA $2A                      ; $84B2  A5 2A
    CMP #$04                     ; $84B4  C9 04
    BNE loc_39_84BA              ; $84B6  D0 02
    LDX #$55                     ; $84B8  A2 55

loc_39_84BA:
    JSR sub_3E_DA05              ; $84BA  20 05 DA
    JSR sub_3E_C373              ; $84BD  20 73 C3
    LDA $10                      ; $84C0  A5 10
    PHA                          ; $84C2  48
    JSR sub_39_85AD              ; $84C3  20 AD 85

loc_39_84C6:
    JSR sub_3E_CFB1              ; $84C6  20 B1 CF
    JSR sub_3F_FF1C              ; $84C9  20 1C FF
    INC $24                      ; $84CC  E6 24
    LDA $24                      ; $84CE  A5 24
    AND #$1F                     ; $84D0  29 1F
    STA $24                      ; $84D2  85 24
    BNE loc_39_84C6              ; $84D4  D0 F0
    PLA                          ; $84D6  68
    STA $10                      ; $84D7  85 10
    ASL A                        ; $84D9  0A
    ASL A                        ; $84DA  0A
    ASL A                        ; $84DB  0A
    ASL A                        ; $84DC  0A
    ASL A                        ; $84DD  0A
    TAY                          ; $84DE  A8
    LDX #$00                     ; $84DF  A2 00

loc_39_84E1:
    LDA $872E,Y                  ; $84E1  B9 2E 87
    STA $0620,X                  ; $84E4  9D 20 06
    INY                          ; $84E7  C8
    INX                          ; $84E8  E8
    CPX #$20                     ; $84E9  E0 20
    BNE loc_39_84E1              ; $84EB  D0 F4
    LDX $10                      ; $84ED  A6 10
    BNE loc_39_84F4              ; $84EF  D0 03
    JMP loc_39_8585              ; $84F1  4C 85 85


loc_39_84F4:
    LDA $8856,X                  ; $84F4  BD 56 88
    STA $00                      ; $84F7  85 00
    LDA $885A,X                  ; $84F9  BD 5A 88
    STA $01                      ; $84FC  85 01
    LDA $A9                      ; $84FE  A5 A9
    STA $02                      ; $8500  85 02
    LDY #$00                     ; $8502  A0 00

loc_39_8504:
    LDA ($00),Y                  ; $8504  B1 00
    CMP #$FF                     ; $8506  C9 FF
    BEQ loc_39_8510              ; $8508  F0 06
    STA $0200,Y                  ; $850A  99 00 02
    INY                          ; $850D  C8
    BNE loc_39_8504              ; $850E  D0 F4

loc_39_8510:
    STY $03                      ; $8510  84 03
    CPX #$02                     ; $8512  E0 02
    BNE loc_39_8585              ; $8514  D0 6F
    LDX #$00                     ; $8516  A2 00

loc_39_8518:
    LDA $8C4F,X                  ; $8518  BD 4F 8C
    STA $0780,X                  ; $851B  9D 80 07
    CMP #$FF                     ; $851E  C9 FF
    BEQ loc_39_8525              ; $8520  F0 03
    INX                          ; $8522  E8
    BNE loc_39_8518              ; $8523  D0 F3

loc_39_8525:
    LDA $A9                      ; $8525  A5 A9
    STA $02                      ; $8527  85 02
    LDX #$00                     ; $8529  A2 00
    STX $04                      ; $852B  86 04

loc_39_852D:
    LSR $02                      ; $852D  46 02
    BCC loc_39_855E              ; $852F  90 2D
    LDA $8C74,X                  ; $8531  BD 74 8C
    STA $0780                    ; $8534  8D 80 07
    STA $0787                    ; $8537  8D 87 07
    STA $078E                    ; $853A  8D 8E 07
    STA $0795                    ; $853D  8D 95 07
    CLC                          ; $8540  18
    LDA $8C6C,X                  ; $8541  BD 6C 8C
    STA $0781                    ; $8544  8D 81 07
    ADC #$20                     ; $8547  69 20
    STA $0788                    ; $8549  8D 88 07
    ADC #$20                     ; $854C  69 20
    STA $078F                    ; $854E  8D 8F 07
    ADC #$20                     ; $8551  69 20
    STA $0796                    ; $8553  8D 96 07
    INC $19                      ; $8556  E6 19
    JSR sub_3F_FF1C              ; $8558  20 1C FF
    JMP loc_39_857D              ; $855B  4C 7D 85


loc_39_855E:
    LDA $8C3F,X                  ; $855E  BD 3F 8C
    STA $00                      ; $8561  85 00
    LDA $8C47,X                  ; $8563  BD 47 8C
    STA $01                      ; $8566  85 01
    STX $04                      ; $8568  86 04
    LDY #$00                     ; $856A  A0 00
    LDX $03                      ; $856C  A6 03

loc_39_856E:
    LDA ($00),Y                  ; $856E  B1 00
    CMP #$FF                     ; $8570  C9 FF
    BEQ loc_39_857D              ; $8572  F0 09
    STA $0200,X                  ; $8574  9D 00 02
    INY                          ; $8577  C8
    INX                          ; $8578  E8
    STX $03                      ; $8579  86 03
    BNE loc_39_856E              ; $857B  D0 F1

loc_39_857D:
    INC $04                      ; $857D  E6 04
    LDX $04                      ; $857F  A6 04
    CPX #$08                     ; $8581  E0 08
    BNE loc_39_852D              ; $8583  D0 A8

loc_39_8585:
    LDX $10                      ; $8585  A6 10
    LDA $8879,X                  ; $8587  BD 79 88
    JSR sub_3F_F6BC              ; $858A  20 BC F6
    JSR sub_3F_FF1C              ; $858D  20 1C FF
    LDA $22                      ; $8590  A5 22
    CMP #$10                     ; $8592  C9 10
    BEQ loc_39_85AA              ; $8594  F0 14
    LDA $2A                      ; $8596  A5 2A
    CMP #$02                     ; $8598  C9 02
    BNE loc_39_85AA              ; $859A  D0 0E
    LDY #$1F                     ; $859C  A0 1F

loc_39_859E:
    LDA $0620,Y                  ; $859E  B9 20 06
    STA $0600,Y                  ; $85A1  99 00 06
    DEY                          ; $85A4  88
    BPL loc_39_859E              ; $85A5  10 F7
    STY $18                      ; $85A7  84 18
    RTS                          ; $85A9  60


loc_39_85AA:
    JMP sub_3E_C451              ; $85AA  4C 51 C4


sub_39_85AD:
    LDA #$00                     ; $85AD  A9 00
    STA $24                      ; $85AF  85 24
    STA $F9                      ; $85B1  85 F9
    STA $FC                      ; $85B3  85 FC
    STA $FD                      ; $85B5  85 FD
    STA $FA                      ; $85B7  85 FA
    STA $FB                      ; $85B9  85 FB
    STA $0330                    ; $85BB  8D 30 03
    STA $0348                    ; $85BE  8D 48 03
    STA $0378                    ; $85C1  8D 78 03
    STA $0390                    ; $85C4  8D 90 03
    STA $25                      ; $85C7  85 25
    STA $27                      ; $85C9  85 27
    STA $28                      ; $85CB  85 28
    STA $F0                      ; $85CD  85 F0
    STA $EF                      ; $85CF  85 EF
    STA $3E                      ; $85D1  85 3E
    STA $3F                      ; $85D3  85 3F
    STA $AD                      ; $85D5  85 AD
    STA $0120                    ; $85D7  8D 20 01
    STA $0121                    ; $85DA  8D 21 01
    STA $0122                    ; $85DD  8D 22 01
    STA $0123                    ; $85E0  8D 23 01
    STA $3E                      ; $85E3  85 3E
    STA $32                      ; $85E5  85 32
    STA $33                      ; $85E7  85 33
    STA $35                      ; $85E9  85 35
    STA $36                      ; $85EB  85 36
    STA $3C                      ; $85ED  85 3C
    STA $013C                    ; $85EF  8D 3C 01
    STA $013D                    ; $85F2  8D 3D 01
    STA $013A                    ; $85F5  8D 3A 01
    STA $1C                      ; $85F8  85 1C
    STA $0135                    ; $85FA  8D 35 01
    STA $013C                    ; $85FD  8D 3C 01
    STA $013D                    ; $8600  8D 3D 01
    STA $FD                      ; $8603  85 FD
    STA $06F0                    ; $8605  8D F0 06
    STA $06F1                    ; $8608  8D F1 06
    STA $06F2                    ; $860B  8D F2 06
    STA $06F3                    ; $860E  8D F3 06
    STA $0130                    ; $8611  8D 30 01
    STA $0131                    ; $8614  8D 31 01
    STA $0132                    ; $8617  8D 32 01
    LDY #$3F                     ; $861A  A0 3F

loc_39_861C:
    STA $0680,Y                  ; $861C  99 80 06
    DEY                          ; $861F  88
    BPL loc_39_861C              ; $8620  10 FA
    LDA #$88                     ; $8622  A9 88
    STA $F1                      ; $8624  85 F1
    RTS                          ; $8626  60


sub_39_8627:
    STY $02                      ; $8627  84 02
    LSR $03                      ; $8629  46 03
    BCC loc_39_866A              ; $862B  90 3D
    LDA $8B53,Y                  ; $862D  B9 53 8B
    STA $00                      ; $8630  85 00
    LDA $8B5B,Y                  ; $8632  B9 5B 8B
    STA $01                      ; $8635  85 01
    LDY #$00                     ; $8637  A0 00
    LDX $97                      ; $8639  A6 97

loc_39_863B:
    LDA ($00),Y                  ; $863B  B1 00
    BEQ loc_39_8662              ; $863D  F0 23
    STA $0200,X                  ; $863F  9D 00 02
    INY                          ; $8642  C8
    LDA ($00),Y                  ; $8643  B1 00
    STA $0201,X                  ; $8645  9D 01 02
    INY                          ; $8648  C8
    LDA ($00),Y                  ; $8649  B1 00
    STA $0202,X                  ; $864B  9D 02 02
    INY                          ; $864E  C8
    LDA ($00),Y                  ; $864F  B1 00
    STA $0203,X                  ; $8651  9D 03 02
    INY                          ; $8654  C8
    LDA ($00),Y                  ; $8655  B1 00
    CMP #$01                     ; $8657  C9 01
    BNE loc_39_865C              ; $8659  D0 01
    INY                          ; $865B  C8

loc_39_865C:
    INX                          ; $865C  E8
    INX                          ; $865D  E8
    INX                          ; $865E  E8
    INX                          ; $865F  E8
    BNE loc_39_863B              ; $8660  D0 D9

loc_39_8662:
    STX $97                      ; $8662  86 97
    INC $02                      ; $8664  E6 02
    LDY $02                      ; $8666  A4 02
    BNE sub_39_8627              ; $8668  D0 BD

loc_39_866A:
    RTS                          ; $866A  60


sub_39_866B:
    LDA $8B53,Y                  ; $866B  B9 53 8B
    STA $02                      ; $866E  85 02
    LDA $8B5B,Y                  ; $8670  B9 5B 8B
    STA $03                      ; $8673  85 03
    LDY #$00                     ; $8675  A0 00
    LDX $97                      ; $8677  A6 97

loc_39_8679:
    LDA ($02),Y                  ; $8679  B1 02
    BEQ loc_39_86B6              ; $867B  F0 39
    STA $0200,X                  ; $867D  9D 00 02
    INY                          ; $8680  C8
    LDA ($02),Y                  ; $8681  B1 02
    STA $0201,X                  ; $8683  9D 01 02
    INY                          ; $8686  C8
    LDA ($02),Y                  ; $8687  B1 02
    STA $0202,X                  ; $8689  9D 02 02
    INY                          ; $868C  C8
    LDA ($02),Y                  ; $868D  B1 02
    STA $0203,X                  ; $868F  9D 03 02
    INY                          ; $8692  C8
    LDA ($02),Y                  ; $8693  B1 02
    CMP #$01                     ; $8695  C9 01
    BNE loc_39_869C              ; $8697  D0 03
    INY                          ; $8699  C8
    BNE loc_39_86AA              ; $869A  D0 0E

loc_39_869C:
    LDA #$1D                     ; $869C  A9 1D
    JSR sub_3F_F6BE              ; $869E  20 BE F6
    TYA                          ; $86A1  98
    PHA                          ; $86A2  48
    LDX #$04                     ; $86A3  A2 04
    JSR sub_39_86B7              ; $86A5  20 B7 86
    PLA                          ; $86A8  68
    TAY                          ; $86A9  A8

loc_39_86AA:
    INC $97                      ; $86AA  E6 97
    INC $97                      ; $86AC  E6 97
    INC $97                      ; $86AE  E6 97
    INC $97                      ; $86B0  E6 97
    LDX $97                      ; $86B2  A6 97
    BNE loc_39_8679              ; $86B4  D0 C3

loc_39_86B6:
    RTS                          ; $86B6  60


sub_39_86B7:
    STX $10                      ; $86B7  86 10

loc_39_86B9:
    LDA $95                      ; $86B9  A5 95
    LSR A                        ; $86BB  4A
    LSR A                        ; $86BC  4A
    LSR A                        ; $86BD  4A
    AND #$01                     ; $86BE  29 01
    STA $00                      ; $86C0  85 00
    LDY #$00                     ; $86C2  A0 00
    LDA $AA                      ; $86C4  A5 AA

loc_39_86C6:
    LSR A                        ; $86C6  4A
    BCC loc_39_86CE              ; $86C7  90 05
    INY                          ; $86C9  C8
    CPY #$07                     ; $86CA  C0 07
    BNE loc_39_86C6              ; $86CC  D0 F8

loc_39_86CE:
    TYA                          ; $86CE  98
    ASL A                        ; $86CF  0A
    ASL A                        ; $86D0  0A
    TAY                          ; $86D1  A8
    LDX $86FC,Y                  ; $86D2  BE FC 86
    LDA $86FD,Y                  ; $86D5  B9 FD 86
    STA $01                      ; $86D8  85 01
    TYA                          ; $86DA  98
    CLC                          ; $86DB  18
    ADC $00                      ; $86DC  65 00
    TAY                          ; $86DE  A8
    LDA $86FE,Y                  ; $86DF  B9 FE 86
    TAY                          ; $86E2  A8

loc_39_86E3:
    LDA $871C,Y                  ; $86E3  B9 1C 87
    STA $0201,X                  ; $86E6  9D 01 02
    INX                          ; $86E9  E8
    INX                          ; $86EA  E8
    INX                          ; $86EB  E8
    INX                          ; $86EC  E8
    INY                          ; $86ED  C8
    DEC $01                      ; $86EE  C6 01
    BPL loc_39_86E3              ; $86F0  10 F1
    JSR sub_3F_FF1C              ; $86F2  20 1C FF
    INC $95                      ; $86F5  E6 95
    DEC $10                      ; $86F7  C6 10
    BNE loc_39_86B9              ; $86F9  D0 BE
    RTS                          ; $86FB  60

    .byte $34,$00,$00,$01,$38,$00,$00,$01,$3C,$00,$00,$01,$40,$03,$02,$06  ; $86FC
    .byte $2C,$00,$00,$01,$30,$00,$00,$01,$34,$03,$0A,$0E,$44,$03,$0A,$0E  ; $870C
    .byte $20,$21,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$22,$23,$24,$25,$26,$27  ; $871C
    .byte $28,$29,$0F,$27,$28,$02,$0F,$17,$27,$02,$0F,$20,$32,$23,$0F,$0F  ; $872C
    .byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F  ; $873C
    .byte $0F,$0F,$0F,$11,$2C,$16,$0F,$21,$20,$11,$0F,$26,$20,$16,$0F,$11  ; $874C
    .byte $01,$28,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$11,$2C,$20,$0F,$26  ; $875C
    .byte $28,$16,$0F,$30,$10,$11,$0F,$27,$26,$30,$0F,$29,$30,$19,$0F,$37  ; $876C
    .byte $26,$16,$0F,$37,$10,$20,$0F,$28,$37,$19,$0F,$37,$27,$19,$0F,$37  ; $877C
    .byte $27,$2C,$0F,$30,$30,$30,$0F,$30,$30,$30,$0F,$30,$30,$30,$0F,$30  ; $878C
    .byte $30,$30,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F  ; $879C
    .byte $0F,$0F,$0F,$11,$01,$0C,$0F,$11,$01,$0C,$0F,$11,$01,$0C,$0F,$11  ; $87AC
    .byte $01,$0C,$0F,$11,$01,$0C,$0F,$11,$01,$0C,$0F,$0F,$27,$16,$0F,$0F  ; $87BC
    .byte $20,$29,$0F,$38,$27,$19,$0F,$38,$26,$15,$0F,$30,$21,$12,$0F,$3B  ; $87CC
    .byte $19,$17,$0F,$38,$27,$19,$0F,$2B,$12,$19,$0F,$0F,$27,$16,$0F,$0F  ; $87DC
    .byte $20,$29,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F  ; $87EC
    .byte $0F,$0F,$0F,$3C,$2C,$1C,$0F,$3C,$2C,$1C,$0F,$3C,$2C,$1C,$0F,$0F  ; $87FC
    .byte $20,$2C,$0F,$30,$2C,$1B,$0F,$27,$26,$13,$0F,$30,$27,$26,$0F,$30  ; $880C
    .byte $2C,$13,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$20,$37,$0F,$0F  ; $881C
    .byte $20,$16,$0F,$11,$01,$0C,$0F,$11,$01,$0C,$0F,$11,$01,$0C,$0F,$11  ; $882C
    .byte $01,$0C,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$20,$37,$0F,$0F  ; $883C
    .byte $20,$16,$10,$11,$10,$10,$10,$02,$01,$10,$A1,$A1,$BF,$A1,$88,$88  ; $884C
    .byte $88,$88,$17,$17,$17,$57,$57,$57,$97,$97,$97,$19,$69,$B9,$19,$69  ; $885C
    .byte $B9,$19,$69,$B9,$04,$06,$07,$03,$08,$00,$01,$02,$05,$F0,$12,$10  ; $886C
    .byte $F0,$21,$8E,$03,$C2,$C3,$C4,$C5,$21,$AE,$03,$C6,$C7,$C8,$C9,$21  ; $887C
    .byte $CE,$03,$CA,$CB,$CC,$CD,$21,$EE,$03,$CE,$CF,$D0,$D1,$23,$DB,$01  ; $888C
    .byte $44,$11,$FF,$20,$0F,$97,$06,$03,$28,$FF,$57,$00,$02,$E0,$57,$01  ; $889C
    .byte $02,$E8,$2F,$02,$02,$C0,$37,$03,$02,$C0,$3F,$04,$02,$C0,$43,$05  ; $88AC
    .byte $03,$B8,$FF,$57,$12,$00,$69,$57,$13,$00,$7C,$57,$12,$40,$8F,$7F  ; $88BC
    .byte $14,$00,$69,$7F,$13,$00,$7C,$7F,$14,$40,$8F,$FF,$5F,$1A,$01,$78  ; $88CC
    .byte $5F,$1B,$01,$80,$67,$1C,$01,$78,$67,$1D,$01,$80,$6F,$1E,$01,$74  ; $88DC
    .byte $6F,$1F,$01,$7C,$77,$20,$01,$84,$77,$21,$01,$78,$6F,$00,$00,$40  ; $88EC
    .byte $6F,$01,$00,$48,$6F,$02,$00,$50,$77,$03,$01,$A0,$77,$04,$01,$A8  ; $88FC
    .byte $7F,$05,$01,$50,$7F,$06,$01,$58,$77,$07,$01,$60,$77,$08,$01,$68  ; $890C
    .byte $57,$09,$01,$78,$57,$0A,$01,$80,$7F,$0B,$01,$AD,$07,$10,$02,$38  ; $891C
    .byte $0F,$10,$02,$38,$17,$14,$02,$30,$17,$15,$02,$38,$1F,$10,$02,$30  ; $892C
    .byte $27,$12,$02,$30,$27,$13,$02,$38,$2F,$14,$02,$30,$2F,$15,$02,$38  ; $893C
    .byte $37,$10,$02,$30,$3F,$10,$02,$30,$47,$15,$02,$30,$07,$10,$02,$D0  ; $894C
    .byte $0F,$10,$02,$D0,$17,$12,$02,$D0,$17,$13,$02,$D8,$1F,$10,$02,$D8  ; $895C
    .byte $27,$14,$02,$D0,$27,$15,$02,$D8,$2F,$10,$02,$D0,$37,$14,$02,$C8  ; $896C
    .byte $37,$11,$02,$D0,$37,$13,$02,$D8,$3F,$14,$02,$C0,$3F,$15,$02,$C8  ; $897C
    .byte $3F,$12,$02,$D8,$47,$10,$02,$C0,$4F,$15,$02,$C0,$CF,$20,$03,$18  ; $898C
    .byte $A7,$20,$03,$38,$77,$20,$03,$50,$67,$20,$03,$80,$BF,$16,$02,$A4  ; $899C
    .byte $BF,$17,$02,$AC,$C7,$18,$02,$A4,$C7,$19,$02,$AC,$4F,$3F,$00,$A0  ; $89AC
    .byte $4F,$40,$00,$A8,$57,$41,$00,$A0,$77,$34,$00,$A0,$77,$35,$00,$A8  ; $89BC
    .byte $8F,$39,$00,$B8,$97,$3A,$00,$B8,$9F,$3A,$00,$B8,$A7,$3D,$01,$40  ; $89CC
    .byte $A7,$3E,$01,$48,$B7,$20,$03,$20,$8F,$20,$03,$50,$67,$20,$03,$98  ; $89DC
    .byte $A7,$22,$02,$A8,$A7,$23,$02,$B0,$AF,$24,$02,$A8,$AF,$25,$02,$B0  ; $89EC
    .byte $BF,$22,$02,$D8,$BF,$23,$02,$E0,$C7,$24,$02,$D8,$C7,$25,$02,$E0  ; $89FC
    .byte $CF,$1F,$03,$20,$CF,$1E,$C3,$28,$C7,$2A,$03,$28,$BF,$1E,$03,$28  ; $8A0C
    .byte $BF,$1E,$C3,$30,$B7,$2A,$03,$30,$AF,$2A,$03,$30,$A7,$1E,$03,$30  ; $8A1C
    .byte $00,$9F,$2A,$03,$38,$97,$1E,$03,$38,$97,$1E,$C3,$40,$8F,$2A,$03  ; $8A2C
    .byte $40,$87,$1E,$03,$40,$87,$1E,$C3,$48,$7F,$2A,$03,$48,$77,$1E,$03  ; $8A3C
    .byte $48,$00,$77,$1E,$C3,$58,$6F,$1E,$03,$58,$6F,$1F,$03,$60,$6F,$1E  ; $8A4C
    .byte $C3,$68,$67,$1E,$03,$68,$67,$1F,$03,$70,$67,$1F,$03,$78,$00,$6F  ; $8A5C
    .byte $2A,$03,$80,$77,$2A,$03,$80,$7F,$1E,$83,$80,$7F,$2B,$03,$88,$7F  ; $8A6C
    .byte $1F,$03,$90,$01,$87,$2A,$03,$88,$7F,$1E,$43,$98,$01,$8F,$1E,$83  ; $8A7C
    .byte $88,$87,$2A,$03,$98,$01,$8F,$1F,$03,$90,$8F,$2B,$83,$98,$8F,$1E  ; $8A8C
    .byte $43,$A0,$97,$2A,$03,$A0,$9F,$2A,$03,$A0,$A7,$1E,$83,$A0,$A7,$1E  ; $8A9C
    .byte $43,$A8,$AF,$2A,$03,$A8,$B7,$2A,$03,$A8,$00,$AF,$2A,$03,$20,$A7  ; $8AAC
    .byte $2A,$03,$20,$9F,$1E,$03,$20,$9F,$1F,$03,$28,$9F,$1F,$03,$30,$9F  ; $8ABC
    .byte $1F,$03,$38,$9F,$1E,$C3,$40,$97,$2A,$03,$40,$8F,$1E,$03,$40,$8F  ; $8ACC
    .byte $1F,$03,$48,$00,$8F,$1F,$03,$58,$8F,$1F,$03,$60,$8F,$1E,$C3,$68  ; $8ADC
    .byte $87,$1E,$03,$68,$87,$1F,$03,$70,$87,$1F,$03,$78,$87,$1E,$C3,$80  ; $8AEC
    .byte $7F,$2A,$03,$80,$77,$2A,$03,$80,$6F,$2A,$03,$80,$67,$1E,$03,$80  ; $8AFC
    .byte $67,$1F,$03,$88,$67,$1F,$03,$90,$00,$6F,$2A,$03,$98,$77,$2A,$03  ; $8B0C
    .byte $98,$7F,$2A,$03,$98,$87,$2A,$03,$98,$8F,$2A,$03,$98,$97,$2A,$03  ; $8B1C
    .byte $98,$9F,$2A,$03,$98,$A7,$1E,$83,$98,$A7,$1F,$03,$A0,$00,$AF,$1F  ; $8B2C
    .byte $03,$B8,$AF,$1E,$43,$C0,$B7,$2A,$03,$C0,$BF,$1E,$83,$C0,$BF,$1F  ; $8B3C
    .byte $03,$C8,$BF,$1F,$03,$D0,$00,$0C,$2D,$4E,$6B,$B7,$E0,$15,$3A,$8A  ; $8B4C
    .byte $8A,$8A,$8A,$8A,$8A,$8B,$8B,$5F,$30,$00,$C4,$5F,$31,$00,$CC,$5F  ; $8B5C
    .byte $32,$00,$D4,$67,$33,$00,$C4,$67,$34,$00,$CC,$67,$35,$00,$D4,$6F  ; $8B6C
    .byte $36,$00,$C4,$6F,$37,$00,$CC,$6F,$38,$00,$D4,$77,$39,$00,$C8,$77  ; $8B7C
    .byte $3A,$00,$D0,$FF,$9F,$09,$01,$27,$9F,$0A,$01,$2F,$A7,$0B,$01,$24  ; $8B8C
    .byte $A7,$0C,$01,$2C,$A7,$0D,$01,$34,$AF,$0E,$01,$24,$AF,$0F,$01,$2C  ; $8B9C
    .byte $AF,$10,$01,$34,$B7,$11,$01,$27,$B7,$3D,$01,$2F,$FF,$9F,$22,$00  ; $8BAC
    .byte $77,$9F,$23,$00,$7F,$9F,$24,$00,$87,$A7,$25,$00,$74,$A7,$26,$00  ; $8BBC
    .byte $7C,$A7,$27,$00,$84,$AF,$28,$00,$78,$AF,$29,$00,$80,$B7,$2A,$00  ; $8BCC
    .byte $78,$B7,$2B,$00,$80,$FF,$67,$07,$02,$28,$6F,$08,$02,$28,$FF,$27  ; $8BDC
    .byte $00,$00,$20,$27,$01,$00,$28,$27,$02,$00,$30,$2F,$03,$00,$25,$2F  ; $8BEC
    .byte $04,$00,$2D,$2F,$05,$00,$35,$37,$06,$00,$30,$FF,$B7,$3B,$03,$C8  ; $8BFC
    .byte $B7,$3C,$03,$D0,$FF,$1F,$3E,$03,$7C,$27,$3F,$03,$78,$27,$40,$03  ; $8C0C
    .byte $80,$2F,$41,$03,$78,$2F,$42,$03,$80,$37,$18,$03,$78,$37,$19,$03  ; $8C1C
    .byte $80,$FF,$27,$2C,$02,$C7,$27,$2D,$02,$CF,$2F,$2E,$02,$C6,$2F,$2F  ; $8C2C
    .byte $02,$CE,$FF,$63,$90,$B9,$E2,$EB,$08,$11,$2E,$8B,$8B,$8B,$8B,$8B  ; $8C3C
    .byte $8C,$8C,$8C,$20,$00,$03,$00,$00,$00,$00,$20,$00,$03,$00,$00,$00  ; $8C4C
    .byte $00,$20,$00,$03,$00,$00,$00,$00,$20,$00,$03,$00,$00,$00,$00,$FF  ; $8C5C
    .byte $98,$84,$8E,$84,$84,$98,$8E,$98,$21,$22,$22,$21,$20,$22,$20,$20  ; $8C6C

loc_39_8C7C:
    LDA $30                      ; $8C7C  A5 30
    CMP #$07                     ; $8C7E  C9 07
    BNE loc_39_8C85              ; $8C80  D0 03
    JMP loc_39_8EF7              ; $8C82  4C F7 8E


loc_39_8C85:
    LDY $22                      ; $8C85  A4 22
    CPY #$08                     ; $8C87  C0 08
    BCS loc_39_8C95              ; $8C89  B0 0A
    LDA $A9                      ; $8C8B  A5 A9
    AND $FCBF,Y                  ; $8C8D  39 BF FC
    BEQ loc_39_8C95              ; $8C90  F0 03
    JMP loc_39_8E78              ; $8C92  4C 78 8E


loc_39_8C95:
    LDA $22                      ; $8C95  A5 22
    PHA                          ; $8C97  48
    AND #$07                     ; $8C98  29 07
    TAY                          ; $8C9A  A8
    PLA                          ; $8C9B  68
    LSR A                        ; $8C9C  4A
    LSR A                        ; $8C9D  4A
    LSR A                        ; $8C9E  4A
    TAX                          ; $8C9F  AA
    LDA $A9,X                    ; $8CA0  B5 A9
    ORA $FCBF,Y                  ; $8CA2  19 BF FC
    STA $A9,X                    ; $8CA5  95 A9
    CPX #$01                     ; $8CA7  E0 01
    BNE loc_39_8CBC              ; $8CA9  D0 11
    LDA $AA                      ; $8CAB  A5 AA
    CMP #$0F                     ; $8CAD  C9 0F
    BEQ loc_39_8CB9              ; $8CAF  F0 08
    BCS loc_39_8CB6              ; $8CB1  B0 03
    JMP loc_39_833C              ; $8CB3  4C 3C 83


loc_39_8CB6:
    JMP loc_39_83E8              ; $8CB6  4C E8 83


loc_39_8CB9:
    JMP loc_39_90C7              ; $8CB9  4C C7 90


loc_39_8CBC:
    JSR sub_3E_C457              ; $8CBC  20 57 C4
    LDA #$04                     ; $8CBF  A9 04
    STA $97                      ; $8CC1  85 97
    JSR sub_3E_C421              ; $8CC3  20 21 C4
    JSR sub_3E_C438              ; $8CC6  20 38 C4
    JSR sub_39_85AD              ; $8CC9  20 AD 85
    JSR sub_3F_FF1C              ; $8CCC  20 1C FF
    JSR sub_3E_C369              ; $8CCF  20 69 C3
    LDX #$16                     ; $8CD2  A2 16
    JSR sub_3E_DA05              ; $8CD4  20 05 DA
    JSR sub_3E_C373              ; $8CD7  20 73 C3
    LDA #$00                     ; $8CDA  A9 00
    STA $2A                      ; $8CDC  85 2A
    LDA $22                      ; $8CDE  A5 22
    PHA                          ; $8CE0  48
    LDA #$11                     ; $8CE1  A9 11
    STA $22                      ; $8CE3  85 22

loc_39_8CE5:
    JSR sub_3E_CFB1              ; $8CE5  20 B1 CF
    JSR sub_3F_FF1C              ; $8CE8  20 1C FF
    INC $24                      ; $8CEB  E6 24
    LDA $24                      ; $8CED  A5 24
    AND #$1F                     ; $8CEF  29 1F
    STA $24                      ; $8CF1  85 24
    BNE loc_39_8CE5              ; $8CF3  D0 F0
    PLA                          ; $8CF5  68
    STA $22                      ; $8CF6  85 22
    LDY #$1F                     ; $8CF8  A0 1F

loc_39_8CFA:
    LDA $92DF,Y                  ; $8CFA  B9 DF 92
    STA $0620,Y                  ; $8CFD  99 20 06
    DEY                          ; $8D00  88
    BPL loc_39_8CFA              ; $8D01  10 F7
    LDX #$00                     ; $8D03  A2 00
    LDA #$01                     ; $8D05  A9 01
    STA $0300                    ; $8D07  8D 00 03
    LDA #$70                     ; $8D0A  A9 70
    JSR sub_3F_F446              ; $8D0C  20 46 F4
    LDA #$90                     ; $8D0F  A9 90
    STA $0528                    ; $8D11  8D 28 05
    LDA #$00                     ; $8D14  A9 00
    STA $0348                    ; $8D16  8D 48 03
    STA $0390                    ; $8D19  8D 90 03
    LDA #$70                     ; $8D1C  A9 70
    STA $0378                    ; $8D1E  8D 78 03
    LDA #$80                     ; $8D21  A9 80
    STA $0330                    ; $8D23  8D 30 03
    JSR sub_3F_FCE3              ; $8D26  20 E3 FC
    JSR sub_3F_FF1C              ; $8D29  20 1C FF
    LDY #$0E                     ; $8D2C  A0 0E

loc_39_8D2E:
    LDA $00B0,Y                  ; $8D2E  B9 B0 00
    BPL loc_39_8D38              ; $8D31  10 05
    LDA #$9C                     ; $8D33  A9 9C
    STA $00B0,Y                  ; $8D35  99 B0 00

loc_39_8D38:
    DEY                          ; $8D38  88
    BPL loc_39_8D2E              ; $8D39  10 F3
    LDA #$14                     ; $8D3B  A9 14
    JSR sub_3F_F6BC              ; $8D3D  20 BC F6
    JSR sub_3E_C451              ; $8D40  20 51 C4
    INC $9A                      ; $8D43  E6 9A

loc_39_8D45:
    JSR sub_3F_FCE3              ; $8D45  20 E3 FC
    LDA $0540                    ; $8D48  AD 40 05
    CMP #$08                     ; $8D4B  C9 08
    BNE loc_39_8D45              ; $8D4D  D0 F6
    LDX #$1E                     ; $8D4F  A2 1E
    JSR sub_3F_FF15              ; $8D51  20 15 FF

loc_39_8D54:
    DEC $0330                    ; $8D54  CE 30 03
    JSR sub_3F_FCE3              ; $8D57  20 E3 FC
    LDA #$00                     ; $8D5A  A9 00
    STA $0570                    ; $8D5C  8D 70 05
    LDA $0330                    ; $8D5F  AD 30 03
    CMP #$48                     ; $8D62  C9 48
    BNE loc_39_8D54              ; $8D64  D0 EE
    LDY #$00                     ; $8D66  A0 00
    STY $9A                      ; $8D68  84 9A
    JSR sub_39_9281              ; $8D6A  20 81 92
    LDX #$0A                     ; $8D6D  A2 0A
    JSR sub_3F_FF15              ; $8D6F  20 15 FF
    LDY $22                      ; $8D72  A4 22
    LDX $93B1,Y                  ; $8D74  BE B1 93
    LDA #$9C                     ; $8D77  A9 9C
    STA $B0,X                    ; $8D79  95 B0
    INY                          ; $8D7B  C8
    JSR sub_39_9281              ; $8D7C  20 81 92
    LDA #$3C                     ; $8D7F  A9 3C
    STA $95                      ; $8D81  85 95

loc_39_8D83:
    LDX #$00                     ; $8D83  A2 00
    LDY #$00                     ; $8D85  A0 00
    LDA $95                      ; $8D87  A5 95
    LSR A                        ; $8D89  4A
    LSR A                        ; $8D8A  4A
    BCS loc_39_8D96              ; $8D8B  B0 09
    LDA $22                      ; $8D8D  A5 22
    ADC #$01                     ; $8D8F  69 01
    ASL A                        ; $8D91  0A
    ASL A                        ; $8D92  0A
    ASL A                        ; $8D93  0A
    ASL A                        ; $8D94  0A
    TAY                          ; $8D95  A8

loc_39_8D96:
    LDA $92EF,Y                  ; $8D96  B9 EF 92
    STA $0610,X                  ; $8D99  9D 10 06
    STA $0630,X                  ; $8D9C  9D 30 06
    INY                          ; $8D9F  C8
    INX                          ; $8DA0  E8
    CPX #$10                     ; $8DA1  E0 10
    BNE loc_39_8D96              ; $8DA3  D0 F1
    LDA #$FF                     ; $8DA5  A9 FF
    STA $18                      ; $8DA7  85 18
    JSR sub_3F_FF1C              ; $8DA9  20 1C FF
    DEC $95                      ; $8DAC  C6 95
    BNE loc_39_8D83              ; $8DAE  D0 D3
    LDX #$3C                     ; $8DB0  A2 3C
    JSR sub_3F_FF15              ; $8DB2  20 15 FF
    LDX #$03                     ; $8DB5  A2 03
    LDA $22                      ; $8DB7  A5 22
    CMP #$01                     ; $8DB9  C9 01
    BEQ loc_39_8DC5              ; $8DBB  F0 08
    DEX                          ; $8DBD  CA
    CMP #$02                     ; $8DBE  C9 02
    BEQ loc_39_8DC5              ; $8DC0  F0 03
    JMP loc_39_8E78              ; $8DC2  4C 78 8E


loc_39_8DC5:
    LDA #$9C                     ; $8DC5  A9 9C
    STA $B0,X                    ; $8DC7  95 B0
    LDA #$70                     ; $8DC9  A9 70
    STA $64                      ; $8DCB  85 64
    JSR sub_3E_C457              ; $8DCD  20 57 C4
    LDA #$04                     ; $8DD0  A9 04
    STA $97                      ; $8DD2  85 97
    JSR sub_3E_C421              ; $8DD4  20 21 C4
    LDX #$00                     ; $8DD7  A2 00

loc_39_8DD9:
    LDA $93B9,X                  ; $8DD9  BD B9 93
    STA $0780,X                  ; $8DDC  9D 80 07
    CMP #$FF                     ; $8DDF  C9 FF
    BEQ loc_39_8DE6              ; $8DE1  F0 03
    INX                          ; $8DE3  E8
    BNE loc_39_8DD9              ; $8DE4  D0 F3

loc_39_8DE6:
    STA $19                      ; $8DE6  85 19
    JSR sub_3F_FF1C              ; $8DE8  20 1C FF
    LDA #$00                     ; $8DEB  A9 00
    STA $95                      ; $8DED  85 95

loc_39_8DEF:
    LDA $95                      ; $8DEF  A5 95
    AND #$01                     ; $8DF1  29 01
    TAY                          ; $8DF3  A8
    LDA $938F,Y                  ; $8DF4  B9 8F 93
    STA $0603                    ; $8DF7  8D 03 06
    LDA #$FF                     ; $8DFA  A9 FF
    STA $18                      ; $8DFC  85 18
    LDX #$0A                     ; $8DFE  A2 0A
    JSR sub_3F_FF15              ; $8E00  20 15 FF
    INC $95                      ; $8E03  E6 95
    LDA $95                      ; $8E05  A5 95
    CMP #$04                     ; $8E07  C9 04
    BNE loc_39_8DEF              ; $8E09  D0 E4
    LDX #$3C                     ; $8E0B  A2 3C
    JSR sub_3F_FF15              ; $8E0D  20 15 FF
    LDX #$00                     ; $8E10  A2 00
    LDA #$36                     ; $8E12  A9 36
    JSR sub_3F_F446              ; $8E14  20 46 F4
    LDA #$81                     ; $8E17  A9 81
    STA $0300                    ; $8E19  8D 00 03
    LDA #$80                     ; $8E1C  A9 80
    STA $0330                    ; $8E1E  8D 30 03

loc_39_8E21:
    LDA $937F,X                  ; $8E21  BD 7F 93
    STA $0630,X                  ; $8E24  9D 30 06
    INX                          ; $8E27  E8
    CPX #$10                     ; $8E28  E0 10
    BNE loc_39_8E21              ; $8E2A  D0 F5
    JSR sub_3F_FCE3              ; $8E2C  20 E3 FC
    LDA #$00                     ; $8E2F  A9 00
    STA $9A                      ; $8E31  85 9A
    JSR sub_3F_FF1C              ; $8E33  20 1C FF
    LDA #$70                     ; $8E36  A9 70
    STA $64                      ; $8E38  85 64
    JSR sub_3E_C451              ; $8E3A  20 51 C4
    LDX #$1E                     ; $8E3D  A2 1E
    JSR sub_3F_FF15              ; $8E3F  20 15 FF

loc_39_8E42:
    DEC $0330                    ; $8E42  CE 30 03
    JSR sub_3F_FCE3              ; $8E45  20 E3 FC
    LDA $0330                    ; $8E48  AD 30 03
    CMP #$48                     ; $8E4B  C9 48
    BNE loc_39_8E42              ; $8E4D  D0 F3
    LDA $00                      ; $8E4F  A5 00
    STA $9A                      ; $8E51  85 9A
    LDY #$00                     ; $8E53  A0 00
    JSR sub_39_9281              ; $8E55  20 81 92
    LDX #$0A                     ; $8E58  A2 0A
    JSR sub_3F_FF15              ; $8E5A  20 15 FF
    LDY #$09                     ; $8E5D  A0 09
    LDA $22                      ; $8E5F  A5 22
    CMP #$02                     ; $8E61  C9 02
    BEQ loc_39_8E66              ; $8E63  F0 01
    INY                          ; $8E65  C8

loc_39_8E66:
    JSR sub_39_9281              ; $8E66  20 81 92
    LDX #$0A                     ; $8E69  A2 0A
    JSR sub_3F_FF15              ; $8E6B  20 15 FF
    LDY #$13                     ; $8E6E  A0 13
    JSR sub_39_9281              ; $8E70  20 81 92
    LDX #$3C                     ; $8E73  A2 3C
    JSR sub_3F_FF15              ; $8E75  20 15 FF

loc_39_8E78:
    LDX #$3C                     ; $8E78  A2 3C
    JSR sub_3F_FF15              ; $8E7A  20 15 FF
    LDA #$01                     ; $8E7D  A9 01
    JSR sub_39_8F49              ; $8E7F  20 49 8F
    LDA #$0D                     ; $8E82  A9 0D
    JSR sub_3F_F6BC              ; $8E84  20 BC F6
    JSR sub_39_9886              ; $8E87  20 86 98
    LDA $0147                    ; $8E8A  AD 47 01
    STA $22                      ; $8E8D  85 22

loc_39_8E8F:
    LDA #$AF                     ; $8E8F  A9 AF
    STA $0290                    ; $8E91  8D 90 02
    LDA #$02                     ; $8E94  A9 02
    STA $0291                    ; $8E96  8D 91 02
    LDA #$00                     ; $8E99  A9 00
    STA $0292                    ; $8E9B  8D 92 02
    LDA #$48                     ; $8E9E  A9 48
    STA $0293                    ; $8EA0  8D 93 02

loc_39_8EA3:
    LDA $14                      ; $8EA3  A5 14
    AND #$90                     ; $8EA5  29 90
    BNE loc_39_8ECC              ; $8EA7  D0 23
    LDA $14                      ; $8EA9  A5 14
    AND #$2C                     ; $8EAB  29 2C
    BEQ loc_39_8EC6              ; $8EAD  F0 17
    LDA #$2E                     ; $8EAF  A9 2E
    JSR sub_3F_F6BE              ; $8EB1  20 BE F6
    LDA $0290                    ; $8EB4  AD 90 02
    CLC                          ; $8EB7  18
    ADC #$10                     ; $8EB8  69 10
    STA $0290                    ; $8EBA  8D 90 02
    CMP #$CF                     ; $8EBD  C9 CF
    BNE loc_39_8EC6              ; $8EBF  D0 05
    LDA #$AF                     ; $8EC1  A9 AF
    STA $0290                    ; $8EC3  8D 90 02

loc_39_8EC6:
    JSR sub_3F_FF1C              ; $8EC6  20 1C FF
    JMP loc_39_8EA3              ; $8EC9  4C A3 8E


loc_39_8ECC:
    LDA $0290                    ; $8ECC  AD 90 02
    CMP #$BF                     ; $8ECF  C9 BF
    BEQ sub_39_8EDE              ; $8ED1  F0 0B
    LDA #$2A                     ; $8ED3  A9 2A
    JSR sub_3F_F6BE              ; $8ED5  20 BE F6
    JSR sub_39_8EDE              ; $8ED8  20 DE 8E
    JMP loc_39_809D              ; $8EDB  4C 9D 80


sub_39_8EDE:
    LDA #$2A                     ; $8EDE  A9 2A
    JSR sub_3F_F6BE              ; $8EE0  20 BE F6
    LDY #$0F                     ; $8EE3  A0 0F

loc_39_8EE5:
    LDA $00B0,Y                  ; $8EE5  B9 B0 00
    BPL loc_39_8EEF              ; $8EE8  10 05
    LDA #$9C                     ; $8EEA  A9 9C
    STA $00B0,Y                  ; $8EEC  99 B0 00

loc_39_8EEF:
    DEY                          ; $8EEF  88
    BPL loc_39_8EE5              ; $8EF0  10 F3
    LDA #$00                     ; $8EF2  A9 00
    STA $1F                      ; $8EF4  85 1F
    RTS                          ; $8EF6  60


loc_39_8EF7:
    LDA #$02                     ; $8EF7  A9 02
    STA $A1                      ; $8EF9  85 A1
    LDA #$04                     ; $8EFB  A9 04
    JSR sub_39_8F49              ; $8EFD  20 49 8F
    LDA #$0E                     ; $8F00  A9 0E
    JSR sub_3F_F6BC              ; $8F02  20 BC F6
    JSR sub_39_9886              ; $8F05  20 86 98
    LDX #$00                     ; $8F08  A2 00
    JSR sub_3F_FF15              ; $8F0A  20 15 FF
    LDA #$0D                     ; $8F0D  A9 0D
    JSR sub_3F_F6BC              ; $8F0F  20 BC F6
    LDA $0147                    ; $8F12  AD 47 01
    STA $22                      ; $8F15  85 22
    LDX #$01                     ; $8F17  A2 01
    LDA $22                      ; $8F19  A5 22
    CMP #$08                     ; $8F1B  C9 08
    BCS loc_39_8F25              ; $8F1D  B0 06
    JSR sub_39_92C9              ; $8F1F  20 C9 92
    JMP loc_39_8E8F              ; $8F22  4C 8F 8E


loc_39_8F25:
    INX                          ; $8F25  E8
    JSR sub_39_92C9              ; $8F26  20 C9 92
    LDA #$B7                     ; $8F29  A9 B7
    STA $0290                    ; $8F2B  8D 90 02
    LDA #$02                     ; $8F2E  A9 02
    STA $0291                    ; $8F30  8D 91 02
    LDA #$00                     ; $8F33  A9 00
    STA $0292                    ; $8F35  8D 92 02
    LDA #$48                     ; $8F38  A9 48
    STA $0293                    ; $8F3A  8D 93 02

loc_39_8F3D:
    LDA $14                      ; $8F3D  A5 14
    AND #$90                     ; $8F3F  29 90
    BNE sub_39_8EDE              ; $8F41  D0 9B
    JSR sub_3F_FF1C              ; $8F43  20 1C FF
    JMP loc_39_8F3D              ; $8F46  4C 3D 8F


sub_39_8F49:
    PHA                          ; $8F49  48
    JSR sub_3E_C457              ; $8F4A  20 57 C4
    LDA #$04                     ; $8F4D  A9 04
    STA $97                      ; $8F4F  85 97
    JSR sub_3E_C421              ; $8F51  20 21 C4
    JSR sub_39_85AD              ; $8F54  20 AD 85
    JSR sub_3F_FF1C              ; $8F57  20 1C FF
    JSR sub_3E_C369              ; $8F5A  20 69 C3
    LDX #$17                     ; $8F5D  A2 17
    JSR sub_3E_DA05              ; $8F5F  20 05 DA
    JSR sub_3E_C373              ; $8F62  20 73 C3
    LDA #$01                     ; $8F65  A9 01
    STA $2A                      ; $8F67  85 2A
    LDA #$11                     ; $8F69  A9 11
    STA $22                      ; $8F6B  85 22

loc_39_8F6D:
    JSR sub_3E_CFB1              ; $8F6D  20 B1 CF
    JSR sub_3F_FF1C              ; $8F70  20 1C FF
    INC $24                      ; $8F73  E6 24
    LDA $24                      ; $8F75  A5 24
    AND #$1F                     ; $8F77  29 1F
    STA $24                      ; $8F79  85 24
    BNE loc_39_8F6D              ; $8F7B  D0 F0
    PLA                          ; $8F7D  68
    TAX                          ; $8F7E  AA
    JSR sub_39_92C9              ; $8F7F  20 C9 92
    LDY #$1F                     ; $8F82  A0 1F

loc_39_8F84:
    LDA $9509,Y                  ; $8F84  B9 09 95
    STA $0620,Y                  ; $8F87  99 20 06
    DEY                          ; $8F8A  88
    BPL loc_39_8F84              ; $8F8B  10 F7
    JSR sub_3F_FF1C              ; $8F8D  20 1C FF
    JMP sub_3E_C451              ; $8F90  4C 51 C4


sub_39_8F93:
    JSR sub_3E_C457              ; $8F93  20 57 C4
    LDA #$04                     ; $8F96  A9 04
    STA $97                      ; $8F98  85 97
    JSR sub_3E_C421              ; $8F9A  20 21 C4
    JSR sub_3E_C438              ; $8F9D  20 38 C4
    JSR sub_3F_FF1C              ; $8FA0  20 1C FF
    JSR sub_3E_C369              ; $8FA3  20 69 C3
    LDA $22                      ; $8FA6  A5 22
    ORA #$18                     ; $8FA8  09 18
    TAX                          ; $8FAA  AA
    JSR sub_3E_DA05              ; $8FAB  20 05 DA
    JSR sub_3E_C373              ; $8FAE  20 73 C3
    LDA #$00                     ; $8FB1  A9 00
    STA $24                      ; $8FB3  85 24
    LDA #$02                     ; $8FB5  A9 02
    STA $2A                      ; $8FB7  85 2A
    LDA $22                      ; $8FB9  A5 22
    PHA                          ; $8FBB  48
    LDA #$10                     ; $8FBC  A9 10
    STA $22                      ; $8FBE  85 22

loc_39_8FC0:
    JSR sub_3E_CFB1              ; $8FC0  20 B1 CF
    JSR sub_3F_FF1C              ; $8FC3  20 1C FF
    INC $24                      ; $8FC6  E6 24
    LDA $24                      ; $8FC8  A5 24
    AND #$1F                     ; $8FCA  29 1F
    STA $24                      ; $8FCC  85 24
    BNE loc_39_8FC0              ; $8FCE  D0 F0
    PLA                          ; $8FD0  68
    STA $22                      ; $8FD1  85 22
    ASL A                        ; $8FD3  0A
    ASL A                        ; $8FD4  0A
    ASL A                        ; $8FD5  0A
    ASL A                        ; $8FD6  0A
    TAY                          ; $8FD7  A8
    LDX #$00                     ; $8FD8  A2 00

loc_39_8FDA:
    LDA $9596,Y                  ; $8FDA  B9 96 95
    STA $0620,X                  ; $8FDD  9D 20 06
    LDA #$0F                     ; $8FE0  A9 0F
    STA $0630,X                  ; $8FE2  9D 30 06
    INY                          ; $8FE5  C8
    INX                          ; $8FE6  E8
    CPX #$10                     ; $8FE7  E0 10
    BNE loc_39_8FDA              ; $8FE9  D0 EF
    LDA $22                      ; $8FEB  A5 22
    ASL A                        ; $8FED  0A
    ADC $22                      ; $8FEE  65 22
    ADC #$92                     ; $8FF0  69 92
    TAY                          ; $8FF2  A8
    LDX #$01                     ; $8FF3  A2 01

loc_39_8FF5:
    TYA                          ; $8FF5  98
    STA $06F0,X                  ; $8FF6  9D F0 06
    LDA #$00                     ; $8FF9  A9 00
    STA $06F4,X                  ; $8FFB  9D F4 06
    STA $06F8,X                  ; $8FFE  9D F8 06
    INY                          ; $9001  C8
    INX                          ; $9002  E8
    CPX #$04                     ; $9003  E0 04
    BNE loc_39_8FF5              ; $9005  D0 EE
    LDX #$00                     ; $9007  A2 00
    LDA #$81                     ; $9009  A9 81
    STA $0300                    ; $900B  8D 00 03
    LDA $22                      ; $900E  A5 22
    CLC                          ; $9010  18
    ADC #$44                     ; $9011  69 44
    JSR sub_3F_F446              ; $9013  20 46 F4
    LDA #$90                     ; $9016  A9 90
    STA $0528                    ; $9018  8D 28 05
    LDA #$00                     ; $901B  A9 00
    STA $0348                    ; $901D  8D 48 03
    STA $0390                    ; $9020  8D 90 03
    LDA #$74                     ; $9023  A9 74
    STA $0378                    ; $9025  8D 78 03
    LDA #$80                     ; $9028  A9 80
    STA $0330                    ; $902A  8D 30 03
    LDA $22                      ; $902D  A5 22
    CMP #$04                     ; $902F  C9 04
    BNE loc_39_9049              ; $9031  D0 16
    LDY #$01                     ; $9033  A0 01
    LDA #$0F                     ; $9035  A9 0F
    JSR sub_3F_F452              ; $9037  20 52 F4
    LDA #$7F                     ; $903A  A9 7F
    STA $0331                    ; $903C  8D 31 03
    LDA #$63                     ; $903F  A9 63
    STA $0379                    ; $9041  8D 79 03
    LDA #$81                     ; $9044  A9 81
    STA $0301                    ; $9046  8D 01 03

loc_39_9049:
    JSR sub_3F_FCE3              ; $9049  20 E3 FC
    LDA #$00                     ; $904C  A9 00
    STA $9A                      ; $904E  85 9A
    LDA #$0F                     ; $9050  A9 0F
    JSR sub_3F_F6BC              ; $9052  20 BC F6
    JSR sub_3E_C451              ; $9055  20 51 C4
    LDA #$30                     ; $9058  A9 30
    STA $0F                      ; $905A  85 0F

loc_39_905C:
    LDX #$00                     ; $905C  A2 00
    LDA $22                      ; $905E  A5 22
    ASL A                        ; $9060  0A
    ASL A                        ; $9061  0A
    ASL A                        ; $9062  0A
    TAY                          ; $9063  A8

loc_39_9064:
    LDA $9616,X                  ; $9064  BD 16 96
    SEC                          ; $9067  38
    SBC $0F                      ; $9068  E5 0F
    BCS loc_39_906E              ; $906A  B0 02
    LDA #$0F                     ; $906C  A9 0F

loc_39_906E:
    STA $0610,X                  ; $906E  9D 10 06
    STA $0630,X                  ; $9071  9D 30 06
    LDA $961E,Y                  ; $9074  B9 1E 96
    SEC                          ; $9077  38
    SBC $0F                      ; $9078  E5 0F
    BCS loc_39_907E              ; $907A  B0 02
    LDA #$0F                     ; $907C  A9 0F

loc_39_907E:
    STA $0618,X                  ; $907E  9D 18 06
    STA $0638,X                  ; $9081  9D 38 06
    INY                          ; $9084  C8
    INX                          ; $9085  E8
    CPX #$08                     ; $9086  E0 08
    BNE loc_39_9064              ; $9088  D0 DA
    LDA #$FF                     ; $908A  A9 FF
    STA $18                      ; $908C  85 18
    LDX #$0A                     ; $908E  A2 0A
    JSR sub_3F_FF15              ; $9090  20 15 FF
    LDA $0F                      ; $9093  A5 0F
    SEC                          ; $9095  38
    SBC #$10                     ; $9096  E9 10
    STA $0F                      ; $9098  85 0F
    BCS loc_39_905C              ; $909A  B0 C0

loc_39_909C:
    JSR sub_3F_FCE3              ; $909C  20 E3 FC
    LDA $0540                    ; $909F  AD 40 05
    CMP #$05                     ; $90A2  C9 05
    BNE loc_39_909C              ; $90A4  D0 F6
    LDA #$00                     ; $90A6  A9 00
    STA $9A                      ; $90A8  85 9A
    LDA $22                      ; $90AA  A5 22
    CLC                          ; $90AC  18
    ADC #$0B                     ; $90AD  69 0B
    TAY                          ; $90AF  A8
    JSR sub_39_9281              ; $90B0  20 81 92
    LDX #$F0                     ; $90B3  A2 F0
    JSR sub_3F_FF15              ; $90B5  20 15 FF
    LDA #$00                     ; $90B8  A9 00
    STA $06F0                    ; $90BA  8D F0 06
    STA $06F1                    ; $90BD  8D F1 06
    STA $06F2                    ; $90C0  8D F2 06
    STA $06F3                    ; $90C3  8D F3 06
    RTS                          ; $90C6  60


loc_39_90C7:
    JSR sub_3E_C457              ; $90C7  20 57 C4
    LDA #$04                     ; $90CA  A9 04
    STA $97                      ; $90CC  85 97
    JSR sub_3E_C421              ; $90CE  20 21 C4
    JSR sub_3E_C438              ; $90D1  20 38 C4
    JSR sub_39_85AD              ; $90D4  20 AD 85
    JSR sub_3F_FF1C              ; $90D7  20 1C FF
    JSR sub_3E_C369              ; $90DA  20 69 C3
    LDX #$40                     ; $90DD  A2 40
    JSR sub_3E_DA05              ; $90DF  20 05 DA
    JSR sub_3E_C373              ; $90E2  20 73 C3
    LDA #$00                     ; $90E5  A9 00
    STA $24                      ; $90E7  85 24
    LDA #$01                     ; $90E9  A9 01
    STA $2A                      ; $90EB  85 2A
    LDA #$12                     ; $90ED  A9 12
    STA $22                      ; $90EF  85 22

loc_39_90F1:
    JSR sub_3E_CFB1              ; $90F1  20 B1 CF
    JSR sub_3F_FF1C              ; $90F4  20 1C FF
    INC $24                      ; $90F7  E6 24
    LDA $24                      ; $90F9  A5 24
    AND #$1F                     ; $90FB  29 1F
    STA $24                      ; $90FD  85 24
    BNE loc_39_90F1              ; $90FF  D0 F0
    LDY #$1F                     ; $9101  A0 1F

loc_39_9103:
    LDA $9391,Y                  ; $9103  B9 91 93
    STA $0620,Y                  ; $9106  99 20 06
    DEY                          ; $9109  88
    BPL loc_39_9103              ; $910A  10 F7
    LDX #$00                     ; $910C  A2 00
    LDA #$8A                     ; $910E  A9 8A
    JSR sub_3F_F446              ; $9110  20 46 F4
    LDA #$80                     ; $9113  A9 80
    STA $0528                    ; $9115  8D 28 05
    LDA #$01                     ; $9118  A9 01
    STA $0300                    ; $911A  8D 00 03
    LDA #$80                     ; $911D  A9 80
    STA $0330                    ; $911F  8D 30 03
    LDA #$F0                     ; $9122  A9 F0
    STA $0378                    ; $9124  8D 78 03
    LDY #$13                     ; $9127  A0 13

loc_39_9129:
    LDA $965E,Y                  ; $9129  B9 5E 96
    STA $0200,Y                  ; $912C  99 00 02
    DEY                          ; $912F  88
    BPL loc_39_9129              ; $9130  10 F7
    LDA #$01                     ; $9132  A9 01
    STA $A000                    ; $9134  8D 00 A0
    JSR sub_3F_FF1C              ; $9137  20 1C FF
    LDA #$F0                     ; $913A  A9 F0
    JSR sub_3F_F6BC              ; $913C  20 BC F6
    JSR sub_3E_C451              ; $913F  20 51 C4
    LDA #$00                     ; $9142  A9 00
    STA $45                      ; $9144  85 45
    STA $46                      ; $9146  85 46
    STA $47                      ; $9148  85 47
    STA $48                      ; $914A  85 48
    STA $49                      ; $914C  85 49

loc_39_914E:
    LDA $95                      ; $914E  A5 95
    AND #$01                     ; $9150  29 01
    BEQ loc_39_9163              ; $9152  F0 0F
    DEC $0378                    ; $9154  CE 78 03
    LDA $0378                    ; $9157  AD 78 03
    AND #$07                     ; $915A  29 07
    BNE loc_39_9163              ; $915C  D0 05
    LDA #$40                     ; $915E  A9 40
    JSR sub_3F_F6BE              ; $9160  20 BE F6

loc_39_9163:
    LDA #$14                     ; $9163  A9 14
    STA $97                      ; $9165  85 97
    JSR sub_3F_FCE7              ; $9167  20 E7 FC
    LDA $0378                    ; $916A  AD 78 03
    CMP #$80                     ; $916D  C9 80
    BNE loc_39_914E              ; $916F  D0 DD

loc_39_9171:
    LDA $48                      ; $9171  A5 48
    CMP #$04                     ; $9173  C9 04
    BEQ loc_39_9186              ; $9175  F0 0F
    INC $46                      ; $9177  E6 46
    LDA $47                      ; $9179  A5 47
    CLC                          ; $917B  18
    ADC $46                      ; $917C  65 46
    STA $47                      ; $917E  85 47
    LDA $48                      ; $9180  A5 48
    ADC #$00                     ; $9182  69 00
    STA $48                      ; $9184  85 48

loc_39_9186:
    LDA $49                      ; $9186  A5 49
    CLC                          ; $9188  18
    ADC $47                      ; $9189  65 47
    STA $49                      ; $918B  85 49
    LDA $FC                      ; $918D  A5 FC
    ADC $48                      ; $918F  65 48
    STA $FC                      ; $9191  85 FC
    JSR sub_39_9254              ; $9193  20 54 92
    LDA $95                      ; $9196  A5 95
    AND #$0F                     ; $9198  29 0F
    BNE loc_39_91A1              ; $919A  D0 05
    LDA #$40                     ; $919C  A9 40
    JSR sub_3F_F6BE              ; $919E  20 BE F6

loc_39_91A1:
    LDA #$14                     ; $91A1  A9 14
    STA $97                      ; $91A3  85 97
    JSR sub_3F_FCE7              ; $91A5  20 E7 FC
    DEC $45                      ; $91A8  C6 45
    BNE loc_39_9171              ; $91AA  D0 C5

loc_39_91AC:
    LDA $47                      ; $91AC  A5 47
    SEC                          ; $91AE  38
    SBC $46                      ; $91AF  E5 46
    STA $47                      ; $91B1  85 47
    LDA $48                      ; $91B3  A5 48
    SBC #$00                     ; $91B5  E9 00
    STA $48                      ; $91B7  85 48
    BCC loc_39_91E2              ; $91B9  90 27
    DEC $46                      ; $91BB  C6 46
    LDA $49                      ; $91BD  A5 49
    CLC                          ; $91BF  18
    ADC $47                      ; $91C0  65 47
    STA $49                      ; $91C2  85 49
    LDA $FC                      ; $91C4  A5 FC
    ADC $48                      ; $91C6  65 48
    STA $FC                      ; $91C8  85 FC
    JSR sub_39_9254              ; $91CA  20 54 92
    LDA $95                      ; $91CD  A5 95
    AND #$0F                     ; $91CF  29 0F
    BNE loc_39_91D8              ; $91D1  D0 05
    LDA #$40                     ; $91D3  A9 40
    JSR sub_3F_F6BE              ; $91D5  20 BE F6

loc_39_91D8:
    LDA #$14                     ; $91D8  A9 14
    STA $97                      ; $91DA  85 97
    JSR sub_3F_FCE7              ; $91DC  20 E7 FC
    JMP loc_39_91AC              ; $91DF  4C AC 91


loc_39_91E2:
    LDA #$8C                     ; $91E2  A9 8C
    LDX #$00                     ; $91E4  A2 00
    JSR sub_3F_F446              ; $91E6  20 46 F4
    LDY #$01                     ; $91E9  A0 01
    LDA #$8B                     ; $91EB  A9 8B
    JSR sub_3F_F452              ; $91ED  20 52 F4
    LDA #$80                     ; $91F0  A9 80
    STA $0529                    ; $91F2  8D 29 05
    LDA #$01                     ; $91F5  A9 01
    STA $0301                    ; $91F7  8D 01 03

loc_39_91FA:
    DEC $0379                    ; $91FA  CE 79 03
    LDA #$14                     ; $91FD  A9 14
    STA $97                      ; $91FF  85 97
    JSR sub_3F_FCE7              ; $9201  20 E7 FC
    LDA #$00                     ; $9204  A9 00
    STA $95                      ; $9206  85 95
    LDA $0379                    ; $9208  AD 79 03
    CMP #$50                     ; $920B  C9 50
    BNE loc_39_91FA              ; $920D  D0 EB
    LDA #$B4                     ; $920F  A9 B4
    JSR sub_39_9272              ; $9211  20 72 92

loc_39_9214:
    INC $0379                    ; $9214  EE 79 03
    LDA #$14                     ; $9217  A9 14
    STA $97                      ; $9219  85 97
    JSR sub_3F_FCE7              ; $921B  20 E7 FC
    LDA #$00                     ; $921E  A9 00
    STA $95                      ; $9220  85 95
    LDA $0379                    ; $9222  AD 79 03
    CMP #$80                     ; $9225  C9 80
    BNE loc_39_9214              ; $9227  D0 EB
    LDY #$01                     ; $9229  A0 01
    JSR sub_3F_FCCF              ; $922B  20 CF FC
    LDA #$8A                     ; $922E  A9 8A
    LDX #$00                     ; $9230  A2 00
    JSR sub_3F_F446              ; $9232  20 46 F4
    LDA #$3C                     ; $9235  A9 3C
    JSR sub_39_9272              ; $9237  20 72 92
    LDA #$89                     ; $923A  A9 89
    LDX #$00                     ; $923C  A2 00
    JSR sub_3F_F446              ; $923E  20 46 F4

loc_39_9241:
    LDA #$14                     ; $9241  A9 14
    STA $97                      ; $9243  85 97
    JSR sub_3F_FCE7              ; $9245  20 E7 FC
    LDA $0300                    ; $9248  AD 00 03
    BNE loc_39_9241              ; $924B  D0 F4
    LDA #$00                     ; $924D  A9 00
    STA $9A                      ; $924F  85 9A
    JMP loc_39_83E8              ; $9251  4C E8 83


sub_39_9254:
    LDA $47                      ; $9254  A5 47
    STA $00                      ; $9256  85 00
    LDA $48                      ; $9258  A5 48
    STA $01                      ; $925A  85 01
    ASL $00                      ; $925C  06 00
    ROL $01                      ; $925E  26 01
    LDY #$14                     ; $9260  A0 14

loc_39_9262:
    LDA $0203,Y                  ; $9262  B9 03 02
    SEC                          ; $9265  38
    SBC $01                      ; $9266  E5 01
    STA $0203,Y                  ; $9268  99 03 02
    DEY                          ; $926B  88
    DEY                          ; $926C  88
    DEY                          ; $926D  88
    DEY                          ; $926E  88
    BPL loc_39_9262              ; $926F  10 F1
    RTS                          ; $9271  60


sub_39_9272:
    PHA                          ; $9272  48
    LDA #$1C                     ; $9273  A9 1C
    STA $97                      ; $9275  85 97
    JSR sub_3F_FCE7              ; $9277  20 E7 FC
    PLA                          ; $927A  68
    SEC                          ; $927B  38
    SBC #$01                     ; $927C  E9 01
    BNE sub_39_9272              ; $927E  D0 F2
    RTS                          ; $9280  60


sub_39_9281:
    STY $04                      ; $9281  84 04
    LDA $94D9,Y                  ; $9283  B9 D9 94
    STA $02                      ; $9286  85 02
    LDA $94F1,Y                  ; $9288  B9 F1 94
    STA $03                      ; $928B  85 03
    LDY #$00                     ; $928D  A0 00
    STY $0782                    ; $928F  8C 82 07
    LDA ($02),Y                  ; $9292  B1 02
    STA $0780                    ; $9294  8D 80 07
    INY                          ; $9297  C8
    LDA ($02),Y                  ; $9298  B1 02
    STA $0781                    ; $929A  8D 81 07
    INY                          ; $929D  C8

loc_39_929E:
    LDA ($02),Y                  ; $929E  B1 02
    CMP #$FF                     ; $92A0  C9 FF
    BEQ loc_39_92C8              ; $92A2  F0 24
    STA $0783                    ; $92A4  8D 83 07
    LDA #$FF                     ; $92A7  A9 FF
    STA $0784                    ; $92A9  8D 84 07
    STA $19                      ; $92AC  85 19
    LDA $04                      ; $92AE  A5 04
    CMP #$0B                     ; $92B0  C9 0B
    BCC loc_39_92B8              ; $92B2  90 04
    CMP #$13                     ; $92B4  C9 13
    BCC loc_39_92BD              ; $92B6  90 05

loc_39_92B8:
    LDA #$35                     ; $92B8  A9 35
    JSR sub_3F_F6BE              ; $92BA  20 BE F6

loc_39_92BD:
    LDX #$0A                     ; $92BD  A2 0A
    JSR sub_3F_FF15              ; $92BF  20 15 FF
    INC $0781                    ; $92C2  EE 81 07
    INY                          ; $92C5  C8
    BNE loc_39_929E              ; $92C6  D0 D6

loc_39_92C8:
    RTS                          ; $92C8  60


sub_39_92C9:
    LDY $9529,X                  ; $92C9  BC 29 95
    LDX #$00                     ; $92CC  A2 00

loc_39_92CE:
    LDA $952E,Y                  ; $92CE  B9 2E 95
    STA $0780,X                  ; $92D1  9D 80 07
    CMP #$FF                     ; $92D4  C9 FF
    BEQ loc_39_92DC              ; $92D6  F0 04
    INY                          ; $92D8  C8
    INX                          ; $92D9  E8
    BNE loc_39_92CE              ; $92DA  D0 F2

loc_39_92DC:
    STA $19                      ; $92DC  85 19
    RTS                          ; $92DE  60

    .byte $0F,$29,$19,$0F,$0F,$3C,$2C,$11,$0F,$2C,$11,$01,$0F,$00,$00,$00  ; $92DF
    .byte $0F,$2C,$11,$01,$0F,$20,$37,$27,$0F,$20,$11,$27,$0F,$2C,$11,$16  ; $92EF
    .byte $0F,$20,$14,$04,$0F,$20,$37,$27,$0F,$20,$14,$27,$0F,$20,$14,$16  ; $92FF
    .byte $0F,$31,$29,$19,$0F,$20,$37,$27,$0F,$20,$29,$27,$0F,$31,$29,$16  ; $930F
    .byte $0F,$10,$16,$06,$0F,$20,$37,$27,$0F,$20,$16,$27,$0F,$10,$16,$16  ; $931F
    .byte $0F,$36,$26,$16,$0F,$20,$37,$27,$0F,$20,$26,$27,$0F,$36,$26,$16  ; $932F
    .byte $0F,$38,$18,$08,$0F,$20,$37,$27,$0F,$20,$18,$27,$0F,$38,$18,$16  ; $933F
    .byte $0F,$20,$10,$00,$0F,$20,$37,$27,$0F,$20,$10,$27,$0F,$20,$10,$16  ; $934F
    .byte $0F,$20,$11,$01,$0F,$20,$37,$27,$0F,$20,$11,$27,$0F,$20,$11,$16  ; $935F
    .byte $0F,$3C,$21,$1C,$0F,$20,$37,$27,$0F,$20,$21,$27,$0F,$3C,$21,$16  ; $936F
    .byte $0F,$20,$16,$06,$0F,$20,$16,$27,$0F,$20,$37,$27,$0F,$37,$16,$06  ; $937F
    .byte $16,$0F,$0F,$30,$21,$0B,$0F,$27,$26,$13,$0F,$30,$27,$19,$0F,$30  ; $938F
    .byte $21,$13,$0F,$0F,$11,$2C,$0F,$0F,$28,$20,$0F,$0F,$20,$37,$0F,$0F  ; $939F
    .byte $0F,$0F,$0C,$04,$09,$0B,$08,$0A,$07,$0D,$21,$4F,$06,$9B,$9B,$9B  ; $93AF
    .byte $9B,$9B,$9B,$9B,$21,$8F,$0D,$9B,$9B,$9B,$9B,$9B,$9B,$9B,$9B,$9B  ; $93BF
    .byte $9B,$9B,$9B,$9B,$9B,$FF,$21,$4F,$98,$8E,$94,$9A,$86,$8E,$93,$FF  ; $93CF
    .byte $21,$8F,$85,$8B,$80,$92,$87,$9A,$92,$93,$8E,$8F,$8F,$84,$91,$FF  ; $93DF
    .byte $21,$8F,$91,$80,$88,$8D,$9A,$85,$8B,$94,$92,$87,$FF,$21,$8F,$83  ; $93EF
    .byte $91,$88,$8B,$8B,$9A,$81,$8E,$8C,$81,$FF,$21,$8F,$8F,$87,$80,$91  ; $93FF
    .byte $80,$8E,$87,$9A,$92,$87,$8E,$93,$FF,$21,$8F,$91,$88,$8D,$86,$9A  ; $940F
    .byte $81,$8E,$8E,$8C,$84,$91,$80,$8D,$86,$FF,$21,$8F,$83,$94,$92,$93  ; $941F
    .byte $9A,$82,$91,$94,$92,$87,$84,$91,$FF,$21,$8F,$83,$88,$95,$84,$9A  ; $942F
    .byte $8C,$88,$92,$92,$88,$8B,$84,$FF,$21,$8F,$92,$8A,$94,$8B,$8B,$9A  ; $943F
    .byte $81,$80,$91,$91,$88,$84,$91,$FF,$21,$8F,$91,$94,$92,$87,$9A,$89  ; $944F
    .byte $84,$93,$FF,$21,$8F,$91,$94,$92,$87,$9A,$8C,$80,$91,$88,$8D,$84  ; $945F
    .byte $FF,$22,$4B,$81,$91,$88,$86,$87,$93,$9A,$8C,$80,$8D,$FF,$22,$4C  ; $946F
    .byte $93,$8E,$80,$83,$9A,$8C,$80,$8D,$FF,$22,$4B,$83,$91,$88,$8B,$8B  ; $947F
    .byte $9A,$8C,$80,$8D,$FF,$22,$4A,$8F,$87,$80,$91,$80,$8E,$87,$9A,$8C  ; $948F
    .byte $80,$8D,$FF,$22,$4C,$91,$88,$8D,$86,$9A,$8C,$80,$8D,$FF,$22,$4C  ; $949F
    .byte $83,$94,$92,$93,$9A,$8C,$80,$8D,$FF,$22,$4C,$83,$88,$95,$84,$9A  ; $94AF
    .byte $8C,$80,$8D,$FF,$22,$4B,$92,$8A,$94,$8B,$8B,$9A,$8C,$80,$8D,$FF  ; $94BF
    .byte $21,$D5,$80,$83,$80,$8F,$93,$8E,$91,$FF,$D5,$DF,$EF,$FC,$09,$18  ; $94CF
    .byte $29,$38,$47,$57,$62,$70,$7D,$88,$94,$A2,$AD,$B8,$C3,$CF,$09,$18  ; $94DF
    .byte $29,$38,$93,$93,$93,$93,$94,$94,$94,$94,$94,$94,$94,$94,$94,$94  ; $94EF
    .byte $94,$94,$94,$94,$94,$94,$94,$94,$94,$94,$11,$30,$2C,$01,$11,$01  ; $94FF
    .byte $30,$0F,$11,$00,$00,$00,$11,$00,$00,$00,$11,$30,$11,$16,$11,$00  ; $950F
    .byte $00,$00,$11,$00,$00,$00,$11,$00,$00,$00,$00,$13,$3A,$48,$5B,$22  ; $951F
    .byte $E9,$0E,$9A,$9A,$9A,$9A,$9A,$9A,$9A,$9A,$9A,$9A,$9A,$9A,$9A,$9A  ; $952F
    .byte $9A,$FF,$22,$CB,$0B,$92,$93,$80,$86,$84,$9A,$92,$84,$8B,$84,$82  ; $953F
    .byte $93,$23,$0B,$07,$82,$8E,$8D,$93,$88,$8D,$94,$84,$22,$EC,$08,$9A  ; $954F
    .byte $9A,$9A,$9A,$9A,$9A,$9A,$9A,$9A,$FF,$22,$EB,$09,$82,$8E,$8D,$93  ; $955F
    .byte $88,$8D,$94,$84,$9A,$9A,$FF,$22,$E9,$0E,$8F,$80,$92,$92,$9A,$96  ; $956F
    .byte $8E,$91,$83,$9A,$84,$91,$91,$8E,$91,$FF,$22,$EC,$08,$86,$80,$8C  ; $957F
    .byte $84,$9A,$8E,$95,$84,$91,$FF,$0F,$30,$2C,$11,$0F,$36,$26,$16,$0F  ; $958F
    .byte $16,$26,$36,$0F,$16,$16,$16,$0F,$30,$2C,$11,$0F,$30,$38,$29,$0F  ; $959F
    .byte $29,$38,$30,$0F,$29,$29,$29,$0F,$30,$2C,$11,$0F,$20,$10,$16,$0F  ; $95AF
    .byte $16,$10,$20,$0F,$16,$16,$16,$0F,$30,$2C,$11,$0F,$30,$37,$27,$0F  ; $95BF
    .byte $27,$37,$30,$0F,$27,$27,$27,$0F,$30,$2C,$11,$0F,$36,$27,$16,$0F  ; $95CF
    .byte $16,$27,$36,$0F,$16,$16,$16,$0F,$30,$2C,$11,$0F,$20,$21,$11,$0F  ; $95DF
    .byte $11,$21,$20,$0F,$11,$11,$11,$0F,$30,$2C,$11,$0F,$3C,$2C,$11,$0F  ; $95EF
    .byte $1C,$2C,$3C,$0F,$1C,$1C,$1C,$0F,$30,$2C,$11,$0F,$20,$10,$00,$0F  ; $95FF
    .byte $00,$10,$20,$0F,$00,$00,$00,$0F,$0F,$2C,$11,$0F,$0F,$30,$37,$0F  ; $960F
    .byte $0F,$20,$26,$0F,$0F,$20,$29,$0F,$0F,$38,$29,$0F,$0F,$27,$2C,$0F  ; $961F
    .byte $0F,$20,$16,$0F,$0F,$20,$10,$0F,$0F,$20,$27,$0F,$20,$2C,$11,$0F  ; $962F
    .byte $0F,$28,$16,$0F,$0F,$20,$29,$0F,$0F,$20,$10,$0F,$0F,$20,$21,$0F  ; $963F
    .byte $0F,$20,$1C,$0F,$0F,$20,$16,$0F,$0F,$20,$16,$0F,$0F,$20,$10,$1C  ; $964F
    .byte $2F,$01,$44,$24,$2F,$01,$E4,$44,$2F,$01,$74,$54,$2F,$01,$C4,$9C  ; $965F
    .byte $2F,$01,$14  ; $966F

loc_39_9672:
    JSR sub_39_8F49              ; $9672  20 49 8F
    LDA #$0D                     ; $9675  A9 0D
    JSR sub_3F_F6BC              ; $9677  20 BC F6
    LDY #$A0                     ; $967A  A0 A0

loc_39_967C:
    LDA $98F9,Y                  ; $967C  B9 F9 98
    STA $01FF,Y                  ; $967F  99 FF 01
    DEY                          ; $9682  88
    BNE loc_39_967C              ; $9683  D0 F7
    LDA #$00                     ; $9685  A9 00
    STA $10                      ; $9687  85 10
    STA $11                      ; $9689  85 11
    STA $95                      ; $968B  85 95

loc_39_968D:
    LDA $14                      ; $968D  A5 14
    AND #$03                     ; $968F  29 03
    BEQ loc_39_96D1              ; $9691  F0 3E
    AND #$01                     ; $9693  29 01
    TAX                          ; $9695  AA
    LDA #$2E                     ; $9696  A9 2E
    JSR sub_3F_F6BE              ; $9698  20 BE F6
    LDA $11                      ; $969B  A5 11
    STA $00                      ; $969D  85 00
    CLC                          ; $969F  18
    ADC $99A8,X                  ; $96A0  7D A8 99
    STA $11                      ; $96A3  85 11
    CMP #$06                     ; $96A5  C9 06
    BEQ loc_39_96C9              ; $96A7  F0 20
    CMP #$FF                     ; $96A9  C9 FF
    BEQ loc_39_96C9              ; $96AB  F0 1C
    CMP #$07                     ; $96AD  C9 07
    BEQ loc_39_96C1              ; $96AF  F0 10
    CMP #$05                     ; $96B1  C9 05
    BNE loc_39_96D1              ; $96B3  D0 1C
    LDA $00                      ; $96B5  A5 00
    CMP #$06                     ; $96B7  C9 06
    BNE loc_39_96D1              ; $96B9  D0 16
    LDA #$00                     ; $96BB  A9 00
    STA $10                      ; $96BD  85 10
    BEQ loc_39_9701              ; $96BF  F0 40

loc_39_96C1:
    LDA #$00                     ; $96C1  A9 00
    STA $10                      ; $96C3  85 10
    STA $11                      ; $96C5  85 11
    BEQ loc_39_9701              ; $96C7  F0 38

loc_39_96C9:
    LDA #$06                     ; $96C9  A9 06
    STA $10                      ; $96CB  85 10
    STA $11                      ; $96CD  85 11
    BNE loc_39_9701              ; $96CF  D0 30

loc_39_96D1:
    LDA $10                      ; $96D1  A5 10
    CMP #$06                     ; $96D3  C9 06
    BEQ loc_39_9701              ; $96D5  F0 2A
    LDA $14                      ; $96D7  A5 14
    AND #$0C                     ; $96D9  29 0C
    BEQ loc_39_9701              ; $96DB  F0 24
    AND #$04                     ; $96DD  29 04
    LSR A                        ; $96DF  4A
    LSR A                        ; $96E0  4A
    TAX                          ; $96E1  AA
    LDA #$2E                     ; $96E2  A9 2E
    JSR sub_3F_F6BE              ; $96E4  20 BE F6
    LDA $10                      ; $96E7  A5 10
    CLC                          ; $96E9  18
    ADC $99A8,X                  ; $96EA  7D A8 99
    STA $10                      ; $96ED  85 10
    CMP #$06                     ; $96EF  C9 06
    BEQ loc_39_96FD              ; $96F1  F0 0A
    CMP #$FF                     ; $96F3  C9 FF
    BNE loc_39_9701              ; $96F5  D0 0A
    LDA #$05                     ; $96F7  A9 05
    STA $10                      ; $96F9  85 10
    BNE loc_39_9701              ; $96FB  D0 04

loc_39_96FD:
    LDA #$00                     ; $96FD  A9 00
    STA $10                      ; $96FF  85 10

loc_39_9701:
    LDA $14                      ; $9701  A5 14
    AND #$80                     ; $9703  29 80
    BEQ loc_39_9722              ; $9705  F0 1B
    LDA $11                      ; $9707  A5 11
    CMP #$06                     ; $9709  C9 06
    BEQ loc_39_972D              ; $970B  F0 20
    LDA $10                      ; $970D  A5 10
    ASL A                        ; $970F  0A
    STA $00                      ; $9710  85 00
    ASL A                        ; $9712  0A
    ADC $00                      ; $9713  65 00
    ADC $11                      ; $9715  65 11
    ASL A                        ; $9717  0A
    ASL A                        ; $9718  0A
    TAY                          ; $9719  A8
    LDA $0201,Y                  ; $971A  B9 01 02
    EOR #$01                     ; $971D  49 01
    STA $0201,Y                  ; $971F  99 01 02

loc_39_9722:
    JSR sub_39_983A              ; $9722  20 3A 98
    INC $95                      ; $9725  E6 95
    JSR sub_3F_FF1C              ; $9727  20 1C FF
    JMP loc_39_968D              ; $972A  4C 8D 96


loc_39_972D:
    LDY #$90                     ; $972D  A0 90
    LDX #$00                     ; $972F  A2 00

loc_39_9731:
    LDA $01FD,Y                  ; $9731  B9 FD 01
    BEQ loc_39_973B              ; $9734  F0 05
    INX                          ; $9736  E8
    CPX #$07                     ; $9737  E0 07
    BEQ loc_39_9772              ; $9739  F0 37

loc_39_973B:
    DEY                          ; $973B  88
    DEY                          ; $973C  88
    DEY                          ; $973D  88
    DEY                          ; $973E  88
    BNE loc_39_9731              ; $973F  D0 F0
    CPX #$06                     ; $9741  E0 06
    BNE loc_39_9772              ; $9743  D0 2D
    LDY #$04                     ; $9745  A0 04

loc_39_9747:
    LDX $99AA,Y                  ; $9747  BE AA 99
    LDA $0201,X                  ; $974A  BD 01 02
    BNE loc_39_9772              ; $974D  D0 23
    DEY                          ; $974F  88
    BPL loc_39_9747              ; $9750  10 F5
    LDY #$0A                     ; $9752  A0 0A
    LDA #$00                     ; $9754  A9 00
    STA $00                      ; $9756  85 00

loc_39_9758:
    LDX $99AF,Y                  ; $9758  BE AF 99
    LDA $0201,X                  ; $975B  BD 01 02
    BEQ loc_39_9769              ; $975E  F0 09
    LDA $00                      ; $9760  A5 00
    BNE loc_39_9772              ; $9762  D0 0E
    TYA                          ; $9764  98
    ORA #$80                     ; $9765  09 80
    STA $00                      ; $9767  85 00

loc_39_9769:
    DEY                          ; $9769  88
    BPL loc_39_9758              ; $976A  10 EC
    LDY #$0F                     ; $976C  A0 0F
    LDA $00                      ; $976E  A5 00
    BMI loc_39_9775              ; $9770  30 03

loc_39_9772:
    JMP loc_39_981D              ; $9772  4C 1D 98


loc_39_9775:
    LDA #$00                     ; $9775  A9 00
    STA $0780,Y                  ; $9777  99 80 07
    DEY                          ; $977A  88
    BPL loc_39_9775              ; $977B  10 F8
    LDA #$9C                     ; $977D  A9 9C
    STA $0780                    ; $977F  8D 80 07
    LDA $00                      ; $9782  A5 00
    AND #$0F                     ; $9784  29 0F
    STA $00                      ; $9786  85 00
    LDY #$00                     ; $9788  A0 00
    STY $04                      ; $978A  84 04
    STY $05                      ; $978C  84 05

loc_39_978E:
    JSR sub_39_9801              ; $978E  20 01 98
    LDA $01                      ; $9791  A5 01
    CMP #$01                     ; $9793  C9 01
    BNE loc_39_9772              ; $9795  D0 DB
    LDA $02                      ; $9797  A5 02
    AND #$03                     ; $9799  29 03
    CMP #$03                     ; $979B  C9 03
    BEQ loc_39_97D7              ; $979D  F0 38
    AND #$02                     ; $979F  29 02
    BNE loc_39_97A5              ; $97A1  D0 02
    LDA #$01                     ; $97A3  A9 01

loc_39_97A5:
    CLC                          ; $97A5  18
    ADC $04                      ; $97A6  65 04
    STA $04                      ; $97A8  85 04
    LDX $02                      ; $97AA  A6 02
    LDA $05                      ; $97AC  A5 05
    ORA $99CE,X                  ; $97AE  1D CE 99
    STA $05                      ; $97B1  85 05
    LDA $02                      ; $97B3  A5 02
    ASL A                        ; $97B5  0A
    ADC $02                      ; $97B6  65 02
    TAX                          ; $97B8  AA
    STY $06                      ; $97B9  84 06
    LDA #$9C                     ; $97BB  A9 9C
    LDY $99E2,X                  ; $97BD  BC E2 99
    BEQ loc_39_97D5              ; $97C0  F0 13
    STA $0780,Y                  ; $97C2  99 80 07
    LDY $99E3,X                  ; $97C5  BC E3 99
    BEQ loc_39_97D5              ; $97C8  F0 0B
    STA $0780,Y                  ; $97CA  99 80 07
    LDY $99E4,X                  ; $97CD  BC E4 99
    BEQ loc_39_97D5              ; $97D0  F0 03
    STA $0780,Y                  ; $97D2  99 80 07

loc_39_97D5:
    LDY $06                      ; $97D5  A4 06

loc_39_97D7:
    CPY #$14                     ; $97D7  C0 14
    BNE loc_39_978E              ; $97D9  D0 B3
    LDA $00                      ; $97DB  A5 00
    CMP $04                      ; $97DD  C5 04
    BNE loc_39_981D              ; $97DF  D0 3C
    LDA #$2F                     ; $97E1  A9 2F
    JSR sub_3F_F6BE              ; $97E3  20 BE F6
    LDX #$3C                     ; $97E6  A2 3C
    JSR sub_3F_FF15              ; $97E8  20 15 FF
    LDY #$0F                     ; $97EB  A0 0F

loc_39_97ED:
    LDA $0780,Y                  ; $97ED  B9 80 07
    STA $00B0,Y                  ; $97F0  99 B0 00
    DEY                          ; $97F3  88
    BPL loc_39_97ED              ; $97F4  10 F7
    LDA $05                      ; $97F6  A5 05
    STA $A9                      ; $97F8  85 A9
    LDA #$00                     ; $97FA  A9 00
    STA $AA                      ; $97FC  85 AA
    JMP loc_39_809D              ; $97FE  4C 9D 80


sub_39_9801:
    LDA #$00                     ; $9801  A9 00
    STA $01                      ; $9803  85 01
    STA $02                      ; $9805  85 02
    LDA #$04                     ; $9807  A9 04
    STA $03                      ; $9809  85 03

loc_39_980B:
    LDX $99BA,Y                  ; $980B  BE BA 99
    LDA $0201,X                  ; $980E  BD 01 02
    BEQ loc_39_9817              ; $9811  F0 04
    STY $02                      ; $9813  84 02
    INC $01                      ; $9815  E6 01

loc_39_9817:
    INY                          ; $9817  C8
    DEC $03                      ; $9818  C6 03
    BNE loc_39_980B              ; $981A  D0 EF
    RTS                          ; $981C  60


loc_39_981D:
    LDA #$2D                     ; $981D  A9 2D
    JSR sub_3F_F6BE              ; $981F  20 BE F6
    LDY #$00                     ; $9822  A0 00
    STY $10                      ; $9824  84 10
    STY $11                      ; $9826  84 11
    LDX #$03                     ; $9828  A2 03
    JSR sub_39_92C9              ; $982A  20 C9 92
    LDX #$F0                     ; $982D  A2 F0
    JSR sub_3F_FF15              ; $982F  20 15 FF
    LDX #$00                     ; $9832  A2 00
    JSR sub_39_92C9              ; $9834  20 C9 92
    JMP loc_39_9722              ; $9837  4C 22 97


sub_39_983A:
    LDA $95                      ; $983A  A5 95
    LSR A                        ; $983C  4A
    LSR A                        ; $983D  4A
    LSR A                        ; $983E  4A
    BCS loc_39_9877              ; $983F  B0 36
    LDY $10                      ; $9841  A4 10
    LDA $999A,Y                  ; $9843  B9 9A 99
    STA $0290                    ; $9846  8D 90 02
    STA $0294                    ; $9849  8D 94 02
    CLC                          ; $984C  18
    ADC #$08                     ; $984D  69 08
    STA $0298                    ; $984F  8D 98 02
    STA $029C                    ; $9852  8D 9C 02
    LDY $11                      ; $9855  A4 11
    LDA $99A1,Y                  ; $9857  B9 A1 99
    STA $0293                    ; $985A  8D 93 02
    STA $029B                    ; $985D  8D 9B 02
    CLC                          ; $9860  18
    ADC #$08                     ; $9861  69 08
    STA $0297                    ; $9863  8D 97 02
    STA $029F                    ; $9866  8D 9F 02
    CPY #$06                     ; $9869  C0 06
    BNE loc_39_9876              ; $986B  D0 09
    CLC                          ; $986D  18
    ADC #$10                     ; $986E  69 10
    STA $0297                    ; $9870  8D 97 02
    STA $029F                    ; $9873  8D 9F 02

loc_39_9876:
    RTS                          ; $9876  60


loc_39_9877:
    LDA #$F8                     ; $9877  A9 F8
    STA $0290                    ; $9879  8D 90 02
    STA $0294                    ; $987C  8D 94 02
    STA $0298                    ; $987F  8D 98 02
    STA $029C                    ; $9882  8D 9C 02
    RTS                          ; $9885  60


sub_39_9886:
    LDY #$90                     ; $9886  A0 90

loc_39_9888:
    LDA $98F9,Y                  ; $9888  B9 F9 98
    STA $01FF,Y                  ; $988B  99 FF 01
    DEY                          ; $988E  88
    BNE loc_39_9888              ; $988F  D0 F7
    LDA #$00                     ; $9891  A9 00
    STA $00                      ; $9893  85 00
    LDY #$09                     ; $9895  A0 09

loc_39_9897:
    LDA $00B4,Y                  ; $9897  B9 B4 00
    BEQ loc_39_989E              ; $989A  F0 02
    INC $00                      ; $989C  E6 00

loc_39_989E:
    DEY                          ; $989E  88
    BPL loc_39_9897              ; $989F  10 F6
    LDY $00                      ; $98A1  A4 00
    LDX $99AF,Y                  ; $98A3  BE AF 99
    LDA #$01                     ; $98A6  A9 01
    STA $0201,X                  ; $98A8  9D 01 02
    LDY #$00                     ; $98AB  A0 00
    STY $00                      ; $98AD  84 00
    STY $01                      ; $98AF  84 01

loc_39_98B1:
    LDA #$00                     ; $98B1  A9 00
    STA $02                      ; $98B3  85 02
    LDX $9A1E,Y                  ; $98B5  BE 1E 9A
    LDA $B0,X                    ; $98B8  B5 B0
    BPL loc_39_98C9              ; $98BA  10 0D
    LDX $9A1F,Y                  ; $98BC  BE 1F 9A
    LDA $B0,X                    ; $98BF  B5 B0
    BPL loc_39_98D6              ; $98C1  10 13
    LDA #$02                     ; $98C3  A9 02
    STA $02                      ; $98C5  85 02
    BNE loc_39_98D6              ; $98C7  D0 0D

loc_39_98C9:
    INC $02                      ; $98C9  E6 02
    LDX $9A1F,Y                  ; $98CB  BE 1F 9A
    LDA $B0,X                    ; $98CE  B5 B0
    BMI loc_39_98D6              ; $98D0  30 04
    LDA #$03                     ; $98D2  A9 03
    STA $02                      ; $98D4  85 02

loc_39_98D6:
    LDA $01                      ; $98D6  A5 01
    ORA $02                      ; $98D8  05 02
    TAY                          ; $98DA  A8
    LDX $99BA,Y                  ; $98DB  BE BA 99
    LDA #$01                     ; $98DE  A9 01
    STA $0201,X                  ; $98E0  9D 01 02
    INC $01                      ; $98E3  E6 01
    INC $01                      ; $98E5  E6 01
    INC $01                      ; $98E7  E6 01
    INC $01                      ; $98E9  E6 01
    INC $00                      ; $98EB  E6 00
    INC $00                      ; $98ED  E6 00
    LDY $00                      ; $98EF  A4 00
    CPY #$0A                     ; $98F1  C0 0A
    BNE loc_39_98B1              ; $98F3  D0 BC
    RTS                          ; $98F5  60

    .byte $A4,$2F,$01,$D4,$27,$00,$00,$38,$27,$00,$00,$48,$27,$00,$00,$58  ; $98F6
    .byte $27,$00,$00,$68,$27,$00,$00,$78,$27,$00,$00,$88,$37,$00,$00,$38  ; $9906
    .byte $37,$00,$00,$48,$37,$00,$00,$58,$37,$00,$00,$68,$37,$00,$00,$78  ; $9916
    .byte $37,$00,$00,$88,$47,$00,$00,$38,$47,$00,$00,$48,$47,$00,$00,$58  ; $9926
    .byte $47,$00,$00,$68,$47,$00,$00,$78,$47,$00,$00,$88,$57,$00,$00,$38  ; $9936
    .byte $57,$00,$00,$48,$57,$00,$00,$58,$57,$00,$00,$68,$57,$00,$00,$78  ; $9946
    .byte $57,$00,$00,$88,$67,$00,$00,$38,$67,$00,$00,$48,$67,$00,$00,$58  ; $9956
    .byte $67,$00,$00,$68,$67,$00,$00,$78,$67,$00,$00,$88,$77,$00,$00,$38  ; $9966
    .byte $77,$00,$00,$48,$77,$00,$00,$58,$77,$00,$00,$68,$77,$00,$00,$78  ; $9976
    .byte $77,$00,$00,$88,$23,$03,$00,$34,$23,$03,$40,$38,$2B,$03,$80,$34  ; $9986
    .byte $2B,$03,$C0,$38,$23,$33,$43,$53,$63,$73,$4B,$34,$44,$54,$64,$74  ; $9996
    .byte $84,$BC,$FF,$01,$58,$5C,$84,$70,$8C,$88,$14,$1C,$20,$30,$3C,$44  ; $99A6
    .byte $4C,$6C,$74,$78,$34,$18,$00,$04,$38,$24,$0C,$08,$2C,$40,$28,$10  ; $99B6
    .byte $60,$7C,$64,$48,$54,$50,$80,$68,$01,$02,$03,$00,$04,$08,$0C,$00  ; $99C6
    .byte $10,$20,$30,$00,$40,$80,$C0,$00,$00,$00,$00,$00,$0C,$00,$00,$04  ; $99D6
    .byte $03,$00,$0C,$04,$03,$00,$00,$00,$09,$02,$00,$0B,$00,$00,$09,$0B  ; $99E6
    .byte $02,$00,$00,$00,$08,$00,$00,$0A,$00,$00,$08,$0A,$00,$00,$00,$00  ; $99F6
    .byte $07,$00,$00,$0D,$00,$00,$07,$0D,$00,$00,$00,$00,$05,$00,$00,$06  ; $9A06
    .byte $00,$00,$05,$06,$00,$00,$00,$00,$0C,$04,$09,$0B,$08,$0A,$07,$0D  ; $9A16
    .byte $05,$06,$A9,$00,$85,$9A,$20,$57,$C4,$A9,$04,$85,$97,$20,$21,$C4  ; $9A26
    .byte $20,$1C,$FF,$20,$69,$C3,$A2,$12,$20,$05,$DA,$20,$73,$C3,$A0,$07  ; $9A36
    .byte $B9,$75,$9B,$99,$30,$06,$88,$10,$F7,$20,$1C,$FF,$AD,$F0,$06,$8D  ; $9A46
    .byte $C0,$06,$AD,$F1,$06,$8D,$C1,$06,$AD,$F2,$06,$8D,$C2,$06,$AD,$F3  ; $9A56
    .byte $06,$8D,$C3,$06,$A9,$00,$8D,$F0,$06,$8D,$F1,$06,$8D,$F2,$06,$8D  ; $9A66
    .byte $F3,$06,$20,$51,$C4,$A9,$00,$85,$10,$A5,$14,$29,$10,$D0,$6A,$A5  ; $9A76
    .byte $14,$29,$80,$D0,$14,$A5,$14,$29,$40,$F0,$42,$E6,$10,$A5,$10,$C9  ; $9A86
    .byte $18,$D0,$3A,$A9,$00,$85,$10,$F0,$34,$A4,$10,$BE,$5E,$9C,$FE,$00  ; $9A96
    .byte $06,$BD,$00,$06,$29,$3F,$9D,$00,$06,$9D,$20,$06,$C9,$10,$B0,$08  ; $9AA6
    .byte $C9,$0D,$90,$19,$A9,$0F,$D0,$0F,$29,$0F,$C9,$0D,$90,$0F,$BD,$00  ; $9AB6
    .byte $06,$29,$30,$69,$10,$29,$30,$9D,$00,$06,$9D,$20,$06,$20,$30,$9B  ; $9AC6
    .byte $A5,$10,$48,$AD,$00,$06,$8D,$10,$06,$8D,$30,$06,$A9,$FF,$85,$18  ; $9AD6
    .byte $20,$1C,$FF,$68,$85,$10,$4C,$7F,$9A,$20,$57,$C4,$A9,$04,$85,$97  ; $9AE6
    .byte $20,$21,$C4,$20,$1C,$FF,$20,$69,$C3,$A2,$13,$20,$05,$DA,$20,$73  ; $9AF6
    .byte $C3,$A0,$07,$B9,$7D,$9B,$99,$30,$06,$88,$10,$F7,$AD,$C0,$06,$8D  ; $9B06
    .byte $F0,$06,$AD,$C1,$06,$8D,$F1,$06,$AD,$C2,$06,$8D,$F2,$06,$AD,$C3  ; $9B16
    .byte $06,$8D,$F3,$06,$20,$1C,$FF,$4C,$51,$C4,$A0,$00,$B9,$85,$9B,$C9  ; $9B26
    .byte $FF,$F0,$06,$99,$00,$02,$C8,$D0,$F3,$A2,$00,$A0,$00,$BD,$00,$06  ; $9B36
    .byte $48,$4A,$4A,$4A,$4A,$99,$01,$02,$68,$29,$0F,$99,$05,$02,$98,$18  ; $9B46
    .byte $69,$08,$A8,$E8,$E0,$20,$F0,$08,$E0,$10,$D0,$E1,$A2,$18,$D0,$DD  ; $9B56
    .byte $A5,$10,$0A,$0A,$0A,$A8,$A9,$01,$99,$02,$02,$99,$06,$02,$60,$0F  ; $9B66
    .byte $20,$20,$20,$0F,$16,$16,$16,$0F,$0F,$2C,$11,$0F,$0F,$30,$37,$30  ; $9B76
    .byte $00,$00,$30,$30,$00,$00,$38,$30,$00,$00,$48,$30,$00,$00,$50,$30  ; $9B86
    .byte $00,$00,$60,$30,$00,$00,$68,$30,$00,$00,$78,$30,$00,$00,$80,$40  ; $9B96
    .byte $00,$00,$30,$40,$00,$00,$38,$40,$00,$00,$48,$40,$00,$00,$50,$40  ; $9BA6
    .byte $00,$00,$60,$40,$00,$00,$68,$40,$00,$00,$78,$40,$00,$00,$80,$50  ; $9BB6
    .byte $00,$00,$30,$50,$00,$00,$38,$50,$00,$00,$48,$50,$00,$00,$50,$50  ; $9BC6
    .byte $00,$00,$60,$50,$00,$00,$68,$50,$00,$00,$78,$50,$00,$00,$80,$60  ; $9BD6
    .byte $00,$00,$30,$60,$00,$00,$38,$60,$00,$00,$48,$60,$00,$00,$50,$60  ; $9BE6
    .byte $00,$00,$60,$60,$00,$00,$68,$60,$00,$00,$78,$60,$00,$00,$80,$80  ; $9BF6
    .byte $00,$00,$30,$80,$00,$00,$38,$80,$00,$00,$48,$80,$00,$00,$50,$80  ; $9C06
    .byte $00,$00,$60,$80,$00,$00,$68,$80,$00,$00,$78,$80,$00,$00,$80,$90  ; $9C16
    .byte $00,$00,$30,$90,$00,$00,$38,$90,$00,$00,$48,$90,$00,$00,$50,$90  ; $9C26
    .byte $00,$00,$60,$90,$00,$00,$68,$90,$00,$00,$78,$90,$00,$00,$80,$20  ; $9C36
    .byte $1C,$01,$20,$20,$0C,$01,$28,$20,$1B,$01,$30,$70,$18,$01,$20,$70  ; $9C46
    .byte $0B,$01,$28,$70,$13,$01,$30,$FF,$00,$01,$02,$03,$04,$05,$06,$07  ; $9C56
    .byte $08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F  ; $9C66
    .byte $04,$14,$00,$10,$40,$10,$0A,$40,$8C,$04,$00,$01,$40,$04,$80,$00  ; $9C76
    .byte $00,$00,$0C,$00,$00,$00,$01,$50,$00,$00,$00,$10,$10,$00,$16,$04  ; $9C86
    .byte $01,$00,$00,$00,$01,$01,$08,$10,$00,$00,$00,$40,$A0,$50,$0E,$00  ; $9C96
    .byte $01,$00,$00,$05,$40,$00,$08,$00,$01,$40,$10,$10,$20,$10,$40,$04  ; $9CA6
    .byte $03,$00,$00,$40,$40,$00,$08,$00,$00,$00,$80,$10,$01,$00,$90,$00  ; $9CB6
    .byte $01,$00,$28,$00,$08,$00,$08,$41,$00,$40,$00,$00,$61,$00,$20,$04  ; $9CC6
    .byte $00,$40,$04,$00,$00,$41,$00,$00,$08,$01,$08,$04,$81,$00,$90,$00  ; $9CD6
    .byte $68,$00,$40,$80,$00,$00,$30,$00,$00,$00,$00,$00,$10,$00,$C8,$00  ; $9CE6
    .byte $16,$00,$00,$10,$04,$00,$12,$00,$0A,$00,$44,$10,$20,$00,$00,$04  ; $9CF6
    .byte $20,$00,$61,$00,$04,$00,$21,$01,$00,$04,$00,$01,$00,$00,$00,$00  ; $9D06
    .byte $00,$00,$80,$00,$00,$00,$00,$00,$00,$00,$21,$40,$7D,$00,$F2,$04  ; $9D16
    .byte $80,$10,$14,$40,$00,$00,$92,$00,$40,$10,$84,$04,$41,$04,$14,$00  ; $9D26
    .byte $01,$40,$20,$40,$00,$00,$00,$00,$22,$00,$16,$04,$00,$00,$40,$04  ; $9D36
    .byte $80,$00,$0C,$01,$00,$00,$00,$04,$42,$00,$C4,$00,$23,$40,$00,$00  ; $9D46
    .byte $81,$04,$00,$00,$10,$01,$40,$00,$00,$14,$02,$00,$22,$00,$46,$40  ; $9D56
    .byte $00,$00,$00,$00,$80,$40,$C0,$00,$09,$00,$80,$00,$22,$10,$08,$00  ; $9D66
    .byte $80,$40,$00,$10,$90,$10,$18,$00,$28,$00,$60,$00,$80,$00,$08,$00  ; $9D76
    .byte $06,$01,$01,$04,$01,$40,$00,$01,$00,$00,$80,$00,$00,$00,$00,$00  ; $9D86
    .byte $40,$00,$00,$00,$00,$00,$00,$00,$80,$00,$C1,$14,$20,$05,$43,$00  ; $9D96
    .byte $05,$40,$0C,$00,$4C,$14,$04,$05,$01,$01,$02,$04,$04,$40,$20,$00  ; $9DA6
    .byte $74,$00,$08,$44,$00,$10,$00,$00,$04,$01,$08,$00,$12,$05,$03,$00  ; $9DB6
    .byte $01,$00,$04,$00,$94,$00,$8A,$01,$18,$00,$08,$10,$08,$10,$00,$00  ; $9DC6
    .byte $00,$00,$60,$04,$02,$00,$00,$00,$08,$00,$98,$04,$40,$45,$00,$15  ; $9DD6
    .byte $10,$00,$93,$00,$01,$01,$86,$04,$00,$01,$20,$00,$00,$00,$80,$00  ; $9DE6
    .byte $09,$00,$20,$01,$10,$00,$02,$00,$20,$00,$80,$00,$00,$00,$04,$40  ; $9DF6
    .byte $50,$00,$40,$01,$00,$10,$00,$10,$40,$04,$00,$00,$00,$00,$00,$10  ; $9E06
    .byte $00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$08,$11,$12,$00,$82,$50  ; $9E16
    .byte $00,$00,$05,$00,$01,$00,$14,$01,$00,$40,$80,$00,$06,$00,$08,$04  ; $9E26
    .byte $04,$04,$00,$00,$08,$41,$01,$00,$00,$40,$34,$10,$00,$00,$04,$00  ; $9E36
    .byte $04,$50,$12,$40,$00,$00,$00,$00,$40,$00,$80,$40,$20,$00,$00,$01  ; $9E46
    .byte $16,$00,$02,$00,$01,$00,$00,$04,$02,$00,$0C,$00,$19,$11,$04,$04  ; $9E56
    .byte $10,$00,$10,$01,$88,$50,$12,$01,$CD,$40,$00,$00,$10,$05,$00,$40  ; $9E66
    .byte $80,$00,$80,$41,$01,$00,$01,$40,$00,$00,$88,$01,$C0,$00,$01,$40  ; $9E76
    .byte $10,$00,$10,$00,$10,$00,$00,$00,$00,$00,$00,$40,$00,$00,$40,$00  ; $9E86
    .byte $20,$01,$4A,$04,$05,$00,$00,$00,$00,$00,$00,$10,$80,$04,$10,$01  ; $9E96
    .byte $40,$10,$10,$40,$29,$00,$C6,$01,$41,$40,$40,$00,$4A,$10,$40,$00  ; $9EA6
    .byte $01,$10,$22,$00,$00,$00,$10,$00,$00,$00,$21,$00,$AA,$50,$98,$04  ; $9EB6
    .byte $11,$40,$00,$10,$01,$00,$06,$00,$00,$00,$92,$00,$E4,$00,$00,$04  ; $9EC6
    .byte $00,$00,$00,$00,$10,$00,$08,$01,$80,$11,$84,$10,$01,$45,$00,$01  ; $9ED6
    .byte $30,$00,$82,$00,$8C,$01,$A2,$00,$84,$00,$11,$00,$00,$40,$D2,$00  ; $9EE6
    .byte $20,$05,$20,$00,$A2,$00,$20,$01,$40,$00,$00,$00,$00,$00,$80,$00  ; $9EF6
    .byte $00,$00,$E0,$40,$43,$00,$02,$00,$00,$00,$80,$00,$00,$04,$04,$00  ; $9F06
    .byte $01,$00,$00,$00,$00,$00,$09,$00,$00,$00,$0B,$00,$4A,$00,$06,$40  ; $9F16
    .byte $00,$40,$40,$01,$18,$55,$63,$01,$41,$00,$01,$10,$02,$00,$80,$04  ; $9F26
    .byte $00,$04,$40,$04,$08,$00,$00,$00,$40,$00,$40,$40,$C0,$00,$00,$10  ; $9F36
    .byte $00,$00,$20,$01,$00,$15,$00,$40,$00,$00,$11,$01,$2A,$00,$20,$00  ; $9F46
    .byte $00,$01,$00,$00,$00,$00,$00,$00,$08,$01,$00,$00,$00,$00,$80,$00  ; $9F56
    .byte $00,$01,$14,$00,$B1,$00,$48,$04,$00,$00,$08,$00,$02,$00,$10,$00  ; $9F66
    .byte $00,$00,$09,$00,$00,$00,$20,$00,$00,$11,$34,$00,$01,$04,$10,$40  ; $9F76
    .byte $41,$00,$00,$00,$20,$00,$00,$00,$00,$00,$02,$00,$20,$00,$00,$00  ; $9F86
    .byte $80,$00,$80,$10,$20,$00,$00,$00,$04,$00,$20,$05,$28,$05,$00,$14  ; $9F96
    .byte $20,$41,$04,$00,$81,$00,$04,$40,$00,$00,$40,$04,$C0,$40,$04,$00  ; $9FA6
    .byte $02,$00,$08,$01,$21,$00,$10,$00,$00,$40,$4A,$00,$04,$00,$9B,$00  ; $9FB6
    .byte $58,$44,$02,$00,$02,$00,$80,$00,$44,$00,$10,$00,$04,$00,$04,$40  ; $9FC6
    .byte $01,$00,$01,$00,$00,$54,$40,$00,$08,$01,$08,$00,$18,$04,$00,$00  ; $9FD6
    .byte $00,$01,$08,$04,$80,$05,$A6,$00,$10,$00,$02,$00,$00,$00,$10,$00  ; $9FE6
    .byte $00,$14,$C0,$05,$01,$00,$40,$40,$20,$01  ; $9FF6
