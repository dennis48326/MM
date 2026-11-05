; PRG 8 KB bank $18 at $8000
.segment "BANK18"
.org $8000

    JMP loc_18_806C              ; $8000  4C 6C 80

    JMP loc_18_80FE              ; $8003  4C FE 80


sub_18_8006:
    LDA #$00                     ; $8006  A9 00
    STA $C2                      ; $8008  85 C2
    LDY #$08                     ; $800A  A0 08

loc_18_800C:
    ASL $C2                      ; $800C  06 C2
    ROL $C1                      ; $800E  26 C1
    BCC loc_18_801F              ; $8010  90 0D
    CLC                          ; $8012  18
    LDA $C2                      ; $8013  A5 C2
    ADC $C4                      ; $8015  65 C4
    STA $C2                      ; $8017  85 C2
    LDA $C1                      ; $8019  A5 C1
    ADC #$00                     ; $801B  69 00
    STA $C1                      ; $801D  85 C1

loc_18_801F:
    DEY                          ; $801F  88
    BNE loc_18_800C              ; $8020  D0 EA
    RTS                          ; $8022  60


sub_18_8023:
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


sub_18_803A:
    STY $C1                      ; $803A  84 C1
    LDY #$00                     ; $803C  A0 00
    CMP #$C0                     ; $803E  C9 C0
    BCS loc_18_8047              ; $8040  B0 05
    STA $C2                      ; $8042  85 C2
    LDA ($C1),Y                  ; $8044  B1 C1
    RTS                          ; $8046  60


loc_18_8047:
    SEC                          ; $8047  38
    SBC #$20                     ; $8048  E9 20
    STA $C2                      ; $804A  85 C2
    LDA #$07                     ; $804C  A9 07
    STA $8000                    ; $804E  8D 00 80
    LDA #$1A                     ; $8051  A9 1A
    STA $8001                    ; $8053  8D 01 80
    LDA ($C1),Y                  ; $8056  B1 C1
    PHA                          ; $8058  48
    LDA #$07                     ; $8059  A9 07
    STA $8000                    ; $805B  8D 00 80
    LDA #$19                     ; $805E  A9 19
    STA $8001                    ; $8060  8D 01 80
    LDA #$20                     ; $8063  A9 20
    CLC                          ; $8065  18
    ADC $C2                      ; $8066  65 C2
    STA $C2                      ; $8068  85 C2
    PLA                          ; $806A  68
    RTS                          ; $806B  60


loc_18_806C:
    LDA $C0                      ; $806C  A5 C0
    LSR A                        ; $806E  4A
    BCS loc_18_80D7              ; $806F  B0 66
    LDA $D0                      ; $8071  A5 D0
    ORA $D1                      ; $8073  05 D1
    BEQ loc_18_807A              ; $8075  F0 03
    JSR sub_18_8252              ; $8077  20 52 82

loc_18_807A:
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

loc_18_808C:
    LSR $CF                      ; $808C  46 CF
    BCC loc_18_8099              ; $808E  90 09
    LDA $CF                      ; $8090  A5 CF
    ORA #$80                     ; $8092  09 80
    STA $CF                      ; $8094  85 CF
    JSR sub_18_82DE              ; $8096  20 DE 82

loc_18_8099:
    LDA $C0                      ; $8099  A5 C0
    AND #$02                     ; $809B  29 02
    BNE loc_18_80A6              ; $809D  D0 07
    TXA                          ; $809F  8A
    PHA                          ; $80A0  48
    JSR sub_18_8393              ; $80A1  20 93 83
    PLA                          ; $80A4  68
    TAX                          ; $80A5  AA

loc_18_80A6:
    DEX                          ; $80A6  CA
    BPL loc_18_808C              ; $80A7  10 E3
    PLA                          ; $80A9  68
    STA $CF                      ; $80AA  85 CF
    LSR $C0                      ; $80AC  46 C0
    ASL $C0                      ; $80AE  06 C0
    LDA $CC                      ; $80B0  A5 CC
    AND #$7F                     ; $80B2  29 7F
    BEQ loc_18_80D7              ; $80B4  F0 21
    LDY #$00                     ; $80B6  A0 00
    STY $C1                      ; $80B8  84 C1
    LDY #$04                     ; $80BA  A0 04

loc_18_80BC:
    ASL A                        ; $80BC  0A
    ROL $C1                      ; $80BD  26 C1
    DEY                          ; $80BF  88
    BNE loc_18_80BC              ; $80C0  D0 FA
    CLC                          ; $80C2  18
    ADC $C0                      ; $80C3  65 C0
    STA $C0                      ; $80C5  85 C0
    LDA $C1                      ; $80C7  A5 C1
    ADC $CD                      ; $80C9  65 CD
    BCC loc_18_80D5              ; $80CB  90 08
    LDA $CC                      ; $80CD  A5 CC
    AND #$80                     ; $80CF  29 80
    STA $CC                      ; $80D1  85 CC
    LDA #$FF                     ; $80D3  A9 FF

loc_18_80D5:
    STA $CD                      ; $80D5  85 CD

loc_18_80D7:
    RTS                          ; $80D7  60


sub_18_80D8:
    TXA                          ; $80D8  8A
    AND #$03                     ; $80D9  29 03
    EOR #$03                     ; $80DB  49 03
    ASL A                        ; $80DD  0A
    ASL A                        ; $80DE  0A
    TAY                          ; $80DF  A8
    LDA #$30                     ; $80E0  A9 30
    CPY #$08                     ; $80E2  C0 08
    BNE loc_18_80E8              ; $80E4  D0 02
    LDA #$00                     ; $80E6  A9 00

loc_18_80E8:
    STA $4000,Y                  ; $80E8  99 00 40
    RTS                          ; $80EB  60


sub_18_80EC:
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


loc_18_80FE:
    INC $C0                      ; $80FE  E6 C0
    JSR sub_18_8106              ; $8100  20 06 81
    DEC $C0                      ; $8103  C6 C0
    RTS                          ; $8105  60


sub_18_8106:
    CMP #$F0                     ; $8106  C9 F0
    BCC loc_18_810D              ; $8108  90 03
    JMP loc_18_81AE              ; $810A  4C AE 81


loc_18_810D:
    CMP $8A40                    ; $810D  CD 40 8A
    BCC sub_18_8118              ; $8110  90 06
    SEC                          ; $8112  38
    SBC $8A40                    ; $8113  ED 40 8A
    BCS loc_18_810D              ; $8116  B0 F5

sub_18_8118:
    ASL A                        ; $8118  0A
    TAX                          ; $8119  AA
    LDY $8A44,X                  ; $811A  BC 44 8A
    TYA                          ; $811D  98
    ORA $8A43,X                  ; $811E  1D 43 8A
    BEQ loc_18_816E              ; $8121  F0 4B
    LDA $8A43,X                  ; $8123  BD 43 8A
    JSR sub_18_803A              ; $8126  20 3A 80
    TAY                          ; $8129  A8
    BEQ loc_18_816F              ; $812A  F0 43
    LDY #$00                     ; $812C  A0 00
    INX                          ; $812E  E8
    STA $C4                      ; $812F  85 C4
    AND #$7F                     ; $8131  29 7F
    CMP $CE                      ; $8133  C5 CE
    BCC loc_18_816E              ; $8135  90 37
    STA $CE                      ; $8137  85 CE
    BNE loc_18_8145              ; $8139  D0 0A
    LDA $D6                      ; $813B  A5 D6
    BPL loc_18_8145              ; $813D  10 06
    LDA $C4                      ; $813F  A5 C4
    BMI loc_18_8145              ; $8141  30 02
    STY $D7                      ; $8143  84 D7

loc_18_8145:
    STY $D6                      ; $8145  84 D6
    ASL $C4                      ; $8147  06 C4
    ROR $D6                      ; $8149  66 D6
    BPL loc_18_814F              ; $814B  10 02
    STX $D7                      ; $814D  86 D7

loc_18_814F:
    INC $C1                      ; $814F  E6 C1
    LDA $C1                      ; $8151  A5 C1
    STA $D0                      ; $8153  85 D0
    BNE loc_18_8159              ; $8155  D0 02
    INC $C2                      ; $8157  E6 C2

loc_18_8159:
    LDA $C2                      ; $8159  A5 C2
    STA $D1                      ; $815B  85 D1
    TYA                          ; $815D  98
    STA $D2                      ; $815E  85 D2
    STA $D3                      ; $8160  85 D3
    STA $D4                      ; $8162  85 D4
    STA $D5                      ; $8164  85 D5
    LDY #$27                     ; $8166  A0 27

loc_18_8168:
    STA $0700,Y                  ; $8168  99 00 07
    DEY                          ; $816B  88
    BPL loc_18_8168              ; $816C  10 FA

loc_18_816E:
    RTS                          ; $816E  60


loc_18_816F:
    LDX #$01                     ; $816F  A2 01
    STX $C9                      ; $8171  86 C9
    LDX #$99                     ; $8173  A2 99
    STX $CA                      ; $8175  86 CA
    STA $C8                      ; $8177  85 C8
    STA $CB                      ; $8179  85 CB
    STA $CC                      ; $817B  85 CC
    STA $CD                      ; $817D  85 CD
    LDX #$53                     ; $817F  A2 53

loc_18_8181:
    STA $0728,X                  ; $8181  9D 28 07
    DEX                          ; $8184  CA
    BPL loc_18_8181              ; $8185  10 FA
    LDX #$03                     ; $8187  A2 03

loc_18_8189:
    INC $C1                      ; $8189  E6 C1
    BNE loc_18_818F              ; $818B  D0 02
    INC $C2                      ; $818D  E6 C2

loc_18_818F:
    LDY $C1                      ; $818F  A4 C1
    LDA $C2                      ; $8191  A5 C2
    JSR sub_18_803A              ; $8193  20 3A 80
    STA $0754,X                  ; $8196  9D 54 07
    INC $C1                      ; $8199  E6 C1
    BNE loc_18_819F              ; $819B  D0 02
    INC $C2                      ; $819D  E6 C2

loc_18_819F:
    LDY $C1                      ; $819F  A4 C1
    LDA $C2                      ; $81A1  A5 C2
    JSR sub_18_803A              ; $81A3  20 3A 80
    STA $0750,X                  ; $81A6  9D 50 07
    DEX                          ; $81A9  CA
    BPL loc_18_8189              ; $81AA  10 DD
    BMI sub_18_81F1              ; $81AC  30 43

loc_18_81AE:
    STY $C3                      ; $81AE  84 C3
    AND #$07                     ; $81B0  29 07
    JSR sub_18_8023              ; $81B2  20 23 80
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

loc_18_81C8:
    LDA #$00                     ; $81C8  A9 00
    STA $CE                      ; $81CA  85 CE
    STA $D0                      ; $81CC  85 D0
    STA $D1                      ; $81CE  85 D1
    STA $D7                      ; $81D0  85 D7
    STA $D8                      ; $81D2  85 D8

sub_18_81D4:
    LDA $CF                      ; $81D4  A5 CF
    BEQ loc_18_81E3              ; $81D6  F0 0B
    EOR #$0F                     ; $81D8  49 0F
    STA $CF                      ; $81DA  85 CF
    JSR sub_18_81F1              ; $81DC  20 F1 81
    LDA #$00                     ; $81DF  A9 00
    STA $CF                      ; $81E1  85 CF

loc_18_81E3:
    RTS                          ; $81E3  60


sub_18_81E4:
    LDA #$00                     ; $81E4  A9 00
    LDX #$03                     ; $81E6  A2 03

loc_18_81E8:
    STA $0754,X                  ; $81E8  9D 54 07
    STA $0750,X                  ; $81EB  9D 50 07
    DEX                          ; $81EE  CA
    BPL loc_18_81E8              ; $81EF  10 F7

sub_18_81F1:
    LDA $CF                      ; $81F1  A5 CF
    PHA                          ; $81F3  48
    LDX #$03                     ; $81F4  A2 03

loc_18_81F6:
    LSR $CF                      ; $81F6  46 CF
    BCS loc_18_820A              ; $81F8  B0 10
    JSR sub_18_80D8              ; $81FA  20 D8 80
    LDA $0754,X                  ; $81FD  BD 54 07
    ORA $0750,X                  ; $8200  1D 50 07
    BEQ loc_18_820A              ; $8203  F0 05
    LDA #$FF                     ; $8205  A9 FF
    STA $077C,X                  ; $8207  9D 7C 07

loc_18_820A:
    DEX                          ; $820A  CA
    BPL loc_18_81F6              ; $820B  10 E9
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

sub_18_8252:
    LDA $D3                      ; $8252  A5 D3
    BEQ loc_18_825B              ; $8254  F0 05
    DEC $D3                      ; $8256  C6 D3
    DEC $D5                      ; $8258  C6 D5
    RTS                          ; $825A  60


loc_18_825B:
    JSR sub_18_8386              ; $825B  20 86 83
    STA $C4                      ; $825E  85 C4
    ASL A                        ; $8260  0A
    BCC loc_18_8273              ; $8261  90 10
    STY $CE                      ; $8263  84 CE
    LDA $D7                      ; $8265  A5 D7
    LSR A                        ; $8267  4A
    BCC loc_18_8270              ; $8268  90 06
    JSR sub_18_8118              ; $826A  20 18 81
    JMP loc_18_825B              ; $826D  4C 5B 82


loc_18_8270:
    JMP loc_18_81C8              ; $8270  4C C8 81


loc_18_8273:
    LSR $C4                      ; $8273  46 C4
    BCC loc_18_82A6              ; $8275  90 2F
    JSR sub_18_8386              ; $8277  20 86 83
    ASL A                        ; $827A  0A
    BEQ loc_18_8289              ; $827B  F0 0C
    ASL $D6                      ; $827D  06 D6
    PHP                          ; $827F  08
    CMP $D6                      ; $8280  C5 D6
    BEQ loc_18_8296              ; $8282  F0 12
    PLP                          ; $8284  28
    ROR $D6                      ; $8285  66 D6
    INC $D6                      ; $8287  E6 D6

loc_18_8289:
    JSR sub_18_8386              ; $8289  20 86 83
    TAX                          ; $828C  AA
    JSR sub_18_8386              ; $828D  20 86 83
    STA $D0                      ; $8290  85 D0
    STX $D1                      ; $8292  86 D1
    BNE loc_18_825B              ; $8294  D0 C5

loc_18_8296:
    TYA                          ; $8296  98
    PLP                          ; $8297  28
    ROR A                        ; $8298  6A
    STA $D6                      ; $8299  85 D6
    CLC                          ; $829B  18
    LDA #$02                     ; $829C  A9 02
    ADC $D0                      ; $829E  65 D0
    STA $D0                      ; $82A0  85 D0
    BCC loc_18_82A6              ; $82A2  90 02
    INC $D1                      ; $82A4  E6 D1

loc_18_82A6:
    LSR $C4                      ; $82A6  46 C4
    BCC loc_18_82AF              ; $82A8  90 05
    JSR sub_18_8386              ; $82AA  20 86 83
    STA $D4                      ; $82AD  85 D4

loc_18_82AF:
    LSR $C4                      ; $82AF  46 C4
    BCC loc_18_82B8              ; $82B1  90 05
    JSR sub_18_8386              ; $82B3  20 86 83
    STA $D2                      ; $82B6  85 D2

loc_18_82B8:
    JSR sub_18_8386              ; $82B8  20 86 83
    STA $D3                      ; $82BB  85 D3
    STA $C1                      ; $82BD  85 C1
    LDA $D4                      ; $82BF  A5 D4
    STA $C4                      ; $82C1  85 C4
    JSR sub_18_8006              ; $82C3  20 06 80
    LDY $C1                      ; $82C6  A4 C1
    INY                          ; $82C8  C8
    STY $D5                      ; $82C9  84 D5
    INC $C0                      ; $82CB  E6 C0
    JSR sub_18_8386              ; $82CD  20 86 83
    PHA                          ; $82D0  48
    EOR $CF                      ; $82D1  45 CF
    BEQ loc_18_82DA              ; $82D3  F0 05
    STA $CF                      ; $82D5  85 CF
    JSR sub_18_81D4              ; $82D7  20 D4 81

loc_18_82DA:
    PLA                          ; $82DA  68
    STA $CF                      ; $82DB  85 CF
    RTS                          ; $82DD  60


sub_18_82DE:
    LDY $0700,X                  ; $82DE  BC 00 07
    BEQ loc_18_82E6              ; $82E1  F0 03
    JSR sub_18_8684              ; $82E3  20 84 86

loc_18_82E6:
    LDA $C0                      ; $82E6  A5 C0
    LSR A                        ; $82E8  4A
    BCS loc_18_830A              ; $82E9  B0 1F
    JSR sub_18_86BA              ; $82EB  20 BA 86
    LDA $D3                      ; $82EE  A5 D3
    BEQ loc_18_82FA              ; $82F0  F0 08
    CPX #$01                     ; $82F2  E0 01
    BEQ loc_18_82FB              ; $82F4  F0 05
    LDA $D5                      ; $82F6  A5 D5
    BEQ loc_18_8300              ; $82F8  F0 06

loc_18_82FA:
    RTS                          ; $82FA  60


loc_18_82FB:
    DEC $0710,X                  ; $82FB  DE 10 07
    BNE loc_18_82FA              ; $82FE  D0 FA

loc_18_8300:
    LDA $0704,X                  ; $8300  BD 04 07
    AND #$04                     ; $8303  29 04
    BNE loc_18_82FA              ; $8305  D0 F3
    JMP sub_18_85A3              ; $8307  4C A3 85


loc_18_830A:
    LDA #$00                     ; $830A  A9 00
    STA $C4                      ; $830C  85 C4
    JSR sub_18_8386              ; $830E  20 86 83

loc_18_8311:
    LSR A                        ; $8311  4A
    BCC loc_18_8320              ; $8312  90 0C
    PHA                          ; $8314  48
    JSR sub_18_8386              ; $8315  20 86 83
    STA $C3                      ; $8318  85 C3
    LDA $C4                      ; $831A  A5 C4
    JSR sub_18_8326              ; $831C  20 26 83
    PLA                          ; $831F  68

loc_18_8320:
    BEQ loc_18_8333              ; $8320  F0 11
    INC $C4                      ; $8322  E6 C4
    BNE loc_18_8311              ; $8324  D0 EB

sub_18_8326:
    JSR sub_18_8023              ; $8326  20 23 80
    RRA $AD86                    ; $8329  6F 86 AD
    STX $5A                      ; $832C  86 5A
    STX $A7                      ; $832E  86 A7
    STX $A1                      ; $8330  86 A1
    STX $20                      ; $8332  86 20
    STX $83                      ; $8334  86 83
    TAY                          ; $8336  A8
    BNE loc_18_8349              ; $8337  D0 10
    STA $0710,X                  ; $8339  9D 10 07
    LDA $0704,X                  ; $833C  BD 04 07
    AND #$F8                     ; $833F  29 F8
    ORA #$04                     ; $8341  09 04
    STA $0704,X                  ; $8343  9D 04 07
    JMP sub_18_80D8              ; $8346  4C D8 80


loc_18_8349:
    LDA $0704,X                  ; $8349  BD 04 07
    ORA #$20                     ; $834C  09 20
    STA $0704,X                  ; $834E  9D 04 07
    LDA $0718,X                  ; $8351  BD 18 07
    ASL A                        ; $8354  0A
    LDA #$54                     ; $8355  A9 54
    BCS loc_18_835B              ; $8357  B0 02
    LDA #$0A                     ; $8359  A9 0A

loc_18_835B:
    STA $071C,X                  ; $835B  9D 1C 07
    TYA                          ; $835E  98
    BPL loc_18_836B              ; $835F  10 0A
    CPX #$01                     ; $8361  E0 01
    BNE loc_18_8368              ; $8363  D0 03
    JSR sub_18_85AE              ; $8365  20 AE 85

loc_18_8368:
    JMP sub_18_8644              ; $8368  4C 44 86


loc_18_836B:
    JSR sub_18_85AE              ; $836B  20 AE 85
    LDA #$FF                     ; $836E  A9 FF
    STA $077C,X                  ; $8370  9D 7C 07
    DEY                          ; $8373  88
    TXA                          ; $8374  8A
    BNE loc_18_837F              ; $8375  D0 08
    STA $C3                      ; $8377  85 C3
    TYA                          ; $8379  98
    EOR #$0F                     ; $837A  49 0F
    JMP sub_18_8636              ; $837C  4C 36 86


loc_18_837F:
    TYA                          ; $837F  98
    CLC                          ; $8380  18
    ADC $D2                      ; $8381  65 D2
    JMP sub_18_85DE              ; $8383  4C DE 85


sub_18_8386:
    LDY $D0                      ; $8386  A4 D0
    LDA $D1                      ; $8388  A5 D1
    INC $D0                      ; $838A  E6 D0
    BNE loc_18_8390              ; $838C  D0 02
    INC $D1                      ; $838E  E6 D1

loc_18_8390:
    JMP sub_18_803A              ; $8390  4C 3A 80


sub_18_8393:
    TXA                          ; $8393  8A
    ORA #$28                     ; $8394  09 28
    TAX                          ; $8396  AA
    LDA $0728,X                  ; $8397  BD 28 07
    ORA $072C,X                  ; $839A  1D 2C 07
    BEQ loc_18_83CC              ; $839D  F0 2D
    LDA $0738,X                  ; $839F  BD 38 07
    BEQ loc_18_83CD              ; $83A2  F0 29
    LDY $0700,X                  ; $83A4  BC 00 07
    BEQ loc_18_83AF              ; $83A7  F0 06
    JSR sub_18_8684              ; $83A9  20 84 86
    JSR sub_18_86BA              ; $83AC  20 BA 86

loc_18_83AF:
    LDA $0740,X                  ; $83AF  BD 40 07
    SEC                          ; $83B2  38
    SBC $C7                      ; $83B3  E5 C7
    STA $0740,X                  ; $83B5  9D 40 07
    BEQ loc_18_83BC              ; $83B8  F0 02
    BCS loc_18_83BF              ; $83BA  B0 03

loc_18_83BC:
    JSR sub_18_85A3              ; $83BC  20 A3 85

loc_18_83BF:
    LDA $0738,X                  ; $83BF  BD 38 07
    SEC                          ; $83C2  38
    SBC $C7                      ; $83C3  E5 C7
    STA $0738,X                  ; $83C5  9D 38 07
    BEQ loc_18_83CD              ; $83C8  F0 03
    BCC loc_18_83CD              ; $83CA  90 01

loc_18_83CC:
    RTS                          ; $83CC  60


loc_18_83CD:
    JSR sub_18_8592              ; $83CD  20 92 85
    CMP #$20                     ; $83D0  C9 20
    BCS loc_18_83DA              ; $83D2  B0 06
    JSR sub_18_8497              ; $83D4  20 97 84
    JMP loc_18_83CD              ; $83D7  4C CD 83


loc_18_83DA:
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
    BPL loc_18_83EF              ; $83E8  10 05
    LDA $8915,Y                  ; $83EA  B9 15 89
    BNE loc_18_8406              ; $83ED  D0 17

loc_18_83EF:
    ASL A                        ; $83EF  0A
    ASL A                        ; $83F0  0A
    LDA $891C,Y                  ; $83F1  B9 1C 89
    BCC loc_18_8406              ; $83F4  90 10
    STA $C3                      ; $83F6  85 C3
    LDA $0730,X                  ; $83F8  BD 30 07
    AND #$EF                     ; $83FB  29 EF
    STA $0730,X                  ; $83FD  9D 30 07
    LDA $C3                      ; $8400  A5 C3
    LSR A                        ; $8402  4A
    CLC                          ; $8403  18
    ADC $C3                      ; $8404  65 C3

loc_18_8406:
    CLC                          ; $8406  18
    ADC $0738,X                  ; $8407  7D 38 07
    STA $0738,X                  ; $840A  9D 38 07
    TAY                          ; $840D  A8
    PLA                          ; $840E  68
    AND #$1F                     ; $840F  29 1F
    BNE loc_18_8419              ; $8411  D0 06
    JSR sub_18_85A3              ; $8413  20 A3 85
    JMP loc_18_8491              ; $8416  4C 91 84


loc_18_8419:
    PHA                          ; $8419  48
    STY $C4                      ; $841A  84 C4
    LDA $073C,X                  ; $841C  BD 3C 07
    STA $C1                      ; $841F  85 C1
    JSR sub_18_8006              ; $8421  20 06 80
    LDA $C1                      ; $8424  A5 C1
    BNE loc_18_842A              ; $8426  D0 02
    LDA #$01                     ; $8428  A9 01

loc_18_842A:
    STA $0740,X                  ; $842A  9D 40 07
    PLA                          ; $842D  68
    TAY                          ; $842E  A8
    DEY                          ; $842F  88
    LDA $0730,X                  ; $8430  BD 30 07
    BPL loc_18_8440              ; $8433  10 0B
    LDA $0718,X                  ; $8435  BD 18 07
    BNE loc_18_8454              ; $8438  D0 1A
    JSR sub_18_8644              ; $843A  20 44 86
    JMP loc_18_847E              ; $843D  4C 7E 84


loc_18_8440:
    JSR sub_18_85AE              ; $8440  20 AE 85
    LDA $CF                      ; $8443  A5 CF
    BMI loc_18_8454              ; $8445  30 0D
    STY $C3                      ; $8447  84 C3
    TXA                          ; $8449  8A
    AND #$03                     ; $844A  29 03
    TAY                          ; $844C  A8
    LDA #$FF                     ; $844D  A9 FF
    STA $077C,Y                  ; $844F  99 7C 07
    LDY $C3                      ; $8452  A4 C3

loc_18_8454:
    TXA                          ; $8454  8A
    AND #$03                     ; $8455  29 03
    BNE loc_18_8466              ; $8457  D0 0D
    STA $C3                      ; $8459  85 C3
    TYA                          ; $845B  98
    AND #$0F                     ; $845C  29 0F
    EOR #$0F                     ; $845E  49 0F
    JSR sub_18_8636              ; $8460  20 36 86
    JMP loc_18_847E              ; $8463  4C 7E 84


loc_18_8466:
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
    JSR sub_18_85DE              ; $847B  20 DE 85

loc_18_847E:
    LDA $0730,X                  ; $847E  BD 30 07
    TAY                          ; $8481  A8
    AND #$40                     ; $8482  29 40
    ASL A                        ; $8484  0A
    STA $C4                      ; $8485  85 C4
    TYA                          ; $8487  98
    AND #$7F                     ; $8488  29 7F
    ORA $C4                      ; $848A  05 C4
    STA $0730,X                  ; $848C  9D 30 07
    BPL loc_18_8496              ; $848F  10 05

loc_18_8491:
    LDA #$FF                     ; $8491  A9 FF
    STA $0740,X                  ; $8493  9D 40 07

loc_18_8496:
    RTS                          ; $8496  60


sub_18_8497:
    CMP #$04                     ; $8497  C9 04
    BCC loc_18_84A4              ; $8499  90 09
    STA $C4                      ; $849B  85 C4
    JSR sub_18_8592              ; $849D  20 92 85
    STA $C3                      ; $84A0  85 C3
    LDA $C4                      ; $84A2  A5 C4

loc_18_84A4:
    JSR sub_18_8023              ; $84A4  20 23 80
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
    BNE loc_18_84EA              ; $84DF  D0 09
    LDA #$10                     ; $84E1  A9 10
    ORA $0730,X                  ; $84E3  1D 30 07
    BNE loc_18_84ED              ; $84E6  D0 05
    LDA #$08                     ; $84E8  A9 08

loc_18_84EA:
    EOR $0730,X                  ; $84EA  5D 30 07

loc_18_84ED:
    STA $0730,X                  ; $84ED  9D 30 07
    RTS                          ; $84F0  60

    LDA #$00                     ; $84F1  A9 00
    STA $C8                      ; $84F3  85 C8
    JSR sub_18_8592              ; $84F5  20 92 85
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

    LDA $C3                      ; $8515  A5 C3
    STA $0734,X                  ; $8517  9D 34 07
    RTS                          ; $851A  60

    LDA #$00                     ; $851B  A9 00
    BEQ loc_18_8529              ; $851D  F0 0A
    LDA #$04                     ; $851F  A9 04
    BNE loc_18_8529              ; $8521  D0 06
    LDA #$08                     ; $8523  A9 08
    BNE loc_18_8529              ; $8525  D0 02
    LDA #$0C                     ; $8527  A9 0C

loc_18_8529:
    STA $C2                      ; $8529  85 C2
    TXA                          ; $852B  8A
    CLC                          ; $852C  18
    ADC $C2                      ; $852D  65 C2
    TAY                          ; $852F  A8
    LDA $C4                      ; $8530  A5 C4
    CMP #$12                     ; $8532  C9 12
    BCS loc_18_8547              ; $8534  B0 11
    LDA $0744,Y                  ; $8536  B9 44 07
    SEC                          ; $8539  38
    SBC #$01                     ; $853A  E9 01
    BCS loc_18_8540              ; $853C  B0 02
    LDA $C3                      ; $853E  A5 C3

loc_18_8540:
    STA $0744,Y                  ; $8540  99 44 07
    BEQ loc_18_8566              ; $8543  F0 21
    BNE loc_18_8555              ; $8545  D0 0E

loc_18_8547:
    LDA $0744,Y                  ; $8547  B9 44 07
    SEC                          ; $854A  38
    SBC #$01                     ; $854B  E9 01
    BNE loc_18_8566              ; $854D  D0 17
    STA $0744,Y                  ; $854F  99 44 07
    JSR sub_18_8575              ; $8552  20 75 85

loc_18_8555:
    JSR sub_18_8592              ; $8555  20 92 85
    STA $C3                      ; $8558  85 C3
    JSR sub_18_8592              ; $855A  20 92 85
    STA $0728,X                  ; $855D  9D 28 07
    LDA $C3                      ; $8560  A5 C3
    STA $072C,X                  ; $8562  9D 2C 07
    RTS                          ; $8565  60


loc_18_8566:
    LDA #$02                     ; $8566  A9 02
    CLC                          ; $8568  18
    ADC $0728,X                  ; $8569  7D 28 07
    STA $0728,X                  ; $856C  9D 28 07
    BCC loc_18_8574              ; $856F  90 03
    INC $072C,X                  ; $8571  FE 2C 07

loc_18_8574:
    RTS                          ; $8574  60


sub_18_8575:
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
    BMI loc_18_8591              ; $858C  30 03
    JMP sub_18_80D8              ; $858E  4C D8 80


loc_18_8591:
    RTS                          ; $8591  60


sub_18_8592:
    LDY $0728,X                  ; $8592  BC 28 07
    LDA $072C,X                  ; $8595  BD 2C 07
    INC $0728,X                  ; $8598  FE 28 07
    BNE loc_18_85A0              ; $859B  D0 03
    INC $072C,X                  ; $859D  FE 2C 07

loc_18_85A0:
    JMP sub_18_803A              ; $85A0  4C 3A 80


sub_18_85A3:
    LDA $0704,X                  ; $85A3  BD 04 07
    AND #$F8                     ; $85A6  29 F8
    ORA #$03                     ; $85A8  09 03
    STA $0704,X                  ; $85AA  9D 04 07
    RTS                          ; $85AD  60


sub_18_85AE:
    TYA                          ; $85AE  98
    PHA                          ; $85AF  48
    LDY #$00                     ; $85B0  A0 00
    LDA $0704,X                  ; $85B2  BD 04 07
    AND #$F8                     ; $85B5  29 F8
    STA $0704,X                  ; $85B7  9D 04 07
    CPX #$29                     ; $85BA  E0 29
    BEQ loc_18_85D0              ; $85BC  F0 12
    CPX #$01                     ; $85BE  E0 01
    BNE loc_18_85D7              ; $85C0  D0 15
    LDA $D3                      ; $85C2  A5 D3
    STA $C1                      ; $85C4  85 C1
    LDA $070C,X                  ; $85C6  BD 0C 07
    STA $C4                      ; $85C9  85 C4
    JSR sub_18_8006              ; $85CB  20 06 80
    LDY $C1                      ; $85CE  A4 C1

loc_18_85D0:
    INY                          ; $85D0  C8
    INC $0704,X                  ; $85D1  FE 04 07
    INC $0704,X                  ; $85D4  FE 04 07

loc_18_85D7:
    TYA                          ; $85D7  98
    STA $0710,X                  ; $85D8  9D 10 07
    PLA                          ; $85DB  68
    TAY                          ; $85DC  A8
    RTS                          ; $85DD  60


sub_18_85DE:
    CMP #$60                     ; $85DE  C9 60
    BCC loc_18_85E4              ; $85E0  90 02
    LDA #$5F                     ; $85E2  A9 5F

loc_18_85E4:
    STA $C3                      ; $85E4  85 C3
    INC $C3                      ; $85E6  E6 C3
    CPX #$28                     ; $85E8  E0 28
    BCC loc_18_862A              ; $85EA  90 3E
    LDA $071C,X                  ; $85EC  BD 1C 07
    BEQ loc_18_861D              ; $85EF  F0 2C
    CMP $C3                      ; $85F1  C5 C3
    BNE loc_18_85FC              ; $85F3  D0 07
    LDA $0730,X                  ; $85F5  BD 30 07
    BPL loc_18_861D              ; $85F8  10 23
    BMI sub_18_8644              ; $85FA  30 48

loc_18_85FC:
    LDA $0718,X                  ; $85FC  BD 18 07
    BEQ loc_18_861D              ; $85FF  F0 1C
    BCS loc_18_8607              ; $8601  B0 04
    ORA #$80                     ; $8603  09 80
    BNE loc_18_8609              ; $8605  D0 02

loc_18_8607:
    AND #$7F                     ; $8607  29 7F

loc_18_8609:
    STA $0718,X                  ; $8609  9D 18 07
    LDA $0704,X                  ; $860C  BD 04 07
    ORA #$20                     ; $860F  09 20
    STA $0704,X                  ; $8611  9D 04 07
    LDA $C3                      ; $8614  A5 C3
    LDY $071C,X                  ; $8616  BC 1C 07
    STY $C3                      ; $8619  84 C3
    BNE loc_18_8627              ; $861B  D0 0A

loc_18_861D:
    LDA $0704,X                  ; $861D  BD 04 07
    AND #$DF                     ; $8620  29 DF
    STA $0704,X                  ; $8622  9D 04 07
    LDA $C3                      ; $8625  A5 C3

loc_18_8627:
    STA $071C,X                  ; $8627  9D 1C 07

loc_18_862A:
    ASL $C3                      ; $862A  06 C3
    LDY $C3                      ; $862C  A4 C3
    LDA $8959,Y                  ; $862E  B9 59 89
    STA $C3                      ; $8631  85 C3
    LDA $895A,Y                  ; $8633  B9 5A 89

sub_18_8636:
    STA $0724,X                  ; $8636  9D 24 07
    LDA $C3                      ; $8639  A5 C3
    STA $0720,X                  ; $863B  9D 20 07
    LDY #$04                     ; $863E  A0 04
    LDA ($C5),Y                  ; $8640  B1 C5
    BMI loc_18_864C              ; $8642  30 08

sub_18_8644:
    LDA $0704,X                  ; $8644  BD 04 07
    AND #$08                     ; $8647  29 08
    BNE loc_18_864C              ; $8649  D0 01
    RTS                          ; $864B  60


loc_18_864C:
    LDA #$00                     ; $864C  A9 00
    STA $0708,X                  ; $864E  9D 08 07
    LDA $0704,X                  ; $8651  BD 04 07
    AND #$37                     ; $8654  29 37
    STA $0704,X                  ; $8656  9D 04 07
    RTS                          ; $8659  60

    CPX #$01                     ; $865A  E0 01
    BNE loc_18_8662              ; $865C  D0 04
    LDA $C3                      ; $865E  A5 C3
    BNE loc_18_866B              ; $8660  D0 09

loc_18_8662:
    LDA $070C,X                  ; $8662  BD 0C 07
    AND #$C0                     ; $8665  29 C0
    ORA $C3                      ; $8667  05 C3
    ORA #$30                     ; $8669  09 30

loc_18_866B:
    STA $070C,X                  ; $866B  9D 0C 07
    RTS                          ; $866E  60

    INC $C3                      ; $866F  E6 C3
    LDA $C3                      ; $8671  A5 C3
    CMP $0700,X                  ; $8673  DD 00 07
    BEQ loc_18_86A0              ; $8676  F0 28
    STA $0700,X                  ; $8678  9D 00 07
    TAY                          ; $867B  A8
    LDA $0704,X                  ; $867C  BD 04 07
    ORA #$08                     ; $867F  09 08
    STA $0704,X                  ; $8681  9D 04 07

sub_18_8684:
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

loc_18_86A0:
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


sub_18_86BA:
    LDA $0710,X                  ; $86BA  BD 10 07
    STA $C4                      ; $86BD  85 C4
    LDA $0704,X                  ; $86BF  BD 04 07
    AND #$07                     ; $86C2  29 07
    JSR sub_18_8023              ; $86C4  20 23 80
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
    BCS loc_18_86E2              ; $86DC  B0 04
    CMP #$F0                     ; $86DE  C9 F0
    BCC loc_18_871D              ; $86E0  90 3B

loc_18_86E2:
    LDA #$F0                     ; $86E2  A9 F0
    BNE loc_18_871A              ; $86E4  D0 34
    LDY #$01                     ; $86E6  A0 01
    LDA ($C5),Y                  ; $86E8  B1 C5
    BEQ loc_18_86FB              ; $86EA  F0 0F
    TAY                          ; $86EC  A8
    LDA $C4                      ; $86ED  A5 C4
    SEC                          ; $86EF  38
    SBC $8933,Y                  ; $86F0  F9 33 89
    BCC loc_18_86FB              ; $86F3  90 06
    LDY #$02                     ; $86F5  A0 02
    CMP ($C5),Y                  ; $86F7  D1 C5
    BCS loc_18_871D              ; $86F9  B0 22

loc_18_86FB:
    LDY #$02                     ; $86FB  A0 02
    LDA ($C5),Y                  ; $86FD  B1 C5
    JMP loc_18_871A              ; $86FF  4C 1A 87

    TXA                          ; $8702  8A
    AND #$03                     ; $8703  29 03
    CMP #$01                     ; $8705  C9 01
    BEQ loc_18_8718              ; $8707  F0 0F
    LDY #$03                     ; $8709  A0 03
    LDA ($C5),Y                  ; $870B  B1 C5
    BEQ loc_18_8720              ; $870D  F0 11
    TAY                          ; $870F  A8
    LDA $C4                      ; $8710  A5 C4
    SEC                          ; $8712  38
    SBC $8933,Y                  ; $8713  F9 33 89
    BCS loc_18_871D              ; $8716  B0 05

loc_18_8718:
    LDA #$00                     ; $8718  A9 00

loc_18_871A:
    INC $0704,X                  ; $871A  FE 04 07

loc_18_871D:
    STA $0710,X                  ; $871D  9D 10 07

loc_18_8720:
    CPX #$28                     ; $8720  E0 28
    BCC loc_18_8737              ; $8722  90 13
    LDA $CF                      ; $8724  A5 CF
    BPL loc_18_872B              ; $8726  10 03
    JMP loc_18_88A0              ; $8728  4C A0 88


loc_18_872B:
    LDA $CD                      ; $872B  A5 CD
    LDY $CC                      ; $872D  A4 CC
    BMI loc_18_8733              ; $872F  30 02
    EOR #$FF                     ; $8731  49 FF

loc_18_8733:
    CMP #$FF                     ; $8733  C9 FF
    BNE loc_18_8740              ; $8735  D0 09

loc_18_8737:
    TXA                          ; $8737  8A
    AND #$03                     ; $8738  29 03
    CMP #$01                     ; $873A  C9 01
    BNE loc_18_8760              ; $873C  D0 22
    BEQ loc_18_8752              ; $873E  F0 12

loc_18_8740:
    CPX #$29                     ; $8740  E0 29
    BNE loc_18_875B              ; $8742  D0 17
    STA $C4                      ; $8744  85 C4
    LDA $0740,X                  ; $8746  BD 40 07
    STA $C1                      ; $8749  85 C1
    JSR sub_18_8006              ; $874B  20 06 80
    LDA $C1                      ; $874E  A5 C1
    BEQ loc_18_87AA              ; $8750  F0 58

loc_18_8752:
    LDA $0710,X                  ; $8752  BD 10 07
    BEQ loc_18_87AA              ; $8755  F0 53
    LDA #$FF                     ; $8757  A9 FF
    BNE loc_18_87AA              ; $8759  D0 4F

loc_18_875B:
    CMP $0710,X                  ; $875B  DD 10 07
    BCC loc_18_8763              ; $875E  90 03

loc_18_8760:
    LDA $0710,X                  ; $8760  BD 10 07

loc_18_8763:
    LSR A                        ; $8763  4A
    LSR A                        ; $8764  4A
    LSR A                        ; $8765  4A
    LSR A                        ; $8766  4A
    EOR #$0F                     ; $8767  49 0F
    STA $C3                      ; $8769  85 C3
    LDY #$06                     ; $876B  A0 06
    LDA ($C5),Y                  ; $876D  B1 C5
    CMP #$05                     ; $876F  C9 05
    BCC loc_18_8797              ; $8771  90 24
    STA $C4                      ; $8773  85 C4
    LDY $0708,X                  ; $8775  BC 08 07
    LDA $0704,X                  ; $8778  BD 04 07
    ASL A                        ; $877B  0A
    ASL A                        ; $877C  0A
    TYA                          ; $877D  98
    BCC loc_18_8782              ; $877E  90 02
    EOR #$FF                     ; $8780  49 FF

loc_18_8782:
    BEQ loc_18_8797              ; $8782  F0 13
    STA $C1                      ; $8784  85 C1
    JSR sub_18_8006              ; $8786  20 06 80
    LDA $C1                      ; $8789  A5 C1
    LSR A                        ; $878B  4A
    LSR A                        ; $878C  4A
    CMP #$10                     ; $878D  C9 10
    BCS loc_18_87A5              ; $878F  B0 14
    CMP $C3                      ; $8791  C5 C3
    BCC loc_18_8797              ; $8793  90 02
    STA $C3                      ; $8795  85 C3

loc_18_8797:
    LDA #$10                     ; $8797  A9 10
    STA $C4                      ; $8799  85 C4
    LDA $070C,X                  ; $879B  BD 0C 07
    SEC                          ; $879E  38
    SBC $C3                      ; $879F  E5 C3
    BIT $C4                      ; $87A1  24 C4
    BNE loc_18_87AA              ; $87A3  D0 05

loc_18_87A5:
    LDA $070C,X                  ; $87A5  BD 0C 07
    AND #$F0                     ; $87A8  29 F0

loc_18_87AA:
    LDY #$00                     ; $87AA  A0 00
    JSR sub_18_80EC              ; $87AC  20 EC 80
    TXA                          ; $87AF  8A
    AND #$03                     ; $87B0  29 03
    TAY                          ; $87B2  A8
    LDA $077C,Y                  ; $87B3  B9 7C 07
    BMI loc_18_880C              ; $87B6  30 54
    LDY #$05                     ; $87B8  A0 05
    LDA ($C5),Y                  ; $87BA  B1 C5
    BEQ loc_18_880C              ; $87BC  F0 4E
    STA $C4                      ; $87BE  85 C4
    LDY $0708,X                  ; $87C0  BC 08 07
    LDA $0704,X                  ; $87C3  BD 04 07
    ASL A                        ; $87C6  0A
    ASL A                        ; $87C7  0A
    TYA                          ; $87C8  98
    BCC loc_18_87CD              ; $87C9  90 02
    EOR #$FF                     ; $87CB  49 FF

loc_18_87CD:
    BEQ loc_18_880C              ; $87CD  F0 3D
    STA $C1                      ; $87CF  85 C1
    JSR sub_18_8006              ; $87D1  20 06 80
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
    BEQ loc_18_880C              ; $87E5  F0 25
    LDA $0704,X                  ; $87E7  BD 04 07
    BMI loc_18_87FA              ; $87EA  30 0E
    CLC                          ; $87EC  18
    LDA $C2                      ; $87ED  A5 C2
    ADC $0720,X                  ; $87EF  7D 20 07
    STA $C2                      ; $87F2  85 C2
    TYA                          ; $87F4  98
    ADC $0724,X                  ; $87F5  7D 24 07
    BNE loc_18_8809              ; $87F8  D0 0F

loc_18_87FA:
    SEC                          ; $87FA  38
    LDA $0720,X                  ; $87FB  BD 20 07
    SBC $C2                      ; $87FE  E5 C2
    STA $C2                      ; $8800  85 C2
    LDA $0724,X                  ; $8802  BD 24 07
    STY $C1                      ; $8805  84 C1
    SBC $C1                      ; $8807  E5 C1

loc_18_8809:
    TAY                          ; $8809  A8
    BNE loc_18_8814              ; $880A  D0 08

loc_18_880C:
    LDA $0720,X                  ; $880C  BD 20 07
    STA $C2                      ; $880F  85 C2
    LDY $0724,X                  ; $8811  BC 24 07

loc_18_8814:
    CPX #$28                     ; $8814  E0 28
    BCS loc_18_8835              ; $8816  B0 1D
    LDA $D6                      ; $8818  A5 D6
    BPL loc_18_8835              ; $881A  10 19
    LDA $D8                      ; $881C  A5 D8
    BEQ loc_18_8835              ; $881E  F0 15
    STA $C4                      ; $8820  85 C4
    STY $C1                      ; $8822  84 C1
    LDA $C2                      ; $8824  A5 C2
    PHA                          ; $8826  48
    JSR sub_18_8006              ; $8827  20 06 80
    PLA                          ; $882A  68
    CLC                          ; $882B  18
    ADC $C2                      ; $882C  65 C2
    STA $C2                      ; $882E  85 C2
    LDA #$00                     ; $8830  A9 00
    ADC $C1                      ; $8832  65 C1
    TAY                          ; $8834  A8

loc_18_8835:
    TXA                          ; $8835  8A
    AND #$03                     ; $8836  29 03
    BNE loc_18_8849              ; $8838  D0 0F
    TYA                          ; $883A  98
    AND #$0F                     ; $883B  29 0F
    LDY #$07                     ; $883D  A0 07
    ORA ($C5),Y                  ; $883F  11 C5
    STA $C2                      ; $8841  85 C2
    LDA #$00                     ; $8843  A9 00
    STA $C1                      ; $8845  85 C1
    BEQ loc_18_8884              ; $8847  F0 3B

loc_18_8849:
    TYA                          ; $8849  98
    LDY #$08                     ; $884A  A0 08

loc_18_884C:
    DEY                          ; $884C  88
    CMP $8953,Y                  ; $884D  D9 53 89
    BCC loc_18_884C              ; $8850  90 FA
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
    BEQ loc_18_8870              ; $8865  F0 09

loc_18_8867:
    LSR $C1                      ; $8867  46 C1
    ROR $C2                      ; $8869  66 C2
    SEC                          ; $886B  38
    SBC #$08                     ; $886C  E9 08
    BNE loc_18_8867              ; $886E  D0 F7

loc_18_8870:
    LDY #$00                     ; $8870  A0 00
    LDA $0714,X                  ; $8872  BD 14 07
    BEQ loc_18_8884              ; $8875  F0 0D
    BPL loc_18_887A              ; $8877  10 01
    DEY                          ; $8879  88

loc_18_887A:
    CLC                          ; $887A  18
    ADC $C2                      ; $887B  65 C2
    STA $C2                      ; $887D  85 C2
    TYA                          ; $887F  98
    ADC $C1                      ; $8880  65 C1
    STA $C1                      ; $8882  85 C1

loc_18_8884:
    LDY #$02                     ; $8884  A0 02
    LDA $C2                      ; $8886  A5 C2
    JSR sub_18_80EC              ; $8888  20 EC 80
    TXA                          ; $888B  8A
    AND #$03                     ; $888C  29 03
    TAY                          ; $888E  A8
    LDA $C1                      ; $888F  A5 C1
    CMP $077C,Y                  ; $8891  D9 7C 07
    BEQ loc_18_88A0              ; $8894  F0 0A
    STA $077C,Y                  ; $8896  99 7C 07
    ORA #$08                     ; $8899  09 08
    LDY #$03                     ; $889B  A0 03
    JSR sub_18_80EC              ; $889D  20 EC 80

loc_18_88A0:
    LDA $0704,X                  ; $88A0  BD 04 07
    AND #$20                     ; $88A3  29 20
    BEQ loc_18_88FA              ; $88A5  F0 53
    LDA $0718,X                  ; $88A7  BD 18 07
    BEQ loc_18_88F2              ; $88AA  F0 46
    LDY #$00                     ; $88AC  A0 00
    ASL A                        ; $88AE  0A
    PHP                          ; $88AF  08
    BCC loc_18_88B8              ; $88B0  90 06
    EOR #$FF                     ; $88B2  49 FF
    CLC                          ; $88B4  18
    ADC #$01                     ; $88B5  69 01
    DEY                          ; $88B7  88

loc_18_88B8:
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
    BNE loc_18_88FA              ; $88E1  D0 17
    TXA                          ; $88E3  8A
    BEQ loc_18_88FA              ; $88E4  F0 14
    LDA $8959,Y                  ; $88E6  B9 59 89
    STA $0720,X                  ; $88E9  9D 20 07
    LDA $895A,Y                  ; $88EC  B9 5A 89
    STA $0724,X                  ; $88EF  9D 24 07

loc_18_88F2:
    LDA $0704,X                  ; $88F2  BD 04 07
    AND #$DF                     ; $88F5  29 DF
    STA $0704,X                  ; $88F7  9D 04 07

loc_18_88FA:
    LDY #$04                     ; $88FA  A0 04
    LDA ($C5),Y                  ; $88FC  B1 C5
    AND #$7F                     ; $88FE  29 7F
    BEQ loc_18_8914              ; $8900  F0 12
    CLC                          ; $8902  18
    ADC $0708,X                  ; $8903  7D 08 07
    STA $0708,X                  ; $8906  9D 08 07
    BCC loc_18_8914              ; $8909  90 09
    LDA $0704,X                  ; $890B  BD 04 07
    CLC                          ; $890E  18
    ADC #$40                     ; $890F  69 40
    STA $0704,X                  ; $8911  9D 04 07

loc_18_8914:
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
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$4C,$8A,$DB,$8D,$13  ; $8A35
    .byte $93,$02,$97,$7E,$9B,$B2,$9F,$10,$A2,$A7,$A6,$EA,$AA,$B5,$AE,$7D  ; $8A45
    .byte $B2,$64,$B7,$48,$BA,$DC,$BD,$C8,$C3,$90,$C4,$D5,$C5,$DD,$C6,$F3  ; $8A55
    .byte $C7,$C0,$C8,$34,$C8,$D0,$C9,$E0,$CA,$72,$CB,$B0,$CF,$93,$CF,$CF  ; $8A65
    .byte $CF,$E2,$CF,$FB,$D0,$07,$D0,$22,$D0,$40,$D0,$84,$D0,$94,$D0,$A7  ; $8A75
    .byte $D0,$C4,$D0,$EB,$D1,$2F,$D1,$49,$D1,$AF,$D1,$D6,$D1,$EC,$D1,$FE  ; $8A85
    .byte $D2,$20,$D2,$3D,$D2,$4D,$D2,$66,$D2,$84,$D2,$9B,$D2,$AB,$D2,$E0  ; $8A95
    .byte $D3,$0F,$D3,$33,$D3,$86,$D3,$AB,$D3,$D0,$D4,$29,$D4,$56,$D4,$84  ; $8AA5
    .byte $D4,$A1,$D4,$B7,$D4,$C9,$D4,$D5,$D4,$E1,$D4,$EF,$D5,$03,$D5,$0F  ; $8AB5
    .byte $D5,$21,$D5,$41,$D5,$63,$D5,$91,$D5,$B4,$D5,$D0,$D6,$15,$D6,$57  ; $8AC5
    .byte $D6,$67,$D8,$58,$D8,$B8,$1F,$01,$F0,$10,$80,$00,$00,$00,$1F,$1D  ; $8AD5
    .byte $E0,$0F,$D9,$01,$00,$00,$1F,$1D,$E0,$11,$80,$00,$00,$80,$1D,$1B  ; $8AE5
    .byte $A0,$02,$80,$00,$00,$00,$1F,$01,$D0,$0F,$82,$00,$39,$00,$1F,$01  ; $8AF5
    .byte $E0,$0A,$00,$00,$00,$00,$1F,$1D,$E0,$0F,$80,$00,$00,$80,$1F,$1D  ; $8B05
    .byte $E0,$0D,$80,$00,$00,$80,$1E,$15,$E0,$0A,$E0,$01,$00,$00,$1F,$1B  ; $8B15
    .byte $A0,$05,$CB,$02,$3C,$00,$1E,$14,$A0,$10,$C9,$00,$42,$00,$1F,$1D  ; $8B25
    .byte $D0,$0F,$E3,$03,$00,$00,$1E,$0D,$80,$07,$E5,$04,$17,$00,$1D,$09  ; $8B35
    .byte $90,$03,$CB,$01,$37,$00,$1E,$0D,$E0,$12,$F0,$01,$1F,$00,$1F,$1B  ; $8B45
    .byte $F0,$10,$E6,$01,$01,$00,$1F,$1D,$D0,$0F,$F0,$05,$0F,$00,$1F,$1D  ; $8B55
    .byte $E0,$08,$B7,$01,$40,$00,$1F,$1C,$D0,$08,$9A,$01,$22,$00,$1F,$13  ; $8B65
    .byte $E0,$0D,$58,$00,$15,$00,$1F,$19,$50,$10,$9E,$20,$26,$00,$1F,$1F  ; $8B75
    .byte $E0,$1B,$9E,$58,$7C,$00,$18,$00,$D0,$13,$80,$00,$00,$00,$1E,$14  ; $8B85
    .byte $E0,$0F,$0F,$00,$16,$00,$07,$1F,$F0,$06,$80,$00,$00,$00,$1F,$01  ; $8B95
    .byte $D0,$1E,$72,$23,$11,$80,$1F,$1B,$C0,$05,$D2,$03,$48,$00,$1E,$0D  ; $8BA5
    .byte $F0,$14,$F8,$01,$2E,$00,$1E,$13,$E0,$02,$DA,$00,$01,$00,$1F,$1D  ; $8BB5
    .byte $D0,$06,$E3,$03,$00,$00,$1F,$1A,$A0,$05,$FF,$01,$33,$00,$1E,$1A  ; $8BC5
    .byte $A0,$05,$E4,$04,$00,$00,$1F,$19,$A0,$02,$00,$00,$00,$00,$1F,$04  ; $8BD5
    .byte $80,$02,$80,$00,$00,$00,$1F,$1E,$D0,$01,$C6,$00,$32,$00,$1F,$1C  ; $8BE5
    .byte $F0,$1F,$EF,$4B,$06,$00,$19,$1F,$F0,$1F,$95,$02,$1D,$00,$1F,$1E  ; $8BF5
    .byte $F0,$02,$EF,$00,$46,$00,$17,$02,$E0,$0F,$00,$00,$00,$00,$1F,$1F  ; $8C05
    .byte $F0,$1F,$FF,$09,$18,$80,$1F,$1F,$F0,$1F,$00,$00,$00,$00,$1F,$1F  ; $8C15
    .byte $F0,$1F,$FF,$02,$00,$00,$1F,$1F,$F0,$1F,$92,$7F,$00,$00,$1F,$01  ; $8C25
    .byte $00,$0F,$E3,$7F,$00,$00,$1F,$1F,$F0,$1F,$FF,$4C,$00,$00,$1F,$1F  ; $8C35
    .byte $F0,$1F,$99,$7F,$00,$00,$1D,$1F,$F0,$1F,$80,$00,$00,$00,$1F,$1F  ; $8C45
    .byte $F0,$1F,$B7,$27,$00,$00,$1F,$1A,$A0,$07,$CF,$36,$00,$80,$1F,$1F  ; $8C55
    .byte $F0,$1F,$A6,$7F,$00,$80,$1C,$13,$10,$1F,$FF,$7F,$00,$00,$1F,$1E  ; $8C65
    .byte $F0,$1F,$EB,$7C,$47,$80,$1F,$1B,$D0,$0F,$E1,$67,$18,$00,$1F,$1F  ; $8C75
    .byte $F0,$1F,$80,$00,$00,$80,$1F,$1F,$F0,$1F,$D4,$03,$41,$00,$1F,$1F  ; $8C85
    .byte $F0,$0F,$D7,$56,$7F,$00,$1F,$16,$E0,$19,$E4,$64,$1E,$00,$1F,$1F  ; $8C95
    .byte $F0,$10,$BC,$02,$00,$00,$1F,$1F,$F0,$1F,$A5,$7F,$00,$00,$1F,$1F  ; $8CA5
    .byte $F0,$1F,$D3,$16,$00,$00,$1F,$1F,$F0,$04,$80,$00,$00,$00,$1A,$1F  ; $8CB5
    .byte $E0,$1C,$00,$00,$00,$00,$1F,$1E,$C0,$07,$00,$00,$00,$80,$1F,$01  ; $8CC5
    .byte $F0,$05,$E1,$0D,$00,$00,$1F,$1F,$F0,$1F,$FF,$7F,$00,$00,$1C,$1F  ; $8CD5
    .byte $F0,$07,$FF,$7F,$36,$00,$19,$0B,$F0,$12,$FF,$7F,$36,$00,$1F,$12  ; $8CE5
    .byte $40,$1E,$FF,$7F,$51,$00,$1F,$1F,$F0,$1F,$FF,$19,$00,$00,$1F,$1F  ; $8CF5
    .byte $F0,$0F,$D7,$09,$7F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$8D  ; $8D05
    .byte $1C,$8E,$E8,$90,$F1,$92,$23,$05,$01,$D8,$04,$00,$A0,$18,$40,$07  ; $8D15
    .byte $0B,$09,$02,$08,$17,$06,$E6,$02,$9F,$08,$04,$06,$0A,$02,$01,$DD  ; $8D25
    .byte $01,$7D,$18,$C0,$08,$0E,$07,$08,$7D,$7F,$03,$6C,$73,$72,$6B,$6A  ; $8D35
    .byte $62,$61,$68,$67,$03,$78,$12,$00,$8D,$7D,$73,$02,$80,$18,$40,$08  ; $8D45
    .byte $17,$06,$E6,$07,$0B,$02,$03,$8C,$08,$04,$06,$0A,$02,$01,$CB,$01  ; $8D55
    .byte $6B,$18,$C0,$08,$0E,$07,$08,$6C,$6B,$71,$65,$67,$6B,$71,$65,$67  ; $8D65
    .byte $03,$71,$72,$73,$0E,$01,$8D,$1F,$80,$18,$40,$08,$02,$06,$E6,$07  ; $8D75
    .byte $09,$7C,$7A,$7C,$7E,$60,$02,$01,$03,$8C,$08,$10,$02,$01,$AC,$04  ; $8D85
    .byte $00,$04,$00,$08,$02,$06,$F0,$93,$71,$60,$73,$60,$76,$60,$9A,$60  ; $8D95
    .byte $7A,$80,$02,$9A,$60,$78,$02,$80,$B1,$06,$64,$93,$96,$9A,$06,$F0  ; $8DA5
    .byte $02,$9D,$02,$9C,$98,$02,$9C,$02,$9D,$9F,$01,$B8,$08,$0B,$02,$01  ; $8DB5
    .byte $D8,$80,$08,$02,$91,$73,$60,$9A,$80,$02,$9A,$60,$BA,$BB,$BA,$BB  ; $8DC5
    .byte $9A,$02,$B9,$D5,$77,$79,$01,$BA,$08,$0B,$02,$01,$DA,$0E,$01,$8D  ; $8DD5
    .byte $96,$04,$48,$08,$02,$06,$FF,$07,$05,$89,$08,$18,$07,$07,$69,$07  ; $8DE5
    .byte $09,$69,$07,$0A,$89,$07,$0B,$02,$A9,$01,$69,$60,$08,$02,$07,$08  ; $8DF5
    .byte $67,$02,$01,$89,$07,$09,$69,$07,$0A,$C9,$01,$89,$60,$07,$08,$67  ; $8E05
    .byte $01,$69,$01,$A9,$87,$89,$80,$89,$80,$A9,$8E,$90,$01,$C9,$01,$89  ; $8E15
    .byte $80,$03,$93,$98,$BF,$BD,$98,$9A,$9B,$80,$02,$BD,$BF,$02,$03,$C9  ; $8E25
    .byte $A7,$12,$08,$8E,$44,$A4,$A6,$A7,$02,$89,$60,$0E,$01,$8D,$E6,$A4  ; $8E35
    .byte $A9,$AB,$02,$8D,$6E,$60,$06,$E6,$03,$6C,$80,$6C,$60,$18,$00,$03  ; $8E45
    .byte $6E,$6C,$69,$87,$88,$89,$03,$78,$9F,$7D,$03,$88,$87,$03,$98,$9A  ; $8E55
    .byte $7D,$02,$98,$18,$40,$6C,$60,$6C,$80,$6C,$60,$18,$00,$78,$7A,$7D  ; $8E65
    .byte $9F,$01,$9D,$00,$01,$5D,$03,$8A,$88,$06,$64,$89,$84,$83,$82,$8F  ; $8E75
    .byte $88,$87,$8D,$86,$06,$E6,$02,$00,$85,$18,$C0,$07,$0B,$03,$6C,$60  ; $8E85
    .byte $6C,$80,$6C,$18,$00,$06,$64,$7F,$03,$73,$73,$60,$72,$66,$66,$60  ; $8E95
    .byte $65,$70,$63,$00,$82,$8E,$82,$81,$03,$98,$03,$8B,$03,$96,$03,$89  ; $8EA5
    .byte $03,$94,$00,$03,$68,$63,$62,$03,$73,$80,$06,$E6,$75,$7A,$72,$75  ; $8EB5
    .byte $7A,$7E,$03,$69,$66,$62,$03,$78,$7A,$7E,$03,$69,$6C,$66,$67,$69  ; $8EC5
    .byte $6E,$6F,$6E,$66,$01,$B1,$08,$0B,$B1,$01,$71,$18,$40,$07,$09,$16  ; $8ED5
    .byte $8D,$94,$17,$04,$00,$A0,$07,$0A,$09,$02,$0C,$FF,$18,$40,$08,$17  ; $8EE5
    .byte $06,$E6,$02,$9A,$08,$04,$06,$0A,$02,$01,$D8,$01,$78,$60,$18,$C0  ; $8EF5
    .byte $07,$04,$09,$03,$7D,$7F,$03,$6C,$73,$72,$6B,$6A,$62,$61,$68,$67  ; $8F05
    .byte $12,$08,$8F,$49,$03,$78,$73,$80,$18,$40,$07,$09,$08,$17,$06,$E6  ; $8F15
    .byte $51,$01,$93,$01,$53,$08,$04,$06,$0A,$02,$01,$D1,$01,$71,$60,$18  ; $8F25
    .byte $C0,$07,$04,$03,$6C,$6B,$71,$65,$67,$6B,$71,$65,$67,$03,$71,$72  ; $8F35
    .byte $0E,$01,$8E,$E8,$80,$09,$02,$07,$09,$06,$E6,$03,$78,$77,$78,$7A  ; $8F45
    .byte $60,$02,$01,$9D,$08,$10,$02,$01,$BD,$04,$00,$04,$00,$04,$00,$09  ; $8F55
    .byte $02,$08,$11,$07,$08,$06,$3C,$18,$80,$7F,$7F,$73,$60,$73,$60,$7F  ; $8F65
    .byte $7F,$60,$73,$7F,$02,$80,$73,$7F,$12,$00,$8F,$B0,$03,$69,$69,$03  ; $8F75
    .byte $75,$60,$75,$60,$03,$69,$69,$60,$03,$75,$7A,$03,$69,$80,$03,$75  ; $8F85
    .byte $03,$69,$6A,$6A,$03,$76,$60,$76,$60,$03,$6A,$6A,$60,$03,$76,$03  ; $8F95
    .byte $6A,$02,$80,$03,$76,$03,$6A,$0E,$01,$8F,$62,$7B,$7B,$6F,$60,$80  ; $8FA5
    .byte $06,$FF,$08,$02,$8F,$B3,$B6,$02,$B8,$02,$B6,$B4,$02,$B3,$B0,$AE  ; $8FB5
    .byte $8D,$13,$00,$8F,$DE,$6E,$60,$18,$00,$92,$98,$3C,$01,$9D,$02,$7D  ; $8FC5
    .byte $01,$3D,$9B,$9A,$98,$0F,$01,$8F,$60,$AE,$80,$B2,$93,$95,$9A,$04  ; $8FD5
    .byte $00,$04,$00,$80,$08,$12,$07,$09,$06,$96,$69,$6A,$6F,$6A,$6F,$6E  ; $8FE5
    .byte $6F,$73,$75,$76,$6F,$75,$76,$7B,$12,$00,$90,$14,$80,$67,$69,$6A  ; $8FF5
    .byte $67,$6A,$70,$6A,$70,$73,$75,$70,$73,$75,$7C,$0E,$02,$8F,$E6,$80  ; $9005
    .byte $67,$68,$6A,$68,$6A,$6F,$6A,$6F,$73,$74,$6F,$74,$76,$7B,$80,$64  ; $9015
    .byte $67,$69,$67,$69,$70,$69,$70,$73,$75,$70,$73,$75,$7C,$13,$00,$90  ; $9025
    .byte $49,$80,$62,$66,$69,$66,$69,$6E,$69,$6E,$70,$72,$6E,$72,$75,$7A  ; $9035
    .byte $0F,$01,$8F,$E4,$80,$64,$69,$6D,$69,$6D,$70,$69,$6D,$70,$75,$70  ; $9045
    .byte $73,$75,$18,$C0,$06,$E6,$08,$02,$67,$60,$67,$80,$67,$02,$60,$09  ; $9055
    .byte $03,$07,$04,$03,$6E,$6C,$69,$87,$88,$89,$03,$78,$9F,$7D,$03,$88  ; $9065
    .byte $87,$03,$98,$9A,$7D,$98,$40,$09,$02,$07,$09,$67,$60,$67,$80,$67  ; $9075
    .byte $02,$60,$09,$03,$07,$04,$78,$7A,$7D,$9F,$01,$9D,$00,$01,$5D,$03  ; $9085
    .byte $8A,$88,$06,$64,$89,$84,$83,$82,$8F,$88,$87,$8D,$86,$06,$E6,$00  ; $9095
    .byte $85,$40,$18,$C0,$07,$09,$09,$02,$03,$67,$60,$67,$80,$67,$40,$09  ; $90A5
    .byte $03,$07,$03,$18,$00,$7F,$03,$73,$73,$60,$72,$66,$66,$60,$65,$70  ; $90B5
    .byte $63,$00,$82,$8E,$82,$81,$03,$98,$03,$8B,$03,$96,$03,$89,$03,$94  ; $90C5
    .byte $00,$03,$68,$63,$62,$03,$53,$18,$C0,$07,$08,$09,$02,$E2,$AE,$95  ; $90D5
    .byte $60,$01,$B8,$08,$10,$B8,$01,$78,$16,$8F,$5E,$17,$04,$00,$06,$E6  ; $90E5
    .byte $08,$00,$09,$03,$67,$67,$67,$02,$80,$A0,$67,$6C,$6E,$6C,$6E,$71  ; $90F5
    .byte $67,$60,$67,$60,$02,$A0,$65,$01,$4D,$0D,$7F,$02,$01,$6E,$0D,$00  ; $9105
    .byte $6D,$6A,$65,$12,$00,$91,$38,$67,$67,$67,$02,$80,$A0,$67,$6C,$6E  ; $9115
    .byte $6C,$6E,$71,$67,$60,$67,$60,$02,$A0,$65,$67,$6C,$6E,$71,$76,$0E  ; $9125
    .byte $01,$90,$F1,$8C,$A0,$02,$01,$AE,$01,$6E,$08,$15,$79,$74,$70,$04  ; $9135
    .byte $00,$04,$00,$04,$00,$08,$00,$06,$6E,$87,$85,$06,$FA,$87,$60,$87  ; $9145
    .byte $69,$02,$6A,$40,$06,$6E,$8E,$87,$0E,$01,$91,$48,$04,$00,$8C,$8A  ; $9155
    .byte $06,$FA,$8C,$60,$8C,$70,$02,$71,$40,$06,$6E,$93,$8C,$0E,$01,$91  ; $9165
    .byte $61,$83,$82,$06,$FA,$83,$60,$83,$65,$02,$67,$40,$06,$6E,$8A,$8F  ; $9175
    .byte $88,$87,$06,$FA,$88,$60,$88,$67,$02,$68,$40,$06,$6E,$88,$8D,$89  ; $9185
    .byte $87,$06,$FA,$89,$60,$89,$67,$02,$69,$40,$06,$78,$81,$8D,$06,$E6  ; $9195
    .byte $A2,$02,$84,$86,$69,$8E,$62,$60,$6E,$60,$0F,$01,$91,$46,$04,$00  ; $91A5
    .byte $06,$F5,$04,$00,$A3,$80,$C3,$60,$6F,$12,$00,$91,$D0,$A4,$80,$84  ; $91B5
    .byte $60,$6E,$90,$64,$60,$70,$60,$0E,$02,$91,$B7,$A8,$80,$C8,$60,$6F  ; $91C5
    .byte $A9,$80,$C9,$60,$6E,$13,$00,$91,$EC,$A2,$80,$82,$60,$6C,$8E,$62  ; $91D5
    .byte $60,$6E,$60,$0F,$01,$91,$B3,$A9,$80,$89,$60,$73,$95,$69,$60,$75  ; $91E5
    .byte $62,$04,$00,$60,$09,$02,$6E,$60,$7A,$6E,$80,$78,$60,$7A,$6E,$60  ; $91F5
    .byte $73,$75,$78,$6E,$60,$6E,$60,$6E,$78,$7A,$6C,$6E,$60,$7A,$6E,$60  ; $9205
    .byte $73,$75,$78,$6E,$0E,$03,$91,$F6,$09,$03,$16,$91,$44,$17,$04,$00  ; $9215
    .byte $08,$14,$09,$00,$06,$D2,$07,$0A,$63,$63,$02,$83,$07,$08,$6F,$6F  ; $9225
    .byte $6F,$6F,$6F,$02,$8F,$6F,$07,$0A,$63,$63,$63,$07,$08,$6F,$63,$8F  ; $9235
    .byte $6F,$6F,$6F,$6F,$6F,$AF,$68,$68,$0E,$01,$92,$23,$68,$04,$00,$07  ; $9245
    .byte $08,$6F,$8F,$07,$0A,$85,$07,$08,$6F,$8F,$6F,$8F,$07,$0A,$85,$6F  ; $9255
    .byte $6F,$12,$00,$92,$6F,$60,$0E,$01,$92,$52,$02,$83,$68,$88,$A8,$63  ; $9265
    .byte $6F,$6F,$68,$6F,$6F,$04,$00,$04,$00,$63,$07,$08,$6F,$6F,$6F,$07  ; $9275
    .byte $0B,$87,$07,$09,$63,$83,$63,$07,$08,$6F,$6F,$07,$0B,$67,$07,$08  ; $9285
    .byte $6F,$6F,$6F,$07,$09,$0E,$0F,$92,$7C,$04,$00,$63,$07,$08,$6F,$6F  ; $9295
    .byte $6F,$07,$0B,$68,$6F,$07,$09,$83,$6F,$6F,$6F,$6F,$68,$6F,$6F,$6F  ; $92A5
    .byte $0E,$0F,$92,$9E,$04,$00,$07,$08,$6F,$07,$0B,$68,$6F,$63,$68,$6F  ; $92B5
    .byte $6F,$07,$09,$63,$6F,$63,$6F,$6F,$07,$0B,$68,$07,$08,$6F,$6F,$6F  ; $92C5
    .byte $07,$09,$63,$07,$08,$8F,$6F,$07,$0B,$68,$6F,$6F,$07,$09,$63,$6F  ; $92D5
    .byte $63,$12,$00,$92,$F6,$6F,$63,$07,$0B,$68,$6F,$6F,$68,$0E,$03,$92  ; $92E5
    .byte $B9,$68,$07,$0C,$68,$68,$68,$68,$68,$16,$92,$7A,$17,$00,$93,$0B  ; $92F5
    .byte $94,$54,$95,$8F,$96,$9D,$05,$01,$B6,$06,$D2,$07,$08,$08,$00,$09  ; $9305
    .byte $02,$5C,$40,$9C,$7C,$18,$80,$06,$3C,$08,$0A,$7C,$03,$70,$69,$64  ; $9315
    .byte $61,$03,$75,$7C,$03,$69,$6D,$6C,$6B,$69,$18,$00,$08,$00,$06,$D2  ; $9325
    .byte $41,$40,$81,$61,$18,$80,$08,$0A,$61,$6D,$6A,$66,$03,$76,$72,$76  ; $9335
    .byte $7E,$03,$6A,$69,$68,$66,$18,$00,$06,$C8,$08,$00,$42,$40,$82,$82  ; $9345
    .byte $82,$62,$62,$A0,$84,$64,$04,$00,$04,$00,$80,$18,$40,$08,$01,$09  ; $9355
    .byte $01,$9C,$7A,$5C,$40,$60,$06,$96,$9F,$60,$06,$C8,$03,$89,$67,$66  ; $9365
    .byte $62,$67,$80,$06,$F0,$02,$86,$02,$82,$06,$DC,$01,$A6,$01,$66,$67  ; $9375
    .byte $69,$67,$12,$08,$93,$A4,$60,$66,$01,$A4,$08,$0B,$C4,$01,$84,$02  ; $9385
    .byte $A0,$08,$01,$81,$64,$60,$61,$60,$63,$02,$86,$0E,$01,$93,$5D,$02  ; $9395
    .byte $AB,$01,$2D,$0D,$7F,$02,$6E,$01,$2E,$0D,$00,$8D,$8B,$89,$01,$8B  ; $93A5
    .byte $AB,$08,$0B,$02,$01,$CB,$04,$00,$08,$01,$06,$B8,$7F,$7F,$7E,$7F  ; $93B5
    .byte $60,$06,$DC,$02,$9E,$9F,$80,$7F,$7E,$7F,$03,$69,$12,$08,$94,$04  ; $93C5
    .byte $8B,$80,$08,$16,$06,$FF,$07,$09,$A8,$A4,$03,$B7,$08,$01,$06,$A0  ; $93D5
    .byte $07,$08,$7C,$7C,$06,$DC,$7A,$7C,$60,$02,$9A,$9C,$80,$75,$78,$7D  ; $93E5
    .byte $7F,$03,$A9,$65,$67,$69,$02,$A7,$69,$60,$6B,$0E,$01,$93,$BB,$02  ; $93F5
    .byte $AB,$06,$FF,$87,$A2,$03,$B7,$06,$D2,$75,$78,$60,$7D,$60,$02,$9F  ; $9405
    .byte $03,$A9,$65,$67,$69,$01,$67,$02,$C7,$01,$67,$06,$FF,$69,$6B,$67  ; $9415
    .byte $06,$B4,$6E,$6E,$67,$06,$64,$8E,$87,$8E,$8E,$72,$01,$F0,$01,$B0  ; $9425
    .byte $06,$D2,$70,$70,$69,$06,$64,$90,$89,$90,$90,$06,$DC,$73,$B2,$80  ; $9435
    .byte $AC,$06,$64,$8B,$89,$87,$06,$F0,$66,$02,$8F,$16,$93,$5B,$17,$06  ; $9445
    .byte $D2,$07,$08,$08,$00,$09,$02,$59,$40,$99,$79,$02,$C0,$56,$40,$96  ; $9455
    .byte $76,$02,$C0,$06,$C8,$57,$40,$97,$97,$97,$77,$77,$A0,$99,$79,$04  ; $9465
    .byte $08,$04,$08,$08,$0C,$06,$C8,$07,$06,$09,$02,$6B,$6B,$6B,$6B,$12  ; $9475
    .byte $08,$94,$98,$60,$6B,$77,$6B,$6B,$75,$77,$6B,$6B,$70,$6B,$75,$0E  ; $9485
    .byte $03,$94,$76,$80,$18,$40,$08,$01,$06,$DC,$03,$89,$6D,$60,$69,$60  ; $9495
    .byte $6B,$02,$8F,$04,$08,$18,$00,$08,$0C,$06,$C8,$6B,$6B,$6B,$6B,$60  ; $94A5
    .byte $6B,$77,$6B,$6B,$75,$77,$6B,$6B,$70,$6B,$75,$0E,$01,$94,$A8,$18  ; $94B5
    .byte $C0,$08,$06,$06,$E1,$07,$05,$01,$62,$07,$06,$62,$07,$07,$02,$01  ; $94C5
    .byte $A2,$07,$05,$01,$64,$07,$06,$64,$07,$07,$02,$01,$A4,$07,$05,$01  ; $94D5
    .byte $69,$07,$06,$69,$07,$07,$01,$89,$AD,$B0,$AF,$04,$00,$08,$02,$06  ; $94E5
    .byte $B8,$09,$01,$7C,$7C,$7A,$7C,$60,$06,$DC,$02,$9A,$9C,$80,$A0,$12  ; $94F5
    .byte $00,$95,$34,$03,$88,$80,$08,$16,$06,$FF,$07,$09,$A4,$03,$B7,$B4  ; $9505
    .byte $08,$01,$07,$07,$06,$A0,$73,$73,$06,$DC,$72,$73,$60,$02,$92,$93  ; $9515
    .byte $02,$A0,$B8,$75,$77,$78,$02,$B7,$78,$60,$7A,$0E,$01,$94,$F0,$02  ; $9525
    .byte $BF,$9A,$B7,$B3,$D1,$CC,$06,$D2,$6B,$6E,$60,$73,$60,$02,$95,$01  ; $9535
    .byte $B7,$01,$77,$06,$FF,$78,$7A,$77,$06,$B4,$03,$6B,$6B,$64,$06,$64  ; $9545
    .byte $8B,$84,$8B,$8B,$06,$F5,$6E,$AD,$AC,$AB,$02,$89,$02,$8B,$8C,$06  ; $9555
    .byte $D2,$6D,$6D,$64,$06,$64,$8D,$84,$8D,$8D,$06,$F0,$70,$AF,$80,$01  ; $9565
    .byte $28,$0D,$7F,$89,$02,$69,$01,$29,$0D,$00,$06,$64,$87,$86,$84,$06  ; $9575
    .byte $F0,$63,$02,$8C,$18,$00,$16,$94,$74,$17,$06,$D2,$08,$0D,$09,$02  ; $9585
    .byte $6B,$8B,$6B,$02,$C0,$68,$88,$68,$02,$C0,$69,$89,$89,$89,$69,$89  ; $9595
    .byte $73,$75,$60,$8B,$6B,$04,$00,$04,$00,$09,$02,$02,$90,$70,$60,$70  ; $95A5
    .byte $7C,$6E,$90,$6E,$73,$60,$70,$6B,$70,$02,$8E,$6E,$60,$73,$75,$6C  ; $95B5
    .byte $8E,$6C,$72,$60,$8C,$6E,$12,$00,$95,$EE,$02,$8C,$6C,$60,$73,$78  ; $95C5
    .byte $6C,$02,$8C,$6C,$60,$8D,$6D,$02,$8B,$6B,$60,$75,$77,$69,$02,$8B  ; $95D5
    .byte $70,$60,$6D,$69,$6B,$0E,$01,$95,$AC,$09,$01,$02,$93,$73,$60,$9D  ; $95E5
    .byte $7F,$02,$95,$75,$60,$9C,$03,$69,$02,$03,$97,$77,$60,$9E,$03,$6B  ; $95F5
    .byte $03,$97,$75,$9C,$7A,$75,$77,$04,$00,$02,$98,$78,$60,$98,$78,$78  ; $9605
    .byte $02,$80,$7A,$7C,$7F,$03,$69,$12,$08,$96,$49,$02,$84,$64,$60,$84  ; $9615
    .byte $64,$64,$02,$80,$03,$70,$6E,$70,$77,$02,$98,$78,$60,$98,$78,$78  ; $9625
    .byte $02,$80,$A0,$02,$9D,$7D,$60,$9D,$7D,$02,$9F,$7F,$60,$73,$7A,$7F  ; $9635
    .byte $0E,$01,$96,$0C,$02,$87,$67,$60,$87,$67,$67,$02,$80,$67,$03,$6E  ; $9645
    .byte $71,$73,$71,$71,$78,$71,$60,$91,$78,$02,$91,$71,$60,$9D,$7D,$73  ; $9655
    .byte $73,$7A,$73,$60,$93,$7A,$B3,$73,$7F,$60,$7F,$95,$75,$75,$60,$9C  ; $9665
    .byte $75,$60,$95,$7C,$95,$70,$75,$92,$72,$72,$60,$99,$7E,$60,$02,$9E  ; $9675
    .byte $9E,$79,$7E,$97,$77,$77,$60,$9E,$77,$60,$97,$7E,$97,$72,$72,$77  ; $9685
    .byte $02,$C0,$02,$80,$16,$95,$AA,$17,$08,$14,$09,$00,$04,$00,$06,$BE  ; $9695
    .byte $07,$0B,$64,$07,$08,$8F,$8F,$6F,$6F,$6F,$6F,$6F,$6F,$6F,$64,$07  ; $96A5
    .byte $0C,$06,$C8,$02,$88,$0E,$01,$96,$A1,$06,$BE,$07,$09,$64,$07,$0B  ; $96B5
    .byte $88,$88,$88,$68,$68,$60,$6F,$6F,$64,$88,$60,$04,$00,$04,$00,$07  ; $96C5
    .byte $0A,$64,$07,$08,$6F,$6F,$6F,$07,$0B,$88,$6F,$84,$07,$08,$6F,$6F  ; $96D5
    .byte $64,$07,$0B,$88,$07,$08,$6F,$6F,$0E,$07,$96,$D2,$04,$00,$07,$0A  ; $96E5
    .byte $64,$07,$08,$6F,$6F,$07,$0B,$88,$07,$0A,$64,$6F,$64,$64,$07,$08  ; $96F5
    .byte $6F,$6F,$6F,$07,$0D,$A8,$04,$00,$07,$0A,$64,$07,$08,$6F,$6F,$07  ; $9705
    .byte $0A,$64,$60,$64,$6F,$64,$64,$07,$08,$6F,$6F,$6F,$07,$0B,$88,$12  ; $9715
    .byte $00,$97,$2E,$6F,$6F,$0E,$01,$97,$0B,$80,$04,$00,$64,$07,$08,$6F  ; $9725
    .byte $6F,$6F,$07,$0B,$02,$88,$6F,$0E,$01,$97,$2F,$0F,$01,$96,$F1,$04  ; $9735
    .byte $00,$07,$0A,$64,$60,$64,$68,$6F,$64,$60,$88,$64,$6F,$6F,$68,$6F  ; $9745
    .byte $6F,$6F,$04,$00,$64,$07,$08,$6F,$6F,$64,$07,$0B,$88,$6F,$6F,$13  ; $9755
    .byte $00,$97,$70,$0E,$01,$97,$57,$0F,$01,$97,$44,$64,$60,$68,$64,$68  ; $9765
    .byte $07,$0B,$68,$68,$68,$16,$96,$D0,$17,$00,$97,$87,$98,$8C,$99,$F7  ; $9775
    .byte $9B,$16,$05,$01,$C7,$04,$08,$06,$F0,$07,$09,$08,$05,$09,$00,$02  ; $9785
    .byte $92,$B1,$60,$02,$91,$AF,$60,$02,$91,$AF,$60,$06,$F5,$02,$8F,$02  ; $9795
    .byte $91,$92,$06,$C8,$02,$8F,$02,$01,$CD,$6D,$01,$CD,$18,$C0,$08,$02  ; $97A5
    .byte $02,$92,$72,$60,$06,$FF,$02,$93,$18,$00,$0E,$01,$97,$8A,$04,$08  ; $97B5
    .byte $06,$F0,$07,$09,$09,$01,$18,$80,$04,$08,$88,$6B,$6F,$60,$68,$8B  ; $97C5
    .byte $91,$60,$01,$B2,$72,$02,$01,$D2,$B4,$91,$72,$91,$02,$8F,$8D,$12  ; $97D5
    .byte $08,$97,$F2,$6F,$01,$AD,$6D,$01,$ED,$0E,$01,$97,$CD,$80,$96,$01  ; $97E5
    .byte $94,$01,$F4,$08,$05,$04,$08,$02,$92,$B1,$60,$04,$08,$30,$01,$91  ; $97F5
    .byte $02,$01,$51,$AF,$60,$0E,$01,$98,$00,$02,$8F,$02,$91,$92,$13,$08  ; $9805
    .byte $98,$23,$02,$8F,$01,$6D,$02,$CD,$01,$ED,$0F,$01,$97,$FA,$EF,$80  ; $9815
    .byte $74,$80,$74,$80,$74,$02,$80,$A0,$04,$08,$F3,$02,$93,$02,$91,$93  ; $9825
    .byte $02,$94,$02,$96,$98,$31,$01,$93,$02,$01,$53,$01,$71,$12,$48,$98  ; $9835
    .byte $4E,$02,$D1,$01,$F1,$0E,$01,$98,$2D,$01,$D1,$09,$02,$8E,$6C,$EA  ; $9845
    .byte $60,$02,$A8,$A8,$87,$88,$8A,$02,$87,$02,$83,$65,$01,$C3,$01,$63  ; $9855
    .byte $02,$A6,$A6,$85,$86,$88,$65,$60,$65,$80,$65,$80,$65,$02,$80,$02  ; $9865
    .byte $01,$6A,$01,$2A,$0D,$7F,$07,$06,$28,$27,$25,$23,$21,$03,$38,$36  ; $9875
    .byte $40,$0D,$00,$16,$97,$C3,$17,$04,$08,$06,$F0,$07,$08,$08,$05,$09  ; $9885
    .byte $00,$02,$8F,$AD,$60,$02,$8D,$AB,$60,$02,$8D,$AB,$60,$06,$F5,$02  ; $9895
    .byte $8B,$02,$8D,$8F,$06,$C8,$02,$8B,$88,$18,$40,$68,$8A,$02,$88,$02  ; $98A5
    .byte $85,$86,$02,$88,$02,$81,$81,$08,$02,$09,$00,$18,$C0,$8D,$6A,$6D  ; $98B5
    .byte $60,$06,$FF,$02,$8E,$18,$00,$0E,$01,$98,$8C,$04,$00,$04,$00,$08  ; $98C5
    .byte $02,$06,$BE,$07,$08,$09,$01,$18,$C0,$97,$74,$74,$60,$02,$97,$99  ; $98D5
    .byte $74,$02,$9B,$94,$08,$12,$03,$68,$63,$66,$6B,$63,$66,$6D,$63,$66  ; $98E5
    .byte $6B,$63,$66,$6F,$63,$68,$63,$08,$02,$12,$08,$99,$2A,$03,$96,$72  ; $98F5
    .byte $72,$60,$02,$94,$96,$6D,$01,$AD,$01,$6D,$08,$12,$7E,$79,$7E,$03  ; $9905
    .byte $68,$61,$66,$6A,$61,$08,$02,$09,$01,$18,$00,$86,$61,$66,$60,$02  ; $9915
    .byte $87,$0E,$01,$98,$D2,$81,$03,$74,$74,$60,$02,$9B,$99,$74,$01,$B4  ; $9925
    .byte $01,$74,$99,$03,$68,$6D,$60,$6D,$80,$6D,$80,$06,$FA,$85,$64,$83  ; $9935
    .byte $04,$08,$06,$F0,$08,$05,$02,$8F,$AD,$60,$2C,$01,$8D,$02,$01,$4D  ; $9945
    .byte $AB,$60,$2C,$01,$8D,$02,$01,$4D,$02,$8B,$06,$FF,$03,$96,$B7,$BE  ; $9955
    .byte $12,$00,$99,$78,$03,$AA,$03,$B6,$B9,$BD,$03,$A8,$AA,$AB,$AA,$0E  ; $9965
    .byte $01,$99,$45,$03,$AD,$A3,$A7,$AA,$68,$60,$6F,$80,$6F,$80,$02,$01  ; $9975
    .byte $6F,$01,$2F,$0D,$7F,$07,$06,$2D,$2B,$2A,$28,$26,$25,$23,$A0,$40  ; $9985
    .byte $0D,$00,$08,$12,$07,$09,$04,$08,$04,$08,$8C,$65,$88,$65,$8F,$8C  ; $9995
    .byte $85,$88,$8F,$0E,$01,$99,$9D,$04,$08,$8E,$65,$88,$65,$8F,$8E,$85  ; $99A5
    .byte $8A,$85,$0E,$01,$99,$AC,$0F,$01,$99,$9B,$08,$05,$18,$40,$06,$D2  ; $99B5
    .byte $68,$03,$94,$96,$02,$99,$02,$9D,$02,$03,$88,$8D,$6C,$03,$98,$9B  ; $99C5
    .byte $02,$9D,$02,$9F,$02,$03,$8A,$8C,$6B,$03,$97,$9B,$02,$9E,$02,$03  ; $99D5
    .byte $88,$02,$8A,$8B,$6A,$60,$6A,$80,$6A,$80,$6A,$02,$80,$A7,$16,$98  ; $99E5
    .byte $D0,$17,$04,$00,$06,$F0,$08,$00,$09,$03,$04,$00,$02,$88,$6F,$60  ; $99F5
    .byte $6F,$83,$0E,$03,$99,$FF,$04,$00,$02,$86,$6D,$60,$6D,$81,$0E,$02  ; $9A05
    .byte $9A,$0B,$02,$86,$66,$60,$67,$93,$0F,$01,$99,$F7,$04,$00,$04,$00  ; $9A15
    .byte $04,$00,$02,$88,$6F,$60,$6F,$83,$0E,$03,$9A,$25,$13,$00,$9A,$4B  ; $9A25
    .byte $04,$00,$02,$86,$6D,$60,$6D,$81,$0E,$02,$9A,$35,$02,$86,$66,$60  ; $9A35
    .byte $67,$93,$0F,$01,$9A,$23,$02,$8D,$74,$60,$74,$88,$02,$8D,$74,$60  ; $9A45
    .byte $74,$88,$8D,$6D,$6D,$60,$6D,$80,$6D,$80,$8D,$6C,$8B,$04,$00,$04  ; $9A55
    .byte $00,$02,$8B,$72,$60,$72,$86,$0E,$03,$9A,$64,$13,$00,$9A,$8A,$04  ; $9A65
    .byte $00,$02,$8A,$71,$60,$71,$85,$0E,$02,$9A,$74,$02,$8A,$6A,$60,$6A  ; $9A75
    .byte $96,$0F,$01,$9A,$62,$09,$02,$02,$8F,$76,$60,$76,$8A,$02,$8F,$76  ; $9A85
    .byte $60,$76,$8A,$09,$03,$88,$60,$68,$60,$68,$80,$68,$02,$80,$09,$02  ; $9A95
    .byte $06,$FF,$01,$48,$0D,$7F,$01,$4A,$4B,$4C,$4D,$4E,$4F,$50,$0D,$00  ; $9AA5
    .byte $04,$00,$04,$00,$06,$E6,$02,$91,$02,$71,$02,$60,$98,$0E,$03,$9A  ; $9AB5
    .byte $B7,$04,$00,$02,$96,$02,$76,$02,$60,$9D,$0E,$02,$9A,$C6,$02,$96  ; $9AC5
    .byte $02,$95,$94,$0F,$01,$9A,$B5,$02,$8F,$02,$6F,$02,$60,$96,$02,$8F  ; $9AD5
    .byte $02,$6F,$02,$60,$96,$02,$94,$02,$74,$02,$60,$9B,$02,$94,$02,$74  ; $9AE5
    .byte $02,$60,$9B,$02,$8D,$02,$6D,$02,$60,$94,$02,$8D,$02,$6D,$02,$60  ; $9AF5
    .byte $94,$76,$60,$76,$80,$76,$80,$76,$02,$80,$AF,$09,$03,$16,$9A,$21  ; $9B05
    .byte $17,$08,$14,$09,$01,$0B,$FF,$04,$00,$04,$00,$06,$C8,$07,$09,$64  ; $9B15
    .byte $07,$08,$6E,$6E,$07,$09,$64,$06,$2E,$69,$06,$C8,$07,$08,$6E,$6E  ; $9B25
    .byte $6D,$0E,$06,$9B,$1E,$64,$6F,$6F,$06,$2E,$69,$6E,$69,$06,$C8,$6F  ; $9B35
    .byte $6F,$0F,$03,$9B,$1C,$04,$00,$04,$00,$07,$09,$64,$6F,$6F,$64,$06  ; $9B45
    .byte $2E,$69,$06,$C8,$6F,$6F,$6F,$0E,$0D,$9B,$4C,$64,$6F,$06,$2E,$69  ; $9B55
    .byte $6F,$64,$69,$6F,$6F,$69,$06,$C8,$6F,$6F,$06,$2E,$69,$64,$69,$69  ; $9B65
    .byte $69,$04,$00,$06,$C8,$64,$6F,$6F,$63,$06,$2E,$69,$06,$C8,$6F,$6F  ; $9B75
    .byte $6F,$0E,$17,$9B,$76,$04,$00,$04,$00,$64,$6F,$6F,$64,$06,$2E,$69  ; $9B85
    .byte $06,$C8,$6F,$6F,$6F,$0E,$06,$9B,$8C,$64,$6F,$6F,$06,$2E,$69,$6E  ; $9B95
    .byte $69,$06,$C8,$6F,$6F,$0F,$01,$9B,$8A,$16,$9B,$4A,$17,$00,$9B,$BB  ; $9BA5
    .byte $9C,$C5,$9E,$05,$9E,$8C,$05,$02,$00,$0A,$07,$04,$08,$06,$E6,$07  ; $9BB5
    .byte $09,$09,$01,$18,$C0,$04,$08,$08,$07,$02,$CC,$08,$04,$8C,$80,$08  ; $9BC5
    .byte $07,$02,$CD,$08,$04,$8D,$80,$0E,$01,$9B,$CA,$18,$00,$08,$01,$02  ; $9BD5
    .byte $AC,$D3,$8C,$0D,$7F,$02,$CD,$AF,$0D,$00,$02,$CC,$0D,$7F,$8D,$88  ; $9BE5
    .byte $0D,$00,$E7,$02,$AC,$D3,$8C,$0D,$7F,$02,$CD,$AF,$06,$F8,$EC,$0D  ; $9BF5
    .byte $00,$F1,$08,$07,$18,$C0,$01,$AF,$08,$01,$CF,$08,$07,$01,$8F,$8A  ; $9C05
    .byte $A7,$A8,$AC,$AF,$01,$AD,$08,$01,$CD,$08,$07,$02,$01,$8D,$63,$A3  ; $9C15
    .byte $A5,$A6,$AA,$09,$02,$00,$81,$80,$03,$98,$80,$97,$98,$9B,$80,$9A  ; $9C25
    .byte $80,$99,$9A,$9D,$80,$9C,$80,$9B,$9C,$9F,$80,$9E,$80,$9D,$9E,$06  ; $9C35
    .byte $FF,$03,$8A,$8C,$8A,$8C,$07,$05,$8A,$8C,$8A,$8C,$07,$04,$8A,$8C  ; $9C45
    .byte $8A,$8C,$00,$01,$AA,$07,$03,$CA,$07,$02,$01,$AA,$04,$00,$07,$09  ; $9C55
    .byte $06,$FF,$18,$40,$D9,$97,$8D,$93,$8D,$D9,$97,$8D,$93,$8D,$06,$F5  ; $9C65
    .byte $02,$9C,$02,$9A,$99,$12,$00,$9C,$94,$02,$97,$02,$9A,$99,$02,$97  ; $9C75
    .byte $02,$95,$97,$01,$B5,$08,$01,$01,$B5,$08,$07,$0E,$01,$9C,$61,$02  ; $9C85
    .byte $B7,$79,$7A,$02,$9C,$02,$9A,$99,$02,$97,$02,$99,$9A,$01,$BB,$08  ; $9C95
    .byte $0B,$02,$01,$DB,$08,$06,$00,$03,$8F,$08,$0A,$18,$00,$06,$50,$07  ; $9CA5
    .byte $0B,$8E,$8D,$8C,$8B,$8A,$89,$88,$87,$86,$85,$84,$16,$9B,$C0,$17  ; $9CB5
    .byte $04,$00,$06,$46,$07,$0A,$08,$11,$09,$02,$18,$80,$0C,$FF,$04,$00  ; $9CC5
    .byte $04,$00,$80,$78,$02,$9D,$98,$9F,$98,$7D,$80,$78,$80,$79,$02,$9F  ; $9CD5
    .byte $99,$03,$89,$81,$67,$80,$61,$13,$08,$9D,$0E,$0E,$02,$9C,$D5,$80  ; $9CE5
    .byte $03,$78,$02,$9D,$98,$9F,$98,$7D,$80,$79,$80,$79,$02,$9F,$99,$03  ; $9CF5
    .byte $89,$81,$67,$80,$61,$0F,$01,$9C,$D3,$80,$03,$78,$02,$9D,$98,$9F  ; $9D05
    .byte $98,$7D,$80,$78,$80,$7A,$02,$9D,$9A,$9F,$9A,$7D,$80,$7A,$08,$07  ; $9D15
    .byte $06,$F8,$07,$08,$09,$00,$18,$40,$02,$92,$02,$96,$9B,$9E,$7B,$03  ; $9D25
    .byte $8A,$60,$8D,$02,$03,$91,$02,$94,$78,$02,$9B,$78,$9F,$60,$03,$8A  ; $9D35
    .byte $02,$03,$8F,$02,$92,$99,$9B,$76,$9B,$80,$7E,$BE,$03,$A8,$AA,$AD  ; $9D45
    .byte $08,$07,$09,$01,$00,$89,$80,$88,$80,$87,$88,$8B,$80,$8A,$80,$89  ; $9D55
    .byte $8A,$8D,$80,$8C,$80,$8B,$8C,$8F,$80,$8E,$80,$8D,$8E,$06,$FF,$92  ; $9D65
    .byte $94,$92,$94,$07,$05,$92,$94,$92,$94,$07,$04,$92,$94,$92,$94,$00  ; $9D75
    .byte $01,$B2,$07,$03,$D2,$07,$02,$01,$B2,$04,$00,$04,$00,$80,$08,$07  ; $9D85
    .byte $06,$FF,$07,$08,$09,$02,$6D,$02,$93,$8D,$80,$18,$80,$08,$0E,$06  ; $9D95
    .byte $5A,$07,$07,$7C,$03,$69,$6B,$64,$69,$70,$18,$40,$0E,$01,$9D,$90  ; $9DA5
    .byte $08,$07,$06,$F5,$07,$07,$02,$81,$02,$03,$97,$95,$13,$00,$9D,$D8  ; $9DB5
    .byte $02,$93,$02,$97,$95,$02,$93,$02,$90,$93,$02,$92,$02,$90,$8E,$0F  ; $9DC5
    .byte $01,$9D,$8E,$02,$B3,$75,$77,$02,$99,$02,$97,$96,$02,$94,$02,$96  ; $9DD5
    .byte $97,$96,$80,$AF,$B6,$B9,$00,$9B,$80,$08,$0A,$18,$00,$06,$50,$07  ; $9DE5
    .byte $0B,$03,$8F,$8E,$8D,$8C,$8B,$8A,$89,$88,$87,$86,$16,$9C,$C5,$17  ; $9DF5
    .byte $04,$00,$08,$0E,$09,$02,$04,$00,$06,$DC,$02,$88,$6F,$A0,$06,$82  ; $9E05
    .byte $B4,$A8,$06,$DC,$12,$00,$9E,$29,$02,$89,$70,$A0,$06,$82,$B5,$A9  ; $9E15
    .byte $0E,$05,$9E,$0B,$02,$87,$6E,$A0,$06,$82,$B3,$A7,$06,$DC,$02,$86  ; $9E25
    .byte $6D,$A0,$06,$82,$B2,$A6,$06,$DC,$02,$85,$6C,$A0,$06,$82,$B1,$A5  ; $9E35
    .byte $04,$00,$06,$DC,$02,$83,$6A,$A0,$06,$82,$AF,$A3,$0E,$01,$9E,$45  ; $9E45
    .byte $06,$DC,$C8,$C8,$C8,$C8,$01,$E8,$02,$C8,$02,$01,$88,$60,$04,$00  ; $9E55
    .byte $02,$89,$75,$A0,$06,$82,$AE,$B3,$06,$DC,$0E,$06,$9E,$63,$02,$8A  ; $9E65
    .byte $76,$A0,$06,$82,$B1,$B6,$06,$DC,$02,$83,$6F,$A0,$06,$82,$AA,$AF  ; $9E75
    .byte $06,$F0,$E3,$16,$9E,$05,$17,$04,$00,$04,$00,$04,$00,$06,$3C,$08  ; $9E85
    .byte $19,$09,$00,$07,$09,$68,$60,$68,$6B,$60,$68,$6C,$60,$6C,$60,$68  ; $9E95
    .byte $02,$80,$12,$00,$9E,$B1,$68,$60,$0E,$01,$9E,$90,$6B,$6B,$0F,$05  ; $9EA5
    .byte $9E,$8E,$04,$00,$69,$60,$69,$69,$80,$69,$69,$69,$60,$69,$02,$80  ; $9EB5
    .byte $6B,$6B,$0E,$03,$9E,$B7,$08,$14,$06,$C8,$07,$0B,$CC,$CC,$CB,$CB  ; $9EC5
    .byte $EA,$07,$08,$AF,$AD,$08,$19,$06,$3C,$07,$08,$68,$69,$6A,$6B,$6C  ; $9ED5
    .byte $6B,$6A,$69,$08,$14,$06,$C8,$04,$00,$02,$85,$06,$01,$02,$8A,$06  ; $9EE5
    .byte $C8,$6E,$6E,$85,$6E,$6E,$06,$01,$8A,$06,$C8,$6E,$6E,$0E,$08,$9E  ; $9EF5
    .byte $EC,$07,$0B,$AA,$AA,$AA,$AA,$16,$9E,$8C,$17,$00,$9F,$19,$A0,$36  ; $9F05
    .byte $A1,$33,$A2,$3A,$05,$01,$A7,$0A,$02,$04,$00,$04,$00,$06,$5A,$07  ; $9F15
    .byte $09,$09,$02,$08,$13,$18,$80,$90,$60,$02,$01,$DA,$01,$9A,$60,$08  ; $9F25
    .byte $04,$79,$79,$A0,$06,$6E,$08,$03,$03,$6D,$80,$07,$0C,$18,$C0,$6D  ; $9F35
    .byte $A0,$0E,$01,$9F,$20,$06,$5A,$08,$13,$07,$09,$18,$80,$03,$96,$60  ; $9F45
    .byte $02,$01,$DD,$01,$9D,$60,$08,$04,$7C,$7C,$A0,$06,$46,$08,$1A,$07  ; $9F55
    .byte $0B,$18,$C0,$03,$6C,$60,$18,$80,$64,$07,$0A,$18,$C0,$6C,$60,$07  ; $9F65
    .byte $08,$18,$80,$64,$18,$C0,$6C,$60,$06,$F0,$08,$01,$18,$80,$61,$63  ; $9F75
    .byte $65,$02,$C8,$60,$C7,$C5,$04,$00,$07,$00,$A0,$07,$09,$08,$05,$18  ; $9F85
    .byte $80,$02,$01,$96,$07,$04,$0D,$08,$5B,$5C,$07,$09,$01,$DD,$0D,$00  ; $9F95
    .byte $80,$7B,$80,$03,$68,$80,$02,$03,$94,$01,$55,$07,$08,$0D,$1E,$56  ; $9FA5
    .byte $01,$96,$07,$09,$0D,$00,$8F,$01,$B1,$08,$01,$F1,$01,$B1,$60,$08  ; $9FB5
    .byte $05,$9D,$54,$02,$60,$01,$9D,$07,$05,$0D,$64,$01,$71,$0D,$00,$07  ; $9FC5
    .byte $09,$0E,$01,$9F,$8B,$02,$9D,$9B,$60,$99,$02,$9B,$94,$60,$03,$88  ; $9FD5
    .byte $02,$86,$85,$60,$83,$60,$41,$02,$60,$AA,$60,$02,$88,$86,$60,$84  ; $9FE5
    .byte $A3,$03,$B2,$F4,$02,$9F,$9D,$60,$9B,$02,$9D  ; $9FF5
