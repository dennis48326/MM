; PRG 8 KB bank $34 at $8000
.segment "BANK34"
.org $8000

    JMP loc_34_806C              ; $8000  4C 6C 80

    JMP loc_34_80FE              ; $8003  4C FE 80


sub_34_8006:
    LDA #$00                     ; $8006  A9 00
    STA $C2                      ; $8008  85 C2
    LDY #$08                     ; $800A  A0 08

loc_34_800C:
    ASL $C2                      ; $800C  06 C2
    ROL $C1                      ; $800E  26 C1
    BCC loc_34_801F              ; $8010  90 0D
    CLC                          ; $8012  18
    LDA $C2                      ; $8013  A5 C2
    ADC $C4                      ; $8015  65 C4
    STA $C2                      ; $8017  85 C2
    LDA $C1                      ; $8019  A5 C1
    ADC #$00                     ; $801B  69 00
    STA $C1                      ; $801D  85 C1

loc_34_801F:
    DEY                          ; $801F  88
    BNE loc_34_800C              ; $8020  D0 EA
    RTS                          ; $8022  60


sub_34_8023:
    ASL A                        ; $8023  0A
    TAY                          ; $8024  A8
    INY                          ; $8025  C8
    PLA                          ; $8026  68
    STA $C1                      ; $8027  85 C1
    PLA                          ; $8029  68
    STA $C2                      ; $802A  85 C2
    LDA ($C1),Y                  ; $802C  B1 C1
    PHA                          ; $802E  48
    INY                          ; $802F  C8
    LDA ($C1),Y                  ; $8030  B1 C1
    STA $C2                      ; $8032  85 C2
    PLA                          ; $8034  68
    STA $C1                      ; $8035  85 C1
    JMP ($00C1)                  ; $8037  6C C1 00


sub_34_803A:
    STY $C1                      ; $803A  84 C1
    LDY #$00                     ; $803C  A0 00
    CMP #$C0                     ; $803E  C9 C0
    BCS loc_34_8047              ; $8040  B0 05
    STA $C2                      ; $8042  85 C2
    LDA ($C1),Y                  ; $8044  B1 C1
    RTS                          ; $8046  60


loc_34_8047:
    SEC                          ; $8047  38
    SBC #$20                     ; $8048  E9 20
    STA $C2                      ; $804A  85 C2
    LDA #$07                     ; $804C  A9 07
    STA $8000                    ; $804E  8D 00 80
    LDA #$36                     ; $8051  A9 36
    STA $8001                    ; $8053  8D 01 80
    LDA ($C1),Y                  ; $8056  B1 C1
    PHA                          ; $8058  48
    LDA #$07                     ; $8059  A9 07
    STA $8000                    ; $805B  8D 00 80
    LDA #$35                     ; $805E  A9 35
    STA $8001                    ; $8060  8D 01 80
    LDA #$20                     ; $8063  A9 20
    CLC                          ; $8065  18
    ADC $C2                      ; $8066  65 C2
    STA $C2                      ; $8068  85 C2
    PLA                          ; $806A  68
    RTS                          ; $806B  60


loc_34_806C:
    LDA $C0                      ; $806C  A5 C0
    LSR A                        ; $806E  4A
    BCS loc_34_80D7              ; $806F  B0 66
    LDA $D0                      ; $8071  A5 D0
    ORA $D1                      ; $8073  05 D1
    BEQ loc_34_807A              ; $8075  F0 03
    JSR sub_34_8251              ; $8077  20 51 82

loc_34_807A:
    CLC                          ; $807A  18
    LDA $CA                      ; $807B  A5 CA
    ADC $C8                      ; $807D  65 C8
    STA $C8                      ; $807F  85 C8
    LDA $C9                      ; $8081  A5 C9
    ADC #$00                     ; $8083  69 00
    STA $C7                      ; $8085  85 C7
    LDA $CF                      ; $8087  A5 CF
    PHA                          ; $8089  48
    LDX #$03                     ; $808A  A2 03

loc_34_808C:
    LSR $CF                      ; $808C  46 CF
    BCC loc_34_8099              ; $808E  90 09
    LDA $CF                      ; $8090  A5 CF
    ORA #$80                     ; $8092  09 80
    STA $CF                      ; $8094  85 CF
    JSR sub_34_82DD              ; $8096  20 DD 82

loc_34_8099:
    LDA $C0                      ; $8099  A5 C0
    AND #$02                     ; $809B  29 02
    BNE loc_34_80A6              ; $809D  D0 07
    TXA                          ; $809F  8A
    PHA                          ; $80A0  48
    JSR sub_34_8392              ; $80A1  20 92 83
    PLA                          ; $80A4  68
    TAX                          ; $80A5  AA

loc_34_80A6:
    DEX                          ; $80A6  CA
    BPL loc_34_808C              ; $80A7  10 E3
    PLA                          ; $80A9  68
    STA $CF                      ; $80AA  85 CF
    LSR $C0                      ; $80AC  46 C0
    ASL $C0                      ; $80AE  06 C0
    LDA $CC                      ; $80B0  A5 CC
    AND #$7F                     ; $80B2  29 7F
    BEQ loc_34_80D7              ; $80B4  F0 21
    LDY #$00                     ; $80B6  A0 00
    STY $C1                      ; $80B8  84 C1
    LDY #$04                     ; $80BA  A0 04

loc_34_80BC:
    ASL A                        ; $80BC  0A
    ROL $C1                      ; $80BD  26 C1
    DEY                          ; $80BF  88
    BNE loc_34_80BC              ; $80C0  D0 FA
    CLC                          ; $80C2  18
    ADC $C0                      ; $80C3  65 C0
    STA $C0                      ; $80C5  85 C0
    LDA $C1                      ; $80C7  A5 C1
    ADC $CD                      ; $80C9  65 CD
    BCC loc_34_80D5              ; $80CB  90 08
    LDA $CC                      ; $80CD  A5 CC
    AND #$80                     ; $80CF  29 80
    STA $CC                      ; $80D1  85 CC
    LDA #$FF                     ; $80D3  A9 FF

loc_34_80D5:
    STA $CD                      ; $80D5  85 CD

loc_34_80D7:
    RTS                          ; $80D7  60


sub_34_80D8:
    TXA                          ; $80D8  8A
    AND #$03                     ; $80D9  29 03
    EOR #$03                     ; $80DB  49 03
    ASL A                        ; $80DD  0A
    ASL A                        ; $80DE  0A
    TAY                          ; $80DF  A8
    LDA #$30                     ; $80E0  A9 30
    CPY #$08                     ; $80E2  C0 08
    BNE loc_34_80E8              ; $80E4  D0 02
    LDA #$00                     ; $80E6  A9 00

loc_34_80E8:
    STA $4000,Y                  ; $80E8  99 00 40
    RTS                          ; $80EB  60


sub_34_80EC:
    PHA                          ; $80EC  48
    TXA                          ; $80ED  8A
    AND #$03                     ; $80EE  29 03
    EOR #$03                     ; $80F0  49 03
    ASL A                        ; $80F2  0A
    ASL A                        ; $80F3  0A
    STY $C4                      ; $80F4  84 C4
    ORA $C4                      ; $80F6  05 C4
    TAY                          ; $80F8  A8
    PLA                          ; $80F9  68
    STA $4000,Y                  ; $80FA  99 00 40
    RTS                          ; $80FD  60


loc_34_80FE:
    INC $C0                      ; $80FE  E6 C0
    JSR sub_34_8106              ; $8100  20 06 81
    DEC $C0                      ; $8103  C6 C0
    RTS                          ; $8105  60


sub_34_8106:
    CMP #$F0                     ; $8106  C9 F0
    BCC loc_34_810D              ; $8108  90 03
    JMP loc_34_81AD              ; $810A  4C AD 81


loc_34_810D:
    CMP $8A40                    ; $810D  CD 40 8A
    BCC sub_34_8118              ; $8110  90 06
    SEC                          ; $8112  38
    SBC $8A40                    ; $8113  ED 40 8A
    BCS loc_34_810D              ; $8116  B0 F5

sub_34_8118:
    ASL A                        ; $8118  0A
    TAX                          ; $8119  AA
    LDY $8A44,X                  ; $811A  BC 44 8A
    TYA                          ; $811D  98
    ORA $8A43,X                  ; $811E  1D 43 8A
    BEQ loc_34_816D              ; $8121  F0 4A
    LDA $8A43,X                  ; $8123  BD 43 8A
    JSR sub_34_803A              ; $8126  20 3A 80
    TAY                          ; $8129  A8
    BEQ loc_34_816E              ; $812A  F0 42
    LDY #$00                     ; $812C  A0 00
    INX                          ; $812E  E8
    STA $C4                      ; $812F  85 C4
    AND #$7F                     ; $8131  29 7F
    CMP $CE                      ; $8133  C5 CE
    BCC loc_34_816D              ; $8135  90 36
    STA $CE                      ; $8137  85 CE
    BNE loc_34_8145              ; $8139  D0 0A
    LDA $D6                      ; $813B  A5 D6
    BPL loc_34_8145              ; $813D  10 06
    LDA $C4                      ; $813F  A5 C4
    BMI loc_34_8145              ; $8141  30 02
    STY $D7                      ; $8143  84 D7

loc_34_8145:
    STY $D6                      ; $8145  84 D6
    ASL $C4                      ; $8147  06 C4
    ROR $D6                      ; $8149  66 D6
    BPL loc_34_814F              ; $814B  10 02
    STX $D7                      ; $814D  86 D7

loc_34_814F:
    LDX $C2                      ; $814F  A6 C2
    INC $C1                      ; $8151  E6 C1
    LDA $C1                      ; $8153  A5 C1
    BNE loc_34_8158              ; $8155  D0 01
    INX                          ; $8157  E8

loc_34_8158:
    STA $D0                      ; $8158  85 D0
    STX $D1                      ; $815A  86 D1
    TYA                          ; $815C  98
    STA $D2                      ; $815D  85 D2
    STA $D3                      ; $815F  85 D3
    STA $D4                      ; $8161  85 D4
    STA $D5                      ; $8163  85 D5
    LDY #$27                     ; $8165  A0 27

loc_34_8167:
    STA $0700,Y                  ; $8167  99 00 07
    DEY                          ; $816A  88
    BPL loc_34_8167              ; $816B  10 FA

loc_34_816D:
    RTS                          ; $816D  60


loc_34_816E:
    LDX #$01                     ; $816E  A2 01
    STX $C9                      ; $8170  86 C9
    LDX #$99                     ; $8172  A2 99
    STX $CA                      ; $8174  86 CA
    STA $C8                      ; $8176  85 C8
    STA $CB                      ; $8178  85 CB
    STA $CC                      ; $817A  85 CC
    STA $CD                      ; $817C  85 CD
    LDX #$53                     ; $817E  A2 53

loc_34_8180:
    STA $0728,X                  ; $8180  9D 28 07
    DEX                          ; $8183  CA
    BPL loc_34_8180              ; $8184  10 FA
    LDX #$03                     ; $8186  A2 03

loc_34_8188:
    INC $C1                      ; $8188  E6 C1
    BNE loc_34_818E              ; $818A  D0 02
    INC $C2                      ; $818C  E6 C2

loc_34_818E:
    LDY $C1                      ; $818E  A4 C1
    LDA $C2                      ; $8190  A5 C2
    JSR sub_34_803A              ; $8192  20 3A 80
    STA $0754,X                  ; $8195  9D 54 07
    INC $C1                      ; $8198  E6 C1
    BNE loc_34_819E              ; $819A  D0 02
    INC $C2                      ; $819C  E6 C2

loc_34_819E:
    LDY $C1                      ; $819E  A4 C1
    LDA $C2                      ; $81A0  A5 C2
    JSR sub_34_803A              ; $81A2  20 3A 80
    STA $0750,X                  ; $81A5  9D 50 07
    DEX                          ; $81A8  CA
    BPL loc_34_8188              ; $81A9  10 DD
    BMI sub_34_81F0              ; $81AB  30 43

loc_34_81AD:
    STY $C3                      ; $81AD  84 C3
    AND #$07                     ; $81AF  29 07
    JSR sub_34_8023              ; $81B1  20 23 80
    CPY $81                      ; $81B4  C4 81
    DCP $81                      ; $81B6  C7 81
    ISC ($81,X)                  ; $81B8  E3 81
    ORA $2582,X                  ; $81BA  1D 82 25
    NOP #$2C                     ; $81BD  82 2C
    NOP #$33                     ; $81BF  82 33
    NOP #$49                     ; $81C1  82 49
    NOP #$20                     ; $81C3  82 20
    ISC ($81,X)                  ; $81C5  E3 81

loc_34_81C7:
    LDA #$00                     ; $81C7  A9 00
    STA $CE                      ; $81C9  85 CE
    STA $D0                      ; $81CB  85 D0
    STA $D1                      ; $81CD  85 D1
    STA $D7                      ; $81CF  85 D7
    STA $D8                      ; $81D1  85 D8

sub_34_81D3:
    LDA $CF                      ; $81D3  A5 CF
    BEQ loc_34_81E2              ; $81D5  F0 0B
    EOR #$0F                     ; $81D7  49 0F
    STA $CF                      ; $81D9  85 CF
    JSR sub_34_81F0              ; $81DB  20 F0 81
    LDA #$00                     ; $81DE  A9 00
    STA $CF                      ; $81E0  85 CF

loc_34_81E2:
    RTS                          ; $81E2  60


sub_34_81E3:
    LDA #$00                     ; $81E3  A9 00
    LDX #$03                     ; $81E5  A2 03

loc_34_81E7:
    STA $0754,X                  ; $81E7  9D 54 07
    STA $0750,X                  ; $81EA  9D 50 07
    DEX                          ; $81ED  CA
    BPL loc_34_81E7              ; $81EE  10 F7

sub_34_81F0:
    LDA $CF                      ; $81F0  A5 CF
    PHA                          ; $81F2  48
    LDX #$03                     ; $81F3  A2 03

loc_34_81F5:
    LSR $CF                      ; $81F5  46 CF
    BCS loc_34_8209              ; $81F7  B0 10
    JSR sub_34_80D8              ; $81F9  20 D8 80
    LDA $0754,X                  ; $81FC  BD 54 07
    ORA $0750,X                  ; $81FF  1D 50 07
    BEQ loc_34_8209              ; $8202  F0 05
    LDA #$FF                     ; $8204  A9 FF
    STA $077C,X                  ; $8206  9D 7C 07

loc_34_8209:
    DEX                          ; $8209  CA
    BPL loc_34_81F5              ; $820A  10 E9
    PLA                          ; $820C  68
    STA $CF                      ; $820D  85 CF
    LDA #$08                     ; $820F  A9 08
    STA $4001                    ; $8211  8D 01 40
    STA $4005                    ; $8214  8D 05 40
    LDA #$0F                     ; $8217  A9 0F
    STA $4015                    ; $8219  8D 15 40
    RTS                          ; $821C  60

    .byte $A5,$C0,$09,$02,$85,$C0,$D0,$CB,$A5,$C0,$29,$FD,$85,$C0,$60,$06  ; $821D
    .byte $C3,$F0,$03,$38,$66,$C3,$A5,$C0,$29,$0F,$85,$C0,$A4,$C3,$84,$CC  ; $822D
    .byte $F0,$07,$A0,$FF,$C4,$CD,$D0,$03,$C8,$84,$CD,$60,$A9,$00,$38,$E5  ; $823D
    .byte $C3,$85,$D8,$60  ; $824D

sub_34_8251:
    LDA $D3                      ; $8251  A5 D3
    BEQ loc_34_825A              ; $8253  F0 05
    DEC $D3                      ; $8255  C6 D3
    DEC $D5                      ; $8257  C6 D5
    RTS                          ; $8259  60


loc_34_825A:
    JSR sub_34_8385              ; $825A  20 85 83
    STA $C4                      ; $825D  85 C4
    ASL A                        ; $825F  0A
    BCC loc_34_8272              ; $8260  90 10
    STY $CE                      ; $8262  84 CE
    LDA $D7                      ; $8264  A5 D7
    LSR A                        ; $8266  4A
    BCC loc_34_826F              ; $8267  90 06
    JSR sub_34_8118              ; $8269  20 18 81
    JMP loc_34_825A              ; $826C  4C 5A 82


loc_34_826F:
    JMP loc_34_81C7              ; $826F  4C C7 81


loc_34_8272:
    LSR $C4                      ; $8272  46 C4
    BCC loc_34_82A5              ; $8274  90 2F
    JSR sub_34_8385              ; $8276  20 85 83
    ASL A                        ; $8279  0A
    BEQ loc_34_8288              ; $827A  F0 0C
    ASL $D6                      ; $827C  06 D6
    PHP                          ; $827E  08
    CMP $D6                      ; $827F  C5 D6
    BEQ loc_34_8295              ; $8281  F0 12
    PLP                          ; $8283  28
    ROR $D6                      ; $8284  66 D6
    INC $D6                      ; $8286  E6 D6

loc_34_8288:
    JSR sub_34_8385              ; $8288  20 85 83
    TAX                          ; $828B  AA
    JSR sub_34_8385              ; $828C  20 85 83
    STA $D0                      ; $828F  85 D0
    STX $D1                      ; $8291  86 D1
    BNE loc_34_825A              ; $8293  D0 C5

loc_34_8295:
    TYA                          ; $8295  98
    PLP                          ; $8296  28
    ROR A                        ; $8297  6A
    STA $D6                      ; $8298  85 D6
    CLC                          ; $829A  18
    LDA #$02                     ; $829B  A9 02
    ADC $D0                      ; $829D  65 D0
    STA $D0                      ; $829F  85 D0
    BCC loc_34_82A5              ; $82A1  90 02
    INC $D1                      ; $82A3  E6 D1

loc_34_82A5:
    LSR $C4                      ; $82A5  46 C4
    BCC loc_34_82AE              ; $82A7  90 05
    JSR sub_34_8385              ; $82A9  20 85 83
    STA $D4                      ; $82AC  85 D4

loc_34_82AE:
    LSR $C4                      ; $82AE  46 C4
    BCC loc_34_82B7              ; $82B0  90 05
    JSR sub_34_8385              ; $82B2  20 85 83
    STA $D2                      ; $82B5  85 D2

loc_34_82B7:
    JSR sub_34_8385              ; $82B7  20 85 83
    STA $D3                      ; $82BA  85 D3
    STA $C1                      ; $82BC  85 C1
    LDA $D4                      ; $82BE  A5 D4
    STA $C4                      ; $82C0  85 C4
    JSR sub_34_8006              ; $82C2  20 06 80
    LDY $C1                      ; $82C5  A4 C1
    INY                          ; $82C7  C8
    STY $D5                      ; $82C8  84 D5
    INC $C0                      ; $82CA  E6 C0
    JSR sub_34_8385              ; $82CC  20 85 83
    PHA                          ; $82CF  48
    EOR $CF                      ; $82D0  45 CF
    BEQ loc_34_82D9              ; $82D2  F0 05
    STA $CF                      ; $82D4  85 CF
    JSR sub_34_81D3              ; $82D6  20 D3 81

loc_34_82D9:
    PLA                          ; $82D9  68
    STA $CF                      ; $82DA  85 CF
    RTS                          ; $82DC  60


sub_34_82DD:
    LDY $0700,X                  ; $82DD  BC 00 07
    BEQ loc_34_82E5              ; $82E0  F0 03
    JSR sub_34_8683              ; $82E2  20 83 86

loc_34_82E5:
    LDA $C0                      ; $82E5  A5 C0
    LSR A                        ; $82E7  4A
    BCS loc_34_8309              ; $82E8  B0 1F
    JSR sub_34_86B9              ; $82EA  20 B9 86
    LDA $D3                      ; $82ED  A5 D3
    BEQ loc_34_82F9              ; $82EF  F0 08
    CPX #$01                     ; $82F1  E0 01
    BEQ loc_34_82FA              ; $82F3  F0 05
    LDA $D5                      ; $82F5  A5 D5
    BEQ loc_34_82FF              ; $82F7  F0 06

loc_34_82F9:
    RTS                          ; $82F9  60


loc_34_82FA:
    DEC $0710,X                  ; $82FA  DE 10 07
    BNE loc_34_82F9              ; $82FD  D0 FA

loc_34_82FF:
    LDA $0704,X                  ; $82FF  BD 04 07
    AND #$04                     ; $8302  29 04
    BNE loc_34_82F9              ; $8304  D0 F3
    JMP sub_34_85A2              ; $8306  4C A2 85


loc_34_8309:
    LDA #$00                     ; $8309  A9 00
    STA $C4                      ; $830B  85 C4
    JSR sub_34_8385              ; $830D  20 85 83

loc_34_8310:
    LSR A                        ; $8310  4A
    BCC loc_34_831F              ; $8311  90 0C
    PHA                          ; $8313  48
    JSR sub_34_8385              ; $8314  20 85 83
    STA $C3                      ; $8317  85 C3
    LDA $C4                      ; $8319  A5 C4
    JSR sub_34_8325              ; $831B  20 25 83
    PLA                          ; $831E  68

loc_34_831F:
    BEQ loc_34_8332              ; $831F  F0 11
    INC $C4                      ; $8321  E6 C4
    BNE loc_34_8310              ; $8323  D0 EB

sub_34_8325:
    JSR sub_34_8023              ; $8325  20 23 80
    ROR $AC86                    ; $8328  6E 86 AC
    STX $59                      ; $832B  86 59
    STX $A6                      ; $832D  86 A6
    STX $A0                      ; $832F  86 A0
    STX $20                      ; $8331  86 20
    STA $83                      ; $8333  85 83
    TAY                          ; $8335  A8
    BNE loc_34_8348              ; $8336  D0 10
    STA $0710,X                  ; $8338  9D 10 07
    LDA $0704,X                  ; $833B  BD 04 07
    AND #$F8                     ; $833E  29 F8
    ORA #$04                     ; $8340  09 04
    STA $0704,X                  ; $8342  9D 04 07
    JMP sub_34_80D8              ; $8345  4C D8 80


loc_34_8348:
    LDA $0704,X                  ; $8348  BD 04 07
    ORA #$20                     ; $834B  09 20
    STA $0704,X                  ; $834D  9D 04 07
    LDA $0718,X                  ; $8350  BD 18 07
    ASL A                        ; $8353  0A
    LDA #$54                     ; $8354  A9 54
    BCS loc_34_835A              ; $8356  B0 02
    LDA #$0A                     ; $8358  A9 0A

loc_34_835A:
    STA $071C,X                  ; $835A  9D 1C 07
    TYA                          ; $835D  98
    BPL loc_34_836A              ; $835E  10 0A
    CPX #$01                     ; $8360  E0 01
    BNE loc_34_8367              ; $8362  D0 03
    JSR sub_34_85AD              ; $8364  20 AD 85

loc_34_8367:
    JMP sub_34_8643              ; $8367  4C 43 86


loc_34_836A:
    JSR sub_34_85AD              ; $836A  20 AD 85
    LDA #$FF                     ; $836D  A9 FF
    STA $077C,X                  ; $836F  9D 7C 07
    DEY                          ; $8372  88
    TXA                          ; $8373  8A
    BNE loc_34_837E              ; $8374  D0 08
    STA $C3                      ; $8376  85 C3
    TYA                          ; $8378  98
    EOR #$0F                     ; $8379  49 0F
    JMP sub_34_8635              ; $837B  4C 35 86


loc_34_837E:
    TYA                          ; $837E  98
    CLC                          ; $837F  18
    ADC $D2                      ; $8380  65 D2
    JMP sub_34_85DD              ; $8382  4C DD 85


sub_34_8385:
    LDY $D0                      ; $8385  A4 D0
    LDA $D1                      ; $8387  A5 D1
    INC $D0                      ; $8389  E6 D0
    BNE loc_34_838F              ; $838B  D0 02
    INC $D1                      ; $838D  E6 D1

loc_34_838F:
    JMP sub_34_803A              ; $838F  4C 3A 80


sub_34_8392:
    TXA                          ; $8392  8A
    ORA #$28                     ; $8393  09 28
    TAX                          ; $8395  AA
    LDA $0728,X                  ; $8396  BD 28 07
    ORA $072C,X                  ; $8399  1D 2C 07
    BEQ loc_34_83CB              ; $839C  F0 2D
    LDA $0738,X                  ; $839E  BD 38 07
    BEQ loc_34_83CC              ; $83A1  F0 29
    LDY $0700,X                  ; $83A3  BC 00 07
    BEQ loc_34_83AE              ; $83A6  F0 06
    JSR sub_34_8683              ; $83A8  20 83 86
    JSR sub_34_86B9              ; $83AB  20 B9 86

loc_34_83AE:
    LDA $0740,X                  ; $83AE  BD 40 07
    SEC                          ; $83B1  38
    SBC $C7                      ; $83B2  E5 C7
    STA $0740,X                  ; $83B4  9D 40 07
    BEQ loc_34_83BB              ; $83B7  F0 02
    BCS loc_34_83BE              ; $83B9  B0 03

loc_34_83BB:
    JSR sub_34_85A2              ; $83BB  20 A2 85

loc_34_83BE:
    LDA $0738,X                  ; $83BE  BD 38 07
    SEC                          ; $83C1  38
    SBC $C7                      ; $83C2  E5 C7
    STA $0738,X                  ; $83C4  9D 38 07
    BEQ loc_34_83CC              ; $83C7  F0 03
    BCC loc_34_83CC              ; $83C9  90 01

loc_34_83CB:
    RTS                          ; $83CB  60


loc_34_83CC:
    JSR sub_34_8591              ; $83CC  20 91 85
    CMP #$20                     ; $83CF  C9 20
    BCS loc_34_83D9              ; $83D1  B0 06
    JSR sub_34_8496              ; $83D3  20 96 84
    JMP loc_34_83CC              ; $83D6  4C CC 83


loc_34_83D9:
    PHA                          ; $83D9  48
    ROL A                        ; $83DA  2A
    ROL A                        ; $83DB  2A
    ROL A                        ; $83DC  2A
    ROL A                        ; $83DD  2A
    AND #$07                     ; $83DE  29 07
    TAY                          ; $83E0  A8
    DEY                          ; $83E1  88
    LDA $0730,X                  ; $83E2  BD 30 07
    ASL A                        ; $83E5  0A
    ASL A                        ; $83E6  0A
    BPL loc_34_83EE              ; $83E7  10 05
    LDA $891C,Y                  ; $83E9  B9 1C 89
    BNE loc_34_8405              ; $83EC  D0 17

loc_34_83EE:
    ASL A                        ; $83EE  0A
    ASL A                        ; $83EF  0A
    LDA $8923,Y                  ; $83F0  B9 23 89
    BCC loc_34_8405              ; $83F3  90 10
    STA $C3                      ; $83F5  85 C3
    LDA $0730,X                  ; $83F7  BD 30 07
    AND #$EF                     ; $83FA  29 EF
    STA $0730,X                  ; $83FC  9D 30 07
    LDA $C3                      ; $83FF  A5 C3
    LSR A                        ; $8401  4A
    CLC                          ; $8402  18
    ADC $C3                      ; $8403  65 C3

loc_34_8405:
    CLC                          ; $8405  18
    ADC $0738,X                  ; $8406  7D 38 07
    STA $0738,X                  ; $8409  9D 38 07
    TAY                          ; $840C  A8
    PLA                          ; $840D  68
    AND #$1F                     ; $840E  29 1F
    BNE loc_34_8418              ; $8410  D0 06
    JSR sub_34_85A2              ; $8412  20 A2 85
    JMP loc_34_8490              ; $8415  4C 90 84


loc_34_8418:
    PHA                          ; $8418  48
    STY $C4                      ; $8419  84 C4
    LDA $073C,X                  ; $841B  BD 3C 07
    STA $C1                      ; $841E  85 C1
    JSR sub_34_8006              ; $8420  20 06 80
    LDA $C1                      ; $8423  A5 C1
    BNE loc_34_8429              ; $8425  D0 02
    LDA #$01                     ; $8427  A9 01

loc_34_8429:
    STA $0740,X                  ; $8429  9D 40 07
    PLA                          ; $842C  68
    TAY                          ; $842D  A8
    DEY                          ; $842E  88
    LDA $0730,X                  ; $842F  BD 30 07
    BPL loc_34_843F              ; $8432  10 0B
    LDA $0718,X                  ; $8434  BD 18 07
    BNE loc_34_8453              ; $8437  D0 1A
    JSR sub_34_8643              ; $8439  20 43 86
    JMP loc_34_847D              ; $843C  4C 7D 84


loc_34_843F:
    JSR sub_34_85AD              ; $843F  20 AD 85
    LDA $CF                      ; $8442  A5 CF
    BMI loc_34_8453              ; $8444  30 0D
    STY $C3                      ; $8446  84 C3
    TXA                          ; $8448  8A
    AND #$03                     ; $8449  29 03
    TAY                          ; $844B  A8
    LDA #$FF                     ; $844C  A9 FF
    STA $077C,Y                  ; $844E  99 7C 07
    LDY $C3                      ; $8451  A4 C3

loc_34_8453:
    TXA                          ; $8453  8A
    AND #$03                     ; $8454  29 03
    BNE loc_34_8465              ; $8456  D0 0D
    STA $C3                      ; $8458  85 C3
    TYA                          ; $845A  98
    AND #$0F                     ; $845B  29 0F
    EOR #$0F                     ; $845D  49 0F
    JSR sub_34_8635              ; $845F  20 35 86
    JMP loc_34_847D              ; $8462  4C 7D 84


loc_34_8465:
    STY $C3                      ; $8465  84 C3
    LDA $0730,X                  ; $8467  BD 30 07
    AND #$0F                     ; $846A  29 0F
    TAY                          ; $846C  A8
    LDA $892A,Y                  ; $846D  B9 2A 89
    CLC                          ; $8470  18
    ADC $C3                      ; $8471  65 C3
    CLC                          ; $8473  18
    ADC $CB                      ; $8474  65 CB
    CLC                          ; $8476  18
    ADC $0734,X                  ; $8477  7D 34 07
    JSR sub_34_85DD              ; $847A  20 DD 85

loc_34_847D:
    LDA $0730,X                  ; $847D  BD 30 07
    TAY                          ; $8480  A8
    AND #$40                     ; $8481  29 40
    ASL A                        ; $8483  0A
    STA $C4                      ; $8484  85 C4
    TYA                          ; $8486  98
    AND #$7F                     ; $8487  29 7F
    ORA $C4                      ; $8489  05 C4
    STA $0730,X                  ; $848B  9D 30 07
    BPL loc_34_8495              ; $848E  10 05

loc_34_8490:
    LDA #$FF                     ; $8490  A9 FF
    STA $0740,X                  ; $8492  9D 40 07

loc_34_8495:
    RTS                          ; $8495  60


sub_34_8496:
    CMP #$04                     ; $8496  C9 04
    BCC loc_34_84A3              ; $8498  90 09
    STA $C4                      ; $849A  85 C4
    JSR sub_34_8591              ; $849C  20 91 85
    STA $C3                      ; $849F  85 C3
    LDA $C4                      ; $84A1  A5 C4

loc_34_84A3:
    JSR sub_34_8023              ; $84A3  20 23 80
    CLD                          ; $84A6  D8
    STY $DC                      ; $84A7  84 DC
    STY $E0                      ; $84A9  84 E0
    STY $E7                      ; $84AB  84 E7
    STY $74                      ; $84AD  84 74
    STA $F0                      ; $84AF  85 F0
    STY $FE                      ; $84B1  84 FE
    STY $59                      ; $84B3  84 59
    STX $6E                      ; $84B5  86 6E
    STX $04                      ; $84B7  86 04
    STA $0F                      ; $84B9  85 0F
    STA $14                      ; $84BB  85 14
    STA $A0                      ; $84BD  85 A0
    STX $A6                      ; $84BF  86 A6
    STX $1A                      ; $84C1  86 1A
    STA $1E                      ; $84C3  85 1E
    STA $22                      ; $84C5  85 22
    STA $26                      ; $84C7  85 26
    STA $1A                      ; $84C9  85 1A
    STA $1E                      ; $84CB  85 1E
    STA $22                      ; $84CD  85 22
    STA $26                      ; $84CF  85 26
    STA $59                      ; $84D1  85 59
    STA $7F                      ; $84D3  85 7F
    STA $AC                      ; $84D5  85 AC
    STX $A9                      ; $84D7  86 A9
    JSR $0DD0                    ; $84D9  20 D0 0D
    LDA #$40                     ; $84DC  A9 40
    BNE loc_34_84E9              ; $84DE  D0 09
    LDA #$10                     ; $84E0  A9 10
    ORA $0730,X                  ; $84E2  1D 30 07
    BNE loc_34_84EC              ; $84E5  D0 05
    LDA #$08                     ; $84E7  A9 08

loc_34_84E9:
    EOR $0730,X                  ; $84E9  5D 30 07

loc_34_84EC:
    STA $0730,X                  ; $84EC  9D 30 07
    RTS                          ; $84EF  60

    LDA #$00                     ; $84F0  A9 00
    STA $C8                      ; $84F2  85 C8
    JSR sub_34_8591              ; $84F4  20 91 85
    LDY $C3                      ; $84F7  A4 C3
    STA $CA                      ; $84F9  85 CA
    STY $C9                      ; $84FB  84 C9
    RTS                          ; $84FD  60

    LDA $C3                      ; $84FE  A5 C3
    STA $073C,X                  ; $8500  9D 3C 07
    RTS                          ; $8503  60

    LDA $0730,X                  ; $8504  BD 30 07
    AND #$F8                     ; $8507  29 F8
    ORA $C3                      ; $8509  05 C3
    STA $0730,X                  ; $850B  9D 30 07
    RTS                          ; $850E  60

    LDA $C3                      ; $850F  A5 C3
    STA $CB                      ; $8511  85 CB
    RTS                          ; $8513  60

    LDA $C3                      ; $8514  A5 C3
    STA $0734,X                  ; $8516  9D 34 07
    RTS                          ; $8519  60

    LDA #$00                     ; $851A  A9 00
    BEQ loc_34_8528              ; $851C  F0 0A
    LDA #$04                     ; $851E  A9 04
    BNE loc_34_8528              ; $8520  D0 06
    LDA #$08                     ; $8522  A9 08
    BNE loc_34_8528              ; $8524  D0 02
    LDA #$0C                     ; $8526  A9 0C

loc_34_8528:
    STA $C2                      ; $8528  85 C2
    TXA                          ; $852A  8A
    CLC                          ; $852B  18
    ADC $C2                      ; $852C  65 C2
    TAY                          ; $852E  A8
    LDA $C4                      ; $852F  A5 C4
    CMP #$12                     ; $8531  C9 12
    BCS loc_34_8546              ; $8533  B0 11
    LDA $0744,Y                  ; $8535  B9 44 07
    SEC                          ; $8538  38
    SBC #$01                     ; $8539  E9 01
    BCS loc_34_853F              ; $853B  B0 02
    LDA $C3                      ; $853D  A5 C3

loc_34_853F:
    STA $0744,Y                  ; $853F  99 44 07
    BEQ loc_34_8565              ; $8542  F0 21
    BNE loc_34_8554              ; $8544  D0 0E

loc_34_8546:
    LDA $0744,Y                  ; $8546  B9 44 07
    SEC                          ; $8549  38
    SBC #$01                     ; $854A  E9 01
    BNE loc_34_8565              ; $854C  D0 17
    STA $0744,Y                  ; $854E  99 44 07
    JSR sub_34_8574              ; $8551  20 74 85

loc_34_8554:
    JSR sub_34_8591              ; $8554  20 91 85
    STA $C3                      ; $8557  85 C3
    JSR sub_34_8591              ; $8559  20 91 85
    STA $0728,X                  ; $855C  9D 28 07
    LDA $C3                      ; $855F  A5 C3
    STA $072C,X                  ; $8561  9D 2C 07
    RTS                          ; $8564  60


loc_34_8565:
    LDA #$02                     ; $8565  A9 02
    CLC                          ; $8567  18
    ADC $0728,X                  ; $8568  7D 28 07
    STA $0728,X                  ; $856B  9D 28 07
    BCC loc_34_8573              ; $856E  90 03
    INC $072C,X                  ; $8570  FE 2C 07

loc_34_8573:
    RTS                          ; $8573  60


sub_34_8574:
    LDA $0730,X                  ; $8574  BD 30 07
    AND #$97                     ; $8577  29 97
    ORA $C3                      ; $8579  05 C3
    STA $0730,X                  ; $857B  9D 30 07
    RTS                          ; $857E  60

    PLA                          ; $857F  68
    PLA                          ; $8580  68
    LDA #$00                     ; $8581  A9 00
    STA $0728,X                  ; $8583  9D 28 07
    STA $072C,X                  ; $8586  9D 2C 07
    LDA $CF                      ; $8589  A5 CF
    BMI loc_34_8590              ; $858B  30 03
    JMP sub_34_80D8              ; $858D  4C D8 80


loc_34_8590:
    RTS                          ; $8590  60


sub_34_8591:
    LDY $0728,X                  ; $8591  BC 28 07
    LDA $072C,X                  ; $8594  BD 2C 07
    INC $0728,X                  ; $8597  FE 28 07
    BNE loc_34_859F              ; $859A  D0 03
    INC $072C,X                  ; $859C  FE 2C 07

loc_34_859F:
    JMP sub_34_803A              ; $859F  4C 3A 80


sub_34_85A2:
    LDA $0704,X                  ; $85A2  BD 04 07
    AND #$F8                     ; $85A5  29 F8
    ORA #$03                     ; $85A7  09 03
    STA $0704,X                  ; $85A9  9D 04 07
    RTS                          ; $85AC  60


sub_34_85AD:
    TYA                          ; $85AD  98
    PHA                          ; $85AE  48
    LDY #$00                     ; $85AF  A0 00
    LDA $0704,X                  ; $85B1  BD 04 07
    AND #$F8                     ; $85B4  29 F8
    STA $0704,X                  ; $85B6  9D 04 07
    CPX #$29                     ; $85B9  E0 29
    BEQ loc_34_85CF              ; $85BB  F0 12
    CPX #$01                     ; $85BD  E0 01
    BNE loc_34_85D6              ; $85BF  D0 15
    LDA $D3                      ; $85C1  A5 D3
    STA $C1                      ; $85C3  85 C1
    LDA $070C,X                  ; $85C5  BD 0C 07
    STA $C4                      ; $85C8  85 C4
    JSR sub_34_8006              ; $85CA  20 06 80
    LDY $C1                      ; $85CD  A4 C1

loc_34_85CF:
    INY                          ; $85CF  C8
    INC $0704,X                  ; $85D0  FE 04 07
    INC $0704,X                  ; $85D3  FE 04 07

loc_34_85D6:
    TYA                          ; $85D6  98
    STA $0710,X                  ; $85D7  9D 10 07
    PLA                          ; $85DA  68
    TAY                          ; $85DB  A8
    RTS                          ; $85DC  60


sub_34_85DD:
    CMP #$60                     ; $85DD  C9 60
    BCC loc_34_85E3              ; $85DF  90 02
    LDA #$5F                     ; $85E1  A9 5F

loc_34_85E3:
    STA $C3                      ; $85E3  85 C3
    INC $C3                      ; $85E5  E6 C3
    CPX #$28                     ; $85E7  E0 28
    BCC loc_34_8629              ; $85E9  90 3E
    LDA $071C,X                  ; $85EB  BD 1C 07
    BEQ loc_34_861C              ; $85EE  F0 2C
    CMP $C3                      ; $85F0  C5 C3
    BNE loc_34_85FB              ; $85F2  D0 07
    LDA $0730,X                  ; $85F4  BD 30 07
    BPL loc_34_861C              ; $85F7  10 23
    BMI sub_34_8643              ; $85F9  30 48

loc_34_85FB:
    LDA $0718,X                  ; $85FB  BD 18 07
    BEQ loc_34_861C              ; $85FE  F0 1C
    BCS loc_34_8606              ; $8600  B0 04
    ORA #$80                     ; $8602  09 80
    BNE loc_34_8608              ; $8604  D0 02

loc_34_8606:
    AND #$7F                     ; $8606  29 7F

loc_34_8608:
    STA $0718,X                  ; $8608  9D 18 07
    LDA $0704,X                  ; $860B  BD 04 07
    ORA #$20                     ; $860E  09 20
    STA $0704,X                  ; $8610  9D 04 07
    LDA $C3                      ; $8613  A5 C3
    LDY $071C,X                  ; $8615  BC 1C 07
    STY $C3                      ; $8618  84 C3
    BNE loc_34_8626              ; $861A  D0 0A

loc_34_861C:
    LDA $0704,X                  ; $861C  BD 04 07
    AND #$DF                     ; $861F  29 DF
    STA $0704,X                  ; $8621  9D 04 07
    LDA $C3                      ; $8624  A5 C3

loc_34_8626:
    STA $071C,X                  ; $8626  9D 1C 07

loc_34_8629:
    ASL $C3                      ; $8629  06 C3
    LDY $C3                      ; $862B  A4 C3
    LDA $8960,Y                  ; $862D  B9 60 89
    STA $C3                      ; $8630  85 C3
    LDA $8961,Y                  ; $8632  B9 61 89

sub_34_8635:
    STA $0724,X                  ; $8635  9D 24 07
    LDA $C3                      ; $8638  A5 C3
    STA $0720,X                  ; $863A  9D 20 07
    LDY #$04                     ; $863D  A0 04
    LDA ($C5),Y                  ; $863F  B1 C5
    BMI loc_34_864B              ; $8641  30 08

sub_34_8643:
    LDA $0704,X                  ; $8643  BD 04 07
    AND #$08                     ; $8646  29 08
    BNE loc_34_864B              ; $8648  D0 01
    RTS                          ; $864A  60


loc_34_864B:
    LDA #$00                     ; $864B  A9 00
    STA $0708,X                  ; $864D  9D 08 07
    LDA $0704,X                  ; $8650  BD 04 07
    AND #$37                     ; $8653  29 37
    STA $0704,X                  ; $8655  9D 04 07
    RTS                          ; $8658  60

    CPX #$01                     ; $8659  E0 01
    BNE loc_34_8661              ; $865B  D0 04
    LDA $C3                      ; $865D  A5 C3
    BNE loc_34_866A              ; $865F  D0 09

loc_34_8661:
    LDA $070C,X                  ; $8661  BD 0C 07
    AND #$C0                     ; $8664  29 C0
    ORA $C3                      ; $8666  05 C3
    ORA #$30                     ; $8668  09 30

loc_34_866A:
    STA $070C,X                  ; $866A  9D 0C 07
    RTS                          ; $866D  60

    INC $C3                      ; $866E  E6 C3
    LDA $C3                      ; $8670  A5 C3
    CMP $0700,X                  ; $8672  DD 00 07
    BEQ loc_34_869F              ; $8675  F0 28
    STA $0700,X                  ; $8677  9D 00 07
    TAY                          ; $867A  A8
    LDA $0704,X                  ; $867B  BD 04 07
    ORA #$08                     ; $867E  09 08
    STA $0704,X                  ; $8680  9D 04 07

sub_34_8683:
    DEY                          ; $8683  88
    LDA #$00                     ; $8684  A9 00
    STA $C3                      ; $8686  85 C3
    TYA                          ; $8688  98
    ASL A                        ; $8689  0A
    ROL $C3                      ; $868A  26 C3
    ASL A                        ; $868C  0A
    ROL $C3                      ; $868D  26 C3
    ASL A                        ; $868F  0A
    ROL $C3                      ; $8690  26 C3
    CLC                          ; $8692  18
    ADC $8A42                    ; $8693  6D 42 8A
    STA $C5                      ; $8696  85 C5
    LDA $C3                      ; $8698  A5 C3
    ADC $8A41                    ; $869A  6D 41 8A
    STA $C6                      ; $869D  85 C6

loc_34_869F:
    RTS                          ; $869F  60

    LDA $C3                      ; $86A0  A5 C3
    STA $0714,X                  ; $86A2  9D 14 07
    RTS                          ; $86A5  60

    LDA $C3                      ; $86A6  A5 C3
    STA $0718,X                  ; $86A8  9D 18 07
    RTS                          ; $86AB  60

    LDA $070C,X                  ; $86AC  BD 0C 07
    AND #$0F                     ; $86AF  29 0F
    ORA $C3                      ; $86B1  05 C3
    ORA #$30                     ; $86B3  09 30
    STA $070C,X                  ; $86B5  9D 0C 07
    RTS                          ; $86B8  60


sub_34_86B9:
    LDA $0710,X                  ; $86B9  BD 10 07
    STA $C4                      ; $86BC  85 C4
    LDA $0704,X                  ; $86BE  BD 04 07
    AND #$07                     ; $86C1  29 07
    JSR sub_34_8023              ; $86C3  20 23 80
    BNE loc_34_864E              ; $86C6  D0 86
    SBC $86                      ; $86C8  E5 86
    SLO $0187,X                  ; $86CA  1F 87 01
    SAX $1B                      ; $86CD  87 1B
    NOP #$A0                     ; $86CF  89 A0
    BRK                          ; $86D1  00
    LDA ($C5),Y                  ; $86D2  B1 C5
    TAY                          ; $86D4  A8
    LDA $C4                      ; $86D5  A5 C4
    CLC                          ; $86D7  18
    ADC $893A,Y                  ; $86D8  79 3A 89
    BCS loc_34_86E1              ; $86DB  B0 04
    CMP #$F0                     ; $86DD  C9 F0
    BCC loc_34_871C              ; $86DF  90 3B

loc_34_86E1:
    LDA #$F0                     ; $86E1  A9 F0
    BNE loc_34_8719              ; $86E3  D0 34
    LDY #$01                     ; $86E5  A0 01
    LDA ($C5),Y                  ; $86E7  B1 C5
    BEQ loc_34_86FA              ; $86E9  F0 0F
    TAY                          ; $86EB  A8
    LDA $C4                      ; $86EC  A5 C4
    SEC                          ; $86EE  38
    SBC $893A,Y                  ; $86EF  F9 3A 89
    BCC loc_34_86FA              ; $86F2  90 06
    LDY #$02                     ; $86F4  A0 02
    CMP ($C5),Y                  ; $86F6  D1 C5
    BCS loc_34_871C              ; $86F8  B0 22

loc_34_86FA:
    LDY #$02                     ; $86FA  A0 02
    LDA ($C5),Y                  ; $86FC  B1 C5
    JMP loc_34_8719              ; $86FE  4C 19 87

    TXA                          ; $8701  8A
    AND #$03                     ; $8702  29 03
    CMP #$01                     ; $8704  C9 01
    BEQ loc_34_8717              ; $8706  F0 0F
    LDY #$03                     ; $8708  A0 03
    LDA ($C5),Y                  ; $870A  B1 C5
    BEQ loc_34_871F              ; $870C  F0 11
    TAY                          ; $870E  A8
    LDA $C4                      ; $870F  A5 C4
    SEC                          ; $8711  38
    SBC $893A,Y                  ; $8712  F9 3A 89
    BCS loc_34_871C              ; $8715  B0 05

loc_34_8717:
    LDA #$00                     ; $8717  A9 00

loc_34_8719:
    INC $0704,X                  ; $8719  FE 04 07

loc_34_871C:
    STA $0710,X                  ; $871C  9D 10 07

loc_34_871F:
    CPX #$28                     ; $871F  E0 28
    BCC loc_34_8736              ; $8721  90 13
    LDA $CF                      ; $8723  A5 CF
    BPL loc_34_872A              ; $8725  10 03
    JMP loc_34_88A7              ; $8727  4C A7 88


loc_34_872A:
    LDA $CD                      ; $872A  A5 CD
    LDY $CC                      ; $872C  A4 CC
    BMI loc_34_8732              ; $872E  30 02
    EOR #$FF                     ; $8730  49 FF

loc_34_8732:
    CMP #$FF                     ; $8732  C9 FF
    BNE loc_34_873F              ; $8734  D0 09

loc_34_8736:
    TXA                          ; $8736  8A
    AND #$03                     ; $8737  29 03
    CMP #$01                     ; $8739  C9 01
    BNE loc_34_875F              ; $873B  D0 22
    BEQ loc_34_8751              ; $873D  F0 12

loc_34_873F:
    CPX #$29                     ; $873F  E0 29
    BNE loc_34_875A              ; $8741  D0 17
    STA $C4                      ; $8743  85 C4
    LDA $0740,X                  ; $8745  BD 40 07
    STA $C1                      ; $8748  85 C1
    JSR sub_34_8006              ; $874A  20 06 80
    LDA $C1                      ; $874D  A5 C1
    BEQ loc_34_87A9              ; $874F  F0 58

loc_34_8751:
    LDA $0710,X                  ; $8751  BD 10 07
    BEQ loc_34_87A9              ; $8754  F0 53
    LDA #$FF                     ; $8756  A9 FF
    BNE loc_34_87A9              ; $8758  D0 4F

loc_34_875A:
    CMP $0710,X                  ; $875A  DD 10 07
    BCC loc_34_8762              ; $875D  90 03

loc_34_875F:
    LDA $0710,X                  ; $875F  BD 10 07

loc_34_8762:
    LSR A                        ; $8762  4A
    LSR A                        ; $8763  4A
    LSR A                        ; $8764  4A
    LSR A                        ; $8765  4A
    EOR #$0F                     ; $8766  49 0F
    STA $C3                      ; $8768  85 C3
    LDY #$06                     ; $876A  A0 06
    LDA ($C5),Y                  ; $876C  B1 C5
    CMP #$05                     ; $876E  C9 05
    BCC loc_34_8796              ; $8770  90 24
    STA $C4                      ; $8772  85 C4
    LDY $0708,X                  ; $8774  BC 08 07
    LDA $0704,X                  ; $8777  BD 04 07
    ASL A                        ; $877A  0A
    ASL A                        ; $877B  0A
    TYA                          ; $877C  98
    BCC loc_34_8781              ; $877D  90 02
    EOR #$FF                     ; $877F  49 FF

loc_34_8781:
    BEQ loc_34_8796              ; $8781  F0 13
    STA $C1                      ; $8783  85 C1
    JSR sub_34_8006              ; $8785  20 06 80
    LDA $C1                      ; $8788  A5 C1
    LSR A                        ; $878A  4A
    LSR A                        ; $878B  4A
    CMP #$10                     ; $878C  C9 10
    BCS loc_34_87A4              ; $878E  B0 14
    CMP $C3                      ; $8790  C5 C3
    BCC loc_34_8796              ; $8792  90 02
    STA $C3                      ; $8794  85 C3

loc_34_8796:
    LDA #$10                     ; $8796  A9 10
    STA $C4                      ; $8798  85 C4
    LDA $070C,X                  ; $879A  BD 0C 07
    SEC                          ; $879D  38
    SBC $C3                      ; $879E  E5 C3
    BIT $C4                      ; $87A0  24 C4
    BNE loc_34_87A9              ; $87A2  D0 05

loc_34_87A4:
    LDA $070C,X                  ; $87A4  BD 0C 07
    AND #$F0                     ; $87A7  29 F0

loc_34_87A9:
    LDY #$00                     ; $87A9  A0 00
    JSR sub_34_80EC              ; $87AB  20 EC 80
    TXA                          ; $87AE  8A
    AND #$03                     ; $87AF  29 03
    TAY                          ; $87B1  A8
    LDA $077C,Y                  ; $87B2  B9 7C 07
    BMI loc_34_880B              ; $87B5  30 54
    LDY #$05                     ; $87B7  A0 05
    LDA ($C5),Y                  ; $87B9  B1 C5
    BEQ loc_34_880B              ; $87BB  F0 4E
    STA $C4                      ; $87BD  85 C4
    LDY $0708,X                  ; $87BF  BC 08 07
    LDA $0704,X                  ; $87C2  BD 04 07
    ASL A                        ; $87C5  0A
    ASL A                        ; $87C6  0A
    TYA                          ; $87C7  98
    BCC loc_34_87CC              ; $87C8  90 02
    EOR #$FF                     ; $87CA  49 FF

loc_34_87CC:
    BEQ loc_34_880B              ; $87CC  F0 3D
    STA $C1                      ; $87CE  85 C1
    JSR sub_34_8006              ; $87D0  20 06 80
    LDA $C1                      ; $87D3  A5 C1
    LSR A                        ; $87D5  4A
    ROR $C2                      ; $87D6  66 C2
    LSR A                        ; $87D8  4A
    ROR $C2                      ; $87D9  66 C2
    LSR A                        ; $87DB  4A
    ROR $C2                      ; $87DC  66 C2
    LSR A                        ; $87DE  4A
    ROR $C2                      ; $87DF  66 C2
    TAY                          ; $87E1  A8
    ORA $C2                      ; $87E2  05 C2
    BEQ loc_34_880B              ; $87E4  F0 25
    LDA $0704,X                  ; $87E6  BD 04 07
    BMI loc_34_87F9              ; $87E9  30 0E
    CLC                          ; $87EB  18
    LDA $C2                      ; $87EC  A5 C2
    ADC $0720,X                  ; $87EE  7D 20 07
    STA $C2                      ; $87F1  85 C2
    TYA                          ; $87F3  98
    ADC $0724,X                  ; $87F4  7D 24 07
    BNE loc_34_8808              ; $87F7  D0 0F

loc_34_87F9:
    SEC                          ; $87F9  38
    LDA $0720,X                  ; $87FA  BD 20 07
    SBC $C2                      ; $87FD  E5 C2
    STA $C2                      ; $87FF  85 C2
    LDA $0724,X                  ; $8801  BD 24 07
    STY $C1                      ; $8804  84 C1
    SBC $C1                      ; $8806  E5 C1

loc_34_8808:
    TAY                          ; $8808  A8
    BNE loc_34_8813              ; $8809  D0 08

loc_34_880B:
    LDA $0720,X                  ; $880B  BD 20 07
    STA $C2                      ; $880E  85 C2
    LDY $0724,X                  ; $8810  BC 24 07

loc_34_8813:
    CPX #$28                     ; $8813  E0 28
    BCS loc_34_8834              ; $8815  B0 1D
    LDA $D6                      ; $8817  A5 D6
    BPL loc_34_8834              ; $8819  10 19
    LDA $D8                      ; $881B  A5 D8
    BEQ loc_34_8834              ; $881D  F0 15
    STA $C4                      ; $881F  85 C4
    STY $C1                      ; $8821  84 C1
    LDA $C2                      ; $8823  A5 C2
    PHA                          ; $8825  48
    JSR sub_34_8006              ; $8826  20 06 80
    PLA                          ; $8829  68
    CLC                          ; $882A  18
    ADC $C2                      ; $882B  65 C2
    STA $C2                      ; $882D  85 C2
    LDA #$00                     ; $882F  A9 00
    ADC $C1                      ; $8831  65 C1
    TAY                          ; $8833  A8

loc_34_8834:
    TXA                          ; $8834  8A
    AND #$03                     ; $8835  29 03
    BNE loc_34_8848              ; $8837  D0 0F
    TYA                          ; $8839  98
    AND #$0F                     ; $883A  29 0F
    LDY #$07                     ; $883C  A0 07
    ORA ($C5),Y                  ; $883E  11 C5
    STA $C2                      ; $8840  85 C2
    LDA #$00                     ; $8842  A9 00
    STA $C1                      ; $8844  85 C1
    BEQ loc_34_888B              ; $8846  F0 43

loc_34_8848:
    TYA                          ; $8848  98
    LDY #$08                     ; $8849  A0 08

loc_34_884B:
    DEY                          ; $884B  88
    CMP $895A,Y                  ; $884C  D9 5A 89
    BCC loc_34_884B              ; $884F  90 FA
    STA $C1                      ; $8851  85 C1
    TYA                          ; $8853  98
    CLC                          ; $8854  18
    ADC $C1                      ; $8855  65 C1
    TAY                          ; $8857  A8
    AND #$07                     ; $8858  29 07
    CLC                          ; $885A  18
    ADC #$07                     ; $885B  69 07
    STA $C1                      ; $885D  85 C1
    TYA                          ; $885F  98
    AND #$38                     ; $8860  29 38
    EOR #$38                     ; $8862  49 38
    BEQ loc_34_886F              ; $8864  F0 09

loc_34_8866:
    LSR $C1                      ; $8866  46 C1
    ROR $C2                      ; $8868  66 C2
    SEC                          ; $886A  38
    SBC #$08                     ; $886B  E9 08
    BNE loc_34_8866              ; $886D  D0 F7

loc_34_886F:
    LDY #$00                     ; $886F  A0 00
    LDA $0714,X                  ; $8871  BD 14 07
    BEQ loc_34_888B              ; $8874  F0 15
    BPL loc_34_8879              ; $8876  10 01
    DEY                          ; $8878  88

loc_34_8879:
    CLC                          ; $8879  18
    ADC $C2                      ; $887A  65 C2
    STA $C2                      ; $887C  85 C2
    TYA                          ; $887E  98
    ADC $C1                      ; $887F  65 C1
    STA $C1                      ; $8881  85 C1
    LDA $C2                      ; $8883  A5 C2
    ORA $C1                      ; $8885  05 C1
    BNE loc_34_888B              ; $8887  D0 02
    INC $C2                      ; $8889  E6 C2

loc_34_888B:
    LDY #$02                     ; $888B  A0 02
    LDA $C2                      ; $888D  A5 C2
    JSR sub_34_80EC              ; $888F  20 EC 80
    TXA                          ; $8892  8A
    AND #$03                     ; $8893  29 03
    TAY                          ; $8895  A8
    LDA $C1                      ; $8896  A5 C1
    CMP $077C,Y                  ; $8898  D9 7C 07
    BEQ loc_34_88A7              ; $889B  F0 0A
    STA $077C,Y                  ; $889D  99 7C 07
    ORA #$08                     ; $88A0  09 08
    LDY #$03                     ; $88A2  A0 03
    JSR sub_34_80EC              ; $88A4  20 EC 80

loc_34_88A7:
    LDA $0704,X                  ; $88A7  BD 04 07
    AND #$20                     ; $88AA  29 20
    BEQ loc_34_8901              ; $88AC  F0 53
    LDA $0718,X                  ; $88AE  BD 18 07
    BEQ loc_34_88F9              ; $88B1  F0 46
    LDY #$00                     ; $88B3  A0 00
    ASL A                        ; $88B5  0A
    PHP                          ; $88B6  08
    BCC loc_34_88BF              ; $88B7  90 06
    EOR #$FF                     ; $88B9  49 FF
    CLC                          ; $88BB  18
    ADC #$01                     ; $88BC  69 01
    DEY                          ; $88BE  88

loc_34_88BF:
    CLC                          ; $88BF  18
    ADC $0720,X                  ; $88C0  7D 20 07
    STA $0720,X                  ; $88C3  9D 20 07
    TYA                          ; $88C6  98
    ADC $0724,X                  ; $88C7  7D 24 07
    STA $0724,X                  ; $88CA  9D 24 07
    LDA $071C,X                  ; $88CD  BD 1C 07
    ASL A                        ; $88D0  0A
    TAY                          ; $88D1  A8
    SEC                          ; $88D2  38
    LDA $0720,X                  ; $88D3  BD 20 07
    SBC $8960,Y                  ; $88D6  F9 60 89
    LDA $0724,X                  ; $88D9  BD 24 07
    AND #$3F                     ; $88DC  29 3F
    SBC $8961,Y                  ; $88DE  F9 61 89
    LDA #$FF                     ; $88E1  A9 FF
    ADC #$00                     ; $88E3  69 00
    PLP                          ; $88E5  28
    ADC #$00                     ; $88E6  69 00
    BNE loc_34_8901              ; $88E8  D0 17
    TXA                          ; $88EA  8A
    BEQ loc_34_8901              ; $88EB  F0 14
    LDA $8960,Y                  ; $88ED  B9 60 89
    STA $0720,X                  ; $88F0  9D 20 07
    LDA $8961,Y                  ; $88F3  B9 61 89
    STA $0724,X                  ; $88F6  9D 24 07

loc_34_88F9:
    LDA $0704,X                  ; $88F9  BD 04 07
    AND #$DF                     ; $88FC  29 DF
    STA $0704,X                  ; $88FE  9D 04 07

loc_34_8901:
    LDY #$04                     ; $8901  A0 04
    LDA ($C5),Y                  ; $8903  B1 C5
    AND #$7F                     ; $8905  29 7F
    BEQ loc_34_891B              ; $8907  F0 12
    CLC                          ; $8909  18
    ADC $0708,X                  ; $890A  7D 08 07
    STA $0708,X                  ; $890D  9D 08 07
    BCC loc_34_891B              ; $8910  90 09
    LDA $0704,X                  ; $8912  BD 04 07
    CLC                          ; $8915  18
    ADC #$40                     ; $8916  69 40
    STA $0704,X                  ; $8918  9D 04 07

loc_34_891B:
    RTS                          ; $891B  60

    .byte $02,$04,$08,$10,$20,$40,$80,$03,$06,$0C,$18,$30,$60,$C0,$00,$0C  ; $891C
    .byte $18,$24,$30,$3C,$48,$54,$18,$24,$30,$3C,$48,$54,$60,$6C,$00,$01  ; $892C
    .byte $02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0E,$0F,$10,$12,$13  ; $893C
    .byte $14,$16,$18,$1B,$1E,$23,$28,$30,$3C,$50,$7E,$7F,$FE,$FF,$00,$07  ; $894C
    .byte $0E,$15,$1C,$23,$2A,$31,$5C,$37,$9C,$36,$E7,$35,$3C,$35,$9B,$34  ; $895C
    .byte $02,$34,$72,$33,$EA,$32,$6A,$32,$F1,$31,$80,$31,$14,$31,$5C,$30  ; $896C
    .byte $9C,$2F,$E7,$2E,$3C,$2E,$9B,$2D,$02,$2D,$72,$2C,$EA,$2B,$6A,$2B  ; $897C
    .byte $F1,$2A,$80,$2A,$14,$2A,$5C,$29,$9C,$28,$E7,$27,$3C,$27,$9B,$26  ; $898C
    .byte $02,$26,$72,$25,$EA,$24,$6A,$24,$F1,$23,$80,$23,$14,$23,$5C,$22  ; $899C
    .byte $9C,$21,$E7,$20,$3C,$20,$9B,$1F,$02,$1F,$72,$1E,$EA,$1D,$6A,$1D  ; $89AC
    .byte $F1,$1C,$80,$1C,$14,$1C,$5C,$1B,$9C,$1A,$E7,$19,$3C,$19,$9B,$18  ; $89BC
    .byte $02,$18,$72,$17,$EA,$16,$6A,$16,$F1,$15,$80,$15,$14,$15,$5C,$14  ; $89CC
    .byte $9C,$13,$E7,$12,$3C,$12,$9B,$11,$02,$11,$72,$10,$EA,$0F,$6A,$0F  ; $89DC
    .byte $F1,$0E,$80,$0E,$14,$0E,$5C,$0D,$9C,$0C,$E7,$0B,$3C,$0B,$9B,$0A  ; $89EC
    .byte $02,$0A,$72,$09,$EA,$08,$6A,$08,$F1,$07,$80,$07,$14,$07,$5C,$06  ; $89FC
    .byte $9C,$05,$E7,$04,$3C,$04,$9B,$03,$02,$03,$72,$02,$EA,$01,$6A,$01  ; $8A0C
    .byte $F1,$00,$80,$00,$14,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $8A1C
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $8A2C
    .byte $00,$00,$00,$00,$66,$8B,$0F,$8D,$47,$91,$67,$94,$E8,$98,$E4,$9D  ; $8A3C
    .byte $BA,$A1,$96,$A3,$FF,$A8,$43,$AC,$D7,$AD,$83,$B0,$97,$B3,$F5,$B7  ; $8A4C
    .byte $5C,$B9,$D5,$BC,$5A,$BD,$3C,$BE,$DA,$BF,$C8,$C0,$CB,$C1,$9B,$C2  ; $8A5C
    .byte $0F,$C2,$B5,$C3,$94,$C4,$2B,$C5,$00,$C7,$3F,$C9,$86,$C9,$9E,$CB  ; $8A6C
    .byte $1E,$CC,$7B,$CD,$F7,$CF,$B1,$D1,$D3,$D3,$B1,$D5,$A9,$D7,$58,$D7  ; $8A7C
    .byte $64,$D7,$7F,$D7,$9D,$D7,$E1,$D7,$F1,$D8,$0E,$D8,$52,$D8,$6C,$D8  ; $8A8C
    .byte $7E,$D8,$94,$D8,$B6,$D8,$CA,$D9,$30,$D9,$57,$D9,$6D,$D9,$7F,$D9  ; $8A9C
    .byte $A1,$D9,$BE,$D9,$CE,$D9,$EC,$DA,$03,$DA,$13,$DA,$42,$DA,$9B,$DA  ; $8AAC
    .byte $B1,$DA,$C3,$DA,$D8,$DB,$0B,$DB,$10,$DB,$21,$DB,$33,$DB,$3F,$DB  ; $8ABC
    .byte $58,$DB,$6C,$DB,$7B,$DB,$85,$DB,$92,$DB,$AF,$DB,$C1,$DB,$CD,$DB  ; $8ACC
    .byte $E5,$DB,$F5,$DC,$0C,$DC,$25,$DC,$3E,$DC,$58,$DC,$78,$DC,$8A,$DC  ; $8ADC
    .byte $9A,$DC,$A5,$DC,$CF,$DC,$F3,$DD,$1D,$DD,$74,$DD,$98,$DD,$B7,$DD  ; $8AEC
    .byte $D3,$DD,$FB,$DE,$29,$DE,$6E,$DE,$81,$DE,$99,$DE,$D5,$DE,$E8,$DF  ; $8AFC
    .byte $06,$DF,$0B,$1F,$1A,$90,$14,$9E,$20,$26,$00,$1F,$1F,$F0,$1F,$FF  ; $8B0C
    .byte $03,$00,$00,$1D,$19,$C0,$10,$00,$00,$00,$00,$1D,$19,$C0,$10,$E4  ; $8B1C
    .byte $05,$00,$00,$1F,$1F,$D0,$0F,$E4,$02,$1E,$00,$1C,$18,$B0,$06,$00  ; $8B2C
    .byte $00,$00,$00,$1E,$14,$A0,$10,$C9,$00,$42,$00,$1F,$1D,$E0,$0D,$80  ; $8B3C
    .byte $00,$00,$80,$1C,$1C,$E0,$10,$00,$00,$00,$00,$1C,$1C,$E0,$10,$DC  ; $8B4C
    .byte $04,$00,$00,$1F,$1F,$A0,$10,$00,$00,$00,$00,$1F,$1D,$D0,$0F,$E3  ; $8B5C
    .byte $03,$00,$00,$1E,$0D,$80,$07,$E5,$04,$17,$00,$1F,$1D,$D0,$0F,$FF  ; $8B6C
    .byte $07,$00,$00,$1E,$0D,$E0,$12,$F0,$01,$1F,$00,$1E,$1C,$D0,$10,$00  ; $8B7C
    .byte $00,$00,$00,$1E,$1C,$D0,$10,$FF,$05,$00,$00,$1F,$17,$70,$0F,$9E  ; $8B8C
    .byte $20,$26,$00,$1F,$1C,$B0,$04,$D4,$00,$46,$00,$1E,$1C,$D0,$10,$FF  ; $8B9C
    .byte $02,$00,$00,$1C,$18,$B0,$06,$FF,$03,$00,$00,$1F,$1F,$E0,$1B,$9E  ; $8BAC
    .byte $58,$7C,$00,$1F,$1F,$90,$1A,$AE,$20,$26,$00,$1F,$1C,$C0,$10,$00  ; $8BBC
    .byte $00,$00,$00,$1F,$1C,$C0,$10,$FF,$04,$00,$00,$1F,$1D,$E0,$0D,$FF  ; $8BCC
    .byte $02,$00,$80,$1F,$1D,$B0,$06,$00,$00,$00,$00,$1F,$1D,$B0,$06,$FF  ; $8BDC
    .byte $01,$00,$00,$1F,$1F,$00,$1F,$00,$00,$00,$00,$1F,$1A,$B0,$0F,$00  ; $8BEC
    .byte $00,$00,$00,$1F,$1A,$B0,$0F,$FF,$07,$00,$00,$1F,$1D,$90,$03,$FF  ; $8BFC
    .byte $00,$3D,$00,$1F,$1B,$90,$0F,$FF,$02,$00,$00,$1F,$1F,$70,$1F,$00  ; $8C0C
    .byte $00,$00,$00,$1C,$19,$60,$0F,$FF,$13,$16,$00,$1F,$1F,$F0,$1F,$E9  ; $8C1C
    .byte $00,$38,$00,$19,$1F,$F0,$1F,$95,$02,$1D,$00,$1F,$1C,$90,$0F,$E4  ; $8C2C
    .byte $0E,$1E,$00,$17,$02,$E0,$0F,$00,$00,$00,$00,$1F,$1F,$F0,$0E,$80  ; $8C3C
    .byte $00,$00,$80,$1F,$1F,$F0,$1F,$00,$00,$00,$00,$1F,$1F,$F0,$1F,$FF  ; $8C4C
    .byte $02,$00,$00,$1F,$1F,$F0,$1F,$92,$7F,$00,$00,$1F,$01,$00,$0F,$E3  ; $8C5C
    .byte $7F,$00,$00,$1F,$1F,$F0,$1F,$FF,$4C,$00,$00,$1F,$1F,$F0,$1F,$99  ; $8C6C
    .byte $7F,$00,$00,$1F,$1F,$C0,$14,$FF,$01,$01,$00,$1C,$1D,$B0,$08,$00  ; $8C7C
    .byte $00,$00,$00,$1F,$1A,$A0,$07,$CF,$36,$00,$80,$1F,$1F,$F0,$1F,$A6  ; $8C8C
    .byte $7F,$00,$80,$1C,$13,$10,$1F,$FF,$7F,$00,$00,$1F,$16,$D0,$10,$FF  ; $8C9C
    .byte $01,$14,$00,$1F,$1F,$F0,$1F,$BC,$6F,$00,$00,$1F,$1F,$F0,$1F,$80  ; $8CAC
    .byte $00,$00,$80,$19,$12,$E0,$0F,$00,$00,$00,$00,$1F,$01,$00,$0D,$00  ; $8CBC
    .byte $00,$00,$00,$1F,$1F,$F0,$0F,$BC,$6F,$00,$00,$1F,$17,$00,$16,$80  ; $8CCC
    .byte $00,$00,$00,$1F,$1F,$F0,$0F,$00,$00,$00,$00,$1F,$1F,$F0,$1F,$D3  ; $8CDC
    .byte $16,$00,$00,$1F,$1C,$E0,$04,$E4,$00,$46,$80,$1A,$1F,$E0,$1C,$00  ; $8CEC
    .byte $00,$00,$00,$1F,$1E,$C0,$07,$00,$00,$00,$80,$1F,$01,$F0,$05,$E1  ; $8CFC
    .byte $0D,$00,$00,$1F,$1F,$F0,$1F,$FF,$7F,$00,$00,$1C,$1F,$F0,$07,$FF  ; $8D0C
    .byte $7F,$36,$00,$19,$0B,$F0,$12,$FF,$7F,$36,$00,$1F,$12,$40,$1E,$FF  ; $8D1C
    .byte $7F,$51,$00,$1F,$1F,$F0,$1F,$FF,$19,$00,$00,$1F,$1F,$F0,$0F,$D7  ; $8D2C
    .byte $09,$7F,$00,$1F,$00,$F0,$0F,$FF,$43,$00,$00,$00,$8D,$50,$8E,$7E  ; $8D3C
    .byte $8F,$99,$90,$96,$05,$01,$3B,$06,$E6,$07,$0B,$08,$02,$09,$01,$18  ; $8D4C
    .byte $C0,$04,$00,$80,$03,$8B,$8F,$6B,$86,$66,$01,$8B,$08,$03,$01,$AB  ; $8D5C
    .byte $08,$02,$0B,$FE,$0E,$01,$8D,$5D,$0B,$00,$80,$87,$8B,$67,$82,$62  ; $8D6C
    .byte $01,$87,$08,$03,$01,$87,$08,$02,$8B,$A4,$A9,$AD,$06,$C8,$B0,$04  ; $8D7C
    .byte $08,$06,$E6,$04,$08,$6D,$8F,$8F,$8B,$66,$8B,$8F,$8B,$86,$02,$89  ; $8D8C
    .byte $02,$8D,$01,$90,$08,$03,$01,$90,$08,$02,$8F,$8D,$8B,$6D,$8E,$8E  ; $8D9C
    .byte $8B,$67,$8B,$12,$08,$8D,$C8,$8E,$8D,$8B,$01,$A9,$08,$03,$02,$01  ; $8DAC
    .byte $89,$08,$02,$60,$89,$8B,$8D,$90,$0E,$01,$8D,$8F,$8D,$8E,$90,$01  ; $8DBC
    .byte $B2,$08,$03,$02,$01,$92,$08,$02,$60,$02,$AD,$92,$04,$48,$18,$00  ; $8DCC
    .byte $06,$F5,$B2,$08,$03,$01,$B2,$08,$02,$90,$8F,$90,$92,$02,$92,$02  ; $8DDC
    .byte $90,$01,$AB,$08,$03,$AB,$01,$6B,$08,$02,$60,$02,$92,$02,$90,$01  ; $8DEC
    .byte $8B,$08,$03,$12,$48,$8E,$15,$01,$AB,$08,$02,$B0,$90,$8F,$8D,$02  ; $8DFC
    .byte $8F,$60,$8B,$8F,$90,$0E,$01,$8D,$D8,$08,$03,$01,$8B,$08,$02,$8D  ; $8E0C
    .byte $8E,$90,$01,$D2,$08,$03,$02,$B2,$01,$72,$08,$02,$60,$18,$C0,$06  ; $8E1C
    .byte $E6,$01,$B4,$01,$74,$96,$77,$02,$96,$01,$92,$08,$03,$92,$01,$52  ; $8E2C
    .byte $40,$08,$02,$01,$B6,$08,$03,$01,$96,$08,$02,$09,$02,$8D,$8D,$8B  ; $8E3C
    .byte $88,$8A,$8B,$4B,$40,$01,$8B,$08,$03,$02,$01,$8B,$08,$02,$80,$8B  ; $8E4C
    .byte $8A,$8B,$01,$AD,$08,$03,$01,$AD,$06,$FF,$08,$02,$52,$50,$4F,$4D  ; $8E5C
    .byte $4B,$4A,$48,$46,$09,$01,$50,$4F,$4D,$4B,$4A,$48,$46,$44,$16,$8D  ; $8E6C
    .byte $8B,$17,$06,$E6,$07,$0A,$08,$02,$09,$02,$18,$C0,$04,$00,$80,$92  ; $8E7C
    .byte $97,$72,$8F,$6F,$01,$92,$08,$03,$01,$B2,$08,$02,$0B,$FE,$0E,$01  ; $8E8C
    .byte $8E,$88,$0B,$00,$80,$8E,$93,$6E,$8B,$6B,$01,$8E,$08,$03,$01,$8E  ; $8E9C
    .byte $08,$02,$93,$A9,$B0,$B0,$B5,$04,$08,$04,$08,$06,$E6,$08,$06,$04  ; $8EAC
    .byte $08,$6F,$66,$6B,$6F,$66,$6B,$6F,$66,$0E,$01,$8E,$BB,$04,$08,$04  ; $8EBC
    .byte $08,$04,$08,$6D,$64,$69,$6D,$64,$69,$6D,$69,$14,$08,$8E,$EF,$0E  ; $8ECC
    .byte $01,$8E,$CD,$0B,$FE,$0F,$01,$8E,$CB,$0B,$00,$15,$08,$8E,$FA,$10  ; $8EDC
    .byte $01,$8E,$C9,$08,$02,$03,$90,$92,$95,$99,$11,$01,$8E,$B5,$6D,$66  ; $8EEC
    .byte $6A,$6D,$66,$6A,$6D,$66,$08,$02,$02,$03,$B6,$99,$06,$C8,$08,$05  ; $8EFC
    .byte $04,$00,$69,$6D,$72,$01,$B5,$01,$75,$94,$92,$90,$8F,$68,$6B,$70  ; $8F0C
    .byte $02,$94,$92,$90,$8F,$8D,$8B,$67,$6B,$70,$02,$93,$92,$90,$12,$00  ; $8F1C
    .byte $8F,$40,$8E,$8D,$8B,$6B,$66,$6B,$8F,$6B,$6F,$02,$92,$92,$8F,$8B  ; $8F2C
    .byte $0E,$01,$8F,$0C,$92,$90,$8D,$6A,$66,$6A,$8D,$6A,$6D,$92,$6D,$72  ; $8F3C
    .byte $01,$B6,$01,$76,$06,$E6,$08,$02,$01,$B0,$01,$70,$92,$74,$02,$92  ; $8F4C
    .byte $8D,$6A,$72,$76,$02,$99,$02,$96,$96,$02,$97,$01,$AF,$01,$6F,$90  ; $8F5C
    .byte $70,$90,$70,$74,$77,$9C,$9C,$9B,$9C,$01,$B6,$08,$03,$01,$B6,$06  ; $8F6C
    .byte $FF,$08,$02,$0C,$01,$03,$52,$50,$4F,$4D,$4B,$4A,$48,$46,$44,$43  ; $8F7C
    .byte $41,$03,$57,$56,$54,$52,$50,$0C,$00,$16,$8E,$B3,$17,$06,$DC,$08  ; $8F8C
    .byte $28,$09,$03,$01,$CB,$08,$01,$01,$AB,$80,$08,$28,$8B,$01,$C9,$08  ; $8F9C
    .byte $01,$01,$A9,$08,$28,$80,$89,$01,$C7,$08,$01,$01,$A7,$08,$28,$80  ; $8FAC
    .byte $87,$A9,$A9,$89,$89,$89,$89,$04,$00,$04,$00,$04,$00,$8B,$60,$6B  ; $8FBC
    .byte $60,$66,$69,$66,$0E,$01,$8F,$C7,$04,$00,$04,$00,$89,$60,$69,$60  ; $8FCC
    .byte $64,$66,$64,$0E,$01,$8F,$D6,$0B,$FE,$0F,$01,$8F,$D4,$0B,$00,$14  ; $8FDC
    .byte $00,$90,$02,$89,$60,$69,$60,$64,$66,$64,$60,$69,$60,$69,$60,$69  ; $8FEC
    .byte $60,$69,$10,$01,$8F,$C5,$04,$00,$86,$60,$66,$60,$6A,$6D,$6A,$0E  ; $8FFC
    .byte $01,$90,$02,$04,$00,$89,$60,$01,$A9,$01,$69,$89,$60,$01,$A9,$01  ; $900C
    .byte $69,$88,$60,$01,$A8,$01,$68,$88,$60,$01,$A8,$01,$68,$87,$60,$01  ; $901C
    .byte $A7,$01,$67,$87,$60,$01,$A7,$01,$67,$12,$00,$90,$47,$8B,$60,$01  ; $902C
    .byte $AB,$01,$6B,$8B,$86,$8B,$8F,$0E,$01,$90,$0F,$86,$60,$86,$60,$86  ; $903C
    .byte $60,$66,$60,$66,$08,$15,$54,$54,$54,$4C,$4C,$4C,$45,$45,$08,$28  ; $904C
    .byte $64,$64,$80,$64,$64,$60,$64,$66,$66,$60,$66,$60,$66,$86,$67,$67  ; $905C
    .byte $80,$67,$67,$60,$67,$68,$68,$60,$68,$60,$68,$88,$84,$80,$64,$64  ; $906C
    .byte $80,$64,$64,$60,$64,$60,$64,$84,$86,$80,$66,$66,$80,$04,$00,$52  ; $907C
    .byte $40,$66,$0E,$03,$90,$89,$16,$8F,$C3,$17,$06,$5A,$07,$0D,$08,$00  ; $908C
    .byte $04,$00,$CD,$80,$A0,$8D,$0E,$02,$90,$9C,$06,$B4,$AD,$AD,$06,$A0  ; $909C
    .byte $8D,$8D,$06,$5A,$07,$0B,$04,$00,$4A,$0E,$07,$90,$B2,$04,$00,$04  ; $90AC
    .byte $00,$04,$00,$06,$5A,$07,$0B,$85,$6A,$85,$65,$8A,$0E,$06,$90,$BD  ; $90BC
    .byte $07,$0D,$06,$A0,$13,$00,$90,$DC,$8D,$8D,$8D,$8D,$0F,$01,$90,$BB  ; $90CC
    .byte $04,$00,$07,$0D,$8D,$07,$0B,$65,$0E,$01,$90,$DC,$06,$5A,$4A,$4A  ; $90DC
    .byte $4A,$4A,$04,$00,$04,$00,$04,$00,$02,$85,$85,$65,$8A,$0E,$02,$90  ; $90EC
    .byte $F2,$13,$00,$91,$0F,$02,$85,$85,$65,$6A,$6A,$14,$00,$91,$22,$0F  ; $90FC
    .byte $01,$90,$F0,$85,$07,$0D,$06,$A0,$8D,$8D,$07,$0B,$06,$5A,$4A,$4A  ; $910C
    .byte $4A,$4A,$10,$01,$90,$EE,$02,$85,$85,$65,$8A,$02,$85,$85,$65,$8A  ; $911C
    .byte $07,$0D,$06,$A0,$8D,$65,$8D,$65,$8D,$07,$0B,$06,$5A,$85,$85,$85  ; $912C
    .byte $80,$04,$00,$85,$8A,$65,$65,$8A,$12,$00,$91,$52,$65,$65,$6A,$85  ; $913C
    .byte $65,$8A,$0E,$03,$91,$3D,$07,$0D,$06,$A0,$8D,$8D,$06,$5A,$07,$0B  ; $914C
    .byte $04,$00,$4A,$0E,$07,$91,$5C,$16,$90,$B9,$17,$00,$91,$70,$92,$81  ; $915C
    .byte $93,$94,$94,$5E,$05,$02,$16,$07,$0B,$08,$0F,$04,$08,$06,$E1,$18  ; $916C
    .byte $C0,$09,$01,$04,$08,$88,$A0,$8B,$A0,$01,$6F,$08,$13,$02,$01,$8F  ; $917C
    .byte $08,$0F,$80,$0D,$64,$01,$92,$08,$13,$01,$B2,$0D,$00,$08,$0F,$B1  ; $918C
    .byte $AF,$91,$06,$C8,$B2,$06,$E1,$01,$72,$08,$13,$02,$01,$92,$08,$0F  ; $919C
    .byte $AD,$12,$08,$91,$BB,$01,$8A,$01,$CA,$A8,$A6,$0E,$01,$91,$7F,$01  ; $91AC
    .byte $96,$08,$10,$01,$D6,$08,$0F,$B4,$B2,$06,$F0,$18,$00,$04,$48,$94  ; $91BC
    .byte $08,$13,$01,$D4,$08,$0F,$B7,$94,$06,$DC,$B6,$12,$08,$91,$EE,$B2  ; $91CC
    .byte $B2,$AF,$92,$B4,$06,$F0,$B4,$92,$91,$8F,$D1,$06,$DC,$CD,$0E,$01  ; $91DC
    .byte $91,$C9,$09,$02,$AD,$AA,$06,$C8,$A6,$86,$A8,$01,$A8,$08,$10,$88  ; $91EC
    .byte $01,$C8,$08,$0F,$18,$C0,$06,$E1,$A1,$A3,$A1,$C6,$84,$A3,$02,$A4  ; $91FC
    .byte $A3,$A1,$03,$B7,$99,$BB,$06,$C8,$01,$BB,$08,$10,$9B,$01,$DB,$08  ; $920C
    .byte $0F,$06,$E1,$B7,$BB,$BC,$DE,$9C,$BB,$06,$C8,$02,$BC,$06,$E1,$BC  ; $921C
    .byte $BE,$03,$A8,$88,$06,$C8,$AA,$01,$CA,$08,$10,$8A,$01,$CA,$08,$0F  ; $922C
    .byte $06,$E1,$AB,$AA,$04,$08,$8B,$8A,$8B,$01,$6D,$08,$13,$02,$01,$8D  ; $923C
    .byte $08,$0F,$8B,$12,$08,$92,$58,$AA,$0E,$01,$92,$40,$8A,$8D,$AF,$AD  ; $924C
    .byte $AB,$AA,$02,$A8,$06,$C8,$A6,$86,$83,$86,$04,$48,$88,$08,$13,$01  ; $925C
    .byte $C8,$08,$0F,$A6,$88,$0E,$01,$92,$66,$01,$E8,$08,$10,$01,$E8,$08  ; $926C
    .byte $0F,$16,$91,$77,$17,$07,$0A,$04,$00,$08,$0F,$06,$E1,$18,$C0,$09  ; $927C
    .byte $02,$04,$00,$C0,$80,$88,$8B,$8F,$D4,$B2,$B4,$94,$B6,$B6,$B2,$8D  ; $928C
    .byte $8A,$8B,$8D,$8A,$8F,$8D,$8B,$8A,$0E,$01,$92,$8D,$06,$FF,$08,$12  ; $929C
    .byte $18,$40,$07,$0B,$04,$00,$90,$94,$97,$94,$9B,$97,$94,$97,$8F,$92  ; $92AC
    .byte $96,$92,$99,$96,$92,$96,$8D,$91,$94,$91,$99,$94,$91,$94,$12,$00  ; $92BC
    .byte $92,$DA,$8D,$91,$94,$91,$99,$94,$91,$8D,$0E,$01,$92,$B0,$91,$8D  ; $92CC
    .byte $06,$FA,$07,$0A,$08,$0F,$18,$C0,$A8,$61,$63,$65,$66,$68,$6A,$6B  ; $92DC
    .byte $6D,$06,$E1,$04,$00,$8B,$86,$8B,$8F,$92,$8F,$8B,$86,$89,$84,$89  ; $92EC
    .byte $8D,$90,$8D,$89,$84,$12,$00,$93,$28,$88,$83,$88,$8B,$8F,$94,$96  ; $92FC
    .byte $97,$07,$0B,$08,$05,$06,$B4,$18,$C0,$03,$8D,$AF,$01,$8F,$08,$14  ; $930C
    .byte $01,$CF,$07,$0A,$06,$E1,$08,$0F,$0E,$01,$92,$EF,$8A,$87,$8A,$8F  ; $931C
    .byte $93,$8F,$8A,$87,$8A,$8B,$8D,$8F,$06,$FA,$71,$73,$74,$76,$77,$79  ; $932C
    .byte $7B,$7C,$06,$E1,$02,$B4,$74,$76,$97,$96,$94,$8F,$02,$B2,$72,$74  ; $933C
    .byte $96,$94,$92,$8D,$02,$B0,$70,$72,$94,$92,$90,$94,$92,$8F,$92,$B6  ; $934C
    .byte $96,$92,$96,$97,$94,$90,$94,$97,$70,$72,$74,$72,$90,$96,$92,$8D  ; $935C
    .byte $92,$96,$6D,$6F,$70,$6F,$8D,$94,$8F,$8B,$8F,$94,$8F,$8B,$8F,$06  ; $936C
    .byte $FA,$74,$68,$6A,$6B,$6D,$6F,$71,$73,$74,$76,$77,$79,$07,$09,$7B  ; $937C
    .byte $7D,$7F,$03,$68,$16,$92,$83,$17,$04,$00,$06,$B4,$08,$28,$09,$03  ; $938C
    .byte $04,$00,$04,$00,$88,$0E,$0F,$93,$9E,$04,$00,$86,$0E,$0F,$93,$A5  ; $939C
    .byte $0F,$01,$93,$9C,$04,$00,$84,$84,$84,$A4,$8B,$90,$84,$83,$83,$83  ; $93AC
    .byte $A3,$8A,$8F,$8A,$81,$81,$81,$A1,$88,$8D,$88,$81,$81,$81,$81,$08  ; $93BC
    .byte $15,$12,$00,$93,$E1,$06,$F0,$76,$96,$60,$6A,$8A,$60,$06,$B4,$08  ; $93CC
    .byte $28,$0E,$01,$93,$B0,$06,$DC,$60,$76,$96,$71,$71,$6A,$6A,$06,$B4  ; $93DC
    .byte $08,$28,$04,$00,$04,$00,$8B,$0E,$07,$93,$F0,$04,$00,$89,$0E,$07  ; $93EC
    .byte $93,$F7,$13,$00,$94,$10,$04,$00,$88,$0E,$0C,$94,$02,$89,$8B,$88  ; $93FC
    .byte $0F,$01,$93,$EE,$04,$00,$83,$0E,$0C,$94,$10,$85,$87,$83,$04,$00  ; $940C
    .byte $88,$0E,$07,$94,$1A,$04,$00,$86,$0E,$07,$94,$21,$04,$00,$84,$0E  ; $941C
    .byte $07,$94,$28,$04,$00,$83,$0E,$07,$94,$2F,$04,$00,$84,$0E,$07,$94  ; $942C
    .byte $36,$04,$00,$86,$0E,$07,$94,$3D,$04,$00,$88,$0E,$08,$94,$44,$8A  ; $943C
    .byte $8B,$8A,$06,$DC,$08,$15,$76,$76,$76,$76,$71,$71,$6A,$6A,$16,$93  ; $944C
    .byte $94,$17,$04,$00,$06,$5A,$07,$0B,$08,$11,$04,$00,$04,$00,$A5,$8A  ; $945C
    .byte $A5,$85,$12,$00,$94,$77,$AA,$0E,$03,$94,$68,$8A,$8A,$0F,$01,$94  ; $946C
    .byte $66,$04,$00,$85,$8F,$8F,$85,$06,$0F,$08,$00,$00,$6F,$6F,$6F,$06  ; $947C
    .byte $5A,$08,$11,$00,$8F,$8A,$8F,$04,$00,$85,$8F,$8F,$85,$12,$00,$94  ; $948C
    .byte $A5,$8F,$8F,$8A,$8F,$0E,$02,$94,$93,$13,$00,$94,$B1,$85,$85,$85  ; $949C
    .byte $85,$0F,$01,$94,$7D,$A5,$A5,$04,$00,$04,$00,$A5,$AA,$85,$85,$AA  ; $94AC
    .byte $85,$85,$8A,$A5,$85,$12,$00,$94,$CA,$AA,$0E,$01,$94,$B5,$8A,$06  ; $94BC
    .byte $F0,$07,$0C,$8D,$06,$5A,$07,$0B,$0F,$01,$94,$B3,$04,$00,$85,$85  ; $94CC
    .byte $8A,$85,$0E,$0E,$94,$D8,$A5,$A5,$16,$94,$5E,$17,$00,$94,$F1,$96  ; $94DC
    .byte $37,$97,$5E,$98,$0C,$05,$02,$16,$07,$0B,$09,$03,$C0,$04,$00,$08  ; $94EC
    .byte $0F,$06,$C8,$18,$40,$84,$A7,$04,$00,$04,$00,$06,$AA,$A9,$89,$06  ; $94FC
    .byte $C8,$A9,$87,$A9,$00,$4B,$01,$4C,$8C,$08,$10,$00,$01,$8C,$08,$0F  ; $950C
    .byte $12,$00,$95,$30,$89,$87,$89,$80,$89,$8C,$13,$00,$95,$3C,$0B,$05  ; $951C
    .byte $0E,$01,$95,$05,$0B,$00,$90,$8E,$90,$80,$84,$87,$0F,$01,$95,$03  ; $952C
    .byte $AE,$8C,$8E,$8C,$AE,$8F,$B0,$8B,$87,$01,$89,$08,$10,$01,$A9,$08  ; $953C
    .byte $0F,$80,$06,$DC,$04,$00,$02,$89,$60,$69,$60,$A9,$87,$A9,$02,$01  ; $954C
    .byte $8C,$01,$4C,$40,$8C,$8B,$8C,$8B,$89,$87,$84,$06,$FA,$12,$00,$95  ; $955C
    .byte $88,$02,$A7,$02,$AB,$08,$05,$06,$B4,$18,$C0,$02,$B3,$02,$B7,$9A  ; $956C
    .byte $98,$97,$06,$DC,$08,$0F,$18,$40,$0E,$01,$95,$50,$02,$A2,$02,$A7  ; $957C
    .byte $08,$05,$06,$B4,$18,$C0,$02,$AE,$02,$B3,$BA,$BF,$06,$F0,$08,$0F  ; $958C
    .byte $18,$40,$02,$A5,$02,$A9,$AC,$8B,$8C,$8B,$02,$87,$60,$87,$AB,$02  ; $959C
    .byte $AC,$02,$AE,$B0,$8E,$90,$8E,$02,$89,$60,$89,$8C,$06,$B4,$AB,$8B  ; $95AC
    .byte $8B,$06,$DC,$8C,$8B,$89,$87,$01,$A4,$08,$10,$A4,$01,$64,$60,$08  ; $95BC
    .byte $0F,$8B,$AC,$06,$BE,$AE,$8E,$06,$DC,$90,$91,$90,$8E,$8C,$01,$B0  ; $95CC
    .byte $08,$10,$B0,$01,$70,$60,$04,$00,$08,$0F,$90,$06,$BE,$B3,$B5,$06  ; $95DC
    .byte $DC,$95,$93,$90,$93,$90,$8E,$12,$00,$96,$1A,$01,$B0,$08,$10,$02  ; $95EC
    .byte $01,$B0,$08,$0F,$80,$90,$93,$06,$BE,$B5,$06,$DC,$95,$93,$95,$97  ; $95FC
    .byte $98,$97,$01,$B5,$08,$10,$B5,$01,$75,$60,$0E,$01,$95,$E2,$B0,$8E  ; $960C
    .byte $8C,$89,$80,$8B,$8C,$06,$BE,$AB,$06,$DC,$8B,$AE,$8B,$89,$87,$01  ; $961C
    .byte $A9,$08,$10,$A9,$01,$69,$60,$16,$94,$F9,$17,$06,$C8,$07,$0A,$09  ; $962C
    .byte $02,$C0,$04,$00,$08,$0F,$18,$40,$8B,$AE,$04,$00,$04,$00,$06,$AA  ; $963C
    .byte $B0,$90,$06,$C8,$B0,$8E,$B0,$01,$95,$08,$10,$01,$95,$08,$0F,$12  ; $964C
    .byte $00,$96,$6F,$90,$8E,$90,$80,$90,$95,$13,$00,$96,$7B,$0B,$05,$0E  ; $965C
    .byte $01,$96,$48,$0B,$00,$97,$95,$97,$80,$8B,$8E,$0F,$01,$96,$46,$B5  ; $966C
    .byte $95,$95,$95,$B5,$96,$B7,$93,$8E,$01,$90,$08,$10,$01,$B0,$08,$0F  ; $967C
    .byte $A0,$04,$00,$18,$80,$07,$08,$06,$A0,$08,$0E,$04,$00,$80,$9C,$03  ; $968C
    .byte $89,$84,$8C,$8B,$89,$84,$0E,$01,$96,$97,$04,$00,$80,$9A,$9F,$9A  ; $969C
    .byte $03,$8B,$89,$87,$82,$0E,$01,$96,$A6,$0F,$01,$96,$8D,$06,$F0,$07  ; $96AC
    .byte $08,$08,$08,$18,$80,$03,$89,$8C,$91,$AC,$93,$91,$8C,$8B,$8E,$93  ; $96BC
    .byte $AE,$95,$93,$8E,$8C,$90,$93,$B0,$93,$90,$8C,$8E,$91,$95,$B1,$98  ; $96CC
    .byte $91,$06,$F0,$08,$0F,$0C,$03,$18,$40,$07,$07,$B7,$97,$97,$98,$97  ; $96DC
    .byte $95,$93,$01,$B0,$08,$10,$B0,$01,$70,$60,$08,$0F,$97,$B8,$06,$BE  ; $96EC
    .byte $BA,$9A,$06,$DC,$9C,$9D,$9C,$9A,$98,$0C,$00,$07,$0A,$01,$B4,$08  ; $96FC
    .byte $10,$B4,$01,$74,$60,$04,$00,$08,$0F,$93,$06,$BE,$B7,$B8,$06,$DC  ; $970C
    .byte $98,$97,$93,$97,$93,$91,$12,$00,$97,$41,$B0,$91,$93,$02,$90,$60  ; $971C
    .byte $93,$97,$06,$BE,$B8,$06,$DC,$98,$97,$98,$9A,$9C,$9A,$B8,$97,$93  ; $972C
    .byte $95,$0E,$01,$97,$11,$B3,$91,$90,$8C,$80,$8E,$90,$06,$BE,$AE,$06  ; $973C
    .byte $DC,$8E,$B1,$8E,$8C,$8B,$01,$AC,$08,$10,$AC,$01,$6C,$60,$16,$96  ; $974C
    .byte $3E,$17,$06,$D2,$08,$28,$09,$03,$C0,$04,$00,$84,$84,$80,$89,$04  ; $975C
    .byte $00,$80,$89,$A9,$84,$87,$84,$89,$80,$89,$A9,$89,$8C,$89,$8E,$80  ; $976C
    .byte $8E,$AE,$89,$8E,$89,$90,$80,$90,$12,$00,$97,$91,$B0,$90,$8B,$87  ; $977C
    .byte $89,$0E,$01,$97,$6B,$90,$A9,$80,$84,$04,$00,$A9,$89,$8C,$89,$8E  ; $978C
    .byte $8C,$87,$A9,$89,$8C,$89,$8E,$8C,$89,$A7,$87,$8B,$87,$8E,$8B,$89  ; $979C
    .byte $A7,$87,$8B,$87,$8E,$8B,$12,$00,$97,$BB,$87,$0E,$01,$97,$95,$89  ; $97AC
    .byte $87,$A5,$80,$A5,$89,$8C,$85,$A7,$80,$A7,$8B,$8E,$8B,$AC,$80,$AC  ; $97BC
    .byte $8E,$90,$8C,$AE,$80,$AE,$90,$91,$B0,$84,$A4,$84,$87,$8B,$B0,$84  ; $97CC
    .byte $A4,$84,$88,$8B,$AE,$82,$A2,$82,$84,$85,$A4,$84,$85,$84,$88,$84  ; $97DC
    .byte $8B,$84,$04,$00,$02,$89,$69,$80,$89,$80,$89,$80,$84,$0E,$05,$97  ; $97EC
    .byte $EE,$02,$84,$64,$80,$84,$84,$87,$8B,$89,$A9,$A0,$16,$97,$65,$17  ; $97FC
    .byte $06,$96,$07,$0A,$08,$00,$A5,$65,$6D,$6D,$6D,$6A,$6A,$6A,$6A,$66  ; $980C
    .byte $66,$66,$66,$04,$00,$04,$00,$07,$0A,$85,$07,$09,$8F,$07,$0A,$8A  ; $981C
    .byte $07,$09,$8F,$07,$0A,$85,$85,$8A,$12,$00,$98,$3D,$85,$0E,$07,$98  ; $982C
    .byte $21,$06,$FA,$07,$0B,$8D,$06,$96,$04,$00,$04,$00,$07,$0A,$85,$07  ; $983C
    .byte $09,$8F,$07,$0A,$8A,$07,$09,$8F,$07,$0A,$12,$00,$98,$62,$85,$85  ; $984C
    .byte $8A,$85,$0E,$03,$98,$46,$13,$00,$98,$6F,$85,$85,$6D,$6A,$86,$0F  ; $985C
    .byte $01,$98,$44,$65,$6D,$6A,$66,$85,$85,$04,$00,$07,$0A,$85,$07,$09  ; $986C
    .byte $8F,$07,$0A,$8A,$85,$07,$09,$8F,$07,$0A,$85,$12,$00,$98,$93,$8A  ; $987C
    .byte $07,$09,$8F,$0E,$05,$98,$75,$6A,$6A,$8A,$04,$00,$07,$0A,$85,$07  ; $988C
    .byte $09,$8F,$07,$0A,$8A,$85,$07,$09,$8F,$07,$0A,$85,$12,$00,$98,$B4  ; $989C
    .byte $8A,$07,$09,$8F,$0E,$01,$98,$96,$6A,$6A,$8A,$07,$0A,$04,$00,$02  ; $98AC
    .byte $85,$65,$8A,$A5,$85,$8A,$85,$12,$00,$98,$D2,$02,$85,$65,$8A,$A5  ; $98BC
    .byte $85,$AA,$0E,$03,$98,$B9,$6D,$6A,$86,$6D,$6A,$86,$65,$6A,$6A,$6A  ; $98CC
    .byte $6A,$6A,$6A,$6A,$16,$98,$1F,$17,$00,$98,$ED,$9A,$32,$9B,$78,$9C  ; $98DC
    .byte $B2,$05,$01,$8C,$06,$E6,$07,$05,$08,$07,$09,$02,$18,$80,$0C,$03  ; $98EC
    .byte $89,$8D,$90,$B5,$0C,$00,$18,$40,$06,$E1,$07,$0B,$90,$93,$95,$37  ; $98FC
    .byte $01,$39,$02,$79,$01,$B9,$B7,$95,$93,$90,$02,$AE,$01,$8C,$02,$01  ; $990C
    .byte $6C,$40,$8C,$8E,$90,$01,$AE,$05,$01,$74,$01,$AE,$05,$01,$69,$B3  ; $991C
    .byte $05,$01,$4C,$B7,$05,$01,$C7,$06,$DC,$01,$D9,$07,$09,$08,$0B,$01  ; $992C
    .byte $D9,$07,$0B,$08,$07,$02,$BC,$BA,$99,$97,$95,$01,$D3,$07,$09,$08  ; $993C
    .byte $0B,$01,$D3,$07,$0B,$08,$07,$CE,$07,$09,$B0,$AE,$04,$00,$07,$0B  ; $994C
    .byte $04,$00,$C0,$80,$90,$93,$95,$37,$01,$39,$02,$79,$01,$B9,$B7,$95  ; $995C
    .byte $93,$90,$8E,$8D,$8E,$8D,$8E,$8F,$80,$12,$00,$99,$89,$B0,$8D,$89  ; $996C
    .byte $01,$A4,$08,$0D,$02,$01,$A4,$08,$07,$0E,$01,$99,$5C,$02,$01,$B0  ; $997C
    .byte $08,$0D,$02,$01,$D0,$08,$07,$04,$00,$A0,$60,$75,$70,$75,$97,$99  ; $998C
    .byte $97,$95,$A0,$60,$73,$6E,$73,$95,$97,$95,$93,$12,$00,$99,$BF,$A0  ; $999C
    .byte $60,$75,$70,$75,$97,$99,$97,$95,$BC,$BA,$B9,$57,$59,$77,$95,$0E  ; $99AC
    .byte $01,$99,$93,$01,$91,$08,$0D,$01,$B1,$08,$07,$71,$73,$B5,$53,$55  ; $99BC
    .byte $73,$91,$B3,$B5,$B7,$98,$9A,$18,$00,$04,$00,$9C,$5A,$5C,$7A,$98  ; $99CC
    .byte $97,$98,$9A,$06,$BE,$BC,$06,$DC,$9C,$5C,$40,$7D,$7F,$7D,$7C,$7A  ; $99DC
    .byte $98,$9A,$06,$BE,$BC,$06,$DC,$9C,$5A,$5C,$7A,$98,$97,$98,$9A,$9C  ; $99EC
    .byte $97,$06,$F0,$01,$95,$08,$0B,$02,$01,$B5,$06,$DC,$08,$07,$D3,$0E  ; $99FC
    .byte $01,$99,$D5,$01,$D5,$01,$75,$60,$95,$99,$9C,$01,$03,$A9,$08,$0D  ; $9A0C
    .byte $C9,$01,$89,$07,$06,$29,$28,$26,$24,$22,$21,$03,$37,$35,$08,$07  ; $9A1C
    .byte $18,$40,$16,$99,$58,$17,$06,$E6,$07,$0A,$08,$07,$09,$02,$18,$80  ; $9A2C
    .byte $89,$8D,$90,$01,$B5,$08,$0B,$02,$01,$B5,$08,$07,$87,$8B,$8E,$01  ; $9A3C
    .byte $B3,$08,$0B,$02,$01,$B3,$08,$07,$85,$89,$8C,$01,$B1,$08,$0B,$02  ; $9A4C
    .byte $01,$B1,$08,$07,$87,$8B,$8E,$02,$B3,$AE,$04,$00,$04,$00,$18,$40  ; $9A5C
    .byte $07,$0B,$06,$B4,$69,$64,$67,$69,$6D,$69,$67,$69,$06,$F0,$08,$06  ; $9A6C
    .byte $03,$69,$69,$75,$70,$73,$75,$06,$B4,$08,$07,$03,$67,$64,$0E,$01  ; $9A7C
    .byte $9A,$68,$0B,$FE,$0F,$01,$9A,$66,$0B,$00,$04,$00,$08,$0A,$07,$0D  ; $9A8C
    .byte $06,$D2,$04,$00,$04,$00,$69,$64,$67,$69,$60,$69,$60,$69,$60,$69  ; $9A9C
    .byte $60,$69,$69,$64,$67,$69,$0E,$01,$9A,$A0,$67,$62,$64,$67,$60,$67  ; $9AAC
    .byte $60,$67,$60,$67,$60,$67,$67,$62,$64,$67,$13,$00,$9A,$D8,$69,$64  ; $9ABC
    .byte $67,$69,$60,$69,$60,$69,$AB,$AB,$0F,$01,$9A,$9E,$68,$62,$64,$68  ; $9ACC
    .byte $60,$68,$60,$68,$07,$0A,$06,$F0,$08,$08,$18,$80,$88,$8B,$8E,$90  ; $9ADC
    .byte $04,$40,$73,$02,$B3,$08,$09,$02,$01,$B3,$08,$08,$71,$70,$6E,$02  ; $9AEC
    .byte $B0,$6E,$6D,$02,$AB,$6D,$6E,$12,$00,$9B,$1C,$01,$B3,$08,$09,$02  ; $9AFC
    .byte $01,$B3,$08,$08,$91,$90,$8E,$AD,$AB,$A9,$8B,$8D,$0E,$01,$9A,$EC  ; $9B0C
    .byte $02,$AC,$6C,$6B,$A9,$8B,$8C,$AB,$AC,$AE,$90,$91,$18,$00,$08,$07  ; $9B1C
    .byte $06,$DC,$04,$00,$98,$57,$58,$77,$95,$93,$95,$97,$06,$BE,$B8,$06  ; $9B2C
    .byte $DC,$98,$58,$40,$7A,$7C,$7A,$78,$77,$95,$97,$06,$BE,$B8,$06,$DC  ; $9B3C
    .byte $98,$57,$58,$77,$95,$93,$95,$97,$98,$93,$06,$F0,$D1,$06,$DC,$CE  ; $9B4C
    .byte $0E,$01,$9B,$2E,$04,$00,$18,$40,$07,$09,$06,$B4,$69,$64,$67,$69  ; $9B5C
    .byte $6D,$69,$67,$69,$0E,$03,$9B,$60,$16,$9A,$96,$17,$06,$F0,$08,$28  ; $9B6C
    .byte $09,$02,$01,$D5,$08,$01,$01,$D5,$08,$28,$01,$D3,$08,$01,$01,$D3  ; $9B7C
    .byte $08,$28,$01,$D1,$08,$01,$01,$D1,$08,$28,$CE,$AB,$A7,$04,$00,$09  ; $9B8C
    .byte $03,$06,$B4,$89,$60,$69,$6D,$6E,$60,$6D,$60,$69,$60,$69,$8D,$8E  ; $9B9C
    .byte $0E,$01,$9B,$99,$87,$60,$67,$6B,$6C,$60,$6B,$60,$67,$60,$67,$8B  ; $9BAC
    .byte $8C,$87,$60,$67,$6B,$6C,$60,$6B,$04,$00,$08,$15,$60,$74,$94,$6F  ; $9BBC
    .byte $6F,$68,$68,$08,$28,$04,$00,$04,$00,$89,$60,$69,$6D,$6E,$60,$6D  ; $9BCC
    .byte $60,$69,$60,$69,$8D,$8E,$0E,$01,$9B,$D3,$87,$60,$67,$6B,$6C,$60  ; $9BDC
    .byte $6B,$60,$67,$60,$67,$8B,$8C,$13,$00,$9C,$04,$89,$60,$69,$6D,$69  ; $9BEC
    .byte $60,$69,$A4,$A4,$0F,$01,$9B,$D1,$84,$60,$64,$6B,$64,$60,$64,$60  ; $9BFC
    .byte $64,$64,$60,$88,$8B,$04,$00,$69,$69,$60,$69,$89,$80,$69,$75,$60  ; $9C0C
    .byte $70,$60,$6D,$60,$69,$67,$67,$60,$67,$87,$80,$67,$73,$60,$6E,$60  ; $9C1C
    .byte $6B,$60,$67,$12,$00,$9C,$50,$69,$69,$60,$69,$89,$80,$69,$75,$60  ; $9C2C
    .byte $70,$60,$6D,$60,$69,$67,$67,$60,$67,$87,$80,$60,$67,$87,$8B,$8E  ; $9C3C
    .byte $0E,$01,$9C,$11,$65,$65,$60,$65,$85,$80,$65,$71,$60,$6C,$60,$69  ; $9C4C
    .byte $60,$65,$04,$00,$87,$53,$02,$60,$0E,$03,$9C,$5E,$04,$00,$04,$00  ; $9C5C
    .byte $89,$60,$69,$70,$69,$60,$69,$60,$69,$69,$02,$80,$84,$0E,$01,$9C  ; $9C6C
    .byte $6A,$87,$60,$67,$6E,$67,$60,$67,$60,$67,$67,$02,$80,$82,$85,$60  ; $9C7C
    .byte $65,$6C,$65,$60,$65,$60,$67,$87,$8B,$8E,$0F,$01,$9C,$68,$89,$60  ; $9C8C
    .byte $69,$69,$60,$69,$69,$60,$69,$69,$60,$84,$84,$89,$60,$69,$69,$60  ; $9C9C
    .byte $69,$69,$16,$9B,$C4,$17,$06,$64,$08,$00,$E0,$E0,$E0,$E0,$04,$00  ; $9CAC
    .byte $07,$0B,$02,$85,$65,$8A,$65,$85,$65,$85,$8A,$07,$0A,$6F,$6F,$07  ; $9CBC
    .byte $0B,$02,$85,$65,$8A,$65,$12,$00,$9C,$E0,$85,$65,$85,$8A,$6A,$6A  ; $9CCC
    .byte $0E,$01,$9C,$BA,$65,$A5,$A5,$04,$00,$04,$00,$04,$00,$07,$0B,$02  ; $9CDC
    .byte $85,$65,$8A,$65,$85,$65,$85,$8A,$07,$0A,$6F,$6F,$07,$0B,$02,$85  ; $9CEC
    .byte $65,$8A,$65,$12,$00,$9D,$0D,$85,$65,$85,$8A,$6A,$6A,$0E,$01,$9C  ; $9CFC
    .byte $E7,$65,$13,$00,$9D,$1A,$07,$0D,$AD,$AD,$0F,$01,$9C,$E5,$6A,$6A  ; $9D0C
    .byte $6A,$6A,$6A,$6A,$6A,$6A,$04,$00,$04,$00,$07,$0D,$06,$F0,$8F,$06  ; $9D1C
    .byte $78,$07,$0A,$6F,$07,$0B,$65,$8A,$07,$0A,$6F,$6F,$6F,$07,$0B,$65  ; $9D2C
    .byte $85,$8A,$07,$0A,$6F,$6F,$0E,$02,$9D,$24,$13,$00,$9D,$60,$07,$0B  ; $9D3C
    .byte $02,$85,$65,$8A,$07,$0A,$6F,$6F,$07,$0B,$65,$6A,$8A,$8A,$6A,$6A  ; $9D4C
    .byte $0F,$01,$9D,$22,$07,$0B,$65,$02,$85,$65,$02,$85,$65,$6A,$6A,$6A  ; $9D5C
    .byte $6A,$6A,$6A,$6A,$04,$00,$04,$00,$06,$E6,$07,$0D,$02,$8D,$06,$8C  ; $9D6C
    .byte $07,$0B,$65,$6A,$65,$07,$0A,$6F,$6F,$07,$0B,$65,$65,$85,$12,$00  ; $9D7C
    .byte $9D,$97,$8A,$07,$0A,$6F,$6F,$0E,$03,$9D,$72,$6A,$6A,$6A,$6A,$0F  ; $9D8C
    .byte $01,$9D,$70,$02,$85,$65,$8A,$65,$85,$65,$85,$8A,$07,$0A,$6F,$6F  ; $9D9C
    .byte $07,$0B,$02,$85,$65,$8A,$65,$65,$A5,$A5,$16,$9C,$E3,$17,$00,$9D  ; $9DAC
    .byte $C3,$9E,$C9,$9F,$C0,$A0,$AE,$05,$01,$D8,$06,$E6,$07,$0B,$E0,$E0  ; $9DBC
    .byte $04,$00,$18,$40,$09,$01,$08,$02,$04,$00,$04,$00,$7E,$03,$69,$6B  ; $9DCC
    .byte $66,$69,$60,$6B,$6E,$60,$6E,$8B,$89,$8B,$0E,$01,$9D,$D6,$64,$60  ; $9DDC
    .byte $67,$01,$69,$08,$03,$01,$A9,$08,$02,$80,$84,$87,$89,$01,$8D,$08  ; $9DEC
    .byte $03,$01,$AD,$08,$02,$13,$08,$9E,$0D,$AB,$89,$87,$84,$0F,$01,$9D  ; $9DFC
    .byte $D4,$AE,$8D,$8B,$89,$04,$40,$9F,$08,$03,$01,$DF,$08,$02,$03,$8B  ; $9E0C
    .byte $8E,$92,$01,$70,$08,$03,$02,$01,$90,$08,$02,$12,$08,$9E,$34,$8E  ; $9E1C
    .byte $AD,$8B,$89,$86,$0E,$01,$9E,$11,$92,$06,$C8,$B0,$06,$E6,$8D,$8E  ; $9E2C
    .byte $90,$72,$70,$60,$02,$8E,$92,$70,$6E,$60,$02,$8D,$90,$6E,$6D,$60  ; $9E3C
    .byte $02,$8B,$8E,$8D,$8B,$89,$84,$01,$86,$08,$03,$02,$01,$A6,$08,$02  ; $9E4C
    .byte $80,$8A,$8D,$90,$80,$92,$60,$06,$B4,$02,$92,$06,$E6,$07,$0B,$0D  ; $9E5C
    .byte $7F,$01,$B2,$01,$52,$07,$08,$4D,$4A,$46,$80,$0D,$00,$07,$0B,$04  ; $9E6C
    .byte $08,$6B,$6B,$60,$6B,$A0,$60,$6B,$6E,$60,$6B,$60,$69,$60,$0E,$02  ; $9E7C
    .byte $9E,$7B,$AB,$AD,$6B,$60,$02,$A9,$04,$08,$6B,$6B,$60,$6B,$A0,$60  ; $9E8C
    .byte $6B,$12,$08,$9E,$AB,$6E,$60,$6B,$60,$69,$60,$0E,$02,$9E,$94,$6D  ; $9E9C
    .byte $60,$6E,$60,$70,$60,$02,$B2,$09,$02,$01,$8D,$08,$03,$02,$01,$AD  ; $9EAC
    .byte $0D,$7F,$4A,$46,$41,$03,$56,$0D,$00,$16,$9D,$CC,$17,$09,$02,$E0  ; $9EBC
    .byte $E0,$04,$00,$04,$00,$04,$00,$07,$0A,$06,$E6,$08,$02,$18,$40,$6B  ; $9ECC
    .byte $6E,$72,$6B,$6E,$60,$72,$72,$60,$72,$8E,$8B,$8E,$0E,$01,$9E,$D1  ; $9EDC
    .byte $6D,$60,$6D,$8D,$08,$05,$07,$09,$06,$96,$18,$00,$79,$03,$69,$64  ; $9EEC
    .byte $8D,$06,$E6,$07,$0A,$08,$02,$18,$40,$03,$8D,$90,$90,$60,$06,$96  ; $9EFC
    .byte $08,$05,$07,$09,$18,$00,$7C,$03,$69,$64,$6D,$69,$70,$6D,$75,$70  ; $9F0C
    .byte $6D,$70,$6D,$69,$64,$61,$0F,$01,$9E,$CF,$07,$0A,$06,$B4,$04,$08  ; $9F1C
    .byte $04,$08,$6B,$67,$62,$0E,$04,$9F,$2C,$6B,$04,$08,$69,$64,$61,$0E  ; $9F2C
    .byte $04,$9F,$36,$69,$0F,$01,$9F,$2A,$06,$E6,$08,$02,$18,$40,$03,$6B  ; $9F3C
    .byte $6B,$60,$01,$AB,$01,$6B,$6D,$6D,$60,$01,$AD,$01,$6D,$6E,$6E,$60  ; $9F4C
    .byte $01,$AE,$01,$6E,$70,$70,$60,$02,$90,$8D,$6A,$66,$61,$66,$6A,$66  ; $9F5C
    .byte $6A,$6D,$90,$8D,$92,$96,$80,$99,$60,$06,$B4,$02,$99,$06,$E6,$B9  ; $9F6C
    .byte $A0,$04,$00,$6E,$6E,$60,$6E,$A0,$60,$6E,$72,$60,$6E,$60,$6D,$60  ; $9F7C
    .byte $0E,$02,$9F,$7D,$AE,$B0,$6E,$60,$02,$AD,$04,$00,$6E,$6E,$60,$6E  ; $9F8C
    .byte $A0,$60,$6E,$12,$00,$9F,$AD,$72,$60,$6E,$60,$6D,$60,$0E,$02,$9F  ; $9F9C
    .byte $96,$70,$60,$72,$60,$73,$60,$02,$B6,$01,$BE,$08,$03,$01,$BE,$80  ; $9FAC
    .byte $16,$9E,$CD,$17,$08,$28,$09,$03,$06,$D2,$6B,$66,$69,$66,$60,$8B  ; $9FBC
    .byte $6B,$A6,$89,$66,$69,$6B,$66,$69,$66,$60,$8B,$6B,$A6,$89,$8D,$04  ; $9FCC
    .byte $00,$04,$00,$04,$00,$04,$00,$8B,$60,$66,$60,$66,$8B,$0E,$03,$9F  ; $9FDC
    .byte $E1,$0B,$FE,$0F,$01,$9F,$DF,$0B,$00,$10,$01,$9F,$DD,$04,$00,$04  ; $9FEC
    .byte $00,$87,$60,$62  ; $9FFC
