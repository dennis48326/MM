; PRG 8 KB bank $1F at $E000
.segment "BANK1F"
.org $E000

    .byte $A9,$5A,$8D,$00,$05,$AD,$80,$05,$09,$40,$8D,$80,$05,$A9,$78,$8D  ; $E000
    .byte $00,$05,$EE,$00,$03,$AD,$00,$05,$F0,$09,$CE,$00,$05,$A9,$01,$20  ; $E010
    .byte $35,$F8,$60,$AD,$00,$03,$29,$0F,$C9,$02,$F0,$3C,$AD,$60,$03,$C9  ; $E020
    .byte $A0,$F0,$27,$A9,$04,$CD,$C0,$05,$F0,$03,$20,$35,$F8,$EE,$60,$03  ; $E030
    .byte $AD,$60,$03,$C9,$A0,$D0,$44,$A9,$6E,$8D,$DF,$05,$A9,$00,$8D,$FF  ; $E040
    .byte $05,$8D,$BF,$05,$A9,$3C,$8D,$00,$05,$60,$A9,$E5,$8D,$40,$04,$A9  ; $E050
    .byte $04,$8D,$60,$04,$EE,$00,$03,$60,$A5,$0F,$10,$0D,$AD,$20,$05,$D0  ; $E060
    .byte $0C,$EE,$20,$05,$A9,$78,$8D,$00,$05,$CE,$60,$03,$60,$A9,$81,$8D  ; $E070
    .byte $00,$03,$A9,$00,$8D,$00,$05,$A9,$0D,$85,$30,$60,$A0,$00,$20,$7C  ; $E080
    .byte $F6,$B0,$04,$A9,$07,$D0,$02,$A9,$04,$CD,$C0,$05,$F0,$03,$20,$35  ; $E090
    .byte $F8,$AD,$60,$03,$C9,$68,$F0,$0A,$B0,$04,$EE,$60,$03,$60,$CE,$60  ; $E0A0
    .byte $03,$60,$A9,$01,$CD,$C0,$05,$F0,$03,$20,$35,$F8,$EE,$00,$05,$D0  ; $E0B0
    .byte $58,$A9,$C0,$8D,$00,$05,$AD,$20,$05,$C9,$04,$F0,$4C,$20,$53,$FC  ; $E0C0
    .byte $B0,$47,$A9,$80,$99,$00,$03,$A9,$90,$99,$80,$05,$A9,$00,$99,$C0  ; $E0D0
    .byte $03,$99,$E0,$03,$99,$E0,$05,$99,$A0,$05,$99,$80,$04,$99,$40,$04  ; $E0E0
    .byte $99,$60,$04,$A9,$7C,$99,$C0,$05,$A9,$F9,$99,$20,$03,$A9,$C4,$99  ; $E0F0
    .byte $20,$05,$AD,$20,$05,$99,$00,$05,$AA,$EE,$20,$05,$BD,$66,$E1,$99  ; $E100
    .byte $60,$03,$A5,$F9,$99,$80,$03,$A2,$00,$60  ; $E110

sub_1F_E11A:
    LDA #$80                     ; $E11A  A9 80
    STA $030E                    ; $E11C  8D 0E 03
    LDA #$90                     ; $E11F  A9 90
    STA $058E                    ; $E121  8D 8E 05
    LDA #$EB                     ; $E124  A9 EB
    STA $032E                    ; $E126  8D 2E 03
    LDA #$67                     ; $E129  A9 67
    STA $05CE                    ; $E12B  8D CE 05
    LDA #$00                     ; $E12E  A9 00
    STA $05EE                    ; $E130  8D EE 05
    STA $05AE                    ; $E133  8D AE 05
    STA $03EE                    ; $E136  8D EE 03
    STA $B3                      ; $E139  85 B3
    LDA $F9                      ; $E13B  A5 F9
    STA $038E                    ; $E13D  8D 8E 03
    LDY $6C                      ; $E140  A4 6C
    LDA $DE72,Y                  ; $E142  B9 72 DE
    STA $036E                    ; $E145  8D 6E 03
    LDA $DE86,Y                  ; $E148  B9 86 DE
    AND #$F0                     ; $E14B  29 F0
    STA $03CE                    ; $E14D  8D CE 03
    LDA $6C                      ; $E150  A5 6C
    CLC                          ; $E152  18
    ADC #$18                     ; $E153  69 18
    STA $04CE                    ; $E155  8D CE 04
    LDA $DEBF,Y                  ; $E158  B9 BF DE
    ORA $6E                      ; $E15B  05 6E
    STA $6E                      ; $E15D  85 6E
    LDA #$0C                     ; $E15F  A9 0C
    STA $EC                      ; $E161  85 EC
    JMP sub_1F_FF3C              ; $E163  4C 3C FF

    .byte $E0,$30,$B0,$68  ; $E166

sub_1F_E16A:
    LDA $2A                      ; $E16A  A5 2A
    AND #$20                     ; $E16C  29 20
    BNE loc_1F_E173              ; $E16E  D0 03
    JMP loc_1F_E228              ; $E170  4C 28 E2


loc_1F_E173:
    LDA #$01                     ; $E173  A9 01
    STA $10                      ; $E175  85 10
    STA $2E                      ; $E177  85 2E
    LDA $0360                    ; $E179  AD 60 03
    SEC                          ; $E17C  38
    SBC $FC                      ; $E17D  E5 FC
    STA $00                      ; $E17F  85 00
    SEC                          ; $E181  38
    SBC #$80                     ; $E182  E9 80
    BCS loc_1F_E18A              ; $E184  B0 04
    EOR #$FF                     ; $E186  49 FF
    ADC #$01                     ; $E188  69 01

loc_1F_E18A:
    STA $01                      ; $E18A  85 01
    LDA $0360                    ; $E18C  AD 60 03
    SEC                          ; $E18F  38
    SBC $27                      ; $E190  E5 27
    STA $02                      ; $E192  85 02
    BPL loc_1F_E1E1              ; $E194  10 4B
    EOR #$FF                     ; $E196  49 FF
    CLC                          ; $E198  18
    ADC #$01                     ; $E199  69 01
    STA $02                      ; $E19B  85 02
    LDA $01                      ; $E19D  A5 01
    CMP #$09                     ; $E19F  C9 09
    BCC loc_1F_E1A7              ; $E1A1  90 04
    LDA $02                      ; $E1A3  A5 02
    STA $01                      ; $E1A5  85 01

loc_1F_E1A7:
    LDA #$08                     ; $E1A7  A9 08
    CMP $01                      ; $E1A9  C5 01
    BCS loc_1F_E1AF              ; $E1AB  B0 02
    STA $01                      ; $E1AD  85 01

loc_1F_E1AF:
    LDA #$02                     ; $E1AF  A9 02
    STA $10                      ; $E1B1  85 10
    STA $2E                      ; $E1B3  85 2E
    LDA $00                      ; $E1B5  A5 00
    CMP #$80                     ; $E1B7  C9 80
    BCS loc_1F_E228              ; $E1B9  B0 6D
    LDA $FC                      ; $E1BB  A5 FC
    SEC                          ; $E1BD  38
    SBC $01                      ; $E1BE  E5 01
    STA $FC                      ; $E1C0  85 FC
    BCS loc_1F_E224              ; $E1C2  B0 60
    LDA $2D                      ; $E1C4  A5 2D
    DEC $2D                      ; $E1C6  C6 2D
    BPL loc_1F_E1DC              ; $E1C8  10 12
    STA $2D                      ; $E1CA  85 2D
    LDA #$00                     ; $E1CC  A9 00
    STA $FC                      ; $E1CE  85 FC
    LDA #$10                     ; $E1D0  A9 10
    CMP $0360                    ; $E1D2  CD 60 03
    BCC loc_1F_E228              ; $E1D5  90 51
    STA $0360                    ; $E1D7  8D 60 03
    BCS loc_1F_E228              ; $E1DA  B0 4C

loc_1F_E1DC:
    DEC $F9                      ; $E1DC  C6 F9
    JMP loc_1F_E224              ; $E1DE  4C 24 E2


loc_1F_E1E1:
    LDA $00                      ; $E1E1  A5 00
    CMP #$81                     ; $E1E3  C9 81
    BCC loc_1F_E228              ; $E1E5  90 41
    LDA $2D                      ; $E1E7  A5 2D
    CMP $2C                      ; $E1E9  C5 2C
    BEQ loc_1F_E228              ; $E1EB  F0 3B
    LDA $01                      ; $E1ED  A5 01
    CMP #$09                     ; $E1EF  C9 09
    BCC loc_1F_E1F7              ; $E1F1  90 04
    LDA $02                      ; $E1F3  A5 02
    STA $01                      ; $E1F5  85 01

loc_1F_E1F7:
    LDA #$08                     ; $E1F7  A9 08
    CMP $01                      ; $E1F9  C5 01
    BCS loc_1F_E1FF              ; $E1FB  B0 02
    STA $01                      ; $E1FD  85 01

loc_1F_E1FF:
    LDA $01                      ; $E1FF  A5 01
    BEQ loc_1F_E228              ; $E201  F0 25
    LDA $FC                      ; $E203  A5 FC
    CLC                          ; $E205  18
    ADC $01                      ; $E206  65 01
    STA $FC                      ; $E208  85 FC
    BCC loc_1F_E224              ; $E20A  90 18
    INC $2D                      ; $E20C  E6 2D
    LDA $2D                      ; $E20E  A5 2D
    CMP $2C                      ; $E210  C5 2C
    BNE loc_1F_E222              ; $E212  D0 0E
    LDA #$00                     ; $E214  A9 00
    STA $FC                      ; $E216  85 FC
    LDA #$F0                     ; $E218  A9 F0
    CMP $0360                    ; $E21A  CD 60 03
    BCS loc_1F_E222              ; $E21D  B0 03
    STA $0360                    ; $E21F  8D 60 03

loc_1F_E222:
    INC $F9                      ; $E222  E6 F9

loc_1F_E224:
    JMP sub_1F_E467              ; $E224  4C 67 E4


loc_1F_E227:
    RTS                          ; $E227  60


loc_1F_E228:
    LDA $FC                      ; $E228  A5 FC
    BNE loc_1F_E227              ; $E22A  D0 FB
    LDA $0360                    ; $E22C  AD 60 03
    CMP #$10                     ; $E22F  C9 10
    BCS loc_1F_E23D              ; $E231  B0 0A
    LDA #$10                     ; $E233  A9 10
    STA $0360                    ; $E235  8D 60 03
    BEQ loc_1F_E23D              ; $E238  F0 03

loc_1F_E23A:
    JMP loc_1F_E33C              ; $E23A  4C 3C E3


loc_1F_E23D:
    CMP #$E5                     ; $E23D  C9 E5
    BCC loc_1F_E23A              ; $E23F  90 F9
    CMP #$F0                     ; $E241  C9 F0
    BCC loc_1F_E24A              ; $E243  90 05
    LDA #$F0                     ; $E245  A9 F0
    STA $0360                    ; $E247  8D 60 03

loc_1F_E24A:
    LDY $2B                      ; $E24A  A4 2B
    LDA $AA40,Y                  ; $E24C  B9 40 AA
    AND #$20                     ; $E24F  29 20
    BEQ loc_1F_E23A              ; $E251  F0 E7
    LDA $AA41,Y                  ; $E253  B9 41 AA
    AND #$C0                     ; $E256  29 C0
    BNE loc_1F_E23A              ; $E258  D0 E0
    LDA $AA41,Y                  ; $E25A  B9 41 AA
    AND #$20                     ; $E25D  29 20
    BEQ loc_1F_E23A              ; $E25F  F0 D9
    STA $00                      ; $E261  85 00
    LDA $22                      ; $E263  A5 22
    CMP #$08                     ; $E265  C9 08
    BNE loc_1F_E27A              ; $E267  D0 11
    LDA $F9                      ; $E269  A5 F9
    CMP #$15                     ; $E26B  C9 15
    BEQ loc_1F_E273              ; $E26D  F0 04
    CMP #$1A                     ; $E26F  C9 1A
    BNE loc_1F_E27A              ; $E271  D0 07

loc_1F_E273:
    LDA $033F                    ; $E273  AD 3F 03
    CMP #$FC                     ; $E276  C9 FC
    BEQ loc_1F_E23A              ; $E278  F0 C0

loc_1F_E27A:
    LDA $F9                      ; $E27A  A5 F9
    SEC                          ; $E27C  38
    SBC $AA30                    ; $E27D  ED 30 AA
    CMP #$02                     ; $E280  C9 02
    BNE loc_1F_E28F              ; $E282  D0 0B
    LDA $031F                    ; $E284  AD 1F 03
    BMI loc_1F_E23A              ; $E287  30 B1
    LDA $30                      ; $E289  A5 30
    CMP #$0C                     ; $E28B  C9 0C
    BCS loc_1F_E23A              ; $E28D  B0 AB

loc_1F_E28F:
    LDA $22                      ; $E28F  A5 22
    CMP #$0F                     ; $E291  C9 0F
    BNE loc_1F_E2A5              ; $E293  D0 10
    LDA $F9                      ; $E295  A5 F9
    CMP #$08                     ; $E297  C9 08
    BNE loc_1F_E2A5              ; $E299  D0 0A
    LDX #$0F                     ; $E29B  A2 0F

loc_1F_E29D:
    LDA $0310,X                  ; $E29D  BD 10 03
    BMI loc_1F_E23A              ; $E2A0  30 98
    DEX                          ; $E2A2  CA
    BPL loc_1F_E29D              ; $E2A3  10 F8

loc_1F_E2A5:
    LDA $00                      ; $E2A5  A5 00
    STA $2A                      ; $E2A7  85 2A
    LDA $AA41,Y                  ; $E2A9  B9 41 AA
    AND #$1F                     ; $E2AC  29 1F
    STA $2C                      ; $E2AE  85 2C
    LDA #$00                     ; $E2B0  A9 00
    STA $2D                      ; $E2B2  85 2D
    INC $2B                      ; $E2B4  E6 2B
    LDY $F8                      ; $E2B6  A4 F8
    LDA #$00                     ; $E2B8  A9 00
    STA $F8                      ; $E2BA  85 F8
    STA $76                      ; $E2BC  85 76
    STA $B3                      ; $E2BE  85 B3
    STA $5A                      ; $E2C0  85 5A
    LDA #$E8                     ; $E2C2  A9 E8
    STA $5E                      ; $E2C4  85 5E
    CPY #$02                     ; $E2C6  C0 02
    BNE loc_1F_E2D5              ; $E2C8  D0 0B
    LDA #$42                     ; $E2CA  A9 42
    STA $E9                      ; $E2CC  85 E9
    LDA #$09                     ; $E2CE  A9 09
    STA $29                      ; $E2D0  85 29
    JSR sub_1E_C83D              ; $E2D2  20 3D C8

loc_1F_E2D5:
    LDA $F9                      ; $E2D5  A5 F9
    SEC                          ; $E2D7  38
    SBC $AA30                    ; $E2D8  ED 30 AA
    BCC loc_1F_E2F7              ; $E2DB  90 1A
    CMP #$03                     ; $E2DD  C9 03
    BCS loc_1F_E2E8              ; $E2DF  B0 07
    TAX                          ; $E2E1  AA
    LDY $AA31,X                  ; $E2E2  BC 31 AA
    JMP loc_1F_E2F4              ; $E2E5  4C F4 E2


loc_1F_E2E8:
    LDA $F9                      ; $E2E8  A5 F9
    SEC                          ; $E2EA  38
    SBC $AA38                    ; $E2EB  ED 38 AA
    BCC loc_1F_E2F7              ; $E2EE  90 07
    TAX                          ; $E2F0  AA
    LDY $AA39,X                  ; $E2F1  BC 39 AA

loc_1F_E2F4:
    JSR sub_1F_EE31              ; $E2F4  20 31 EE

loc_1F_E2F7:
    LDA $22                      ; $E2F7  A5 22
    BNE loc_1F_E308              ; $E2F9  D0 0D
    LDX #$03                     ; $E2FB  A2 03

loc_1F_E2FD:
    LDA $AAA2,X                  ; $E2FD  BD A2 AA
    STA $060C,X                  ; $E300  9D 0C 06
    DEX                          ; $E303  CA
    BPL loc_1F_E2FD              ; $E304  10 F7
    STX $18                      ; $E306  86 18

loc_1F_E308:
    LDA #$E4                     ; $E308  A9 E4
    STA $0360                    ; $E30A  8D 60 03
    JSR sub_1F_E5D1              ; $E30D  20 D1 E5
    LDA $22                      ; $E310  A5 22
    STA $F5                      ; $E312  85 F5
    JSR sub_1F_FF6B              ; $E314  20 6B FF
    LDA $F9                      ; $E317  A5 F9
    SEC                          ; $E319  38
    SBC $AA30                    ; $E31A  ED 30 AA
    BCC loc_1F_E33B              ; $E31D  90 1C
    CMP #$05                     ; $E31F  C9 05
    BCS loc_1F_E32A              ; $E321  B0 07
    TAX                          ; $E323  AA
    LDY $AA30,X                  ; $E324  BC 30 AA
    JMP loc_1F_E338              ; $E327  4C 38 E3


loc_1F_E32A:
    LDA $F9                      ; $E32A  A5 F9
    SEC                          ; $E32C  38
    SBC $AA38                    ; $E32D  ED 38 AA
    BCC loc_1F_E33B              ; $E330  90 09
    BEQ loc_1F_E33B              ; $E332  F0 07
    TAX                          ; $E334  AA
    LDY $AA38,X                  ; $E335  BC 38 AA

loc_1F_E338:
    JSR sub_1F_EE44              ; $E338  20 44 EE

loc_1F_E33B:
    RTS                          ; $E33B  60


loc_1F_E33C:
    LDA $03C0                    ; $E33C  AD C0 03
    CMP #$E8                     ; $E33F  C9 E8
    BCS loc_1F_E35E              ; $E341  B0 1B
    CMP #$09                     ; $E343  C9 09
    BCS loc_1F_E33B              ; $E345  B0 F4
    LDA $30                      ; $E347  A5 30
    CMP #$03                     ; $E349  C9 03
    BNE loc_1F_E33B              ; $E34B  D0 EE
    LDA #$80                     ; $E34D  A9 80
    STA $10                      ; $E34F  85 10
    JSR sub_1F_E3C7              ; $E351  20 C7 E3
    BCC loc_1F_E33B              ; $E354  90 E5
    LDA #$80                     ; $E356  A9 80
    STA $10                      ; $E358  85 10
    LDA #$08                     ; $E35A  A9 08
    BNE loc_1F_E372              ; $E35C  D0 14

loc_1F_E35E:
    LDA $03E0                    ; $E35E  AD E0 03
    BMI loc_1F_E3C6              ; $E361  30 63
    LDA #$40                     ; $E363  A9 40
    STA $10                      ; $E365  85 10
    JSR sub_1F_E3C7              ; $E367  20 C7 E3
    BCC loc_1F_E3C6              ; $E36A  90 5A
    LDA #$40                     ; $E36C  A9 40
    STA $10                      ; $E36E  85 10
    LDA #$04                     ; $E370  A9 04

loc_1F_E372:
    STA $23                      ; $E372  85 23
    LDA #$00                     ; $E374  A9 00
    STA $03E0                    ; $E376  8D E0 03
    LDX #$01                     ; $E379  A2 01
    LDY $2B                      ; $E37B  A4 2B
    LDA $AA40,Y                  ; $E37D  B9 40 AA
    AND #$C0                     ; $E380  29 C0
    CMP $10                      ; $E382  C5 10
    BEQ loc_1F_E388              ; $E384  F0 02
    LDX #$FF                     ; $E386  A2 FF

loc_1F_E388:
    STX $12                      ; $E388  86 12
    LDA #$00                     ; $E38A  A9 00
    STA $03A0                    ; $E38C  8D A0 03
    STA $F8                      ; $E38F  85 F8
    LDA #$E8                     ; $E391  A9 E8
    STA $5E                      ; $E393  85 5E
    JSR sub_1F_EB6D              ; $E395  20 6D EB
    JSR sub_1F_E614              ; $E398  20 14 E6
    LDA $22                      ; $E39B  A5 22
    STA $F5                      ; $E39D  85 F5
    JSR sub_1F_FF6B              ; $E39F  20 6B FF
    LDY $2B                      ; $E3A2  A4 2B
    LDA $AA40,Y                  ; $E3A4  B9 40 AA
    AND #$20                     ; $E3A7  29 20
    BEQ loc_1F_E3AD              ; $E3A9  F0 02
    STA $2A                      ; $E3AB  85 2A

loc_1F_E3AD:
    LDA #$01                     ; $E3AD  A9 01
    STA $A000                    ; $E3AF  8D 00 A0
    LDA #$2A                     ; $E3B2  A9 2A
    STA $52                      ; $E3B4  85 52
    JSR sub_1E_C83D              ; $E3B6  20 3D C8
    LDX #$00                     ; $E3B9  A2 00
    LDY #$04                     ; $E3BB  A0 04
    JSR sub_1F_E9E3              ; $E3BD  20 E3 E9
    LDA $10                      ; $E3C0  A5 10
    BNE loc_1F_E3C6              ; $E3C2  D0 02
    STA $30                      ; $E3C4  85 30

loc_1F_E3C6:
    RTS                          ; $E3C6  60


sub_1F_E3C7:
    LDA $2D                      ; $E3C7  A5 2D
    BEQ loc_1F_E3D1              ; $E3C9  F0 06
    CMP $2C                      ; $E3CB  C5 2C
    BEQ loc_1F_E3D1              ; $E3CD  F0 02
    CLC                          ; $E3CF  18
    RTS                          ; $E3D0  60


loc_1F_E3D1:
    LDA $F9                      ; $E3D1  A5 F9
    STA $00                      ; $E3D3  85 00
    LDY $2B                      ; $E3D5  A4 2B
    LDA $2A                      ; $E3D7  A5 2A
    AND #$C0                     ; $E3D9  29 C0
    BEQ loc_1F_E3E5              ; $E3DB  F0 08
    LDA $2A                      ; $E3DD  A5 2A
    CMP $10                      ; $E3DF  C5 10
    BEQ loc_1F_E403              ; $E3E1  F0 20
    BNE loc_1F_E411              ; $E3E3  D0 2C

loc_1F_E3E5:
    LDA $2C                      ; $E3E5  A5 2C
    BNE loc_1F_E3FF              ; $E3E7  D0 16
    LDA $AA41,Y                  ; $E3E9  B9 41 AA
    AND #$C0                     ; $E3EC  29 C0
    CMP $10                      ; $E3EE  C5 10
    BEQ loc_1F_E403              ; $E3F0  F0 11
    LDA $AA3F,Y                  ; $E3F2  B9 3F AA
    AND #$C0                     ; $E3F5  29 C0
    EOR #$C0                     ; $E3F7  49 C0
    CMP $10                      ; $E3F9  C5 10
    BEQ loc_1F_E411              ; $E3FB  F0 14
    BNE loc_1F_E465              ; $E3FD  D0 66

loc_1F_E3FF:
    LDA $2D                      ; $E3FF  A5 2D
    BEQ loc_1F_E411              ; $E401  F0 0E

loc_1F_E403:
    INY                          ; $E403  C8
    LDA $AA40,Y                  ; $E404  B9 40 AA
    AND #$C0                     ; $E407  29 C0
    CMP $10                      ; $E409  C5 10
    BNE loc_1F_E465              ; $E40B  D0 58
    INC $00                      ; $E40D  E6 00
    BNE loc_1F_E430              ; $E40F  D0 1F

loc_1F_E411:
    LDA $AA40,Y                  ; $E411  B9 40 AA
    AND #$C0                     ; $E414  29 C0
    BEQ loc_1F_E465              ; $E416  F0 4D
    DEY                          ; $E418  88
    BMI loc_1F_E465              ; $E419  30 4A
    LDA $AA40,Y                  ; $E41B  B9 40 AA
    AND #$C0                     ; $E41E  29 C0
    BNE loc_1F_E425              ; $E420  D0 03
    LDA $AA41,Y                  ; $E422  B9 41 AA

loc_1F_E425:
    EOR #$C0                     ; $E425  49 C0
    CMP $10                      ; $E427  C5 10
    BEQ loc_1F_E425              ; $E429  F0 FA
    DEC $00                      ; $E42B  C6 00
    LDA $AA40,Y                  ; $E42D  B9 40 AA

loc_1F_E430:
    STA $2A                      ; $E430  85 2A
    LDA #$01                     ; $E432  A9 01
    STA $2E                      ; $E434  85 2E
    CPY $2B                      ; $E436  C4 2B
    STY $2B                      ; $E438  84 2B
    BCS loc_1F_E440              ; $E43A  B0 04
    LDA #$02                     ; $E43C  A9 02
    STA $2E                      ; $E43E  85 2E

loc_1F_E440:
    LDA $AA40,Y                  ; $E440  B9 40 AA
    AND #$1F                     ; $E443  29 1F
    STA $2C                      ; $E445  85 2C
    LDX $00                      ; $E447  A6 00
    CPX $F9                      ; $E449  E4 F9
    BCC loc_1F_E44F              ; $E44B  90 02
    LDA #$00                     ; $E44D  A9 00

loc_1F_E44F:
    STA $2D                      ; $E44F  85 2D
    LDA $00                      ; $E451  A5 00
    STA $29                      ; $E453  85 29
    STA $F9                      ; $E455  85 F9
    STA $0380                    ; $E457  8D 80 03
    LDA #$00                     ; $E45A  A9 00
    STA $A000                    ; $E45C  8D 00 A0
    LDA #$26                     ; $E45F  A9 26
    STA $52                      ; $E461  85 52
    SEC                          ; $E463  38
    RTS                          ; $E464  60


loc_1F_E465:
    CLC                          ; $E465  18
    RTS                          ; $E466  60


sub_1F_E467:
    LDA $F8                      ; $E467  A5 F8
    CMP #$02                     ; $E469  C9 02
    BNE sub_1F_E4AF              ; $E46B  D0 42
    JSR sub_1F_E4AF              ; $E46D  20 AF E4
    BCS loc_1F_E4EF              ; $E470  B0 7D
    LDA $0780                    ; $E472  AD 80 07
    ORA #$22                     ; $E475  09 22
    STA $0780                    ; $E477  8D 80 07
    LDA $0781                    ; $E47A  AD 81 07
    ORA #$80                     ; $E47D  09 80
    STA $0781                    ; $E47F  8D 81 07
    LDA #$09                     ; $E482  A9 09
    STA $0782                    ; $E484  8D 82 07
    LDY #$00                     ; $E487  A0 00

loc_1F_E489:
    LDA $0797,Y                  ; $E489  B9 97 07
    STA $0783,Y                  ; $E48C  99 83 07
    INY                          ; $E48F  C8
    CPY #$0A                     ; $E490  C0 0A
    BNE loc_1F_E489              ; $E492  D0 F5
    LDA $07A1                    ; $E494  AD A1 07
    BPL loc_1F_E49F              ; $E497  10 06
    STA $078D                    ; $E499  8D 8D 07
    STA $1A                      ; $E49C  85 1A
    RTS                          ; $E49E  60


loc_1F_E49F:
    LDY #$00                     ; $E49F  A0 00

loc_1F_E4A1:
    LDA $07B5,Y                  ; $E4A1  B9 B5 07
    STA $078D,Y                  ; $E4A4  99 8D 07
    INY                          ; $E4A7  C8
    CPY #$0D                     ; $E4A8  C0 0D
    BNE loc_1F_E4A1              ; $E4AA  D0 F5
    STA $1A                      ; $E4AC  85 1A
    RTS                          ; $E4AE  60


sub_1F_E4AF:
    LDA $FC                      ; $E4AF  A5 FC
    SEC                          ; $E4B1  38
    SBC $25                      ; $E4B2  E5 25
    BPL loc_1F_E4BB              ; $E4B4  10 05
    EOR #$FF                     ; $E4B6  49 FF
    CLC                          ; $E4B8  18
    ADC #$01                     ; $E4B9  69 01

loc_1F_E4BB:
    STA $03                      ; $E4BB  85 03
    BEQ loc_1F_E4EF              ; $E4BD  F0 30
    LDA $23                      ; $E4BF  A5 23
    AND #$0C                     ; $E4C1  29 0C
    BEQ loc_1F_E4D6              ; $E4C3  F0 11
    LDA $10                      ; $E4C5  A5 10
    STA $23                      ; $E4C7  85 23
    AND #$01                     ; $E4C9  29 01
    TAX                          ; $E4CB  AA
    LDA $E5CD,X                  ; $E4CC  BD CD E5
    STA $25                      ; $E4CF  85 25
    LDA $E5CF,X                  ; $E4D1  BD CF E5
    STA $24                      ; $E4D4  85 24

loc_1F_E4D6:
    LDA $10                      ; $E4D6  A5 10
    AND #$01                     ; $E4D8  29 01
    BEQ loc_1F_E4E1              ; $E4DA  F0 05
    LDA $25                      ; $E4DC  A5 25
    JMP loc_1F_E4E5              ; $E4DE  4C E5 E4


loc_1F_E4E1:
    LDA $25                      ; $E4E1  A5 25
    EOR #$FF                     ; $E4E3  49 FF

loc_1F_E4E5:
    AND #$07                     ; $E4E5  29 07
    CLC                          ; $E4E7  18
    ADC $03                      ; $E4E8  65 03
    LSR A                        ; $E4EA  4A
    LSR A                        ; $E4EB  4A
    LSR A                        ; $E4EC  4A
    BNE sub_1F_E4F1              ; $E4ED  D0 02

loc_1F_E4EF:
    SEC                          ; $E4EF  38
    RTS                          ; $E4F0  60


sub_1F_E4F1:
    LDA $10                      ; $E4F1  A5 10
    PHA                          ; $E4F3  48
    AND #$01                     ; $E4F4  29 01
    TAX                          ; $E4F6  AA
    PLA                          ; $E4F7  68
    CMP $23                      ; $E4F8  C5 23
    STA $23                      ; $E4FA  85 23
    BEQ loc_1F_E501              ; $E4FC  F0 03
    JMP loc_1F_E50F              ; $E4FE  4C 0F E5


loc_1F_E501:
    LDA $24                      ; $E501  A5 24
    CLC                          ; $E503  18
    ADC $E5C3,X                  ; $E504  7D C3 E5
    CMP #$20                     ; $E507  C9 20
    AND #$1F                     ; $E509  29 1F
    STA $24                      ; $E50B  85 24
    BCC loc_1F_E517              ; $E50D  90 08

loc_1F_E50F:
    LDA $29                      ; $E50F  A5 29
    CLC                          ; $E511  18
    ADC $E5C3,X                  ; $E512  7D C3 E5
    STA $29                      ; $E515  85 29

loc_1F_E517:
    LDA $22                      ; $E517  A5 22
    STA $F5                      ; $E519  85 F5
    JSR sub_1F_FF6B              ; $E51B  20 6B FF
    LDA $24                      ; $E51E  A5 24
    LSR A                        ; $E520  4A
    LSR A                        ; $E521  4A
    STA $28                      ; $E522  85 28
    LDY $29                      ; $E524  A4 29
    JSR sub_1F_E8B1              ; $E526  20 B1 E8
    LDA #$00                     ; $E529  A9 00
    STA $03                      ; $E52B  85 03

loc_1F_E52D:
    JSR sub_1F_E7F1              ; $E52D  20 F1 E7
    LDY $28                      ; $E530  A4 28
    LDA $0640,Y                  ; $E532  B9 40 06
    STA $11                      ; $E535  85 11
    LDA $24                      ; $E537  A5 24
    AND #$03                     ; $E539  29 03
    TAY                          ; $E53B  A8
    LDX $03                      ; $E53C  A6 03
    LDA $06C0,Y                  ; $E53E  B9 C0 06
    STA $0783,X                  ; $E541  9D 83 07
    LDA $06C4,Y                  ; $E544  B9 C4 06
    STA $0784,X                  ; $E547  9D 84 07
    LDA $28                      ; $E54A  A5 28
    CMP #$38                     ; $E54C  C9 38
    BCS loc_1F_E55C              ; $E54E  B0 0C
    LDA $06C8,Y                  ; $E550  B9 C8 06
    STA $0785,X                  ; $E553  9D 85 07
    LDA $06CC,Y                  ; $E556  B9 CC 06
    STA $0786,X                  ; $E559  9D 86 07

loc_1F_E55C:
    LDA $24                      ; $E55C  A5 24
    AND #$01                     ; $E55E  29 01
    BEQ loc_1F_E588              ; $E560  F0 26
    LDA $10                      ; $E562  A5 10
    AND $E5C5,Y                  ; $E564  39 C5 E5
    STA $10                      ; $E567  85 10
    LDA $11                      ; $E569  A5 11
    AND $E5C9,Y                  ; $E56B  39 C9 E5
    ORA $10                      ; $E56E  05 10
    STA $07A4,X                  ; $E570  9D A4 07
    LDY $28                      ; $E573  A4 28
    STA $0640,Y                  ; $E575  99 40 06
    LDA #$23                     ; $E578  A9 23
    STA $07A1,X                  ; $E57A  9D A1 07
    TYA                          ; $E57D  98
    ORA #$C0                     ; $E57E  09 C0
    STA $07A2,X                  ; $E580  9D A2 07
    LDA #$00                     ; $E583  A9 00
    STA $07A3,X                  ; $E585  9D A3 07

loc_1F_E588:
    INC $03                      ; $E588  E6 03
    INC $03                      ; $E58A  E6 03
    INC $03                      ; $E58C  E6 03
    INC $03                      ; $E58E  E6 03
    LDA $28                      ; $E590  A5 28
    CLC                          ; $E592  18
    ADC #$08                     ; $E593  69 08
    STA $28                      ; $E595  85 28
    CMP #$40                     ; $E597  C9 40
    BCC loc_1F_E52D              ; $E599  90 92
    LDA #$20                     ; $E59B  A9 20
    STA $0780                    ; $E59D  8D 80 07
    LDA $24                      ; $E5A0  A5 24
    STA $0781                    ; $E5A2  8D 81 07
    LDA #$1D                     ; $E5A5  A9 1D
    STA $0782                    ; $E5A7  8D 82 07
    LDY #$00                     ; $E5AA  A0 00
    LDA $24                      ; $E5AC  A5 24
    AND #$01                     ; $E5AE  29 01
    BEQ loc_1F_E5B4              ; $E5B0  F0 02
    LDY #$20                     ; $E5B2  A0 20

loc_1F_E5B4:
    LDA #$FF                     ; $E5B4  A9 FF
    STA $07A1,Y                  ; $E5B6  99 A1 07
    LDY $F8                      ; $E5B9  A4 F8
    CPY #$02                     ; $E5BB  C0 02
    BEQ loc_1F_E5C1              ; $E5BD  F0 02
    STA $1A                      ; $E5BF  85 1A

loc_1F_E5C1:
    CLC                          ; $E5C1  18
    RTS                          ; $E5C2  60

    .byte $FF,$01,$33,$33,$CC,$CC,$CC,$CC,$33,$33,$00,$FF,$01,$1F  ; $E5C3

sub_1F_E5D1:
    JSR sub_1E_C628              ; $E5D1  20 28 C6

loc_1F_E5D4:
    LDA $FC                      ; $E5D4  A5 FC
    CLC                          ; $E5D6  18
    ADC #$04                     ; $E5D7  69 04
    STA $FC                      ; $E5D9  85 FC
    BCC loc_1F_E5DF              ; $E5DB  90 02
    INC $F9                      ; $E5DD  E6 F9

loc_1F_E5DF:
    LDA #$01                     ; $E5DF  A9 01
    STA $10                      ; $E5E1  85 10
    JSR sub_1F_E467              ; $E5E3  20 67 E4
    LDA $FC                      ; $E5E6  A5 FC
    STA $25                      ; $E5E8  85 25
    LDA $0340                    ; $E5EA  AD 40 03
    CLC                          ; $E5ED  18
    ADC #$D0                     ; $E5EE  69 D0
    STA $0340                    ; $E5F0  8D 40 03
    LDA $0360                    ; $E5F3  AD 60 03
    ADC #$00                     ; $E5F6  69 00
    STA $0360                    ; $E5F8  8D 60 03
    LDA $0380                    ; $E5FB  AD 80 03
    ADC #$00                     ; $E5FE  69 00
    STA $0380                    ; $E600  8D 80 03
    JSR sub_1F_FF57              ; $E603  20 57 FF
    LDA $FC                      ; $E606  A5 FC
    BNE loc_1F_E5D4              ; $E608  D0 CA
    LDA $22                      ; $E60A  A5 22
    STA $F5                      ; $E60C  85 F5
    JSR sub_1F_FF6B              ; $E60E  20 6B FF
    JMP sub_1E_C83D              ; $E611  4C 3D C8


sub_1F_E614:
    JSR sub_1E_C628              ; $E614  20 28 C6
    LDA $23                      ; $E617  A5 23
    AND #$04                     ; $E619  29 04
    LSR A                        ; $E61B  4A
    LSR A                        ; $E61C  4A
    TAX                          ; $E61D  AA
    LDA $E7EB,X                  ; $E61E  BD EB E7
    STA $24                      ; $E621  85 24

loc_1F_E623:
    LDA $23                      ; $E623  A5 23
    AND #$04                     ; $E625  29 04
    BEQ loc_1F_E653              ; $E627  F0 2A
    LDA $FA                      ; $E629  A5 FA
    CLC                          ; $E62B  18
    ADC #$03                     ; $E62C  69 03
    STA $FA                      ; $E62E  85 FA
    CMP #$F0                     ; $E630  C9 F0
    BCC loc_1F_E638              ; $E632  90 04
    ADC #$0F                     ; $E634  69 0F
    STA $FA                      ; $E636  85 FA

loc_1F_E638:
    LDA $03A0                    ; $E638  AD A0 03
    SEC                          ; $E63B  38
    SBC #$C0                     ; $E63C  E9 C0
    STA $03A0                    ; $E63E  8D A0 03
    LDA $03C0                    ; $E641  AD C0 03
    SBC #$02                     ; $E644  E9 02
    STA $03C0                    ; $E646  8D C0 03
    BCS loc_1F_E67A              ; $E649  B0 2F
    SBC #$0F                     ; $E64B  E9 0F
    STA $03C0                    ; $E64D  8D C0 03
    JMP loc_1F_E67A              ; $E650  4C 7A E6


loc_1F_E653:
    LDA $FA                      ; $E653  A5 FA
    SEC                          ; $E655  38
    SBC #$03                     ; $E656  E9 03
    STA $FA                      ; $E658  85 FA
    BCS loc_1F_E660              ; $E65A  B0 04
    SBC #$0F                     ; $E65C  E9 0F
    STA $FA                      ; $E65E  85 FA

loc_1F_E660:
    LDA $03A0                    ; $E660  AD A0 03
    CLC                          ; $E663  18
    ADC #$C0                     ; $E664  69 C0
    STA $03A0                    ; $E666  8D A0 03
    LDA $03C0                    ; $E669  AD C0 03
    ADC #$02                     ; $E66C  69 02
    STA $03C0                    ; $E66E  8D C0 03
    CMP #$F0                     ; $E671  C9 F0
    BCC loc_1F_E67A              ; $E673  90 05
    ADC #$0F                     ; $E675  69 0F
    STA $03C0                    ; $E677  8D C0 03

loc_1F_E67A:
    JSR sub_1F_E698              ; $E67A  20 98 E6
    LDA $FA                      ; $E67D  A5 FA
    STA $26                      ; $E67F  85 26
    LDA $12                      ; $E681  A5 12
    PHA                          ; $E683  48
    JSR sub_1F_FF57              ; $E684  20 57 FF
    PLA                          ; $E687  68
    STA $12                      ; $E688  85 12
    LDA $FA                      ; $E68A  A5 FA
    BEQ loc_1F_E691              ; $E68C  F0 03
    JMP loc_1F_E623              ; $E68E  4C 23 E6


loc_1F_E691:
    LDA $22                      ; $E691  A5 22
    STA $F5                      ; $E693  85 F5
    JMP sub_1F_FF6B              ; $E695  4C 6B FF


sub_1F_E698:
    LDA $FA                      ; $E698  A5 FA
    SEC                          ; $E69A  38
    SBC $26                      ; $E69B  E5 26
    BPL loc_1F_E6A4              ; $E69D  10 05
    EOR #$FF                     ; $E69F  49 FF
    CLC                          ; $E6A1  18
    ADC #$01                     ; $E6A2  69 01

loc_1F_E6A4:
    STA $03                      ; $E6A4  85 03
    BEQ loc_1F_E6C1              ; $E6A6  F0 19
    LDA $23                      ; $E6A8  A5 23
    AND #$04                     ; $E6AA  29 04
    BEQ loc_1F_E6B3              ; $E6AC  F0 05
    LDA $26                      ; $E6AE  A5 26
    JMP loc_1F_E6B7              ; $E6B0  4C B7 E6


loc_1F_E6B3:
    LDA $26                      ; $E6B3  A5 26
    EOR #$FF                     ; $E6B5  49 FF

loc_1F_E6B7:
    AND #$07                     ; $E6B7  29 07
    CLC                          ; $E6B9  18
    ADC $03                      ; $E6BA  65 03
    LSR A                        ; $E6BC  4A
    LSR A                        ; $E6BD  4A
    LSR A                        ; $E6BE  4A
    BNE loc_1F_E6C2              ; $E6BF  D0 01

loc_1F_E6C1:
    RTS                          ; $E6C1  60


loc_1F_E6C2:
    LDA $23                      ; $E6C2  A5 23
    AND #$04                     ; $E6C4  29 04
    LSR A                        ; $E6C6  4A
    LSR A                        ; $E6C7  4A
    TAY                          ; $E6C8  A8
    LDA $24                      ; $E6C9  A5 24
    CLC                          ; $E6CB  18
    ADC $E7E9,Y                  ; $E6CC  79 E9 E7
    STA $24                      ; $E6CF  85 24
    CMP #$1E                     ; $E6D1  C9 1E
    BCC loc_1F_E6DA              ; $E6D3  90 05
    LDA $E7E7,Y                  ; $E6D5  B9 E7 E7
    STA $24                      ; $E6D8  85 24

loc_1F_E6DA:
    LDA $24                      ; $E6DA  A5 24
    AND #$01                     ; $E6DC  29 01
    CMP $E7E5,Y                  ; $E6DE  D9 E5 E7
    BEQ loc_1F_E6E6              ; $E6E1  F0 03
    JMP loc_1F_E79F              ; $E6E3  4C 9F E7


loc_1F_E6E6:
    LDA $22                      ; $E6E6  A5 22
    STA $F5                      ; $E6E8  85 F5
    JSR sub_1F_FF6B              ; $E6EA  20 6B FF
    LDY $29                      ; $E6ED  A4 29
    JSR sub_1F_E8B1              ; $E6EF  20 B1 E8
    LDA $24                      ; $E6F2  A5 24
    AND #$1C                     ; $E6F4  29 1C
    ASL A                        ; $E6F6  0A
    STA $28                      ; $E6F7  85 28
    ORA #$C0                     ; $E6F9  09 C0
    STA $07A4                    ; $E6FB  8D A4 07
    LDA #$23                     ; $E6FE  A9 23
    STA $07A3                    ; $E700  8D A3 07
    LDA #$07                     ; $E703  A9 07
    STA $07A5                    ; $E705  8D A5 07
    LDA #$00                     ; $E708  A9 00
    STA $03                      ; $E70A  85 03

loc_1F_E70C:
    LDY $28                      ; $E70C  A4 28
    LDA $0640,Y                  ; $E70E  B9 40 06
    STA $11                      ; $E711  85 11
    JSR sub_1F_E7F1              ; $E713  20 F1 E7
    LDY $03                      ; $E716  A4 03
    LDA $24                      ; $E718  A5 24
    AND #$03                     ; $E71A  29 03
    TAX                          ; $E71C  AA
    LDA $E7D9,X                  ; $E71D  BD D9 E7
    STA $04                      ; $E720  85 04
    LDA $E7DD,X                  ; $E722  BD DD E7
    STA $05                      ; $E725  85 05
    LDA #$03                     ; $E727  A9 03
    STA $06                      ; $E729  85 06

loc_1F_E72B:
    LDX $04                      ; $E72B  A6 04
    LDA $06C0,X                  ; $E72D  BD C0 06
    STA $0783,Y                  ; $E730  99 83 07
    LDX $05                      ; $E733  A6 05
    LDA $06C0,X                  ; $E735  BD C0 06
    STA $07AF,Y                  ; $E738  99 AF 07
    INC $04                      ; $E73B  E6 04
    INC $05                      ; $E73D  E6 05
    INY                          ; $E73F  C8
    DEC $06                      ; $E740  C6 06
    BPL loc_1F_E72B              ; $E742  10 E7
    STY $03                      ; $E744  84 03
    LDA $24                      ; $E746  A5 24
    AND #$03                     ; $E748  29 03
    TAX                          ; $E74A  AA
    LDA $10                      ; $E74B  A5 10
    AND $E7D1,X                  ; $E74D  3D D1 E7
    STA $10                      ; $E750  85 10
    LDA $11                      ; $E752  A5 11
    AND $E7D5,X                  ; $E754  3D D5 E7
    ORA $10                      ; $E757  05 10
    STA $10                      ; $E759  85 10
    LDX $28                      ; $E75B  A6 28
    STA $0640,X                  ; $E75D  9D 40 06
    TXA                          ; $E760  8A
    AND #$07                     ; $E761  29 07
    TAX                          ; $E763  AA
    LDA $10                      ; $E764  A5 10
    STA $07A6,X                  ; $E766  9D A6 07
    INC $28                      ; $E769  E6 28
    CPX #$07                     ; $E76B  E0 07
    BNE loc_1F_E70C              ; $E76D  D0 9D
    LDA $24                      ; $E76F  A5 24
    PHA                          ; $E771  48
    AND #$03                     ; $E772  29 03
    TAY                          ; $E774  A8
    PLA                          ; $E775  68
    LSR A                        ; $E776  4A
    LSR A                        ; $E777  4A
    TAX                          ; $E778  AA
    LDA $E8A9,X                  ; $E779  BD A9 E8
    STA $0780                    ; $E77C  8D 80 07
    LDA $E8A1,X                  ; $E77F  BD A1 E8
    ORA $E7E1,Y                  ; $E782  19 E1 E7
    STA $0781                    ; $E785  8D 81 07
    LDA #$1F                     ; $E788  A9 1F
    STA $0782                    ; $E78A  8D 82 07
    LDA $23                      ; $E78D  A5 23
    AND #$04                     ; $E78F  29 04
    LSR A                        ; $E791  4A
    LSR A                        ; $E792  4A
    TAY                          ; $E793  A8
    LDX $E7ED,Y                  ; $E794  BE ED E7
    LDA #$FF                     ; $E797  A9 FF
    STA $0780,X                  ; $E799  9D 80 07
    STA $19                      ; $E79C  85 19
    RTS                          ; $E79E  60


loc_1F_E79F:
    LDY #$1F                     ; $E79F  A0 1F

loc_1F_E7A1:
    LDA $07AF,Y                  ; $E7A1  B9 AF 07
    STA $0783,Y                  ; $E7A4  99 83 07
    DEY                          ; $E7A7  88
    BPL loc_1F_E7A1              ; $E7A8  10 F7
    LDA $24                      ; $E7AA  A5 24
    AND #$03                     ; $E7AC  29 03
    TAX                          ; $E7AE  AA
    LDA $0781                    ; $E7AF  AD 81 07
    AND #$80                     ; $E7B2  29 80
    ORA $E7E1,X                  ; $E7B4  1D E1 E7
    STA $0781                    ; $E7B7  8D 81 07
    LDA #$23                     ; $E7BA  A9 23
    STA $07A3                    ; $E7BC  8D A3 07
    LDA $23                      ; $E7BF  A5 23
    AND #$04                     ; $E7C1  29 04
    LSR A                        ; $E7C3  4A
    LSR A                        ; $E7C4  4A
    TAY                          ; $E7C5  A8
    LDX $E7EF,Y                  ; $E7C6  BE EF E7
    LDA #$FF                     ; $E7C9  A9 FF
    STA $0780,X                  ; $E7CB  9D 80 07
    STA $19                      ; $E7CE  85 19
    RTS                          ; $E7D0  60

    .byte $0F,$0F,$F0,$F0,$F0,$F0,$0F,$0F,$00,$04,$08,$0C,$04,$00,$0C,$08  ; $E7D1
    .byte $00,$20,$40,$60,$01,$00,$1D,$00,$FF,$01,$00,$1D,$23,$2E,$2E,$23  ; $E7E1

sub_1F_E7F1:
    JSR sub_1F_E882              ; $E7F1  20 82 E8

sub_1F_E7F4:
    LDY #$03                     ; $E7F4  A0 03
    STY $02                      ; $E7F6  84 02
    LDA #$00                     ; $E7F8  A9 00
    STA $10                      ; $E7FA  85 10

loc_1F_E7FC:
    LDY $02                      ; $E7FC  A4 02
    LDX $E89D,Y                  ; $E7FE  BE 9D E8
    LDA ($00),Y                  ; $E801  B1 00
    TAY                          ; $E803  A8
    LDA $BB00,Y                  ; $E804  B9 00 BB
    STA $06C0,X                  ; $E807  9D C0 06
    LDA $BC00,Y                  ; $E80A  B9 00 BC
    STA $06C1,X                  ; $E80D  9D C1 06
    LDA $BD00,Y                  ; $E810  B9 00 BD
    STA $06C4,X                  ; $E813  9D C4 06
    LDA $BE00,Y                  ; $E816  B9 00 BE
    STA $06C5,X                  ; $E819  9D C5 06
    JSR sub_1F_E834              ; $E81C  20 34 E8
    LDA $BF00,Y                  ; $E81F  B9 00 BF
    AND #$03                     ; $E822  29 03
    ORA $10                      ; $E824  05 10
    STA $10                      ; $E826  85 10
    DEC $02                      ; $E828  C6 02
    BMI loc_1F_E833              ; $E82A  30 07
    ASL $10                      ; $E82C  06 10
    ASL $10                      ; $E82E  06 10
    JMP loc_1F_E7FC              ; $E830  4C FC E7


loc_1F_E833:
    RTS                          ; $E833  60


sub_1F_E834:
    LDA $22                      ; $E834  A5 22
    CMP #$02                     ; $E836  C9 02
    BEQ loc_1F_E83E              ; $E838  F0 04
    CMP #$09                     ; $E83A  C9 09
    BNE loc_1F_E833              ; $E83C  D0 F5

loc_1F_E83E:
    LDA $BF00,Y                  ; $E83E  B9 00 BF
    AND #$F0                     ; $E841  29 F0
    CMP #$70                     ; $E843  C9 70
    BNE loc_1F_E833              ; $E845  D0 EC
    STY $0F                      ; $E847  84 0F
    STX $0E                      ; $E849  86 0E
    LDA $29                      ; $E84B  A5 29
    AND #$01                     ; $E84D  29 01
    ASL A                        ; $E84F  0A
    ASL A                        ; $E850  0A
    ASL A                        ; $E851  0A
    ASL A                        ; $E852  0A
    ASL A                        ; $E853  0A
    STA $0D                      ; $E854  85 0D
    LDA $28                      ; $E856  A5 28
    PHA                          ; $E858  48
    LSR A                        ; $E859  4A
    ORA $0D                      ; $E85A  05 0D
    TAY                          ; $E85C  A8
    PLA                          ; $E85D  68
    ASL A                        ; $E85E  0A
    ASL A                        ; $E85F  0A
    AND #$04                     ; $E860  29 04
    ORA $02                      ; $E862  05 02
    TAX                          ; $E864  AA
    LDA $0110,Y                  ; $E865  B9 10 01
    AND $EB82,X                  ; $E868  3D 82 EB
    BEQ loc_1F_E87D              ; $E86B  F0 10
    LDX $0E                      ; $E86D  A6 0E
    LDA #$00                     ; $E86F  A9 00
    STA $06C0,X                  ; $E871  9D C0 06
    STA $06C1,X                  ; $E874  9D C1 06
    STA $06C4,X                  ; $E877  9D C4 06
    STA $06C5,X                  ; $E87A  9D C5 06

loc_1F_E87D:
    LDY $0F                      ; $E87D  A4 0F
    LDX $0E                      ; $E87F  A6 0E
    RTS                          ; $E881  60


sub_1F_E882:
    JSR sub_1E_C8A0              ; $E882  20 A0 C8
    LDA #$00                     ; $E885  A9 00
    STA $01                      ; $E887  85 01
    LDY $28                      ; $E889  A4 28
    LDA ($20),Y                  ; $E88B  B1 20

sub_1F_E88D:
    ASL A                        ; $E88D  0A
    ROL $01                      ; $E88E  26 01
    ASL A                        ; $E890  0A
    ROL $01                      ; $E891  26 01
    STA $00                      ; $E893  85 00
    LDA $01                      ; $E895  A5 01
    CLC                          ; $E897  18
    ADC #$B7                     ; $E898  69 B7
    STA $01                      ; $E89A  85 01
    RTS                          ; $E89C  60

    .byte $00,$02,$08,$0A,$00,$80,$00,$80,$00,$80,$00,$80,$20,$20,$21,$21  ; $E89D
    .byte $22,$22,$23,$23  ; $E8AD

sub_1F_E8B1:
    LDA $AA00,Y                  ; $E8B1  B9 00 AA

sub_1F_E8B4:
    PHA                          ; $E8B4  48
    LDA #$00                     ; $E8B5  A9 00
    STA $00                      ; $E8B7  85 00
    PLA                          ; $E8B9  68
    ASL A                        ; $E8BA  0A
    ROL $00                      ; $E8BB  26 00
    ASL A                        ; $E8BD  0A
    ROL $00                      ; $E8BE  26 00
    ASL A                        ; $E8C0  0A
    ROL $00                      ; $E8C1  26 00
    ASL A                        ; $E8C3  0A
    ROL $00                      ; $E8C4  26 00
    ASL A                        ; $E8C6  0A
    ROL $00                      ; $E8C7  26 00
    ASL A                        ; $E8C9  0A
    ROL $00                      ; $E8CA  26 00
    STA $20                      ; $E8CC  85 20
    LDA $00                      ; $E8CE  A5 00
    CLC                          ; $E8D0  18
    ADC #$AF                     ; $E8D1  69 AF
    STA $21                      ; $E8D3  85 21
    RTS                          ; $E8D5  60


sub_1F_E8D6:
    LDA $EBE2,Y                  ; $E8D6  B9 E2 EB
    STA $40                      ; $E8D9  85 40
    JSR sub_1F_EB0C              ; $E8DB  20 0C EB
    TAY                          ; $E8DE  A8
    LDA $EC10,Y                  ; $E8DF  B9 10 EC
    STA $02                      ; $E8E2  85 02
    LDA $03E0,X                  ; $E8E4  BD E0 03
    STA $03                      ; $E8E7  85 03
    LDA $EC11,Y                  ; $E8E9  B9 11 EC
    PHA                          ; $E8EC  48
    CLC                          ; $E8ED  18
    ADC $03C0,X                  ; $E8EE  7D C0 03
    STA $11                      ; $E8F1  85 11
    PLA                          ; $E8F3  68
    BMI loc_1F_E900              ; $E8F4  30 0A
    BCS loc_1F_E902              ; $E8F6  B0 0A
    LDA $11                      ; $E8F8  A5 11
    CMP #$F0                     ; $E8FA  C9 F0
    BCS loc_1F_E902              ; $E8FC  B0 04
    BCC loc_1F_E90F              ; $E8FE  90 0F

loc_1F_E900:
    BCS loc_1F_E90F              ; $E900  B0 0D

loc_1F_E902:
    LDA #$00                     ; $E902  A9 00
    LDY $02                      ; $E904  A4 02

loc_1F_E906:
    STA $0042,Y                  ; $E906  99 42 00
    DEY                          ; $E909  88
    BPL loc_1F_E906              ; $E90A  10 FA
    JMP loc_1F_EB24              ; $E90C  4C 24 EB


loc_1F_E90F:
    LDA $03                      ; $E90F  A5 03
    BNE loc_1F_E902              ; $E911  D0 EF
    LDA $11                      ; $E913  A5 11
    LSR A                        ; $E915  4A
    LSR A                        ; $E916  4A
    PHA                          ; $E917  48
    AND #$38                     ; $E918  29 38
    STA $28                      ; $E91A  85 28
    PLA                          ; $E91C  68
    LSR A                        ; $E91D  4A
    AND #$02                     ; $E91E  29 02
    STA $03                      ; $E920  85 03
    LDA #$00                     ; $E922  A9 00
    STA $04                      ; $E924  85 04
    LDA $EC12,Y                  ; $E926  B9 12 EC
    BPL loc_1F_E92D              ; $E929  10 02
    DEC $04                      ; $E92B  C6 04

loc_1F_E92D:
    CLC                          ; $E92D  18
    ADC $0360,X                  ; $E92E  7D 60 03
    STA $12                      ; $E931  85 12
    LDA $0380,X                  ; $E933  BD 80 03
    ADC $04                      ; $E936  65 04
    STA $13                      ; $E938  85 13
    LDA $12                      ; $E93A  A5 12
    LSR A                        ; $E93C  4A
    LSR A                        ; $E93D  4A
    LSR A                        ; $E93E  4A
    LSR A                        ; $E93F  4A
    PHA                          ; $E940  48
    AND #$01                     ; $E941  29 01
    ORA $03                      ; $E943  05 03
    STA $03                      ; $E945  85 03
    PLA                          ; $E947  68
    LSR A                        ; $E948  4A
    ORA $28                      ; $E949  05 28
    STA $28                      ; $E94B  85 28

loc_1F_E94D:
    STX $04                      ; $E94D  86 04
    LDA $22                      ; $E94F  A5 22
    STA $F5                      ; $E951  85 F5
    JSR sub_1F_FF6B              ; $E953  20 6B FF
    LDX $04                      ; $E956  A6 04
    LDY $13                      ; $E958  A4 13
    JSR sub_1F_E8B1              ; $E95A  20 B1 E8

loc_1F_E95D:
    JSR sub_1F_E882              ; $E95D  20 82 E8

loc_1F_E960:
    LDY $03                      ; $E960  A4 03
    LDA ($00),Y                  ; $E962  B1 00
    TAY                          ; $E964  A8
    LDA $BF00,Y                  ; $E965  B9 00 BF
    AND #$F0                     ; $E968  29 F0
    JSR sub_1F_EB30              ; $E96A  20 30 EB
    JSR sub_1F_EB8A              ; $E96D  20 8A EB
    LDY $02                      ; $E970  A4 02
    STA $0042,Y                  ; $E972  99 42 00
    CMP $41                      ; $E975  C5 41
    BCC loc_1F_E97B              ; $E977  90 02
    STA $41                      ; $E979  85 41

loc_1F_E97B:
    ORA $10                      ; $E97B  05 10
    STA $10                      ; $E97D  85 10
    DEC $02                      ; $E97F  C6 02
    BMI loc_1F_E9BA              ; $E981  30 37
    INC $40                      ; $E983  E6 40
    LDY $40                      ; $E985  A4 40
    LDA $12                      ; $E987  A5 12
    PHA                          ; $E989  48
    AND #$10                     ; $E98A  29 10
    STA $04                      ; $E98C  85 04
    PLA                          ; $E98E  68
    CLC                          ; $E98F  18
    ADC $EC12,Y                  ; $E990  79 12 EC
    STA $12                      ; $E993  85 12
    AND #$10                     ; $E995  29 10
    CMP $04                      ; $E997  C5 04
    BEQ loc_1F_E960              ; $E999  F0 C5
    LDA $03                      ; $E99B  A5 03
    EOR #$01                     ; $E99D  49 01
    STA $03                      ; $E99F  85 03
    AND #$01                     ; $E9A1  29 01
    BNE loc_1F_E960              ; $E9A3  D0 BB
    INC $28                      ; $E9A5  E6 28
    LDA $28                      ; $E9A7  A5 28
    AND #$07                     ; $E9A9  29 07
    BNE loc_1F_E95D              ; $E9AB  D0 B0
    INC $13                      ; $E9AD  E6 13
    DEC $28                      ; $E9AF  C6 28
    LDA $28                      ; $E9B1  A5 28
    AND #$38                     ; $E9B3  29 38
    STA $28                      ; $E9B5  85 28
    JMP loc_1F_E94D              ; $E9B7  4C 4D E9


loc_1F_E9BA:
    CPX #$00                     ; $E9BA  E0 00
    BNE loc_1F_E9E0              ; $E9BC  D0 22
    LDA $39                      ; $E9BE  A5 39
    BNE loc_1F_E9E0              ; $E9C0  D0 1E
    LDA $3D                      ; $E9C2  A5 3D
    BNE loc_1F_E9E0              ; $E9C4  D0 1A
    LDA $30                      ; $E9C6  A5 30
    CMP #$06                     ; $E9C8  C9 06
    BEQ loc_1F_E9E0              ; $E9CA  F0 14
    CMP #$0E                     ; $E9CC  C9 0E
    BEQ loc_1F_E9E0              ; $E9CE  F0 10
    LDY #$06                     ; $E9D0  A0 06
    LDA $41                      ; $E9D2  A5 41
    CMP #$30                     ; $E9D4  C9 30
    BEQ loc_1F_E9DE              ; $E9D6  F0 06
    LDY #$0E                     ; $E9D8  A0 0E
    CMP #$50                     ; $E9DA  C9 50
    BNE loc_1F_E9E0              ; $E9DC  D0 02

loc_1F_E9DE:
    STY $3D                      ; $E9DE  84 3D

loc_1F_E9E0:
    JMP loc_1F_EB24              ; $E9E0  4C 24 EB


sub_1F_E9E3:
    LDA $ECE1,Y                  ; $E9E3  B9 E1 EC
    STA $40                      ; $E9E6  85 40
    JSR sub_1F_EB0C              ; $E9E8  20 0C EB
    TAY                          ; $E9EB  A8
    LDA $ED07,Y                  ; $E9EC  B9 07 ED
    STA $02                      ; $E9EF  85 02
    LDA #$00                     ; $E9F1  A9 00
    STA $04                      ; $E9F3  85 04
    LDA $ED08,Y                  ; $E9F5  B9 08 ED
    BPL loc_1F_E9FC              ; $E9F8  10 02
    DEC $04                      ; $E9FA  C6 04

loc_1F_E9FC:
    CLC                          ; $E9FC  18
    ADC $0360,X                  ; $E9FD  7D 60 03
    STA $12                      ; $EA00  85 12
    LDA $0380,X                  ; $EA02  BD 80 03
    ADC $04                      ; $EA05  65 04
    STA $13                      ; $EA07  85 13
    LDA $12                      ; $EA09  A5 12
    LSR A                        ; $EA0B  4A
    LSR A                        ; $EA0C  4A
    LSR A                        ; $EA0D  4A
    LSR A                        ; $EA0E  4A
    PHA                          ; $EA0F  48
    AND #$01                     ; $EA10  29 01
    STA $03                      ; $EA12  85 03
    PLA                          ; $EA14  68
    LSR A                        ; $EA15  4A
    STA $28                      ; $EA16  85 28
    LDA $03E0,X                  ; $EA18  BD E0 03
    BMI loc_1F_EA41              ; $EA1B  30 24
    BNE loc_1F_EA3B              ; $EA1D  D0 1C
    LDA $03C0,X                  ; $EA1F  BD C0 03
    CLC                          ; $EA22  18
    ADC $ED09,Y                  ; $EA23  79 09 ED
    STA $11                      ; $EA26  85 11
    LDA $ED09,Y                  ; $EA28  B9 09 ED
    BPL loc_1F_EA31              ; $EA2B  10 04
    BCC loc_1F_EA41              ; $EA2D  90 12
    BCS loc_1F_EA33              ; $EA2F  B0 02

loc_1F_EA31:
    BCS loc_1F_EA3B              ; $EA31  B0 08

loc_1F_EA33:
    LDA $11                      ; $EA33  A5 11
    CMP #$F0                     ; $EA35  C9 F0
    BCC loc_1F_EA6C              ; $EA37  90 33
    BCS loc_1F_EA31              ; $EA39  B0 F6

loc_1F_EA3B:
    LDA #$EF                     ; $EA3B  A9 EF
    STA $11                      ; $EA3D  85 11
    BNE loc_1F_EA6C              ; $EA3F  D0 2B

loc_1F_EA41:
    LDA #$00                     ; $EA41  A9 00
    STA $11                      ; $EA43  85 11
    BEQ loc_1F_EA6C              ; $EA45  F0 25

loc_1F_EA47:
    LDA $11                      ; $EA47  A5 11
    CLC                          ; $EA49  18
    ADC $ED09,Y                  ; $EA4A  79 09 ED
    STA $11                      ; $EA4D  85 11
    CMP #$F0                     ; $EA4F  C9 F0
    BCC loc_1F_EA5B              ; $EA51  90 08
    ADC #$10                     ; $EA53  69 10
    STA $11                      ; $EA55  85 11
    INC $04                      ; $EA57  E6 04
    BEQ loc_1F_EA6C              ; $EA59  F0 11

loc_1F_EA5B:
    INY                          ; $EA5B  C8
    STY $40                      ; $EA5C  84 40
    LDY $02                      ; $EA5E  A4 02
    LDA #$00                     ; $EA60  A9 00
    STA $0042,Y                  ; $EA62  99 42 00
    DEC $02                      ; $EA65  C6 02
    BPL loc_1F_EA47              ; $EA67  10 DE
    JMP loc_1F_EB24              ; $EA69  4C 24 EB


loc_1F_EA6C:
    LDA $11                      ; $EA6C  A5 11
    LSR A                        ; $EA6E  4A
    LSR A                        ; $EA6F  4A
    PHA                          ; $EA70  48
    AND #$38                     ; $EA71  29 38
    ORA $28                      ; $EA73  05 28
    STA $28                      ; $EA75  85 28
    PLA                          ; $EA77  68
    LSR A                        ; $EA78  4A
    AND #$02                     ; $EA79  29 02
    ORA $03                      ; $EA7B  05 03
    STA $03                      ; $EA7D  85 03
    STX $04                      ; $EA7F  86 04
    LDA $22                      ; $EA81  A5 22
    STA $F5                      ; $EA83  85 F5
    JSR sub_1F_FF6B              ; $EA85  20 6B FF
    LDX $04                      ; $EA88  A6 04
    LDY $13                      ; $EA8A  A4 13
    JSR sub_1F_E8B1              ; $EA8C  20 B1 E8

loc_1F_EA8F:
    JSR sub_1F_E882              ; $EA8F  20 82 E8

loc_1F_EA92:
    LDY $03                      ; $EA92  A4 03
    LDA ($00),Y                  ; $EA94  B1 00
    TAY                          ; $EA96  A8
    LDA $BF00,Y                  ; $EA97  B9 00 BF
    AND #$F0                     ; $EA9A  29 F0
    JSR sub_1F_EB30              ; $EA9C  20 30 EB
    JSR sub_1F_EB8A              ; $EA9F  20 8A EB
    LDY $02                      ; $EAA2  A4 02
    STA $0042,Y                  ; $EAA4  99 42 00
    CMP $41                      ; $EAA7  C5 41
    BCC loc_1F_EAAD              ; $EAA9  90 02
    STA $41                      ; $EAAB  85 41

loc_1F_EAAD:
    ORA $10                      ; $EAAD  05 10
    STA $10                      ; $EAAF  85 10
    DEC $02                      ; $EAB1  C6 02
    BMI loc_1F_EAE9              ; $EAB3  30 34
    INC $40                      ; $EAB5  E6 40
    LDY $40                      ; $EAB7  A4 40
    LDA $11                      ; $EAB9  A5 11
    PHA                          ; $EABB  48
    AND #$10                     ; $EABC  29 10
    STA $04                      ; $EABE  85 04
    PLA                          ; $EAC0  68
    CLC                          ; $EAC1  18
    ADC $ED09,Y                  ; $EAC2  79 09 ED
    STA $11                      ; $EAC5  85 11
    AND #$10                     ; $EAC7  29 10
    CMP $04                      ; $EAC9  C5 04
    BEQ loc_1F_EA92              ; $EACB  F0 C5
    LDA $03                      ; $EACD  A5 03
    EOR #$02                     ; $EACF  49 02
    STA $03                      ; $EAD1  85 03
    AND #$02                     ; $EAD3  29 02
    BNE loc_1F_EA92              ; $EAD5  D0 BB
    LDA $28                      ; $EAD7  A5 28
    PHA                          ; $EAD9  48
    CLC                          ; $EADA  18
    ADC #$08                     ; $EADB  69 08
    STA $28                      ; $EADD  85 28
    CMP #$40                     ; $EADF  C9 40
    PLA                          ; $EAE1  68
    BCC loc_1F_EA8F              ; $EAE2  90 AB
    STA $28                      ; $EAE4  85 28
    JMP loc_1F_EA92              ; $EAE6  4C 92 EA


loc_1F_EAE9:
    CPX #$00                     ; $EAE9  E0 00
    BNE loc_1F_EB09              ; $EAEB  D0 1C
    LDA $39                      ; $EAED  A5 39
    BNE loc_1F_EB09              ; $EAEF  D0 18
    LDA $3D                      ; $EAF1  A5 3D
    BNE loc_1F_EB09              ; $EAF3  D0 14
    LDA $30                      ; $EAF5  A5 30
    CMP #$06                     ; $EAF7  C9 06
    BEQ loc_1F_EB09              ; $EAF9  F0 0E
    CMP #$0E                     ; $EAFB  C9 0E
    BEQ loc_1F_EB09              ; $EAFD  F0 0A
    LDA $41                      ; $EAFF  A5 41
    CMP #$50                     ; $EB01  C9 50
    BNE loc_1F_EB09              ; $EB03  D0 04
    LDA #$0E                     ; $EB05  A9 0E
    STA $3D                      ; $EB07  85 3D

loc_1F_EB09:
    JMP loc_1F_EB24              ; $EB09  4C 24 EB


sub_1F_EB0C:
    PHA                          ; $EB0C  48
    TXA                          ; $EB0D  8A
    PHA                          ; $EB0E  48
    LDA #$00                     ; $EB0F  A9 00
    STA $10                      ; $EB11  85 10
    STA $41                      ; $EB13  85 41
    LDA $F5                      ; $EB15  A5 F5
    STA $2F                      ; $EB17  85 2F
    LDA $22                      ; $EB19  A5 22
    STA $F5                      ; $EB1B  85 F5
    JSR sub_1F_FF6B              ; $EB1D  20 6B FF
    PLA                          ; $EB20  68
    TAX                          ; $EB21  AA
    PLA                          ; $EB22  68
    RTS                          ; $EB23  60


loc_1F_EB24:
    TXA                          ; $EB24  8A
    PHA                          ; $EB25  48
    LDA $2F                      ; $EB26  A5 2F
    STA $F5                      ; $EB28  85 F5
    JSR sub_1F_FF6B              ; $EB2A  20 6B FF
    PLA                          ; $EB2D  68
    TAX                          ; $EB2E  AA
    RTS                          ; $EB2F  60


sub_1F_EB30:
    STA $06                      ; $EB30  85 06
    STX $05                      ; $EB32  86 05
    CMP #$70                     ; $EB34  C9 70
    BNE loc_1F_EB68              ; $EB36  D0 30
    LDA $22                      ; $EB38  A5 22
    CMP #$02                     ; $EB3A  C9 02
    BEQ loc_1F_EB42              ; $EB3C  F0 04
    CMP #$09                     ; $EB3E  C9 09
    BNE loc_1F_EB68              ; $EB40  D0 26

loc_1F_EB42:
    LDA $13                      ; $EB42  A5 13
    AND #$01                     ; $EB44  29 01
    ASL A                        ; $EB46  0A
    ASL A                        ; $EB47  0A
    ASL A                        ; $EB48  0A
    ASL A                        ; $EB49  0A
    ASL A                        ; $EB4A  0A
    STA $07                      ; $EB4B  85 07
    LDA $28                      ; $EB4D  A5 28
    PHA                          ; $EB4F  48
    LSR A                        ; $EB50  4A
    ORA $07                      ; $EB51  05 07
    TAY                          ; $EB53  A8
    PLA                          ; $EB54  68
    ASL A                        ; $EB55  0A
    ASL A                        ; $EB56  0A
    AND #$04                     ; $EB57  29 04
    ORA $03                      ; $EB59  05 03
    TAX                          ; $EB5B  AA
    LDA $0110,Y                  ; $EB5C  B9 10 01
    AND $EB82,X                  ; $EB5F  3D 82 EB
    BEQ loc_1F_EB68              ; $EB62  F0 04
    LDA #$00                     ; $EB64  A9 00
    STA $06                      ; $EB66  85 06

loc_1F_EB68:
    LDA $06                      ; $EB68  A5 06
    LDX $05                      ; $EB6A  A6 05
    RTS                          ; $EB6C  60


sub_1F_EB6D:
    LDA $22                      ; $EB6D  A5 22
    CMP #$02                     ; $EB6F  C9 02
    BEQ loc_1F_EB77              ; $EB71  F0 04
    CMP #$09                     ; $EB73  C9 09
    BNE loc_1F_EB81              ; $EB75  D0 0A

loc_1F_EB77:
    LDA #$00                     ; $EB77  A9 00
    LDY #$3F                     ; $EB79  A0 3F

loc_1F_EB7B:
    STA $0110,Y                  ; $EB7B  99 10 01
    DEY                          ; $EB7E  88
    BPL loc_1F_EB7B              ; $EB7F  10 FA

loc_1F_EB81:
    RTS                          ; $EB81  60

    .byte $80,$40,$20,$10,$08,$04,$02,$01  ; $EB82

sub_1F_EB8A:
    STA $05                      ; $EB8A  85 05
    STX $06                      ; $EB8C  86 06
    STY $07                      ; $EB8E  84 07
    LDA $68                      ; $EB90  A5 68
    BEQ loc_1F_EBB9              ; $EB92  F0 25
    LDY $22                      ; $EB94  A4 22
    LDX $EBC6,Y                  ; $EB96  BE C6 EB
    BMI loc_1F_EBC0              ; $EB99  30 25
    LDA $EBCE,X                  ; $EB9B  BD CE EB
    CMP $F9                      ; $EB9E  C5 F9
    BNE loc_1F_EBC0              ; $EBA0  D0 1E
    LDA $EBCF,X                  ; $EBA2  BD CF EB
    STA $08                      ; $EBA5  85 08
    LDA $28                      ; $EBA7  A5 28

loc_1F_EBA9:
    CMP $EBD0,X                  ; $EBA9  DD D0 EB
    BEQ loc_1F_EBB5              ; $EBAC  F0 07
    INX                          ; $EBAE  E8
    DEC $08                      ; $EBAF  C6 08
    BPL loc_1F_EBA9              ; $EBB1  10 F6
    BMI loc_1F_EBB9              ; $EBB3  30 04

loc_1F_EBB5:
    LDA #$00                     ; $EBB5  A9 00
    BEQ loc_1F_EBBB              ; $EBB7  F0 02

loc_1F_EBB9:
    LDA $05                      ; $EBB9  A5 05

loc_1F_EBBB:
    LDX $06                      ; $EBBB  A6 06
    LDY $07                      ; $EBBD  A4 07
    RTS                          ; $EBBF  60


loc_1F_EBC0:
    LDA #$00                     ; $EBC0  A9 00
    STA $68                      ; $EBC2  85 68
    BEQ loc_1F_EBB9              ; $EBC4  F0 F3
    ISC $1100,X                  ; $EBC6  FF 00 11
    NOP $FF                      ; $EBC9  04 FF
    ISC $0EFF,X                  ; $EBCB  FF FF 0E
    ORA $01                      ; $EBCE  05 01
    AND ($39),Y                  ; $EBD0  31 39
    SLO ($07),Y                  ; $EBD2  13 07
    RLA ($24,X)                  ; $EBD4  23 24
    ANC #$2C                     ; $EBD6  2B 2C
    RLA ($34),Y                  ; $EBD8  33 34
    RLA $053C,Y                  ; $EBDA  3B 3C 05
    BRK                          ; $EBDD  00
    .byte $31,$09,$00,$00,$00,$05,$09,$0E,$12,$16,$1A,$1F,$24,$28,$2C,$31  ; $EBDE
    .byte $36,$3B,$40,$45,$49,$4E,$53,$57,$5B,$5F,$63,$68,$6C,$70,$75,$79  ; $EBEE
    .byte $7D,$81,$85,$8A,$8F,$94,$99,$9E,$A3,$A8,$AD,$B2,$B7,$BC,$C1,$C6  ; $EBFE
    .byte $CB,$CE,$02,$0C,$F9,$07,$07,$01,$F4,$F9,$0E,$02,$0A,$F1,$0F,$0F  ; $EC0E
    .byte $01,$00,$F9,$0E,$01,$00,$08,$0E,$01,$00,$EA,$0E,$00,$00,$00,$00  ; $EC1E
    .byte $00,$02,$16,$F9,$07,$07,$01,$08,$F9,$0E,$01,$F8,$F9,$0E,$02,$10  ; $EC2E
    .byte $F5,$0B,$0B,$02,$F0,$F5,$0B,$0B,$02,$08,$FC,$04,$04,$00,$00,$00  ; $EC3E
    .byte $00,$00,$02,$0C,$F5,$0B,$0B,$01,$0C,$F5,$16,$02,$18,$F1,$0F,$0F  ; $EC4E
    .byte $02,$E8,$F1,$0F,$0F,$01,$04,$FD,$06,$01,$FC,$FD,$06,$01,$1C,$F9  ; $EC5E
    .byte $0E,$01,$10,$F9,$07,$02,$E8,$F9,$07,$07,$01,$06,$F9,$0E,$01,$08  ; $EC6E
    .byte $F5,$16,$02,$F8,$F5,$0B,$0B,$01,$0C,$F9,$0E,$01,$F4,$F9,$0E,$01  ; $EC7E
    .byte $04,$F9,$0E,$01,$FC,$F9,$0E,$02,$10,$F1,$0F,$0F,$02,$F0,$F1,$0F  ; $EC8E
    .byte $0F,$02,$0D,$F5,$0B,$0B,$02,$F3,$F5,$0B,$0B,$02,$10,$F1,$0F,$0F  ; $EC9E
    .byte $02,$E6,$F1,$0F,$0F,$02,$14,$F1,$0F,$0F,$02,$00,$00,$00,$00,$02  ; $ECAE
    .byte $14,$F0,$10,$10,$02,$EC,$F0,$10,$10,$02,$18,$F1,$0F,$0F,$02,$E8  ; $ECBE
    .byte $F1,$0F,$0F,$02,$1C,$F5,$0B,$0B,$02,$DC,$F5,$0B,$0B,$00,$04,$00  ; $ECCE
    .byte $00,$08,$00,$00,$05,$0A,$0E,$12,$17,$1C,$21,$26,$2A,$2E,$33,$38  ; $ECDE
    .byte $3D,$42,$49,$50,$57,$5E,$65,$6C,$71,$76,$7B,$80,$85,$8A,$8F,$94  ; $ECEE
    .byte $99,$9E,$A2,$A6,$AB,$B0,$B5,$BA,$BF,$02,$08,$F5,$0B,$0B,$02,$F8  ; $ECFE
    .byte $F5,$0B,$0B,$01,$10,$FB,$0C,$01,$F0,$FB,$0C,$02,$00,$F5,$0B,$0B  ; $ED0E
    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01  ; $ED1E
    .byte $08,$F9,$0E,$01,$F8,$F9,$0E,$01,$0C,$F5,$0B,$0B,$02,$F4,$F5,$0B  ; $ED2E
    .byte $0B,$02,$0C,$F5,$0B,$0B,$02,$F4,$F5,$0B,$0B,$04,$10,$E9,$10,$07  ; $ED3E
    .byte $10,$07,$04,$F0,$E9,$10,$07,$10,$07,$04,$0C,$E5,$10,$0B,$10,$0B  ; $ED4E
    .byte $04,$F4,$E5,$10,$0B,$10,$0B,$04,$08,$E5,$10,$0B,$10,$0B,$01,$F8  ; $ED5E
    .byte $E5,$10,$0B,$10,$0B,$02,$10,$F1,$0F,$0F,$02,$F0,$F1,$0F,$0F,$02  ; $ED6E
    .byte $14,$F5,$0B,$0B,$02,$EC,$F5,$0B,$0B,$02,$0C,$F9,$07,$07,$02,$F4  ; $ED7E
    .byte $F9,$07,$07,$02,$0C,$F9,$07,$07,$02,$F4,$F9,$07,$07,$02,$0C,$F9  ; $ED8E
    .byte $07,$07,$02,$F4,$F9,$07,$07,$01,$04,$FD,$06,$01,$FC,$FD,$06,$02  ; $ED9E
    .byte $10,$F1,$0F,$0F,$02,$F0,$F1,$0F,$0F,$02,$14,$EC,$14,$14,$02,$EC  ; $EDAE
    .byte $EC,$14,$14,$02,$10,$E8,$18,$18,$02,$F0,$E8,$18,$18  ; $EDBE

sub_1F_EDCB:
    LDA $12                      ; $EDCB  A5 12
    AND #$0F                     ; $EDCD  29 0F
    STA $12                      ; $EDCF  85 12
    LDA $0360,X                  ; $EDD1  BD 60 03
    SEC                          ; $EDD4  38
    SBC $12                      ; $EDD5  E5 12
    STA $0360,X                  ; $EDD7  9D 60 03
    LDA $0380,X                  ; $EDDA  BD 80 03
    SBC #$00                     ; $EDDD  E9 00
    STA $0380,X                  ; $EDDF  9D 80 03
    RTS                          ; $EDE2  60


sub_1F_EDE3:
    LDA $12                      ; $EDE3  A5 12
    AND #$0F                     ; $EDE5  29 0F
    EOR #$0F                     ; $EDE7  49 0F
    SEC                          ; $EDE9  38
    ADC $0360,X                  ; $EDEA  7D 60 03
    STA $0360,X                  ; $EDED  9D 60 03
    LDA $0380,X                  ; $EDF0  BD 80 03
    ADC #$00                     ; $EDF3  69 00
    STA $0380,X                  ; $EDF5  9D 80 03
    RTS                          ; $EDF8  60


sub_1F_EDF9:
    LDA $11                      ; $EDF9  A5 11
    AND #$0F                     ; $EDFB  29 0F
    EOR #$0F                     ; $EDFD  49 0F
    SEC                          ; $EDFF  38
    ADC $03C0,X                  ; $EE00  7D C0 03
    STA $03C0,X                  ; $EE03  9D C0 03
    CMP #$F0                     ; $EE06  C9 F0
    BCC loc_1F_EE12              ; $EE08  90 08
    ADC #$0F                     ; $EE0A  69 0F
    STA $03C0,X                  ; $EE0C  9D C0 03
    INC $03E0,X                  ; $EE0F  FE E0 03

loc_1F_EE12:
    RTS                          ; $EE12  60


sub_1F_EE13:
    LDA $11                      ; $EE13  A5 11
    PHA                          ; $EE15  48
    AND #$0F                     ; $EE16  29 0F
    STA $11                      ; $EE18  85 11
    LDA $03C0,X                  ; $EE1A  BD C0 03
    SEC                          ; $EE1D  38
    SBC $11                      ; $EE1E  E5 11
    STA $03C0,X                  ; $EE20  9D C0 03
    BCS loc_1F_EE2D              ; $EE23  B0 08
    SBC #$0F                     ; $EE25  E9 0F
    STA $03C0,X                  ; $EE27  9D C0 03
    DEC $03E0,X                  ; $EE2A  DE E0 03

loc_1F_EE2D:
    PLA                          ; $EE2D  68
    STA $11                      ; $EE2E  85 11
    RTS                          ; $EE30  60


sub_1F_EE31:
    LDA $F4                      ; $EE31  A5 F4
    PHA                          ; $EE33  48
    LDA #$10                     ; $EE34  A9 10
    STA $F4                      ; $EE36  85 F4
    JSR sub_1F_FF6B              ; $EE38  20 6B FF
    JSR $8000                    ; $EE3B  20 00 80
    PLA                          ; $EE3E  68
    STA $F4                      ; $EE3F  85 F4
    JMP sub_1F_FF6B              ; $EE41  4C 6B FF


sub_1F_EE44:
    LDA $F4                      ; $EE44  A5 F4
    PHA                          ; $EE46  48
    LDA #$10                     ; $EE47  A9 10
    STA $F4                      ; $EE49  85 F4
    JSR sub_1F_FF6B              ; $EE4B  20 6B FF
    JSR $8003                    ; $EE4E  20 03 80
    PLA                          ; $EE51  68
    STA $F4                      ; $EE52  85 F4
    JMP sub_1F_FF6B              ; $EE54  4C 6B FF


sub_1F_EE57:
    SEC                          ; $EE57  38
    LDA $1A                      ; $EE58  A5 1A
    ORA $19                      ; $EE5A  05 19
    BNE loc_1F_EEAA              ; $EE5C  D0 4C
    LDA #$08                     ; $EE5E  A9 08
    STA $0780                    ; $EE60  8D 80 07
    LDA $03C0,X                  ; $EE63  BD C0 03
    AND #$F0                     ; $EE66  29 F0
    ASL A                        ; $EE68  0A
    ROL $0780                    ; $EE69  2E 80 07
    ASL A                        ; $EE6C  0A
    ROL $0780                    ; $EE6D  2E 80 07
    STA $0781                    ; $EE70  8D 81 07
    LDA $0360,X                  ; $EE73  BD 60 03
    AND #$F0                     ; $EE76  29 F0
    LSR A                        ; $EE78  4A
    LSR A                        ; $EE79  4A
    LSR A                        ; $EE7A  4A
    ORA $0781                    ; $EE7B  0D 81 07
    STA $0781                    ; $EE7E  8D 81 07
    ORA #$20                     ; $EE81  09 20
    STA $0786                    ; $EE83  8D 86 07
    LDA #$01                     ; $EE86  A9 01
    STA $0782                    ; $EE88  8D 82 07
    STA $0787                    ; $EE8B  8D 87 07
    LDA $0780                    ; $EE8E  AD 80 07
    STA $0785                    ; $EE91  8D 85 07
    LDA #$00                     ; $EE94  A9 00
    STA $0783                    ; $EE96  8D 83 07
    STA $0784                    ; $EE99  8D 84 07
    STA $0788                    ; $EE9C  8D 88 07
    STA $0789                    ; $EE9F  8D 89 07
    LDA #$FF                     ; $EEA2  A9 FF
    STA $078A                    ; $EEA4  8D 8A 07
    STA $19                      ; $EEA7  85 19
    CLC                          ; $EEA9  18

loc_1F_EEAA:
    RTS                          ; $EEAA  60


sub_1F_EEAB:
    LDA $28                      ; $EEAB  A5 28
    PHA                          ; $EEAD  48
    AND #$07                     ; $EEAE  29 07
    ASL A                        ; $EEB0  0A
    ASL A                        ; $EEB1  0A
    STA $0781                    ; $EEB2  8D 81 07
    LDA #$02                     ; $EEB5  A9 02
    STA $0780                    ; $EEB7  8D 80 07
    PLA                          ; $EEBA  68
    AND #$F8                     ; $EEBB  29 F8
    ASL A                        ; $EEBD  0A
    ROL $0780                    ; $EEBE  2E 80 07
    ASL A                        ; $EEC1  0A
    ROL $0780                    ; $EEC2  2E 80 07
    ASL A                        ; $EEC5  0A
    ROL $0780                    ; $EEC6  2E 80 07
    ASL A                        ; $EEC9  0A
    ROL $0780                    ; $EECA  2E 80 07
    ORA $0781                    ; $EECD  0D 81 07
    STA $0781                    ; $EED0  8D 81 07
    CLC                          ; $EED3  18
    ADC #$20                     ; $EED4  69 20
    STA $0788                    ; $EED6  8D 88 07
    ADC #$20                     ; $EED9  69 20
    STA $078F                    ; $EEDB  8D 8F 07
    ADC #$20                     ; $EEDE  69 20
    STA $0796                    ; $EEE0  8D 96 07
    LDA $28                      ; $EEE3  A5 28
    ORA #$C0                     ; $EEE5  09 C0
    STA $079D                    ; $EEE7  8D 9D 07
    LDA $0780                    ; $EEEA  AD 80 07
    ORA $10                      ; $EEED  05 10
    STA $0780                    ; $EEEF  8D 80 07
    STA $0787                    ; $EEF2  8D 87 07
    STA $078E                    ; $EEF5  8D 8E 07
    STA $0795                    ; $EEF8  8D 95 07
    ORA #$03                     ; $EEFB  09 03
    STA $079C                    ; $EEFD  8D 9C 07
    LDA #$03                     ; $EF00  A9 03
    STA $0782                    ; $EF02  8D 82 07
    STA $0789                    ; $EF05  8D 89 07
    STA $0790                    ; $EF08  8D 90 07
    STA $0797                    ; $EF0B  8D 97 07
    LDA #$00                     ; $EF0E  A9 00
    STA $079E                    ; $EF10  8D 9E 07
    LDA $68                      ; $EF13  A5 68
    BEQ loc_1F_EF26              ; $EF15  F0 0F
    LDA #$00                     ; $EF17  A9 00
    STA $01                      ; $EF19  85 01
    LDA $11                      ; $EF1B  A5 11
    JSR sub_1F_E88D              ; $EF1D  20 8D E8
    JSR sub_1F_E7F4              ; $EF20  20 F4 E7
    JMP loc_1F_EF2D              ; $EF23  4C 2D EF


loc_1F_EF26:
    TYA                          ; $EF26  98
    JSR sub_1F_E8B4              ; $EF27  20 B4 E8
    JSR sub_1F_E7F1              ; $EF2A  20 F1 E7

loc_1F_EF2D:
    LDX #$03                     ; $EF2D  A2 03

loc_1F_EF2F:
    LDA $06C0,X                  ; $EF2F  BD C0 06
    STA $0783,X                  ; $EF32  9D 83 07
    LDA $06C4,X                  ; $EF35  BD C4 06
    STA $078A,X                  ; $EF38  9D 8A 07
    LDA $06C8,X                  ; $EF3B  BD C8 06
    STA $0791,X                  ; $EF3E  9D 91 07
    LDA $06CC,X                  ; $EF41  BD CC 06
    STA $0798,X                  ; $EF44  9D 98 07
    DEX                          ; $EF47  CA
    BPL loc_1F_EF2F              ; $EF48  10 E5
    LDA $10                      ; $EF4A  A5 10
    STA $079F                    ; $EF4C  8D 9F 07
    STX $07A0                    ; $EF4F  8E A0 07
    LDA $28                      ; $EF52  A5 28
    AND #$3F                     ; $EF54  29 3F
    CMP #$38                     ; $EF56  C9 38
    BCC loc_1F_EF65              ; $EF58  90 0B
    LDX #$04                     ; $EF5A  A2 04

loc_1F_EF5C:
    LDA $079C,X                  ; $EF5C  BD 9C 07
    STA $078E,X                  ; $EF5F  9D 8E 07
    DEX                          ; $EF62  CA
    BPL loc_1F_EF5C              ; $EF63  10 F7

loc_1F_EF65:
    STX $19                      ; $EF65  86 19
    RTS                          ; $EF67  60


loc_1F_EF68:
    LDA #$00                     ; $EF68  A9 00
    STA $70                      ; $EF6A  85 70
    LDA #$23                     ; $EF6C  A9 23
    ORA $10                      ; $EF6E  05 10
    STA $0780                    ; $EF70  8D 80 07
    LDA #$C0                     ; $EF73  A9 C0
    STA $0781                    ; $EF75  8D 81 07
    LDY #$3F                     ; $EF78  A0 3F
    STY $0782                    ; $EF7A  8C 82 07

loc_1F_EF7D:
    LDA $0640,Y                  ; $EF7D  B9 40 06
    STA $0783,Y                  ; $EF80  99 83 07
    DEY                          ; $EF83  88
    BPL loc_1F_EF7D              ; $EF84  10 F7
    STY $07C3                    ; $EF86  8C C3 07
    STY $19                      ; $EF89  84 19
    RTS                          ; $EF8B  60


sub_1F_EF8C:
    LDA $70                      ; $EF8C  A5 70
    CMP #$40                     ; $EF8E  C9 40
    BEQ loc_1F_EF68              ; $EF90  F0 D6
    STA $28                      ; $EF92  85 28
    PHA                          ; $EF94  48
    AND #$07                     ; $EF95  29 07
    ASL A                        ; $EF97  0A
    ASL A                        ; $EF98  0A
    STA $0781                    ; $EF99  8D 81 07
    LDA #$02                     ; $EF9C  A9 02
    STA $0780                    ; $EF9E  8D 80 07
    PLA                          ; $EFA1  68
    AND #$F8                     ; $EFA2  29 F8
    ASL A                        ; $EFA4  0A
    ROL $0780                    ; $EFA5  2E 80 07
    ASL A                        ; $EFA8  0A
    ROL $0780                    ; $EFA9  2E 80 07
    ASL A                        ; $EFAC  0A
    ROL $0780                    ; $EFAD  2E 80 07
    ASL A                        ; $EFB0  0A
    ROL $0780                    ; $EFB1  2E 80 07
    ORA $0781                    ; $EFB4  0D 81 07
    STA $0781                    ; $EFB7  8D 81 07
    CLC                          ; $EFBA  18
    ADC #$20                     ; $EFBB  69 20
    STA $0794                    ; $EFBD  8D 94 07
    ADC #$20                     ; $EFC0  69 20
    STA $07A7                    ; $EFC2  8D A7 07
    ADC #$20                     ; $EFC5  69 20
    STA $07BA                    ; $EFC7  8D BA 07
    LDA $0780                    ; $EFCA  AD 80 07
    ORA $10                      ; $EFCD  05 10
    STA $0780                    ; $EFCF  8D 80 07
    STA $0793                    ; $EFD2  8D 93 07
    STA $07A6                    ; $EFD5  8D A6 07
    STA $07B9                    ; $EFD8  8D B9 07
    LDA #$0F                     ; $EFDB  A9 0F
    STA $0782                    ; $EFDD  8D 82 07
    STA $0795                    ; $EFE0  8D 95 07
    STA $07A8                    ; $EFE3  8D A8 07
    STA $07BB                    ; $EFE6  8D BB 07

loc_1F_EFE9:
    JSR sub_1F_E7F1              ; $EFE9  20 F1 E7
    LDA $28                      ; $EFEC  A5 28
    AND #$03                     ; $EFEE  29 03
    TAX                          ; $EFF0  AA
    LDY $F030,X                  ; $EFF1  BC 30 F0
    LDX #$00                     ; $EFF4  A2 00

loc_1F_EFF6:
    LDA $06C0,X                  ; $EFF6  BD C0 06
    STA $0780,Y                  ; $EFF9  99 80 07
    INY                          ; $EFFC  C8
    INX                          ; $EFFD  E8
    TXA                          ; $EFFE  8A
    AND #$03                     ; $EFFF  29 03
    BNE loc_1F_EFF6              ; $F001  D0 F3
    TYA                          ; $F003  98
    CLC                          ; $F004  18
    ADC #$0F                     ; $F005  69 0F
    PHA                          ; $F007  48
    LDY $28                      ; $F008  A4 28
    LDA $10                      ; $F00A  A5 10
    STA $0640,Y                  ; $F00C  99 40 06
    PLA                          ; $F00F  68
    TAY                          ; $F010  A8
    CPY #$4C                     ; $F011  C0 4C
    BCC loc_1F_EFF6              ; $F013  90 E1
    INC $70                      ; $F015  E6 70
    INC $28                      ; $F017  E6 28
    LDA $28                      ; $F019  A5 28
    AND #$03                     ; $F01B  29 03
    BNE loc_1F_EFE9              ; $F01D  D0 CA
    LDA #$FF                     ; $F01F  A9 FF
    STA $07CC                    ; $F021  8D CC 07
    LDY $28                      ; $F024  A4 28
    CPY #$39                     ; $F026  C0 39
    BCC loc_1F_F02D              ; $F028  90 03
    STA $07A6                    ; $F02A  8D A6 07

loc_1F_F02D:
    STA $19                      ; $F02D  85 19
    RTS                          ; $F02F  60

    .byte $03,$07,$0B,$0F  ; $F030

sub_1F_F034:
    INC $95                      ; $F034  E6 95
    INC $4F                      ; $F036  E6 4F
    LDA $95                      ; $F038  A5 95
    LSR A                        ; $F03A  4A
    BCS loc_1F_F055              ; $F03B  B0 18
    JSR sub_1F_F298              ; $F03D  20 98 F2
    LDX #$00                     ; $F040  A2 00
    STX $96                      ; $F042  86 96

loc_1F_F044:
    LDA $0300,X                  ; $F044  BD 00 03
    BPL loc_1F_F04C              ; $F047  10 03
    JSR sub_1F_F06B              ; $F049  20 6B F0

loc_1F_F04C:
    INC $96                      ; $F04C  E6 96
    LDX $96                      ; $F04E  A6 96
    CPX #$20                     ; $F050  E0 20
    BNE loc_1F_F044              ; $F052  D0 F0
    RTS                          ; $F054  60


loc_1F_F055:
    LDX #$1F                     ; $F055  A2 1F
    STX $96                      ; $F057  86 96

loc_1F_F059:
    LDA $0300,X                  ; $F059  BD 00 03
    BPL loc_1F_F061              ; $F05C  10 03
    JSR sub_1F_F06B              ; $F05E  20 6B F0

loc_1F_F061:
    DEC $96                      ; $F061  C6 96
    LDX $96                      ; $F063  A6 96
    BPL loc_1F_F059              ; $F065  10 F2
    JSR sub_1F_F298              ; $F067  20 98 F2
    RTS                          ; $F06A  60


sub_1F_F06B:
    LDA $0580,X                  ; $F06B  BD 80 05
    AND #$10                     ; $F06E  29 10
    BEQ loc_1F_F0F1              ; $F070  F0 7F
    LDA $0360,X                  ; $F072  BD 60 03
    SEC                          ; $F075  38
    SBC $FC                      ; $F076  E5 FC
    STA $13                      ; $F078  85 13
    LDA $0380,X                  ; $F07A  BD 80 03
    SBC $F9                      ; $F07D  E5 F9
    BNE loc_1F_F091              ; $F07F  D0 10
    LDA $03E0,X                  ; $F081  BD E0 03
    BEQ loc_1F_F0F6              ; $F084  F0 70
    CPX #$00                     ; $F086  E0 00
    BEQ loc_1F_F0AF              ; $F088  F0 25
    LDA $03E0,X                  ; $F08A  BD E0 03
    BMI loc_1F_F0AF              ; $F08D  30 20
    BPL loc_1F_F0A4              ; $F08F  10 13

loc_1F_F091:
    LDA $0580,X                  ; $F091  BD 80 05
    AND #$08                     ; $F094  29 08
    BEQ loc_1F_F0A4              ; $F096  F0 0C
    LDA $13                      ; $F098  A5 13
    BCS loc_1F_F0A0              ; $F09A  B0 04
    EOR #$FF                     ; $F09C  49 FF
    ADC #$01                     ; $F09E  69 01

loc_1F_F0A0:
    CMP #$48                     ; $F0A0  C9 48
    BCC loc_1F_F0AF              ; $F0A2  90 0B

loc_1F_F0A4:
    LDA #$00                     ; $F0A4  A9 00
    STA $0300,X                  ; $F0A6  9D 00 03
    LDA #$FF                     ; $F0A9  A9 FF
    STA $04C0,X                  ; $F0AB  9D C0 04
    RTS                          ; $F0AE  60


loc_1F_F0AF:
    LDA $0580,X                  ; $F0AF  BD 80 05
    AND #$7F                     ; $F0B2  29 7F
    STA $0580,X                  ; $F0B4  9D 80 05
    CPX #$00                     ; $F0B7  E0 00
    BNE loc_1F_F0EE              ; $F0B9  D0 33
    LDA $17                      ; $F0BB  A5 17
    AND #$01                     ; $F0BD  29 01
    BNE loc_1F_F0D9              ; $F0BF  D0 18
    LDA $03E0                    ; $F0C1  AD E0 03
    BMI loc_1F_F0EE              ; $F0C4  30 28
    LDA #$0E                     ; $F0C6  A9 0E
    CMP $30                      ; $F0C8  C5 30
    BEQ loc_1F_F0D8              ; $F0CA  F0 0C
    STA $30                      ; $F0CC  85 30
    LDA #$F2                     ; $F0CE  A9 F2
    JSR sub_1F_F89A              ; $F0D0  20 9A F8
    LDA #$17                     ; $F0D3  A9 17
    JSR sub_1F_F89A              ; $F0D5  20 9A F8

loc_1F_F0D8:
    RTS                          ; $F0D8  60


loc_1F_F0D9:
    LDA $03E0                    ; $F0D9  AD E0 03
    CMP #$01                     ; $F0DC  C9 01
    BNE loc_1F_F0EE              ; $F0DE  D0 0E
    LDA #$01                     ; $F0E0  A9 01
    STA $30                      ; $F0E2  85 30
    LDA #$10                     ; $F0E4  A9 10
    STA $0440                    ; $F0E6  8D 40 04
    LDA #$0D                     ; $F0E9  A9 0D
    STA $0460                    ; $F0EB  8D 60 04

loc_1F_F0EE:
    JMP loc_1F_F108              ; $F0EE  4C 08 F1


loc_1F_F0F1:
    LDA $0360,X                  ; $F0F1  BD 60 03
    STA $13                      ; $F0F4  85 13

loc_1F_F0F6:
    LDA $03C0,X                  ; $F0F6  BD C0 03
    STA $12                      ; $F0F9  85 12
    LDA $0580,X                  ; $F0FB  BD 80 05
    ORA #$80                     ; $F0FE  09 80
    STA $0580,X                  ; $F100  9D 80 05
    AND #$04                     ; $F103  29 04
    BEQ loc_1F_F108              ; $F105  F0 01

loc_1F_F107:
    RTS                          ; $F107  60


loc_1F_F108:
    LDY #$00                     ; $F108  A0 00
    LDA $0580,X                  ; $F10A  BD 80 05
    AND #$40                     ; $F10D  29 40
    STA $10                      ; $F10F  85 10
    BEQ loc_1F_F114              ; $F111  F0 01
    INY                          ; $F113  C8

loc_1F_F114:
    STY $11                      ; $F114  84 11
    CPX #$10                     ; $F116  E0 10
    BCC loc_1F_F126              ; $F118  90 0C
    LDA $5A                      ; $F11A  A5 5A
    BEQ loc_1F_F126              ; $F11C  F0 08
    LDY #$15                     ; $F11E  A0 15
    CPY $F4                      ; $F120  C4 F4
    BEQ loc_1F_F13B              ; $F122  F0 17
    BNE loc_1F_F132              ; $F124  D0 0C

loc_1F_F126:
    LDY #$1A                     ; $F126  A0 1A
    LDA $05C0,X                  ; $F128  BD C0 05
    BPL loc_1F_F12E              ; $F12B  10 01
    INY                          ; $F12D  C8

loc_1F_F12E:
    CPY $F4                      ; $F12E  C4 F4
    BEQ loc_1F_F13B              ; $F130  F0 09

loc_1F_F132:
    STY $F4                      ; $F132  84 F4
    STX $00                      ; $F134  86 00
    JSR sub_1F_FF6B              ; $F136  20 6B FF
    LDX $00                      ; $F139  A6 00

loc_1F_F13B:
    LDA $05C0,X                  ; $F13B  BD C0 05
    BEQ loc_1F_F107              ; $F13E  F0 C7
    AND #$7F                     ; $F140  29 7F
    TAY                          ; $F142  A8
    LDA $8000,Y                  ; $F143  B9 00 80
    STA $00                      ; $F146  85 00
    LDA $8080,Y                  ; $F148  B9 80 80
    STA $01                      ; $F14B  85 01
    LDA $17                      ; $F14D  A5 17
    AND #$08                     ; $F14F  29 08
    BEQ loc_1F_F15F              ; $F151  F0 0C
    LDA $95                      ; $F153  A5 95
    AND #$07                     ; $F155  29 07
    BNE loc_1F_F18B              ; $F157  D0 32
    LDA $17                      ; $F159  A5 17
    AND #$80                     ; $F15B  29 80
    BNE loc_1F_F18B              ; $F15D  D0 2C

loc_1F_F15F:
    LDA $58                      ; $F15F  A5 58
    BNE loc_1F_F18B              ; $F161  D0 28
    LDA $05E0,X                  ; $F163  BD E0 05
    AND #$7F                     ; $F166  29 7F
    INC $05E0,X                  ; $F168  FE E0 05
    LDY #$01                     ; $F16B  A0 01
    CMP ($00),Y                  ; $F16D  D1 00
    BNE loc_1F_F18B              ; $F16F  D0 1A
    LDA $05E0,X                  ; $F171  BD E0 05
    AND #$80                     ; $F174  29 80
    STA $05E0,X                  ; $F176  9D E0 05
    LDA $05A0,X                  ; $F179  BD A0 05
    AND #$7F                     ; $F17C  29 7F
    INC $05A0,X                  ; $F17E  FE A0 05
    DEY                          ; $F181  88
    CMP ($00),Y                  ; $F182  D1 00
    BNE loc_1F_F18B              ; $F184  D0 05
    LDA #$00                     ; $F186  A9 00
    STA $05A0,X                  ; $F188  9D A0 05

loc_1F_F18B:
    LDA $0580,X                  ; $F18B  BD 80 05
    BPL loc_1F_F1E3              ; $F18E  10 53
    LDA $05E0,X                  ; $F190  BD E0 05
    BPL loc_1F_F19B              ; $F193  10 06
    LDA $92                      ; $F195  A5 92
    AND #$04                     ; $F197  29 04
    BNE loc_1F_F1E3              ; $F199  D0 48

loc_1F_F19B:
    CPX #$10                     ; $F19B  E0 10
    BCC loc_1F_F1CE              ; $F19D  90 2F
    LDA $04E0,X                  ; $F19F  BD E0 04
    AND #$E0                     ; $F1A2  29 E0
    BEQ loc_1F_F1CE              ; $F1A4  F0 28
    LDA $0300,X                  ; $F1A6  BD 00 03
    AND #$40                     ; $F1A9  29 40
    BEQ loc_1F_F1B3              ; $F1AB  F0 06
    LDA $4F                      ; $F1AD  A5 4F
    AND #$03                     ; $F1AF  29 03
    BNE loc_1F_F1BC              ; $F1B1  D0 09

loc_1F_F1B3:
    LDA $04E0,X                  ; $F1B3  BD E0 04
    SEC                          ; $F1B6  38
    SBC #$20                     ; $F1B7  E9 20
    STA $04E0,X                  ; $F1B9  9D E0 04

loc_1F_F1BC:
    LDA $0300,X                  ; $F1BC  BD 00 03
    AND #$40                     ; $F1BF  29 40
    BEQ loc_1F_F1E3              ; $F1C1  F0 20
    LDA $04E0,X                  ; $F1C3  BD E0 04
    AND #$20                     ; $F1C6  29 20
    BEQ loc_1F_F1CE              ; $F1C8  F0 04
    LDA #$AF                     ; $F1CA  A9 AF
    BNE loc_1F_F1E4              ; $F1CC  D0 16

loc_1F_F1CE:
    LDA $05A0,X                  ; $F1CE  BD A0 05
    AND #$7F                     ; $F1D1  29 7F
    CLC                          ; $F1D3  18
    ADC #$02                     ; $F1D4  69 02
    TAY                          ; $F1D6  A8
    LDA ($00),Y                  ; $F1D7  B1 00
    BNE loc_1F_F1E4              ; $F1D9  D0 09
    STA $0300,X                  ; $F1DB  9D 00 03
    LDA #$FF                     ; $F1DE  A9 FF
    STA $04C0,X                  ; $F1E0  9D C0 04

loc_1F_F1E3:
    RTS                          ; $F1E3  60


loc_1F_F1E4:
    TAY                          ; $F1E4  A8
    LDA $8100,Y                  ; $F1E5  B9 00 81
    STA $02                      ; $F1E8  85 02
    LDA $8200,Y                  ; $F1EA  B9 00 82
    STA $03                      ; $F1ED  85 03
    LDY #$00                     ; $F1EF  A0 00
    LDA ($02),Y                  ; $F1F1  B1 02
    PHA                          ; $F1F3  48
    LDY #$19                     ; $F1F4  A0 19
    PLA                          ; $F1F6  68
    BPL loc_1F_F1FD              ; $F1F7  10 04
    AND #$7F                     ; $F1F9  29 7F
    LDY #$14                     ; $F1FB  A0 14

loc_1F_F1FD:
    STA $04                      ; $F1FD  85 04
    CPY $F5                      ; $F1FF  C4 F5
    BEQ loc_1F_F20C              ; $F201  F0 09
    STY $F5                      ; $F203  84 F5
    STX $05                      ; $F205  86 05
    JSR sub_1F_FF6B              ; $F207  20 6B FF
    LDX $05                      ; $F20A  A6 05

loc_1F_F20C:
    LDY #$01                     ; $F20C  A0 01
    LDA ($02),Y                  ; $F20E  B1 02
    CLC                          ; $F210  18
    ADC $11                      ; $F211  65 11
    PHA                          ; $F213  48
    LDA $0580,X                  ; $F214  BD 80 05
    AND #$20                     ; $F217  29 20
    STA $11                      ; $F219  85 11
    PLA                          ; $F21B  68
    TAX                          ; $F21C  AA
    LDA $BE00,X                  ; $F21D  BD 00 BE
    SEC                          ; $F220  38
    SBC #$02                     ; $F221  E9 02
    STA $05                      ; $F223  85 05
    LDA $BF00,X                  ; $F225  BD 00 BF
    SBC #$00                     ; $F228  E9 00
    STA $06                      ; $F22A  85 06
    LDX $97                      ; $F22C  A6 97
    BEQ loc_1F_F28F              ; $F22E  F0 5F

loc_1F_F230:
    LDA #$F0                     ; $F230  A9 F0
    STA $00                      ; $F232  85 00
    LDA $22                      ; $F234  A5 22
    CMP #$08                     ; $F236  C9 08
    BNE loc_1F_F248              ; $F238  D0 0E
    LDA $F9                      ; $F23A  A5 F9
    CMP #$15                     ; $F23C  C9 15
    BEQ loc_1F_F244              ; $F23E  F0 04
    CMP #$1A                     ; $F240  C9 1A
    BNE loc_1F_F248              ; $F242  D0 04

loc_1F_F244:
    LDA #$B0                     ; $F244  A9 B0
    STA $00                      ; $F246  85 00

loc_1F_F248:
    INY                          ; $F248  C8
    LDA ($02),Y                  ; $F249  B1 02
    STA $0201,X                  ; $F24B  9D 01 02
    LDA $12                      ; $F24E  A5 12
    CLC                          ; $F250  18
    ADC ($05),Y                  ; $F251  71 05
    STA $0200,X                  ; $F253  9D 00 02
    LDA ($05),Y                  ; $F256  B1 05
    BMI loc_1F_F25E              ; $F258  30 04
    BCC loc_1F_F260              ; $F25A  90 04
    BCS loc_1F_F290              ; $F25C  B0 32

loc_1F_F25E:
    BCC loc_1F_F290              ; $F25E  90 30

loc_1F_F260:
    LDA $0200,X                  ; $F260  BD 00 02
    CMP $00                      ; $F263  C5 00
    BCS loc_1F_F290              ; $F265  B0 29
    INY                          ; $F267  C8
    LDA ($02),Y                  ; $F268  B1 02
    EOR $10                      ; $F26A  45 10
    ORA $11                      ; $F26C  05 11
    STA $0202,X                  ; $F26E  9D 02 02
    LDA $13                      ; $F271  A5 13
    CLC                          ; $F273  18
    ADC ($05),Y                  ; $F274  71 05
    STA $0203,X                  ; $F276  9D 03 02
    LDA ($05),Y                  ; $F279  B1 05
    BMI loc_1F_F281              ; $F27B  30 04
    BCC loc_1F_F283              ; $F27D  90 04
    BCS loc_1F_F291              ; $F27F  B0 10

loc_1F_F281:
    BCC loc_1F_F291              ; $F281  90 0E

loc_1F_F283:
    INX                          ; $F283  E8
    INX                          ; $F284  E8
    INX                          ; $F285  E8
    INX                          ; $F286  E8
    STX $97                      ; $F287  86 97
    BEQ loc_1F_F28F              ; $F289  F0 04

loc_1F_F28B:
    DEC $04                      ; $F28B  C6 04
    BPL loc_1F_F230              ; $F28D  10 A1

loc_1F_F28F:
    RTS                          ; $F28F  60


loc_1F_F290:
    INY                          ; $F290  C8

loc_1F_F291:
    LDA #$F8                     ; $F291  A9 F8
    STA $0200,X                  ; $F293  9D 00 02
    BNE loc_1F_F28B              ; $F296  D0 F3

sub_1F_F298:
    LDA $95                      ; $F298  A5 95
    LSR A                        ; $F29A  4A
    BCS loc_1F_F2AD              ; $F29B  B0 10
    LDX #$00                     ; $F29D  A2 00
    STX $10                      ; $F29F  86 10

loc_1F_F2A1:
    JSR sub_1F_F2BB              ; $F2A1  20 BB F2
    INC $10                      ; $F2A4  E6 10
    LDX $10                      ; $F2A6  A6 10
    CPX #$03                     ; $F2A8  E0 03
    BNE loc_1F_F2A1              ; $F2AA  D0 F5
    RTS                          ; $F2AC  60


loc_1F_F2AD:
    LDX #$02                     ; $F2AD  A2 02
    STX $10                      ; $F2AF  86 10

loc_1F_F2B1:
    JSR sub_1F_F2BB              ; $F2B1  20 BB F2
    DEC $10                      ; $F2B4  C6 10
    LDX $10                      ; $F2B6  A6 10
    BPL loc_1F_F2B1              ; $F2B8  10 F7

loc_1F_F2BA:
    RTS                          ; $F2BA  60


sub_1F_F2BB:
    LDA $B1,X                    ; $F2BB  B5 B1
    BPL loc_1F_F2BA              ; $F2BD  10 FB
    AND #$7F                     ; $F2BF  29 7F
    TAY                          ; $F2C1  A8
    LDA $00A2,Y                  ; $F2C2  B9 A2 00
    AND #$7F                     ; $F2C5  29 7F
    STA $00                      ; $F2C7  85 00
    LDA $F318,X                  ; $F2C9  BD 18 F3
    STA $01                      ; $F2CC  85 01
    LDA $F31B,X                  ; $F2CE  BD 1B F3
    STA $02                      ; $F2D1  85 02
    LDX $97                      ; $F2D3  A6 97
    BEQ loc_1F_F310              ; $F2D5  F0 39
    LDA #$48                     ; $F2D7  A9 48
    STA $03                      ; $F2D9  85 03

loc_1F_F2DB:
    LDA $01                      ; $F2DB  A5 01
    STA $0202,X                  ; $F2DD  9D 02 02
    LDA $02                      ; $F2E0  A5 02
    STA $0203,X                  ; $F2E2  9D 03 02
    LDA $03                      ; $F2E5  A5 03
    STA $0200,X                  ; $F2E7  9D 00 02
    LDY #$04                     ; $F2EA  A0 04
    LDA $00                      ; $F2EC  A5 00
    SEC                          ; $F2EE  38
    SBC #$04                     ; $F2EF  E9 04
    BCS loc_1F_F2F7              ; $F2F1  B0 04
    LDY $00                      ; $F2F3  A4 00
    LDA #$00                     ; $F2F5  A9 00

loc_1F_F2F7:
    STA $00                      ; $F2F7  85 00
    LDA $F313,Y                  ; $F2F9  B9 13 F3
    STA $0201,X                  ; $F2FC  9D 01 02
    INX                          ; $F2FF  E8
    INX                          ; $F300  E8
    INX                          ; $F301  E8
    INX                          ; $F302  E8
    BEQ loc_1F_F310              ; $F303  F0 0B
    LDA $03                      ; $F305  A5 03
    SEC                          ; $F307  38
    SBC #$08                     ; $F308  E9 08
    STA $03                      ; $F30A  85 03
    CMP #$10                     ; $F30C  C9 10
    BNE loc_1F_F2DB              ; $F30E  D0 CB

loc_1F_F310:
    STX $97                      ; $F310  86 97
    RTS                          ; $F312  60

    .byte $6B,$6A,$69,$68,$67,$00,$01,$02,$10,$18,$28,$A0,$FB,$2A,$EC,$88  ; $F313
    .byte $DF,$B8,$FE,$08,$50,$0A,$EB,$0A,$6D,$8A,$6F,$2A,$D0,$A0,$B7,$8E  ; $F323
    .byte $CD,$0A,$EC,$28,$C8,$28,$13,$A0,$F7,$68,$83,$80,$CC,$A8,$BE,$AA  ; $F333
    .byte $FB,$AA,$ED,$2A,$F9,$08,$F4,$A8,$F7,$AA,$FB,$20,$CF,$2A,$9F,$28  ; $F343
    .byte $BF,$CA,$FC,$E0,$78,$CA,$FF,$A2,$BF,$20,$FB,$6A,$FF,$28,$FE,$AA  ; $F353
    .byte $66,$A8,$B7,$8A,$59,$A2,$B2,$2B,$AD,$0A,$96,$22,$3A,$82,$CA,$2A  ; $F363
    .byte $DB,$A8,$92,$9A,$27,$88,$7E,$2A,$E7,$46,$EE,$A2,$E9,$26,$C6,$C8  ; $F373
    .byte $8C,$02,$DE,$B6,$AF,$E2,$5F,$EA,$7D,$8A,$BB,$BA,$EC,$02,$FE,$90  ; $F383
    .byte $E7,$88,$F7,$AE,$FE,$EA,$EE,$2A,$B9,$2A,$BB,$A8,$77,$40,$E3,$AA  ; $F393
    .byte $3D,$0A,$B2,$B8,$4F,$8A,$B8,$CC,$FB,$A2,$FB,$81,$6E,$B2,$AD,$82  ; $F3A3
    .byte $EF,$93,$76,$AC,$5F,$2E,$CF,$04,$E1,$B0,$FF,$82,$9C,$2A,$FF,$6A  ; $F3B3
    .byte $83,$A8,$D8,$AA,$4F,$2B,$F3,$28,$5C,$2E,$D4,$8A,$52,$82,$67,$0A  ; $F3C3
    .byte $D3,$EA,$5E,$0A,$9C,$8A,$36,$82,$AB,$2A,$7E,$AD,$F8,$A0,$CE,$2A  ; $F3D3
    .byte $2D,$A0,$ED,$88,$9F,$88,$D7,$2A,$BF,$AA,$78,$A0,$ED,$A8,$DC,$0E  ; $F3E3
    .byte $9B,$28,$FE,$EA,$75,$A2,$57,$A8,$99,$A2,$7F,$A2,$B9,$7A,$04,$FC  ; $F3F3
    .byte $11,$DC,$05,$3B,$05,$9B,$40,$4B,$55,$3C,$51,$8A,$00,$67,$54,$72  ; $F403
    .byte $15,$1A,$11,$59,$15,$AA,$45,$16,$41,$47,$05,$A0,$51,$F1,$45,$76  ; $F413
    .byte $10,$84,$11,$FF,$14,$6A,$54,$B8,$54,$DC,$55,$FD,$40,$92,$51,$1D  ; $F423
    .byte $14,$32,$40,$C3,$44,$40,$11,$84,$45,$96,$44,$D9,$11,$0F,$01,$DB  ; $F433
    .byte $40,$96,$01,$24,$11,$62,$19,$83,$55,$4F,$15,$E7,$14,$3F,$04,$A0  ; $F443
    .byte $45,$EE,$70,$8A,$54,$59,$44,$7D,$11,$39,$44,$6F,$41,$1B,$15,$42  ; $F453
    .byte $05,$71,$50,$E8,$11,$FD,$44,$2E,$00,$BC,$45,$F1,$14,$7B,$51,$E1  ; $F463
    .byte $45,$49,$10,$2C,$44,$46,$45,$F3,$45,$46,$04,$E7,$40,$41,$00,$E8  ; $F473
    .byte $41,$7A,$01,$E7,$11,$92,$11,$9F,$00,$E7,$45,$4E,$51,$D0,$11,$C1  ; $F483
    .byte $45,$26,$41,$48,$40,$0C,$50,$CD,$51,$31,$54,$4D,$50,$6B,$00,$98  ; $F493
    .byte $51,$78,$14,$CF,$55,$4C,$05,$8E,$14,$26,$15,$EB,$04,$CB,$14,$68  ; $F4A3
    .byte $50,$06,$00,$F9,$15,$9B,$20,$0C,$15,$DE,$01,$C1,$55,$B5,$51,$20  ; $F4B3
    .byte $11,$6A,$40,$C1,$00,$19,$54,$58,$05,$2C,$41,$0B,$40,$11,$00,$E6  ; $F4C3
    .byte $50,$AF,$14,$94,$00,$03,$51,$E6,$04,$8F,$15,$EE,$51,$6E,$11,$D7  ; $F4D3
    .byte $55,$F6,$05,$6E,$55,$C5,$D5,$CB,$51,$FF,$40,$7A,$41,$FA,$50,$57  ; $F4E3
    .byte $55,$59,$10,$40,$10,$29,$C4,$01,$00,$20,$54,$2D,$45,$60,$04,$89  ; $F4F3
    .byte $14,$2F,$65,$84,$51,$A1,$41,$BA,$1C,$07,$01,$6C,$41,$79,$54,$88  ; $F503
    .byte $51,$21,$40,$F9,$14,$3C,$11,$24,$15,$A0,$54,$86,$1A,$78,$10,$41  ; $F513
    .byte $05,$94,$54,$6D,$11,$85,$40,$A1,$45,$25,$45,$23,$45,$53,$14,$E3  ; $F523
    .byte $51,$67,$4C,$F7,$01,$8A,$14,$62,$44,$C6,$45,$CA,$44,$E0,$45,$E7  ; $F533
    .byte $01,$05,$14,$04,$41,$F6,$05,$C3,$10,$03,$40,$AA,$40,$CA,$01,$66  ; $F543
    .byte $05,$DB,$05,$0C,$14,$3D,$44,$80,$50,$0A,$51,$AC,$71,$EE,$40,$53  ; $F553
    .byte $D4,$F5,$05,$56,$00,$EC,$14,$9A,$10,$B0,$50,$BE,$55,$F6,$14,$7C  ; $F563
    .byte $01,$E0,$54,$2A,$45,$4A,$51,$6D,$15,$38,$14,$E2,$50  ; $F573

sub_1F_F580:
    LDA $0580,X                  ; $F580  BD 80 05
    ORA #$40                     ; $F583  09 40
    STA $0580,X                  ; $F585  9D 80 05
    CPX #$00                     ; $F588  E0 00
    BNE loc_1F_F596              ; $F58A  D0 0A
    LDA $0360                    ; $F58C  AD 60 03
    STA $02                      ; $F58F  85 02
    LDA $0380                    ; $F591  AD 80 03
    STA $03                      ; $F594  85 03

loc_1F_F596:
    JSR sub_1F_F71D              ; $F596  20 1D F7
    CPX #$00                     ; $F599  E0 00
    BNE loc_1F_F5B2              ; $F59B  D0 15
    JSR sub_1F_FA00              ; $F59D  20 00 FA
    BCC loc_1F_F5B2              ; $F5A0  90 10
    JSR sub_1F_FA7D              ; $F5A2  20 7D FA
    JSR sub_1F_F5AA              ; $F5A5  20 AA F5
    SEC                          ; $F5A8  38
    RTS                          ; $F5A9  60


sub_1F_F5AA:
    BEQ loc_1F_F5B2              ; $F5AA  F0 06
    BCC loc_1F_F5B2              ; $F5AC  90 04
    INY                          ; $F5AE  C8
    JMP loc_1F_F5F4              ; $F5AF  4C F4 F5


loc_1F_F5B2:
    JSR sub_1F_E9E3              ; $F5B2  20 E3 E9
    JSR sub_1F_F700              ; $F5B5  20 00 F7
    CLC                          ; $F5B8  18
    LDA $10                      ; $F5B9  A5 10
    AND #$10                     ; $F5BB  29 10
    BEQ loc_1F_F5C3              ; $F5BD  F0 04
    JSR sub_1F_EDCB              ; $F5BF  20 CB ED
    SEC                          ; $F5C2  38

loc_1F_F5C3:
    RTS                          ; $F5C3  60


sub_1F_F5C4:
    LDA $0580,X                  ; $F5C4  BD 80 05
    AND #$BF                     ; $F5C7  29 BF
    STA $0580,X                  ; $F5C9  9D 80 05
    CPX #$00                     ; $F5CC  E0 00
    BNE loc_1F_F5DA              ; $F5CE  D0 0A
    LDA $0360                    ; $F5D0  AD 60 03
    STA $02                      ; $F5D3  85 02
    LDA $0380                    ; $F5D5  AD 80 03
    STA $03                      ; $F5D8  85 03

loc_1F_F5DA:
    JSR sub_1F_F73B              ; $F5DA  20 3B F7
    CPX #$00                     ; $F5DD  E0 00
    BNE loc_1F_F5F4              ; $F5DF  D0 13
    JSR sub_1F_FA00              ; $F5E1  20 00 FA
    BCC loc_1F_F5F4              ; $F5E4  90 0E
    JSR sub_1F_FA91              ; $F5E6  20 91 FA
    JSR sub_1F_F5EE              ; $F5E9  20 EE F5
    SEC                          ; $F5EC  38
    RTS                          ; $F5ED  60


sub_1F_F5EE:
    BCS loc_1F_F5F4              ; $F5EE  B0 04
    DEY                          ; $F5F0  88
    JMP loc_1F_F5B2              ; $F5F1  4C B2 F5


loc_1F_F5F4:
    JSR sub_1F_E9E3              ; $F5F4  20 E3 E9
    JSR sub_1F_F700              ; $F5F7  20 00 F7
    CLC                          ; $F5FA  18
    LDA $10                      ; $F5FB  A5 10
    AND #$10                     ; $F5FD  29 10
    BEQ loc_1F_F605              ; $F5FF  F0 04
    JSR sub_1F_EDE3              ; $F601  20 E3 ED
    SEC                          ; $F604  38

loc_1F_F605:
    RTS                          ; $F605  60


sub_1F_F606:
    CPX #$00                     ; $F606  E0 00
    BNE loc_1F_F614              ; $F608  D0 0A
    LDA $03C0                    ; $F60A  AD C0 03
    STA $02                      ; $F60D  85 02
    LDA $0380                    ; $F60F  AD 80 03
    STA $03                      ; $F612  85 03

loc_1F_F614:
    JSR sub_1F_F759              ; $F614  20 59 F7
    CPX #$00                     ; $F617  E0 00
    BNE loc_1F_F630              ; $F619  D0 15
    JSR sub_1F_F97E              ; $F61B  20 7E F9
    BCC loc_1F_F630              ; $F61E  90 10
    JSR sub_1F_FAAE              ; $F620  20 AE FA
    JSR sub_1F_F628              ; $F623  20 28 F6
    SEC                          ; $F626  38
    RTS                          ; $F627  60


sub_1F_F628:
    BEQ loc_1F_F630              ; $F628  F0 06
    BCC loc_1F_F630              ; $F62A  90 04
    INY                          ; $F62C  C8
    JMP loc_1F_F66A              ; $F62D  4C 6A F6


loc_1F_F630:
    JSR sub_1F_E8D6              ; $F630  20 D6 E8
    JSR sub_1F_F700              ; $F633  20 00 F7
    CLC                          ; $F636  18
    LDA $10                      ; $F637  A5 10
    AND #$10                     ; $F639  29 10
    BEQ loc_1F_F641              ; $F63B  F0 04
    JSR sub_1F_EE13              ; $F63D  20 13 EE
    SEC                          ; $F640  38

loc_1F_F641:
    RTS                          ; $F641  60


sub_1F_F642:
    CPX #$00                     ; $F642  E0 00
    BNE loc_1F_F650              ; $F644  D0 0A
    LDA $03C0                    ; $F646  AD C0 03
    STA $02                      ; $F649  85 02
    LDA $0380                    ; $F64B  AD 80 03
    STA $03                      ; $F64E  85 03

loc_1F_F650:
    JSR sub_1F_F779              ; $F650  20 79 F7
    CPX #$00                     ; $F653  E0 00
    BNE loc_1F_F66A              ; $F655  D0 13
    JSR sub_1F_F97E              ; $F657  20 7E F9
    BCC loc_1F_F66A              ; $F65A  90 0E
    JSR sub_1F_FABF              ; $F65C  20 BF FA
    JSR sub_1F_F664              ; $F65F  20 64 F6
    SEC                          ; $F662  38
    RTS                          ; $F663  60


sub_1F_F664:
    BCS loc_1F_F66A              ; $F664  B0 04
    DEY                          ; $F666  88
    JMP loc_1F_F630              ; $F667  4C 30 F6


loc_1F_F66A:
    JSR sub_1F_E8D6              ; $F66A  20 D6 E8
    JSR sub_1F_F700              ; $F66D  20 00 F7
    CLC                          ; $F670  18
    LDA $10                      ; $F671  A5 10
    AND #$10                     ; $F673  29 10
    BEQ loc_1F_F67B              ; $F675  F0 04
    JSR sub_1F_EDF9              ; $F677  20 F9 ED
    SEC                          ; $F67A  38

loc_1F_F67B:
    RTS                          ; $F67B  60


sub_1F_F67C:
    CPX #$00                     ; $F67C  E0 00
    BNE loc_1F_F68A              ; $F67E  D0 0A
    LDA $03C0                    ; $F680  AD C0 03
    STA $02                      ; $F683  85 02
    LDA $0380                    ; $F685  AD 80 03
    STA $03                      ; $F688  85 03

loc_1F_F68A:
    LDA $0460,X                  ; $F68A  BD 60 04
    BPL loc_1F_F6CD              ; $F68D  10 3E
    JSR sub_1F_F7A8              ; $F68F  20 A8 F7
    CPX #$00                     ; $F692  E0 00
    BNE loc_1F_F6AC              ; $F694  D0 16
    JSR sub_1F_F97E              ; $F696  20 7E F9
    BCC loc_1F_F6AC              ; $F699  90 11
    JSR sub_1F_FAAE              ; $F69B  20 AE FA
    JSR sub_1F_F6A4              ; $F69E  20 A4 F6
    JMP loc_1F_F6C8              ; $F6A1  4C C8 F6


sub_1F_F6A4:
    BEQ loc_1F_F6AC              ; $F6A4  F0 06
    BCC loc_1F_F6AC              ; $F6A6  90 04
    INY                          ; $F6A8  C8
    JMP loc_1F_F66A              ; $F6A9  4C 6A F6


loc_1F_F6AC:
    JSR sub_1F_F7E6              ; $F6AC  20 E6 F7
    JSR sub_1F_E8D6              ; $F6AF  20 D6 E8
    JSR sub_1F_F700              ; $F6B2  20 00 F7
    CPX #$00                     ; $F6B5  E0 00
    BNE loc_1F_F6BF              ; $F6B7  D0 06
    LDA $41                      ; $F6B9  A5 41
    CMP #$40                     ; $F6BB  C9 40
    BEQ loc_1F_F6C5              ; $F6BD  F0 06

loc_1F_F6BF:
    LDA $10                      ; $F6BF  A5 10
    AND #$10                     ; $F6C1  29 10
    BEQ loc_1F_F6FE              ; $F6C3  F0 39

loc_1F_F6C5:
    JSR sub_1F_EE13              ; $F6C5  20 13 EE

loc_1F_F6C8:
    JSR sub_1F_F81B              ; $F6C8  20 1B F8
    SEC                          ; $F6CB  38
    RTS                          ; $F6CC  60


loc_1F_F6CD:
    INY                          ; $F6CD  C8
    JSR sub_1F_F7C8              ; $F6CE  20 C8 F7
    CPX #$00                     ; $F6D1  E0 00
    BNE loc_1F_F6E9              ; $F6D3  D0 14
    JSR sub_1F_F97E              ; $F6D5  20 7E F9
    BCC loc_1F_F6E9              ; $F6D8  90 0F
    JSR sub_1F_FABF              ; $F6DA  20 BF FA
    JSR sub_1F_F6E3              ; $F6DD  20 E3 F6
    JMP loc_1F_F6FB              ; $F6E0  4C FB F6


sub_1F_F6E3:
    BCS loc_1F_F6E9              ; $F6E3  B0 04
    DEY                          ; $F6E5  88
    JMP loc_1F_F630              ; $F6E6  4C 30 F6


loc_1F_F6E9:
    JSR sub_1F_F7E6              ; $F6E9  20 E6 F7
    JSR sub_1F_E8D6              ; $F6EC  20 D6 E8
    JSR sub_1F_F700              ; $F6EF  20 00 F7
    LDA $10                      ; $F6F2  A5 10
    AND #$10                     ; $F6F4  29 10
    BEQ loc_1F_F6FE              ; $F6F6  F0 06
    JSR sub_1F_EDF9              ; $F6F8  20 F9 ED

loc_1F_F6FB:
    JSR sub_1F_F81B              ; $F6FB  20 1B F8

loc_1F_F6FE:
    CLC                          ; $F6FE  18
    RTS                          ; $F6FF  60


sub_1F_F700:
    LDA $10                      ; $F700  A5 10
    AND #$10                     ; $F702  29 10
    BNE loc_1F_F71C              ; $F704  D0 16
    LDA $0580,X                  ; $F706  BD 80 05
    AND #$DF                     ; $F709  29 DF
    STA $0580,X                  ; $F70B  9D 80 05
    LDA $41                      ; $F70E  A5 41
    CMP #$60                     ; $F710  C9 60
    BNE loc_1F_F71C              ; $F712  D0 08
    LDA $0580,X                  ; $F714  BD 80 05
    ORA #$20                     ; $F717  09 20
    STA $0580,X                  ; $F719  9D 80 05

loc_1F_F71C:
    RTS                          ; $F71C  60


sub_1F_F71D:
    LDA $0340,X                  ; $F71D  BD 40 03
    CLC                          ; $F720  18
    ADC $0400,X                  ; $F721  7D 00 04
    STA $0340,X                  ; $F724  9D 40 03
    LDA $0360,X                  ; $F727  BD 60 03
    ADC $0420,X                  ; $F72A  7D 20 04
    STA $0360,X                  ; $F72D  9D 60 03
    BCC loc_1F_F73A              ; $F730  90 08
    LDA $0380,X                  ; $F732  BD 80 03
    ADC #$00                     ; $F735  69 00
    STA $0380,X                  ; $F737  9D 80 03

loc_1F_F73A:
    RTS                          ; $F73A  60


sub_1F_F73B:
    LDA $0340,X                  ; $F73B  BD 40 03
    SEC                          ; $F73E  38
    SBC $0400,X                  ; $F73F  FD 00 04
    STA $0340,X                  ; $F742  9D 40 03
    LDA $0360,X                  ; $F745  BD 60 03
    SBC $0420,X                  ; $F748  FD 20 04
    STA $0360,X                  ; $F74B  9D 60 03
    BCS loc_1F_F758              ; $F74E  B0 08
    LDA $0380,X                  ; $F750  BD 80 03
    SBC #$00                     ; $F753  E9 00
    STA $0380,X                  ; $F755  9D 80 03

loc_1F_F758:
    RTS                          ; $F758  60


sub_1F_F759:
    LDA $03A0,X                  ; $F759  BD A0 03
    CLC                          ; $F75C  18
    ADC $0440,X                  ; $F75D  7D 40 04
    STA $03A0,X                  ; $F760  9D A0 03
    LDA $03C0,X                  ; $F763  BD C0 03
    ADC $0460,X                  ; $F766  7D 60 04
    STA $03C0,X                  ; $F769  9D C0 03
    CMP #$F0                     ; $F76C  C9 F0
    BCC loc_1F_F778              ; $F76E  90 08
    ADC #$0F                     ; $F770  69 0F
    STA $03C0,X                  ; $F772  9D C0 03
    INC $03E0,X                  ; $F775  FE E0 03

loc_1F_F778:
    RTS                          ; $F778  60


sub_1F_F779:
    LDA $03A0,X                  ; $F779  BD A0 03
    SEC                          ; $F77C  38
    SBC $0440,X                  ; $F77D  FD 40 04
    STA $03A0,X                  ; $F780  9D A0 03
    LDA $03C0,X                  ; $F783  BD C0 03
    SBC $0460,X                  ; $F786  FD 60 04
    STA $03C0,X                  ; $F789  9D C0 03
    BCS loc_1F_F796              ; $F78C  B0 08
    SBC #$0F                     ; $F78E  E9 0F
    STA $03C0,X                  ; $F790  9D C0 03
    DEC $03E0,X                  ; $F793  DE E0 03

loc_1F_F796:
    RTS                          ; $F796  60


sub_1F_F797:
    LDA $0460,X                  ; $F797  BD 60 04
    BPL loc_1F_F7A2              ; $F79A  10 06
    JSR sub_1F_F7A8              ; $F79C  20 A8 F7
    JMP sub_1F_F7E6              ; $F79F  4C E6 F7


loc_1F_F7A2:
    JSR sub_1F_F7C8              ; $F7A2  20 C8 F7
    JMP sub_1F_F7E6              ; $F7A5  4C E6 F7


sub_1F_F7A8:
    LDA $03A0,X                  ; $F7A8  BD A0 03
    SEC                          ; $F7AB  38
    SBC $0440,X                  ; $F7AC  FD 40 04
    STA $03A0,X                  ; $F7AF  9D A0 03
    LDA $03C0,X                  ; $F7B2  BD C0 03
    SBC $0460,X                  ; $F7B5  FD 60 04
    STA $03C0,X                  ; $F7B8  9D C0 03
    CMP #$F0                     ; $F7BB  C9 F0
    BCC loc_1F_F7C7              ; $F7BD  90 08
    ADC #$0F                     ; $F7BF  69 0F
    STA $03C0,X                  ; $F7C1  9D C0 03
    INC $03E0,X                  ; $F7C4  FE E0 03

loc_1F_F7C7:
    RTS                          ; $F7C7  60


sub_1F_F7C8:
    LDA $03A0,X                  ; $F7C8  BD A0 03
    SEC                          ; $F7CB  38
    SBC $0440,X                  ; $F7CC  FD 40 04
    STA $03A0,X                  ; $F7CF  9D A0 03
    LDA $03C0,X                  ; $F7D2  BD C0 03
    SBC $0460,X                  ; $F7D5  FD 60 04
    STA $03C0,X                  ; $F7D8  9D C0 03
    BCS loc_1F_F7E5              ; $F7DB  B0 08
    SBC #$0F                     ; $F7DD  E9 0F
    STA $03C0,X                  ; $F7DF  9D C0 03
    DEC $03E0,X                  ; $F7E2  DE E0 03

loc_1F_F7E5:
    RTS                          ; $F7E5  60


sub_1F_F7E6:
    CPX #$00                     ; $F7E6  E0 00
    BNE loc_1F_F7F2              ; $F7E8  D0 08
    LDA $B9                      ; $F7EA  A5 B9
    BEQ loc_1F_F7F2              ; $F7EC  F0 04
    DEC $B9                      ; $F7EE  C6 B9
    BNE loc_1F_F81A              ; $F7F0  D0 28

loc_1F_F7F2:
    LDA $0440,X                  ; $F7F2  BD 40 04
    SEC                          ; $F7F5  38
    SBC $99                      ; $F7F6  E5 99
    STA $0440,X                  ; $F7F8  9D 40 04
    LDA $0460,X                  ; $F7FB  BD 60 04
    SBC #$00                     ; $F7FE  E9 00
    STA $0460,X                  ; $F800  9D 60 04
    BPL loc_1F_F81A              ; $F803  10 15
    CMP #$F9                     ; $F805  C9 F9
    BCS loc_1F_F81A              ; $F807  B0 11
    LDA $05C0,X                  ; $F809  BD C0 05
    CMP #$13                     ; $F80C  C9 13
    BEQ loc_1F_F81A              ; $F80E  F0 0A
    LDA #$F9                     ; $F810  A9 F9
    STA $0460,X                  ; $F812  9D 60 04
    LDA #$00                     ; $F815  A9 00
    STA $0440,X                  ; $F817  9D 40 04

loc_1F_F81A:
    RTS                          ; $F81A  60


sub_1F_F81B:
    CPX #$00                     ; $F81B  E0 00
    BEQ loc_1F_F82A              ; $F81D  F0 0B
    LDA #$AB                     ; $F81F  A9 AB
    STA $0440,X                  ; $F821  9D 40 04
    LDA #$FF                     ; $F824  A9 FF
    STA $0460,X                  ; $F826  9D 60 04
    RTS                          ; $F829  60


loc_1F_F82A:
    LDA #$C0                     ; $F82A  A9 C0
    STA $0440,X                  ; $F82C  9D 40 04
    LDA #$FF                     ; $F82F  A9 FF
    STA $0460,X                  ; $F831  9D 60 04
    RTS                          ; $F834  60


sub_1F_F835:
    STA $05C0,X                  ; $F835  9D C0 05
    LDA #$00                     ; $F838  A9 00
    STA $05A0,X                  ; $F83A  9D A0 05
    LDA $05E0,X                  ; $F83D  BD E0 05
    AND #$80                     ; $F840  29 80
    STA $05E0,X                  ; $F842  9D E0 05
    RTS                          ; $F845  60


sub_1F_F846:
    STA $05C0,Y                  ; $F846  99 C0 05
    LDA #$00                     ; $F849  A9 00
    STA $05A0,Y                  ; $F84B  99 A0 05
    STA $03E0,Y                  ; $F84E  99 E0 03
    LDA $0580,X                  ; $F851  BD 80 05
    AND #$40                     ; $F854  29 40
    ORA #$90                     ; $F856  09 90
    STA $0580,Y                  ; $F858  99 80 05
    LDA #$80                     ; $F85B  A9 80
    STA $0300,Y                  ; $F85D  99 00 03
    LDA $05E0,Y                  ; $F860  B9 E0 05
    AND #$80                     ; $F863  29 80
    STA $05E0,Y                  ; $F865  99 E0 05
    RTS                          ; $F868  60


sub_1F_F869:
    LDA #$01                     ; $F869  A9 01
    STA $04A0,X                  ; $F86B  9D A0 04
    LDA $0360,X                  ; $F86E  BD 60 03
    SEC                          ; $F871  38
    SBC $0360                    ; $F872  ED 60 03
    LDA $0380,X                  ; $F875  BD 80 03
    SBC $0380                    ; $F878  ED 80 03
    BCC loc_1F_F882              ; $F87B  90 05
    LDA #$02                     ; $F87D  A9 02
    STA $04A0,X                  ; $F87F  9D A0 04

loc_1F_F882:
    RTS                          ; $F882  60


sub_1F_F883:
    LDA $04A0,X                  ; $F883  BD A0 04
    ROR A                        ; $F886  6A
    ROR A                        ; $F887  6A
    ROR A                        ; $F888  6A
    AND #$40                     ; $F889  29 40
    STA $00                      ; $F88B  85 00
    LDA $0580,X                  ; $F88D  BD 80 05
    AND #$BF                     ; $F890  29 BF
    ORA $00                      ; $F892  05 00
    STA $0580,X                  ; $F894  9D 80 05
    RTS                          ; $F897  60


sub_1F_F898:
    STA $D9                      ; $F898  85 D9

sub_1F_F89A:
    STX $00                      ; $F89A  86 00
    LDX $DA                      ; $F89C  A6 DA
    STA $01                      ; $F89E  85 01
    LDA $DC,X                    ; $F8A0  B5 DC
    CMP #$88                     ; $F8A2  C9 88
    BNE loc_1F_F8B0              ; $F8A4  D0 0A
    LDA $01                      ; $F8A6  A5 01
    STA $DC,X                    ; $F8A8  95 DC
    INX                          ; $F8AA  E8
    TXA                          ; $F8AB  8A
    AND #$07                     ; $F8AC  29 07
    STA $DA                      ; $F8AE  85 DA

loc_1F_F8B0:
    LDX $00                      ; $F8B0  A6 00
    RTS                          ; $F8B2  60


sub_1F_F8B3:
    LDA $03C0                    ; $F8B3  AD C0 03
    SEC                          ; $F8B6  38
    SBC $03C0,X                  ; $F8B7  FD C0 03
    BCS loc_1F_F8C1              ; $F8BA  B0 05
    EOR #$FF                     ; $F8BC  49 FF
    ADC #$01                     ; $F8BE  69 01
    CLC                          ; $F8C0  18

loc_1F_F8C1:
    RTS                          ; $F8C1  60


sub_1F_F8C2:
    LDA $0360                    ; $F8C2  AD 60 03
    SEC                          ; $F8C5  38
    SBC $0360,X                  ; $F8C6  FD 60 03
    PHA                          ; $F8C9  48
    LDA $0380                    ; $F8CA  AD 80 03
    SBC $0380,X                  ; $F8CD  FD 80 03
    PLA                          ; $F8D0  68
    BCS loc_1F_F8D8              ; $F8D1  B0 05
    EOR #$FF                     ; $F8D3  49 FF
    ADC #$01                     ; $F8D5  69 01
    CLC                          ; $F8D7  18

loc_1F_F8D8:
    RTS                          ; $F8D8  60


sub_1F_F8D9:
    LDY #$00                     ; $F8D9  A0 00
    LDA $03C0                    ; $F8DB  AD C0 03
    SEC                          ; $F8DE  38
    SBC $03C0,X                  ; $F8DF  FD C0 03
    LDY #$00                     ; $F8E2  A0 00
    BCS loc_1F_F8EC              ; $F8E4  B0 06
    EOR #$FF                     ; $F8E6  49 FF
    ADC #$01                     ; $F8E8  69 01
    LDY #$04                     ; $F8EA  A0 04

loc_1F_F8EC:
    STA $00                      ; $F8EC  85 00
    LDA $0360                    ; $F8EE  AD 60 03
    SEC                          ; $F8F1  38
    SBC $0360,X                  ; $F8F2  FD 60 03
    PHA                          ; $F8F5  48
    LDA $0380                    ; $F8F6  AD 80 03
    SBC $0380,X                  ; $F8F9  FD 80 03
    PLA                          ; $F8FC  68
    BCS loc_1F_F905              ; $F8FD  B0 06
    EOR #$FF                     ; $F8FF  49 FF
    ADC #$01                     ; $F901  69 01
    INY                          ; $F903  C8
    INY                          ; $F904  C8

loc_1F_F905:
    STA $01                      ; $F905  85 01
    CMP $00                      ; $F907  C5 00
    BCS loc_1F_F914              ; $F909  B0 09
    PHA                          ; $F90B  48
    LDA $00                      ; $F90C  A5 00
    STA $01                      ; $F90E  85 01
    PLA                          ; $F910  68
    STA $00                      ; $F911  85 00
    INY                          ; $F913  C8

loc_1F_F914:
    LDA #$00                     ; $F914  A9 00
    STA $02                      ; $F916  85 02
    LDA $01                      ; $F918  A5 01
    LSR A                        ; $F91A  4A
    LSR A                        ; $F91B  4A
    CMP $00                      ; $F91C  C5 00
    BCS loc_1F_F929              ; $F91E  B0 09
    INC $02                      ; $F920  E6 02
    ASL A                        ; $F922  0A
    CMP $00                      ; $F923  C5 00
    BCS loc_1F_F929              ; $F925  B0 02
    INC $02                      ; $F927  E6 02

loc_1F_F929:
    TYA                          ; $F929  98
    ASL A                        ; $F92A  0A
    ASL A                        ; $F92B  0A
    CLC                          ; $F92C  18
    ADC $02                      ; $F92D  65 02
    TAY                          ; $F92F  A8
    LDA $F934,Y                  ; $F930  B9 34 F9
    RTS                          ; $F933  60

    .byte $04,$05,$06,$04,$08,$07,$06,$04,$0C,$0B,$0A,$04,$08,$09,$0A,$04  ; $F934
    .byte $04,$03,$02,$04,$00,$01,$02,$04,$0C,$0D,$0E,$04,$00,$0F,$0E,$04  ; $F944

sub_1F_F954:
    JSR sub_1F_F8D9              ; $F954  20 D9 F8
    STA $00                      ; $F957  85 00
    LDA $04A0,X                  ; $F959  BD A0 04
    CLC                          ; $F95C  18
    ADC #$08                     ; $F95D  69 08
    AND #$0F                     ; $F95F  29 0F
    SEC                          ; $F961  38
    SBC $00                      ; $F962  E5 00
    AND #$0F                     ; $F964  29 0F
    SEC                          ; $F966  38
    SBC #$08                     ; $F967  E9 08
    BEQ loc_1F_F97D              ; $F969  F0 12
    BCS loc_1F_F972              ; $F96B  B0 05
    INC $04A0,X                  ; $F96D  FE A0 04
    BNE loc_1F_F975              ; $F970  D0 03

loc_1F_F972:
    DEC $04A0,X                  ; $F972  DE A0 04

loc_1F_F975:
    LDA $04A0,X                  ; $F975  BD A0 04
    AND #$0F                     ; $F978  29 0F
    STA $04A0,X                  ; $F97A  9D A0 04

loc_1F_F97D:
    RTS                          ; $F97D  60


sub_1F_F97E:
    LDA $0580,X                  ; $F97E  BD 80 05
    BPL loc_1F_F9FE              ; $F981  10 7B
    STY $00                      ; $F983  84 00
    LDY #$1F                     ; $F985  A0 1F
    STY $01                      ; $F987  84 01

loc_1F_F989:
    LDA $0300,Y                  ; $F989  B9 00 03
    BPL loc_1F_F9F6              ; $F98C  10 68
    LDA $0580,Y                  ; $F98E  B9 80 05
    BPL loc_1F_F9F6              ; $F991  10 63
    LDA $0580,Y                  ; $F993  B9 80 05
    AND #$04                     ; $F996  29 04
    BNE loc_1F_F9F6              ; $F998  D0 5C
    LDA $0580,Y                  ; $F99A  B9 80 05
    AND #$03                     ; $F99D  29 03
    BEQ loc_1F_F9F6              ; $F99F  F0 55
    AND #$01                     ; $F9A1  29 01
    BEQ loc_1F_F9AA              ; $F9A3  F0 05
    LDA $0460,X                  ; $F9A5  BD 60 04
    BPL loc_1F_F9F6              ; $F9A8  10 4C

loc_1F_F9AA:
    JSR sub_1F_FA53              ; $F9AA  20 53 FA
    JSR sub_1F_FA6C              ; $F9AD  20 6C FA
    BCC loc_1F_F9B9              ; $F9B0  90 07
    LDA $0580,Y                  ; $F9B2  B9 80 05
    AND #$01                     ; $F9B5  29 01
    BNE loc_1F_F9F6              ; $F9B7  D0 3D

loc_1F_F9B9:
    LDA $0480,Y                  ; $F9B9  B9 80 04
    AND #$1F                     ; $F9BC  29 1F
    TAY                          ; $F9BE  A8
    LDA $10                      ; $F9BF  A5 10
    CMP $FB5B,Y                  ; $F9C1  D9 5B FB
    BCS loc_1F_F9F6              ; $F9C4  B0 30
    SEC                          ; $F9C6  38
    LDA $FB3B,Y                  ; $F9C7  B9 3B FB
    SBC $11                      ; $F9CA  E5 11
    BCC loc_1F_F9F6              ; $F9CC  90 28
    STA $11                      ; $F9CE  85 11
    CMP #$08                     ; $F9D0  C9 08
    BCC loc_1F_F9D8              ; $F9D2  90 04
    LDA #$08                     ; $F9D4  A9 08
    STA $11                      ; $F9D6  85 11

loc_1F_F9D8:
    LDY $01                      ; $F9D8  A4 01
    LDA $0320,Y                  ; $F9DA  B9 20 03
    CMP #$14                     ; $F9DD  C9 14
    BNE loc_1F_F9F0              ; $F9DF  D0 0F
    LDA $04A0,Y                  ; $F9E1  B9 A0 04
    STA $36                      ; $F9E4  85 36
    LDA $0400,Y                  ; $F9E6  B9 00 04
    STA $37                      ; $F9E9  85 37
    LDA $0420,Y                  ; $F9EB  B9 20 04
    STA $38                      ; $F9EE  85 38

loc_1F_F9F0:
    STY $5D                      ; $F9F0  84 5D
    LDY $00                      ; $F9F2  A4 00
    SEC                          ; $F9F4  38
    RTS                          ; $F9F5  60


loc_1F_F9F6:
    DEC $01                      ; $F9F6  C6 01
    LDY $01                      ; $F9F8  A4 01
    BNE loc_1F_F989              ; $F9FA  D0 8D
    LDY $00                      ; $F9FC  A4 00

loc_1F_F9FE:
    CLC                          ; $F9FE  18
    RTS                          ; $F9FF  60


sub_1F_FA00:
    LDA $0580,X                  ; $FA00  BD 80 05
    BPL loc_1F_FA51              ; $FA03  10 4C
    STY $00                      ; $FA05  84 00
    LDY #$1F                     ; $FA07  A0 1F
    STY $01                      ; $FA09  84 01

loc_1F_FA0B:
    LDA $0300,Y                  ; $FA0B  B9 00 03
    BPL loc_1F_FA49              ; $FA0E  10 39
    LDA $0580,Y                  ; $FA10  B9 80 05
    AND #$04                     ; $FA13  29 04
    BNE loc_1F_FA49              ; $FA15  D0 32
    LDA $0580,Y                  ; $FA17  B9 80 05
    AND #$02                     ; $FA1A  29 02
    BEQ loc_1F_FA49              ; $FA1C  F0 2B
    JSR sub_1F_FA53              ; $FA1E  20 53 FA
    JSR sub_1F_FA6C              ; $FA21  20 6C FA
    LDA $0480,Y                  ; $FA24  B9 80 04
    AND #$1F                     ; $FA27  29 1F
    TAY                          ; $FA29  A8
    LDA $11                      ; $FA2A  A5 11
    CMP $FB3B,Y                  ; $FA2C  D9 3B FB
    BCS loc_1F_FA49              ; $FA2F  B0 18
    SEC                          ; $FA31  38
    LDA $FB5B,Y                  ; $FA32  B9 5B FB
    SBC $10                      ; $FA35  E5 10
    BCC loc_1F_FA49              ; $FA37  90 10
    STA $10                      ; $FA39  85 10
    CMP #$08                     ; $FA3B  C9 08
    BCC loc_1F_FA43              ; $FA3D  90 04
    LDA #$08                     ; $FA3F  A9 08
    STA $10                      ; $FA41  85 10

loc_1F_FA43:
    STY $5D                      ; $FA43  84 5D
    LDY $00                      ; $FA45  A4 00
    SEC                          ; $FA47  38
    RTS                          ; $FA48  60


loc_1F_FA49:
    DEC $01                      ; $FA49  C6 01
    LDY $01                      ; $FA4B  A4 01
    BNE loc_1F_FA0B              ; $FA4D  D0 BC
    LDY $00                      ; $FA4F  A4 00

loc_1F_FA51:
    CLC                          ; $FA51  18
    RTS                          ; $FA52  60


sub_1F_FA53:
    LDA $0360                    ; $FA53  AD 60 03
    SEC                          ; $FA56  38
    SBC $0360,Y                  ; $FA57  F9 60 03
    PHA                          ; $FA5A  48
    LDA $0380                    ; $FA5B  AD 80 03
    SBC $0380,Y                  ; $FA5E  F9 80 03
    PLA                          ; $FA61  68
    BCS loc_1F_FA69              ; $FA62  B0 05
    EOR #$FF                     ; $FA64  49 FF
    ADC #$01                     ; $FA66  69 01
    CLC                          ; $FA68  18

loc_1F_FA69:
    STA $10                      ; $FA69  85 10
    RTS                          ; $FA6B  60


sub_1F_FA6C:
    LDA $03C0                    ; $FA6C  AD C0 03
    SEC                          ; $FA6F  38
    SBC $03C0,Y                  ; $FA70  F9 C0 03
    BCS loc_1F_FA7A              ; $FA73  B0 05
    EOR #$FF                     ; $FA75  49 FF
    ADC #$01                     ; $FA77  69 01
    CLC                          ; $FA79  18

loc_1F_FA7A:
    STA $11                      ; $FA7A  85 11
    RTS                          ; $FA7C  60


sub_1F_FA7D:
    SEC                          ; $FA7D  38
    LDA $0360,X                  ; $FA7E  BD 60 03
    SBC $10                      ; $FA81  E5 10
    STA $0360,X                  ; $FA83  9D 60 03
    LDA $0380,X                  ; $FA86  BD 80 03
    SBC #$00                     ; $FA89  E9 00
    STA $0380,X                  ; $FA8B  9D 80 03
    JMP loc_1F_FAA2              ; $FA8E  4C A2 FA


sub_1F_FA91:
    CLC                          ; $FA91  18
    LDA $0360,X                  ; $FA92  BD 60 03
    ADC $10                      ; $FA95  65 10
    STA $0360,X                  ; $FA97  9D 60 03
    LDA $0380,X                  ; $FA9A  BD 80 03
    ADC #$00                     ; $FA9D  69 00
    STA $0380,X                  ; $FA9F  9D 80 03

loc_1F_FAA2:
    SEC                          ; $FAA2  38
    LDA $02                      ; $FAA3  A5 02
    SBC $0360,X                  ; $FAA5  FD 60 03
    LDA $03                      ; $FAA8  A5 03
    SBC $0380,X                  ; $FAAA  FD 80 03
    RTS                          ; $FAAD  60


sub_1F_FAAE:
    SEC                          ; $FAAE  38
    LDA $03C0,X                  ; $FAAF  BD C0 03
    SBC $11                      ; $FAB2  E5 11
    STA $03C0,X                  ; $FAB4  9D C0 03
    BCS loc_1F_FAD6              ; $FAB7  B0 1D
    DEC $03E0,X                  ; $FAB9  DE E0 03
    JMP loc_1F_FAD6              ; $FABC  4C D6 FA


sub_1F_FABF:
    CLC                          ; $FABF  18
    LDA $03C0,X                  ; $FAC0  BD C0 03
    ADC $11                      ; $FAC3  65 11
    STA $03C0,X                  ; $FAC5  9D C0 03
    BCS loc_1F_FAD3              ; $FAC8  B0 09
    CMP #$F0                     ; $FACA  C9 F0
    BCC loc_1F_FAD6              ; $FACC  90 08
    ADC #$0F                     ; $FACE  69 0F
    STA $03C0,X                  ; $FAD0  9D C0 03

loc_1F_FAD3:
    INC $03E0,X                  ; $FAD3  FE E0 03

loc_1F_FAD6:
    SEC                          ; $FAD6  38
    LDA $02                      ; $FAD7  A5 02
    SBC $03C0,X                  ; $FAD9  FD C0 03
    LDA $03                      ; $FADC  A5 03
    SBC $03E0,X                  ; $FADE  FD E0 03
    RTS                          ; $FAE1  60


sub_1F_FAE2:
    LDA $30                      ; $FAE2  A5 30
    CMP #$0E                     ; $FAE4  C9 0E
    BEQ loc_1F_FB3A              ; $FAE6  F0 52
    CMP #$04                     ; $FAE8  C9 04
    BEQ loc_1F_FB3A              ; $FAEA  F0 4E
    SEC                          ; $FAEC  38
    LDA $0580,X                  ; $FAED  BD 80 05
    BPL loc_1F_FB3A              ; $FAF0  10 48
    AND #$04                     ; $FAF2  29 04
    BNE loc_1F_FB3A              ; $FAF4  D0 44
    LDA $0480,X                  ; $FAF6  BD 80 04
    AND #$1F                     ; $FAF9  29 1F
    TAY                          ; $FAFB  A8
    LDA $FB3B,Y                  ; $FAFC  B9 3B FB
    STA $00                      ; $FAFF  85 00
    LDA $05C0                    ; $FB01  AD C0 05
    CMP #$10                     ; $FB04  C9 10
    BNE loc_1F_FB0F              ; $FB06  D0 07
    LDA $00                      ; $FB08  A5 00
    SEC                          ; $FB0A  38
    SBC #$08                     ; $FB0B  E9 08
    STA $00                      ; $FB0D  85 00

loc_1F_FB0F:
    LDA $0360                    ; $FB0F  AD 60 03
    SEC                          ; $FB12  38
    SBC $0360,X                  ; $FB13  FD 60 03
    PHA                          ; $FB16  48
    LDA $0380                    ; $FB17  AD 80 03
    SBC $0380,X                  ; $FB1A  FD 80 03
    PLA                          ; $FB1D  68
    BCS loc_1F_FB24              ; $FB1E  B0 04
    EOR #$FF                     ; $FB20  49 FF
    ADC #$01                     ; $FB22  69 01

loc_1F_FB24:
    CMP $FB5B,Y                  ; $FB24  D9 5B FB
    BCS loc_1F_FB3A              ; $FB27  B0 11
    LDA $03C0                    ; $FB29  AD C0 03
    SEC                          ; $FB2C  38
    SBC $03C0,X                  ; $FB2D  FD C0 03
    BCS loc_1F_FB36              ; $FB30  B0 04
    EOR #$FF                     ; $FB32  49 FF
    ADC #$01                     ; $FB34  69 01

loc_1F_FB36:
    CMP $00                      ; $FB36  C5 00
    BCC loc_1F_FB3A              ; $FB38  90 00

loc_1F_FB3A:
    RTS                          ; $FB3A  60

    .byte $13,$1C,$18,$14,$1C,$28,$16,$1C,$18,$18,$1C,$10,$24,$24,$34,$14  ; $FB3B
    .byte $20,$0E,$1C,$1C,$3C,$1C,$2C,$14,$2C,$2C,$14,$34,$0C,$0C,$0C,$0C  ; $FB4B
    .byte $0F,$14,$14,$14,$10,$20,$18,$14,$10,$18,$18,$0C,$14,$20,$10,$18  ; $FB5B
    .byte $1C,$14,$40,$0C,$0C,$0F,$0C,$10,$28,$18,$28,$2C,$08,$08,$08,$08  ; $FB6B

sub_1F_FB7B:
    LDA $30                      ; $FB7B  A5 30
    CMP #$0E                     ; $FB7D  C9 0E
    BEQ loc_1F_FBD0              ; $FB7F  F0 4F
    CMP #$04                     ; $FB81  C9 04
    BEQ loc_1F_FBD0              ; $FB83  F0 4B
    LDA #$03                     ; $FB85  A9 03
    STA $10                      ; $FB87  85 10

loc_1F_FB89:
    LDY $10                      ; $FB89  A4 10
    LDA $0300,Y                  ; $FB8B  B9 00 03
    BPL loc_1F_FBCC              ; $FB8E  10 3C
    LDA $0580,Y                  ; $FB90  B9 80 05
    BPL loc_1F_FBCC              ; $FB93  10 37
    LDA $0320,Y                  ; $FB95  B9 20 03
    CMP #$0F                     ; $FB98  C9 0F
    BEQ loc_1F_FBCC              ; $FB9A  F0 30
    LDA $05C0,Y                  ; $FB9C  B9 C0 05
    CMP #$13                     ; $FB9F  C9 13
    BEQ loc_1F_FBCC              ; $FBA1  F0 29
    CMP #$D7                     ; $FBA3  C9 D7
    BEQ loc_1F_FBCC              ; $FBA5  F0 25
    CMP #$D8                     ; $FBA7  C9 D8
    BEQ loc_1F_FBCC              ; $FBA9  F0 21
    CMP #$D9                     ; $FBAB  C9 D9
    BEQ loc_1F_FBCC              ; $FBAD  F0 1D
    LDA $0580,X                  ; $FBAF  BD 80 05
    BPL loc_1F_FBCC              ; $FBB2  10 18
    AND #$04                     ; $FBB4  29 04
    BNE loc_1F_FBCC              ; $FBB6  D0 14
    LDA $0360,Y                  ; $FBB8  B9 60 03
    STA $00                      ; $FBBB  85 00
    LDA $0380,Y                  ; $FBBD  B9 80 03
    STA $01                      ; $FBC0  85 01
    LDA $03C0,Y                  ; $FBC2  B9 C0 03
    STA $02                      ; $FBC5  85 02
    JSR sub_1F_FBD2              ; $FBC7  20 D2 FB
    BCC loc_1F_FBD1              ; $FBCA  90 05

loc_1F_FBCC:
    DEC $10                      ; $FBCC  C6 10
    BNE loc_1F_FB89              ; $FBCE  D0 B9

loc_1F_FBD0:
    SEC                          ; $FBD0  38

loc_1F_FBD1:
    RTS                          ; $FBD1  60


sub_1F_FBD2:
    SEC                          ; $FBD2  38
    LDA $0480,X                  ; $FBD3  BD 80 04
    AND #$1F                     ; $FBD6  29 1F
    TAY                          ; $FBD8  A8
    LDA $00                      ; $FBD9  A5 00
    SEC                          ; $FBDB  38
    SBC $0360,X                  ; $FBDC  FD 60 03
    PHA                          ; $FBDF  48
    LDA $01                      ; $FBE0  A5 01
    SBC $0380,X                  ; $FBE2  FD 80 03
    PLA                          ; $FBE5  68
    BCS loc_1F_FBEC              ; $FBE6  B0 04
    EOR #$FF                     ; $FBE8  49 FF
    ADC #$01                     ; $FBEA  69 01

loc_1F_FBEC:
    CMP $FC23,Y                  ; $FBEC  D9 23 FC
    BCS loc_1F_FC02              ; $FBEF  B0 11
    LDA $02                      ; $FBF1  A5 02
    SEC                          ; $FBF3  38
    SBC $03C0,X                  ; $FBF4  FD C0 03
    BCS loc_1F_FBFD              ; $FBF7  B0 04
    EOR #$FF                     ; $FBF9  49 FF
    ADC #$01                     ; $FBFB  69 01

loc_1F_FBFD:
    CMP $FC03,Y                  ; $FBFD  D9 03 FC
    BCC loc_1F_FC02              ; $FC00  90 00

loc_1F_FC02:
    RTS                          ; $FC02  60

    .byte $0A,$12,$0E,$0A,$12,$1E,$0C,$16,$0E,$0E,$12,$04,$1A,$1A,$2A,$0A  ; $FC03
    .byte $16,$04,$12,$2E,$32,$12,$22,$0A,$22,$06,$02,$2A,$02,$02,$02,$02  ; $FC13
    .byte $0B,$0F,$0D,$0F,$0B,$13,$13,$13,$0B,$13,$13,$05,$0F,$1B,$0B,$13  ; $FC23
    .byte $17,$0F,$13,$07,$07,$0A,$07,$0B,$23,$0F,$03,$27,$03,$03,$03,$03  ; $FC33

sub_1F_FC43:
    LDX #$1F                     ; $FC43  A2 1F

loc_1F_FC45:
    LDA $0300,X                  ; $FC45  BD 00 03
    BPL loc_1F_FC51              ; $FC48  10 07
    DEX                          ; $FC4A  CA
    CPX #$0F                     ; $FC4B  E0 0F
    BNE loc_1F_FC45              ; $FC4D  D0 F6
    SEC                          ; $FC4F  38
    RTS                          ; $FC50  60


loc_1F_FC51:
    CLC                          ; $FC51  18
    RTS                          ; $FC52  60


sub_1F_FC53:
    LDY #$1F                     ; $FC53  A0 1F

loc_1F_FC55:
    LDA $0300,Y                  ; $FC55  B9 00 03
    BPL loc_1F_FC61              ; $FC58  10 07
    DEY                          ; $FC5A  88
    CPY #$0F                     ; $FC5B  C0 0F
    BNE loc_1F_FC55              ; $FC5D  D0 F6
    SEC                          ; $FC5F  38
    RTS                          ; $FC60  60


loc_1F_FC61:
    CLC                          ; $FC61  18
    RTS                          ; $FC62  60


sub_1F_FC63:
    JSR sub_1F_F8C2              ; $FC63  20 C2 F8
    STA $0A                      ; $FC66  85 0A
    LDA #$01                     ; $FC68  A9 01
    BCS loc_1F_FC6E              ; $FC6A  B0 02
    LDA #$02                     ; $FC6C  A9 02

loc_1F_FC6E:
    STA $0C                      ; $FC6E  85 0C
    JSR sub_1F_F8B3              ; $FC70  20 B3 F8
    STA $0B                      ; $FC73  85 0B
    LDA #$04                     ; $FC75  A9 04
    BCS loc_1F_FC7B              ; $FC77  B0 02
    LDA #$08                     ; $FC79  A9 08

loc_1F_FC7B:
    ORA $0C                      ; $FC7B  05 0C
    STA $0C                      ; $FC7D  85 0C
    LDA $0B                      ; $FC7F  A5 0B
    CMP $0A                      ; $FC81  C5 0A
    BCS loc_1F_FCB8              ; $FC83  B0 33
    LDA $02                      ; $FC85  A5 02
    STA $0400,X                  ; $FC87  9D 00 04
    LDA $03                      ; $FC8A  A5 03
    STA $0420,X                  ; $FC8C  9D 20 04
    LDA $0A                      ; $FC8F  A5 0A
    STA $01                      ; $FC91  85 01
    LDA #$00                     ; $FC93  A9 00
    STA $00                      ; $FC95  85 00
    JSR sub_1F_FD11              ; $FC97  20 11 FD
    LDA $04                      ; $FC9A  A5 04
    STA $02                      ; $FC9C  85 02
    LDA $05                      ; $FC9E  A5 05
    STA $03                      ; $FCA0  85 03
    LDA $0B                      ; $FCA2  A5 0B
    STA $01                      ; $FCA4  85 01
    LDA #$00                     ; $FCA6  A9 00
    STA $00                      ; $FCA8  85 00
    JSR sub_1F_FD11              ; $FCAA  20 11 FD
    LDA $04                      ; $FCAD  A5 04
    STA $0440,X                  ; $FCAF  9D 40 04
    LDA $05                      ; $FCB2  A5 05
    STA $0460,X                  ; $FCB4  9D 60 04
    RTS                          ; $FCB7  60


loc_1F_FCB8:
    LDA $02                      ; $FCB8  A5 02
    STA $0440,X                  ; $FCBA  9D 40 04
    LDA $03                      ; $FCBD  A5 03
    STA $0460,X                  ; $FCBF  9D 60 04
    LDA $0B                      ; $FCC2  A5 0B
    STA $01                      ; $FCC4  85 01
    LDA #$00                     ; $FCC6  A9 00
    STA $00                      ; $FCC8  85 00
    JSR sub_1F_FD11              ; $FCCA  20 11 FD
    LDA $04                      ; $FCCD  A5 04
    STA $02                      ; $FCCF  85 02
    LDA $05                      ; $FCD1  A5 05
    STA $03                      ; $FCD3  85 03
    LDA $0A                      ; $FCD5  A5 0A
    STA $01                      ; $FCD7  85 01
    LDA #$00                     ; $FCD9  A9 00
    STA $00                      ; $FCDB  85 00
    JSR sub_1F_FD11              ; $FCDD  20 11 FD
    LDA $04                      ; $FCE0  A5 04
    STA $0400,X                  ; $FCE2  9D 00 04
    LDA $05                      ; $FCE5  A5 05
    STA $0420,X                  ; $FCE7  9D 20 04
    RTS                          ; $FCEA  60


sub_1F_FCEB:
    LDA #$00                     ; $FCEB  A9 00
    STA $02                      ; $FCED  85 02
    STA $03                      ; $FCEF  85 03
    LDA $00                      ; $FCF1  A5 00
    ORA $01                      ; $FCF3  05 01
    BNE loc_1F_FCFA              ; $FCF5  D0 03
    STA $02                      ; $FCF7  85 02
    RTS                          ; $FCF9  60


loc_1F_FCFA:
    LDY #$08                     ; $FCFA  A0 08

loc_1F_FCFC:
    ASL $02                      ; $FCFC  06 02
    ROL $00                      ; $FCFE  26 00
    ROL $03                      ; $FD00  26 03
    SEC                          ; $FD02  38
    LDA $03                      ; $FD03  A5 03
    SBC $01                      ; $FD05  E5 01
    BCC loc_1F_FD0D              ; $FD07  90 04
    STA $03                      ; $FD09  85 03
    INC $02                      ; $FD0B  E6 02

loc_1F_FD0D:
    DEY                          ; $FD0D  88
    BNE loc_1F_FCFC              ; $FD0E  D0 EC
    RTS                          ; $FD10  60


sub_1F_FD11:
    LDA #$00                     ; $FD11  A9 00
    STA $06                      ; $FD13  85 06
    STA $07                      ; $FD15  85 07
    LDA $00                      ; $FD17  A5 00
    ORA $01                      ; $FD19  05 01
    ORA $02                      ; $FD1B  05 02
    ORA $03                      ; $FD1D  05 03
    BNE loc_1F_FD26              ; $FD1F  D0 05
    STA $04                      ; $FD21  85 04
    STA $05                      ; $FD23  85 05
    RTS                          ; $FD25  60


loc_1F_FD26:
    STX $09                      ; $FD26  86 09
    LDY #$10                     ; $FD28  A0 10

loc_1F_FD2A:
    ASL $06                      ; $FD2A  06 06
    ROL $00                      ; $FD2C  26 00
    ROL $01                      ; $FD2E  26 01
    ROL $07                      ; $FD30  26 07
    SEC                          ; $FD32  38
    LDA $01                      ; $FD33  A5 01
    SBC $02                      ; $FD35  E5 02
    TAX                          ; $FD37  AA
    LDA $07                      ; $FD38  A5 07
    SBC $03                      ; $FD3A  E5 03
    BCC loc_1F_FD44              ; $FD3C  90 06
    STX $01                      ; $FD3E  86 01
    STA $07                      ; $FD40  85 07
    INC $06                      ; $FD42  E6 06

loc_1F_FD44:
    DEY                          ; $FD44  88
    BNE loc_1F_FD2A              ; $FD45  D0 E3
    LDA $06                      ; $FD47  A5 06
    STA $04                      ; $FD49  85 04
    LDA $00                      ; $FD4B  A5 00
    STA $05                      ; $FD4D  85 05
    LDX $09                      ; $FD4F  A6 09
    RTS                          ; $FD51  60


sub_1F_FD52:
    LDA #$80                     ; $FD52  A9 80
    STA $5A                      ; $FD54  85 5A
    LDA $F5                      ; $FD56  A5 F5
    PHA                          ; $FD58  48
    LDA #$0C                     ; $FD59  A9 0C
    STA $97                      ; $FD5B  85 97
    JSR sub_1F_FF5B              ; $FD5D  20 5B FF
    LDA #$00                     ; $FD60  A9 00
    STA $5A                      ; $FD62  85 5A
    LDA #$18                     ; $FD64  A9 18
    STA $F4                      ; $FD66  85 F4
    PLA                          ; $FD68  68
    STA $F5                      ; $FD69  85 F5
    JMP sub_1F_FF6B              ; $FD6B  4C 6B FF


sub_1F_FD6E:
    LDA $F4                      ; $FD6E  A5 F4
    PHA                          ; $FD70  48
    LDA $F5                      ; $FD71  A5 F5
    PHA                          ; $FD73  48
    JSR sub_1F_FF57              ; $FD74  20 57 FF
    PLA                          ; $FD77  68
    STA $F5                      ; $FD78  85 F5
    PLA                          ; $FD7A  68
    STA $F4                      ; $FD7B  85 F4
    JMP sub_1F_FF6B              ; $FD7D  4C 6B FF

    .byte $A5,$F4,$48,$A5,$F5,$48,$20,$5B,$FF,$4C,$77,$FD,$86,$0F,$A5,$F5  ; $FD80
    .byte $48,$A9,$0E,$85,$F5,$20,$6B,$FF,$A6,$B8,$20,$06,$A0,$68,$85,$F5  ; $FD90
    .byte $20,$6B,$FF,$A6,$0F,$60,$86,$0F,$A5,$F5,$48,$A9,$0E,$85,$F5,$20  ; $FDA0
    .byte $6B,$FF,$20,$03,$A0,$4C,$9D,$FD,$8A,$40,$A3,$00,$0F,$04,$4B,$50  ; $FDB0
    .byte $80,$04,$18,$10,$E0,$00,$64,$04,$C5,$45,$67,$50,$CA,$11,$1B,$51  ; $FDC0
    .byte $BA,$00,$44,$00,$3E,$00,$A2,$04,$99,$00,$DD,$04,$81,$10,$2B,$11  ; $FDD0
    .byte $80,$01,$4A,$40,$9C,$01,$47,$15,$F7,$11,$47,$44,$17,$40,$C2,$40  ; $FDE0
    .byte $28,$11,$CB,$44,$6E,$50,$8A,$54,$AE,$10,$2B,$00,$53,$05,$5D,$15  ; $FDF0

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
    DEY                          ; $FE3D  88
    BNE loc_1F_FE3A              ; $FE3E  D0 FA

loc_1F_FE40:
    INC $01                      ; $FE40  E6 01

loc_1F_FE42:
    STA ($00),Y                  ; $FE42  91 00
    INY                          ; $FE44  C8
    BNE loc_1F_FE42              ; $FE45  D0 FB
    LDX $01                      ; $FE47  A6 01
    CPX #$07                     ; $FE49  E0 07
    BNE loc_1F_FE40              ; $FE4B  D0 F3
    LDY #$07                     ; $FE4D  A0 07
    LDA #$88                     ; $FE4F  A9 88

loc_1F_FE51:
    STA $DC,X                    ; $FE51  95 DC
    DEX                          ; $FE53  CA
    BPL loc_1F_FE51              ; $FE54  10 FB
    LDA #$18                     ; $FE56  A9 18
    STA $FE                      ; $FE58  85 FE
    LDA #$00                     ; $FE5A  A9 00
    STA $A000                    ; $FE5C  8D 00 A0
    LDX #$1C                     ; $FE5F  A2 1C
    STX $F4                      ; $FE61  86 F4
    INX                          ; $FE63  E8
    STX $F5                      ; $FE64  86 F5
    JSR sub_1F_FF6B              ; $FE66  20 6B FF
    LDA #$40                     ; $FE69  A9 40
    STA $E8                      ; $FE6B  85 E8
    LDA #$42                     ; $FE6D  A9 42
    STA $E9                      ; $FE6F  85 E9
    LDA #$00                     ; $FE71  A9 00
    STA $EA                      ; $FE73  85 EA
    LDA #$01                     ; $FE75  A9 01
    STA $EB                      ; $FE77  85 EB
    LDA #$0A                     ; $FE79  A9 0A
    STA $EC                      ; $FE7B  85 EC
    LDA #$0B                     ; $FE7D  A9 0B
    STA $ED                      ; $FE7F  85 ED
    JSR sub_1F_FF3C              ; $FE81  20 3C FF
    JSR sub_1E_C5E9              ; $FE84  20 E9 C5
    LDA #$20                     ; $FE87  A9 20
    LDX #$00                     ; $FE89  A2 00
    LDY #$00                     ; $FE8B  A0 00
    JSR sub_1E_C59D              ; $FE8D  20 9D C5
    LDA #$24                     ; $FE90  A9 24
    LDX #$00                     ; $FE92  A2 00
    LDY #$00                     ; $FE94  A0 00
    JSR sub_1E_C59D              ; $FE96  20 9D C5
    LDA #$C8                     ; $FE99  A9 C8
    STA $94                      ; $FE9B  85 94
    LDA #$D0                     ; $FE9D  A9 D0
    STA $93                      ; $FE9F  85 93
    LDA #$00                     ; $FEA1  A9 00
    JSR sub_1F_FEF2              ; $FEA3  20 F2 FE
    LDA #$88                     ; $FEA6  A9 88
    STA $FF                      ; $FEA8  85 FF

loc_1F_FEAA:
    LDX #$FF                     ; $FEAA  A2 FF
    TXS                          ; $FEAC  9A

loc_1F_FEAD:
    LDX #$00                     ; $FEAD  A2 00
    STX $90                      ; $FEAF  86 90
    LDY #$04                     ; $FEB1  A0 04

loc_1F_FEB3:
    LDA $80,X                    ; $FEB3  B5 80
    CMP #$04                     ; $FEB5  C9 04
    BCS loc_1F_FEC3              ; $FEB7  B0 0A
    INX                          ; $FEB9  E8
    INX                          ; $FEBA  E8
    INX                          ; $FEBB  E8
    INX                          ; $FEBC  E8
    DEY                          ; $FEBD  88
    BNE loc_1F_FEB3              ; $FEBE  D0 F3
    JMP loc_1F_FEAD              ; $FEC0  4C AD FE


loc_1F_FEC3:
    LDA $90                      ; $FEC3  A5 90
    BNE loc_1F_FEAD              ; $FEC5  D0 E6
    DEY                          ; $FEC7  88
    TYA                          ; $FEC8  98
    EOR #$03                     ; $FEC9  49 03
    STA $91                      ; $FECB  85 91
    LDY $80,X                    ; $FECD  B4 80
    LDA #$02                     ; $FECF  A9 02
    STA $80,X                    ; $FED1  95 80
    CPY #$08                     ; $FED3  C0 08
    BNE loc_1F_FEE2              ; $FED5  D0 0B
    LDA $82,X                    ; $FED7  B5 82
    STA $93                      ; $FED9  85 93
    LDA $83,X                    ; $FEDB  B5 83
    STA $94                      ; $FEDD  85 94
    JMP ($0093)                  ; $FEDF  6C 93 00


loc_1F_FEE2:
    LDA $82,X                    ; $FEE2  B5 82
    TAX                          ; $FEE4  AA
    TXS                          ; $FEE5  9A
    LDA $91                      ; $FEE6  A5 91
    BNE loc_1F_FEED              ; $FEE8  D0 03
    JSR sub_1E_C545              ; $FEEA  20 45 C5

loc_1F_FEED:
    PLA                          ; $FEED  68
    TAY                          ; $FEEE  A8
    PLA                          ; $FEEF  68
    TAX                          ; $FEF0  AA
    RTS                          ; $FEF1  60


sub_1F_FEF2:
    JSR sub_1F_FF16              ; $FEF2  20 16 FF
    LDA $93                      ; $FEF5  A5 93
    STA $82,X                    ; $FEF7  95 82
    LDA $94                      ; $FEF9  A5 94
    STA $83,X                    ; $FEFB  95 83
    LDA #$08                     ; $FEFD  A9 08
    STA $80,X                    ; $FEFF  95 80
    RTS                          ; $FF01  60

    .byte $20,$16,$FF,$A9,$00,$95,$80,$60,$20,$14,$FF,$A9,$00,$95,$80,$4C  ; $FF02
    .byte $AA,$FE  ; $FF12

sub_1F_FF14:
    LDA $91                      ; $FF14  A5 91

sub_1F_FF16:
    ASL A                        ; $FF16  0A
    ASL A                        ; $FF17  0A
    TAX                          ; $FF18  AA
    RTS                          ; $FF19  60


sub_1F_FF1A:
    JSR sub_1F_FF21              ; $FF1A  20 21 FF
    DEX                          ; $FF1D  CA
    BNE sub_1F_FF1A              ; $FF1E  D0 FA
    RTS                          ; $FF20  60


sub_1F_FF21:
    LDA #$01                     ; $FF21  A9 01
    STA $93                      ; $FF23  85 93
    TXA                          ; $FF25  8A
    PHA                          ; $FF26  48
    TYA                          ; $FF27  98
    PHA                          ; $FF28  48
    JSR sub_1F_FF14              ; $FF29  20 14 FF
    LDA $93                      ; $FF2C  A5 93
    STA $81,X                    ; $FF2E  95 81
    LDA #$01                     ; $FF30  A9 01
    STA $80,X                    ; $FF32  95 80
    TXA                          ; $FF34  8A
    TAY                          ; $FF35  A8
    TSX                          ; $FF36  BA
    STX $82,Y                    ; $FF37  96 82
    JMP loc_1F_FEAA              ; $FF39  4C AA FE


sub_1F_FF3C:
    LDA #$FF                     ; $FF3C  A9 FF
    STA $1B                      ; $FF3E  85 1B
    RTS                          ; $FF40  60


sub_1F_FF41:
    LDA $1B                      ; $FF41  A5 1B
    BEQ loc_1F_FF56              ; $FF43  F0 11

sub_1F_FF45:
    LDX #$00                     ; $FF45  A2 00
    STX $1B                      ; $FF47  86 1B

loc_1F_FF49:
    STX $8000                    ; $FF49  8E 00 80
    LDA $E8,X                    ; $FF4C  B5 E8
    STA $8001                    ; $FF4E  8D 01 80
    INX                          ; $FF51  E8
    CPX #$06                     ; $FF52  E0 06
    BNE loc_1F_FF49              ; $FF54  D0 F3

loc_1F_FF56:
    RTS                          ; $FF56  60


sub_1F_FF57:
    LDA #$04                     ; $FF57  A9 04
    STA $97                      ; $FF59  85 97

sub_1F_FF5B:
    JSR sub_1E_C5E9              ; $FF5B  20 E9 C5
    JSR sub_1F_F034              ; $FF5E  20 34 F0
    LDA #$00                     ; $FF61  A9 00
    STA $EE                      ; $FF63  85 EE
    JSR sub_1F_FF21              ; $FF65  20 21 FF
    INC $EE                      ; $FF68  E6 EE
    RTS                          ; $FF6A  60


sub_1F_FF6B:
    INC $F6                      ; $FF6B  E6 F6
    LDA #$06                     ; $FF6D  A9 06
    STA $F0                      ; $FF6F  85 F0
    STA $8000                    ; $FF71  8D 00 80
    LDA $F4                      ; $FF74  A5 F4
    STA $F2                      ; $FF76  85 F2
    STA $8001                    ; $FF78  8D 01 80
    LDA #$07                     ; $FF7B  A9 07
    STA $F0                      ; $FF7D  85 F0
    STA $8000                    ; $FF7F  8D 00 80
    LDA $F5                      ; $FF82  A5 F5
    STA $F3                      ; $FF84  85 F3
    STA $8001                    ; $FF86  8D 01 80
    DEC $F6                      ; $FF89  C6 F6
    LDA $F7                      ; $FF8B  A5 F7
    BNE sub_1F_FF90              ; $FF8D  D0 01
    RTS                          ; $FF8F  60


sub_1F_FF90:
    LDA $F6                      ; $FF90  A5 F6
    BNE loc_1F_FFCC              ; $FF92  D0 38
    LDA #$06                     ; $FF94  A9 06
    STA $8000                    ; $FF96  8D 00 80
    LDA #$16                     ; $FF99  A9 16
    STA $8001                    ; $FF9B  8D 01 80
    LDA #$07                     ; $FF9E  A9 07
    STA $8000                    ; $FFA0  8D 00 80
    LDA #$17                     ; $FFA3  A9 17
    STA $8001                    ; $FFA5  8D 01 80

loc_1F_FFA8:
    LDX $DB                      ; $FFA8  A6 DB
    LDA $DC,X                    ; $FFAA  B5 DC
    CMP #$88                     ; $FFAC  C9 88
    BEQ loc_1F_FFC2              ; $FFAE  F0 12
    PHA                          ; $FFB0  48
    LDA #$88                     ; $FFB1  A9 88
    STA $DC,X                    ; $FFB3  95 DC
    INX                          ; $FFB5  E8
    TXA                          ; $FFB6  8A
    AND #$07                     ; $FFB7  29 07
    STA $DB                      ; $FFB9  85 DB
    PLA                          ; $FFBB  68
    JSR $8003                    ; $FFBC  20 03 80
    JMP loc_1F_FFA8              ; $FFBF  4C A8 FF


loc_1F_FFC2:
    JSR $8000                    ; $FFC2  20 00 80
    LDA #$00                     ; $FFC5  A9 00
    STA $F7                      ; $FFC7  85 F7
    JMP sub_1F_FF6B              ; $FFC9  4C 6B FF


loc_1F_FFCC:
    INC $F7                      ; $FFCC  E6 F7
    RTS                          ; $FFCE  60

    .byte $05,$10,$11,$04,$41,$33,$5C,$D4,$45,$82,$00,$EF,$51,$68,$50,$67  ; $FFCF
    .byte $10,$1C,$00,$07,$04,$CD,$50,$00,$50,$04,$15,$96,$00,$71,$14,$94  ; $FFDF
    .byte $15,$DD,$0E,$97,$C3,$43,$04,$00,$00,$08,$57,$00,$C0,$00,$FE,$43  ; $FFEF
    .byte $C1  ; $FFFF
