; PRG 8 KB bank $1F at $E000
.segment "BANK1F"
.org $E000

    .byte $03  ; $E000
    BEQ loc_1F_E082              ; $E001  F0 7F
    BPL loc_1F_E017              ; $E003  10 12
    CPX #$00                     ; $E005  E0 00
    BNE loc_1F_E00D              ; $E007  D0 04
    LDA $AF                      ; $E009  A5 AF
    BNE loc_1F_E01F              ; $E00B  D0 12

loc_1F_E00D:
    LDA $12                      ; $E00D  A5 12
    CMP #$80                     ; $E00F  C9 80
    BCS loc_1F_E08F              ; $E011  B0 7C
    CPX #$00                     ; $E013  E0 00
    BEQ loc_1F_E08F              ; $E015  F0 78

loc_1F_E017:
    CPX #$00                     ; $E017  E0 00
    BNE loc_1F_E057              ; $E019  D0 3C
    LDA $AF                      ; $E01B  A5 AF
    BNE loc_1F_E08E              ; $E01D  D0 6F

loc_1F_E01F:
    LDA $17                      ; $E01F  A5 17
    AND #$40                     ; $E021  29 40
    BNE loc_1F_E042              ; $E023  D0 1D
    LDA #$07                     ; $E025  A9 07
    CMP $30                      ; $E027  C5 30
    BEQ loc_1F_E08E              ; $E029  F0 63
    STA $30                      ; $E02B  85 30
    LDA #$2C                     ; $E02D  A9 2C
    STA $0468                    ; $E02F  8D 68 04
    LDA #$01                     ; $E032  A9 01
    STA $0480                    ; $E034  8D 80 04
    LDA #$F0                     ; $E037  A9 F0
    JSR sub_1F_EC5B              ; $E039  20 5B EC
    LDA #$1D                     ; $E03C  A9 1D
    JSR sub_1F_EC5D              ; $E03E  20 5D EC
    RTS                          ; $E041  60


loc_1F_E042:
    LDA #$00                     ; $E042  A9 00
    STA $03D8                    ; $E044  8D D8 03
    LDA $AF                      ; $E047  A5 AF
    BNE loc_1F_E051              ; $E049  D0 06
    LDA #$0C                     ; $E04B  A9 0C
    STA $03F0                    ; $E04D  8D F0 03
    RTS                          ; $E050  60


loc_1F_E051:
    LDA #$F4                     ; $E051  A9 F4
    STA $03F0                    ; $E053  8D F0 03
    RTS                          ; $E056  60


loc_1F_E057:
    LDA $0300,X                  ; $E057  BD 00 03
    CMP #$4A                     ; $E05A  C9 4A
    BEQ loc_1F_E08F              ; $E05C  F0 31
    CMP #$4B                     ; $E05E  C9 4B
    BEQ loc_1F_E08F              ; $E060  F0 2D
    CMP #$78                     ; $E062  C9 78
    BEQ loc_1F_E08F              ; $E064  F0 29
    CMP #$AB                     ; $E066  C9 AB
    BEQ loc_1F_E08F              ; $E068  F0 25
    CMP #$BA                     ; $E06A  C9 BA
    BEQ loc_1F_E08F              ; $E06C  F0 21
    LDA #$00                     ; $E06E  A9 00
    STA $05A0,X                  ; $E070  9D A0 05
    STA $0300,X                  ; $E073  9D 00 03
    STA $05B8,X                  ; $E076  9D B8 05
    STA $0450,X                  ; $E079  9D 50 04
    LDA #$FF                     ; $E07C  A9 FF
    STA $0438,X                  ; $E07E  9D 38 04
    RTS                          ; $E081  60


loc_1F_E082:
    LDA $0528,X                  ; $E082  BD 28 05
    ORA #$80                     ; $E085  09 80
    STA $0528,X                  ; $E087  9D 28 05
    AND #$04                     ; $E08A  29 04
    BEQ loc_1F_E08F              ; $E08C  F0 01

loc_1F_E08E:
    RTS                          ; $E08E  60


loc_1F_E08F:
    LDY $0300,X                  ; $E08F  BC 00 03
    LDA $E33B,Y                  ; $E092  B9 3B E3
    CMP $F5                      ; $E095  C5 F5
    BEQ loc_1F_E09C              ; $E097  F0 03
    JSR sub_1F_FF3D              ; $E099  20 3D FF

loc_1F_E09C:
    LDA $0528,X                  ; $E09C  BD 28 05
    AND #$70                     ; $E09F  29 70
    ASL A                        ; $E0A1  0A
    PHA                          ; $E0A2  48
    AND #$C0                     ; $E0A3  29 C0
    STA $10                      ; $E0A5  85 10
    PLA                          ; $E0A7  68
    AND #$20                     ; $E0A8  29 20
    STA $11                      ; $E0AA  85 11
    LDY $0558,X                  ; $E0AC  BC 58 05
    BEQ loc_1F_E08E              ; $E0AF  F0 DD
    LDA $8600,Y                  ; $E0B1  B9 00 86
    STA $00                      ; $E0B4  85 00
    LDA $8700,Y                  ; $E0B6  B9 00 87
    STA $01                      ; $E0B9  85 01
    LDY #$00                     ; $E0BB  A0 00
    LDA ($00),Y                  ; $E0BD  B1 00
    STA $02                      ; $E0BF  85 02
    AND #$7F                     ; $E0C1  29 7F
    STA $03                      ; $E0C3  85 03
    LDA $05B8,X                  ; $E0C5  BD B8 05
    BMI loc_1F_E0F0              ; $E0C8  30 26
    LDA $5A                      ; $E0CA  A5 5A
    BNE loc_1F_E0F0              ; $E0CC  D0 22
    LDA $0570,X                  ; $E0CE  BD 70 05
    INC $0570,X                  ; $E0D1  FE 70 05
    LDY #$01                     ; $E0D4  A0 01
    CMP ($00),Y                  ; $E0D6  D1 00
    BNE loc_1F_E0F0              ; $E0D8  D0 16
    LDA #$00                     ; $E0DA  A9 00
    STA $0570,X                  ; $E0DC  9D 70 05
    LDA $0540,X                  ; $E0DF  BD 40 05
    AND #$7F                     ; $E0E2  29 7F
    INC $0540,X                  ; $E0E4  FE 40 05
    CMP $03                      ; $E0E7  C5 03
    BNE loc_1F_E0F0              ; $E0E9  D0 05
    LDA #$00                     ; $E0EB  A9 00
    STA $0540,X                  ; $E0ED  9D 40 05

loc_1F_E0F0:
    LDA $05B8,X                  ; $E0F0  BD B8 05
    AND #$7F                     ; $E0F3  29 7F
    STA $05B8,X                  ; $E0F5  9D B8 05
    BEQ loc_1F_E133              ; $E0F8  F0 39
    DEC $05B8,X                  ; $E0FA  DE B8 05
    LDY $0300,X                  ; $E0FD  BC 00 03
    CPY #$44                     ; $E100  C0 44
    BEQ loc_1F_E128              ; $E102  F0 24
    CPY #$4F                     ; $E104  C0 4F
    BEQ loc_1F_E128              ; $E106  F0 20
    CPY #$7C                     ; $E108  C0 7C
    BEQ loc_1F_E128              ; $E10A  F0 1C
    CPY #$A0                     ; $E10C  C0 A0
    BEQ loc_1F_E128              ; $E10E  F0 18
    CPY #$A5                     ; $E110  C0 A5
    BEQ loc_1F_E128              ; $E112  F0 14
    CPY #$AA                     ; $E114  C0 AA
    BEQ loc_1F_E128              ; $E116  F0 10
    CPX $56                      ; $E118  E4 56
    BNE loc_1F_E12F              ; $E11A  D0 13
    LDY $2F                      ; $E11C  A4 2F
    BPL loc_1F_E12F              ; $E11E  10 0F
    LSR A                        ; $E120  4A
    LSR A                        ; $E121  4A
    BCC loc_1F_E133              ; $E122  90 0F
    LDY #$54                     ; $E124  A0 54
    BNE loc_1F_E14E              ; $E126  D0 26

loc_1F_E128:
    LSR A                        ; $E128  4A
    LSR A                        ; $E129  4A
    JSR sub_1F_E208              ; $E12A  20 08 E2
    BMI loc_1F_E133              ; $E12D  30 04

loc_1F_E12F:
    LSR A                        ; $E12F  4A
    LSR A                        ; $E130  4A
    BCS loc_1F_E143              ; $E131  B0 10

loc_1F_E133:
    LDA $0540,X                  ; $E133  BD 40 05
    AND #$7F                     ; $E136  29 7F
    CLC                          ; $E138  18
    ADC #$02                     ; $E139  69 02
    TAY                          ; $E13B  A8
    LDA ($00),Y                  ; $E13C  B1 00
    BNE loc_1F_E144              ; $E13E  D0 04
    JMP loc_1F_E057              ; $E140  4C 57 E0


loc_1F_E143:
    RTS                          ; $E143  60


loc_1F_E144:
    TAY                          ; $E144  A8
    LDA $0528,X                  ; $E145  BD 28 05
    BPL loc_1F_E143              ; $E148  10 F9
    LDA $02                      ; $E14A  A5 02
    BMI loc_1F_E15B              ; $E14C  30 0D

loc_1F_E14E:
    LDA $8000,Y                  ; $E14E  B9 00 80
    STA $02                      ; $E151  85 02
    LDA $8200,Y                  ; $E153  B9 00 82
    STA $03                      ; $E156  85 03
    JMP loc_1F_E165              ; $E158  4C 65 E1


loc_1F_E15B:
    LDA $8100,Y                  ; $E15B  B9 00 81
    STA $02                      ; $E15E  85 02
    LDA $8300,Y                  ; $E160  B9 00 83
    STA $03                      ; $E163  85 03

loc_1F_E165:
    LDY #$03                     ; $E165  A0 03
    LDA ($02),Y                  ; $E167  B1 02
    ROL A                        ; $E169  2A
    ROL A                        ; $E16A  2A
    ROL A                        ; $E16B  2A
    AND #$03                     ; $E16C  29 03
    CMP #$01                     ; $E16E  C9 01
    BEQ loc_1F_E182              ; $E170  F0 10
    TAX                          ; $E172  AA
    LDY #$00                     ; $E173  A0 00
    LDA $EC,X                    ; $E175  B5 EC
    BMI loc_1F_E17E              ; $E177  30 05
    CMP ($02),Y                  ; $E179  D1 02
    BEQ loc_1F_E182              ; $E17B  F0 05
    RTS                          ; $E17D  60


loc_1F_E17E:
    LDA ($02),Y                  ; $E17E  B1 02
    STA $EC,X                    ; $E180  95 EC

loc_1F_E182:
    LDY #$01                     ; $E182  A0 01
    LDA ($02),Y                  ; $E184  B1 02
    STA $04                      ; $E186  85 04
    INY                          ; $E188  C8
    LDA ($02),Y                  ; $E189  B1 02
    TAX                          ; $E18B  AA
    LDA $8400,X                  ; $E18C  BD 00 84
    SEC                          ; $E18F  38
    SBC #$03                     ; $E190  E9 03
    STA $05                      ; $E192  85 05
    LDA $8500,X                  ; $E194  BD 00 85
    SBC #$00                     ; $E197  E9 00
    STA $06                      ; $E199  85 06
    LDX $9F                      ; $E19B  A6 9F
    BEQ loc_1F_E1FF              ; $E19D  F0 60

loc_1F_E19F:
    INY                          ; $E19F  C8
    LDA ($02),Y                  ; $E1A0  B1 02
    STA $0201,X                  ; $E1A2  9D 01 02
    LDA ($05),Y                  ; $E1A5  B1 05
    STA $07                      ; $E1A7  85 07
    LDA $10                      ; $E1A9  A5 10
    BPL loc_1F_E1B4              ; $E1AB  10 07
    LDA #$F8                     ; $E1AD  A9 F8
    SEC                          ; $E1AF  38
    SBC $07                      ; $E1B0  E5 07
    STA $07                      ; $E1B2  85 07

loc_1F_E1B4:
    LDA $12                      ; $E1B4  A5 12
    CLC                          ; $E1B6  18
    ADC $07                      ; $E1B7  65 07
    STA $0200,X                  ; $E1B9  9D 00 02
    LDA $07                      ; $E1BC  A5 07
    BMI loc_1F_E1C4              ; $E1BE  30 04
    BCC loc_1F_E1C6              ; $E1C0  90 04
    BCS loc_1F_E200              ; $E1C2  B0 3C

loc_1F_E1C4:
    BCC loc_1F_E200              ; $E1C4  90 3A

loc_1F_E1C6:
    INY                          ; $E1C6  C8
    LDA ($02),Y                  ; $E1C7  B1 02
    EOR $10                      ; $E1C9  45 10
    ORA $11                      ; $E1CB  05 11
    STA $0202,X                  ; $E1CD  9D 02 02
    LDA ($05),Y                  ; $E1D0  B1 05
    STA $07                      ; $E1D2  85 07
    LDA $10                      ; $E1D4  A5 10
    AND #$40                     ; $E1D6  29 40
    BEQ loc_1F_E1E1              ; $E1D8  F0 07
    LDA #$F8                     ; $E1DA  A9 F8
    SEC                          ; $E1DC  38
    SBC $07                      ; $E1DD  E5 07
    STA $07                      ; $E1DF  85 07

loc_1F_E1E1:
    LDA $13                      ; $E1E1  A5 13
    CLC                          ; $E1E3  18
    ADC $07                      ; $E1E4  65 07
    STA $0203,X                  ; $E1E6  9D 03 02
    LDA $07                      ; $E1E9  A5 07
    BMI loc_1F_E1F1              ; $E1EB  30 04
    BCC loc_1F_E1F3              ; $E1ED  90 04
    BCS loc_1F_E201              ; $E1EF  B0 10

loc_1F_E1F1:
    BCC loc_1F_E201              ; $E1F1  90 0E

loc_1F_E1F3:
    INX                          ; $E1F3  E8
    INX                          ; $E1F4  E8
    INX                          ; $E1F5  E8
    INX                          ; $E1F6  E8
    STX $9F                      ; $E1F7  86 9F
    BEQ loc_1F_E1FF              ; $E1F9  F0 04

loc_1F_E1FB:
    DEC $04                      ; $E1FB  C6 04
    BPL loc_1F_E19F              ; $E1FD  10 A0

loc_1F_E1FF:
    RTS                          ; $E1FF  60


loc_1F_E200:
    INY                          ; $E200  C8

loc_1F_E201:
    LDA #$F8                     ; $E201  A9 F8
    STA $0200,X                  ; $E203  9D 00 02
    BNE loc_1F_E1FB              ; $E206  D0 F3

sub_1F_E208:
    ROR $05                      ; $E208  66 05
    CPY #$4F                     ; $E20A  C0 4F
    BCS loc_1F_E237              ; $E20C  B0 29
    LDY #$02                     ; $E20E  A0 02

loc_1F_E210:
    LDA $0621,Y                  ; $E210  B9 21 06
    STA $0601,Y                  ; $E213  99 01 06
    LDA $0625,Y                  ; $E216  B9 25 06
    STA $0605,Y                  ; $E219  99 05 06
    LDA $0629,Y                  ; $E21C  B9 29 06
    STA $0609,Y                  ; $E21F  99 09 06
    LDA $05                      ; $E222  A5 05
    BPL loc_1F_E231              ; $E224  10 0B
    LDA #$30                     ; $E226  A9 30
    STA $0601,Y                  ; $E228  99 01 06
    STA $0605,Y                  ; $E22B  99 05 06
    STA $0609,Y                  ; $E22E  99 09 06

loc_1F_E231:
    DEY                          ; $E231  88
    BPL loc_1F_E210              ; $E232  10 DC
    STY $18                      ; $E234  84 18
    RTS                          ; $E236  60


loc_1F_E237:
    LDY #$02                     ; $E237  A0 02

loc_1F_E239:
    LDA $0625,Y                  ; $E239  B9 25 06
    STA $0605,Y                  ; $E23C  99 05 06
    LDA $0629,Y                  ; $E23F  B9 29 06
    STA $0609,Y                  ; $E242  99 09 06
    LDA $062D,Y                  ; $E245  B9 2D 06
    STA $060D,Y                  ; $E248  99 0D 06
    LDA $05                      ; $E24B  A5 05
    BPL loc_1F_E25A              ; $E24D  10 0B
    LDA #$30                     ; $E24F  A9 30
    STA $0605,Y                  ; $E251  99 05 06
    STA $0609,Y                  ; $E254  99 09 06
    STA $060D,Y                  ; $E257  99 0D 06

loc_1F_E25A:
    DEY                          ; $E25A  88
    BPL loc_1F_E239              ; $E25B  10 DC
    STY $18                      ; $E25D  84 18
    RTS                          ; $E25F  60


sub_1F_E260:
    LDX #$00                     ; $E260  A2 00
    STX $10                      ; $E262  86 10

loc_1F_E264:
    JSR sub_1F_E27E              ; $E264  20 7E E2
    INC $10                      ; $E267  E6 10
    LDX $10                      ; $E269  A6 10
    CPX #$03                     ; $E26B  E0 03
    BNE loc_1F_E264              ; $E26D  D0 F5
    RTS                          ; $E26F  60


sub_1F_E270:
    LDX #$02                     ; $E270  A2 02
    STX $10                      ; $E272  86 10

loc_1F_E274:
    JSR sub_1F_E27E              ; $E274  20 7E E2
    DEC $10                      ; $E277  C6 10
    LDX $10                      ; $E279  A6 10
    BPL loc_1F_E274              ; $E27B  10 F7

loc_1F_E27D:
    RTS                          ; $E27D  60


sub_1F_E27E:
    LDA $2D,X                    ; $E27E  B5 2D
    BPL loc_1F_E27D              ; $E280  10 FB
    AND #$7F                     ; $E282  29 7F
    TAY                          ; $E284  A8
    LDA $00B0,Y                  ; $E285  B9 B0 00
    AND #$7F                     ; $E288  29 7F
    STA $00                      ; $E28A  85 00
    CPX #$02                     ; $E28C  E0 02
    BNE loc_1F_E297              ; $E28E  D0 07
    LDY $56                      ; $E290  A4 56
    LDA $0450,Y                  ; $E292  B9 50 04
    STA $00                      ; $E295  85 00

loc_1F_E297:
    LDA $E2E1,X                  ; $E297  BD E1 E2
    STA $01                      ; $E29A  85 01
    LDA $E2E4,X                  ; $E29C  BD E4 E2
    STA $02                      ; $E29F  85 02
    LDX $9F                      ; $E2A1  A6 9F
    BEQ loc_1F_E2DE              ; $E2A3  F0 39
    LDA #$48                     ; $E2A5  A9 48
    STA $03                      ; $E2A7  85 03

loc_1F_E2A9:
    LDA $03                      ; $E2A9  A5 03
    STA $0200,X                  ; $E2AB  9D 00 02
    LDA $02                      ; $E2AE  A5 02
    STA $0203,X                  ; $E2B0  9D 03 02
    LDA $01                      ; $E2B3  A5 01
    STA $0202,X                  ; $E2B5  9D 02 02
    LDY #$04                     ; $E2B8  A0 04
    LDA $00                      ; $E2BA  A5 00
    SEC                          ; $E2BC  38
    SBC #$04                     ; $E2BD  E9 04
    BCS loc_1F_E2C5              ; $E2BF  B0 04
    LDY $00                      ; $E2C1  A4 00
    LDA #$00                     ; $E2C3  A9 00

loc_1F_E2C5:
    STA $00                      ; $E2C5  85 00
    TYA                          ; $E2C7  98
    ORA #$60                     ; $E2C8  09 60
    STA $0201,X                  ; $E2CA  9D 01 02
    INX                          ; $E2CD  E8
    INX                          ; $E2CE  E8
    INX                          ; $E2CF  E8
    INX                          ; $E2D0  E8
    BEQ loc_1F_E2DE              ; $E2D1  F0 0B
    LDA $03                      ; $E2D3  A5 03
    SEC                          ; $E2D5  38
    SBC #$08                     ; $E2D6  E9 08
    STA $03                      ; $E2D8  85 03
    CMP #$10                     ; $E2DA  C9 10
    BNE loc_1F_E2A9              ; $E2DC  D0 CB

loc_1F_E2DE:
    STX $9F                      ; $E2DE  86 9F
    RTS                          ; $E2E0  60

    .byte $01,$00,$02,$18,$10,$28  ; $E2E1

sub_1F_E2E7:
    LDX #$00                     ; $E2E7  A2 00

loc_1F_E2E9:
    LDA $E313,X                  ; $E2E9  BD 13 E3
    SEC                          ; $E2EC  38
    SBC $76                      ; $E2ED  E5 76
    BCS loc_1F_E2F3              ; $E2EF  B0 02
    SBC #$0F                     ; $E2F1  E9 0F

loc_1F_E2F3:
    STA $0200,X                  ; $E2F3  9D 00 02
    LDA $E314,X                  ; $E2F6  BD 14 E3
    STA $0201,X                  ; $E2F9  9D 01 02
    LDA $E315,X                  ; $E2FC  BD 15 E3
    STA $0202,X                  ; $E2FF  9D 02 02
    LDA $E316,X                  ; $E302  BD 16 E3
    STA $0203,X                  ; $E305  9D 03 02
    INX                          ; $E308  E8
    INX                          ; $E309  E8
    INX                          ; $E30A  E8
    INX                          ; $E30B  E8
    CPX #$28                     ; $E30C  E0 28
    BNE loc_1F_E2E9              ; $E30E  D0 D9
    STX $9F                      ; $E310  86 9F
    RTS                          ; $E312  60

    .byte $28,$A8,$21,$04,$58,$A8,$21,$04,$88,$A8,$21,$04,$B8,$A8,$21,$04  ; $E313
    .byte $E8,$A8,$21,$04,$28,$A8,$21,$F4,$58,$A8,$21,$F4,$88,$A8,$21,$F4  ; $E323
    .byte $B8,$A8,$21,$F4,$E8,$A8,$21,$F4,$12,$12,$12,$12,$12,$12,$12,$12  ; $E333
    .byte $12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12  ; $E343
    .byte $12,$12,$12,$12,$12,$12,$16,$12,$12,$12,$16,$12,$12,$12,$12,$12  ; $E353
    .byte $12,$12,$12,$12,$12,$12,$12,$12,$12,$16,$16,$12,$12,$12,$16,$12  ; $E363
    .byte $12,$12,$12,$12,$12,$16,$12,$12,$12,$12,$16,$12,$12,$12,$12,$14  ; $E373
    .byte $12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$14  ; $E383
    .byte $16,$14,$12,$12,$12,$12,$14,$12,$12,$12,$14,$16,$14,$14,$12,$12  ; $E393
    .byte $12,$14,$14,$14,$14,$14,$14,$14,$12,$12,$12,$12,$12,$12,$12,$12  ; $E3A3
    .byte $12,$12,$12,$12,$12,$12,$12,$12,$14,$14,$14,$14,$14,$14,$14,$14  ; $E3B3
    .byte $14,$14,$14,$14,$12,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14  ; $E3C3
    .byte $14,$14,$14,$14,$14,$14,$14,$14,$14,$12,$12,$12,$12,$14,$14,$14  ; $E3D3
    .byte $14,$14,$12,$14,$14,$12,$12,$12,$14,$12,$12,$14,$14,$14,$14,$14  ; $E3E3
    .byte $12,$14,$14,$14,$12,$14,$14,$12,$12,$12,$12,$14,$12,$12,$12,$14  ; $E3F3
    .byte $16,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12  ; $E403
    .byte $12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12  ; $E413
    .byte $12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12,$12  ; $E423
    .byte $12,$12,$12,$12,$12,$12,$12,$12,$A2,$6F,$9A,$A5,$15,$29,$04,$F0  ; $E433
    .byte $11,$AD,$28,$05,$49,$40,$8D,$28,$05,$A5,$AF,$49,$01,$85,$AF,$4C  ; $E443
    .byte $90,$E4,$A5,$15,$29,$80,$F0,$2F,$A4,$26,$B9,$96,$E4,$85,$26,$85  ; $E453
    .byte $6C,$A9,$00,$85,$24,$85,$25,$85,$AD,$85,$AE,$A9,$DD,$85,$94,$A9  ; $E463
    .byte $E8,$85,$93,$A9,$02,$20,$F3,$FE,$A9,$00,$20,$03,$FF,$A9,$01,$20  ; $E473
    .byte $03,$FF,$A9,$03,$4C,$0B,$FF,$A5,$15,$29,$01,$F0,$00,$20,$22,$FF  ; $E483
    .byte $4C,$3E,$E4,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D  ; $E493
    .byte $0E,$0F,$00  ; $E4A3

sub_1F_E4A6:
    JSR sub_1E_C38F              ; $E4A6  20 8F C3
    LDY #$00                     ; $E4A9  A0 00
    LDX #$00                     ; $E4AB  A2 00
    STX $95                      ; $E4AD  86 95
    STX $9F                      ; $E4AF  86 9F
    STX $77                      ; $E4B1  86 77

loc_1F_E4B3:
    LDA $E614,X                  ; $E4B3  BD 14 E6
    STA $0200,Y                  ; $E4B6  99 00 02
    LDA $E615,X                  ; $E4B9  BD 15 E6
    STA $0203,Y                  ; $E4BC  99 03 02
    INX                          ; $E4BF  E8
    INX                          ; $E4C0  E8
    INY                          ; $E4C1  C8
    INY                          ; $E4C2  C8
    INY                          ; $E4C3  C8
    INY                          ; $E4C4  C8
    CPX #$64                     ; $E4C5  E0 64
    BNE loc_1F_E4B3              ; $E4C7  D0 EA
    LDY #$06                     ; $E4C9  A0 06

loc_1F_E4CB:
    LDA $E678,Y                  ; $E4CB  B9 78 E6
    STA $0611,Y                  ; $E4CE  99 11 06
    DEY                          ; $E4D1  88
    BPL loc_1F_E4CB              ; $E4D2  10 F7

loc_1F_E4D4:
    LDA $14                      ; $E4D4  A5 14
    AND #$20                     ; $E4D6  29 20
    BEQ loc_1F_E501              ; $E4D8  F0 27
    LDY #$0F                     ; $E4DA  A0 0F

loc_1F_E4DC:
    LDA $0600,Y                  ; $E4DC  B9 00 06
    STA $0620,Y                  ; $E4DF  99 20 06
    LDA $0630,Y                  ; $E4E2  B9 30 06
    STA $0610,Y                  ; $E4E5  99 10 06
    DEY                          ; $E4E8  88
    BPL loc_1F_E4DC              ; $E4E9  10 F1
    LDA $0600                    ; $E4EB  AD 00 06
    STA $0610                    ; $E4EE  8D 10 06
    STA $0630                    ; $E4F1  8D 30 06
    STY $18                      ; $E4F4  84 18
    LDY #$0C                     ; $E4F6  A0 0C
    LDA #$9C                     ; $E4F8  A9 9C

loc_1F_E4FA:
    STA $00B0,Y                  ; $E4FA  99 B0 00
    DEY                          ; $E4FD  88
    BPL loc_1F_E4FA              ; $E4FE  10 FA
    RTS                          ; $E500  60


loc_1F_E501:
    LDA $14                      ; $E501  A5 14
    AND #$0F                     ; $E503  29 0F
    BEQ loc_1F_E537              ; $E505  F0 30
    AND #$03                     ; $E507  29 03
    BNE loc_1F_E524              ; $E509  D0 19
    LDA $14                      ; $E50B  A5 14
    AND #$08                     ; $E50D  29 08
    BEQ loc_1F_E51B              ; $E50F  F0 0A
    LDA $77                      ; $E511  A5 77
    SEC                          ; $E513  38
    SBC #$04                     ; $E514  E9 04
    STA $77                      ; $E516  85 77
    JMP loc_1F_E52E              ; $E518  4C 2E E5


loc_1F_E51B:
    LDA $77                      ; $E51B  A5 77
    CLC                          ; $E51D  18
    ADC #$04                     ; $E51E  69 04
    STA $77                      ; $E520  85 77
    BNE loc_1F_E52E              ; $E522  D0 0A

loc_1F_E524:
    AND #$01                     ; $E524  29 01
    BEQ loc_1F_E52C              ; $E526  F0 04
    INC $77                      ; $E528  E6 77
    BNE loc_1F_E52E              ; $E52A  D0 02

loc_1F_E52C:
    DEC $77                      ; $E52C  C6 77

loc_1F_E52E:
    LDA $77                      ; $E52E  A5 77
    AND #$0F                     ; $E530  29 0F
    STA $77                      ; $E532  85 77
    JMP loc_1F_E584              ; $E534  4C 84 E5


loc_1F_E537:
    LDY $77                      ; $E537  A4 77
    LDA $0600,Y                  ; $E539  B9 00 06
    STA $10                      ; $E53C  85 10
    LDA $14                      ; $E53E  A5 14
    AND #$C0                     ; $E540  29 C0
    BEQ loc_1F_E584              ; $E542  F0 40
    AND #$80                     ; $E544  29 80
    BEQ loc_1F_E54D              ; $E546  F0 05
    INC $10                      ; $E548  E6 10
    JMP loc_1F_E54F              ; $E54A  4C 4F E5


loc_1F_E54D:
    DEC $10                      ; $E54D  C6 10

loc_1F_E54F:
    LDA $10                      ; $E54F  A5 10
    CMP #$0F                     ; $E551  C9 0F
    BEQ loc_1F_E57C              ; $E553  F0 27
    LDA $10                      ; $E555  A5 10
    AND #$3F                     ; $E557  29 3F
    STA $10                      ; $E559  85 10
    AND #$0F                     ; $E55B  29 0F
    CMP #$0D                     ; $E55D  C9 0D
    BCC loc_1F_E57C              ; $E55F  90 1B
    LDA $14                      ; $E561  A5 14
    AND #$80                     ; $E563  29 80
    BEQ loc_1F_E574              ; $E565  F0 0D
    LDA $10                      ; $E567  A5 10
    AND #$30                     ; $E569  29 30
    ADC #$10                     ; $E56B  69 10
    AND #$30                     ; $E56D  29 30
    STA $10                      ; $E56F  85 10
    JMP loc_1F_E57C              ; $E571  4C 7C E5


loc_1F_E574:
    LDA $10                      ; $E574  A5 10
    AND #$30                     ; $E576  29 30
    ORA #$0C                     ; $E578  09 0C
    STA $10                      ; $E57A  85 10

loc_1F_E57C:
    LDA $10                      ; $E57C  A5 10
    STA $0600,Y                  ; $E57E  99 00 06
    STA $0620,Y                  ; $E581  99 20 06

loc_1F_E584:
    LDA $77                      ; $E584  A5 77
    STA $00                      ; $E586  85 00
    LDX #$00                     ; $E588  A2 00
    LDY #$00                     ; $E58A  A0 00

loc_1F_E58C:
    LDA $0600,Y                  ; $E58C  B9 00 06
    PHA                          ; $E58F  48
    AND #$F0                     ; $E590  29 F0
    LSR A                        ; $E592  4A
    LSR A                        ; $E593  4A
    LSR A                        ; $E594  4A
    LSR A                        ; $E595  4A
    STY $01                      ; $E596  84 01
    TAY                          ; $E598  A8
    LDA $E67F,Y                  ; $E599  B9 7F E6
    LDY $01                      ; $E59C  A4 01
    STA $0201,X                  ; $E59E  9D 01 02
    LDA #$00                     ; $E5A1  A9 00
    CPY $00                      ; $E5A3  C4 00
    BNE loc_1F_E5A9              ; $E5A5  D0 02
    LDA #$01                     ; $E5A7  A9 01

loc_1F_E5A9:
    STA $0202,X                  ; $E5A9  9D 02 02
    STA $0206,X                  ; $E5AC  9D 06 02
    PLA                          ; $E5AF  68
    AND #$0F                     ; $E5B0  29 0F
    STY $01                      ; $E5B2  84 01
    TAY                          ; $E5B4  A8
    LDA $E67F,Y                  ; $E5B5  B9 7F E6
    LDY $01                      ; $E5B8  A4 01
    STA $0205,X                  ; $E5BA  9D 05 02
    TXA                          ; $E5BD  8A
    CLC                          ; $E5BE  18
    ADC #$08                     ; $E5BF  69 08
    TAX                          ; $E5C1  AA
    INY                          ; $E5C2  C8
    CPY #$20                     ; $E5C3  C0 20
    BEQ loc_1F_E5CF              ; $E5C5  F0 08
    CPY #$10                     ; $E5C7  C0 10
    BNE loc_1F_E58C              ; $E5C9  D0 C1
    LDY #$18                     ; $E5CB  A0 18
    BNE loc_1F_E58C              ; $E5CD  D0 BD

loc_1F_E5CF:
    LDA $0348                    ; $E5CF  AD 48 03
    PHA                          ; $E5D2  48
    AND #$0F                     ; $E5D3  29 0F
    STA $00                      ; $E5D5  85 00
    PLA                          ; $E5D7  68
    LSR A                        ; $E5D8  4A
    LSR A                        ; $E5D9  4A
    LSR A                        ; $E5DA  4A
    LSR A                        ; $E5DB  4A
    TAY                          ; $E5DC  A8
    LDA $E67F,Y                  ; $E5DD  B9 7F E6
    STA $0201,X                  ; $E5E0  9D 01 02
    LDY $00                      ; $E5E3  A4 00
    LDA $E67F,Y                  ; $E5E5  B9 7F E6
    STA $0205,X                  ; $E5E8  9D 05 02
    LDA #$00                     ; $E5EB  A9 00
    STA $0202,X                  ; $E5ED  9D 02 02
    STA $0206,X                  ; $E5F0  9D 06 02
    JSR sub_1F_E68F              ; $E5F3  20 8F E6
    LDA #$FF                     ; $E5F6  A9 FF
    STA $18                      ; $E5F8  85 18
    LDA $0600                    ; $E5FA  AD 00 06
    STA $0610                    ; $E5FD  8D 10 06
    LDA #$00                     ; $E600  A9 00
    STA $05F8                    ; $E602  8D F8 05
    STA $05F9                    ; $E605  8D F9 05
    STA $05FA                    ; $E608  8D FA 05
    STA $05FB                    ; $E60B  8D FB 05
    JSR sub_1F_FF22              ; $E60E  20 22 FF
    JMP loc_1F_E4D4              ; $E611  4C D4 E4

    .byte $28,$80,$28,$88,$28,$98,$28,$A0,$28,$B0,$28,$B8,$28,$C8,$28,$D0  ; $E614
    .byte $38,$80,$38,$88,$38,$98,$38,$A0,$38,$B0,$38,$B8,$38,$C8,$38,$D0  ; $E624
    .byte $48,$80,$48,$88,$48,$98,$48,$A0,$48,$B0,$48,$B8,$48,$C8,$48,$D0  ; $E634
    .byte $58,$80,$58,$88,$58,$98,$58,$A0,$58,$B0,$58,$B8,$58,$C8,$58,$D0  ; $E644
    .byte $88,$80,$88,$88,$88,$98,$88,$A0,$88,$B0,$88,$B8,$88,$C8,$88,$D0  ; $E654
    .byte $98,$80,$98,$88,$98,$98,$98,$A0,$98,$B0,$98,$B8,$98,$C8,$98,$D0  ; $E664
    .byte $78,$80,$78,$88,$30,$30,$30,$0F,$16,$16,$16,$30,$31,$32,$33,$34  ; $E674
    .byte $35,$36,$37,$38,$39,$41,$42,$43,$44,$45,$46  ; $E684

sub_1F_E68F:
    LDA #$9C                     ; $E68F  A9 9C
    SEC                          ; $E691  38
    SBC $B0                      ; $E692  E5 B0
    PHA                          ; $E694  48
    AND #$10                     ; $E695  29 10
    LSR A                        ; $E697  4A
    LSR A                        ; $E698  4A
    LSR A                        ; $E699  4A
    LSR A                        ; $E69A  4A
    TAY                          ; $E69B  A8
    LDA $E67F,Y                  ; $E69C  B9 7F E6
    STA $02F9                    ; $E69F  8D F9 02
    LDA #$20                     ; $E6A2  A9 20
    STA $02F8                    ; $E6A4  8D F8 02
    STA $02FC                    ; $E6A7  8D FC 02
    LDA #$30                     ; $E6AA  A9 30
    STA $02FB                    ; $E6AC  8D FB 02
    LDA #$00                     ; $E6AF  A9 00
    STA $02FA                    ; $E6B1  8D FA 02
    STA $02FE                    ; $E6B4  8D FE 02
    PLA                          ; $E6B7  68
    AND #$0F                     ; $E6B8  29 0F
    TAY                          ; $E6BA  A8
    LDA $E67F,Y                  ; $E6BB  B9 7F E6
    STA $02FD                    ; $E6BE  8D FD 02
    LDA #$38                     ; $E6C1  A9 38
    STA $02FF                    ; $E6C3  8D FF 02
    RTS                          ; $E6C6  60


sub_1F_E6C7:
    LDA $0528,X                  ; $E6C7  BD 28 05
    ORA #$20                     ; $E6CA  09 20
    STA $0528,X                  ; $E6CC  9D 28 05
    CPX #$00                     ; $E6CF  E0 00
    BNE loc_1F_E6DD              ; $E6D1  D0 0A
    LDA $0330                    ; $E6D3  AD 30 03
    STA $02                      ; $E6D6  85 02
    LDA $0348                    ; $E6D8  AD 48 03
    STA $03                      ; $E6DB  85 03

loc_1F_E6DD:
    JSR sub_1F_E8E6              ; $E6DD  20 E6 E8
    CPX #$00                     ; $E6E0  E0 00
    BNE loc_1F_E6F9              ; $E6E2  D0 15
    JSR sub_1F_EDF6              ; $E6E4  20 F6 ED
    BCC loc_1F_E6F9              ; $E6E7  90 10
    JSR sub_1F_EF15              ; $E6E9  20 15 EF
    JSR sub_1F_E6F1              ; $E6EC  20 F1 E6
    SEC                          ; $E6EF  38
    RTS                          ; $E6F0  60


sub_1F_E6F1:
    BCC loc_1F_E6F9              ; $E6F1  90 06
    BEQ loc_1F_E6F9              ; $E6F3  F0 04
    INY                          ; $E6F5  C8
    JMP loc_1F_E738              ; $E6F6  4C 38 E7


loc_1F_E6F9:
    JSR sub_1E_C5AA              ; $E6F9  20 AA C5
    CLC                          ; $E6FC  18
    LDA $10                      ; $E6FD  A5 10
    AND #$10                     ; $E6FF  29 10
    BEQ loc_1F_E707              ; $E701  F0 04
    JSR sub_1F_EEAF              ; $E703  20 AF EE
    SEC                          ; $E706  38

loc_1F_E707:
    RTS                          ; $E707  60


sub_1F_E708:
    LDA $0528,X                  ; $E708  BD 28 05
    AND #$DF                     ; $E70B  29 DF
    STA $0528,X                  ; $E70D  9D 28 05
    CPX #$00                     ; $E710  E0 00
    BNE loc_1F_E71E              ; $E712  D0 0A
    LDA $0330                    ; $E714  AD 30 03
    STA $02                      ; $E717  85 02
    LDA $0348                    ; $E719  AD 48 03
    STA $03                      ; $E71C  85 03

loc_1F_E71E:
    JSR sub_1F_E90C              ; $E71E  20 0C E9
    CPX #$00                     ; $E721  E0 00
    BNE loc_1F_E738              ; $E723  D0 13
    JSR sub_1F_EDF6              ; $E725  20 F6 ED
    BCC loc_1F_E738              ; $E728  90 0E
    JSR sub_1F_EF29              ; $E72A  20 29 EF
    JSR sub_1F_E732              ; $E72D  20 32 E7
    SEC                          ; $E730  38
    RTS                          ; $E731  60


sub_1F_E732:
    BCS loc_1F_E738              ; $E732  B0 04
    DEY                          ; $E734  88
    JMP loc_1F_E6F9              ; $E735  4C F9 E6


loc_1F_E738:
    JSR sub_1E_C5AA              ; $E738  20 AA C5
    CLC                          ; $E73B  18
    LDA $10                      ; $E73C  A5 10
    AND #$10                     ; $E73E  29 10
    BEQ loc_1F_E746              ; $E740  F0 04
    JSR sub_1F_EEC7              ; $E742  20 C7 EE
    SEC                          ; $E745  38

loc_1F_E746:
    RTS                          ; $E746  60


sub_1F_E747:
    CPX #$00                     ; $E747  E0 00
    BNE loc_1F_E755              ; $E749  D0 0A
    LDA $0378                    ; $E74B  AD 78 03
    STA $02                      ; $E74E  85 02
    LDA $0390                    ; $E750  AD 90 03
    STA $03                      ; $E753  85 03

loc_1F_E755:
    JSR sub_1F_E92A              ; $E755  20 2A E9
    CPX #$00                     ; $E758  E0 00
    BNE loc_1F_E771              ; $E75A  D0 15
    JSR sub_1F_ED8F              ; $E75C  20 8F ED
    BCC loc_1F_E771              ; $E75F  90 10
    JSR sub_1F_EF4A              ; $E761  20 4A EF
    JSR sub_1F_E769              ; $E764  20 69 E7
    SEC                          ; $E767  38
    RTS                          ; $E768  60


sub_1F_E769:
    BCC loc_1F_E771              ; $E769  90 06
    BEQ loc_1F_E771              ; $E76B  F0 04
    INY                          ; $E76D  C8
    JMP sub_1F_E7A8              ; $E76E  4C A8 E7


loc_1F_E771:
    JSR sub_1E_C4A1              ; $E771  20 A1 C4
    CLC                          ; $E774  18
    LDA $10                      ; $E775  A5 10
    AND #$10                     ; $E777  29 10
    BEQ loc_1F_E77F              ; $E779  F0 04
    JSR sub_1F_EEF7              ; $E77B  20 F7 EE
    SEC                          ; $E77E  38

loc_1F_E77F:
    RTS                          ; $E77F  60


sub_1F_E780:
    CPX #$00                     ; $E780  E0 00
    BNE loc_1F_E78E              ; $E782  D0 0A
    LDA $0378                    ; $E784  AD 78 03
    STA $02                      ; $E787  85 02
    LDA $0390                    ; $E789  AD 90 03
    STA $03                      ; $E78C  85 03

loc_1F_E78E:
    JSR sub_1F_E94A              ; $E78E  20 4A E9
    CPX #$00                     ; $E791  E0 00
    BNE sub_1F_E7A8              ; $E793  D0 13
    JSR sub_1F_ED8F              ; $E795  20 8F ED
    BCC sub_1F_E7A8              ; $E798  90 0E
    JSR sub_1F_EF60              ; $E79A  20 60 EF
    JSR sub_1F_E7A2              ; $E79D  20 A2 E7
    SEC                          ; $E7A0  38
    RTS                          ; $E7A1  60


sub_1F_E7A2:
    BCS sub_1F_E7A8              ; $E7A2  B0 04
    DEY                          ; $E7A4  88
    JMP loc_1F_E771              ; $E7A5  4C 71 E7


sub_1F_E7A8:
    JSR sub_1E_C4A1              ; $E7A8  20 A1 C4
    CLC                          ; $E7AB  18
    LDA $10                      ; $E7AC  A5 10
    AND #$10                     ; $E7AE  29 10
    BEQ loc_1F_E7B6              ; $E7B0  F0 04
    JSR sub_1F_EEDD              ; $E7B2  20 DD EE
    SEC                          ; $E7B5  38

loc_1F_E7B6:
    RTS                          ; $E7B6  60


sub_1F_E7B7:
    CPX #$00                     ; $E7B7  E0 00
    BNE loc_1F_E7CF              ; $E7B9  D0 14
    STX $04C8                    ; $E7BB  8E C8 04
    LDA $0378                    ; $E7BE  AD 78 03
    STA $02                      ; $E7C1  85 02
    LDA $0390                    ; $E7C3  AD 90 03
    STA $03                      ; $E7C6  85 03
    LDA $AF                      ; $E7C8  A5 AF
    BEQ loc_1F_E7CF              ; $E7CA  F0 03
    JMP loc_1F_E872              ; $E7CC  4C 72 E8


loc_1F_E7CF:
    LDA $03F0,X                  ; $E7CF  BD F0 03
    BPL loc_1F_E840              ; $E7D2  10 6C
    JSR sub_1F_E979              ; $E7D4  20 79 E9
    CPX #$00                     ; $E7D7  E0 00
    BNE loc_1F_E81C              ; $E7D9  D0 41
    JSR sub_1F_ED8F              ; $E7DB  20 8F ED
    BCC loc_1F_E81C              ; $E7DE  90 3C
    JSR sub_1F_EF4A              ; $E7E0  20 4A EF
    JSR sub_1F_E814              ; $E7E3  20 14 E8
    LDY $73                      ; $E7E6  A4 73
    LDA $0300,Y                  ; $E7E8  B9 00 03
    CMP #$45                     ; $E7EB  C9 45
    BNE loc_1F_E7F4              ; $E7ED  D0 05
    STY $04C8                    ; $E7EF  8C C8 04
    BEQ loc_1F_E83C              ; $E7F2  F0 48

loc_1F_E7F4:
    LDA $03F0,Y                  ; $E7F4  B9 F0 03
    BPL loc_1F_E808              ; $E7F7  10 0F
    STA $03F0                    ; $E7F9  8D F0 03
    DEC $03F0                    ; $E7FC  CE F0 03
    LDA $03D8,Y                  ; $E7FF  B9 D8 03
    STA $03D8                    ; $E802  8D D8 03
    JMP loc_1F_E83C              ; $E805  4C 3C E8


loc_1F_E808:
    LDA #$00                     ; $E808  A9 00
    STA $03D8,X                  ; $E80A  9D D8 03
    LDA #$FD                     ; $E80D  A9 FD
    STA $03F0,X                  ; $E80F  9D F0 03
    BNE loc_1F_E83C              ; $E812  D0 28

sub_1F_E814:
    BCC loc_1F_E81C              ; $E814  90 06
    BEQ loc_1F_E81C              ; $E816  F0 04
    INY                          ; $E818  C8
    JMP sub_1F_E7A8              ; $E819  4C A8 E7


loc_1F_E81C:
    JSR sub_1F_E9B7              ; $E81C  20 B7 E9
    JSR sub_1E_C4A1              ; $E81F  20 A1 C4
    LDA $42                      ; $E822  A5 42
    CMP #$40                     ; $E824  C9 40
    BNE loc_1F_E830              ; $E826  D0 08
    LDA $11                      ; $E828  A5 11
    AND #$0F                     ; $E82A  29 0F
    CMP #$08                     ; $E82C  C9 08
    BCC loc_1F_E836              ; $E82E  90 06

loc_1F_E830:
    LDA $10                      ; $E830  A5 10
    AND #$10                     ; $E832  29 10
    BEQ loc_1F_E870              ; $E834  F0 3A

loc_1F_E836:
    JSR sub_1F_EEF7              ; $E836  20 F7 EE
    JSR sub_1F_EA1E              ; $E839  20 1E EA

loc_1F_E83C:
    LDA #$00                     ; $E83C  A9 00
    SEC                          ; $E83E  38
    RTS                          ; $E83F  60


loc_1F_E840:
    INY                          ; $E840  C8
    JSR sub_1F_E999              ; $E841  20 99 E9
    CPX #$00                     ; $E844  E0 00
    BNE loc_1F_E85C              ; $E846  D0 14
    JSR sub_1F_ED8F              ; $E848  20 8F ED
    BCC loc_1F_E85C              ; $E84B  90 0F
    JSR sub_1F_EF60              ; $E84D  20 60 EF
    JSR sub_1F_E856              ; $E850  20 56 E8
    JMP loc_1F_E86B              ; $E853  4C 6B E8


sub_1F_E856:
    BCS loc_1F_E85C              ; $E856  B0 04
    DEY                          ; $E858  88
    JMP loc_1F_E771              ; $E859  4C 71 E7


loc_1F_E85C:
    JSR sub_1F_E9B7              ; $E85C  20 B7 E9
    JSR sub_1E_C4A1              ; $E85F  20 A1 C4
    LDA $10                      ; $E862  A5 10
    AND #$10                     ; $E864  29 10
    BEQ loc_1F_E870              ; $E866  F0 08
    JSR sub_1F_EEDD              ; $E868  20 DD EE

loc_1F_E86B:
    JSR sub_1F_EA1E              ; $E86B  20 1E EA
    LDA #$FF                     ; $E86E  A9 FF

loc_1F_E870:
    CLC                          ; $E870  18
    RTS                          ; $E871  60


loc_1F_E872:
    LDA $03F0,X                  ; $E872  BD F0 03
    BPL loc_1F_E8A4              ; $E875  10 2D
    JSR sub_1F_E979              ; $E877  20 79 E9
    JSR sub_1F_ED8F              ; $E87A  20 8F ED
    BCC loc_1F_E890              ; $E87D  90 11
    JSR sub_1F_EF4A              ; $E87F  20 4A EF
    JSR sub_1F_E888              ; $E882  20 88 E8
    JMP loc_1F_E89F              ; $E885  4C 9F E8


sub_1F_E888:
    BCC loc_1F_E890              ; $E888  90 06
    BEQ loc_1F_E890              ; $E88A  F0 04
    INY                          ; $E88C  C8
    JMP sub_1F_E7A8              ; $E88D  4C A8 E7


loc_1F_E890:
    JSR sub_1F_E9E1              ; $E890  20 E1 E9
    JSR sub_1E_C4A1              ; $E893  20 A1 C4
    LDA $10                      ; $E896  A5 10
    AND #$10                     ; $E898  29 10
    BEQ loc_1F_E8A2              ; $E89A  F0 06
    JSR sub_1F_EEF7              ; $E89C  20 F7 EE

loc_1F_E89F:
    JSR sub_1F_EA29              ; $E89F  20 29 EA

loc_1F_E8A2:
    CLC                          ; $E8A2  18
    RTS                          ; $E8A3  60


loc_1F_E8A4:
    INY                          ; $E8A4  C8
    JSR sub_1F_E999              ; $E8A5  20 99 E9
    JSR sub_1F_ED8F              ; $E8A8  20 8F ED
    BCC loc_1F_E8BC              ; $E8AB  90 0F
    JSR sub_1F_EF60              ; $E8AD  20 60 EF
    JSR sub_1F_E8B6              ; $E8B0  20 B6 E8
    JMP loc_1F_E8D9              ; $E8B3  4C D9 E8


sub_1F_E8B6:
    BCS loc_1F_E8BC              ; $E8B6  B0 04
    DEY                          ; $E8B8  88
    JMP loc_1F_E771              ; $E8B9  4C 71 E7


loc_1F_E8BC:
    JSR sub_1F_E9E1              ; $E8BC  20 E1 E9
    JSR sub_1E_C4A1              ; $E8BF  20 A1 C4
    LDA $42                      ; $E8C2  A5 42
    CMP #$40                     ; $E8C4  C9 40
    BNE loc_1F_E8D0              ; $E8C6  D0 08
    LDA $11                      ; $E8C8  A5 11
    AND #$0F                     ; $E8CA  29 0F
    CMP #$08                     ; $E8CC  C9 08
    BCS loc_1F_E8D6              ; $E8CE  B0 06

loc_1F_E8D0:
    LDA $10                      ; $E8D0  A5 10
    AND #$10                     ; $E8D2  29 10
    BEQ loc_1F_E8A2              ; $E8D4  F0 CC

loc_1F_E8D6:
    JSR sub_1F_EEDD              ; $E8D6  20 DD EE

loc_1F_E8D9:
    JSR sub_1F_EA29              ; $E8D9  20 29 EA
    SEC                          ; $E8DC  38
    RTS                          ; $E8DD  60

    .byte $BD,$28,$05,$09,$20,$9D,$28,$05  ; $E8DE

sub_1F_E8E6:
    LDA $0318,X                  ; $E8E6  BD 18 03
    CLC                          ; $E8E9  18
    ADC $03A8,X                  ; $E8EA  7D A8 03
    STA $0318,X                  ; $E8ED  9D 18 03
    LDA $0330,X                  ; $E8F0  BD 30 03
    ADC $03C0,X                  ; $E8F3  7D C0 03
    STA $0330,X                  ; $E8F6  9D 30 03
    BCC loc_1F_E903              ; $E8F9  90 08
    LDA $0348,X                  ; $E8FB  BD 48 03
    ADC #$00                     ; $E8FE  69 00
    STA $0348,X                  ; $E900  9D 48 03

loc_1F_E903:
    RTS                          ; $E903  60

    .byte $BD,$28,$05,$29,$DF,$9D,$28,$05  ; $E904

sub_1F_E90C:
    LDA $0318,X                  ; $E90C  BD 18 03
    SEC                          ; $E90F  38
    SBC $03A8,X                  ; $E910  FD A8 03
    STA $0318,X                  ; $E913  9D 18 03
    LDA $0330,X                  ; $E916  BD 30 03
    SBC $03C0,X                  ; $E919  FD C0 03
    STA $0330,X                  ; $E91C  9D 30 03
    BCS loc_1F_E929              ; $E91F  B0 08
    LDA $0348,X                  ; $E921  BD 48 03
    SBC #$00                     ; $E924  E9 00
    STA $0348,X                  ; $E926  9D 48 03

loc_1F_E929:
    RTS                          ; $E929  60


sub_1F_E92A:
    LDA $0360,X                  ; $E92A  BD 60 03
    CLC                          ; $E92D  18
    ADC $03D8,X                  ; $E92E  7D D8 03
    STA $0360,X                  ; $E931  9D 60 03
    LDA $0378,X                  ; $E934  BD 78 03
    ADC $03F0,X                  ; $E937  7D F0 03
    STA $0378,X                  ; $E93A  9D 78 03
    CMP #$F0                     ; $E93D  C9 F0
    BCC loc_1F_E949              ; $E93F  90 08
    ADC #$0F                     ; $E941  69 0F
    STA $0378,X                  ; $E943  9D 78 03
    INC $0390,X                  ; $E946  FE 90 03

loc_1F_E949:
    RTS                          ; $E949  60


sub_1F_E94A:
    LDA $0360,X                  ; $E94A  BD 60 03
    SEC                          ; $E94D  38
    SBC $03D8,X                  ; $E94E  FD D8 03
    STA $0360,X                  ; $E951  9D 60 03
    LDA $0378,X                  ; $E954  BD 78 03
    SBC $03F0,X                  ; $E957  FD F0 03
    STA $0378,X                  ; $E95A  9D 78 03
    BCS loc_1F_E967              ; $E95D  B0 08
    SBC #$0F                     ; $E95F  E9 0F
    STA $0378,X                  ; $E961  9D 78 03
    DEC $0390,X                  ; $E964  DE 90 03

loc_1F_E967:
    RTS                          ; $E967  60


sub_1F_E968:
    LDA $03F0,X                  ; $E968  BD F0 03
    BPL loc_1F_E973              ; $E96B  10 06
    JSR sub_1F_E979              ; $E96D  20 79 E9
    JMP sub_1F_E9B7              ; $E970  4C B7 E9


loc_1F_E973:
    JSR sub_1F_E999              ; $E973  20 99 E9
    JMP sub_1F_E9B7              ; $E976  4C B7 E9


sub_1F_E979:
    LDA $0360,X                  ; $E979  BD 60 03
    SEC                          ; $E97C  38
    SBC $03D8,X                  ; $E97D  FD D8 03
    STA $0360,X                  ; $E980  9D 60 03
    LDA $0378,X                  ; $E983  BD 78 03
    SBC $03F0,X                  ; $E986  FD F0 03
    STA $0378,X                  ; $E989  9D 78 03
    CMP #$F0                     ; $E98C  C9 F0
    BCC loc_1F_E998              ; $E98E  90 08
    ADC #$0F                     ; $E990  69 0F
    STA $0378,X                  ; $E992  9D 78 03
    INC $0390,X                  ; $E995  FE 90 03

loc_1F_E998:
    RTS                          ; $E998  60


sub_1F_E999:
    LDA $0360,X                  ; $E999  BD 60 03
    SEC                          ; $E99C  38
    SBC $03D8,X                  ; $E99D  FD D8 03
    STA $0360,X                  ; $E9A0  9D 60 03
    LDA $0378,X                  ; $E9A3  BD 78 03
    SBC $03F0,X                  ; $E9A6  FD F0 03
    STA $0378,X                  ; $E9A9  9D 78 03
    BCS loc_1F_E9B6              ; $E9AC  B0 08
    SBC #$0F                     ; $E9AE  E9 0F
    STA $0378,X                  ; $E9B0  9D 78 03
    DEC $0390,X                  ; $E9B3  DE 90 03

loc_1F_E9B6:
    RTS                          ; $E9B6  60


sub_1F_E9B7:
    LDA $52                      ; $E9B7  A5 52
    BEQ loc_1F_E9BF              ; $E9B9  F0 04
    CPX #$00                     ; $E9BB  E0 00
    BEQ loc_1F_E9E0              ; $E9BD  F0 21

loc_1F_E9BF:
    LDA $03D8,X                  ; $E9BF  BD D8 03
    SEC                          ; $E9C2  38
    SBC $A1                      ; $E9C3  E5 A1
    STA $03D8,X                  ; $E9C5  9D D8 03
    LDA $03F0,X                  ; $E9C8  BD F0 03
    SBC #$00                     ; $E9CB  E9 00
    STA $03F0,X                  ; $E9CD  9D F0 03
    BPL loc_1F_E9E0              ; $E9D0  10 0E
    CMP #$F9                     ; $E9D2  C9 F9
    BCS loc_1F_E9E0              ; $E9D4  B0 0A
    LDA #$F9                     ; $E9D6  A9 F9
    STA $03F0,X                  ; $E9D8  9D F0 03
    LDA #$00                     ; $E9DB  A9 00
    STA $03D8,X                  ; $E9DD  9D D8 03

loc_1F_E9E0:
    RTS                          ; $E9E0  60


sub_1F_E9E1:
    LDA $03D8,X                  ; $E9E1  BD D8 03
    CLC                          ; $E9E4  18
    ADC $A1                      ; $E9E5  65 A1
    STA $03D8,X                  ; $E9E7  9D D8 03
    LDA $03F0,X                  ; $E9EA  BD F0 03
    ADC #$00                     ; $E9ED  69 00
    STA $03F0,X                  ; $E9EF  9D F0 03
    BMI loc_1F_EA02              ; $E9F2  30 0E
    CMP #$07                     ; $E9F4  C9 07
    BCC loc_1F_EA02              ; $E9F6  90 0A
    LDA #$07                     ; $E9F8  A9 07
    STA $03F0,X                  ; $E9FA  9D F0 03
    LDA #$00                     ; $E9FD  A9 00
    STA $03D8,X                  ; $E9FF  9D D8 03

loc_1F_EA02:
    RTS                          ; $EA02  60


sub_1F_EA03:
    LDA $03D8,X                  ; $EA03  BD D8 03
    CLC                          ; $EA06  18
    ADC #$40                     ; $EA07  69 40
    STA $03D8,X                  ; $EA09  9D D8 03
    LDA $03F0,X                  ; $EA0C  BD F0 03
    ADC #$00                     ; $EA0F  69 00
    STA $03F0,X                  ; $EA11  9D F0 03
    CMP #$0F                     ; $EA14  C9 0F
    BNE loc_1F_EA1D              ; $EA16  D0 05
    LDA #$00                     ; $EA18  A9 00
    STA $03D8,X                  ; $EA1A  9D D8 03

loc_1F_EA1D:
    RTS                          ; $EA1D  60


sub_1F_EA1E:
    LDA #$00                     ; $EA1E  A9 00
    STA $03D8,X                  ; $EA20  9D D8 03
    LDA #$FF                     ; $EA23  A9 FF
    STA $03F0,X                  ; $EA25  9D F0 03
    RTS                          ; $EA28  60


sub_1F_EA29:
    LDA #$00                     ; $EA29  A9 00
    STA $03D8,X                  ; $EA2B  9D D8 03
    LDA #$01                     ; $EA2E  A9 01
    STA $03F0,X                  ; $EA30  9D F0 03
    RTS                          ; $EA33  60


sub_1F_EA34:
    LDA #$C0                     ; $EA34  A9 C0
    STA $03D8,Y                  ; $EA36  99 D8 03
    LDA #$FF                     ; $EA39  A9 FF
    STA $03F0,Y                  ; $EA3B  99 F0 03
    RTS                          ; $EA3E  60


sub_1F_EA3F:
    LDA $0420,X                  ; $EA3F  BD 20 04
    CLC                          ; $EA42  18
    AND #$03                     ; $EA43  29 03
    BEQ loc_1F_EA97              ; $EA45  F0 50
    AND #$01                     ; $EA47  29 01
    BEQ loc_1F_EA4E              ; $EA49  F0 03
    JMP sub_1F_E6C7              ; $EA4B  4C C7 E6


loc_1F_EA4E:
    INY                          ; $EA4E  C8
    JMP sub_1F_E708              ; $EA4F  4C 08 E7


sub_1F_EA52:
    CLC                          ; $EA52  18
    LDA $0420,X                  ; $EA53  BD 20 04
    AND #$0C                     ; $EA56  29 0C
    BEQ loc_1F_EA97              ; $EA58  F0 3D
    AND #$04                     ; $EA5A  29 04
    BEQ loc_1F_EA61              ; $EA5C  F0 03
    JMP sub_1F_E747              ; $EA5E  4C 47 E7


loc_1F_EA61:
    INY                          ; $EA61  C8
    JMP sub_1F_E780              ; $EA62  4C 80 E7


sub_1F_EA65:
    LDA $0420,X                  ; $EA65  BD 20 04
    AND #$03                     ; $EA68  29 03
    BEQ loc_1F_EA97              ; $EA6A  F0 2B
    AND #$01                     ; $EA6C  29 01
    BEQ loc_1F_EA7B              ; $EA6E  F0 0B
    LDA $0528,X                  ; $EA70  BD 28 05
    ORA #$20                     ; $EA73  09 20
    STA $0528,X                  ; $EA75  9D 28 05
    JMP sub_1F_E8E6              ; $EA78  4C E6 E8


loc_1F_EA7B:
    LDA $0528,X                  ; $EA7B  BD 28 05
    AND #$DF                     ; $EA7E  29 DF
    STA $0528,X                  ; $EA80  9D 28 05
    JMP sub_1F_E90C              ; $EA83  4C 0C E9


sub_1F_EA86:
    LDA $0420,X                  ; $EA86  BD 20 04
    AND #$0C                     ; $EA89  29 0C
    BEQ loc_1F_EA97              ; $EA8B  F0 0A
    AND #$04                     ; $EA8D  29 04
    BEQ loc_1F_EA94              ; $EA8F  F0 03
    JMP sub_1F_E92A              ; $EA91  4C 2A E9


loc_1F_EA94:
    JMP sub_1F_E94A              ; $EA94  4C 4A E9


loc_1F_EA97:
    RTS                          ; $EA97  60


sub_1F_EA98:
    STA $0558,X                  ; $EA98  9D 58 05
    LDA #$00                     ; $EA9B  A9 00
    STA $0540,X                  ; $EA9D  9D 40 05
    STA $0570,X                  ; $EAA0  9D 70 05
    RTS                          ; $EAA3  60


sub_1F_EAA4:
    PHA                          ; $EAA4  48
    LDA $0330,X                  ; $EAA5  BD 30 03
    STA $0330,Y                  ; $EAA8  99 30 03
    LDA $0348,X                  ; $EAAB  BD 48 03
    STA $0348,Y                  ; $EAAE  99 48 03
    LDA $0378,X                  ; $EAB1  BD 78 03
    STA $0378,Y                  ; $EAB4  99 78 03
    LDA $0390,X                  ; $EAB7  BD 90 03
    STA $0390,Y                  ; $EABA  99 90 03

loc_1F_EABD:
    LDA $0528,X                  ; $EABD  BD 28 05
    AND #$60                     ; $EAC0  29 60
    STA $0528,Y                  ; $EAC2  99 28 05
    LDA #$00                     ; $EAC5  A9 00
    STA $0318,Y                  ; $EAC7  99 18 03
    STA $0360,Y                  ; $EACA  99 60 03
    STA $05B8,Y                  ; $EACD  99 B8 05
    STA $0468,Y                  ; $EAD0  99 68 04
    STA $0480,Y                  ; $EAD3  99 80 04
    STA $0498,Y                  ; $EAD6  99 98 04
    STA $04B0,Y                  ; $EAD9  99 B0 04
    STA $04C8,Y                  ; $EADC  99 C8 04
    STA $04E0,Y                  ; $EADF  99 E0 04
    STA $04F8,Y                  ; $EAE2  99 F8 04
    STA $0510,Y                  ; $EAE5  99 10 05
    PLA                          ; $EAE8  68

sub_1F_EAE9:
    STA $0558,Y                  ; $EAE9  99 58 05
    LDA #$00                     ; $EAEC  A9 00
    STA $0540,Y                  ; $EAEE  99 40 05
    STA $0570,Y                  ; $EAF1  99 70 05
    RTS                          ; $EAF4  60


sub_1F_EAF5:
    PHA                          ; $EAF5  48
    STX $00                      ; $EAF6  86 00
    LDX $10                      ; $EAF8  A6 10
    LDA #$00                     ; $EAFA  A9 00
    STA $02                      ; $EAFC  85 02
    LDA $EB62,X                  ; $EAFE  BD 62 EB
    STA $01                      ; $EB01  85 01
    BPL loc_1F_EB07              ; $EB03  10 02
    DEC $02                      ; $EB05  C6 02

loc_1F_EB07:
    LDA $EBBC,X                  ; $EB07  BD BC EB
    STA $03                      ; $EB0A  85 03
    LDX $00                      ; $EB0C  A6 00
    LDA $0330,X                  ; $EB0E  BD 30 03
    CLC                          ; $EB11  18
    ADC $01                      ; $EB12  65 01
    STA $0330,Y                  ; $EB14  99 30 03
    LDA $0348,X                  ; $EB17  BD 48 03
    ADC $02                      ; $EB1A  65 02
    STA $0348,Y                  ; $EB1C  99 48 03
    LDA $0390,X                  ; $EB1F  BD 90 03
    STA $0390,Y                  ; $EB22  99 90 03
    LDA $0378,X                  ; $EB25  BD 78 03
    CLC                          ; $EB28  18
    ADC $03                      ; $EB29  65 03
    STA $0378,Y                  ; $EB2B  99 78 03
    LDA $03                      ; $EB2E  A5 03
    BPL loc_1F_EB48              ; $EB30  10 16
    BCS loc_1F_EABD              ; $EB32  B0 89
    LDA $0378,Y                  ; $EB34  B9 78 03
    SBC #$10                     ; $EB37  E9 10
    STA $0378,Y                  ; $EB39  99 78 03
    LDA $0390,Y                  ; $EB3C  B9 90 03
    SEC                          ; $EB3F  38
    SBC #$01                     ; $EB40  E9 01
    STA $0390,Y                  ; $EB42  99 90 03
    JMP loc_1F_EABD              ; $EB45  4C BD EA


loc_1F_EB48:
    LDA $0378,Y                  ; $EB48  B9 78 03
    BCS loc_1F_EB51              ; $EB4B  B0 04
    CMP #$F0                     ; $EB4D  C9 F0
    BCC loc_1F_EB5F              ; $EB4F  90 0E

loc_1F_EB51:
    ADC #$0F                     ; $EB51  69 0F
    STA $0378,Y                  ; $EB53  99 78 03
    LDA $0390,Y                  ; $EB56  B9 90 03
    CLC                          ; $EB59  18
    ADC #$01                     ; $EB5A  69 01
    STA $0390,Y                  ; $EB5C  99 90 03

loc_1F_EB5F:
    JMP loc_1F_EABD              ; $EB5F  4C BD EA

    .byte $F1,$10,$F4,$0C,$10,$0A,$00,$F6,$F0,$00,$F0,$10,$00,$00,$F4,$0C  ; $EB62
    .byte $00,$0C,$F4,$F0,$10,$F4,$0C,$00,$00,$F0,$10,$EC,$0C,$00,$F9,$07  ; $EB72
    .byte $FC,$F8,$04,$08,$FC,$F8,$04,$08,$F4,$0C,$EC,$14,$F4,$F8,$02,$0C  ; $EB82
    .byte $0E,$0E,$0C,$02,$F8,$F4,$EC,$14,$E8,$18,$FC,$04,$E0,$20,$F1,$10  ; $EB92
    .byte $E8,$18,$E2,$1E,$E8,$18,$F8,$08,$10,$00,$F0,$00,$00,$E8,$18,$F8  ; $EBA2
    .byte $08,$E4,$1C,$F4,$0C,$FC,$04,$10,$F0,$10,$FF,$FF,$08,$08,$0E,$14  ; $EBB2
    .byte $18,$14,$0E,$00,$08,$08,$14,$EC,$04,$04,$00,$F4,$0C,$00,$00,$F4  ; $EBC2
    .byte $0C,$F0,$10,$10,$F4,$F0,$10,$00,$00,$00,$FC,$04,$FC,$04,$04,$FC  ; $EBD2
    .byte $04,$FC,$FC,$FC,$FC,$FC,$02,$FA,$F4,$F8,$02,$FE,$08,$0C,$06,$FE  ; $EBE2
    .byte $FF,$FF,$04,$04,$E0,$E0,$FA,$FA,$08,$08,$00,$00,$00,$00,$0C,$0C  ; $EBF2
    .byte $F8,$F8,$F0,$F0,$F0,$F0,$E0,$10,$10,$E8,$E8,$FA,$FA,$FE,$FE,$F4  ; $EC02
    .byte $F4,$04,$FA,$FA  ; $EC12

sub_1F_EC16:
    LDA #$01                     ; $EC16  A9 01
    STA $0420,X                  ; $EC18  9D 20 04
    LDA $0330,X                  ; $EC1B  BD 30 03
    SEC                          ; $EC1E  38
    SBC $0330                    ; $EC1F  ED 30 03
    LDA $0348,X                  ; $EC22  BD 48 03
    SBC $0348                    ; $EC25  ED 48 03
    BCC loc_1F_EC2F              ; $EC28  90 05
    LDA #$02                     ; $EC2A  A9 02
    STA $0420,X                  ; $EC2C  9D 20 04

loc_1F_EC2F:
    RTS                          ; $EC2F  60


sub_1F_EC30:
    LDA $0420,X                  ; $EC30  BD 20 04
    AND #$03                     ; $EC33  29 03
    BEQ loc_1F_EC49              ; $EC35  F0 12
    ROR A                        ; $EC37  6A
    ROR A                        ; $EC38  6A
    ROR A                        ; $EC39  6A
    ROR A                        ; $EC3A  6A
    AND #$20                     ; $EC3B  29 20
    STA $00                      ; $EC3D  85 00
    LDA $0528,X                  ; $EC3F  BD 28 05
    AND #$DF                     ; $EC42  29 DF
    ORA $00                      ; $EC44  05 00
    STA $0528,X                  ; $EC46  9D 28 05

loc_1F_EC49:
    RTS                          ; $EC49  60


sub_1F_EC4A:
    LDA $0420,X                  ; $EC4A  BD 20 04
    EOR #$03                     ; $EC4D  49 03
    STA $0420,X                  ; $EC4F  9D 20 04
    LDA $0528,X                  ; $EC52  BD 28 05
    EOR #$20                     ; $EC55  49 20
    STA $0528,X                  ; $EC57  9D 28 05
    RTS                          ; $EC5A  60


sub_1F_EC5B:
    STA $D9                      ; $EC5B  85 D9

sub_1F_EC5D:
    STX $00                      ; $EC5D  86 00
    LDX $DA                      ; $EC5F  A6 DA
    STA $01                      ; $EC61  85 01
    LDA $DC,X                    ; $EC63  B5 DC
    CMP #$88                     ; $EC65  C9 88
    BNE loc_1F_EC73              ; $EC67  D0 0A
    LDA $01                      ; $EC69  A5 01
    STA $DC,X                    ; $EC6B  95 DC
    INX                          ; $EC6D  E8
    TXA                          ; $EC6E  8A
    AND #$07                     ; $EC6F  29 07
    STA $DA                      ; $EC71  85 DA

loc_1F_EC73:
    LDX $00                      ; $EC73  A6 00
    RTS                          ; $EC75  60


sub_1F_EC76:
    LDA $0378                    ; $EC76  AD 78 03
    SEC                          ; $EC79  38
    SBC $0378,X                  ; $EC7A  FD 78 03
    BCS loc_1F_EC84              ; $EC7D  B0 05
    EOR #$FF                     ; $EC7F  49 FF
    ADC #$01                     ; $EC81  69 01
    CLC                          ; $EC83  18

loc_1F_EC84:
    RTS                          ; $EC84  60

    .byte $B9,$78,$03,$38,$FD,$78,$03,$B0,$05,$49,$FF,$69,$01,$18,$60  ; $EC85

sub_1F_EC94:
    LDA $0330                    ; $EC94  AD 30 03
    SEC                          ; $EC97  38
    SBC $0330,X                  ; $EC98  FD 30 03
    PHA                          ; $EC9B  48
    LDA $0348                    ; $EC9C  AD 48 03
    SBC $0348,X                  ; $EC9F  FD 48 03
    PLA                          ; $ECA2  68
    BCS loc_1F_ECAA              ; $ECA3  B0 05
    EOR #$FF                     ; $ECA5  49 FF
    ADC #$01                     ; $ECA7  69 01
    CLC                          ; $ECA9  18

loc_1F_ECAA:
    RTS                          ; $ECAA  60

    .byte $B9,$30,$03,$38,$FD,$30,$03,$48,$B9,$48,$03,$FD,$48,$03,$68,$B0  ; $ECAB
    .byte $05,$49,$FF,$69,$01,$18,$60  ; $ECBB

sub_1F_ECC2:
    LDY #$00                     ; $ECC2  A0 00
    LDA $0378,Y                  ; $ECC4  B9 78 03
    STA $00                      ; $ECC7  85 00
    LDA $0330,Y                  ; $ECC9  B9 30 03
    STA $01                      ; $ECCC  85 01
    LDA $0348,Y                  ; $ECCE  B9 48 03
    STA $02                      ; $ECD1  85 02
    LDY #$00                     ; $ECD3  A0 00
    LDA $00                      ; $ECD5  A5 00
    SEC                          ; $ECD7  38
    SBC $0378,X                  ; $ECD8  FD 78 03
    LDY #$00                     ; $ECDB  A0 00
    BCS loc_1F_ECE5              ; $ECDD  B0 06
    EOR #$FF                     ; $ECDF  49 FF
    ADC #$01                     ; $ECE1  69 01
    LDY #$04                     ; $ECE3  A0 04

loc_1F_ECE5:
    STA $00                      ; $ECE5  85 00
    LDA $01                      ; $ECE7  A5 01
    SEC                          ; $ECE9  38
    SBC $0330,X                  ; $ECEA  FD 30 03
    PHA                          ; $ECED  48
    LDA $02                      ; $ECEE  A5 02
    SBC $0348,X                  ; $ECF0  FD 48 03
    PLA                          ; $ECF3  68
    BCS loc_1F_ECFC              ; $ECF4  B0 06
    EOR #$FF                     ; $ECF6  49 FF
    ADC #$01                     ; $ECF8  69 01
    INY                          ; $ECFA  C8
    INY                          ; $ECFB  C8

loc_1F_ECFC:
    STA $01                      ; $ECFC  85 01
    CMP $00                      ; $ECFE  C5 00
    BCS loc_1F_ED0B              ; $ED00  B0 09
    PHA                          ; $ED02  48
    LDA $00                      ; $ED03  A5 00
    STA $01                      ; $ED05  85 01
    PLA                          ; $ED07  68
    STA $00                      ; $ED08  85 00
    INY                          ; $ED0A  C8

loc_1F_ED0B:
    LDA #$00                     ; $ED0B  A9 00
    STA $02                      ; $ED0D  85 02
    LDA $01                      ; $ED0F  A5 01
    LSR A                        ; $ED11  4A
    LSR A                        ; $ED12  4A
    CMP $00                      ; $ED13  C5 00
    BCS loc_1F_ED20              ; $ED15  B0 09
    INC $02                      ; $ED17  E6 02
    ASL A                        ; $ED19  0A
    CMP $00                      ; $ED1A  C5 00
    BCS loc_1F_ED20              ; $ED1C  B0 02
    INC $02                      ; $ED1E  E6 02

loc_1F_ED20:
    TYA                          ; $ED20  98
    ASL A                        ; $ED21  0A
    ASL A                        ; $ED22  0A
    CLC                          ; $ED23  18
    ADC $02                      ; $ED24  65 02
    TAY                          ; $ED26  A8
    LDA $ED2B,Y                  ; $ED27  B9 2B ED
    RTS                          ; $ED2A  60

    .byte $04,$05,$06,$04,$08,$07,$06,$04,$0C,$0B,$0A,$04,$08,$09,$0A,$04  ; $ED2B
    .byte $04,$03,$02,$04,$00,$01,$02,$04,$0C,$0D,$0E,$04,$00,$0F,$0E,$04  ; $ED3B
    .byte $08,$09,$09,$09,$01,$05,$05,$05,$04,$06,$06,$06,$02,$0A,$0A,$0A  ; $ED4B
    .byte $A0,$00,$20,$C4,$EC,$85,$00,$A8,$BD,$B0,$04,$18,$69,$08,$29,$0F  ; $ED5B
    .byte $38,$E5,$00,$29,$0F,$38,$E9,$08,$F0,$0A,$B0,$05,$FE,$B0,$04,$D0  ; $ED6B
    .byte $03,$DE,$B0,$04,$BD,$B0,$04,$29,$0F,$9D,$B0,$04,$A8,$B9,$4B,$ED  ; $ED7B
    .byte $9D,$20,$04,$60  ; $ED8B

sub_1F_ED8F:
    LDA $0528,X                  ; $ED8F  BD 28 05
    BPL loc_1F_EDF4              ; $ED92  10 60
    LDA $0390,X                  ; $ED94  BD 90 03
    BNE loc_1F_EDF4              ; $ED97  D0 5B
    STY $00                      ; $ED99  84 00
    LDY #$17                     ; $ED9B  A0 17
    STY $73                      ; $ED9D  84 73

loc_1F_ED9F:
    LDA $0300,Y                  ; $ED9F  B9 00 03
    BEQ loc_1F_EDEC              ; $EDA2  F0 48
    LDA $0390,Y                  ; $EDA4  B9 90 03
    BNE loc_1F_EDEC              ; $EDA7  D0 43
    LDA $0528,Y                  ; $EDA9  B9 28 05
    AND #$04                     ; $EDAC  29 04
    BNE loc_1F_EDEC              ; $EDAE  D0 3C
    LDA $0528,Y                  ; $EDB0  B9 28 05
    AND #$03                     ; $EDB3  29 03
    BEQ loc_1F_EDEC              ; $EDB5  F0 35
    AND #$01                     ; $EDB7  29 01
    BEQ loc_1F_EDC0              ; $EDB9  F0 05
    LDA $03F0,X                  ; $EDBB  BD F0 03
    BPL loc_1F_EDEC              ; $EDBE  10 2C

loc_1F_EDC0:
    JSR sub_1F_EE4F              ; $EDC0  20 4F EE
    BNE loc_1F_EDEC              ; $EDC3  D0 27
    JSR sub_1F_EE70              ; $EDC5  20 70 EE
    BCC loc_1F_EDD1              ; $EDC8  90 07
    LDA $0528,Y                  ; $EDCA  B9 28 05
    AND #$01                     ; $EDCD  29 01
    BNE loc_1F_EDEC              ; $EDCF  D0 1B

loc_1F_EDD1:
    LDA $10                      ; $EDD1  A5 10
    CMP $13                      ; $EDD3  C5 13
    BCS loc_1F_EDEC              ; $EDD5  B0 15
    LDA $12                      ; $EDD7  A5 12
    SEC                          ; $EDD9  38
    SBC $11                      ; $EDDA  E5 11
    BCC loc_1F_EDEC              ; $EDDC  90 0E
    STA $11                      ; $EDDE  85 11
    CMP #$08                     ; $EDE0  C9 08
    BCC loc_1F_EDE8              ; $EDE2  90 04
    LDA #$08                     ; $EDE4  A9 08
    STA $11                      ; $EDE6  85 11

loc_1F_EDE8:
    LDY $00                      ; $EDE8  A4 00
    SEC                          ; $EDEA  38
    RTS                          ; $EDEB  60


loc_1F_EDEC:
    DEC $73                      ; $EDEC  C6 73
    LDY $73                      ; $EDEE  A4 73
    BNE loc_1F_ED9F              ; $EDF0  D0 AD
    LDY $00                      ; $EDF2  A4 00

loc_1F_EDF4:
    CLC                          ; $EDF4  18
    RTS                          ; $EDF5  60


sub_1F_EDF6:
    LDA $0528,X                  ; $EDF6  BD 28 05
    BPL loc_1F_EE4D              ; $EDF9  10 52
    LDA $0390,X                  ; $EDFB  BD 90 03
    BNE loc_1F_EE4D              ; $EDFE  D0 4D
    STY $00                      ; $EE00  84 00
    LDY #$17                     ; $EE02  A0 17
    STY $01                      ; $EE04  84 01

loc_1F_EE06:
    LDA $0300,Y                  ; $EE06  B9 00 03
    BEQ loc_1F_EE45              ; $EE09  F0 3A
    CMP #$02                     ; $EE0B  C9 02
    BEQ loc_1F_EE45              ; $EE0D  F0 36
    LDA $0390,Y                  ; $EE0F  B9 90 03
    BNE loc_1F_EE45              ; $EE12  D0 31
    LDA $0528,Y                  ; $EE14  B9 28 05
    AND #$04                     ; $EE17  29 04
    BNE loc_1F_EE45              ; $EE19  D0 2A
    LDA $0528,Y                  ; $EE1B  B9 28 05
    AND #$02                     ; $EE1E  29 02
    BEQ loc_1F_EE45              ; $EE20  F0 23
    JSR sub_1F_EE4F              ; $EE22  20 4F EE
    BNE loc_1F_EE45              ; $EE25  D0 1E
    JSR sub_1F_EE70              ; $EE27  20 70 EE
    LDA $11                      ; $EE2A  A5 11
    CMP $12                      ; $EE2C  C5 12
    BCS loc_1F_EE45              ; $EE2E  B0 15
    LDA $13                      ; $EE30  A5 13
    SEC                          ; $EE32  38
    SBC $10                      ; $EE33  E5 10
    BCC loc_1F_EE45              ; $EE35  90 0E
    STA $10                      ; $EE37  85 10
    CMP #$08                     ; $EE39  C9 08
    BCC loc_1F_EE41              ; $EE3B  90 04
    LDA #$08                     ; $EE3D  A9 08
    STA $10                      ; $EE3F  85 10

loc_1F_EE41:
    LDY $00                      ; $EE41  A4 00
    SEC                          ; $EE43  38
    RTS                          ; $EE44  60


loc_1F_EE45:
    DEC $01                      ; $EE45  C6 01
    LDY $01                      ; $EE47  A4 01
    BNE loc_1F_EE06              ; $EE49  D0 BB
    LDY $00                      ; $EE4B  A4 00

loc_1F_EE4D:
    CLC                          ; $EE4D  18
    RTS                          ; $EE4E  60


sub_1F_EE4F:
    LDA $0330                    ; $EE4F  AD 30 03
    SEC                          ; $EE52  38
    SBC $0330,Y                  ; $EE53  F9 30 03
    STA $10                      ; $EE56  85 10
    LDA $0348                    ; $EE58  AD 48 03
    SBC $0348,Y                  ; $EE5B  F9 48 03
    BCS loc_1F_EE6F              ; $EE5E  B0 0F
    PHA                          ; $EE60  48
    LDA $10                      ; $EE61  A5 10
    EOR #$FF                     ; $EE63  49 FF
    ADC #$01                     ; $EE65  69 01
    STA $10                      ; $EE67  85 10
    PLA                          ; $EE69  68
    EOR #$FF                     ; $EE6A  49 FF
    ADC #$00                     ; $EE6C  69 00
    CLC                          ; $EE6E  18

loc_1F_EE6F:
    RTS                          ; $EE6F  60


sub_1F_EE70:
    LDA $0408,Y                  ; $EE70  B9 08 04
    AND #$3F                     ; $EE73  29 3F
    TAX                          ; $EE75  AA
    LDA $F0B1,X                  ; $EE76  BD B1 F0
    STA $12                      ; $EE79  85 12
    LDA $F0F1,X                  ; $EE7B  BD F1 F0
    STA $13                      ; $EE7E  85 13
    LDA $30                      ; $EE80  A5 30
    CMP #$02                     ; $EE82  C9 02
    BNE loc_1F_EE8C              ; $EE84  D0 06
    LDA $12                      ; $EE86  A5 12
    SBC #$02                     ; $EE88  E9 02
    STA $12                      ; $EE8A  85 12

loc_1F_EE8C:
    LDA $0378                    ; $EE8C  AD 78 03
    SEC                          ; $EE8F  38
    SBC $0378,Y                  ; $EE90  F9 78 03
    BCS loc_1F_EE9A              ; $EE93  B0 05
    EOR #$FF                     ; $EE95  49 FF
    ADC #$01                     ; $EE97  69 01
    CLC                          ; $EE99  18

loc_1F_EE9A:
    STA $11                      ; $EE9A  85 11
    PHP                          ; $EE9C  08
    BCC loc_1F_EEAB              ; $EE9D  90 0C
    LDA $30                      ; $EE9F  A5 30
    CMP #$02                     ; $EEA1  C9 02
    BNE loc_1F_EEAB              ; $EEA3  D0 06
    LDA $12                      ; $EEA5  A5 12
    SBC #$04                     ; $EEA7  E9 04
    STA $12                      ; $EEA9  85 12

loc_1F_EEAB:
    LDX #$00                     ; $EEAB  A2 00
    PLP                          ; $EEAD  28
    RTS                          ; $EEAE  60


sub_1F_EEAF:
    LDA $12                      ; $EEAF  A5 12
    AND #$0F                     ; $EEB1  29 0F
    STA $12                      ; $EEB3  85 12
    LDA $0330,X                  ; $EEB5  BD 30 03
    SEC                          ; $EEB8  38
    SBC $12                      ; $EEB9  E5 12
    STA $0330,X                  ; $EEBB  9D 30 03
    LDA $0348,X                  ; $EEBE  BD 48 03
    SBC #$00                     ; $EEC1  E9 00
    STA $0348,X                  ; $EEC3  9D 48 03
    RTS                          ; $EEC6  60


sub_1F_EEC7:
    LDA $12                      ; $EEC7  A5 12
    AND #$0F                     ; $EEC9  29 0F
    EOR #$0F                     ; $EECB  49 0F
    SEC                          ; $EECD  38
    ADC $0330,X                  ; $EECE  7D 30 03
    STA $0330,X                  ; $EED1  9D 30 03
    LDA $0348,X                  ; $EED4  BD 48 03
    ADC #$00                     ; $EED7  69 00
    STA $0348,X                  ; $EED9  9D 48 03
    RTS                          ; $EEDC  60


sub_1F_EEDD:
    LDA $11                      ; $EEDD  A5 11
    AND #$0F                     ; $EEDF  29 0F
    EOR #$0F                     ; $EEE1  49 0F
    CLC                          ; $EEE3  18
    ADC $0378,X                  ; $EEE4  7D 78 03
    STA $0378,X                  ; $EEE7  9D 78 03
    CMP #$F0                     ; $EEEA  C9 F0
    BCC loc_1F_EEF6              ; $EEEC  90 08
    ADC #$0F                     ; $EEEE  69 0F
    STA $0378,X                  ; $EEF0  9D 78 03
    INC $0390,X                  ; $EEF3  FE 90 03

loc_1F_EEF6:
    RTS                          ; $EEF6  60


sub_1F_EEF7:
    LDA $11                      ; $EEF7  A5 11
    PHA                          ; $EEF9  48
    AND #$0F                     ; $EEFA  29 0F
    STA $11                      ; $EEFC  85 11
    LDA $0378,X                  ; $EEFE  BD 78 03
    SEC                          ; $EF01  38
    SBC $11                      ; $EF02  E5 11
    STA $0378,X                  ; $EF04  9D 78 03
    BCS loc_1F_EF11              ; $EF07  B0 08
    SBC #$0F                     ; $EF09  E9 0F
    STA $0378,X                  ; $EF0B  9D 78 03
    DEC $0390,X                  ; $EF0E  DE 90 03

loc_1F_EF11:
    PLA                          ; $EF11  68
    STA $11                      ; $EF12  85 11
    RTS                          ; $EF14  60


sub_1F_EF15:
    SEC                          ; $EF15  38
    LDA $0330,X                  ; $EF16  BD 30 03
    SBC $10                      ; $EF19  E5 10
    STA $0330,X                  ; $EF1B  9D 30 03
    LDA $0348,X                  ; $EF1E  BD 48 03
    SBC #$00                     ; $EF21  E9 00
    STA $0348,X                  ; $EF23  9D 48 03
    JMP loc_1F_EF3A              ; $EF26  4C 3A EF


sub_1F_EF29:
    CLC                          ; $EF29  18
    LDA $0330,X                  ; $EF2A  BD 30 03
    ADC $10                      ; $EF2D  65 10
    STA $0330,X                  ; $EF2F  9D 30 03
    LDA $0348,X                  ; $EF32  BD 48 03
    ADC #$00                     ; $EF35  69 00
    STA $0348,X                  ; $EF37  9D 48 03

loc_1F_EF3A:
    SEC                          ; $EF3A  38
    LDA $02                      ; $EF3B  A5 02
    SBC $0330,X                  ; $EF3D  FD 30 03
    STA $02                      ; $EF40  85 02
    LDA $03                      ; $EF42  A5 03
    SBC $0348,X                  ; $EF44  FD 48 03
    ORA $02                      ; $EF47  05 02
    RTS                          ; $EF49  60


sub_1F_EF4A:
    SEC                          ; $EF4A  38
    LDA $0378,X                  ; $EF4B  BD 78 03
    SBC $11                      ; $EF4E  E5 11
    STA $0378,X                  ; $EF50  9D 78 03
    BCS loc_1F_EF77              ; $EF53  B0 22
    SBC #$0F                     ; $EF55  E9 0F
    STA $0378,X                  ; $EF57  9D 78 03
    DEC $0390,X                  ; $EF5A  DE 90 03
    JMP loc_1F_EF77              ; $EF5D  4C 77 EF


sub_1F_EF60:
    CLC                          ; $EF60  18
    LDA $0378,X                  ; $EF61  BD 78 03
    ADC $11                      ; $EF64  65 11
    STA $0378,X                  ; $EF66  9D 78 03
    BCS loc_1F_EF74              ; $EF69  B0 09
    CMP #$F0                     ; $EF6B  C9 F0
    BCC loc_1F_EF77              ; $EF6D  90 08
    ADC #$0F                     ; $EF6F  69 0F
    STA $0378,X                  ; $EF71  9D 78 03

loc_1F_EF74:
    INC $0390,X                  ; $EF74  FE 90 03

loc_1F_EF77:
    SEC                          ; $EF77  38
    LDA $02                      ; $EF78  A5 02
    SBC $0378,X                  ; $EF7A  FD 78 03
    STA $02                      ; $EF7D  85 02
    LDA $03                      ; $EF7F  A5 03
    SBC $0390,X                  ; $EF81  FD 90 03
    ORA $02                      ; $EF84  05 02
    RTS                          ; $EF86  60


sub_1F_EF87:
    SEC                          ; $EF87  38
    LDA $0528                    ; $EF88  AD 28 05
    BPL loc_1F_EFF7              ; $EF8B  10 6A
    LDA $0390                    ; $EF8D  AD 90 03
    ORA $0390,X                  ; $EF90  1D 90 03
    BNE loc_1F_EFF7              ; $EF93  D0 62
    LDA $0528,X                  ; $EF95  BD 28 05
    BPL loc_1F_EFF7              ; $EF98  10 5D
    AND #$04                     ; $EF9A  29 04
    BNE loc_1F_EFF7              ; $EF9C  D0 59
    LDA $0408,X                  ; $EF9E  BD 08 04
    AND #$3F                     ; $EFA1  29 3F
    TAY                          ; $EFA3  A8
    LDA $0330                    ; $EFA4  AD 30 03
    SEC                          ; $EFA7  38
    SBC $0330,X                  ; $EFA8  FD 30 03
    PHA                          ; $EFAB  48
    LDA $0348                    ; $EFAC  AD 48 03
    SBC $0348,X                  ; $EFAF  FD 48 03
    STA $00                      ; $EFB2  85 00
    PLA                          ; $EFB4  68
    BCS loc_1F_EFC5              ; $EFB5  B0 0E
    EOR #$FF                     ; $EFB7  49 FF
    ADC #$01                     ; $EFB9  69 01
    PHA                          ; $EFBB  48
    LDA $00                      ; $EFBC  A5 00
    EOR #$FF                     ; $EFBE  49 FF
    ADC #$00                     ; $EFC0  69 00
    STA $00                      ; $EFC2  85 00
    PLA                          ; $EFC4  68

loc_1F_EFC5:
    CMP $F0F1,Y                  ; $EFC5  D9 F1 F0
    BCS loc_1F_EFF7              ; $EFC8  B0 2D
    SEC                          ; $EFCA  38
    LDA $00                      ; $EFCB  A5 00
    BNE loc_1F_EFF7              ; $EFCD  D0 28
    LDA $F0B1,Y                  ; $EFCF  B9 B1 F0
    STA $00                      ; $EFD2  85 00
    LDA $0558                    ; $EFD4  AD 58 05
    CMP #$14                     ; $EFD7  C9 14
    BEQ loc_1F_EFE1              ; $EFD9  F0 06
    LDA $30                      ; $EFDB  A5 30
    CMP #$02                     ; $EFDD  C9 02
    BNE loc_1F_EFE8              ; $EFDF  D0 07

loc_1F_EFE1:
    LDA $00                      ; $EFE1  A5 00
    SEC                          ; $EFE3  38
    SBC #$07                     ; $EFE4  E9 07
    STA $00                      ; $EFE6  85 00

loc_1F_EFE8:
    LDA $0378                    ; $EFE8  AD 78 03
    SEC                          ; $EFEB  38
    SBC $0378,X                  ; $EFEC  FD 78 03
    BCS loc_1F_EFF5              ; $EFEF  B0 04
    EOR #$FF                     ; $EFF1  49 FF
    ADC #$01                     ; $EFF3  69 01

loc_1F_EFF5:
    CMP $00                      ; $EFF5  C5 00

loc_1F_EFF7:
    RTS                          ; $EFF7  60


sub_1F_EFF8:
    SEC                          ; $EFF8  38
    LDA #$01                     ; $EFF9  A9 01
    STA $10                      ; $EFFB  85 10
    LDA $0300,X                  ; $EFFD  BD 00 03
    BEQ loc_1F_EFF7              ; $F000  F0 F5
    LDA $0528,X                  ; $F002  BD 28 05
    BPL loc_1F_EFF7              ; $F005  10 F0
    AND #$04                     ; $F007  29 04
    BNE loc_1F_EFF7              ; $F009  D0 EC
    LDA $0390,X                  ; $F00B  BD 90 03
    BNE loc_1F_EFF7              ; $F00E  D0 E7
    LDY #$03                     ; $F010  A0 03

loc_1F_F012:
    LDA $0300,Y                  ; $F012  B9 00 03
    BEQ loc_1F_F068              ; $F015  F0 51
    LDA $0528,Y                  ; $F017  B9 28 05
    BPL loc_1F_F068              ; $F01A  10 4C
    LDA $0390,Y                  ; $F01C  B9 90 03
    BNE loc_1F_F068              ; $F01F  D0 47
    LDA $0300,Y                  ; $F021  B9 00 03
    CMP #$70                     ; $F024  C9 70
    BCC loc_1F_F068              ; $F026  90 40
    JSR sub_1F_F06D              ; $F028  20 6D F0
    LDA $0330,Y                  ; $F02B  B9 30 03
    SEC                          ; $F02E  38
    SBC $0330,X                  ; $F02F  FD 30 03
    PHA                          ; $F032  48
    LDA $0348,Y                  ; $F033  B9 48 03
    SBC $0348,X                  ; $F036  FD 48 03
    STA $02                      ; $F039  85 02
    PLA                          ; $F03B  68
    BCS loc_1F_F04C              ; $F03C  B0 0E
    EOR #$FF                     ; $F03E  49 FF
    ADC #$01                     ; $F040  69 01
    PHA                          ; $F042  48
    LDA $02                      ; $F043  A5 02
    EOR #$FF                     ; $F045  49 FF
    ADC #$00                     ; $F047  69 00
    STA $02                      ; $F049  85 02
    PLA                          ; $F04B  68

loc_1F_F04C:
    CMP $01                      ; $F04C  C5 01
    BCS loc_1F_F068              ; $F04E  B0 18
    LDA $02                      ; $F050  A5 02
    BNE loc_1F_F068              ; $F052  D0 14
    LDA $0378,Y                  ; $F054  B9 78 03
    SEC                          ; $F057  38
    SBC $0378,X                  ; $F058  FD 78 03
    BCS loc_1F_F061              ; $F05B  B0 04
    EOR #$FF                     ; $F05D  49 FF
    ADC #$01                     ; $F05F  69 01

loc_1F_F061:
    CMP $00                      ; $F061  C5 00
    BCS loc_1F_F068              ; $F063  B0 03
    STY $10                      ; $F065  84 10
    RTS                          ; $F067  60


loc_1F_F068:
    DEY                          ; $F068  88
    BNE loc_1F_F012              ; $F069  D0 A7
    SEC                          ; $F06B  38
    RTS                          ; $F06C  60


sub_1F_F06D:
    STY $02                      ; $F06D  84 02
    LDA $0408,X                  ; $F06F  BD 08 04
    AND #$3F                     ; $F072  29 3F
    TAY                          ; $F074  A8
    LDA $F0B1,Y                  ; $F075  B9 B1 F0
    STA $00                      ; $F078  85 00
    LDA $F0F1,Y                  ; $F07A  B9 F1 F0
    STA $01                      ; $F07D  85 01
    LDY $02                      ; $F07F  A4 02
    LDA $32                      ; $F081  A5 32
    CMP #$01                     ; $F083  C9 01
    BEQ loc_1F_F092              ; $F085  F0 0B
    LDA $0300,Y                  ; $F087  B9 00 03
    CMP #$C2                     ; $F08A  C9 C2
    BNE loc_1F_F09C              ; $F08C  D0 0E
    LDY #$13                     ; $F08E  A0 13
    BNE loc_1F_F09E              ; $F090  D0 0C

loc_1F_F092:
    LDA $0540,Y                  ; $F092  B9 40 05
    TAY                          ; $F095  A8
    LDA $F159,Y                  ; $F096  B9 59 F1
    TAY                          ; $F099  A8
    BNE loc_1F_F09E              ; $F09A  D0 02

loc_1F_F09C:
    LDY $5B                      ; $F09C  A4 5B

loc_1F_F09E:
    LDA $00                      ; $F09E  A5 00
    SEC                          ; $F0A0  38
    SBC $F131,Y                  ; $F0A1  F9 31 F1
    STA $00                      ; $F0A4  85 00
    LDA $01                      ; $F0A6  A5 01
    SEC                          ; $F0A8  38
    SBC $F145,Y                  ; $F0A9  F9 45 F1
    STA $01                      ; $F0AC  85 01
    LDY $02                      ; $F0AE  A4 02
    RTS                          ; $F0B0  60

    .byte $14,$12,$74,$14,$3C,$10,$0F,$0E,$16,$1C,$0E,$18,$18,$14,$12,$20  ; $F0B1
    .byte $18,$10,$1A,$1C,$20,$24,$12,$1C,$28,$24,$0E,$12,$18,$14,$14,$14  ; $F0C1
    .byte $14,$1C,$10,$0E,$1C,$34,$1C,$4C,$20,$1C,$18,$54,$54,$24,$24,$20  ; $F0D1
    .byte $14,$14,$1C,$1C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C  ; $F0E1
    .byte $10,$0E,$10,$78,$10,$0C,$0B,$0A,$12,$14,$0E,$14,$12,$14,$10,$14  ; $F0F1
    .byte $0E,$10,$10,$0E,$0E,$0E,$0C,$12,$0E,$14,$10,$0A,$0A,$38,$30,$28  ; $F101
    .byte $0B,$20,$14,$0B,$18,$18,$48,$30,$0C,$38,$28,$10,$28,$20,$18,$1C  ; $F111
    .byte $0E,$20,$24,$28,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08  ; $F121
    .byte $0A,$08,$08,$04,$08,$0A,$04,$94,$0A,$F8,$0A,$0A,$08,$06,$00,$08  ; $F131
    .byte $04,$00,$FC,$00,$05,$06,$FC,$05,$00,$FC,$00,$88,$05,$F4,$05,$05  ; $F141
    .byte $04,$02,$00,$04,$06,$06,$06,$FC,$01,$10,$11,$12,$11,$10  ; $F151

sub_1F_F15F:
    LDX #$08                     ; $F15F  A2 08

loc_1F_F161:
    LDA $0300,X                  ; $F161  BD 00 03
    BEQ loc_1F_F16D              ; $F164  F0 07
    INX                          ; $F166  E8
    CPX #$18                     ; $F167  E0 18
    BNE loc_1F_F161              ; $F169  D0 F6
    SEC                          ; $F16B  38
    RTS                          ; $F16C  60


loc_1F_F16D:
    CLC                          ; $F16D  18
    RTS                          ; $F16E  60


sub_1F_F16F:
    LDY #$08                     ; $F16F  A0 08

loc_1F_F171:
    LDA $0300,Y                  ; $F171  B9 00 03
    BEQ loc_1F_F17D              ; $F174  F0 07
    INY                          ; $F176  C8
    CPY #$18                     ; $F177  C0 18
    BNE loc_1F_F171              ; $F179  D0 F6
    SEC                          ; $F17B  38
    RTS                          ; $F17C  60


loc_1F_F17D:
    CLC                          ; $F17D  18
    RTS                          ; $F17E  60

    .byte $20,$94,$EC,$85,$0A,$A9,$01,$B0,$02,$A9,$02,$85,$0C,$20,$76,$EC  ; $F17F
    .byte $85,$0B,$A9,$04,$B0,$02,$A9,$08,$05,$0C,$85,$0C,$A5,$0B,$C5,$0A  ; $F18F
    .byte $B0,$33,$A5,$02,$9D,$A8,$03,$A5,$03,$9D,$C0,$03,$A5,$0A,$85,$01  ; $F19F
    .byte $A9,$00,$85,$00,$20,$2D,$F2,$A5,$04,$85,$02,$A5,$05,$85,$03,$A5  ; $F1AF
    .byte $0B,$85,$01,$A9,$00,$85,$00,$20,$2D,$F2,$A5,$04,$9D,$D8,$03,$A5  ; $F1BF
    .byte $05,$9D,$F0,$03,$60,$A5,$02,$9D,$D8,$03,$A5,$03,$9D,$F0,$03,$A5  ; $F1CF
    .byte $0B,$85,$01,$A9,$00,$85,$00,$20,$2D,$F2,$A5,$04,$85,$02,$A5,$05  ; $F1DF
    .byte $85,$03,$A5,$0A,$85,$01,$A9,$00,$85,$00,$20,$2D,$F2,$A5,$04,$9D  ; $F1EF
    .byte $A8,$03,$A5,$05,$9D,$C0,$03,$60  ; $F1FF

sub_1F_F207:
    LDA #$00                     ; $F207  A9 00
    STA $02                      ; $F209  85 02
    STA $03                      ; $F20B  85 03
    LDA $00                      ; $F20D  A5 00
    ORA $01                      ; $F20F  05 01
    BNE loc_1F_F216              ; $F211  D0 03
    STA $02                      ; $F213  85 02
    RTS                          ; $F215  60


loc_1F_F216:
    LDY #$08                     ; $F216  A0 08

loc_1F_F218:
    ASL $02                      ; $F218  06 02
    ROL $00                      ; $F21A  26 00
    ROL $03                      ; $F21C  26 03
    SEC                          ; $F21E  38
    LDA $03                      ; $F21F  A5 03
    SBC $01                      ; $F221  E5 01
    BCC loc_1F_F229              ; $F223  90 04
    STA $03                      ; $F225  85 03
    INC $02                      ; $F227  E6 02

loc_1F_F229:
    DEY                          ; $F229  88
    BNE loc_1F_F218              ; $F22A  D0 EC
    RTS                          ; $F22C  60

    .byte $A9,$00,$85,$06,$85,$07,$A5,$00,$05,$01,$05,$02,$05,$03,$D0,$05  ; $F22D
    .byte $85,$04,$85,$05,$60,$86,$09,$A0,$10,$06,$06,$26,$00,$26,$01,$26  ; $F23D
    .byte $07,$38,$A5,$01,$E5,$02,$AA,$A5,$07,$E5,$03,$90,$06,$86,$01,$85  ; $F24D
    .byte $07,$E6,$06,$88,$D0,$E3,$A5,$06,$85,$04,$A5,$00,$85,$05,$A6,$09  ; $F25D
    .byte $60,$85,$00,$84,$01,$A9,$00,$85,$02,$85,$03,$85,$04,$A0,$08,$46  ; $F26D
    .byte $01,$90,$0D,$18,$A5,$00,$65,$02,$85,$02,$A5,$04,$65,$03,$85,$03  ; $F27D
    .byte $06,$00,$66,$04,$88,$D0,$E8,$A5,$02,$60  ; $F28D

sub_1F_F297:
    LDA $0438,X                  ; $F297  BD 38 04
    AND #$07                     ; $F29A  29 07
    TAY                          ; $F29C  A8
    LDA $F2B2,Y                  ; $F29D  B9 B2 F2
    STA $00                      ; $F2A0  85 00
    LDA $0438,X                  ; $F2A2  BD 38 04
    LSR A                        ; $F2A5  4A
    LSR A                        ; $F2A6  4A
    LSR A                        ; $F2A7  4A
    TAY                          ; $F2A8  A8
    LDA $0100,Y                  ; $F2A9  B9 00 01
    ORA $00                      ; $F2AC  05 00
    STA $0100,Y                  ; $F2AE  99 00 01
    RTS                          ; $F2B1  60

    .byte $01,$02,$04,$08,$10,$20,$40,$80,$FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F  ; $F2B2
    .byte $00,$20  ; $F2C2

sub_1F_F2C4:
    LDA #$FF                     ; $F2C4  A9 FF
    STA $0438,X                  ; $F2C6  9D 38 04
    LDA #$00                     ; $F2C9  A9 00
    STA $05A0,X                  ; $F2CB  9D A0 05
    STA $0300,X                  ; $F2CE  9D 00 03
    STA $05B8,X                  ; $F2D1  9D B8 05
    STA $0450,X                  ; $F2D4  9D 50 04
    STA $0408,X                  ; $F2D7  9D 08 04
    STA $0468,X                  ; $F2DA  9D 68 04
    STA $0480,X                  ; $F2DD  9D 80 04
    STA $0498,X                  ; $F2E0  9D 98 04
    STA $04B0,X                  ; $F2E3  9D B0 04
    STA $04C8,X                  ; $F2E6  9D C8 04
    STA $04E0,X                  ; $F2E9  9D E0 04
    STA $04F8,X                  ; $F2EC  9D F8 04
    STA $0510,X                  ; $F2EF  9D 10 05
    RTS                          ; $F2F2  60


sub_1F_F2F3:
    LDA $0300,Y                  ; $F2F3  B9 00 03
    CMP #$C5                     ; $F2F6  C9 C5
    BEQ loc_1F_F32C              ; $F2F8  F0 32
    CMP #$79                     ; $F2FA  C9 79
    BEQ loc_1F_F32C              ; $F2FC  F0 2E

sub_1F_F2FE:
    LDA #$FF                     ; $F2FE  A9 FF
    STA $0438,Y                  ; $F300  99 38 04
    LDA #$00                     ; $F303  A9 00
    STA $05A0,Y                  ; $F305  99 A0 05
    STA $0300,Y                  ; $F308  99 00 03
    STA $05B8,Y                  ; $F30B  99 B8 05
    STA $0450,Y                  ; $F30E  99 50 04
    STA $0408,Y                  ; $F311  99 08 04
    STA $0468,Y                  ; $F314  99 68 04
    STA $0480,Y                  ; $F317  99 80 04
    STA $0498,Y                  ; $F31A  99 98 04
    STA $04B0,Y                  ; $F31D  99 B0 04
    STA $04C8,Y                  ; $F320  99 C8 04
    STA $04E0,Y                  ; $F323  99 E0 04
    STA $04F8,Y                  ; $F326  99 F8 04
    STA $0510,Y                  ; $F329  99 10 05

loc_1F_F32C:
    RTS                          ; $F32C  60


sub_1F_F32D:
    LDA $F5                      ; $F32D  A5 F5
    PHA                          ; $F32F  48
    LDA $F6                      ; $F330  A5 F6
    PHA                          ; $F332  48
    LDA #$00                     ; $F333  A9 00
    STA $F5                      ; $F335  85 F5
    LDA $26                      ; $F337  A5 26
    STA $F6                      ; $F339  85 F6
    JSR sub_1F_FF43              ; $F33B  20 43 FF
    JSR $8000                    ; $F33E  20 00 80
    PLA                          ; $F341  68
    STA $F6                      ; $F342  85 F6
    PLA                          ; $F344  68
    STA $F5                      ; $F345  85 F5
    JMP sub_1F_FF43              ; $F347  4C 43 FF


sub_1F_F34A:
    LDA $F5                      ; $F34A  A5 F5
    PHA                          ; $F34C  48
    LDA $F6                      ; $F34D  A5 F6
    PHA                          ; $F34F  48
    LDA #$04                     ; $F350  A9 04
    STA $9F                      ; $F352  85 9F
    JSR sub_1E_C38F              ; $F354  20 8F C3
    JSR sub_1E_DF5E              ; $F357  20 5E DF
    PLA                          ; $F35A  68
    STA $F6                      ; $F35B  85 F6
    PLA                          ; $F35D  68
    STA $F5                      ; $F35E  85 F5
    JMP sub_1F_FF43              ; $F360  4C 43 FF


sub_1F_F363:
    INC $95                      ; $F363  E6 95
    JSR sub_1F_F34A              ; $F365  20 4A F3
    LDA #$00                     ; $F368  A9 00
    STA $95                      ; $F36A  85 95
    JMP sub_1F_FF22              ; $F36C  4C 22 FF

    .byte $A5,$F5,$48,$A5,$F6,$48,$E6,$95,$A2,$44,$86,$9F,$20,$91,$C3,$20  ; $F36F
    .byte $5E,$DF,$A9,$00,$85,$95,$68,$85,$F6,$68,$85,$F5,$20,$43,$FF,$4C  ; $F37F
    .byte $22,$FF  ; $F38F

loc_1F_F391:
    LDA $F5                      ; $F391  A5 F5
    PHA                          ; $F393  48
    LDA $F6                      ; $F394  A5 F6
    PHA                          ; $F396  48
    INC $95                      ; $F397  E6 95
    LDX #$00                     ; $F399  A2 00
    LDA #$F8                     ; $F39B  A9 F8

loc_1F_F39D:
    STA $0200,X                  ; $F39D  9D 00 02
    INX                          ; $F3A0  E8
    INX                          ; $F3A1  E8
    INX                          ; $F3A2  E8
    INX                          ; $F3A3  E8
    CPX #$C0                     ; $F3A4  E0 C0
    BNE loc_1F_F39D              ; $F3A6  D0 F5
    LDX #$04                     ; $F3A8  A2 04
    STX $9F                      ; $F3AA  86 9F
    JSR sub_1E_DF5E              ; $F3AC  20 5E DF
    LDA #$00                     ; $F3AF  A9 00
    STA $95                      ; $F3B1  85 95
    PLA                          ; $F3B3  68
    STA $F6                      ; $F3B4  85 F6
    PLA                          ; $F3B6  68
    STA $F5                      ; $F3B7  85 F5
    JSR sub_1F_FF43              ; $F3B9  20 43 FF
    JMP sub_1F_FF22              ; $F3BC  4C 22 FF


sub_1F_F3BF:
    LDY #$03                     ; $F3BF  A0 03

loc_1F_F3C1:
    LDA $32                      ; $F3C1  A5 32
    BEQ loc_1F_F3D4              ; $F3C3  F0 0F
    LDA $0630,Y                  ; $F3C5  B9 30 06
    STA $0610,Y                  ; $F3C8  99 10 06
    LDA $0634,Y                  ; $F3CB  B9 34 06
    STA $0614,Y                  ; $F3CE  99 14 06
    JMP loc_1F_F3E6              ; $F3D1  4C E6 F3


loc_1F_F3D4:
    LDA $D4B2,Y                  ; $F3D4  B9 B2 D4
    STA $0630,Y                  ; $F3D7  99 30 06
    STA $0610,Y                  ; $F3DA  99 10 06
    LDA $D4B6,Y                  ; $F3DD  B9 B6 D4
    STA $0634,Y                  ; $F3E0  99 34 06
    STA $0614,Y                  ; $F3E3  99 14 06

loc_1F_F3E6:
    DEY                          ; $F3E6  88
    BPL loc_1F_F3C1              ; $F3E7  10 D8
    LDA $0600                    ; $F3E9  AD 00 06
    STA $0610                    ; $F3EC  8D 10 06
    STY $18                      ; $F3EF  84 18
    RTS                          ; $F3F1  60


sub_1F_F3F2:
    LDA $30                      ; $F3F2  A5 30
    STA $00                      ; $F3F4  85 00
    LDA $2D                      ; $F3F6  A5 2D
    STA $01                      ; $F3F8  85 01
    LDA $2E                      ; $F3FA  A5 2E
    STA $02                      ; $F3FC  85 02
    LDA $32                      ; $F3FE  A5 32
    STA $03                      ; $F400  85 03
    LDA $50                      ; $F402  A5 50
    STA $04                      ; $F404  85 04
    LDA #$00                     ; $F406  A9 00
    LDY #$0F                     ; $F408  A0 0F

loc_1F_F40A:
    STA $0030,Y                  ; $F40A  99 30 00
    STA $0050,Y                  ; $F40D  99 50 00
    DEY                          ; $F410  88
    BPL loc_1F_F40A              ; $F411  10 F7
    STA $25                      ; $F413  85 25
    STA $AF                      ; $F415  85 AF
    STA $52                      ; $F417  85 52
    STA $43                      ; $F419  85 43
    STA $FC                      ; $F41B  85 FC
    STA $FD                      ; $F41D  85 FD
    STA $FA                      ; $F41F  85 FA
    STA $FB                      ; $F421  85 FB
    STA $05F0                    ; $F423  8D F0 05
    STA $05F1                    ; $F426  8D F1 05
    STA $05F2                    ; $F429  8D F2 05
    STA $05F3                    ; $F42C  8D F3 05
    STA $05D0                    ; $F42F  8D D0 05
    STA $2D                      ; $F432  85 2D
    STA $2E                      ; $F434  85 2E
    STA $2F                      ; $F436  85 2F
    LDY #$3F                     ; $F438  A0 3F

loc_1F_F43A:
    STA $06C0,Y                  ; $F43A  99 C0 06
    CPY #$1F                     ; $F43D  C0 1F
    BCS loc_1F_F444              ; $F43F  B0 03
    STA $0680,Y                  ; $F441  99 80 06

loc_1F_F444:
    DEY                          ; $F444  88
    BPL loc_1F_F43A              ; $F445  10 F3
    LDA $00                      ; $F447  A5 00
    STA $30                      ; $F449  85 30
    CMP #$16                     ; $F44B  C9 16
    BEQ loc_1F_F454              ; $F44D  F0 05
    CMP #$17                     ; $F44F  C9 17
    BEQ loc_1F_F454              ; $F451  F0 01
    RTS                          ; $F453  60


loc_1F_F454:
    LDA $01                      ; $F454  A5 01
    STA $2D                      ; $F456  85 2D
    LDA $02                      ; $F458  A5 02
    STA $2E                      ; $F45A  85 2E
    LDA $03                      ; $F45C  A5 03
    STA $32                      ; $F45E  85 32
    LDA $04                      ; $F460  A5 04
    STA $50                      ; $F462  85 50
    RTS                          ; $F464  60


sub_1F_F465:
    LDY #$1F                     ; $F465  A0 1F
    LDA #$00                     ; $F467  A9 00

loc_1F_F469:
    STA $0100,Y                  ; $F469  99 00 01
    DEY                          ; $F46C  88
    BPL loc_1F_F469              ; $F46D  10 FA
    RTS                          ; $F46F  60


sub_1F_F470:
    STY $00                      ; $F470  84 00
    STA $01                      ; $F472  85 01
    LDA $ED4B,Y                  ; $F474  B9 4B ED
    STA $0420,X                  ; $F477  9D 20 04
    LDA $00                      ; $F47A  A5 00
    AND #$07                     ; $F47C  29 07
    ORA $01                      ; $F47E  05 01
    TAY                          ; $F480  A8
    LDA $F49E,Y                  ; $F481  B9 9E F4
    STA $03A8,X                  ; $F484  9D A8 03
    LDA $F4EE,Y                  ; $F487  B9 EE F4
    STA $03C0,X                  ; $F48A  9D C0 03
    TYA                          ; $F48D  98
    EOR #$04                     ; $F48E  49 04
    TAY                          ; $F490  A8
    LDA $F49E,Y                  ; $F491  B9 9E F4
    STA $03D8,X                  ; $F494  9D D8 03
    LDA $F4EE,Y                  ; $F497  B9 EE F4
    STA $03F0,X                  ; $F49A  9D F0 03
    RTS                          ; $F49D  60

    .byte $00,$18,$2D,$3B,$40,$3B,$2D,$18,$00,$C3,$6A,$D9,$00,$D9,$6A,$C3  ; $F49E
    .byte $00,$87,$D4,$B2,$00,$B2,$D4,$87,$00,$9C,$21,$7A,$99,$7A,$21,$9C  ; $F4AE
    .byte $00,$61,$B5,$EC,$00,$EC,$B5,$61,$00,$25,$1F,$C5,$00,$C5,$1F,$25  ; $F4BE
    .byte $00,$E9,$89,$9E,$00,$9E,$89,$E9,$00,$30,$5A,$76,$80,$76,$5A,$30  ; $F4CE
    .byte $00,$F4,$C4,$4F,$80,$4F,$C4,$F4,$00,$0F,$A8,$64,$00,$64,$A8,$0F  ; $F4DE
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$02,$01,$01,$00  ; $F4EE
    .byte $00,$01,$02,$03,$04,$03,$02,$01,$00,$00,$01,$01,$01,$01,$01,$00  ; $F4FE
    .byte $00,$00,$00,$00,$01,$00,$00,$00,$00,$01,$02,$02,$03,$02,$02,$01  ; $F50E
    .byte $00,$01,$03,$04,$05,$04,$03,$01,$00,$00,$00,$00,$00,$00,$00,$00  ; $F51E
    .byte $00,$00,$01,$02,$02,$02,$01,$00,$00,$03,$05,$07,$08,$07,$05,$03  ; $F52E
    .byte $FF,$75,$FF,$55,$FF,$D5,$FF,$55,$FF,$DF,$F7,$FD,$FB,$55,$FF,$77  ; $F53E
    .byte $FE,$5D,$FF,$D5,$EF,$45,$FF,$CD,$FF,$D5,$FF,$D5,$FF,$D5,$FA,$7B  ; $F54E
    .byte $FF,$7F,$FF,$75,$FF,$F7,$FF,$D5,$FF,$D3,$FE,$75,$DF,$F7,$FB,$D7  ; $F55E
    .byte $FF,$55,$FF,$55,$FE,$C5,$F7,$77,$FE,$75,$FE,$7D,$7F,$5D,$7F,$DD  ; $F56E
    .byte $F7,$75,$7F,$7B,$FF,$DD,$FF,$41,$FF,$55,$FB,$55,$FB,$95,$FE,$7D  ; $F57E
    .byte $FF,$75,$FF,$CF,$FF,$F3,$FF,$5D,$FF,$F5,$FF,$67,$FF,$D7,$DF,$55  ; $F58E
    .byte $FF,$5F,$FF,$75,$FF,$D5,$F7,$DD,$9D,$DF,$FF,$55,$7F,$55,$FF,$5D  ; $F59E
    .byte $77,$35,$FF,$5F,$F2,$5D,$FF,$CD,$F7,$D7,$FF,$55,$7F,$55,$7F,$D5  ; $F5AE
    .byte $FB,$F7,$7F,$4D,$FF,$7D,$FE,$77,$FF,$FF,$FF,$7D,$FF,$55,$BF,$5D  ; $F5BE
    .byte $FF,$57,$F9,$D5,$FF,$75,$7F,$55,$FD,$57,$FF,$45,$FF,$77,$FF,$75  ; $F5CE
    .byte $EF,$F5,$FF,$35,$DF,$5F,$FF,$7D,$FB,$D7,$FF,$65,$FB,$DD,$BF,$B5  ; $F5DE
    .byte $FF,$7D,$FF,$7F,$FB,$DD,$FB,$5F,$FF,$D7,$FF,$75,$FF,$57,$FF,$D5  ; $F5EE
    .byte $FF,$75,$07,$01,$FF,$D1,$FF,$5D,$FF,$53,$FF,$DD,$FD,$77,$D7,$5F  ; $F5FE
    .byte $F7,$FF,$F7,$77,$FF,$57,$FF,$34,$FF,$55,$7F,$75,$DF,$57,$BF,$59  ; $F60E
    .byte $F7,$F1,$FD,$5D,$FB,$D5,$FF,$95,$DD,$D5,$FF,$75,$FF,$55,$FF,$FD  ; $F61E
    .byte $FF,$77,$BD,$DD,$FF,$FF,$FF,$55,$7F,$7D,$DF,$55,$FF,$D5,$FF,$75  ; $F62E
    .byte $FF,$55,$DF,$51,$BF,$5F,$FF,$77,$BF,$5D,$BF,$57,$7F,$5D,$FF,$5F  ; $F63E
    .byte $7F,$63,$FF,$57,$FE,$5F,$FF,$56,$FF,$D5,$FF,$77,$DF,$75,$FF,$7D  ; $F64E
    .byte $FB,$75,$FF,$F7,$DF,$F5,$FF,$5D,$FF,$57,$FF,$5D,$FF,$5B,$FF,$7F  ; $F65E
    .byte $FF,$57,$FF,$37,$DF,$57,$DF,$55,$FF,$D7,$FF,$77,$FF,$D7,$FF,$77  ; $F66E
    .byte $FD,$DD,$FE,$5D,$FF,$DC,$F7,$7D,$FF,$55,$FD,$55,$F6,$F5,$FF,$57  ; $F67E
    .byte $FE,$55,$FF,$57,$FE,$D7,$FF,$55,$7F,$73,$F7,$55,$FF,$D5,$DF,$4F  ; $F68E
    .byte $FF,$71,$EB,$E5,$FF,$55,$FF,$75,$FF,$D7,$FF,$57,$FF,$D5,$FF,$FD  ; $F69E
    .byte $7F,$D5,$FF,$75,$FF,$C7,$FD,$5D,$FA,$5D,$FF,$55,$FD,$55,$DF,$7D  ; $F6AE
    .byte $F7,$FD,$FF,$78,$FB,$57,$F9,$75,$FF,$75,$FF,$55,$F7,$77,$FF,$5D  ; $F6BE
    .byte $F7,$77,$FE,$D7,$FF,$D7,$FF,$5D,$FF,$45,$EE,$4D,$FF,$DD,$FF,$57  ; $F6CE
    .byte $FB,$D5,$FF,$7F,$FF,$45,$FD,$65,$FF,$C5,$FF,$57,$FF,$75,$FF,$5D  ; $F6DE
    .byte $FF,$77,$FF,$75,$FF,$C7,$FD,$DF,$7D,$75,$FF,$75,$F4,$59,$7F,$D5  ; $F6EE
    .byte $FF,$77,$FF,$55,$BF,$5D,$FF,$5D,$FB,$5F,$77,$F3,$FF,$55,$FF,$7D  ; $F6FE
    .byte $EF,$57,$FF,$57,$FF,$57,$F7,$5F,$FF,$57,$FF,$F5,$F9,$01,$DF,$D5  ; $F70E
    .byte $7D,$01,$FF,$5D,$FF,$77,$FF,$5D,$FF,$94,$EF,$DD,$FF,$7D,$FF,$54  ; $F71E
    .byte $FF,$57,$FF,$5F,$BE,$7D,$EF,$75,$FF,$55,$FF,$FF,$FD,$55,$DF,$71  ; $F72E
    .byte $FF,$55,$FF,$75,$FF,$67,$EF,$55,$FF,$75,$FF,$5D,$FF,$51,$F7,$55  ; $F73E
    .byte $FF,$DF,$FF,$75,$FD,$7F,$FF,$7D,$FF,$D5,$FF,$55,$FF,$5F,$DF,$5D  ; $F74E
    .byte $FD,$F5,$FF,$DD,$FF,$95,$FF,$57,$FF,$7D,$DF,$D5,$DB,$5F,$FF,$5F  ; $F75E
    .byte $FF,$7D,$FF,$5F,$FE,$55,$FF,$5D,$7E,$5F,$FF,$DF,$BF,$7D,$F7,$B7  ; $F76E
    .byte $BB,$F5,$FF,$7D,$FF,$75,$FF,$CD,$FF,$75,$FF,$15,$FF,$55,$FF,$65  ; $F77E
    .byte $EF,$C5,$EF,$57,$FF,$7E,$FF,$C5,$3F,$75,$FF,$D1,$FF,$FF,$FF,$7D  ; $F78E
    .byte $BF,$F5,$FF,$79,$FF,$5D,$FF,$D5,$FE,$F5,$FF,$31,$FF,$37,$FF,$57  ; $F79E
    .byte $FF,$75,$FF,$7D,$BF,$77,$FF,$7D,$EF,$F5,$FB,$5D,$EF,$DD,$FF,$73  ; $F7AE
    .byte $FF,$FD,$FB,$79,$DF,$D6,$FF,$55,$FF,$FD,$FF,$5F,$FF,$55,$FE,$59  ; $F7BE
    .byte $7F,$55,$FF,$57,$FF,$7E,$FF,$D7,$DF,$FF,$DF,$D7,$FF,$D3,$FF,$57  ; $F7CE
    .byte $FF,$75,$FF,$5D,$FF,$D5,$FF,$5D,$5F,$5D,$E7,$7D,$FF,$55,$FF,$F5  ; $F7DE
    .byte $FF,$5D,$FF,$55,$FF,$55,$F7,$5F,$FF,$F5,$F7,$55,$FF,$55,$FF,$71  ; $F7EE
    .byte $FF,$F5,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40  ; $F7FE
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$20  ; $F80E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00,$00  ; $F81E
    .byte $00,$00,$00,$00,$00,$40,$00,$00,$02,$22,$00,$00,$00,$00,$00,$00  ; $F82E
    .byte $00,$10,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$20,$40,$80,$00  ; $F83E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00  ; $F84E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $F85E
    .byte $00,$00,$00,$00,$00,$00,$00,$08,$00,$49,$00,$80,$00,$00,$82,$04  ; $F86E
    .byte $10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80,$00,$00,$00  ; $F87E
    .byte $80,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00,$10  ; $F88E
    .byte $00,$00,$00,$00,$00,$00,$02,$10,$00,$00,$80,$00,$00,$00,$00,$00  ; $F89E
    .byte $02,$00,$00,$00,$00,$80,$00,$00,$80,$00,$00,$00,$00,$20,$00,$00  ; $F8AE
    .byte $00,$01,$80,$00,$00,$00,$00,$00,$00,$04,$00,$00,$00,$80,$00,$00  ; $F8BE
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00  ; $F8CE
    .byte $00,$00,$20,$00,$00,$00,$00,$00,$00,$00,$00,$80,$00,$01,$00,$01  ; $F8DE
    .byte $02,$00,$02,$00,$00,$48,$00,$04,$01,$48,$08,$00,$00,$A0,$00,$10  ; $F8EE
    .byte $00,$44,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $F8FE
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $F90E
    .byte $00,$00,$00,$00,$00,$01,$00,$10,$00,$00,$00,$0A,$00,$00,$00,$00  ; $F91E
    .byte $00,$00,$00,$00,$02,$00,$08,$00,$00,$00,$02,$00,$08,$20,$00,$00  ; $F92E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00,$00,$00,$00,$00,$00  ; $F93E
    .byte $00,$00,$00,$00,$00,$10,$00,$00,$00,$40,$00,$00,$00,$80,$00,$00  ; $F94E
    .byte $00,$00,$00,$00,$08,$40,$00,$00,$08,$00,$00,$00,$00,$00,$00,$00  ; $F95E
    .byte $00,$00,$08,$0C,$02,$00,$00,$80,$80,$00,$00,$40,$00,$80,$20,$20  ; $F96E
    .byte $00,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00  ; $F97E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $F98E
    .byte $00,$00,$00,$00,$00,$02,$00,$08,$20,$00,$00,$80,$00,$00,$00,$04  ; $F99E
    .byte $00,$02,$00,$00,$00,$00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$00  ; $F9AE
    .byte $00,$10,$00,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $F9BE
    .byte $00,$00,$02,$81,$00,$00,$00,$00,$00,$08,$00,$00,$08,$02,$08,$00  ; $F9CE
    .byte $00,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00,$81  ; $F9DE
    .byte $00,$08,$00,$00,$00,$14,$00,$10,$00,$80,$00,$02,$00,$00,$22,$40  ; $F9EE
    .byte $00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00  ; $F9FE
    .byte $00,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FA0E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$08,$00,$00,$00,$00,$44,$00,$80  ; $FA1E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$80  ; $FA2E
    .byte $08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FA3E
    .byte $00,$00,$00,$20,$00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$00,$41  ; $FA4E
    .byte $00,$08,$00,$01,$08,$10,$00,$02,$00,$40,$08,$00,$00,$00,$00,$40  ; $FA5E
    .byte $00,$40,$00,$00,$00,$00,$00,$00,$00,$C1,$00,$00,$00,$00,$00,$00  ; $FA6E
    .byte $20,$10,$20,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FA7E
    .byte $00,$00,$00,$04,$00,$00,$00,$02,$20,$00,$00,$01,$00,$00,$00,$00  ; $FA8E
    .byte $00,$00,$00,$C1,$02,$20,$00,$20,$00,$10,$00,$00,$00,$20,$00,$00  ; $FA9E
    .byte $08,$00,$00,$01,$00,$20,$00,$00,$00,$00,$00,$02,$20,$00,$00,$00  ; $FAAE
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FABE
    .byte $00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FACE
    .byte $00,$00,$00,$04,$02,$04,$00,$04,$00,$00,$00,$02,$00,$68,$20,$00  ; $FADE
    .byte $00,$10,$00,$00,$00,$00,$00,$00,$00,$00,$80,$10,$20,$20,$00,$00  ; $FAEE
    .byte $00,$02,$00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$08  ; $FAFE
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FB0E
    .byte $00,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$08,$00,$00,$00,$90  ; $FB1E
    .byte $00,$00,$00,$00,$00,$08,$80,$00,$00,$00,$00,$00,$00,$03,$00,$40  ; $FB2E
    .byte $00,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FB3E
    .byte $00,$00,$00,$02,$00,$00,$00,$10,$00,$00,$00,$00,$00,$00,$00,$00  ; $FB4E
    .byte $08,$00,$08,$00,$00,$00,$00,$01,$00,$00,$00,$81,$00,$80,$00,$08  ; $FB5E
    .byte $00,$20,$00,$00,$00,$00,$00,$00,$00,$58,$00,$00,$00,$20,$00,$00  ; $FB6E
    .byte $02,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FB7E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$21,$00,$00,$00,$00,$00,$00  ; $FB8E
    .byte $00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00  ; $FB9E
    .byte $00,$00,$00,$04,$08,$00,$00,$40,$80,$00,$00,$00,$00,$8C,$02,$60  ; $FBAE
    .byte $20,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00,$00,$00,$00,$00,$00  ; $FBBE
    .byte $00,$00,$00,$08,$00,$02,$00,$80,$00,$00,$00,$10,$80,$80,$A0,$00  ; $FBCE
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$80,$00,$00,$00,$00,$00,$00,$00  ; $FBDE
    .byte $00,$00,$00,$00,$00,$00,$02,$08,$02,$00,$00,$00,$00,$00,$00,$00  ; $FBEE
    .byte $48,$D3,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00  ; $FBFE
    .byte $00,$00,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80,$00,$00,$00  ; $FC0E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$04,$03,$00,$00,$00  ; $FC1E
    .byte $04,$00,$00,$00,$20,$04,$00,$01,$00,$00,$02,$01,$10,$00,$00,$00  ; $FC2E
    .byte $00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FC3E
    .byte $84,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FC4E
    .byte $00,$00,$01,$10,$08,$00,$00,$00,$08,$00,$01,$00,$00,$44,$0E,$00  ; $FC5E
    .byte $00,$41,$00,$00,$00,$00,$00,$00,$48,$00,$C0,$40,$00,$40,$00,$00  ; $FC6E
    .byte $1A,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FC7E
    .byte $10,$00,$10,$00,$00,$00,$00,$14,$00,$00,$00,$00,$00,$00,$00,$00  ; $FC8E
    .byte $00,$00,$02,$14,$00,$00,$08,$00,$04,$00,$41,$40,$00,$00,$00,$00  ; $FC9E
    .byte $B0,$00,$00,$00,$00,$00,$00,$04,$42,$00,$08,$00,$20,$44,$80,$00  ; $FCAE
    .byte $00,$41,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$80,$00,$00,$00  ; $FCBE
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$40  ; $FCCE
    .byte $00,$00,$04,$40,$80,$00,$00,$00,$80,$10,$42,$00,$09,$04,$80,$00  ; $FCDE
    .byte $00,$00,$20,$00,$01,$00,$40,$00,$40,$44,$00,$00,$10,$00,$00,$00  ; $FCEE
    .byte $40,$50,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00,$00,$00  ; $FCFE
    .byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FD0E
    .byte $00,$00,$02,$00,$00,$00,$00,$00,$80,$00,$00,$00,$00,$00,$00,$40  ; $FD1E
    .byte $80,$00,$08,$00,$12,$00,$44,$00,$00,$40,$20,$00,$00,$00,$40,$04  ; $FD2E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00  ; $FD3E
    .byte $00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$10,$00  ; $FD4E
    .byte $20,$00,$02,$01,$00,$04,$84,$00,$03,$00,$00,$00,$00,$00,$00,$00  ; $FD5E
    .byte $21,$04,$00,$00,$04,$04,$00,$50,$00,$00,$00,$00,$00,$01,$00,$04  ; $FD6E
    .byte $00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FD7E
    .byte $00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $FD8E
    .byte $00,$01,$00,$00,$00,$01,$01,$40,$00,$00,$00,$00,$01,$01,$00,$01  ; $FD9E
    .byte $08,$00,$00,$00,$80,$01,$00,$00,$20,$00,$00,$00,$00,$00,$02,$00  ; $FDAE
    .byte $00,$00,$00,$00,$00,$00,$80,$00,$00,$04,$00,$00,$00,$00,$00,$00  ; $FDBE
    .byte $01,$00,$00,$00,$00,$00,$14,$00,$00,$00,$00,$00,$90,$00,$00,$00  ; $FDCE
    .byte $00,$10,$00,$00,$00,$00,$10,$00,$44,$04,$C4,$00,$00,$00,$00,$00  ; $FDDE
    .byte $00,$40,$00,$00,$40,$00,$0A,$00,$08,$00,$2E,$00,$09,$00,$10,$00  ; $FDEE
    .byte $00,$11  ; $FDFE

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

loc_1F_FE1B:
    LDA $2002                    ; $FE1B  AD 02 20
    BPL loc_1F_FE1B              ; $FE1E  10 FB

loc_1F_FE20:
    LDA $2002                    ; $FE20  AD 02 20
    BMI loc_1F_FE20              ; $FE23  30 FB
    DEX                          ; $FE25  CA
    BNE loc_1F_FE1B              ; $FE26  D0 F3
    LDA $2002                    ; $FE28  AD 02 20
    LDA #$10                     ; $FE2B  A9 10
    TAY                          ; $FE2D  A8

loc_1F_FE2E:
    STA $2006                    ; $FE2E  8D 06 20
    STA $2006                    ; $FE31  8D 06 20
    EOR #$10                     ; $FE34  49 10
    DEY                          ; $FE36  88
    BNE loc_1F_FE2E              ; $FE37  D0 F5
    TYA                          ; $FE39  98

loc_1F_FE3A:
    STA $0000,Y                  ; $FE3A  99 00 00
    STA $0100,Y                  ; $FE3D  99 00 01
    STA $0200,Y                  ; $FE40  99 00 02
    STA $0300,Y                  ; $FE43  99 00 03
    STA $0400,Y                  ; $FE46  99 00 04
    STA $0500,Y                  ; $FE49  99 00 05
    STA $0600,Y                  ; $FE4C  99 00 06
    STA $0700,Y                  ; $FE4F  99 00 07
    DEY                          ; $FE52  88
    BNE loc_1F_FE3A              ; $FE53  D0 E5
    LDX #$07                     ; $FE55  A2 07
    LDA #$88                     ; $FE57  A9 88

loc_1F_FE59:
    STA $DC,X                    ; $FE59  95 DC
    DEX                          ; $FE5B  CA
    BPL loc_1F_FE59              ; $FE5C  10 FB
    LDA #$18                     ; $FE5E  A9 18
    STA $FE                      ; $FE60  85 FE
    LDA #$01                     ; $FE62  A9 01
    JSR sub_1F_FFB7              ; $FE64  20 B7 FF
    LDX #$05                     ; $FE67  A2 05
    LDA #$00                     ; $FE69  A9 00

loc_1F_FE6B:
    STX $8000                    ; $FE6B  8E 00 80
    STA $8001                    ; $FE6E  8D 01 80
    DEX                          ; $FE71  CA
    BPL loc_1F_FE6B              ; $FE72  10 F7
    JSR sub_1E_C38F              ; $FE74  20 8F C3
    LDA #$20                     ; $FE77  A9 20
    LDX #$00                     ; $FE79  A2 00
    LDY #$00                     ; $FE7B  A0 00
    JSR sub_1E_C343              ; $FE7D  20 43 C3
    LDA #$28                     ; $FE80  A9 28
    LDX #$00                     ; $FE82  A2 00
    LDY #$00                     ; $FE84  A0 00
    JSR sub_1E_C343              ; $FE86  20 43 C3
    LDA #$DD                     ; $FE89  A9 DD
    STA $94                      ; $FE8B  85 94
    LDA #$E8                     ; $FE8D  A9 E8
    STA $93                      ; $FE8F  85 93
    LDA #$02                     ; $FE91  A9 02
    JSR sub_1F_FEF3              ; $FE93  20 F3 FE
    LDA #$88                     ; $FE96  A9 88
    STA $E4                      ; $FE98  85 E4
    STA $9B                      ; $FE9A  85 9B
    STA $FF                      ; $FE9C  85 FF
    STA $2000                    ; $FE9E  8D 00 20
    LDA #$02                     ; $FEA1  A9 02
    STA $BF                      ; $FEA3  85 BF
    LDA #$9C                     ; $FEA5  A9 9C
    STA $B0                      ; $FEA7  85 B0
    STA $BA                      ; $FEA9  85 BA

loc_1F_FEAB:
    LDX #$FF                     ; $FEAB  A2 FF
    TXS                          ; $FEAD  9A

loc_1F_FEAE:
    LDX #$00                     ; $FEAE  A2 00
    STX $90                      ; $FEB0  86 90
    LDY #$04                     ; $FEB2  A0 04

loc_1F_FEB4:
    LDA $80,X                    ; $FEB4  B5 80
    CMP #$04                     ; $FEB6  C9 04
    BCS loc_1F_FEC4              ; $FEB8  B0 0A
    INX                          ; $FEBA  E8
    INX                          ; $FEBB  E8
    INX                          ; $FEBC  E8
    INX                          ; $FEBD  E8
    DEY                          ; $FEBE  88
    BNE loc_1F_FEB4              ; $FEBF  D0 F3
    JMP loc_1F_FEAE              ; $FEC1  4C AE FE


loc_1F_FEC4:
    LDA $90                      ; $FEC4  A5 90
    BNE loc_1F_FEAE              ; $FEC6  D0 E6
    DEY                          ; $FEC8  88
    TYA                          ; $FEC9  98
    EOR #$03                     ; $FECA  49 03
    STA $91                      ; $FECC  85 91
    LDY $80,X                    ; $FECE  B4 80
    LDA #$02                     ; $FED0  A9 02
    STA $80,X                    ; $FED2  95 80
    CPY #$08                     ; $FED4  C0 08
    BNE loc_1F_FEE3              ; $FED6  D0 0B
    LDA $82,X                    ; $FED8  B5 82
    STA $93                      ; $FEDA  85 93
    LDA $83,X                    ; $FEDC  B5 83
    STA $94                      ; $FEDE  85 94
    JMP ($0093)                  ; $FEE0  6C 93 00


loc_1F_FEE3:
    LDA $82,X                    ; $FEE3  B5 82
    TAX                          ; $FEE5  AA
    TXS                          ; $FEE6  9A
    LDA $91                      ; $FEE7  A5 91
    BNE loc_1F_FEEE              ; $FEE9  D0 03
    JSR sub_1E_C2E5              ; $FEEB  20 E5 C2

loc_1F_FEEE:
    PLA                          ; $FEEE  68
    TAY                          ; $FEEF  A8
    PLA                          ; $FEF0  68
    TAX                          ; $FEF1  AA
    RTS                          ; $FEF2  60


sub_1F_FEF3:
    JSR sub_1F_FF17              ; $FEF3  20 17 FF
    LDA $93                      ; $FEF6  A5 93
    STA $82,X                    ; $FEF8  95 82
    LDA $94                      ; $FEFA  A5 94
    STA $83,X                    ; $FEFC  95 83
    LDA #$08                     ; $FEFE  A9 08
    STA $80,X                    ; $FF00  95 80
    RTS                          ; $FF02  60


sub_1F_FF03:
    JSR sub_1F_FF17              ; $FF03  20 17 FF
    LDA #$00                     ; $FF06  A9 00
    STA $80,X                    ; $FF08  95 80
    RTS                          ; $FF0A  60


loc_1F_FF0B:
    JSR sub_1F_FF15              ; $FF0B  20 15 FF
    LDA #$00                     ; $FF0E  A9 00
    STA $80,X                    ; $FF10  95 80
    JMP loc_1F_FEAB              ; $FF12  4C AB FE


sub_1F_FF15:
    LDA $91                      ; $FF15  A5 91

sub_1F_FF17:
    ASL A                        ; $FF17  0A
    ASL A                        ; $FF18  0A
    TAX                          ; $FF19  AA
    RTS                          ; $FF1A  60

    .byte $20,$22,$FF,$CA,$D0,$FA,$60  ; $FF1B

sub_1F_FF22:
    LDA #$01                     ; $FF22  A9 01

sub_1F_FF24:
    STA $93                      ; $FF24  85 93
    TXA                          ; $FF26  8A
    PHA                          ; $FF27  48
    TYA                          ; $FF28  98
    PHA                          ; $FF29  48
    JSR sub_1F_FF15              ; $FF2A  20 15 FF
    LDA $93                      ; $FF2D  A5 93
    STA $81,X                    ; $FF2F  95 81
    LDA #$01                     ; $FF31  A9 01
    STA $80,X                    ; $FF33  95 80
    TXA                          ; $FF35  8A
    TAY                          ; $FF36  A8
    TSX                          ; $FF37  BA
    STX $82,Y                    ; $FF38  96 82
    JMP loc_1F_FEAB              ; $FF3A  4C AB FE


sub_1F_FF3D:
    STA $F5                      ; $FF3D  85 F5
    STA $F6                      ; $FF3F  85 F6
    INC $F6                      ; $FF41  E6 F6

sub_1F_FF43:
    INC $F7                      ; $FF43  E6 F7
    LDA #$06                     ; $FF45  A9 06
    STA $F2                      ; $FF47  85 F2
    STA $8000                    ; $FF49  8D 00 80
    LDA $F5                      ; $FF4C  A5 F5
    STA $F3                      ; $FF4E  85 F3
    STA $8001                    ; $FF50  8D 01 80
    LDA #$07                     ; $FF53  A9 07
    STA $F2                      ; $FF55  85 F2
    STA $8000                    ; $FF57  8D 00 80
    LDA $F6                      ; $FF5A  A5 F6
    STA $F4                      ; $FF5C  85 F4
    STA $8001                    ; $FF5E  8D 01 80
    DEC $F7                      ; $FF61  C6 F7
    LDA $F8                      ; $FF63  A5 F8
    BNE sub_1F_FF68              ; $FF65  D0 01
    RTS                          ; $FF67  60


sub_1F_FF68:
    LDA $F7                      ; $FF68  A5 F7
    BNE loc_1F_FFB4              ; $FF6A  D0 48
    LDA #$06                     ; $FF6C  A9 06
    STA $F2                      ; $FF6E  85 F2
    STA $8000                    ; $FF70  8D 00 80
    LDA #$18                     ; $FF73  A9 18
    STA $8001                    ; $FF75  8D 01 80
    LDA #$07                     ; $FF78  A9 07
    STA $F2                      ; $FF7A  85 F2
    STA $8000                    ; $FF7C  8D 00 80
    LDA #$19                     ; $FF7F  A9 19
    STA $8001                    ; $FF81  8D 01 80

loc_1F_FF84:
    STX $A7                      ; $FF84  86 A7
    STY $A8                      ; $FF86  84 A8
    LDX $DB                      ; $FF88  A6 DB
    LDA $DC,X                    ; $FF8A  B5 DC
    CMP #$88                     ; $FF8C  C9 88
    BEQ loc_1F_FFA6              ; $FF8E  F0 16
    PHA                          ; $FF90  48
    LDA #$88                     ; $FF91  A9 88
    STA $DC,X                    ; $FF93  95 DC
    INX                          ; $FF95  E8
    TXA                          ; $FF96  8A
    AND #$07                     ; $FF97  29 07
    STA $DB                      ; $FF99  85 DB
    PLA                          ; $FF9B  68
    JSR $8003                    ; $FF9C  20 03 80
    LDX $A7                      ; $FF9F  A6 A7
    LDY $A8                      ; $FFA1  A4 A8
    JMP loc_1F_FF84              ; $FFA3  4C 84 FF


loc_1F_FFA6:
    JSR $8000                    ; $FFA6  20 00 80
    LDA #$00                     ; $FFA9  A9 00
    STA $F8                      ; $FFAB  85 F8
    LDX $A7                      ; $FFAD  A6 A7
    LDY $A8                      ; $FFAF  A4 A8
    JMP sub_1F_FF43              ; $FFB1  4C 43 FF


loc_1F_FFB4:
    INC $F8                      ; $FFB4  E6 F8
    RTS                          ; $FFB6  60


sub_1F_FFB7:
    STA $A000                    ; $FFB7  8D 00 A0
    STA $2C                      ; $FFBA  85 2C
    RTS                          ; $FFBC  60

    .byte $00,$40,$01,$C0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$81,$00,$00  ; $FFBD
    .byte $00,$00,$01,$00,$01,$00,$40,$00,$04,$00,$01,$00,$00,$00,$40,$00  ; $FFCD
    .byte $00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$04,$00,$00,$00,$00  ; $FFDD
    .byte $00,$10,$00,$6B,$3F,$A6,$15,$44,$04,$00,$00,$08,$F5,$00,$C0,$00  ; $FFED
    .byte $FE,$69,$C1  ; $FFFD
