; PRG 8 KB bank $18 at $8000
.segment "BANK18"
.org $8000

    JMP loc_18_8235              ; $8000  4C 35 82

    CMP #$FC                     ; $8003  C9 FC
    BNE loc_18_800A              ; $8005  D0 03
    JMP loc_18_8129              ; $8007  4C 29 81


loc_18_800A:
    CMP #$FD                     ; $800A  C9 FD
    BNE loc_18_8011              ; $800C  D0 03
    JMP loc_18_812D              ; $800E  4C 2D 81


loc_18_8011:
    CMP #$FE                     ; $8011  C9 FE
    BNE loc_18_8020              ; $8013  D0 0B
    LDA #$01                     ; $8015  A9 01
    STA $E4                      ; $8017  85 E4
    LDA #$00                     ; $8019  A9 00
    STA $EC                      ; $801B  85 EC
    JMP loc_18_813A              ; $801D  4C 3A 81


loc_18_8020:
    CMP #$FF                     ; $8020  C9 FF
    BNE loc_18_802F              ; $8022  D0 0B
    LDA #$01                     ; $8024  A9 01
    STA $E4                      ; $8026  85 E4
    LDA #$00                     ; $8028  A9 00
    STA $EC                      ; $802A  85 EC
    JMP loc_18_818C              ; $802C  4C 8C 81


loc_18_802F:
    ASL A                        ; $802F  0A
    TAX                          ; $8030  AA
    LDA $8A50,X                  ; $8031  BD 50 8A
    STA $E2                      ; $8034  85 E2
    LDA $8A51,X                  ; $8036  BD 51 8A
    STA $E3                      ; $8039  85 E3
    LDY #$00                     ; $803B  A0 00
    LDA ($E2),Y                  ; $803D  B1 E2
    TAX                          ; $803F  AA
    AND #$0F                     ; $8040  29 0F
    BEQ loc_18_80BB              ; $8042  F0 77
    LDA $E0                      ; $8044  A5 E0
    AND #$0F                     ; $8046  29 0F
    STA $E5                      ; $8048  85 E5
    CPX $E5                      ; $804A  E4 E5
    BCS loc_18_804F              ; $804C  B0 01
    RTS                          ; $804E  60


loc_18_804F:
    STX $E5                      ; $804F  86 E5
    LDA $E0                      ; $8051  A5 E0
    AND #$F0                     ; $8053  29 F0
    ORA $E5                      ; $8055  05 E5
    STA $E0                      ; $8057  85 E0
    LDA #$01                     ; $8059  A9 01
    STA $E4                      ; $805B  85 E4
    LDA #$00                     ; $805D  A9 00
    STA $EC                      ; $805F  85 EC
    LDA #$00                     ; $8061  A9 00
    STA $E7                      ; $8063  85 E7
    STA $E8                      ; $8065  85 E8
    LDA #$04                     ; $8067  A9 04
    STA $E5                      ; $8069  85 E5
    LDA #$01                     ; $806B  A9 01

loc_18_806D:
    CLC                          ; $806D  18
    ADC $E2                      ; $806E  65 E2
    STA $E2                      ; $8070  85 E2
    LDA #$00                     ; $8072  A9 00
    ADC $E3                      ; $8074  65 E3
    STA $E3                      ; $8076  85 E3
    LDX $EC                      ; $8078  A6 EC
    LDY #$00                     ; $807A  A0 00

loc_18_807C:
    LDA ($E2),Y                  ; $807C  B1 E2
    STA $0500,X                  ; $807E  9D 00 05
    INX                          ; $8081  E8
    INY                          ; $8082  C8
    CPY #$02                     ; $8083  C0 02
    BNE loc_18_807C              ; $8085  D0 F5
    LDY #$0E                     ; $8087  A0 0E
    LDA #$00                     ; $8089  A9 00

loc_18_808B:
    STA $0500,X                  ; $808B  9D 00 05
    INX                          ; $808E  E8
    DEY                          ; $808F  88
    BNE loc_18_808B              ; $8090  D0 F9
    LDA $E1                      ; $8092  A5 E1
    LSR A                        ; $8094  4A
    BCS loc_18_809A              ; $8095  B0 03
    JSR sub_18_81B2              ; $8097  20 B2 81

loc_18_809A:
    JSR sub_18_8207              ; $809A  20 07 82
    DEC $E5                      ; $809D  C6 E5
    BEQ loc_18_80A6              ; $809F  F0 05
    LDA #$02                     ; $80A1  A9 02
    JMP loc_18_806D              ; $80A3  4C 6D 80


loc_18_80A6:
    LDY #$02                     ; $80A6  A0 02
    LDA ($E2),Y                  ; $80A8  B1 E2
    STA $057C                    ; $80AA  8D 7C 05
    INY                          ; $80AD  C8
    LDA ($E2),Y                  ; $80AE  B1 E2
    STA $057D                    ; $80B0  8D 7D 05
    JSR sub_18_8219              ; $80B3  20 19 82
    LDA #$00                     ; $80B6  A9 00
    STA $E4                      ; $80B8  85 E4
    RTS                          ; $80BA  60


loc_18_80BB:
    LDA $E0                      ; $80BB  A5 E0
    AND #$F0                     ; $80BD  29 F0
    STA $E5                      ; $80BF  85 E5
    CPX $E5                      ; $80C1  E4 E5
    BCS loc_18_80C6              ; $80C3  B0 01
    RTS                          ; $80C5  60


loc_18_80C6:
    STX $E5                      ; $80C6  86 E5
    LDA $E0                      ; $80C8  A5 E0
    AND #$0F                     ; $80CA  29 0F
    ORA $E5                      ; $80CC  05 E5
    STA $E0                      ; $80CE  85 E0
    LDA #$01                     ; $80D0  A9 01
    STA $E4                      ; $80D2  85 E4
    LDA #$00                     ; $80D4  A9 00
    STA $EC                      ; $80D6  85 EC
    LDX #$00                     ; $80D8  A2 00
    LDA #$02                     ; $80DA  A9 02
    CLC                          ; $80DC  18
    ADC $E2                      ; $80DD  65 E2
    STA $F0                      ; $80DF  85 F0
    TXA                          ; $80E1  8A
    ADC $E3                      ; $80E2  65 E3
    STA $F1                      ; $80E4  85 F1
    STX $F2                      ; $80E6  86 F2
    STX $F3                      ; $80E8  86 F3
    LDY #$01                     ; $80EA  A0 01
    LDA ($E2),Y                  ; $80EC  B1 E2
    AND #$0F                     ; $80EE  29 0F
    TAX                          ; $80F0  AA
    ORA $E1                      ; $80F1  05 E1
    PHA                          ; $80F3  48
    STX $E1                      ; $80F4  86 E1
    LDA #$04                     ; $80F6  A9 04
    STA $E5                      ; $80F8  85 E5
    LDA #$02                     ; $80FA  A9 02
    STA $E6                      ; $80FC  85 E6

loc_18_80FE:
    PLA                          ; $80FE  68
    LSR A                        ; $80FF  4A
    PHA                          ; $8100  48
    BCC loc_18_810E              ; $8101  90 0B
    JSR sub_18_81B2              ; $8103  20 B2 81
    LDA $E1                      ; $8106  A5 E1
    LSR A                        ; $8108  4A
    BCS loc_18_810E              ; $8109  B0 03
    JSR sub_18_816C              ; $810B  20 6C 81

loc_18_810E:
    JSR sub_18_8207              ; $810E  20 07 82
    LDA #$04                     ; $8111  A9 04
    CLC                          ; $8113  18
    ADC $E6                      ; $8114  65 E6
    STA $E6                      ; $8116  85 E6
    DEC $E5                      ; $8118  C6 E5
    BNE loc_18_80FE              ; $811A  D0 E2
    JSR sub_18_8219              ; $811C  20 19 82
    LDA $E1                      ; $811F  A5 E1
    STA $EF                      ; $8121  85 EF
    PLA                          ; $8123  68
    LDA #$00                     ; $8124  A9 00
    STA $E4                      ; $8126  85 E4
    RTS                          ; $8128  60


loc_18_8129:
    INY                          ; $8129  C8
    STY $E7                      ; $812A  84 E7
    RTS                          ; $812C  60


loc_18_812D:
    STY $E8                      ; $812D  84 E8
    LDA #$01                     ; $812F  A9 01
    STA $E9                      ; $8131  85 E9
    LDA $EA                      ; $8133  A5 EA
    AND #$01                     ; $8135  29 01
    STA $EA                      ; $8137  85 EA
    RTS                          ; $8139  60


loc_18_813A:
    LDA $E0                      ; $813A  A5 E0
    AND #$0F                     ; $813C  29 0F
    STA $E0                      ; $813E  85 E0
    LDA #$04                     ; $8140  A9 04
    STA $E5                      ; $8142  85 E5
    LDA #$02                     ; $8144  A9 02
    STA $E6                      ; $8146  85 E6

loc_18_8148:
    LDA $E1                      ; $8148  A5 E1
    LSR A                        ; $814A  4A
    BCC loc_18_8153              ; $814B  90 06
    JSR sub_18_81B2              ; $814D  20 B2 81
    JSR sub_18_816C              ; $8150  20 6C 81

loc_18_8153:
    JSR sub_18_8207              ; $8153  20 07 82
    LDA #$04                     ; $8156  A9 04
    CLC                          ; $8158  18
    ADC $E6                      ; $8159  65 E6
    STA $E6                      ; $815B  85 E6
    DEC $E5                      ; $815D  C6 E5
    BNE loc_18_8148              ; $815F  D0 E7
    LDA #$00                     ; $8161  A9 00
    STA $E1                      ; $8163  85 E1
    STA $EF                      ; $8165  85 EF
    LDA #$00                     ; $8167  A9 00
    STA $E4                      ; $8169  85 E4
    RTS                          ; $816B  60


sub_18_816C:
    LDA $EC                      ; $816C  A5 EC
    CLC                          ; $816E  18
    ADC #$0A                     ; $816F  69 0A
    TAX                          ; $8171  AA
    LDA $0500,X                  ; $8172  BD 00 05
    ORA $0501,X                  ; $8175  1D 01 05
    BNE loc_18_81C4              ; $8178  D0 4A
    LDY $E5                      ; $817A  A4 E5
    LDX $E6                      ; $817C  A6 E6
    JSR sub_18_8222              ; $817E  20 22 82
    LDX $EC                      ; $8181  A6 EC
    LDA $0500,X                  ; $8183  BD 00 05
    ORA $0501,X                  ; $8186  1D 01 05
    BNE loc_18_81C4              ; $8189  D0 39
    RTS                          ; $818B  60


loc_18_818C:
    LDA $E0                      ; $818C  A5 E0
    AND #$F0                     ; $818E  29 F0
    STA $E0                      ; $8190  85 E0
    LDA #$00                     ; $8192  A9 00
    STA $E7                      ; $8194  85 E7
    STA $E8                      ; $8196  85 E8
    LDA #$04                     ; $8198  A9 04
    STA $E5                      ; $819A  85 E5

loc_18_819C:
    LDA #$00                     ; $819C  A9 00
    LDX $EC                      ; $819E  A6 EC
    STA $0500,X                  ; $81A0  9D 00 05
    STA $0501,X                  ; $81A3  9D 01 05
    JSR sub_18_8211              ; $81A6  20 11 82
    DEC $E5                      ; $81A9  C6 E5
    BNE loc_18_819C              ; $81AB  D0 EF
    LDA #$00                     ; $81AD  A9 00
    STA $E4                      ; $81AF  85 E4
    RTS                          ; $81B1  60


sub_18_81B2:
    LDY #$0F                     ; $81B2  A0 0F
    LDA #$10                     ; $81B4  A9 10
    CLC                          ; $81B6  18
    ADC $EC                      ; $81B7  65 EC
    TAX                          ; $81B9  AA
    LDA #$00                     ; $81BA  A9 00

loc_18_81BC:
    STA $0500,X                  ; $81BC  9D 00 05
    INX                          ; $81BF  E8
    DEY                          ; $81C0  88
    BNE loc_18_81BC              ; $81C1  D0 F9
    RTS                          ; $81C3  60


loc_18_81C4:
    LDA $E5                      ; $81C4  A5 E5
    PHA                          ; $81C6  48
    LDA $E6                      ; $81C7  A5 E6
    PHA                          ; $81C9  48
    LDA $057C                    ; $81CA  AD 7C 05
    STA $E5                      ; $81CD  85 E5
    LDA $057D                    ; $81CF  AD 7D 05
    STA $E6                      ; $81D2  85 E6
    LDA $EC                      ; $81D4  A5 EC
    CLC                          ; $81D6  18
    ADC #$06                     ; $81D7  69 06
    TAX                          ; $81D9  AA
    LDA $0500,X                  ; $81DA  BD 00 05
    AND #$1F                     ; $81DD  29 1F
    BEQ loc_18_81EA              ; $81DF  F0 09
    TAY                          ; $81E1  A8
    LDA #$00                     ; $81E2  A9 00

loc_18_81E4:
    CLC                          ; $81E4  18
    ADC #$04                     ; $81E5  69 04
    DEY                          ; $81E7  88
    BNE loc_18_81E4              ; $81E8  D0 FA

loc_18_81EA:
    TAY                          ; $81EA  A8
    TXA                          ; $81EB  8A
    CLC                          ; $81EC  18
    ADC #$0E                     ; $81ED  69 0E
    TAX                          ; $81EF  AA
    LDA #$04                     ; $81F0  A9 04

loc_18_81F2:
    PHA                          ; $81F2  48
    LDA ($E5),Y                  ; $81F3  B1 E5
    STA $0500,X                  ; $81F5  9D 00 05
    INY                          ; $81F8  C8
    INX                          ; $81F9  E8
    PLA                          ; $81FA  68
    SEC                          ; $81FB  38
    SBC #$01                     ; $81FC  E9 01
    BNE loc_18_81F2              ; $81FE  D0 F2
    PLA                          ; $8200  68
    STA $E6                      ; $8201  85 E6
    PLA                          ; $8203  68
    STA $E5                      ; $8204  85 E5
    RTS                          ; $8206  60


sub_18_8207:
    LSR $E1                      ; $8207  46 E1
    BCC sub_18_8211              ; $8209  90 06
    LDA $E1                      ; $820B  A5 E1
    ORA #$80                     ; $820D  09 80
    STA $E1                      ; $820F  85 E1

sub_18_8211:
    LDA #$1F                     ; $8211  A9 1F
    CLC                          ; $8213  18
    ADC $EC                      ; $8214  65 EC
    STA $EC                      ; $8216  85 EC
    RTS                          ; $8218  60


sub_18_8219:
    LSR $E1                      ; $8219  46 E1
    LSR $E1                      ; $821B  46 E1
    LSR $E1                      ; $821D  46 E1
    LSR $E1                      ; $821F  46 E1
    RTS                          ; $8221  60


sub_18_8222:
    CPY #$01                     ; $8222  C0 01
    BEQ loc_18_822F              ; $8224  F0 09
    LDA #$00                     ; $8226  A9 00
    STA $4000,X                  ; $8228  9D 00 40
    STA $4001,X                  ; $822B  9D 01 40
    RTS                          ; $822E  60


loc_18_822F:
    LDA #$07                     ; $822F  A9 07
    STA $4015                    ; $8231  8D 15 40
    RTS                          ; $8234  60


loc_18_8235:
    INC $EA                      ; $8235  E6 EA
    LDA $E4                      ; $8237  A5 E4
    BEQ loc_18_823C              ; $8239  F0 01
    RTS                          ; $823B  60


loc_18_823C:
    LDX #$00                     ; $823C  A2 00
    LDY #$05                     ; $823E  A0 05
    STX $EC                      ; $8240  86 EC
    STY $ED                      ; $8242  84 ED
    LDA #$00                     ; $8244  A9 00
    STA $EB                      ; $8246  85 EB
    LDA #$04                     ; $8248  A9 04
    STA $EE                      ; $824A  85 EE

loc_18_824C:
    LDA #$01                     ; $824C  A9 01
    LDY #$18                     ; $824E  A0 18
    CLC                          ; $8250  18
    ADC ($EC),Y                  ; $8251  71 EC
    STA ($EC),Y                  ; $8253  91 EC
    LDA #$01                     ; $8255  A9 01
    LDY #$1D                     ; $8257  A0 1D
    CLC                          ; $8259  18
    ADC ($EC),Y                  ; $825A  71 EC
    STA ($EC),Y                  ; $825C  91 EC
    LDA $EF                      ; $825E  A5 EF
    LSR A                        ; $8260  4A
    BCC loc_18_8266              ; $8261  90 03
    JSR sub_18_856D              ; $8263  20 6D 85

loc_18_8266:
    LDA $41                      ; $8266  A5 41
    LSR A                        ; $8268  4A
    BCC loc_18_826E              ; $8269  90 03
    JMP loc_18_8286              ; $826B  4C 86 82


loc_18_826E:
    LDY #$00                     ; $826E  A0 00
    LDA ($EC),Y                  ; $8270  B1 EC
    INY                          ; $8272  C8
    ORA ($EC),Y                  ; $8273  11 EC
    BEQ loc_18_8286              ; $8275  F0 0F
    LDA #$01                     ; $8277  A9 01
    LDY #$0E                     ; $8279  A0 0E
    CLC                          ; $827B  18
    ADC ($EC),Y                  ; $827C  71 EC
    STA ($EC),Y                  ; $827E  91 EC
    JSR sub_18_86B4              ; $8280  20 B4 86
    JMP loc_18_8294              ; $8283  4C 94 82


loc_18_8286:
    LDA $EF                      ; $8286  A5 EF
    LSR A                        ; $8288  4A
    BCS loc_18_8294              ; $8289  B0 09
    LDX $EB                      ; $828B  A6 EB
    INX                          ; $828D  E8
    INX                          ; $828E  E8
    LDY $EE                      ; $828F  A4 EE
    JSR sub_18_8222              ; $8291  20 22 82

loc_18_8294:
    LSR $EF                      ; $8294  46 EF
    BCC loc_18_829E              ; $8296  90 06
    LDA $EF                      ; $8298  A5 EF
    ORA #$80                     ; $829A  09 80
    STA $EF                      ; $829C  85 EF

loc_18_829E:
    DEC $EE                      ; $829E  C6 EE
    BEQ loc_18_82B9              ; $82A0  F0 17
    LDA #$04                     ; $82A2  A9 04
    CLC                          ; $82A4  18
    ADC $EB                      ; $82A5  65 EB
    STA $EB                      ; $82A7  85 EB
    LDA #$1F                     ; $82A9  A9 1F
    CLC                          ; $82AB  18
    ADC $EC                      ; $82AC  65 EC
    STA $EC                      ; $82AE  85 EC
    LDA #$00                     ; $82B0  A9 00
    ADC $ED                      ; $82B2  65 ED
    STA $ED                      ; $82B4  85 ED
    JMP loc_18_824C              ; $82B6  4C 4C 82


loc_18_82B9:
    LDA $E8                      ; $82B9  A5 E8
    AND #$7F                     ; $82BB  29 7F
    BEQ loc_18_82DD              ; $82BD  F0 1E
    CMP $EA                      ; $82BF  C5 EA
    BNE loc_18_82DD              ; $82C1  D0 1A
    LDA $EA                      ; $82C3  A5 EA
    AND #$01                     ; $82C5  29 01
    STA $EA                      ; $82C7  85 EA
    INC $E9                      ; $82C9  E6 E9
    LDA #$10                     ; $82CB  A9 10
    CMP $E9                      ; $82CD  C5 E9
    BNE loc_18_82DD              ; $82CF  D0 0C
    LDA $E8                      ; $82D1  A5 E8
    BMI loc_18_82D9              ; $82D3  30 04
    LDA #$00                     ; $82D5  A9 00
    STA $E8                      ; $82D7  85 E8

loc_18_82D9:
    LDA #$0F                     ; $82D9  A9 0F
    STA $E9                      ; $82DB  85 E9

loc_18_82DD:
    LDA $F2                      ; $82DD  A5 F2
    BEQ loc_18_82E3              ; $82DF  F0 02
    DEC $F2                      ; $82E1  C6 F2

loc_18_82E3:
    LSR $EF                      ; $82E3  46 EF
    LSR $EF                      ; $82E5  46 EF
    LSR $EF                      ; $82E7  46 EF
    LSR $EF                      ; $82E9  46 EF
    RTS                          ; $82EB  60


loc_18_82EC:
    LDY #$0C                     ; $82EC  A0 0C
    LDA ($EC),Y                  ; $82EE  B1 EC
    LDY #$02                     ; $82F0  A0 02
    CPY $EE                      ; $82F2  C4 EE
    BEQ loc_18_82F8              ; $82F4  F0 02
    AND #$0F                     ; $82F6  29 0F

loc_18_82F8:
    STA $F4                      ; $82F8  85 F4
    LDA $E8                      ; $82FA  A5 E8
    AND #$7F                     ; $82FC  29 7F
    BEQ loc_18_832B              ; $82FE  F0 2B
    LDA $E9                      ; $8300  A5 E9
    LDY #$02                     ; $8302  A0 02
    CPY $EE                      ; $8304  C4 EE
    BNE loc_18_8310              ; $8306  D0 08
    LDX #$0C                     ; $8308  A2 0C

loc_18_830A:
    CLC                          ; $830A  18
    ADC $E9                      ; $830B  65 E9
    DEX                          ; $830D  CA
    BNE loc_18_830A              ; $830E  D0 FA

loc_18_8310:
    TAY                          ; $8310  A8
    LDA $E8                      ; $8311  A5 E8
    BMI loc_18_8324              ; $8313  30 0F
    LDX #$FF                     ; $8315  A2 FF

loc_18_8317:
    INX                          ; $8317  E8
    CPX $F4                      ; $8318  E4 F4
    BEQ loc_18_832B              ; $831A  F0 0F
    DEY                          ; $831C  88
    BNE loc_18_8317              ; $831D  D0 F8
    STX $F4                      ; $831F  86 F4
    JMP loc_18_832B              ; $8321  4C 2B 83


loc_18_8324:
    DEC $F4                      ; $8324  C6 F4
    BEQ loc_18_832B              ; $8326  F0 03
    DEY                          ; $8328  88
    BNE loc_18_8324              ; $8329  D0 F9

loc_18_832B:
    LDA #$02                     ; $832B  A9 02
    CMP $EE                      ; $832D  C5 EE
    BEQ loc_18_837C              ; $832F  F0 4B
    LDY #$0D                     ; $8331  A0 0D
    LDA ($EC),Y                  ; $8333  B1 EC
    TAX                          ; $8335  AA
    AND #$7F                     ; $8336  29 7F
    BEQ loc_18_837C              ; $8338  F0 42
    INY                          ; $833A  C8
    CMP ($EC),Y                  ; $833B  D1 EC
    BEQ loc_18_8347              ; $833D  F0 08
    INY                          ; $833F  C8
    LDA ($EC),Y                  ; $8340  B1 EC
    AND #$0F                     ; $8342  29 0F
    JMP loc_18_836C              ; $8344  4C 6C 83


loc_18_8347:
    LDA #$00                     ; $8347  A9 00
    STA ($EC),Y                  ; $8349  91 EC
    INY                          ; $834B  C8
    LDA ($EC),Y                  ; $834C  B1 EC
    LSR A                        ; $834E  4A
    LSR A                        ; $834F  4A
    LSR A                        ; $8350  4A
    LSR A                        ; $8351  4A
    STA $F5                      ; $8352  85 F5
    TXA                          ; $8354  8A
    BPL loc_18_835E              ; $8355  10 07
    LDA #$00                     ; $8357  A9 00
    SEC                          ; $8359  38
    SBC $F5                      ; $835A  E5 F5
    STA $F5                      ; $835C  85 F5

loc_18_835E:
    LDA ($EC),Y                  ; $835E  B1 EC
    AND #$0F                     ; $8360  29 0F
    CLC                          ; $8362  18
    ADC $F5                      ; $8363  65 F5
    BPL loc_18_836C              ; $8365  10 05
    LDA #$00                     ; $8367  A9 00
    JMP loc_18_8372              ; $8369  4C 72 83


loc_18_836C:
    CMP $F4                      ; $836C  C5 F4
    BCC loc_18_8372              ; $836E  90 02
    LDA $F4                      ; $8370  A5 F4

loc_18_8372:
    STA $F4                      ; $8372  85 F4
    LDA ($EC),Y                  ; $8374  B1 EC
    AND #$F0                     ; $8376  29 F0
    ORA $F4                      ; $8378  05 F4
    STA ($EC),Y                  ; $837A  91 EC

loc_18_837C:
    LDA $EF                      ; $837C  A5 EF
    LSR A                        ; $837E  4A
    BCS loc_18_8388              ; $837F  B0 07
    LDA #$0C                     ; $8381  A9 0C
    STA $F5                      ; $8383  85 F5
    JMP loc_18_838F              ; $8385  4C 8F 83


loc_18_8388:
    LDA #$09                     ; $8388  A9 09
    STA $F5                      ; $838A  85 F5
    JMP loc_18_83FE              ; $838C  4C FE 83


loc_18_838F:
    LDY #$16                     ; $838F  A0 16
    LDA ($EC),Y                  ; $8391  B1 EC
    AND #$7F                     ; $8393  29 7F
    BEQ loc_18_83D5              ; $8395  F0 3E
    LDY #$1D                     ; $8397  A0 1D
    CMP ($EC),Y                  ; $8399  D1 EC
    BEQ loc_18_83A0              ; $839B  F0 03
    JMP loc_18_83CB              ; $839D  4C CB 83


loc_18_83A0:
    LDA #$00                     ; $83A0  A9 00
    STA ($EC),Y                  ; $83A2  91 EC
    LDY #$17                     ; $83A4  A0 17
    LDA ($EC),Y                  ; $83A6  B1 EC
    LDY #$1E                     ; $83A8  A0 1E
    CLC                          ; $83AA  18
    ADC ($EC),Y                  ; $83AB  71 EC
    BEQ loc_18_83B1              ; $83AD  F0 02
    BPL loc_18_83B8              ; $83AF  10 07

loc_18_83B1:
    LDA #$01                     ; $83B1  A9 01
    STA ($EC),Y                  ; $83B3  91 EC
    JMP loc_18_83C2              ; $83B5  4C C2 83


loc_18_83B8:
    STA ($EC),Y                  ; $83B8  91 EC
    CMP #$10                     ; $83BA  C9 10
    BCC loc_18_83CB              ; $83BC  90 0D
    LDA #$0F                     ; $83BE  A9 0F
    STA ($EC),Y                  ; $83C0  91 EC

loc_18_83C2:
    LDA #$00                     ; $83C2  A9 00
    LDY #$17                     ; $83C4  A0 17
    SEC                          ; $83C6  38
    SBC ($EC),Y                  ; $83C7  F1 EC
    STA ($EC),Y                  ; $83C9  91 EC

loc_18_83CB:
    LDY #$1E                     ; $83CB  A0 1E
    LDA ($EC),Y                  ; $83CD  B1 EC
    CMP $F4                      ; $83CF  C5 F4
    BCS loc_18_83D5              ; $83D1  B0 02
    STA $F4                      ; $83D3  85 F4

loc_18_83D5:
    LDY #$02                     ; $83D5  A0 02
    CPY $EE                      ; $83D7  C4 EE
    BEQ loc_18_83E8              ; $83D9  F0 0D
    LDA $F5                      ; $83DB  A5 F5
    AND #$7F                     ; $83DD  29 7F
    TAY                          ; $83DF  A8
    LDA ($EC),Y                  ; $83E0  B1 EC
    AND #$F0                     ; $83E2  29 F0
    ORA $F4                      ; $83E4  05 F4
    STA $F4                      ; $83E6  85 F4

loc_18_83E8:
    LDX $EB                      ; $83E8  A6 EB
    LDA $F4                      ; $83EA  A5 F4
    STA $4000,X                  ; $83EC  9D 00 40
    LDA $F5                      ; $83EF  A5 F5
    BPL loc_18_83FA              ; $83F1  10 07
    LDA #$90                     ; $83F3  A9 90
    STA $F5                      ; $83F5  85 F5
    JMP loc_18_83FE              ; $83F7  4C FE 83


loc_18_83FA:
    LDA #$09                     ; $83FA  A9 09
    STA $F5                      ; $83FC  85 F5

loc_18_83FE:
    LDA $F5                      ; $83FE  A5 F5
    AND #$7F                     ; $8400  29 7F
    TAY                          ; $8402  A8
    LDX #$00                     ; $8403  A2 00
    LDA ($EC),Y                  ; $8405  B1 EC
    BEQ loc_18_8418              ; $8407  F0 0F
    BPL loc_18_840C              ; $8409  10 01
    DEX                          ; $840B  CA

loc_18_840C:
    INY                          ; $840C  C8
    CLC                          ; $840D  18
    ADC ($EC),Y                  ; $840E  71 EC
    STA ($EC),Y                  ; $8410  91 EC
    TXA                          ; $8412  8A
    INY                          ; $8413  C8
    ADC ($EC),Y                  ; $8414  71 EC
    STA ($EC),Y                  ; $8416  91 EC

loc_18_8418:
    LDA $F5                      ; $8418  A5 F5
    BMI loc_18_8422              ; $841A  30 06
    LDA $EF                      ; $841C  A5 EF
    LSR A                        ; $841E  4A
    BCC loc_18_8422              ; $841F  90 01
    RTS                          ; $8421  60


loc_18_8422:
    LDY #$14                     ; $8422  A0 14
    LDA ($EC),Y                  ; $8424  B1 EC
    AND #$7F                     ; $8426  29 7F
    BNE loc_18_842D              ; $8428  D0 03
    JMP loc_18_84A9              ; $842A  4C A9 84


loc_18_842D:
    LDY #$18                     ; $842D  A0 18
    CMP ($EC),Y                  ; $842F  D1 EC
    BEQ loc_18_8436              ; $8431  F0 03
    JMP loc_18_84A9              ; $8433  4C A9 84


loc_18_8436:
    LDA #$00                     ; $8436  A9 00
    STA ($EC),Y                  ; $8438  91 EC
    TAX                          ; $843A  AA
    LDY #$15                     ; $843B  A0 15
    LDA ($EC),Y                  ; $843D  B1 EC
    ROL A                        ; $843F  2A
    ROL A                        ; $8440  2A
    ROL A                        ; $8441  2A
    ROL A                        ; $8442  2A
    AND #$07                     ; $8443  29 07
    STA $F4                      ; $8445  85 F4
    LDY #$19                     ; $8447  A0 19
    LDA ($EC),Y                  ; $8449  B1 EC
    ASL A                        ; $844B  0A
    BCC loc_18_8456              ; $844C  90 08
    LDA #$00                     ; $844E  A9 00
    SEC                          ; $8450  38
    SBC $F4                      ; $8451  E5 F4
    STA $F4                      ; $8453  85 F4
    DEX                          ; $8455  CA

loc_18_8456:
    LDA $F4                      ; $8456  A5 F4
    CLC                          ; $8458  18
    LDY #$1A                     ; $8459  A0 1A
    ADC ($EC),Y                  ; $845B  71 EC
    STA ($EC),Y                  ; $845D  91 EC
    INY                          ; $845F  C8
    TXA                          ; $8460  8A
    ADC ($EC),Y                  ; $8461  71 EC
    STA ($EC),Y                  ; $8463  91 EC
    LDY #$15                     ; $8465  A0 15
    LDA ($EC),Y                  ; $8467  B1 EC
    AND #$1F                     ; $8469  29 1F
    STA $F4                      ; $846B  85 F4
    LDY #$19                     ; $846D  A0 19
    LDA ($EC),Y                  ; $846F  B1 EC
    CLC                          ; $8471  18
    ADC #$01                     ; $8472  69 01
    STA ($EC),Y                  ; $8474  91 EC
    AND #$7F                     ; $8476  29 7F
    CMP $F4                      ; $8478  C5 F4
    BNE loc_18_84A9              ; $847A  D0 2D
    LDA ($EC),Y                  ; $847C  B1 EC
    AND #$80                     ; $847E  29 80
    STA ($EC),Y                  ; $8480  91 EC
    LDY #$14                     ; $8482  A0 14
    LDA ($EC),Y                  ; $8484  B1 EC
    ASL A                        ; $8486  0A
    BCS loc_18_84A3              ; $8487  B0 1A
    LDA ($EC),Y                  ; $8489  B1 EC
    ORA #$80                     ; $848B  09 80
    STA ($EC),Y                  ; $848D  91 EC
    LDY #$19                     ; $848F  A0 19
    LDA ($EC),Y                  ; $8491  B1 EC
    BPL loc_18_849C              ; $8493  10 07
    AND #$7F                     ; $8495  29 7F
    STA ($EC),Y                  ; $8497  91 EC
    JMP loc_18_84A9              ; $8499  4C A9 84


loc_18_849C:
    ORA #$80                     ; $849C  09 80
    STA ($EC),Y                  ; $849E  91 EC
    JMP loc_18_84A9              ; $84A0  4C A9 84


loc_18_84A3:
    LDA ($EC),Y                  ; $84A3  B1 EC
    AND #$7F                     ; $84A5  29 7F
    STA ($EC),Y                  ; $84A7  91 EC

loc_18_84A9:
    LDA $F5                      ; $84A9  A5 F5
    AND #$7F                     ; $84AB  29 7F
    STA $F5                      ; $84AD  85 F5
    INC $F5                      ; $84AF  E6 F5
    LDY #$1A                     ; $84B1  A0 1A
    LDA ($EC),Y                  ; $84B3  B1 EC
    LDY $F5                      ; $84B5  A4 F5
    CLC                          ; $84B7  18
    ADC ($EC),Y                  ; $84B8  71 EC
    TAX                          ; $84BA  AA
    LDY #$1B                     ; $84BB  A0 1B
    LDA ($EC),Y                  ; $84BD  B1 EC
    INC $F5                      ; $84BF  E6 F5
    LDY $F5                      ; $84C1  A4 F5
    ADC ($EC),Y                  ; $84C3  71 EC
    TAY                          ; $84C5  A8
    LDA #$01                     ; $84C6  A9 01
    CMP $EE                      ; $84C8  C5 EE
    BNE loc_18_84E5              ; $84CA  D0 19
    LDA #$0F                     ; $84CC  A9 0F
    STA $4015                    ; $84CE  8D 15 40
    TXA                          ; $84D1  8A
    AND #$0F                     ; $84D2  29 0F
    TAX                          ; $84D4  AA
    INC $F5                      ; $84D5  E6 F5
    LDY $F5                      ; $84D7  A4 F5
    LDA ($EC),Y                  ; $84D9  B1 EC
    AND #$80                     ; $84DB  29 80
    STA $F4                      ; $84DD  85 F4
    TXA                          ; $84DF  8A
    ORA $F4                      ; $84E0  05 F4
    TAX                          ; $84E2  AA
    LDY #$00                     ; $84E3  A0 00

loc_18_84E5:
    TXA                          ; $84E5  8A
    LDX $EB                      ; $84E6  A6 EB
    INX                          ; $84E8  E8
    INX                          ; $84E9  E8
    STA $4000,X                  ; $84EA  9D 00 40
    TYA                          ; $84ED  98
    LDY #$1C                     ; $84EE  A0 1C
    CMP ($EC),Y                  ; $84F0  D1 EC
    BNE loc_18_84F5              ; $84F2  D0 01
    RTS                          ; $84F4  60


loc_18_84F5:
    STA ($EC),Y                  ; $84F5  91 EC
    ORA #$08                     ; $84F7  09 08
    STA $4001,X                  ; $84F9  9D 01 40
    RTS                          ; $84FC  60


loc_18_84FD:
    LDY #$01                     ; $84FD  A0 01
    CPY $EE                      ; $84FF  C4 EE
    BNE loc_18_8509              ; $8501  D0 06
    LDA #$07                     ; $8503  A9 07
    STA $4015                    ; $8505  8D 15 40
    RTS                          ; $8508  60


loc_18_8509:
    LDA #$00                     ; $8509  A9 00
    LDX $EB                      ; $850B  A6 EB
    INX                          ; $850D  E8
    INX                          ; $850E  E8
    STA $4000,X                  ; $850F  9D 00 40
    STA $4001,X                  ; $8512  9D 01 40
    RTS                          ; $8515  60


sub_18_8516:
    LDY #$14                     ; $8516  A0 14
    LDA ($EC),Y                  ; $8518  B1 EC
    AND #$7F                     ; $851A  29 7F
    STA ($EC),Y                  ; $851C  91 EC
    LDY #$16                     ; $851E  A0 16
    LDA ($EC),Y                  ; $8520  B1 EC
    ASL A                        ; $8522  0A
    BCC loc_18_8535              ; $8523  90 10
    LDY $F4                      ; $8525  A4 F4
    LDA ($EC),Y                  ; $8527  B1 EC
    LDX #$02                     ; $8529  A2 02
    CPX $EE                      ; $852B  E4 EE
    BEQ loc_18_8531              ; $852D  F0 02
    AND #$0F                     ; $852F  29 0F

loc_18_8531:
    LDY #$1E                     ; $8531  A0 1E
    STA ($EC),Y                  ; $8533  91 EC

loc_18_8535:
    LDX #$06                     ; $8535  A2 06
    LDA #$00                     ; $8537  A9 00
    LDY #$18                     ; $8539  A0 18

loc_18_853B:
    STA ($EC),Y                  ; $853B  91 EC
    INY                          ; $853D  C8
    DEX                          ; $853E  CA
    BNE loc_18_853B              ; $853F  D0 FA
    LDA #$FF                     ; $8541  A9 FF
    LDY #$1C                     ; $8543  A0 1C
    STA ($EC),Y                  ; $8545  91 EC
    RTS                          ; $8547  60


loc_18_8548:
    LDY #$1C                     ; $8548  A0 1C
    LDA ($EC),Y                  ; $854A  B1 EC
    PHA                          ; $854C  48
    JSR sub_18_8516              ; $854D  20 16 85
    PLA                          ; $8550  68
    LDY #$1C                     ; $8551  A0 1C
    STA ($EC),Y                  ; $8553  91 EC
    RTS                          ; $8555  60


sub_18_8556:
    TXA                          ; $8556  8A
    ASL A                        ; $8557  0A
    TAY                          ; $8558  A8
    INY                          ; $8559  C8
    PLA                          ; $855A  68
    STA $F4                      ; $855B  85 F4
    PLA                          ; $855D  68
    STA $F5                      ; $855E  85 F5
    LDA ($F4),Y                  ; $8560  B1 F4
    TAX                          ; $8562  AA
    INY                          ; $8563  C8
    LDA ($F4),Y                  ; $8564  B1 F4
    STA $F5                      ; $8566  85 F5
    STX $F4                      ; $8568  86 F4
    JMP ($00F4)                  ; $856A  6C F4 00


sub_18_856D:
    LDA $F2                      ; $856D  A5 F2
    BNE loc_18_8574              ; $856F  D0 03
    JMP loc_18_8592              ; $8571  4C 92 85


loc_18_8574:
    LDY #$11                     ; $8574  A0 11
    LDA ($EC),Y                  ; $8576  B1 EC
    INY                          ; $8578  C8
    ORA ($EC),Y                  ; $8579  11 EC
    BNE loc_18_857E              ; $857B  D0 01
    RTS                          ; $857D  60


loc_18_857E:
    INY                          ; $857E  C8
    LDA ($EC),Y                  ; $857F  B1 EC
    LDY #$02                     ; $8581  A0 02
    CPY $EE                      ; $8583  C4 EE
    BEQ loc_18_8589              ; $8585  F0 02
    AND #$0F                     ; $8587  29 0F

loc_18_8589:
    STA $F4                      ; $8589  85 F4
    LDA #$93                     ; $858B  A9 93
    STA $F5                      ; $858D  85 F5
    JMP loc_18_838F              ; $858F  4C 8F 83


loc_18_8592:
    JSR sub_18_86A0              ; $8592  20 A0 86
    ASL A                        ; $8595  0A
    BCS loc_18_859B              ; $8596  B0 03
    JMP loc_18_85C2              ; $8598  4C C2 85


loc_18_859B:
    TXA                          ; $859B  8A
    AND #$0F                     ; $859C  29 0F
    CMP #$0F                     ; $859E  C9 0F
    BNE loc_18_85A8              ; $85A0  D0 06
    JSR sub_18_86A0              ; $85A2  20 A0 86
    JMP loc_18_8548              ; $85A5  4C 48 85


loc_18_85A8:
    AND #$07                     ; $85A8  29 07
    STA $F4                      ; $85AA  85 F4
    JSR sub_18_86A0              ; $85AC  20 A0 86
    LDY #$11                     ; $85AF  A0 11
    STA ($EC),Y                  ; $85B1  91 EC
    INY                          ; $85B3  C8
    LDA $F4                      ; $85B4  A5 F4
    STA ($EC),Y                  ; $85B6  91 EC
    LDA #$13                     ; $85B8  A9 13
    STA $F4                      ; $85BA  85 F4
    JSR sub_18_8516              ; $85BC  20 16 85
    JMP loc_18_84FD              ; $85BF  4C FD 84


loc_18_85C2:
    JSR sub_18_8556              ; $85C2  20 56 85
    DCP ($85),Y                  ; $85C5  D3 85
    DCP $E585,Y                  ; $85C7  DB 85 E5
    STA $F5                      ; $85CA  85 F5
    STA $0F                      ; $85CC  85 0F
    STX $40                      ; $85CE  86 40
    STX $56                      ; $85D0  86 56
    STX $20                      ; $85D2  86 20
    LDY #$86                     ; $85D4  A0 86
    STA $F2                      ; $85D6  85 F2
    JMP loc_18_8592              ; $85D8  4C 92 85

    JSR sub_18_86A0              ; $85DB  20 A0 86
    LDY #$10                     ; $85DE  A0 10
    STA ($EC),Y                  ; $85E0  91 EC
    JMP loc_18_8592              ; $85E2  4C 92 85

    JSR sub_18_86A0              ; $85E5  20 A0 86
    STA $F4                      ; $85E8  85 F4
    LDY #$13                     ; $85EA  A0 13
    LDA ($EC),Y                  ; $85EC  B1 EC
    AND #$3F                     ; $85EE  29 3F
    ORA $F4                      ; $85F0  05 F4
    JMP loc_18_8608              ; $85F2  4C 08 86

    JSR sub_18_86A0              ; $85F5  20 A0 86
    LDY #$02                     ; $85F8  A0 02
    CPY $EE                      ; $85FA  C4 EE
    BEQ loc_18_8608              ; $85FC  F0 0A
    STA $F4                      ; $85FE  85 F4
    LDY #$13                     ; $8600  A0 13
    LDA ($EC),Y                  ; $8602  B1 EC
    AND #$C0                     ; $8604  29 C0
    ORA $F4                      ; $8606  05 F4

loc_18_8608:
    LDY #$13                     ; $8608  A0 13
    STA ($EC),Y                  ; $860A  91 EC
    JMP loc_18_8592              ; $860C  4C 92 85

    JSR sub_18_86A0              ; $860F  20 A0 86
    TXA                          ; $8612  8A
    BEQ loc_18_861B              ; $8613  F0 06
    CPX $F3                      ; $8615  E4 F3
    BEQ loc_18_862C              ; $8617  F0 13
    INC $F3                      ; $8619  E6 F3

loc_18_861B:
    JSR sub_18_86A0              ; $861B  20 A0 86
    STA $F4                      ; $861E  85 F4
    JSR sub_18_86A0              ; $8620  20 A0 86
    STA $F1                      ; $8623  85 F1
    LDA $F4                      ; $8625  A5 F4
    STA $F0                      ; $8627  85 F0
    JMP loc_18_8592              ; $8629  4C 92 85


loc_18_862C:
    LDA #$00                     ; $862C  A9 00
    STA $F3                      ; $862E  85 F3
    LDA #$02                     ; $8630  A9 02
    CLC                          ; $8632  18
    ADC $F0                      ; $8633  65 F0
    STA $F0                      ; $8635  85 F0
    LDA #$00                     ; $8637  A9 00
    ADC $F1                      ; $8639  65 F1
    STA $F1                      ; $863B  85 F1
    JMP loc_18_8592              ; $863D  4C 92 85

    LDA #$14                     ; $8640  A9 14
    STA $F4                      ; $8642  85 F4

loc_18_8644:
    JSR sub_18_86A0              ; $8644  20 A0 86
    LDY $F4                      ; $8647  A4 F4
    STA ($EC),Y                  ; $8649  91 EC
    INC $F4                      ; $864B  E6 F4
    LDY $F4                      ; $864D  A4 F4
    CPY #$18                     ; $864F  C0 18
    BNE loc_18_8644              ; $8651  D0 F1
    JMP loc_18_8592              ; $8653  4C 92 85

    LDA $F0                      ; $8656  A5 F0
    SEC                          ; $8658  38
    SBC #$01                     ; $8659  E9 01
    STA $F0                      ; $865B  85 F0
    LDA $F1                      ; $865D  A5 F1
    SBC #$00                     ; $865F  E9 00
    STA $F1                      ; $8661  85 F1
    LDA $E0                      ; $8663  A5 E0
    AND #$0F                     ; $8665  29 0F
    STA $E0                      ; $8667  85 E0
    LDA #$00                     ; $8669  A9 00
    STA $E1                      ; $866B  85 E1
    LDA $EF                      ; $866D  A5 EF
    AND #$FE                     ; $866F  29 FE
    STA $EF                      ; $8671  85 EF
    LDY #$0A                     ; $8673  A0 0A
    LDA ($EC),Y                  ; $8675  B1 EC
    INY                          ; $8677  C8
    ORA ($EC),Y                  ; $8678  11 EC
    BNE loc_18_868F              ; $867A  D0 13
    LDX $EB                      ; $867C  A6 EB
    INX                          ; $867E  E8
    INX                          ; $867F  E8
    LDY $EE                      ; $8680  A4 EE
    JSR sub_18_8222              ; $8682  20 22 82
    LDY #$00                     ; $8685  A0 00
    LDA ($EC),Y                  ; $8687  B1 EC
    INY                          ; $8689  C8
    ORA ($EC),Y                  ; $868A  11 EC
    BNE loc_18_868F              ; $868C  D0 01
    RTS                          ; $868E  60


loc_18_868F:
    LDY #$06                     ; $868F  A0 06
    LDA ($EC),Y                  ; $8691  B1 EC
    AND #$1F                     ; $8693  29 1F
    TAX                          ; $8695  AA
    JSR sub_18_88E1              ; $8696  20 E1 88
    LDA #$0C                     ; $8699  A9 0C
    STA $F4                      ; $869B  85 F4
    JMP sub_18_8516              ; $869D  4C 16 85


sub_18_86A0:
    LDY #$00                     ; $86A0  A0 00
    LDA ($F0),Y                  ; $86A2  B1 F0
    TAX                          ; $86A4  AA
    LDA #$01                     ; $86A5  A9 01
    CLC                          ; $86A7  18
    ADC $F0                      ; $86A8  65 F0
    STA $F0                      ; $86AA  85 F0
    LDA #$00                     ; $86AC  A9 00
    ADC $F1                      ; $86AE  65 F1
    STA $F1                      ; $86B0  85 F1
    TXA                          ; $86B2  8A
    RTS                          ; $86B3  60


sub_18_86B4:
    LDA $E7                      ; $86B4  A5 E7
    BEQ sub_18_86C3              ; $86B6  F0 0B

loc_18_86B8:
    PHA                          ; $86B8  48
    JSR sub_18_86C3              ; $86B9  20 C3 86
    PLA                          ; $86BC  68
    SEC                          ; $86BD  38
    SBC #$01                     ; $86BE  E9 01
    BNE loc_18_86B8              ; $86C0  D0 F6
    RTS                          ; $86C2  60


sub_18_86C3:
    LDY #$05                     ; $86C3  A0 05
    LDA ($EC),Y                  ; $86C5  B1 EC
    ASL A                        ; $86C7  0A
    BCC sub_18_86D3              ; $86C8  90 09
    LDA $EA                      ; $86CA  A5 EA
    AND #$01                     ; $86CC  29 01
    BEQ sub_18_86D3              ; $86CE  F0 03
    JSR sub_18_86D3              ; $86D0  20 D3 86

sub_18_86D3:
    LDY #$02                     ; $86D3  A0 02
    LDA ($EC),Y                  ; $86D5  B1 EC
    INY                          ; $86D7  C8
    ORA ($EC),Y                  ; $86D8  11 EC
    BEQ loc_18_86FE              ; $86DA  F0 22
    LDX #$FF                     ; $86DC  A2 FF
    DEY                          ; $86DE  88
    LDA ($EC),Y                  ; $86DF  B1 EC
    SEC                          ; $86E1  38
    SBC #$04                     ; $86E2  E9 04
    STA ($EC),Y                  ; $86E4  91 EC
    TXA                          ; $86E6  8A
    INY                          ; $86E7  C8
    ADC ($EC),Y                  ; $86E8  71 EC
    STA ($EC),Y                  ; $86EA  91 EC
    DEY                          ; $86EC  88
    ORA ($EC),Y                  ; $86ED  11 EC
    BEQ loc_18_86FE              ; $86EF  F0 0D
    LDY #$0A                     ; $86F1  A0 0A
    LDA ($EC),Y                  ; $86F3  B1 EC
    INY                          ; $86F5  C8
    ORA ($EC),Y                  ; $86F6  11 EC
    BNE loc_18_86FB              ; $86F8  D0 01
    RTS                          ; $86FA  60


loc_18_86FB:
    JMP loc_18_82EC              ; $86FB  4C EC 82


loc_18_86FE:
    LDY #$05                     ; $86FE  A0 05
    LDA ($EC),Y                  ; $8700  B1 EC
    AND #$7F                     ; $8702  29 7F
    STA ($EC),Y                  ; $8704  91 EC

sub_18_8706:
    JSR sub_18_8935              ; $8706  20 35 89
    AND #$F0                     ; $8709  29 F0
    BNE loc_18_8710              ; $870B  D0 03
    JMP loc_18_87C0              ; $870D  4C C0 87


loc_18_8710:
    CMP #$20                     ; $8710  C9 20
    BNE loc_18_871F              ; $8712  D0 0B
    TXA                          ; $8714  8A
    AND #$07                     ; $8715  29 07
    PHA                          ; $8717  48
    JSR sub_18_8706              ; $8718  20 06 87
    PLA                          ; $871B  68
    JMP loc_18_87A2              ; $871C  4C A2 87


loc_18_871F:
    CMP #$30                     ; $871F  C9 30
    BNE loc_18_8726              ; $8721  D0 03
    JMP loc_18_87B5              ; $8723  4C B5 87


loc_18_8726:
    TXA                          ; $8726  8A
    ROL A                        ; $8727  2A
    ROL A                        ; $8728  2A
    ROL A                        ; $8729  2A
    ROL A                        ; $872A  2A
    AND #$07                     ; $872B  29 07
    TAY                          ; $872D  A8
    LDA $8975,Y                  ; $872E  B9 75 89
    JSR sub_18_8954              ; $8731  20 54 89

loc_18_8734:
    LDY #$06                     ; $8734  A0 06
    LDA ($EC),Y                  ; $8736  B1 EC
    AND #$E0                     ; $8738  29 E0
    BEQ loc_18_8752              ; $873A  F0 16
    SEC                          ; $873C  38
    SBC #$20                     ; $873D  E9 20
    STA $F4                      ; $873F  85 F4
    LDA ($EC),Y                  ; $8741  B1 EC
    AND #$1F                     ; $8743  29 1F
    ORA $F4                      ; $8745  05 F4
    STA ($EC),Y                  ; $8747  91 EC
    LDA $EF                      ; $8749  A5 EF
    LSR A                        ; $874B  4A
    BCC loc_18_874F              ; $874C  90 01
    RTS                          ; $874E  60


loc_18_874F:
    JMP loc_18_8548              ; $874F  4C 48 85


loc_18_8752:
    TXA                          ; $8752  8A
    AND #$1F                     ; $8753  29 1F
    BNE loc_18_875B              ; $8755  D0 04
    TAX                          ; $8757  AA
    JMP loc_18_877D              ; $8758  4C 7D 87


loc_18_875B:
    LDY #$01                     ; $875B  A0 01
    CPY $EE                      ; $875D  C4 EE
    BNE loc_18_8766              ; $875F  D0 05
    LDX #$00                     ; $8761  A2 00
    JMP loc_18_877D              ; $8763  4C 7D 87


loc_18_8766:
    ASL A                        ; $8766  0A
    LDY #$07                     ; $8767  A0 07
    CLC                          ; $8769  18
    ADC ($EC),Y                  ; $876A  71 EC
    STA $F4                      ; $876C  85 F4
    LDA #$00                     ; $876E  A9 00
    INY                          ; $8770  C8
    ADC ($EC),Y                  ; $8771  71 EC
    STA $F5                      ; $8773  85 F5
    LDY #$01                     ; $8775  A0 01
    LDA ($F4),Y                  ; $8777  B1 F4
    TAX                          ; $8779  AA
    DEY                          ; $877A  88
    LDA ($F4),Y                  ; $877B  B1 F4

loc_18_877D:
    LDY #$0A                     ; $877D  A0 0A
    STA ($EC),Y                  ; $877F  91 EC
    INY                          ; $8781  C8
    TXA                          ; $8782  8A
    STA ($EC),Y                  ; $8783  91 EC
    LDY #$0D                     ; $8785  A0 0D
    LDA ($EC),Y                  ; $8787  B1 EC
    STA $F4                      ; $8789  85 F4
    AND #$7F                     ; $878B  29 7F
    BEQ loc_18_8792              ; $878D  F0 03
    JSR sub_18_88A9              ; $878F  20 A9 88

loc_18_8792:
    LDA $EF                      ; $8792  A5 EF
    LSR A                        ; $8794  4A
    BCC loc_18_8798              ; $8795  90 01
    RTS                          ; $8797  60


loc_18_8798:
    LDA #$0C                     ; $8798  A9 0C
    STA $F4                      ; $879A  85 F4
    JSR sub_18_8516              ; $879C  20 16 85
    JMP loc_18_84FD              ; $879F  4C FD 84


loc_18_87A2:
    ROR A                        ; $87A2  6A
    ROR A                        ; $87A3  6A
    ROR A                        ; $87A4  6A
    ROR A                        ; $87A5  6A
    AND #$E0                     ; $87A6  29 E0
    STA $F4                      ; $87A8  85 F4
    LDY #$06                     ; $87AA  A0 06
    LDA ($EC),Y                  ; $87AC  B1 EC
    AND #$1F                     ; $87AE  29 1F
    ORA $F4                      ; $87B0  05 F4
    STA ($EC),Y                  ; $87B2  91 EC
    RTS                          ; $87B4  60


loc_18_87B5:
    LDA #$80                     ; $87B5  A9 80
    LDY #$05                     ; $87B7  A0 05
    ORA ($EC),Y                  ; $87B9  11 EC
    STA ($EC),Y                  ; $87BB  91 EC
    JMP sub_18_8706              ; $87BD  4C 06 87


loc_18_87C0:
    JSR sub_18_8556              ; $87C0  20 56 85
    DCP $87,X                    ; $87C3  D7 87
    SBC ($87,X)                  ; $87C5  E1 87
    SBC #$87                     ; $87C7  EB 87
    ISC $1587,Y                  ; $87C9  FB 87 15
    DEY                          ; $87CC  88
    EOR $7A88,X                  ; $87CD  5D 88 7A
    DEY                          ; $87D0  88
    STA $C788                    ; $87D1  8D 88 C7
    DEY                          ; $87D4  88
    SLO $89,X                    ; $87D5  17 89
    JSR sub_18_8935              ; $87D7  20 35 89
    LDY #$04                     ; $87DA  A0 04
    STA ($EC),Y                  ; $87DC  91 EC
    JMP sub_18_8706              ; $87DE  4C 06 87

    JSR sub_18_8935              ; $87E1  20 35 89
    LDY #$09                     ; $87E4  A0 09
    STA ($EC),Y                  ; $87E6  91 EC
    JMP sub_18_8706              ; $87E8  4C 06 87

    JSR sub_18_8935              ; $87EB  20 35 89
    STA $F4                      ; $87EE  85 F4
    LDY #$0C                     ; $87F0  A0 0C
    LDA ($EC),Y                  ; $87F2  B1 EC
    AND #$3F                     ; $87F4  29 3F
    ORA $F4                      ; $87F6  05 F4
    JMP loc_18_880E              ; $87F8  4C 0E 88

    JSR sub_18_8935              ; $87FB  20 35 89
    LDY #$02                     ; $87FE  A0 02
    CPY $EE                      ; $8800  C4 EE
    BEQ loc_18_880E              ; $8802  F0 0A
    STA $F4                      ; $8804  85 F4
    LDY #$0C                     ; $8806  A0 0C
    LDA ($EC),Y                  ; $8808  B1 EC
    AND #$C0                     ; $880A  29 C0
    ORA $F4                      ; $880C  05 F4

loc_18_880E:
    LDY #$0C                     ; $880E  A0 0C
    STA ($EC),Y                  ; $8810  91 EC
    JMP sub_18_8706              ; $8812  4C 06 87

    JSR sub_18_8935              ; $8815  20 35 89
    TXA                          ; $8818  8A
    BEQ loc_18_8831              ; $8819  F0 16
    LDY #$05                     ; $881B  A0 05
    LDA ($EC),Y                  ; $881D  B1 EC
    AND #$7F                     ; $881F  29 7F
    STA $F4                      ; $8821  85 F4
    CPX $F4                      ; $8823  E4 F4
    BEQ loc_18_8844              ; $8825  F0 1D
    INC $F4                      ; $8827  E6 F4
    LDA ($EC),Y                  ; $8829  B1 EC
    AND #$80                     ; $882B  29 80
    ORA $F4                      ; $882D  05 F4
    STA ($EC),Y                  ; $882F  91 EC

loc_18_8831:
    JSR sub_18_8935              ; $8831  20 35 89
    PHA                          ; $8834  48
    JSR sub_18_8935              ; $8835  20 35 89
    PLA                          ; $8838  68
    LDY #$00                     ; $8839  A0 00
    STA ($EC),Y                  ; $883B  91 EC
    INY                          ; $883D  C8
    TXA                          ; $883E  8A
    STA ($EC),Y                  ; $883F  91 EC
    JMP sub_18_8706              ; $8841  4C 06 87


loc_18_8844:
    LDA ($EC),Y                  ; $8844  B1 EC
    AND #$80                     ; $8846  29 80
    STA ($EC),Y                  ; $8848  91 EC
    LDY #$00                     ; $884A  A0 00
    LDA #$02                     ; $884C  A9 02
    CLC                          ; $884E  18
    ADC ($EC),Y                  ; $884F  71 EC
    STA ($EC),Y                  ; $8851  91 EC
    INY                          ; $8853  C8
    LDA #$00                     ; $8854  A9 00
    ADC ($EC),Y                  ; $8856  71 EC
    STA ($EC),Y                  ; $8858  91 EC
    JMP sub_18_8706              ; $885A  4C 06 87

    JSR sub_18_8935              ; $885D  20 35 89
    LDX #$85                     ; $8860  A2 85
    LDY #$89                     ; $8862  A0 89
    STX $F4                      ; $8864  86 F4
    STY $F5                      ; $8866  84 F5
    ASL A                        ; $8868  0A
    LDY #$07                     ; $8869  A0 07
    CLC                          ; $886B  18
    ADC $F4                      ; $886C  65 F4
    STA ($EC),Y                  ; $886E  91 EC
    LDA #$00                     ; $8870  A9 00
    ADC $F5                      ; $8872  65 F5
    INY                          ; $8874  C8
    STA ($EC),Y                  ; $8875  91 EC
    JMP sub_18_8706              ; $8877  4C 06 87

    JSR sub_18_8935              ; $887A  20 35 89
    ROL A                        ; $887D  2A
    ROL A                        ; $887E  2A
    ROL A                        ; $887F  2A
    ROL A                        ; $8880  2A
    AND #$07                     ; $8881  29 07
    TAY                          ; $8883  A8
    LDA $897D,Y                  ; $8884  B9 7D 89
    JSR sub_18_8954              ; $8887  20 54 89
    JMP loc_18_8734              ; $888A  4C 34 87

    JSR sub_18_8935              ; $888D  20 35 89
    LDY #$0D                     ; $8890  A0 0D
    STA ($EC),Y                  ; $8892  91 EC
    PHA                          ; $8894  48
    JSR sub_18_8935              ; $8895  20 35 89
    LDY #$0F                     ; $8898  A0 0F
    STA ($EC),Y                  ; $889A  91 EC
    PLA                          ; $889C  68
    STA $F4                      ; $889D  85 F4
    AND #$7F                     ; $889F  29 7F
    BEQ loc_18_88A6              ; $88A1  F0 03
    JSR sub_18_88A9              ; $88A3  20 A9 88

loc_18_88A6:
    JMP sub_18_8706              ; $88A6  4C 06 87


sub_18_88A9:
    LDA #$00                     ; $88A9  A9 00
    LDY #$0E                     ; $88AB  A0 0E
    STA ($EC),Y                  ; $88AD  91 EC
    LDA $F4                      ; $88AF  A5 F4
    BPL loc_18_88B8              ; $88B1  10 05
    LDA #$0F                     ; $88B3  A9 0F
    JMP loc_18_88BA              ; $88B5  4C BA 88


loc_18_88B8:
    LDA #$00                     ; $88B8  A9 00

loc_18_88BA:
    STA $F4                      ; $88BA  85 F4
    LDY #$0F                     ; $88BC  A0 0F
    LDA ($EC),Y                  ; $88BE  B1 EC
    AND #$F0                     ; $88C0  29 F0
    ORA $F4                      ; $88C2  05 F4
    STA ($EC),Y                  ; $88C4  91 EC
    RTS                          ; $88C6  60

    JSR sub_18_8935              ; $88C7  20 35 89
    STA $F4                      ; $88CA  85 F4
    LDY #$06                     ; $88CC  A0 06
    LDA ($EC),Y                  ; $88CE  B1 EC
    AND #$E0                     ; $88D0  29 E0
    ORA $F4                      ; $88D2  05 F4
    STA ($EC),Y                  ; $88D4  91 EC
    LDA $EF                      ; $88D6  A5 EF
    LSR A                        ; $88D8  4A
    BCS loc_18_88DE              ; $88D9  B0 03
    JSR sub_18_88E1              ; $88DB  20 E1 88

loc_18_88DE:
    JMP sub_18_8706              ; $88DE  4C 06 87


sub_18_88E1:
    TXA                          ; $88E1  8A
    BEQ loc_18_88EC              ; $88E2  F0 08
    LDA #$00                     ; $88E4  A9 00

loc_18_88E6:
    CLC                          ; $88E6  18
    ADC #$04                     ; $88E7  69 04
    DEX                          ; $88E9  CA
    BNE loc_18_88E6              ; $88EA  D0 FA

loc_18_88EC:
    CLC                          ; $88EC  18
    ADC $057C                    ; $88ED  6D 7C 05
    STA $F4                      ; $88F0  85 F4
    LDA #$00                     ; $88F2  A9 00
    ADC $057D                    ; $88F4  6D 7D 05
    STA $F5                      ; $88F7  85 F5
    LDX #$00                     ; $88F9  A2 00
    LDY #$14                     ; $88FB  A0 14

loc_18_88FD:
    LDA ($F4,X)                  ; $88FD  A1 F4
    STA ($EC),Y                  ; $88FF  91 EC
    INY                          ; $8901  C8
    CPY #$18                     ; $8902  C0 18
    BNE loc_18_8907              ; $8904  D0 01
    RTS                          ; $8906  60


loc_18_8907:
    LDA #$01                     ; $8907  A9 01
    CLC                          ; $8909  18
    ADC $F4                      ; $890A  65 F4
    STA $F4                      ; $890C  85 F4
    LDA #$00                     ; $890E  A9 00
    ADC $F5                      ; $8910  65 F5
    STA $F5                      ; $8912  85 F5
    JMP loc_18_88FD              ; $8914  4C FD 88

    LDY #$00                     ; $8917  A0 00
    LDA #$00                     ; $8919  A9 00
    STA ($EC),Y                  ; $891B  91 EC
    INY                          ; $891D  C8
    STA ($EC),Y                  ; $891E  91 EC
    LDA $E0                      ; $8920  A5 E0
    AND #$F0                     ; $8922  29 F0
    STA $E0                      ; $8924  85 E0
    LDA $EF                      ; $8926  A5 EF
    LSR A                        ; $8928  4A
    BCC loc_18_892C              ; $8929  90 01
    RTS                          ; $892B  60


loc_18_892C:
    LDX $EB                      ; $892C  A6 EB
    INX                          ; $892E  E8
    INX                          ; $892F  E8
    LDY $EE                      ; $8930  A4 EE
    JMP sub_18_8222              ; $8932  4C 22 82


sub_18_8935:
    LDY #$00                     ; $8935  A0 00
    LDA ($EC),Y                  ; $8937  B1 EC
    STA $F4                      ; $8939  85 F4
    INY                          ; $893B  C8
    LDA ($EC),Y                  ; $893C  B1 EC
    STA $F5                      ; $893E  85 F5
    DEY                          ; $8940  88
    LDA ($F4),Y                  ; $8941  B1 F4
    TAX                          ; $8943  AA
    LDA #$01                     ; $8944  A9 01
    CLC                          ; $8946  18
    ADC $F4                      ; $8947  65 F4
    STA ($EC),Y                  ; $8949  91 EC
    LDA #$00                     ; $894B  A9 00
    ADC $F5                      ; $894D  65 F5
    INY                          ; $894F  C8
    STA ($EC),Y                  ; $8950  91 EC
    TXA                          ; $8952  8A
    RTS                          ; $8953  60


sub_18_8954:
    STA $F4                      ; $8954  85 F4
    LDA #$00                     ; $8956  A9 00
    STA $F5                      ; $8958  85 F5
    LDY #$04                     ; $895A  A0 04
    LDA ($EC),Y                  ; $895C  B1 EC
    TAY                          ; $895E  A8
    LDA #$00                     ; $895F  A9 00

loc_18_8961:
    CLC                          ; $8961  18
    ADC $F4                      ; $8962  65 F4
    BCC loc_18_8968              ; $8964  90 02
    INC $F5                      ; $8966  E6 F5

loc_18_8968:
    DEY                          ; $8968  88
    BNE loc_18_8961              ; $8969  D0 F6
    LDY #$02                     ; $896B  A0 02
    STA ($EC),Y                  ; $896D  91 EC
    INY                          ; $896F  C8
    LDA $F5                      ; $8970  A5 F5
    STA ($EC),Y                  ; $8972  91 EC
    RTS                          ; $8974  60

    .byte $00,$00,$02,$04,$08,$10,$20,$40,$00,$00,$03,$06,$0C,$18,$30,$60  ; $8975
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $8985
    .byte $00,$00,$F2,$07,$D6,$07,$14,$07,$AE,$06,$4E,$06,$F3,$05,$94,$05  ; $8995
    .byte $4D,$05,$01,$05,$BB,$04,$75,$04,$36,$04,$F9,$03,$BF,$03,$8A,$03  ; $89A5
    .byte $57,$03,$27,$03,$FA,$02,$CF,$02,$A7,$02,$81,$02,$5D,$02,$3B,$02  ; $89B5
    .byte $1A,$02,$FC,$01,$E0,$01,$C5,$01,$AB,$01,$93,$01,$7D,$01,$67,$01  ; $89C5
    .byte $53,$01,$40,$01,$2E,$01,$1D,$01,$0D,$01,$FE,$00,$F0,$00,$E2,$00  ; $89D5
    .byte $D5,$00,$C9,$00,$BE,$00,$B3,$00,$A9,$00,$A0,$00,$97,$00,$8E,$00  ; $89E5
    .byte $86,$00,$7F,$00,$78,$00,$71,$00,$6A,$00,$64,$00,$5F,$00,$59,$00  ; $89F5
    .byte $54,$00,$50,$00,$4B,$00,$47,$00,$43,$00,$3F,$00,$3C,$00,$38,$00  ; $8A05
    .byte $35,$00,$32,$00,$2F,$00,$2C,$00,$2A,$00,$28,$00,$25,$00,$23,$00  ; $8A15
    .byte $21,$00,$1F,$00,$1E,$00,$1C,$00,$1A,$00,$19,$00,$17,$00,$16,$00  ; $8A25
    .byte $15,$00,$14,$00,$12,$00,$11,$00,$10,$00,$0F,$00,$0F,$00,$0E,$00  ; $8A35
    .byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$D6,$8A,$1D,$8E,$C8  ; $8A45
    .byte $90,$87,$94,$98,$96,$42,$9A,$48,$9E,$91,$A1,$A8,$A4,$60,$A9,$A0  ; $8A55
    .byte $AB,$58,$AC,$14,$AE,$F4,$AE,$B4,$B1,$57,$B3,$D5,$B3,$A6,$B4,$53  ; $8A65
    .byte $B5,$8E,$B5,$DC,$B6,$EA,$B9,$52,$BA,$ED,$BA,$57,$B3,$57,$B3,$57  ; $8A75
    .byte $B3,$57,$B3,$57,$B3,$57,$B3,$57,$B3,$57,$B3,$57,$B3,$22,$BB,$5B  ; $8A85
    .byte $BB,$8E,$BB,$B6,$BB,$C8,$BB,$D5,$BB,$03,$BC,$2D,$BC,$4C,$BC,$62  ; $8A95
    .byte $BC,$9B,$BC,$B5,$BC,$F1,$BC,$00,$BD,$25,$BD,$3D,$BD,$5D,$BD,$78  ; $8AA5
    .byte $BD,$8F,$BD,$98,$BD,$B7,$BD,$CC,$BD,$E1,$BD,$F6,$BD,$15,$BE,$35  ; $8AB5
    .byte $BE,$88,$BE,$A4,$BE,$BC,$BE,$F3,$BE,$2A,$BF,$3B,$BF,$48,$BF,$8F  ; $8AC5
    .byte $BF,$0F,$E1,$8A,$F1,$8B,$A9,$8C,$83,$8D,$15,$8E,$00,$06,$03,$3D  ; $8AD5
    .byte $07,$86,$10,$05,$17,$02,$00,$A5,$68,$60,$6C,$60,$06,$8F,$06,$8E  ; $8AE5
    .byte $8A,$06,$8D,$06,$8C,$88,$6A,$60,$68,$60,$65,$63,$60,$65,$80,$73  ; $8AF5
    .byte $73,$73,$74,$80,$73,$73,$73,$74,$06,$A0,$73,$73,$73,$74,$60,$78  ; $8B05
    .byte $60,$78,$76,$60,$74,$60,$93,$04,$02,$EA,$8A,$A5,$68,$60,$6C,$60  ; $8B15
    .byte $06,$8F,$06,$8E,$8A,$06,$8D,$06,$8C,$88,$6A,$60,$68,$60,$65,$63  ; $8B25
    .byte $60,$65,$80,$73,$73,$73,$74,$04,$01,$37,$8B,$A0,$76,$76,$60,$76  ; $8B35
    .byte $60,$76,$60,$76,$B8,$A0,$05,$23,$02,$40,$03,$3D,$07,$92,$10,$80  ; $8B45
    .byte $85,$8C,$8A,$AC,$8A,$88,$8A,$8C,$80,$21,$A5,$08,$01,$A5,$08,$00  ; $8B55
    .byte $88,$87,$80,$87,$80,$87,$85,$83,$21,$85,$C5,$80,$85,$88,$8A,$80  ; $8B65
    .byte $85,$8C,$8A,$AC,$8A,$88,$8A,$8C,$80,$21,$A5,$08,$01,$A5,$08,$00  ; $8B75
    .byte $88,$87,$80,$87,$80,$88,$8A,$87,$21,$85,$21,$A5,$08,$01,$A5,$08  ; $8B85
    .byte $00,$80,$85,$88,$8C,$02,$C0,$07,$A2,$10,$21,$CF,$08,$01,$CF,$08  ; $8B95
    .byte $00,$21,$AE,$08,$01,$AE,$08,$00,$21,$AD,$08,$01,$AD,$08,$00,$02  ; $8BA5
    .byte $80,$88,$06,$A5,$80,$85,$88,$8A,$8B,$8C,$8B,$8C,$8A,$88,$85,$83  ; $8BB5
    .byte $02,$C0,$21,$CF,$08,$01,$CF,$08,$00,$21,$AE,$08,$01,$AE,$08,$00  ; $8BC5
    .byte $21,$AD,$08,$01,$AD,$08,$00,$02,$80,$88,$06,$A5,$80,$85,$88,$8A  ; $8BD5
    .byte $91,$8C,$8C,$8C,$90,$93,$96,$98,$04,$00,$4D,$8B,$00,$06,$02,$00  ; $8BE5
    .byte $05,$17,$07,$E0,$10,$03,$38,$80,$A5,$68,$60,$6C,$60,$06,$8F,$06  ; $8BF5
    .byte $8E,$8A,$06,$8D,$06,$8C,$88,$6A,$60,$68,$60,$65,$63,$60,$65,$6F  ; $8C05
    .byte $6F,$6F,$71,$80,$6F,$6F,$6F,$71,$A0,$80,$6F,$6F,$6F,$71,$60,$74  ; $8C15
    .byte $60,$74,$73,$60,$71,$60,$8F,$04,$02,$F7,$8B,$80,$A5,$68,$60,$6C  ; $8C25
    .byte $60,$06,$8F,$06,$8E,$8A,$06,$8D,$06,$8C,$88,$6A,$60,$68,$60,$65  ; $8C35
    .byte $63,$60,$65,$6F,$6F,$6F,$71,$80,$6F,$6F,$6F,$71,$A0,$73,$73,$60  ; $8C45
    .byte $73,$60,$73,$60,$73,$B4,$A0,$05,$23,$03,$37,$68,$6A,$60,$68,$60  ; $8C55
    .byte $68,$6A,$68,$67,$68,$60,$67,$60,$67,$68,$67,$63,$65,$60,$65,$60  ; $8C65
    .byte $63,$85,$63,$65,$60,$65,$60,$63,$85,$04,$03,$5E,$8C,$02,$C0,$03  ; $8C75
    .byte $3A,$07,$A2,$10,$EC,$CB,$CA,$07,$86,$10,$02,$00,$80,$88,$8A,$88  ; $8C85
    .byte $8C,$88,$80,$88,$8A,$88,$8C,$88,$80,$88,$87,$88,$04,$01,$82,$8C  ; $8C95
    .byte $04,$00,$5C,$8C,$00,$06,$03,$25,$05,$23,$03,$30,$A5,$68,$60,$6C  ; $8CA5
    .byte $60,$06,$8F,$06,$8E,$8A,$06,$8D,$06,$8C,$88,$6A,$60,$68,$60,$65  ; $8CB5
    .byte $63,$60,$85,$60,$85,$65,$60,$85,$65,$60,$85,$65,$60,$85,$65,$60  ; $8CC5
    .byte $85,$67,$60,$87,$68,$60,$6C,$60,$A3,$04,$02,$B1,$8C,$A5,$68,$60  ; $8CD5
    .byte $6C,$60,$06,$8F,$06,$8E,$8A,$06,$8D,$06,$8C,$88,$6A,$60,$68,$60  ; $8CE5
    .byte $65,$63,$60,$85,$60,$85,$65,$60,$85,$65,$60,$85,$65,$60,$85,$63  ; $8CF5
    .byte $63,$60,$63,$60,$63,$60,$63,$65,$01,$10,$78,$78,$67,$66,$65,$64  ; $8D05
    .byte $63,$05,$23,$03,$30,$01,$00,$85,$85,$80,$85,$65,$68,$60,$6C,$60  ; $8D15
    .byte $68,$85,$85,$85,$80,$85,$65,$68,$60,$6C,$60,$68,$85,$83,$83,$80  ; $8D25
    .byte $83,$63,$67,$60,$6A,$60,$67,$83,$85,$85,$80,$85,$65,$68,$60,$6C  ; $8D35
    .byte $60,$68,$85,$04,$01,$16,$8D,$01,$00,$05,$23,$68,$60,$88,$68,$60  ; $8D45
    .byte $88,$68,$60,$88,$68,$60,$88,$67,$60,$87,$67,$60,$87,$66,$60,$86  ; $8D55
    .byte $66,$60,$86,$80,$85,$87,$85,$88,$85,$80,$85,$01,$10,$9B,$9B,$8B  ; $8D65
    .byte $8B,$7D,$7D,$8B,$8A,$8A,$04,$01,$4C,$8D,$04,$00,$16,$8D,$00,$06  ; $8D75
    .byte $07,$84,$A0,$03,$3F,$01,$05,$66,$01,$00,$07,$82,$60,$03,$36,$64  ; $8D85
    .byte $64,$64,$04,$3B,$85,$8D,$07,$81,$10,$03,$39,$01,$12,$66,$66,$60  ; $8D95
    .byte $66,$60,$66,$60,$66,$63,$63,$64,$64,$65,$65,$66,$66,$03,$3E,$01  ; $8DA5
    .byte $10,$07,$82,$A0,$A4,$07,$84,$60,$06,$8D,$07,$82,$A0,$64,$64,$64  ; $8DB5
    .byte $84,$07,$84,$60,$AD,$04,$07,$B2,$8D,$07,$82,$A0,$84,$84,$04,$02  ; $8DC5
    .byte $CE,$8D,$07,$84,$60,$AD,$07,$82,$A0,$64,$60,$84,$07,$84,$60,$AD  ; $8DD5
    .byte $04,$05,$DB,$8D,$07,$82,$A0,$84,$84,$04,$02,$E9,$8D,$07,$84,$60  ; $8DE5
    .byte $AD,$07,$82,$A0,$84,$84,$07,$84,$60,$AD,$04,$03,$F6,$8D,$07,$84  ; $8DF5
    .byte $A0,$03,$38,$83,$83,$84,$84,$65,$65,$85,$86,$86,$04,$00,$B2,$8D  ; $8E05
    .byte $00,$00,$80,$00,$02,$62,$80,$00,$0F,$28,$8E,$E8,$8E,$9D,$8F,$79  ; $8E15
    .byte $90,$C0,$90,$00,$05,$03,$3D,$05,$19,$02,$80,$07,$84,$70,$01,$30  ; $8E25
    .byte $AB,$AB,$8B,$8D,$AB,$8B,$8B,$80,$AB,$8B,$AB,$04,$01,$35,$8E,$01  ; $8E35
    .byte $00,$02,$C0,$07,$88,$10,$77,$76,$75,$74,$73,$72,$71,$70,$6F,$6E  ; $8E45
    .byte $6D,$6C,$6B,$6A,$96,$80,$96,$A0,$96,$80,$96,$02,$80,$05,$25,$03  ; $8E55
    .byte $3C,$22,$88,$07,$90,$10,$A8,$08,$01,$A8,$08,$00,$88,$87,$80,$88  ; $8E65
    .byte $80,$85,$80,$85,$88,$80,$AC,$21,$AA,$08,$01,$AA,$08,$00,$AA,$88  ; $8E75
    .byte $8C,$80,$CA,$8A,$88,$06,$CA,$80,$8A,$06,$AC,$AA,$A8,$A7,$87,$88  ; $8E85
    .byte $87,$C5,$8A,$80,$8A,$A0,$8A,$80,$8A,$21,$88,$04,$01,$68,$8E,$21  ; $8E95
    .byte $A8,$08,$01,$A8,$08,$00,$88,$87,$80,$88,$80,$85,$80,$85,$88,$80  ; $8EA5
    .byte $AC,$06,$CA,$80,$88,$A3,$A5,$A7,$AA,$21,$AB,$08,$01,$AB,$08,$00  ; $8EB5
    .byte $8B,$8A,$80,$8B,$80,$8B,$8B,$80,$A8,$AB,$7D,$7C,$7B,$7A,$79,$78  ; $8EC5
    .byte $77,$76,$75,$74,$73,$72,$71,$70,$8C,$80,$8C,$A0,$8C,$80,$8C,$04  ; $8ED5
    .byte $00,$60,$8E,$00,$05,$03,$3A,$05,$31,$02,$80,$07,$81,$20,$01,$10  ; $8EE5
    .byte $A0,$A8,$04,$07,$F5,$8E,$01,$00,$02,$C0,$05,$19,$07,$88,$10,$74  ; $8EF5
    .byte $73,$72,$71,$70,$6F,$6E,$6D,$6C,$6B,$6A,$69,$68,$67,$93,$80,$93  ; $8F05
    .byte $A0,$93,$80,$93,$07,$92,$20,$05,$19,$03,$38,$02,$80,$21,$91,$D1  ; $8F15
    .byte $91,$8F,$80,$91,$80,$8C,$80,$8C,$91,$80,$B4,$D2,$B2,$91,$94,$80  ; $8F25
    .byte $D2,$92,$91,$06,$D2,$80,$92,$06,$B3,$B3,$AC,$AC,$C0,$93,$94,$93  ; $8F35
    .byte $93,$80,$93,$A0,$93,$80,$93,$04,$01,$19,$8F,$80,$05,$25,$03,$38  ; $8F45
    .byte $02,$80,$07,$92,$10,$08,$01,$21,$88,$C8,$88,$87,$80,$88,$80,$85  ; $8F55
    .byte $80,$85,$88,$80,$AC,$06,$CA,$80,$88,$A3,$A5,$A7,$AA,$CB,$8B,$8A  ; $8F65
    .byte $80,$8B,$80,$8B,$8B,$80,$A8,$8B,$08,$00,$07,$88,$10,$03,$3A,$73  ; $8F75
    .byte $72,$71,$70,$6F,$6E,$6D,$6C,$6B,$6A,$69,$68,$67,$66,$87,$80,$87  ; $8F85
    .byte $A0,$87,$80,$87,$04,$00,$19,$8F,$00,$05,$03,$15,$05,$31,$01,$10  ; $8F95
    .byte $A0,$A7,$04,$05,$A5,$8F,$91,$71,$71,$8E,$8E,$8C,$8C,$8A,$8A,$01  ; $8FA5
    .byte $00,$05,$25,$71,$70,$6F,$6E,$6D,$6C,$6B,$6A,$69,$68,$67,$66,$65  ; $8FB5
    .byte $64,$83,$80,$83,$80,$01,$10,$7D,$7D,$9D,$9D,$9D,$01,$00,$21,$85  ; $8FC5
    .byte $85,$65,$65,$04,$07,$D5,$8F,$86,$66,$66,$04,$06,$DC,$8F,$86,$21  ; $8FD5
    .byte $83,$83,$63,$63,$04,$02,$E6,$8F,$83,$21,$84,$84,$64,$64,$04,$03  ; $8FE5
    .byte $F0,$8F,$80,$85,$87,$85,$88,$85,$80,$83,$80,$83,$80,$63,$63,$83  ; $8FF5
    .byte $80,$83,$21,$85,$85,$65,$65,$04,$07,$09,$90,$86,$66,$66,$04,$06  ; $9005
    .byte $10,$90,$86,$21,$83,$83,$63,$63,$04,$02,$1A,$90,$83,$21,$84,$84  ; $9015
    .byte $64,$64,$04,$03,$24,$90,$80,$85,$87,$85,$88,$85,$80,$83,$80,$83  ; $9025
    .byte $80,$63,$63,$83,$80,$83,$21,$81,$81,$61,$61,$81,$81,$04,$03,$3D  ; $9035
    .byte $90,$83,$63,$63,$83,$83,$04,$03,$46,$90,$84,$64,$64,$84,$84,$04  ; $9045
    .byte $03,$4F,$90,$65,$65,$65,$60,$65,$60,$65,$65,$60,$65,$65,$60,$65  ; $9055
    .byte $65,$84,$80,$84,$80,$01,$10,$7D,$7D,$9D,$9D,$9D,$01,$00,$21,$85  ; $9065
    .byte $04,$00,$D5,$8F,$00,$05,$01,$10,$07,$83,$60,$03,$3D,$A0,$AC,$04  ; $9075
    .byte $07,$82,$90,$07,$83,$60,$01,$FD,$65,$04,$03,$8D,$90,$68,$04,$03  ; $9085
    .byte $92,$90,$6A,$6A,$6A,$6C,$6C,$6C,$01,$10,$8C,$80,$8C,$A0,$8C,$80  ; $9095
    .byte $8C,$8C,$01,$10,$07,$82,$A0,$84,$64,$64,$07,$84,$60,$8A,$07,$82  ; $90A5
    .byte $A0,$64,$64,$04,$2B,$A9,$90,$04,$00,$88,$90,$00,$00,$80,$00,$02  ; $90B5
    .byte $41,$80,$00,$0F,$D3,$90,$70,$92,$91,$93,$30,$94,$7F,$94,$00,$06  ; $90C5
    .byte $03,$3C,$07,$8A,$10,$02,$40,$05,$17,$88,$A0,$85,$A6,$87,$60,$68  ; $90D5
    .byte $60,$68,$68,$60,$88,$85,$A6,$87,$88,$88,$A0,$85,$A6,$87,$60,$68  ; $90E5
    .byte $60,$68,$68,$60,$88,$85,$86,$05,$23,$74,$60,$B4,$05,$17,$88,$A0  ; $90F5
    .byte $85,$A6,$87,$60,$68,$60,$68,$68,$60,$88,$85,$05,$23,$74,$74,$60  ; $9105
    .byte $74,$76,$77,$76,$74,$05,$17,$88,$A0,$85,$A6,$A7,$05,$23,$74,$60  ; $9115
    .byte $04,$04,$21,$91,$60,$74,$76,$77,$76,$74,$07,$88,$10,$6F,$A0,$60  ; $9125
    .byte $6F,$60,$B2,$91,$60,$6F,$60,$6F,$6F,$60,$6F,$60,$6F,$60,$B2,$91  ; $9135
    .byte $90,$6F,$A0,$60,$6F,$60,$B2,$91,$60,$6F,$60,$6F,$6F,$60,$6F,$60  ; $9145
    .byte $6F,$60,$80,$74,$60,$B4,$04,$01,$2F,$91,$07,$90,$10,$03,$3D,$02  ; $9155
    .byte $80,$8C,$80,$8C,$60,$6C,$6C,$60,$6C,$60,$6C,$6A,$68,$06,$8A,$A8  ; $9165
    .byte $A0,$88,$8A,$88,$8C,$80,$8C,$60,$6C,$8D,$8C,$80,$22,$AF,$08,$01  ; $9175
    .byte $AF,$01,$06,$AF,$01,$00,$08,$00,$74,$60,$B4,$8F,$80,$8F,$60,$6F  ; $9185
    .byte $6F,$60,$6F,$60,$6F,$6D,$6C,$06,$8D,$AC,$A0,$8C,$8D,$8C,$8F,$80  ; $9195
    .byte $8F,$60,$6F,$91,$8F,$80,$22,$B2,$08,$01,$B2,$01,$06,$B2,$01,$00  ; $91A5
    .byte $08,$00,$74,$60,$B4,$94,$80,$94,$60,$74,$74,$60,$74,$60,$74,$71  ; $91B5
    .byte $6F,$06,$91,$AF,$A0,$8F,$91,$8F,$94,$80,$94,$60,$74,$96,$94,$80  ; $91C5
    .byte $21,$B7,$B7,$01,$06,$B7,$01,$00,$08,$00,$74,$60,$B4,$05,$2F,$8C  ; $91D5
    .byte $80,$8C,$60,$6C,$6C,$60,$6C,$60,$6C,$6A,$68,$06,$8A,$A8,$A0,$88  ; $91E5
    .byte $8A,$88,$8C,$80,$8C,$60,$6C,$8D,$8C,$80,$22,$AF,$08,$01,$8F,$AF  ; $91F5
    .byte $08,$00,$68,$6C,$6F,$74,$6C,$6F,$74,$78,$05,$23,$02,$40,$03,$3C  ; $9205
    .byte $6F,$A0,$60,$6F,$60,$B2,$91,$60,$6F,$60,$6F,$6F,$60,$6F,$60,$6F  ; $9215
    .byte $60,$B2,$91,$90,$6F,$A0,$60,$6F,$60,$B2,$91,$60,$6F,$60,$6F,$6F  ; $9225
    .byte $60,$6F,$60,$6F,$60,$80,$74,$60,$B4,$04,$01,$15,$92,$B1,$91,$60  ; $9235
    .byte $71,$91,$AD,$91,$21,$AF,$08,$01,$AF,$08,$00,$6D,$60,$6D,$60,$6D  ; $9245
    .byte $8F,$6F,$04,$02,$42,$92,$B1,$91,$60,$71,$91,$B4,$91,$6F,$6F,$60  ; $9255
    .byte $74,$74,$60,$78,$78,$C0,$04,$00,$2F,$91,$09,$00,$06,$07,$8A,$10  ; $9265
    .byte $02,$40,$03,$36,$05,$17,$60,$88,$A0,$85,$A6,$87,$60,$68,$60,$68  ; $9275
    .byte $68,$60,$88,$85,$A6,$87,$88,$88,$A0,$85,$A6,$87,$60,$68,$60,$68  ; $9285
    .byte $68,$60,$88,$85,$66,$7B,$60,$BB,$60,$88,$A0,$85,$A6,$87,$60,$68  ; $9295
    .byte $60,$68,$68,$60,$88,$65,$05,$23,$6F,$6F,$60,$6F,$73,$74,$73,$6F  ; $92A5
    .byte $05,$17,$60,$88,$A0,$85,$A6,$87,$60,$05,$23,$6F,$60,$04,$04,$C0  ; $92B5
    .byte $92,$60,$6F,$73,$74,$73,$6F,$6C,$A0,$60,$6C,$60,$AF,$8D,$60,$6C  ; $92C5
    .byte $60,$6C,$6C,$60,$6C,$60,$6C,$60,$AF,$8D,$8D,$6C,$A0,$60,$6C,$60  ; $92D5
    .byte $AF,$8D,$60,$6C,$60,$6C,$6C,$60,$6C,$60,$6C,$60,$80,$6F,$60,$AF  ; $92E5
    .byte $04,$01,$CC,$92,$03,$37,$07,$8D,$20,$02,$00,$8F,$8C,$8F,$6C,$6F  ; $92F5
    .byte $60,$94,$60,$8F,$6C,$6F,$60,$6F,$8C,$8F,$6C,$6F,$60,$74,$6F,$6C  ; $9305
    .byte $6F,$6C,$68,$63,$8F,$8C,$8F,$6C,$6F,$60,$94,$60,$8F,$6C,$6F,$60  ; $9315
    .byte $6F,$8C,$8F,$6C,$6F,$60,$74,$07,$85,$10,$03,$3A,$02,$40,$6F,$60  ; $9325
    .byte $AF,$04,$03,$F9,$92,$6C,$A0,$60,$6C,$60,$AF,$8D,$60,$6C,$60,$6C  ; $9335
    .byte $6C,$60,$6C,$60,$6C,$60,$AF,$8D,$8D,$6C,$A0,$60,$6C,$60,$AF,$8D  ; $9345
    .byte $60,$6C,$60,$6C,$6C,$60,$6C,$60,$6C,$60,$80,$6F,$60,$AF,$04,$01  ; $9355
    .byte $3A,$93,$AD,$8D,$60,$6D,$8D,$AA,$8D,$21,$AC,$AC,$6A,$60,$6A,$60  ; $9365
    .byte $6A,$8C,$6C,$04,$02,$67,$93,$AD,$8D,$60,$6D,$8D,$B1,$8D,$6C,$6C  ; $9375
    .byte $60,$6F,$6F,$60,$74,$74,$C0,$04,$00,$CC,$92,$09,$00,$06,$03,$25  ; $9385
    .byte $05,$23,$88,$80,$01,$10,$94,$01,$00,$85,$A6,$87,$60,$68,$60,$68  ; $9395
    .byte $68,$01,$10,$74,$94,$01,$00,$85,$86,$92,$87,$93,$04,$02,$97,$93  ; $93A5
    .byte $88,$80,$01,$10,$94,$01,$00,$85,$A6,$87,$88,$88,$88,$88,$88,$68  ; $93B5
    .byte $01,$10,$7D,$7D,$7D,$7A,$7A,$78,$78,$01,$00,$88,$80,$01,$10,$94  ; $93C5
    .byte $01,$00,$85,$A6,$87,$60,$68,$60,$68,$68,$01,$10,$74,$94,$01,$00  ; $93D5
    .byte $85,$86,$92,$87,$93,$04,$0F,$CE,$93,$06,$86,$06,$8A,$8D,$60,$71  ; $93E5
    .byte $6D,$6A,$6D,$6A,$66,$65,$06,$88,$06,$8C,$8F,$66,$60,$66,$60,$66  ; $93F5
    .byte $88,$68,$04,$02,$EE,$93,$06,$86,$06,$8A,$8D,$60,$71,$6D,$6A,$6D  ; $9405
    .byte $6A,$66,$65,$68,$68,$60,$6C,$6C,$60,$6F,$6F,$01,$10,$60,$7D,$7D  ; $9415
    .byte $7D,$7A,$7A,$78,$78,$01,$00,$04,$00,$CE,$93,$00,$06,$03,$3A,$07  ; $9425
    .byte $83,$F0,$A3,$07,$83,$40,$A5,$04,$0D,$34,$94,$85,$85,$85,$85,$01  ; $9435
    .byte $15,$A0,$A5,$A0,$A5,$A0,$A5,$A0,$A5,$A0,$A5,$A0,$A5,$A0,$A5,$A0  ; $9445
    .byte $A5,$80,$85,$A5,$04,$07,$48,$94,$A0,$A5,$A0,$A5,$A0,$A5,$85,$85  ; $9455
    .byte $65,$65,$60,$65,$04,$02,$5D,$94,$A0,$A5,$A0,$A5,$63,$63,$60,$64  ; $9465
    .byte $64,$60,$65,$65,$A0,$A5,$04,$00,$48,$94,$00,$00,$80,$00,$01,$62  ; $9475
    .byte $80,$00,$0F,$92,$94,$64,$95,$1C,$96,$71,$96,$98,$96,$00,$06,$02  ; $9485
    .byte $00,$03,$38,$05,$15,$07,$84,$60,$65,$65,$71,$65,$6F,$70,$65,$71  ; $9495
    .byte $65,$6C,$65,$6B,$65,$6A,$69,$68,$65,$65,$6F,$65,$6D,$6E,$65,$6F  ; $94A5
    .byte $65,$6A,$65,$69,$65,$68,$67,$66,$04,$02,$9D,$94,$65,$65,$71,$65  ; $94B5
    .byte $6F,$70,$65,$71,$65,$6C,$65,$6B,$65,$6A,$69,$68,$6F,$6F,$60,$6C  ; $94C5
    .byte $71,$71,$60,$6C,$6C,$6F,$6C,$71,$A0,$03,$3A,$07,$02,$A0,$05,$21  ; $94D5
    .byte $02,$40,$21,$AC,$AC,$6C,$60,$6C,$60,$6C,$6A,$68,$21,$AA,$AA,$6A  ; $94E5
    .byte $6A,$60,$6C,$60,$6A,$67,$60,$88,$02,$80,$65,$68,$6C,$71,$60,$6C  ; $94F5
    .byte $60,$6A,$6C,$60,$6A,$60,$63,$65,$67,$71,$60,$71,$73,$74,$78,$60  ; $9505
    .byte $71,$60,$6C,$6F,$71,$74,$73,$71,$6F,$02,$40,$21,$AC,$AC,$6C,$60  ; $9515
    .byte $6C,$60,$6C,$6A,$68,$21,$AA,$AA,$6A,$6A,$60,$6C,$60,$6A,$67,$60  ; $9525
    .byte $88,$02,$80,$65,$68,$6C,$71,$60,$6C,$60,$6A,$6C,$60,$6A,$60,$63  ; $9535
    .byte $65,$67,$02,$80,$73,$73,$60,$71,$74,$74,$60,$71,$71,$73,$71,$74  ; $9545
    .byte $80,$60,$05,$15,$02,$00,$07,$84,$60,$21,$6C,$04,$00,$94,$94,$00  ; $9555
    .byte $06,$07,$84,$60,$02,$80,$03,$37,$05,$13,$01,$25,$6C,$6C,$9D,$6C  ; $9565
    .byte $9D,$6C,$60,$7D,$9A,$7D,$7C,$7A,$78,$04,$06,$6F,$95,$7D,$7D,$60  ; $9575
    .byte $7C,$7C,$7C,$60,$7A,$7D,$7C,$7A,$78,$60,$7C,$7C,$60,$01,$00,$05  ; $9585
    .byte $21,$03,$36,$07,$02,$A0,$02,$40,$21,$A8,$A8,$68,$60,$68,$60,$68  ; $9595
    .byte $67,$65,$21,$A7,$A7,$67,$67,$60,$68,$60,$67,$63,$60,$85,$02,$80  ; $95A5
    .byte $03,$36,$60,$65,$68,$6C,$71,$60,$6C,$60,$6A,$6C,$60,$6A,$60,$63  ; $95B5
    .byte $65,$67,$71,$60,$71,$73,$74,$78,$60,$71,$60,$6C,$6F,$71,$74,$73  ; $95C5
    .byte $71,$02,$40,$21,$A8,$A8,$68,$60,$68,$60,$68,$67,$65,$21,$A7,$A7  ; $95D5
    .byte $67,$67,$60,$68,$60,$67,$63,$60,$85,$02,$80,$60,$03,$36,$65,$68  ; $95E5
    .byte $6C,$71,$60,$6C,$60,$6A,$6C,$60,$6A,$60,$63,$65,$03,$3A,$02,$80  ; $95F5
    .byte $6F,$6F,$60,$6C,$71,$71,$60,$6C,$6C,$6F,$6C,$71,$A0,$05,$15,$03  ; $9605
    .byte $38,$02,$40,$04,$00,$66,$95,$00,$06,$03,$1A,$05,$21,$65,$65,$71  ; $9615
    .byte $65,$6F,$70,$65,$71,$65,$6C,$65,$6B,$65,$6A,$69,$68,$65,$65,$6F  ; $9625
    .byte $65,$6D,$6E,$65,$6F,$65,$6A,$65,$69,$65,$68,$67,$66,$04,$02,$22  ; $9635
    .byte $96,$65,$65,$71,$65,$6F,$70,$65,$71,$65,$6C,$65,$6B,$65,$6A,$69  ; $9645
    .byte $68,$6F,$6F,$60,$6C,$71,$71,$60,$6C,$6C,$6F,$6C,$71,$01,$10,$60  ; $9655
    .byte $7D,$7A,$01,$00,$21,$65,$03,$30,$04,$00,$22,$96,$00,$06,$03,$3F  ; $9665
    .byte $07,$83,$A0,$62,$03,$3A,$07,$82,$A0,$62,$62,$62,$04,$1B,$73,$96  ; $9675
    .byte $07,$83,$A0,$6A,$8A,$6A,$6A,$8A,$6A,$6A,$6A,$6A,$8A,$6A,$8A,$04  ; $9685
    .byte $00,$73,$96,$0F,$A3,$96,$CF,$97,$F0,$98,$17,$9A,$3A,$9A,$00,$05  ; $9695
    .byte $03,$3C,$02,$00,$05,$1D,$07,$92,$10,$AC,$8F,$AE,$AD,$AC,$AF,$AE  ; $96A5
    .byte $AD,$80,$21,$AC,$08,$01,$AC,$08,$00,$8C,$8A,$88,$A7,$88,$8A,$A3  ; $96B5
    .byte $85,$87,$85,$A0,$8F,$AE,$AD,$AC,$AF,$AE,$AD,$80,$21,$AC,$08,$01  ; $96C5
    .byte $AC,$08,$00,$8C,$8A,$88,$A7,$88,$8A,$A3,$85,$87,$85,$02,$80,$07  ; $96D5
    .byte $84,$10,$80,$85,$87,$85,$88,$85,$8A,$85,$07,$90,$10,$02,$C0,$05  ; $96E5
    .byte $29,$87,$87,$87,$87,$87,$87,$80,$05,$1D,$07,$92,$10,$21,$B1,$08  ; $96F5
    .byte $01,$B1,$08,$00,$8C,$8F,$91,$80,$91,$80,$B1,$8C,$AF,$B0,$06,$B1  ; $9705
    .byte $AF,$06,$B1,$D8,$91,$B0,$CF,$8A,$8C,$8F,$80,$8F,$80,$8F,$8D,$8F  ; $9715
    .byte $80,$93,$91,$8F,$06,$AF,$AA,$06,$AC,$80,$8F,$AF,$8F,$90,$80,$B1  ; $9725
    .byte $8F,$8C,$91,$93,$91,$94,$96,$05,$29,$6B,$8C,$8F,$6C,$6F,$70,$71  ; $9735
    .byte $74,$73,$71,$6F,$70,$71,$6F,$06,$AC,$06,$AA,$A8,$80,$06,$A7,$A5  ; $9745
    .byte $A3,$69,$21,$6A,$AA,$6E,$21,$6F,$AF,$75,$22,$76,$B6,$08,$01,$B6  ; $9755
    .byte $08,$00,$B3,$92,$91,$8F,$6D,$6C,$6D,$6F,$71,$6F,$71,$73,$74,$73  ; $9765
    .byte $74,$76,$78,$76,$78,$79,$01,$01,$DE,$01,$00,$05,$1D,$94,$93,$80  ; $9775
    .byte $07,$92,$10,$02,$80,$91,$80,$91,$91,$8F,$B1,$A0,$91,$80,$91,$8F  ; $9785
    .byte $91,$94,$80,$98,$80,$21,$B6,$08,$01,$D6,$08,$00,$80,$BB,$B9,$B8  ; $9795
    .byte $96,$91,$80,$91,$91,$8F,$B1,$A0,$91,$80,$91,$8F,$91,$94,$80,$98  ; $97A5
    .byte $80,$21,$B6,$96,$96,$93,$80,$22,$B8,$08,$01,$B8,$98,$08,$00,$03  ; $97B5
    .byte $3E,$02,$00,$8C,$A8,$8A,$04,$00,$A5,$96,$00,$05,$03,$3C,$02,$00  ; $97C5
    .byte $05,$1D,$07,$92,$10,$A8,$8C,$AB,$AA,$A8,$AC,$AB,$AA,$80,$C8,$88  ; $97D5
    .byte $87,$85,$A3,$85,$87,$05,$11,$AC,$8C,$8F,$8C,$05,$1D,$A0,$8C,$AB  ; $97E5
    .byte $AA,$A8,$AC,$AB,$AA,$80,$C8,$88,$87,$85,$A3,$85,$87,$05,$11,$AC  ; $97F5
    .byte $8C,$8F,$8C,$05,$1D,$03,$38,$02,$80,$07,$84,$10,$60,$80,$85,$87  ; $9805
    .byte $85,$88,$85,$8A,$65,$07,$90,$10,$02,$C0,$03,$3C,$05,$29,$83,$83  ; $9815
    .byte $83,$83,$83,$84,$80,$05,$1D,$07,$92,$10,$03,$38,$80,$D1,$8C,$8F  ; $9825
    .byte $91,$80,$91,$80,$B1,$8C,$AF,$B0,$06,$B1,$AF,$06,$B1,$D8,$91,$B0  ; $9835
    .byte $CF,$8A,$8C,$8F,$80,$8F,$80,$8F,$8D,$8F,$80,$93,$91,$8F,$06,$AF  ; $9845
    .byte $AA,$06,$AC,$80,$8F,$8F,$93,$93,$80,$B4,$80,$8F,$8C,$91,$93,$91  ; $9855
    .byte $94,$96,$05,$29,$6B,$8C,$8F,$6C,$6F,$70,$71,$74,$73,$71,$6F,$70  ; $9865
    .byte $71,$6F,$06,$AC,$06,$AA,$A8,$80,$06,$A7,$A5,$A3,$69,$21,$6A,$AA  ; $9875
    .byte $6E,$21,$6F,$AF,$75,$22,$76,$D6,$B3,$92,$91,$8F,$6D,$6C,$6D,$6F  ; $9885
    .byte $71,$6F,$71,$73,$74,$73,$74,$76,$78,$76,$78,$79,$01,$01,$DE,$01  ; $9895
    .byte $00,$05,$1D,$94,$93,$07,$92,$10,$02,$80,$8D,$80,$8D,$8D,$8C,$AD  ; $98A5
    .byte $A0,$8D,$80,$8D,$8C,$8D,$8F,$80,$94,$80,$02,$00,$80,$93,$93,$93  ; $98B5
    .byte $B4,$80,$02,$80,$06,$80,$BB,$B9,$06,$98,$8D,$80,$8D,$8D,$8C,$AD  ; $98C5
    .byte $A0,$8D,$80,$8D,$8C,$8D,$8F,$80,$94,$80,$93,$93,$93,$80,$96,$93  ; $98D5
    .byte $80,$D8,$03,$3E,$87,$A5,$87,$04,$00,$D1,$97,$00,$05,$03,$31,$05  ; $98E5
    .byte $1D,$91,$80,$01,$10,$9D,$01,$00,$8C,$8F,$91,$01,$10,$9D,$01,$00  ; $98F5
    .byte $91,$80,$91,$01,$10,$9D,$01,$00,$8C,$83,$8F,$01,$10,$9D,$01,$00  ; $9905
    .byte $91,$8D,$80,$01,$10,$9D,$01,$00,$8D,$88,$8D,$01,$10,$9D,$01,$00  ; $9915
    .byte $AC,$8C,$01,$10,$9D,$01,$00,$AF,$8F,$01,$10,$9D,$01,$00,$21,$91  ; $9925
    .byte $04,$01,$F6,$98,$91,$80,$01,$10,$B8,$81,$81,$B8,$01,$00,$8D,$8D  ; $9935
    .byte $8D,$8D,$8D,$8F,$80,$21,$91,$91,$80,$01,$10,$9D,$01,$00,$8C,$8F  ; $9945
    .byte $91,$01,$10,$9D,$01,$00,$91,$80,$91,$01,$10,$9D,$01,$00,$8C,$83  ; $9955
    .byte $90,$01,$10,$9D,$01,$00,$90,$91,$80,$01,$10,$9D,$01,$00,$8C,$8F  ; $9965
    .byte $91,$01,$10,$9D,$01,$00,$91,$80,$91,$01,$10,$9D,$01,$00,$8C,$83  ; $9975
    .byte $90,$01,$10,$9D,$01,$00,$90,$8F,$80,$01,$10,$9D,$01,$00,$8A,$8D  ; $9985
    .byte $8F,$01,$10,$9D,$01,$00,$8F,$80,$8F,$01,$10,$9D,$01,$00,$8A,$81  ; $9995
    .byte $8D,$01,$10,$9D,$01,$00,$8E,$8F,$80,$01,$10,$9D,$01,$00,$8A,$8D  ; $99A5
    .byte $8F,$01,$10,$9D,$01,$00,$8F,$80,$8F,$01,$10,$9D,$01,$00,$8A,$01  ; $99B5
    .byte $10,$9D,$BD,$9D,$01,$00,$04,$01,$4C,$99,$80,$8D,$01,$10,$9D,$01  ; $99C5
    .byte $00,$94,$8D,$01,$10,$7F,$7F,$BD,$01,$00,$8D,$80,$01,$10,$9D,$01  ; $99D5
    .byte $00,$88,$8D,$91,$01,$10,$9D,$01,$00,$8F,$80,$8F,$01,$10,$9D,$01  ; $99E5
    .byte $00,$96,$8F,$01,$10,$7F,$7F,$BD,$01,$00,$8F,$8F,$01,$10,$9D,$01  ; $99F5
    .byte $00,$8F,$80,$8F,$01,$10,$9D,$01,$00,$8D,$04,$01,$CF,$99,$04,$00  ; $9A05
    .byte $F4,$98,$00,$05,$07,$82,$60,$03,$38,$85,$85,$07,$84,$40,$8A,$07  ; $9A15
    .byte $82,$60,$03,$36,$85,$85,$85,$07,$84,$40,$8A,$03,$3D,$07,$83,$40  ; $9A25
    .byte $85,$04,$00,$19,$9A,$00,$00,$80,$00,$01,$82,$80,$00,$0F,$4D,$9A  ; $9A35
    .byte $2E,$9B,$5A,$9C,$58,$9D,$40,$9E,$00,$06,$03,$3C,$02,$C0,$07,$8A  ; $9A45
    .byte $10,$05,$1D,$21,$A5,$08,$01,$D5,$08,$00,$65,$6C,$60,$6A,$60,$06  ; $9A55
    .byte $88,$8A,$68,$21,$65,$A5,$63,$63,$60,$22,$65,$85,$08,$01,$A5,$08  ; $9A65
    .byte $00,$67,$60,$88,$60,$21,$65,$A5,$B4,$B6,$74,$60,$74,$60,$B6,$04  ; $9A75
    .byte $01,$4F,$9A,$71,$71,$6F,$60,$71,$60,$6F,$60,$B1,$8C,$8F,$80,$21  ; $9A85
    .byte $B1,$08,$01,$B1,$08,$00,$80,$71,$06,$98,$B6,$80,$94,$93,$60,$21  ; $9A95
    .byte $74,$94,$93,$21,$B1,$08,$01,$B1,$08,$00,$80,$8C,$8F,$90,$71,$71  ; $9AA5
    .byte $6F,$60,$71,$60,$6F,$60,$B1,$8C,$8F,$80,$21,$B1,$08,$01,$B1,$08  ; $9AB5
    .byte $00,$80,$71,$06,$98,$B6,$80,$94,$93,$60,$21,$74,$94,$93,$80,$74  ; $9AC5
    .byte $60,$93,$60,$74,$A0,$71,$06,$98,$B6,$B4,$B3,$74,$06,$96,$71,$60  ; $9AD5
    .byte $71,$60,$71,$06,$8F,$B1,$71,$06,$98,$B6,$B4,$B3,$74,$76,$60,$78  ; $9AE5
    .byte $60,$98,$60,$78,$76,$74,$76,$74,$73,$74,$73,$71,$73,$71,$6F,$B6  ; $9AF5
    .byte $B4,$B3,$74,$06,$96,$71,$60,$71,$60,$71,$06,$8F,$B1,$71,$06,$98  ; $9B05
    .byte $B6,$B4,$B3,$74,$76,$60,$78,$60,$78,$78,$60,$78,$60,$78,$60,$06  ; $9B15
    .byte $98,$6C,$6C,$06,$8F,$04,$00,$4F,$9A,$00,$06,$03,$3A,$05,$29,$02  ; $9B25
    .byte $00,$07,$86,$10,$65,$68,$6C,$60,$65,$80,$65,$67,$68,$67,$65,$60  ; $9B35
    .byte $65,$63,$21,$65,$04,$02,$30,$9B,$03,$3C,$02,$C0,$07,$8A,$10,$05  ; $9B45
    .byte $1D,$A5,$A7,$65,$60,$65,$60,$A7,$05,$29,$03,$3A,$02,$00,$07,$86  ; $9B55
    .byte $10,$65,$68,$6C,$60,$65,$80,$65,$67,$68,$67,$65,$60,$65,$63,$21  ; $9B65
    .byte $65,$04,$02,$5D,$9B,$03,$3C,$02,$C0,$07,$8A,$10,$05,$1D,$A5,$A7  ; $9B75
    .byte $65,$60,$65,$60,$A7,$05,$29,$03,$38,$02,$00,$07,$86,$10,$65,$65  ; $9B85
    .byte $65,$60,$65,$80,$65,$67,$68,$67,$65,$60,$65,$63,$21,$65,$04,$01  ; $9B95
    .byte $8A,$9B,$03,$3C,$02,$C0,$07,$8A,$10,$05,$1D,$B1,$80,$91,$8A,$60  ; $9BA5
    .byte $21,$8C,$6C,$8A,$B4,$93,$60,$74,$60,$06,$94,$93,$93,$05,$29,$03  ; $9BB5
    .byte $38,$02,$00,$07,$86,$10,$65,$65,$65,$60,$65,$80,$65,$67,$68,$67  ; $9BC5
    .byte $65,$60,$65,$63,$21,$65,$04,$01,$C2,$9B,$03,$3C,$02,$C0,$07,$8A  ; $9BD5
    .byte $10,$05,$1D,$B1,$80,$91,$8A,$60,$21,$8C,$6C,$8A,$74,$60,$74,$60  ; $9BE5
    .byte $83,$63,$02,$00,$01,$44,$08,$01,$21,$7F,$DF,$01,$00,$08,$00,$03  ; $9BF5
    .byte $39,$80,$B6,$B4,$B3,$74,$76,$74,$60,$74,$60,$74,$06,$93,$B4,$80  ; $9C05
    .byte $71,$06,$98,$B6,$B4,$B3,$74,$76,$60,$78,$60,$98,$60,$78,$76,$74  ; $9C15
    .byte $76,$74,$73,$74,$73,$71,$73,$71,$6F,$B6,$B4,$B3,$74,$76,$74,$60  ; $9C25
    .byte $74,$60,$74,$06,$93,$B4,$80,$71,$06,$98,$B6,$B4,$93,$74,$76,$60  ; $9C35
    .byte $73,$60,$73,$73,$60,$73,$60,$73,$60,$06,$93,$6C,$6C,$06,$8F,$08  ; $9C45
    .byte $00,$04,$00,$30,$9B,$00,$06,$03,$50,$05,$1D,$71,$60,$71,$60,$AF  ; $9C55
    .byte $91,$60,$71,$94,$98,$71,$60,$71,$60,$AF,$91,$60,$71,$91,$8F,$6D  ; $9C65
    .byte $60,$6D,$60,$AC,$8D,$60,$6D,$8D,$8C,$AD,$AF,$6D,$60,$6D,$60,$AF  ; $9C75
    .byte $04,$01,$60,$9C,$71,$60,$71,$60,$AF,$91,$60,$71,$94,$98,$76,$60  ; $9C85
    .byte $76,$60,$B4,$96,$60,$76,$91,$8F,$8D,$A0,$8D,$8F,$60,$6F,$8F,$8F  ; $9C95
    .byte $B1,$8F,$60,$71,$60,$06,$91,$8F,$90,$71,$60,$71,$60,$AF,$91,$60  ; $9CA5
    .byte $71,$94,$98,$76,$60,$76,$60,$B4,$96,$60,$76,$91,$8F,$8D,$A0,$8D  ; $9CB5
    .byte $8F,$60,$6F,$8F,$8F,$71,$60,$71,$60,$8F,$6F,$71,$01,$10,$60,$7A  ; $9CC5
    .byte $7A,$7A,$78,$78,$76,$76,$01,$00,$05,$29,$6A,$6A,$68,$60,$6A,$60  ; $9CD5
    .byte $68,$6A,$60,$6A,$8A,$8A,$68,$67,$68,$60,$68,$60,$68,$67,$60,$67  ; $9CE5
    .byte $88,$60,$68,$8A,$8C,$6A,$6A,$68,$60,$6A,$60,$68,$6A,$60,$6A,$8A  ; $9CF5
    .byte $8A,$68,$6C,$60,$8C,$6C,$01,$10,$6B,$6B,$6B,$6B,$69,$69,$69,$69  ; $9D05
    .byte $67,$67,$67,$67,$01,$00,$6A,$6A,$68,$60,$6A,$60,$68,$6A,$60,$6A  ; $9D15
    .byte $8A,$8A,$68,$67,$68,$60,$68,$60,$68,$67,$60,$67,$88,$60,$68,$8A  ; $9D25
    .byte $8C,$6A,$6A,$68,$60,$6A,$60,$68,$6A,$60,$6A,$8A,$8A,$68,$6C,$05  ; $9D35
    .byte $1D,$60,$70,$70,$60,$70,$60,$70,$60,$70,$80,$6C,$6C,$06,$8C,$04  ; $9D45
    .byte $00,$60,$9C,$00,$06,$07,$82,$90,$83,$83,$07,$84,$50,$01,$FF,$8D  ; $9D55
    .byte $01,$00,$07,$82,$90,$63,$63,$63,$63,$83,$07,$84,$50,$01,$FF,$8D  ; $9D65
    .byte $01,$00,$07,$82,$90,$63,$63,$04,$06,$5A,$9D,$07,$84,$50,$01,$FF  ; $9D75
    .byte $8D,$80,$8D,$80,$6D,$60,$6D,$60,$AD,$01,$00,$07,$82,$90,$83,$83  ; $9D85
    .byte $07,$84,$50,$01,$FF,$8D,$01,$00,$07,$82,$90,$63,$63,$63,$63,$83  ; $9D95
    .byte $07,$84,$50,$01,$FF,$8D,$01,$00,$07,$82,$90,$63,$63,$04,$06,$90  ; $9DA5
    .byte $9D,$07,$82,$90,$83,$07,$84,$50,$01,$FF,$8D,$01,$00,$07,$82,$90  ; $9DB5
    .byte $63,$63,$07,$84,$50,$01,$FF,$6D,$01,$00,$07,$82,$90,$63,$C0,$07  ; $9DC5
    .byte $82,$90,$83,$83,$07,$84,$50,$01,$FF,$8D,$01,$00,$07,$82,$90,$63  ; $9DD5
    .byte $63,$63,$63,$83,$07,$84,$50,$01,$FF,$8D,$01,$00,$07,$82,$90,$63  ; $9DE5
    .byte $63,$04,$02,$D4,$9D,$07,$84,$50,$01,$FF,$60,$8D,$60,$AD,$C0,$01  ; $9DF5
    .byte $00,$07,$82,$90,$83,$83,$07,$84,$50,$01,$FF,$8D,$01,$00,$07,$82  ; $9E05
    .byte $90,$63,$63,$63,$63,$83,$07,$84,$50,$01,$FF,$8D,$01,$00,$07,$82  ; $9E15
    .byte $90,$63,$63,$04,$02,$06,$9E,$07,$84,$50,$01,$FF,$60,$6D,$8D,$6D  ; $9E25
    .byte $60,$6D,$60,$AD,$A0,$01,$00,$04,$00,$5A,$9D,$00,$00,$80,$00,$01  ; $9E35
    .byte $62,$80,$00,$0F,$53,$9E,$2B,$9F,$1D,$A0,$14,$A1,$89,$A1,$00,$06  ; $9E45
    .byte $03,$3C,$02,$C0,$07,$8A,$20,$05,$1F,$8C,$71,$68,$60,$71,$60,$65  ; $9E55
    .byte $60,$71,$60,$6C,$88,$91,$04,$01,$5E,$9E,$8A,$6F,$67,$60,$6F,$60  ; $9E65
    .byte $63,$60,$6F,$60,$6A,$87,$8F,$04,$01,$6F,$9E,$8C,$71,$68,$60,$71  ; $9E75
    .byte $60,$65,$60,$71,$60,$6C,$88,$91,$04,$01,$80,$9E,$8A,$6F,$67,$60  ; $9E85
    .byte $6F,$60,$63,$60,$6F,$60,$6A,$87,$8F,$63,$65,$67,$6A,$60,$6F,$73  ; $9E95
    .byte $76,$A0,$07,$92,$10,$03,$3E,$83,$84,$21,$C5,$08,$01,$E5,$08,$00  ; $9EA5
    .byte $06,$87,$06,$88,$8A,$06,$87,$06,$88,$87,$06,$A5,$85,$67,$65,$06  ; $9EB5
    .byte $A3,$A3,$A4,$21,$C5,$08,$01,$E5,$08,$00,$06,$87,$06,$88,$8A,$21  ; $9EC5
    .byte $AC,$08,$01,$AC,$08,$00,$78,$76,$74,$76,$74,$73,$74,$73,$71,$73  ; $9ED5
    .byte $71,$6F,$71,$6F,$6D,$6F,$6D,$6C,$6D,$6C,$6A,$6C,$6A,$68,$07,$AF  ; $9EE5
    .byte $10,$CC,$06,$8C,$06,$8D,$91,$CF,$AC,$AF,$D0,$06,$90,$06,$93,$96  ; $9EF5
    .byte $D4,$94,$93,$91,$8F,$CD,$8D,$8C,$AA,$CF,$8F,$8D,$AC,$71,$76,$71  ; $9F05
    .byte $6D,$04,$03,$12,$9F,$07,$87,$70,$B1,$91,$60,$71,$60,$71,$91,$91  ; $9F15
    .byte $74,$75,$04,$00,$55,$9E,$00,$06,$03,$38,$02,$C0,$06,$60,$05,$1F  ; $9F25
    .byte $07,$90,$10,$8C,$71,$68,$60,$71,$60,$65,$60,$71,$60,$6C,$88,$91  ; $9F35
    .byte $04,$01,$38,$9F,$8A,$6F,$67,$60,$6F,$60,$63,$60,$6F,$60,$6A,$87  ; $9F45
    .byte $8F,$04,$01,$49,$9F,$8C,$71,$68,$60,$71,$60,$65,$60,$71,$60,$6C  ; $9F55
    .byte $88,$91,$04,$01,$5A,$9F,$8A,$6F,$67,$60,$6F,$60,$63,$60,$6F,$60  ; $9F65
    .byte $6A,$87,$8F,$63,$65,$67,$6A,$60,$6F,$73,$76,$A0,$80,$40,$03,$39  ; $9F75
    .byte $07,$92,$10,$02,$00,$8C,$71,$68,$60,$71,$60,$65,$60,$71,$60,$6C  ; $9F85
    .byte $88,$91,$04,$01,$8A,$9F,$8A,$6F,$67,$60,$6F,$60,$63,$60,$6F,$60  ; $9F95
    .byte $6A,$87,$8F,$04,$01,$9B,$9F,$8C,$71,$68,$60,$71,$60,$65,$60,$71  ; $9FA5
    .byte $60,$6C,$88,$91,$04,$01,$AC,$9F,$60,$6F,$60,$6A,$87,$8F,$02,$C0  ; $9FB5
    .byte $07,$8F,$10,$60,$78,$76,$74,$76,$74,$73,$74,$73,$71,$73,$71,$6F  ; $9FC5
    .byte $71,$6F,$6D,$6F,$6D,$6C,$6D,$6C,$6A,$6C,$6A,$05,$1F,$07,$AF,$10  ; $9FD5
    .byte $03,$3A,$C8,$06,$88,$06,$8A,$8C,$C7,$A7,$AC,$CC,$06,$8C,$06,$90  ; $9FE5
    .byte $93,$D1,$91,$60,$93,$91,$6F,$CA,$8A,$88,$A6  ; $9FF5
