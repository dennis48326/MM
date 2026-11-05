; PRG 8 KB bank $16 at $8000
.segment "BANK16"
.org $8000

    JMP loc_16_806C              ; $8000  4C 6C 80

    JMP loc_16_80FE              ; $8003  4C FE 80


sub_16_8006:
    LDA #$00                     ; $8006  A9 00
    STA $C2                      ; $8008  85 C2
    LDY #$08                     ; $800A  A0 08

loc_16_800C:
    ASL $C2                      ; $800C  06 C2
    ROL $C1                      ; $800E  26 C1
    BCC loc_16_801F              ; $8010  90 0D
    CLC                          ; $8012  18
    LDA $C2                      ; $8013  A5 C2
    ADC $C4                      ; $8015  65 C4
    STA $C2                      ; $8017  85 C2
    LDA $C1                      ; $8019  A5 C1
    ADC #$00                     ; $801B  69 00
    STA $C1                      ; $801D  85 C1

loc_16_801F:
    DEY                          ; $801F  88
    BNE loc_16_800C              ; $8020  D0 EA
    RTS                          ; $8022  60


sub_16_8023:
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


sub_16_803A:
    STY $C1                      ; $803A  84 C1
    LDY #$00                     ; $803C  A0 00
    CMP #$C0                     ; $803E  C9 C0
    BCS loc_16_8047              ; $8040  B0 05
    STA $C2                      ; $8042  85 C2
    LDA ($C1),Y                  ; $8044  B1 C1
    RTS                          ; $8046  60


loc_16_8047:
    SEC                          ; $8047  38
    SBC #$20                     ; $8048  E9 20
    STA $C2                      ; $804A  85 C2
    LDA #$07                     ; $804C  A9 07
    STA $8000                    ; $804E  8D 00 80
    LDA #$18                     ; $8051  A9 18
    STA $8001                    ; $8053  8D 01 80
    LDA ($C1),Y                  ; $8056  B1 C1
    PHA                          ; $8058  48
    LDA #$07                     ; $8059  A9 07
    STA $8000                    ; $805B  8D 00 80
    LDA #$17                     ; $805E  A9 17
    STA $8001                    ; $8060  8D 01 80
    LDA #$20                     ; $8063  A9 20
    CLC                          ; $8065  18
    ADC $C2                      ; $8066  65 C2
    STA $C2                      ; $8068  85 C2
    PLA                          ; $806A  68
    RTS                          ; $806B  60


loc_16_806C:
    LDA $C0                      ; $806C  A5 C0
    LSR A                        ; $806E  4A
    BCS loc_16_80D7              ; $806F  B0 66
    LDA $D0                      ; $8071  A5 D0
    ORA $D1                      ; $8073  05 D1
    BEQ loc_16_807A              ; $8075  F0 03
    JSR sub_16_8252              ; $8077  20 52 82

loc_16_807A:
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

loc_16_808C:
    LSR $CF                      ; $808C  46 CF
    BCC loc_16_8099              ; $808E  90 09
    LDA $CF                      ; $8090  A5 CF
    ORA #$80                     ; $8092  09 80
    STA $CF                      ; $8094  85 CF
    JSR sub_16_82DE              ; $8096  20 DE 82

loc_16_8099:
    LDA $C0                      ; $8099  A5 C0
    AND #$02                     ; $809B  29 02
    BNE loc_16_80A6              ; $809D  D0 07
    TXA                          ; $809F  8A
    PHA                          ; $80A0  48
    JSR sub_16_8393              ; $80A1  20 93 83
    PLA                          ; $80A4  68
    TAX                          ; $80A5  AA

loc_16_80A6:
    DEX                          ; $80A6  CA
    BPL loc_16_808C              ; $80A7  10 E3
    PLA                          ; $80A9  68
    STA $CF                      ; $80AA  85 CF
    LSR $C0                      ; $80AC  46 C0
    ASL $C0                      ; $80AE  06 C0
    LDA $CC                      ; $80B0  A5 CC
    AND #$7F                     ; $80B2  29 7F
    BEQ loc_16_80D7              ; $80B4  F0 21
    LDY #$00                     ; $80B6  A0 00
    STY $C1                      ; $80B8  84 C1
    LDY #$04                     ; $80BA  A0 04

loc_16_80BC:
    ASL A                        ; $80BC  0A
    ROL $C1                      ; $80BD  26 C1
    DEY                          ; $80BF  88
    BNE loc_16_80BC              ; $80C0  D0 FA
    CLC                          ; $80C2  18
    ADC $C0                      ; $80C3  65 C0
    STA $C0                      ; $80C5  85 C0
    LDA $C1                      ; $80C7  A5 C1
    ADC $CD                      ; $80C9  65 CD
    BCC loc_16_80D5              ; $80CB  90 08
    LDA $CC                      ; $80CD  A5 CC
    AND #$80                     ; $80CF  29 80
    STA $CC                      ; $80D1  85 CC
    LDA #$FF                     ; $80D3  A9 FF

loc_16_80D5:
    STA $CD                      ; $80D5  85 CD

loc_16_80D7:
    RTS                          ; $80D7  60


sub_16_80D8:
    TXA                          ; $80D8  8A
    AND #$03                     ; $80D9  29 03
    EOR #$03                     ; $80DB  49 03
    ASL A                        ; $80DD  0A
    ASL A                        ; $80DE  0A
    TAY                          ; $80DF  A8
    LDA #$30                     ; $80E0  A9 30
    CPY #$08                     ; $80E2  C0 08
    BNE loc_16_80E8              ; $80E4  D0 02
    LDA #$00                     ; $80E6  A9 00

loc_16_80E8:
    STA $4000,Y                  ; $80E8  99 00 40
    RTS                          ; $80EB  60


sub_16_80EC:
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


loc_16_80FE:
    INC $C0                      ; $80FE  E6 C0
    JSR sub_16_8106              ; $8100  20 06 81
    DEC $C0                      ; $8103  C6 C0
    RTS                          ; $8105  60


sub_16_8106:
    CMP #$F0                     ; $8106  C9 F0
    BCC loc_16_810D              ; $8108  90 03
    JMP loc_16_81AE              ; $810A  4C AE 81


loc_16_810D:
    CMP $8A40                    ; $810D  CD 40 8A
    BCC sub_16_8118              ; $8110  90 06
    SEC                          ; $8112  38
    SBC $8A40                    ; $8113  ED 40 8A
    BCS loc_16_810D              ; $8116  B0 F5

sub_16_8118:
    ASL A                        ; $8118  0A
    TAX                          ; $8119  AA
    LDY $8A44,X                  ; $811A  BC 44 8A
    TYA                          ; $811D  98
    ORA $8A43,X                  ; $811E  1D 43 8A
    BEQ loc_16_816E              ; $8121  F0 4B
    LDA $8A43,X                  ; $8123  BD 43 8A
    JSR sub_16_803A              ; $8126  20 3A 80
    TAY                          ; $8129  A8
    BEQ loc_16_816F              ; $812A  F0 43
    LDY #$00                     ; $812C  A0 00
    INX                          ; $812E  E8
    STA $C4                      ; $812F  85 C4
    AND #$7F                     ; $8131  29 7F
    CMP $CE                      ; $8133  C5 CE
    BCC loc_16_816E              ; $8135  90 37
    STA $CE                      ; $8137  85 CE
    BNE loc_16_8145              ; $8139  D0 0A
    LDA $D6                      ; $813B  A5 D6
    BPL loc_16_8145              ; $813D  10 06
    LDA $C4                      ; $813F  A5 C4
    BMI loc_16_8145              ; $8141  30 02
    STY $D7                      ; $8143  84 D7

loc_16_8145:
    STY $D6                      ; $8145  84 D6
    ASL $C4                      ; $8147  06 C4
    ROR $D6                      ; $8149  66 D6
    BPL loc_16_814F              ; $814B  10 02
    STX $D7                      ; $814D  86 D7

loc_16_814F:
    INC $C1                      ; $814F  E6 C1
    LDA $C1                      ; $8151  A5 C1
    STA $D0                      ; $8153  85 D0
    BNE loc_16_8159              ; $8155  D0 02
    INC $C2                      ; $8157  E6 C2

loc_16_8159:
    LDA $C2                      ; $8159  A5 C2
    STA $D1                      ; $815B  85 D1
    TYA                          ; $815D  98
    STA $D2                      ; $815E  85 D2
    STA $D3                      ; $8160  85 D3
    STA $D4                      ; $8162  85 D4
    STA $D5                      ; $8164  85 D5
    LDY #$27                     ; $8166  A0 27

loc_16_8168:
    STA $0700,Y                  ; $8168  99 00 07
    DEY                          ; $816B  88
    BPL loc_16_8168              ; $816C  10 FA

loc_16_816E:
    RTS                          ; $816E  60


loc_16_816F:
    LDX #$01                     ; $816F  A2 01
    STX $C9                      ; $8171  86 C9
    LDX #$99                     ; $8173  A2 99
    STX $CA                      ; $8175  86 CA
    STA $C8                      ; $8177  85 C8
    STA $CB                      ; $8179  85 CB
    STA $CC                      ; $817B  85 CC
    STA $CD                      ; $817D  85 CD
    LDX #$53                     ; $817F  A2 53

loc_16_8181:
    STA $0728,X                  ; $8181  9D 28 07
    DEX                          ; $8184  CA
    BPL loc_16_8181              ; $8185  10 FA
    LDX #$03                     ; $8187  A2 03

loc_16_8189:
    INC $C1                      ; $8189  E6 C1
    BNE loc_16_818F              ; $818B  D0 02
    INC $C2                      ; $818D  E6 C2

loc_16_818F:
    LDY $C1                      ; $818F  A4 C1
    LDA $C2                      ; $8191  A5 C2
    JSR sub_16_803A              ; $8193  20 3A 80
    STA $0754,X                  ; $8196  9D 54 07
    INC $C1                      ; $8199  E6 C1
    BNE loc_16_819F              ; $819B  D0 02
    INC $C2                      ; $819D  E6 C2

loc_16_819F:
    LDY $C1                      ; $819F  A4 C1
    LDA $C2                      ; $81A1  A5 C2
    JSR sub_16_803A              ; $81A3  20 3A 80
    STA $0750,X                  ; $81A6  9D 50 07
    DEX                          ; $81A9  CA
    BPL loc_16_8189              ; $81AA  10 DD
    BMI sub_16_81F1              ; $81AC  30 43

loc_16_81AE:
    STY $C3                      ; $81AE  84 C3
    AND #$07                     ; $81B0  29 07
    JSR sub_16_8023              ; $81B2  20 23 80
    CMP $81                      ; $81B5  C5 81
    INY                          ; $81B7  C8
    STA ($E4,X)                  ; $81B8  81 E4
    STA ($1E,X)                  ; $81BA  81 1E
    NOP #$26                     ; $81BC  82 26
    NOP #$2D                     ; $81BE  82 2D
    NOP #$34                     ; $81C0  82 34
    NOP #$4A                     ; $81C2  82 4A
    NOP #$20                     ; $81C4  82 20
    CPX $81                      ; $81C6  E4 81

loc_16_81C8:
    LDA #$00                     ; $81C8  A9 00
    STA $CE                      ; $81CA  85 CE
    STA $D0                      ; $81CC  85 D0
    STA $D1                      ; $81CE  85 D1
    STA $D7                      ; $81D0  85 D7
    STA $D8                      ; $81D2  85 D8

sub_16_81D4:
    LDA $CF                      ; $81D4  A5 CF
    BEQ loc_16_81E3              ; $81D6  F0 0B
    EOR #$0F                     ; $81D8  49 0F
    STA $CF                      ; $81DA  85 CF
    JSR sub_16_81F1              ; $81DC  20 F1 81
    LDA #$00                     ; $81DF  A9 00
    STA $CF                      ; $81E1  85 CF

loc_16_81E3:
    RTS                          ; $81E3  60

    LDA #$00                     ; $81E4  A9 00
    LDX #$03                     ; $81E6  A2 03

loc_16_81E8:
    STA $0754,X                  ; $81E8  9D 54 07
    STA $0750,X                  ; $81EB  9D 50 07
    DEX                          ; $81EE  CA
    BPL loc_16_81E8              ; $81EF  10 F7

sub_16_81F1:
    LDA $CF                      ; $81F1  A5 CF
    PHA                          ; $81F3  48
    LDX #$03                     ; $81F4  A2 03

loc_16_81F6:
    LSR $CF                      ; $81F6  46 CF
    BCS loc_16_820A              ; $81F8  B0 10
    JSR sub_16_80D8              ; $81FA  20 D8 80
    LDA $0754,X                  ; $81FD  BD 54 07
    ORA $0750,X                  ; $8200  1D 50 07
    BEQ loc_16_820A              ; $8203  F0 05
    LDA #$FF                     ; $8205  A9 FF
    STA $077C,X                  ; $8207  9D 7C 07

loc_16_820A:
    DEX                          ; $820A  CA
    BPL loc_16_81F6              ; $820B  10 E9
    PLA                          ; $820D  68
    STA $CF                      ; $820E  85 CF
    LDA #$08                     ; $8210  A9 08
    STA $4001                    ; $8212  8D 01 40
    STA $4005                    ; $8215  8D 05 40
    LDA #$0F                     ; $8218  A9 0F
    STA $4015                    ; $821A  8D 15 40
    RTS                          ; $821D  60

    .byte $A5,$C0,$09,$02,$85,$C0,$D0,$CB,$A5,$C0,$29,$FD,$85,$C0,$60,$06  ; $821E
    .byte $C3,$F0,$03,$38,$66,$C3,$A5,$C0,$29,$0F,$85,$C0,$A4,$C3,$84,$CC  ; $822E
    .byte $F0,$07,$A0,$FF,$C4,$CD,$D0,$03,$C8,$84,$CD,$60,$A9,$00,$38,$E5  ; $823E
    .byte $C3,$85,$D8,$60  ; $824E

sub_16_8252:
    LDA $D3                      ; $8252  A5 D3
    BEQ loc_16_825B              ; $8254  F0 05
    DEC $D3                      ; $8256  C6 D3
    DEC $D5                      ; $8258  C6 D5
    RTS                          ; $825A  60


loc_16_825B:
    JSR sub_16_8386              ; $825B  20 86 83
    STA $C4                      ; $825E  85 C4
    ASL A                        ; $8260  0A
    BCC loc_16_8273              ; $8261  90 10
    STY $CE                      ; $8263  84 CE
    LDA $D7                      ; $8265  A5 D7
    LSR A                        ; $8267  4A
    BCC loc_16_8270              ; $8268  90 06
    JSR sub_16_8118              ; $826A  20 18 81
    JMP loc_16_825B              ; $826D  4C 5B 82


loc_16_8270:
    JMP loc_16_81C8              ; $8270  4C C8 81


loc_16_8273:
    LSR $C4                      ; $8273  46 C4
    BCC loc_16_82A6              ; $8275  90 2F
    JSR sub_16_8386              ; $8277  20 86 83
    ASL A                        ; $827A  0A
    BEQ loc_16_8289              ; $827B  F0 0C
    ASL $D6                      ; $827D  06 D6
    PHP                          ; $827F  08
    CMP $D6                      ; $8280  C5 D6
    BEQ loc_16_8296              ; $8282  F0 12
    PLP                          ; $8284  28
    ROR $D6                      ; $8285  66 D6
    INC $D6                      ; $8287  E6 D6

loc_16_8289:
    JSR sub_16_8386              ; $8289  20 86 83
    TAX                          ; $828C  AA
    JSR sub_16_8386              ; $828D  20 86 83
    STA $D0                      ; $8290  85 D0
    STX $D1                      ; $8292  86 D1
    BNE loc_16_825B              ; $8294  D0 C5

loc_16_8296:
    TYA                          ; $8296  98
    PLP                          ; $8297  28
    ROR A                        ; $8298  6A
    STA $D6                      ; $8299  85 D6
    CLC                          ; $829B  18
    LDA #$02                     ; $829C  A9 02
    ADC $D0                      ; $829E  65 D0
    STA $D0                      ; $82A0  85 D0
    BCC loc_16_82A6              ; $82A2  90 02
    INC $D1                      ; $82A4  E6 D1

loc_16_82A6:
    LSR $C4                      ; $82A6  46 C4
    BCC loc_16_82AF              ; $82A8  90 05
    JSR sub_16_8386              ; $82AA  20 86 83
    STA $D4                      ; $82AD  85 D4

loc_16_82AF:
    LSR $C4                      ; $82AF  46 C4
    BCC loc_16_82B8              ; $82B1  90 05
    JSR sub_16_8386              ; $82B3  20 86 83
    STA $D2                      ; $82B6  85 D2

loc_16_82B8:
    JSR sub_16_8386              ; $82B8  20 86 83
    STA $D3                      ; $82BB  85 D3
    STA $C1                      ; $82BD  85 C1
    LDA $D4                      ; $82BF  A5 D4
    STA $C4                      ; $82C1  85 C4
    JSR sub_16_8006              ; $82C3  20 06 80
    LDY $C1                      ; $82C6  A4 C1
    INY                          ; $82C8  C8
    STY $D5                      ; $82C9  84 D5
    INC $C0                      ; $82CB  E6 C0
    JSR sub_16_8386              ; $82CD  20 86 83
    PHA                          ; $82D0  48
    EOR $CF                      ; $82D1  45 CF
    BEQ loc_16_82DA              ; $82D3  F0 05
    STA $CF                      ; $82D5  85 CF
    JSR sub_16_81D4              ; $82D7  20 D4 81

loc_16_82DA:
    PLA                          ; $82DA  68
    STA $CF                      ; $82DB  85 CF
    RTS                          ; $82DD  60


sub_16_82DE:
    LDY $0700,X                  ; $82DE  BC 00 07
    BEQ loc_16_82E6              ; $82E1  F0 03
    JSR sub_16_8684              ; $82E3  20 84 86

loc_16_82E6:
    LDA $C0                      ; $82E6  A5 C0
    LSR A                        ; $82E8  4A
    BCS loc_16_830A              ; $82E9  B0 1F
    JSR sub_16_86BA              ; $82EB  20 BA 86
    LDA $D3                      ; $82EE  A5 D3
    BEQ loc_16_82FA              ; $82F0  F0 08
    CPX #$01                     ; $82F2  E0 01
    BEQ loc_16_82FB              ; $82F4  F0 05
    LDA $D5                      ; $82F6  A5 D5
    BEQ loc_16_8300              ; $82F8  F0 06

loc_16_82FA:
    RTS                          ; $82FA  60


loc_16_82FB:
    DEC $0710,X                  ; $82FB  DE 10 07
    BNE loc_16_82FA              ; $82FE  D0 FA

loc_16_8300:
    LDA $0704,X                  ; $8300  BD 04 07
    AND #$04                     ; $8303  29 04
    BNE loc_16_82FA              ; $8305  D0 F3
    JMP sub_16_85A3              ; $8307  4C A3 85


loc_16_830A:
    LDA #$00                     ; $830A  A9 00
    STA $C4                      ; $830C  85 C4
    JSR sub_16_8386              ; $830E  20 86 83

loc_16_8311:
    LSR A                        ; $8311  4A
    BCC loc_16_8320              ; $8312  90 0C
    PHA                          ; $8314  48
    JSR sub_16_8386              ; $8315  20 86 83
    STA $C3                      ; $8318  85 C3
    LDA $C4                      ; $831A  A5 C4
    JSR sub_16_8326              ; $831C  20 26 83
    PLA                          ; $831F  68

loc_16_8320:
    BEQ loc_16_8333              ; $8320  F0 11
    INC $C4                      ; $8322  E6 C4
    BNE loc_16_8311              ; $8324  D0 EB

sub_16_8326:
    JSR sub_16_8023              ; $8326  20 23 80
    RRA $AD86                    ; $8329  6F 86 AD
    STX $5A                      ; $832C  86 5A
    STX $A7                      ; $832E  86 A7
    STX $A1                      ; $8330  86 A1
    STX $20                      ; $8332  86 20
    STX $83                      ; $8334  86 83
    TAY                          ; $8336  A8
    BNE loc_16_8349              ; $8337  D0 10
    STA $0710,X                  ; $8339  9D 10 07
    LDA $0704,X                  ; $833C  BD 04 07
    AND #$F8                     ; $833F  29 F8
    ORA #$04                     ; $8341  09 04
    STA $0704,X                  ; $8343  9D 04 07
    JMP sub_16_80D8              ; $8346  4C D8 80


loc_16_8349:
    LDA $0704,X                  ; $8349  BD 04 07
    ORA #$20                     ; $834C  09 20
    STA $0704,X                  ; $834E  9D 04 07
    LDA $0718,X                  ; $8351  BD 18 07
    ASL A                        ; $8354  0A
    LDA #$54                     ; $8355  A9 54
    BCS loc_16_835B              ; $8357  B0 02
    LDA #$0A                     ; $8359  A9 0A

loc_16_835B:
    STA $071C,X                  ; $835B  9D 1C 07
    TYA                          ; $835E  98
    BPL loc_16_836B              ; $835F  10 0A
    CPX #$01                     ; $8361  E0 01
    BNE loc_16_8368              ; $8363  D0 03
    JSR sub_16_85AE              ; $8365  20 AE 85

loc_16_8368:
    JMP sub_16_8644              ; $8368  4C 44 86


loc_16_836B:
    JSR sub_16_85AE              ; $836B  20 AE 85
    LDA #$FF                     ; $836E  A9 FF
    STA $077C,X                  ; $8370  9D 7C 07
    DEY                          ; $8373  88
    TXA                          ; $8374  8A
    BNE loc_16_837F              ; $8375  D0 08
    STA $C3                      ; $8377  85 C3
    TYA                          ; $8379  98
    EOR #$0F                     ; $837A  49 0F
    JMP sub_16_8636              ; $837C  4C 36 86


loc_16_837F:
    TYA                          ; $837F  98
    CLC                          ; $8380  18
    ADC $D2                      ; $8381  65 D2
    JMP sub_16_85DE              ; $8383  4C DE 85


sub_16_8386:
    LDY $D0                      ; $8386  A4 D0
    LDA $D1                      ; $8388  A5 D1
    INC $D0                      ; $838A  E6 D0
    BNE loc_16_8390              ; $838C  D0 02
    INC $D1                      ; $838E  E6 D1

loc_16_8390:
    JMP sub_16_803A              ; $8390  4C 3A 80


sub_16_8393:
    TXA                          ; $8393  8A
    ORA #$28                     ; $8394  09 28
    TAX                          ; $8396  AA
    LDA $0728,X                  ; $8397  BD 28 07
    ORA $072C,X                  ; $839A  1D 2C 07
    BEQ loc_16_83CC              ; $839D  F0 2D
    LDA $0738,X                  ; $839F  BD 38 07
    BEQ loc_16_83CD              ; $83A2  F0 29
    LDY $0700,X                  ; $83A4  BC 00 07
    BEQ loc_16_83AF              ; $83A7  F0 06
    JSR sub_16_8684              ; $83A9  20 84 86
    JSR sub_16_86BA              ; $83AC  20 BA 86

loc_16_83AF:
    LDA $0740,X                  ; $83AF  BD 40 07
    SEC                          ; $83B2  38
    SBC $C7                      ; $83B3  E5 C7
    STA $0740,X                  ; $83B5  9D 40 07
    BEQ loc_16_83BC              ; $83B8  F0 02
    BCS loc_16_83BF              ; $83BA  B0 03

loc_16_83BC:
    JSR sub_16_85A3              ; $83BC  20 A3 85

loc_16_83BF:
    LDA $0738,X                  ; $83BF  BD 38 07
    SEC                          ; $83C2  38
    SBC $C7                      ; $83C3  E5 C7
    STA $0738,X                  ; $83C5  9D 38 07
    BEQ loc_16_83CD              ; $83C8  F0 03
    BCC loc_16_83CD              ; $83CA  90 01

loc_16_83CC:
    RTS                          ; $83CC  60


loc_16_83CD:
    JSR sub_16_8592              ; $83CD  20 92 85
    CMP #$20                     ; $83D0  C9 20
    BCS loc_16_83DA              ; $83D2  B0 06
    JSR sub_16_8497              ; $83D4  20 97 84
    JMP loc_16_83CD              ; $83D7  4C CD 83


loc_16_83DA:
    PHA                          ; $83DA  48
    ROL A                        ; $83DB  2A
    ROL A                        ; $83DC  2A
    ROL A                        ; $83DD  2A
    ROL A                        ; $83DE  2A
    AND #$07                     ; $83DF  29 07
    TAY                          ; $83E1  A8
    DEY                          ; $83E2  88
    LDA $0730,X                  ; $83E3  BD 30 07
    ASL A                        ; $83E6  0A
    ASL A                        ; $83E7  0A
    BPL loc_16_83EF              ; $83E8  10 05
    LDA $8915,Y                  ; $83EA  B9 15 89
    BNE loc_16_8406              ; $83ED  D0 17

loc_16_83EF:
    ASL A                        ; $83EF  0A
    ASL A                        ; $83F0  0A
    LDA $891C,Y                  ; $83F1  B9 1C 89
    BCC loc_16_8406              ; $83F4  90 10
    STA $C3                      ; $83F6  85 C3
    LDA $0730,X                  ; $83F8  BD 30 07
    AND #$EF                     ; $83FB  29 EF
    STA $0730,X                  ; $83FD  9D 30 07
    LDA $C3                      ; $8400  A5 C3
    LSR A                        ; $8402  4A
    CLC                          ; $8403  18
    ADC $C3                      ; $8404  65 C3

loc_16_8406:
    CLC                          ; $8406  18
    ADC $0738,X                  ; $8407  7D 38 07
    STA $0738,X                  ; $840A  9D 38 07
    TAY                          ; $840D  A8
    PLA                          ; $840E  68
    AND #$1F                     ; $840F  29 1F
    BNE loc_16_8419              ; $8411  D0 06
    JSR sub_16_85A3              ; $8413  20 A3 85
    JMP loc_16_8491              ; $8416  4C 91 84


loc_16_8419:
    PHA                          ; $8419  48
    STY $C4                      ; $841A  84 C4
    LDA $073C,X                  ; $841C  BD 3C 07
    STA $C1                      ; $841F  85 C1
    JSR sub_16_8006              ; $8421  20 06 80
    LDA $C1                      ; $8424  A5 C1
    BNE loc_16_842A              ; $8426  D0 02
    LDA #$01                     ; $8428  A9 01

loc_16_842A:
    STA $0740,X                  ; $842A  9D 40 07
    PLA                          ; $842D  68
    TAY                          ; $842E  A8
    DEY                          ; $842F  88
    LDA $0730,X                  ; $8430  BD 30 07
    BPL loc_16_8440              ; $8433  10 0B
    LDA $0718,X                  ; $8435  BD 18 07
    BNE loc_16_8454              ; $8438  D0 1A
    JSR sub_16_8644              ; $843A  20 44 86
    JMP loc_16_847E              ; $843D  4C 7E 84


loc_16_8440:
    JSR sub_16_85AE              ; $8440  20 AE 85
    LDA $CF                      ; $8443  A5 CF
    BMI loc_16_8454              ; $8445  30 0D
    STY $C3                      ; $8447  84 C3
    TXA                          ; $8449  8A
    AND #$03                     ; $844A  29 03
    TAY                          ; $844C  A8
    LDA #$FF                     ; $844D  A9 FF
    STA $077C,Y                  ; $844F  99 7C 07
    LDY $C3                      ; $8452  A4 C3

loc_16_8454:
    TXA                          ; $8454  8A
    AND #$03                     ; $8455  29 03
    BNE loc_16_8466              ; $8457  D0 0D
    STA $C3                      ; $8459  85 C3
    TYA                          ; $845B  98
    AND #$0F                     ; $845C  29 0F
    EOR #$0F                     ; $845E  49 0F
    JSR sub_16_8636              ; $8460  20 36 86
    JMP loc_16_847E              ; $8463  4C 7E 84


loc_16_8466:
    STY $C3                      ; $8466  84 C3
    LDA $0730,X                  ; $8468  BD 30 07
    AND #$0F                     ; $846B  29 0F
    TAY                          ; $846D  A8
    LDA $8923,Y                  ; $846E  B9 23 89
    CLC                          ; $8471  18
    ADC $C3                      ; $8472  65 C3
    CLC                          ; $8474  18
    ADC $CB                      ; $8475  65 CB
    CLC                          ; $8477  18
    ADC $0734,X                  ; $8478  7D 34 07
    JSR sub_16_85DE              ; $847B  20 DE 85

loc_16_847E:
    LDA $0730,X                  ; $847E  BD 30 07
    TAY                          ; $8481  A8
    AND #$40                     ; $8482  29 40
    ASL A                        ; $8484  0A
    STA $C4                      ; $8485  85 C4
    TYA                          ; $8487  98
    AND #$7F                     ; $8488  29 7F
    ORA $C4                      ; $848A  05 C4
    STA $0730,X                  ; $848C  9D 30 07
    BPL loc_16_8496              ; $848F  10 05

loc_16_8491:
    LDA #$FF                     ; $8491  A9 FF
    STA $0740,X                  ; $8493  9D 40 07

loc_16_8496:
    RTS                          ; $8496  60


sub_16_8497:
    CMP #$04                     ; $8497  C9 04
    BCC loc_16_84A4              ; $8499  90 09
    STA $C4                      ; $849B  85 C4
    JSR sub_16_8592              ; $849D  20 92 85
    STA $C3                      ; $84A0  85 C3
    LDA $C4                      ; $84A2  A5 C4

loc_16_84A4:
    JSR sub_16_8023              ; $84A4  20 23 80
    CMP $DD84,Y                  ; $84A7  D9 84 DD
    STY $E1                      ; $84AA  84 E1
    STY $E8                      ; $84AC  84 E8
    STY $75                      ; $84AE  84 75
    STA $F1                      ; $84B0  85 F1
    STY $FF                      ; $84B2  84 FF
    STY $5A                      ; $84B4  84 5A
    STX $6F                      ; $84B6  86 6F
    STX $05                      ; $84B8  86 05
    STA $10                      ; $84BA  85 10
    STA $15                      ; $84BC  85 15
    STA $A1                      ; $84BE  85 A1
    STX $A7                      ; $84C0  86 A7
    STX $1B                      ; $84C2  86 1B
    STA $1F                      ; $84C4  85 1F
    STA $23                      ; $84C6  85 23
    STA $27                      ; $84C8  85 27
    STA $1B                      ; $84CA  85 1B
    STA $1F                      ; $84CC  85 1F
    STA $23                      ; $84CE  85 23
    STA $27                      ; $84D0  85 27
    STA $5A                      ; $84D2  85 5A
    STA $80                      ; $84D4  85 80
    STA $AD                      ; $84D6  85 AD
    STX $A9                      ; $84D8  86 A9
    JSR $0DD0                    ; $84DA  20 D0 0D
    LDA #$40                     ; $84DD  A9 40
    BNE loc_16_84EA              ; $84DF  D0 09
    LDA #$10                     ; $84E1  A9 10
    ORA $0730,X                  ; $84E3  1D 30 07
    BNE loc_16_84ED              ; $84E6  D0 05
    LDA #$08                     ; $84E8  A9 08

loc_16_84EA:
    EOR $0730,X                  ; $84EA  5D 30 07

loc_16_84ED:
    STA $0730,X                  ; $84ED  9D 30 07
    RTS                          ; $84F0  60

    LDA #$00                     ; $84F1  A9 00
    STA $C8                      ; $84F3  85 C8
    JSR sub_16_8592              ; $84F5  20 92 85
    LDY $C3                      ; $84F8  A4 C3
    STA $CA                      ; $84FA  85 CA
    STY $C9                      ; $84FC  84 C9
    RTS                          ; $84FE  60

    LDA $C3                      ; $84FF  A5 C3
    STA $073C,X                  ; $8501  9D 3C 07
    RTS                          ; $8504  60

    LDA $0730,X                  ; $8505  BD 30 07
    AND #$F8                     ; $8508  29 F8
    ORA $C3                      ; $850A  05 C3
    STA $0730,X                  ; $850C  9D 30 07
    RTS                          ; $850F  60

    LDA $C3                      ; $8510  A5 C3
    STA $CB                      ; $8512  85 CB
    RTS                          ; $8514  60

    .byte $A5,$C3,$9D,$34,$07,$60  ; $8515
    LDA #$00                     ; $851B  A9 00
    BEQ loc_16_8529              ; $851D  F0 0A
    LDA #$04                     ; $851F  A9 04
    BNE loc_16_8529              ; $8521  D0 06
    LDA #$08                     ; $8523  A9 08
    BNE loc_16_8529              ; $8525  D0 02
    LDA #$0C                     ; $8527  A9 0C

loc_16_8529:
    STA $C2                      ; $8529  85 C2
    TXA                          ; $852B  8A
    CLC                          ; $852C  18
    ADC $C2                      ; $852D  65 C2
    TAY                          ; $852F  A8
    LDA $C4                      ; $8530  A5 C4
    CMP #$12                     ; $8532  C9 12
    BCS loc_16_8547              ; $8534  B0 11
    LDA $0744,Y                  ; $8536  B9 44 07
    SEC                          ; $8539  38
    SBC #$01                     ; $853A  E9 01
    BCS loc_16_8540              ; $853C  B0 02
    LDA $C3                      ; $853E  A5 C3

loc_16_8540:
    STA $0744,Y                  ; $8540  99 44 07
    BEQ loc_16_8566              ; $8543  F0 21
    BNE loc_16_8555              ; $8545  D0 0E

loc_16_8547:
    LDA $0744,Y                  ; $8547  B9 44 07
    SEC                          ; $854A  38
    SBC #$01                     ; $854B  E9 01
    BNE loc_16_8566              ; $854D  D0 17
    STA $0744,Y                  ; $854F  99 44 07
    JSR sub_16_8575              ; $8552  20 75 85

loc_16_8555:
    JSR sub_16_8592              ; $8555  20 92 85
    STA $C3                      ; $8558  85 C3
    JSR sub_16_8592              ; $855A  20 92 85
    STA $0728,X                  ; $855D  9D 28 07
    LDA $C3                      ; $8560  A5 C3
    STA $072C,X                  ; $8562  9D 2C 07
    RTS                          ; $8565  60


loc_16_8566:
    LDA #$02                     ; $8566  A9 02
    CLC                          ; $8568  18
    ADC $0728,X                  ; $8569  7D 28 07
    STA $0728,X                  ; $856C  9D 28 07
    BCC loc_16_8574              ; $856F  90 03
    INC $072C,X                  ; $8571  FE 2C 07

loc_16_8574:
    RTS                          ; $8574  60


sub_16_8575:
    LDA $0730,X                  ; $8575  BD 30 07
    AND #$97                     ; $8578  29 97
    ORA $C3                      ; $857A  05 C3
    STA $0730,X                  ; $857C  9D 30 07
    RTS                          ; $857F  60

    PLA                          ; $8580  68
    PLA                          ; $8581  68
    LDA #$00                     ; $8582  A9 00
    STA $0728,X                  ; $8584  9D 28 07
    STA $072C,X                  ; $8587  9D 2C 07
    LDA $CF                      ; $858A  A5 CF
    BMI loc_16_8591              ; $858C  30 03
    JMP sub_16_80D8              ; $858E  4C D8 80


loc_16_8591:
    RTS                          ; $8591  60


sub_16_8592:
    LDY $0728,X                  ; $8592  BC 28 07
    LDA $072C,X                  ; $8595  BD 2C 07
    INC $0728,X                  ; $8598  FE 28 07
    BNE loc_16_85A0              ; $859B  D0 03
    INC $072C,X                  ; $859D  FE 2C 07

loc_16_85A0:
    JMP sub_16_803A              ; $85A0  4C 3A 80


sub_16_85A3:
    LDA $0704,X                  ; $85A3  BD 04 07
    AND #$F8                     ; $85A6  29 F8
    ORA #$03                     ; $85A8  09 03
    STA $0704,X                  ; $85AA  9D 04 07
    RTS                          ; $85AD  60


sub_16_85AE:
    TYA                          ; $85AE  98
    PHA                          ; $85AF  48
    LDY #$00                     ; $85B0  A0 00
    LDA $0704,X                  ; $85B2  BD 04 07
    AND #$F8                     ; $85B5  29 F8
    STA $0704,X                  ; $85B7  9D 04 07
    CPX #$29                     ; $85BA  E0 29
    BEQ loc_16_85D0              ; $85BC  F0 12
    CPX #$01                     ; $85BE  E0 01
    BNE loc_16_85D7              ; $85C0  D0 15
    LDA $D3                      ; $85C2  A5 D3
    STA $C1                      ; $85C4  85 C1
    LDA $070C,X                  ; $85C6  BD 0C 07
    STA $C4                      ; $85C9  85 C4
    JSR sub_16_8006              ; $85CB  20 06 80
    LDY $C1                      ; $85CE  A4 C1

loc_16_85D0:
    INY                          ; $85D0  C8
    INC $0704,X                  ; $85D1  FE 04 07
    INC $0704,X                  ; $85D4  FE 04 07

loc_16_85D7:
    TYA                          ; $85D7  98
    STA $0710,X                  ; $85D8  9D 10 07
    PLA                          ; $85DB  68
    TAY                          ; $85DC  A8
    RTS                          ; $85DD  60


sub_16_85DE:
    CMP #$60                     ; $85DE  C9 60
    BCC loc_16_85E4              ; $85E0  90 02
    LDA #$5F                     ; $85E2  A9 5F

loc_16_85E4:
    STA $C3                      ; $85E4  85 C3
    INC $C3                      ; $85E6  E6 C3
    CPX #$28                     ; $85E8  E0 28
    BCC loc_16_862A              ; $85EA  90 3E
    LDA $071C,X                  ; $85EC  BD 1C 07
    BEQ loc_16_861D              ; $85EF  F0 2C
    CMP $C3                      ; $85F1  C5 C3
    BNE loc_16_85FC              ; $85F3  D0 07
    LDA $0730,X                  ; $85F5  BD 30 07
    BPL loc_16_861D              ; $85F8  10 23
    BMI sub_16_8644              ; $85FA  30 48

loc_16_85FC:
    LDA $0718,X                  ; $85FC  BD 18 07
    BEQ loc_16_861D              ; $85FF  F0 1C
    BCS loc_16_8607              ; $8601  B0 04
    ORA #$80                     ; $8603  09 80
    BNE loc_16_8609              ; $8605  D0 02

loc_16_8607:
    AND #$7F                     ; $8607  29 7F

loc_16_8609:
    STA $0718,X                  ; $8609  9D 18 07
    LDA $0704,X                  ; $860C  BD 04 07
    ORA #$20                     ; $860F  09 20
    STA $0704,X                  ; $8611  9D 04 07
    LDA $C3                      ; $8614  A5 C3
    LDY $071C,X                  ; $8616  BC 1C 07
    STY $C3                      ; $8619  84 C3
    BNE loc_16_8627              ; $861B  D0 0A

loc_16_861D:
    LDA $0704,X                  ; $861D  BD 04 07
    AND #$DF                     ; $8620  29 DF
    STA $0704,X                  ; $8622  9D 04 07
    LDA $C3                      ; $8625  A5 C3

loc_16_8627:
    STA $071C,X                  ; $8627  9D 1C 07

loc_16_862A:
    ASL $C3                      ; $862A  06 C3
    LDY $C3                      ; $862C  A4 C3
    LDA $8959,Y                  ; $862E  B9 59 89
    STA $C3                      ; $8631  85 C3
    LDA $895A,Y                  ; $8633  B9 5A 89

sub_16_8636:
    STA $0724,X                  ; $8636  9D 24 07
    LDA $C3                      ; $8639  A5 C3
    STA $0720,X                  ; $863B  9D 20 07
    LDY #$04                     ; $863E  A0 04
    LDA ($C5),Y                  ; $8640  B1 C5
    BMI loc_16_864C              ; $8642  30 08

sub_16_8644:
    LDA $0704,X                  ; $8644  BD 04 07
    AND #$08                     ; $8647  29 08
    BNE loc_16_864C              ; $8649  D0 01
    RTS                          ; $864B  60


loc_16_864C:
    LDA #$00                     ; $864C  A9 00
    STA $0708,X                  ; $864E  9D 08 07
    LDA $0704,X                  ; $8651  BD 04 07
    AND #$37                     ; $8654  29 37
    STA $0704,X                  ; $8656  9D 04 07
    RTS                          ; $8659  60

    CPX #$01                     ; $865A  E0 01
    BNE loc_16_8662              ; $865C  D0 04
    LDA $C3                      ; $865E  A5 C3
    BNE loc_16_866B              ; $8660  D0 09

loc_16_8662:
    LDA $070C,X                  ; $8662  BD 0C 07
    AND #$C0                     ; $8665  29 C0
    ORA $C3                      ; $8667  05 C3
    ORA #$30                     ; $8669  09 30

loc_16_866B:
    STA $070C,X                  ; $866B  9D 0C 07
    RTS                          ; $866E  60

    INC $C3                      ; $866F  E6 C3
    LDA $C3                      ; $8671  A5 C3
    CMP $0700,X                  ; $8673  DD 00 07
    BEQ loc_16_86A0              ; $8676  F0 28
    STA $0700,X                  ; $8678  9D 00 07
    TAY                          ; $867B  A8
    LDA $0704,X                  ; $867C  BD 04 07
    ORA #$08                     ; $867F  09 08
    STA $0704,X                  ; $8681  9D 04 07

sub_16_8684:
    DEY                          ; $8684  88
    LDA #$00                     ; $8685  A9 00
    STA $C3                      ; $8687  85 C3
    TYA                          ; $8689  98
    ASL A                        ; $868A  0A
    ROL $C3                      ; $868B  26 C3
    ASL A                        ; $868D  0A
    ROL $C3                      ; $868E  26 C3
    ASL A                        ; $8690  0A
    ROL $C3                      ; $8691  26 C3
    CLC                          ; $8693  18
    ADC $8A42                    ; $8694  6D 42 8A
    STA $C5                      ; $8697  85 C5
    LDA $C3                      ; $8699  A5 C3
    ADC $8A41                    ; $869B  6D 41 8A
    STA $C6                      ; $869E  85 C6

loc_16_86A0:
    RTS                          ; $86A0  60

    LDA $C3                      ; $86A1  A5 C3
    STA $0714,X                  ; $86A3  9D 14 07
    RTS                          ; $86A6  60

    LDA $C3                      ; $86A7  A5 C3
    STA $0718,X                  ; $86A9  9D 18 07
    RTS                          ; $86AC  60

    LDA $070C,X                  ; $86AD  BD 0C 07
    AND #$0F                     ; $86B0  29 0F
    ORA $C3                      ; $86B2  05 C3
    ORA #$30                     ; $86B4  09 30
    STA $070C,X                  ; $86B6  9D 0C 07
    RTS                          ; $86B9  60


sub_16_86BA:
    LDA $0710,X                  ; $86BA  BD 10 07
    STA $C4                      ; $86BD  85 C4
    LDA $0704,X                  ; $86BF  BD 04 07
    AND #$07                     ; $86C2  29 07
    JSR sub_16_8023              ; $86C4  20 23 80
    CMP ($86),Y                  ; $86C7  D1 86
    INC $86                      ; $86C9  E6 86
    JSR $0287                    ; $86CB  20 87 02
    SAX $14                      ; $86CE  87 14
    NOP #$A0                     ; $86D0  89 A0
    BRK                          ; $86D2  00
    LDA ($C5),Y                  ; $86D3  B1 C5
    TAY                          ; $86D5  A8
    LDA $C4                      ; $86D6  A5 C4
    CLC                          ; $86D8  18
    ADC $8933,Y                  ; $86D9  79 33 89
    BCS loc_16_86E2              ; $86DC  B0 04
    CMP #$F0                     ; $86DE  C9 F0
    BCC loc_16_871D              ; $86E0  90 3B

loc_16_86E2:
    LDA #$F0                     ; $86E2  A9 F0
    BNE loc_16_871A              ; $86E4  D0 34
    LDY #$01                     ; $86E6  A0 01
    LDA ($C5),Y                  ; $86E8  B1 C5
    BEQ loc_16_86FB              ; $86EA  F0 0F
    TAY                          ; $86EC  A8
    LDA $C4                      ; $86ED  A5 C4
    SEC                          ; $86EF  38
    SBC $8933,Y                  ; $86F0  F9 33 89
    BCC loc_16_86FB              ; $86F3  90 06
    LDY #$02                     ; $86F5  A0 02
    CMP ($C5),Y                  ; $86F7  D1 C5
    BCS loc_16_871D              ; $86F9  B0 22

loc_16_86FB:
    LDY #$02                     ; $86FB  A0 02
    LDA ($C5),Y                  ; $86FD  B1 C5
    JMP loc_16_871A              ; $86FF  4C 1A 87

    TXA                          ; $8702  8A
    AND #$03                     ; $8703  29 03
    CMP #$01                     ; $8705  C9 01
    BEQ loc_16_8718              ; $8707  F0 0F
    LDY #$03                     ; $8709  A0 03
    LDA ($C5),Y                  ; $870B  B1 C5
    BEQ loc_16_8720              ; $870D  F0 11
    TAY                          ; $870F  A8
    LDA $C4                      ; $8710  A5 C4
    SEC                          ; $8712  38
    SBC $8933,Y                  ; $8713  F9 33 89
    BCS loc_16_871D              ; $8716  B0 05

loc_16_8718:
    LDA #$00                     ; $8718  A9 00

loc_16_871A:
    INC $0704,X                  ; $871A  FE 04 07

loc_16_871D:
    STA $0710,X                  ; $871D  9D 10 07

loc_16_8720:
    CPX #$28                     ; $8720  E0 28
    BCC loc_16_8737              ; $8722  90 13
    LDA $CF                      ; $8724  A5 CF
    BPL loc_16_872B              ; $8726  10 03
    JMP loc_16_88A0              ; $8728  4C A0 88


loc_16_872B:
    LDA $CD                      ; $872B  A5 CD
    LDY $CC                      ; $872D  A4 CC
    BMI loc_16_8733              ; $872F  30 02
    EOR #$FF                     ; $8731  49 FF

loc_16_8733:
    CMP #$FF                     ; $8733  C9 FF
    BNE loc_16_8740              ; $8735  D0 09

loc_16_8737:
    TXA                          ; $8737  8A
    AND #$03                     ; $8738  29 03
    CMP #$01                     ; $873A  C9 01
    BNE loc_16_8760              ; $873C  D0 22
    BEQ loc_16_8752              ; $873E  F0 12

loc_16_8740:
    CPX #$29                     ; $8740  E0 29
    BNE loc_16_875B              ; $8742  D0 17
    STA $C4                      ; $8744  85 C4
    LDA $0740,X                  ; $8746  BD 40 07
    STA $C1                      ; $8749  85 C1
    JSR sub_16_8006              ; $874B  20 06 80
    LDA $C1                      ; $874E  A5 C1
    BEQ loc_16_87AA              ; $8750  F0 58

loc_16_8752:
    LDA $0710,X                  ; $8752  BD 10 07
    BEQ loc_16_87AA              ; $8755  F0 53
    LDA #$FF                     ; $8757  A9 FF
    BNE loc_16_87AA              ; $8759  D0 4F

loc_16_875B:
    CMP $0710,X                  ; $875B  DD 10 07
    BCC loc_16_8763              ; $875E  90 03

loc_16_8760:
    LDA $0710,X                  ; $8760  BD 10 07

loc_16_8763:
    LSR A                        ; $8763  4A
    LSR A                        ; $8764  4A
    LSR A                        ; $8765  4A
    LSR A                        ; $8766  4A
    EOR #$0F                     ; $8767  49 0F
    STA $C3                      ; $8769  85 C3
    LDY #$06                     ; $876B  A0 06
    LDA ($C5),Y                  ; $876D  B1 C5
    CMP #$05                     ; $876F  C9 05
    BCC loc_16_8797              ; $8771  90 24
    STA $C4                      ; $8773  85 C4
    LDY $0708,X                  ; $8775  BC 08 07
    LDA $0704,X                  ; $8778  BD 04 07
    ASL A                        ; $877B  0A
    ASL A                        ; $877C  0A
    TYA                          ; $877D  98
    BCC loc_16_8782              ; $877E  90 02
    EOR #$FF                     ; $8780  49 FF

loc_16_8782:
    BEQ loc_16_8797              ; $8782  F0 13
    STA $C1                      ; $8784  85 C1
    JSR sub_16_8006              ; $8786  20 06 80
    LDA $C1                      ; $8789  A5 C1
    LSR A                        ; $878B  4A
    LSR A                        ; $878C  4A
    CMP #$10                     ; $878D  C9 10
    BCS loc_16_87A5              ; $878F  B0 14
    CMP $C3                      ; $8791  C5 C3
    BCC loc_16_8797              ; $8793  90 02
    STA $C3                      ; $8795  85 C3

loc_16_8797:
    LDA #$10                     ; $8797  A9 10
    STA $C4                      ; $8799  85 C4
    LDA $070C,X                  ; $879B  BD 0C 07
    SEC                          ; $879E  38
    SBC $C3                      ; $879F  E5 C3
    BIT $C4                      ; $87A1  24 C4
    BNE loc_16_87AA              ; $87A3  D0 05

loc_16_87A5:
    LDA $070C,X                  ; $87A5  BD 0C 07
    AND #$F0                     ; $87A8  29 F0

loc_16_87AA:
    LDY #$00                     ; $87AA  A0 00
    JSR sub_16_80EC              ; $87AC  20 EC 80
    TXA                          ; $87AF  8A
    AND #$03                     ; $87B0  29 03
    TAY                          ; $87B2  A8
    LDA $077C,Y                  ; $87B3  B9 7C 07
    BMI loc_16_880C              ; $87B6  30 54
    LDY #$05                     ; $87B8  A0 05
    LDA ($C5),Y                  ; $87BA  B1 C5
    BEQ loc_16_880C              ; $87BC  F0 4E
    STA $C4                      ; $87BE  85 C4
    LDY $0708,X                  ; $87C0  BC 08 07
    LDA $0704,X                  ; $87C3  BD 04 07
    ASL A                        ; $87C6  0A
    ASL A                        ; $87C7  0A
    TYA                          ; $87C8  98
    BCC loc_16_87CD              ; $87C9  90 02
    EOR #$FF                     ; $87CB  49 FF

loc_16_87CD:
    BEQ loc_16_880C              ; $87CD  F0 3D
    STA $C1                      ; $87CF  85 C1
    JSR sub_16_8006              ; $87D1  20 06 80
    LDA $C1                      ; $87D4  A5 C1
    LSR A                        ; $87D6  4A
    ROR $C2                      ; $87D7  66 C2
    LSR A                        ; $87D9  4A
    ROR $C2                      ; $87DA  66 C2
    LSR A                        ; $87DC  4A
    ROR $C2                      ; $87DD  66 C2
    LSR A                        ; $87DF  4A
    ROR $C2                      ; $87E0  66 C2
    TAY                          ; $87E2  A8
    ORA $C2                      ; $87E3  05 C2
    BEQ loc_16_880C              ; $87E5  F0 25
    LDA $0704,X                  ; $87E7  BD 04 07
    BMI loc_16_87FA              ; $87EA  30 0E
    CLC                          ; $87EC  18
    LDA $C2                      ; $87ED  A5 C2
    ADC $0720,X                  ; $87EF  7D 20 07
    STA $C2                      ; $87F2  85 C2
    TYA                          ; $87F4  98
    ADC $0724,X                  ; $87F5  7D 24 07
    BNE loc_16_8809              ; $87F8  D0 0F

loc_16_87FA:
    SEC                          ; $87FA  38
    LDA $0720,X                  ; $87FB  BD 20 07
    SBC $C2                      ; $87FE  E5 C2
    STA $C2                      ; $8800  85 C2
    LDA $0724,X                  ; $8802  BD 24 07
    STY $C1                      ; $8805  84 C1
    SBC $C1                      ; $8807  E5 C1

loc_16_8809:
    TAY                          ; $8809  A8
    BNE loc_16_8814              ; $880A  D0 08

loc_16_880C:
    LDA $0720,X                  ; $880C  BD 20 07
    STA $C2                      ; $880F  85 C2
    LDY $0724,X                  ; $8811  BC 24 07

loc_16_8814:
    CPX #$28                     ; $8814  E0 28
    BCS loc_16_8835              ; $8816  B0 1D
    LDA $D6                      ; $8818  A5 D6
    BPL loc_16_8835              ; $881A  10 19
    LDA $D8                      ; $881C  A5 D8
    BEQ loc_16_8835              ; $881E  F0 15
    STA $C4                      ; $8820  85 C4
    STY $C1                      ; $8822  84 C1
    LDA $C2                      ; $8824  A5 C2
    PHA                          ; $8826  48
    JSR sub_16_8006              ; $8827  20 06 80
    PLA                          ; $882A  68
    CLC                          ; $882B  18
    ADC $C2                      ; $882C  65 C2
    STA $C2                      ; $882E  85 C2
    LDA #$00                     ; $8830  A9 00
    ADC $C1                      ; $8832  65 C1
    TAY                          ; $8834  A8

loc_16_8835:
    TXA                          ; $8835  8A
    AND #$03                     ; $8836  29 03
    BNE loc_16_8849              ; $8838  D0 0F
    TYA                          ; $883A  98
    AND #$0F                     ; $883B  29 0F
    LDY #$07                     ; $883D  A0 07
    ORA ($C5),Y                  ; $883F  11 C5
    STA $C2                      ; $8841  85 C2
    LDA #$00                     ; $8843  A9 00
    STA $C1                      ; $8845  85 C1
    BEQ loc_16_8884              ; $8847  F0 3B

loc_16_8849:
    TYA                          ; $8849  98
    LDY #$08                     ; $884A  A0 08

loc_16_884C:
    DEY                          ; $884C  88
    CMP $8953,Y                  ; $884D  D9 53 89
    BCC loc_16_884C              ; $8850  90 FA
    STA $C1                      ; $8852  85 C1
    TYA                          ; $8854  98
    CLC                          ; $8855  18
    ADC $C1                      ; $8856  65 C1
    TAY                          ; $8858  A8
    AND #$07                     ; $8859  29 07
    CLC                          ; $885B  18
    ADC #$07                     ; $885C  69 07
    STA $C1                      ; $885E  85 C1
    TYA                          ; $8860  98
    AND #$38                     ; $8861  29 38
    EOR #$38                     ; $8863  49 38
    BEQ loc_16_8870              ; $8865  F0 09

loc_16_8867:
    LSR $C1                      ; $8867  46 C1
    ROR $C2                      ; $8869  66 C2
    SEC                          ; $886B  38
    SBC #$08                     ; $886C  E9 08
    BNE loc_16_8867              ; $886E  D0 F7

loc_16_8870:
    LDY #$00                     ; $8870  A0 00
    LDA $0714,X                  ; $8872  BD 14 07
    BEQ loc_16_8884              ; $8875  F0 0D
    BPL loc_16_887A              ; $8877  10 01
    DEY                          ; $8879  88

loc_16_887A:
    CLC                          ; $887A  18
    ADC $C2                      ; $887B  65 C2
    STA $C2                      ; $887D  85 C2
    TYA                          ; $887F  98
    ADC $C1                      ; $8880  65 C1
    STA $C1                      ; $8882  85 C1

loc_16_8884:
    LDY #$02                     ; $8884  A0 02
    LDA $C2                      ; $8886  A5 C2
    JSR sub_16_80EC              ; $8888  20 EC 80
    TXA                          ; $888B  8A
    AND #$03                     ; $888C  29 03
    TAY                          ; $888E  A8
    LDA $C1                      ; $888F  A5 C1
    CMP $077C,Y                  ; $8891  D9 7C 07
    BEQ loc_16_88A0              ; $8894  F0 0A
    STA $077C,Y                  ; $8896  99 7C 07
    ORA #$08                     ; $8899  09 08
    LDY #$03                     ; $889B  A0 03
    JSR sub_16_80EC              ; $889D  20 EC 80

loc_16_88A0:
    LDA $0704,X                  ; $88A0  BD 04 07
    AND #$20                     ; $88A3  29 20
    BEQ loc_16_88FA              ; $88A5  F0 53
    LDA $0718,X                  ; $88A7  BD 18 07
    BEQ loc_16_88F2              ; $88AA  F0 46
    LDY #$00                     ; $88AC  A0 00
    ASL A                        ; $88AE  0A
    PHP                          ; $88AF  08
    BCC loc_16_88B8              ; $88B0  90 06
    EOR #$FF                     ; $88B2  49 FF
    CLC                          ; $88B4  18
    ADC #$01                     ; $88B5  69 01
    DEY                          ; $88B7  88

loc_16_88B8:
    CLC                          ; $88B8  18
    ADC $0720,X                  ; $88B9  7D 20 07
    STA $0720,X                  ; $88BC  9D 20 07
    TYA                          ; $88BF  98
    ADC $0724,X                  ; $88C0  7D 24 07
    STA $0724,X                  ; $88C3  9D 24 07
    LDA $071C,X                  ; $88C6  BD 1C 07
    ASL A                        ; $88C9  0A
    TAY                          ; $88CA  A8
    SEC                          ; $88CB  38
    LDA $0720,X                  ; $88CC  BD 20 07
    SBC $8959,Y                  ; $88CF  F9 59 89
    LDA $0724,X                  ; $88D2  BD 24 07
    AND #$3F                     ; $88D5  29 3F
    SBC $895A,Y                  ; $88D7  F9 5A 89
    LDA #$FF                     ; $88DA  A9 FF
    ADC #$00                     ; $88DC  69 00
    PLP                          ; $88DE  28
    ADC #$00                     ; $88DF  69 00
    BNE loc_16_88FA              ; $88E1  D0 17
    TXA                          ; $88E3  8A
    BEQ loc_16_88FA              ; $88E4  F0 14
    LDA $8959,Y                  ; $88E6  B9 59 89
    STA $0720,X                  ; $88E9  9D 20 07
    LDA $895A,Y                  ; $88EC  B9 5A 89
    STA $0724,X                  ; $88EF  9D 24 07

loc_16_88F2:
    LDA $0704,X                  ; $88F2  BD 04 07
    AND #$DF                     ; $88F5  29 DF
    STA $0704,X                  ; $88F7  9D 04 07

loc_16_88FA:
    LDY #$04                     ; $88FA  A0 04
    LDA ($C5),Y                  ; $88FC  B1 C5
    AND #$7F                     ; $88FE  29 7F
    BEQ loc_16_8914              ; $8900  F0 12
    CLC                          ; $8902  18
    ADC $0708,X                  ; $8903  7D 08 07
    STA $0708,X                  ; $8906  9D 08 07
    BCC loc_16_8914              ; $8909  90 09
    LDA $0704,X                  ; $890B  BD 04 07
    CLC                          ; $890E  18
    ADC #$40                     ; $890F  69 40
    STA $0704,X                  ; $8911  9D 04 07

loc_16_8914:
    RTS                          ; $8914  60

    .byte $02,$04,$08,$10,$20,$40,$80,$03,$06,$0C,$18,$30,$60,$C0,$00,$0C  ; $8915
    .byte $18,$24,$30,$3C,$48,$54,$18,$24,$30,$3C,$48,$54,$60,$6C,$00,$01  ; $8925
    .byte $02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0E,$0F,$10,$12,$13  ; $8935
    .byte $14,$16,$18,$1B,$1E,$23,$28,$30,$3C,$50,$7E,$7F,$FE,$FF,$00,$07  ; $8945
    .byte $0E,$15,$1C,$23,$2A,$31,$5C,$37,$9C,$36,$E7,$35,$3C,$35,$9B,$34  ; $8955
    .byte $02,$34,$72,$33,$EA,$32,$6A,$32,$F1,$31,$80,$31,$14,$31,$5C,$30  ; $8965
    .byte $9C,$2F,$E7,$2E,$3C,$2E,$9B,$2D,$02,$2D,$72,$2C,$EA,$2B,$6A,$2B  ; $8975
    .byte $F1,$2A,$80,$2A,$14,$2A,$5C,$29,$9C,$28,$E7,$27,$3C,$27,$9B,$26  ; $8985
    .byte $02,$26,$72,$25,$EA,$24,$6A,$24,$F1,$23,$80,$23,$14,$23,$5C,$22  ; $8995
    .byte $9C,$21,$E7,$20,$3C,$20,$9B,$1F,$02,$1F,$72,$1E,$EA,$1D,$6A,$1D  ; $89A5
    .byte $F1,$1C,$80,$1C,$14,$1C,$5C,$1B,$9C,$1A,$E7,$19,$3C,$19,$9B,$18  ; $89B5
    .byte $02,$18,$72,$17,$EA,$16,$6A,$16,$F1,$15,$80,$15,$14,$15,$5C,$14  ; $89C5
    .byte $9C,$13,$E7,$12,$3C,$12,$9B,$11,$02,$11,$72,$10,$EA,$0F,$6A,$0F  ; $89D5
    .byte $F1,$0E,$80,$0E,$14,$0E,$5C,$0D,$9C,$0C,$E7,$0B,$3C,$0B,$9B,$0A  ; $89E5
    .byte $02,$0A,$72,$09,$EA,$08,$6A,$08,$F1,$07,$80,$07,$14,$07,$5C,$06  ; $89F5
    .byte $9C,$05,$E7,$04,$3C,$04,$9B,$03,$02,$03,$72,$02,$EA,$01,$6A,$01  ; $8A05
    .byte $F1,$00,$80,$00,$14,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $8A15
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $8A25
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$39,$8A,$B5,$8C,$9D  ; $8A35
    .byte $90,$DF,$95,$9A,$9A,$06,$9C,$D7,$A0,$BE,$A4,$14,$A7,$C1,$AA,$C2  ; $8A45
    .byte $AD,$E5,$B1,$23,$B2,$CB,$B4,$16,$B5,$F6,$B8,$2B,$B9,$1E,$BE,$97  ; $8A55
    .byte $BF,$CF,$C0,$1D,$C5,$33,$C5,$4E,$C5,$B4,$C5,$C0,$C5,$DE,$C6,$22  ; $8A65
    .byte $C6,$2D,$C6,$3D,$C6,$5A,$C6,$6C,$C6,$82,$C6,$A9,$C6,$C6,$C6,$D8  ; $8A75
    .byte $C6,$F7,$C7,$0F,$C7,$33,$C7,$49,$C7,$57,$C7,$68,$C7,$76,$C7,$88  ; $8A85
    .byte $C7,$A1,$C7,$ED,$C8,$03,$C8,$14,$C8,$25,$C8,$3C,$C8,$4C,$C8,$65  ; $8A95
    .byte $C8,$87,$C8,$9A,$C8,$A6,$C9,$B3,$C9,$CA,$CB,$67,$CD,$1E,$CD,$BF  ; $8AA5
    .byte $1F,$01,$F0,$18,$80,$00,$00,$00,$1F,$01,$F0,$18,$E4,$06,$00,$00  ; $8AB5
    .byte $1E,$00,$F0,$10,$80,$00,$00,$80,$1F,$13,$90,$01,$D6,$07,$00,$00  ; $8AC5
    .byte $1F,$11,$50,$01,$E2,$00,$47,$00,$1F,$14,$F0,$04,$EE,$04,$00,$00  ; $8AD5
    .byte $1F,$19,$A0,$08,$00,$00,$00,$00,$1F,$00,$B0,$09,$E3,$02,$00,$00  ; $8AE5
    .byte $1F,$0D,$30,$01,$E3,$06,$00,$00,$1F,$1B,$A0,$05,$CB,$02,$3C,$00  ; $8AF5
    .byte $1F,$03,$50,$12,$00,$00,$00,$00,$1F,$0A,$A0,$0E,$00,$00,$00,$80  ; $8B05
    .byte $1F,$19,$50,$10,$9E,$20,$26,$00,$1D,$09,$90,$03,$CB,$01,$37,$00  ; $8B15
    .byte $1F,$1F,$E0,$1B,$9E,$58,$7C,$00,$1F,$1B,$E0,$10,$B8,$00,$1E,$00  ; $8B25
    .byte $15,$14,$F0,$04,$00,$00,$00,$00,$1A,$14,$F0,$04,$00,$00,$00,$00  ; $8B35
    .byte $1F,$17,$A0,$04,$80,$00,$00,$00,$19,$01,$D0,$02,$00,$00,$00,$00  ; $8B45
    .byte $1F,$1D,$B0,$0C,$E4,$05,$00,$00,$1A,$18,$90,$07,$00,$00,$00,$00  ; $8B55
    .byte $1F,$02,$C0,$13,$80,$00,$00,$00,$1F,$02,$C0,$15,$5D,$06,$06,$00  ; $8B65
    .byte $1F,$1E,$D0,$0A,$FF,$02,$3C,$00,$1E,$18,$90,$01,$C6,$19,$32,$00  ; $8B75
    .byte $1F,$17,$80,$06,$E4,$02,$28,$00,$1F,$17,$70,$01,$5A,$03,$00,$00  ; $8B85
    .byte $1F,$1C,$B0,$06,$00,$00,$00,$00,$1F,$1D,$B0,$0C,$00,$00,$00,$80  ; $8B95
    .byte $1F,$1A,$A0,$05,$FF,$01,$33,$00,$1E,$1A,$A0,$05,$E4,$04,$00,$00  ; $8BA5
    .byte $1F,$19,$A0,$02,$00,$00,$00,$00,$1F,$04,$80,$02,$80,$00,$00,$00  ; $8BB5
    .byte $1F,$1E,$A0,$01,$C6,$00,$32,$00,$1F,$1F,$90,$09,$FF,$00,$2D,$00  ; $8BC5
    .byte $1F,$1C,$80,$01,$00,$00,$00,$00,$1F,$1E,$A0,$02,$EF,$00,$46,$00  ; $8BD5
    .byte $17,$02,$E0,$0F,$80,$00,$00,$00,$1F,$1B,$A0,$01,$B0,$07,$62,$00  ; $8BE5
    .byte $1F,$1F,$F0,$1F,$00,$00,$00,$00,$1F,$1F,$F0,$1F,$FF,$02,$00,$00  ; $8BF5
    .byte $1F,$1F,$F0,$1F,$92,$7F,$00,$00,$1F,$1F,$F0,$1F,$E3,$7F,$00,$00  ; $8C05
    .byte $1F,$1F,$F0,$1F,$FF,$4C,$00,$00,$1F,$1F,$F0,$1F,$99,$7F,$00,$00  ; $8C15
    .byte $1D,$1F,$F0,$1F,$80,$00,$00,$00,$1F,$1F,$F0,$1F,$B7,$27,$00,$00  ; $8C25
    .byte $1F,$1F,$F0,$04,$80,$00,$00,$00,$1F,$1F,$F0,$1F,$A6,$7F,$00,$80  ; $8C35
    .byte $1F,$1F,$F0,$1F,$80,$00,$00,$80,$1F,$1C,$E0,$1F,$DA,$7F,$00,$00  ; $8C45
    .byte $1F,$1F,$F0,$1F,$FF,$0A,$00,$00,$1C,$13,$10,$1F,$FF,$7F,$00,$00  ; $8C55
    .byte $1F,$01,$00,$0F,$E3,$7F,$00,$00,$1F,$1F,$F0,$08,$00,$00,$00,$00  ; $8C65
    .byte $1F,$15,$A0,$14,$00,$00,$00,$00,$1F,$1F,$F0,$1F,$FF,$7F,$00,$00  ; $8C75
    .byte $1F,$1F,$F0,$1F,$A5,$7F,$00,$00,$1F,$1F,$F0,$1F,$D0,$16,$00,$00  ; $8C85
    .byte $1F,$1A,$A0,$07,$CF,$36,$00,$80,$00,$8C,$A6,$8E,$28,$8F,$27,$90  ; $8C95
    .byte $8F,$0A,$01,$05,$01,$11,$06,$C8,$07,$0D,$18,$40,$08,$20,$09,$01  ; $8CA5
    .byte $03,$8D,$80,$60,$66,$69,$6B,$2B,$8D,$80,$02,$60,$20,$90,$06,$BE  ; $8CB5
    .byte $8F,$80,$60,$6D,$6B,$8E,$80,$02,$80,$6D,$6B,$2B,$02,$4D,$69,$66  ; $8CC5
    .byte $60,$64,$66,$60,$69,$60,$66,$60,$69,$60,$6B,$60,$2B,$02,$4C,$6B  ; $8CD5
    .byte $69,$66,$89,$80,$37,$02,$58,$77,$75,$72,$75,$08,$00,$75,$02,$97  ; $8CE5
    .byte $08,$20,$60,$66,$68,$69,$6B,$6D,$70,$72,$60,$6D,$60,$70,$60,$72  ; $8CF5
    .byte $60,$36,$02,$01,$57,$01,$57,$40,$60,$75,$60,$72,$70,$60,$31,$02  ; $8D05
    .byte $52,$60,$71,$8D,$80,$71,$72,$60,$09,$02,$2C,$02,$4D,$69,$66,$61  ; $8D15
    .byte $03,$72,$74,$75,$01,$57,$01,$77,$06,$64,$01,$59,$01,$79,$01,$5C  ; $8D25
    .byte $01,$5C,$01,$5E,$01,$7E,$01,$03,$49,$01,$69,$01,$4B,$01,$4B,$06  ; $8D35
    .byte $78,$00,$4B,$01,$4D,$01,$6D,$8B,$89,$86,$89,$88,$81,$85,$88,$8B  ; $8D45
    .byte $8D,$91,$04,$08,$18,$40,$08,$16,$09,$01,$05,$02,$16,$6D,$6D,$6B  ; $8D55
    .byte $6D,$60,$6B,$60,$6D,$60,$6B,$60,$6D,$6D,$60,$6B,$60,$0E,$01,$8D  ; $8D65
    .byte $57,$69,$66,$68,$69,$6B,$68,$69,$6B,$6D,$69,$6B,$6D,$70,$6E,$6D  ; $8D75
    .byte $6B,$04,$08,$74,$72,$6D,$0E,$03,$8D,$86,$74,$72,$71,$6D,$04,$00  ; $8D85
    .byte $04,$00,$18,$40,$08,$1C,$09,$02,$05,$02,$2E,$92,$97,$99,$92,$9C  ; $8D95
    .byte $92,$9B,$92,$97,$9C,$92,$9B,$92,$99,$12,$00,$8D,$B8,$92,$97,$0E  ; $8DA5
    .byte $01,$8D,$95,$9C,$01,$03,$88,$01,$A8,$86,$84,$80,$81,$84,$01,$88  ; $8DB5
    .byte $01,$A8,$86,$84,$80,$83,$80,$01,$84,$01,$84,$83,$81,$80,$81,$80  ; $8DC5
    .byte $03,$97,$80,$97,$99,$80,$01,$D9,$01,$99,$04,$00,$99,$9C,$9E,$99  ; $8DD5
    .byte $03,$8B,$81,$89,$81,$88,$81,$86,$81,$84,$12,$08,$8E,$10,$86,$80  ; $8DE5
    .byte $01,$88,$01,$88,$84,$81,$03,$97,$99,$9C,$80,$03,$88,$84,$81,$03  ; $8DF5
    .byte $97,$99,$80,$99,$80,$01,$99,$0E,$01,$8D,$DF,$01,$86,$01,$A6,$88  ; $8E05
    .byte $88,$86,$88,$80,$88,$86,$88,$8D,$8D,$8B,$8D,$80,$8B,$8D,$80,$16  ; $8E15
    .byte $8D,$93,$17,$06,$C8,$07,$0A,$18,$40,$08,$20,$09,$01,$03,$89,$80  ; $8E25
    .byte $60,$66,$6D,$66,$29,$02,$01,$48,$01,$68,$80,$00,$89,$86,$84,$00  ; $8E35
    .byte $A3,$63,$64,$66,$A9,$60,$A8,$03,$92,$99,$95,$97,$92,$99,$95,$97  ; $8E45
    .byte $02,$CE,$08,$00,$03,$6E,$02,$8E,$07,$08,$08,$13,$C6,$C9,$CD,$A4  ; $8E55
    .byte $A5,$C6,$C9,$ED,$04,$00,$18,$80,$08,$16,$09,$01,$04,$00,$7E,$7E  ; $8E65
    .byte $7E,$7E,$60,$7E,$60,$7E,$60,$7E,$60,$7E,$7E,$60,$7E,$60,$0E,$01  ; $8E75
    .byte $8E,$71,$7E,$7A,$7C,$7E,$03,$68,$64,$66,$68,$69,$66,$68,$69,$6D  ; $8E85
    .byte $6B,$69,$68,$07,$0C,$08,$11,$A1,$A5,$A8,$AD,$04,$00,$02,$60,$04  ; $8E95
    .byte $00,$18,$40,$08,$1C,$07,$0A,$09,$02,$05,$02,$2E,$92,$97,$99,$92  ; $8EA5
    .byte $9C,$92,$9B,$92,$97,$9C,$92,$9B,$92,$99,$12,$00,$8E,$C9,$92,$97  ; $8EB5
    .byte $0E,$01,$8E,$A4,$9C,$40,$18,$80,$07,$0E,$08,$09,$09,$01,$04,$00  ; $8EC5
    .byte $9C,$95,$99,$95,$0E,$03,$8E,$D3,$9E,$99,$9C,$99,$9E,$99,$9C,$99  ; $8ED5
    .byte $9E,$99,$03,$88,$81,$86,$81,$84,$81,$07,$0A,$08,$13,$01,$CD,$08  ; $8EE5
    .byte $05,$01,$CD,$08,$13,$01,$CB,$08,$05,$01,$CB,$08,$13,$01,$D0,$08  ; $8EF5
    .byte $05,$01,$D0,$08,$13,$CF,$CB,$01,$C8,$08,$05,$01,$C8,$08,$13,$01  ; $8F05
    .byte $C6,$08,$05,$01,$C6,$08,$13,$01,$C1,$08,$05,$C1,$01,$E1,$16,$8E  ; $8F15
    .byte $A0,$17,$06,$FF,$08,$02,$09,$02,$D2,$02,$B0,$70,$72,$01,$AB,$01  ; $8F25
    .byte $6B,$6D,$60,$CE,$71,$D2,$D0,$02,$CE,$6E,$02,$90,$D2,$02,$B0,$70  ; $8F35
    .byte $72,$02,$AB,$60,$6C,$CD,$02,$B2,$72,$71,$02,$B0,$70,$6F,$CE,$D9  ; $8F45
    .byte $09,$03,$06,$C8,$62,$62,$62,$62,$60,$62,$60,$62,$60,$62,$60,$62  ; $8F55
    .byte $62,$60,$62,$60,$64,$64,$64,$64,$60,$64,$60,$64,$60,$64,$60,$64  ; $8F65
    .byte $64,$60,$64,$60,$A6,$A8,$A9,$AB,$06,$E6,$08,$0E,$94,$60,$94,$60  ; $8F75
    .byte $94,$60,$94,$60,$76,$76,$96,$04,$00,$04,$00,$06,$C8,$08,$02,$66  ; $8F85
    .byte $60,$66,$66,$06,$F0,$08,$0E,$92,$06,$C8,$08,$02,$66,$66,$0E,$07  ; $8F95
    .byte $8F,$8E,$04,$00,$69,$60,$69,$69,$06,$F0,$08,$0E,$92,$08,$02,$06  ; $8FA5
    .byte $C8,$69,$69,$0E,$01,$8F,$A7,$04,$00,$6B,$60,$6B,$6B,$08,$0E,$06  ; $8FB5
    .byte $F0,$92,$08,$02,$06,$C8,$6B,$6B,$0E,$01,$8F,$BC,$04,$00,$61,$60  ; $8FC5
    .byte $61,$61,$08,$0E,$06,$F0,$92,$08,$02,$06,$C8,$61,$61,$0E,$02,$8F  ; $8FD5
    .byte $D1,$08,$0E,$06,$E6,$76,$76,$91,$76,$76,$91,$04,$00,$08,$02,$06  ; $8FE5
    .byte $C8,$69,$60,$69,$69,$08,$0E,$06,$F0,$92,$08,$02,$06,$C8,$69,$69  ; $8FF5
    .byte $0E,$01,$8F,$F0,$04,$00,$6B,$60,$6B,$6B,$08,$0E,$06,$F0,$92,$08  ; $9005
    .byte $02,$06,$C8,$6B,$6B,$0E,$01,$90,$09,$04,$00,$6D,$60,$6D,$6D,$08  ; $9015
    .byte $0E,$06,$F0,$92,$08,$02,$06,$C8,$6D,$6D,$0E,$02,$90,$1E,$6B,$60  ; $9025
    .byte $6B,$6B,$08,$0E,$06,$F0,$92,$08,$02,$06,$C8,$6B,$6B,$04,$00,$69  ; $9035
    .byte $60,$69,$69,$08,$0E,$06,$F0,$92,$08,$02,$06,$F0,$69,$69,$0E,$01  ; $9045
    .byte $90,$42,$04,$00,$6B,$60,$6B,$6B,$08,$0E,$06,$F0,$92,$08,$02,$06  ; $9055
    .byte $C8,$6B,$6B,$0E,$01,$90,$57,$04,$00,$61,$60,$61,$61,$08,$0E,$06  ; $9065
    .byte $F0,$92,$08,$02,$06,$C8,$61,$61,$0E,$02,$90,$6C,$08,$0E,$06,$F0  ; $9075
    .byte $60,$96,$60,$96,$76,$76,$16,$8F,$8C,$17,$06,$C8,$08,$0C,$07,$0C  ; $9085
    .byte $04,$00,$E0,$0E,$07,$90,$95,$04,$00,$68,$68,$68,$68,$60,$68,$60  ; $9095
    .byte $68,$60,$68,$60,$68,$68,$60,$68,$60,$0E,$01,$90,$9C,$AB,$AB,$AB  ; $90A5
    .byte $AB,$04,$00,$6C,$68,$65,$0E,$03,$90,$B6,$6C,$68,$65,$68,$04,$00  ; $90B5
    .byte $04,$00,$63,$60,$6F,$6F,$68,$60,$6F,$6F,$0E,$1E,$90,$C5,$63,$68  ; $90C5
    .byte $6C,$6A,$68,$6C,$6A,$68,$16,$90,$C3,$17,$00,$90,$E8,$92,$31,$93  ; $90D5
    .byte $91,$94,$B1,$0A,$03,$05,$01,$EB,$06,$96,$07,$0B,$18,$C0,$08,$1C  ; $90E5
    .byte $04,$00,$60,$74,$97,$99,$97,$99,$77,$99,$80,$74,$60,$74,$97,$99  ; $90F5
    .byte $97,$99,$77,$99,$7A,$79,$77,$0E,$04,$90,$F5,$07,$09,$18,$80,$09  ; $9105
    .byte $02,$60,$74,$76,$77,$79,$77,$76,$77,$7B,$79,$7B,$7E,$03,$68,$6B  ; $9115
    .byte $6D,$08,$11,$06,$FF,$01,$6F,$01,$EF,$04,$00,$18,$40,$04,$00,$07  ; $9125
    .byte $0C,$09,$01,$08,$1C,$06,$64,$60,$02,$03,$88,$86,$83,$02,$86,$88  ; $9135
    .byte $02,$80,$60,$02,$88,$86,$88,$8B,$8A,$88,$86,$01,$C3,$12,$48,$91  ; $9145
    .byte $89,$08,$05,$C3,$02,$01,$A3,$08,$1C,$03,$8F,$90,$92,$94,$96,$02  ; $9155
    .byte $B9,$9B,$01,$D7,$08,$05,$02,$01,$B7,$08,$1C,$97,$99,$97,$96,$97  ; $9165
    .byte $01,$DB,$08,$05,$01,$DB,$08,$1C,$01,$DE,$08,$05,$01,$DE,$18,$80  ; $9175
    .byte $0E,$01,$91,$32,$08,$1C,$01,$83,$63,$64,$86,$81,$06,$96,$C3,$03  ; $9185
    .byte $B7,$B9,$01,$DB,$01,$9B,$B9,$97,$D9,$B7,$B9,$DB,$DF,$03,$CA,$01  ; $9195
    .byte $AD,$01,$8D,$08,$1C,$09,$01,$18,$C0,$07,$0A,$01,$84,$04,$00,$9C  ; $91A5
    .byte $9B,$9C,$03,$88,$02,$8B,$02,$8F,$84,$80,$83,$84,$88,$8B,$AF,$12  ; $91B5
    .byte $08,$91,$D9,$8D,$80,$8A,$02,$01,$C6,$02,$C6,$01,$66,$60,$01,$84  ; $91C5
    .byte $0E,$01,$91,$B2,$92,$80,$8D,$02,$01,$CF,$06,$F0,$01,$EF,$18,$40  ; $91D5
    .byte $07,$08,$60,$02,$8F,$8D,$8B,$8D,$8B,$02,$8A,$68,$09,$02,$08,$16  ; $91E5
    .byte $60,$02,$88,$86,$83,$86,$83,$02,$81,$01,$63,$01,$E3,$60,$02,$88  ; $91F5
    .byte $86,$88,$8B,$8A,$88,$66,$01,$68,$08,$00,$01,$E8,$60,$02,$8B,$8A  ; $9205
    .byte $88,$8A,$88,$A6,$E3,$09,$00,$06,$96,$63,$02,$80,$63,$02,$80,$63  ; $9215
    .byte $02,$80,$09,$01,$63,$60,$66,$60,$16,$91,$2E,$17,$06,$FF,$07,$0B  ; $9225
    .byte $08,$00,$09,$02,$E0,$E0,$E0,$E0,$04,$00,$09,$03,$18,$80,$08,$1C  ; $9235
    .byte $74,$60,$6F,$60,$72,$60,$73,$74,$60,$74,$6F,$60,$72,$60,$73,$60  ; $9245
    .byte $0E,$05,$92,$3D,$0C,$00,$07,$09,$60,$74,$72,$6F,$72,$6F,$6D,$6B  ; $9255
    .byte $6D,$6B,$68,$66,$68,$63,$66,$01,$6F,$01,$CF,$00,$6F,$72,$74,$77  ; $9265
    .byte $7B,$7E,$03,$68,$6B,$6F,$72,$74,$77,$04,$08,$04,$08,$04,$08,$07  ; $9275
    .byte $0A,$09,$01,$18,$80,$08,$04,$04,$08,$74,$60,$6B,$60,$6F,$60,$6B  ; $9285
    .byte $74,$60,$74,$6B,$60,$6F,$60,$6B,$60,$0E,$01,$92,$8C,$04,$08,$6F  ; $9295
    .byte $60,$68,$60,$6B,$60,$68,$6F,$60,$6F,$68,$60,$6B,$60,$68,$60,$0E  ; $92A5
    .byte $01,$92,$A2,$6F,$60,$6B,$60,$6D,$60,$6B,$6F,$60,$6F,$6B,$60,$6D  ; $92B5
    .byte $60,$6B,$60,$6F,$60,$68,$60,$6B,$60,$68,$6F,$60,$6F,$68,$60,$6B  ; $92C5
    .byte $60,$68,$60,$73,$60,$6F,$60,$70,$60,$6F,$73,$60,$73,$6F,$60,$70  ; $92D5
    .byte $60,$6F,$60,$14,$08,$93,$05,$07,$0B,$08,$00,$AF,$AF,$AF,$00,$52  ; $92E5
    .byte $51,$4F,$4D,$4C,$4A,$48,$46,$45,$43,$41,$03,$58,$10,$01,$92,$82  ; $92F5
    .byte $07,$0A,$08,$16,$A3,$A3,$A3,$86,$18,$C0,$06,$FF,$08,$1C,$09,$01  ; $9305
    .byte $0C,$02,$01,$84,$01,$84,$83,$84,$88,$02,$8B,$02,$8F,$84,$80,$83  ; $9315
    .byte $84,$88,$8B,$AF,$8D,$80,$8A,$02,$01,$C6,$02,$C6,$01,$66,$60,$01  ; $9325
    .byte $84,$01,$84,$83,$84,$88,$02,$8B,$02,$8F,$84,$80,$83,$84,$88,$8B  ; $9335
    .byte $AF,$92,$80,$8D,$02,$01,$CF,$06,$C8,$01,$EF,$06,$F0,$08,$16,$09  ; $9345
    .byte $01,$04,$00,$07,$08,$60,$02,$03,$8F,$8D,$8B,$8D,$8B,$02,$8A,$12  ; $9355
    .byte $08,$93,$74,$0C,$00,$01,$68,$01,$C8,$A8,$A7,$0E,$02,$93,$56,$68  ; $9365
    .byte $60,$02,$88,$86,$83,$86,$83,$A1,$08,$00,$E3,$60,$02,$8F,$60,$02  ; $9375
    .byte $8F,$60,$02,$8F,$6F,$60,$72,$60,$16,$92,$7E,$17,$04,$00,$06,$96  ; $9385
    .byte $08,$02,$09,$02,$04,$00,$60,$74,$97,$99,$97,$99,$77,$99,$80,$74  ; $9395
    .byte $60,$74,$97,$99,$97,$99,$77,$99,$7A,$79,$77,$0E,$01,$93,$99,$04  ; $93A5
    .byte $48,$08,$02,$09,$02,$06,$FF,$CA,$08,$1B,$AA,$01,$8A,$08,$02,$88  ; $93B5
    .byte $01,$CB,$08,$1B,$01,$CB,$0E,$02,$93,$B4,$06,$96,$09,$02,$08,$02  ; $93C5
    .byte $60,$68,$66,$63,$66,$63,$61,$03,$77,$79,$77,$74,$72,$74,$72,$70  ; $93D5
    .byte $01,$74,$01,$D4,$94,$74,$03,$68,$03,$74,$6F,$72,$73,$04,$00,$04  ; $93E5
    .byte $00,$04,$00,$94,$8F,$92,$73,$94,$74,$8F,$92,$93,$0E,$02,$93,$F6  ; $93F5
    .byte $8F,$8F,$94,$6F,$8F,$75,$90,$92,$94,$90,$8B,$8D,$6F,$90,$70,$8B  ; $9405
    .byte $8D,$8F,$95,$90,$91,$73,$95,$75,$90,$91,$93,$8F,$92,$94,$97,$99  ; $9415
    .byte $9B,$9E,$9F,$13,$00,$94,$36,$AF,$AF,$AF,$02,$92,$74,$0F,$01,$93  ; $9425
    .byte $F4,$AF,$AF,$AF,$02,$92,$01,$70,$02,$01,$90,$70,$90,$8D,$8F,$9B  ; $9435
    .byte $90,$01,$90,$01,$70,$70,$90,$90,$8D,$8F,$9B,$90,$8F,$02,$80,$6F  ; $9445
    .byte $8F,$8D,$8F,$9B,$8F,$01,$95,$01,$75,$75,$95,$94,$94,$92,$92,$91  ; $9455
    .byte $90,$02,$80,$70,$90,$8D,$8F,$9B,$90,$01,$90,$01,$70,$70,$90,$90  ; $9465
    .byte $8D,$8F,$9B,$90,$8F,$80,$8F,$92,$8F,$93,$8F,$96,$8F,$BB,$BB,$BB  ; $9475
    .byte $BB,$04,$00,$60,$74,$94,$92,$73,$02,$94,$02,$AF,$90,$9C,$90,$9C  ; $9485
    .byte $92,$9E,$8F,$9B,$0E,$01,$94,$86,$B4,$B4,$B3,$B3,$B2,$B2,$B0,$B0  ; $9495
    .byte $EF,$60,$BB,$BB,$02,$9B,$9B,$9B,$16,$93,$F2,$17,$06,$C8,$07,$0A  ; $94A5
    .byte $08,$0C,$04,$00,$A3,$0E,$06,$94,$B7,$63,$68,$68,$68,$A3,$A3,$A3  ; $94B5
    .byte $A3,$63,$08,$03,$02,$89,$08,$0C,$87,$87,$85,$65,$65,$63,$68,$68  ; $94C5
    .byte $68,$04,$00,$04,$00,$A3,$0E,$06,$94,$D8,$63,$68,$68,$68,$0F,$02  ; $94D5
    .byte $94,$D6,$63,$04,$00,$07,$0C,$66,$0E,$0A,$94,$E8,$68,$68,$68,$6A  ; $94E5
    .byte $A6,$63,$60,$63,$63,$6A,$60,$60,$60,$63,$6C,$6C,$6C,$04,$00,$04  ; $94F5
    .byte $00,$63,$60,$6F,$6F,$63,$6C,$60,$6F,$63,$6F,$6D,$60,$63,$6F,$6F  ; $9505
    .byte $6F,$0E,$06,$95,$04,$63,$60,$6C,$6C,$63,$60,$6C,$6C,$66,$66,$60  ; $9515
    .byte $66,$63,$6C,$6C,$60,$04,$00,$66,$60,$6C,$6C,$63,$6C,$60,$6C,$66  ; $9525
    .byte $6C,$6D,$60,$63,$6C,$6C,$60,$0E,$05,$95,$2A,$66,$60,$6C,$6C,$63  ; $9535
    .byte $60,$60,$60,$66,$6C,$6D,$60,$63,$6C,$6C,$6C,$66,$60,$6C,$6C,$63  ; $9545
    .byte $6C,$60,$6C,$66,$6C,$6D,$60,$63,$60,$60,$63,$04,$00,$66,$60,$63  ; $9555
    .byte $6C,$63,$6C,$6D,$66,$6C,$60,$65,$6C,$63,$60,$6C,$63,$0E,$0D,$95  ; $9565
    .byte $60,$66,$60,$6C,$6C,$63,$6C,$60,$66,$63,$6C,$6D,$60,$63,$6D,$60  ; $9575
    .byte $63,$63,$6D,$60,$60,$63,$6D,$60,$60,$63,$6D,$60,$60,$63,$60,$6A  ; $9585
    .byte $60,$16,$95,$02,$17,$00,$95,$A3,$96,$EB,$98,$47,$99,$93,$0A,$04  ; $9595
    .byte $18,$40,$05,$01,$EB,$08,$1D,$07,$0A,$06,$E6,$03,$96,$80,$96,$80  ; $95A5
    .byte $09,$01,$8D,$80,$8D,$8F,$04,$00,$18,$C0,$80,$79,$78,$79,$7B,$80  ; $95B5
    .byte $79,$78,$79,$7B,$A0,$0E,$01,$95,$BB,$02,$9F,$02,$03,$88,$01,$8A  ; $95C5
    .byte $CA,$01,$8A,$6F,$80,$6F,$80,$6F,$80,$6F,$80,$6F,$60,$04,$00,$07  ; $95D5
    .byte $08,$06,$FF,$09,$02,$08,$16,$B3,$02,$9A,$01,$BB,$08,$17,$02,$01  ; $95E5
    .byte $9B,$08,$16,$73,$60,$97,$76,$60,$76,$74,$60,$01,$B4,$08,$17,$94  ; $95F5
    .byte $02,$01,$94,$08,$16,$BD,$02,$9B,$01,$BA,$08,$17,$02,$01,$9A,$08  ; $9605
    .byte $16,$76,$74,$73,$60,$73,$60,$73,$74,$60,$01,$B6,$08,$17,$96,$02  ; $9615
    .byte $01,$96,$06,$E6,$08,$16,$01,$97,$08,$17,$01,$B7,$08,$16,$77,$79  ; $9625
    .byte $02,$9B,$02,$99,$97,$02,$96,$02,$93,$01,$AF,$08,$17,$AF,$01,$8F  ; $9635
    .byte $08,$16,$02,$94,$02,$96,$B8,$9B,$9A,$98,$02,$9A,$02,$9B,$01,$BD  ; $9645
    .byte $08,$17,$BD,$01,$9D,$07,$0A,$06,$96,$08,$0B,$80,$9B,$9B,$9B,$06  ; $9655
    .byte $E6,$02,$9B,$02,$9A,$96,$80,$06,$96,$99,$99,$99,$06,$E6,$02,$99  ; $9665
    .byte $02,$98,$94,$80,$7D,$60,$9D,$9B,$02,$9F,$02,$98,$01,$9B,$01,$9B  ; $9675
    .byte $03,$6A,$60,$68,$60,$67,$60,$02,$85,$02,$83,$83,$80,$68,$60,$88  ; $9685
    .byte $87,$02,$85,$02,$83,$83,$80,$67,$60,$87,$88,$02,$88,$02,$03,$98  ; $9695
    .byte $98,$80,$03,$6A,$60,$8A,$88,$02,$87,$02,$85,$83,$85,$83,$85,$02  ; $96A5
    .byte $A7,$85,$83,$04,$08,$06,$C8,$6A,$60,$66,$60,$63,$66,$60,$68,$60  ; $96B5
    .byte $6A,$60,$02,$88,$12,$08,$96,$D3,$66,$68,$0E,$01,$96,$B8,$09,$01  ; $96C5
    .byte $6A,$6D,$6F,$60,$6D,$60,$6A,$6D,$60,$6F,$60,$6F,$6F,$60,$6F,$60  ; $96D5
    .byte $6F,$60,$16,$95,$E2,$17,$18,$40,$08,$1D,$06,$E6,$07,$0A,$03,$94  ; $96E5
    .byte $80,$94,$80,$94,$80,$94,$96,$04,$00,$09,$01,$08,$1D,$80,$03,$68  ; $96F5
    .byte $67,$68,$6A,$80,$68,$67,$68,$6A,$A0,$0E,$01,$96,$FC,$08,$1C,$80  ; $9705
    .byte $6F,$60,$74,$60,$6F,$60,$02,$8D,$6F,$80,$6F,$60,$72,$60,$6F,$60  ; $9715
    .byte $6D,$6F,$60,$02,$01,$8F,$08,$17,$02,$01,$AF,$04,$00,$04,$00,$07  ; $9725
    .byte $0C,$09,$00,$06,$E6,$18,$00,$08,$0F,$80,$03,$6F,$60,$6F,$6A,$80  ; $9735
    .byte $6F,$60,$6F,$6A,$A0,$12,$08,$97,$68,$80,$6F,$60,$6F,$68,$80,$6F  ; $9745
    .byte $60,$6F,$68,$A0,$80,$6F,$60,$6F,$71,$80,$6F,$60,$6F,$71,$A0,$0E  ; $9755
    .byte $01,$97,$32,$09,$00,$07,$08,$18,$80,$08,$13,$CF,$D1,$D3,$D4,$18  ; $9765
    .byte $40,$07,$0C,$08,$1C,$80,$73,$74,$76,$8F,$60,$73,$74,$76,$8F,$02  ; $9775
    .byte $80,$80,$71,$73,$74,$76,$60,$76,$60,$76,$60,$74,$93,$91,$07,$0B  ; $9785
    .byte $09,$01,$08,$09,$18,$C0,$04,$00,$04,$00,$7B,$7B,$03,$6A,$6A,$6F  ; $9795
    .byte $6F,$76,$76,$0E,$01,$97,$9D,$13,$08,$97,$E6,$04,$00,$74,$74,$7B  ; $97A5
    .byte $7B,$03,$68,$68,$6F,$6F,$0E,$01,$97,$B0,$04,$00,$78,$78,$7D,$7D  ; $97B5
    .byte $03,$6C,$6C,$71,$71,$0E,$01,$97,$BF,$03,$74,$74,$7B,$7B,$03,$68  ; $97C5
    .byte $68,$6F,$6F,$03,$76,$76,$7B,$7B,$03,$6A,$6A,$6F,$6F,$0F,$01,$97  ; $97D5
    .byte $9B,$04,$00,$74,$74,$7B,$7B,$03,$68,$68,$6F,$6F,$0E,$01,$97,$E6  ; $97E5
    .byte $04,$00,$76,$76,$7B,$7B,$03,$6A,$6A,$6F,$6F,$0E,$01,$97,$F5,$04  ; $97F5
    .byte $00,$78,$78,$7D,$7D,$03,$6C,$6C,$71,$71,$0E,$01,$98,$04,$09,$00  ; $9805
    .byte $06,$64,$18,$C0,$08,$0B,$04,$08,$6F,$6F,$6D,$60,$6F,$60,$6D,$6F  ; $9815
    .byte $60,$72,$60,$71,$60,$6F,$60,$6D,$0E,$01,$98,$1B,$6F,$6F,$6D,$60  ; $9825
    .byte $6F,$6D,$60,$6F,$60,$09,$01,$66,$66,$60,$66,$60,$66,$60,$16,$97  ; $9835
    .byte $30,$17,$08,$02,$07,$0C,$06,$C8,$09,$02,$8F,$80,$8F,$80,$92,$80  ; $9845
    .byte $92,$94,$80,$09,$03,$83,$87,$83,$88,$87,$85,$83,$80,$83,$8A,$83  ; $9855
    .byte $88,$81,$82,$83,$80,$83,$87,$83,$88,$87,$85,$83,$80,$83,$8A,$83  ; $9865
    .byte $87,$81,$82,$83,$04,$00,$09,$03,$63,$60,$63,$63,$63,$60,$63,$63  ; $9875
    .byte $63,$60,$63,$63,$63,$60,$63,$63,$68,$60,$68,$68,$68,$60,$68,$68  ; $9885
    .byte $68,$60,$68,$68,$68,$60,$68,$68,$6A,$60,$6A,$6A,$6A,$60,$6A,$6A  ; $9895
    .byte $6A,$60,$6A,$6A,$6A,$60,$6A,$6A,$63,$60,$63,$63,$63,$60,$63,$63  ; $98A5
    .byte $63,$60,$63,$63,$63,$60,$63,$63,$68,$60,$68,$68,$68,$60,$68,$68  ; $98B5
    .byte $68,$60,$68,$68,$68,$60,$68,$68,$67,$60,$67,$67,$67,$60,$67,$67  ; $98C5
    .byte $67,$60,$67,$67,$67,$60,$67,$67,$65,$60,$65,$65,$65,$60,$65,$65  ; $98D5
    .byte $65,$60,$65,$65,$65,$60,$65,$65,$6A,$60,$6A,$6A,$6A,$60,$6A,$6A  ; $98E5
    .byte $6A,$60,$6A,$6A,$6A,$60,$6A,$6A,$83,$60,$83,$60,$01,$63,$01,$63  ; $98F5
    .byte $83,$82,$09,$02,$8A,$8E,$94,$60,$94,$60,$01,$74,$01,$74,$94,$93  ; $9905
    .byte $8F,$93,$8C,$60,$8C,$60,$01,$6C,$01,$6C,$8C,$8F,$91,$8C,$94,$60  ; $9915
    .byte $94,$60,$01,$74,$01,$74,$96,$94,$93,$91,$8F,$60,$8F,$60,$01,$6F  ; $9925
    .byte $01,$6F,$8F,$8E,$8A,$8E,$94,$60,$94,$60,$01,$74,$01,$74,$94,$93  ; $9935
    .byte $8F,$93,$8A,$60,$8A,$60,$01,$6A,$01,$6A,$8A,$91,$94,$96,$8C,$60  ; $9945
    .byte $8C,$60,$01,$6C,$01,$6C,$8F,$91,$8F,$8C,$72,$60,$72,$60,$72,$72  ; $9955
    .byte $60,$72,$60,$72,$60,$72,$72,$60,$72,$60,$74,$60,$74,$60,$74,$74  ; $9965
    .byte $60,$74,$60,$74,$60,$74,$74,$60,$74,$60,$6F,$60,$6F,$60,$6F,$6F  ; $9975
    .byte $60,$6F,$60,$6F,$6F,$60,$6F,$60,$6F,$60,$16,$98,$79,$17,$08,$0C  ; $9985
    .byte $07,$0A,$06,$96,$A9,$A9,$A9,$88,$88,$04,$00,$06,$C8,$63,$60,$6C  ; $9995
    .byte $6C,$68,$6C,$60,$6C,$63,$60,$6C,$6C,$68,$6C,$6C,$60,$0E,$03,$99  ; $99A5
    .byte $9E,$04,$00,$04,$00,$06,$C8,$63,$60,$6C,$6C,$68,$6C,$60,$6C,$63  ; $99B5
    .byte $60,$6C,$6C,$68,$6C,$6C,$60,$0E,$07,$99,$B8,$04,$00,$06,$F0,$63  ; $99C5
    .byte $6F,$6D,$6F,$68,$6F,$6D,$6F,$0E,$0F,$99,$D0,$04,$00,$63,$6F,$63  ; $99D5
    .byte $6F,$68,$63,$60,$63,$12,$00,$99,$FA,$63,$68,$6F,$6F,$68,$6F,$6D  ; $99E5
    .byte $6F,$0E,$02,$99,$E0,$60,$68,$68,$60,$68,$60,$68,$60,$16,$99,$B6  ; $99F5
    .byte $17,$00,$9A,$0F,$9A,$EA,$9B,$DA,$9C,$5B,$0A,$05,$05,$03,$00,$07  ; $9A05
    .byte $0A,$04,$08,$04,$08,$06,$AA,$08,$0B,$18,$80,$09,$01,$A8,$8B,$AF  ; $9A15
    .byte $AF,$88,$A7,$8A,$B0,$B0,$87,$0E,$01,$9A,$18,$04,$00,$07,$0C,$18  ; $9A25
    .byte $40,$08,$1A,$0D,$00,$80,$03,$88,$8B,$8D,$80,$8D,$80,$8D,$80,$6F  ; $9A35
    .byte $6D,$8B,$80,$AD,$8B,$6D,$60,$12,$08,$9A,$63,$80,$02,$AB,$4C,$AD  ; $9A45
    .byte $8D,$02,$01,$6B,$0D,$0C,$02,$CB,$01,$A8,$0E,$03,$9A,$30,$80,$02  ; $9A55
    .byte $AB,$4F,$B0,$90,$02,$01,$6F,$01,$EF,$04,$08,$07,$06,$18,$C0,$08  ; $9A65
    .byte $11,$06,$FF,$E8,$EB,$01,$ED,$08,$01,$02,$01,$CD,$08,$11,$8B,$8D  ; $9A75
    .byte $EB,$E8,$01,$E3,$08,$01,$01,$E3,$0E,$01,$9A,$6E,$18,$80,$08,$11  ; $9A85
    .byte $ED,$01,$F0,$F0,$08,$05,$02,$01,$D0,$90,$92,$08,$11,$01,$F4,$08  ; $9A95
    .byte $05,$01,$D4,$08,$11,$D7,$F6,$F2,$01,$F4,$08,$01,$F4,$01,$F4,$02  ; $9AA5
    .byte $C0,$07,$0A,$08,$0B,$06,$DC,$18,$C0,$92,$90,$8F,$80,$88,$8D,$80  ; $9AB5
    .byte $8D,$80,$88,$8B,$6D,$6B,$88,$8D,$80,$8D,$80,$88,$09,$02,$18,$40  ; $9AC5
    .byte $88,$80,$8B,$8D,$80,$8D,$80,$88,$8B,$6D,$6B,$88,$8D,$80,$8D,$80  ; $9AD5
    .byte $88,$16,$9A,$16,$17,$04,$48,$06,$DC,$07,$09,$18,$80,$08,$07,$09  ; $9AE5
    .byte $01,$04,$48,$EF,$0D,$14,$01,$EE,$0E,$01,$9A,$F6,$04,$00,$07,$0C  ; $9AF5
    .byte $08,$1A,$0D,$00,$80,$9B,$03,$88,$88,$80,$88,$80,$88,$80,$68,$67  ; $9B05
    .byte $86,$80,$A8,$86,$88,$12,$08,$9B,$2F,$80,$02,$A6,$A8,$88,$01,$86  ; $9B15
    .byte $0D,$0C,$02,$C6,$01,$A3,$0E,$03,$9B,$01,$0D,$00,$80,$02,$A6,$A8  ; $9B25
    .byte $88,$01,$87,$01,$E7,$04,$40,$07,$08,$18,$40,$08,$07,$06,$FF,$FB  ; $9B35
    .byte $08,$05,$01,$FB,$08,$11,$01,$03,$E9,$08,$01,$01,$E9,$08,$00,$18  ; $9B45
    .byte $C0,$06,$DC,$80,$83,$84,$87,$88,$8A,$80,$01,$8B,$01,$AB,$00,$8A  ; $9B55
    .byte $8B,$8A,$00,$A8,$87,$01,$88,$E8,$08,$01,$01,$E8,$0E,$01,$9B,$3A  ; $9B65
    .byte $08,$11,$06,$FF,$E8,$ED,$01,$EE,$08,$05,$01,$EE,$08,$12,$06,$DC  ; $9B75
    .byte $09,$00,$07,$0C,$80,$8F,$90,$92,$B4,$92,$01,$90,$02,$01,$D0,$01  ; $9B85
    .byte $8F,$90,$01,$EF,$CB,$C8,$A0,$AD,$AF,$B0,$92,$94,$80,$95,$80,$97  ; $9B95
    .byte $80,$09,$01,$01,$8D,$01,$8D,$8B,$AD,$8B,$AD,$8B,$08,$17,$02,$CD  ; $9BA5
    .byte $08,$12,$8B,$89,$07,$08,$06,$FF,$01,$E8,$01,$E8,$08,$00,$03,$94  ; $9BB5
    .byte $80,$97,$99,$80,$99,$80,$94,$97,$79,$77,$74,$60,$99,$80,$99,$80  ; $9BC5
    .byte $94,$16,$9A,$EA,$17,$06,$64,$07,$0E,$08,$02,$09,$02,$04,$00,$04  ; $9BD5
    .byte $00,$A8,$8B,$AF,$AF,$88,$A7,$8A,$B0,$B0,$87,$0E,$08,$9B,$E4,$80  ; $9BE5
    .byte $02,$A7,$A9,$89,$01,$8A,$06,$FF,$01,$EA,$04,$00,$06,$64,$A8,$8B  ; $9BF5
    .byte $AF,$AF,$88,$A7,$8A,$B0,$B0,$87,$0E,$07,$9B,$FF,$AD,$90,$B4,$B4  ; $9C05
    .byte $8D,$AC,$8F,$B4,$B4,$8C,$04,$00,$A9,$8D,$B2,$B2,$89,$0E,$01,$9C  ; $9C15
    .byte $1B,$04,$00,$AD,$90,$B4,$B4,$8D,$0E,$01,$9C,$26,$04,$00,$AB,$90  ; $9C25
    .byte $B4,$B4,$8B,$0E,$01,$9C,$31,$04,$00,$A9,$8D,$B0,$B0,$89,$0E,$03  ; $9C35
    .byte $9C,$3C,$04,$00,$A8,$8B,$AF,$AF,$88,$A7,$8A,$B0,$B0,$87,$0E,$01  ; $9C45
    .byte $9C,$47,$16,$9B,$E2,$17,$07,$0B,$08,$0C,$04,$00,$04,$00,$04,$00  ; $9C55
    .byte $06,$C8,$83,$8F,$88,$83,$8F,$83,$06,$FF,$8C,$06,$C8,$83,$8F,$83  ; $9C65
    .byte $06,$FF,$8C,$06,$C8,$83,$83,$83,$88,$8F,$0E,$08,$9C,$63,$80,$88  ; $9C75
    .byte $81,$88,$88,$81,$88,$88,$80,$68,$68,$68,$60,$68,$60,$88,$88,$88  ; $9C85
    .byte $88,$04,$08,$8D,$03,$8F,$88,$83,$8F,$83,$06,$FF,$8C,$06,$C8,$83  ; $9C95
    .byte $8F,$83,$06,$FF,$8C,$06,$C8,$83,$83,$83,$88,$8F,$0E,$0D,$9C,$96  ; $9CA5
    .byte $04,$00,$88,$83,$8F,$88,$80,$8F,$88,$83,$0E,$01,$9C,$B5,$83,$83  ; $9CB5
    .byte $88,$83,$83,$88,$8D,$83,$83,$83,$88,$83,$88,$88,$88,$88,$16,$9C  ; $9CC5
    .byte $5F,$17,$00,$9C,$E0,$9D,$F3,$9F,$57,$A0,$4E,$0A,$02,$04,$08,$05  ; $9CD5
    .byte $01,$EB,$06,$78,$07,$0A,$18,$40,$08,$07,$09,$01,$04,$08,$04,$08  ; $9CE5
    .byte $88,$88,$6B,$88,$8D,$8F,$06,$FF,$02,$8D,$06,$78,$6B,$6A,$0E,$01  ; $9CF5
    .byte $9C,$F3,$13,$08,$9D,$22,$88,$8B,$6A,$86,$88,$8B,$6A,$8A,$86,$84  ; $9D05
    .byte $86,$68,$8F,$02,$01,$AA,$02,$01,$8A,$0F,$01,$9C,$F1,$88,$8B,$6A  ; $9D15
    .byte $8D,$8B,$8B,$6F,$8D,$90,$8F,$92,$77,$96,$02,$01,$B4,$02,$01,$94  ; $9D25
    .byte $04,$08,$07,$0B,$18,$C0,$08,$12,$88,$86,$68,$86,$88,$02,$80,$68  ; $9D35
    .byte $6A,$6B,$6F,$AD,$02,$8A,$02,$86,$80,$A0,$8D,$8D,$6B,$8A,$8D,$02  ; $9D45
    .byte $80,$6F,$6D,$6B,$6A,$88,$88,$68,$86,$02,$88,$80,$A0,$0E,$01,$9D  ; $9D55
    .byte $35,$04,$08,$8A,$8B,$8A,$88,$02,$8A,$01,$A6,$01,$66,$0E,$01,$9D  ; $9D65
    .byte $66,$18,$80,$06,$C8,$02,$86,$02,$84,$86,$02,$88,$02,$86,$88,$02  ; $9D75
    .byte $8A,$02,$88,$8A,$02,$8B,$02,$8A,$8B,$04,$08,$08,$06,$18,$C0,$6D  ; $9D85
    .byte $60,$6D,$60,$70,$74,$60,$02,$92,$90,$8F,$8D,$70,$60,$6F,$60,$6D  ; $9D95
    .byte $6B,$60,$02,$01,$AD,$02,$01,$8D,$12,$08,$9D,$CD,$6D,$60,$6D,$60  ; $9DA5
    .byte $70,$72,$60,$02,$94,$92,$94,$95,$77,$60,$75,$60,$74,$92,$02,$01  ; $9DB5
    .byte $B0,$02,$01,$90,$0E,$01,$9D,$8E,$09,$02,$6D,$60,$6B,$60,$69,$68  ; $9DC5
    .byte $60,$02,$86,$88,$8B,$8D,$70,$60,$6F,$60,$6D,$8B,$8D,$07,$0C,$08  ; $9DD5
    .byte $00,$09,$00,$6D,$6D,$60,$6D,$60,$6D,$6D,$16,$9C,$E2,$17,$04,$08  ; $9DE5
    .byte $06,$78,$07,$09,$18,$C0,$08,$07,$09,$01,$04,$08,$04,$08,$8B,$8B  ; $9DF5
    .byte $64,$84,$86,$86,$01,$A6,$01,$66,$0E,$01,$9E,$01,$13,$08,$9E,$31  ; $9E05
    .byte $0C,$FD,$88,$8B,$6A,$86,$88,$8B,$6A,$8A,$86,$0C,$00,$03,$94,$96  ; $9E15
    .byte $77,$97,$02,$01,$B9,$02,$01,$99,$0F,$01,$9D,$FF,$0C,$FD,$88,$8B  ; $9E25
    .byte $6A,$8D,$8B,$8B,$6F,$8D,$90,$0C,$FE,$6F,$72,$74,$77,$09,$01,$6D  ; $9E35
    .byte $6F,$72,$02,$01,$B4,$02,$01,$94,$04,$00,$04,$00,$07,$0B,$0C,$00  ; $9E45
    .byte $06,$C8,$0C,$00,$18,$00,$08,$0F,$80,$74,$80,$74,$80,$74,$72,$60  ; $9E55
    .byte $74,$A0,$0E,$01,$9E,$4F,$80,$72,$80,$72,$80,$72,$6F,$60,$72,$A0  ; $9E65
    .byte $80,$74,$80,$74,$80,$74,$72,$60,$74,$A0,$0F,$01,$9E,$4D,$07,$07  ; $9E75
    .byte $18,$80,$08,$13,$09,$01,$CD,$D2,$D6,$01,$B9,$00,$01,$59,$08,$00  ; $9E85
    .byte $18,$00,$07,$0C,$03,$54,$52,$51,$4F,$4D,$4C,$4A,$48,$46,$45,$43  ; $9E95
    .byte $09,$02,$18,$C0,$07,$0A,$06,$C8,$08,$06,$04,$00,$76,$79,$7C,$03  ; $9EA5
    .byte $68,$66,$64,$0E,$03,$9E,$AF,$03,$76,$79,$7C,$7E,$03,$6A,$6D,$70  ; $9EB5
    .byte $74,$04,$08,$09,$01,$08,$06,$0C,$FE,$18,$C0,$6D,$60,$6D,$60,$70  ; $9EC5
    .byte $74,$60,$02,$92,$90,$8F,$8D,$70,$60,$6F,$60,$6D,$6B,$60,$12,$08  ; $9ED5
    .byte $9F,$21,$8D,$0C,$00,$18,$00,$06,$C8,$08,$00,$02,$94,$72,$60,$6D  ; $9EE5
    .byte $60,$08,$0B,$18,$C0,$0C,$FE,$6D,$60,$6D,$60,$70,$72,$60,$02,$94  ; $9EF5
    .byte $92,$94,$95,$77,$60,$75,$60,$74,$72,$60,$90,$0C,$00,$18,$00,$08  ; $9F05
    .byte $00,$74,$72,$70,$72,$74,$6B,$6D,$0E,$01,$9E,$C6,$0C,$00,$6D,$18  ; $9F15
    .byte $00,$08,$00,$6D,$6D,$6B,$6D,$70,$6F,$6D,$6B,$09,$02,$06,$64,$08  ; $9F25
    .byte $0F,$03,$97,$97,$77,$94,$97,$97,$74,$97,$94,$97,$97,$77,$94,$99  ; $9F35
    .byte $09,$01,$08,$00,$07,$0C,$03,$77,$77,$60,$77,$60,$77,$77,$16,$9D  ; $9F45
    .byte $F3,$17,$04,$00,$06,$C8,$07,$0C,$08,$02,$09,$03,$04,$00,$04,$00  ; $9F55
    .byte $68,$02,$80,$66,$80,$65,$60,$02,$85,$64,$60,$63,$60,$0E,$01,$9F  ; $9F65
    .byte $63,$13,$00,$9F,$98,$68,$02,$80,$66,$80,$65,$60,$02,$85,$64,$60  ; $9F75
    .byte $64,$60,$61,$60,$61,$60,$64,$64,$60,$02,$01,$A6,$02,$01,$86,$0F  ; $9F85
    .byte $01,$9F,$61,$68,$02,$80,$66,$80,$65,$60,$02,$85,$64,$60,$64,$60  ; $9F95
    .byte $63,$60,$63,$60,$63,$63,$60,$02,$01,$A8,$02,$01,$88,$04,$00,$68  ; $9FA5
    .byte $68,$A0,$68,$68,$02,$A0,$68,$67,$66,$66,$A0,$66,$66,$02,$A0,$66  ; $9FB5
    .byte $65,$63,$63,$A0,$63,$63,$60,$6D,$63,$60,$6D,$63,$6D,$6F,$64,$64  ; $9FC5
    .byte $A0,$64,$64,$60,$6D,$64,$60,$6D,$64,$6D,$70,$0E,$01,$9F,$B2,$04  ; $9FD5
    .byte $08,$08,$0E,$09,$01,$6A,$60,$6A,$60,$71,$6F,$6D,$6A,$60,$6A,$60  ; $9FE5
    .byte $6A,$71,$6F,$6D,$6C,$0E,$01,$9F,$E4,$04,$00  ; $9FF5
