; PRG 8 KB bank $17 at $8000
.segment "BANK17"
.org $8000

    LDA #$00                     ; $8000  A9 00
    STA $95                      ; $8002  85 95
    LDA $30                      ; $8004  A5 30
    CMP #$07                     ; $8006  C9 07
    BEQ loc_17_801C              ; $8008  F0 12
    CMP #$10                     ; $800A  C9 10
    BEQ loc_17_801F              ; $800C  F0 11
    CMP #$23                     ; $800E  C9 23
    BNE loc_17_8029              ; $8010  D0 17
    LDA #$0E                     ; $8012  A9 0E
    STA $F6                      ; $8014  85 F6
    JSR sub_1F_FF43              ; $8016  20 43 FF
    JMP $A000                    ; $8019  4C 00 A0


loc_17_801C:
    JMP loc_17_859C              ; $801C  4C 9C 85


loc_17_801F:
    LDA #$00                     ; $801F  A9 00
    STA $69                      ; $8021  85 69
    JSR sub_1F_F465              ; $8023  20 65 F4
    JMP loc_17_8860              ; $8026  4C 60 88


loc_17_8029:
    LDA #$F0                     ; $8029  A9 F0
    JSR sub_1F_EC5B              ; $802B  20 5B EC
    JSR sub_17_91C9              ; $802E  20 C9 91
    JSR sub_1E_C3F1              ; $8031  20 F1 C3
    JSR sub_1E_C39D              ; $8034  20 9D C3
    JSR sub_1E_C38F              ; $8037  20 8F C3
    JSR sub_1E_C3B8              ; $803A  20 B8 C3
    JSR sub_1F_FF22              ; $803D  20 22 FF
    JSR sub_1E_C2D1              ; $8040  20 D1 C2
    JSR sub_1F_F3F2              ; $8043  20 F2 F3
    LDA #$01                     ; $8046  A9 01
    JSR sub_1F_FFB7              ; $8048  20 B7 FF
    LDA #$10                     ; $804B  A9 10
    STA $27                      ; $804D  85 27
    STA $26                      ; $804F  85 26
    LDA #$08                     ; $8051  A9 08
    STA $10                      ; $8053  85 10
    LDA #$01                     ; $8055  A9 01
    STA $23                      ; $8057  85 23
    JSR sub_1E_DAFC              ; $8059  20 FC DA
    DEC $27                      ; $805C  C6 27
    LDA #$00                     ; $805E  A9 00
    STA $10                      ; $8060  85 10
    LDA #$00                     ; $8062  A9 00
    STA $23                      ; $8064  85 23
    JSR sub_1E_DAFC              ; $8066  20 FC DA
    LDY #$4C                     ; $8069  A0 4C
    JSR sub_17_89FC              ; $806B  20 FC 89
    LDA #$02                     ; $806E  A9 02
    STA $FD                      ; $8070  85 FD
    JSR sub_1E_C2DB              ; $8072  20 DB C2
    JSR sub_1E_C3EB              ; $8075  20 EB C3
    LDA #$96                     ; $8078  A9 96
    JSR sub_1F_FF24              ; $807A  20 24 FF

loc_17_807D:
    JSR $A000                    ; $807D  20 00 A0
    LDY #$00                     ; $8080  A0 00
    JSR sub_17_89FC              ; $8082  20 FC 89
    LDY #$00                     ; $8085  A0 00
    LDA #$10                     ; $8087  A9 10
    JSR sub_17_8A29              ; $8089  20 29 8A
    LDA #$49                     ; $808C  A9 49
    JSR sub_1F_EC5B              ; $808E  20 5B EC
    LDA #$00                     ; $8091  A9 00
    STA $FD                      ; $8093  85 FD
    LDA #$A0                     ; $8095  A9 A0
    STA $10                      ; $8097  85 10
    LDA #$05                     ; $8099  A9 05
    STA $11                      ; $809B  85 11
    JSR sub_1E_C3EB              ; $809D  20 EB C3

loc_17_80A0:
    JSR sub_1F_FF22              ; $80A0  20 22 FF
    JSR sub_1E_C2E5              ; $80A3  20 E5 C2
    LDA $14                      ; $80A6  A5 14
    AND #$90                     ; $80A8  29 90
    BNE loc_17_80D2              ; $80AA  D0 26
    LDA $14                      ; $80AC  A5 14
    AND #$2C                     ; $80AE  29 2C
    BEQ loc_17_80BF              ; $80B0  F0 0D
    LDA #$27                     ; $80B2  A9 27
    JSR sub_1F_EC5D              ; $80B4  20 5D EC
    LDA $0200                    ; $80B7  AD 00 02
    EOR #$10                     ; $80BA  49 10
    STA $0200                    ; $80BC  8D 00 02

loc_17_80BF:
    LDA $10                      ; $80BF  A5 10
    SEC                          ; $80C1  38
    SBC #$01                     ; $80C2  E9 01
    STA $10                      ; $80C4  85 10
    LDA $11                      ; $80C6  A5 11
    SBC #$00                     ; $80C8  E9 00
    STA $11                      ; $80CA  85 11
    ORA $10                      ; $80CC  05 10
    BNE loc_17_80A0              ; $80CE  D0 D0
    BEQ loc_17_807D              ; $80D0  F0 AB

loc_17_80D2:
    LDA #$28                     ; $80D2  A9 28
    JSR sub_1F_EC5D              ; $80D4  20 5D EC
    LDA $0200                    ; $80D7  AD 00 02
    CMP #$A7                     ; $80DA  C9 A7
    BEQ loc_17_80E1              ; $80DC  F0 03
    JMP loc_17_83BA              ; $80DE  4C BA 83


loc_17_80E1:
    JSR sub_1E_C3F1              ; $80E1  20 F1 C3
    JSR sub_1E_C39D              ; $80E4  20 9D C3
    JSR sub_1E_C38F              ; $80E7  20 8F C3
    JSR sub_1E_C3B8              ; $80EA  20 B8 C3
    JSR sub_1F_F3F2              ; $80ED  20 F2 F3
    JSR sub_1F_FF22              ; $80F0  20 22 FF
    JSR sub_1E_C2D1              ; $80F3  20 D1 C2
    LDA #$10                     ; $80F6  A9 10
    STA $26                      ; $80F8  85 26
    LDA #$0F                     ; $80FA  A9 0F
    STA $27                      ; $80FC  85 27
    LDA #$00                     ; $80FE  A9 00
    STA $10                      ; $8100  85 10
    LDA #$02                     ; $8102  A9 02
    STA $23                      ; $8104  85 23
    JSR sub_1E_DAFC              ; $8106  20 FC DA
    LDA #$08                     ; $8109  A9 08
    STA $10                      ; $810B  85 10
    LDA #$04                     ; $810D  A9 04
    STA $23                      ; $810F  85 23
    JSR sub_1E_DAFC              ; $8111  20 FC DA
    LDY #$26                     ; $8114  A0 26
    JSR sub_17_89FC              ; $8116  20 FC 89
    LDY #$10                     ; $8119  A0 10
    LDA #$E4                     ; $811B  A9 E4
    JSR sub_17_8A29              ; $811D  20 29 8A
    JSR sub_17_8A94              ; $8120  20 94 8A
    JSR sub_1E_C2DB              ; $8123  20 DB C2
    JSR sub_1F_FF22              ; $8126  20 22 FF
    JSR sub_1E_C3EB              ; $8129  20 EB C3
    LDA #$0D                     ; $812C  A9 0D
    JSR sub_1F_EC5B              ; $812E  20 5B EC
    JSR sub_17_8AF1              ; $8131  20 F1 8A
    LDA #$01                     ; $8134  A9 01
    STA $10                      ; $8136  85 10
    STA $11                      ; $8138  85 11
    LDA #$00                     ; $813A  A9 00
    STA $14                      ; $813C  85 14
    STA $9D                      ; $813E  85 9D

loc_17_8140:
    LDA $14                      ; $8140  A5 14
    AND #$90                     ; $8142  29 90
    BEQ loc_17_8149              ; $8144  F0 03
    JMP loc_17_81CD              ; $8146  4C CD 81


loc_17_8149:
    LDA $14                      ; $8149  A5 14
    AND #$0F                     ; $814B  29 0F
    BEQ loc_17_818A              ; $814D  F0 3B
    AND #$03                     ; $814F  29 03
    BEQ loc_17_8168              ; $8151  F0 15
    AND #$01                     ; $8153  29 01
    TAY                          ; $8155  A8
    LDA $11                      ; $8156  A5 11
    CLC                          ; $8158  18
    ADC $8D90,Y                  ; $8159  79 90 8D
    STA $11                      ; $815C  85 11
    CMP #$03                     ; $815E  C9 03
    BCC loc_17_8168              ; $8160  90 06
    CLC                          ; $8162  18
    ADC $8D92,Y                  ; $8163  79 92 8D
    STA $11                      ; $8166  85 11

loc_17_8168:
    LDA $14                      ; $8168  A5 14
    AND #$0C                     ; $816A  29 0C
    BEQ loc_17_8185              ; $816C  F0 17
    AND #$04                     ; $816E  29 04
    LSR A                        ; $8170  4A
    LSR A                        ; $8171  4A
    TAY                          ; $8172  A8
    LDA $10                      ; $8173  A5 10
    CLC                          ; $8175  18
    ADC $8D90,Y                  ; $8176  79 90 8D
    STA $10                      ; $8179  85 10
    CMP #$03                     ; $817B  C9 03
    BCC loc_17_8185              ; $817D  90 06
    CLC                          ; $817F  18
    ADC $8D92,Y                  ; $8180  79 92 8D
    STA $10                      ; $8183  85 10

loc_17_8185:
    LDA #$27                     ; $8185  A9 27
    JSR sub_1F_EC5D              ; $8187  20 5D EC

loc_17_818A:
    LDY $10                      ; $818A  A4 10
    LDA $8D8A,Y                  ; $818C  B9 8A 8D
    STA $00                      ; $818F  85 00
    LDY $11                      ; $8191  A4 11
    LDA $8D8D,Y                  ; $8193  B9 8D 8D
    STA $01                      ; $8196  85 01
    LDY #$00                     ; $8198  A0 00
    LDX #$00                     ; $819A  A2 00

loc_17_819C:
    LDA $00                      ; $819C  A5 00
    CLC                          ; $819E  18
    ADC $8D94,Y                  ; $819F  79 94 8D
    STA $0200,X                  ; $81A2  9D 00 02
    LDA $01                      ; $81A5  A5 01
    CLC                          ; $81A7  18
    ADC $8D9C,Y                  ; $81A8  79 9C 8D
    STA $0203,X                  ; $81AB  9D 03 02
    LDA $9D                      ; $81AE  A5 9D
    AND #$08                     ; $81B0  29 08
    BEQ loc_17_81B9              ; $81B2  F0 05
    LDA #$F8                     ; $81B4  A9 F8
    STA $0200,X                  ; $81B6  9D 00 02

loc_17_81B9:
    INX                          ; $81B9  E8
    INX                          ; $81BA  E8
    INX                          ; $81BB  E8
    INX                          ; $81BC  E8
    INY                          ; $81BD  C8
    CPY #$08                     ; $81BE  C0 08
    BNE loc_17_819C              ; $81C0  D0 DA

loc_17_81C2:
    INC $9D                      ; $81C2  E6 9D
    JSR sub_1F_FF22              ; $81C4  20 22 FF
    JSR sub_1E_C2E5              ; $81C7  20 E5 C2
    JMP loc_17_8140              ; $81CA  4C 40 81


loc_17_81CD:
    LDA $10                      ; $81CD  A5 10
    ASL A                        ; $81CF  0A
    ADC $10                      ; $81D0  65 10
    ADC $11                      ; $81D2  65 11
    STA $12                      ; $81D4  85 12
    TAY                          ; $81D6  A8
    LDA $8DA4,Y                  ; $81D7  B9 A4 8D
    STA $26                      ; $81DA  85 26
    STA $6C                      ; $81DC  85 6C
    CMP #$08                     ; $81DE  C9 08
    BNE loc_17_81F0              ; $81E0  D0 0E
    LDA $6E                      ; $81E2  A5 6E
    CMP #$FF                     ; $81E4  C9 FF
    BNE loc_17_81C2              ; $81E6  D0 DA
    LDA #$28                     ; $81E8  A9 28
    JSR sub_1F_EC5D              ; $81EA  20 5D EC
    JMP loc_17_9272              ; $81ED  4C 72 92


loc_17_81F0:
    LDA #$28                     ; $81F0  A9 28
    JSR sub_1F_EC5D              ; $81F2  20 5D EC
    LDX #$08                     ; $81F5  A2 08

loc_17_81F7:
    LDA $0610                    ; $81F7  AD 10 06
    EOR #$3F                     ; $81FA  49 3F
    STA $0610                    ; $81FC  8D 10 06
    LDA #$FF                     ; $81FF  A9 FF
    STA $18                      ; $8201  85 18
    LDA #$08                     ; $8203  A9 08
    JSR sub_1F_FF24              ; $8205  20 24 FF
    DEX                          ; $8208  CA
    BNE loc_17_81F7              ; $8209  D0 EC
    LDA #$0F                     ; $820B  A9 0F
    LDY #$0B                     ; $820D  A0 0B

loc_17_820F:
    STA $0604,Y                  ; $820F  99 04 06
    DEY                          ; $8212  88
    BPL loc_17_820F              ; $8213  10 FA
    TAY                          ; $8215  A8

loc_17_8216:
    LDA $8C42,Y                  ; $8216  B9 42 8C
    STA $0630,Y                  ; $8219  99 30 06
    DEY                          ; $821C  88
    BPL loc_17_8216              ; $821D  10 F7
    JSR sub_1E_C38F              ; $821F  20 8F C3
    JSR sub_17_8B2E              ; $8222  20 2E 8B
    LDX #$05                     ; $8225  A2 05

loc_17_8227:
    LDA $8C8A,X                  ; $8227  BD 8A 8C
    STA $EA                      ; $822A  85 EA
    LDY #$03                     ; $822C  A0 03

loc_17_822E:
    LDA $0620,Y                  ; $822E  B9 20 06
    SEC                          ; $8231  38
    SBC $8C90,X                  ; $8232  FD 90 8C
    BCS loc_17_8239              ; $8235  B0 02
    LDA #$0F                     ; $8237  A9 0F

loc_17_8239:
    STA $0600,Y                  ; $8239  99 00 06
    DEY                          ; $823C  88
    BPL loc_17_822E              ; $823D  10 EF
    STY $18                      ; $823F  84 18
    LDA #$08                     ; $8241  A9 08
    JSR sub_1F_FF24              ; $8243  20 24 FF
    DEX                          ; $8246  CA
    BPL loc_17_8227              ; $8247  10 DE
    LDY #$1F                     ; $8249  A0 1F
    LDA #$0F                     ; $824B  A9 0F

loc_17_824D:
    STA $0600,Y                  ; $824D  99 00 06
    STA $0620,Y                  ; $8250  99 20 06
    DEY                          ; $8253  88
    BPL loc_17_824D              ; $8254  10 F7
    STY $18                      ; $8256  84 18
    JSR sub_1F_FF22              ; $8258  20 22 FF
    LDY $6C                      ; $825B  A4 6C
    LDA $F2B2,Y                  ; $825D  B9 B2 F2
    AND $6E                      ; $8260  25 6E
    BEQ loc_17_8265              ; $8262  F0 01
    RTS                          ; $8264  60


loc_17_8265:
    JSR sub_1E_C2D1              ; $8265  20 D1 C2
    LDA #$00                     ; $8268  A9 00
    STA $10                      ; $826A  85 10
    LDA #$03                     ; $826C  A9 03
    STA $23                      ; $826E  85 23
    JSR sub_1E_DAFC              ; $8270  20 FC DA
    JSR sub_1F_FF22              ; $8273  20 22 FF
    JSR sub_1E_C2DB              ; $8276  20 DB C2
    LDA #$0E                     ; $8279  A9 0E
    JSR sub_1F_EC5B              ; $827B  20 5B EC
    LDY #$1F                     ; $827E  A0 1F

loc_17_8280:
    LDA $8C32,Y                  ; $8280  B9 32 8C
    STA $0620,Y                  ; $8283  99 20 06
    DEY                          ; $8286  88
    BPL loc_17_8280              ; $8287  10 F7
    LDX #$01                     ; $8289  A2 01

loc_17_828B:
    LDA #$6D                     ; $828B  A9 6D
    STA $0300,X                  ; $828D  9D 00 03
    LDA #$00                     ; $8290  A9 00
    STA $0348,X                  ; $8292  9D 48 03
    STA $0390,X                  ; $8295  9D 90 03
    STA $0528,X                  ; $8298  9D 28 05
    LDA $8E50,X                  ; $829B  BD 50 8E
    JSR sub_1F_EA98              ; $829E  20 98 EA
    LDA #$68                     ; $82A1  A9 68
    STA $0378,X                  ; $82A3  9D 78 03
    LDA #$80                     ; $82A6  A9 80
    STA $0330,X                  ; $82A8  9D 30 03
    DEX                          ; $82AB  CA
    BPL loc_17_828B              ; $82AC  10 DD
    LDA #$C8                     ; $82AE  A9 C8
    STA $EA                      ; $82B0  85 EA
    LDA #$CA                     ; $82B2  A9 CA
    STA $EB                      ; $82B4  85 EB
    LDA #$57                     ; $82B6  A9 57
    STA $FA                      ; $82B8  85 FA
    LDA #$CE                     ; $82BA  A9 CE
    STA $9B                      ; $82BC  85 9B
    LDA #$06                     ; $82BE  A9 06
    STA $99                      ; $82C0  85 99
    LDA #$96                     ; $82C2  A9 96
    STA $05F1                    ; $82C4  8D F1 05
    LDA #$00                     ; $82C7  A9 00
    STA $05F9                    ; $82C9  8D F9 05
    STA $05F5                    ; $82CC  8D F5 05
    JSR sub_1E_C3EB              ; $82CF  20 EB C3

loc_17_82D2:
    INC $95                      ; $82D2  E6 95
    DEC $FA                      ; $82D4  C6 FA
    DEC $FA                      ; $82D6  C6 FA
    DEC $FA                      ; $82D8  C6 FA
    DEC $9B                      ; $82DA  C6 9B
    DEC $9B                      ; $82DC  C6 9B
    DEC $9B                      ; $82DE  C6 9B
    DEC $95                      ; $82E0  C6 95
    JSR sub_1F_FF22              ; $82E2  20 22 FF
    LDA $FA                      ; $82E5  A5 FA
    BNE loc_17_82D2              ; $82E7  D0 E9
    JSR sub_17_8A3A              ; $82E9  20 3A 8A

loc_17_82EC:
    JSR sub_17_8A4A              ; $82EC  20 4A 8A
    LDA $0540                    ; $82EF  AD 40 05
    CMP #$06                     ; $82F2  C9 06
    BNE loc_17_82EC              ; $82F4  D0 F6
    LDX #$00                     ; $82F6  A2 00
    STX $9D                      ; $82F8  86 9D
    LDY $6C                      ; $82FA  A4 6C
    LDA $8DB3,Y                  ; $82FC  B9 B3 8D
    JSR sub_1F_EA98              ; $82FF  20 98 EA
    LDA #$00                     ; $8302  A9 00
    STA $0301                    ; $8304  8D 01 03
    LDY #$0E                     ; $8307  A0 0E
    LDA #$36                     ; $8309  A9 36

loc_17_830B:
    STA $0611,Y                  ; $830B  99 11 06
    DEY                          ; $830E  88
    BPL loc_17_830B              ; $830F  10 FA
    STY $18                      ; $8311  84 18

loc_17_8313:
    LDA #$00                     ; $8313  A9 00
    STA $0570                    ; $8315  8D 70 05
    JSR sub_17_8A4A              ; $8318  20 4A 8A
    LDA $9D                      ; $831B  A5 9D
    LSR A                        ; $831D  4A
    AND #$07                     ; $831E  29 07
    TAY                          ; $8320  A8
    LDA $0528                    ; $8321  AD 28 05
    AND #$FB                     ; $8324  29 FB
    ORA $8DC3,Y                  ; $8326  19 C3 8D
    STA $0528                    ; $8329  8D 28 05
    CPY #$07                     ; $832C  C0 07
    BNE loc_17_8313              ; $832E  D0 E3
    LDA $6C                      ; $8330  A5 6C
    ASL A                        ; $8332  0A
    ASL A                        ; $8333  0A
    ASL A                        ; $8334  0A
    TAY                          ; $8335  A8
    LDX #$00                     ; $8336  A2 00

loc_17_8338:
    LDA $8C42,X                  ; $8338  BD 42 8C
    STA $0610,X                  ; $833B  9D 10 06
    LDA $8C4A,Y                  ; $833E  B9 4A 8C
    STA $0618,X                  ; $8341  9D 18 06
    STA $0638,X                  ; $8344  9D 38 06
    INY                          ; $8347  C8
    INX                          ; $8348  E8
    CPX #$08                     ; $8349  E0 08
    BNE loc_17_8338              ; $834B  D0 EB
    LDA #$FF                     ; $834D  A9 FF
    STA $18                      ; $834F  85 18

loc_17_8351:
    JSR sub_17_8A4A              ; $8351  20 4A 8A
    LDY $6C                      ; $8354  A4 6C
    LDA $0540                    ; $8356  AD 40 05
    CMP $8DBB,Y                  ; $8359  D9 BB 8D
    BNE loc_17_8351              ; $835C  D0 F3
    LDA $0558                    ; $835E  AD 58 05
    CMP #$20                     ; $8361  C9 20
    BNE loc_17_8385              ; $8363  D0 20
    LDX #$00                     ; $8365  A2 00
    LDY #$01                     ; $8367  A0 01
    LDA #$21                     ; $8369  A9 21
    JSR sub_1F_EAA4              ; $836B  20 A4 EA
    LDA #$6D                     ; $836E  A9 6D
    STA $0301                    ; $8370  8D 01 03
    LDA #$48                     ; $8373  A9 48
    STA $0379                    ; $8375  8D 79 03

loc_17_8378:
    LDA #$00                     ; $8378  A9 00
    STA $0570                    ; $837A  8D 70 05
    JSR sub_17_8A4A              ; $837D  20 4A 8A
    LDA $0301                    ; $8380  AD 01 03
    BNE loc_17_8378              ; $8383  D0 F3

loc_17_8385:
    LDY #$04                     ; $8385  A0 04

loc_17_8387:
    LDA $8DCB,Y                  ; $8387  B9 CB 8D
    STA $0780,Y                  ; $838A  99 80 07
    DEY                          ; $838D  88
    BPL loc_17_8387              ; $838E  10 F7
    LDA $26                      ; $8390  A5 26
    ASL A                        ; $8392  0A
    ASL A                        ; $8393  0A
    ASL A                        ; $8394  0A
    ASL A                        ; $8395  0A
    TAY                          ; $8396  A8

loc_17_8397:
    LDA $8DD0,Y                  ; $8397  B9 D0 8D
    CMP #$20                     ; $839A  C9 20
    BEQ loc_17_83AA              ; $839C  F0 0C
    STA $0783                    ; $839E  8D 83 07
    LDA #$FF                     ; $83A1  A9 FF
    STA $19                      ; $83A3  85 19
    LDA #$08                     ; $83A5  A9 08
    JSR sub_17_8A7D              ; $83A7  20 7D 8A

loc_17_83AA:
    INY                          ; $83AA  C8
    INC $0781                    ; $83AB  EE 81 07
    LDA $0781                    ; $83AE  AD 81 07
    CMP #$17                     ; $83B1  C9 17
    BNE loc_17_8397              ; $83B3  D0 E2
    LDA #$B4                     ; $83B5  A9 B4
    JMP sub_17_8A7D              ; $83B7  4C 7D 8A


loc_17_83BA:
    JSR sub_17_866A              ; $83BA  20 6A 86
    LDY #$0F                     ; $83BD  A0 0F

loc_17_83BF:
    LDA $9024,Y                  ; $83BF  B9 24 90
    STA $0200,Y                  ; $83C2  99 00 02
    DEY                          ; $83C5  88
    BPL loc_17_83BF              ; $83C6  10 F7
    LDA #$13                     ; $83C8  A9 13
    JSR sub_1F_EC5B              ; $83CA  20 5B EC
    JSR sub_1E_C3EB              ; $83CD  20 EB C3

loc_17_83D0:
    LDA #$00                     ; $83D0  A9 00
    STA $10                      ; $83D2  85 10
    BEQ loc_17_840F              ; $83D4  F0 39

loc_17_83D6:
    LDA $14                      ; $83D6  A5 14
    AND #$90                     ; $83D8  29 90
    BEQ loc_17_83E5              ; $83DA  F0 09
    LDA $10                      ; $83DC  A5 10
    CMP #$02                     ; $83DE  C9 02
    BCC loc_17_8441              ; $83E0  90 5F
    JMP loc_17_86AB              ; $83E2  4C AB 86


loc_17_83E5:
    LDA $14                      ; $83E5  A5 14
    AND #$0C                     ; $83E7  29 0C
    BEQ loc_17_83F8              ; $83E9  F0 0D
    LDA $10                      ; $83EB  A5 10
    EOR #$02                     ; $83ED  49 02
    AND #$02                     ; $83EF  29 02
    STA $10                      ; $83F1  85 10
    LDA #$27                     ; $83F3  A9 27
    JSR sub_1F_EC5D              ; $83F5  20 5D EC

loc_17_83F8:
    LDA $10                      ; $83F8  A5 10
    CMP #$02                     ; $83FA  C9 02
    BCS loc_17_840F              ; $83FC  B0 11
    LDA $14                      ; $83FE  A5 14
    AND #$03                     ; $8400  29 03
    BEQ loc_17_840F              ; $8402  F0 0B
    LDA $10                      ; $8404  A5 10
    EOR #$01                     ; $8406  49 01
    STA $10                      ; $8408  85 10
    LDA #$27                     ; $840A  A9 27
    JSR sub_1F_EC5D              ; $840C  20 5D EC

loc_17_840F:
    LDY $10                      ; $840F  A4 10
    LDA $9034,Y                  ; $8411  B9 34 90
    STA $00                      ; $8414  85 00
    LDA $9037,Y                  ; $8416  B9 37 90
    STA $01                      ; $8419  85 01
    LDX $903A,Y                  ; $841B  BE 3A 90
    LDY #$00                     ; $841E  A0 00

loc_17_8420:
    LDA $903D,X                  ; $8420  BD 3D 90
    CLC                          ; $8423  18
    ADC $00                      ; $8424  65 00
    STA $0200,Y                  ; $8426  99 00 02
    LDA $9045,X                  ; $8429  BD 45 90
    CLC                          ; $842C  18
    ADC $01                      ; $842D  65 01
    STA $0203,Y                  ; $842F  99 03 02
    INX                          ; $8432  E8
    INY                          ; $8433  C8
    INY                          ; $8434  C8
    INY                          ; $8435  C8
    INY                          ; $8436  C8
    CPY #$10                     ; $8437  C0 10
    BNE loc_17_8420              ; $8439  D0 E5
    JSR sub_17_851E              ; $843B  20 1E 85
    JMP loc_17_83D6              ; $843E  4C D6 83


loc_17_8441:
    LDA #$00                     ; $8441  A9 00
    STA $12                      ; $8443  85 12
    STA $13                      ; $8445  85 13
    JMP loc_17_84EB              ; $8447  4C EB 84


loc_17_844A:
    LDA $14                      ; $844A  A5 14
    AND #$40                     ; $844C  29 40
    BNE loc_17_83D0              ; $844E  D0 80
    LDA $14                      ; $8450  A5 14
    AND #$10                     ; $8452  29 10
    BEQ loc_17_845C              ; $8454  F0 06
    LDA #$02                     ; $8456  A9 02
    STA $10                      ; $8458  85 10
    BNE loc_17_840F              ; $845A  D0 B3

loc_17_845C:
    LDA $14                      ; $845C  A5 14
    AND #$80                     ; $845E  29 80
    BEQ loc_17_84AD              ; $8460  F0 4B
    LDA $13                      ; $8462  A5 13
    ASL A                        ; $8464  0A
    ASL A                        ; $8465  0A
    STA $00                      ; $8466  85 00
    LDA $12                      ; $8468  A5 12
    ASL A                        ; $846A  0A
    ASL A                        ; $846B  0A
    ASL A                        ; $846C  0A
    STA $01                      ; $846D  85 01
    ASL A                        ; $846F  0A
    ADC $00                      ; $8470  65 00
    ADC $01                      ; $8472  65 01
    TAY                          ; $8474  A8
    LDA $0210,Y                  ; $8475  B9 10 02
    CMP #$F8                     ; $8478  C9 F8
    BEQ loc_17_848D              ; $847A  F0 11
    LDX $10                      ; $847C  A6 10
    LDA $906F,X                  ; $847E  BD 6F 90
    CMP $0211,Y                  ; $8481  D9 11 02
    BNE loc_17_848D              ; $8484  D0 07
    LDA #$F8                     ; $8486  A9 F8
    STA $0210,Y                  ; $8488  99 10 02
    BNE loc_17_84EB              ; $848B  D0 5E

loc_17_848D:
    LDX $12                      ; $848D  A6 12
    LDA $9063,X                  ; $848F  BD 63 90
    STA $0210,Y                  ; $8492  99 10 02
    LDX $13                      ; $8495  A6 13
    LDA $9069,X                  ; $8497  BD 69 90
    STA $0213,Y                  ; $849A  99 13 02
    LDX $10                      ; $849D  A6 10
    LDA $906F,X                  ; $849F  BD 6F 90
    STA $0211,Y                  ; $84A2  99 11 02
    LDA $9071,X                  ; $84A5  BD 71 90
    STA $0212,Y                  ; $84A8  99 12 02
    BNE loc_17_84EB              ; $84AB  D0 3E

loc_17_84AD:
    LDA $14                      ; $84AD  A5 14
    AND #$03                     ; $84AF  29 03
    BEQ loc_17_84CD              ; $84B1  F0 1A
    AND #$02                     ; $84B3  29 02
    TAY                          ; $84B5  A8
    LDA #$27                     ; $84B6  A9 27
    JSR sub_1F_EC5D              ; $84B8  20 5D EC
    LDA $13                      ; $84BB  A5 13
    CLC                          ; $84BD  18
    ADC $9059,Y                  ; $84BE  79 59 90
    STA $13                      ; $84C1  85 13
    CMP #$06                     ; $84C3  C9 06
    BCC loc_17_84CD              ; $84C5  90 06
    CLC                          ; $84C7  18
    ADC $905A,Y                  ; $84C8  79 5A 90
    STA $13                      ; $84CB  85 13

loc_17_84CD:
    LDA $14                      ; $84CD  A5 14
    AND #$0C                     ; $84CF  29 0C
    BEQ loc_17_84EB              ; $84D1  F0 18
    TAY                          ; $84D3  A8
    LDA #$27                     ; $84D4  A9 27
    JSR sub_1F_EC5D              ; $84D6  20 5D EC
    LDA $12                      ; $84D9  A5 12
    CLC                          ; $84DB  18
    ADC $9059,Y                  ; $84DC  79 59 90
    STA $12                      ; $84DF  85 12
    CMP #$06                     ; $84E1  C9 06
    BCC loc_17_84EB              ; $84E3  90 06
    CLC                          ; $84E5  18
    ADC $905A,Y                  ; $84E6  79 5A 90
    STA $12                      ; $84E9  85 12

loc_17_84EB:
    LDX $12                      ; $84EB  A6 12
    LDA $904D,X                  ; $84ED  BD 4D 90
    STA $00                      ; $84F0  85 00
    LDX $13                      ; $84F2  A6 13
    LDA $9053,X                  ; $84F4  BD 53 90
    STA $01                      ; $84F7  85 01
    LDX #$00                     ; $84F9  A2 00
    LDY #$00                     ; $84FB  A0 00

loc_17_84FD:
    LDA $903D,X                  ; $84FD  BD 3D 90
    CLC                          ; $8500  18
    ADC $00                      ; $8501  65 00
    STA $0200,Y                  ; $8503  99 00 02
    LDA $9045,X                  ; $8506  BD 45 90
    CLC                          ; $8509  18
    ADC $01                      ; $850A  65 01
    STA $0203,Y                  ; $850C  99 03 02
    INX                          ; $850F  E8
    INY                          ; $8510  C8
    INY                          ; $8511  C8
    INY                          ; $8512  C8
    INY                          ; $8513  C8
    CPY #$10                     ; $8514  C0 10
    BNE loc_17_84FD              ; $8516  D0 E5
    JSR sub_17_851E              ; $8518  20 1E 85
    JMP loc_17_844A              ; $851B  4C 4A 84


sub_17_851E:
    LDA $9D                      ; $851E  A5 9D
    INC $9D                      ; $8520  E6 9D
    LSR A                        ; $8522  4A
    LSR A                        ; $8523  4A
    LSR A                        ; $8524  4A
    BCS loc_17_8535              ; $8525  B0 0E
    LDA #$F8                     ; $8527  A9 F8
    STA $0200                    ; $8529  8D 00 02
    STA $0204                    ; $852C  8D 04 02
    STA $0208                    ; $852F  8D 08 02
    STA $020C                    ; $8532  8D 0C 02

loc_17_8535:
    JSR sub_1F_FF22              ; $8535  20 22 FF
    JMP sub_1E_C2E5              ; $8538  4C E5 C2


loc_17_853B:
    JSR sub_17_866A              ; $853B  20 6A 86
    JSR sub_17_87B9              ; $853E  20 B9 87
    LDX #$03                     ; $8541  A2 03
    JSR sub_17_884A              ; $8543  20 4A 88
    LDA #$13                     ; $8546  A9 13
    JSR sub_1F_EC5B              ; $8548  20 5B EC
    LDA #$AF                     ; $854B  A9 AF
    STA $0200                    ; $854D  8D 00 02
    LDA #$8F                     ; $8550  A9 8F
    STA $0201                    ; $8552  8D 01 02
    LDA #$01                     ; $8555  A9 01
    STA $0202                    ; $8557  8D 02 02
    LDA #$48                     ; $855A  A9 48
    STA $0203                    ; $855C  8D 03 02
    JSR sub_1E_C3EB              ; $855F  20 EB C3

loc_17_8562:
    JSR sub_1E_C2E5              ; $8562  20 E5 C2
    JSR sub_1F_FF22              ; $8565  20 22 FF
    LDA $14                      ; $8568  A5 14
    AND #$90                     ; $856A  29 90
    BNE loc_17_8583              ; $856C  D0 15
    LDA $14                      ; $856E  A5 14
    AND #$0C                     ; $8570  29 0C
    BEQ loc_17_8562              ; $8572  F0 EE
    LDA #$27                     ; $8574  A9 27
    JSR sub_1F_EC5D              ; $8576  20 5D EC
    LDA $0200                    ; $8579  AD 00 02
    EOR #$10                     ; $857C  49 10
    STA $0200                    ; $857E  8D 00 02
    BNE loc_17_8562              ; $8581  D0 DF

loc_17_8583:
    LDA $0200                    ; $8583  AD 00 02
    CMP #$AF                     ; $8586  C9 AF
    BNE loc_17_8590              ; $8588  D0 06
    JSR sub_17_865A              ; $858A  20 5A 86
    JMP loc_17_80E1              ; $858D  4C E1 80


loc_17_8590:
    JSR sub_17_865A              ; $8590  20 5A 86
    LDA #$00                     ; $8593  A9 00
    STA $69                      ; $8595  85 69

loc_17_8597:
    LDA $6C                      ; $8597  A5 6C
    STA $26                      ; $8599  85 26
    RTS                          ; $859B  60


loc_17_859C:
    LDA $BF                      ; $859C  A5 BF
    BEQ loc_17_85E2              ; $859E  F0 42
    DEC $BF                      ; $85A0  C6 BF
    LDA #$00                     ; $85A2  A9 00
    STA $F9                      ; $85A4  85 F9
    STA $29                      ; $85A6  85 29
    STA $68                      ; $85A8  85 68
    LDA $6C                      ; $85AA  A5 6C
    ASL A                        ; $85AC  0A
    STA $00                      ; $85AD  85 00
    ASL A                        ; $85AF  0A
    ADC $00                      ; $85B0  65 00
    TAY                          ; $85B2  A8
    LDA $69                      ; $85B3  A5 69
    CMP $9169,Y                  ; $85B5  D9 69 91
    BCC loc_17_8597              ; $85B8  90 DD
    LDA $9169,Y                  ; $85BA  B9 69 91
    STA $F9                      ; $85BD  85 F9
    LDA $916A,Y                  ; $85BF  B9 6A 91
    STA $29                      ; $85C2  85 29
    LDA $916B,Y                  ; $85C4  B9 6B 91
    STA $68                      ; $85C7  85 68
    LDA $69                      ; $85C9  A5 69
    CMP $916C,Y                  ; $85CB  D9 6C 91
    BCC loc_17_8597              ; $85CE  90 C7
    LDA $916C,Y                  ; $85D0  B9 6C 91
    STA $F9                      ; $85D3  85 F9
    LDA $916D,Y                  ; $85D5  B9 6D 91
    STA $29                      ; $85D8  85 29
    LDA $916E,Y                  ; $85DA  B9 6E 91
    STA $68                      ; $85DD  85 68
    JMP loc_17_8597              ; $85DF  4C 97 85


loc_17_85E2:
    LDA #$00                     ; $85E2  A9 00
    STA $69                      ; $85E4  85 69
    LDA #$02                     ; $85E6  A9 02
    STA $BF                      ; $85E8  85 BF
    JSR sub_1F_F465              ; $85EA  20 65 F4
    JSR sub_17_866A              ; $85ED  20 6A 86
    JSR sub_17_87B9              ; $85F0  20 B9 87
    LDX #$02                     ; $85F3  A2 02
    STX $BF                      ; $85F5  86 BF
    JSR sub_17_884A              ; $85F7  20 4A 88
    LDA #$12                     ; $85FA  A9 12
    JSR sub_1F_EC5B              ; $85FC  20 5B EC
    JSR sub_1E_C3EB              ; $85FF  20 EB C3
    LDA #$00                     ; $8602  A9 00
    STA $14                      ; $8604  85 14
    STA $10                      ; $8606  85 10
    STA $6B                      ; $8608  85 6B

loc_17_860A:
    LDA $14                      ; $860A  A5 14
    AND #$C0                     ; $860C  29 C0
    BNE loc_17_861A              ; $860E  D0 0A
    JSR sub_1E_C2E5              ; $8610  20 E5 C2
    JSR sub_1F_FF22              ; $8613  20 22 FF
    DEC $10                      ; $8616  C6 10
    BNE loc_17_860A              ; $8618  D0 F0

loc_17_861A:
    LDA #$AF                     ; $861A  A9 AF
    STA $0200                    ; $861C  8D 00 02
    LDA #$8F                     ; $861F  A9 8F
    STA $0201                    ; $8621  8D 01 02
    LDA #$01                     ; $8624  A9 01
    STA $0202                    ; $8626  8D 02 02
    LDA #$48                     ; $8629  A9 48
    STA $0203                    ; $862B  8D 03 02
    LDA #$13                     ; $862E  A9 13
    JSR sub_1F_EC5B              ; $8630  20 5B EC
    LDA $6C                      ; $8633  A5 6C
    CMP #$08                     ; $8635  C9 08
    BCS loc_17_8641              ; $8637  B0 08
    LDX #$03                     ; $8639  A2 03
    JSR sub_17_884A              ; $863B  20 4A 88
    JMP loc_17_8562              ; $863E  4C 62 85


loc_17_8641:
    LDX #$04                     ; $8641  A2 04
    JSR sub_17_884A              ; $8643  20 4A 88
    LDA #$B7                     ; $8646  A9 B7
    STA $0200                    ; $8648  8D 00 02

loc_17_864B:
    JSR sub_1E_C2E5              ; $864B  20 E5 C2
    JSR sub_1F_FF22              ; $864E  20 22 FF
    LDA $14                      ; $8651  A5 14
    AND #$90                     ; $8653  29 90
    BEQ loc_17_864B              ; $8655  F0 F4
    JMP loc_17_8590              ; $8657  4C 90 85


sub_17_865A:
    LDY #$0C                     ; $865A  A0 0C

loc_17_865C:
    LDA $00B0,Y                  ; $865C  B9 B0 00
    BPL loc_17_8666              ; $865F  10 05
    LDA #$9C                     ; $8661  A9 9C
    STA $00B0,Y                  ; $8663  99 B0 00

loc_17_8666:
    DEY                          ; $8666  88
    BPL loc_17_865C              ; $8667  10 F3
    RTS                          ; $8669  60


sub_17_866A:
    JSR sub_1E_C3F1              ; $866A  20 F1 C3
    JSR sub_1E_C3B8              ; $866D  20 B8 C3
    JSR sub_1E_C39D              ; $8670  20 9D C3
    JSR sub_1E_C38F              ; $8673  20 8F C3
    JSR sub_1F_FF22              ; $8676  20 22 FF
    JSR sub_1E_C2D1              ; $8679  20 D1 C2
    JSR sub_1F_F3F2              ; $867C  20 F2 F3
    LDA #$01                     ; $867F  A9 01
    JSR sub_1F_FFB7              ; $8681  20 B7 FF
    LDA #$10                     ; $8684  A9 10
    STA $26                      ; $8686  85 26
    LDA #$0F                     ; $8688  A9 0F
    STA $27                      ; $868A  85 27
    LDA #$00                     ; $868C  A9 00
    STA $10                      ; $868E  85 10
    STA $05F0                    ; $8690  8D F0 05
    STA $05F1                    ; $8693  8D F1 05
    STA $05F2                    ; $8696  8D F2 05
    STA $05F3                    ; $8699  8D F3 05
    LDA #$01                     ; $869C  A9 01
    STA $23                      ; $869E  85 23
    JSR sub_1E_DAFC              ; $86A0  20 FC DA
    LDY #$72                     ; $86A3  A0 72
    JSR sub_17_89FC              ; $86A5  20 FC 89
    JMP sub_1E_C2DB              ; $86A8  4C DB C2


loc_17_86AB:
    LDY #$10                     ; $86AB  A0 10
    LDA #$00                     ; $86AD  A9 00
    STA $00                      ; $86AF  85 00
    STA $01                      ; $86B1  85 01
    STA $02                      ; $86B3  85 02

loc_17_86B5:
    LDA $0200,Y                  ; $86B5  B9 00 02
    CMP #$F8                     ; $86B8  C9 F8
    BEQ loc_17_86CD              ; $86BA  F0 11
    INC $00                      ; $86BC  E6 00
    LDA $0201,Y                  ; $86BE  B9 01 02
    CMP #$8B                     ; $86C1  C9 8B
    BEQ loc_17_86C9              ; $86C3  F0 04
    INC $02                      ; $86C5  E6 02
    BNE loc_17_86D2              ; $86C7  D0 09

loc_17_86C9:
    INC $01                      ; $86C9  E6 01
    BNE loc_17_86D2              ; $86CB  D0 05

loc_17_86CD:
    LDA #$00                     ; $86CD  A9 00
    STA $0201,Y                  ; $86CF  99 01 02

loc_17_86D2:
    INY                          ; $86D2  C8
    INY                          ; $86D3  C8
    INY                          ; $86D4  C8
    INY                          ; $86D5  C8
    BNE loc_17_86B5              ; $86D6  D0 DD
    LDA $00                      ; $86D8  A5 00
    CMP #$06                     ; $86DA  C9 06
    BNE loc_17_8728              ; $86DC  D0 4A
    LDA $01                      ; $86DE  A5 01
    CMP #$03                     ; $86E0  C9 03
    BNE loc_17_8728              ; $86E2  D0 44
    LDY #$02                     ; $86E4  A0 02
    STY $00                      ; $86E6  84 00

loc_17_86E8:
    LDY $00                      ; $86E8  A4 00
    LDX $90E0,Y                  ; $86EA  BE E0 90
    STX $02                      ; $86ED  86 02
    LDA $90E3,X                  ; $86EF  BD E3 90
    STA $01                      ; $86F2  85 01
    STA $03                      ; $86F4  85 03
    CLC                          ; $86F6  18
    ADC $02                      ; $86F7  65 02
    STA $02                      ; $86F9  85 02
    TAX                          ; $86FB  AA

loc_17_86FC:
    LDY $90E4,X                  ; $86FC  BC E4 90
    LDA $0211,Y                  ; $86FF  B9 11 02
    CMP #$8B                     ; $8702  C9 8B
    BEQ loc_17_870D              ; $8704  F0 07
    DEX                          ; $8706  CA
    DEC $01                      ; $8707  C6 01
    BPL loc_17_86FC              ; $8709  10 F1
    BMI loc_17_8728              ; $870B  30 1B

loc_17_870D:
    LDY $90FB,X                  ; $870D  BC FB 90
    LDA $0211,Y                  ; $8710  B9 11 02
    CMP #$8C                     ; $8713  C9 8C
    BEQ loc_17_872B              ; $8715  F0 14
    LDX $02                      ; $8717  A6 02

loc_17_8719:
    LDY $90E4,X                  ; $8719  BC E4 90
    LDA $0211,Y                  ; $871C  B9 11 02
    CMP #$8C                     ; $871F  C9 8C
    BEQ loc_17_872F              ; $8721  F0 0C
    DEX                          ; $8723  CA
    DEC $03                      ; $8724  C6 03
    BPL loc_17_8719              ; $8726  10 F1

loc_17_8728:
    JMP loc_17_878E              ; $8728  4C 8E 87


loc_17_872B:
    LDA $01                      ; $872B  A5 01
    STA $03                      ; $872D  85 03

loc_17_872F:
    LDY $00                      ; $872F  A4 00
    LDA $01                      ; $8731  A5 01
    STA $0004,Y                  ; $8733  99 04 00
    LDA $03                      ; $8736  A5 03
    STA $0007,Y                  ; $8738  99 07 00
    DEC $00                      ; $873B  C6 00
    BPL loc_17_86E8              ; $873D  10 A9
    LDA #$28                     ; $873F  A9 28
    JSR sub_1F_EC5D              ; $8741  20 5D EC
    LDY #$06                     ; $8744  A0 06

loc_17_8746:
    ASL $04                      ; $8746  06 04
    ASL $07                      ; $8748  06 07
    CPY #$04                     ; $874A  C0 04
    BCS loc_17_8752              ; $874C  B0 04
    ASL $05                      ; $874E  06 05
    ASL $08                      ; $8750  06 08

loc_17_8752:
    DEY                          ; $8752  88
    BNE loc_17_8746              ; $8753  D0 F1
    LDA $04                      ; $8755  A5 04
    ORA $05                      ; $8757  05 05
    ORA $06                      ; $8759  05 06
    STA $6E                      ; $875B  85 6E
    STA $00                      ; $875D  85 00
    STA $67                      ; $875F  85 67
    LDY #$00                     ; $8761  A0 00

loc_17_8763:
    LSR $00                      ; $8763  46 00
    BCC loc_17_8775              ; $8765  90 0E
    LDA #$9C                     ; $8767  A9 9C
    LDX $9111,Y                  ; $8769  BE 11 91
    STA $B0,X                    ; $876C  95 B0
    LDX $9112,Y                  ; $876E  BE 12 91
    BEQ loc_17_8775              ; $8771  F0 02
    STA $B0,X                    ; $8773  95 B0

loc_17_8775:
    INY                          ; $8775  C8
    INY                          ; $8776  C8
    CPY #$10                     ; $8777  C0 10
    BNE loc_17_8763              ; $8779  D0 E8
    LDA $07                      ; $877B  A5 07
    ORA $08                      ; $877D  05 08
    ORA $09                      ; $877F  05 09
    STA $6D                      ; $8781  85 6D
    CMP #$FF                     ; $8783  C9 FF
    BNE loc_17_878B              ; $8785  D0 04
    LDA #$9C                     ; $8787  A9 9C
    STA $BC                      ; $8789  85 BC

loc_17_878B:
    JMP loc_17_80E1              ; $878B  4C E1 80


loc_17_878E:
    LDA #$2E                     ; $878E  A9 2E
    JSR sub_1F_EC5D              ; $8790  20 5D EC
    LDX #$01                     ; $8793  A2 01
    JSR sub_17_884A              ; $8795  20 4A 88

loc_17_8798:
    LDA #$73                     ; $8798  A9 73
    STA $0200                    ; $879A  8D 00 02
    STA $0204                    ; $879D  8D 04 02
    LDA #$7B                     ; $87A0  A9 7B
    STA $0208                    ; $87A2  8D 08 02
    STA $020C                    ; $87A5  8D 0C 02
    JSR sub_17_851E              ; $87A8  20 1E 85
    LDA $14                      ; $87AB  A5 14
    AND #$C0                     ; $87AD  29 C0
    BEQ loc_17_8798              ; $87AF  F0 E7
    LDX #$00                     ; $87B1  A2 00
    JSR sub_17_884A              ; $87B3  20 4A 88
    JMP loc_17_83D0              ; $87B6  4C D0 83


sub_17_87B9:
    LDA $6E                      ; $87B9  A5 6E
    STA $04                      ; $87BB  85 04
    STA $05                      ; $87BD  85 05
    STA $06                      ; $87BF  85 06
    LDA $6D                      ; $87C1  A5 6D
    STA $07                      ; $87C3  85 07
    STA $08                      ; $87C5  85 08
    STA $09                      ; $87C7  85 09
    LDY #$06                     ; $87C9  A0 06

loc_17_87CB:
    LSR $04                      ; $87CB  46 04
    LSR $07                      ; $87CD  46 07
    CPY #$04                     ; $87CF  C0 04
    BCS loc_17_87D7              ; $87D1  B0 04
    LSR $05                      ; $87D3  46 05
    LSR $08                      ; $87D5  46 08

loc_17_87D7:
    DEY                          ; $87D7  88
    BNE loc_17_87CB              ; $87D8  D0 F1
    LDY #$06                     ; $87DA  A0 06

loc_17_87DC:
    LDA $0004,Y                  ; $87DC  B9 04 00
    AND #$07                     ; $87DF  29 07
    STA $0004,Y                  ; $87E1  99 04 00
    DEY                          ; $87E4  88
    BNE loc_17_87DC              ; $87E5  D0 F5
    LDA #$02                     ; $87E7  A9 02
    STA $00                      ; $87E9  85 00

loc_17_87EB:
    LDY $00                      ; $87EB  A4 00
    LDA $90E0,Y                  ; $87ED  B9 E0 90
    CLC                          ; $87F0  18
    ADC $0004,Y                  ; $87F1  79 04 00
    TAX                          ; $87F4  AA
    LDA $90E4,X                  ; $87F5  BD E4 90
    TAY                          ; $87F8  A8
    LSR A                        ; $87F9  4A
    TAX                          ; $87FA  AA
    LDA #$8B                     ; $87FB  A9 8B
    STA $0211,Y                  ; $87FD  99 11 02
    LDA #$03                     ; $8800  A9 03
    STA $0212,Y                  ; $8802  99 12 02
    LDA $9121,X                  ; $8805  BD 21 91
    STA $0210,Y                  ; $8808  99 10 02
    LDA $9122,X                  ; $880B  BD 22 91
    STA $0213,Y                  ; $880E  99 13 02
    LDY $00                      ; $8811  A4 00
    LDA $0007,Y                  ; $8813  B9 07 00
    CLC                          ; $8816  18
    ADC $90E0,Y                  ; $8817  79 E0 90
    TAX                          ; $881A  AA
    LDA $0004,Y                  ; $881B  B9 04 00
    CMP $0007,Y                  ; $881E  D9 07 00
    BNE loc_17_8829              ; $8821  D0 06
    LDA $90FB,X                  ; $8823  BD FB 90
    JMP loc_17_882C              ; $8826  4C 2C 88


loc_17_8829:
    LDA $90E4,X                  ; $8829  BD E4 90

loc_17_882C:
    TAY                          ; $882C  A8
    LSR A                        ; $882D  4A
    TAX                          ; $882E  AA
    LDA #$8C                     ; $882F  A9 8C
    STA $0211,Y                  ; $8831  99 11 02
    LDA #$02                     ; $8834  A9 02
    STA $0212,Y                  ; $8836  99 12 02
    LDA $9121,X                  ; $8839  BD 21 91
    STA $0210,Y                  ; $883C  99 10 02
    LDA $9122,X                  ; $883F  BD 22 91
    STA $0213,Y                  ; $8842  99 13 02
    DEC $00                      ; $8845  C6 00
    BPL loc_17_87EB              ; $8847  10 A2
    RTS                          ; $8849  60


sub_17_884A:
    LDY $9073,X                  ; $884A  BC 73 90
    LDX #$00                     ; $884D  A2 00

loc_17_884F:
    LDA $9078,Y                  ; $884F  B9 78 90
    STA $0780,X                  ; $8852  9D 80 07
    CMP #$FF                     ; $8855  C9 FF
    BEQ loc_17_885D              ; $8857  F0 04
    INY                          ; $8859  C8
    INX                          ; $885A  E8
    BNE loc_17_884F              ; $885B  D0 F2

loc_17_885D:
    STA $19                      ; $885D  85 19
    RTS                          ; $885F  60


loc_17_8860:
    LDA #$00                     ; $8860  A9 00
    STA $95                      ; $8862  85 95
    LDA $6C                      ; $8864  A5 6C
    CMP #$08                     ; $8866  C9 08
    BCC loc_17_887B              ; $8868  90 11
    CMP #$0B                     ; $886A  C9 0B
    BEQ loc_17_8878              ; $886C  F0 0A
    CMP #$0C                     ; $886E  C9 0C
    BCS loc_17_8875              ; $8870  B0 03
    JMP loc_17_9272              ; $8872  4C 72 92


loc_17_8875:
    JMP loc_17_92CD              ; $8875  4C CD 92


loc_17_8878:
    JMP loc_17_9331              ; $8878  4C 31 93


loc_17_887B:
    LDY $6C                      ; $887B  A4 6C
    LDA $F2B2,Y                  ; $887D  B9 B2 F2
    AND $67                      ; $8880  25 67
    BEQ loc_17_8887              ; $8882  F0 03
    JMP loc_17_80E1              ; $8884  4C E1 80


loc_17_8887:
    LDA $6E                      ; $8887  A5 6E
    STA $67                      ; $8889  85 67
    JSR sub_1E_C3F1              ; $888B  20 F1 C3
    JSR sub_1E_C39D              ; $888E  20 9D C3
    JSR sub_1E_C38F              ; $8891  20 8F C3
    JSR sub_1E_C3B8              ; $8894  20 B8 C3
    JSR sub_1F_FF22              ; $8897  20 22 FF
    JSR sub_1E_C2D1              ; $889A  20 D1 C2
    JSR sub_1F_F3F2              ; $889D  20 F2 F3
    LDA #$01                     ; $88A0  A9 01
    JSR sub_1F_FFB7              ; $88A2  20 B7 FF
    LDA #$10                     ; $88A5  A9 10
    STA $26                      ; $88A7  85 26
    LDA #$0F                     ; $88A9  A9 0F
    STA $27                      ; $88AB  85 27
    LDA #$00                     ; $88AD  A9 00
    STA $10                      ; $88AF  85 10
    LDA #$03                     ; $88B1  A9 03
    STA $23                      ; $88B3  85 23
    JSR sub_1E_DAFC              ; $88B5  20 FC DA
    LDA #$08                     ; $88B8  A9 08
    STA $10                      ; $88BA  85 10
    LDA #$04                     ; $88BC  A9 04
    STA $23                      ; $88BE  85 23
    JSR sub_1E_DAFC              ; $88C0  20 FC DA
    LDY #$98                     ; $88C3  A0 98
    JSR sub_17_89FC              ; $88C5  20 FC 89
    LDA #$01                     ; $88C8  A9 01
    STA $0300                    ; $88CA  8D 00 03
    LDX #$00                     ; $88CD  A2 00
    STX $0348                    ; $88CF  8E 48 03
    STX $0390                    ; $88D2  8E 90 03
    STX $0528                    ; $88D5  8E 28 05
    LDA #$1B                     ; $88D8  A9 1B
    JSR sub_1F_EA98              ; $88DA  20 98 EA
    LDA #$6C                     ; $88DD  A9 6C
    STA $0378                    ; $88DF  8D 78 03
    LDA #$80                     ; $88E2  A9 80
    STA $0330                    ; $88E4  8D 30 03
    LDA #$57                     ; $88E7  A9 57
    STA $FA                      ; $88E9  85 FA
    LDA #$CE                     ; $88EB  A9 CE
    STA $9B                      ; $88ED  85 9B
    LDA #$06                     ; $88EF  A9 06
    STA $99                      ; $88F1  85 99
    JSR sub_1E_C2DB              ; $88F3  20 DB C2
    JSR sub_1F_FF22              ; $88F6  20 22 FF
    LDA #$14                     ; $88F9  A9 14
    JSR sub_1F_EC5B              ; $88FB  20 5B EC
    JSR sub_1E_C3EB              ; $88FE  20 EB C3

loc_17_8901:
    INC $95                      ; $8901  E6 95
    DEC $FA                      ; $8903  C6 FA
    DEC $FA                      ; $8905  C6 FA
    DEC $FA                      ; $8907  C6 FA
    DEC $9B                      ; $8909  C6 9B
    DEC $9B                      ; $890B  C6 9B
    DEC $9B                      ; $890D  C6 9B
    DEC $95                      ; $890F  C6 95
    JSR sub_1F_FF22              ; $8911  20 22 FF
    LDA $FA                      ; $8914  A5 FA
    BNE loc_17_8901              ; $8916  D0 E9
    STA $9D                      ; $8918  85 9D
    LDA #$30                     ; $891A  A9 30
    STA $0F                      ; $891C  85 0F
    LDA #$04                     ; $891E  A9 04
    STA $0E                      ; $8920  85 0E
    JSR sub_17_8A3A              ; $8922  20 3A 8A

loc_17_8925:
    LDA $9D                      ; $8925  A5 9D
    AND #$07                     ; $8927  29 07
    BNE loc_17_8948              ; $8929  D0 1D
    LDY #$07                     ; $892B  A0 07

loc_17_892D:
    LDA $0630,Y                  ; $892D  B9 30 06
    SEC                          ; $8930  38
    SBC $0F                      ; $8931  E5 0F
    BCS loc_17_8937              ; $8933  B0 02
    LDA #$0F                     ; $8935  A9 0F

loc_17_8937:
    STA $0610,Y                  ; $8937  99 10 06
    DEY                          ; $893A  88
    BPL loc_17_892D              ; $893B  10 F0
    STY $18                      ; $893D  84 18
    LDA $0F                      ; $893F  A5 0F
    BEQ loc_17_8948              ; $8941  F0 05
    SEC                          ; $8943  38
    SBC #$10                     ; $8944  E9 10
    STA $0F                      ; $8946  85 0F

loc_17_8948:
    JSR sub_17_8A4A              ; $8948  20 4A 8A
    LDA $0540                    ; $894B  AD 40 05
    ORA $0570                    ; $894E  0D 70 05
    BNE loc_17_8925              ; $8951  D0 D2
    DEC $0E                      ; $8953  C6 0E
    BNE loc_17_8925              ; $8955  D0 CE
    STA $9D                      ; $8957  85 9D
    LDA #$02                     ; $8959  A9 02
    STA $0E                      ; $895B  85 0E

loc_17_895D:
    LDA $9D                      ; $895D  A5 9D
    AND #$07                     ; $895F  29 07
    BNE loc_17_898D              ; $8961  D0 2A
    TAY                          ; $8963  A8
    LDX #$20                     ; $8964  A2 20
    LDA $9D                      ; $8966  A5 9D
    AND #$08                     ; $8968  29 08
    BEQ loc_17_8971              ; $896A  F0 05
    LDA $6C                      ; $896C  A5 6C
    ASL A                        ; $896E  0A
    ASL A                        ; $896F  0A
    TAX                          ; $8970  AA

loc_17_8971:
    LDA $8ED7,X                  ; $8971  BD D7 8E
    STA $0610,Y                  ; $8974  99 10 06
    STA $0630,Y                  ; $8977  99 30 06
    LDA $8EFB,Y                  ; $897A  B9 FB 8E
    STA $0614,Y                  ; $897D  99 14 06
    STA $0634,Y                  ; $8980  99 34 06
    INX                          ; $8983  E8
    INY                          ; $8984  C8
    CPY #$04                     ; $8985  C0 04
    BNE loc_17_8971              ; $8987  D0 E8
    LDA #$FF                     ; $8989  A9 FF
    STA $18                      ; $898B  85 18

loc_17_898D:
    JSR sub_17_8A4A              ; $898D  20 4A 8A
    LDA $0540                    ; $8990  AD 40 05
    ORA $0570                    ; $8993  0D 70 05
    BNE loc_17_895D              ; $8996  D0 C5
    DEC $0E                      ; $8998  C6 0E
    BNE loc_17_895D              ; $899A  D0 C1
    LDA #$3C                     ; $899C  A9 3C
    JSR sub_17_8A7D              ; $899E  20 7D 8A
    LDY #$04                     ; $89A1  A0 04

loc_17_89A3:
    LDA $8FDB,Y                  ; $89A3  B9 DB 8F
    STA $0780,Y                  ; $89A6  99 80 07
    DEY                          ; $89A9  88
    BPL loc_17_89A3              ; $89AA  10 F7
    LDX $6C                      ; $89AC  A6 6C
    LDY $8EFF,X                  ; $89AE  BC FF 8E

loc_17_89B1:
    LDA $8F07,Y                  ; $89B1  B9 07 8F
    CMP #$20                     ; $89B4  C9 20
    BEQ loc_17_89DE              ; $89B6  F0 26
    CMP #$5C                     ; $89B8  C9 5C
    BEQ loc_17_89D0              ; $89BA  F0 14
    STA $0783                    ; $89BC  8D 83 07
    PHA                          ; $89BF  48
    LDA #$FF                     ; $89C0  A9 FF
    STA $19                      ; $89C2  85 19
    LDA #$08                     ; $89C4  A9 08
    JSR sub_17_8A7D              ; $89C6  20 7D 8A
    PLA                          ; $89C9  68
    CMP #$2E                     ; $89CA  C9 2E
    BEQ loc_17_89E4              ; $89CC  F0 16
    BNE loc_17_89DE              ; $89CE  D0 0E

loc_17_89D0:
    INY                          ; $89D0  C8
    LDA $8F07,Y                  ; $89D1  B9 07 8F
    STA $0780                    ; $89D4  8D 80 07
    LDA $8F08,Y                  ; $89D7  B9 08 8F
    STA $0781                    ; $89DA  8D 81 07
    INY                          ; $89DD  C8

loc_17_89DE:
    INY                          ; $89DE  C8
    INC $0781                    ; $89DF  EE 81 07
    BNE loc_17_89B1              ; $89E2  D0 CD

loc_17_89E4:
    LDX $8F08,Y                  ; $89E4  BE 08 8F
    LDA #$9C                     ; $89E7  A9 9C
    STA $B0,X                    ; $89E9  95 B0
    LDX $8F09,Y                  ; $89EB  BE 09 8F
    BEQ loc_17_89F4              ; $89EE  F0 04
    LDA #$9C                     ; $89F0  A9 9C
    STA $B0,X                    ; $89F2  95 B0

loc_17_89F4:
    LDA #$B4                     ; $89F4  A9 B4
    JSR sub_17_8A7D              ; $89F6  20 7D 8A
    JMP loc_17_853B              ; $89F9  4C 3B 85


sub_17_89FC:
    LDA $8B74,Y                  ; $89FC  B9 74 8B
    STA $EA                      ; $89FF  85 EA
    LDA $8B75,Y                  ; $8A01  B9 75 8B
    STA $EB                      ; $8A04  85 EB
    LDA $8B76,Y                  ; $8A06  B9 76 8B
    STA $EC                      ; $8A09  85 EC
    LDA $8B77,Y                  ; $8A0B  B9 77 8B
    STA $ED                      ; $8A0E  85 ED
    LDA $8B78,Y                  ; $8A10  B9 78 8B
    STA $EE                      ; $8A13  85 EE
    LDA $8B79,Y                  ; $8A15  B9 79 8B
    STA $EF                      ; $8A18  85 EF
    LDX #$00                     ; $8A1A  A2 00

loc_17_8A1C:
    LDA $8B7A,Y                  ; $8A1C  B9 7A 8B
    STA $0620,X                  ; $8A1F  9D 20 06
    INY                          ; $8A22  C8
    INX                          ; $8A23  E8
    CPX #$20                     ; $8A24  E0 20
    BNE loc_17_8A1C              ; $8A26  D0 F4
    RTS                          ; $8A28  60


sub_17_8A29:
    STA $00                      ; $8A29  85 00
    LDX #$00                     ; $8A2B  A2 00

loc_17_8A2D:
    LDA $8C96,Y                  ; $8A2D  B9 96 8C
    STA $0200,X                  ; $8A30  9D 00 02
    INY                          ; $8A33  C8
    INX                          ; $8A34  E8
    CPX $00                      ; $8A35  E4 00
    BNE loc_17_8A2D              ; $8A37  D0 F4
    RTS                          ; $8A39  60


sub_17_8A3A:
    LDY #$3F                     ; $8A3A  A0 3F

loc_17_8A3C:
    LDA $8FE0,Y                  ; $8A3C  B9 E0 8F
    STA $02C0,Y                  ; $8A3F  99 C0 02
    DEY                          ; $8A42  88
    BPL loc_17_8A3C              ; $8A43  10 F7
    LDA #$49                     ; $8A45  A9 49
    STA $ED                      ; $8A47  85 ED
    RTS                          ; $8A49  60


sub_17_8A4A:
    LDX #$3C                     ; $8A4A  A2 3C

loc_17_8A4C:
    DEC $02C3,X                  ; $8A4C  DE C3 02
    INC $02C0,X                  ; $8A4F  FE C0 02
    LDA $02C0,X                  ; $8A52  BD C0 02
    CMP #$F0                     ; $8A55  C9 F0
    BNE loc_17_8A5E              ; $8A57  D0 05
    LDA #$00                     ; $8A59  A9 00
    STA $02C0,X                  ; $8A5B  9D C0 02

loc_17_8A5E:
    CPX #$20                     ; $8A5E  E0 20
    BCS loc_17_8A74              ; $8A60  B0 12
    DEC $02C3,X                  ; $8A62  DE C3 02
    INC $02C0,X                  ; $8A65  FE C0 02
    LDA $02C0,X                  ; $8A68  BD C0 02
    CMP #$F0                     ; $8A6B  C9 F0
    BNE loc_17_8A74              ; $8A6D  D0 05
    LDA #$00                     ; $8A6F  A9 00
    STA $02C0,X                  ; $8A71  9D C0 02

loc_17_8A74:
    DEX                          ; $8A74  CA
    DEX                          ; $8A75  CA
    DEX                          ; $8A76  CA
    DEX                          ; $8A77  CA
    BPL loc_17_8A4C              ; $8A78  10 D2
    JMP loc_1F_F391              ; $8A7A  4C 91 F3


sub_17_8A7D:
    STA $08                      ; $8A7D  85 08
    STX $09                      ; $8A7F  86 09
    STY $0A                      ; $8A81  84 0A

loc_17_8A83:
    LDA #$00                     ; $8A83  A9 00
    STA $0570                    ; $8A85  8D 70 05
    JSR sub_17_8A4A              ; $8A88  20 4A 8A
    DEC $08                      ; $8A8B  C6 08
    BNE loc_17_8A83              ; $8A8D  D0 F4
    LDX $09                      ; $8A8F  A6 09
    LDY $0A                      ; $8A91  A4 0A
    RTS                          ; $8A93  60


sub_17_8A94:
    LDY #$1C                     ; $8A94  A0 1C

loc_17_8A96:
    LDA $8E52,Y                  ; $8A96  B9 52 8E
    STA $0780,Y                  ; $8A99  99 80 07
    DEY                          ; $8A9C  88
    BPL loc_17_8A96              ; $8A9D  10 F7
    LDA $6E                      ; $8A9F  A5 6E
    STA $00                      ; $8AA1  85 00
    LDA #$0E                     ; $8AA3  A9 0E
    STA $01                      ; $8AA5  85 01

loc_17_8AA7:
    ASL $00                      ; $8AA7  06 00
    BCC loc_17_8AEA              ; $8AA9  90 3F
    LDY $01                      ; $8AAB  A4 01
    LDA $8E6F,Y                  ; $8AAD  B9 6F 8E
    STA $0780                    ; $8AB0  8D 80 07
    STA $0787                    ; $8AB3  8D 87 07
    STA $078E                    ; $8AB6  8D 8E 07
    STA $0795                    ; $8AB9  8D 95 07
    LDA $8E70,Y                  ; $8ABC  B9 70 8E
    STA $0781                    ; $8ABF  8D 81 07
    CLC                          ; $8AC2  18
    ADC #$20                     ; $8AC3  69 20
    STA $0788                    ; $8AC5  8D 88 07
    ADC #$20                     ; $8AC8  69 20
    STA $078F                    ; $8ACA  8D 8F 07
    ADC #$20                     ; $8ACD  69 20
    STA $0796                    ; $8ACF  8D 96 07
    LDX $8E7F,Y                  ; $8AD2  BE 7F 8E
    LDA $8E80,Y                  ; $8AD5  B9 80 8E
    STA $02                      ; $8AD8  85 02
    LDA #$F8                     ; $8ADA  A9 F8

loc_17_8ADC:
    STA $0200,X                  ; $8ADC  9D 00 02
    INX                          ; $8ADF  E8
    INX                          ; $8AE0  E8
    INX                          ; $8AE1  E8
    INX                          ; $8AE2  E8
    DEC $02                      ; $8AE3  C6 02
    BNE loc_17_8ADC              ; $8AE5  D0 F5
    JSR sub_1E_C298              ; $8AE7  20 98 C2

loc_17_8AEA:
    DEC $01                      ; $8AEA  C6 01
    DEC $01                      ; $8AEC  C6 01
    BPL loc_17_8AA7              ; $8AEE  10 B7
    RTS                          ; $8AF0  60


sub_17_8AF1:
    LDA $6E                      ; $8AF1  A5 6E
    CMP #$FF                     ; $8AF3  C9 FF
    BNE loc_17_8B2D              ; $8AF5  D0 36
    LDA #$10                     ; $8AF7  A9 10
    STA $9D                      ; $8AF9  85 9D

loc_17_8AFB:
    LDA $0610                    ; $8AFB  AD 10 06
    EOR #$3F                     ; $8AFE  49 3F
    STA $0610                    ; $8B00  8D 10 06
    LDA #$FF                     ; $8B03  A9 FF
    STA $18                      ; $8B05  85 18
    LDA #$02                     ; $8B07  A9 02
    JSR sub_1F_FF24              ; $8B09  20 24 FF
    DEC $9D                      ; $8B0C  C6 9D
    BNE loc_17_8AFB              ; $8B0E  D0 EB
    LDY #$21                     ; $8B10  A0 21

loc_17_8B12:
    LDA $8E8F,Y                  ; $8B12  B9 8F 8E
    STA $0780,Y                  ; $8B15  99 80 07
    DEY                          ; $8B18  88
    BPL loc_17_8B12              ; $8B19  10 F7
    STY $19                      ; $8B1B  84 19
    LDX #$20                     ; $8B1D  A2 20
    LDY #$00                     ; $8B1F  A0 00

loc_17_8B21:
    LDA $8EB1,Y                  ; $8B21  B9 B1 8E
    STA $0200,X                  ; $8B24  9D 00 02
    INX                          ; $8B27  E8
    INY                          ; $8B28  C8
    CPY #$20                     ; $8B29  C0 20
    BNE loc_17_8B21              ; $8B2B  D0 F4

loc_17_8B2D:
    RTS                          ; $8B2D  60


sub_17_8B2E:
    LDY #$1C                     ; $8B2E  A0 1C

loc_17_8B30:
    LDA $8E52,Y                  ; $8B30  B9 52 8E
    STA $0780,Y                  ; $8B33  99 80 07
    STA $079C,Y                  ; $8B36  99 9C 07
    STA $07B8,Y                  ; $8B39  99 B8 07
    DEY                          ; $8B3C  88
    BPL loc_17_8B30              ; $8B3D  10 F1
    LDX #$38                     ; $8B3F  A2 38
    LDY #$04                     ; $8B41  A0 04

loc_17_8B43:
    LDA $8ED1,Y                  ; $8B43  B9 D1 8E
    STA $0780,X                  ; $8B46  9D 80 07
    STA $0787,X                  ; $8B49  9D 87 07
    STA $078E,X                  ; $8B4C  9D 8E 07
    STA $0795,X                  ; $8B4F  9D 95 07
    LDA $8ED2,Y                  ; $8B52  B9 D2 8E
    STA $0781,X                  ; $8B55  9D 81 07
    CLC                          ; $8B58  18
    ADC #$20                     ; $8B59  69 20
    STA $0788,X                  ; $8B5B  9D 88 07
    ADC #$20                     ; $8B5E  69 20
    STA $078F,X                  ; $8B60  9D 8F 07
    ADC #$20                     ; $8B63  69 20
    STA $0796,X                  ; $8B65  9D 96 07
    TXA                          ; $8B68  8A
    SEC                          ; $8B69  38
    SBC #$1C                     ; $8B6A  E9 1C
    TAX                          ; $8B6C  AA
    DEY                          ; $8B6D  88
    DEY                          ; $8B6E  88
    BPL loc_17_8B43              ; $8B6F  10 D2
    STY $19                      ; $8B71  84 19
    RTS                          ; $8B73  60

    .byte $C4,$C6,$00,$00,$08,$00,$0F,$21,$20,$11,$0F,$26,$20,$16,$0F,$26  ; $8B74
    .byte $28,$16,$0F,$17,$27,$06,$0F,$00,$00,$00,$0F,$00,$00,$00,$0F,$11  ; $8B84
    .byte $21,$16,$0F,$00,$00,$00,$C8,$CA,$00,$00,$08,$09,$0F,$20,$21,$11  ; $8B94
    .byte $0F,$20,$2A,$1A,$0F,$20,$27,$17,$0F,$20,$26,$16,$0F,$0F,$36,$26  ; $8BA4
    .byte $0F,$0F,$20,$36,$0F,$26,$2C,$11,$0F,$27,$36,$26,$CC,$CE,$00,$00  ; $8BB4
    .byte $00,$00,$0F,$27,$38,$02,$0F,$17,$27,$02,$0F,$20,$32,$22,$0F,$0F  ; $8BC4
    .byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F  ; $8BD4
    .byte $0F,$0F,$D0,$D2,$00,$00,$08,$00,$0F,$20,$2C,$1C,$0F,$20,$16,$06  ; $8BE4
    .byte $0F,$1C,$0C,$01,$0F,$20,$11,$02,$0F,$0F,$0F,$0F,$0F,$0F,$20,$36  ; $8BF4
    .byte $0F,$0F,$20,$11,$0F,$0F,$20,$16,$D2,$00,$00,$00,$00,$00,$0F,$20  ; $8C04
    .byte $26,$17,$0F,$20,$26,$17,$0F,$0F,$0F,$0B,$0F,$20,$0F,$0F,$0F,$0F  ; $8C14
    .byte $2C,$11,$0F,$0F,$20,$37,$0F,$00,$00,$00,$0F,$00,$00,$00,$0F,$20  ; $8C24
    .byte $2C,$1C,$0F,$31,$1C,$27,$0F,$31,$1C,$01,$0F,$20,$0F,$0F,$0F,$0F  ; $8C34
    .byte $2C,$11,$0F,$0F,$20,$37,$0F,$0F,$20,$11,$0F,$0F,$20,$15,$0F,$0F  ; $8C44
    .byte $20,$2C,$0F,$0F,$27,$11,$0F,$0F,$20,$16,$0F,$0F,$38,$27,$0F,$0F  ; $8C54
    .byte $20,$26,$0F,$0F,$20,$29,$0F,$0F,$20,$28,$0F,$0F,$27,$17,$0F,$0F  ; $8C64
    .byte $10,$16,$0F,$0F,$20,$26,$0F,$0F,$20,$15,$0F,$0F,$27,$12,$0F,$0F  ; $8C74
    .byte $20,$2C,$0F,$0F,$20,$1A,$78,$78,$78,$76,$74,$C8,$40,$30,$20,$10  ; $8C84
    .byte $00,$00,$A7,$86,$02,$28,$F8,$90,$02,$C0,$F8,$A0,$02,$C0,$F8,$B0  ; $8C94
    .byte $02,$C0,$57,$8D,$01,$68,$57,$8D,$01,$6F,$57,$8D,$01,$88,$57,$8D  ; $8CA4
    .byte $01,$8F,$7F,$8D,$01,$68,$7F,$8D,$01,$6F,$7F,$8D,$01,$88,$7F,$8D  ; $8CB4
    .byte $01,$8F,$67,$91,$00,$74,$67,$91,$40,$84,$6F,$92,$00,$74,$6F,$93  ; $8CC4
    .byte $00,$7C,$6F,$94,$00,$84,$77,$95,$00,$74,$77,$96,$00,$7C,$77,$97  ; $8CD4
    .byte $00,$84,$27,$AD,$03,$2C,$2F,$AE,$03,$28,$2F,$AF,$03,$30,$1F,$B3  ; $8CE4
    .byte $02,$78,$1F,$B4,$02,$80,$2F,$B5,$03,$78,$2F,$B6,$03,$80,$37,$B7  ; $8CF4
    .byte $03,$78,$37,$B8,$03,$80,$1F,$B9,$02,$C0,$1F,$BA,$02,$C8,$27,$BB  ; $8D04
    .byte $02,$C0,$27,$BC,$02,$C8,$2F,$BD,$03,$C8,$2F,$BE,$03,$D0,$37,$BF  ; $8D14
    .byte $02,$C8,$5F,$C0,$02,$38,$77,$C1,$03,$28,$77,$C2,$03,$30,$5F,$C3  ; $8D24
    .byte $03,$C8,$5F,$C4,$03,$D0,$67,$C5,$03,$C8,$67,$C6,$03,$D0,$6F,$C7  ; $8D34
    .byte $03,$C8,$6F,$C8,$03,$D0,$9F,$C9,$03,$20,$9F,$CA,$03,$28,$9F,$CB  ; $8D44
    .byte $03,$38,$A7,$CC,$03,$28,$A7,$CD,$03,$30,$AF,$CE,$03,$28,$AF,$CF  ; $8D54
    .byte $03,$30,$A7,$D3,$02,$88,$AF,$D0,$03,$78,$AF,$D1,$03,$80,$AF,$D4  ; $8D64
    .byte $02,$88,$B7,$D2,$03,$78,$9F,$D5,$03,$C8,$A7,$D6,$03,$C8,$AF,$D7  ; $8D74
    .byte $03,$C8,$B7,$D8,$03,$C8,$17,$57,$97,$18,$68,$B8,$FF,$01,$03,$FD  ; $8D84
    .byte $00,$00,$00,$00,$28,$28,$28,$28,$00,$07,$20,$27,$00,$07,$20,$27  ; $8D94
    .byte $02,$00,$07,$05,$08,$06,$01,$04,$03,$30,$70,$B0,$30,$80,$D0,$03  ; $8DA4
    .byte $30,$10,$0D,$3E,$20,$3A,$1F,$0C,$10,$09,$1D,$1E,$0C,$09,$15,$00  ; $8DB4
    .byte $04,$00,$04,$00,$00,$04,$00,$2A,$0A,$00,$00,$FF,$20,$47,$52,$41  ; $8DC4
    .byte $56,$49,$54,$59,$20,$4D,$41,$4E,$20,$20,$20,$20,$20,$20,$57,$41  ; $8DD4
    .byte $56,$45,$20,$4D,$41,$4E,$20,$20,$20,$20,$20,$20,$20,$20,$53,$54  ; $8DE4
    .byte $4F,$4E,$45,$20,$4D,$41,$4E,$20,$20,$20,$20,$20,$20,$20,$47,$59  ; $8DF4
    .byte $52,$4F,$20,$4D,$41,$4E,$20,$20,$20,$20,$20,$20,$20,$20,$53,$54  ; $8E04
    .byte $41,$52,$20,$4D,$41,$4E,$20,$20,$20,$20,$20,$20,$20,$43,$48,$41  ; $8E14
    .byte $52,$47,$45,$20,$4D,$41,$4E,$20,$20,$20,$20,$20,$20,$4E,$41,$50  ; $8E24
    .byte $41,$4C,$4D,$20,$4D,$41,$4E,$20,$20,$20,$20,$20,$20,$43,$52,$59  ; $8E34
    .byte $53,$54,$41,$4C,$20,$4D,$41,$4E,$20,$20,$20,$20,$5B,$5C,$20,$00  ; $8E44
    .byte $03,$00,$00,$00,$00,$20,$00,$03,$00,$00,$00,$00,$20,$00,$03,$00  ; $8E54
    .byte $00,$00,$00,$20,$00,$03,$00,$00,$00,$00,$FF,$20,$8E,$22,$84,$20  ; $8E64
    .byte $84,$22,$98,$22,$8E,$21,$84,$21,$98,$20,$98,$4C,$06,$A4,$07,$40  ; $8E74
    .byte $03,$D4,$04,$C0,$05,$80,$03,$8C,$06,$64,$07,$21,$8E,$03,$10,$11  ; $8E84
    .byte $16,$12,$21,$AE,$03,$20,$21,$26,$17,$21,$CE,$03,$3A,$3B,$0B,$3C  ; $8E94
    .byte $21,$EE,$03,$5C,$5D,$5E,$5F,$23,$DB,$01,$CC,$33,$FF,$67,$D3,$02  ; $8EA4
    .byte $88,$6F,$D9,$00,$70,$6F,$DA,$00,$78,$6F,$DB,$00,$80,$6F,$D4,$02  ; $8EB4
    .byte $88,$77,$DC,$00,$74,$77,$DD,$00,$7C,$F8,$00,$00,$00,$21,$8E,$21  ; $8EC4
    .byte $98,$22,$84,$0F,$0F,$20,$14,$0F,$0F,$20,$11,$0F,$0F,$20,$07,$0F  ; $8ED4
    .byte $0F,$20,$1A,$0F,$0F,$28,$17,$0F,$0F,$20,$26,$0F,$0F,$27,$12,$0F  ; $8EE4
    .byte $0F,$20,$2C,$0F,$0F,$2C,$11,$0F,$0F,$20,$37,$00,$17,$2C,$42,$69  ; $8EF4
    .byte $92,$A8,$BE,$59,$4F,$55,$20,$47,$4F,$54,$20,$47,$52,$41,$56,$49  ; $8F04
    .byte $54,$59,$20,$48,$4F,$4C,$44,$2E,$07,$00,$59,$4F,$55,$20,$47,$4F  ; $8F14
    .byte $54,$20,$57,$41,$54,$45,$52,$20,$57,$41,$56,$45,$2E,$01,$00,$59  ; $8F24
    .byte $4F,$55,$20,$47,$4F,$54,$20,$50,$4F,$57,$45,$52,$20,$53,$54,$4F  ; $8F34
    .byte $4E,$45,$2E,$06,$00,$59,$4F,$55,$20,$47,$4F,$54,$20,$47,$59,$52  ; $8F44
    .byte $4F,$20,$41,$54,$54,$41,$43,$4B,$5C,$2B,$0D,$41,$4E,$44,$5C,$2B  ; $8F54
    .byte $4B,$52,$55,$53,$48,$20,$4A,$45,$54,$2E,$02,$0B,$59,$4F,$55,$20  ; $8F64
    .byte $47,$4F,$54,$20,$53,$54,$41,$52,$20,$43,$52,$41,$53,$48,$5C,$2B  ; $8F74
    .byte $0D,$41,$4E,$44,$5C,$2B,$49,$53,$55,$50,$45,$52,$20,$41,$52,$52  ; $8F84
    .byte $4F,$57,$2E,$05,$09,$59,$4F,$55,$20,$47,$4F,$54,$20,$43,$48,$41  ; $8F94
    .byte $52,$47,$45,$20,$4B,$49,$43,$4B,$2E,$08,$00,$59,$4F,$55,$20,$47  ; $8FA4
    .byte $4F,$54,$20,$4E,$41,$50,$41,$4C,$4D,$20,$42,$4F,$4D,$42,$2E,$04  ; $8FB4
    .byte $00,$59,$4F,$55,$20,$47,$4F,$54,$20,$43,$52,$59,$53,$54,$41,$4C  ; $8FC4
    .byte $20,$45,$59,$45,$2E,$03,$00,$2A,$C6,$00,$00,$FF,$10,$76,$21,$20  ; $8FD4
    .byte $20,$76,$21,$40,$30,$76,$21,$98,$18,$76,$21,$C8,$D0,$76,$21,$10  ; $8FE4
    .byte $B8,$76,$21,$50,$C8,$76,$21,$88,$C0,$76,$21,$C8,$30,$77,$21,$20  ; $8FF4
    .byte $18,$77,$21,$60,$08,$77,$21,$B0,$28,$77,$21,$D8,$C8,$77,$21,$20  ; $9004
    .byte $E8,$77,$21,$30,$B0,$77,$21,$B8,$E0,$77,$21,$D0,$F8,$00,$00,$00  ; $9014
    .byte $33,$8E,$01,$C4,$33,$8E,$41,$CC,$3B,$8E,$81,$C4,$3B,$8E,$C1,$CC  ; $9024
    .byte $33,$33,$73,$C4,$D4,$C4,$00,$00,$04,$00,$00,$08,$08,$00,$00,$08  ; $9034
    .byte $08,$00,$08,$00,$08,$00,$18,$00,$18,$2B,$3B,$4B,$5B,$6B,$7B,$34  ; $9044
    .byte $44,$54,$64,$74,$84,$01,$FA,$FF,$06,$01,$FA,$00,$00,$FF,$06,$2F  ; $9054
    .byte $3F,$4F,$5F,$6F,$7F,$38,$48,$58,$68,$78,$88,$8C,$8B,$02,$03,$00  ; $9064
    .byte $13,$26,$33,$5A,$22,$E9,$0E,$20,$20,$20,$20,$20,$20,$20,$20,$20  ; $9074
    .byte $20,$20,$20,$20,$20,$20,$FF,$22,$E9,$0E,$50,$41,$53,$53,$20,$57  ; $9084
    .byte $4F,$52,$44,$20,$45,$52,$52,$4F,$52,$FF,$22,$EC,$08,$47,$41,$4D  ; $9094
    .byte $45,$20,$4F,$56,$45,$52,$FF,$22,$CB,$0B,$53,$54,$41,$47,$45,$20  ; $90A4
    .byte $53,$45,$4C,$45,$43,$54,$22,$EC,$08,$20,$20,$20,$20,$20,$20,$20  ; $90B4
    .byte $20,$20,$23,$0B,$07,$43,$4F,$4E,$54,$49,$4E,$55,$45,$FF,$22,$EB  ; $90C4
    .byte $09,$43,$4F,$4E,$54,$49,$4E,$55,$45,$20,$20,$FF,$00,$05,$0E,$03  ; $90D4
    .byte $18,$64,$4C,$30,$07,$50,$0C,$84,$68,$80,$6C,$08,$54,$07,$88,$44  ; $90E4
    .byte $2C,$10,$28,$14,$40,$8C,$03,$78,$04,$04,$78,$07,$20,$3C,$3C,$20  ; $90F4
    .byte $38,$24,$38,$24,$07,$70,$74,$74,$70,$58,$5C,$58,$5C,$07,$00,$01  ; $9104
    .byte $00,$06,$00,$02,$0B,$05,$09,$08,$00,$04,$00,$03,$00,$2F,$38,$2F  ; $9114
    .byte $48,$2F,$58,$2F,$68,$2F,$78,$2F,$88,$3F,$38,$3F,$48,$3F,$58,$3F  ; $9124
    .byte $68,$3F,$78,$3F,$88,$4F,$38,$4F,$48,$4F,$58,$4F,$68,$4F,$78,$4F  ; $9134
    .byte $88,$5F,$38,$5F,$48,$5F,$58,$5F,$68,$5F,$78,$5F,$88,$6F,$38,$6F  ; $9144
    .byte $48,$6F,$58,$6F,$68,$6F,$78,$6F,$88,$7F,$38,$7F,$48,$7F,$58,$7F  ; $9154
    .byte $68,$7F,$78,$7F,$88,$09,$05,$01,$14,$0A,$01,$0B,$07,$02,$42,$0D  ; $9164
    .byte $03,$11,$0C,$04,$20,$13,$05,$0F,$08,$06,$1A,$0E,$06,$08,$03,$07  ; $9174
    .byte $15,$0A,$07,$0B,$03,$08,$1B,$07,$08,$10,$08,$09,$1B,$0D,$0A,$0F  ; $9184
    .byte $07,$0B,$1B,$10,$0C,$0E,$04,$0D,$15,$08,$0D,$0F,$08,$0E,$16,$0B  ; $9194
    .byte $0E,$0E,$07,$0F,$1C,$0C,$0F,$00,$00,$00,$00,$00,$00,$0D,$09,$10  ; $91A4
    .byte $1A,$0E,$13,$0D,$04,$11,$17,$09,$14,$00,$00,$00,$03,$01,$12,$00  ; $91B4
    .byte $00,$00,$00,$00,$00  ; $91C4

sub_17_91C9:
    JSR sub_1E_C3F1              ; $91C9  20 F1 C3
    JSR sub_1E_C39D              ; $91CC  20 9D C3
    JSR sub_1E_C38F              ; $91CF  20 8F C3
    JSR sub_1E_C3B8              ; $91D2  20 B8 C3
    JSR sub_1F_FF22              ; $91D5  20 22 FF
    JSR sub_1E_C2D1              ; $91D8  20 D1 C2
    JSR sub_1F_F3F2              ; $91DB  20 F2 F3
    LDA #$20                     ; $91DE  A9 20
    LDX #$00                     ; $91E0  A2 00
    LDY #$00                     ; $91E2  A0 00
    JSR sub_1E_C343              ; $91E4  20 43 C3
    LDY #$4F                     ; $91E7  A0 4F

loc_17_91E9:
    LDA $9213,Y                  ; $91E9  B9 13 92
    STA $0780,Y                  ; $91EC  99 80 07
    DEY                          ; $91EF  88
    BPL loc_17_91E9              ; $91F0  10 F7
    JSR sub_1E_C298              ; $91F2  20 98 C2
    LDY #$0F                     ; $91F5  A0 0F

loc_17_91F7:
    LDA $9262,Y                  ; $91F7  B9 62 92
    STA $0620,Y                  ; $91FA  99 20 06
    DEY                          ; $91FD  88
    BPL loc_17_91F7              ; $91FE  10 F7
    LDA #$C2                     ; $9200  A9 C2
    STA $EA                      ; $9202  85 EA
    LDA #$C0                     ; $9204  A9 C0
    STA $EB                      ; $9206  85 EB
    JSR sub_1E_C2DB              ; $9208  20 DB C2
    JSR sub_1E_C3EB              ; $920B  20 EB C3
    LDA #$78                     ; $920E  A9 78
    JMP sub_1F_FF24              ; $9210  4C 24 FF

    .byte $21,$04,$16,$F5,$00,$43,$41,$50,$43,$4F,$4D,$20,$43,$4F,$2E,$2C  ; $9213
    .byte $20,$4C,$54,$44,$2E,$20,$31,$39,$39,$32,$21,$43,$19,$F5,$00,$43  ; $9223
    .byte $41,$50,$43,$4F,$4D,$20,$55,$2E,$53,$2E,$41,$2E,$2C,$20,$49,$4E  ; $9233
    .byte $43,$2E,$20,$31,$39,$39,$32,$22,$06,$13,$4C,$49,$43,$45,$4E,$53  ; $9243
    .byte $45,$44,$20,$42,$59,$20,$4E,$49,$4E,$54,$45,$4E,$44,$4F,$FF,$0F  ; $9253
    .byte $20,$0F,$0F,$0F,$20,$0F,$0F,$0F,$20,$0F,$0F,$0F,$20,$0F,$0F  ; $9263

loc_17_9272:
    JSR sub_1E_C3F1              ; $9272  20 F1 C3
    JSR sub_1E_C38F              ; $9275  20 8F C3
    JSR sub_1E_C3B8              ; $9278  20 B8 C3
    JSR sub_1F_F3F2              ; $927B  20 F2 F3
    JSR sub_1F_FF22              ; $927E  20 22 FF
    JSR sub_1E_C2D1              ; $9281  20 D1 C2
    LDY #$00                     ; $9284  A0 00
    JSR sub_17_968A              ; $9286  20 8A 96
    LDA #$00                     ; $9289  A9 00
    STA $10                      ; $928B  85 10
    LDA #$01                     ; $928D  A9 01
    STA $23                      ; $928F  85 23
    JSR sub_1E_DAFC              ; $9291  20 FC DA
    JSR sub_1E_C2DB              ; $9294  20 DB C2
    JSR sub_1F_FF22              ; $9297  20 22 FF
    LDA #$0F                     ; $929A  A9 0F
    JSR sub_1F_EC5B              ; $929C  20 5B EC
    JSR sub_1E_C3EB              ; $929F  20 EB C3
    JSR sub_17_965D              ; $92A2  20 5D 96
    LDA #$08                     ; $92A5  A9 08
    STA $26                      ; $92A7  85 26
    STA $6C                      ; $92A9  85 6C
    LDY #$00                     ; $92AB  A0 00
    LDA #$20                     ; $92AD  A9 20
    STA $9F                      ; $92AF  85 9F
    JSR sub_17_96CA              ; $92B1  20 CA 96
    LDY #$00                     ; $92B4  A0 00
    LDA $6F                      ; $92B6  A5 6F
    AND #$0F                     ; $92B8  29 0F
    JSR sub_17_97A3              ; $92BA  20 A3 97
    JSR sub_17_9601              ; $92BD  20 01 96
    LDA #$3C                     ; $92C0  A9 3C
    JSR sub_17_9614              ; $92C2  20 14 96
    JSR sub_17_97EA              ; $92C5  20 EA 97
    LDA #$B4                     ; $92C8  A9 B4
    JMP sub_17_9614              ; $92CA  4C 14 96


loc_17_92CD:
    JSR sub_1E_C3F1              ; $92CD  20 F1 C3
    JSR sub_1E_C38F              ; $92D0  20 8F C3
    JSR sub_1E_C3B8              ; $92D3  20 B8 C3
    JSR sub_1F_F3F2              ; $92D6  20 F2 F3
    JSR sub_1F_FF22              ; $92D9  20 22 FF
    JSR sub_1E_C2D1              ; $92DC  20 D1 C2
    LDY #$12                     ; $92DF  A0 12
    JSR sub_17_968A              ; $92E1  20 8A 96
    LDA #$00                     ; $92E4  A9 00
    STA $10                      ; $92E6  85 10
    STA $23                      ; $92E8  85 23
    JSR sub_1E_DAFC              ; $92EA  20 FC DA
    LDY #$20                     ; $92ED  A0 20
    LDA #$18                     ; $92EF  A9 18
    JSR sub_17_96CA              ; $92F1  20 CA 96
    JSR sub_1E_C2DB              ; $92F4  20 DB C2
    JSR sub_1F_FF22              ; $92F7  20 22 FF
    JSR sub_1E_C3EB              ; $92FA  20 EB C3

loc_17_92FD:
    LDA #$10                     ; $92FD  A9 10
    JSR sub_1F_EC5B              ; $92FF  20 5B EC
    JSR sub_17_965D              ; $9302  20 5D 96
    LDA #$0C                     ; $9305  A9 0C
    STA $26                      ; $9307  85 26
    STA $6C                      ; $9309  85 6C
    LDY #$20                     ; $930B  A0 20
    LDA #$38                     ; $930D  A9 38
    STA $9F                      ; $930F  85 9F
    JSR sub_17_96CA              ; $9311  20 CA 96
    LDY #$04                     ; $9314  A0 04
    LDA $6F                      ; $9316  A5 6F
    LSR A                        ; $9318  4A
    LSR A                        ; $9319  4A
    LSR A                        ; $931A  4A
    LSR A                        ; $931B  4A
    AND #$0F                     ; $931C  29 0F
    JSR sub_17_97A3              ; $931E  20 A3 97
    JSR sub_17_9601              ; $9321  20 01 96
    LDA #$3C                     ; $9324  A9 3C
    JSR sub_17_9614              ; $9326  20 14 96
    JSR sub_17_97EA              ; $9329  20 EA 97
    LDA #$B4                     ; $932C  A9 B4
    JMP sub_17_9614              ; $932E  4C 14 96


loc_17_9331:
    JSR sub_17_96BB              ; $9331  20 BB 96
    STY $18                      ; $9334  84 18
    LDA #$B4                     ; $9336  A9 B4
    STA $0378                    ; $9338  8D 78 03
    LDA #$38                     ; $933B  A9 38
    STA $0330                    ; $933D  8D 30 03
    JSR sub_1E_C39D              ; $9340  20 9D C3
    JSR sub_1F_F363              ; $9343  20 63 F3
    LDA #$00                     ; $9346  A9 00
    STA $05F2                    ; $9348  8D F2 05
    STA $2D                      ; $934B  85 2D
    STA $2E                      ; $934D  85 2E
    STA $2F                      ; $934F  85 2F
    LDA #$0F                     ; $9351  A9 0F
    STA $A9                      ; $9353  85 A9
    JSR sub_1E_C3F1              ; $9355  20 F1 C3
    LDA #$01                     ; $9358  A9 01
    JSR sub_1F_FFB7              ; $935A  20 B7 FF
    LDA #$06                     ; $935D  A9 06
    STA $23                      ; $935F  85 23
    LDA #$28                     ; $9361  A9 28
    STA $10                      ; $9363  85 10
    JSR sub_1E_DB23              ; $9365  20 23 DB
    LDA #$02                     ; $9368  A9 02
    STA $FD                      ; $936A  85 FD
    LDA #$C2                     ; $936C  A9 C2
    STA $EA                      ; $936E  85 EA
    LDA #$C0                     ; $9370  A9 C0
    STA $EB                      ; $9372  85 EB
    LDA #$20                     ; $9374  A9 20
    STA $0601                    ; $9376  8D 01 06
    JSR sub_17_96BB              ; $9379  20 BB 96
    LDA #$FF                     ; $937C  A9 FF
    STA $18                      ; $937E  85 18
    LDY #$00                     ; $9380  A0 00
    JSR sub_17_96DB              ; $9382  20 DB 96
    LDX #$00                     ; $9385  A2 00
    LDY #$02                     ; $9387  A0 02

loc_17_9389:
    LDA $98D5,Y                  ; $9389  B9 D5 98
    JSR sub_1F_EAA4              ; $938C  20 A4 EA
    LDA #$00                     ; $938F  A9 00
    STA $0528,Y                  ; $9391  99 28 05
    LDA #$6D                     ; $9394  A9 6D
    STA $0300,Y                  ; $9396  99 00 03
    LDA #$C0                     ; $9399  A9 C0
    STA $0330,Y                  ; $939B  99 30 03
    LDA $98D7,Y                  ; $939E  B9 D7 98
    STA $0378,Y                  ; $93A1  99 78 03
    LDA #$80                     ; $93A4  A9 80
    STA $03A8,Y                  ; $93A6  99 A8 03
    LDA #$00                     ; $93A9  A9 00
    STA $03C0,Y                  ; $93AB  99 C0 03
    LDA #$50                     ; $93AE  A9 50
    STA $03D8,Y                  ; $93B0  99 D8 03
    LDA #$00                     ; $93B3  A9 00
    STA $03F0,Y                  ; $93B5  99 F0 03
    DEY                          ; $93B8  88
    BNE loc_17_9389              ; $93B9  D0 CE
    LDA #$3C                     ; $93BB  A9 3C
    JSR sub_17_9754              ; $93BD  20 54 97
    JSR sub_17_976F              ; $93C0  20 6F 97
    LDY #$01                     ; $93C3  A0 01
    JSR sub_17_96DB              ; $93C5  20 DB 96
    LDA #$3C                     ; $93C8  A9 3C
    JSR sub_17_9754              ; $93CA  20 54 97
    JSR sub_17_976F              ; $93CD  20 6F 97
    LDY #$02                     ; $93D0  A0 02
    JSR sub_17_96DB              ; $93D2  20 DB 96
    LDA #$3C                     ; $93D5  A9 3C
    JSR sub_17_9754              ; $93D7  20 54 97
    JSR sub_17_976F              ; $93DA  20 6F 97
    LDA #$0F                     ; $93DD  A9 0F
    STA $0601                    ; $93DF  8D 01 06
    LDA #$FF                     ; $93E2  A9 FF
    STA $18                      ; $93E4  85 18
    JSR sub_1F_FF22              ; $93E6  20 22 FF
    LDY #$12                     ; $93E9  A0 12
    JSR sub_17_968A              ; $93EB  20 8A 96
    LDA #$00                     ; $93EE  A9 00
    STA $EC                      ; $93F0  85 EC
    JSR sub_17_96BB              ; $93F2  20 BB 96
    LDA #$20                     ; $93F5  A9 20
    STA $10                      ; $93F7  85 10
    LDA #$00                     ; $93F9  A9 00
    STA $23                      ; $93FB  85 23
    JSR sub_1E_DB23              ; $93FD  20 23 DB

loc_17_9400:
    LDX #$01                     ; $9400  A2 01
    JSR sub_1F_E94A              ; $9402  20 4A E9
    JSR sub_1F_E90C              ; $9405  20 0C E9
    LDA $0379                    ; $9408  AD 79 03
    SEC                          ; $940B  38
    SBC #$10                     ; $940C  E9 10
    STA $037A                    ; $940E  8D 7A 03
    LDA $0331                    ; $9411  AD 31 03
    STA $0332                    ; $9414  8D 32 03
    JSR sub_17_95B6              ; $9417  20 B6 95
    LDA $0332                    ; $941A  AD 32 03
    CMP #$80                     ; $941D  C9 80
    BNE loc_17_9400              ; $941F  D0 DF
    LDA #$68                     ; $9421  A9 68
    STA $0379                    ; $9423  8D 79 03
    LDA #$58                     ; $9426  A9 58
    STA $037A                    ; $9428  8D 7A 03
    LDY #$03                     ; $942B  A0 03
    LDX #$01                     ; $942D  A2 01
    LDA #$5D                     ; $942F  A9 5D
    JSR sub_1F_EAA4              ; $9431  20 A4 EA
    LDA #$6D                     ; $9434  A9 6D
    STA $0300,Y                  ; $9436  99 00 03
    LDA #$00                     ; $9439  A9 00
    STA $0378,Y                  ; $943B  99 78 03
    STA $03D8,Y                  ; $943E  99 D8 03
    STA $03D9                    ; $9441  8D D9 03
    STA $03DA                    ; $9444  8D DA 03
    LDA #$03                     ; $9447  A9 03
    STA $03F0,Y                  ; $9449  99 F0 03
    STA $03F1                    ; $944C  8D F1 03
    STA $03F2                    ; $944F  8D F2 03

loc_17_9452:
    LDX #$03                     ; $9452  A2 03
    JSR sub_1F_E92A              ; $9454  20 2A E9
    LDA #$54                     ; $9457  A9 54
    CMP $0378,Y                  ; $9459  D9 78 03
    BCS loc_17_9461              ; $945C  B0 03
    STA $0378,Y                  ; $945E  99 78 03

loc_17_9461:
    JSR sub_17_95B6              ; $9461  20 B6 95
    LDA $037B                    ; $9464  AD 7B 03
    CMP #$54                     ; $9467  C9 54
    BNE loc_17_9452              ; $9469  D0 E7
    LDA #$3C                     ; $946B  A9 3C
    JSR sub_17_95CE              ; $946D  20 CE 95

loc_17_9470:
    LDX #$03                     ; $9470  A2 03

loc_17_9472:
    JSR sub_1F_E94A              ; $9472  20 4A E9
    DEX                          ; $9475  CA
    BNE loc_17_9472              ; $9476  D0 FA
    JSR sub_17_95B6              ; $9478  20 B6 95
    LDA $0391                    ; $947B  AD 91 03
    BEQ loc_17_9470              ; $947E  F0 F0
    LDA #$78                     ; $9480  A9 78
    JSR sub_17_95CE              ; $9482  20 CE 95
    LDA #$10                     ; $9485  A9 10
    STA $0E                      ; $9487  85 0E
    STA $0D                      ; $9489  85 0D
    JSR sub_17_95D8              ; $948B  20 D8 95
    LDA #$F8                     ; $948E  A9 F8
    STA $0379                    ; $9490  8D 79 03
    LDA #$E8                     ; $9493  A9 E8
    STA $037A                    ; $9495  8D 7A 03
    LDA #$E4                     ; $9498  A9 E4
    STA $037B                    ; $949A  8D 7B 03
    LDA #$00                     ; $949D  A9 00
    STA $0391                    ; $949F  8D 91 03
    STA $0392                    ; $94A2  8D 92 03
    STA $0393                    ; $94A5  8D 93 03
    STA $0300                    ; $94A8  8D 00 03
    LDA #$30                     ; $94AB  A9 30
    STA $0E                      ; $94AD  85 0E
    LDA #$F0                     ; $94AF  A9 F0
    STA $0D                      ; $94B1  85 0D
    JSR sub_17_95D8              ; $94B3  20 D8 95

loc_17_94B6:
    LDX #$03                     ; $94B6  A2 03

loc_17_94B8:
    JSR sub_1F_E94A              ; $94B8  20 4A E9
    DEX                          ; $94BB  CA
    BNE loc_17_94B8              ; $94BC  D0 FA
    JSR sub_17_95B6              ; $94BE  20 B6 95
    LDA $037B                    ; $94C1  AD 7B 03
    CMP #$63                     ; $94C4  C9 63
    BNE loc_17_94B6              ; $94C6  D0 EE
    LDA #$78                     ; $94C8  A9 78
    JSR sub_17_95CE              ; $94CA  20 CE 95
    LDA #$01                     ; $94CD  A9 01
    STA $03F3                    ; $94CF  8D F3 03

loc_17_94D2:
    LDX #$03                     ; $94D2  A2 03
    JSR sub_1F_E94A              ; $94D4  20 4A E9
    JSR sub_17_95B6              ; $94D7  20 B6 95
    LDA $037B                    ; $94DA  AD 7B 03
    CMP #$53                     ; $94DD  C9 53
    BNE loc_17_94D2              ; $94DF  D0 F1
    LDA #$B4                     ; $94E1  A9 B4
    STA $0F                      ; $94E3  85 0F

loc_17_94E5:
    JSR sub_17_95BD              ; $94E5  20 BD 95
    DEC $0F                      ; $94E8  C6 0F
    BNE loc_17_94E5              ; $94EA  D0 F9
    LDA #$00                     ; $94EC  A9 00
    STA $0541                    ; $94EE  8D 41 05

loc_17_94F1:
    LDX #$03                     ; $94F1  A2 03
    JSR sub_1F_E92A              ; $94F3  20 2A E9
    JSR sub_17_95B6              ; $94F6  20 B6 95
    LDA $037B                    ; $94F9  AD 7B 03
    CMP #$63                     ; $94FC  C9 63
    BNE loc_17_94F1              ; $94FE  D0 F1
    LDA #$00                     ; $9500  A9 00
    STA $0469                    ; $9502  8D 69 04
    STA $0481                    ; $9505  8D 81 04

loc_17_9508:
    LDX #$03                     ; $9508  A2 03
    LDA $046B                    ; $950A  AD 6B 04
    BNE loc_17_9555              ; $950D  D0 46
    LDY $0483                    ; $950F  AC 83 04
    LDA $9935,Y                  ; $9512  B9 35 99
    BEQ loc_17_958A              ; $9515  F0 73
    PHA                          ; $9517  48
    LDA $9937,Y                  ; $9518  B9 37 99
    STA $046B                    ; $951B  8D 6B 04
    LDA $9938,Y                  ; $951E  B9 38 99
    STA $0543                    ; $9521  8D 43 05
    LDA $9936,Y                  ; $9524  B9 36 99
    TAY                          ; $9527  A8
    PLA                          ; $9528  68
    JSR sub_1F_F470              ; $9529  20 70 F4
    INC $0483                    ; $952C  EE 83 04
    INC $0483                    ; $952F  EE 83 04
    INC $0483                    ; $9532  EE 83 04
    INC $0483                    ; $9535  EE 83 04
    LDA $0483                    ; $9538  AD 83 04
    CMP #$34                     ; $953B  C9 34
    BNE loc_17_9555              ; $953D  D0 16
    LDA #$00                     ; $953F  A9 00
    STA $0301                    ; $9541  8D 01 03
    STA $0302                    ; $9544  8D 02 03
    LDA #$60                     ; $9547  A9 60
    JSR sub_1F_EA98              ; $9549  20 98 EA
    LDA $037B                    ; $954C  AD 7B 03
    CLC                          ; $954F  18
    ADC #$0C                     ; $9550  69 0C
    STA $037B                    ; $9552  8D 7B 03

loc_17_9555:
    JSR sub_1F_EA65              ; $9555  20 65 EA
    JSR sub_1F_EA86              ; $9558  20 86 EA
    JSR sub_17_959D              ; $955B  20 9D 95
    DEC $046B                    ; $955E  CE 6B 04
    LDA $FD                      ; $9561  A5 FD
    ORA $FA                      ; $9563  05 FA
    BEQ loc_17_9577              ; $9565  F0 10
    INC $FA                      ; $9567  E6 FA
    INC $FA                      ; $9569  E6 FA
    LDA $FA                      ; $956B  A5 FA
    CMP #$F0                     ; $956D  C9 F0
    BNE loc_17_9577              ; $956F  D0 06
    LDA #$00                     ; $9571  A9 00
    STA $FD                      ; $9573  85 FD
    STA $FA                      ; $9575  85 FA

loc_17_9577:
    LDA #$00                     ; $9577  A9 00
    STA $9D                      ; $9579  85 9D
    STA $0571                    ; $957B  8D 71 05
    STA $0572                    ; $957E  8D 72 05
    STA $0573                    ; $9581  8D 73 05
    JSR sub_17_95B6              ; $9584  20 B6 95
    JMP loc_17_9508              ; $9587  4C 08 95


loc_17_958A:
    LDY #$12                     ; $958A  A0 12
    JSR sub_17_968A              ; $958C  20 8A 96
    LDA #$FF                     ; $958F  A9 FF
    STA $18                      ; $9591  85 18
    LDY #$20                     ; $9593  A0 20
    LDA #$18                     ; $9595  A9 18
    JSR sub_17_96CA              ; $9597  20 CA 96
    JMP loc_17_92FD              ; $959A  4C FD 92


sub_17_959D:
    LDA $0333                    ; $959D  AD 33 03
    STA $0331                    ; $95A0  8D 31 03
    STA $0332                    ; $95A3  8D 32 03
    LDA $037B                    ; $95A6  AD 7B 03
    CLC                          ; $95A9  18
    ADC #$04                     ; $95AA  69 04
    STA $037A                    ; $95AC  8D 7A 03
    CLC                          ; $95AF  18
    ADC #$10                     ; $95B0  69 10
    STA $0379                    ; $95B2  8D 79 03
    RTS                          ; $95B5  60


sub_17_95B6:
    LDA #$00                     ; $95B6  A9 00
    STA $9D                      ; $95B8  85 9D
    STA $0572                    ; $95BA  8D 72 05

sub_17_95BD:
    JSR sub_1F_F363              ; $95BD  20 63 F3
    INC $48                      ; $95C0  E6 48
    LDA $48                      ; $95C2  A5 48
    AND #$0F                     ; $95C4  29 0F
    BNE loc_17_95CD              ; $95C6  D0 05
    LDA #$19                     ; $95C8  A9 19
    JSR sub_1F_EC5D              ; $95CA  20 5D EC

loc_17_95CD:
    RTS                          ; $95CD  60


sub_17_95CE:
    STA $0F                      ; $95CE  85 0F

loc_17_95D0:
    JSR sub_17_95B6              ; $95D0  20 B6 95
    DEC $0F                      ; $95D3  C6 0F
    BNE loc_17_95D0              ; $95D5  D0 F9
    RTS                          ; $95D7  60


sub_17_95D8:
    LDA #$04                     ; $95D8  A9 04
    STA $0C                      ; $95DA  85 0C

loc_17_95DC:
    LDY #$1F                     ; $95DC  A0 1F

loc_17_95DE:
    LDA $0620,Y                  ; $95DE  B9 20 06
    SEC                          ; $95E1  38
    SBC $0E                      ; $95E2  E5 0E
    BCS loc_17_95E8              ; $95E4  B0 02
    LDA #$0F                     ; $95E6  A9 0F

loc_17_95E8:
    STA $0600,Y                  ; $95E8  99 00 06
    DEY                          ; $95EB  88
    BPL loc_17_95DE              ; $95EC  10 F0
    STY $18                      ; $95EE  84 18
    LDA #$04                     ; $95F0  A9 04
    JSR sub_17_95CE              ; $95F2  20 CE 95
    LDA $0E                      ; $95F5  A5 0E
    CLC                          ; $95F7  18
    ADC $0D                      ; $95F8  65 0D
    STA $0E                      ; $95FA  85 0E
    DEC $0C                      ; $95FC  C6 0C
    BNE loc_17_95DC              ; $95FE  D0 DC
    RTS                          ; $9600  60


sub_17_9601:
    LDA $6C                      ; $9601  A5 6C
    ASL A                        ; $9603  0A
    TAY                          ; $9604  A8
    LDA $9B22,Y                  ; $9605  B9 22 9B
    STA $08                      ; $9608  85 08
    LDA $9B23,Y                  ; $960A  B9 23 9B
    STA $09                      ; $960D  85 09
    LDA #$00                     ; $960F  A9 00
    STA $9D                      ; $9611  85 9D
    RTS                          ; $9613  60


sub_17_9614:
    STA $0C                      ; $9614  85 0C
    STX $0D                      ; $9616  86 0D
    STY $0E                      ; $9618  84 0E

loc_17_961A:
    LDY $09                      ; $961A  A4 09
    LDA $9D                      ; $961C  A5 9D
    LSR A                        ; $961E  4A
    LSR A                        ; $961F  4A
    AND #$0F                     ; $9620  29 0F
    CMP $9B42,Y                  ; $9622  D9 42 9B
    BCC loc_17_962B              ; $9625  90 04
    LDA #$00                     ; $9627  A9 00
    STA $9D                      ; $9629  85 9D

loc_17_962B:
    CLC                          ; $962B  18
    ADC $09                      ; $962C  65 09
    TAY                          ; $962E  A8
    LDX $9B43,Y                  ; $962F  BE 43 9B
    LDA $9B50,X                  ; $9632  BD 50 9B
    STA $0B                      ; $9635  85 0B
    LDY $08                      ; $9637  A4 08

loc_17_9639:
    LDA $9B51,X                  ; $9639  BD 51 9B
    STA $0201,Y                  ; $963C  99 01 02
    LDA $9B52,X                  ; $963F  BD 52 9B
    STA $0202,Y                  ; $9642  99 02 02
    INY                          ; $9645  C8
    INY                          ; $9646  C8
    INY                          ; $9647  C8
    INY                          ; $9648  C8
    INX                          ; $9649  E8
    INX                          ; $964A  E8
    DEC $0B                      ; $964B  C6 0B
    BPL loc_17_9639              ; $964D  10 EA
    INC $9D                      ; $964F  E6 9D
    JSR sub_1F_FF22              ; $9651  20 22 FF
    DEC $0C                      ; $9654  C6 0C
    BNE loc_17_961A              ; $9656  D0 C2
    LDX $0D                      ; $9658  A6 0D
    LDY $0E                      ; $965A  A4 0E
    RTS                          ; $965C  60


sub_17_965D:
    LDA #$00                     ; $965D  A9 00
    JSR sub_1F_FF24              ; $965F  20 24 FF
    LDA #$00                     ; $9662  A9 00
    JSR sub_1F_FF24              ; $9664  20 24 FF
    LDA #$02                     ; $9667  A9 02
    STA $02                      ; $9669  85 02
    LDA #$17                     ; $966B  A9 17
    JSR sub_1F_EC5D              ; $966D  20 5D EC
    LDA #$08                     ; $9670  A9 08
    STA $03                      ; $9672  85 03

loc_17_9674:
    LDA $0610                    ; $9674  AD 10 06
    EOR #$3F                     ; $9677  49 3F
    STA $0610                    ; $9679  8D 10 06
    LDA #$FF                     ; $967C  A9 FF
    STA $18                      ; $967E  85 18
    LDA #$08                     ; $9680  A9 08
    JSR sub_1F_FF24              ; $9682  20 24 FF
    DEC $03                      ; $9685  C6 03
    BNE loc_17_9674              ; $9687  D0 EB
    RTS                          ; $9689  60


sub_17_968A:
    LDA $9822,Y                  ; $968A  B9 22 98
    STA $EA                      ; $968D  85 EA
    LDA $9823,Y                  ; $968F  B9 23 98
    STA $EB                      ; $9692  85 EB
    LDA #$08                     ; $9694  A9 08
    STA $EC                      ; $9696  85 EC
    LDX #$00                     ; $9698  A2 00

loc_17_969A:
    LDA $9824,Y                  ; $969A  B9 24 98
    STA $0620,X                  ; $969D  9D 20 06
    STA $0600,X                  ; $96A0  9D 00 06
    LDA $9846,X                  ; $96A3  BD 46 98
    STA $0630,X                  ; $96A6  9D 30 06
    STA $0610,X                  ; $96A9  9D 10 06
    INY                          ; $96AC  C8
    INX                          ; $96AD  E8
    CPX #$10                     ; $96AE  E0 10
    BNE loc_17_969A              ; $96B0  D0 E8
    LDA #$11                     ; $96B2  A9 11
    STA $27                      ; $96B4  85 27
    LDA #$10                     ; $96B6  A9 10
    STA $26                      ; $96B8  85 26
    RTS                          ; $96BA  60


sub_17_96BB:
    LDY #$07                     ; $96BB  A0 07

loc_17_96BD:
    LDA $9856,Y                  ; $96BD  B9 56 98
    STA $0610,Y                  ; $96C0  99 10 06
    STA $0630,Y                  ; $96C3  99 30 06
    DEY                          ; $96C6  88
    BPL loc_17_96BD              ; $96C7  10 F4
    RTS                          ; $96C9  60


sub_17_96CA:
    STA $00                      ; $96CA  85 00
    LDX #$00                     ; $96CC  A2 00

loc_17_96CE:
    LDA $985E,Y                  ; $96CE  B9 5E 98
    STA $0200,X                  ; $96D1  9D 00 02
    INY                          ; $96D4  C8
    INX                          ; $96D5  E8
    CPX $00                      ; $96D6  E4 00
    BNE loc_17_96CE              ; $96D8  D0 F4
    RTS                          ; $96DA  60


sub_17_96DB:
    LDA #$28                     ; $96DB  A9 28
    LDX #$E4                     ; $96DD  A2 E4
    STA $0780                    ; $96DF  8D 80 07
    STA $0C                      ; $96E2  85 0C
    STX $0781                    ; $96E4  8E 81 07
    STX $0D                      ; $96E7  86 0D
    LDA $9B7A,Y                  ; $96E9  B9 7A 9B
    STA $08                      ; $96EC  85 08
    LDA $9B7D,Y                  ; $96EE  B9 7D 9B
    STA $09                      ; $96F1  85 09
    LDY #$00                     ; $96F3  A0 00

loc_17_96F5:
    LDX #$00                     ; $96F5  A2 00
    LDA ($08),Y                  ; $96F7  B1 08
    BEQ loc_17_9732              ; $96F9  F0 37
    CMP #$FE                     ; $96FB  C9 FE
    BEQ loc_17_973B              ; $96FD  F0 3C
    CMP #$FF                     ; $96FF  C9 FF
    BEQ loc_17_9753              ; $9701  F0 50
    STA $0783                    ; $9703  8D 83 07
    JSR sub_17_9769              ; $9706  20 69 97
    LDA ($08),Y                  ; $9709  B1 08
    CMP #$DE                     ; $970B  C9 DE
    BNE loc_17_9716              ; $970D  D0 07
    STA $0784                    ; $970F  8D 84 07
    JSR sub_17_9769              ; $9712  20 69 97
    INX                          ; $9715  E8

loc_17_9716:
    STX $0782                    ; $9716  8E 82 07
    LDA #$FF                     ; $9719  A9 FF
    STA $0784,X                  ; $971B  9D 84 07
    STA $19                      ; $971E  85 19
    LDA #$08                     ; $9720  A9 08
    JSR sub_17_9754              ; $9722  20 54 97

loc_17_9725:
    LDA $0781                    ; $9725  AD 81 07
    SEC                          ; $9728  38
    ADC $0782                    ; $9729  6D 82 07
    STA $0781                    ; $972C  8D 81 07
    JMP loc_17_96F5              ; $972F  4C F5 96


loc_17_9732:
    STA $0782                    ; $9732  8D 82 07
    JSR sub_17_9769              ; $9735  20 69 97
    JMP loc_17_9725              ; $9738  4C 25 97


loc_17_973B:
    JSR sub_17_9769              ; $973B  20 69 97
    LDA $0D                      ; $973E  A5 0D
    CLC                          ; $9740  18
    ADC #$40                     ; $9741  69 40
    STA $0D                      ; $9743  85 0D
    STA $0781                    ; $9745  8D 81 07
    LDA $0C                      ; $9748  A5 0C
    ADC #$00                     ; $974A  69 00
    STA $0C                      ; $974C  85 0C
    STA $0780                    ; $974E  8D 80 07
    BNE loc_17_96F5              ; $9751  D0 A2

loc_17_9753:
    RTS                          ; $9753  60


sub_17_9754:
    STY $0B                      ; $9754  84 0B
    STA $0A                      ; $9756  85 0A

loc_17_9758:
    LDA #$00                     ; $9758  A9 00
    STA $9D                      ; $975A  85 9D
    STA $0572                    ; $975C  8D 72 05
    JSR sub_1F_F363              ; $975F  20 63 F3
    DEC $0A                      ; $9762  C6 0A
    BNE loc_17_9758              ; $9764  D0 F2
    LDY $0B                      ; $9766  A4 0B

loc_17_9768:
    RTS                          ; $9768  60


sub_17_9769:
    INY                          ; $9769  C8
    BNE loc_17_9768              ; $976A  D0 FC
    INC $11                      ; $976C  E6 11
    RTS                          ; $976E  60


sub_17_976F:
    LDY #$5B                     ; $976F  A0 5B

loc_17_9771:
    LDA $98DA,Y                  ; $9771  B9 DA 98
    STA $0780,Y                  ; $9774  99 80 07
    DEY                          ; $9777  88
    BPL loc_17_9771              ; $9778  10 F7
    STY $19                      ; $977A  84 19
    JSR sub_1F_FF22              ; $977C  20 22 FF
    LDA #$29                     ; $977F  A9 29
    STA $0780                    ; $9781  8D 80 07
    LDA #$A4                     ; $9784  A9 A4
    STA $0781                    ; $9786  8D 81 07
    LDA #$29                     ; $9789  A9 29
    STA $079E                    ; $978B  8D 9E 07
    LDA #$E4                     ; $978E  A9 E4
    STA $079F                    ; $9790  8D 9F 07
    LDA #$2A                     ; $9793  A9 2A
    STA $07BC                    ; $9795  8D BC 07
    LDA #$24                     ; $9798  A9 24
    STA $07BD                    ; $979A  8D BD 07
    DEC $19                      ; $979D  C6 19
    JSR sub_1F_FF22              ; $979F  20 22 FF
    RTS                          ; $97A2  60


sub_17_97A3:
    STA $10                      ; $97A3  85 10
    STY $11                      ; $97A5  84 11

loc_17_97A7:
    LDA $99D6,Y                  ; $97A7  B9 D6 99
    STA $02                      ; $97AA  85 02
    LDA $99DE,Y                  ; $97AC  B9 DE 99
    STA $03                      ; $97AF  85 03
    LDY #$00                     ; $97B1  A0 00
    LDA ($02),Y                  ; $97B3  B1 02
    STA $04                      ; $97B5  85 04
    LSR $10                      ; $97B7  46 10
    BCC loc_17_97D9              ; $97B9  90 1E
    INC $26                      ; $97BB  E6 26
    INC $6C                      ; $97BD  E6 6C
    INY                          ; $97BF  C8
    LDX $9F                      ; $97C0  A6 9F
    LDA $04                      ; $97C2  A5 04
    BEQ loc_17_97D1              ; $97C4  F0 0B

loc_17_97C6:
    LDA ($02),Y                  ; $97C6  B1 02
    STA $0200,X                  ; $97C8  9D 00 02
    INY                          ; $97CB  C8
    INX                          ; $97CC  E8
    DEC $04                      ; $97CD  C6 04
    BNE loc_17_97C6              ; $97CF  D0 F5

loc_17_97D1:
    STX $9F                      ; $97D1  86 9F
    INC $11                      ; $97D3  E6 11
    LDY $11                      ; $97D5  A4 11
    BNE loc_17_97A7              ; $97D7  D0 CE

loc_17_97D9:
    LDY #$1F                     ; $97D9  A0 1F

loc_17_97DB:
    LDA $98B6,Y                  ; $97DB  B9 B6 98
    STA $0600,Y                  ; $97DE  99 00 06
    STA $0620,Y                  ; $97E1  99 20 06
    DEY                          ; $97E4  88
    BPL loc_17_97DB              ; $97E5  10 F4
    STY $18                      ; $97E7  84 18
    RTS                          ; $97E9  60


sub_17_97EA:
    LDY $11                      ; $97EA  A4 11
    LDA $99D6,Y                  ; $97EC  B9 D6 99
    STA $02                      ; $97EF  85 02
    LDA $99DE,Y                  ; $97F1  B9 DE 99
    STA $03                      ; $97F4  85 03
    LDY #$00                     ; $97F6  A0 00
    LDA ($02),Y                  ; $97F8  B1 02
    BEQ loc_17_9821              ; $97FA  F0 25
    STA $04                      ; $97FC  85 04
    LDX $9F                      ; $97FE  A6 9F
    INY                          ; $9800  C8

loc_17_9801:
    LDA #$04                     ; $9801  A9 04
    STA $05                      ; $9803  85 05
    LDA #$18                     ; $9805  A9 18
    JSR sub_1F_EC5D              ; $9807  20 5D EC

loc_17_980A:
    LDA ($02),Y                  ; $980A  B1 02
    STA $0200,X                  ; $980C  9D 00 02
    INY                          ; $980F  C8
    INX                          ; $9810  E8
    DEC $04                      ; $9811  C6 04
    BEQ loc_17_9821              ; $9813  F0 0C
    DEC $05                      ; $9815  C6 05
    BNE loc_17_980A              ; $9817  D0 F1
    LDA #$04                     ; $9819  A9 04
    JSR sub_17_9614              ; $981B  20 14 96
    JMP loc_17_9801              ; $981E  4C 01 98


loc_17_9821:
    RTS                          ; $9821  60

    .byte $D8,$DA,$0F,$20,$25,$16,$0F,$20,$21,$13,$0F,$20,$21,$16,$0F,$20  ; $9822
    .byte $27,$16,$DC,$DE,$0F,$20,$24,$12,$0F,$20,$2C,$12,$0F,$20,$29,$12  ; $9832
    .byte $0F,$20,$26,$16,$0F,$20,$29,$0A,$0F,$20,$16,$0A,$0F,$0F,$20,$36  ; $9842
    .byte $0F,$0F,$20,$16,$0F,$0F,$2C,$11,$0F,$0F,$20,$37,$B7,$24,$03,$18  ; $9852
    .byte $A7,$24,$03,$40,$87,$24,$03,$70,$6F,$24,$03,$C0,$3F,$21,$03,$BC  ; $9862
    .byte $3F,$21,$43,$C4,$47,$31,$02,$BC,$47,$31,$42,$C4,$77,$28,$01,$78  ; $9872
    .byte $77,$29,$01,$80,$7F,$2A,$00,$78,$7F,$2B,$00,$80,$87,$2C,$40,$78  ; $9882
    .byte $87,$2C,$00,$80,$5F,$24,$03,$18,$87,$24,$03,$40,$97,$24,$03,$A0  ; $9892
    .byte $97,$24,$03,$B0,$BB,$1C,$02,$C8,$BB,$1C,$42,$D0,$C3,$1E,$02,$C8  ; $98A2
    .byte $C3,$1E,$42,$D0,$0F,$11,$0C,$01,$0F,$11,$0C,$01,$0F,$11,$0C,$01  ; $98B2
    .byte $0F,$11,$0C,$01,$0F,$00,$11,$00,$0F,$00,$11,$00,$0F,$0F,$20,$36  ; $98C2
    .byte $0F,$0F,$20,$16,$5E,$5F,$90,$80,$28,$E4,$1A,$00,$00,$00,$00,$00  ; $98D2
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $98E2
    .byte $00,$00,$00,$00,$00,$00,$29,$24,$1A,$00,$00,$00,$00,$00,$00,$00  ; $98F2
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9902
    .byte $00,$00,$00,$00,$29,$64,$1A,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9912
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9922
    .byte $00,$00,$FF,$28,$03,$11,$00,$28,$02,$07,$00,$28,$01,$04,$00,$28  ; $9932
    .byte $00,$03,$00,$28,$0F,$04,$00,$28,$0E,$07,$00,$28,$0D,$0B,$00,$28  ; $9942
    .byte $0C,$10,$00,$28,$0B,$0B,$00,$28,$0A,$07,$00,$28,$09,$04,$00,$28  ; $9952
    .byte $08,$03,$00,$08,$07,$08,$00,$08,$06,$08,$00,$08,$05,$10,$00,$08  ; $9962
    .byte $04,$18,$00,$08,$05,$10,$00,$08,$06,$04,$00,$08,$07,$04,$00,$08  ; $9972
    .byte $08,$02,$00,$20,$09,$04,$01,$20,$0A,$04,$01,$20,$0B,$0C,$01,$20  ; $9982
    .byte $0C,$30,$01,$20,$0B,$0C,$01,$20,$0A,$04,$01,$20,$09,$04,$01,$20  ; $9992
    .byte $08,$02,$01,$20,$07,$02,$02,$20,$06,$02,$02,$20,$05,$06,$02,$20  ; $99A2
    .byte $04,$10,$02,$20,$05,$06,$02,$20,$06,$02,$02,$20,$07,$02,$02,$20  ; $99B2
    .byte $08,$02,$02,$20,$09,$02,$02,$20,$0A,$02,$02,$20,$0B,$02,$02,$20  ; $99C2
    .byte $0C,$02,$03,$00,$E6,$FF,$24,$65,$76,$B3,$10,$15,$99,$99,$9A,$9A  ; $99D2
    .byte $9A,$9A,$9B,$9B,$18,$B7,$26,$02,$20,$B7,$26,$02,$28,$B7,$27,$C2  ; $99E2
    .byte $30,$AF,$25,$02,$30,$A7,$27,$02,$30,$A7,$26,$02,$38,$24,$A7,$26  ; $99F2
    .byte $02,$48,$A7,$26,$02,$50,$A7,$26,$02,$58,$A7,$27,$C2,$60,$9F,$25  ; $9A02
    .byte $02,$60,$97,$25,$02,$60,$8F,$25,$02,$60,$87,$27,$02,$60,$87,$26  ; $9A12
    .byte $02,$68,$40,$87,$26,$02,$78,$87,$26,$02,$80,$87,$26,$02,$88,$87  ; $9A22
    .byte $27,$C2,$90,$7F,$25,$02,$90,$77,$25,$02,$90,$6F,$25,$02,$90,$67  ; $9A32
    .byte $25,$02,$90,$5F,$27,$02,$90,$5F,$26,$02,$98,$5F,$26,$02,$A0,$5F  ; $9A42
    .byte $26,$02,$A8,$5F,$27,$42,$B0,$67,$25,$02,$B0,$6F,$27,$82,$B0,$6F  ; $9A52
    .byte $26,$02,$B8,$10,$67,$25,$02,$C0,$5F,$25,$02,$C0,$57,$25,$02,$C0  ; $9A62
    .byte $4F,$25,$02,$C0,$3C,$67,$25,$02,$18,$6F,$25,$02,$18,$77,$25,$02  ; $9A72
    .byte $18,$7F,$25,$02,$18,$87,$25,$02,$18,$8F,$25,$02,$18,$97,$25,$02  ; $9A82
    .byte $18,$9F,$27,$82,$18,$9F,$26,$02,$20,$9F,$26,$02,$28,$9F,$27,$C2  ; $9A92
    .byte $30,$97,$25,$02,$30,$8F,$25,$02,$30,$87,$27,$02,$30,$87,$26,$02  ; $9AA2
    .byte $38,$5C,$87,$26,$02,$48,$87,$27,$42,$50,$8F,$25,$02,$50,$97,$25  ; $9AB2
    .byte $02,$50,$9F,$25,$02,$50,$A7,$25,$02,$50,$AF,$27,$82,$50,$AF,$26  ; $9AC2
    .byte $02,$58,$AF,$26,$02,$60,$AF,$26,$02,$68,$AF,$27,$C2,$70,$A7,$27  ; $9AD2
    .byte $02,$70,$A7,$26,$02,$78,$A7,$27,$42,$80,$AF,$25,$02,$80,$B7,$27  ; $9AE2
    .byte $82,$80,$B7,$26,$02,$88,$B7,$26,$02,$90,$B7,$27,$C2,$98,$AF,$25  ; $9AF2
    .byte $02,$98,$A7,$25,$02,$98,$9F,$25,$02,$98,$97,$27,$02,$98,$04,$97  ; $9B02
    .byte $26,$02,$A8,$1C,$97,$27,$42,$B8,$9F,$25,$02,$B8,$A7,$25,$02,$B8  ; $9B12
    .byte $AF,$25,$02,$B8,$B7,$25,$02,$B8,$BF,$27,$82,$B8,$BF,$26,$02,$C0  ; $9B22
    .byte $04,$00,$08,$00,$0C,$00,$10,$0A,$1C,$00,$20,$00,$24,$00,$28,$05  ; $9B32
    .byte $04,$00,$00,$03,$03,$04,$06,$06,$0F,$0F,$03,$18,$18,$21,$00,$24  ; $9B42
    .byte $03,$00,$23,$02,$03,$1C,$02,$1C,$42,$1E,$02,$1E,$42,$03,$1D,$42  ; $9B52
    .byte $1D,$02,$1F,$42,$1F,$02,$03,$21,$03,$21,$43,$31,$02,$31,$42,$03  ; $9B62
    .byte $22,$43,$22,$03,$32,$42,$32,$02,$80,$D7,$4E,$9B,$9B,$9C,$59,$4F  ; $9B72
    .byte $55,$27,$56,$45,$20,$44,$4F,$4E,$45,$20,$57,$45,$4C,$4C,$2C,$20  ; $9B82
    .byte $4D,$45,$47,$41,$20,$4D,$41,$4E,$21,$FE,$49,$20,$4E,$45,$56,$45  ; $9B92
    .byte $52,$20,$45,$58,$50,$45,$43,$54,$45,$44,$20,$59,$4F,$55,$20,$54  ; $9BA2
    .byte $4F,$FE,$44,$45,$46,$45,$41,$54,$20,$4D,$59,$20,$50,$4F,$57,$45  ; $9BB2
    .byte $52,$46,$55,$4C,$20,$44,$41,$52,$4B,$4D,$41,$4E,$FE,$52,$4F,$42  ; $9BC2
    .byte $4F,$54,$21,$21,$FF,$55,$4E,$54,$49,$4C,$20,$4E,$4F,$57,$20,$49  ; $9BD2
    .byte $20,$48,$41,$56,$45,$20,$4D,$41,$4E,$41,$47,$45,$44,$FE,$54,$4F  ; $9BE2
    .byte $20,$46,$52,$41,$4D,$45,$20,$50,$52,$4F,$54,$4F,$4D,$41,$4E,$20  ; $9BF2
    .byte $46,$4F,$52,$20,$4D,$59,$FE,$43,$52,$49,$4D,$45,$53,$2C,$20,$42  ; $9C02
    .byte $55,$54,$20,$4E,$4F,$57,$20,$54,$48,$45,$20,$52,$45,$41,$4C,$FE  ; $9C12
    .byte $50,$52,$4F,$54,$4F,$4D,$41,$4E,$20,$48,$41,$53,$20,$41,$50,$50  ; $9C22
    .byte $45,$41,$52,$45,$44,$20,$41,$4E,$44,$FE,$53,$50,$4F,$49,$4C,$45  ; $9C32
    .byte $44,$20,$4D,$59,$20,$50,$4C,$41,$4E,$21,$21,$FF,$44,$52,$2E,$4C  ; $9C42
    .byte $49,$47,$48,$54,$20,$49,$53,$20,$41,$20,$43,$41,$50,$54,$49,$56  ; $9C52
    .byte $45,$20,$49,$4E,$FE,$4D,$59,$20,$4C,$41,$42,$2E,$FE,$43,$4F,$4D  ; $9C62
    .byte $45,$20,$49,$46,$20,$59,$4F,$55,$20,$44,$41,$52,$45,$21,$21,$FE  ; $9C72
    .byte $48,$41,$2C,$20,$48,$41,$2C,$20,$48,$41,$2E,$FF,$00,$00,$00,$00  ; $9C82
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00  ; $9C92
    .byte $00,$00,$00,$40,$00,$00,$20,$00,$02,$00,$00,$00,$00,$00,$00,$00  ; $9CA2
    .byte $00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9CB2
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9CC2
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00  ; $9CD2
    .byte $00,$00,$40,$01,$29,$50,$30,$10,$C2,$41,$20,$08,$10,$10,$40,$01  ; $9CE2
    .byte $18,$02,$80,$10,$00,$04,$41,$00,$40,$50,$00,$50,$48,$10,$00,$04  ; $9CF2
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00  ; $9D02
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$04  ; $9D12
    .byte $08,$00,$20,$00,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9D22
    .byte $00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00  ; $9D32
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9D42
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40  ; $9D52
    .byte $00,$10,$10,$00,$00,$01,$00,$00,$10,$14,$09,$00,$40,$00,$00,$00  ; $9D62
    .byte $22,$08,$24,$00,$40,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00  ; $9D72
    .byte $80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9D82
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00  ; $9D92
    .byte $00,$00,$00,$00,$00,$10,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00  ; $9DA2
    .byte $80,$00,$00,$00,$20,$40,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00  ; $9DB2
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$04,$00,$00,$00  ; $9DC2
    .byte $00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9DD2
    .byte $02,$00,$21,$00,$28,$00,$08,$41,$04,$00,$11,$41,$00,$40,$00,$04  ; $9DE2
    .byte $06,$04,$20,$00,$02,$00,$40,$11,$00,$40,$00,$04,$C0,$01,$00,$00  ; $9DF2
    .byte $00,$00,$10,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00  ; $9E02
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9E12
    .byte $02,$00,$00,$00,$00,$00,$00,$00,$04,$04,$00,$00,$00,$00,$80,$00  ; $9E22
    .byte $00,$00,$00,$04,$00,$00,$00,$00,$20,$00,$00,$00,$00,$00,$08,$00  ; $9E32
    .byte $00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9E42
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C0,$00  ; $9E52
    .byte $00,$40,$20,$14,$80,$40,$00,$00,$00,$00,$00,$00,$00,$00,$80,$00  ; $9E62
    .byte $10,$00,$00,$00,$60,$03,$08,$00,$00,$00,$00,$00,$20,$04,$00,$01  ; $9E72
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9E82
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$00,$00  ; $9E92
    .byte $00,$00,$00,$00,$00,$40,$20,$00,$80,$00,$20,$00,$00,$00,$00,$00  ; $9EA2
    .byte $00,$00,$00,$01,$00,$00,$08,$00,$00,$00,$00,$10,$40,$01,$00,$00  ; $9EB2
    .byte $00,$00,$02,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00  ; $9EC2
    .byte $00,$01,$00,$00,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$10,$00  ; $9ED2
    .byte $08,$00,$10,$00,$80,$41,$02,$00,$22,$44,$01,$00,$20,$18,$04,$10  ; $9EE2
    .byte $00,$00,$45,$00,$02,$00,$00,$00,$18,$44,$00,$05,$01,$00,$00,$00  ; $9EF2
    .byte $00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9F02
    .byte $00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00  ; $9F12
    .byte $00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9F22
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9F32
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$00,$00,$00,$00,$00  ; $9F42
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00  ; $9F52
    .byte $40,$00,$00,$04,$10,$40,$00,$00,$20,$04,$00,$00,$00,$00,$20,$40  ; $9F62
    .byte $00,$40,$00,$80,$00,$80,$00,$40,$08,$00,$00,$00,$08,$00,$00,$00  ; $9F72
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9F82
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10  ; $9F92
    .byte $02,$00,$04,$00,$00,$00,$04,$04,$00,$04,$02,$00,$00,$00,$00,$00  ; $9FA2
    .byte $00,$00,$00,$00,$00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9FB2
    .byte $40,$00,$20,$00,$00,$04,$00,$00,$00,$04,$00,$00,$00,$00,$00,$00  ; $9FC2
    .byte $00,$00,$00,$00,$00,$04,$80,$00,$00,$00,$00,$00,$00,$00,$02,$00  ; $9FD2
    .byte $00,$00,$10,$00,$00,$10,$80,$00,$00,$00,$00,$00,$C0,$00,$12,$00  ; $9FE2
    .byte $30,$00,$00,$00,$40,$00,$00,$00,$0C,$00,$00,$00,$10,$00  ; $9FF2
