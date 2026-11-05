; PRG 8 KB bank $1E at $8000
.segment "BANK1E"
.org $8000

    JMP loc_1E_806C              ; $8000  4C 6C 80

    JMP loc_1E_80FE              ; $8003  4C FE 80


sub_1E_8006:
    LDA #$00                     ; $8006  A9 00
    STA $C2                      ; $8008  85 C2
    LDY #$08                     ; $800A  A0 08

loc_1E_800C:
    ASL $C2                      ; $800C  06 C2
    ROL $C1                      ; $800E  26 C1
    BCC loc_1E_801F              ; $8010  90 0D
    CLC                          ; $8012  18
    LDA $C2                      ; $8013  A5 C2
    ADC $C4                      ; $8015  65 C4
    STA $C2                      ; $8017  85 C2
    LDA $C1                      ; $8019  A5 C1
    ADC #$00                     ; $801B  69 00
    STA $C1                      ; $801D  85 C1

loc_1E_801F:
    DEY                          ; $801F  88
    BNE loc_1E_800C              ; $8020  D0 EA
    RTS                          ; $8022  60


sub_1E_8023:
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


sub_1E_803A:
    STY $C1                      ; $803A  84 C1
    LDY #$00                     ; $803C  A0 00
    CMP #$C0                     ; $803E  C9 C0
    BCS loc_1E_8047              ; $8040  B0 05
    STA $C2                      ; $8042  85 C2
    LDA ($C1),Y                  ; $8044  B1 C1
    RTS                          ; $8046  60


loc_1E_8047:
    SEC                          ; $8047  38
    SBC #$20                     ; $8048  E9 20
    STA $C2                      ; $804A  85 C2
    LDA #$07                     ; $804C  A9 07
    STA $8000                    ; $804E  8D 00 80
    LDA #$1D                     ; $8051  A9 1D
    STA $8001                    ; $8053  8D 01 80
    LDA ($C1),Y                  ; $8056  B1 C1
    PHA                          ; $8058  48
    LDA #$07                     ; $8059  A9 07
    STA $8000                    ; $805B  8D 00 80
    LDA #$1F                     ; $805E  A9 1F
    STA $8001                    ; $8060  8D 01 80
    LDA #$20                     ; $8063  A9 20
    CLC                          ; $8065  18
    ADC $C2                      ; $8066  65 C2
    STA $C2                      ; $8068  85 C2
    PLA                          ; $806A  68
    RTS                          ; $806B  60


loc_1E_806C:
    LDA $C0                      ; $806C  A5 C0
    LSR A                        ; $806E  4A
    BCS loc_1E_80D7              ; $806F  B0 66
    LDA $D0                      ; $8071  A5 D0
    ORA $D1                      ; $8073  05 D1
    BEQ loc_1E_807A              ; $8075  F0 03
    JSR sub_1E_8252              ; $8077  20 52 82

loc_1E_807A:
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

loc_1E_808C:
    LSR $CF                      ; $808C  46 CF
    BCC loc_1E_8099              ; $808E  90 09
    LDA $CF                      ; $8090  A5 CF
    ORA #$80                     ; $8092  09 80
    STA $CF                      ; $8094  85 CF
    JSR sub_1E_82DE              ; $8096  20 DE 82

loc_1E_8099:
    LDA $C0                      ; $8099  A5 C0
    AND #$02                     ; $809B  29 02
    BNE loc_1E_80A6              ; $809D  D0 07
    TXA                          ; $809F  8A
    PHA                          ; $80A0  48
    JSR sub_1E_8393              ; $80A1  20 93 83
    PLA                          ; $80A4  68
    TAX                          ; $80A5  AA

loc_1E_80A6:
    DEX                          ; $80A6  CA
    BPL loc_1E_808C              ; $80A7  10 E3
    PLA                          ; $80A9  68
    STA $CF                      ; $80AA  85 CF
    LSR $C0                      ; $80AC  46 C0
    ASL $C0                      ; $80AE  06 C0
    LDA $CC                      ; $80B0  A5 CC
    AND #$7F                     ; $80B2  29 7F
    BEQ loc_1E_80D7              ; $80B4  F0 21
    LDY #$00                     ; $80B6  A0 00
    STY $C1                      ; $80B8  84 C1
    LDY #$04                     ; $80BA  A0 04

loc_1E_80BC:
    ASL A                        ; $80BC  0A
    ROL $C1                      ; $80BD  26 C1
    DEY                          ; $80BF  88
    BNE loc_1E_80BC              ; $80C0  D0 FA
    CLC                          ; $80C2  18
    ADC $C0                      ; $80C3  65 C0
    STA $C0                      ; $80C5  85 C0
    LDA $C1                      ; $80C7  A5 C1
    ADC $CD                      ; $80C9  65 CD
    BCC loc_1E_80D5              ; $80CB  90 08
    LDA $CC                      ; $80CD  A5 CC
    AND #$80                     ; $80CF  29 80
    STA $CC                      ; $80D1  85 CC
    LDA #$FF                     ; $80D3  A9 FF

loc_1E_80D5:
    STA $CD                      ; $80D5  85 CD

loc_1E_80D7:
    RTS                          ; $80D7  60


sub_1E_80D8:
    TXA                          ; $80D8  8A
    AND #$03                     ; $80D9  29 03
    EOR #$03                     ; $80DB  49 03
    ASL A                        ; $80DD  0A
    ASL A                        ; $80DE  0A
    TAY                          ; $80DF  A8
    LDA #$30                     ; $80E0  A9 30
    CPY #$08                     ; $80E2  C0 08
    BNE loc_1E_80E8              ; $80E4  D0 02
    LDA #$00                     ; $80E6  A9 00

loc_1E_80E8:
    STA $4000,Y                  ; $80E8  99 00 40
    RTS                          ; $80EB  60


sub_1E_80EC:
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


loc_1E_80FE:
    INC $C0                      ; $80FE  E6 C0
    JSR sub_1E_8106              ; $8100  20 06 81
    DEC $C0                      ; $8103  C6 C0
    RTS                          ; $8105  60


sub_1E_8106:
    CMP #$F0                     ; $8106  C9 F0
    BCC loc_1E_810D              ; $8108  90 03
    JMP loc_1E_81AE              ; $810A  4C AE 81


loc_1E_810D:
    CMP $8A40                    ; $810D  CD 40 8A
    BCC sub_1E_8118              ; $8110  90 06
    SEC                          ; $8112  38
    SBC $8A40                    ; $8113  ED 40 8A
    BCS loc_1E_810D              ; $8116  B0 F5

sub_1E_8118:
    ASL A                        ; $8118  0A
    TAX                          ; $8119  AA
    LDY $8A44,X                  ; $811A  BC 44 8A
    TYA                          ; $811D  98
    ORA $8A43,X                  ; $811E  1D 43 8A
    BEQ loc_1E_816E              ; $8121  F0 4B
    LDA $8A43,X                  ; $8123  BD 43 8A
    JSR sub_1E_803A              ; $8126  20 3A 80
    TAY                          ; $8129  A8
    BEQ loc_1E_816F              ; $812A  F0 43
    LDY #$00                     ; $812C  A0 00
    INX                          ; $812E  E8
    STA $C4                      ; $812F  85 C4
    AND #$7F                     ; $8131  29 7F
    CMP $CE                      ; $8133  C5 CE
    BCC loc_1E_816E              ; $8135  90 37
    STA $CE                      ; $8137  85 CE
    BNE loc_1E_8145              ; $8139  D0 0A
    LDA $D6                      ; $813B  A5 D6
    BPL loc_1E_8145              ; $813D  10 06
    LDA $C4                      ; $813F  A5 C4
    BMI loc_1E_8145              ; $8141  30 02
    STY $D7                      ; $8143  84 D7

loc_1E_8145:
    STY $D6                      ; $8145  84 D6
    ASL $C4                      ; $8147  06 C4
    ROR $D6                      ; $8149  66 D6
    BPL loc_1E_814F              ; $814B  10 02
    STX $D7                      ; $814D  86 D7

loc_1E_814F:
    INC $C1                      ; $814F  E6 C1
    LDA $C1                      ; $8151  A5 C1
    STA $D0                      ; $8153  85 D0
    BNE loc_1E_8159              ; $8155  D0 02
    INC $C2                      ; $8157  E6 C2

loc_1E_8159:
    LDA $C2                      ; $8159  A5 C2
    STA $D1                      ; $815B  85 D1
    TYA                          ; $815D  98
    STA $D2                      ; $815E  85 D2
    STA $D3                      ; $8160  85 D3
    STA $D4                      ; $8162  85 D4
    STA $D5                      ; $8164  85 D5
    LDY #$27                     ; $8166  A0 27

loc_1E_8168:
    STA $0700,Y                  ; $8168  99 00 07
    DEY                          ; $816B  88
    BPL loc_1E_8168              ; $816C  10 FA

loc_1E_816E:
    RTS                          ; $816E  60


loc_1E_816F:
    LDX #$01                     ; $816F  A2 01
    STX $C9                      ; $8171  86 C9
    LDX #$99                     ; $8173  A2 99
    STX $CA                      ; $8175  86 CA
    STA $C8                      ; $8177  85 C8
    STA $CB                      ; $8179  85 CB
    STA $CC                      ; $817B  85 CC
    STA $CD                      ; $817D  85 CD
    LDX #$53                     ; $817F  A2 53

loc_1E_8181:
    STA $0728,X                  ; $8181  9D 28 07
    DEX                          ; $8184  CA
    BPL loc_1E_8181              ; $8185  10 FA
    LDX #$03                     ; $8187  A2 03

loc_1E_8189:
    INC $C1                      ; $8189  E6 C1
    BNE loc_1E_818F              ; $818B  D0 02
    INC $C2                      ; $818D  E6 C2

loc_1E_818F:
    LDY $C1                      ; $818F  A4 C1
    LDA $C2                      ; $8191  A5 C2
    JSR sub_1E_803A              ; $8193  20 3A 80
    STA $0754,X                  ; $8196  9D 54 07
    INC $C1                      ; $8199  E6 C1
    BNE loc_1E_819F              ; $819B  D0 02
    INC $C2                      ; $819D  E6 C2

loc_1E_819F:
    LDY $C1                      ; $819F  A4 C1
    LDA $C2                      ; $81A1  A5 C2
    JSR sub_1E_803A              ; $81A3  20 3A 80
    STA $0750,X                  ; $81A6  9D 50 07
    DEX                          ; $81A9  CA
    BPL loc_1E_8189              ; $81AA  10 DD
    BMI sub_1E_81F1              ; $81AC  30 43

loc_1E_81AE:
    STY $C3                      ; $81AE  84 C3
    AND #$07                     ; $81B0  29 07
    JSR sub_1E_8023              ; $81B2  20 23 80
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

loc_1E_81C8:
    LDA #$00                     ; $81C8  A9 00
    STA $CE                      ; $81CA  85 CE
    STA $D0                      ; $81CC  85 D0
    STA $D1                      ; $81CE  85 D1
    STA $D7                      ; $81D0  85 D7
    STA $D8                      ; $81D2  85 D8

sub_1E_81D4:
    LDA $CF                      ; $81D4  A5 CF
    BEQ loc_1E_81E3              ; $81D6  F0 0B
    EOR #$0F                     ; $81D8  49 0F
    STA $CF                      ; $81DA  85 CF
    JSR sub_1E_81F1              ; $81DC  20 F1 81
    LDA #$00                     ; $81DF  A9 00
    STA $CF                      ; $81E1  85 CF

loc_1E_81E3:
    RTS                          ; $81E3  60


sub_1E_81E4:
    LDA #$00                     ; $81E4  A9 00
    LDX #$03                     ; $81E6  A2 03

loc_1E_81E8:
    STA $0754,X                  ; $81E8  9D 54 07
    STA $0750,X                  ; $81EB  9D 50 07
    DEX                          ; $81EE  CA
    BPL loc_1E_81E8              ; $81EF  10 F7

sub_1E_81F1:
    LDA $CF                      ; $81F1  A5 CF
    PHA                          ; $81F3  48
    LDX #$03                     ; $81F4  A2 03

loc_1E_81F6:
    LSR $CF                      ; $81F6  46 CF
    BCS loc_1E_820A              ; $81F8  B0 10
    JSR sub_1E_80D8              ; $81FA  20 D8 80
    LDA $0754,X                  ; $81FD  BD 54 07
    ORA $0750,X                  ; $8200  1D 50 07
    BEQ loc_1E_820A              ; $8203  F0 05
    LDA #$FF                     ; $8205  A9 FF
    STA $077C,X                  ; $8207  9D 7C 07

loc_1E_820A:
    DEX                          ; $820A  CA
    BPL loc_1E_81F6              ; $820B  10 E9
    PLA                          ; $820D  68
    STA $CF                      ; $820E  85 CF
    LDA #$08                     ; $8210  A9 08
    STA $4001                    ; $8212  8D 01 40
    STA $4005                    ; $8215  8D 05 40
    LDA #$0F                     ; $8218  A9 0F
    STA $4015                    ; $821A  8D 15 40
    RTS                          ; $821D  60

    .byte $A5,$C0,$09,$02,$85,$C0,$D0,$CB,$A5,$C0,$29,$FD,$85,$C0,$60,$06  ; $821E
    .byte $C3,$F0,$03,$38,$66,$C3  ; $822E
    LDA $C0                      ; $8234  A5 C0
    AND #$0F                     ; $8236  29 0F
    STA $C0                      ; $8238  85 C0
    LDY $C3                      ; $823A  A4 C3
    STY $CC                      ; $823C  84 CC
    BEQ loc_1E_8247              ; $823E  F0 07
    LDY #$FF                     ; $8240  A0 FF
    CPY $CD                      ; $8242  C4 CD
    BNE loc_1E_8249              ; $8244  D0 03
    INY                          ; $8246  C8

loc_1E_8247:
    STY $CD                      ; $8247  84 CD

loc_1E_8249:
    RTS                          ; $8249  60

    .byte $A9,$00,$38,$E5,$C3,$85,$D8,$60  ; $824A

sub_1E_8252:
    LDA $D3                      ; $8252  A5 D3
    BEQ loc_1E_825B              ; $8254  F0 05
    DEC $D3                      ; $8256  C6 D3
    DEC $D5                      ; $8258  C6 D5
    RTS                          ; $825A  60


loc_1E_825B:
    JSR sub_1E_8386              ; $825B  20 86 83
    STA $C4                      ; $825E  85 C4
    ASL A                        ; $8260  0A
    BCC loc_1E_8273              ; $8261  90 10
    STY $CE                      ; $8263  84 CE
    LDA $D7                      ; $8265  A5 D7
    LSR A                        ; $8267  4A
    BCC loc_1E_8270              ; $8268  90 06
    JSR sub_1E_8118              ; $826A  20 18 81
    JMP loc_1E_825B              ; $826D  4C 5B 82


loc_1E_8270:
    JMP loc_1E_81C8              ; $8270  4C C8 81


loc_1E_8273:
    LSR $C4                      ; $8273  46 C4
    BCC loc_1E_82A6              ; $8275  90 2F
    JSR sub_1E_8386              ; $8277  20 86 83
    ASL A                        ; $827A  0A
    BEQ loc_1E_8289              ; $827B  F0 0C
    ASL $D6                      ; $827D  06 D6
    PHP                          ; $827F  08
    CMP $D6                      ; $8280  C5 D6
    BEQ loc_1E_8296              ; $8282  F0 12
    PLP                          ; $8284  28
    ROR $D6                      ; $8285  66 D6
    INC $D6                      ; $8287  E6 D6

loc_1E_8289:
    JSR sub_1E_8386              ; $8289  20 86 83
    TAX                          ; $828C  AA
    JSR sub_1E_8386              ; $828D  20 86 83
    STA $D0                      ; $8290  85 D0
    STX $D1                      ; $8292  86 D1
    BNE loc_1E_825B              ; $8294  D0 C5

loc_1E_8296:
    TYA                          ; $8296  98
    PLP                          ; $8297  28
    ROR A                        ; $8298  6A
    STA $D6                      ; $8299  85 D6
    CLC                          ; $829B  18
    LDA #$02                     ; $829C  A9 02
    ADC $D0                      ; $829E  65 D0
    STA $D0                      ; $82A0  85 D0
    BCC loc_1E_82A6              ; $82A2  90 02
    INC $D1                      ; $82A4  E6 D1

loc_1E_82A6:
    LSR $C4                      ; $82A6  46 C4
    BCC loc_1E_82AF              ; $82A8  90 05
    JSR sub_1E_8386              ; $82AA  20 86 83
    STA $D4                      ; $82AD  85 D4

loc_1E_82AF:
    LSR $C4                      ; $82AF  46 C4
    BCC loc_1E_82B8              ; $82B1  90 05
    JSR sub_1E_8386              ; $82B3  20 86 83
    STA $D2                      ; $82B6  85 D2

loc_1E_82B8:
    JSR sub_1E_8386              ; $82B8  20 86 83
    STA $D3                      ; $82BB  85 D3
    STA $C1                      ; $82BD  85 C1
    LDA $D4                      ; $82BF  A5 D4
    STA $C4                      ; $82C1  85 C4
    JSR sub_1E_8006              ; $82C3  20 06 80
    LDY $C1                      ; $82C6  A4 C1
    INY                          ; $82C8  C8
    STY $D5                      ; $82C9  84 D5
    INC $C0                      ; $82CB  E6 C0
    JSR sub_1E_8386              ; $82CD  20 86 83
    PHA                          ; $82D0  48
    EOR $CF                      ; $82D1  45 CF
    BEQ loc_1E_82DA              ; $82D3  F0 05
    STA $CF                      ; $82D5  85 CF
    JSR sub_1E_81D4              ; $82D7  20 D4 81

loc_1E_82DA:
    PLA                          ; $82DA  68
    STA $CF                      ; $82DB  85 CF
    RTS                          ; $82DD  60


sub_1E_82DE:
    LDY $0700,X                  ; $82DE  BC 00 07
    BEQ loc_1E_82E6              ; $82E1  F0 03
    JSR sub_1E_8684              ; $82E3  20 84 86

loc_1E_82E6:
    LDA $C0                      ; $82E6  A5 C0
    LSR A                        ; $82E8  4A
    BCS loc_1E_830A              ; $82E9  B0 1F
    JSR sub_1E_86BA              ; $82EB  20 BA 86
    LDA $D3                      ; $82EE  A5 D3
    BEQ loc_1E_82FA              ; $82F0  F0 08
    CPX #$01                     ; $82F2  E0 01
    BEQ loc_1E_82FB              ; $82F4  F0 05
    LDA $D5                      ; $82F6  A5 D5
    BEQ loc_1E_8300              ; $82F8  F0 06

loc_1E_82FA:
    RTS                          ; $82FA  60


loc_1E_82FB:
    DEC $0710,X                  ; $82FB  DE 10 07
    BNE loc_1E_82FA              ; $82FE  D0 FA

loc_1E_8300:
    LDA $0704,X                  ; $8300  BD 04 07
    AND #$04                     ; $8303  29 04
    BNE loc_1E_82FA              ; $8305  D0 F3
    JMP sub_1E_85A3              ; $8307  4C A3 85


loc_1E_830A:
    LDA #$00                     ; $830A  A9 00
    STA $C4                      ; $830C  85 C4
    JSR sub_1E_8386              ; $830E  20 86 83

loc_1E_8311:
    LSR A                        ; $8311  4A
    BCC loc_1E_8320              ; $8312  90 0C
    PHA                          ; $8314  48
    JSR sub_1E_8386              ; $8315  20 86 83
    STA $C3                      ; $8318  85 C3
    LDA $C4                      ; $831A  A5 C4
    JSR sub_1E_8326              ; $831C  20 26 83
    PLA                          ; $831F  68

loc_1E_8320:
    BEQ loc_1E_8333              ; $8320  F0 11
    INC $C4                      ; $8322  E6 C4
    BNE loc_1E_8311              ; $8324  D0 EB

sub_1E_8326:
    JSR sub_1E_8023              ; $8326  20 23 80
    RRA $AD86                    ; $8329  6F 86 AD
    STX $5A                      ; $832C  86 5A
    STX $A7                      ; $832E  86 A7
    STX $A1                      ; $8330  86 A1
    STX $20                      ; $8332  86 20
    STX $83                      ; $8334  86 83
    TAY                          ; $8336  A8
    BNE loc_1E_8349              ; $8337  D0 10
    STA $0710,X                  ; $8339  9D 10 07
    LDA $0704,X                  ; $833C  BD 04 07
    AND #$F8                     ; $833F  29 F8
    ORA #$04                     ; $8341  09 04
    STA $0704,X                  ; $8343  9D 04 07
    JMP sub_1E_80D8              ; $8346  4C D8 80


loc_1E_8349:
    LDA $0704,X                  ; $8349  BD 04 07
    ORA #$20                     ; $834C  09 20
    STA $0704,X                  ; $834E  9D 04 07
    LDA $0718,X                  ; $8351  BD 18 07
    ASL A                        ; $8354  0A
    LDA #$54                     ; $8355  A9 54
    BCS loc_1E_835B              ; $8357  B0 02
    LDA #$0A                     ; $8359  A9 0A

loc_1E_835B:
    STA $071C,X                  ; $835B  9D 1C 07
    TYA                          ; $835E  98
    BPL loc_1E_836B              ; $835F  10 0A
    CPX #$01                     ; $8361  E0 01
    BNE loc_1E_8368              ; $8363  D0 03
    JSR sub_1E_85AE              ; $8365  20 AE 85

loc_1E_8368:
    JMP sub_1E_8644              ; $8368  4C 44 86


loc_1E_836B:
    JSR sub_1E_85AE              ; $836B  20 AE 85
    LDA #$FF                     ; $836E  A9 FF
    STA $077C,X                  ; $8370  9D 7C 07
    DEY                          ; $8373  88
    TXA                          ; $8374  8A
    BNE loc_1E_837F              ; $8375  D0 08
    STA $C3                      ; $8377  85 C3
    TYA                          ; $8379  98
    EOR #$0F                     ; $837A  49 0F
    JMP sub_1E_8636              ; $837C  4C 36 86


loc_1E_837F:
    TYA                          ; $837F  98
    CLC                          ; $8380  18
    ADC $D2                      ; $8381  65 D2
    JMP sub_1E_85DE              ; $8383  4C DE 85


sub_1E_8386:
    LDY $D0                      ; $8386  A4 D0
    LDA $D1                      ; $8388  A5 D1
    INC $D0                      ; $838A  E6 D0
    BNE loc_1E_8390              ; $838C  D0 02
    INC $D1                      ; $838E  E6 D1

loc_1E_8390:
    JMP sub_1E_803A              ; $8390  4C 3A 80


sub_1E_8393:
    TXA                          ; $8393  8A
    ORA #$28                     ; $8394  09 28
    TAX                          ; $8396  AA
    LDA $0728,X                  ; $8397  BD 28 07
    ORA $072C,X                  ; $839A  1D 2C 07
    BEQ loc_1E_83CC              ; $839D  F0 2D
    LDA $0738,X                  ; $839F  BD 38 07
    BEQ loc_1E_83CD              ; $83A2  F0 29
    LDY $0700,X                  ; $83A4  BC 00 07
    BEQ loc_1E_83AF              ; $83A7  F0 06
    JSR sub_1E_8684              ; $83A9  20 84 86
    JSR sub_1E_86BA              ; $83AC  20 BA 86

loc_1E_83AF:
    LDA $0740,X                  ; $83AF  BD 40 07
    SEC                          ; $83B2  38
    SBC $C7                      ; $83B3  E5 C7
    STA $0740,X                  ; $83B5  9D 40 07
    BEQ loc_1E_83BC              ; $83B8  F0 02
    BCS loc_1E_83BF              ; $83BA  B0 03

loc_1E_83BC:
    JSR sub_1E_85A3              ; $83BC  20 A3 85

loc_1E_83BF:
    LDA $0738,X                  ; $83BF  BD 38 07
    SEC                          ; $83C2  38
    SBC $C7                      ; $83C3  E5 C7
    STA $0738,X                  ; $83C5  9D 38 07
    BEQ loc_1E_83CD              ; $83C8  F0 03
    BCC loc_1E_83CD              ; $83CA  90 01

loc_1E_83CC:
    RTS                          ; $83CC  60


loc_1E_83CD:
    JSR sub_1E_8592              ; $83CD  20 92 85
    CMP #$20                     ; $83D0  C9 20
    BCS loc_1E_83DA              ; $83D2  B0 06
    JSR sub_1E_8497              ; $83D4  20 97 84
    JMP loc_1E_83CD              ; $83D7  4C CD 83


loc_1E_83DA:
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
    BPL loc_1E_83EF              ; $83E8  10 05
    LDA $8915,Y                  ; $83EA  B9 15 89
    BNE loc_1E_8406              ; $83ED  D0 17

loc_1E_83EF:
    ASL A                        ; $83EF  0A
    ASL A                        ; $83F0  0A
    LDA $891C,Y                  ; $83F1  B9 1C 89
    BCC loc_1E_8406              ; $83F4  90 10
    STA $C3                      ; $83F6  85 C3
    LDA $0730,X                  ; $83F8  BD 30 07
    AND #$EF                     ; $83FB  29 EF
    STA $0730,X                  ; $83FD  9D 30 07
    LDA $C3                      ; $8400  A5 C3
    LSR A                        ; $8402  4A
    CLC                          ; $8403  18
    ADC $C3                      ; $8404  65 C3

loc_1E_8406:
    CLC                          ; $8406  18
    ADC $0738,X                  ; $8407  7D 38 07
    STA $0738,X                  ; $840A  9D 38 07
    TAY                          ; $840D  A8
    PLA                          ; $840E  68
    AND #$1F                     ; $840F  29 1F
    BNE loc_1E_8419              ; $8411  D0 06
    JSR sub_1E_85A3              ; $8413  20 A3 85
    JMP loc_1E_8491              ; $8416  4C 91 84


loc_1E_8419:
    PHA                          ; $8419  48
    STY $C4                      ; $841A  84 C4
    LDA $073C,X                  ; $841C  BD 3C 07
    STA $C1                      ; $841F  85 C1
    JSR sub_1E_8006              ; $8421  20 06 80
    LDA $C1                      ; $8424  A5 C1
    BNE loc_1E_842A              ; $8426  D0 02
    LDA #$01                     ; $8428  A9 01

loc_1E_842A:
    STA $0740,X                  ; $842A  9D 40 07
    PLA                          ; $842D  68
    TAY                          ; $842E  A8
    DEY                          ; $842F  88
    LDA $0730,X                  ; $8430  BD 30 07
    BPL loc_1E_8440              ; $8433  10 0B
    LDA $0718,X                  ; $8435  BD 18 07
    BNE loc_1E_8454              ; $8438  D0 1A
    JSR sub_1E_8644              ; $843A  20 44 86
    JMP loc_1E_847E              ; $843D  4C 7E 84


loc_1E_8440:
    JSR sub_1E_85AE              ; $8440  20 AE 85
    LDA $CF                      ; $8443  A5 CF
    BMI loc_1E_8454              ; $8445  30 0D
    STY $C3                      ; $8447  84 C3
    TXA                          ; $8449  8A
    AND #$03                     ; $844A  29 03
    TAY                          ; $844C  A8
    LDA #$FF                     ; $844D  A9 FF
    STA $077C,Y                  ; $844F  99 7C 07
    LDY $C3                      ; $8452  A4 C3

loc_1E_8454:
    TXA                          ; $8454  8A
    AND #$03                     ; $8455  29 03
    BNE loc_1E_8466              ; $8457  D0 0D
    STA $C3                      ; $8459  85 C3
    TYA                          ; $845B  98
    AND #$0F                     ; $845C  29 0F
    EOR #$0F                     ; $845E  49 0F
    JSR sub_1E_8636              ; $8460  20 36 86
    JMP loc_1E_847E              ; $8463  4C 7E 84


loc_1E_8466:
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
    JSR sub_1E_85DE              ; $847B  20 DE 85

loc_1E_847E:
    LDA $0730,X                  ; $847E  BD 30 07
    TAY                          ; $8481  A8
    AND #$40                     ; $8482  29 40
    ASL A                        ; $8484  0A
    STA $C4                      ; $8485  85 C4
    TYA                          ; $8487  98
    AND #$7F                     ; $8488  29 7F
    ORA $C4                      ; $848A  05 C4
    STA $0730,X                  ; $848C  9D 30 07
    BPL loc_1E_8496              ; $848F  10 05

loc_1E_8491:
    LDA #$FF                     ; $8491  A9 FF
    STA $0740,X                  ; $8493  9D 40 07

loc_1E_8496:
    RTS                          ; $8496  60


sub_1E_8497:
    CMP #$04                     ; $8497  C9 04
    BCC loc_1E_84A4              ; $8499  90 09
    STA $C4                      ; $849B  85 C4
    JSR sub_1E_8592              ; $849D  20 92 85
    STA $C3                      ; $84A0  85 C3
    LDA $C4                      ; $84A2  A5 C4

loc_1E_84A4:
    JSR sub_1E_8023              ; $84A4  20 23 80
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
    BNE loc_1E_84EA              ; $84DF  D0 09
    LDA #$10                     ; $84E1  A9 10
    ORA $0730,X                  ; $84E3  1D 30 07
    BNE loc_1E_84ED              ; $84E6  D0 05
    LDA #$08                     ; $84E8  A9 08

loc_1E_84EA:
    EOR $0730,X                  ; $84EA  5D 30 07

loc_1E_84ED:
    STA $0730,X                  ; $84ED  9D 30 07
    RTS                          ; $84F0  60

    LDA #$00                     ; $84F1  A9 00
    STA $C8                      ; $84F3  85 C8
    JSR sub_1E_8592              ; $84F5  20 92 85
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
    BEQ loc_1E_8529              ; $851D  F0 0A
    LDA #$04                     ; $851F  A9 04
    BNE loc_1E_8529              ; $8521  D0 06
    LDA #$08                     ; $8523  A9 08
    BNE loc_1E_8529              ; $8525  D0 02
    LDA #$0C                     ; $8527  A9 0C

loc_1E_8529:
    STA $C2                      ; $8529  85 C2
    TXA                          ; $852B  8A
    CLC                          ; $852C  18
    ADC $C2                      ; $852D  65 C2
    TAY                          ; $852F  A8
    LDA $C4                      ; $8530  A5 C4
    CMP #$12                     ; $8532  C9 12
    BCS loc_1E_8547              ; $8534  B0 11
    LDA $0744,Y                  ; $8536  B9 44 07
    SEC                          ; $8539  38
    SBC #$01                     ; $853A  E9 01
    BCS loc_1E_8540              ; $853C  B0 02
    LDA $C3                      ; $853E  A5 C3

loc_1E_8540:
    STA $0744,Y                  ; $8540  99 44 07
    BEQ loc_1E_8566              ; $8543  F0 21
    BNE loc_1E_8555              ; $8545  D0 0E

loc_1E_8547:
    LDA $0744,Y                  ; $8547  B9 44 07
    SEC                          ; $854A  38
    SBC #$01                     ; $854B  E9 01
    BNE loc_1E_8566              ; $854D  D0 17
    STA $0744,Y                  ; $854F  99 44 07
    JSR sub_1E_8575              ; $8552  20 75 85

loc_1E_8555:
    JSR sub_1E_8592              ; $8555  20 92 85
    STA $C3                      ; $8558  85 C3
    JSR sub_1E_8592              ; $855A  20 92 85
    STA $0728,X                  ; $855D  9D 28 07
    LDA $C3                      ; $8560  A5 C3
    STA $072C,X                  ; $8562  9D 2C 07
    RTS                          ; $8565  60


loc_1E_8566:
    LDA #$02                     ; $8566  A9 02
    CLC                          ; $8568  18
    ADC $0728,X                  ; $8569  7D 28 07
    STA $0728,X                  ; $856C  9D 28 07
    BCC loc_1E_8574              ; $856F  90 03
    INC $072C,X                  ; $8571  FE 2C 07

loc_1E_8574:
    RTS                          ; $8574  60


sub_1E_8575:
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
    BMI loc_1E_8591              ; $858C  30 03
    JMP sub_1E_80D8              ; $858E  4C D8 80


loc_1E_8591:
    RTS                          ; $8591  60


sub_1E_8592:
    LDY $0728,X                  ; $8592  BC 28 07
    LDA $072C,X                  ; $8595  BD 2C 07
    INC $0728,X                  ; $8598  FE 28 07
    BNE loc_1E_85A0              ; $859B  D0 03
    INC $072C,X                  ; $859D  FE 2C 07

loc_1E_85A0:
    JMP sub_1E_803A              ; $85A0  4C 3A 80


sub_1E_85A3:
    LDA $0704,X                  ; $85A3  BD 04 07
    AND #$F8                     ; $85A6  29 F8
    ORA #$03                     ; $85A8  09 03
    STA $0704,X                  ; $85AA  9D 04 07
    RTS                          ; $85AD  60


sub_1E_85AE:
    TYA                          ; $85AE  98
    PHA                          ; $85AF  48
    LDY #$00                     ; $85B0  A0 00
    LDA $0704,X                  ; $85B2  BD 04 07
    AND #$F8                     ; $85B5  29 F8
    STA $0704,X                  ; $85B7  9D 04 07
    CPX #$29                     ; $85BA  E0 29
    BEQ loc_1E_85D0              ; $85BC  F0 12
    CPX #$01                     ; $85BE  E0 01
    BNE loc_1E_85D7              ; $85C0  D0 15
    LDA $D3                      ; $85C2  A5 D3
    STA $C1                      ; $85C4  85 C1
    LDA $070C,X                  ; $85C6  BD 0C 07
    STA $C4                      ; $85C9  85 C4
    JSR sub_1E_8006              ; $85CB  20 06 80
    LDY $C1                      ; $85CE  A4 C1

loc_1E_85D0:
    INY                          ; $85D0  C8
    INC $0704,X                  ; $85D1  FE 04 07
    INC $0704,X                  ; $85D4  FE 04 07

loc_1E_85D7:
    TYA                          ; $85D7  98
    STA $0710,X                  ; $85D8  9D 10 07
    PLA                          ; $85DB  68
    TAY                          ; $85DC  A8
    RTS                          ; $85DD  60


sub_1E_85DE:
    CMP #$60                     ; $85DE  C9 60
    BCC loc_1E_85E4              ; $85E0  90 02
    LDA #$5F                     ; $85E2  A9 5F

loc_1E_85E4:
    STA $C3                      ; $85E4  85 C3
    INC $C3                      ; $85E6  E6 C3
    CPX #$28                     ; $85E8  E0 28
    BCC loc_1E_862A              ; $85EA  90 3E
    LDA $071C,X                  ; $85EC  BD 1C 07
    BEQ loc_1E_861D              ; $85EF  F0 2C
    CMP $C3                      ; $85F1  C5 C3
    BNE loc_1E_85FC              ; $85F3  D0 07
    LDA $0730,X                  ; $85F5  BD 30 07
    BPL loc_1E_861D              ; $85F8  10 23
    BMI sub_1E_8644              ; $85FA  30 48

loc_1E_85FC:
    LDA $0718,X                  ; $85FC  BD 18 07
    BEQ loc_1E_861D              ; $85FF  F0 1C
    BCS loc_1E_8607              ; $8601  B0 04
    ORA #$80                     ; $8603  09 80
    BNE loc_1E_8609              ; $8605  D0 02

loc_1E_8607:
    AND #$7F                     ; $8607  29 7F

loc_1E_8609:
    STA $0718,X                  ; $8609  9D 18 07
    LDA $0704,X                  ; $860C  BD 04 07
    ORA #$20                     ; $860F  09 20
    STA $0704,X                  ; $8611  9D 04 07
    LDA $C3                      ; $8614  A5 C3
    LDY $071C,X                  ; $8616  BC 1C 07
    STY $C3                      ; $8619  84 C3
    BNE loc_1E_8627              ; $861B  D0 0A

loc_1E_861D:
    LDA $0704,X                  ; $861D  BD 04 07
    AND #$DF                     ; $8620  29 DF
    STA $0704,X                  ; $8622  9D 04 07
    LDA $C3                      ; $8625  A5 C3

loc_1E_8627:
    STA $071C,X                  ; $8627  9D 1C 07

loc_1E_862A:
    ASL $C3                      ; $862A  06 C3
    LDY $C3                      ; $862C  A4 C3
    LDA $8959,Y                  ; $862E  B9 59 89
    STA $C3                      ; $8631  85 C3
    LDA $895A,Y                  ; $8633  B9 5A 89

sub_1E_8636:
    STA $0724,X                  ; $8636  9D 24 07
    LDA $C3                      ; $8639  A5 C3
    STA $0720,X                  ; $863B  9D 20 07
    LDY #$04                     ; $863E  A0 04
    LDA ($C5),Y                  ; $8640  B1 C5
    BMI loc_1E_864C              ; $8642  30 08

sub_1E_8644:
    LDA $0704,X                  ; $8644  BD 04 07
    AND #$08                     ; $8647  29 08
    BNE loc_1E_864C              ; $8649  D0 01
    RTS                          ; $864B  60


loc_1E_864C:
    LDA #$00                     ; $864C  A9 00
    STA $0708,X                  ; $864E  9D 08 07
    LDA $0704,X                  ; $8651  BD 04 07
    AND #$37                     ; $8654  29 37
    STA $0704,X                  ; $8656  9D 04 07
    RTS                          ; $8659  60

    CPX #$01                     ; $865A  E0 01
    BNE loc_1E_8662              ; $865C  D0 04
    LDA $C3                      ; $865E  A5 C3
    BNE loc_1E_866B              ; $8660  D0 09

loc_1E_8662:
    LDA $070C,X                  ; $8662  BD 0C 07
    AND #$C0                     ; $8665  29 C0
    ORA $C3                      ; $8667  05 C3
    ORA #$30                     ; $8669  09 30

loc_1E_866B:
    STA $070C,X                  ; $866B  9D 0C 07
    RTS                          ; $866E  60

    INC $C3                      ; $866F  E6 C3
    LDA $C3                      ; $8671  A5 C3
    CMP $0700,X                  ; $8673  DD 00 07
    BEQ loc_1E_86A0              ; $8676  F0 28
    STA $0700,X                  ; $8678  9D 00 07
    TAY                          ; $867B  A8
    LDA $0704,X                  ; $867C  BD 04 07
    ORA #$08                     ; $867F  09 08
    STA $0704,X                  ; $8681  9D 04 07

sub_1E_8684:
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

loc_1E_86A0:
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


sub_1E_86BA:
    LDA $0710,X                  ; $86BA  BD 10 07
    STA $C4                      ; $86BD  85 C4
    LDA $0704,X                  ; $86BF  BD 04 07
    AND #$07                     ; $86C2  29 07
    JSR sub_1E_8023              ; $86C4  20 23 80
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
    BCS loc_1E_86E2              ; $86DC  B0 04
    CMP #$F0                     ; $86DE  C9 F0
    BCC loc_1E_871D              ; $86E0  90 3B

loc_1E_86E2:
    LDA #$F0                     ; $86E2  A9 F0
    BNE loc_1E_871A              ; $86E4  D0 34
    LDY #$01                     ; $86E6  A0 01
    LDA ($C5),Y                  ; $86E8  B1 C5
    BEQ loc_1E_86FB              ; $86EA  F0 0F
    TAY                          ; $86EC  A8
    LDA $C4                      ; $86ED  A5 C4
    SEC                          ; $86EF  38
    SBC $8933,Y                  ; $86F0  F9 33 89
    BCC loc_1E_86FB              ; $86F3  90 06
    LDY #$02                     ; $86F5  A0 02
    CMP ($C5),Y                  ; $86F7  D1 C5
    BCS loc_1E_871D              ; $86F9  B0 22

loc_1E_86FB:
    LDY #$02                     ; $86FB  A0 02
    LDA ($C5),Y                  ; $86FD  B1 C5
    JMP loc_1E_871A              ; $86FF  4C 1A 87

    TXA                          ; $8702  8A
    AND #$03                     ; $8703  29 03
    CMP #$01                     ; $8705  C9 01
    BEQ loc_1E_8718              ; $8707  F0 0F
    LDY #$03                     ; $8709  A0 03
    LDA ($C5),Y                  ; $870B  B1 C5
    BEQ loc_1E_8720              ; $870D  F0 11
    TAY                          ; $870F  A8
    LDA $C4                      ; $8710  A5 C4
    SEC                          ; $8712  38
    SBC $8933,Y                  ; $8713  F9 33 89
    BCS loc_1E_871D              ; $8716  B0 05

loc_1E_8718:
    LDA #$00                     ; $8718  A9 00

loc_1E_871A:
    INC $0704,X                  ; $871A  FE 04 07

loc_1E_871D:
    STA $0710,X                  ; $871D  9D 10 07

loc_1E_8720:
    CPX #$28                     ; $8720  E0 28
    BCC loc_1E_8737              ; $8722  90 13
    LDA $CF                      ; $8724  A5 CF
    BPL loc_1E_872B              ; $8726  10 03
    JMP loc_1E_88A0              ; $8728  4C A0 88


loc_1E_872B:
    LDA $CD                      ; $872B  A5 CD
    LDY $CC                      ; $872D  A4 CC
    BMI loc_1E_8733              ; $872F  30 02
    EOR #$FF                     ; $8731  49 FF

loc_1E_8733:
    CMP #$FF                     ; $8733  C9 FF
    BNE loc_1E_8740              ; $8735  D0 09

loc_1E_8737:
    TXA                          ; $8737  8A
    AND #$03                     ; $8738  29 03
    CMP #$01                     ; $873A  C9 01
    BNE loc_1E_8760              ; $873C  D0 22
    BEQ loc_1E_8752              ; $873E  F0 12

loc_1E_8740:
    CPX #$29                     ; $8740  E0 29
    BNE loc_1E_875B              ; $8742  D0 17
    STA $C4                      ; $8744  85 C4
    LDA $0740,X                  ; $8746  BD 40 07
    STA $C1                      ; $8749  85 C1
    JSR sub_1E_8006              ; $874B  20 06 80
    LDA $C1                      ; $874E  A5 C1
    BEQ loc_1E_87AA              ; $8750  F0 58

loc_1E_8752:
    LDA $0710,X                  ; $8752  BD 10 07
    BEQ loc_1E_87AA              ; $8755  F0 53
    LDA #$FF                     ; $8757  A9 FF
    BNE loc_1E_87AA              ; $8759  D0 4F

loc_1E_875B:
    CMP $0710,X                  ; $875B  DD 10 07
    BCC loc_1E_8763              ; $875E  90 03

loc_1E_8760:
    LDA $0710,X                  ; $8760  BD 10 07

loc_1E_8763:
    LSR A                        ; $8763  4A
    LSR A                        ; $8764  4A
    LSR A                        ; $8765  4A
    LSR A                        ; $8766  4A
    EOR #$0F                     ; $8767  49 0F
    STA $C3                      ; $8769  85 C3
    LDY #$06                     ; $876B  A0 06
    LDA ($C5),Y                  ; $876D  B1 C5
    CMP #$05                     ; $876F  C9 05
    BCC loc_1E_8797              ; $8771  90 24
    STA $C4                      ; $8773  85 C4
    LDY $0708,X                  ; $8775  BC 08 07
    LDA $0704,X                  ; $8778  BD 04 07
    ASL A                        ; $877B  0A
    ASL A                        ; $877C  0A
    TYA                          ; $877D  98
    BCC loc_1E_8782              ; $877E  90 02
    EOR #$FF                     ; $8780  49 FF

loc_1E_8782:
    BEQ loc_1E_8797              ; $8782  F0 13
    STA $C1                      ; $8784  85 C1
    JSR sub_1E_8006              ; $8786  20 06 80
    LDA $C1                      ; $8789  A5 C1
    LSR A                        ; $878B  4A
    LSR A                        ; $878C  4A
    CMP #$10                     ; $878D  C9 10
    BCS loc_1E_87A5              ; $878F  B0 14
    CMP $C3                      ; $8791  C5 C3
    BCC loc_1E_8797              ; $8793  90 02
    STA $C3                      ; $8795  85 C3

loc_1E_8797:
    LDA #$10                     ; $8797  A9 10
    STA $C4                      ; $8799  85 C4
    LDA $070C,X                  ; $879B  BD 0C 07
    SEC                          ; $879E  38
    SBC $C3                      ; $879F  E5 C3
    BIT $C4                      ; $87A1  24 C4
    BNE loc_1E_87AA              ; $87A3  D0 05

loc_1E_87A5:
    LDA $070C,X                  ; $87A5  BD 0C 07
    AND #$F0                     ; $87A8  29 F0

loc_1E_87AA:
    LDY #$00                     ; $87AA  A0 00
    JSR sub_1E_80EC              ; $87AC  20 EC 80
    TXA                          ; $87AF  8A
    AND #$03                     ; $87B0  29 03
    TAY                          ; $87B2  A8
    LDA $077C,Y                  ; $87B3  B9 7C 07
    BMI loc_1E_880C              ; $87B6  30 54
    LDY #$05                     ; $87B8  A0 05
    LDA ($C5),Y                  ; $87BA  B1 C5
    BEQ loc_1E_880C              ; $87BC  F0 4E
    STA $C4                      ; $87BE  85 C4
    LDY $0708,X                  ; $87C0  BC 08 07
    LDA $0704,X                  ; $87C3  BD 04 07
    ASL A                        ; $87C6  0A
    ASL A                        ; $87C7  0A
    TYA                          ; $87C8  98
    BCC loc_1E_87CD              ; $87C9  90 02
    EOR #$FF                     ; $87CB  49 FF

loc_1E_87CD:
    BEQ loc_1E_880C              ; $87CD  F0 3D
    STA $C1                      ; $87CF  85 C1
    JSR sub_1E_8006              ; $87D1  20 06 80
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
    BEQ loc_1E_880C              ; $87E5  F0 25
    LDA $0704,X                  ; $87E7  BD 04 07
    BMI loc_1E_87FA              ; $87EA  30 0E
    CLC                          ; $87EC  18
    LDA $C2                      ; $87ED  A5 C2
    ADC $0720,X                  ; $87EF  7D 20 07
    STA $C2                      ; $87F2  85 C2
    TYA                          ; $87F4  98
    ADC $0724,X                  ; $87F5  7D 24 07
    BNE loc_1E_8809              ; $87F8  D0 0F

loc_1E_87FA:
    SEC                          ; $87FA  38
    LDA $0720,X                  ; $87FB  BD 20 07
    SBC $C2                      ; $87FE  E5 C2
    STA $C2                      ; $8800  85 C2
    LDA $0724,X                  ; $8802  BD 24 07
    STY $C1                      ; $8805  84 C1
    SBC $C1                      ; $8807  E5 C1

loc_1E_8809:
    TAY                          ; $8809  A8
    BNE loc_1E_8814              ; $880A  D0 08

loc_1E_880C:
    LDA $0720,X                  ; $880C  BD 20 07
    STA $C2                      ; $880F  85 C2
    LDY $0724,X                  ; $8811  BC 24 07

loc_1E_8814:
    CPX #$28                     ; $8814  E0 28
    BCS loc_1E_8835              ; $8816  B0 1D
    LDA $D6                      ; $8818  A5 D6
    BPL loc_1E_8835              ; $881A  10 19
    LDA $D8                      ; $881C  A5 D8
    BEQ loc_1E_8835              ; $881E  F0 15
    STA $C4                      ; $8820  85 C4
    STY $C1                      ; $8822  84 C1
    LDA $C2                      ; $8824  A5 C2
    PHA                          ; $8826  48
    JSR sub_1E_8006              ; $8827  20 06 80
    PLA                          ; $882A  68
    CLC                          ; $882B  18
    ADC $C2                      ; $882C  65 C2
    STA $C2                      ; $882E  85 C2
    LDA #$00                     ; $8830  A9 00
    ADC $C1                      ; $8832  65 C1
    TAY                          ; $8834  A8

loc_1E_8835:
    TXA                          ; $8835  8A
    AND #$03                     ; $8836  29 03
    BNE loc_1E_8849              ; $8838  D0 0F
    TYA                          ; $883A  98
    AND #$0F                     ; $883B  29 0F
    LDY #$07                     ; $883D  A0 07
    ORA ($C5),Y                  ; $883F  11 C5
    STA $C2                      ; $8841  85 C2
    LDA #$00                     ; $8843  A9 00
    STA $C1                      ; $8845  85 C1
    BEQ loc_1E_8884              ; $8847  F0 3B

loc_1E_8849:
    TYA                          ; $8849  98
    LDY #$08                     ; $884A  A0 08

loc_1E_884C:
    DEY                          ; $884C  88
    CMP $8953,Y                  ; $884D  D9 53 89
    BCC loc_1E_884C              ; $8850  90 FA
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
    BEQ loc_1E_8870              ; $8865  F0 09

loc_1E_8867:
    LSR $C1                      ; $8867  46 C1
    ROR $C2                      ; $8869  66 C2
    SEC                          ; $886B  38
    SBC #$08                     ; $886C  E9 08
    BNE loc_1E_8867              ; $886E  D0 F7

loc_1E_8870:
    LDY #$00                     ; $8870  A0 00
    LDA $0714,X                  ; $8872  BD 14 07
    BEQ loc_1E_8884              ; $8875  F0 0D
    BPL loc_1E_887A              ; $8877  10 01
    DEY                          ; $8879  88

loc_1E_887A:
    CLC                          ; $887A  18
    ADC $C2                      ; $887B  65 C2
    STA $C2                      ; $887D  85 C2
    TYA                          ; $887F  98
    ADC $C1                      ; $8880  65 C1
    STA $C1                      ; $8882  85 C1

loc_1E_8884:
    LDY #$02                     ; $8884  A0 02
    LDA $C2                      ; $8886  A5 C2
    JSR sub_1E_80EC              ; $8888  20 EC 80
    TXA                          ; $888B  8A
    AND #$03                     ; $888C  29 03
    TAY                          ; $888E  A8
    LDA $C1                      ; $888F  A5 C1
    CMP $077C,Y                  ; $8891  D9 7C 07
    BEQ loc_1E_88A0              ; $8894  F0 0A
    STA $077C,Y                  ; $8896  99 7C 07
    ORA #$08                     ; $8899  09 08
    LDY #$03                     ; $889B  A0 03
    JSR sub_1E_80EC              ; $889D  20 EC 80

loc_1E_88A0:
    LDA $0704,X                  ; $88A0  BD 04 07
    AND #$20                     ; $88A3  29 20
    BEQ loc_1E_88FA              ; $88A5  F0 53
    LDA $0718,X                  ; $88A7  BD 18 07
    BEQ loc_1E_88F2              ; $88AA  F0 46
    LDY #$00                     ; $88AC  A0 00
    ASL A                        ; $88AE  0A
    PHP                          ; $88AF  08
    BCC loc_1E_88B8              ; $88B0  90 06
    EOR #$FF                     ; $88B2  49 FF
    CLC                          ; $88B4  18
    ADC #$01                     ; $88B5  69 01
    DEY                          ; $88B7  88

loc_1E_88B8:
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
    BNE loc_1E_88FA              ; $88E1  D0 17
    TXA                          ; $88E3  8A
    BEQ loc_1E_88FA              ; $88E4  F0 14
    LDA $8959,Y                  ; $88E6  B9 59 89
    STA $0720,X                  ; $88E9  9D 20 07
    LDA $895A,Y                  ; $88EC  B9 5A 89
    STA $0724,X                  ; $88EF  9D 24 07

loc_1E_88F2:
    LDA $0704,X                  ; $88F2  BD 04 07
    AND #$DF                     ; $88F5  29 DF
    STA $0704,X                  ; $88F7  9D 04 07

loc_1E_88FA:
    LDY #$04                     ; $88FA  A0 04
    LDA ($C5),Y                  ; $88FC  B1 C5
    AND #$7F                     ; $88FE  29 7F
    BEQ loc_1E_8914              ; $8900  F0 12
    CLC                          ; $8902  18
    ADC $0708,X                  ; $8903  7D 08 07
    STA $0708,X                  ; $8906  9D 08 07
    BCC loc_1E_8914              ; $8909  90 09
    LDA $0704,X                  ; $890B  BD 04 07
    CLC                          ; $890E  18
    ADC #$40                     ; $890F  69 40
    STA $0704,X                  ; $8911  9D 04 07

loc_1E_8914:
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
    .byte $F1,$00,$80,$00,$14,$00,$40,$0C,$24,$00,$00,$27,$40,$0C,$27,$00  ; $8A15
    .byte $00,$29,$40,$0C,$29,$00,$0C,$29,$40,$0C,$29,$00,$0C,$2A,$40,$18  ; $8A25
    .byte $2A,$00,$00,$2B,$40,$0C,$2B,$00,$0C,$F9,$00,$47,$8A,$D1,$8D,$09  ; $8A35
    .byte $90,$73,$93,$D9,$97,$7D,$9B,$98,$9F,$AB,$A3,$A8,$A7,$8A,$AB,$07  ; $8A45
    .byte $AD,$F5,$B1,$51,$B3,$1B,$B8,$22,$B8,$96,$B9,$44,$B9,$B0,$BA,$BA  ; $8A55
    .byte $BB,$85,$BC,$BD,$C0,$59,$C3,$C5,$C4,$89,$C8,$19,$CD,$36,$CD,$4A  ; $8A65
    .byte $CD,$54,$CD,$6F,$CD,$8B,$CD,$9B,$CD,$BD,$CD,$D0,$CD,$E2,$CE,$48  ; $8A75
    .byte $CE,$54,$CE,$60,$CE,$9E,$CE,$B9,$CE,$D7,$CF,$1B,$CF,$2B,$CF,$38  ; $8A85
    .byte $CF,$56,$CF,$71,$CF,$94,$CF,$A3,$CF,$CA,$CF,$DA,$CF,$E5,$D0,$27  ; $8A95
    .byte $D0,$44,$D0,$64,$D0,$72,$D0,$89,$D0,$99,$D0,$AB,$D0,$BD,$D0,$D9  ; $8AA5
    .byte $D0,$F1,$D1,$07,$D1,$CB,$D2,$BA,$D3,$A9,$D3,$C6,$D3,$D1,$D4,$1F  ; $8AB5
    .byte $D4,$38,$D4,$91,$D5,$21,$00,$00,$D6,$A3,$D8,$0D,$1F,$1F,$F0,$1F  ; $8AC5
    .byte $00,$00,$00,$00,$1F,$15,$20,$01,$80,$00,$00,$00,$1F,$1E,$C0,$07  ; $8AD5
    .byte $80,$00,$00,$80,$1F,$19,$C0,$09,$E4,$05,$00,$00,$1F,$1F,$F0,$1F  ; $8AE5
    .byte $94,$7F,$00,$00,$1A,$1F,$E0,$1C,$80,$00,$00,$00,$1F,$11,$50,$01  ; $8AF5
    .byte $E2,$04,$00,$00,$1F,$1A,$D0,$17,$92,$00,$26,$00,$1F,$18,$B0,$06  ; $8B05
    .byte $80,$00,$00,$00,$1F,$1F,$F0,$11,$80,$00,$00,$00,$1F,$1F,$F0,$1F  ; $8B15
    .byte $FF,$03,$39,$00,$1F,$1C,$90,$03,$FF,$04,$25,$00,$1F,$00,$B0,$09  ; $8B25
    .byte $E3,$02,$00,$00,$1F,$1D,$C0,$11,$80,$00,$00,$00,$1F,$1F,$F0,$1F  ; $8B35
    .byte $94,$7F,$00,$00,$18,$1B,$B0,$0E,$84,$7F,$00,$00,$1F,$00,$B0,$07  ; $8B45
    .byte $E3,$02,$00,$00,$1B,$01,$A0,$16,$80,$00,$00,$00,$1F,$0C,$00,$02  ; $8B55
    .byte $A3,$00,$09,$00,$1F,$1A,$D0,$0D,$DC,$06,$00,$00,$1F,$17,$D0,$05  ; $8B65
    .byte $98,$02,$2C,$00,$1F,$1F,$F0,$13,$D0,$03,$7F,$00,$19,$13,$D0,$18  ; $8B75
    .byte $80,$00,$00,$00,$1F,$00,$C0,$18,$80,$00,$00,$00,$1F,$01,$20,$09  ; $8B85
    .byte $99,$10,$00,$00,$1A,$1F,$D0,$01,$80,$00,$00,$00,$1F,$16,$C0,$14  ; $8B95
    .byte $AB,$02,$00,$00,$1F,$1B,$80,$05,$C9,$00,$38,$00,$1F,$1F,$B0,$09  ; $8BA5
    .byte $00,$00,$00,$00,$1F,$1D,$B0,$0C,$80,$00,$00,$00,$1F,$19,$A0,$02  ; $8BB5
    .byte $80,$00,$00,$00,$17,$02,$E0,$0F,$80,$00,$00,$00,$1E,$18,$C0,$12  ; $8BC5
    .byte $00,$00,$00,$00,$1F,$07,$20,$16,$82,$14,$00,$00,$1F,$19,$B0,$04  ; $8BD5
    .byte $E4,$05,$00,$00,$1F,$1E,$A0,$0A,$AA,$00,$4B,$00,$1F,$18,$90,$05  ; $8BE5
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$80,$00,$00,$00,$1A,$1F,$D0,$07  ; $8BF5
    .byte $80,$00,$00,$00,$00,$00,$00,$00,$80,$00,$00,$00,$1F,$1F,$F0,$1F  ; $8C05
    .byte $00,$00,$00,$00,$1F,$1F,$F0,$1F,$FF,$02,$00,$00,$1F,$1F,$F0,$1F  ; $8C15
    .byte $92,$7F,$00,$00,$1F,$1C,$C0,$15,$80,$00,$00,$00,$1F,$1F,$F0,$1F  ; $8C25
    .byte $FF,$4C,$00,$00,$1F,$1F,$F0,$1F,$99,$7F,$00,$00,$1D,$1F,$F0,$1F  ; $8C35
    .byte $80,$00,$00,$00,$1F,$1F,$F0,$1F,$B7,$27,$00,$00,$1F,$1F,$F0,$0F  ; $8C45
    .byte $D7,$09,$7F,$00,$1F,$1F,$F0,$1F,$A6,$7F,$00,$80,$1F,$1F,$F0,$1F  ; $8C55
    .byte $80,$00,$00,$80,$1F,$01,$F0,$05,$E1,$0D,$00,$00,$1F,$1F,$F0,$1F  ; $8C65
    .byte $C1,$04,$7F,$00,$1C,$13,$10,$1F,$FF,$7F,$00,$00,$1F,$01,$00,$0F  ; $8C75
    .byte $E3,$7F,$00,$00,$1E,$10,$F0,$0E,$80,$00,$00,$00,$1F,$1F,$F0,$1F  ; $8C85
    .byte $FF,$7F,$00,$00,$1F,$17,$00,$16,$80,$00,$00,$00,$1F,$1F,$F0,$16  ; $8C95
    .byte $80,$00,$00,$00,$1F,$01,$F0,$05,$E1,$0D,$00,$00,$1F,$1A,$A0,$07  ; $8CA5
    .byte $CF,$36,$00,$80,$1D,$04,$20,$12,$00,$00,$00,$00,$11,$12,$30,$04  ; $8CB5
    .byte $00,$00,$00,$00,$1F,$1F,$F0,$1F,$D0,$16,$00,$00,$1C,$1F,$F0,$07  ; $8CC5
    .byte $FF,$7F,$36,$00,$19,$0B,$F0,$12,$FF,$7F,$36,$80,$1F,$12,$40,$1E  ; $8CD5
    .byte $FF,$7F,$51,$80,$17,$1F,$F0,$02,$FF,$7F,$5A,$00,$12,$02,$A0,$05  ; $8CE5
    .byte $00,$00,$00,$00,$1F,$1F,$F0,$1F,$FF,$19,$00,$00,$17,$14,$F0,$07  ; $8CF5
    .byte $CA,$54,$00,$00,$00,$8D,$12,$8D,$DC,$8E,$8F,$8F,$B0,$05,$01,$EB  ; $8D05
    .byte $0A,$FD,$06,$C8,$E0,$E0,$04,$00,$04,$00,$09,$02,$07,$0C,$06,$AA  ; $8D15
    .byte $08,$02,$18,$C0,$BB,$7B,$7D,$60,$01,$BE,$01,$7E,$03,$A8,$65,$63  ; $8D25
    .byte $60,$02,$81,$71,$6F,$60,$AD,$02,$80,$03,$77,$79,$60,$01,$BB,$01  ; $8D35
    .byte $7B,$12,$00,$8D,$63,$79,$7B,$60,$BD,$79,$7B,$60,$7E,$60,$7D,$60  ; $8D45
    .byte $79,$7B,$60,$03,$6F,$60,$8F,$6D,$71,$60,$0E,$01,$8D,$1D,$7E,$7D  ; $8D55
    .byte $60,$03,$A8,$69,$6A,$60,$6A,$80,$6D,$60,$6E,$AF,$A0,$0B,$00,$06  ; $8D65
    .byte $00,$06,$DC,$18,$C0,$07,$0E,$08,$07,$A0,$03,$B1,$02,$8C,$02,$91  ; $8D75
    .byte $9A,$02,$B8,$B6,$B5,$96,$02,$B8,$01,$D1,$01,$91,$07,$0C,$06,$C8  ; $8D85
    .byte $08,$03,$B1,$B3,$B4,$B6,$07,$0E,$06,$DC,$08,$07,$94,$80,$B4,$02  ; $8D95
    .byte $8F,$02,$94,$9B,$02,$BA,$02,$B8,$B6,$D9,$B6,$BD,$02,$B8,$80,$B8  ; $8DA5
    .byte $BA,$BB,$80,$02,$94,$02,$9B,$7B,$60,$7D,$60,$BD,$80,$02,$96,$02  ; $8DB5
    .byte $9A,$7B,$60,$7D,$60,$02,$01,$DD,$01,$9D,$98,$02,$01,$03,$CC,$01  ; $8DC5
    .byte $AC,$0B,$02,$16,$8D,$1B,$17,$0C,$FF,$E0,$E0,$04,$00,$04,$00,$07  ; $8DD5
    .byte $0A,$09,$01,$06,$FF,$18,$80,$08,$02,$FE,$02,$BD,$18,$40,$03,$74  ; $8DE5
    .byte $72,$60,$B1,$02,$80,$18,$80,$C3,$C5,$12,$08,$8E,$12,$86,$A0,$86  ; $8DF5
    .byte $60,$18,$40,$72,$60,$92,$71,$74,$60,$0E,$01,$8D,$E2,$18,$40,$66  ; $8E05
    .byte $66,$02,$80,$67,$60,$67,$A0,$60,$02,$87,$0B,$00,$08,$05,$18,$80  ; $8E15
    .byte $02,$01,$C9,$01,$69,$02,$89,$02,$01,$C7,$01,$67,$02,$87,$04,$00  ; $8E25
    .byte $18,$40,$80,$7D,$60,$7D,$02,$9F,$0E,$01,$8E,$33,$03,$A8,$AA,$AC  ; $8E35
    .byte $AD,$18,$80,$02,$01,$CF,$01,$6F,$02,$8F,$02,$01,$CE,$01,$6E,$02  ; $8E45
    .byte $8E,$02,$01,$CA,$01,$6A,$02,$8D,$60,$02,$8C,$6C,$60,$6E,$80,$02  ; $8E55
    .byte $8C,$6C,$60,$6E,$60,$02,$01,$CC,$01,$6C,$02,$8C,$02,$01,$CE,$01  ; $8E65
    .byte $6E,$02,$8E,$02,$01,$CC,$01,$6C,$02,$91,$18,$40,$02,$93,$73,$A0  ; $8E75
    .byte $73,$73,$02,$A0,$0B,$02,$16,$8D,$E0,$17,$06,$C8,$08,$00,$09,$02  ; $8E85
    .byte $A0,$08,$04,$03,$6D,$6D,$6D,$6D,$68,$68,$68,$68,$63,$63,$60,$63  ; $8E95
    .byte $08,$00,$09,$03,$60,$61,$63,$60,$03,$6D,$6E,$60,$74,$73,$6F,$6D  ; $8EA5
    .byte $6F,$6A,$76,$7A,$7B,$04,$00,$04,$00,$06,$DC,$6F,$60,$6F,$60,$96  ; $8EB5
    .byte $6F,$6F,$60,$6F,$60,$6F,$96,$8F,$6D,$60,$6D,$60,$94,$6D,$6D,$60  ; $8EC5
    .byte $6D,$60,$6D,$94,$8D,$6B,$60,$6B,$60,$92,$6B,$6B,$60,$6C,$60,$6D  ; $8ED5
    .byte $94,$91,$12,$00,$8E,$FE,$72,$60,$76,$60,$94,$71,$72,$60,$6F,$60  ; $8EE5
    .byte $6F,$60,$6F,$6F,$6D,$0E,$01,$8E,$BC,$6F,$60,$72,$80,$71,$60,$71  ; $8EF5
    .byte $B3,$08,$04,$9D,$60,$75,$04,$00,$0B,$00,$08,$00,$02,$91,$71,$60  ; $8F05
    .byte $71,$80,$71,$7B,$7D,$60,$7B,$7D,$60,$6F,$0E,$01,$8F,$0B,$04,$00  ; $8F15
    .byte $8D,$60,$6D,$60,$02,$8F,$0E,$02,$8F,$23,$68,$71,$70,$71,$73,$94  ; $8F25
    .byte $68,$02,$94,$74,$60,$74,$80,$74,$7E,$03,$68,$60,$66,$68,$60,$03  ; $8F35
    .byte $72,$02,$93,$73,$60,$73,$80,$73,$7D,$7F,$60,$7D,$7F,$60,$73,$02  ; $8F45
    .byte $8A,$6A,$60,$6A,$80,$6A,$74,$76,$60,$74,$76,$60,$6A,$02,$91,$71  ; $8F55
    .byte $60,$71,$80,$71,$7B,$7D,$60,$7B,$7D,$60,$6F,$02,$94,$74,$60,$74  ; $8F65
    .byte $80,$74,$7E,$03,$68,$60,$66,$68,$60,$03,$72,$02,$96,$76,$60,$76  ; $8F75
    .byte $80,$76,$03,$68,$6A,$60,$68,$6A,$60,$03,$76,$02,$8C,$6C,$60,$6C  ; $8F85
    .byte $80,$6C,$76,$78,$60,$76,$78,$60,$6C,$02,$8C,$78,$A0,$60,$77,$78  ; $8F95
    .byte $6C,$6D,$6E,$6F,$71,$0B,$02,$16,$8E,$BA,$17,$07,$09,$08,$01,$E0  ; $8FA5
    .byte $06,$B4,$AA,$AA,$AA,$06,$C8,$68,$68,$68,$68,$04,$00,$04,$00,$04  ; $8FB5
    .byte $00,$06,$C8,$07,$06,$6D,$6D,$6D,$6D,$06,$64,$07,$0A,$8D,$04,$00  ; $8FC5
    .byte $06,$96,$07,$07,$6D,$07,$08,$68,$0E,$02,$8F,$D3,$06,$64,$07,$0A  ; $8FD5
    .byte $86,$06,$C8,$6D,$6D,$0F,$02,$8F,$C4,$04,$00,$66,$6D,$0E,$03,$8F  ; $8FE5
    .byte $EE,$6D,$6D,$6D,$65,$6D,$6B,$6A,$68,$10,$01,$8F,$C2,$04,$00,$06  ; $8FF5
    .byte $A0,$07,$06,$6D,$6D,$6D,$6D,$07,$09,$6D,$60,$07,$08,$66,$6A,$07  ; $9005
    .byte $09,$6D,$07,$08,$60,$6A,$60,$07,$09,$6D,$07,$08,$60,$6A,$6D,$0E  ; $9015
    .byte $02,$90,$02,$04,$00,$67,$6D,$0E,$03,$90,$28,$66,$69,$60,$6D,$66  ; $9025
    .byte $6A,$68,$66,$04,$00,$06,$A0,$07,$06,$6D,$6D,$6D,$6D,$07,$09,$6D  ; $9035
    .byte $60,$07,$08,$66,$6A,$07,$09,$6D,$07,$08,$60,$6A,$60,$07,$09,$6D  ; $9045
    .byte $07,$08,$60,$6A,$6D,$0E,$06,$90,$38,$67,$6D,$60,$6D,$66,$6B,$66  ; $9055
    .byte $6D,$66,$6D,$04,$00,$67,$0E,$05,$90,$68,$16,$8F,$C0,$17,$00,$90  ; $9065
    .byte $7C,$91,$63,$92,$4C,$93,$0D,$0A,$03,$18,$40,$06,$C8,$07,$0B,$08  ; $9075
    .byte $03,$09,$01,$7E,$03,$69,$60,$02,$8B,$6D,$60,$05,$01,$55,$B0,$B1  ; $9085
    .byte $05,$01,$EB,$B2,$02,$C0,$08,$08,$06,$96,$A0,$72,$72,$60,$02,$90  ; $9095
    .byte $6D,$60,$6D,$60,$90,$72,$70,$60,$72,$02,$C0,$E0,$04,$00,$04,$00  ; $90A5
    .byte $06,$AA,$09,$02,$08,$08,$02,$BE,$7C,$7E,$03,$69,$60,$68,$60,$66  ; $90B5
    .byte $60,$64,$60,$61,$64,$60,$66,$02,$C0,$02,$AB,$69,$6B,$6D,$60,$6B  ; $90C5
    .byte $60,$69,$60,$64,$60,$12,$08,$90,$E7,$66,$64,$80,$C6,$A0,$0E,$01  ; $90D5
    .byte $90,$B3,$66,$64,$A0,$C6,$80,$04,$08,$09,$01,$06,$B4,$08,$0B,$02  ; $90E5
    .byte $AD,$6B,$6D,$70,$60,$02,$B0,$12,$08,$91,$10,$51,$01,$B2,$02,$01  ; $90F5
    .byte $72,$70,$72,$75,$60,$02,$B2,$0E,$01,$90,$EC,$92,$70,$72,$75,$60  ; $9105
    .byte $B2,$80,$02,$92,$72,$02,$B2,$8D,$00,$8B,$89,$88,$86,$88,$89,$00  ; $9115
    .byte $CC,$CB,$89,$02,$C0,$07,$0C,$18,$C0,$08,$0C,$06,$C8,$90,$72,$70  ; $9125
    .byte $6D,$6B,$6D,$64,$60,$86,$89,$68,$60,$64,$66,$60,$6B,$6D,$6D,$70  ; $9135
    .byte $6B,$6D,$6D,$70,$80,$02,$92,$70,$72,$60,$75,$70,$60,$72,$80,$02  ; $9145
    .byte $98,$77,$74,$70,$6D,$90,$2D,$2C,$2A,$28,$16,$90,$B1,$17,$0C,$01  ; $9155
    .byte $18,$40,$06,$FF,$09,$01,$07,$0C,$08,$0A,$03,$AD,$AB,$A8,$A4,$06  ; $9165
    .byte $C8,$08,$08,$B2,$02,$C0,$06,$96,$07,$0B,$A0,$69,$69,$60,$02,$88  ; $9175
    .byte $64,$60,$64,$60,$88,$69,$68,$60,$69,$80,$80,$80,$80,$80,$80,$E0  ; $9185
    .byte $04,$08,$04,$08,$06,$AA,$09,$01,$08,$08,$02,$A9,$68,$69,$6D,$60  ; $9195
    .byte $6B,$60,$69,$60,$68,$60,$64,$68,$60,$69,$02,$C0,$02,$AF,$6D,$6F  ; $91A5
    .byte $70,$60,$6F,$60,$6D,$60,$68,$60,$12,$08,$91,$CA,$69,$68,$80,$C9  ; $91B5
    .byte $A0,$0E,$01,$91,$97,$69,$68,$A0,$CA,$80,$02,$40,$04,$08,$07,$0A  ; $91C5
    .byte $06,$B4,$08,$0B,$02,$AD,$6B,$6D,$70,$60,$02,$B0,$12,$08,$91,$F5  ; $91D5
    .byte $51,$01,$B2,$02,$01,$72,$70,$72,$75,$60,$02,$B2,$0E,$01,$91,$D1  ; $91E5
    .byte $92,$70,$72,$75,$60,$B2,$80,$02,$92,$72,$02,$B2,$8D,$00,$8B,$89  ; $91F5
    .byte $88,$86,$88,$89,$00,$CC,$CB,$69,$80,$C0,$80,$20,$07,$0C,$09,$00  ; $9205
    .byte $06,$C8,$18,$C0,$08,$0C,$90,$72,$70,$6D,$6B,$6D,$64,$60,$86,$89  ; $9215
    .byte $68,$60,$64,$66,$60,$6B,$6D,$6D,$70,$6B,$6D,$6D,$70,$80,$02,$92  ; $9225
    .byte $70,$72,$60,$75,$70,$60,$72,$80,$02,$98,$77,$74,$70,$6D,$90,$2D  ; $9235
    .byte $2C,$2A,$28,$16,$91,$95,$17,$0B,$FD,$0B,$00,$06,$DC,$09,$03,$08  ; $9245
    .byte $04,$02,$C0,$7D,$7D,$74,$74,$04,$00,$0B,$00,$09,$03,$08,$00,$86  ; $9255
    .byte $6A,$66,$6B,$66,$60,$8C,$8C,$6C,$6D,$61,$62,$61,$0E,$03,$92,$5C  ; $9265
    .byte $04,$00,$09,$03,$08,$00,$04,$00,$04,$00,$86,$6A,$66,$6B,$66,$60  ; $9275
    .byte $8C,$8C,$6C,$6D,$61,$62,$61,$0E,$01,$92,$7D,$88,$6B,$68,$6D,$68  ; $9285
    .byte $60,$8E,$8E,$6D,$6B,$63,$64,$65,$6B,$69,$68,$64,$61,$64,$66,$68  ; $9295
    .byte $60,$A6,$61,$61,$61,$0F,$01,$92,$7B,$06,$DC,$04,$00,$02,$81,$68  ; $92A5
    .byte $80,$8B,$80,$02,$AC,$02,$86,$69,$80,$8C,$80,$12,$00,$92,$CA,$02  ; $92B5
    .byte $AD,$0E,$01,$92,$B0,$02,$A4,$C6,$C5,$C4,$C3,$86,$6A,$66,$6B,$66  ; $92C5
    .byte $60,$8C,$8C,$6C,$6D,$63,$64,$65,$92,$02,$C0,$80,$09,$02,$8D,$6D  ; $92D5
    .byte $6D,$08,$04,$99,$08,$00,$6D,$6D,$90,$70,$70,$08,$04,$99,$08,$00  ; $92E5
    .byte $70,$70,$93,$73,$73,$08,$04,$99,$08,$00,$73,$73,$08,$04,$79,$79  ; $92F5
    .byte $99,$79,$79,$99,$16,$92,$75,$17,$06,$C8,$07,$07,$08,$02,$AD,$AD  ; $9305
    .byte $AD,$08,$01,$66,$60,$66,$66,$04,$00,$6C,$07,$06,$6D,$6D,$6C,$07  ; $9315
    .byte $09,$66,$6C,$07,$06,$6D,$6D,$6D,$6D,$6D,$6D,$12,$00,$93,$3E,$07  ; $9325
    .byte $09,$66,$6C,$6C,$6C,$0E,$03,$93,$1C,$6D,$07,$09,$66,$07,$06,$6D  ; $9335
    .byte $6D,$04,$00,$04,$00,$04,$00,$08,$01,$06,$B4,$07,$06,$6C,$6D,$6D  ; $9345
    .byte $6D,$07,$09,$66,$6C,$07,$06,$6D,$6D,$6D,$6D,$6C,$6D,$07,$09,$66  ; $9355
    .byte $07,$06,$6D,$6D,$6D,$0E,$02,$93,$4A,$04,$00,$07,$08,$8D,$07,$07  ; $9365
    .byte $6D,$6D,$0E,$02,$93,$6E,$6D,$07,$09,$66,$07,$06,$6D,$07,$09,$66  ; $9375
    .byte $0F,$01,$93,$48,$04,$00,$04,$00,$07,$08,$8D,$07,$07,$6D,$6D,$0E  ; $9385
    .byte $05,$93,$8B,$6C,$6D,$6D,$6D,$07,$09,$66,$07,$08,$6D,$6D,$6D,$0F  ; $9395
    .byte $01,$93,$89,$04,$00,$06,$96,$07,$06,$6C,$6D,$6D,$6D,$07,$09,$66  ; $93A5
    .byte $07,$06,$6D,$6D,$6D,$12,$00,$93,$CA,$6C,$6D,$6D,$6D,$66,$6D,$6D  ; $93B5
    .byte $6D,$0E,$05,$93,$A8,$07,$07,$08,$02,$8D,$6D,$6D,$6D,$6D,$6D,$6D  ; $93C5
    .byte $16,$93,$46,$17,$00,$93,$E2,$94,$B2,$95,$8F,$96,$7F,$18,$40,$05  ; $93D5
    .byte $02,$2E,$06,$C8,$07,$0B,$08,$00,$09,$02,$08,$09,$04,$08,$A8,$02  ; $93E5
    .byte $C0,$60,$02,$88,$87,$86,$C5,$A8,$02,$C0,$09,$01,$74,$72,$6F,$02  ; $93F5
    .byte $8D,$72,$6F,$6D,$02,$8B,$6F,$6D,$6B,$01,$68,$01,$C8,$B2,$02,$93  ; $9405
    .byte $74,$E0,$68,$66,$68,$6B,$68,$80,$02,$8D,$8B,$68,$66,$80,$A8,$A0  ; $9415
    .byte $8F,$8D,$68,$66,$80,$88,$C0,$80,$02,$88,$68,$02,$A8,$88,$8B,$88  ; $9425
    .byte $8C,$88,$66,$68,$60,$88,$C0,$02,$80,$8D,$8B,$8F,$8D,$8B,$88,$66  ; $9435
    .byte $67,$60,$01,$68,$01,$A8,$02,$C0,$8F,$8D,$90,$6F,$6D,$80,$8B,$88  ; $9445
    .byte $86,$66,$67,$60,$02,$01,$C8,$01,$68,$C0,$60,$6F,$6F,$6F,$6F,$6F  ; $9455
    .byte $6F,$6F,$6F,$01,$B0,$01,$70,$8D,$92,$90,$8F,$8D,$6E,$01,$AF,$01  ; $9465
    .byte $6F,$8B,$90,$8F,$8D,$8B,$6C,$01,$AD,$01,$6D,$8B,$8F,$8D,$8B,$86  ; $9475
    .byte $C0,$60,$6F,$6F,$6F,$6F,$6F,$6F,$6F,$6F,$01,$B0,$01,$70,$8D,$92  ; $9485
    .byte $90,$8F,$8D,$6E,$01,$AF,$01,$6F,$8B,$90,$8F,$8D,$8B,$6C,$01,$AD  ; $9495
    .byte $01,$6D,$8B,$8F,$8D,$8B,$86,$C8,$C0,$16,$93,$F1,$17,$04,$00,$0C  ; $94A5
    .byte $01,$18,$C0,$06,$C8,$07,$0A,$06,$C8,$09,$02,$08,$02,$BB,$02,$C0  ; $94B5
    .byte $60,$02,$9B,$9A,$99,$D8,$BB,$02,$C0,$02,$9B,$6F,$80,$02,$9C,$70  ; $94C5
    .byte $80,$01,$BD,$08,$03,$01,$DD,$08,$02,$03,$8A,$80,$01,$8B,$01,$6B  ; $94D5
    .byte $6C,$09,$01,$C0,$A8,$AB,$80,$8B,$80,$8F,$AD,$AA,$80,$88,$66,$67  ; $94E5
    .byte $80,$01,$88,$02,$01,$A8,$ED,$A8,$AA,$AB,$AF,$ED,$08,$03,$CF,$08  ; $94F5
    .byte $02,$B3,$00,$51,$4F,$4D,$4C,$4A,$48,$46,$45,$43,$41,$61,$00,$80  ; $9505
    .byte $03,$97,$7E,$77,$60,$03,$68,$C0,$CF,$08,$03,$D3,$08,$02,$8D,$8B  ; $9515
    .byte $68,$66,$60,$A8,$A0,$60,$6B,$6A,$68,$6B,$6A,$68,$6B,$6A,$68,$6B  ; $9525
    .byte $6A,$68,$6F,$68,$6A,$6B,$18,$80,$02,$88,$02,$8D,$90,$92,$90,$6F  ; $9535
    .byte $70,$80,$02,$88,$02,$8B,$8F,$90,$8F,$6E,$6F,$80,$02,$87,$02,$8A  ; $9545
    .byte $8D,$8F,$8D,$6B,$6D,$80,$02,$88,$02,$8A,$8B,$02,$8C,$02,$8D,$8F  ; $9555
    .byte $02,$88,$02,$8D,$90,$92,$90,$6F,$70,$80,$02,$88,$02,$8B,$8F,$90  ; $9565
    .byte $8F,$6E,$6F,$80,$02,$87,$02,$8A,$8D,$8F,$8D,$6B,$6D,$80,$88,$8A  ; $9575
    .byte $6B,$6A,$60,$A8,$A0,$60,$16,$94,$B2,$17,$04,$00,$06,$DC,$08,$00  ; $9585
    .byte $09,$03,$A8,$80,$83,$66,$60,$67,$68,$80,$83,$63,$02,$88,$80,$83  ; $9595
    .byte $64,$60,$63,$09,$02,$88,$02,$80,$B4,$80,$8F,$72,$60,$73,$74,$80  ; $95A5
    .byte $8F,$08,$04,$03,$68,$68,$68,$88,$60,$68,$68,$68,$88,$60,$60,$60  ; $95B5
    .byte $88,$60,$61,$60,$60,$68,$68,$68,$68,$08,$00,$03,$B2,$02,$93,$74  ; $95C5
    .byte $60,$02,$94,$92,$8F,$72,$60,$73,$74,$08,$04,$03,$88,$08,$00,$03  ; $95D5
    .byte $73,$74,$94,$A0,$8F,$72,$60,$73,$74,$80,$8F,$60,$02,$01,$94,$01  ; $95E5
    .byte $92,$8F,$72,$60,$73,$74,$A0,$94,$A0,$8F,$70,$60,$6F,$68,$A0,$94  ; $95F5
    .byte $97,$99,$77,$9B,$02,$8F,$91,$93,$94,$97,$79,$02,$97,$BB,$A0,$94  ; $9605
    .byte $97,$99,$77,$9B,$02,$8F,$91,$93,$94,$97,$74,$97,$02,$94,$80,$AF  ; $9615
    .byte $94,$97,$99,$77,$9B,$02,$8F,$91,$93,$94,$97,$96,$72,$74,$C0,$94  ; $9625
    .byte $97,$96,$72,$74,$C0,$02,$8D,$74,$80,$01,$D9,$01,$99,$02,$8B,$6F  ; $9635
    .byte $80,$01,$D4,$01,$94,$02,$93,$79,$80,$01,$DB,$01,$9B,$02,$94,$02  ; $9645
    .byte $96,$97,$02,$96,$02,$94,$9B,$02,$8D,$74,$80,$01,$D9,$01,$99,$02  ; $9655
    .byte $8B,$6F,$80,$01,$D4,$01,$94,$02,$93,$79,$80,$01,$DB,$01,$9B,$94  ; $9665
    .byte $97,$96,$72,$B4,$A0,$60,$16,$95,$8F,$17,$06,$FA,$08,$01,$04,$00  ; $9675
    .byte $04,$00,$07,$09,$66,$07,$05,$6D,$6D,$6D,$07,$09,$69,$07,$05,$6D  ; $9685
    .byte $6D,$6D,$0E,$05,$96,$85,$07,$0A,$8D,$60,$65,$6D,$60,$8D,$60,$65  ; $9695
    .byte $6D,$60,$07,$05,$6C,$6C,$6C,$6C,$07,$08,$6D,$6D,$6D,$6D,$07,$0B  ; $96A5
    .byte $6D,$6D,$6D,$6D,$65,$60,$6D,$60,$65,$60,$6D,$65,$04,$00,$06,$78  ; $96B5
    .byte $07,$0A,$8D,$07,$06,$06,$46,$88,$0E,$07,$96,$C1,$04,$00,$06,$78  ; $96C5
    .byte $07,$0A,$8D,$07,$06,$06,$46,$88,$0E,$13,$96,$D1,$07,$08,$06,$9A  ; $96D5
    .byte $8D,$86,$8D,$86,$8D,$86,$6D,$6D,$6D,$68,$04,$00,$8D,$86,$8D,$86  ; $96E5
    .byte $8D,$86,$8D,$86,$0E,$01,$96,$EF,$07,$05,$6D,$6D,$6D,$6D,$07,$07  ; $96F5
    .byte $6D,$6D,$6D,$6D,$07,$09,$6D,$6D,$6D,$6D,$07,$09,$6D,$6D,$6D,$6D  ; $9705
    .byte $04,$00,$07,$09,$66,$07,$05,$6D,$6D,$6D,$07,$09,$69,$07,$05,$6D  ; $9715
    .byte $6D,$6D,$0E,$05,$97,$15,$06,$64,$07,$09,$88,$07,$05,$6D,$07,$09  ; $9725
    .byte $88,$07,$05,$6D,$07,$09,$88,$88,$07,$05,$6D,$07,$09,$88,$07,$05  ; $9735
    .byte $6D,$07,$09,$88,$04,$00,$06,$96,$07,$09,$66,$07,$05,$6D,$6D,$6D  ; $9745
    .byte $07,$09,$69,$07,$05,$6D,$6D,$6D,$0E,$05,$97,$49,$07,$06,$6D,$6D  ; $9755
    .byte $6D,$6D,$07,$08,$6D,$6D,$6D,$6D,$07,$0A,$6D,$6D,$6D,$6D,$07,$0C  ; $9765
    .byte $6D,$6D,$6D,$6D,$16,$96,$83,$17,$00,$97,$86,$98,$B2,$99,$F9,$9B  ; $9775
    .byte $36,$0A,$FE,$04,$00,$05,$01,$EB,$06,$C8,$07,$0C,$08,$02,$09,$01  ; $9785
    .byte $80,$03,$8D,$6B,$6D,$60,$00,$4F,$B0,$00,$8D,$6B,$6C,$60,$6D,$80  ; $9795
    .byte $91,$70,$71,$60,$00,$55,$B6,$00,$96,$74,$70,$60,$6D,$6C,$6C,$6B  ; $97A5
    .byte $6C,$60,$6D,$6F,$6D,$6C,$A0,$60,$6B,$6C,$18,$40,$CD,$02,$8D,$02  ; $97B5
    .byte $8F,$90,$02,$94,$D2,$60,$8B,$6C,$01,$6D,$AD,$08,$13,$CD,$08,$02  ; $97C5
    .byte $01,$AD,$02,$90,$02,$92,$93,$02,$94,$02,$8D,$6B,$6C,$CD,$02,$8D  ; $97D5
    .byte $02,$8F,$90,$D7,$77,$09,$02,$8D,$8B,$68,$66,$67,$01,$C8,$08,$03  ; $97E5
    .byte $C8,$07,$09,$A8,$07,$08,$A8,$07,$06,$A8,$07,$03,$01,$A8,$07,$0B  ; $97F5
    .byte $18,$40,$08,$02,$02,$86,$02,$88,$89,$69,$60,$69,$80,$68,$60,$66  ; $9805
    .byte $02,$84,$02,$86,$88,$68,$60,$68,$80,$66,$60,$64,$63,$64,$63,$C6  ; $9815
    .byte $64,$66,$64,$69,$60,$01,$C8,$08,$05,$01,$C8,$08,$02,$02,$81,$02  ; $9825
    .byte $83,$85,$02,$85,$02,$86,$88,$01,$C9,$08,$13,$01,$C9,$08,$02,$02  ; $9835
    .byte $03,$97,$02,$99,$9B,$02,$9B,$02,$9C,$9E,$01,$03,$C8,$08,$13,$A8  ; $9845
    .byte $01,$88,$08,$02,$66,$68,$01,$A9,$08,$13,$01,$C9,$08,$02,$A6,$01  ; $9855
    .byte $AB,$08,$13,$01,$CB,$08,$02,$A8,$01,$AC,$08,$13,$01,$CC,$08,$02  ; $9865
    .byte $AF,$6D,$6C,$60,$8D,$6B,$6D,$8B,$68,$66,$69,$68,$64,$03,$77,$74  ; $9875
    .byte $75,$77,$60,$02,$01,$D9,$01,$79,$78,$79,$60,$DB,$60,$BE,$01,$DD  ; $9885
    .byte $08,$13,$01,$DD,$08,$02,$60,$7D,$7C,$7D,$03,$48,$49,$65,$63,$65  ; $9895
    .byte $63,$60,$03,$78,$75,$74,$75,$76,$78,$16,$97,$88,$17,$04,$00,$0C  ; $98A5
    .byte $01,$06,$C8,$07,$0A,$08,$02,$09,$01,$80,$03,$8D,$6B,$6D,$60,$00  ; $98B5
    .byte $4F,$B0,$00,$8D,$6B,$6C,$60,$6D,$80,$8D,$6B,$6D,$60,$00,$52,$B2  ; $98C5
    .byte $00,$90,$6D,$6B,$60,$6D,$74,$74,$72,$74,$60,$75,$77,$75,$74,$A0  ; $98D5
    .byte $02,$80,$04,$00,$04,$00,$18,$80,$79,$7C,$03,$68,$6B,$0E,$03,$98  ; $98E5
    .byte $E9,$04,$00,$77,$7B,$03,$68,$6B,$0E,$03,$98,$F6,$04,$00,$79,$7C  ; $98F5
    .byte $03,$68,$6B,$0E,$03,$99,$01,$13,$08,$99,$20,$02,$84,$02,$86,$87  ; $9905
    .byte $02,$88,$02,$81,$03,$77,$78,$0F,$01,$98,$E7,$09,$02,$18,$80,$08  ; $9915
    .byte $05,$68,$03,$74,$7F,$73,$7E,$72,$7D,$71,$7C,$70,$7B,$6F,$79,$6D  ; $9925
    .byte $77,$6B,$09,$01,$08,$02,$02,$03,$89,$02,$8B,$8D,$6D,$60,$6D,$80  ; $9935
    .byte $6B,$60,$69,$02,$88,$02,$89,$8B,$6B,$60,$6B,$80,$69,$60,$68,$07  ; $9945
    .byte $0C,$A0,$60,$63,$64,$63,$02,$A6,$69,$60,$07,$0A,$01,$D4,$08,$05  ; $9955
    .byte $01,$D4,$06,$FA,$08,$05,$02,$8D,$02,$8C,$8B,$02,$8B,$02,$8A,$88  ; $9965
    .byte $01,$C6,$08,$13,$01,$C6,$08,$05,$02,$8B,$02,$8A,$89,$02,$89,$02  ; $9975
    .byte $88,$86,$01,$C4,$01,$C4,$A0,$03,$75,$79,$7E,$03,$69,$66,$69,$6D  ; $9985
    .byte $72,$6D,$72,$95,$A0,$03,$74,$77,$7B,$7D,$03,$68,$6B,$6F,$70,$74  ; $9995
    .byte $78,$74,$70,$A0,$03,$74,$78,$7B,$03,$68,$66,$68,$6C,$6F,$6C,$6F  ; $99A5
    .byte $72,$74,$08,$02,$61,$63,$60,$84,$77,$09,$02,$6D,$8B,$68,$66,$69  ; $99B5
    .byte $68,$64,$03,$77,$74,$06,$C8,$75,$77,$60,$99,$72,$74,$60,$01,$D5  ; $99C5
    .byte $B5,$01,$75,$78,$79,$60,$BB,$BE,$01,$DD,$08,$13,$01,$DD,$08,$02  ; $99D5
    .byte $71,$71,$73,$75,$78,$75,$77,$78,$60,$78,$78,$76,$74,$72,$70,$6F  ; $99E5
    .byte $16,$98,$B2,$17,$80,$04,$00,$06,$C8,$08,$00,$09,$03,$8D,$6B,$6D  ; $99F5
    .byte $60,$00,$4F,$B0,$00,$8D,$6B,$6C,$60,$6D,$80,$8D,$6B,$6D,$60,$00  ; $9A05
    .byte $52,$B2,$00,$90,$6D,$6B,$60,$6D,$74,$74,$72,$74,$68,$75,$77,$75  ; $9A15
    .byte $74,$02,$80,$A8,$04,$00,$6D,$60,$6D,$60,$90,$6D,$6D,$60,$6D,$60  ; $9A25
    .byte $6D,$90,$8D,$6B,$60,$6B,$60,$8F,$6B,$6B,$60,$6B,$60,$6B,$8F,$8B  ; $9A35
    .byte $6D,$60,$6D,$60,$90,$6D,$6D,$60,$6D,$60,$70,$92,$94,$12,$00,$9A  ; $9A45
    .byte $65,$02,$90,$02,$92,$93,$02,$94,$02,$8D,$6B,$6C,$0E,$01,$9A,$29  ; $9A55
    .byte $08,$04,$9D,$9D,$9C,$9C,$91,$91,$90,$90,$08,$00,$02,$92,$02,$95  ; $9A65
    .byte $79,$6D,$7C,$60,$7C,$60,$7B,$79,$8D,$60,$6D,$70,$74,$77,$77,$76  ; $9A75
    .byte $74,$60,$6D,$70,$74,$77,$77,$76,$74,$06,$FA,$6F,$6F,$60,$6F,$72  ; $9A85
    .byte $72,$60,$72,$75,$75,$60,$75,$78,$78,$60,$78,$04,$00,$06,$E6,$68  ; $9A95
    .byte $74,$68,$68,$74,$68,$74,$74,$0E,$01,$9A,$A0,$02,$8D,$68,$60,$6D  ; $9AA5
    .byte $6D,$6D,$02,$94,$02,$92,$91,$B2,$AD,$02,$97,$02,$95,$94,$B2,$AB  ; $9AB5
    .byte $02,$92,$02,$90,$8F,$B0,$A4,$02,$90,$02,$8F,$8D,$08,$00,$01,$C9  ; $9AC5
    .byte $08,$13,$01,$A9,$08,$04,$99,$80,$08,$00,$01,$CB,$08,$13,$01,$AB  ; $9AD5
    .byte $08,$04,$99,$80,$08,$00,$01,$CC,$08,$13,$01,$AC,$08,$04,$99,$80  ; $9AE5
    .byte $E0,$08,$00,$72,$60,$72,$60,$90,$72,$72,$60,$72,$60,$72,$90,$92  ; $9AF5
    .byte $74,$60,$74,$60,$92,$74,$74,$60,$74,$60,$74,$92,$94,$08,$04,$6D  ; $9B05
    .byte $6D,$99,$6D,$6D,$99,$60,$56,$56,$74,$70,$72,$70,$6D,$6B,$94,$94  ; $9B15
    .byte $79,$74,$60,$74,$60,$74,$74,$74,$74,$74,$74,$74,$99,$16,$99,$FA  ; $9B25
    .byte $17,$04,$00,$06,$C8,$07,$09,$08,$01,$65,$6D,$6D,$65,$67,$6D,$65  ; $9B35
    .byte $67,$6D,$65,$6D,$65,$67,$6D,$6D,$65,$65,$6D,$6D,$65,$67,$6D,$65  ; $9B45
    .byte $6D,$6D,$65,$6D,$65,$67,$6D,$6D,$65,$65,$6D,$6D,$65,$67,$6D,$65  ; $9B55
    .byte $67,$6D,$65,$6D,$65,$67,$6D,$6D,$65,$04,$00,$65,$6D,$6D,$65,$67  ; $9B65
    .byte $6D,$65,$67,$6D,$65,$6D,$65,$67,$6D,$6D,$65,$65,$6D,$6D,$65,$67  ; $9B75
    .byte $6D,$65,$67,$6D,$65,$6D,$65,$67,$6D,$6D,$65,$0E,$0B,$9B,$6E,$16  ; $9B85
    .byte $9B,$36,$17,$00,$9B,$A1,$9C,$AE,$9D,$DA,$9E,$CE,$0A,$FF,$18,$80  ; $9B95
    .byte $05,$02,$2E,$06,$8C,$07,$0B,$08,$02,$09,$01,$01,$03,$ED,$ED,$08  ; $9BA5
    .byte $03,$02,$CD,$01,$8D,$8B,$08,$02,$02,$CD,$00,$41,$43,$45,$46,$48  ; $9BB5
    .byte $4A,$4C,$4D,$4F,$51,$52,$09,$02,$4D,$04,$00,$04,$00,$0A,$FF,$06  ; $9BC5
    .byte $6E,$08,$02,$18,$C0,$80,$99,$99,$99,$9C,$99,$80,$99,$80,$99,$80  ; $9BD5
    .byte $9C,$99,$99,$9B,$9C,$12,$00,$9C,$06,$9C,$9B,$99,$5A,$01,$9B,$02  ; $9BE5
    .byte $01,$7B,$99,$97,$01,$99,$D9,$06,$F0,$08,$03,$01,$D9,$0E,$01,$9B  ; $9BF5
    .byte $D0,$80,$9B,$9C,$9B,$00,$BE,$BB,$B7,$06,$96,$00,$01,$D9,$07,$09  ; $9C05
    .byte $08,$03,$D9,$07,$07,$01,$D9,$C0,$E0,$07,$0B,$08,$02,$80,$00,$5F  ; $9C15
    .byte $03,$A8,$00,$68,$88,$00,$A8,$A8,$A8,$06,$F0,$00,$01,$C8,$08,$03  ; $9C25
    .byte $01,$C8,$08,$02,$06,$8C,$80,$47,$01,$88,$02,$01,$68,$86,$84,$83  ; $9C35
    .byte $A1,$02,$83,$61,$80,$03,$97,$02,$9C,$7B,$80,$97,$F9,$04,$00,$04  ; $9C45
    .byte $00,$0A,$FD,$08,$02,$06,$64,$18,$C0,$7B,$0D,$00,$7B,$60,$7B,$7E  ; $9C55
    .byte $60,$03,$6A,$80,$06,$C8,$01,$AF,$08,$03,$02,$01,$8F,$0E,$01,$9C  ; $9C65
    .byte $54,$13,$08,$9C,$9B,$08,$02,$06,$64,$65,$65,$60,$65,$A8,$00,$A5  ; $9C75
    .byte $A5,$A5,$18,$80,$06,$46,$00,$68,$66,$65,$63,$66,$65,$63,$61,$06  ; $9C85
    .byte $C8,$C3,$0F,$01,$9C,$52,$06,$64,$71,$71,$60,$71,$B1,$00,$B1,$AF  ; $9C95
    .byte $AD,$06,$FF,$00,$EF,$16,$9B,$CE,$17,$0C,$02,$18,$80,$06,$FA,$07  ; $9CA5
    .byte $0A,$08,$02,$09,$01,$04,$08,$68,$0E,$0F,$9C,$BA,$04,$08,$69,$0E  ; $9CB5
    .byte $0F,$9C,$C1,$04,$08,$6B,$0E,$0F,$9C,$C8,$04,$08,$06,$8C,$6D,$0E  ; $9CC5
    .byte $0B,$9C,$CF,$A0,$04,$00,$04,$00,$08,$02,$18,$C0,$06,$6E,$80,$9C  ; $9CD5
    .byte $9C,$9C,$03,$88,$84,$80,$84,$80,$84,$80,$88,$84,$84,$86,$88,$12  ; $9CE5
    .byte $08,$9D,$10,$88,$86,$84,$45,$01,$86,$02,$01,$66,$84,$83,$01,$85  ; $9CF5
    .byte $C5,$06,$F0,$08,$03,$01,$C5,$0E,$01,$9C,$DB,$80,$89,$80,$8B,$00  ; $9D05
    .byte $A9,$A6,$A3,$07,$0A,$06,$C8,$00,$01,$C4,$01,$84,$06,$AA,$A6,$87  ; $9D15
    .byte $80,$88,$80,$88,$00,$AB,$AB,$A8,$00,$6D,$6B,$6D,$02,$90,$6D,$0D  ; $9D25
    .byte $3C,$60,$71,$B2,$0D,$00,$02,$8F,$8D,$02,$8D,$6D,$8D,$00,$AD,$AD  ; $9D35
    .byte $AC,$00,$6D,$6B,$6D,$70,$80,$6D,$6B,$6D,$70,$80,$6D,$6B,$6D,$6D  ; $9D45
    .byte $18,$40,$06,$E6,$01,$D0,$08,$03,$01,$D0,$08,$02,$CB,$A8,$A6,$06  ; $9D55
    .byte $8C,$64,$63,$64,$68,$80,$64,$63,$64,$68,$80,$64,$63,$64,$6C,$04  ; $9D65
    .byte $08,$04,$08,$07,$0A,$0D,$00,$06,$64,$08,$02,$18,$C0,$6A,$6A,$60  ; $9D75
    .byte $6A,$6F,$60,$72,$80,$06,$C8,$01,$B2,$08,$03,$02,$01,$92,$0E,$01  ; $9D85
    .byte $9D,$76,$08,$02,$06,$64,$13,$08,$9D,$C5,$6D,$6D,$60,$6D,$B1,$00  ; $9D95
    .byte $AD,$AD,$AD,$07,$08,$18,$80,$06,$46,$40,$00,$74,$72,$71,$6F,$72  ; $9DA5
    .byte $71,$6F,$6D,$06,$C8,$02,$01,$AF,$00,$01,$8F,$4F,$0F,$01,$9D,$74  ; $9DB5
    .byte $07,$0A,$06,$64,$74,$74,$60,$74,$B4,$00,$B4,$B2,$B1,$06,$FF,$00  ; $9DC5
    .byte $F3,$16,$9C,$D9,$17,$06,$DC,$08,$00,$09,$03,$04,$00,$02,$88,$6B  ; $9DD5
    .byte $80,$8D,$80,$88,$8B,$8D,$0E,$02,$9D,$E0,$02,$88,$6B,$80,$8D,$08  ; $9DE5
    .byte $04,$7E,$7E,$78,$78,$74,$74,$74,$74,$04,$00,$04,$00,$08,$00,$02  ; $9DF5
    .byte $88,$6B,$80,$8D,$80,$88,$8B,$8D,$0E,$02,$9E,$00,$02,$88,$6B,$80  ; $9E05
    .byte $8D,$00,$A1,$A1,$A1,$04,$00,$02,$88,$6B,$80,$8D,$80,$88,$8B,$8D  ; $9E15
    .byte $0E,$01,$9E,$1A,$02,$88,$6B,$80,$8D,$00,$AB,$AB,$AC,$02,$00,$8D  ; $9E25
    .byte $70,$80,$01,$D2,$01,$72,$70,$72,$60,$72,$60,$70,$92,$90,$00,$53  ; $9E35
    .byte $74,$00,$72,$70,$72,$70,$6D,$6B,$02,$8D,$74,$80,$01,$B2,$02,$01  ; $9E45
    .byte $92,$02,$94,$99,$02,$A0,$00,$AD,$AD,$AD,$04,$00,$AD,$90,$6D,$70  ; $9E55
    .byte $8D,$8D,$90,$8D,$0E,$01,$9E,$5F,$AF,$92,$6E,$72,$8E,$8E,$92,$8E  ; $9E65
    .byte $AD,$90,$6D,$70,$92,$92,$93,$94,$08,$00,$AF,$92,$6F,$72,$94,$94  ; $9E75
    .byte $95,$96,$9B,$9B,$99,$96,$94,$94,$95,$76,$78,$AD,$91,$6D,$71,$92  ; $9E85
    .byte $92,$93,$94,$AD,$90,$6D,$70,$92,$92,$90,$8D,$AF,$92,$6F,$72,$96  ; $9E95
    .byte $96,$95,$96,$AF,$93,$70,$73,$97,$97,$96,$97,$AD,$91,$6D,$71,$91  ; $9EA5
    .byte $91,$8F,$91,$6F,$71,$72,$6F,$74,$72,$71,$6D,$08,$04,$76,$76,$99  ; $9EB5
    .byte $76,$76,$99,$08,$00,$16,$9D,$FE,$17,$06,$C8,$07,$09,$08,$01,$04  ; $9EC5
    .byte $00,$87,$65,$65,$0E,$0B,$9E,$D4,$6D,$66,$66,$60,$6D,$66,$66,$60  ; $9ED5
    .byte $65,$66,$66,$66,$65,$6A,$6A,$6A,$04,$00,$07,$09,$06,$64,$8D,$06  ; $9EE5
    .byte $C8,$6D,$6D,$04,$00,$06,$6E,$87,$06,$C8,$6D,$6D,$0E,$0A,$9E,$F8  ; $9EF5
    .byte $8C,$6A,$6A,$88,$88,$00,$A6,$A6,$AD,$04,$00,$06,$6E,$87,$06,$C8  ; $9F05
    .byte $6D,$6D,$0E,$07,$9F,$0E,$8C,$6A,$6A,$88,$88,$00,$A6,$A6,$A8,$04  ; $9F15
    .byte $00,$06,$6E,$87,$06,$C8,$6D,$6D,$0E,$06,$9F,$24,$65,$6A,$6A,$6A  ; $9F25
    .byte $04,$00,$06,$6E,$87,$06,$C8,$6D,$6D,$0E,$02,$9F,$35,$6A,$6A,$68  ; $9F35
    .byte $68,$88,$88,$A6,$06,$C8,$00,$A6,$AA,$AA,$04,$00,$06,$C8,$A5,$07  ; $9F45
    .byte $0A,$8A,$07,$08,$65,$65,$85,$85,$07,$0A,$02,$8A,$07,$07,$66,$0E  ; $9F55
    .byte $03,$9F,$4F,$04,$00,$07,$08,$06,$78,$87,$06,$C8,$6D,$6D,$0E,$0B  ; $9F65
    .byte $9F,$68,$04,$00,$06,$C8,$87,$06,$96,$6D,$6D,$0E,$02,$9F,$77,$06  ; $9F75
    .byte $C8,$6A,$6A,$6A,$6A,$04,$00,$87,$06,$96,$6D,$6D,$0E,$0A,$9F,$8A  ; $9F85
    .byte $06,$C8,$6A,$6A,$6A,$6A,$02,$85,$65,$8A,$65,$6C,$88,$88,$66,$66  ; $9F95
    .byte $66,$66,$16,$9E,$ED,$17,$00,$9F,$B4,$A0,$AA,$A1,$D5,$A2,$F7,$04  ; $9FA5
    .byte $08,$04,$08,$05,$02,$66,$18,$C0,$0A,$FA,$07,$0B,$06,$EB,$08,$17  ; $9FB5
    .byte $09,$02,$AD,$AD,$8B,$8D,$80,$8D,$80,$8D,$80,$8D,$0D,$50,$90,$0D  ; $9FC5
    .byte $00,$8D,$8B,$12,$08,$9F,$E2,$01,$8D,$0E,$01,$9F,$B6,$8D,$8F,$02  ; $9FD5
    .byte $C0,$0D,$50,$01,$90,$0D,$00,$02,$01,$B0,$02,$AF,$80,$01,$8D,$01  ; $9FE5
    .byte $ED,$C0,$80,$18,$80,$87,$88,$01,$8D,$04,$08  ; $9FF5
