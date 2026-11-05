; PRG 8 KB bank $38 at $8000
.segment "BANK38"
.org $8000

    .byte $00,$40,$00,$00,$02,$FD,$00,$80,$80,$00,$01,$FE,$00,$80,$80,$00  ; $8000
    .byte $01,$FF,$00,$00,$00,$00,$00,$FF,$00,$60,$A0,$00,$80,$80,$00,$00  ; $8010
    .byte $C0,$40,$00,$FF,$00,$00,$00,$FF,$00,$00,$FF,$24,$31  ; $8020
    LDA #$01                     ; $802D  A9 01
    STA $03CE                    ; $802F  8D CE 03
    LDA #$40                     ; $8032  A9 40
    STA $03B7                    ; $8034  8D B7 03
    LDA #$10                     ; $8037  A9 10
    STA $A8                      ; $8039  85 A8
    LDA #$00                     ; $803B  A9 00
    STA $9E                      ; $803D  85 9E
    STA $9D                      ; $803F  85 9D
    STA $A2                      ; $8041  85 A2
    STA $A1                      ; $8043  85 A1
    STA $A0                      ; $8045  85 A0

loc_38_8047:
    LDA #$00                     ; $8047  A9 00
    STA $059A                    ; $8049  8D 9A 05
    JSR sub_3F_E0FD              ; $804C  20 FD E0

loc_38_804F:
    JSR sub_38_8B0F              ; $804F  20 0F 8B
    JSR sub_38_8E95              ; $8052  20 95 8E
    LDA $05C8                    ; $8055  AD C8 05
    BEQ loc_38_8062              ; $8058  F0 08
    BPL loc_38_805F              ; $805A  10 03
    JMP loc_38_80EF              ; $805C  4C EF 80


loc_38_805F:
    JMP loc_38_80EA              ; $805F  4C EA 80


loc_38_8062:
    LDA $9A                      ; $8062  A5 9A
    BEQ loc_38_8069              ; $8064  F0 03
    JMP loc_38_80C3              ; $8066  4C C3 80


loc_38_8069:
    LDA $99                      ; $8069  A5 99
    BEQ loc_38_804F              ; $806B  F0 E2
    LDA $A7                      ; $806D  A5 A7
    CMP #$05                     ; $806F  C9 05
    BEQ loc_38_8096              ; $8071  F0 23
    JSR sub_38_8531              ; $8073  20 31 85
    LDA #$01                     ; $8076  A9 01
    JSR sub_3F_E0FD              ; $8078  20 FD E0
    JSR sub_38_8B0F              ; $807B  20 0F 8B
    LDA #$06                     ; $807E  A9 06
    STA $95                      ; $8080  85 95
    BNE loc_38_8087              ; $8082  D0 03

loc_38_8084:
    JSR sub_38_856A              ; $8084  20 6A 85

loc_38_8087:
    JSR sub_38_8E95              ; $8087  20 95 8E
    LDA $9A                      ; $808A  A5 9A
    BNE loc_38_80C3              ; $808C  D0 35
    DEC $95                      ; $808E  C6 95
    BNE loc_38_8084              ; $8090  D0 F2
    LDA $99                      ; $8092  A5 99
    BEQ loc_38_8047              ; $8094  F0 B1

loc_38_8096:
    LDA #$00                     ; $8096  A9 00
    STA $A3                      ; $8098  85 A3
    STA $059A                    ; $809A  8D 9A 05
    JSR sub_38_8531              ; $809D  20 31 85
    LDA #$02                     ; $80A0  A9 02
    JSR sub_3F_E0FD              ; $80A2  20 FD E0

loc_38_80A5:
    LDA $9A                      ; $80A5  A5 9A
    BNE loc_38_80C3              ; $80A7  D0 1A
    JSR sub_38_8B0F              ; $80A9  20 0F 8B
    JSR sub_38_8E95              ; $80AC  20 95 8E
    LDA $05C8                    ; $80AF  AD C8 05
    BEQ loc_38_80B7              ; $80B2  F0 03
    JMP loc_38_80EA              ; $80B4  4C EA 80


loc_38_80B7:
    LDA $99                      ; $80B7  A5 99
    BEQ loc_38_8047              ; $80B9  F0 8C
    CMP $03CE                    ; $80BB  CD CE 03
    BNE loc_38_8096              ; $80BE  D0 D6
    JMP loc_38_80A5              ; $80C0  4C A5 80


loc_38_80C3:
    LDA $9B                      ; $80C3  A5 9B
    BNE loc_38_80D7              ; $80C5  D0 10
    LDA $03CE                    ; $80C7  AD CE 03
    EOR #$03                     ; $80CA  49 03
    BEQ loc_38_80D7              ; $80CC  F0 09
    LDA $40                      ; $80CE  A5 40
    AND #$04                     ; $80D0  29 04
    BEQ loc_38_80D7              ; $80D2  F0 03
    JMP loc_38_828A              ; $80D4  4C 8A 82


loc_38_80D7:
    LDA $064B                    ; $80D7  AD 4B 06
    CMP #$09                     ; $80DA  C9 09
    BNE loc_38_80E5              ; $80DC  D0 07
    LDA #$FB                     ; $80DE  A9 FB
    STA $05C8                    ; $80E0  8D C8 05
    BNE loc_38_80EA              ; $80E3  D0 05

loc_38_80E5:
    LDA #$FA                     ; $80E5  A9 FA
    STA $05C8                    ; $80E7  8D C8 05

loc_38_80EA:
    LDA #$CC                     ; $80EA  A9 CC
    STA $05B1                    ; $80EC  8D B1 05

loc_38_80EF:
    LDA #$00                     ; $80EF  A9 00
    STA $059A                    ; $80F1  8D 9A 05
    LDA #$07                     ; $80F4  A9 07
    JSR sub_3F_E0FD              ; $80F6  20 FD E0

loc_38_80F9:
    LDA $A7                      ; $80F9  A5 A7
    CMP #$15                     ; $80FB  C9 15
    BNE loc_38_8105              ; $80FD  D0 06
    JSR sub_38_8B0F              ; $80FF  20 0F 8B
    JMP loc_38_8108              ; $8102  4C 08 81


loc_38_8105:
    JSR sub_38_8BA0              ; $8105  20 A0 8B

loc_38_8108:
    JSR sub_38_8E95              ; $8108  20 95 8E
    LDY $9B                      ; $810B  A4 9B
    DEY                          ; $810D  88
    BNE loc_38_811F              ; $810E  D0 0F
    LDA $05C8                    ; $8110  AD C8 05
    BMI loc_38_811F              ; $8113  30 0A
    LDA $9C                      ; $8115  A5 9C
    BMI loc_38_811F              ; $8117  30 06
    LDA $40                      ; $8119  A5 40
    AND #$80                     ; $811B  29 80
    BNE loc_38_8180              ; $811D  D0 61

loc_38_811F:
    LDA $40                      ; $811F  A5 40
    AND #$80                     ; $8121  29 80
    BNE loc_38_8143              ; $8123  D0 1E
    LDA $05C8                    ; $8125  AD C8 05
    BPL loc_38_8143              ; $8128  10 19
    LDY $064B                    ; $812A  AC 4B 06
    CPY #$08                     ; $812D  C0 08
    BEQ loc_38_8135              ; $812F  F0 04
    CMP #$FB                     ; $8131  C9 FB
    BCC loc_38_8143              ; $8133  90 0E

loc_38_8135:
    LDA $05B1                    ; $8135  AD B1 05
    AND #$0C                     ; $8138  29 0C
    CMP #$0C                     ; $813A  C9 0C
    BNE loc_38_8143              ; $813C  D0 05
    LDA #$00                     ; $813E  A9 00
    STA $05C8                    ; $8140  8D C8 05

loc_38_8143:
    JSR sub_38_8531              ; $8143  20 31 85
    LDA $05B1                    ; $8146  AD B1 05
    BNE loc_38_80F9              ; $8149  D0 AE
    LDA #$00                     ; $814B  A9 00
    STA $9D                      ; $814D  85 9D
    LDA #$24                     ; $814F  A9 24
    STA $DC                      ; $8151  85 DC
    LDY $9B                      ; $8153  A4 9B
    BEQ loc_38_817D              ; $8155  F0 26
    LDA $802A,Y                  ; $8157  B9 2A 80
    TAY                          ; $815A  A8
    JSR sub_3F_E522              ; $815B  20 22 E5
    LDA #$00                     ; $815E  A9 00
    STA $98                      ; $8160  85 98
    LDA #$08                     ; $8162  A9 08
    STA $95                      ; $8164  85 95

loc_38_8166:
    LDA $40                      ; $8166  A5 40
    BNE loc_38_8174              ; $8168  D0 0A
    JSR sub_38_8E95              ; $816A  20 95 8E
    DEC $95                      ; $816D  C6 95
    BNE loc_38_8166              ; $816F  D0 F5
    JMP loc_38_8047              ; $8171  4C 47 80


loc_38_8174:
    LDA $42                      ; $8174  A5 42
    AND #$80                     ; $8176  29 80
    BEQ loc_38_817D              ; $8178  F0 03
    JMP loc_38_80C3              ; $817A  4C C3 80


loc_38_817D:
    JMP loc_38_8096              ; $817D  4C 96 80


loc_38_8180:
    LDA #$00                     ; $8180  A9 00
    STA $A7                      ; $8182  85 A7
    LDA #$2D                     ; $8184  A9 2D
    STA $DC                      ; $8186  85 DC
    LDA #$04                     ; $8188  A9 04
    STA $9D                      ; $818A  85 9D
    LDA #$06                     ; $818C  A9 06
    JSR sub_3F_E0FD              ; $818E  20 FD E0

loc_38_8191:
    LDA $05B1                    ; $8191  AD B1 05
    CLC                          ; $8194  18
    ADC #$E0                     ; $8195  69 E0
    STA $05B1                    ; $8197  8D B1 05
    STA $EC                      ; $819A  85 EC
    LDA $05C8                    ; $819C  AD C8 05
    ADC #$FF                     ; $819F  69 FF
    BMI loc_38_81C7              ; $81A1  30 24
    STA $05C8                    ; $81A3  8D C8 05
    STA $EE                      ; $81A6  85 EE
    JSR sub_38_8254              ; $81A8  20 54 82
    LDA $064B                    ; $81AB  AD 4B 06
    AND #$01                     ; $81AE  29 01
    BNE loc_38_81BB              ; $81B0  D0 09
    JSR sub_38_8E95              ; $81B2  20 95 8E
    LDA $40                      ; $81B5  A5 40
    AND #$80                     ; $81B7  29 80
    BNE loc_38_8191              ; $81B9  D0 D6

loc_38_81BB:
    LDA #$3F                     ; $81BB  A9 3F
    STA $DC                      ; $81BD  85 DC
    JMP loc_38_80EA              ; $81BF  4C EA 80

    .byte $A9,$06,$20,$FD,$E0  ; $81C2

loc_38_81C7:
    LDA $04CB                    ; $81C7  AD CB 04
    SEC                          ; $81CA  38
    SBC #$54                     ; $81CB  E9 54
    BCS loc_38_81D1              ; $81CD  B0 02
    LDA #$00                     ; $81CF  A9 00

loc_38_81D1:
    STA $064D                    ; $81D1  8D 4D 06
    LDA #$0A                     ; $81D4  A9 0A
    STA $95                      ; $81D6  85 95

loc_38_81D8:
    LDA #$00                     ; $81D8  A9 00
    STA $EE                      ; $81DA  85 EE
    STA $EC                      ; $81DC  85 EC
    STA $05B1                    ; $81DE  8D B1 05
    STA $05C8                    ; $81E1  8D C8 05
    JSR sub_38_8254              ; $81E4  20 54 82
    JSR sub_38_8E95              ; $81E7  20 95 8E
    LDA $40                      ; $81EA  A5 40
    AND #$80                     ; $81EC  29 80
    BEQ loc_38_81BB              ; $81EE  F0 CB
    DEC $95                      ; $81F0  C6 95
    BNE loc_38_81D8              ; $81F2  D0 E4
    DEC $05C8                    ; $81F4  CE C8 05

loc_38_81F7:
    LDA $04CB                    ; $81F7  AD CB 04
    CMP $064D                    ; $81FA  CD 4D 06
    BCC loc_38_81D8              ; $81FD  90 D9
    LDA #$00                     ; $81FF  A9 00
    STA $EC                      ; $8201  85 EC
    STA $EE                      ; $8203  85 EE
    LDA $064B                    ; $8205  AD 4B 06
    CMP #$0E                     ; $8208  C9 0E
    BEQ loc_38_8241              ; $820A  F0 35
    LDA #$F8                     ; $820C  A9 F8
    CLC                          ; $820E  18
    ADC $05B1                    ; $820F  6D B1 05
    STA $05B1                    ; $8212  8D B1 05
    STA $EC                      ; $8215  85 EC
    LDA $05C8                    ; $8217  AD C8 05
    ADC #$FF                     ; $821A  69 FF
    BMI loc_38_8221              ; $821C  30 03
    JMP loc_38_8191              ; $821E  4C 91 81


loc_38_8221:
    LDY $064B                    ; $8221  AC 4B 06
    CPY #$08                     ; $8224  C0 08
    BNE loc_38_8231              ; $8226  D0 09
    LDA #$FF                     ; $8228  A9 FF
    LDY #$00                     ; $822A  A0 00
    STY $05B1                    ; $822C  8C B1 05
    STY $EC                      ; $822F  84 EC

loc_38_8231:
    CMP #$FE                     ; $8231  C9 FE
    BNE loc_38_823C              ; $8233  D0 07
    LDY #$00                     ; $8235  A0 00
    STY $05B1                    ; $8237  8C B1 05
    STY $EC                      ; $823A  84 EC

loc_38_823C:
    STA $05C8                    ; $823C  8D C8 05
    STA $EE                      ; $823F  85 EE

loc_38_8241:
    JSR sub_38_8254              ; $8241  20 54 82
    JSR sub_38_8E95              ; $8244  20 95 8E
    LDA $40                      ; $8247  A5 40
    AND #$80                     ; $8249  29 80
    BNE loc_38_81F7              ; $824B  D0 AA
    LDA #$3F                     ; $824D  A9 3F
    STA $DC                      ; $824F  85 DC
    JMP loc_38_80EA              ; $8251  4C EA 80


sub_38_8254:
    LDA $9B                      ; $8254  A5 9B
    CMP #$01                     ; $8256  C9 01
    BEQ loc_38_825D              ; $8258  F0 03
    JMP loc_38_80EA              ; $825A  4C EA 80


loc_38_825D:
    DEC $9D                      ; $825D  C6 9D
    BNE loc_38_8275              ; $825F  D0 14
    LDA #$04                     ; $8261  A9 04
    STA $9D                      ; $8263  85 9D
    DEC $9C                      ; $8265  C6 9C
    BPL loc_38_8275              ; $8267  10 0C
    LDA #$00                     ; $8269  A9 00
    STA $05C8                    ; $826B  8D C8 05
    LDA #$3F                     ; $826E  A9 3F
    STA $DC                      ; $8270  85 DC
    JMP loc_38_80EA              ; $8272  4C EA 80


loc_38_8275:
    JSR sub_38_8531              ; $8275  20 31 85
    LDY $99                      ; $8278  A4 99
    LDA $800F,Y                  ; $827A  B9 0F 80
    STA $ED                      ; $827D  85 ED
    LDA $8012,Y                  ; $827F  B9 12 80
    STA $EB                      ; $8282  85 EB
    JSR sub_38_856A              ; $8284  20 6A 85
    JMP loc_38_86FB              ; $8287  4C FB 86


loc_38_828A:
    LDA #$00                     ; $828A  A9 00
    STA $98                      ; $828C  85 98
    LDA #$1A                     ; $828E  A9 1A
    STA $95                      ; $8290  85 95
    LDY #$02                     ; $8292  A0 02
    LDX #$05                     ; $8294  A2 05
    JSR sub_3E_CB28              ; $8296  20 28 CB
    EOR ($A9,X)                  ; $8299  41 A9
    SLO ($8D,X)                  ; $829B  03 8D
    TXS                          ; $829D  9A
    ORA $A9                      ; $829E  05 A9
    PHP                          ; $82A0  08
    STA $A3                      ; $82A1  85 A3
    LDY #$03                     ; $82A3  A0 03
    STY $94                      ; $82A5  84 94
    LDX $8F                      ; $82A7  A6 8F
    JSR sub_3F_E522              ; $82A9  20 22 E5
    JMP loc_38_82B2              ; $82AC  4C B2 82


loc_38_82AF:
    JSR sub_38_8E95              ; $82AF  20 95 8E

loc_38_82B2:
    LDY $03CE                    ; $82B2  AC CE 03
    LDA $064B                    ; $82B5  AD 4B 06
    CMP #$09                     ; $82B8  C9 09
    BEQ loc_38_82C8              ; $82BA  F0 0C
    LDA $8003,Y                  ; $82BC  B9 03 80
    STA $ED                      ; $82BF  85 ED
    LDA $8006,Y                  ; $82C1  B9 06 80
    STA $EB                      ; $82C4  85 EB
    BNE loc_38_82D2              ; $82C6  D0 0A

loc_38_82C8:
    LDA $8009,Y                  ; $82C8  B9 09 80
    STA $ED                      ; $82CB  85 ED
    LDA $800C,Y                  ; $82CD  B9 0C 80
    STA $EB                      ; $82D0  85 EB

loc_38_82D2:
    JSR sub_38_86CE              ; $82D2  20 CE 86
    LDA $12                      ; $82D5  A5 12
    BNE loc_38_82FA              ; $82D7  D0 21
    LDA $05B1                    ; $82D9  AD B1 05
    CMP #$41                     ; $82DC  C9 41
    BCC loc_38_82E3              ; $82DE  90 03
    JMP loc_38_82FA              ; $82E0  4C FA 82


loc_38_82E3:
    LDA $9A                      ; $82E3  A5 9A
    BEQ loc_38_82ED              ; $82E5  F0 06
    LDA $40                      ; $82E7  A5 40
    AND #$04                     ; $82E9  29 04
    BEQ loc_38_82FA              ; $82EB  F0 0D

loc_38_82ED:
    LDA $99                      ; $82ED  A5 99
    BEQ loc_38_82F6              ; $82EF  F0 05
    CMP $03CE                    ; $82F1  CD CE 03
    BNE loc_38_82FA              ; $82F4  D0 04

loc_38_82F6:
    DEC $95                      ; $82F6  C6 95
    BNE loc_38_82AF              ; $82F8  D0 B5

loc_38_82FA:
    LDX #$00                     ; $82FA  A2 00
    JSR sub_38_8531              ; $82FC  20 31 85
    LDA #$04                     ; $82FF  A9 04
    STA $95                      ; $8301  85 95
    STX $11                      ; $8303  86 11
    LDA $9127                    ; $8305  AD 27 91
    STA $00                      ; $8308  85 00
    LDA $9133                    ; $830A  AD 33 91
    STA $01                      ; $830D  85 01
    JSR sub_3E_D9CD              ; $830F  20 CD D9
    LDA $11                      ; $8312  A5 11
    AND #$01                     ; $8314  29 01
    BNE loc_38_82AF              ; $8316  D0 97
    LDX #$00                     ; $8318  A2 00
    STX $11                      ; $831A  86 11
    LDA $9128                    ; $831C  AD 28 91
    STA $00                      ; $831F  85 00
    LDA $9134                    ; $8321  AD 34 91
    STA $01                      ; $8324  85 01
    JSR sub_3E_D9CD              ; $8326  20 CD D9
    LDA $11                      ; $8329  A5 11
    AND #$01                     ; $832B  29 01
    BEQ loc_38_8332              ; $832D  F0 03
    JMP loc_38_82AF              ; $832F  4C AF 82


loc_38_8332:
    LDY $03CE                    ; $8332  AC CE 03
    LDA $8BEA,Y                  ; $8335  B9 EA 8B
    STA $A1                      ; $8338  85 A1
    LDA $8BED,Y                  ; $833A  B9 ED 8B
    STA $A0                      ; $833D  85 A0
    LDA #$00                     ; $833F  A9 00
    STA $A3                      ; $8341  85 A3
    LDA $05B1                    ; $8343  AD B1 05
    BEQ loc_38_834B              ; $8346  F0 03
    JMP loc_38_80EA              ; $8348  4C EA 80


loc_38_834B:
    JMP loc_38_8047              ; $834B  4C 47 80


loc_38_834E:
    LDA #$3F                     ; $834E  A9 3F
    STA $DC                      ; $8350  85 DC
    LDA $03B7                    ; $8352  AD B7 03
    AND #$DF                     ; $8355  29 DF
    STA $03B7                    ; $8357  8D B7 03
    LDA #$00                     ; $835A  A9 00
    STA $A3                      ; $835C  85 A3
    STA $9D                      ; $835E  85 9D
    STA $97                      ; $8360  85 97
    STA $98                      ; $8362  85 98

loc_38_8364:
    LDA #$04                     ; $8364  A9 04
    JSR sub_3F_E0FD              ; $8366  20 FD E0

loc_38_8369:
    LDA #$00                     ; $8369  A9 00
    STA $11                      ; $836B  85 11
    LDA $9129                    ; $836D  AD 29 91
    STA $00                      ; $8370  85 00
    LDA $913D                    ; $8372  AD 3D 91
    STA $01                      ; $8375  85 01
    JSR sub_3E_D9CD              ; $8377  20 CD D9
    LDA $11                      ; $837A  A5 11
    CMP #$08                     ; $837C  C9 08
    BNE loc_38_8384              ; $837E  D0 04
    LDA #$00                     ; $8380  A9 00
    STA $11                      ; $8382  85 11

loc_38_8384:
    LDA $912A                    ; $8384  AD 2A 91
    STA $00                      ; $8387  85 00
    LDA $913E                    ; $8389  AD 3E 91
    STA $01                      ; $838C  85 01
    JSR sub_3E_D9CD              ; $838E  20 CD D9
    LDA $11                      ; $8391  A5 11
    LDX $8F                      ; $8393  A6 8F
    LDA $11                      ; $8395  A5 11
    CMP #$04                     ; $8397  C9 04
    BNE loc_38_83A3              ; $8399  D0 08
    LDA #$04                     ; $839B  A9 04
    CMP $94                      ; $839D  C5 94
    BNE loc_38_83B6              ; $839F  D0 15
    BEQ loc_38_83B9              ; $83A1  F0 16

loc_38_83A3:
    CMP #$03                     ; $83A3  C9 03
    BNE loc_38_83E2              ; $83A5  D0 3B
    LDA $04CB                    ; $83A7  AD CB 04
    CLC                          ; $83AA  18
    ADC #$0D                     ; $83AB  69 0D
    AND #$08                     ; $83AD  29 08
    BNE loc_38_83B4              ; $83AF  D0 03
    JMP loc_38_8047              ; $83B1  4C 47 80


loc_38_83B4:
    LDA #$05                     ; $83B4  A9 05

loc_38_83B6:
    JSR sub_3F_E0FD              ; $83B6  20 FD E0

loc_38_83B9:
    JSR sub_38_856A              ; $83B9  20 6A 85
    LDA $97                      ; $83BC  A5 97
    BNE loc_38_83E5              ; $83BE  D0 25
    LDA $40                      ; $83C0  A5 40
    AND #$0C                     ; $83C2  29 0C
    BEQ loc_38_83E5              ; $83C4  F0 1F
    LSR A                        ; $83C6  4A
    LSR A                        ; $83C7  4A
    TAY                          ; $83C8  A8
    LDA $8BEA,Y                  ; $83C9  B9 EA 8B
    STA $EE                      ; $83CC  85 EE
    LDA $8BED,Y                  ; $83CE  B9 ED 8B
    STA $EC                      ; $83D1  85 EC
    LDA #$00                     ; $83D3  A9 00
    STA $ED                      ; $83D5  85 ED
    STA $EB                      ; $83D7  85 EB
    JSR sub_3F_E4D1              ; $83D9  20 D1 E4
    JSR sub_38_8E95              ; $83DC  20 95 8E
    JMP loc_38_8369              ; $83DF  4C 69 83


loc_38_83E2:
    JMP loc_38_8047              ; $83E2  4C 47 80


loc_38_83E5:
    LDA $9A                      ; $83E5  A5 9A
    BNE loc_38_8411              ; $83E7  D0 28
    JSR sub_38_8E95              ; $83E9  20 95 8E
    LDA $0510                    ; $83EC  AD 10 05
    BMI loc_38_83F4              ; $83EF  30 03
    INC $0555,X                  ; $83F1  FE 55 05

loc_38_83F4:
    JSR sub_38_856A              ; $83F4  20 6A 85
    LDA $97                      ; $83F7  A5 97
    CMP #$10                     ; $83F9  C9 10
    BNE loc_38_8405              ; $83FB  D0 08
    JSR sub_38_8531              ; $83FD  20 31 85
    LDA #$00                     ; $8400  A9 00
    STA $0510                    ; $8402  8D 10 05

loc_38_8405:
    LDA $40                      ; $8405  A5 40
    AND #$0C                     ; $8407  29 0C
    BEQ loc_38_83E5              ; $8409  F0 DA
    LDA $97                      ; $840B  A5 97
    BEQ loc_38_8414              ; $840D  F0 05
    BNE loc_38_83E5              ; $840F  D0 D4

loc_38_8411:
    JMP loc_38_80EA              ; $8411  4C EA 80


loc_38_8414:
    JMP loc_38_8364              ; $8414  4C 64 83


loc_38_8417:
    LDA #$2B                     ; $8417  A9 2B
    JSR sub_3E_C8B2              ; $8419  20 B2 C8
    LDY #$01                     ; $841C  A0 01
    JSR sub_3E_C5F0              ; $841E  20 F0 C5
    LDA #$0B                     ; $8421  A9 0B
    JSR sub_3E_C9EF              ; $8423  20 EF C9
    LDA #$FF                     ; $8426  A9 FF
    STA $9E                      ; $8428  85 9E
    LDA #$00                     ; $842A  A9 00
    STA $97                      ; $842C  85 97
    STA $98                      ; $842E  85 98
    LDA #$0C                     ; $8430  A9 0C
    STA $95                      ; $8432  85 95
    JSR sub_38_8531              ; $8434  20 31 85
    LDA $94                      ; $8437  A5 94
    CMP #$04                     ; $8439  C9 04
    BEQ loc_38_849E              ; $843B  F0 61
    CMP #$05                     ; $843D  C9 05
    BEQ loc_38_849E              ; $843F  F0 5D
    LDA $05B1                    ; $8441  AD B1 05
    BEQ loc_38_8489              ; $8444  F0 43

loc_38_8446:
    LDA $05B1                    ; $8446  AD B1 05
    BEQ loc_38_847E              ; $8449  F0 33
    LDA $05C8                    ; $844B  AD C8 05
    BPL loc_38_846A              ; $844E  10 1A
    LDA $A7                      ; $8450  A5 A7
    CMP #$0A                     ; $8452  C9 0A
    BEQ loc_38_846A              ; $8454  F0 14
    LDA $40                      ; $8456  A5 40
    AND #$80                     ; $8458  29 80
    BNE loc_38_846A              ; $845A  D0 0E
    LDA $05B1                    ; $845C  AD B1 05
    AND #$0C                     ; $845F  29 0C
    CMP #$0C                     ; $8461  C9 0C
    BNE loc_38_846A              ; $8463  D0 05
    LDA #$00                     ; $8465  A9 00
    STA $05C8                    ; $8467  8D C8 05

loc_38_846A:
    JSR sub_38_8B0F              ; $846A  20 0F 8B
    JSR sub_38_8531              ; $846D  20 31 85
    JSR sub_38_8E95              ; $8470  20 95 8E
    DEC $95                      ; $8473  C6 95
    BNE loc_38_8446              ; $8475  D0 CF
    LDA #$00                     ; $8477  A9 00
    STA $9E                      ; $8479  85 9E
    JMP loc_38_80EF              ; $847B  4C EF 80


loc_38_847E:
    LDA $9B                      ; $847E  A5 9B
    CMP #$02                     ; $8480  C9 02
    BNE loc_38_8489              ; $8482  D0 05
    LDY #$34                     ; $8484  A0 34
    JSR sub_3F_E55D              ; $8486  20 5D E5

loc_38_8489:
    LDA #$00                     ; $8489  A9 00
    STA $99                      ; $848B  85 99
    JSR sub_38_8B0F              ; $848D  20 0F 8B
    JSR sub_38_8E95              ; $8490  20 95 8E
    DEC $95                      ; $8493  C6 95
    BNE loc_38_8489              ; $8495  D0 F2
    LDA #$00                     ; $8497  A9 00
    STA $9E                      ; $8499  85 9E
    JMP loc_38_8047              ; $849B  4C 47 80


loc_38_849E:
    LDA #$00                     ; $849E  A9 00
    STA $99                      ; $84A0  85 99
    JSR sub_38_8E95              ; $84A2  20 95 8E
    DEC $95                      ; $84A5  C6 95
    BNE loc_38_849E              ; $84A7  D0 F5
    LDA #$00                     ; $84A9  A9 00
    STA $9E                      ; $84AB  85 9E
    JMP loc_38_834E              ; $84AD  4C 4E 83


loc_38_84B0:
    LDA $AE                      ; $84B0  A5 AE
    JSR sub_3E_C9EF              ; $84B2  20 EF C9
    LDY $9B                      ; $84B5  A4 9B
    LDA $852E,Y                  ; $84B7  B9 2E 85
    TAY                          ; $84BA  A8
    LDX #$00                     ; $84BB  A2 00
    JSR sub_3F_E522              ; $84BD  20 22 E5
    LDY #$01                     ; $84C0  A0 01
    JSR sub_3E_C5F0              ; $84C2  20 F0 C5
    LDA #$25                     ; $84C5  A9 25
    STA $DC                      ; $84C7  85 DC
    LDX #$05                     ; $84C9  A2 05
    LDY #$07                     ; $84CB  A0 07
    JSR sub_3E_CB28              ; $84CD  20 28 CB
    EOR ($A9,X)                  ; $84D0  41 A9
    ASL $9585,X                  ; $84D2  1E 85 95
    LDA #$3C                     ; $84D5  A9 3C
    STA $A2                      ; $84D7  85 A2
    LDA #$00                     ; $84D9  A9 00
    STA $9E                      ; $84DB  85 9E
    STA $05B1                    ; $84DD  8D B1 05
    STA $05C8                    ; $84E0  8D C8 05
    LDA #$FF                     ; $84E3  A9 FF
    STA $A5                      ; $84E5  85 A5

loc_38_84E7:
    LDA $03B7                    ; $84E7  AD B7 03
    AND #$FE                     ; $84EA  29 FE
    STA $03B7                    ; $84EC  8D B7 03
    LDY $03CE                    ; $84EF  AC CE 03
    TYA                          ; $84F2  98
    AND $99                      ; $84F3  25 99
    BEQ loc_38_84FA              ; $84F5  F0 03
    ORA #$04                     ; $84F7  09 04
    TAY                          ; $84F9  A8

loc_38_84FA:
    LDA $801B,Y                  ; $84FA  B9 1B 80
    STA $EB                      ; $84FD  85 EB
    LDA $8022,Y                  ; $84FF  B9 22 80
    STA $ED                      ; $8502  85 ED
    LDA #$00                     ; $8504  A9 00
    STA $EC                      ; $8506  85 EC
    STA $EE                      ; $8508  85 EE
    LDA $40                      ; $850A  A5 40
    AND #$C3                     ; $850C  29 C3
    STA $40                      ; $850E  85 40
    JSR sub_38_86D5              ; $8510  20 D5 86
    JSR sub_38_8EB9              ; $8513  20 B9 8E
    DEC $95                      ; $8516  C6 95
    BNE loc_38_84E7              ; $8518  D0 CD
    LDA #$00                     ; $851A  A9 00
    STA $9D                      ; $851C  85 9D
    LDA $94                      ; $851E  A5 94
    CMP #$03                     ; $8520  C9 03
    BEQ loc_38_8527              ; $8522  F0 03
    JMP loc_38_8047              ; $8524  4C 47 80


loc_38_8527:
    LDA #$01                     ; $8527  A9 01
    STA $95                      ; $8529  85 95
    JMP loc_38_829A              ; $852B  4C 9A 82

    .byte $0A,$27,$36  ; $852E

sub_38_8531:
    LDA $99                      ; $8531  A5 99
    BEQ loc_38_8549              ; $8533  F0 14
    CMP $03CE                    ; $8535  CD CE 03
    BEQ loc_38_8549              ; $8538  F0 0F
    STA $03CE                    ; $853A  8D CE 03
    TAY                          ; $853D  A8
    LDA $03B7                    ; $853E  AD B7 03
    AND #$BF                     ; $8541  29 BF
    ORA $8000,Y                  ; $8543  19 00 80
    STA $03B7                    ; $8546  8D B7 03

loc_38_8549:
    RTS                          ; $8549  60

    .byte $09,$0A,$0B,$09,$09,$09,$09,$09,$0C,$0E,$0F,$09,$2C,$82,$82,$D9  ; $854A
    .byte $82,$D9,$7E,$7A,$D9,$AE,$86,$85,$85,$85,$85,$85,$85,$85,$85,$85  ; $855A

sub_38_856A:
    LDY $0699                    ; $856A  AC 99 06
    LDA $8556,Y                  ; $856D  B9 56 85
    STA $08                      ; $8570  85 08
    LDA $8560,Y                  ; $8572  B9 60 85
    STA $09                      ; $8575  85 09
    JMP ($0008)                  ; $8577  6C 08 00

    .byte $A2,$02,$D0,$06,$A2,$02,$D0,$02,$A2,$03,$A5,$42,$29,$40,$F0,$1F  ; $857A
    .byte $20,$05,$86,$30,$17,$AD,$99,$06,$18,$69,$80,$A8,$20,$12,$E5,$B0  ; $858A
    .byte $0B,$A5,$40,$9D,$B1,$05,$20,$15,$86,$4C,$5D,$E5,$A6,$8F,$60,$A6  ; $859A
    .byte $8F,$4C,$B2,$86,$A5,$42,$29,$40,$F0,$F5,$20,$05,$86,$30,$ED,$AD  ; $85AA
    .byte $A4,$03,$D0,$12,$AD,$91,$06,$30,$0D,$A9,$2E,$85,$DC,$A0,$0D,$A2  ; $85BA
    .byte $04,$20,$28,$CB,$41,$60,$A0,$09,$20,$10,$E5,$B0,$CF,$90,$C2,$A5  ; $85CA
    .byte $42,$29,$40,$F0,$CA,$20,$05,$86,$30,$C2,$AD,$A1,$03,$0D,$A2,$03  ; $85DA
    .byte $0D,$A3,$03,$0D,$A4,$03,$D0,$B4,$AD,$99,$06,$18,$69,$80,$A8,$A2  ; $85EA
    .byte $01,$20,$28,$CB,$41,$20,$15,$86,$4C,$5D,$E5  ; $85FA

sub_38_8605:
    LDA $9B                      ; $8605  A5 9B
    ASL A                        ; $8607  0A
    ASL A                        ; $8608  0A
    STA $00                      ; $8609  85 00
    ASL A                        ; $860B  0A
    ORA $94                      ; $860C  05 94
    TAY                          ; $860E  A8
    LDA $E12C,Y                  ; $860F  B9 2C E1
    STA $96                      ; $8612  85 96
    RTS                          ; $8614  60


sub_38_8615:
    LDY $96                      ; $8615  A4 96
    LDA $03CE                    ; $8617  AD CE 03
    STA $03CE,X                  ; $861A  9D CE 03
    LDA #$10                     ; $861D  A9 10
    STA $97                      ; $861F  85 97
    LDA #$18                     ; $8621  A9 18
    STA $98                      ; $8623  85 98
    LDA #$00                     ; $8625  A9 00
    STA $9E                      ; $8627  85 9E
    LDX $8F                      ; $8629  A6 8F
    RTS                          ; $862B  60

    LDA $42                      ; $862C  A5 42
    AND #$40                     ; $862E  29 40
    BNE loc_38_8648              ; $8630  D0 16
    LDA $40                      ; $8632  A5 40
    AND #$40                     ; $8634  29 40
    BNE loc_38_868C              ; $8636  D0 54
    LDA #$FF                     ; $8638  A9 FF
    STA $A5                      ; $863A  85 A5
    LDA $9E                      ; $863C  A5 9E
    CMP #$24                     ; $863E  C9 24
    BCC loc_38_86A9              ; $8640  90 67
    LDA $9B                      ; $8642  A5 9B
    CMP #$02                     ; $8644  C9 02
    BNE loc_38_864C              ; $8646  D0 04

loc_38_8648:
    LDA #$03                     ; $8648  A9 03
    STA $A4                      ; $864A  85 A4

loc_38_864C:
    JSR sub_38_8605              ; $864C  20 05 86
    BMI loc_38_8689              ; $864F  30 38
    LDY $00                      ; $8651  A4 00
    LDA $9E                      ; $8653  A5 9E
    CMP $06AB                    ; $8655  CD AB 06
    BCC loc_38_865B              ; $8658  90 01
    INY                          ; $865A  C8

loc_38_865B:
    CMP #$24                     ; $865B  C9 24
    BCC loc_38_8660              ; $865D  90 01
    INY                          ; $865F  C8

loc_38_8660:
    LDA $854A,Y                  ; $8660  B9 4A 85
    TAY                          ; $8663  A8
    JSR sub_3F_E510              ; $8664  20 10 E5
    BCS loc_38_8689              ; $8667  B0 20
    JSR sub_38_8615              ; $8669  20 15 86
    LDA $9B                      ; $866C  A5 9B
    CMP #$02                     ; $866E  C9 02
    BNE loc_38_8678              ; $8670  D0 06
    JSR sub_3F_E522              ; $8672  20 22 E5
    JMP loc_38_8417              ; $8675  4C 17 84


loc_38_8678:
    JSR sub_3F_E55D              ; $8678  20 5D E5
    LDA $22                      ; $867B  A5 22
    BEQ loc_38_8689              ; $867D  F0 0A
    LDY #$01                     ; $867F  A0 01
    JSR sub_3E_C5F0              ; $8681  20 F0 C5
    LDA $AE                      ; $8684  A5 AE
    JSR sub_3E_C9EF              ; $8686  20 EF C9

loc_38_8689:
    LDX $8F                      ; $8689  A6 8F
    RTS                          ; $868B  60


loc_38_868C:
    LDY $9B                      ; $868C  A4 9B
    BEQ loc_38_869B              ; $868E  F0 0B
    DEY                          ; $8690  88
    BEQ loc_38_86A9              ; $8691  F0 16
    INC $9E                      ; $8693  E6 9E
    LDA $9E                      ; $8695  A5 9E
    LSR A                        ; $8697  4A
    LSR A                        ; $8698  4A
    STA $A5                      ; $8699  85 A5

loc_38_869B:
    INC $9E                      ; $869B  E6 9E
    LDA $9E                      ; $869D  A5 9E
    CMP $06AB                    ; $869F  CD AB 06
    BCC loc_38_86A9              ; $86A2  90 05
    LDY $06AB                    ; $86A4  AC AB 06
    STY $9E                      ; $86A7  84 9E

loc_38_86A9:
    CMP #$24                     ; $86A9  C9 24
    BNE loc_38_86B2              ; $86AB  D0 05
    LDX #$02                     ; $86AD  A2 02
    JSR sub_3E_C5C7              ; $86AF  20 C7 C5

loc_38_86B2:
    LDA $97                      ; $86B2  A5 97
    BEQ loc_38_86CD              ; $86B4  F0 17
    DEC $97                      ; $86B6  C6 97
    BNE loc_38_86CD              ; $86B8  D0 13
    LDA $9B                      ; $86BA  A5 9B
    ASL A                        ; $86BC  0A
    ASL A                        ; $86BD  0A
    ASL A                        ; $86BE  0A
    ORA $94                      ; $86BF  05 94
    TAY                          ; $86C1  A8
    LDA $E114,Y                  ; $86C2  B9 14 E1
    TAY                          ; $86C5  A8
    JSR sub_3F_E55D              ; $86C6  20 5D E5
    LDA #$00                     ; $86C9  A9 00
    STA $98                      ; $86CB  85 98

loc_38_86CD:
    RTS                          ; $86CD  60


sub_38_86CE:
    LDA $9E                      ; $86CE  A5 9E
    BMI sub_38_86D5              ; $86D0  30 03
    JSR sub_38_856A              ; $86D2  20 6A 85

sub_38_86D5:
    LDA #$40                     ; $86D5  A9 40
    LDY $064B                    ; $86D7  AC 4B 06
    CPY #$08                     ; $86DA  C0 08
    BNE loc_38_86E0              ; $86DC  D0 02
    LDA #$18                     ; $86DE  A9 18

loc_38_86E0:
    CLC                          ; $86E0  18
    ADC $05B1                    ; $86E1  6D B1 05
    STA $05B1                    ; $86E4  8D B1 05
    STA $EC                      ; $86E7  85 EC
    LDA #$00                     ; $86E9  A9 00
    ADC $05C8                    ; $86EB  6D C8 05
    BMI loc_38_86F6              ; $86EE  30 06
    CMP #$08                     ; $86F0  C9 08
    BCC loc_38_86F6              ; $86F2  90 02
    LDA #$07                     ; $86F4  A9 07

loc_38_86F6:
    STA $05C8                    ; $86F6  8D C8 05
    STA $EE                      ; $86F9  85 EE

loc_38_86FB:
    LDA $069A                    ; $86FB  AD 9A 06
    CLC                          ; $86FE  18
    ADC $EB                      ; $86FF  65 EB
    STA $EB                      ; $8701  85 EB
    LDA $ED                      ; $8703  A5 ED
    ADC $069B                    ; $8705  6D 9B 06
    STA $ED                      ; $8708  85 ED
    ORA $EB                      ; $870A  05 EB
    STA $96                      ; $870C  85 96
    LDA #$00                     ; $870E  A9 00
    STA $069B                    ; $8710  8D 9B 06
    STA $069A                    ; $8713  8D 9A 06
    STA $AD                      ; $8716  85 AD
    LDY $ED                      ; $8718  A4 ED
    BPL loc_38_871E              ; $871A  10 02
    LDA #$02                     ; $871C  A9 02

loc_38_871E:
    ORA $A3                      ; $871E  05 A3
    STA $05                      ; $8720  85 05
    LDA #$12                     ; $8722  A9 12
    STA $07                      ; $8724  85 07
    LDA #$04                     ; $8726  A9 04
    LDY $EE                      ; $8728  A4 EE
    BPL loc_38_8730              ; $872A  10 04
    LDA #$06                     ; $872C  A9 06
    INC $07                      ; $872E  E6 07

loc_38_8730:
    ORA $A3                      ; $8730  05 A3
    STA $06                      ; $8732  85 06
    JSR sub_3F_E4D1              ; $8734  20 D1 E4
    LDA $03B7                    ; $8737  AD B7 03
    AND #$DF                     ; $873A  29 DF
    STA $03B7                    ; $873C  8D B7 03
    LDA #$00                     ; $873F  A9 00
    STA $11                      ; $8741  85 11
    STA $12                      ; $8743  85 12
    LDY $07                      ; $8745  A4 07
    LDA $9119,Y                  ; $8747  B9 19 91
    STA $00                      ; $874A  85 00
    LDA $912D,Y                  ; $874C  B9 2D 91
    STA $01                      ; $874F  85 01
    JSR sub_3E_D9CD              ; $8751  20 CD D9
    LDA $064B                    ; $8754  AD 4B 06
    STA $067C                    ; $8757  8D 7C 06
    LDA $11                      ; $875A  A5 11
    STA $064B                    ; $875C  8D 4B 06
    BEQ loc_38_8763              ; $875F  F0 02
    STA $A7                      ; $8761  85 A7

loc_38_8763:
    JSR sub_38_887E              ; $8763  20 7E 88
    LDA #$00                     ; $8766  A9 00
    STA $11                      ; $8768  85 11
    LDY $05                      ; $876A  A4 05
    LDA $9119,Y                  ; $876C  B9 19 91
    STA $00                      ; $876F  85 00
    LDY $07                      ; $8771  A4 07
    LDA $912F,Y                  ; $8773  B9 2F 91
    STA $01                      ; $8776  85 01
    JSR sub_3E_D9CD              ; $8778  20 CD D9
    LDA $11                      ; $877B  A5 11
    BEQ loc_38_878C              ; $877D  F0 0D
    JSR sub_38_8A96              ; $877F  20 96 8A
    LDA $11                      ; $8782  A5 11
    LDY #$00                     ; $8784  A0 00
    STY $11                      ; $8786  84 11
    AND #$01                     ; $8788  29 01
    BNE loc_38_87FE              ; $878A  D0 72

loc_38_878C:
    LDA $96                      ; $878C  A5 96
    BEQ loc_38_87B2              ; $878E  F0 22
    LDY $05                      ; $8790  A4 05
    INC $05                      ; $8792  E6 05
    LDA $9119,Y                  ; $8794  B9 19 91
    STA $00                      ; $8797  85 00
    LDA $912D,Y                  ; $8799  B9 2D 91
    STA $01                      ; $879C  85 01
    JSR sub_3E_D9CD              ; $879E  20 CD D9
    LDA $11                      ; $87A1  A5 11
    BEQ loc_38_87B2              ; $87A3  F0 0D
    JSR sub_38_8A96              ; $87A5  20 96 8A
    LDA $11                      ; $87A8  A5 11
    LDY #$00                     ; $87AA  A0 00
    STY $11                      ; $87AC  84 11
    AND #$01                     ; $87AE  29 01
    BNE loc_38_87FE              ; $87B0  D0 4C

loc_38_87B2:
    LDY $06                      ; $87B2  A4 06
    INC $06                      ; $87B4  E6 06
    LDA $9119,Y                  ; $87B6  B9 19 91
    STA $00                      ; $87B9  85 00
    LDA $912D,Y                  ; $87BB  B9 2D 91
    STA $01                      ; $87BE  85 01
    JSR sub_3E_D9CD              ; $87C0  20 CD D9
    LDA $11                      ; $87C3  A5 11
    BEQ loc_38_87CE              ; $87C5  F0 07
    JSR sub_38_887E              ; $87C7  20 7E 88
    LDA #$00                     ; $87CA  A9 00
    STA $11                      ; $87CC  85 11

loc_38_87CE:
    LDY $06                      ; $87CE  A4 06
    LDA $9119,Y                  ; $87D0  B9 19 91
    STA $00                      ; $87D3  85 00
    LDA $912D,Y                  ; $87D5  B9 2D 91
    STA $01                      ; $87D8  85 01
    JSR sub_3E_D9CD              ; $87DA  20 CD D9
    LDA $11                      ; $87DD  A5 11
    BEQ loc_38_87E8              ; $87DF  F0 07
    JSR sub_38_887E              ; $87E1  20 7E 88
    LDA #$00                     ; $87E4  A9 00
    STA $11                      ; $87E6  85 11

loc_38_87E8:
    LDY $05                      ; $87E8  A4 05
    LDA $9119,Y                  ; $87EA  B9 19 91
    STA $00                      ; $87ED  85 00
    LDA $912D,Y                  ; $87EF  B9 2D 91
    STA $01                      ; $87F2  85 01
    JSR sub_3E_D9CD              ; $87F4  20 CD D9
    LDA $11                      ; $87F7  A5 11
    BEQ loc_38_87FE              ; $87F9  F0 03
    JSR sub_38_8A96              ; $87FB  20 96 8A

loc_38_87FE:
    LDA $AD                      ; $87FE  A5 AD
    BEQ loc_38_8805              ; $8800  F0 03
    INC $04CB                    ; $8802  EE CB 04

loc_38_8805:
    LDA $F3                      ; $8805  A5 F3
    AND #$07                     ; $8807  29 07
    BNE loc_38_8839              ; $8809  D0 2E
    LDA $A2                      ; $880B  A5 A2
    BNE loc_38_8839              ; $880D  D0 2A
    LDA #$00                     ; $880F  A9 00
    STA $00                      ; $8811  85 00
    LDA $F3                      ; $8813  A5 F3
    AND #$08                     ; $8815  29 08
    BEQ loc_38_8821              ; $8817  F0 08
    LDA #$FB                     ; $8819  A9 FB
    LDY $94                      ; $881B  A4 94
    CPY #$03                     ; $881D  C0 03
    BNE loc_38_8823              ; $881F  D0 02

loc_38_8821:
    LDA #$FC                     ; $8821  A9 FC

loc_38_8823:
    STA $01                      ; $8823  85 01
    LDA #$00                     ; $8825  A9 00
    STA $11                      ; $8827  85 11
    JSR sub_3E_D9CD              ; $8829  20 CD D9
    LDA $11                      ; $882C  A5 11
    CMP #$03                     ; $882E  C9 03
    BEQ loc_38_8839              ; $8830  F0 07
    AND #$01                     ; $8832  29 01
    BEQ loc_38_8839              ; $8834  F0 03
    JMP loc_38_8E62              ; $8836  4C 62 8E


loc_38_8839:
    LDA $40                      ; $8839  A5 40
    AND #$0C                     ; $883B  29 0C
    BEQ loc_38_887D              ; $883D  F0 3E
    LDY #$10                     ; $883F  A0 10
    AND #$08                     ; $8841  29 08
    BEQ loc_38_8846              ; $8843  F0 01
    INY                          ; $8845  C8

loc_38_8846:
    LDA #$00                     ; $8846  A9 00
    STA $11                      ; $8848  85 11
    LDA $9119,Y                  ; $884A  B9 19 91
    STA $00                      ; $884D  85 00
    LDA $912D,Y                  ; $884F  B9 2D 91
    STA $01                      ; $8852  85 01
    JSR sub_3E_D9CD              ; $8854  20 CD D9
    LDX $8F                      ; $8857  A6 8F
    LDA $11                      ; $8859  A5 11
    CMP #$04                     ; $885B  C9 04
    BEQ loc_38_886C              ; $885D  F0 0D
    CMP #$03                     ; $885F  C9 03
    BNE loc_38_887D              ; $8861  D0 1A
    LDA $04CB                    ; $8863  AD CB 04
    CLC                          ; $8866  18
    ADC #$08                     ; $8867  69 08
    STA $04CB                    ; $8869  8D CB 04

loc_38_886C:
    LDA #$00                     ; $886C  A9 00
    STA $05B1                    ; $886E  8D B1 05
    STA $05C8                    ; $8871  8D C8 05
    JSR sub_3E_DB5E              ; $8874  20 5E DB
    JSR sub_3F_E4CB              ; $8877  20 CB E4
    JMP loc_38_834E              ; $887A  4C 4E 83


loc_38_887D:
    RTS                          ; $887D  60


sub_38_887E:
    TAY                          ; $887E  A8
    LDA $888C,Y                  ; $887F  B9 8C 88
    STA $0C                      ; $8882  85 0C
    LDA $88AC,Y                  ; $8884  B9 AC 88
    STA $0D                      ; $8887  85 0D
    JMP ($000C)                  ; $8889  6C 0C 00

    .byte $79,$72,$DF,$90,$95,$72,$CC,$6A,$9C,$6A,$EA,$72,$72,$72,$78,$89  ; $888C
    .byte $CC,$2F,$78,$10,$78,$21,$78,$50,$78,$5D,$78,$72,$78,$FC,$78,$72  ; $889C
    .byte $89,$8A,$88,$8A,$8A,$8A,$88,$8A,$89,$8A,$89,$8A,$8A,$8A,$89,$8A  ; $88AC
    .byte $88,$89,$89,$89,$89,$89,$89,$8A,$89,$8A,$89,$8A,$89,$89,$89,$8A  ; $88BC
    LDA $067C                    ; $88CC  AD 7C 06
    CMP #$09                     ; $88CF  C9 09
    BNE loc_38_88D6              ; $88D1  D0 03
    JSR sub_38_88EA              ; $88D3  20 EA 88

loc_38_88D6:
    LDA $03B7                    ; $88D6  AD B7 03
    ORA #$20                     ; $88D9  09 20
    STA $03B7                    ; $88DB  8D B7 03
    RTS                          ; $88DE  60

    LDA $067C                    ; $88DF  AD 7C 06
    CMP #$06                     ; $88E2  C9 06
    BNE loc_38_88E9              ; $88E4  D0 03
    JSR sub_38_88EA              ; $88E6  20 EA 88

loc_38_88E9:
    RTS                          ; $88E9  60


sub_38_88EA:
    LDA #$50                     ; $88EA  A9 50
    STA $DC                      ; $88EC  85 DC
    LDA $064B                    ; $88EE  AD 4B 06
    STA $067C                    ; $88F1  8D 7C 06
    LDY #$44                     ; $88F4  A0 44
    LDX #$06                     ; $88F6  A2 06
    JSR sub_3E_CB28              ; $88F8  20 28 CB
    EOR ($AD,X)                  ; $88FB  41 AD
    AXS #$04                     ; $88FD  CB 04
    CLC                          ; $88FF  18
    ADC #$0D                     ; $8900  69 0D
    AND #$F0                     ; $8902  29 F0
    ORA #$06                     ; $8904  09 06
    STA $04CB,X                  ; $8906  9D CB 04
    LDA $0486                    ; $8909  AD 86 04
    STA $0486,X                  ; $890C  9D 86 04
    RTS                          ; $890F  60

    .byte $A9,$04,$8D,$C8,$05,$A9,$01,$8D,$B1,$05,$A9,$F0,$A0,$AE,$4C,$55  ; $8910
    .byte $89,$A9,$01,$8D,$B1,$05,$A9,$F7,$8D,$C8,$05,$A0,$AF,$D0,$20,$A9  ; $8920
    .byte $54,$85,$DC,$A0,$57,$A9,$01,$8D,$B1,$05,$A9,$FB,$8D,$C8,$05,$A5  ; $8930
    .byte $40,$29,$80,$F0,$0A,$A9,$0C,$8D,$B1,$05,$A9,$F8,$8D,$C8,$05,$A9  ; $8940
    .byte $00,$85,$9D,$A9,$10,$18,$6D,$CB,$04,$29,$F0,$A2,$06,$9D,$CB,$04  ; $8950
    .byte $AD,$86,$04,$18,$65,$00,$29,$F0,$9D,$86,$04,$AD,$6F,$04,$9D,$6F  ; $8960
    .byte $04,$20,$28,$CB,$41,$4C,$7F,$8A,$60  ; $8970
    LDA #$00                     ; $8979  A9 00
    STA $01                      ; $897B  85 01
    LDA $067C                    ; $897D  AD 7C 06
    CMP #$08                     ; $8980  C9 08
    BNE loc_38_899B              ; $8982  D0 17
    LDA $064B                    ; $8984  AD 4B 06
    STA $067C                    ; $8987  8D 7C 06
    LDA #$00                     ; $898A  A9 00
    STA $11                      ; $898C  85 11
    STA $00                      ; $898E  85 00
    STA $01                      ; $8990  85 01
    JSR sub_3E_D9CD              ; $8992  20 CD D9
    LDA $11                      ; $8995  A5 11
    CMP #$08                     ; $8997  C9 08
    BEQ loc_38_89BA              ; $8999  F0 1F

loc_38_899B:
    RTS                          ; $899B  60

    LDA $067C                    ; $899C  AD 7C 06
    BNE loc_38_89DC              ; $899F  D0 3B
    LDA $064B                    ; $89A1  AD 4B 06
    STA $067C                    ; $89A4  8D 7C 06
    LDA #$00                     ; $89A7  A9 00
    STA $11                      ; $89A9  85 11
    STA $00                      ; $89AB  85 00
    STA $01                      ; $89AD  85 01
    JSR sub_3E_D9CD              ; $89AF  20 CD D9
    LDA $11                      ; $89B2  A5 11
    BNE loc_38_89DC              ; $89B4  D0 26
    LDA #$10                     ; $89B6  A9 10
    STA $01                      ; $89B8  85 01

loc_38_89BA:
    LDX #$06                     ; $89BA  A2 06
    LDA $04CB                    ; $89BC  AD CB 04
    CLC                          ; $89BF  18
    ADC $01                      ; $89C0  65 01
    AND #$F0                     ; $89C2  29 F0
    ADC #$02                     ; $89C4  69 02
    STA $04CB,X                  ; $89C6  9D CB 04
    LDA $0486                    ; $89C9  AD 86 04
    STA $0486,X                  ; $89CC  9D 86 04
    LDA $046F                    ; $89CF  AD 6F 04
    STA $046F,X                  ; $89D2  9D 6F 04
    LDY #$72                     ; $89D5  A0 72
    JSR sub_3E_CB28              ; $89D7  20 28 CB
    EOR ($60,X)                  ; $89DA  41 60

loc_38_89DC:
    LDA $03A6                    ; $89DC  AD A6 03
    BNE loc_38_89E9              ; $89DF  D0 08
    LDX #$06                     ; $89E1  A2 06
    LDY #$40                     ; $89E3  A0 40
    JSR sub_3E_CB28              ; $89E5  20 28 CB
    EOR ($60,X)                  ; $89E8  41 60
    LDA $05C8                    ; $89EA  AD C8 05
    BMI loc_38_89FB              ; $89ED  30 0C
    LDA $04CB                    ; $89EF  AD CB 04
    CMP #$47                     ; $89F2  C9 47
    BCS loc_38_89FB              ; $89F4  B0 05
    LDA #$00                     ; $89F6  A9 00
    STA $064B                    ; $89F8  8D 4B 06

loc_38_89FB:
    RTS                          ; $89FB  60

    .byte $AD,$C8,$05,$30,$4C,$A5,$13,$85,$80,$AD,$6F,$04,$85,$4F,$A5,$00  ; $89FC
    .byte $10,$02,$C6,$4F,$18,$6D,$86,$04,$29,$F0,$85,$4D,$A5,$4F,$69,$00  ; $8A0C
    .byte $85,$4F,$AD,$CB,$04,$18,$65,$01,$29,$F0,$85,$4E,$20,$AB,$D8,$20  ; $8A1C
    .byte $94,$DB,$20,$2E,$D9,$A0,$8B,$20,$AB,$E5,$B0,$15,$A5,$4D,$18,$69  ; $8A2C
    .byte $08,$9D,$86,$04,$A5,$4F,$9D,$6F,$04,$A5,$4E,$18,$69,$07,$9D,$CB  ; $8A3C
    .byte $04,$4C,$72,$8A,$A9,$80,$8D,$9A,$06,$A9,$FF,$8D,$9B,$06,$4C,$72  ; $8A4C
    .byte $8A,$A9,$80,$8D,$9A,$06,$A9,$00,$8D,$9B,$06,$4C,$72,$8A  ; $8A5C
    LDA $03B7                    ; $8A6A  AD B7 03
    ORA #$20                     ; $8A6D  09 20
    STA $03B7                    ; $8A6F  8D B7 03

loc_38_8A72:
    LDA #$00                     ; $8A72  A9 00
    LDY $05C8                    ; $8A74  AC C8 05
    BMI loc_38_8A7C              ; $8A77  30 03
    STA $05B1                    ; $8A79  8D B1 05

loc_38_8A7C:
    STA $05C8                    ; $8A7C  8D C8 05
    JSR sub_3E_DB6D              ; $8A7F  20 6D DB
    LDX $8F                      ; $8A82  A6 8F
    INC $AD                      ; $8A84  E6 AD
    JMP sub_3F_E4CB              ; $8A86  4C CB E4

    LDA $A2                      ; $8A89  A5 A2
    BNE loc_38_8A72              ; $8A8B  D0 E5
    JMP loc_38_8E62              ; $8A8D  4C 62 8E

    LDA $EE                      ; $8A90  A5 EE
    BPL loc_38_8A72              ; $8A92  10 DE
    RTS                          ; $8A94  60

    RTS                          ; $8A95  60


sub_38_8A96:
    TAY                          ; $8A96  A8
    LDA $8AA4,Y                  ; $8A97  B9 A4 8A
    STA $0C                      ; $8A9A  85 0C
    LDA $8AC4,Y                  ; $8A9C  B9 C4 8A
    STA $0D                      ; $8A9F  85 0D
    JMP ($000C)                  ; $8AA1  6C 0C 00

    .byte $E4,$ED,$E4,$E4,$E4,$ED,$06,$E5,$E4,$E5,$E4,$ED,$ED,$ED,$E4,$FF  ; $8AA4
    .byte $06,$ED,$E4,$ED,$E4,$ED,$E4,$ED,$E4,$ED,$E4,$ED,$E4,$ED,$E4,$ED  ; $8AB4
    .byte $8A,$8A,$8A,$8A,$8A,$8A,$8B,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A  ; $8AC4
    .byte $8B,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A,$8A  ; $8AD4
    RTS                          ; $8AE4  60

    LDA $03B7                    ; $8AE5  AD B7 03
    ORA #$20                     ; $8AE8  09 20
    STA $03B7                    ; $8AEA  8D B7 03

loc_38_8AED:
    LDA #$00                     ; $8AED  A9 00
    STA $A0                      ; $8AEF  85 A0
    STA $A1                      ; $8AF1  85 A1
    LDA $11                      ; $8AF3  A5 11
    STA $12                      ; $8AF5  85 12
    JSR sub_3E_DB4F              ; $8AF7  20 4F DB
    LDX $8F                      ; $8AFA  A6 8F
    JMP sub_3F_E4CB              ; $8AFC  4C CB E4

    LDA $A2                      ; $8AFF  A5 A2
    BNE loc_38_8AED              ; $8B01  D0 EA
    JMP loc_38_8E62              ; $8B03  4C 62 8E

    LDA $03B7                    ; $8B06  AD B7 03
    ORA #$20                     ; $8B09  09 20
    STA $03B7                    ; $8B0B  8D B7 03
    RTS                          ; $8B0E  60


sub_38_8B0F:
    LDA $A7                      ; $8B0F  A5 A7
    CMP #$15                     ; $8B11  C9 15
    BEQ loc_38_8B19              ; $8B13  F0 04
    CMP #$05                     ; $8B15  C9 05
    BNE loc_38_8B8A              ; $8B17  D0 71

loc_38_8B19:
    LDA $A1                      ; $8B19  A5 A1
    ORA $A0                      ; $8B1B  05 A0
    BEQ loc_38_8B5E              ; $8B1D  F0 3F
    LDY #$01                     ; $8B1F  A0 01
    LDA $A1                      ; $8B21  A5 A1
    BPL loc_38_8B26              ; $8B23  10 01
    INY                          ; $8B25  C8

loc_38_8B26:
    TYA                          ; $8B26  98
    EOR $99                      ; $8B27  45 99
    BEQ loc_38_8B5E              ; $8B29  F0 33
    LDA $8C02,Y                  ; $8B2B  B9 02 8C
    CLC                          ; $8B2E  18
    ADC $A0                      ; $8B2F  65 A0
    STA $A0                      ; $8B31  85 A0
    LDA $A1                      ; $8B33  A5 A1
    STA $00                      ; $8B35  85 00
    ADC $8C05,Y                  ; $8B37  79 05 8C
    STA $A1                      ; $8B3A  85 A1
    LDY $99                      ; $8B3C  A4 99
    LDA $8BFC,Y                  ; $8B3E  B9 FC 8B
    CLC                          ; $8B41  18
    ADC $A0                      ; $8B42  65 A0
    STA $A0                      ; $8B44  85 A0
    STA $EB                      ; $8B46  85 EB
    LDA $A1                      ; $8B48  A5 A1
    ADC $8BFF,Y                  ; $8B4A  79 FF 8B
    STA $A1                      ; $8B4D  85 A1
    STA $ED                      ; $8B4F  85 ED
    EOR $00                      ; $8B51  45 00
    BPL loc_38_8B5B              ; $8B53  10 06
    LDA #$00                     ; $8B55  A9 00
    STA $A0                      ; $8B57  85 A0
    STA $A1                      ; $8B59  85 A1

loc_38_8B5B:
    JMP sub_38_86CE              ; $8B5B  4C CE 86


loc_38_8B5E:
    LDA $A7                      ; $8B5E  A5 A7
    CMP #$15                     ; $8B60  C9 15
    BEQ loc_38_8B77              ; $8B62  F0 13
    LDY $99                      ; $8B64  A4 99
    LDA $8BEA,Y                  ; $8B66  B9 EA 8B
    STA $A1                      ; $8B69  85 A1
    STA $ED                      ; $8B6B  85 ED
    LDA $8BED,Y                  ; $8B6D  B9 ED 8B
    STA $A0                      ; $8B70  85 A0
    STA $EB                      ; $8B72  85 EB
    JMP sub_38_86CE              ; $8B74  4C CE 86


loc_38_8B77:
    LDY $99                      ; $8B77  A4 99
    LDA $8BF0,Y                  ; $8B79  B9 F0 8B
    STA $A1                      ; $8B7C  85 A1
    STA $ED                      ; $8B7E  85 ED
    LDA $8BF3,Y                  ; $8B80  B9 F3 8B
    STA $A0                      ; $8B83  85 A0
    STA $EB                      ; $8B85  85 EB
    JMP sub_38_86CE              ; $8B87  4C CE 86


loc_38_8B8A:
    LDA $064B                    ; $8B8A  AD 4B 06
    CMP #$09                     ; $8B8D  C9 09
    BNE sub_38_8BA0              ; $8B8F  D0 0F
    LDY $99                      ; $8B91  A4 99
    LDA $8BF6,Y                  ; $8B93  B9 F6 8B
    STA $ED                      ; $8B96  85 ED
    LDA $8BF9,Y                  ; $8B98  B9 F9 8B
    STA $EB                      ; $8B9B  85 EB
    JMP sub_38_86CE              ; $8B9D  4C CE 86


sub_38_8BA0:
    LDA $A7                      ; $8BA0  A5 A7
    CMP #$0C                     ; $8BA2  C9 0C
    BEQ loc_38_8BAA              ; $8BA4  F0 04
    CMP #$0A                     ; $8BA6  C9 0A
    BNE loc_38_8BD5              ; $8BA8  D0 2B

loc_38_8BAA:
    LDA $064B                    ; $8BAA  AD 4B 06
    CMP #$0C                     ; $8BAD  C9 0C
    BEQ loc_38_8BB8              ; $8BAF  F0 07
    CMP #$0A                     ; $8BB1  C9 0A
    BEQ loc_38_8BB8              ; $8BB3  F0 03
    JMP loc_38_8BD5              ; $8BB5  4C D5 8B


loc_38_8BB8:
    LDA #$B0                     ; $8BB8  A9 B0
    CLC                          ; $8BBA  18
    ADC $05B1                    ; $8BBB  6D B1 05
    AND #$F0                     ; $8BBE  29 F0
    ORA #$01                     ; $8BC0  09 01
    STA $05B1                    ; $8BC2  8D B1 05
    LDA #$FF                     ; $8BC5  A9 FF
    ADC $05C8                    ; $8BC7  6D C8 05
    BPL loc_38_8BD2              ; $8BCA  10 06
    CMP #$FC                     ; $8BCC  C9 FC
    BCS loc_38_8BD2              ; $8BCE  B0 02
    LDA #$FC                     ; $8BD0  A9 FC

loc_38_8BD2:
    STA $05C8                    ; $8BD2  8D C8 05

loc_38_8BD5:
    LDA #$00                     ; $8BD5  A9 00
    STA $A1                      ; $8BD7  85 A1
    STA $A0                      ; $8BD9  85 A0
    LDY $99                      ; $8BDB  A4 99
    LDA $8BEA,Y                  ; $8BDD  B9 EA 8B
    STA $ED                      ; $8BE0  85 ED
    LDA $8BED,Y                  ; $8BE2  B9 ED 8B
    STA $EB                      ; $8BE5  85 EB
    JMP sub_38_86CE              ; $8BE7  4C CE 86

    .byte $00,$01,$FE,$00,$4C,$B4,$00,$02,$FE,$00,$00,$00,$00,$00,$FF,$00  ; $8BEA
    .byte $80,$80,$00,$06,$FA,$00,$00,$FF,$00,$FA,$06,$00,$FF,$00,$00  ; $8BFA

sub_38_8C09:
    LDA #$01                     ; $8C09  A9 01
    STA $00                      ; $8C0B  85 00
    LDA $0486                    ; $8C0D  AD 86 04
    SEC                          ; $8C10  38
    SBC $9F                      ; $8C11  E5 9F
    BPL loc_38_8C1B              ; $8C13  10 06
    EOR #$FF                     ; $8C15  49 FF
    ADC #$01                     ; $8C17  69 01
    INC $00                      ; $8C19  E6 00

loc_38_8C1B:
    CMP #$09                     ; $8C1B  C9 09
    BCC loc_38_8C21              ; $8C1D  90 02
    LDA #$08                     ; $8C1F  A9 08

loc_38_8C21:
    STA $6D                      ; $8C21  85 6D
    LDA $0486                    ; $8C23  AD 86 04
    STA $9F                      ; $8C26  85 9F
    SEC                          ; $8C28  38
    SBC $56                      ; $8C29  E5 56
    LDX #$01                     ; $8C2B  A2 01
    SEC                          ; $8C2D  38
    SBC #$80                     ; $8C2E  E9 80
    BEQ loc_38_8C3C              ; $8C30  F0 0A
    BCS loc_38_8C36              ; $8C32  B0 02
    LDX #$02                     ; $8C34  A2 02

loc_38_8C36:
    TXA                          ; $8C36  8A
    AND $00                      ; $8C37  25 00
    JMP sub_3E_DBAD              ; $8C39  4C AD DB


loc_38_8C3C:
    RTS                          ; $8C3C  60

    .byte $00,$04,$FC,$00,$05,$FB  ; $8C3D

sub_38_8C43:
    LDA #$00                     ; $8C43  A9 00
    STA $05DF,X                  ; $8C45  9D DF 05
    LDA #$23                     ; $8C48  A9 23
    STA $DC                      ; $8C4A  85 DC
    LDA $03B7                    ; $8C4C  AD B7 03
    AND #$DE                     ; $8C4F  29 DE
    STA $03B7,X                  ; $8C51  9D B7 03
    LDY $03CE                    ; $8C54  AC CE 03
    LDA $8C3D,Y                  ; $8C57  B9 3D 8C
    STA $05C8,X                  ; $8C5A  9D C8 05
    LDY #$00                     ; $8C5D  A0 00
    LDA #$04                     ; $8C5F  A9 04
    JMP sub_3F_E8CC              ; $8C61  4C CC E8

    .byte $57,$00,$00,$0B,$0F,$1A,$20,$D1,$EB,$4C,$79,$8C,$7E,$00,$00,$0B  ; $8C64
    .byte $0F,$1A,$20,$D1,$EB,$A0,$01,$AD,$86,$04,$DD,$86,$04,$90,$02,$A0  ; $8C74
    .byte $02,$98,$9D,$CE,$03,$B9,$3D,$8C,$9D,$C8,$05,$A9,$00,$9D,$DF,$05  ; $8C84
    .byte $4C,$A3,$8C,$10,$00,$00,$14,$01,$11  ; $8C94
    JSR sub_3F_EBD1              ; $8C9D  20 D1 EB
    JSR sub_38_8C43              ; $8CA0  20 43 8C

loc_38_8CA3:
    LDA $05C8,X                  ; $8CA3  BD C8 05
    STA $ED                      ; $8CA6  85 ED
    LDA $05DF,X                  ; $8CA8  BD DF 05
    STA $EE                      ; $8CAB  85 EE
    JSR sub_3F_E4CB              ; $8CAD  20 CB E4
    JSR sub_38_8FDF              ; $8CB0  20 DF 8F
    JMP loc_38_8CA3              ; $8CB3  4C A3 8C

    .byte $1A,$00,$00,$15,$02,$11,$20,$D1,$EB,$20,$43,$8C,$A9,$28,$20,$B2  ; $8CB6
    .byte $C8,$4C,$A3,$8C,$19,$00,$00,$16,$03,$13,$20,$D1,$EB,$20,$43,$8C  ; $8CC6
    .byte $A0,$06,$A2,$01,$20,$28,$CB,$41,$A0,$06,$E8,$20,$28,$CB,$41,$A6  ; $8CD6
    .byte $8F,$A9,$28,$20,$B2,$C8,$AC,$CE,$03,$B9,$40,$8C,$9D,$C8,$05,$4C  ; $8CE6
    .byte $A3,$8C,$2C,$00,$00,$13,$04,$14,$20,$D1,$EB,$A9,$04,$9D,$B1,$05  ; $8CF6
    .byte $A9,$2C,$9D,$F6,$05,$D0,$28,$30,$00,$00,$12,$03,$13,$20,$D1,$EB  ; $8D06
    .byte $A9,$0C,$9D,$B1,$05,$A9,$30,$9D,$F6,$05,$D0,$13,$35,$00,$00,$11  ; $8D16
    .byte $02,$12,$20,$D1,$EB,$A9,$10,$9D,$B1,$05,$A9,$35,$9D,$F6,$05,$FE  ; $8D26
    .byte $B7,$03,$A9,$07,$85,$A6,$20,$68,$E4,$A5,$97,$C6,$A6,$D0,$F7,$20  ; $8D36
    .byte $43,$8C,$BD,$F6,$05,$A8,$20,$22,$E5,$BD,$83,$05,$C9,$14,$D0,$22  ; $8D46
    .byte $A9,$00,$85,$11,$A9,$00,$85,$00,$85,$01,$20,$CD,$D9,$A5,$11,$F0  ; $8D56
    .byte $11,$C9,$0B,$F0,$0A,$C9,$1B,$D0,$09,$20,$F8,$8D,$4C,$78,$8D,$20  ; $8D66
    .byte $9D,$8D,$BD,$C8,$05,$85,$ED,$BD,$DF,$05,$85,$EE,$20,$CB,$E4,$20  ; $8D76
    .byte $DF,$8F,$DE,$B1,$05,$D0,$C2,$A9,$0A,$9D,$B1,$05,$20,$68,$E4,$DE  ; $8D86
    .byte $B1,$05,$D0,$F8,$4C,$56,$E4,$A9,$3E,$A4,$51,$F0,$02,$A9,$2C,$85  ; $8D96
    .byte $DC,$20,$4F,$E1,$A6,$8F,$A0,$7A,$20,$28,$CB,$41,$4C,$77,$E4,$A5  ; $8DA6
    .byte $13,$29,$FE,$85,$80,$BD,$86,$04,$29,$F0,$85,$4D,$18,$69,$08,$9D  ; $8DB6
    .byte $86,$04,$BD,$CB,$04,$29,$E0,$85,$4E,$18,$69,$10,$9D,$CB,$04,$20  ; $8DC6
    .byte $AB,$D8,$20,$94,$DB,$20,$2E,$D9,$E6,$6B,$A5,$5C,$18,$69,$40,$85  ; $8DD6
    .byte $5C,$20,$94,$DB,$20,$2E,$D9,$A6,$8F,$A0,$76,$20,$28,$CB,$41,$4C  ; $8DE6
    .byte $77,$E4,$A5,$13,$29,$FC,$85,$80,$BD,$86,$04,$29,$F0,$85,$4D,$18  ; $8DF6
    .byte $69,$08,$9D,$86,$04,$BD,$CB,$04,$38,$E9,$20,$29,$C0,$18,$69,$20  ; $8E06
    .byte $85,$4E,$69,$20,$9D,$CB,$04,$20,$AB,$D8,$20,$94,$DB,$20,$2E,$D9  ; $8E16
    .byte $E6,$6B,$20,$43,$8E,$C6,$6B,$20,$43,$8E,$E6,$6B,$20,$43,$8E,$A6  ; $8E26
    .byte $8F,$A0,$25,$20,$28,$CB,$41,$20,$2B,$C6,$4C,$77,$E4,$A5,$5C,$18  ; $8E36
    .byte $69,$40,$85,$5C,$A5,$5D,$69,$00,$85,$5D,$20,$94,$DB,$4C,$2E,$D9  ; $8E46
    .byte $20,$68,$E4,$AD,$A3,$03,$D0,$F8,$9D,$A0,$03,$60  ; $8E56

loc_38_8E62:
    LDX #$00                     ; $8E62  A2 00
    STX $03A1                    ; $8E64  8E A1 03
    STX $03A2                    ; $8E67  8E A2 03
    STX $03A3                    ; $8E6A  8E A3 03
    STX $03A4                    ; $8E6D  8E A4 03
    JSR sub_3F_ED3E              ; $8E70  20 3E ED
    LDA #$F0                     ; $8E73  A9 F0
    STA $95                      ; $8E75  85 95
    LDA #$01                     ; $8E77  A9 01
    STA $03B7                    ; $8E79  8D B7 03

loc_38_8E7C:
    JSR sub_3F_E468              ; $8E7C  20 68 E4
    DEC $95                      ; $8E7F  C6 95
    BNE loc_38_8E7C              ; $8E81  D0 F9

loc_38_8E83:
    LDA #$10                     ; $8E83  A9 10
    STA $04CB                    ; $8E85  8D CB 04
    LDA #$02                     ; $8E88  A9 02
    DEC $A9                      ; $8E8A  C6 A9
    BPL loc_38_8E90              ; $8E8C  10 02
    LDA #$03                     ; $8E8E  A9 03

loc_38_8E90:
    STA $F0                      ; $8E90  85 F0
    JMP loc_3F_E456              ; $8E92  4C 56 E4


sub_38_8E95:
    JSR sub_38_924D              ; $8E95  20 4D 92
    LDA $03B7                    ; $8E98  AD B7 03
    AND #$FE                     ; $8E9B  29 FE
    STA $03B7                    ; $8E9D  8D B7 03
    LDX #$00                     ; $8EA0  A2 00
    LDA $A2                      ; $8EA2  A5 A2
    BEQ sub_38_8EB9              ; $8EA4  F0 13
    DEC $A2                      ; $8EA6  C6 A2
    LDA $A2                      ; $8EA8  A5 A2
    LSR A                        ; $8EAA  4A
    AND #$01                     ; $8EAB  29 01
    STA $00                      ; $8EAD  85 00
    LDA $03B7                    ; $8EAF  AD B7 03
    AND #$FE                     ; $8EB2  29 FE
    ORA $00                      ; $8EB4  05 00
    STA $03B7                    ; $8EB6  8D B7 03

sub_38_8EB9:
    LDA #$00                     ; $8EB9  A9 00
    STA $96                      ; $8EBB  85 96
    LDA $04CB,X                  ; $8EBD  BD CB 04
    CLC                          ; $8EC0  18
    ADC $059A                    ; $8EC1  6D 9A 05
    STA $02                      ; $8EC4  85 02
    JSR sub_3F_ECC9              ; $8EC6  20 C9 EC

loc_38_8EC9:
    BCC loc_38_8EE5              ; $8EC9  90 1A
    STA $04                      ; $8ECB  85 04
    LSR A                        ; $8ECD  4A
    LSR A                        ; $8ECE  4A
    LSR A                        ; $8ECF  4A
    LSR A                        ; $8ED0  4A
    TAX                          ; $8ED1  AA
    LDA $8F46,X                  ; $8ED2  BD 46 8F
    STA $08                      ; $8ED5  85 08
    LDA $8F56,X                  ; $8ED7  BD 56 8F
    STA $09                      ; $8EDA  85 09
    JSR sub_3F_E482              ; $8EDC  20 82 E4
    JSR sub_3F_ECF5              ; $8EDF  20 F5 EC
    JMP loc_38_8EC9              ; $8EE2  4C C9 8E


loc_38_8EE5:
    LDA $03E5                    ; $8EE5  AD E5 03
    BPL loc_38_8EED              ; $8EE8  10 03
    JMP loc_38_8E62              ; $8EEA  4C 62 8E


loc_38_8EED:
    LDA $96                      ; $8EED  A5 96
    BEQ loc_38_8EF4              ; $8EEF  F0 03
    JMP loc_38_84B0              ; $8EF1  4C B0 84


loc_38_8EF4:
    JSR sub_38_8C09              ; $8EF4  20 09 8C
    LDA $04B4                    ; $8EF7  AD B4 04
    BNE loc_38_8F1A              ; $8EFA  D0 1E
    LDA $04CB                    ; $8EFC  AD CB 04
    CMP #$F0                     ; $8EFF  C9 F0
    BCC loc_38_8F2A              ; $8F01  90 27
    LDA #$01                     ; $8F03  A9 01
    STA $03B7                    ; $8F05  8D B7 03
    LDA #$26                     ; $8F08  A9 26
    STA $DC                      ; $8F0A  85 DC
    LDA #$3C                     ; $8F0C  A9 3C
    STA $95                      ; $8F0E  85 95

loc_38_8F10:
    JSR sub_3F_E468              ; $8F10  20 68 E4
    DEC $95                      ; $8F13  C6 95
    BNE loc_38_8F10              ; $8F15  D0 F9
    JMP loc_38_8E83              ; $8F17  4C 83 8E


loc_38_8F1A:
    LDA #$00                     ; $8F1A  A9 00
    STA $04CB                    ; $8F1C  8D CB 04
    STA $04B4                    ; $8F1F  8D B4 04
    LDA $03B7                    ; $8F22  AD B7 03
    ORA #$01                     ; $8F25  09 01
    STA $03B7                    ; $8F27  8D B7 03

loc_38_8F2A:
    LDA $0486                    ; $8F2A  AD 86 04
    SEC                          ; $8F2D  38
    SBC $56                      ; $8F2E  E5 56
    TAY                          ; $8F30  A8
    CPY $A8                      ; $8F31  C4 A8
    BCS loc_38_8F37              ; $8F33  B0 02
    LDA $A8                      ; $8F35  A5 A8

loc_38_8F37:
    CPY #$F4                     ; $8F37  C0 F4
    BCC loc_38_8F3D              ; $8F39  90 02
    LDA #$F4                     ; $8F3B  A9 F4

loc_38_8F3D:
    CLC                          ; $8F3D  18
    ADC $56                      ; $8F3E  65 56
    STA $0486                    ; $8F40  8D 86 04
    JMP sub_3F_E468              ; $8F43  4C 68 E4

    .byte $71,$72,$96,$72,$72,$96,$72,$6C,$66,$96,$71,$72,$72,$72,$72,$72  ; $8F46
    .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F  ; $8F56
    JSR sub_38_8F72              ; $8F66  20 72 8F
    JMP loc_38_8F96              ; $8F69  4C 96 8F

    LDA #$20                     ; $8F6C  A9 20
    STA $056C,Y                  ; $8F6E  99 6C 05
    RTS                          ; $8F71  60


sub_38_8F72:
    LDA $A2                      ; $8F72  A5 A2
    BNE loc_38_8F95              ; $8F74  D0 1F
    LDA $96                      ; $8F76  A5 96
    BNE loc_38_8F95              ; $8F78  D0 1B
    LDA $04                      ; $8F7A  A5 04
    AND #$0F                     ; $8F7C  29 0F
    STA $04                      ; $8F7E  85 04
    LDA $03E5                    ; $8F80  AD E5 03
    SEC                          ; $8F83  38
    SBC $04                      ; $8F84  E5 04
    STA $03E5                    ; $8F86  8D E5 03
    INC $96                      ; $8F89  E6 96
    LDA $056C,Y                  ; $8F8B  B9 6C 05
    BNE loc_38_8F95              ; $8F8E  D0 05
    LDA #$30                     ; $8F90  A9 30
    STA $056C,Y                  ; $8F92  99 6C 05

loc_38_8F95:
    RTS                          ; $8F95  60


loc_38_8F96:
    LDX #$00                     ; $8F96  A2 00
    LDA $EB                      ; $8F98  A5 EB
    CMP $EC                      ; $8F9A  C5 EC
    BCC loc_38_8FB5              ; $8F9C  90 17
    STX $ED                      ; $8F9E  86 ED
    LDA $05C8                    ; $8FA0  AD C8 05
    BMI loc_38_8FA8              ; $8FA3  30 03
    STX $05B1                    ; $8FA5  8E B1 05

loc_38_8FA8:
    STX $05C8                    ; $8FA8  8E C8 05
    LDA #$20                     ; $8FAB  A9 20
    STA $056C,Y                  ; $8FAD  99 6C 05
    INC $04CB                    ; $8FB0  EE CB 04
    BCS loc_38_8FBC              ; $8FB3  B0 07

loc_38_8FB5:
    LDA #$40                     ; $8FB5  A9 40
    STA $056C,Y                  ; $8FB7  99 6C 05
    STX $EE                      ; $8FBA  86 EE

loc_38_8FBC:
    JMP sub_3F_E4CB              ; $8FBC  4C CB E4

    .byte $21,$67,$D6,$A2,$28,$27,$D6,$27,$D6,$67,$67,$67,$19,$27,$67,$67  ; $8FBF
    .byte $90,$90,$90,$90,$90,$90,$90,$90,$90,$90,$90,$90,$91,$90,$90,$90  ; $8FCF

sub_38_8FDF:
    LDA $0583,X                  ; $8FDF  BD 83 05
    BEQ loc_38_9016              ; $8FE2  F0 32
    JSR sub_3F_ECC4              ; $8FE4  20 C4 EC

loc_38_8FE7:
    BCC loc_38_900B              ; $8FE7  90 22
    STA $04                      ; $8FE9  85 04
    LSR A                        ; $8FEB  4A
    LSR A                        ; $8FEC  4A
    LSR A                        ; $8FED  4A
    LSR A                        ; $8FEE  4A
    TAX                          ; $8FEF  AA
    LDA $8FBF,X                  ; $8FF0  BD BF 8F
    STA $08                      ; $8FF3  85 08
    LDA $8FCF,X                  ; $8FF5  BD CF 8F
    STA $09                      ; $8FF8  85 09
    LDX $8F                      ; $8FFA  A6 8F
    STY $06AE                    ; $8FFC  8C AE 06
    JSR sub_3F_E482              ; $8FFF  20 82 E4
    LDY $06AE                    ; $9002  AC AE 06
    JSR sub_3F_ECF5              ; $9005  20 F5 EC
    JMP loc_38_8FE7              ; $9008  4C E7 8F


loc_38_900B:
    LDA $0583,X                  ; $900B  BD 83 05
    CMP #$94                     ; $900E  C9 94
    BEQ loc_38_901B              ; $9010  F0 09
    CMP #$DF                     ; $9012  C9 DF
    BEQ loc_38_901B              ; $9014  F0 05

loc_38_9016:
    JSR sub_3F_E485              ; $9016  20 85 E4
    BCS loc_38_901E              ; $9019  B0 03

loc_38_901B:
    JMP sub_3F_E468              ; $901B  4C 68 E4


loc_38_901E:
    JMP loc_3F_E456              ; $901E  4C 56 E4

    LDA $0583,X                  ; $9021  BD 83 05
    STA $056C,Y                  ; $9024  99 6C 05
    RTS                          ; $9027  60

    LDA $0583,X                  ; $9028  BD 83 05
    CMP #$94                     ; $902B  C9 94
    BNE loc_38_9042              ; $902D  D0 13
    LDA #$00                     ; $902F  A9 00
    STA $03A0,Y                  ; $9031  99 A0 03

loc_38_9034:
    LDA #$00                     ; $9034  A9 00
    STA $03A1                    ; $9036  8D A1 03
    STA $03A2                    ; $9039  8D A2 03
    STA $03A3                    ; $903C  8D A3 03
    STA $03A4                    ; $903F  8D A4 03

loc_38_9042:
    RTS                          ; $9042  60


loc_38_9043:
    LDA $03E5,Y                  ; $9043  B9 E5 03
    SEC                          ; $9046  38
    SBC #$02                     ; $9047  E9 02
    BPL loc_38_909F              ; $9049  10 54
    LDA $0583,Y                  ; $904B  B9 83 05
    AND #$F0                     ; $904E  29 F0
    CMP #$E0                     ; $9050  C9 E0
    BEQ loc_38_909F              ; $9052  F0 4B
    LDA $0486,Y                  ; $9054  B9 86 04
    STA $0486,X                  ; $9057  9D 86 04
    LDA $046F,Y                  ; $905A  B9 6F 04
    STA $046F,X                  ; $905D  9D 6F 04
    LDA $0583,Y                  ; $9060  B9 83 05
    STA $056C,X                  ; $9063  9D 6C 05
    RTS                          ; $9066  60

    LDA $0583,X                  ; $9067  BD 83 05
    STA $056C,Y                  ; $906A  99 6C 05
    CMP #$DF                     ; $906D  C9 DF
    BEQ loc_38_9088              ; $906F  F0 17
    CMP #$94                     ; $9071  C9 94
    BEQ loc_38_9034              ; $9073  F0 BF
    CMP #$62                     ; $9075  C9 62
    BEQ loc_38_9043              ; $9077  F0 CA
    AND #$0F                     ; $9079  29 0F
    STA $04                      ; $907B  85 04
    LDA $03E5,Y                  ; $907D  B9 E5 03
    CLC                          ; $9080  18
    ADC #$01                     ; $9081  69 01
    CMP $04                      ; $9083  C5 04
    BCS loc_38_909F              ; $9085  B0 18
    RTS                          ; $9087  60


loc_38_9088:
    LDA $0583,Y                  ; $9088  B9 83 05
    AND #$F0                     ; $908B  29 F0
    CMP #$10                     ; $908D  C9 10
    BEQ loc_38_9097              ; $908F  F0 06
    LDA #$00                     ; $9091  A9 00
    STA $056C,Y                  ; $9093  99 6C 05
    RTS                          ; $9096  60


loc_38_9097:
    LDA $03E5,Y                  ; $9097  B9 E5 03
    EOR #$FF                     ; $909A  49 FF
    JMP loc_38_9E8E              ; $909C  4C 8E 9E


loc_38_909F:
    JMP loc_3F_E456              ; $909F  4C 56 E4

    .byte $B9,$A0,$03,$C9,$A2,$F0,$10,$BD,$83,$05,$29,$F0,$C9,$50,$F0,$0F  ; $90A2
    .byte $BD,$83,$05,$C9,$14,$F0,$AE,$20,$B8,$E5,$A5,$11,$D9,$CE,$03,$F0  ; $90B2
    .byte $A4,$BD,$83,$05,$C9,$94,$F0,$4C,$C9,$DF,$F0,$48,$A9,$00,$9D,$83  ; $90C2
    .byte $05,$4C,$D6,$90  ; $90D2
    LDA $0583,X                  ; $90D6  BD 83 05
    CMP #$94                     ; $90D9  C9 94
    BEQ loc_38_9116              ; $90DB  F0 39
    CMP #$DF                     ; $90DD  C9 DF
    BEQ loc_38_9116              ; $90DF  F0 35
    STA $056C,Y                  ; $90E1  99 6C 05
    LDA #$00                     ; $90E4  A9 00
    STA $0583,X                  ; $90E6  9D 83 05
    STA $EE                      ; $90E9  85 EE
    JSR sub_3F_E4CB              ; $90EB  20 CB E4
    LDA $05C8,X                  ; $90EE  BD C8 05
    EOR #$FF                     ; $90F1  49 FF
    STA $05C8,X                  ; $90F3  9D C8 05
    INC $05C8,X                  ; $90F6  FE C8 05
    LDA #$FC                     ; $90F9  A9 FC
    STA $05DF,X                  ; $90FB  9D DF 05
    LDA $03B7,X                  ; $90FE  BD B7 03
    EOR #$40                     ; $9101  49 40
    STA $03B7,X                  ; $9103  9D B7 03
    ASL A                        ; $9106  0A
    ASL A                        ; $9107  0A
    ROL A                        ; $9108  2A
    AND #$01                     ; $9109  29 01
    TAY                          ; $910B  A8
    LDA $9117,Y                  ; $910C  B9 17 91
    STA $03CE,X                  ; $910F  9D CE 03
    LDA #$27                     ; $9112  A9 27
    STA $DC                      ; $9114  85 DC

loc_38_9116:
    RTS                          ; $9116  60

    .byte $0E,$02,$07,$07,$F9,$F9,$07,$F9,$F9,$07,$07,$07,$F9,$F9,$07,$F9  ; $9117
    .byte $F9,$07,$00,$00,$00,$00,$F7,$0A,$F7,$0A,$0C,$0C,$F7,$F7,$FD,$0C  ; $9127
    .byte $FD,$0C,$0C,$0C,$FD,$FD,$0D,$F9,$0C,$F7,$07,$00,$08,$00,$A0,$01  ; $9137
    .byte $20,$F0,$C5,$20,$F1,$D6,$AD,$B1,$05,$8D,$DF,$05,$AD,$C8,$05,$8D  ; $9147
    .byte $F6,$05,$A5,$AE,$20,$EF,$C9,$A9,$00,$85,$98,$AD,$A5,$06,$30,$0A  ; $9157
    .byte $A9,$3A,$85,$DC,$A5,$51,$29,$08,$F0,$03,$4C,$08,$92,$A9,$80,$8D  ; $9167
    .byte $86,$04,$A9,$07,$20,$FD,$E0,$A9,$00,$8D,$DF,$05,$A9,$F8,$8D,$F6  ; $9177
    .byte $05,$20,$68,$E4,$A9,$00,$85,$ED,$85,$EB,$A9,$40,$85,$00,$20,$A4  ; $9187
    .byte $EC,$20,$D3,$E4,$AD,$F6,$05,$30,$E8,$AD,$CB,$04,$C9,$78,$90,$E1  ; $9197
    .byte $A9,$5F,$85,$DC,$A9,$78,$8D,$CB,$04,$A9,$03,$85,$95,$A2,$08,$A0  ; $91A7
    .byte $01,$20,$28,$CB,$41,$A0,$09,$20,$22,$E5,$A4,$95,$B9,$53,$EF,$9D  ; $91B7
    .byte $86,$04,$B9,$57,$EF,$9D,$CB,$04,$A9,$00,$9D,$DF,$05,$9D,$B1,$05  ; $91C7
    .byte $9D,$9D,$04,$9D,$E2,$04,$B9,$44,$92,$9D,$C8,$05,$B9,$48,$92,$9D  ; $91D7
    .byte $F6,$05,$E8,$C6,$95,$10,$C8,$A9,$DC,$8D,$B1,$05,$CE,$B1,$05,$F0  ; $91E7
    .byte $06,$20,$68,$E4,$4C,$F3,$91,$A9,$F0,$85,$DC,$20,$F1,$D6,$20,$68  ; $91F7
    .byte $E4,$A9,$00,$85,$ED,$85,$EB,$AA,$A9,$40,$85,$00,$20,$A4,$EC,$20  ; $9207
    .byte $D1,$E4,$A9,$00,$85,$11,$A9,$07,$85,$00,$A9,$0C,$85,$01,$20,$CD  ; $9217
    .byte $D9,$A5,$11,$D0,$0B,$A9,$F9,$85,$00,$20,$CD,$D9,$A5,$11,$F0,$CE  ; $9227
    .byte $20,$6D,$DB,$20,$B9,$DF,$A9,$01,$85,$F0,$4C,$56,$E4,$FC,$04,$00  ; $9237
    .byte $00,$00,$00,$04,$FC  ; $9247

loc_38_924C:
    RTS                          ; $924C  60


sub_38_924D:
    LDA $42                      ; $924D  A5 42
    AND #$10                     ; $924F  29 10
    BEQ loc_38_924C              ; $9251  F0 F9
    LDA #$34                     ; $9253  A9 34
    STA $DC                      ; $9255  85 DC
    JSR sub_3E_DEBD              ; $9257  20 BD DE
    JSR sub_3E_CA3D              ; $925A  20 3D CA
    JSR sub_38_96D0              ; $925D  20 D0 96
    JSR sub_3F_E1DD              ; $9260  20 DD E1
    LDA $06A0                    ; $9263  AD A0 06
    PHA                          ; $9266  48
    LDA $F4                      ; $9267  A5 F4
    PHA                          ; $9269  48
    LDA $FB                      ; $926A  A5 FB
    PHA                          ; $926C  48
    LDA $0672                    ; $926D  AD 72 06
    PHA                          ; $9270  48
    LDA $069C                    ; $9271  AD 9C 06
    PHA                          ; $9274  48
    LDA $069D                    ; $9275  AD 9D 06
    PHA                          ; $9278  48
    LDA $F1                      ; $9279  A5 F1
    PHA                          ; $927B  48
    LDA $FA                      ; $927C  A5 FA
    PHA                          ; $927E  48
    LDA $F8                      ; $927F  A5 F8
    PHA                          ; $9281  48
    LDA #$00                     ; $9282  A9 00
    STA $06A0                    ; $9284  8D A0 06
    STA $F1                      ; $9287  85 F1
    STA $F4                      ; $9289  85 F4
    STA $F7                      ; $928B  85 F7
    STA $F9                      ; $928D  85 F9
    STA $F8                      ; $928F  85 F8
    STA $FA                      ; $9291  85 FA
    STA $FB                      ; $9293  85 FB
    STA $A000                    ; $9295  8D 00 A0
    STA $069C                    ; $9298  8D 9C 06
    STA $069D                    ; $929B  8D 9D 06
    JSR sub_38_9624              ; $929E  20 24 96
    JSR sub_3E_DEA3              ; $92A1  20 A3 DE
    JSR sub_3E_C9BF              ; $92A4  20 BF C9
    LDA #$21                     ; $92A7  A9 21
    JSR sub_3E_C9EF              ; $92A9  20 EF C9
    LDA #$10                     ; $92AC  A9 10
    JSR sub_3E_CB28              ; $92AE  20 28 CB
    BRK                          ; $92B1  00
    LDA #$04                     ; $92B2  A9 04
    STA $F1                      ; $92B4  85 F1
    LDA #$11                     ; $92B6  A9 11
    JSR sub_3E_CB28              ; $92B8  20 28 CB
    BRK                          ; $92BB  00
    LDA #$00                     ; $92BC  A9 00
    STA $F1                      ; $92BE  85 F1
    LDA #$88                     ; $92C0  A9 88
    JSR sub_3E_CAA4              ; $92C2  20 A4 CA
    LDA #$1E                     ; $92C5  A9 1E
    JSR sub_3E_CAA4              ; $92C7  20 A4 CA
    JSR sub_3E_C62B              ; $92CA  20 2B C6
    JSR sub_38_9A09              ; $92CD  20 09 9A
    JSR sub_38_9A85              ; $92D0  20 85 9A
    LDA #$1B                     ; $92D3  A9 1B
    STA $0688                    ; $92D5  8D 88 06
    LDY #$09                     ; $92D8  A0 09

loc_38_92DA:
    JSR sub_38_99E7              ; $92DA  20 E7 99
    DEY                          ; $92DD  88
    BPL loc_38_92DA              ; $92DE  10 FA
    LDA $0696                    ; $92E0  AD 96 06
    BEQ loc_38_92EB              ; $92E3  F0 06
    LDA #$46                     ; $92E5  A9 46
    JSR sub_3E_CB28              ; $92E7  20 28 CB
    BRK                          ; $92EA  00

loc_38_92EB:
    LDA $0691                    ; $92EB  AD 91 06
    CMP #$80                     ; $92EE  C9 80
    BNE loc_38_931D              ; $92F0  D0 2B
    LDX #$04                     ; $92F2  A2 04

loc_38_92F4:
    LDY #$50                     ; $92F4  A0 50
    JSR sub_3E_CB28              ; $92F6  20 28 CB
    EOR ($BD,X)                  ; $92F9  41 BD
    NOP $A893,X                  ; $92FB  7C 93 A8
    LDA $0692,Y                  ; $92FE  B9 92 06
    LDY #$B5                     ; $9301  A0 B5
    AND #$04                     ; $9303  29 04
    BEQ loc_38_930C              ; $9305  F0 05
    TXA                          ; $9307  8A
    CLC                          ; $9308  18
    ADC #$B0                     ; $9309  69 B0
    TAY                          ; $930B  A8

loc_38_930C:
    JSR sub_3F_E522              ; $930C  20 22 E5
    LDA $9381,X                  ; $930F  BD 81 93
    STA $0486,X                  ; $9312  9D 86 04
    LDA #$97                     ; $9315  A9 97
    STA $04CB,X                  ; $9317  9D CB 04
    DEX                          ; $931A  CA
    BNE loc_38_92F4              ; $931B  D0 D7

loc_38_931D:
    LDA #$00                     ; $931D  A9 00
    STA $0624                    ; $931F  8D 24 06
    LDA #$FF                     ; $9322  A9 FF
    STA $0625                    ; $9324  8D 25 06
    STA $0626                    ; $9327  8D 26 06
    LDA $0695                    ; $932A  AD 95 06
    AND #$01                     ; $932D  29 01
    BEQ loc_38_933A              ; $932F  F0 09
    INC $0625                    ; $9331  EE 25 06
    LDA #$89                     ; $9334  A9 89
    JSR sub_3E_CB28              ; $9336  20 28 CB
    BRK                          ; $9339  00

loc_38_933A:
    LDA $0694                    ; $933A  AD 94 06
    AND #$01                     ; $933D  29 01
    BEQ loc_38_934A              ; $933F  F0 09
    INC $0626                    ; $9341  EE 26 06
    LDA #$8A                     ; $9344  A9 8A
    JSR sub_3E_CB28              ; $9346  20 28 CB
    BRK                          ; $9349  00

loc_38_934A:
    LDX #$07                     ; $934A  A2 07
    LDY #$01                     ; $934C  A0 01
    JSR sub_3E_CB28              ; $934E  20 28 CB
    EOR ($A0,X)                  ; $9351  41 A0
    ASL $20                      ; $9353  06 20
    LAX $E4                      ; $9355  A7 E4
    LDY #$9C                     ; $9357  A0 9C
    JSR sub_3F_E522              ; $9359  20 22 E5
    LDA $9B                      ; $935C  A5 9B
    STA $04                      ; $935E  85 04
    JSR sub_3F_E1DD              ; $9360  20 DD E1
    JSR sub_3E_CA89              ; $9363  20 89 CA
    LDY $06A4                    ; $9366  AC A4 06
    LDA $9376,Y                  ; $9369  B9 76 93
    STA $08                      ; $936C  85 08
    LDA $9379,Y                  ; $936E  B9 79 93
    STA $09                      ; $9371  85 09
    JMP ($0008)                  ; $9373  6C 08 00

    .byte $86,$39,$FC,$93,$94,$94,$00,$00,$01,$03,$02,$00,$98,$A8,$B8,$C8  ; $9376

loc_38_9386:
    JSR sub_38_9639              ; $9386  20 39 96
    LDA #$00                     ; $9389  A9 00
    STA $0699                    ; $938B  8D 99 06
    STA $06A4                    ; $938E  8D A4 06

loc_38_9391:
    JSR sub_3F_E1DD              ; $9391  20 DD E1
    JSR sub_3E_C62B              ; $9394  20 2B C6
    LDA $42                      ; $9397  A5 42
    BEQ loc_38_9391              ; $9399  F0 F6
    BIT $FF59                    ; $939B  2C 59 FF
    BNE loc_38_9391              ; $939E  D0 F1
    LDA #$32                     ; $93A0  A9 32
    STA $DC                      ; $93A2  85 DC

loc_38_93A4:
    LDA $42                      ; $93A4  A5 42
    LDA $42                      ; $93A6  A5 42
    BIT $FF5D                    ; $93A8  2C 5D FF
    BEQ loc_38_93B5              ; $93AB  F0 08
    LDA #$00                     ; $93AD  A9 00
    STA $06A3                    ; $93AF  8D A3 06
    JMP loc_38_9439              ; $93B2  4C 39 94


loc_38_93B5:
    BIT $FF5C                    ; $93B5  2C 5C FF
    BEQ loc_38_93BD              ; $93B8  F0 03
    JMP loc_38_94FC              ; $93BA  4C FC 94


loc_38_93BD:
    AND #$03                     ; $93BD  29 03
    BEQ loc_38_93E5              ; $93BF  F0 24
    TAY                          ; $93C1  A8
    LDA $94                      ; $93C2  A5 94
    CMP #$03                     ; $93C4  C9 03
    BNE loc_38_93CE              ; $93C6  D0 06
    LDA #$38                     ; $93C8  A9 38
    STA $DC                      ; $93CA  85 DC
    BNE loc_38_9391              ; $93CC  D0 C3

loc_38_93CE:
    LDA $9B                      ; $93CE  A5 9B
    CLC                          ; $93D0  18
    ADC $F22A,Y                  ; $93D1  79 2A F2
    AND #$07                     ; $93D4  29 07
    TAY                          ; $93D6  A8
    LDA $F222,Y                  ; $93D7  B9 22 F2
    STA $9B                      ; $93DA  85 9B
    TAY                          ; $93DC  A8
    LDA $0624,Y                  ; $93DD  B9 24 06
    BMI loc_38_93A4              ; $93E0  30 C2
    JSR sub_38_9639              ; $93E2  20 39 96

loc_38_93E5:
    LDA $42                      ; $93E5  A5 42
    AND #$90                     ; $93E7  29 90
    BEQ loc_38_9391              ; $93E9  F0 A6
    LDA $9B                      ; $93EB  A5 9B
    CMP $04                      ; $93ED  C5 04
    BNE loc_38_93F4              ; $93EF  D0 03
    JMP loc_38_958A              ; $93F1  4C 8A 95


loc_38_93F4:
    JSR sub_38_9617              ; $93F4  20 17 96
    LDA $9B                      ; $93F7  A5 9B
    BNE loc_38_93FE              ; $93F9  D0 03
    JMP loc_38_958A              ; $93FB  4C 8A 95


loc_38_93FE:
    LDA #$00                     ; $93FE  A9 00
    STA $0699                    ; $9400  8D 99 06
    LDA #$33                     ; $9403  A9 33
    STA $DC                      ; $9405  85 DC
    JSR sub_38_965F              ; $9407  20 5F 96
    LDA $40                      ; $940A  A5 40
    AND #$90                     ; $940C  29 90
    BEQ loc_38_9413              ; $940E  F0 03
    JMP loc_38_958E              ; $9410  4C 8E 95


loc_38_9413:
    LDA $04                      ; $9413  A5 04
    BEQ loc_38_9428              ; $9415  F0 11
    LDY $9B                      ; $9417  A4 9B
    DEY                          ; $9419  88
    BEQ loc_38_9422              ; $941A  F0 06
    JSR sub_38_997B              ; $941C  20 7B 99
    JMP loc_38_958E              ; $941F  4C 8E 95


loc_38_9422:
    JSR sub_38_98FF              ; $9422  20 FF 98
    JMP loc_38_958E              ; $9425  4C 8E 95


loc_38_9428:
    LDY $9B                      ; $9428  A4 9B
    DEY                          ; $942A  88
    BEQ loc_38_9433              ; $942B  F0 06
    JSR sub_38_977A              ; $942D  20 7A 97
    JMP loc_38_958E              ; $9430  4C 8E 95


loc_38_9433:
    JSR sub_38_9866              ; $9433  20 66 98
    JMP loc_38_958E              ; $9436  4C 8E 95


loc_38_9439:
    JSR sub_38_9657              ; $9439  20 57 96
    LDA #$01                     ; $943C  A9 01
    STA $06A4                    ; $943E  8D A4 06

loc_38_9441:
    LDY $06A2                    ; $9441  AC A2 06
    LDA $94F8,Y                  ; $9444  B9 F8 94
    CLC                          ; $9447  18
    ADC $06A3                    ; $9448  6D A3 06
    STA $0699                    ; $944B  8D 99 06
    TAY                          ; $944E  A8
    LDA $0688,Y                  ; $944F  B9 88 06
    CMP #$80                     ; $9452  C9 80
    BEQ loc_38_9477              ; $9454  F0 21
    TYA                          ; $9456  98
    PHA                          ; $9457  48
    LDA #$2A                     ; $9458  A9 2A
    JSR sub_3E_CB28              ; $945A  20 28 CB
    BRK                          ; $945D  00
    PLA                          ; $945E  68
    ADC #$20                     ; $945F  69 20
    JSR sub_3E_CB28              ; $9461  20 28 CB
    BRK                          ; $9464  00

loc_38_9465:
    JSR sub_3E_C62B              ; $9465  20 2B C6
    LDA $42                      ; $9468  A5 42
    BEQ loc_38_9465              ; $946A  F0 F9
    BIT $FF59                    ; $946C  2C 59 FF
    BNE loc_38_9465              ; $946F  D0 F4
    STA $05                      ; $9471  85 05
    LDA #$32                     ; $9473  A9 32
    STA $DC                      ; $9475  85 DC

loc_38_9477:
    LDA $42                      ; $9477  A5 42
    AND #$90                     ; $9479  29 90
    BEQ loc_38_9492              ; $947B  F0 15
    JSR sub_38_9617              ; $947D  20 17 96
    LDA $06A2                    ; $9480  AD A2 06
    ORA $06A3                    ; $9483  0D A3 06
    BNE loc_38_948B              ; $9486  D0 03
    STA $06A4                    ; $9488  8D A4 06

loc_38_948B:
    LDA #$00                     ; $948B  A9 00
    STA $9B                      ; $948D  85 9B
    JMP loc_38_958A              ; $948F  4C 8A 95


loc_38_9492:
    LDA $42                      ; $9492  A5 42
    AND #$0F                     ; $9494  29 0F
    BEQ loc_38_9465              ; $9496  F0 CD
    AND #$0C                     ; $9498  29 0C
    LSR A                        ; $949A  4A
    LSR A                        ; $949B  4A
    TAY                          ; $949C  A8
    LDA $F22A,Y                  ; $949D  B9 2A F2
    CLC                          ; $94A0  18
    ADC $06A3                    ; $94A1  6D A3 06
    AND #$07                     ; $94A4  29 07
    TAY                          ; $94A6  A8
    LDA $94F0,Y                  ; $94A7  B9 F0 94
    CMP #$05                     ; $94AA  C9 05
    BNE loc_38_94C1              ; $94AC  D0 13
    LDA #$04                     ; $94AE  A9 04
    STA $42                      ; $94B0  85 42
    LDA $05                      ; $94B2  A5 05
    AND #$08                     ; $94B4  29 08
    BEQ loc_38_94C1              ; $94B6  F0 09
    LDA #$2A                     ; $94B8  A9 2A
    JSR sub_3E_CB28              ; $94BA  20 28 CB
    BRK                          ; $94BD  00
    .byte $4C,$86,$93  ; $94BE

loc_38_94C1:
    CMP #$06                     ; $94C1  C9 06
    BNE loc_38_94D8              ; $94C3  D0 13
    LDA #$01                     ; $94C5  A9 01
    STA $42                      ; $94C7  85 42
    LDA $05                      ; $94C9  A5 05
    AND #$04                     ; $94CB  29 04
    BEQ loc_38_94D8              ; $94CD  F0 09
    LDA #$2A                     ; $94CF  A9 2A
    JSR sub_3E_CB28              ; $94D1  20 28 CB
    BRK                          ; $94D4  00
    .byte $4C,$FC,$94  ; $94D5

loc_38_94D8:
    STA $06A3                    ; $94D8  8D A3 06
    LDA $42                      ; $94DB  A5 42
    AND #$03                     ; $94DD  29 03
    BEQ loc_38_94ED              ; $94DF  F0 0C
    LDA #$08                     ; $94E1  A9 08
    STA $42                      ; $94E3  85 42
    LDA $06A2                    ; $94E5  AD A2 06
    EOR #$01                     ; $94E8  49 01
    STA $06A2                    ; $94EA  8D A2 06

loc_38_94ED:
    JMP loc_38_9441              ; $94ED  4C 41 94

    .byte $00,$01,$02,$03,$04,$06,$00,$05,$00,$05,$00,$05  ; $94F0

loc_38_94FC:
    JSR sub_38_9657              ; $94FC  20 57 96
    LDA #$00                     ; $94FF  A9 00
    STA $0699                    ; $9501  8D 99 06
    LDA #$02                     ; $9504  A9 02
    STA $06A4                    ; $9506  8D A4 06

loc_38_9509:
    LDA #$2B                     ; $9509  A9 2B
    JSR sub_3E_CB28              ; $950B  20 28 CB
    BRK                          ; $950E  00

loc_38_950F:
    JSR sub_3E_C62B              ; $950F  20 2B C6
    LDA $42                      ; $9512  A5 42
    BEQ loc_38_950F              ; $9514  F0 F9
    BIT $FF59                    ; $9516  2C 59 FF
    BNE loc_38_950F              ; $9519  D0 F4
    LDA #$2C                     ; $951B  A9 2C
    JSR sub_3E_CB28              ; $951D  20 28 CB
    BRK                          ; $9520  00
    LDA $42                      ; $9521  A5 42
    AND #$80                     ; $9523  29 80
    BEQ loc_38_9563              ; $9525  F0 3C
    LDA #$38                     ; $9527  A9 38
    STA $DC                      ; $9529  85 DC
    LDA $06A1                    ; $952B  AD A1 06
    BEQ loc_38_9509              ; $952E  F0 D9
    LDA $03E5                    ; $9530  AD E5 03
    CMP #$1B                     ; $9533  C9 1B
    BEQ loc_38_9509              ; $9535  F0 D2
    DEC $06A1                    ; $9537  CE A1 06
    JSR sub_38_9A85              ; $953A  20 85 9A

loc_38_953D:
    LDA $03E5                    ; $953D  AD E5 03
    CMP #$1B                     ; $9540  C9 1B
    BEQ loc_38_956F              ; $9542  F0 2B
    INC $03E5                    ; $9544  EE E5 03
    LDA $03E5                    ; $9547  AD E5 03
    STA $01                      ; $954A  85 01
    LDA #$20                     ; $954C  A9 20
    STA $09                      ; $954E  85 09
    LDA #$D5                     ; $9550  A9 D5
    STA $08                      ; $9552  85 08
    JSR sub_38_9A2A              ; $9554  20 2A 9A
    LDA #$31                     ; $9557  A9 31
    STA $DC                      ; $9559  85 DC
    LDA #$04                     ; $955B  A9 04
    JSR sub_3E_C5F6              ; $955D  20 F6 C5
    JMP loc_38_953D              ; $9560  4C 3D 95


loc_38_9563:
    LDA $42                      ; $9563  A5 42
    BIT $FF5C                    ; $9565  2C 5C FF
    BNE loc_38_9576              ; $9568  D0 0C
    BIT $FF5D                    ; $956A  2C 5D FF
    BEQ loc_38_9509              ; $956D  F0 9A

loc_38_956F:
    LDA #$32                     ; $956F  A9 32
    STA $DC                      ; $9571  85 DC
    JMP loc_38_9386              ; $9573  4C 86 93


loc_38_9576:
    LDA #$32                     ; $9576  A9 32
    STA $DC                      ; $9578  85 DC
    LDA $9B                      ; $957A  A5 9B
    BNE loc_38_956F              ; $957C  D0 F1
    LDA #$04                     ; $957E  A9 04
    STA $06A3                    ; $9580  8D A3 06
    LDA #$08                     ; $9583  A9 08
    STA $42                      ; $9585  85 42
    JMP loc_38_9439              ; $9587  4C 39 94


loc_38_958A:
    LDA #$33                     ; $958A  A9 33
    STA $DC                      ; $958C  85 DC

loc_38_958E:
    JSR sub_3E_CA3D              ; $958E  20 3D CA
    JSR sub_3E_C9BF              ; $9591  20 BF C9
    JSR sub_38_9624              ; $9594  20 24 96
    STA $F8                      ; $9597  85 F8
    JSR sub_3F_E1DD              ; $9599  20 DD E1
    JSR sub_3E_DEAF              ; $959C  20 AF DE
    JSR sub_3E_DC66              ; $959F  20 66 DC
    PLA                          ; $95A2  68
    STA $F8                      ; $95A3  85 F8
    PLA                          ; $95A5  68
    STA $FA                      ; $95A6  85 FA
    PLA                          ; $95A8  68
    STA $F1                      ; $95A9  85 F1
    PLA                          ; $95AB  68
    STA $069D                    ; $95AC  8D 9D 06
    PLA                          ; $95AF  68
    STA $069C                    ; $95B0  8D 9C 06
    PLA                          ; $95B3  68
    STA $0672                    ; $95B4  8D 72 06
    PLA                          ; $95B7  68
    STA $FB                      ; $95B8  85 FB
    STA $A000                    ; $95BA  8D 00 A0
    PLA                          ; $95BD  68
    STA $F4                      ; $95BE  85 F4
    JSR sub_38_96DE              ; $95C0  20 DE 96
    LDA $0682                    ; $95C3  AD 82 06
    BEQ loc_38_95CC              ; $95C6  F0 04
    JSR sub_3E_CB28              ; $95C8  20 28 CB
    BRK                          ; $95CB  00

loc_38_95CC:
    LDX $9B                      ; $95CC  A6 9B
    LDA $9614,X                  ; $95CE  BD 14 96
    STA $06AB                    ; $95D1  8D AB 06
    LDA $96C7,X                  ; $95D4  BD C7 96
    JSR sub_3E_CAA4              ; $95D7  20 A4 CA
    LDA $96CA,X                  ; $95DA  BD CA 96
    STA $AE                      ; $95DD  85 AE
    JSR sub_3E_C9EF              ; $95DF  20 EF C9
    LDX $0699                    ; $95E2  AE 99 06
    BEQ loc_38_95F8              ; $95E5  F0 11
    JSR sub_38_9617              ; $95E7  20 17 96
    LDA $F708,X                  ; $95EA  BD 08 F7
    JSR sub_3E_CAA4              ; $95ED  20 A4 CA
    LDA $962F,X                  ; $95F0  BD 2F 96
    STA $AE                      ; $95F3  85 AE
    JSR sub_3E_C9EF              ; $95F5  20 EF C9

loc_38_95F8:
    LDA #$00                     ; $95F8  A9 00
    STA $03A1                    ; $95FA  8D A1 03
    PLA                          ; $95FD  68
    STA $06A0                    ; $95FE  8D A0 06
    LDA $94                      ; $9601  A5 94
    LDX #$00                     ; $9603  A2 00
    JSR sub_3F_E0FD              ; $9605  20 FD E0
    JSR sub_3F_E1DD              ; $9608  20 DD E1
    JSR sub_3E_CF4A              ; $960B  20 4A CF
    JSR sub_3E_CA89              ; $960E  20 89 CA
    JMP loc_3E_DF11              ; $9611  4C 11 DF

    .byte $5A,$3C,$3C  ; $9614

sub_38_9617:
    LDA #$FF                     ; $9617  A9 FF
    STA $A5                      ; $9619  85 A5
    LDA #$00                     ; $961B  A9 00
    STA $9E                      ; $961D  85 9E
    LDY #$01                     ; $961F  A0 01
    JMP sub_3E_C5F0              ; $9621  4C F0 C5


sub_38_9624:
    LDX #$07                     ; $9624  A2 07
    LDA #$00                     ; $9626  A9 00

loc_38_9628:
    STA $03A0,X                  ; $9628  9D A0 03
    DEX                          ; $962B  CA
    BNE loc_38_9628              ; $962C  D0 FA
    RTS                          ; $962E  60

    .byte $09,$B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$09  ; $962F

sub_38_9639:
    LDX #$06                     ; $9639  A2 06
    LDY #$01                     ; $963B  A0 01
    JSR sub_3E_CB28              ; $963D  20 28 CB
    EOR ($A9,X)                  ; $9640  41 A9
    ANC #$8D                     ; $9642  2B 8D
    CMP ($04),Y                  ; $9644  D1 04
    LDY $9B                      ; $9646  A4 9B
    LDA $96CD,Y                  ; $9648  B9 CD 96
    STA $048C                    ; $964B  8D 8C 04
    LDA #$9F                     ; $964E  A9 9F
    CLC                          ; $9650  18
    ADC $9B                      ; $9651  65 9B
    TAY                          ; $9653  A8
    JMP sub_3F_E522              ; $9654  4C 22 E5


sub_38_9657:
    LDA #$00                     ; $9657  A9 00
    STA $03A6                    ; $9659  8D A6 03
    JMP sub_3F_E1DD              ; $965C  4C DD E1


sub_38_965F:
    LDA #$00                     ; $965F  A9 00
    LDY #$04                     ; $9661  A0 04

loc_38_9663:
    STA $03A0,Y                  ; $9663  99 A0 03
    DEY                          ; $9666  88
    BNE loc_38_9663              ; $9667  D0 FA
    LDA $0677                    ; $9669  AD 77 06
    PHA                          ; $966C  48
    LDA #$04                     ; $966D  A9 04
    STA $0677                    ; $966F  8D 77 06
    LDA #$42                     ; $9672  A9 42
    STA $0672                    ; $9674  8D 72 06
    LDA #$01                     ; $9677  A9 01
    STA $F4                      ; $9679  85 F4

loc_38_967B:
    JSR sub_3E_C62B              ; $967B  20 2B C6
    LDY #$07                     ; $967E  A0 07

loc_38_9680:
    LDA $03B7,Y                  ; $9680  B9 B7 03
    AND #$FE                     ; $9683  29 FE
    STA $03B7,Y                  ; $9685  99 B7 03
    LDA $F7                      ; $9688  A5 F7
    SEC                          ; $968A  38
    SBC $0486,Y                  ; $968B  F9 86 04
    ROL A                        ; $968E  2A
    AND #$01                     ; $968F  29 01
    ORA $03B7,Y                  ; $9691  19 B7 03
    STA $03B7,Y                  ; $9694  99 B7 03
    DEY                          ; $9697  88
    BNE loc_38_9680              ; $9698  D0 E6

loc_38_969A:
    LDA $0676                    ; $969A  AD 76 06
    CMP #$06                     ; $969D  C9 06
    BNE loc_38_969A              ; $969F  D0 F9
    LDA $F7                      ; $96A1  A5 F7
    CLC                          ; $96A3  18
    ADC #$08                     ; $96A4  69 08
    STA $F7                      ; $96A6  85 F7
    JSR sub_3F_E1DD              ; $96A8  20 DD E1
    LDA $F7                      ; $96AB  A5 F7
    CMP #$F8                     ; $96AD  C9 F8
    BNE loc_38_967B              ; $96AF  D0 CA
    LDA #$00                     ; $96B1  A9 00
    STA $F4                      ; $96B3  85 F4
    JSR sub_3E_C62B              ; $96B5  20 2B C6
    LDA $F8                      ; $96B8  A5 F8
    EOR #$01                     ; $96BA  49 01
    STA $F8                      ; $96BC  85 F8
    LDA #$00                     ; $96BE  A9 00
    STA $F7                      ; $96C0  85 F7
    PLA                          ; $96C2  68
    STA $0677                    ; $96C3  8D 77 06
    RTS                          ; $96C6  60

    .byte $00,$02,$03,$09,$0A,$0A,$2C,$54,$7C  ; $96C7

sub_38_96D0:
    LDX #$16                     ; $96D0  A2 16

loc_38_96D2:
    LDA $03B7,X                  ; $96D2  BD B7 03
    ORA #$02                     ; $96D5  09 02
    STA $03B7,X                  ; $96D7  9D B7 03
    DEX                          ; $96DA  CA
    BPL loc_38_96D2              ; $96DB  10 F5
    RTS                          ; $96DD  60


sub_38_96DE:
    LDX #$16                     ; $96DE  A2 16

loc_38_96E0:
    LDA $03B7,X                  ; $96E0  BD B7 03
    AND #$FD                     ; $96E3  29 FD
    STA $03B7,X                  ; $96E5  9D B7 03
    DEX                          ; $96E8  CA
    BPL loc_38_96E0              ; $96E9  10 F5
    RTS                          ; $96EB  60


sub_38_96EC:
    LDA #$00                     ; $96EC  A9 00
    STA $05DF,X                  ; $96EE  9D DF 05
    LDA #$04                     ; $96F1  A9 04
    STA $05F6,X                  ; $96F3  9D F6 05

loc_38_96F6:
    JSR sub_3E_C62B              ; $96F6  20 2B C6
    JSR sub_3F_E1DD              ; $96F9  20 DD E1
    LDA #$08                     ; $96FC  A9 08
    STA $0555,X                  ; $96FE  9D 55 05
    LDA $05DF,X                  ; $9701  BD DF 05
    STA $EC                      ; $9704  85 EC
    CLC                          ; $9706  18
    ADC #$40                     ; $9707  69 40
    STA $05DF,X                  ; $9709  9D DF 05
    LDA $05F6,X                  ; $970C  BD F6 05
    ADC #$00                     ; $970F  69 00
    CMP #$09                     ; $9711  C9 09
    BCC loc_38_9717              ; $9713  90 02
    LDA #$08                     ; $9715  A9 08

loc_38_9717:
    STA $05F6,X                  ; $9717  9D F6 05
    STA $EE                      ; $971A  85 EE
    LDA #$00                     ; $971C  A9 00
    STA $ED                      ; $971E  85 ED
    STA $EB                      ; $9720  85 EB
    JSR sub_3F_E4D3              ; $9722  20 D3 E4
    LDA $04CB,X                  ; $9725  BD CB 04
    CMP #$88                     ; $9728  C9 88
    BCC loc_38_96F6              ; $972A  90 CA
    LDA #$88                     ; $972C  A9 88
    STA $04CB,X                  ; $972E  9D CB 04
    LDA #$37                     ; $9731  A9 37
    STA $DC                      ; $9733  85 DC
    LDA #$02                     ; $9735  A9 02
    STA $0555,X                  ; $9737  9D 55 05
    LDA #$08                     ; $973A  A9 08
    STA $05B1,X                  ; $973C  9D B1 05

loc_38_973F:
    JSR sub_3E_C62B              ; $973F  20 2B C6
    JSR sub_3F_E1DD              ; $9742  20 DD E1
    DEC $05B1,X                  ; $9745  DE B1 05
    BNE loc_38_973F              ; $9748  D0 F5
    RTS                          ; $974A  60


sub_38_974B:
    LDY #$0D                     ; $974B  A0 0D
    LDX #$06                     ; $974D  A2 06
    JSR sub_3E_CB28              ; $974F  20 28 CB
    EOR ($A0,X)                  ; $9752  41 A0
    SLO $20                      ; $9754  07 20
    LAX $E4                      ; $9756  A7 E4
    LDY $04                      ; $9758  A4 04
    LDA $9761,Y                  ; $975A  B9 61 97
    TAY                          ; $975D  A8
    JMP sub_3F_E522              ; $975E  4C 22 E5

    .byte $C1,$1B,$29  ; $9761

sub_38_9764:
    STA $05B7                    ; $9764  8D B7 05

loc_38_9767:
    LDA $40                      ; $9767  A5 40
    BNE loc_38_9777              ; $9769  D0 0C
    JSR sub_3F_E1DD              ; $976B  20 DD E1
    JSR sub_3E_C62B              ; $976E  20 2B C6
    DEC $05B7                    ; $9771  CE B7 05
    BNE loc_38_9767              ; $9774  D0 F1
    RTS                          ; $9776  60


loc_38_9777:
    PLA                          ; $9777  68
    PLA                          ; $9778  68
    RTS                          ; $9779  60


sub_38_977A:
    LDA #$05                     ; $977A  A9 05
    JSR sub_3E_CAA4              ; $977C  20 A4 CA
    LDA #$19                     ; $977F  A9 19
    JSR sub_3E_C9EF              ; $9781  20 EF C9
    LDA #$1E                     ; $9784  A9 1E
    JSR sub_3E_C5F6              ; $9786  20 F6 C5
    JSR sub_38_974B              ; $9789  20 4B 97
    LDY #$0D                     ; $978C  A0 0D
    LDX #$07                     ; $978E  A2 07
    JSR sub_3E_CB28              ; $9790  20 28 CB
    EOR ($A0,X)                  ; $9793  41 A0
    NOP $20                      ; $9795  04 20
    LAX $E4                      ; $9797  A7 E4
    LDY #$3F                     ; $9799  A0 3F
    JSR sub_3F_E522              ; $979B  20 22 E5
    JSR sub_38_96EC              ; $979E  20 EC 96
    LDY #$3D                     ; $97A1  A0 3D
    JSR sub_3F_E522              ; $97A3  20 22 E5
    LDX #$06                     ; $97A6  A2 06
    LDY #$3C                     ; $97A8  A0 3C
    JSR sub_3F_E522              ; $97AA  20 22 E5
    LDA #$4A                     ; $97AD  A9 4A
    JSR sub_38_9764              ; $97AF  20 64 97
    LDA #$0E                     ; $97B2  A9 0E
    STA $05B8                    ; $97B4  8D B8 05

loc_38_97B7:
    JSR sub_3F_E1DD              ; $97B7  20 DD E1
    JSR sub_3E_C62B              ; $97BA  20 2B C6
    LDA $048D                    ; $97BD  AD 8D 04
    CLC                          ; $97C0  18
    ADC #$04                     ; $97C1  69 04
    STA $048D                    ; $97C3  8D 8D 04
    DEC $05B8                    ; $97C6  CE B8 05
    BNE loc_38_97B7              ; $97C9  D0 EC

loc_38_97CB:
    LDA #$00                     ; $97CB  A9 00
    STA $03A7                    ; $97CD  8D A7 03
    LDA #$2A                     ; $97D0  A9 2A
    STA $DC                      ; $97D2  85 DC
    LDA #$70                     ; $97D4  A9 70
    STA $05B7                    ; $97D6  8D B7 05

loc_38_97D9:
    LDA $05B7                    ; $97D9  AD B7 05
    CMP #$30                     ; $97DC  C9 30
    BNE loc_38_97E4              ; $97DE  D0 04
    LDA #$2B                     ; $97E0  A9 2B
    STA $DC                      ; $97E2  85 DC

loc_38_97E4:
    JSR sub_3F_E1DD              ; $97E4  20 DD E1
    JSR sub_3E_C62B              ; $97E7  20 2B C6
    DEC $05B7                    ; $97EA  CE B7 05
    BNE loc_38_97D9              ; $97ED  D0 EA
    LDA #$00                     ; $97EF  A9 00
    STA $08                      ; $97F1  85 08
    LDA #$98                     ; $97F3  A9 98
    STA $09                      ; $97F5  85 09
    JSR sub_38_9820              ; $97F7  20 20 98
    LDA #$3C                     ; $97FA  A9 3C
    JSR sub_3E_C5F6              ; $97FC  20 F6 C5
    RTS                          ; $97FF  60

    .byte $09,$27,$80,$82,$84,$86,$88,$9E,$9E,$90,$92,$94,$96,$98,$9A,$9C  ; $9800
    .byte $00,$0A,$27,$8A,$8C,$8E,$9E,$9E,$90,$92,$94,$96,$98,$9A,$9C,$00  ; $9810

sub_38_9820:
    LDY #$00                     ; $9820  A0 00
    LDA ($08),Y                  ; $9822  B1 08
    STA $0A                      ; $9824  85 0A
    INY                          ; $9826  C8
    LDA ($08),Y                  ; $9827  B1 08
    STA $0B                      ; $9829  85 0B
    INY                          ; $982B  C8

loc_38_982C:
    LDA $40                      ; $982C  A5 40
    BNE loc_38_9863              ; $982E  D0 33
    LDA #$08                     ; $9830  A9 08
    JSR sub_3E_C5F6              ; $9832  20 F6 C5
    LDA #$27                     ; $9835  A9 27
    STA $DC                      ; $9837  85 DC
    LDX $47                      ; $9839  A6 47
    LDA ($08),Y                  ; $983B  B1 08
    BEQ loc_38_9862              ; $983D  F0 23
    STA $0783,X                  ; $983F  9D 83 07
    CLC                          ; $9842  18
    ADC #$01                     ; $9843  69 01
    STA $0784,X                  ; $9845  9D 84 07
    LDA #$82                     ; $9848  A9 82
    STA $0780,X                  ; $984A  9D 80 07
    LDA $0B                      ; $984D  A5 0B
    STA $0781,X                  ; $984F  9D 81 07
    LDA $0A                      ; $9852  A5 0A
    STA $0782,X                  ; $9854  9D 82 07
    INC $0A                      ; $9857  E6 0A
    INY                          ; $9859  C8
    TXA                          ; $985A  8A
    CLC                          ; $985B  18
    ADC #$05                     ; $985C  69 05
    STA $47                      ; $985E  85 47
    BNE loc_38_982C              ; $9860  D0 CA

loc_38_9862:
    RTS                          ; $9862  60


loc_38_9863:
    PLA                          ; $9863  68
    PLA                          ; $9864  68
    RTS                          ; $9865  60


sub_38_9866:
    LDA #$04                     ; $9866  A9 04
    JSR sub_3E_CAA4              ; $9868  20 A4 CA
    LDA #$19                     ; $986B  A9 19
    JSR sub_3E_C9EF              ; $986D  20 EF C9
    LDA #$1E                     ; $9870  A9 1E
    JSR sub_3E_C5F6              ; $9872  20 F6 C5
    JSR sub_38_974B              ; $9875  20 4B 97
    LDY #$0D                     ; $9878  A0 0D
    LDX #$07                     ; $987A  A2 07
    JSR sub_3E_CB28              ; $987C  20 28 CB
    EOR ($A0,X)                  ; $987F  41 A0
    NOP $20                      ; $9881  04 20
    LAX $E4                      ; $9883  A7 E4
    LDY #$3A                     ; $9885  A0 3A
    JSR sub_3F_E522              ; $9887  20 22 E5
    JSR sub_38_96EC              ; $988A  20 EC 96
    LDY #$3B                     ; $988D  A0 3B
    JSR sub_3F_E522              ; $988F  20 22 E5
    LDX #$06                     ; $9892  A2 06
    LDY #$39                     ; $9894  A0 39
    JSR sub_3F_E522              ; $9896  20 22 E5
    LDA #$4A                     ; $9899  A9 4A
    JSR sub_38_9764              ; $989B  20 64 97
    LDA #$0E                     ; $989E  A9 0E
    STA $05B8                    ; $98A0  8D B8 05

loc_38_98A3:
    JSR sub_3F_E1DD              ; $98A3  20 DD E1
    JSR sub_3E_C62B              ; $98A6  20 2B C6
    LDA $048D                    ; $98A9  AD 8D 04
    CLC                          ; $98AC  18
    ADC #$04                     ; $98AD  69 04
    STA $048D                    ; $98AF  8D 8D 04
    DEC $05B8                    ; $98B2  CE B8 05
    BNE loc_38_98A3              ; $98B5  D0 EC
    LDA #$00                     ; $98B7  A9 00
    STA $03A7                    ; $98B9  8D A7 03
    LDA #$2A                     ; $98BC  A9 2A
    STA $DC                      ; $98BE  85 DC
    LDA #$38                     ; $98C0  A9 38
    JSR sub_38_9764              ; $98C2  20 64 97
    LDX #$06                     ; $98C5  A2 06
    LDY #$38                     ; $98C7  A0 38
    JSR sub_3F_E522              ; $98C9  20 22 E5

loc_38_98CC:
    LDA #$2D                     ; $98CC  A9 2D
    STA $DC                      ; $98CE  85 DC
    LDA #$22                     ; $98D0  A9 22
    STA $05B7                    ; $98D2  8D B7 05
    LDA #$0E                     ; $98D5  A9 0E
    STA $03CE,X                  ; $98D7  9D CE 03

loc_38_98DA:
    LDY #$04                     ; $98DA  A0 04
    JSR sub_3F_E60E              ; $98DC  20 0E E6
    JSR sub_3F_E1DD              ; $98DF  20 DD E1
    JSR sub_3E_C62B              ; $98E2  20 2B C6
    DEC $05B7                    ; $98E5  CE B7 05
    BNE loc_38_98DA              ; $98E8  D0 F0
    LDA #$3F                     ; $98EA  A9 3F
    STA $DC                      ; $98EC  85 DC
    LDA #$11                     ; $98EE  A9 11
    STA $08                      ; $98F0  85 08
    LDA #$98                     ; $98F2  A9 98
    STA $09                      ; $98F4  85 09
    JSR sub_38_9820              ; $98F6  20 20 98
    LDA #$3C                     ; $98F9  A9 3C
    JSR sub_3E_C5F6              ; $98FB  20 F6 C5
    RTS                          ; $98FE  60


sub_38_98FF:
    LDA #$07                     ; $98FF  A9 07
    JSR sub_3E_CAA4              ; $9901  20 A4 CA
    LDA #$19                     ; $9904  A9 19
    JSR sub_3E_C9EF              ; $9906  20 EF C9
    LDA #$22                     ; $9909  A9 22
    JSR sub_3E_C5F6              ; $990B  20 F6 C5
    LDY #$0D                     ; $990E  A0 0D
    LDX #$06                     ; $9910  A2 06
    JSR sub_3E_CB28              ; $9912  20 28 CB
    EOR ($A0,X)                  ; $9915  41 A0
    PHP                          ; $9917  08
    JSR sub_3F_E4A7              ; $9918  20 A7 E4
    LDY #$41                     ; $991B  A0 41
    JSR sub_3F_E522              ; $991D  20 22 E5
    LDA #$20                     ; $9920  A9 20
    JSR sub_38_9764              ; $9922  20 64 97
    LDY #$0D                     ; $9925  A0 0D
    LDX #$07                     ; $9927  A2 07
    JSR sub_3E_CB28              ; $9929  20 28 CB
    EOR ($A0,X)                  ; $992C  41 A0
    PHP                          ; $992E  08
    JSR sub_3F_E4A7              ; $992F  20 A7 E4
    LDY #$42                     ; $9932  A0 42
    JSR sub_3F_E522              ; $9934  20 22 E5
    LDA #$10                     ; $9937  A9 10
    STA $05B7                    ; $9939  8D B7 05

loc_38_993C:
    JSR sub_3F_E1DD              ; $993C  20 DD E1
    JSR sub_3E_C62B              ; $993F  20 2B C6
    DEC $04D2                    ; $9942  CE D2 04
    DEC $04D2                    ; $9945  CE D2 04
    DEC $05B7                    ; $9948  CE B7 05
    BNE loc_38_993C              ; $994B  D0 EF
    LDA #$10                     ; $994D  A9 10
    STA $05B7                    ; $994F  8D B7 05

loc_38_9952:
    JSR sub_3F_E1DD              ; $9952  20 DD E1
    JSR sub_3E_C62B              ; $9955  20 2B C6
    INC $04D2                    ; $9958  EE D2 04
    INC $04D2                    ; $995B  EE D2 04
    DEC $05B7                    ; $995E  CE B7 05
    BNE loc_38_9952              ; $9961  D0 EF
    LDA #$2A                     ; $9963  A9 2A
    STA $DC                      ; $9965  85 DC
    LDA #$00                     ; $9967  A9 00
    STA $03A7                    ; $9969  8D A7 03
    LDA #$3C                     ; $996C  A9 3C
    JSR sub_38_9764              ; $996E  20 64 97
    LDX #$06                     ; $9971  A2 06
    LDY #$43                     ; $9973  A0 43
    JSR sub_3F_E522              ; $9975  20 22 E5
    JMP loc_38_98CC              ; $9978  4C CC 98


sub_38_997B:
    LDA #$06                     ; $997B  A9 06
    JSR sub_3E_CAA4              ; $997D  20 A4 CA
    LDA #$19                     ; $9980  A9 19
    JSR sub_3E_C9EF              ; $9982  20 EF C9
    LDA #$22                     ; $9985  A9 22
    JSR sub_3E_C5F6              ; $9987  20 F6 C5
    LDY #$0D                     ; $998A  A0 0D
    LDX #$06                     ; $998C  A2 06
    JSR sub_3E_CB28              ; $998E  20 28 CB
    EOR ($A0,X)                  ; $9991  41 A0
    PHP                          ; $9993  08
    JSR sub_3F_E4A7              ; $9994  20 A7 E4
    LDY #$3E                     ; $9997  A0 3E
    JSR sub_3F_E522              ; $9999  20 22 E5
    LDA #$20                     ; $999C  A9 20
    JSR sub_38_9764              ; $999E  20 64 97
    LDY #$0D                     ; $99A1  A0 0D
    LDX #$07                     ; $99A3  A2 07
    JSR sub_3E_CB28              ; $99A5  20 28 CB
    EOR ($A0,X)                  ; $99A8  41 A0
    PHP                          ; $99AA  08
    JSR sub_3F_E4A7              ; $99AB  20 A7 E4
    LDY #$40                     ; $99AE  A0 40
    JSR sub_3F_E522              ; $99B0  20 22 E5
    LDA #$10                     ; $99B3  A9 10
    STA $05B7                    ; $99B5  8D B7 05

loc_38_99B8:
    JSR sub_3F_E1DD              ; $99B8  20 DD E1
    JSR sub_3E_C62B              ; $99BB  20 2B C6
    DEC $04D2                    ; $99BE  CE D2 04
    DEC $04D2                    ; $99C1  CE D2 04
    DEC $05B7                    ; $99C4  CE B7 05
    BNE loc_38_99B8              ; $99C7  D0 EF
    LDA #$10                     ; $99C9  A9 10
    STA $05B7                    ; $99CB  8D B7 05

loc_38_99CE:
    JSR sub_3F_E1DD              ; $99CE  20 DD E1
    JSR sub_3E_C62B              ; $99D1  20 2B C6
    INC $04D2                    ; $99D4  EE D2 04
    INC $04D2                    ; $99D7  EE D2 04
    DEC $05B7                    ; $99DA  CE B7 05
    BNE loc_38_99CE              ; $99DD  D0 EF
    LDA #$2A                     ; $99DF  A9 2A
    STA $DC                      ; $99E1  85 DC
    JMP loc_38_97CB              ; $99E3  4C CB 97


loc_38_99E6:
    RTS                          ; $99E6  60


sub_38_99E7:
    LDA $0688,Y                  ; $99E7  B9 88 06
    CMP #$80                     ; $99EA  C9 80
    BEQ loc_38_99E6              ; $99EC  F0 F8
    TYA                          ; $99EE  98
    BEQ loc_38_99F8              ; $99EF  F0 07
    CLC                          ; $99F1  18
    ADC #$37                     ; $99F2  69 37
    JSR sub_3E_CB28              ; $99F4  20 28 CB
    BRK                          ; $99F7  00

loc_38_99F8:
    LDA $0688,Y                  ; $99F8  B9 88 06
    STA $01                      ; $99FB  85 01
    LDA $9A7B,Y                  ; $99FD  B9 7B 9A
    STA $09                      ; $9A00  85 09
    LDA $9A71,Y                  ; $9A02  B9 71 9A
    STA $08                      ; $9A05  85 08
    BNE loc_38_9A16              ; $9A07  D0 0D

sub_38_9A09:
    LDA $03E5                    ; $9A09  AD E5 03
    STA $01                      ; $9A0C  85 01
    LDA #$20                     ; $9A0E  A9 20
    STA $09                      ; $9A10  85 09
    LDA #$D5                     ; $9A12  A9 D5
    STA $08                      ; $9A14  85 08

loc_38_9A16:
    TXA                          ; $9A16  8A
    PHA                          ; $9A17  48
    TYA                          ; $9A18  98
    PHA                          ; $9A19  48
    JSR sub_38_9A2A              ; $9A1A  20 2A 9A
    JSR sub_3E_C6D7              ; $9A1D  20 D7 C6
    LDA $FC                      ; $9A20  A5 FC
    STA $2000                    ; $9A22  8D 00 20
    PLA                          ; $9A25  68
    TAY                          ; $9A26  A8
    PLA                          ; $9A27  68
    TAX                          ; $9A28  AA
    RTS                          ; $9A29  60


sub_38_9A2A:
    LDX $47                      ; $9A2A  A6 47
    LDA #$07                     ; $9A2C  A9 07
    STA $0780,X                  ; $9A2E  9D 80 07
    INX                          ; $9A31  E8
    LDA $09                      ; $9A32  A5 09
    STA $0780,X                  ; $9A34  9D 80 07
    INX                          ; $9A37  E8
    LDA $08                      ; $9A38  A5 08
    STA $0780,X                  ; $9A3A  9D 80 07
    INX                          ; $9A3D  E8
    LDA $01                      ; $9A3E  A5 01
    BMI loc_38_9A5B              ; $9A40  30 19
    LSR A                        ; $9A42  4A
    LSR A                        ; $9A43  4A
    BEQ loc_38_9A50              ; $9A44  F0 0A
    TAY                          ; $9A46  A8

loc_38_9A47:
    LDA #$0F                     ; $9A47  A9 0F
    STA $0780,X                  ; $9A49  9D 80 07
    INX                          ; $9A4C  E8
    DEY                          ; $9A4D  88
    BNE loc_38_9A47              ; $9A4E  D0 F7

loc_38_9A50:
    LDA $01                      ; $9A50  A5 01
    AND #$03                     ; $9A52  29 03
    CLC                          ; $9A54  18
    ADC #$0C                     ; $9A55  69 0C
    STA $0780,X                  ; $9A57  9D 80 07
    INX                          ; $9A5A  E8

loc_38_9A5B:
    LDA $47                      ; $9A5B  A5 47
    CLC                          ; $9A5D  18
    ADC #$0A                     ; $9A5E  69 0A
    STA $03                      ; $9A60  85 03

loc_38_9A62:
    CPX $03                      ; $9A62  E4 03
    BEQ loc_38_9A6E              ; $9A64  F0 08
    LDA #$0B                     ; $9A66  A9 0B
    STA $0780,X                  ; $9A68  9D 80 07
    INX                          ; $9A6B  E8
    BNE loc_38_9A62              ; $9A6C  D0 F4

loc_38_9A6E:
    STX $47                      ; $9A6E  86 47
    RTS                          ; $9A70  60

    .byte $67,$A7,$E7,$27,$67,$75,$B5,$F5,$35,$75,$21,$21,$21,$22,$22,$21  ; $9A71
    .byte $21,$21,$22,$22  ; $9A81

sub_38_9A85:
    LDX $47                      ; $9A85  A6 47
    LDA #$01                     ; $9A87  A9 01
    STA $0780,X                  ; $9A89  9D 80 07
    STA $0784,X                  ; $9A8C  9D 84 07
    LDA #$23                     ; $9A8F  A9 23
    STA $0781,X                  ; $9A91  9D 81 07
    LDA #$3B                     ; $9A94  A9 3B
    STA $0782,X                  ; $9A96  9D 82 07
    LDA $A9                      ; $9A99  A5 A9
    CLC                          ; $9A9B  18
    ADC #$01                     ; $9A9C  69 01
    STA $0783,X                  ; $9A9E  9D 83 07
    LDA #$23                     ; $9AA1  A9 23
    STA $0785,X                  ; $9AA3  9D 85 07
    LDA #$28                     ; $9AA6  A9 28
    STA $0786,X                  ; $9AA8  9D 86 07
    LDA $06A1                    ; $9AAB  AD A1 06
    CLC                          ; $9AAE  18
    ADC #$01                     ; $9AAF  69 01
    STA $0787,X                  ; $9AB1  9D 87 07
    TXA                          ; $9AB4  8A
    CLC                          ; $9AB5  18
    ADC #$08                     ; $9AB6  69 08
    STA $47                      ; $9AB8  85 47
    RTS                          ; $9ABA  60

    .byte $65,$00,$00,$14,$02,$52,$20,$D1,$EB,$A9,$FF,$20,$8E,$9E,$20,$43  ; $9ABB
    .byte $8C,$AD,$89,$06,$29,$01,$A8,$B9,$13,$9B,$18,$6D,$CB,$04,$9D,$CB  ; $9ACB
    .byte $04,$B9,$15,$9B,$9D,$DF,$05,$B9,$17,$9B,$9D,$F6,$05,$BD,$C8,$05  ; $9ADB
    .byte $18,$69,$04,$4A,$4A,$A8,$B9,$19,$9B,$9D,$C8,$05,$BD,$C8,$05,$85  ; $9AEB
    .byte $ED,$BD,$DF,$05,$85,$EE,$BD,$F6,$05,$85,$EC,$A9,$00,$85,$EB,$20  ; $9AFB
    .byte $D1,$E4,$20,$DF,$8F,$4C,$F7,$9A,$02,$FE,$00,$FF,$40,$C0,$FA,$00  ; $9B0B
    .byte $06,$71,$00,$00,$14,$02,$62,$20,$D1,$EB,$A9,$FF,$20,$8E,$9E,$20  ; $9B1B
    .byte $43,$8C,$AD,$CE,$03,$A8,$B9,$7A,$9B,$9D,$C8,$05,$BD,$C8,$05,$85  ; $9B2B
    .byte $ED,$A9,$00,$85,$EB,$A9,$7D,$85,$08,$A9,$9B,$85,$09,$20,$06,$EC  ; $9B3B
    .byte $A5,$12,$29,$01,$D0,$26,$20,$DF,$8F,$BD,$6C,$05,$F0,$DE,$29,$F0  ; $9B4B
    .byte $C9,$F0,$F0,$18,$A9,$00,$9D,$83,$05,$A9,$FC,$85,$EE,$A9,$00,$85  ; $9B5B
    .byte $ED,$20,$CB,$E4,$20,$68,$E4,$20,$85,$E4,$90,$ED,$4C,$56,$E4,$00  ; $9B6B
    .byte $03,$FD,$08,$00,$08,$FC,$F8,$00,$F8,$FC,$08,$08,$08,$08,$F8,$F8  ; $9B7B
    .byte $F8,$F8,$A9,$FD,$20,$8E,$9E,$A9,$23,$85,$DC,$AC,$CE,$03,$88,$98  ; $9B8B
    .byte $0A,$0A,$8D,$3B,$06,$A2,$01,$20,$B1,$9B,$20,$B1,$9B,$20,$B1,$9B  ; $9B9B
    .byte $20,$B1,$9B,$4C,$77,$E4,$A0,$8E,$20,$28,$CB,$41,$AD,$B7,$03,$29  ; $9BAB
    .byte $DE,$09,$01,$9D,$B7,$03,$A0,$00,$A9,$03,$20,$FD,$E8,$AC,$3B,$06  ; $9BBB
    .byte $EE,$3B,$06,$B9,$F9,$9B,$9D,$CE,$03,$A9,$00,$85,$EB,$85,$EC,$B9  ; $9BCB
    .byte $E9,$9B,$85,$ED,$B9,$F1,$9B,$85,$EE,$20,$D3,$E4,$E8,$60,$FC,$EC  ; $9BDB
    .byte $EC,$FC,$04,$14,$14,$04,$EC,$F4,$0C,$14,$EC,$F4,$0C,$14,$03,$04  ; $9BEB
    .byte $04,$05,$0D,$0C,$0C,$0B,$66,$00,$00,$15,$02,$72,$20,$D1,$EB,$A9  ; $9BFB
    .byte $0A,$9D,$B1,$05,$20,$DF,$8F,$DE,$B1,$05,$D0,$F8,$A0,$08,$20,$0E  ; $9C0B
    .byte $E6,$20,$DF,$8F,$4C,$17,$9C,$67,$00,$00,$14,$04,$84,$20,$D1,$EB  ; $9C1B
    .byte $A9,$FF,$20,$8E,$9E,$20,$43,$8C,$A9,$02,$9D,$B1,$05,$A9,$00,$9D  ; $9C2B
    .byte $DF,$05,$9D,$F6,$05,$85,$00,$85,$01,$85,$11,$20,$CD,$D9,$A5,$11  ; $9C3B
    .byte $F0,$0C,$AD,$86,$04,$9D,$86,$04,$AD,$6F,$04,$9D,$6F,$04,$BD,$C8  ; $9C4B
    .byte $05,$85,$ED,$A9,$00,$85,$EB,$85,$EE,$85,$EC,$20,$D1,$E4,$20,$90  ; $9C5B
    .byte $9C,$20,$DF,$8F,$DE,$B1,$05,$D0,$E5,$BD,$C8,$05,$85,$ED,$A9,$00  ; $9C6B
    .byte $85,$EB,$A9,$40,$85,$00,$20,$A4,$EC,$20,$D1,$E4,$20,$90,$9C,$20  ; $9C7B
    .byte $DF,$8F,$4C,$74,$9C,$BD,$86,$04,$38,$E5,$56,$C9,$08,$90,$37,$A9  ; $9C8B
    .byte $00,$85,$00,$85,$01,$85,$11,$20,$CD,$D9,$A5,$11,$F0,$08,$C9,$0D  ; $9C9B
    .byte $F0,$1E,$29,$01,$D0,$21,$A9,$00,$85,$00,$85,$11,$A9,$08,$85,$01  ; $9CAB
    .byte $20,$CD,$D9,$A5,$11,$F0,$0F,$C9,$0D,$F0,$05,$29,$01,$D0,$14,$60  ; $9CBB
    .byte $20,$B5,$8D,$4C,$56,$E4,$60,$A9,$4A,$9D,$9A,$05,$20,$4F,$DB,$A0  ; $9CCB
    .byte $6B,$D0,$0A,$A9,$49,$9D,$9A,$05,$20,$6D,$DB,$A0,$68,$20,$22,$E5  ; $9CDB
    .byte $20,$CB,$E4,$A9,$1E,$9D,$B1,$05,$AD,$7A,$06,$18,$7D,$CB,$04,$9D  ; $9CEB
    .byte $CB,$04,$20,$DF,$8F,$DE,$B1,$05,$D0,$EE,$4C,$56,$E4,$A9,$FC,$20  ; $9CFB
    .byte $8E,$9E,$A9,$00,$8D,$3B,$06,$A2,$01,$20,$23,$9D,$20,$23,$9D,$20  ; $9D0B
    .byte $23,$9D,$20,$23,$9D,$4C,$77,$E4,$A0,$8D,$20,$28,$CB,$41,$AD,$86  ; $9D1B
    .byte $04,$9D,$DF,$05,$AD,$CB,$04,$9D,$F6,$05,$A0,$00,$A9,$1D,$18,$6D  ; $9D2B
    .byte $3B,$06,$20,$FD,$E8,$AC,$3B,$06,$B9,$4E,$9D,$9D,$CE,$03,$E8,$EE  ; $9D3B
    .byte $3B,$06,$60,$04,$00,$0C,$08,$6E,$00,$00,$05,$00,$94,$20,$D1,$EB  ; $9D4B
    .byte $A9,$02,$9D,$B1,$05,$A0,$08,$20,$0E,$E6,$AD,$86,$04,$38,$FD,$DF  ; $9D5B
    .byte $05,$85,$ED,$AD,$CB,$04,$38,$FD,$F6,$05,$85,$EE,$20,$CB,$E4,$AD  ; $9D6B
    .byte $86,$04,$9D,$DF,$05,$AD,$CB,$04,$9D,$F6,$05,$20,$DF,$8F,$DE,$B1  ; $9D7B
    .byte $05,$D0,$D2,$FE,$CE,$03,$BD,$CE,$03,$29,$0F,$9D,$CE,$03,$A9,$00  ; $9D8B
    .byte $9D,$B7,$03,$20,$85,$E4,$90,$B8,$A9,$01,$9D,$B7,$03,$4C,$5B,$9D  ; $9D9B
    .byte $70,$00,$00,$14,$04,$A3,$20,$D1,$EB,$A9,$FF,$20,$8E,$9E,$20,$43  ; $9DAB
    .byte $8C,$A9,$14,$9D,$24,$06,$AC,$CE,$03,$B9,$CD,$E1,$9D,$CE,$03,$BD  ; $9DBB
    .byte $B1,$05,$29,$0F,$F0,$1B,$A8,$B9,$CD,$E1,$10,$08,$AC,$CE,$03,$B9  ; $9DCB
    .byte $D5,$E1,$D0,$0A,$C9,$08,$D0,$06,$AC,$CE,$03,$B9,$D1,$E1,$9D,$CE  ; $9DDB
    .byte $03,$A0,$08,$20,$0E,$E6,$20,$DF,$8F,$DE,$24,$06,$D0,$F3,$20,$FC  ; $9DEB
    .byte $EC,$A0,$08,$20,$0E,$E6,$20,$DF,$8F,$A5,$F3,$29,$01,$F0,$EF,$BD  ; $9DFB
    .byte $9A,$05,$85,$08,$AD,$9A,$05,$85,$0A,$A0,$00,$20,$12,$F7,$A5,$11  ; $9E0B
    .byte $F0,$DF,$4C,$56,$E4,$6F,$00,$00,$14,$04,$B3,$20,$D1,$EB,$A9,$FF  ; $9E1B
    .byte $20,$8E,$9E,$20,$43,$8C,$A9,$00,$9D,$0D,$06,$A9,$02,$9D,$24,$06  ; $9E2B
    .byte $A0,$02,$20,$C9,$EE,$BD,$C8,$05,$85,$ED,$A9,$00,$85,$EB,$20,$D1  ; $9E3B
    .byte $E4,$20,$DF,$8F,$4C,$3B,$9E,$A9,$FC,$20,$8E,$9E,$20,$C9,$DE,$A2  ; $9E4B
    .byte $15,$BD,$A0,$03,$F0,$16,$BD,$83,$05,$29,$F0,$C9,$30,$F0,$08,$C9  ; $9E5B
    .byte $F0,$F0,$04,$C9,$10,$D0,$05,$A9,$C4,$9D,$6C,$05,$CA,$E0,$07,$D0  ; $9E6B
    .byte $E0,$A6,$8F,$A9,$10,$9D,$B1,$05,$20,$68,$E4,$DE,$B1,$05,$D0,$F8  ; $9E7B
    .byte $4C,$56,$E4  ; $9E8B

loc_38_9E8E:
    LDY $0699                    ; $9E8E  AC 99 06
    PHA                          ; $9E91  48
    LDA $0688,Y                  ; $9E92  B9 88 06
    BMI loc_38_9EA6              ; $9E95  30 0F
    PLA                          ; $9E97  68
    CLC                          ; $9E98  18
    ADC $0688,Y                  ; $9E99  79 88 06
    CMP #$1C                     ; $9E9C  C9 1C
    BCC loc_38_9EA2              ; $9E9E  90 02
    LDA #$FF                     ; $9EA0  A9 FF

loc_38_9EA2:
    STA $0688,Y                  ; $9EA2  99 88 06
    RTS                          ; $9EA5  60


loc_38_9EA6:
    PLA                          ; $9EA6  68
    LDA $0583,X                  ; $9EA7  BD 83 05
    CMP #$DF                     ; $9EAA  C9 DF
    BEQ loc_38_9EB1              ; $9EAC  F0 03
    JMP loc_3F_E456              ; $9EAE  4C 56 E4


loc_38_9EB1:
    RTS                          ; $9EB1  60

    .byte $C0,$00,$00,$14,$04,$DF,$20,$D1,$EB,$A5,$57,$9D,$6F,$04,$A5,$56  ; $9EB2
    .byte $9D,$86,$04,$A5,$59,$9D,$B4,$04,$A5,$58,$9D,$CB,$04,$A9,$06,$9D  ; $9EC2
    .byte $CE,$03,$AD,$B7,$03,$29,$40,$9D,$B7,$03,$AC,$CE,$03,$AD,$CB,$04  ; $9ED2
    .byte $18,$69,$E8,$C9,$F0,$B0,$04,$C9,$08,$B0,$02,$A9,$08,$85,$0A,$AD  ; $9EE2
    .byte $86,$04,$38,$E5,$F7,$C9,$E8,$B0,$04,$C9,$19,$B0,$0D,$AD,$86,$04  ; $9EF2
    .byte $85,$08,$AD,$6F,$04,$85,$09,$4C,$1D,$9F,$AD,$86,$04,$18,$79,$50  ; $9F02
    .byte $F0,$85,$08,$AD,$6F,$04,$79,$53,$F0,$85,$09,$20,$BD,$F8,$20,$01  ; $9F12
    .byte $ED,$A5,$08,$38,$FD,$86,$04,$18,$69,$03,$C9,$07,$B0,$0D,$A5,$0A  ; $9F22
    .byte $38,$FD,$CB,$04,$18,$69,$03,$C9,$06,$90,$03,$20,$8A,$9F,$20,$DF  ; $9F32
    .byte $8F,$A5,$F3,$29,$1F,$D0,$8B,$20,$71,$9F,$90,$86,$98,$9D,$B1,$05  ; $9F42
    .byte $A5,$F3,$29,$01,$D0,$07,$BD,$B1,$05,$A8,$20,$FE,$EC,$20,$8A,$9F  ; $9F52
    .byte $20,$DF,$8F,$BD,$B1,$05,$A8,$B9,$E5,$03,$10,$E4,$4C,$D4,$9E,$A0  ; $9F62
    .byte $16,$B9,$A0,$03,$F0,$0B,$B9,$83,$05,$29,$F0,$C9,$10,$D0,$02,$38  ; $9F72
    .byte $60,$88,$C0,$07,$D0,$EB,$18,$60,$A0,$0A,$20,$0E,$E6,$BD,$B7,$03  ; $9F82
    .byte $29,$BE,$A4,$ED,$30,$02,$09,$40,$9D,$B7,$03,$BD,$86,$04,$38,$E5  ; $9F92
    .byte $56,$BD,$6F,$04,$E5,$57,$F0,$08,$BD,$B7,$03,$09,$01,$9D,$B7,$03  ; $9FA2
    .byte $AD,$91,$06,$30,$01,$60,$A0,$0A,$20,$0E,$E6,$20,$68,$E4,$20,$85  ; $9FB2
    .byte $E4,$90,$F3,$4C,$56,$E4,$29,$BE,$A4,$ED,$30,$02,$09,$40,$9D,$B7  ; $9FC2
    .byte $03,$BD,$86,$04,$38,$E5,$56,$BD,$6F,$04,$E5,$57,$F0,$08,$BD,$B7  ; $9FD2
    .byte $03,$09,$01,$9D,$B7,$03,$AD,$91,$06,$30,$01,$60,$A0,$0A,$20,$2F  ; $9FE2
    .byte $E6,$20,$89,$E4,$20,$A6,$E4,$90,$F3,$4C,$77,$E4,$71,$F1  ; $9FF2
