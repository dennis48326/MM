; PRG 8 KB bank $3F at $E000
.segment "BANK3F"
.org $E000

    .byte $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$37,$37,$37,$37,$37,$37  ; $E000
    .byte $37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37  ; $E010
    .byte $37,$0D,$37,$0D,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37  ; $E020
    .byte $37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$0D  ; $E030
    .byte $0B,$37,$37,$0F,$0F,$37,$37,$0B,$37,$37,$37,$37,$37,$37,$37,$37  ; $E040
    .byte $37,$37,$37,$37,$37,$37,$37,$0F,$37,$37,$0B,$37,$37,$37,$37,$37  ; $E050
    .byte $37,$0D,$37,$37,$37,$37,$37,$37,$37,$0D,$37,$0F,$0F,$37,$37,$0F  ; $E060
    .byte $0F,$0F,$37,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$37,$0F,$0F,$37,$0F,$0F  ; $E070
    .byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$37,$0F,$0D,$0D,$37,$0D  ; $E080
    .byte $0D,$0D,$37,$37,$0D,$0D,$0D,$37,$0F,$0F,$0F,$0F,$0F,$0D,$0D,$0D  ; $E090
    .byte $0D,$0F,$0F,$0F,$37,$0D,$0D,$0D,$0D,$0D,$0D,$0F,$0D,$0D,$0D,$0D  ; $E0A0
    .byte $0D,$0D,$0F,$0B,$0B,$0D,$0B,$0B,$0B,$0D,$0D,$37,$0D,$37,$0B,$0B  ; $E0B0
    .byte $37,$0B,$37,$37,$0B,$0B,$0F,$37,$37,$0D,$0D,$37,$37,$37,$37,$37  ; $E0C0
    .byte $37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$0D,$37,$37,$37,$37,$37  ; $E0D0
    .byte $37,$37,$37,$37,$37,$37,$37,$37,$37,$37,$0D,$37,$37,$37,$37,$37  ; $E0E0
    .byte $37,$37,$37,$37,$37,$37,$37,$37,$37,$37  ; $E0F0

sub_3F_E0FA:
    LDA $22                      ; $E0FA  A5 22
    CMP #$04                     ; $E0FC  C9 04
    BNE loc_3F_E12D              ; $E0FE  D0 2D
    ORA #$20                     ; $E100  09 20
    STA $F6                      ; $E102  85 F6
    JSR sub_3F_FF37              ; $E104  20 37 FF
    LDA $19                      ; $E107  A5 19
    ORA $1A                      ; $E109  05 1A
    BNE loc_3F_E12D              ; $E10B  D0 20
    STA $11                      ; $E10D  85 11
    TAX                          ; $E10F  AA
    LDY #$03                     ; $E110  A0 03
    STY $10                      ; $E112  84 10

loc_3F_E114:
    LDY $10                      ; $E114  A4 10
    LDA $0120,Y                  ; $E116  B9 20 01
    BPL loc_3F_E122              ; $E119  10 07
    AND #$40                     ; $E11B  29 40
    BEQ loc_3F_E122              ; $E11D  F0 03
    JSR sub_3F_E12E              ; $E11F  20 2E E1

loc_3F_E122:
    DEC $10                      ; $E122  C6 10
    BPL loc_3F_E114              ; $E124  10 EE
    LDA $11                      ; $E126  A5 11
    STA $0780,X                  ; $E128  9D 80 07
    STA $19                      ; $E12B  85 19

loc_3F_E12D:
    RTS                          ; $E12D  60


sub_3F_E12E:
    LDA $0120,Y                  ; $E12E  B9 20 01
    AND #$BF                     ; $E131  29 BF
    STA $0120,Y                  ; $E133  99 20 01
    LDA $0128,Y                  ; $E136  B9 28 01
    AND #$1F                     ; $E139  29 1F
    STA $02                      ; $E13B  85 02
    JSR sub_3F_E1BF              ; $E13D  20 BF E1
    BCC loc_3F_E179              ; $E140  90 37
    LDA $0124,Y                  ; $E142  B9 24 01
    STA $0780,X                  ; $E145  9D 80 07
    STA $0784,X                  ; $E148  9D 84 07
    LDA $0128,Y                  ; $E14B  B9 28 01
    STA $0781,X                  ; $E14E  9D 81 07
    ORA #$20                     ; $E151  09 20
    STA $0785,X                  ; $E153  9D 85 07
    LDA #$00                     ; $E156  A9 00
    STA $0782,X                  ; $E158  9D 82 07
    STA $0786,X                  ; $E15B  9D 86 07
    LDA $012C,Y                  ; $E15E  B9 2C 01
    TAY                          ; $E161  A8
    LDA $A000,Y                  ; $E162  B9 00 A0
    STA $0783,X                  ; $E165  9D 83 07
    LDA $A200,Y                  ; $E168  B9 00 A2
    STA $0787,X                  ; $E16B  9D 87 07
    LDA #$FF                     ; $E16E  A9 FF
    STA $11                      ; $E170  85 11
    TXA                          ; $E172  8A
    CLC                          ; $E173  18
    ADC #$08                     ; $E174  69 08
    TAX                          ; $E176  AA
    LDY $10                      ; $E177  A4 10

loc_3F_E179:
    LDA $0128,Y                  ; $E179  B9 28 01
    AND #$1F                     ; $E17C  29 1F
    ORA #$01                     ; $E17E  09 01
    STA $02                      ; $E180  85 02
    JSR sub_3F_E1BF              ; $E182  20 BF E1
    BCC loc_3F_E1BE              ; $E185  90 37
    LDA $0124,Y                  ; $E187  B9 24 01
    STA $0780,X                  ; $E18A  9D 80 07
    STA $0784,X                  ; $E18D  9D 84 07
    LDA $0128,Y                  ; $E190  B9 28 01
    ORA #$01                     ; $E193  09 01
    STA $0781,X                  ; $E195  9D 81 07
    ORA #$20                     ; $E198  09 20
    STA $0785,X                  ; $E19A  9D 85 07
    LDA #$00                     ; $E19D  A9 00
    STA $0782,X                  ; $E19F  9D 82 07
    STA $0786,X                  ; $E1A2  9D 86 07
    LDA $012C,Y                  ; $E1A5  B9 2C 01
    TAY                          ; $E1A8  A8
    LDA $A100,Y                  ; $E1A9  B9 00 A1
    STA $0783,X                  ; $E1AC  9D 83 07
    LDA $A300,Y                  ; $E1AF  B9 00 A3
    STA $0787,X                  ; $E1B2  9D 87 07
    LDA #$FF                     ; $E1B5  A9 FF
    STA $11                      ; $E1B7  85 11
    TXA                          ; $E1B9  8A
    CLC                          ; $E1BA  18
    ADC #$08                     ; $E1BB  69 08
    TAX                          ; $E1BD  AA

loc_3F_E1BE:
    RTS                          ; $E1BE  60


sub_3F_E1BF:
    LDA $2B                      ; $E1BF  A5 2B
    AND #$C0                     ; $E1C1  29 C0
    BNE loc_3F_E20A              ; $E1C3  D0 45
    LDA $FC                      ; $E1C5  A5 FC
    LSR A                        ; $E1C7  4A
    LSR A                        ; $E1C8  4A
    LSR A                        ; $E1C9  4A
    STA $00                      ; $E1CA  85 00
    LDA $02                      ; $E1CC  A5 02
    SEC                          ; $E1CE  38
    SBC $00                      ; $E1CF  E5 00
    LDA $0120,Y                  ; $E1D1  B9 20 01
    AND #$3F                     ; $E1D4  29 3F
    STA $01                      ; $E1D6  85 01
    SBC $F9                      ; $E1D8  E5 F9
    BCC loc_3F_E20C              ; $E1DA  90 30
    BEQ loc_3F_E1F8              ; $E1DC  F0 1A
    CMP #$01                     ; $E1DE  C9 01
    BNE loc_3F_E20C              ; $E1E0  D0 2A
    LDA $02                      ; $E1E2  A5 02
    CMP $24                      ; $E1E4  C5 24
    BEQ loc_3F_E204              ; $E1E6  F0 1C
    LDA $23                      ; $E1E8  A5 23
    AND #$01                     ; $E1EA  29 01
    BNE loc_3F_E20C              ; $E1EC  D0 1E
    INC $02                      ; $E1EE  E6 02
    LDA $02                      ; $E1F0  A5 02
    CMP $24                      ; $E1F2  C5 24
    BEQ loc_3F_E20A              ; $E1F4  F0 14
    BNE loc_3F_E20C              ; $E1F6  D0 14

loc_3F_E1F8:
    LDA $02                      ; $E1F8  A5 02
    CMP $00                      ; $E1FA  C5 00
    BEQ loc_3F_E20C              ; $E1FC  F0 0E
    LDA $02                      ; $E1FE  A5 02
    CMP $24                      ; $E200  C5 24
    BNE loc_3F_E20A              ; $E202  D0 06

loc_3F_E204:
    LDA $01                      ; $E204  A5 01
    CMP $2A                      ; $E206  C5 2A
    BNE loc_3F_E20C              ; $E208  D0 02

loc_3F_E20A:
    SEC                          ; $E20A  38
    RTS                          ; $E20B  60


loc_3F_E20C:
    CLC                          ; $E20C  18
    RTS                          ; $E20D  60

    .byte $38,$A5,$1A,$05,$19,$D0,$4C,$A9,$08,$8D,$80,$07,$BD,$78,$03,$29  ; $E20E
    .byte $F0,$0A,$2E,$80,$07,$0A,$2E,$80,$07,$8D,$81,$07,$BD,$30,$03,$29  ; $E21E
    .byte $F0,$4A,$4A,$4A,$0D,$81,$07,$8D,$81,$07,$09,$20,$8D,$86,$07,$A9  ; $E22E
    .byte $01,$8D,$82,$07,$8D,$87,$07,$AD,$80,$07,$8D,$85,$07,$A9,$00,$8D  ; $E23E
    .byte $83,$07,$8D,$84,$07,$8D,$88,$07,$8D,$89,$07,$A9,$FF,$8D,$8A,$07  ; $E24E
    .byte $85,$19,$18  ; $E25E

loc_3F_E261:
    RTS                          ; $E261  60


sub_3F_E262:
    LDA $19                      ; $E262  A5 19
    ORA $1A                      ; $E264  05 1A
    BNE loc_3F_E261              ; $E266  D0 F9
    LDA $1D                      ; $E268  A5 1D
    BPL loc_3F_E261              ; $E26A  10 F5
    AND #$7F                     ; $E26C  29 7F
    STA $1D                      ; $E26E  85 1D
    AND #$3F                     ; $E270  29 3F
    STA $29                      ; $E272  85 29
    LDY #$00                     ; $E274  A0 00
    LDA $1D                      ; $E276  A5 1D
    AND #$40                     ; $E278  29 40
    BEQ loc_3F_E286              ; $E27A  F0 0A
    LDY #$04                     ; $E27C  A0 04
    LDA $2B                      ; $E27E  A5 2B
    AND #$20                     ; $E280  29 20
    BEQ loc_3F_E286              ; $E282  F0 02
    LDY #$08                     ; $E284  A0 08

loc_3F_E286:
    STY $10                      ; $E286  84 10
    LDA $29                      ; $E288  A5 29
    PHA                          ; $E28A  48
    AND #$07                     ; $E28B  29 07
    ASL A                        ; $E28D  0A
    ASL A                        ; $E28E  0A
    STA $0781                    ; $E28F  8D 81 07
    LDA #$02                     ; $E292  A9 02
    STA $0780                    ; $E294  8D 80 07
    PLA                          ; $E297  68
    AND #$F8                     ; $E298  29 F8
    ASL A                        ; $E29A  0A
    ROL $0780                    ; $E29B  2E 80 07
    ASL A                        ; $E29E  0A
    ROL $0780                    ; $E29F  2E 80 07
    ASL A                        ; $E2A2  0A
    ROL $0780                    ; $E2A3  2E 80 07
    ASL A                        ; $E2A6  0A
    ROL $0780                    ; $E2A7  2E 80 07
    ORA $0781                    ; $E2AA  0D 81 07
    STA $0781                    ; $E2AD  8D 81 07
    CLC                          ; $E2B0  18
    ADC #$20                     ; $E2B1  69 20
    STA $0788                    ; $E2B3  8D 88 07
    ADC #$20                     ; $E2B6  69 20
    STA $078F                    ; $E2B8  8D 8F 07
    ADC #$20                     ; $E2BB  69 20
    STA $0796                    ; $E2BD  8D 96 07
    LDA $29                      ; $E2C0  A5 29
    ORA #$C0                     ; $E2C2  09 C0
    STA $079D                    ; $E2C4  8D 9D 07
    LDA $0780                    ; $E2C7  AD 80 07
    ORA $10                      ; $E2CA  05 10
    STA $0780                    ; $E2CC  8D 80 07
    STA $0787                    ; $E2CF  8D 87 07
    STA $078E                    ; $E2D2  8D 8E 07
    STA $0795                    ; $E2D5  8D 95 07
    ORA #$03                     ; $E2D8  09 03
    STA $079C                    ; $E2DA  8D 9C 07
    LDA #$03                     ; $E2DD  A9 03
    STA $0782                    ; $E2DF  8D 82 07
    STA $0789                    ; $E2E2  8D 89 07
    STA $0790                    ; $E2E5  8D 90 07
    STA $0797                    ; $E2E8  8D 97 07
    LDA #$00                     ; $E2EB  A9 00
    STA $079E                    ; $E2ED  8D 9E 07
    LDY $1C                      ; $E2F0  A4 1C
    JSR sub_3E_D2CE              ; $E2F2  20 CE D2
    JSR sub_3E_D17F              ; $E2F5  20 7F D1
    LDX #$03                     ; $E2F8  A2 03

loc_3F_E2FA:
    LDA $06C0,X                  ; $E2FA  BD C0 06
    STA $0783,X                  ; $E2FD  9D 83 07
    LDA $06C4,X                  ; $E300  BD C4 06
    STA $078A,X                  ; $E303  9D 8A 07
    LDA $06C8,X                  ; $E306  BD C8 06
    STA $0791,X                  ; $E309  9D 91 07
    LDA $06CC,X                  ; $E30C  BD CC 06
    STA $0798,X                  ; $E30F  9D 98 07
    DEX                          ; $E312  CA
    BPL loc_3F_E2FA              ; $E313  10 E5
    LDA $10                      ; $E315  A5 10
    STA $079F                    ; $E317  8D 9F 07
    STX $07A0                    ; $E31A  8E A0 07
    LDA $29                      ; $E31D  A5 29
    AND #$3F                     ; $E31F  29 3F
    CMP #$38                     ; $E321  C9 38
    BCC loc_3F_E330              ; $E323  90 0B
    LDX #$04                     ; $E325  A2 04

loc_3F_E327:
    LDA $079C,X                  ; $E327  BD 9C 07
    STA $078E,X                  ; $E32A  9D 8E 07
    DEX                          ; $E32D  CA
    BPL loc_3F_E327              ; $E32E  10 F7

loc_3F_E330:
    STX $19                      ; $E330  86 19
    RTS                          ; $E332  60


loc_3F_E333:
    LDA #$00                     ; $E333  A9 00
    STA $1B                      ; $E335  85 1B
    LDA $10                      ; $E337  A5 10
    ORA #$03                     ; $E339  09 03
    STA $0780                    ; $E33B  8D 80 07
    LDA #$C0                     ; $E33E  A9 C0
    STA $0781                    ; $E340  8D 81 07
    LDY #$3F                     ; $E343  A0 3F
    STY $0782                    ; $E345  8C 82 07

loc_3F_E348:
    LDA $0680,Y                  ; $E348  B9 80 06
    STA $0783,Y                  ; $E34B  99 83 07
    LDA #$00                     ; $E34E  A9 00
    STA $0680,Y                  ; $E350  99 80 06
    DEY                          ; $E353  88
    BPL loc_3F_E348              ; $E354  10 F2
    STY $07C3                    ; $E356  8C C3 07
    STY $19                      ; $E359  84 19

loc_3F_E35B:
    RTS                          ; $E35B  60


sub_3F_E35C:
    LDA $19                      ; $E35C  A5 19
    ORA $1A                      ; $E35E  05 1A
    BNE loc_3F_E35B              ; $E360  D0 F9
    LDA #$04                     ; $E362  A9 04
    STA $10                      ; $E364  85 10
    LDA $2B                      ; $E366  A5 2B
    AND #$C0                     ; $E368  29 C0
    BNE loc_3F_E36E              ; $E36A  D0 02
    ASL $10                      ; $E36C  06 10

loc_3F_E36E:
    LDA $10                      ; $E36E  A5 10
    ORA #$20                     ; $E370  09 20
    STA $10                      ; $E372  85 10
    LDA $1B                      ; $E374  A5 1B
    BEQ loc_3F_E35B              ; $E376  F0 E3
    CMP #$40                     ; $E378  C9 40
    BEQ loc_3F_E333              ; $E37A  F0 B7
    AND #$7F                     ; $E37C  29 7F
    STA $1B                      ; $E37E  85 1B
    LDY $1C                      ; $E380  A4 1C
    JSR sub_3E_D2CE              ; $E382  20 CE D2
    LDA $1B                      ; $E385  A5 1B
    STA $29                      ; $E387  85 29
    PHA                          ; $E389  48
    AND #$07                     ; $E38A  29 07
    ASL A                        ; $E38C  0A
    ASL A                        ; $E38D  0A
    STA $0781                    ; $E38E  8D 81 07
    LDA #$02                     ; $E391  A9 02
    STA $0780                    ; $E393  8D 80 07
    PLA                          ; $E396  68
    AND #$F8                     ; $E397  29 F8
    ASL A                        ; $E399  0A
    ROL $0780                    ; $E39A  2E 80 07
    ASL A                        ; $E39D  0A
    ROL $0780                    ; $E39E  2E 80 07
    ASL A                        ; $E3A1  0A
    ROL $0780                    ; $E3A2  2E 80 07
    ASL A                        ; $E3A5  0A
    ROL $0780                    ; $E3A6  2E 80 07
    ORA $0781                    ; $E3A9  0D 81 07
    STA $0781                    ; $E3AC  8D 81 07
    CLC                          ; $E3AF  18
    ADC #$20                     ; $E3B0  69 20
    STA $0794                    ; $E3B2  8D 94 07
    ADC #$20                     ; $E3B5  69 20
    STA $07A7                    ; $E3B7  8D A7 07
    ADC #$20                     ; $E3BA  69 20
    STA $07BA                    ; $E3BC  8D BA 07
    LDA $0780                    ; $E3BF  AD 80 07
    ORA $10                      ; $E3C2  05 10
    STA $0780                    ; $E3C4  8D 80 07
    STA $0793                    ; $E3C7  8D 93 07
    STA $07A6                    ; $E3CA  8D A6 07
    STA $07B9                    ; $E3CD  8D B9 07
    LDA #$0F                     ; $E3D0  A9 0F
    STA $0782                    ; $E3D2  8D 82 07
    STA $0795                    ; $E3D5  8D 95 07
    STA $07A8                    ; $E3D8  8D A8 07
    STA $07BB                    ; $E3DB  8D BB 07

loc_3F_E3DE:
    JSR sub_3E_D17F              ; $E3DE  20 7F D1
    LDA $29                      ; $E3E1  A5 29
    AND #$03                     ; $E3E3  29 03
    TAX                          ; $E3E5  AA
    LDY $E425,X                  ; $E3E6  BC 25 E4
    LDX #$00                     ; $E3E9  A2 00

loc_3F_E3EB:
    LDA $06C0,X                  ; $E3EB  BD C0 06
    STA $0780,Y                  ; $E3EE  99 80 07
    INY                          ; $E3F1  C8
    INX                          ; $E3F2  E8
    TXA                          ; $E3F3  8A
    AND #$03                     ; $E3F4  29 03
    BNE loc_3F_E3EB              ; $E3F6  D0 F3
    TYA                          ; $E3F8  98
    CLC                          ; $E3F9  18
    ADC #$0F                     ; $E3FA  69 0F
    PHA                          ; $E3FC  48
    LDY $29                      ; $E3FD  A4 29
    LDA $10                      ; $E3FF  A5 10
    STA $0680,Y                  ; $E401  99 80 06
    PLA                          ; $E404  68
    TAY                          ; $E405  A8
    CPY #$4C                     ; $E406  C0 4C
    BCC loc_3F_E3EB              ; $E408  90 E1
    INC $1B                      ; $E40A  E6 1B
    INC $29                      ; $E40C  E6 29
    LDA $29                      ; $E40E  A5 29
    AND #$03                     ; $E410  29 03
    BNE loc_3F_E3DE              ; $E412  D0 CA
    LDA #$FF                     ; $E414  A9 FF
    STA $07CC                    ; $E416  8D CC 07
    LDY $29                      ; $E419  A4 29
    CPY #$39                     ; $E41B  C0 39
    BCC loc_3F_E422              ; $E41D  90 03
    STA $07A6                    ; $E41F  8D A6 07

loc_3F_E422:
    STA $19                      ; $E422  85 19
    RTS                          ; $E424  60

    .byte $03,$07,$0B,$0F  ; $E425

sub_3F_E429:
    LDA $0135                    ; $E429  AD 35 01
    BEQ loc_3F_E468              ; $E42C  F0 3A
    BMI loc_3F_E469              ; $E42E  30 39
    AND #$40                     ; $E430  29 40
    BNE loc_3F_E468              ; $E432  D0 34
    LDA $0136                    ; $E434  AD 36 01
    BNE loc_3F_E465              ; $E437  D0 2C
    LDY #$0F                     ; $E439  A0 0F

loc_3F_E43B:
    LDA $0620,Y                  ; $E43B  B9 20 06
    SEC                          ; $E43E  38
    SBC $0137                    ; $E43F  ED 37 01
    BPL loc_3F_E446              ; $E442  10 02
    LDA #$0F                     ; $E444  A9 0F

loc_3F_E446:
    STA $0600,Y                  ; $E446  99 00 06
    DEY                          ; $E449  88
    BPL loc_3F_E43B              ; $E44A  10 EF
    STY $18                      ; $E44C  84 18
    LDA #$05                     ; $E44E  A9 05
    STA $0136                    ; $E450  8D 36 01
    LDA $0137                    ; $E453  AD 37 01
    CLC                          ; $E456  18
    ADC #$10                     ; $E457  69 10
    STA $0137                    ; $E459  8D 37 01
    CMP #$50                     ; $E45C  C9 50
    BNE loc_3F_E465              ; $E45E  D0 05
    LDA #$40                     ; $E460  A9 40
    STA $0135                    ; $E462  8D 35 01

loc_3F_E465:
    DEC $0136                    ; $E465  CE 36 01

loc_3F_E468:
    RTS                          ; $E468  60


loc_3F_E469:
    LDA $0136                    ; $E469  AD 36 01
    BNE loc_3F_E498              ; $E46C  D0 2A
    LDY #$0F                     ; $E46E  A0 0F

loc_3F_E470:
    LDA $0620,Y                  ; $E470  B9 20 06
    SEC                          ; $E473  38
    SBC $0137                    ; $E474  ED 37 01
    BPL loc_3F_E47B              ; $E477  10 02
    LDA #$0F                     ; $E479  A9 0F

loc_3F_E47B:
    STA $0600,Y                  ; $E47B  99 00 06
    DEY                          ; $E47E  88
    BPL loc_3F_E470              ; $E47F  10 EF
    STY $18                      ; $E481  84 18
    LDA #$05                     ; $E483  A9 05
    STA $0136                    ; $E485  8D 36 01
    LDA $0137                    ; $E488  AD 37 01
    SEC                          ; $E48B  38
    SBC #$10                     ; $E48C  E9 10
    STA $0137                    ; $E48E  8D 37 01
    BCS loc_3F_E498              ; $E491  B0 05
    LDA #$00                     ; $E493  A9 00
    STA $0135                    ; $E495  8D 35 01

loc_3F_E498:
    DEC $0136                    ; $E498  CE 36 01
    RTS                          ; $E49B  60


sub_3F_E49C:
    LDA $1E                      ; $E49C  A5 1E
    BEQ loc_3F_E4DC              ; $E49E  F0 3C
    LDA $22                      ; $E4A0  A5 22
    CMP #$02                     ; $E4A2  C9 02
    BNE loc_3F_E4DC              ; $E4A4  D0 36
    LDA $19                      ; $E4A6  A5 19
    ORA $1A                      ; $E4A8  05 1A
    BNE loc_3F_E4DC              ; $E4AA  D0 30
    LDA #$23                     ; $E4AC  A9 23
    STA $0780                    ; $E4AE  8D 80 07
    LDA #$E0                     ; $E4B1  A9 E0
    STA $0781                    ; $E4B3  8D 81 07
    LDY #$1F                     ; $E4B6  A0 1F
    STY $0782                    ; $E4B8  8C 82 07

loc_3F_E4BB:
    LDA $0660,Y                  ; $E4BB  B9 60 06
    STA $0783,Y                  ; $E4BE  99 83 07
    DEY                          ; $E4C1  88
    BPL loc_3F_E4BB              ; $E4C2  10 F7
    STY $07A3                    ; $E4C4  8C A3 07
    STY $19                      ; $E4C7  84 19
    LDY #$03                     ; $E4C9  A0 03
    LDA #$0F                     ; $E4CB  A9 0F

loc_3F_E4CD:
    STA $0608,Y                  ; $E4CD  99 08 06
    STA $0628,Y                  ; $E4D0  99 28 06
    DEY                          ; $E4D3  88
    BPL loc_3F_E4CD              ; $E4D4  10 F7
    STY $18                      ; $E4D6  84 18
    LDA #$00                     ; $E4D8  A9 00
    STA $1E                      ; $E4DA  85 1E

loc_3F_E4DC:
    RTS                          ; $E4DC  60


sub_3F_E4DD:
    LDX $0140                    ; $E4DD  AE 40 01
    BEQ loc_3F_E4DC              ; $E4E0  F0 FA
    LDY $E566,X                  ; $E4E2  BC 66 E5

loc_3F_E4E5:
    LDA $E577,Y                  ; $E4E5  B9 77 E5
    BMI loc_3F_E4DC              ; $E4E8  30 F2
    CMP $0141                    ; $E4EA  CD 41 01
    BEQ loc_3F_E4F3              ; $E4ED  F0 04
    INY                          ; $E4EF  C8
    INY                          ; $E4F0  C8
    BNE loc_3F_E4E5              ; $E4F1  D0 F2

loc_3F_E4F3:
    LDA $19                      ; $E4F3  A5 19
    ORA $1A                      ; $E4F5  05 1A
    BNE loc_3F_E4DC              ; $E4F7  D0 E3
    STA $0140                    ; $E4F9  8D 40 01
    LDA $E578,Y                  ; $E4FC  B9 78 E5
    ORA $0142                    ; $E4FF  0D 42 01
    PHA                          ; $E502  48
    AND #$07                     ; $E503  29 07
    TAX                          ; $E505  AA
    PLA                          ; $E506  68
    LSR A                        ; $E507  4A
    LSR A                        ; $E508  4A
    LSR A                        ; $E509  4A
    TAY                          ; $E50A  A8
    LDA $0680,Y                  ; $E50B  B9 80 06
    ORA $FCBF,X                  ; $E50E  1D BF FC
    STA $0680,Y                  ; $E511  99 80 06
    LDA $0141                    ; $E514  AD 41 01
    PHA                          ; $E517  48
    AND #$07                     ; $E518  29 07
    ASL A                        ; $E51A  0A
    ASL A                        ; $E51B  0A
    STA $0781                    ; $E51C  8D 81 07
    LDA #$02                     ; $E51F  A9 02
    STA $0780                    ; $E521  8D 80 07
    PLA                          ; $E524  68
    AND #$F8                     ; $E525  29 F8
    ASL A                        ; $E527  0A
    ROL $0780                    ; $E528  2E 80 07
    ASL A                        ; $E52B  0A
    ROL $0780                    ; $E52C  2E 80 07
    ASL A                        ; $E52F  0A
    ROL $0780                    ; $E530  2E 80 07
    ASL A                        ; $E533  0A
    ROL $0780                    ; $E534  2E 80 07
    ORA $0781                    ; $E537  0D 81 07
    STA $0781                    ; $E53A  8D 81 07
    LDA $0780                    ; $E53D  AD 80 07
    STA $0785                    ; $E540  8D 85 07
    LDY $0142                    ; $E543  AC 42 01
    LDA $0781                    ; $E546  AD 81 07
    ORA $E5C4,Y                  ; $E549  19 C4 E5
    STA $0781                    ; $E54C  8D 81 07
    ORA #$20                     ; $E54F  09 20
    STA $0786                    ; $E551  8D 86 07
    LDA #$01                     ; $E554  A9 01
    STA $0782                    ; $E556  8D 82 07
    STA $0787                    ; $E559  8D 87 07
    LDA #$00                     ; $E55C  A9 00
    STA $0783                    ; $E55E  8D 83 07
    STA $0784                    ; $E561  8D 84 07
    STA $0788                    ; $E564  8D 88 07
    STA $0789                    ; $E567  8D 89 07
    LDA #$FF                     ; $E56A  A9 FF
    STA $078A                    ; $E56C  8D 8A 07
    STA $19                      ; $E56F  85 19
    RTS                          ; $E571  60

    .byte $00,$01,$1A,$33,$40,$FF,$1A,$00,$22,$04,$2A,$08,$1B,$0C,$23,$10  ; $E572
    .byte $2B,$14,$1C,$18,$24,$1C,$2C,$20,$1D,$24,$25,$28,$2D,$2C,$FF,$1A  ; $E582
    .byte $30,$22,$34,$2A,$38,$1B,$3C,$23,$40,$2B,$44,$1C,$48,$24,$4C,$2C  ; $E592
    .byte $50,$1D,$54,$25,$58,$2D,$5C,$FF,$1A,$60,$22,$64,$2A,$68,$1B,$6C  ; $E5A2
    .byte $23,$70,$2B,$74,$FF,$18,$78,$20,$7C,$28,$80,$19,$84,$21,$88,$29  ; $E5B2
    .byte $8C,$FF,$00,$02,$40,$42,$85,$10,$A5,$F5,$48,$A5,$F6,$48,$A5,$22  ; $E5C2
    .byte $09,$20,$85,$F6,$20,$37,$FF,$A4,$2A,$B9,$00,$B3,$85,$9E,$85,$9F  ; $E5D2
    .byte $A9,$01,$8D,$00,$A0,$A9,$01,$85,$23,$85,$2F,$A4,$10,$B9,$30,$B5  ; $E5E2
    .byte $29,$20,$D0,$0E,$A9,$08,$85,$23,$A9,$00,$8D,$00,$A0,$B9,$30,$B5  ; $E5F2
    .byte $29,$C0,$05,$10,$85,$2B,$B9,$30,$B5,$29,$0F,$85,$2D,$A9,$00,$85  ; $E602
    .byte $2E,$A9,$00,$85,$24,$A5,$2A,$85,$0F,$20,$B1,$CF,$20,$1C,$FF,$A5  ; $E612
    .byte $2A,$C5,$0F,$D0,$0E,$E6,$24,$A5,$24,$29,$1F,$85,$24,$D0,$EA,$E6  ; $E622
    .byte $2A,$D0,$E6,$A5,$2B,$29,$C0,$F0,$04,$A5,$0F,$85,$2A,$20,$69,$C3  ; $E632
    .byte $20,$E1,$CE,$A5,$F9,$C9,$0A,$F0,$08,$C9,$0D,$F0,$04,$C9,$0E,$D0  ; $E642
    .byte $08,$A4,$AB,$B9,$7A,$E6,$20,$8B,$DA,$20,$BB,$DA,$A5,$19,$F0,$06  ; $E652
    .byte $20,$30,$C3,$4C,$5B,$E6,$A9,$00,$85,$18,$85,$EF,$20,$73,$C3,$68  ; $E662
    .byte $85,$F6,$68,$85,$F5,$4C,$37,$FF,$2B,$2D,$28,$2A,$2E,$2C,$27,$29  ; $E672

sub_3F_E682:
    LDA $22                      ; $E682  A5 22
    ORA #$20                     ; $E684  09 20
    STA $F6                      ; $E686  85 F6
    JSR sub_3F_FF37              ; $E688  20 37 FF
    LDA #$00                     ; $E68B  A9 00
    STA $95                      ; $E68D  85 95
    LDA $B570                    ; $E68F  AD 70 B5
    STA $0780                    ; $E692  8D 80 07
    STA $0785                    ; $E695  8D 85 07
    LDA $B571                    ; $E698  AD 71 B5
    STA $0781                    ; $E69B  8D 81 07
    ORA #$20                     ; $E69E  09 20
    STA $0786                    ; $E6A0  8D 86 07
    LDA #$01                     ; $E6A3  A9 01
    STA $0782                    ; $E6A5  8D 82 07
    STA $0787                    ; $E6A8  8D 87 07
    LDA #$23                     ; $E6AB  A9 23
    STA $078A                    ; $E6AD  8D 8A 07
    LDA $B576                    ; $E6B0  AD 76 B5
    STA $03                      ; $E6B3  85 03
    ORA #$C0                     ; $E6B5  09 C0
    STA $078B                    ; $E6B7  8D 8B 07
    LDA $B577                    ; $E6BA  AD 77 B5
    STA $04                      ; $E6BD  85 04
    LDA #$00                     ; $E6BF  A9 00
    STA $078C                    ; $E6C1  8D 8C 07
    LDA #$2C                     ; $E6C4  A9 2C
    JSR sub_3F_F6BE              ; $E6C6  20 BE F6
    LDA #$04                     ; $E6C9  A9 04
    STA $02                      ; $E6CB  85 02
    LDY #$00                     ; $E6CD  A0 00

loc_3F_E6CF:
    LDX $B572,Y                  ; $E6CF  BE 72 B5
    LDA $A000,X                  ; $E6D2  BD 00 A0
    STA $0783                    ; $E6D5  8D 83 07
    LDA $A100,X                  ; $E6D8  BD 00 A1
    STA $0784                    ; $E6DB  8D 84 07
    LDA $A200,X                  ; $E6DE  BD 00 A2
    STA $0788                    ; $E6E1  8D 88 07
    LDA $A300,X                  ; $E6E4  BD 00 A3
    STA $0789                    ; $E6E7  8D 89 07
    LDX $04                      ; $E6EA  A6 04
    LDA $E810,X                  ; $E6EC  BD 10 E8
    STA $05                      ; $E6EF  85 05
    LDX $03                      ; $E6F1  A6 03
    LDA $0640,X                  ; $E6F3  BD 40 06
    AND $05                      ; $E6F6  25 05
    ORA $B578,Y                  ; $E6F8  19 78 B5
    STA $078D                    ; $E6FB  8D 8D 07
    STA $0640,X                  ; $E6FE  9D 40 06
    LDA #$FF                     ; $E701  A9 FF
    STA $078E                    ; $E703  8D 8E 07
    STA $19                      ; $E706  85 19

loc_3F_E708:
    LDA #$00                     ; $E708  A9 00
    STA $9A                      ; $E70A  85 9A
    JSR sub_3F_FF1C              ; $E70C  20 1C FF
    INC $9A                      ; $E70F  E6 9A
    INC $95                      ; $E711  E6 95
    LDA $95                      ; $E713  A5 95
    AND #$03                     ; $E715  29 03
    BNE loc_3F_E708              ; $E717  D0 EF
    INY                          ; $E719  C8
    DEC $02                      ; $E71A  C6 02
    BEQ loc_3F_E750              ; $E71C  F0 32
    LDA $0781                    ; $E71E  AD 81 07
    SEC                          ; $E721  38
    SBC #$40                     ; $E722  E9 40
    STA $0781                    ; $E724  8D 81 07
    ORA #$20                     ; $E727  09 20
    STA $0786                    ; $E729  8D 86 07
    LDA $0780                    ; $E72C  AD 80 07
    SBC #$00                     ; $E72F  E9 00
    STA $0780                    ; $E731  8D 80 07
    STA $0785                    ; $E734  8D 85 07
    LDA $04                      ; $E737  A5 04
    EOR #$02                     ; $E739  49 02
    STA $04                      ; $E73B  85 04
    CMP #$03                     ; $E73D  C9 03
    BNE loc_3F_E6CF              ; $E73F  D0 8E
    LDA $03                      ; $E741  A5 03
    SEC                          ; $E743  38
    SBC #$08                     ; $E744  E9 08
    STA $03                      ; $E746  85 03
    ORA #$C0                     ; $E748  09 C0
    STA $078B                    ; $E74A  8D 8B 07
    JMP loc_3F_E6CF              ; $E74D  4C CF E6


loc_3F_E750:
    RTS                          ; $E750  60


sub_3F_E751:
    LDA $22                      ; $E751  A5 22
    ORA #$20                     ; $E753  09 20
    STA $F6                      ; $E755  85 F6
    JSR sub_3F_FF37              ; $E757  20 37 FF
    LDA $B57C                    ; $E75A  AD 7C B5
    STA $0780                    ; $E75D  8D 80 07
    STA $0784                    ; $E760  8D 84 07
    LDA $B57D                    ; $E763  AD 7D B5
    STA $0781                    ; $E766  8D 81 07
    ORA #$20                     ; $E769  09 20
    STA $0785                    ; $E76B  8D 85 07
    LDA #$00                     ; $E76E  A9 00
    STA $0782                    ; $E770  8D 82 07
    STA $0786                    ; $E773  8D 86 07
    STA $95                      ; $E776  85 95
    LDA #$23                     ; $E778  A9 23
    STA $0788                    ; $E77A  8D 88 07
    LDA $B582                    ; $E77D  AD 82 B5
    STA $03                      ; $E780  85 03
    ORA #$C0                     ; $E782  09 C0
    STA $0789                    ; $E784  8D 89 07
    LDA $B583                    ; $E787  AD 83 B5
    STA $04                      ; $E78A  85 04
    LDA #$00                     ; $E78C  A9 00
    STA $078A                    ; $E78E  8D 8A 07
    LDA #$2C                     ; $E791  A9 2C
    JSR sub_3F_F6BE              ; $E793  20 BE F6
    LDA #$04                     ; $E796  A9 04
    STA $02                      ; $E798  85 02
    LDY #$00                     ; $E79A  A0 00

loc_3F_E79C:
    LDX $B57E,Y                  ; $E79C  BE 7E B5
    LDA $A100,X                  ; $E79F  BD 00 A1
    STA $0783                    ; $E7A2  8D 83 07
    LDA $A300,X                  ; $E7A5  BD 00 A3
    STA $0787                    ; $E7A8  8D 87 07
    LDX $04                      ; $E7AB  A6 04
    LDA $E810,X                  ; $E7AD  BD 10 E8
    STA $05                      ; $E7B0  85 05
    LDX $03                      ; $E7B2  A6 03
    LDA $0640,X                  ; $E7B4  BD 40 06
    AND $05                      ; $E7B7  25 05
    ORA $B584,Y                  ; $E7B9  19 84 B5
    STA $078B                    ; $E7BC  8D 8B 07
    STA $0640,X                  ; $E7BF  9D 40 06
    LDA #$FF                     ; $E7C2  A9 FF
    STA $078C                    ; $E7C4  8D 8C 07
    STA $19                      ; $E7C7  85 19

loc_3F_E7C9:
    LDA #$00                     ; $E7C9  A9 00
    STA $9A                      ; $E7CB  85 9A
    JSR sub_3F_FF1C              ; $E7CD  20 1C FF
    INC $9A                      ; $E7D0  E6 9A
    INC $95                      ; $E7D2  E6 95
    LDA $95                      ; $E7D4  A5 95
    AND #$03                     ; $E7D6  29 03
    BNE loc_3F_E7C9              ; $E7D8  D0 EF
    INY                          ; $E7DA  C8
    DEC $02                      ; $E7DB  C6 02
    BEQ loc_3F_E80F              ; $E7DD  F0 30
    LDA $0781                    ; $E7DF  AD 81 07
    CLC                          ; $E7E2  18
    ADC #$40                     ; $E7E3  69 40
    STA $0781                    ; $E7E5  8D 81 07
    ORA #$20                     ; $E7E8  09 20
    STA $0785                    ; $E7EA  8D 85 07
    LDA $0780                    ; $E7ED  AD 80 07
    ADC #$00                     ; $E7F0  69 00
    STA $0780                    ; $E7F2  8D 80 07
    STA $0784                    ; $E7F5  8D 84 07
    LDA $04                      ; $E7F8  A5 04
    EOR #$02                     ; $E7FA  49 02
    STA $04                      ; $E7FC  85 04
    BNE loc_3F_E79C              ; $E7FE  D0 9C
    LDA $03                      ; $E800  A5 03
    CLC                          ; $E802  18
    ADC #$08                     ; $E803  69 08
    STA $03                      ; $E805  85 03
    ORA #$C0                     ; $E807  09 C0
    STA $0789                    ; $E809  8D 89 07
    JMP loc_3F_E79C              ; $E80C  4C 9C E7


loc_3F_E80F:
    RTS                          ; $E80F  60

    .byte $FC,$F3,$CF,$3F,$00,$81,$82,$00,$00,$00,$00,$01,$00,$10,$02,$08  ; $E810
    .byte $90,$01,$02,$45,$00,$00,$00,$A0,$20,$00,$20,$00,$80,$04,$08,$20  ; $E820
    .byte $A0,$81,$0A,$02,$00,$4D,$08,$A4,$00,$0A,$0A,$01,$00,$54,$00,$04  ; $E830
    .byte $00,$81,$02,$8A,$20,$00,$20,$60,$20,$44,$20,$00,$00,$08,$88,$18  ; $E840
    .byte $00,$04,$02,$08,$00,$80,$00,$11,$00,$80,$00,$80,$00,$20,$02,$C0  ; $E850
    .byte $00,$00,$00,$31,$00,$00,$00,$80,$80,$20,$20,$00,$A8,$10,$00,$20  ; $E860
    .byte $00,$00,$00,$0C,$00,$00,$08,$80,$2A,$21,$00,$80,$20,$24,$00,$60  ; $E870
    .byte $80,$01,$00,$00,$08,$00,$20,$01,$00,$02,$00,$11,$00,$00,$20,$01  ; $E880
    .byte $80,$00,$00,$08,$20,$04,$00,$00,$88,$20,$00,$94,$00,$28,$00,$80  ; $E890
    .byte $20,$00,$00,$00,$00,$36,$00,$08,$08,$01,$08,$80,$0A,$A4,$00,$00  ; $E8A0
    .byte $00,$09,$20,$22,$08,$01,$02,$82,$28,$50,$00,$01,$88,$80,$80,$0C  ; $E8B0
    .byte $02,$00,$00,$84,$28,$08,$80,$80,$00,$24,$02,$50,$80,$10,$20,$02  ; $E8C0
    .byte $08,$88,$20,$05,$02,$88,$00,$1A,$00,$02,$08,$21,$00,$11,$00,$80  ; $E8D0
    .byte $00,$00,$00,$80,$02,$A0,$00,$00,$20,$1C,$00,$11,$02,$1A,$00,$80  ; $E8E0
    .byte $00,$04,$88,$02,$00,$24,$28,$90,$22,$08,$20,$80,$08,$04,$A8,$01  ; $E8F0
    .byte $00,$08,$22,$01,$00,$30,$00,$10,$20,$20,$08,$00,$08,$21,$00,$00  ; $E900
    .byte $00,$04,$00,$00,$00,$80,$00,$1A,$00,$42,$00,$08,$80,$00,$00,$0C  ; $E910
    .byte $02,$00,$02,$00,$02,$34,$00,$10,$02,$00,$00,$01,$08,$80,$00,$10  ; $E920
    .byte $00,$00,$00,$9A,$80,$02,$0A,$30,$00,$00,$02,$A8,$00,$11,$00,$3D  ; $E930
    .byte $00,$10,$00,$04,$08,$00,$00,$10,$00,$3C,$00,$00,$80,$60,$02,$00  ; $E940
    .byte $20,$04,$00,$08,$08,$00,$00,$00,$A0,$00,$00,$02,$00,$14,$08,$60  ; $E950
    .byte $00,$00,$00,$40,$02,$01,$08,$90,$00,$24,$00,$0C,$00,$22,$88,$20  ; $E960
    .byte $02,$00,$00,$23,$00,$00,$20,$08,$00,$02,$00,$02,$00,$51,$00,$AD  ; $E970
    .byte $20,$10,$00,$04,$00,$01,$08,$84,$00,$40,$A8,$92,$00,$01,$00,$08  ; $E980
    .byte $00,$01,$0A,$00,$80,$1A,$08,$80,$02,$80,$80,$81,$00,$00,$80,$40  ; $E990
    .byte $00,$58,$00,$00,$00,$00,$02,$CA,$00,$00,$00,$48,$00,$06,$20,$04  ; $E9A0
    .byte $80,$05,$00,$02,$88,$88,$00,$03,$00,$C2,$00,$00,$08,$00,$02,$48  ; $E9B0
    .byte $00,$10,$00,$01,$00,$01,$00,$B0,$02,$00,$00,$04,$20,$00,$00,$00  ; $E9C0
    .byte $A0,$2C,$00,$01,$80,$A1,$00,$21,$00,$00,$80,$20,$08,$04,$02,$C5  ; $E9D0
    .byte $80,$24,$88,$40,$20,$25,$08,$04,$00,$20,$02,$05,$80,$00,$20,$50  ; $E9E0
    .byte $80,$80,$02,$03,$20,$A3,$80,$40,$82,$67,$02,$30,$00,$90,$00,$20  ; $E9F0
    .byte $00,$00,$00,$00,$02,$00,$20,$00,$00,$00,$28,$00,$00,$00,$00,$20  ; $EA00
    .byte $08,$00,$00,$00,$08,$00,$00,$05,$02,$00,$02,$88,$02,$82,$00,$82  ; $EA10
    .byte $02,$14,$00,$20,$22,$10,$A0,$15,$00,$20,$20,$41,$00,$02,$08,$43  ; $EA20
    .byte $00,$00,$00,$09,$00,$00,$08,$00,$00,$01,$08,$00,$88,$01,$00,$22  ; $EA30
    .byte $00,$00,$00,$10,$20,$40,$00,$24,$28,$80,$00,$90,$00,$13,$00,$80  ; $EA40
    .byte $00,$00,$08,$61,$80,$22,$00,$00,$00,$80,$00,$49,$00,$0C,$00,$40  ; $EA50
    .byte $00,$04,$A2,$00,$00,$04,$02,$01,$02,$20,$02,$40,$00,$80,$00,$01  ; $EA60
    .byte $00,$04,$00,$40,$80,$40,$00,$00,$02,$00,$08,$22,$00,$00,$00,$48  ; $EA70
    .byte $02,$06,$00,$14,$00,$01,$A0,$04,$88,$01,$20,$00,$20,$28,$A2,$10  ; $EA80
    .byte $00,$00,$00,$02,$A0,$00,$00,$10,$00,$00,$02,$10,$80,$58,$00,$40  ; $EA90
    .byte $00,$09,$00,$22,$00,$00,$00,$85,$00,$18,$20,$08,$00,$18,$00,$80  ; $EAA0
    .byte $00,$50,$28,$09,$00,$02,$00,$51,$0A,$00,$00,$CA,$00,$00,$88,$02  ; $EAB0
    .byte $00,$40,$2A,$10,$00,$00,$00,$0C,$20,$40,$00,$29,$22,$00,$00,$20  ; $EAC0
    .byte $00,$40,$82,$18,$00,$46,$A0,$10,$00,$10,$28,$28,$20,$00,$00,$01  ; $EAD0
    .byte $08,$01,$02,$01,$00,$03,$00,$04,$08,$00,$00,$10,$80,$00,$00,$10  ; $EAE0
    .byte $08,$01,$00,$40,$00,$02,$00,$A5,$00,$4A,$00,$01,$02,$40,$08,$00  ; $EAF0
    .byte $80,$04,$00,$17,$20,$06,$0A,$00,$00,$10,$00,$00,$00,$44,$00,$80  ; $EB00
    .byte $00,$00,$02,$30,$20,$00,$20,$48,$00,$0C,$00,$00,$00,$00,$00,$00  ; $EB10
    .byte $00,$05,$00,$00,$40,$00,$80,$04,$00,$00,$00,$00,$02,$00,$02,$14  ; $EB20
    .byte $00,$88,$00,$1C,$08,$18,$80,$80,$20,$00,$00,$08,$00,$41,$80,$20  ; $EB30
    .byte $00,$04,$28,$08,$02,$10,$20,$00,$22,$25,$00,$02,$80,$25,$00,$81  ; $EB40
    .byte $00,$00,$00,$00,$00,$40,$00,$0C,$0A,$20,$00,$00,$00,$00,$00,$00  ; $EB50
    .byte $02,$2C,$80,$08,$00,$01,$20,$28,$00,$89,$00,$80,$20,$10,$00,$21  ; $EB60
    .byte $20,$30,$20,$0B,$02,$11,$00,$64,$20,$82,$00,$00,$00,$80,$80,$08  ; $EB70
    .byte $82,$10,$20,$80,$08,$00,$00,$20,$00,$00,$20,$00,$80,$08,$A0,$10  ; $EB80
    .byte $00,$10,$00,$68,$00,$00,$00,$01,$00,$02,$80,$02,$00,$00,$80,$01  ; $EB90
    .byte $80,$0C,$08,$00,$A0,$82,$00,$08,$00,$04,$20,$00,$00,$20,$02,$10  ; $EBA0
    .byte $00,$10,$20,$01,$08,$09,$00,$40,$80,$02,$20,$20,$00,$00,$00,$22  ; $EBB0
    .byte $00,$42,$08,$22,$00,$00,$08,$02,$00,$00,$08,$04,$00,$20,$00,$80  ; $EBC0
    .byte $00,$00,$0A,$10,$00,$20,$00,$00,$22,$0C,$00,$20,$08,$42,$A0,$0D  ; $EBD0
    .byte $88,$01,$02,$20,$20,$10,$20,$40,$00,$00,$00,$04,$00,$00,$80,$00  ; $EBE0
    .byte $0A,$18,$08,$80,$08,$40,$00,$02,$00,$00,$02,$10,$00,$24,$00,$20  ; $EBF0
    .byte $BE,$15,$DC,$30,$01,$00,$DD,$10,$27,$40,$AC,$14,$22,$01,$48,$40  ; $EC00
    .byte $21,$41,$34,$40,$62,$00,$11,$10,$05,$10,$0B,$04,$0D,$41,$08,$15  ; $EC10
    .byte $C0,$01,$22,$54,$8A,$54,$48,$01,$19,$50,$B3,$14,$08,$11,$A0,$04  ; $EC20
    .byte $90,$06,$2D,$01,$A3,$10,$53,$0D,$88,$01,$31,$11,$84,$10,$40,$10  ; $EC30
    .byte $40,$00,$C4,$51,$E8,$40,$30,$50,$41,$44,$84,$00,$50,$90,$CB,$11  ; $EC40
    .byte $00,$04,$83,$00,$80,$B0,$04,$15,$04,$10,$15,$48,$04,$00,$00,$00  ; $EC50
    .byte $9C,$04,$20,$14,$21,$41,$08,$14,$24,$41,$2E,$01,$0B,$54,$00,$00  ; $EC60
    .byte $84,$14,$8A,$00,$05,$44,$24,$00,$21,$04,$0C,$51,$0A,$45,$08,$80  ; $EC70
    .byte $0B,$11,$2D,$45,$8A,$50,$02,$54,$00,$00,$01,$54,$C2,$14,$C0,$00  ; $EC80
    .byte $9C,$41,$5F,$42,$80,$40,$41,$00,$58,$05,$A2,$00,$87,$04,$DB,$10  ; $EC90
    .byte $D0,$50,$C3,$41,$01,$04,$E4,$15,$C0,$00,$B0,$44,$88,$04,$3A,$10  ; $ECA0
    .byte $24,$00,$C4,$00,$18,$44,$81,$44,$A1,$01,$08,$10,$40,$04,$90,$01  ; $ECB0
    .byte $C9,$14,$52,$00,$17,$44,$00,$15,$7E,$01,$50,$05,$32,$01,$56,$01  ; $ECC0
    .byte $2C,$05,$08,$05,$3B,$00,$10,$44,$23,$04,$10,$01,$50,$00,$14,$10  ; $ECD0
    .byte $C3,$04,$04,$11,$6A,$E1,$09,$04,$08,$94,$56,$45,$00,$41,$08,$55  ; $ECE0
    .byte $0E,$41,$31,$44,$37,$80,$03,$54,$B4,$41,$0B,$44,$00,$00,$04,$40  ; $ECF0
    .byte $90,$44,$93,$55,$2D,$05,$C3,$00,$EA,$40,$05,$44,$18,$44,$9C,$14  ; $ED00
    .byte $86,$05,$EA,$50,$96,$10,$81,$00,$9E,$14,$88,$00,$54,$10,$2D,$04  ; $ED10
    .byte $82,$21,$5C,$05,$2F,$00,$9B,$41,$65,$00,$9E,$04,$62,$01,$C7,$80  ; $ED20
    .byte $23,$00,$61,$01,$EB,$04,$1A,$01,$18,$00,$00,$00,$F4,$10,$88,$14  ; $ED30
    .byte $F2,$54,$DF,$01,$6E,$11,$55,$05,$02,$14,$82,$51,$B2,$40,$05,$45  ; $ED40
    .byte $66,$48,$2F,$50,$00,$00,$1C,$04,$28,$00,$40,$00,$11,$01,$18,$41  ; $ED50
    .byte $06,$54,$3A,$44,$0C,$41,$BC,$05,$3A,$00,$82,$11,$C4,$11,$63,$34  ; $ED60
    .byte $A3,$90,$27,$11,$82,$10,$B0,$50,$46,$41,$81,$14,$93,$54,$9F,$41  ; $ED70
    .byte $BA,$44,$98,$04,$03,$05,$BC,$10,$20,$44,$03,$40,$05,$00,$60,$0D  ; $ED80
    .byte $99,$04,$C8,$10,$08,$44,$2C,$00,$01,$41,$48,$51,$00,$00,$40,$40  ; $ED90
    .byte $E4,$15,$20,$50,$2C,$04,$67,$04,$98,$45,$CA,$04,$65,$14,$1A,$51  ; $EDA0
    .byte $14,$40,$E6,$50,$B2,$10,$DC,$04,$00,$00,$20,$54,$10,$05,$80,$10  ; $EDB0
    .byte $ED,$14,$36,$01,$8C,$10,$46,$04,$14,$D4,$28,$40,$20,$11,$84,$45  ; $EDC0
    .byte $35,$14,$79,$05,$6A,$00,$06,$00,$A0,$00,$09,$11,$04,$00,$64,$50  ; $EDD0
    .byte $21,$15,$82,$01,$0B,$50,$CC,$10,$42,$51,$4D,$54,$F8,$15,$11,$10  ; $EDE0
    .byte $A2,$14,$C5,$44,$03,$48,$14,$11,$00,$14,$48,$00,$C8,$00,$18,$14  ; $EDF0
    .byte $12,$54,$21,$01,$25,$90,$94,$15,$6E,$00,$E3,$10,$00,$40,$20,$44  ; $EE00
    .byte $11,$10,$41,$41,$A4,$41,$21,$10,$3A,$05,$02,$00,$2C,$00,$14,$41  ; $EE10
    .byte $31,$44,$FB,$41,$6E,$40,$34,$00,$87,$05,$13,$00,$24,$10,$23,$00  ; $EE20
    .byte $49,$45,$44,$70,$04,$40,$23,$10,$84,$05,$60,$10,$88,$44,$46,$00  ; $EE30
    .byte $0D,$51,$1B,$65,$0B,$45,$02,$40,$E0,$40,$A6,$04,$21,$01,$01,$40  ; $EE40
    .byte $12,$41,$4D,$01,$22,$10,$10,$01,$22,$40,$28,$00,$10,$04,$8D,$C0  ; $EE50
    .byte $C4,$51,$05,$11,$63,$09,$20,$00,$63,$40,$84,$00,$44,$01,$0A,$51  ; $EE60
    .byte $80,$01,$C4,$01,$68,$01,$00,$50,$06,$11,$00,$16,$80,$40,$04,$44  ; $EE70
    .byte $C0,$55,$A1,$58,$63,$55,$7C,$40,$DE,$40,$5D,$81,$82,$50,$A6,$10  ; $EE80
    .byte $AC,$00,$05,$01,$A2,$40,$80,$04,$80,$01,$02,$04,$03,$55,$0A,$40  ; $EE90
    .byte $DF,$40,$C1,$61,$30,$51,$9A,$01,$05,$41,$9B,$00,$71,$51,$45,$17  ; $EEA0
    .byte $A0,$04,$1B,$40,$92,$24,$31,$10,$A2,$00,$6A,$01,$08,$00,$0A,$41  ; $EEB0
    .byte $15,$70,$5A,$14,$9C,$05,$88,$14,$E4,$41,$AD,$14,$30,$40,$61,$84  ; $EEC0
    .byte $06,$81,$8C,$40,$A5,$14,$10,$44,$C1,$04,$35,$04,$00,$00,$08,$01  ; $EED0
    .byte $BF,$50,$00,$41,$32,$00,$18,$01,$36,$05,$EA,$04,$A1,$15,$94,$18  ; $EEE0
    .byte $30,$50,$34,$52,$70,$04,$81,$00,$90,$44,$1D,$C0,$10,$80,$84,$00  ; $EEF0
    .byte $99,$00,$A2,$95,$2C,$54,$0B,$45,$27,$20,$84,$00,$53,$14,$0E,$15  ; $EF00
    .byte $83,$50,$C4,$00,$A0,$00,$8A,$04,$D4,$10,$05,$05,$06,$00,$02,$54  ; $EF10
    .byte $3D,$40,$14,$45,$3B,$11,$C2,$05,$62,$05,$D4,$40,$A1,$11,$3B,$00  ; $EF20
    .byte $73,$00,$96,$40,$06,$04,$0D,$11,$A0,$11,$21,$51,$80,$04,$05,$41  ; $EF30
    .byte $A6,$10,$B4,$40,$06,$21,$E6,$00,$C5,$40,$98,$10,$40,$50,$45,$41  ; $EF40
    .byte $E0,$54,$71,$05,$A8,$44,$08,$44,$2C,$00,$84,$40,$24,$40,$12,$00  ; $EF50
    .byte $76,$55,$48,$94,$3A,$41,$F8,$00,$D0,$81,$18,$80,$F2,$41,$FC,$A3  ; $EF60
    .byte $11,$05,$60,$05,$00,$00,$80,$44,$32,$90,$3E,$12,$00,$03,$50,$40  ; $EF70
    .byte $06,$15,$2B,$51,$12,$54,$09,$55,$88,$14,$25,$00,$00,$04,$D5,$14  ; $EF80
    .byte $C2,$04,$19,$40,$C4,$04,$40,$01,$15,$00,$E0,$05,$1A,$11,$0A,$40  ; $EF90
    .byte $00,$10,$98,$45,$98,$40,$A2,$45,$22,$11,$21,$31,$6F,$41,$40,$54  ; $EFA0
    .byte $77,$10,$2B,$01,$06,$50,$4A,$55,$22,$00,$18,$00,$49,$14,$C0,$00  ; $EFB0
    .byte $DC,$01,$8B,$45,$0B,$40,$10,$44,$05,$04,$62,$0C,$56,$49,$E5,$40  ; $EFC0
    .byte $09,$40,$40,$01,$71,$54,$00,$00,$80,$51,$C2,$40,$08,$C0,$2D,$04  ; $EFD0
    .byte $A6,$50,$BC,$41,$FE,$51,$32,$01,$45,$11,$80,$40,$04,$00,$0B,$14  ; $EFE0
    .byte $08,$55,$01,$00,$1B,$54,$3C,$01,$42,$04,$85,$40,$E7,$00,$23,$40  ; $EFF0

sub_3F_F000:
    LDA $0528,X                  ; $F000  BD 28 05
    ORA #$40                     ; $F003  09 40
    STA $0528,X                  ; $F005  9D 28 05
    CPX #$00                     ; $F008  E0 00
    BNE loc_3F_F016              ; $F00A  D0 0A
    LDA $0330                    ; $F00C  AD 30 03
    STA $02                      ; $F00F  85 02
    LDA $0348                    ; $F011  AD 48 03
    STA $03                      ; $F014  85 03

loc_3F_F016:
    JSR sub_3F_F22D              ; $F016  20 2D F2
    CPX #$00                     ; $F019  E0 00
    BNE loc_3F_F032              ; $F01B  D0 15
    JSR sub_3F_F843              ; $F01D  20 43 F8
    BCC loc_3F_F032              ; $F020  90 10
    JSR sub_3F_F8F9              ; $F022  20 F9 F8
    JSR sub_3F_F02A              ; $F025  20 2A F0
    SEC                          ; $F028  38
    RTS                          ; $F029  60


sub_3F_F02A:
    BCC loc_3F_F032              ; $F02A  90 06
    BEQ loc_3F_F032              ; $F02C  F0 04
    INY                          ; $F02E  C8
    JMP loc_3F_F079              ; $F02F  4C 79 F0


loc_3F_F032:
    JSR sub_3E_D428              ; $F032  20 28 D4
    CLC                          ; $F035  18
    LDA $10                      ; $F036  A5 10
    AND #$10                     ; $F038  29 10
    BEQ loc_3F_F048              ; $F03A  F0 0C
    CPX #$00                     ; $F03C  E0 00
    BNE loc_3F_F044              ; $F03E  D0 04
    LDA $45                      ; $F040  A5 45
    STA $3F                      ; $F042  85 3F

loc_3F_F044:
    JSR sub_3E_D99F              ; $F044  20 9F D9
    SEC                          ; $F047  38

loc_3F_F048:
    RTS                          ; $F048  60


sub_3F_F049:
    LDA $0528,X                  ; $F049  BD 28 05
    AND #$BF                     ; $F04C  29 BF
    STA $0528,X                  ; $F04E  9D 28 05
    CPX #$00                     ; $F051  E0 00
    BNE loc_3F_F05F              ; $F053  D0 0A
    LDA $0330                    ; $F055  AD 30 03
    STA $02                      ; $F058  85 02
    LDA $0348                    ; $F05A  AD 48 03
    STA $03                      ; $F05D  85 03

loc_3F_F05F:
    JSR sub_3F_F24B              ; $F05F  20 4B F2
    CPX #$00                     ; $F062  E0 00
    BNE loc_3F_F079              ; $F064  D0 13
    JSR sub_3F_F843              ; $F066  20 43 F8
    BCC loc_3F_F079              ; $F069  90 0E
    JSR sub_3F_F90D              ; $F06B  20 0D F9
    JSR sub_3F_F073              ; $F06E  20 73 F0
    SEC                          ; $F071  38
    RTS                          ; $F072  60


sub_3F_F073:
    BCS loc_3F_F079              ; $F073  B0 04
    DEY                          ; $F075  88
    JMP loc_3F_F032              ; $F076  4C 32 F0


loc_3F_F079:
    JSR sub_3E_D428              ; $F079  20 28 D4
    CLC                          ; $F07C  18
    LDA $10                      ; $F07D  A5 10
    AND #$10                     ; $F07F  29 10
    BEQ loc_3F_F087              ; $F081  F0 04
    JSR sub_3E_D9B7              ; $F083  20 B7 D9
    SEC                          ; $F086  38

loc_3F_F087:
    RTS                          ; $F087  60


sub_3F_F088:
    CPX #$00                     ; $F088  E0 00
    BNE loc_3F_F096              ; $F08A  D0 0A
    LDA $0378                    ; $F08C  AD 78 03
    STA $02                      ; $F08F  85 02
    LDA $0348                    ; $F091  AD 48 03
    STA $03                      ; $F094  85 03

loc_3F_F096:
    JSR sub_3F_F269              ; $F096  20 69 F2
    CPX #$00                     ; $F099  E0 00
    BNE loc_3F_F0B2              ; $F09B  D0 15
    JSR sub_3F_F7D8              ; $F09D  20 D8 F7
    BCC loc_3F_F0B2              ; $F0A0  90 10
    JSR sub_3F_F92E              ; $F0A2  20 2E F9
    JSR sub_3F_F0AA              ; $F0A5  20 AA F0
    SEC                          ; $F0A8  38
    RTS                          ; $F0A9  60


sub_3F_F0AA:
    BCC loc_3F_F0B2              ; $F0AA  90 06
    BEQ loc_3F_F0B2              ; $F0AC  F0 04
    INY                          ; $F0AE  C8
    JMP loc_3F_F0E9              ; $F0AF  4C E9 F0


loc_3F_F0B2:
    JSR sub_3E_D2FC              ; $F0B2  20 FC D2
    CLC                          ; $F0B5  18
    LDA $10                      ; $F0B6  A5 10
    AND #$10                     ; $F0B8  29 10
    BEQ loc_3F_F0C0              ; $F0BA  F0 04
    JSR sub_3E_D9E7              ; $F0BC  20 E7 D9
    SEC                          ; $F0BF  38

loc_3F_F0C0:
    RTS                          ; $F0C0  60


sub_3F_F0C1:
    CPX #$00                     ; $F0C1  E0 00
    BNE loc_3F_F0CF              ; $F0C3  D0 0A
    LDA $0378                    ; $F0C5  AD 78 03
    STA $02                      ; $F0C8  85 02
    LDA $0348                    ; $F0CA  AD 48 03
    STA $03                      ; $F0CD  85 03

loc_3F_F0CF:
    JSR sub_3F_F289              ; $F0CF  20 89 F2
    CPX #$00                     ; $F0D2  E0 00
    BNE loc_3F_F0E9              ; $F0D4  D0 13
    JSR sub_3F_F7D8              ; $F0D6  20 D8 F7
    BCC loc_3F_F0E9              ; $F0D9  90 0E
    JSR sub_3F_F93F              ; $F0DB  20 3F F9
    JSR sub_3F_F0E3              ; $F0DE  20 E3 F0
    SEC                          ; $F0E1  38
    RTS                          ; $F0E2  60


sub_3F_F0E3:
    BCS loc_3F_F0E9              ; $F0E3  B0 04
    DEY                          ; $F0E5  88
    JMP loc_3F_F0B2              ; $F0E6  4C B2 F0


loc_3F_F0E9:
    JSR sub_3E_D2FC              ; $F0E9  20 FC D2
    CLC                          ; $F0EC  18
    LDA $10                      ; $F0ED  A5 10
    AND #$10                     ; $F0EF  29 10
    BEQ loc_3F_F0F7              ; $F0F1  F0 04
    JSR sub_3E_D9CD              ; $F0F3  20 CD D9
    SEC                          ; $F0F6  38

loc_3F_F0F7:
    RTS                          ; $F0F7  60


sub_3F_F0F8:
    CPX #$00                     ; $F0F8  E0 00
    BNE loc_3F_F174              ; $F0FA  D0 78
    STX $04B0                    ; $F0FC  8E B0 04
    TYA                          ; $F0FF  98
    PHA                          ; $F100  48
    LDY #$02                     ; $F101  A0 02
    JSR sub_3E_D2FC              ; $F103  20 FC D2
    LDA $41                      ; $F106  A5 41
    CMP $44                      ; $F108  C5 44
    BEQ loc_3F_F152              ; $F10A  F0 46
    CMP #$60                     ; $F10C  C9 60
    BNE loc_3F_F116              ; $F10E  D0 06
    LDA $44                      ; $F110  A5 44
    BNE loc_3F_F152              ; $F112  D0 3E
    BEQ loc_3F_F120              ; $F114  F0 0A

loc_3F_F116:
    LDA $44                      ; $F116  A5 44
    CMP #$60                     ; $F118  C9 60
    BNE loc_3F_F152              ; $F11A  D0 36
    LDA $41                      ; $F11C  A5 41
    BNE loc_3F_F152              ; $F11E  D0 32

loc_3F_F120:
    LDA $0305                    ; $F120  AD 05 03
    BNE loc_3F_F152              ; $F123  D0 2D
    LDA #$1E                     ; $F125  A9 1E
    JSR sub_3F_F6BE              ; $F127  20 BE F6
    LDY #$05                     ; $F12A  A0 05
    LDA #$2E                     ; $F12C  A9 2E
    JSR sub_3F_F452              ; $F12E  20 52 F4
    LDA $41                      ; $F131  A5 41
    CMP #$60                     ; $F133  C9 60
    BEQ loc_3F_F140              ; $F135  F0 09
    LDA $037D                    ; $F137  AD 7D 03
    CLC                          ; $F13A  18
    ADC #$10                     ; $F13B  69 10
    STA $037D                    ; $F13D  8D 7D 03

loc_3F_F140:
    LDA $037D                    ; $F140  AD 7D 03
    AND #$F0                     ; $F143  29 F0
    STA $037D                    ; $F145  8D 7D 03
    STA $013E                    ; $F148  8D 3E 01
    LDA #$6F                     ; $F14B  A9 6F
    STA $0305                    ; $F14D  8D 05 03
    BNE loc_3F_F168              ; $F150  D0 16

loc_3F_F152:
    LDA $41                      ; $F152  A5 41
    STA $44                      ; $F154  85 44
    CMP #$60                     ; $F156  C9 60
    BNE loc_3F_F164              ; $F158  D0 0A
    LDA $43                      ; $F15A  A5 43
    BNE loc_3F_F168              ; $F15C  D0 0A
    LDA #$03                     ; $F15E  A9 03
    STA $43                      ; $F160  85 43
    BNE loc_3F_F168              ; $F162  D0 04

loc_3F_F164:
    LDA #$00                     ; $F164  A9 00
    STA $43                      ; $F166  85 43

loc_3F_F168:
    PLA                          ; $F168  68
    TAY                          ; $F169  A8
    LDA $0378                    ; $F16A  AD 78 03
    STA $02                      ; $F16D  85 02
    LDA $0348                    ; $F16F  AD 48 03
    STA $03                      ; $F172  85 03

loc_3F_F174:
    LDA $03F0,X                  ; $F174  BD F0 03
    BMI loc_3F_F17C              ; $F177  30 03
    JMP loc_3F_F1FD              ; $F179  4C FD F1


loc_3F_F17C:
    JSR sub_3F_F2B8              ; $F17C  20 B8 F2
    CPX #$00                     ; $F17F  E0 00
    BNE loc_3F_F1B0              ; $F181  D0 2D
    JSR sub_3F_F7D8              ; $F183  20 D8 F7
    BCC loc_3F_F1B0              ; $F186  90 28
    LDY $01                      ; $F188  A4 01
    LDA $0558,Y                  ; $F18A  B9 58 05
    CMP #$24                     ; $F18D  C9 24
    BNE loc_3F_F194              ; $F18F  D0 03
    INC $04B0                    ; $F191  EE B0 04

loc_3F_F194:
    LDY $00                      ; $F194  A4 00
    JSR sub_3F_F92E              ; $F196  20 2E F9
    JSR sub_3F_F1A8              ; $F199  20 A8 F1
    LDA #$00                     ; $F19C  A9 00
    STA $03D8,X                  ; $F19E  9D D8 03
    LDA #$FE                     ; $F1A1  A9 FE
    STA $03F0,X                  ; $F1A3  9D F0 03
    BNE loc_3F_F1FB              ; $F1A6  D0 53

sub_3F_F1A8:
    BCC loc_3F_F1B0              ; $F1A8  90 06
    BEQ loc_3F_F1B0              ; $F1AA  F0 04
    INY                          ; $F1AC  C8
    JMP loc_3F_F0E9              ; $F1AD  4C E9 F0


loc_3F_F1B0:
    JSR sub_3F_F2F6              ; $F1B0  20 F6 F2
    JSR sub_3E_D2FC              ; $F1B3  20 FC D2
    LDA $41                      ; $F1B6  A5 41
    CMP #$40                     ; $F1B8  C9 40
    BNE loc_3F_F1C4              ; $F1BA  D0 08
    LDA $11                      ; $F1BC  A5 11
    AND #$0F                     ; $F1BE  29 0F
    CMP #$08                     ; $F1C0  C9 08
    BCC loc_3F_F1F5              ; $F1C2  90 31

loc_3F_F1C4:
    LDA $10                      ; $F1C4  A5 10
    AND #$10                     ; $F1C6  29 10
    BNE loc_3F_F1F5              ; $F1C8  D0 2B
    CPX #$00                     ; $F1CA  E0 00
    BNE loc_3F_F22B              ; $F1CC  D0 5D
    LDA $22                      ; $F1CE  A5 22
    CMP #$03                     ; $F1D0  C9 03
    BNE loc_3F_F22B              ; $F1D2  D0 57
    LDA $41                      ; $F1D4  A5 41
    CMP #$C0                     ; $F1D6  C9 C0
    BNE loc_3F_F22B              ; $F1D8  D0 51
    LDA $37                      ; $F1DA  A5 37
    SEC                          ; $F1DC  38
    SBC #$80                     ; $F1DD  E9 80
    STA $03A8                    ; $F1DF  8D A8 03
    LDA $38                      ; $F1E2  A5 38
    SBC #$00                     ; $F1E4  E9 00
    STA $03C0                    ; $F1E6  8D C0 03
    LDA #$DE                     ; $F1E9  A9 DE
    STA $03D8                    ; $F1EB  8D D8 03
    LDA #$FF                     ; $F1EE  A9 FF
    STA $03F0                    ; $F1F0  8D F0 03
    BNE loc_3F_F1FB              ; $F1F3  D0 06

loc_3F_F1F5:
    JSR sub_3E_D9E7              ; $F1F5  20 E7 D9
    JSR sub_3F_F324              ; $F1F8  20 24 F3

loc_3F_F1FB:
    SEC                          ; $F1FB  38
    RTS                          ; $F1FC  60


loc_3F_F1FD:
    INY                          ; $F1FD  C8
    JSR sub_3F_F2D8              ; $F1FE  20 D8 F2
    CPX #$00                     ; $F201  E0 00
    BNE loc_3F_F219              ; $F203  D0 14
    JSR sub_3F_F7D8              ; $F205  20 D8 F7
    BCC loc_3F_F219              ; $F208  90 0F
    JSR sub_3F_F93F              ; $F20A  20 3F F9
    JSR sub_3F_F213              ; $F20D  20 13 F2
    JMP loc_3F_F228              ; $F210  4C 28 F2


sub_3F_F213:
    BCS loc_3F_F219              ; $F213  B0 04
    DEY                          ; $F215  88
    JMP loc_3F_F0B2              ; $F216  4C B2 F0


loc_3F_F219:
    JSR sub_3F_F2F6              ; $F219  20 F6 F2
    JSR sub_3E_D2FC              ; $F21C  20 FC D2
    LDA $10                      ; $F21F  A5 10
    AND #$10                     ; $F221  29 10
    BEQ loc_3F_F22B              ; $F223  F0 06
    JSR sub_3E_D9CD              ; $F225  20 CD D9

loc_3F_F228:
    JSR sub_3F_F324              ; $F228  20 24 F3

loc_3F_F22B:
    CLC                          ; $F22B  18
    RTS                          ; $F22C  60


sub_3F_F22D:
    LDA $0318,X                  ; $F22D  BD 18 03
    CLC                          ; $F230  18
    ADC $03A8,X                  ; $F231  7D A8 03
    STA $0318,X                  ; $F234  9D 18 03
    LDA $0330,X                  ; $F237  BD 30 03
    ADC $03C0,X                  ; $F23A  7D C0 03
    STA $0330,X                  ; $F23D  9D 30 03
    BCC loc_3F_F24A              ; $F240  90 08
    LDA $0348,X                  ; $F242  BD 48 03
    ADC #$00                     ; $F245  69 00
    STA $0348,X                  ; $F247  9D 48 03

loc_3F_F24A:
    RTS                          ; $F24A  60


sub_3F_F24B:
    LDA $0318,X                  ; $F24B  BD 18 03
    SEC                          ; $F24E  38
    SBC $03A8,X                  ; $F24F  FD A8 03
    STA $0318,X                  ; $F252  9D 18 03
    LDA $0330,X                  ; $F255  BD 30 03
    SBC $03C0,X                  ; $F258  FD C0 03
    STA $0330,X                  ; $F25B  9D 30 03
    BCS loc_3F_F268              ; $F25E  B0 08
    LDA $0348,X                  ; $F260  BD 48 03
    SBC #$00                     ; $F263  E9 00
    STA $0348,X                  ; $F265  9D 48 03

loc_3F_F268:
    RTS                          ; $F268  60


sub_3F_F269:
    LDA $0360,X                  ; $F269  BD 60 03
    CLC                          ; $F26C  18
    ADC $03D8,X                  ; $F26D  7D D8 03
    STA $0360,X                  ; $F270  9D 60 03
    LDA $0378,X                  ; $F273  BD 78 03
    ADC $03F0,X                  ; $F276  7D F0 03
    STA $0378,X                  ; $F279  9D 78 03
    CMP #$F0                     ; $F27C  C9 F0
    BCC loc_3F_F288              ; $F27E  90 08
    ADC #$0F                     ; $F280  69 0F
    STA $0378,X                  ; $F282  9D 78 03
    INC $0390,X                  ; $F285  FE 90 03

loc_3F_F288:
    RTS                          ; $F288  60


sub_3F_F289:
    LDA $0360,X                  ; $F289  BD 60 03
    SEC                          ; $F28C  38
    SBC $03D8,X                  ; $F28D  FD D8 03
    STA $0360,X                  ; $F290  9D 60 03
    LDA $0378,X                  ; $F293  BD 78 03
    SBC $03F0,X                  ; $F296  FD F0 03
    STA $0378,X                  ; $F299  9D 78 03
    BCS loc_3F_F2A6              ; $F29C  B0 08
    SBC #$0F                     ; $F29E  E9 0F
    STA $0378,X                  ; $F2A0  9D 78 03
    DEC $0390,X                  ; $F2A3  DE 90 03

loc_3F_F2A6:
    RTS                          ; $F2A6  60


sub_3F_F2A7:
    LDA $03F0,X                  ; $F2A7  BD F0 03
    BPL loc_3F_F2B2              ; $F2AA  10 06
    JSR sub_3F_F2B8              ; $F2AC  20 B8 F2
    JMP sub_3F_F2F6              ; $F2AF  4C F6 F2


loc_3F_F2B2:
    JSR sub_3F_F2D8              ; $F2B2  20 D8 F2
    JMP sub_3F_F2F6              ; $F2B5  4C F6 F2


sub_3F_F2B8:
    LDA $0360,X                  ; $F2B8  BD 60 03
    SEC                          ; $F2BB  38
    SBC $03D8,X                  ; $F2BC  FD D8 03
    STA $0360,X                  ; $F2BF  9D 60 03
    LDA $0378,X                  ; $F2C2  BD 78 03
    SBC $03F0,X                  ; $F2C5  FD F0 03
    STA $0378,X                  ; $F2C8  9D 78 03
    CMP #$F0                     ; $F2CB  C9 F0
    BCC loc_3F_F2D7              ; $F2CD  90 08
    ADC #$0F                     ; $F2CF  69 0F
    STA $0378,X                  ; $F2D1  9D 78 03
    INC $0390,X                  ; $F2D4  FE 90 03

loc_3F_F2D7:
    RTS                          ; $F2D7  60


sub_3F_F2D8:
    LDA $0360,X                  ; $F2D8  BD 60 03
    SEC                          ; $F2DB  38
    SBC $03D8,X                  ; $F2DC  FD D8 03
    STA $0360,X                  ; $F2DF  9D 60 03
    LDA $0378,X                  ; $F2E2  BD 78 03
    SBC $03F0,X                  ; $F2E5  FD F0 03
    STA $0378,X                  ; $F2E8  9D 78 03
    BCS loc_3F_F2F5              ; $F2EB  B0 08
    SBC #$0F                     ; $F2ED  E9 0F
    STA $0378,X                  ; $F2EF  9D 78 03
    DEC $0390,X                  ; $F2F2  DE 90 03

loc_3F_F2F5:
    RTS                          ; $F2F5  60


sub_3F_F2F6:
    LDA $43                      ; $F2F6  A5 43
    BEQ loc_3F_F302              ; $F2F8  F0 08
    CPX #$00                     ; $F2FA  E0 00
    BNE loc_3F_F302              ; $F2FC  D0 04
    DEC $43                      ; $F2FE  C6 43
    BNE loc_3F_F323              ; $F300  D0 21

loc_3F_F302:
    LDA $03D8,X                  ; $F302  BD D8 03
    SEC                          ; $F305  38
    SBC $99                      ; $F306  E5 99
    STA $03D8,X                  ; $F308  9D D8 03
    LDA $03F0,X                  ; $F30B  BD F0 03
    SBC #$00                     ; $F30E  E9 00
    STA $03F0,X                  ; $F310  9D F0 03
    BPL loc_3F_F323              ; $F313  10 0E
    CMP #$F9                     ; $F315  C9 F9
    BCS loc_3F_F323              ; $F317  B0 0A
    LDA #$F9                     ; $F319  A9 F9
    STA $03F0,X                  ; $F31B  9D F0 03
    LDA #$00                     ; $F31E  A9 00
    STA $03D8,X                  ; $F320  9D D8 03

loc_3F_F323:
    RTS                          ; $F323  60


sub_3F_F324:
    LDA #$00                     ; $F324  A9 00
    STA $03D8,X                  ; $F326  9D D8 03
    LDA #$FF                     ; $F329  A9 FF
    STA $03F0,X                  ; $F32B  9D F0 03
    RTS                          ; $F32E  60

    .byte $A5,$30,$C9,$05,$F0,$F9,$BD,$20,$04,$F0,$F4,$BD,$A8,$03,$1D,$C0  ; $F32F
    .byte $03,$F0,$7E,$BD,$00,$03,$C9,$52,$F0,$33,$20,$E6,$F6,$85,$00,$BD  ; $F33F
    .byte $08,$04,$29,$3F,$A8,$B9,$F4,$F9,$38,$E5,$00,$C9,$04,$90,$62,$BD  ; $F34F
    .byte $20,$04,$29,$01,$F0,$0D,$BD,$18,$03,$38,$FD,$A8,$03,$8D,$18,$03  ; $F35F
    .byte $4C,$7C,$F3,$BD,$18,$03,$18,$7D,$A8,$03,$8D,$18,$03,$86,$0F,$AD  ; $F36F
    .byte $28,$05,$48,$AD,$20,$04,$48,$BD,$A8,$03,$8D,$A8,$03,$BD,$C0,$03  ; $F37F
    .byte $8D,$C0,$03,$BD,$20,$04,$8D,$20,$04,$A0,$00,$A5,$30,$C9,$02,$D0  ; $F38F
    .byte $02,$A0,$04,$A5,$F5,$48,$A5,$F6,$48,$A2,$00,$20,$ED,$F3,$68,$85  ; $F39F
    .byte $F6,$68,$85,$F5,$20,$37,$FF,$68,$8D,$20,$04,$68,$8D,$28,$05,$A6  ; $F3AF
    .byte $0F,$60,$86,$0F,$A0,$00,$A5,$30,$C9,$02,$D0,$02,$A0,$04,$A5,$F5  ; $F3BF
    .byte $48,$A5,$F6,$48,$A2,$00,$20,$FC,$D2,$A5,$10,$29,$10,$F0,$03,$20  ; $F3CF
    .byte $E7,$D9,$68,$85,$F6,$68,$85,$F5,$20,$37,$FF,$A6,$0F,$60  ; $F3DF

sub_3F_F3ED:
    CLC                          ; $F3ED  18
    LDA $0420,X                  ; $F3EE  BD 20 04
    AND #$03                     ; $F3F1  29 03
    BEQ loc_3F_F445              ; $F3F3  F0 50
    AND #$01                     ; $F3F5  29 01
    BEQ loc_3F_F3FC              ; $F3F7  F0 03
    JMP sub_3F_F000              ; $F3F9  4C 00 F0


loc_3F_F3FC:
    INY                          ; $F3FC  C8
    JMP sub_3F_F049              ; $F3FD  4C 49 F0


sub_3F_F400:
    CLC                          ; $F400  18
    LDA $0420,X                  ; $F401  BD 20 04
    AND #$0C                     ; $F404  29 0C
    BEQ loc_3F_F445              ; $F406  F0 3D
    AND #$04                     ; $F408  29 04
    BEQ loc_3F_F40F              ; $F40A  F0 03
    JMP sub_3F_F088              ; $F40C  4C 88 F0


loc_3F_F40F:
    INY                          ; $F40F  C8
    JMP sub_3F_F0C1              ; $F410  4C C1 F0


sub_3F_F413:
    LDA $0420,X                  ; $F413  BD 20 04
    AND #$03                     ; $F416  29 03
    BEQ loc_3F_F445              ; $F418  F0 2B
    AND #$01                     ; $F41A  29 01
    BEQ loc_3F_F429              ; $F41C  F0 0B
    LDA $0528,X                  ; $F41E  BD 28 05
    ORA #$40                     ; $F421  09 40
    STA $0528,X                  ; $F423  9D 28 05
    JMP sub_3F_F22D              ; $F426  4C 2D F2


loc_3F_F429:
    LDA $0528,X                  ; $F429  BD 28 05
    AND #$BF                     ; $F42C  29 BF
    STA $0528,X                  ; $F42E  9D 28 05
    JMP sub_3F_F24B              ; $F431  4C 4B F2


sub_3F_F434:
    LDA $0420,X                  ; $F434  BD 20 04
    AND #$0C                     ; $F437  29 0C
    BEQ loc_3F_F445              ; $F439  F0 0A
    AND #$04                     ; $F43B  29 04
    BEQ loc_3F_F442              ; $F43D  F0 03
    JMP sub_3F_F269              ; $F43F  4C 69 F2


loc_3F_F442:
    JMP sub_3F_F289              ; $F442  4C 89 F2


loc_3F_F445:
    RTS                          ; $F445  60


sub_3F_F446:
    STA $0558,X                  ; $F446  9D 58 05
    LDA #$00                     ; $F449  A9 00
    STA $0540,X                  ; $F44B  9D 40 05
    STA $0570,X                  ; $F44E  9D 70 05
    RTS                          ; $F451  60


sub_3F_F452:
    PHA                          ; $F452  48
    LDA $0330,X                  ; $F453  BD 30 03
    STA $0330,Y                  ; $F456  99 30 03
    LDA $0348,X                  ; $F459  BD 48 03
    STA $0348,Y                  ; $F45C  99 48 03
    LDA $0378,X                  ; $F45F  BD 78 03
    STA $0378,Y                  ; $F462  99 78 03
    LDA $0390,X                  ; $F465  BD 90 03
    STA $0390,Y                  ; $F468  99 90 03

loc_3F_F46B:
    LDA $0528,X                  ; $F46B  BD 28 05
    AND #$40                     ; $F46E  29 40
    ORA #$90                     ; $F470  09 90
    STA $0528,Y                  ; $F472  99 28 05
    LDA #$00                     ; $F475  A9 00
    STA $0468,Y                  ; $F477  99 68 04
    STA $0480,Y                  ; $F47A  99 80 04
    STA $0498,Y                  ; $F47D  99 98 04
    STA $04B0,Y                  ; $F480  99 B0 04
    STA $04C8,Y                  ; $F483  99 C8 04
    STA $04E0,Y                  ; $F486  99 E0 04
    STA $04F8,Y                  ; $F489  99 F8 04
    STA $0510,Y                  ; $F48C  99 10 05
    PLA                          ; $F48F  68

sub_3F_F490:
    STA $0558,Y                  ; $F490  99 58 05
    LDA #$00                     ; $F493  A9 00
    STA $0540,Y                  ; $F495  99 40 05
    STA $0570,Y                  ; $F498  99 70 05
    RTS                          ; $F49B  60


sub_3F_F49C:
    PHA                          ; $F49C  48
    STX $00                      ; $F49D  86 00
    LDX $10                      ; $F49F  A6 10
    LDA $F50B,X                  ; $F4A1  BD 0B F5
    STA $01                      ; $F4A4  85 01
    LDA $F573,X                  ; $F4A6  BD 73 F5
    STA $02                      ; $F4A9  85 02
    LDA $F5DB,X                  ; $F4AB  BD DB F5
    STA $03                      ; $F4AE  85 03
    LDA $F643,X                  ; $F4B0  BD 43 F6
    STA $04                      ; $F4B3  85 04
    LDX $00                      ; $F4B5  A6 00
    LDA $0330,X                  ; $F4B7  BD 30 03
    CLC                          ; $F4BA  18
    ADC $01                      ; $F4BB  65 01
    STA $0330,Y                  ; $F4BD  99 30 03
    LDA $0348,X                  ; $F4C0  BD 48 03
    ADC $02                      ; $F4C3  65 02
    STA $0348,Y                  ; $F4C5  99 48 03
    LDA $0378,X                  ; $F4C8  BD 78 03
    CLC                          ; $F4CB  18
    ADC $03                      ; $F4CC  65 03
    STA $0378,Y                  ; $F4CE  99 78 03
    LDA $0390,X                  ; $F4D1  BD 90 03
    ADC $04                      ; $F4D4  65 04
    STA $0390,Y                  ; $F4D6  99 90 03
    JMP loc_3F_F46B              ; $F4D9  4C 6B F4


sub_3F_F4DC:
    LDA #$01                     ; $F4DC  A9 01
    STA $0420,X                  ; $F4DE  9D 20 04
    LDA $0330,X                  ; $F4E1  BD 30 03
    SEC                          ; $F4E4  38
    SBC $0330                    ; $F4E5  ED 30 03
    LDA $0348,X                  ; $F4E8  BD 48 03
    SBC $0348                    ; $F4EB  ED 48 03
    BCC loc_3F_F4F5              ; $F4EE  90 05
    LDA #$02                     ; $F4F0  A9 02
    STA $0420,X                  ; $F4F2  9D 20 04

loc_3F_F4F5:
    RTS                          ; $F4F5  60


sub_3F_F4F6:
    LDA $0420,X                  ; $F4F6  BD 20 04
    ROR A                        ; $F4F9  6A
    ROR A                        ; $F4FA  6A
    ROR A                        ; $F4FB  6A
    AND #$40                     ; $F4FC  29 40
    STA $00                      ; $F4FE  85 00
    LDA $0528,X                  ; $F500  BD 28 05
    AND #$BF                     ; $F503  29 BF
    ORA $00                      ; $F505  05 00
    STA $0528,X                  ; $F507  9D 28 05
    RTS                          ; $F50A  60

    .byte $F1,$10,$00,$00,$0C,$14,$18,$18,$18,$14,$0C,$10,$10,$F0,$F0,$00  ; $F50B
    .byte $EE,$DC,$24,$F4,$EC,$E8,$E8,$E8,$EC,$F4,$F0,$10,$00,$F8,$10,$0C  ; $F51B
    .byte $F4,$F0,$10,$F4,$0C,$F0,$10,$EC,$0C,$F0,$10,$E8,$18,$F0,$10,$F0  ; $F52B
    .byte $10,$FC,$04,$FC,$04,$FC,$04,$FC,$04,$F8,$08,$D8,$08,$EC,$14,$05  ; $F53B
    .byte $FB,$00,$F8,$08,$F4,$0C,$E8,$18,$F8,$08,$E4,$1C,$F4,$0C,$08,$F8  ; $F54B
    .byte $F0,$10,$E0,$20,$00,$EC,$14,$00,$14,$00,$EC,$EC,$14,$14,$14,$14  ; $F55B
    .byte $EC,$EC,$EC,$08,$F8,$F8,$08,$D8,$FF,$00,$00,$00,$00,$00,$00,$00  ; $F56B
    .byte $00,$00,$00,$00,$00,$FF,$FF,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF  ; $F57B
    .byte $FF,$FF,$FF,$00,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF  ; $F58B
    .byte $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF  ; $F59B
    .byte $00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00  ; $F5AB
    .byte $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$00,$00  ; $F5BB
    .byte $00,$00,$FF,$FF,$00,$00,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$00,$FF  ; $F5CB
    .byte $FF,$FF,$F0,$FA,$EC,$EC,$F4,$00,$08,$10,$14,$F8,$08,$F8,$08,$10  ; $F5DB
    .byte $0C,$04,$04,$14,$10,$08,$00,$F4,$EC,$EC,$02,$02,$00,$08,$10,$F4  ; $F5EB
    .byte $0C,$00,$00,$F4,$0C,$10,$F4,$F0,$10,$EC,$EC,$00,$00,$04,$04,$FC  ; $F5FB
    .byte $FC,$E8,$E8,$F8,$F8,$08,$08,$18,$18,$00,$00,$18,$E0,$F8,$F8,$F0  ; $F60B
    .byte $F0,$E4,$FA,$FA,$F0,$F0,$FC,$FC,$F4,$F4,$02,$02,$04,$04,$04,$04  ; $F61B
    .byte $08,$08,$14,$14,$14,$14,$14,$EC,$00,$14,$00,$EC,$EC,$EC,$14,$14  ; $F62B
    .byte $14,$14,$EC,$E4,$E4,$1C,$1C,$10,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00  ; $F63B
    .byte $00,$00,$00,$FF,$00,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF  ; $F64B
    .byte $FF,$FF,$00,$00,$00,$00,$00,$FF,$00,$00,$00,$FF,$00,$00,$FF,$FF  ; $F65B
    .byte $00,$FF,$FF,$00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00  ; $F66B
    .byte $00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; $F67B
    .byte $FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF  ; $F68B
    .byte $00,$00,$00,$FF,$FF,$FF,$00,$00,$00,$00,$FF,$FF,$FF,$00,$00,$00  ; $F69B

sub_3F_F6AB:
    LDA $0420,X                  ; $F6AB  BD 20 04
    EOR #$03                     ; $F6AE  49 03
    STA $0420,X                  ; $F6B0  9D 20 04
    LDA $0528,X                  ; $F6B3  BD 28 05
    EOR #$40                     ; $F6B6  49 40
    STA $0528,X                  ; $F6B8  9D 28 05
    RTS                          ; $F6BB  60


sub_3F_F6BC:
    STA $D9                      ; $F6BC  85 D9

sub_3F_F6BE:
    STX $00                      ; $F6BE  86 00
    LDX $DA                      ; $F6C0  A6 DA
    STA $01                      ; $F6C2  85 01
    LDA $DC,X                    ; $F6C4  B5 DC
    CMP #$88                     ; $F6C6  C9 88
    BNE loc_3F_F6D4              ; $F6C8  D0 0A
    LDA $01                      ; $F6CA  A5 01
    STA $DC,X                    ; $F6CC  95 DC
    INX                          ; $F6CE  E8
    TXA                          ; $F6CF  8A
    AND #$07                     ; $F6D0  29 07
    STA $DA                      ; $F6D2  85 DA

loc_3F_F6D4:
    LDX $00                      ; $F6D4  A6 00
    RTS                          ; $F6D6  60


sub_3F_F6D7:
    LDA $0378                    ; $F6D7  AD 78 03
    SEC                          ; $F6DA  38
    SBC $0378,X                  ; $F6DB  FD 78 03
    BCS loc_3F_F6E5              ; $F6DE  B0 05
    EOR #$FF                     ; $F6E0  49 FF
    ADC #$01                     ; $F6E2  69 01
    CLC                          ; $F6E4  18

loc_3F_F6E5:
    RTS                          ; $F6E5  60


sub_3F_F6E6:
    LDA $0330                    ; $F6E6  AD 30 03
    SEC                          ; $F6E9  38
    SBC $0330,X                  ; $F6EA  FD 30 03
    PHA                          ; $F6ED  48
    LDA $0348                    ; $F6EE  AD 48 03
    SBC $0348,X                  ; $F6F1  FD 48 03
    PLA                          ; $F6F4  68
    BCS loc_3F_F6FC              ; $F6F5  B0 05
    EOR #$FF                     ; $F6F7  49 FF
    ADC #$01                     ; $F6F9  69 01
    CLC                          ; $F6FB  18

loc_3F_F6FC:
    RTS                          ; $F6FC  60


sub_3F_F6FD:
    LDA $0378                    ; $F6FD  AD 78 03
    STA $00                      ; $F700  85 00
    LDA $0330                    ; $F702  AD 30 03
    STA $01                      ; $F705  85 01
    LDA $0348                    ; $F707  AD 48 03
    STA $02                      ; $F70A  85 02
    JMP loc_3F_F71E              ; $F70C  4C 1E F7

    .byte $B9,$78,$03,$85,$00,$B9,$30,$03,$85,$01,$B9,$48,$03,$85,$02  ; $F70F

loc_3F_F71E:
    LDY #$00                     ; $F71E  A0 00
    LDA $00                      ; $F720  A5 00
    SEC                          ; $F722  38
    SBC $0378,X                  ; $F723  FD 78 03
    LDY #$00                     ; $F726  A0 00
    BCS loc_3F_F730              ; $F728  B0 06
    EOR #$FF                     ; $F72A  49 FF
    ADC #$01                     ; $F72C  69 01
    LDY #$04                     ; $F72E  A0 04

loc_3F_F730:
    STA $00                      ; $F730  85 00
    LDA $01                      ; $F732  A5 01
    SEC                          ; $F734  38
    SBC $0330,X                  ; $F735  FD 30 03
    PHA                          ; $F738  48
    LDA $02                      ; $F739  A5 02
    SBC $0348,X                  ; $F73B  FD 48 03
    PLA                          ; $F73E  68
    BCS loc_3F_F747              ; $F73F  B0 06
    EOR #$FF                     ; $F741  49 FF
    ADC #$01                     ; $F743  69 01
    INY                          ; $F745  C8
    INY                          ; $F746  C8

loc_3F_F747:
    STA $01                      ; $F747  85 01
    CMP $00                      ; $F749  C5 00
    BCS loc_3F_F756              ; $F74B  B0 09
    PHA                          ; $F74D  48
    LDA $00                      ; $F74E  A5 00
    STA $01                      ; $F750  85 01
    PLA                          ; $F752  68
    STA $00                      ; $F753  85 00
    INY                          ; $F755  C8

loc_3F_F756:
    LDA #$00                     ; $F756  A9 00
    STA $02                      ; $F758  85 02
    LDA $01                      ; $F75A  A5 01
    LSR A                        ; $F75C  4A
    LSR A                        ; $F75D  4A
    CMP $00                      ; $F75E  C5 00
    BCS loc_3F_F76B              ; $F760  B0 09
    INC $02                      ; $F762  E6 02
    ASL A                        ; $F764  0A
    CMP $00                      ; $F765  C5 00
    BCS loc_3F_F76B              ; $F767  B0 02
    INC $02                      ; $F769  E6 02

loc_3F_F76B:
    TYA                          ; $F76B  98
    ASL A                        ; $F76C  0A
    ASL A                        ; $F76D  0A
    CLC                          ; $F76E  18
    ADC $02                      ; $F76F  65 02
    TAY                          ; $F771  A8
    LDA $F776,Y                  ; $F772  B9 76 F7
    RTS                          ; $F775  60

    .byte $04,$05,$06,$04,$08,$07,$06,$04,$0C,$0B,$0A,$04,$08,$09,$0A,$04  ; $F776
    .byte $04,$03,$02,$04,$00,$01,$02,$04,$0C,$0D,$0E,$04,$00,$0F,$0E,$04  ; $F786
    .byte $08,$09,$09,$09,$01,$05,$05,$05,$04,$06,$06,$06,$02,$0A,$0A,$0A  ; $F796

sub_3F_F7A6:
    JSR sub_3F_F6FD              ; $F7A6  20 FD F6
    STA $00                      ; $F7A9  85 00
    TAY                          ; $F7AB  A8
    LDA $04B0,X                  ; $F7AC  BD B0 04
    CLC                          ; $F7AF  18
    ADC #$08                     ; $F7B0  69 08
    AND #$0F                     ; $F7B2  29 0F
    SEC                          ; $F7B4  38
    SBC $00                      ; $F7B5  E5 00
    AND #$0F                     ; $F7B7  29 0F
    SEC                          ; $F7B9  38
    SBC #$08                     ; $F7BA  E9 08
    BEQ loc_3F_F7D7              ; $F7BC  F0 19
    BCS loc_3F_F7C5              ; $F7BE  B0 05
    INC $04B0,X                  ; $F7C0  FE B0 04
    BNE loc_3F_F7C8              ; $F7C3  D0 03

loc_3F_F7C5:
    DEC $04B0,X                  ; $F7C5  DE B0 04

loc_3F_F7C8:
    LDA $04B0,X                  ; $F7C8  BD B0 04
    AND #$0F                     ; $F7CB  29 0F
    STA $04B0,X                  ; $F7CD  9D B0 04
    TAY                          ; $F7D0  A8
    LDA $F796,Y                  ; $F7D1  B9 96 F7
    STA $0420,X                  ; $F7D4  9D 20 04

loc_3F_F7D7:
    RTS                          ; $F7D7  60


sub_3F_F7D8:
    LDA $0528,X                  ; $F7D8  BD 28 05
    BPL loc_3F_F841              ; $F7DB  10 64
    STY $00                      ; $F7DD  84 00
    LDY #$17                     ; $F7DF  A0 17
    STY $01                      ; $F7E1  84 01

loc_3F_F7E3:
    LDA $0300,Y                  ; $F7E3  B9 00 03
    BEQ loc_3F_F839              ; $F7E6  F0 51
    LDA $0390,Y                  ; $F7E8  B9 90 03
    BNE loc_3F_F839              ; $F7EB  D0 4C
    LDA $0528,Y                  ; $F7ED  B9 28 05
    AND #$04                     ; $F7F0  29 04
    BNE loc_3F_F839              ; $F7F2  D0 45
    LDA $0528,Y                  ; $F7F4  B9 28 05
    AND #$03                     ; $F7F7  29 03
    BEQ loc_3F_F839              ; $F7F9  F0 3E
    AND #$01                     ; $F7FB  29 01
    BEQ loc_3F_F804              ; $F7FD  F0 05
    LDA $03F0,X                  ; $F7FF  BD F0 03
    BPL loc_3F_F839              ; $F802  10 35

loc_3F_F804:
    JSR sub_3F_F89A              ; $F804  20 9A F8
    BNE loc_3F_F839              ; $F807  D0 30
    JSR sub_3F_F8BD              ; $F809  20 BD F8
    BCC loc_3F_F815              ; $F80C  90 07
    LDA $0528,Y                  ; $F80E  B9 28 05
    AND #$01                     ; $F811  29 01
    BNE loc_3F_F839              ; $F813  D0 24

loc_3F_F815:
    LDA $0408,Y                  ; $F815  B9 08 04
    AND #$3F                     ; $F818  29 3F
    TAY                          ; $F81A  A8
    LDA $10                      ; $F81B  A5 10
    CMP $F9F4,Y                  ; $F81D  D9 F4 F9
    BCS loc_3F_F839              ; $F820  B0 17
    SEC                          ; $F822  38
    LDA $12                      ; $F823  A5 12
    SBC $11                      ; $F825  E5 11
    BCC loc_3F_F839              ; $F827  90 10
    STA $11                      ; $F829  85 11
    CMP #$08                     ; $F82B  C9 08
    BCC loc_3F_F833              ; $F82D  90 04
    LDA #$08                     ; $F82F  A9 08
    STA $11                      ; $F831  85 11

loc_3F_F833:
    LDY $01                      ; $F833  A4 01
    LDY $00                      ; $F835  A4 00
    SEC                          ; $F837  38
    RTS                          ; $F838  60


loc_3F_F839:
    DEC $01                      ; $F839  C6 01
    LDY $01                      ; $F83B  A4 01
    BNE loc_3F_F7E3              ; $F83D  D0 A4
    LDY $00                      ; $F83F  A4 00

loc_3F_F841:
    CLC                          ; $F841  18
    RTS                          ; $F842  60


sub_3F_F843:
    LDA $0528,X                  ; $F843  BD 28 05
    BPL loc_3F_F898              ; $F846  10 50
    STY $00                      ; $F848  84 00
    LDY #$17                     ; $F84A  A0 17
    STY $01                      ; $F84C  84 01

loc_3F_F84E:
    LDA $0300,Y                  ; $F84E  B9 00 03
    BEQ loc_3F_F890              ; $F851  F0 3D
    LDA $0390,Y                  ; $F853  B9 90 03
    BNE loc_3F_F890              ; $F856  D0 38
    LDA $0528,Y                  ; $F858  B9 28 05
    AND #$04                     ; $F85B  29 04
    BNE loc_3F_F890              ; $F85D  D0 31
    LDA $0528,Y                  ; $F85F  B9 28 05
    AND #$02                     ; $F862  29 02
    BEQ loc_3F_F890              ; $F864  F0 2A
    JSR sub_3F_F89A              ; $F866  20 9A F8
    BNE loc_3F_F890              ; $F869  D0 25
    JSR sub_3F_F8BD              ; $F86B  20 BD F8
    LDA $0408,Y                  ; $F86E  B9 08 04
    AND #$3F                     ; $F871  29 3F
    TAY                          ; $F873  A8
    LDA $11                      ; $F874  A5 11
    CMP $12                      ; $F876  C5 12
    BCS loc_3F_F890              ; $F878  B0 16
    SEC                          ; $F87A  38
    LDA $F9F4,Y                  ; $F87B  B9 F4 F9
    SBC $10                      ; $F87E  E5 10
    BCC loc_3F_F890              ; $F880  90 0E
    STA $10                      ; $F882  85 10
    CMP #$08                     ; $F884  C9 08
    BCC loc_3F_F88C              ; $F886  90 04
    LDA #$08                     ; $F888  A9 08
    STA $10                      ; $F88A  85 10

loc_3F_F88C:
    LDY $00                      ; $F88C  A4 00
    SEC                          ; $F88E  38
    RTS                          ; $F88F  60


loc_3F_F890:
    DEC $01                      ; $F890  C6 01
    LDY $01                      ; $F892  A4 01
    BNE loc_3F_F84E              ; $F894  D0 B8
    LDY $00                      ; $F896  A4 00

loc_3F_F898:
    CLC                          ; $F898  18
    RTS                          ; $F899  60


sub_3F_F89A:
    LDA $0330                    ; $F89A  AD 30 03
    SEC                          ; $F89D  38
    SBC $0330,Y                  ; $F89E  F9 30 03
    STA $10                      ; $F8A1  85 10
    LDA $0348                    ; $F8A3  AD 48 03
    SBC $0348,Y                  ; $F8A6  F9 48 03
    BCS loc_3F_F8BA              ; $F8A9  B0 0F
    PHA                          ; $F8AB  48
    LDA $10                      ; $F8AC  A5 10
    EOR #$FF                     ; $F8AE  49 FF
    ADC #$01                     ; $F8B0  69 01
    STA $10                      ; $F8B2  85 10
    PLA                          ; $F8B4  68
    EOR #$FF                     ; $F8B5  49 FF
    ADC #$00                     ; $F8B7  69 00
    CLC                          ; $F8B9  18

loc_3F_F8BA:
    AND #$01                     ; $F8BA  29 01
    RTS                          ; $F8BC  60


sub_3F_F8BD:
    LDA $0408,Y                  ; $F8BD  B9 08 04
    AND #$3F                     ; $F8C0  29 3F
    TAY                          ; $F8C2  A8
    LDA $F9B4,Y                  ; $F8C3  B9 B4 F9
    STA $12                      ; $F8C6  85 12
    LDY $01                      ; $F8C8  A4 01
    LDA $0558                    ; $F8CA  AD 58 05
    CMP #$10                     ; $F8CD  C9 10
    BNE loc_3F_F8D7              ; $F8CF  D0 06
    LDA $12                      ; $F8D1  A5 12
    SBC #$02                     ; $F8D3  E9 02
    STA $12                      ; $F8D5  85 12

loc_3F_F8D7:
    LDA $0378                    ; $F8D7  AD 78 03
    SEC                          ; $F8DA  38
    SBC $0378,Y                  ; $F8DB  F9 78 03
    BCS loc_3F_F8E5              ; $F8DE  B0 05
    EOR #$FF                     ; $F8E0  49 FF
    ADC #$01                     ; $F8E2  69 01
    CLC                          ; $F8E4  18

loc_3F_F8E5:
    STA $11                      ; $F8E5  85 11
    PHP                          ; $F8E7  08
    BCC loc_3F_F8F7              ; $F8E8  90 0D
    LDA $0558                    ; $F8EA  AD 58 05
    CMP #$10                     ; $F8ED  C9 10
    BNE loc_3F_F8F7              ; $F8EF  D0 06
    LDA $12                      ; $F8F1  A5 12
    SBC #$04                     ; $F8F3  E9 04
    STA $12                      ; $F8F5  85 12

loc_3F_F8F7:
    PLP                          ; $F8F7  28
    RTS                          ; $F8F8  60


sub_3F_F8F9:
    SEC                          ; $F8F9  38
    LDA $0330,X                  ; $F8FA  BD 30 03
    SBC $10                      ; $F8FD  E5 10
    STA $0330,X                  ; $F8FF  9D 30 03
    LDA $0348,X                  ; $F902  BD 48 03
    SBC #$00                     ; $F905  E9 00
    STA $0348,X                  ; $F907  9D 48 03
    JMP loc_3F_F91E              ; $F90A  4C 1E F9


sub_3F_F90D:
    CLC                          ; $F90D  18
    LDA $0330,X                  ; $F90E  BD 30 03
    ADC $10                      ; $F911  65 10
    STA $0330,X                  ; $F913  9D 30 03
    LDA $0348,X                  ; $F916  BD 48 03
    ADC #$00                     ; $F919  69 00
    STA $0348,X                  ; $F91B  9D 48 03

loc_3F_F91E:
    SEC                          ; $F91E  38
    LDA $02                      ; $F91F  A5 02
    SBC $0330,X                  ; $F921  FD 30 03
    STA $02                      ; $F924  85 02
    LDA $03                      ; $F926  A5 03
    SBC $0348,X                  ; $F928  FD 48 03
    ORA $02                      ; $F92B  05 02
    RTS                          ; $F92D  60


sub_3F_F92E:
    SEC                          ; $F92E  38
    LDA $0378,X                  ; $F92F  BD 78 03
    SBC $11                      ; $F932  E5 11
    STA $0378,X                  ; $F934  9D 78 03
    BCS loc_3F_F956              ; $F937  B0 1D
    DEC $0390,X                  ; $F939  DE 90 03
    JMP loc_3F_F956              ; $F93C  4C 56 F9


sub_3F_F93F:
    CLC                          ; $F93F  18
    LDA $0378,X                  ; $F940  BD 78 03
    ADC $11                      ; $F943  65 11
    STA $0378,X                  ; $F945  9D 78 03
    BCS loc_3F_F953              ; $F948  B0 09
    CMP #$F0                     ; $F94A  C9 F0
    BCC loc_3F_F956              ; $F94C  90 08
    ADC #$0F                     ; $F94E  69 0F
    STA $0378,X                  ; $F950  9D 78 03

loc_3F_F953:
    INC $0390,X                  ; $F953  FE 90 03

loc_3F_F956:
    SEC                          ; $F956  38
    LDA $02                      ; $F957  A5 02
    SBC $0378,X                  ; $F959  FD 78 03
    RTS                          ; $F95C  60


sub_3F_F95D:
    SEC                          ; $F95D  38
    LDA $0390                    ; $F95E  AD 90 03
    BNE loc_3F_F9B3              ; $F961  D0 50
    LDA $0390,X                  ; $F963  BD 90 03
    BNE loc_3F_F9B3              ; $F966  D0 4B
    LDA $0528,X                  ; $F968  BD 28 05
    BPL loc_3F_F9B3              ; $F96B  10 46
    AND #$04                     ; $F96D  29 04
    BNE loc_3F_F9B3              ; $F96F  D0 42
    LDA $0408,X                  ; $F971  BD 08 04
    AND #$3F                     ; $F974  29 3F
    TAY                          ; $F976  A8
    LDA $F9B4,Y                  ; $F977  B9 B4 F9
    STA $00                      ; $F97A  85 00
    LDA $0558                    ; $F97C  AD 58 05
    CMP #$10                     ; $F97F  C9 10
    BNE loc_3F_F98A              ; $F981  D0 07
    LDA $00                      ; $F983  A5 00
    SEC                          ; $F985  38
    SBC #$08                     ; $F986  E9 08
    STA $00                      ; $F988  85 00

loc_3F_F98A:
    LDA $0330                    ; $F98A  AD 30 03
    SEC                          ; $F98D  38
    SBC $0330,X                  ; $F98E  FD 30 03
    PHA                          ; $F991  48
    LDA $0348                    ; $F992  AD 48 03
    SBC $0348,X                  ; $F995  FD 48 03
    PLA                          ; $F998  68
    BCS loc_3F_F99F              ; $F999  B0 04
    EOR #$FF                     ; $F99B  49 FF
    ADC #$01                     ; $F99D  69 01

loc_3F_F99F:
    CMP $F9F4,Y                  ; $F99F  D9 F4 F9
    BCS loc_3F_F9B3              ; $F9A2  B0 0F
    LDA $0378                    ; $F9A4  AD 78 03
    SEC                          ; $F9A7  38
    SBC $0378,X                  ; $F9A8  FD 78 03
    BCS loc_3F_F9B1              ; $F9AB  B0 04
    EOR #$FF                     ; $F9AD  49 FF
    ADC #$01                     ; $F9AF  69 01

loc_3F_F9B1:
    CMP $00                      ; $F9B1  C5 00

loc_3F_F9B3:
    RTS                          ; $F9B3  60

    .byte $14,$13,$14,$14,$14,$14,$14,$14,$14,$14,$10,$12,$14,$18,$10,$0F  ; $F9B4
    .byte $18,$18,$14,$24,$1C,$1C,$24,$2C,$2C,$34,$10,$16,$1A,$0E,$15,$3C  ; $F9C4
    .byte $11,$0E,$18,$24,$1C,$4C,$1C,$1C,$18,$34,$14,$0F,$2C,$20,$2C,$3C  ; $F9D4
    .byte $3C,$14,$1C,$84,$14,$8C,$17,$24,$16,$14,$0C,$0C,$0C,$0C,$0C,$0C  ; $F9E4
    .byte $10,$10,$18,$20,$28,$30,$38,$40,$48,$50,$20,$18,$20,$14,$0C,$0B  ; $F9F4
    .byte $18,$10,$0C,$18,$18,$10,$10,$10,$38,$38,$10,$14,$0B,$14,$14,$18  ; $FA04
    .byte $10,$10,$20,$12,$12,$0C,$38,$0C,$0C,$10,$48,$14,$28,$30,$1C,$38  ; $FA14
    .byte $28,$1C,$1C,$18,$0E,$F8,$11,$20,$10,$12,$08,$08,$08,$08,$08,$08  ; $FA24

sub_3F_FA34:
    LDY $A0                      ; $FA34  A4 A0
    LDA $FABE,Y                  ; $FA36  B9 BE FA
    BEQ loc_3F_FA80              ; $FA39  F0 45
    STA $10                      ; $FA3B  85 10

loc_3F_FA3D:
    LDY $10                      ; $FA3D  A4 10
    LDA $0300,Y                  ; $FA3F  B9 00 03
    BEQ loc_3F_FA7C              ; $FA42  F0 38
    LDA $0528,Y                  ; $FA44  B9 28 05
    BPL loc_3F_FA7C              ; $FA47  10 33
    LDA $0300,Y                  ; $FA49  B9 00 03
    CMP #$03                     ; $FA4C  C9 03
    BEQ loc_3F_FA7C              ; $FA4E  F0 2C
    LDA $0528,X                  ; $FA50  BD 28 05
    BPL loc_3F_FA7C              ; $FA53  10 27
    AND #$04                     ; $FA55  29 04
    BNE loc_3F_FA7C              ; $FA57  D0 23
    LDA $0330,Y                  ; $FA59  B9 30 03
    STA $00                      ; $FA5C  85 00
    LDA $0348,Y                  ; $FA5E  B9 48 03
    STA $01                      ; $FA61  85 01
    LDA $0378,Y                  ; $FA63  B9 78 03
    STA $02                      ; $FA66  85 02
    LDA $0408,Y                  ; $FA68  B9 08 04
    ASL A                        ; $FA6B  0A
    TAY                          ; $FA6C  A8
    LDA $FACE,Y                  ; $FA6D  B9 CE FA
    STA $E6                      ; $FA70  85 E6
    LDA $FACF,Y                  ; $FA72  B9 CF FA
    STA $E7                      ; $FA75  85 E7
    JSR sub_3F_FA82              ; $FA77  20 82 FA
    BCC loc_3F_FA81              ; $FA7A  90 05

loc_3F_FA7C:
    DEC $10                      ; $FA7C  C6 10
    BNE loc_3F_FA3D              ; $FA7E  D0 BD

loc_3F_FA80:
    SEC                          ; $FA80  38

loc_3F_FA81:
    RTS                          ; $FA81  60


sub_3F_FA82:
    LDA $0408,X                  ; $FA82  BD 08 04
    AND #$3F                     ; $FA85  29 3F
    TAY                          ; $FA87  A8
    LDA $FADC,Y                  ; $FA88  B9 DC FA
    CLC                          ; $FA8B  18
    ADC $E6                      ; $FA8C  65 E6
    STA $E6                      ; $FA8E  85 E6
    LDA $FB1C,Y                  ; $FA90  B9 1C FB
    CLC                          ; $FA93  18
    ADC $E7                      ; $FA94  65 E7
    STA $E7                      ; $FA96  85 E7
    LDA $00                      ; $FA98  A5 00
    SEC                          ; $FA9A  38
    SBC $0330,X                  ; $FA9B  FD 30 03
    PHA                          ; $FA9E  48
    LDA $01                      ; $FA9F  A5 01
    SBC $0348,X                  ; $FAA1  FD 48 03
    PLA                          ; $FAA4  68
    BCS loc_3F_FAAB              ; $FAA5  B0 04
    EOR #$FF                     ; $FAA7  49 FF
    ADC #$01                     ; $FAA9  69 01

loc_3F_FAAB:
    CMP $E7                      ; $FAAB  C5 E7
    BCS loc_3F_FABD              ; $FAAD  B0 0E
    LDA $02                      ; $FAAF  A5 02
    SEC                          ; $FAB1  38
    SBC $0378,X                  ; $FAB2  FD 78 03
    BCS loc_3F_FABB              ; $FAB5  B0 04
    EOR #$FF                     ; $FAB7  49 FF
    ADC #$01                     ; $FAB9  69 01

loc_3F_FABB:
    CMP $E6                      ; $FABB  C5 E6

loc_3F_FABD:
    RTS                          ; $FABD  60

    .byte $03,$03,$03,$03,$00,$04,$00,$01,$01,$01,$04,$03,$03,$01,$00,$00  ; $FABE
    .byte $00,$00,$02,$06,$06,$06,$0E,$0E,$02,$02,$0A,$0A,$16,$16,$0A,$09  ; $FACE
    .byte $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$06,$08,$0A,$0E,$06,$05,$0E,$0E  ; $FADE
    .byte $0A,$1A,$12,$12,$1A,$22,$22,$2A,$06,$0C,$10,$04,$0B,$32,$07,$04  ; $FAEE
    .byte $0E,$1A,$12,$42,$12,$12,$0E,$2A,$0A,$05,$22,$16,$22,$32,$32,$0A  ; $FAFE
    .byte $12,$7A,$0A,$82,$0D,$1A,$0C,$0A,$02,$02,$02,$02,$02,$02,$0A,$0A  ; $FB0E
    .byte $12,$1A,$22,$2A,$32,$3A,$42,$4A,$1A,$12,$1A,$0E,$06,$05,$12,$0A  ; $FB1E
    .byte $06,$12,$12,$0A,$0A,$0A,$32,$32,$0A,$0E,$05,$0E,$0E,$12,$0A,$0A  ; $FB2E
    .byte $1A,$0C,$0C,$06,$32,$06,$06,$0A,$42,$0E,$22,$2A,$16,$32,$22,$16  ; $FB3E
    .byte $16,$12,$08,$F2,$0B,$1A,$0A,$0C,$02,$02,$02,$02,$02,$02  ; $FB4E

sub_3F_FB5C:
    LDX #$17                     ; $FB5C  A2 17

loc_3F_FB5E:
    LDA $0300,X                  ; $FB5E  BD 00 03
    BEQ loc_3F_FB6A              ; $FB61  F0 07
    DEX                          ; $FB63  CA
    CPX #$07                     ; $FB64  E0 07
    BNE loc_3F_FB5E              ; $FB66  D0 F6
    SEC                          ; $FB68  38
    RTS                          ; $FB69  60


loc_3F_FB6A:
    CLC                          ; $FB6A  18
    RTS                          ; $FB6B  60


sub_3F_FB6C:
    LDY #$17                     ; $FB6C  A0 17

loc_3F_FB6E:
    LDA $0300,Y                  ; $FB6E  B9 00 03
    BEQ loc_3F_FB7A              ; $FB71  F0 07
    DEY                          ; $FB73  88
    CPY #$07                     ; $FB74  C0 07
    BNE loc_3F_FB6E              ; $FB76  D0 F6
    SEC                          ; $FB78  38
    RTS                          ; $FB79  60


loc_3F_FB7A:
    CLC                          ; $FB7A  18
    RTS                          ; $FB7B  60


sub_3F_FB7C:
    LDY #$17                     ; $FB7C  A0 17

loc_3F_FB7E:
    LDA $0300,Y                  ; $FB7E  B9 00 03
    BEQ loc_3F_FB8A              ; $FB81  F0 07
    DEY                          ; $FB83  88
    CPY #$04                     ; $FB84  C0 04
    BNE loc_3F_FB7E              ; $FB86  D0 F6
    SEC                          ; $FB88  38
    RTS                          ; $FB89  60


loc_3F_FB8A:
    CLC                          ; $FB8A  18
    RTS                          ; $FB8B  60

    .byte $20,$E6,$F6,$85,$0A,$A9,$01,$B0,$02,$A9,$02,$85,$0C,$20,$D7,$F6  ; $FB8C
    .byte $85,$0B,$A9,$04,$B0,$02,$A9,$08,$05,$0C,$85,$0C,$A5,$0B,$C5,$0A  ; $FB9C
    .byte $B0,$33,$A5,$02,$9D,$A8,$03,$A5,$03,$9D,$C0,$03,$A5,$0A,$85,$01  ; $FBAC
    .byte $A9,$00,$85,$00,$20,$3A,$FC,$A5,$04,$85,$02,$A5,$05,$85,$03,$A5  ; $FBBC
    .byte $0B,$85,$01,$A9,$00,$85,$00,$20,$3A,$FC,$A5,$04,$9D,$D8,$03,$A5  ; $FBCC
    .byte $05,$9D,$F0,$03,$60,$A5,$02,$9D,$D8,$03,$A5,$03,$9D,$F0,$03,$A5  ; $FBDC
    .byte $0B,$85,$01,$A9,$00,$85,$00,$20,$3A,$FC,$A5,$04,$85,$02,$A5,$05  ; $FBEC
    .byte $85,$03,$A5,$0A,$85,$01,$A9,$00,$85,$00,$20,$3A,$FC,$A5,$04,$9D  ; $FBFC
    .byte $A8,$03,$A5,$05,$9D,$C0,$03,$60  ; $FC0C

sub_3F_FC14:
    LDA #$00                     ; $FC14  A9 00
    STA $02                      ; $FC16  85 02
    STA $03                      ; $FC18  85 03
    LDA $00                      ; $FC1A  A5 00
    ORA $01                      ; $FC1C  05 01
    BNE loc_3F_FC23              ; $FC1E  D0 03
    STA $02                      ; $FC20  85 02
    RTS                          ; $FC22  60


loc_3F_FC23:
    LDY #$08                     ; $FC23  A0 08

loc_3F_FC25:
    ASL $02                      ; $FC25  06 02
    ROL $00                      ; $FC27  26 00
    ROL $03                      ; $FC29  26 03
    SEC                          ; $FC2B  38
    LDA $03                      ; $FC2C  A5 03
    SBC $01                      ; $FC2E  E5 01
    BCC loc_3F_FC36              ; $FC30  90 04
    STA $03                      ; $FC32  85 03
    INC $02                      ; $FC34  E6 02

loc_3F_FC36:
    DEY                          ; $FC36  88
    BNE loc_3F_FC25              ; $FC37  D0 EC
    RTS                          ; $FC39  60

    .byte $A9,$00,$85,$06,$85,$07,$A5,$00,$05,$01,$05,$02,$05,$03,$D0,$05  ; $FC3A
    .byte $85,$04,$85,$05,$60,$86,$09,$A0,$10,$06,$06,$26,$00,$26,$01,$26  ; $FC4A
    .byte $07,$38,$A5,$01,$E5,$02,$AA,$A5,$07,$E5,$03,$90,$06,$86,$01,$85  ; $FC5A
    .byte $07,$E6,$06,$88,$D0,$E3,$A5,$06,$85,$04,$A5,$00,$85,$05,$A6,$09  ; $FC6A
    .byte $60,$A9,$00,$85,$02,$85,$03,$85,$04,$A2,$10,$46,$01,$90,$0D,$18  ; $FC7A
    .byte $A5,$00,$65,$02,$85,$02,$A5,$04,$65,$03,$85,$03,$06,$00,$66,$04  ; $FC8A
    .byte $CA,$D0,$E8,$60  ; $FC9A

sub_3F_FC9E:
    LDA $0438,X                  ; $FC9E  BD 38 04
    AND #$07                     ; $FCA1  29 07
    TAY                          ; $FCA3  A8
    LDA $FCBF,Y                  ; $FCA4  B9 BF FC
    STA $00                      ; $FCA7  85 00
    EOR #$FF                     ; $FCA9  49 FF
    STA $01                      ; $FCAB  85 01
    LDA $0438,X                  ; $FCAD  BD 38 04
    LSR A                        ; $FCB0  4A
    LSR A                        ; $FCB1  4A
    LSR A                        ; $FCB2  4A
    TAY                          ; $FCB3  A8
    LDA $0100,Y                  ; $FCB4  B9 00 01
    AND $01                      ; $FCB7  25 01
    ORA $00                      ; $FCB9  05 00
    STA $0100,Y                  ; $FCBB  99 00 01
    RTS                          ; $FCBE  60

    .byte $01,$02,$04,$08,$10,$20,$40,$80,$FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F  ; $FCBF

sub_3F_FCCF:
    LDA #$00                     ; $FCCF  A9 00
    STA $05A0,Y                  ; $FCD1  99 A0 05
    STA $0300,Y                  ; $FCD4  99 00 03
    STA $05B8,Y                  ; $FCD7  99 B8 05
    STA $0450,Y                  ; $FCDA  99 50 04
    LDA #$FF                     ; $FCDD  A9 FF
    STA $0438,Y                  ; $FCDF  99 38 04
    RTS                          ; $FCE2  60


sub_3F_FCE3:
    LDA #$04                     ; $FCE3  A9 04
    STA $97                      ; $FCE5  85 97

sub_3F_FCE7:
    LDA $F5                      ; $FCE7  A5 F5
    PHA                          ; $FCE9  48
    LDA $F6                      ; $FCEA  A5 F6
    PHA                          ; $FCEC  48
    JSR sub_3E_C421              ; $FCED  20 21 C4
    JSR sub_3E_DB3A              ; $FCF0  20 3A DB
    LDA #$00                     ; $FCF3  A9 00
    STA $9A                      ; $FCF5  85 9A
    JSR sub_3F_FF1C              ; $FCF7  20 1C FF
    INC $9A                      ; $FCFA  E6 9A
    PLA                          ; $FCFC  68
    STA $F6                      ; $FCFD  85 F6
    PLA                          ; $FCFF  68
    STA $F5                      ; $FD00  85 F5
    JMP sub_3F_FF37              ; $FD02  4C 37 FF

    .byte $A5,$F5,$48,$A5,$F6,$48,$20,$BB,$DA,$68,$85,$F6,$68,$85,$F5,$4C  ; $FD05
    .byte $37,$FF,$84,$00,$85,$01,$B9,$96,$F7,$9D,$20,$04,$A5,$00,$29,$07  ; $FD15
    .byte $05,$01,$A8,$B9,$45,$FD,$9D,$A8,$03,$B9,$5D,$FD,$9D,$C0,$03,$98  ; $FD25
    .byte $49,$04,$A8,$B9,$45,$FD,$9D,$D8,$03,$B9,$5D,$FD,$9D,$F0,$03,$60  ; $FD35
    .byte $00,$C3,$6A,$D9,$00,$D9,$6A,$C3,$00,$87,$D4,$B2,$00,$B2,$D4,$87  ; $FD45
    .byte $00,$4B,$3E,$8B,$00,$8B,$3E,$4B,$00,$00,$01,$01,$02,$01,$01,$00  ; $FD55
    .byte $00,$01,$02,$03,$04,$03,$02,$01,$00,$02,$04,$05,$06,$05,$04,$02  ; $FD65

sub_3F_FD75:
    TYA                          ; $FD75  98
    PHA                          ; $FD76  48
    LDY $A0                      ; $FD77  A4 A0
    LDA $00B0,Y                  ; $FD79  B9 B0 00
    AND #$7F                     ; $FD7C  29 7F
    SEC                          ; $FD7E  38
    SBC $FD8E,Y                  ; $FD7F  F9 8E FD
    BCS loc_3F_FD86              ; $FD82  B0 02
    LDA #$00                     ; $FD84  A9 00

loc_3F_FD86:
    ORA #$80                     ; $FD86  09 80
    STA $00B0,Y                  ; $FD88  99 B0 00
    PLA                          ; $FD8B  68
    TAY                          ; $FD8C  A8
    RTS                          ; $FD8D  60

    .byte $00,$02,$01,$01,$04,$02,$02,$01,$01,$01,$01,$01,$04,$02,$A5,$22  ; $FD8E
    .byte $C9,$0F,$D0,$0C,$A9,$45,$C5,$D9,$F0,$0F,$20,$BC,$F6,$4C,$B7,$FD  ; $FD9E
    .byte $A9,$11,$C5,$D9,$F0,$03,$20,$BC,$F6,$A5,$30,$C9,$09,$F0,$0F,$A5  ; $FDAE
    .byte $30,$D0,$0B,$85,$69,$85,$6A,$A9,$09,$85,$30,$8E,$46,$01,$60  ; $FDBE

sub_3F_FDCD:
    LDA #$1B                     ; $FDCD  A9 1B
    STA $F5                      ; $FDCF  85 F5
    JSR sub_3F_FF37              ; $FDD1  20 37 FF
    JSR $8000                    ; $FDD4  20 00 80
    LDA #$39                     ; $FDD7  A9 39
    STA $F5                      ; $FDD9  85 F5
    JMP sub_3F_FF37              ; $FDDB  4C 37 FF

    .byte $A0,$04,$20,$CF,$FC,$88,$D0,$FA,$60,$10,$8A,$04,$0B,$44,$39,$04  ; $FDDE
    .byte $19,$11,$00,$D0,$64,$00,$04,$54,$E9,$10,$01,$44,$02,$01,$26,$02  ; $FDEE
    .byte $84,$40  ; $FDFE

reset_vector:
    SEI                          ; $FE00  78
    CLD                          ; $FE01  D8
    LDA #$08                     ; $FE02  A9 08
    STA $2000                    ; $FE04  8D 00 20
    LDA #$40                     ; $FE07  A9 40
    STA $4017                    ; $FE09  8D 17 40
    LDX #$00                     ; $FE0C  A2 00
    STX $2001                    ; $FE0E  8E 01 20
    STX $4010                    ; $FE11  8E 10 40
    STX $4015                    ; $FE14  8E 15 40
    DEX                          ; $FE17  CA
    TXS                          ; $FE18  9A
    LDX #$04                     ; $FE19  A2 04

loc_3F_FE1B:
    LDA $2002                    ; $FE1B  AD 02 20
    BPL loc_3F_FE1B              ; $FE1E  10 FB

loc_3F_FE20:
    LDA $2002                    ; $FE20  AD 02 20
    BMI loc_3F_FE20              ; $FE23  30 FB
    DEX                          ; $FE25  CA
    BNE loc_3F_FE1B              ; $FE26  D0 F3
    LDA $2002                    ; $FE28  AD 02 20
    LDA #$10                     ; $FE2B  A9 10
    TAY                          ; $FE2D  A8

loc_3F_FE2E:
    STA $2006                    ; $FE2E  8D 06 20
    STA $2006                    ; $FE31  8D 06 20
    EOR #$10                     ; $FE34  49 10
    DEY                          ; $FE36  88
    BNE loc_3F_FE2E              ; $FE37  D0 F5
    TYA                          ; $FE39  98

loc_3F_FE3A:
    STA $0000,Y                  ; $FE3A  99 00 00
    STA $0100,Y                  ; $FE3D  99 00 01
    STA $0200,Y                  ; $FE40  99 00 02
    STA $0300,Y                  ; $FE43  99 00 03
    STA $0400,Y                  ; $FE46  99 00 04
    STA $0500,Y                  ; $FE49  99 00 05
    STA $0600,Y                  ; $FE4C  99 00 06
    STA $0700,Y                  ; $FE4F  99 00 07
    DEY                          ; $FE52  88
    BNE loc_3F_FE3A              ; $FE53  D0 E5
    LDX #$07                     ; $FE55  A2 07
    LDA #$88                     ; $FE57  A9 88

loc_3F_FE59:
    STA $DC,X                    ; $FE59  95 DC
    DEX                          ; $FE5B  CA
    BPL loc_3F_FE59              ; $FE5C  10 FB
    LDA #$18                     ; $FE5E  A9 18
    STA $FE                      ; $FE60  85 FE
    LDA #$01                     ; $FE62  A9 01
    STA $A000                    ; $FE64  8D 00 A0
    LDX #$3C                     ; $FE67  A2 3C
    STX $F5                      ; $FE69  86 F5
    INX                          ; $FE6B  E8
    STX $F6                      ; $FE6C  86 F6
    JSR sub_3F_FF37              ; $FE6E  20 37 FF
    LDX #$05                     ; $FE71  A2 05

loc_3F_FE73:
    STX $8000                    ; $FE73  8E 00 80
    LDA $FFAD,X                  ; $FE76  BD AD FF
    STA $8001                    ; $FE79  8D 01 80
    DEX                          ; $FE7C  CA
    BPL loc_3F_FE73              ; $FE7D  10 F4
    JSR sub_3E_C421              ; $FE7F  20 21 C4
    LDA #$20                     ; $FE82  A9 20
    LDX #$00                     ; $FE84  A2 00
    LDY #$00                     ; $FE86  A0 00
    JSR sub_3E_C3D5              ; $FE88  20 D5 C3
    LDA #$24                     ; $FE8B  A9 24
    LDX #$00                     ; $FE8D  A2 00
    LDY #$00                     ; $FE8F  A0 00
    JSR sub_3E_C3D5              ; $FE91  20 D5 C3
    LDA #$C5                     ; $FE94  A9 C5
    STA $94                      ; $FE96  85 94
    LDA #$0C                     ; $FE98  A9 0C
    STA $93                      ; $FE9A  85 93
    LDA #$00                     ; $FE9C  A9 00
    JSR sub_3F_FEED              ; $FE9E  20 ED FE
    LDA #$88                     ; $FEA1  A9 88
    STA $FF                      ; $FEA3  85 FF

loc_3F_FEA5:
    LDX #$FF                     ; $FEA5  A2 FF
    TXS                          ; $FEA7  9A

loc_3F_FEA8:
    LDX #$00                     ; $FEA8  A2 00
    STX $90                      ; $FEAA  86 90
    LDY #$04                     ; $FEAC  A0 04

loc_3F_FEAE:
    LDA $80,X                    ; $FEAE  B5 80
    CMP #$04                     ; $FEB0  C9 04
    BCS loc_3F_FEBE              ; $FEB2  B0 0A
    INX                          ; $FEB4  E8
    INX                          ; $FEB5  E8
    INX                          ; $FEB6  E8
    INX                          ; $FEB7  E8
    DEY                          ; $FEB8  88
    BNE loc_3F_FEAE              ; $FEB9  D0 F3
    JMP loc_3F_FEA8              ; $FEBB  4C A8 FE


loc_3F_FEBE:
    LDA $90                      ; $FEBE  A5 90
    BNE loc_3F_FEA8              ; $FEC0  D0 E6
    DEY                          ; $FEC2  88
    TYA                          ; $FEC3  98
    EOR #$03                     ; $FEC4  49 03
    STA $91                      ; $FEC6  85 91
    LDY $80,X                    ; $FEC8  B4 80
    LDA #$02                     ; $FECA  A9 02
    STA $80,X                    ; $FECC  95 80
    CPY #$08                     ; $FECE  C0 08
    BNE loc_3F_FEDD              ; $FED0  D0 0B
    LDA $82,X                    ; $FED2  B5 82
    STA $93                      ; $FED4  85 93
    LDA $83,X                    ; $FED6  B5 83
    STA $94                      ; $FED8  85 94
    JMP ($0093)                  ; $FEDA  6C 93 00


loc_3F_FEDD:
    LDA $82,X                    ; $FEDD  B5 82
    TAX                          ; $FEDF  AA
    TXS                          ; $FEE0  9A
    LDA $91                      ; $FEE1  A5 91
    BNE loc_3F_FEE8              ; $FEE3  D0 03
    JSR sub_3E_C37D              ; $FEE5  20 7D C3

loc_3F_FEE8:
    PLA                          ; $FEE8  68
    TAY                          ; $FEE9  A8
    PLA                          ; $FEEA  68
    TAX                          ; $FEEB  AA
    RTS                          ; $FEEC  60


sub_3F_FEED:
    JSR sub_3F_FF11              ; $FEED  20 11 FF
    LDA $93                      ; $FEF0  A5 93
    STA $82,X                    ; $FEF2  95 82
    LDA $94                      ; $FEF4  A5 94
    STA $83,X                    ; $FEF6  95 83
    LDA #$08                     ; $FEF8  A9 08
    STA $80,X                    ; $FEFA  95 80
    RTS                          ; $FEFC  60

    .byte $20,$11,$FF,$A9,$00,$95,$80,$60,$20,$0F,$FF,$A9,$00,$95,$80,$4C  ; $FEFD
    .byte $A5,$FE  ; $FF0D

sub_3F_FF0F:
    LDA $91                      ; $FF0F  A5 91

sub_3F_FF11:
    ASL A                        ; $FF11  0A
    ASL A                        ; $FF12  0A
    TAX                          ; $FF13  AA
    RTS                          ; $FF14  60


sub_3F_FF15:
    JSR sub_3F_FF1C              ; $FF15  20 1C FF
    DEX                          ; $FF18  CA
    BNE sub_3F_FF15              ; $FF19  D0 FA
    RTS                          ; $FF1B  60


sub_3F_FF1C:
    LDA #$01                     ; $FF1C  A9 01
    STA $93                      ; $FF1E  85 93
    TXA                          ; $FF20  8A
    PHA                          ; $FF21  48
    TYA                          ; $FF22  98
    PHA                          ; $FF23  48
    JSR sub_3F_FF0F              ; $FF24  20 0F FF
    LDA $93                      ; $FF27  A5 93
    STA $81,X                    ; $FF29  95 81
    LDA #$01                     ; $FF2B  A9 01
    STA $80,X                    ; $FF2D  95 80
    TXA                          ; $FF2F  8A
    TAY                          ; $FF30  A8
    TSX                          ; $FF31  BA
    STX $82,Y                    ; $FF32  96 82
    JMP loc_3F_FEA5              ; $FF34  4C A5 FE


sub_3F_FF37:
    INC $F7                      ; $FF37  E6 F7
    LDA #$06                     ; $FF39  A9 06
    STA $F2                      ; $FF3B  85 F2
    STA $8000                    ; $FF3D  8D 00 80
    LDA $F5                      ; $FF40  A5 F5
    STA $F3                      ; $FF42  85 F3
    STA $8001                    ; $FF44  8D 01 80
    LDA #$07                     ; $FF47  A9 07
    STA $F2                      ; $FF49  85 F2
    STA $8000                    ; $FF4B  8D 00 80
    LDA $F6                      ; $FF4E  A5 F6
    STA $F4                      ; $FF50  85 F4
    STA $8001                    ; $FF52  8D 01 80
    DEC $F7                      ; $FF55  C6 F7
    LDA $F8                      ; $FF57  A5 F8
    BNE sub_3F_FF5C              ; $FF59  D0 01
    RTS                          ; $FF5B  60


sub_3F_FF5C:
    LDA $F7                      ; $FF5C  A5 F7
    BNE loc_3F_FFAA              ; $FF5E  D0 4A
    LDA #$06                     ; $FF60  A9 06
    STA $8000                    ; $FF62  8D 00 80
    LDA #$1E                     ; $FF65  A9 1E
    STA $8001                    ; $FF67  8D 01 80
    LDA #$07                     ; $FF6A  A9 07
    STA $8000                    ; $FF6C  8D 00 80
    LDA #$1F                     ; $FF6F  A9 1F
    STA $8001                    ; $FF71  8D 01 80

loc_3F_FF74:
    STX $ED                      ; $FF74  86 ED
    STY $EE                      ; $FF76  84 EE
    LDX $DB                      ; $FF78  A6 DB
    LDA $DC,X                    ; $FF7A  B5 DC
    CMP #$88                     ; $FF7C  C9 88
    BEQ loc_3F_FF9C              ; $FF7E  F0 1C
    PHA                          ; $FF80  48
    LDA #$88                     ; $FF81  A9 88
    STA $DC,X                    ; $FF83  95 DC
    INX                          ; $FF85  E8
    TXA                          ; $FF86  8A
    AND #$07                     ; $FF87  29 07
    STA $DB                      ; $FF89  85 DB
    PLA                          ; $FF8B  68
    CMP #$F6                     ; $FF8C  C9 F6
    BNE loc_3F_FF92              ; $FF8E  D0 02
    LDY #$14                     ; $FF90  A0 14

loc_3F_FF92:
    JSR $8003                    ; $FF92  20 03 80
    LDX $ED                      ; $FF95  A6 ED
    LDY $EE                      ; $FF97  A4 EE
    JMP loc_3F_FF74              ; $FF99  4C 74 FF


loc_3F_FF9C:
    JSR $8000                    ; $FF9C  20 00 80
    LDA #$00                     ; $FF9F  A9 00
    STA $F8                      ; $FFA1  85 F8
    LDX $ED                      ; $FFA3  A6 ED
    LDY $EE                      ; $FFA5  A4 EE
    JMP sub_3F_FF37              ; $FFA7  4C 37 FF


loc_3F_FFAA:
    INC $F8                      ; $FFAA  E6 F8
    RTS                          ; $FFAC  60

    .byte $00,$02,$04,$05,$06,$07,$04,$12,$40,$08,$15,$81,$C1,$C8,$41,$80  ; $FFAD
    .byte $05,$10,$45,$B7,$04,$1F,$44,$20,$04,$E4,$10,$19,$40,$58,$40,$E8  ; $FFBD
    .byte $00,$78,$00,$20,$00,$48,$00,$20,$40,$00,$50,$0B,$00,$00,$10,$18  ; $FFCD
    .byte $00,$64,$41,$42,$50,$50,$44,$08,$40,$80,$50,$40,$54,$08,$14,$80  ; $FFDD
    .byte $00,$44,$00,$8B,$66,$00,$00,$58,$04,$00,$00,$08,$9C,$00,$C0,$00  ; $FFED
    .byte $FE,$49,$C1  ; $FFFD
