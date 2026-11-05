; PRG 8 KB bank $1C at $8000
.segment "BANK1C"
.org $8000

    JMP loc_1C_800C              ; $8000  4C 0C 80


sub_1C_8003:
    JMP loc_1C_8109              ; $8003  4C 09 81

    .byte $4C,$B8,$82,$4C,$97,$80  ; $8006

loc_1C_800C:
    LDA #$55                     ; $800C  A9 55
    STA $99                      ; $800E  85 99
    LDX #$01                     ; $8010  A2 01
    STX $EF                      ; $8012  86 EF

loc_1C_8014:
    LDY #$01                     ; $8014  A0 01
    CPX $5B                      ; $8016  E4 5B
    BEQ loc_1C_8060              ; $8018  F0 46
    INY                          ; $801A  C8
    CPX $5C                      ; $801B  E4 5C
    BEQ loc_1C_8060              ; $801D  F0 41
    LDA $0300,X                  ; $801F  BD 00 03
    BPL loc_1C_808B              ; $8022  10 67
    LDY #$1D                     ; $8024  A0 1D
    LDA $0320,X                  ; $8026  BD 20 03
    CMP #$E0                     ; $8029  C9 E0
    BCC loc_1C_8031              ; $802B  90 04
    LDY #$12                     ; $802D  A0 12
    BNE loc_1C_803D              ; $802F  D0 0C

loc_1C_8031:
    LSR A                        ; $8031  4A
    LSR A                        ; $8032  4A
    LSR A                        ; $8033  4A
    LSR A                        ; $8034  4A
    CMP #$0A                     ; $8035  C9 0A
    BCC loc_1C_803D              ; $8037  90 04
    SEC                          ; $8039  38
    SBC #$06                     ; $803A  E9 06
    TAY                          ; $803C  A8

loc_1C_803D:
    CPY $F5                      ; $803D  C4 F5
    BEQ loc_1C_804A              ; $803F  F0 09
    STY $F5                      ; $8041  84 F5
    TXA                          ; $8043  8A
    PHA                          ; $8044  48
    JSR sub_1F_FF6B              ; $8045  20 6B FF
    PLA                          ; $8048  68
    TAX                          ; $8049  AA

loc_1C_804A:
    LDY $0320,X                  ; $804A  BC 20 03
    LDA $83C7,Y                  ; $804D  B9 C7 83
    STA $00                      ; $8050  85 00
    LDA $84C7,Y                  ; $8052  B9 C7 84
    STA $01                      ; $8055  85 01
    LDA #$80                     ; $8057  A9 80
    PHA                          ; $8059  48
    LDA #$76                     ; $805A  A9 76
    PHA                          ; $805C  48
    JMP ($0000)                  ; $805D  6C 00 00


loc_1C_8060:
    LDA #$00                     ; $8060  A9 00
    STA $005A,Y                  ; $8062  99 5A 00
    JSR sub_1F_FB7B              ; $8065  20 7B FB
    BCS loc_1C_8083              ; $8068  B0 19
    TXA                          ; $806A  8A
    LDY $10                      ; $806B  A4 10
    STA $005A,Y                  ; $806D  99 5A 00
    LDA #$00                     ; $8070  A9 00
    STA $05E0,X                  ; $8072  9D E0 05
    BEQ loc_1C_8083              ; $8075  F0 0C
    CPX #$10                     ; $8077  E0 10
    BCC loc_1C_808B              ; $8079  90 10
    LDA $0320,X                  ; $807B  BD 20 03
    BEQ loc_1C_808B              ; $807E  F0 0B
    JSR sub_1C_8102              ; $8080  20 02 81

loc_1C_8083:
    LDA $0480,X                  ; $8083  BD 80 04
    BPL loc_1C_808B              ; $8086  10 03
    JSR sub_1C_8097              ; $8088  20 97 80

loc_1C_808B:
    INC $EF                      ; $808B  E6 EF
    LDX $EF                      ; $808D  A6 EF
    CPX #$20                     ; $808F  E0 20
    BEQ loc_1C_8096              ; $8091  F0 03
    JMP loc_1C_8014              ; $8093  4C 14 80


loc_1C_8096:
    RTS                          ; $8096  60


sub_1C_8097:
    LDA $05C0                    ; $8097  AD C0 05
    CMP #$A4                     ; $809A  C9 A4
    BEQ loc_1C_8096              ; $809C  F0 F8
    STX $0F                      ; $809E  86 0F
    LDA $F5                      ; $80A0  A5 F5
    PHA                          ; $80A2  48
    LDA #$0A                     ; $80A3  A9 0A
    STA $F5                      ; $80A5  85 F5
    JSR sub_1F_FF6B              ; $80A7  20 6B FF
    LDX $0F                      ; $80AA  A6 0F
    LDA $39                      ; $80AC  A5 39
    BNE loc_1C_80F9              ; $80AE  D0 49
    LDA $30                      ; $80B0  A5 30
    CMP #$06                     ; $80B2  C9 06
    BEQ loc_1C_80F9              ; $80B4  F0 43
    CMP #$0E                     ; $80B6  C9 0E
    BEQ loc_1C_80F9              ; $80B8  F0 3F
    CMP #$0C                     ; $80BA  C9 0C
    BEQ loc_1C_80F9              ; $80BC  F0 3B
    JSR sub_1F_FAE2              ; $80BE  20 E2 FA
    BCS loc_1C_80F9              ; $80C1  B0 36
    LDA #$06                     ; $80C3  A9 06
    STA $30                      ; $80C5  85 30
    LDA #$16                     ; $80C7  A9 16
    JSR sub_1F_F89A              ; $80C9  20 9A F8
    LDA $A2                      ; $80CC  A5 A2
    AND #$1F                     ; $80CE  29 1F
    BEQ loc_1C_80F9              ; $80D0  F0 27
    LDY $0320,X                  ; $80D2  BC 20 03
    LDA $A2                      ; $80D5  A5 A2
    AND #$1F                     ; $80D7  29 1F
    SEC                          ; $80D9  38
    SBC $A000,Y                  ; $80DA  F9 00 A0
    PHP                          ; $80DD  08
    ORA #$80                     ; $80DE  09 80
    STA $A2                      ; $80E0  85 A2
    PLP                          ; $80E2  28
    BEQ loc_1C_80E7              ; $80E3  F0 02
    BCS loc_1C_80F9              ; $80E5  B0 12

loc_1C_80E7:
    LDA #$80                     ; $80E7  A9 80
    STA $A2                      ; $80E9  85 A2
    LDA #$0E                     ; $80EB  A9 0E
    STA $30                      ; $80ED  85 30
    LDA #$F2                     ; $80EF  A9 F2
    JSR sub_1F_F89A              ; $80F1  20 9A F8
    LDA #$17                     ; $80F4  A9 17
    JSR sub_1F_F89A              ; $80F6  20 9A F8

loc_1C_80F9:
    PLA                          ; $80F9  68
    STA $F5                      ; $80FA  85 F5
    JSR sub_1F_FF6B              ; $80FC  20 6B FF
    LDX $0F                      ; $80FF  A6 0F
    RTS                          ; $8101  60


sub_1C_8102:
    LDA $0480,X                  ; $8102  BD 80 04
    AND #$60                     ; $8105  29 60
    BEQ loc_1C_8142              ; $8107  F0 39

loc_1C_8109:
    LDA $05C0                    ; $8109  AD C0 05
    CMP #$A3                     ; $810C  C9 A3
    BNE loc_1C_8113              ; $810E  D0 03
    JMP loc_1C_825E              ; $8110  4C 5E 82


loc_1C_8113:
    JSR sub_1F_FB7B              ; $8113  20 7B FB
    BCS loc_1C_8142              ; $8116  B0 2A
    LDA $0480,X                  ; $8118  BD 80 04
    AND #$20                     ; $811B  29 20
    BEQ loc_1C_8144              ; $811D  F0 25

sub_1C_811F:
    LDA #$19                     ; $811F  A9 19
    JSR sub_1F_F89A              ; $8121  20 9A F8
    LDY $10                      ; $8124  A4 10
    LDA $04A0,Y                  ; $8126  B9 A0 04
    EOR #$03                     ; $8129  49 03
    STA $04A0,Y                  ; $812B  99 A0 04
    LDA #$00                     ; $812E  A9 00
    STA $0440,Y                  ; $8130  99 40 04
    LDA #$FC                     ; $8133  A9 FC
    STA $0460,Y                  ; $8135  99 60 04
    LDA #$00                     ; $8138  A9 00
    STA $0480,Y                  ; $813A  99 80 04
    LDA #$0F                     ; $813D  A9 0F
    STA $0320,Y                  ; $813F  99 20 03

loc_1C_8142:
    SEC                          ; $8142  38
    RTS                          ; $8143  60


loc_1C_8144:
    LDA #$18                     ; $8144  A9 18
    JSR sub_1F_F89A              ; $8146  20 9A F8
    LDA $F5                      ; $8149  A5 F5
    PHA                          ; $814B  48
    STX $0F                      ; $814C  86 0F
    LDA #$0A                     ; $814E  A9 0A
    STA $F5                      ; $8150  85 F5
    JSR sub_1F_FF6B              ; $8152  20 6B FF
    LDX $0F                      ; $8155  A6 0F
    LDY $A0                      ; $8157  A4 A0
    LDA $83AF,Y                  ; $8159  B9 AF 83
    STA $00                      ; $815C  85 00
    LDA $83BB,Y                  ; $815E  B9 BB 83
    STA $01                      ; $8161  85 01
    LDY $0320,X                  ; $8163  BC 20 03
    LDA ($00),Y                  ; $8166  B1 00
    BNE loc_1C_8170              ; $8168  D0 06
    JSR sub_1C_811F              ; $816A  20 1F 81
    JMP loc_1C_824D              ; $816D  4C 4D 82


loc_1C_8170:
    LDA $A0                      ; $8170  A5 A0
    CMP #$08                     ; $8172  C9 08
    BNE loc_1C_81B6              ; $8174  D0 40
    LDA ($00),Y                  ; $8176  B1 00
    BEQ loc_1C_81B3              ; $8178  F0 39
    CMP #$58                     ; $817A  C9 58
    BNE loc_1C_81B6              ; $817C  D0 38
    TXA                          ; $817E  8A
    LDY $10                      ; $817F  A4 10
    STA $005A,Y                  ; $8181  99 5A 00
    LDA $0300,Y                  ; $8184  B9 00 03
    ORA #$01                     ; $8187  09 01
    STA $0300,Y                  ; $8189  99 00 03
    LDA #$9D                     ; $818C  A9 9D
    CMP $05C0,Y                  ; $818E  D9 C0 05
    BEQ loc_1C_81B3              ; $8191  F0 20
    STA $05C0,Y                  ; $8193  99 C0 05
    LDA #$00                     ; $8196  A9 00
    STA $05A0,Y                  ; $8198  99 A0 05
    STA $05E0,Y                  ; $819B  99 E0 05
    STA $0500,Y                  ; $819E  99 00 05
    LDA $0360,X                  ; $81A1  BD 60 03
    STA $0360,Y                  ; $81A4  99 60 03
    LDA $0380,X                  ; $81A7  BD 80 03
    STA $0380,Y                  ; $81AA  99 80 03
    LDA $03C0,X                  ; $81AD  BD C0 03
    STA $03C0,Y                  ; $81B0  99 C0 03

loc_1C_81B3:
    JMP loc_1C_824D              ; $81B3  4C 4D 82


loc_1C_81B6:
    LDA $04E0,X                  ; $81B6  BD E0 04
    AND #$E0                     ; $81B9  29 E0
    BEQ loc_1C_81C0              ; $81BB  F0 03
    JMP loc_1C_822F              ; $81BD  4C 2F 82


loc_1C_81C0:
    LDY $0320,X                  ; $81C0  BC 20 03
    LDA $04E0,X                  ; $81C3  BD E0 04
    SEC                          ; $81C6  38
    SBC ($00),Y                  ; $81C7  F1 00
    BCS loc_1C_81CD              ; $81C9  B0 02
    LDA #$00                     ; $81CB  A9 00

loc_1C_81CD:
    STA $04E0,X                  ; $81CD  9D E0 04
    BNE loc_1C_8207              ; $81D0  D0 35
    LDA $0320,X                  ; $81D2  BD 20 03
    CMP #$52                     ; $81D5  C9 52
    BEQ loc_1C_8207              ; $81D7  F0 2E
    CMP #$53                     ; $81D9  C9 53
    BEQ loc_1C_8207              ; $81DB  F0 2A
    LDA $5A                      ; $81DD  A5 5A
    BPL loc_1C_81E5              ; $81DF  10 04
    LDA #$59                     ; $81E1  A9 59
    BNE loc_1C_81E7              ; $81E3  D0 02

loc_1C_81E5:
    LDA #$71                     ; $81E5  A9 71

loc_1C_81E7:
    JSR sub_1F_F835              ; $81E7  20 35 F8
    LDA #$00                     ; $81EA  A9 00
    STA $0480,X                  ; $81EC  9D 80 04
    LDA $0320,X                  ; $81EF  BD 20 03
    CMP #$30                     ; $81F2  C9 30
    BNE loc_1C_81FD              ; $81F4  D0 07
    LDA #$00                     ; $81F6  A9 00
    STA $0320,X                  ; $81F8  9D 20 03
    BEQ loc_1C_8202              ; $81FB  F0 05

loc_1C_81FD:
    LDA #$7A                     ; $81FD  A9 7A
    STA $0320,X                  ; $81FF  9D 20 03

loc_1C_8202:
    LDA #$90                     ; $8202  A9 90
    STA $0580,X                  ; $8204  9D 80 05

loc_1C_8207:
    LDA $04E0,X                  ; $8207  BD E0 04
    BEQ loc_1C_822F              ; $820A  F0 23
    LDA $0300,X                  ; $820C  BD 00 03
    AND #$40                     ; $820F  29 40
    BNE loc_1C_821D              ; $8211  D0 0A
    LDA $04E0,X                  ; $8213  BD E0 04
    ORA #$20                     ; $8216  09 20
    STA $04E0,X                  ; $8218  9D E0 04
    BNE loc_1C_822F              ; $821B  D0 12

loc_1C_821D:
    LDA $22                      ; $821D  A5 22
    CMP #$0F                     ; $821F  C9 0F
    BEQ loc_1C_8227              ; $8221  F0 04
    CMP #$0C                     ; $8223  C9 0C
    BCS loc_1C_822F              ; $8225  B0 08

loc_1C_8227:
    LDA $04E0,X                  ; $8227  BD E0 04
    ORA #$E0                     ; $822A  09 E0
    STA $04E0,X                  ; $822C  9D E0 04

loc_1C_822F:
    LDA $A0                      ; $822F  A5 A0
    CMP #$05                     ; $8231  C9 05
    BEQ loc_1C_824D              ; $8233  F0 18
    LDY $10                      ; $8235  A4 10
    LDA #$00                     ; $8237  A9 00
    STA $0300,Y                  ; $8239  99 00 03
    LDA $A0                      ; $823C  A5 A0
    CMP #$01                     ; $823E  C9 01
    BNE loc_1C_824D              ; $8240  D0 0B
    LDA #$00                     ; $8242  A9 00
    STA $0301                    ; $8244  8D 01 03
    STA $0302                    ; $8247  8D 02 03
    STA $0303                    ; $824A  8D 03 03

loc_1C_824D:
    PLA                          ; $824D  68
    STA $F5                      ; $824E  85 F5
    JSR sub_1F_FF6B              ; $8250  20 6B FF
    LDX $0F                      ; $8253  A6 0F
    CLC                          ; $8255  18
    LDA $0300,X                  ; $8256  BD 00 03
    AND #$40                     ; $8259  29 40
    BNE loc_1C_82AA              ; $825B  D0 4D

loc_1C_825D:
    RTS                          ; $825D  60


loc_1C_825E:
    LDA $0480,X                  ; $825E  BD 80 04
    AND #$20                     ; $8261  29 20
    BNE loc_1C_825D              ; $8263  D0 F8
    JSR sub_1F_FAE2              ; $8265  20 E2 FA
    BCS loc_1C_825D              ; $8268  B0 F3
    STX $0F                      ; $826A  86 0F
    LDA $F5                      ; $826C  A5 F5
    PHA                          ; $826E  48
    LDA #$0A                     ; $826F  A9 0A
    STA $F5                      ; $8271  85 F5
    JSR sub_1F_FF6B              ; $8273  20 6B FF
    LDX $0F                      ; $8276  A6 0F
    LDY $0320,X                  ; $8278  BC 20 03
    LDA $83AF                    ; $827B  AD AF 83
    STA $00                      ; $827E  85 00
    LDA $83BB                    ; $8280  AD BB 83
    STA $01                      ; $8283  85 01
    LDA $A7                      ; $8285  A5 A7
    AND #$1F                     ; $8287  29 1F
    SEC                          ; $8289  38
    SBC ($00),Y                  ; $828A  F1 00
    BCS loc_1C_8290              ; $828C  B0 02
    LDA #$00                     ; $828E  A9 00

loc_1C_8290:
    ORA #$80                     ; $8290  09 80
    STA $A7                      ; $8292  85 A7
    LDA #$0A                     ; $8294  A9 0A
    STA $30                      ; $8296  85 30
    LDA #$08                     ; $8298  A9 08
    STA $0500                    ; $829A  8D 00 05
    LDA $83B4                    ; $829D  AD B4 83
    STA $00                      ; $82A0  85 00
    LDA $83C0                    ; $82A2  AD C0 83
    STA $01                      ; $82A5  85 01
    JMP loc_1C_81B6              ; $82A7  4C B6 81


loc_1C_82AA:
    LDA $04E0,X                  ; $82AA  BD E0 04
    AND #$1F                     ; $82AD  29 1F
    ORA #$80                     ; $82AF  09 80
    STA $B0                      ; $82B1  85 B0
    AND #$7F                     ; $82B3  29 7F
    BEQ loc_1C_82B8              ; $82B5  F0 01
    RTS                          ; $82B7  60


loc_1C_82B8:
    LDA #$F2                     ; $82B8  A9 F2
    JSR sub_1F_F898              ; $82BA  20 98 F8
    LDA #$17                     ; $82BD  A9 17
    JSR sub_1F_F89A              ; $82BF  20 9A F8
    LDY #$1F                     ; $82C2  A0 1F

loc_1C_82C4:
    LDA $5A                      ; $82C4  A5 5A
    BMI loc_1C_82CC              ; $82C6  30 04
    LDA #$7A                     ; $82C8  A9 7A
    BNE loc_1C_82CE              ; $82CA  D0 02

loc_1C_82CC:
    LDA #$5B                     ; $82CC  A9 5B

loc_1C_82CE:
    JSR sub_1F_F846              ; $82CE  20 46 F8
    LDA #$80                     ; $82D1  A9 80
    STA $0300,Y                  ; $82D3  99 00 03
    LDA #$90                     ; $82D6  A9 90
    STA $0580,Y                  ; $82D8  99 80 05
    LDA #$00                     ; $82DB  A9 00
    STA $0480,Y                  ; $82DD  99 80 04
    LDA #$10                     ; $82E0  A9 10
    STA $0320,Y                  ; $82E2  99 20 03
    LDA $0360,X                  ; $82E5  BD 60 03
    STA $0360,Y                  ; $82E8  99 60 03
    LDA $0380,X                  ; $82EB  BD 80 03
    STA $0380,Y                  ; $82EE  99 80 03
    LDA $03C0,X                  ; $82F1  BD C0 03
    STA $03C0,Y                  ; $82F4  99 C0 03
    LDA $D7E1,Y                  ; $82F7  B9 E1 D7
    STA $0400,Y                  ; $82FA  99 00 04
    LDA $D7F1,Y                  ; $82FD  B9 F1 D7
    STA $0420,Y                  ; $8300  99 20 04
    LDA $D801,Y                  ; $8303  B9 01 D8
    STA $0440,Y                  ; $8306  99 40 04
    LDA $D811,Y                  ; $8309  B9 11 D8
    STA $0460,Y                  ; $830C  99 60 04
    DEY                          ; $830F  88
    CPY #$0F                     ; $8310  C0 0F
    BNE loc_1C_82C4              ; $8312  D0 B0
    LDA $22                      ; $8314  A5 22
    CMP #$03                     ; $8316  C9 03
    BNE loc_1C_831E              ; $8318  D0 04
    LDA #$00                     ; $831A  A9 00
    STA $FA                      ; $831C  85 FA

loc_1C_831E:
    LDA #$00                     ; $831E  A9 00
    STA $0301                    ; $8320  8D 01 03
    STA $0302                    ; $8323  8D 02 03
    STA $0303                    ; $8326  8D 03 03
    STA $0520                    ; $8329  8D 20 05
    LDA $22                      ; $832C  A5 22
    CMP #$0F                     ; $832E  C9 0F
    BEQ loc_1C_8360              ; $8330  F0 2E
    LDA $30                      ; $8332  A5 30
    CMP #$0E                     ; $8334  C9 0E
    BEQ loc_1C_83AD              ; $8336  F0 75
    LDA #$0C                     ; $8338  A9 0C
    STA $30                      ; $833A  85 30
    LDA #$00                     ; $833C  A9 00
    STA $32                      ; $833E  85 32
    STA $0500                    ; $8340  8D 00 05
    STA $0301                    ; $8343  8D 01 03
    STA $0302                    ; $8346  8D 02 03
    STA $0303                    ; $8349  8D 03 03
    LDA #$01                     ; $834C  A9 01
    CMP $05C0                    ; $834E  CD C0 05
    BEQ loc_1C_835E              ; $8351  F0 0B
    STA $05C0                    ; $8353  8D C0 05
    LDA #$00                     ; $8356  A9 00
    STA $05A0                    ; $8358  8D A0 05
    STA $05E0                    ; $835B  8D E0 05

loc_1C_835E:
    CLC                          ; $835E  18
    RTS                          ; $835F  60


loc_1C_8360:
    LDA $30                      ; $8360  A5 30
    CMP #$0F                     ; $8362  C9 0F
    BNE loc_1C_836A              ; $8364  D0 04
    LDA #$00                     ; $8366  A9 00
    STA $30                      ; $8368  85 30

loc_1C_836A:
    LDA #$80                     ; $836A  A9 80
    STA $030F                    ; $836C  8D 0F 03
    LDA #$90                     ; $836F  A9 90
    STA $058F                    ; $8371  8D 8F 05
    LDA $0360,X                  ; $8374  BD 60 03
    STA $036F                    ; $8377  8D 6F 03
    LDA $0380,X                  ; $837A  BD 80 03
    STA $038F                    ; $837D  8D 8F 03
    LDA $03C0,X                  ; $8380  BD C0 03
    STA $03CF                    ; $8383  8D CF 03
    LDA #$00                     ; $8386  A9 00
    STA $03EF                    ; $8388  8D EF 03
    STA $05EF                    ; $838B  8D EF 05
    STA $05AF                    ; $838E  8D AF 05
    STA $048F                    ; $8391  8D 8F 04
    STA $04EF                    ; $8394  8D EF 04
    STA $044F                    ; $8397  8D 4F 04
    STA $046F                    ; $839A  8D 6F 04
    STA $050F                    ; $839D  8D 0F 05
    LDA #$F9                     ; $83A0  A9 F9
    STA $05CF                    ; $83A2  8D CF 05
    LDA #$64                     ; $83A5  A9 64
    STA $032F                    ; $83A7  8D 2F 03
    JSR sub_1F_E11A              ; $83AA  20 1A E1

loc_1C_83AD:
    CLC                          ; $83AD  18
    RTS                          ; $83AE  60

    .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$A1,$A4,$A2,$A5  ; $83AF
    .byte $A3,$A6,$A7,$A1,$A8,$A1,$A9,$A1,$C7,$C9,$FB,$58,$DE,$B4,$FD,$7C  ; $83BF
    .byte $D3,$C8,$14,$49,$12,$C5,$83,$85,$0E,$09,$B3,$9B,$8A,$CB,$CB,$E2  ; $83CF
    .byte $E2,$60,$BB,$C9,$C8,$E0,$6B,$44,$56,$31,$96,$84,$19,$98,$FE,$3A  ; $83DF
    .byte $6B,$35,$EC,$CB,$C3,$C9,$09,$28,$5B,$82,$D7,$FE,$C4,$52,$85,$BD  ; $83EF
    .byte $3E,$60,$60,$B6,$C9,$14,$E5,$C8,$C9,$C9,$56,$85,$F7,$35,$3F,$7F  ; $83FF
    .byte $60,$CC,$40,$40,$0A,$C3,$E4,$55,$34,$C9,$F7,$F7,$C8,$C8,$60,$C8  ; $840F
    .byte $53,$53,$53,$53,$53,$53,$53,$53,$C8,$C9,$93,$3F,$FD,$F9,$FD,$F9  ; $841F
    .byte $FD,$FD,$D2,$C8,$2F,$65,$F8,$C8,$31,$E2,$C8,$94,$AC,$B6,$C8,$C8  ; $842F
    .byte $5F,$5F,$51,$C8,$C8,$C8,$C8,$C8,$A4,$1E,$96,$DD,$88,$47,$C2,$79  ; $843F
    .byte $98,$6C,$BE,$A7,$A8,$65,$95,$34,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8  ; $844F
    .byte $C8,$C8,$C8,$C8,$C8,$C8,$C8,$C8,$00,$03,$06,$09,$0C,$0F,$12,$15  ; $845F
    .byte $18,$1B,$1E,$21,$24,$27,$2A,$2D,$00,$03,$06,$09,$0C,$0F,$12,$15  ; $846F
    .byte $18,$1B,$1E,$21,$24,$27,$2A,$2D,$00,$03,$06,$09,$0C,$0F,$12,$15  ; $847F
    .byte $18,$1B,$1E,$21,$24,$27,$2A,$2D,$00,$03,$06,$09,$0C,$0F,$12,$15  ; $848F
    .byte $18,$1B,$1E,$21,$24,$27,$2A,$2D,$00,$03,$06,$09,$0C,$0F,$12,$15  ; $849F
    .byte $18,$1B,$1E,$21,$24,$27,$2A,$2D,$30,$33,$36,$39,$3C,$3F,$42,$45  ; $84AF
    .byte $48,$4B,$4E,$51,$54,$57,$5A,$5D,$85,$85,$8A,$8B,$8B,$9D,$8B,$B4  ; $84BF
    .byte $8C,$8D,$8E,$9F,$9F,$96,$97,$98,$94,$94,$98,$99,$8F,$8D,$8D,$90  ; $84CF
    .byte $90,$A9,$9A,$85,$85,$AA,$A6,$9B,$9C,$9D,$90,$9D,$9C,$A4,$A5,$A6  ; $84DF
    .byte $A6,$A7,$A2,$A7,$AE,$85,$AD,$AE,$AB,$AC,$AF,$B2,$B4,$B3,$98,$B1  ; $84EF
    .byte $B2,$A9,$A9,$92,$85,$8E,$B9,$85,$85,$85,$B1,$98,$B8,$A7,$A9,$B0  ; $84FF
    .byte $A9,$B5,$B5,$B5,$AA,$99,$95,$BB,$BB,$85,$9F,$9F,$85,$85,$A9,$85  ; $850F
    .byte $B8,$B8,$B8,$B8,$B8,$B8,$B8,$B8,$85,$B7,$95,$A8,$BD,$BD,$BD,$BD  ; $851F
    .byte $BD,$BD,$BE,$85,$95,$91,$B8,$85,$B9,$A1,$85,$91,$B9,$92,$85,$85  ; $852F
    .byte $94,$94,$BF,$85,$85,$85,$85,$85,$86,$87,$87,$87,$88,$89,$89,$8A  ; $853F
    .byte $8A,$BA,$BB,$BC,$BC,$BD,$BD,$BB,$B6,$B6,$B6,$B6,$B6,$B6,$B6,$B6  ; $854F
    .byte $85,$85,$85,$85,$85,$85,$85,$85,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0  ; $855F
    .byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0  ; $856F
    .byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0  ; $857F
    .byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0  ; $858F
    .byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0  ; $859F
    .byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0  ; $85AF
    .byte $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0  ; $85BF
    RTS                          ; $85C7  60

    RTS                          ; $85C8  60

    LDA $04A0,X                  ; $85C9  BD A0 04
    AND #$01                     ; $85CC  29 01
    BEQ loc_1C_85D6              ; $85CE  F0 06
    JSR sub_1F_F71D              ; $85D0  20 1D F7
    JMP loc_1C_85D9              ; $85D3  4C D9 85


loc_1C_85D6:
    JSR sub_1F_F73B              ; $85D6  20 3B F7

loc_1C_85D9:
    CPX #$10                     ; $85D9  E0 10
    BCS loc_1C_8627              ; $85DB  B0 4A
    LDY #$06                     ; $85DD  A0 06
    JSR sub_1F_E8D6              ; $85DF  20 D6 E8
    LDA $41                      ; $85E2  A5 41
    CMP #$70                     ; $85E4  C9 70
    BNE loc_1C_8627              ; $85E6  D0 3F
    LDA $0360,X                  ; $85E8  BD 60 03
    SEC                          ; $85EB  38
    SBC $FC                      ; $85EC  E5 FC
    CMP #$10                     ; $85EE  C9 10
    BCC loc_1C_8627              ; $85F0  90 35
    CMP #$F0                     ; $85F2  C9 F0
    BCS loc_1C_8627              ; $85F4  B0 31
    JSR sub_1F_EE57              ; $85F6  20 57 EE
    BCS loc_1C_8627              ; $85F9  B0 2C
    JSR sub_1F_FC53              ; $85FB  20 53 FC
    BCC loc_1C_8628              ; $85FE  90 28

loc_1C_8600:
    LDA #$71                     ; $8600  A9 71
    JSR sub_1F_F835              ; $8602  20 35 F8
    LDA #$00                     ; $8605  A9 00
    STA $0320,X                  ; $8607  9D 20 03
    LDA $0360,X                  ; $860A  BD 60 03
    AND #$F0                     ; $860D  29 F0
    ORA #$08                     ; $860F  09 08
    STA $0360,X                  ; $8611  9D 60 03
    LDA $0380,X                  ; $8614  BD 80 03
    STA $0380,X                  ; $8617  9D 80 03
    LDA $03C0,X                  ; $861A  BD C0 03
    AND #$F0                     ; $861D  29 F0
    ORA #$08                     ; $861F  09 08
    STA $03C0,X                  ; $8621  9D C0 03
    JMP loc_1C_867C              ; $8624  4C 7C 86


loc_1C_8627:
    RTS                          ; $8627  60


loc_1C_8628:
    STY $01                      ; $8628  84 01
    LDA #$00                     ; $862A  A9 00
    STA $00                      ; $862C  85 00
    LDY #$1F                     ; $862E  A0 1F

loc_1C_8630:
    LDA $0300,Y                  ; $8630  B9 00 03
    BPL loc_1C_863E              ; $8633  10 09
    LDA $0320,Y                  ; $8635  B9 20 03
    CMP #$27                     ; $8638  C9 27
    BNE loc_1C_863E              ; $863A  D0 02
    INC $00                      ; $863C  E6 00

loc_1C_863E:
    DEY                          ; $863E  88
    CPY #$0F                     ; $863F  C0 0F
    BNE loc_1C_8630              ; $8641  D0 ED
    LDY $01                      ; $8643  A4 01
    LDA $00                      ; $8645  A5 00
    CMP #$03                     ; $8647  C9 03
    BEQ loc_1C_8600              ; $8649  F0 B5
    LDA #$71                     ; $864B  A9 71
    JSR sub_1F_F846              ; $864D  20 46 F8
    LDA #$27                     ; $8650  A9 27
    STA $0320,Y                  ; $8652  99 20 03
    LDA $0360,X                  ; $8655  BD 60 03
    AND #$F0                     ; $8658  29 F0
    ORA #$08                     ; $865A  09 08
    STA $0360,Y                  ; $865C  99 60 03
    LDA $0380,X                  ; $865F  BD 80 03
    STA $0380,Y                  ; $8662  99 80 03
    LDA $03C0,X                  ; $8665  BD C0 03
    AND #$F0                     ; $8668  29 F0
    ORA #$08                     ; $866A  09 08
    STA $03C0,Y                  ; $866C  99 C0 03
    LDA #$00                     ; $866F  A9 00
    STA $0480,Y                  ; $8671  99 80 04
    STA $0300,X                  ; $8674  9D 00 03
    LDA #$FF                     ; $8677  A9 FF
    STA $04C0,X                  ; $8679  9D C0 04

loc_1C_867C:
    STX $00                      ; $867C  86 00
    LDA $13                      ; $867E  A5 13
    AND #$01                     ; $8680  29 01
    ASL A                        ; $8682  0A
    ASL A                        ; $8683  0A
    ASL A                        ; $8684  0A
    ASL A                        ; $8685  0A
    ASL A                        ; $8686  0A
    STA $01                      ; $8687  85 01
    LDA $28                      ; $8689  A5 28
    PHA                          ; $868B  48
    LSR A                        ; $868C  4A
    ORA $01                      ; $868D  05 01
    TAY                          ; $868F  A8
    PLA                          ; $8690  68
    ASL A                        ; $8691  0A
    ASL A                        ; $8692  0A
    AND #$04                     ; $8693  29 04
    ORA $03                      ; $8695  05 03
    TAX                          ; $8697  AA
    LDA $0110,Y                  ; $8698  B9 10 01
    ORA $EB82,X                  ; $869B  1D 82 EB
    STA $0110,Y                  ; $869E  99 10 01
    LDX $00                      ; $86A1  A6 00
    RTS                          ; $86A3  60

    LDA $0300,X                  ; $86A4  BD 00 03
    AND #$0F                     ; $86A7  29 0F
    BNE loc_1C_86BC              ; $86A9  D0 11
    JSR sub_1F_F797              ; $86AB  20 97 F7
    LDA $03C0,X                  ; $86AE  BD C0 03
    CLC                          ; $86B1  18
    ADC #$10                     ; $86B2  69 10
    CMP $03C0                    ; $86B4  CD C0 03
    BCC loc_1C_8712              ; $86B7  90 59
    INC $0300,X                  ; $86B9  FE 00 03

loc_1C_86BC:
    LDY #$00                     ; $86BC  A0 00
    JSR sub_1F_F67C              ; $86BE  20 7C F6
    BCC loc_1C_8712              ; $86C1  90 4F
    LDA $05A0,X                  ; $86C3  BD A0 05
    CMP #$04                     ; $86C6  C9 04
    BNE loc_1C_8717              ; $86C8  D0 4D
    LDA #$81                     ; $86CA  A9 81
    STA $0320,X                  ; $86CC  9D 20 03
    LDA #$80                     ; $86CF  A9 80
    STA $0300,X                  ; $86D1  9D 00 03
    LDA #$00                     ; $86D4  A9 00
    STA $0500,X                  ; $86D6  9D 00 05
    LDY #$03                     ; $86D9  A0 03
    JSR sub_1F_E8D6              ; $86DB  20 D6 E8
    LDA $10                      ; $86DE  A5 10
    AND #$10                     ; $86E0  29 10
    BEQ loc_1C_86F0              ; $86E2  F0 0C

loc_1C_86E4:
    INC $0300,X                  ; $86E4  FE 00 03
    LDA #$00                     ; $86E7  A9 00
    STA $0440,X                  ; $86E9  9D 40 04
    STA $0460,X                  ; $86EC  9D 60 04
    RTS                          ; $86EF  60


loc_1C_86F0:
    LDA $A0                      ; $86F0  A5 A0
    CMP #$09                     ; $86F2  C9 09
    BNE loc_1C_86FC              ; $86F4  D0 06
    LDA $41                      ; $86F6  A5 41
    CMP #$80                     ; $86F8  C9 80
    BNE loc_1C_86E4              ; $86FA  D0 E8

loc_1C_86FC:
    LDA $0580,X                  ; $86FC  BD 80 05
    ORA #$01                     ; $86FF  09 01
    STA $0580,X                  ; $8701  9D 80 05
    LDA $A0                      ; $8704  A5 A0
    SEC                          ; $8706  38
    SBC #$06                     ; $8707  E9 06
    LSR A                        ; $8709  4A
    TAY                          ; $870A  A8
    LDA $8718,Y                  ; $870B  B9 18 87
    JSR sub_1F_F835              ; $870E  20 35 F8
    RTS                          ; $8711  60


loc_1C_8712:
    LDA #$00                     ; $8712  A9 00
    STA $05E0,X                  ; $8714  9D E0 05

loc_1C_8717:
    RTS                          ; $8717  60

    .byte $D8,$D9,$D7,$81,$82,$83  ; $8718
    LDA $0300,X                  ; $871E  BD 00 03
    AND #$0F                     ; $8721  29 0F
    BNE loc_1C_876B              ; $8723  D0 46
    DEC $0500,X                  ; $8725  DE 00 05
    BEQ loc_1C_874B              ; $8728  F0 21
    LDA $05C0,X                  ; $872A  BD C0 05
    CMP #$D8                     ; $872D  C9 D8
    BNE loc_1C_873B              ; $872F  D0 0A
    LDA #$00                     ; $8731  A9 00
    STA $05E0,X                  ; $8733  9D E0 05
    LDA $05A0,X                  ; $8736  BD A0 05
    BNE loc_1C_8795              ; $8739  D0 5A

loc_1C_873B:
    LDA $0500,X                  ; $873B  BD 00 05
    CMP #$88                     ; $873E  C9 88
    BCS loc_1C_8795              ; $8740  B0 53
    LDA $05E0,X                  ; $8742  BD E0 05
    ORA #$80                     ; $8745  09 80
    STA $05E0,X                  ; $8747  9D E0 05
    RTS                          ; $874A  60


loc_1C_874B:
    INC $0300,X                  ; $874B  FE 00 03
    LDA #$00                     ; $874E  A9 00
    STA $0440,X                  ; $8750  9D 40 04
    STA $0460,X                  ; $8753  9D 60 04
    STA $0480,X                  ; $8756  9D 80 04
    LDA $0580,X                  ; $8759  BD 80 05
    AND #$FC                     ; $875C  29 FC
    STA $0580,X                  ; $875E  9D 80 05
    LDA #$13                     ; $8761  A9 13
    JSR sub_1F_F835              ; $8763  20 35 F8
    LDA #$04                     ; $8766  A9 04
    STA $05A0,X                  ; $8768  9D A0 05

loc_1C_876B:
    LDA $05A0,X                  ; $876B  BD A0 05
    CMP #$02                     ; $876E  C9 02
    BNE loc_1C_8795              ; $8770  D0 23
    LDA #$00                     ; $8772  A9 00
    STA $05E0,X                  ; $8774  9D E0 05
    LDA $0440,X                  ; $8777  BD 40 04
    CLC                          ; $877A  18
    ADC $99                      ; $877B  65 99
    STA $0440,X                  ; $877D  9D 40 04
    LDA $0460,X                  ; $8780  BD 60 04
    ADC #$00                     ; $8783  69 00
    STA $0460,X                  ; $8785  9D 60 04
    JSR sub_1F_F779              ; $8788  20 79 F7
    LDA $03E0,X                  ; $878B  BD E0 03
    BEQ loc_1C_8795              ; $878E  F0 05
    LDA #$00                     ; $8790  A9 00
    STA $0300,X                  ; $8792  9D 00 03

loc_1C_8795:
    RTS                          ; $8795  60

    .byte $AD,$60,$03,$38,$FD,$60,$03,$48,$AD,$80,$03,$FD,$80,$03,$68,$B0  ; $8796
    .byte $05,$49,$FF,$69,$01,$18,$08,$C9,$03,$90,$02,$A9,$03,$28,$9D,$20  ; $87A6
    .byte $04,$A9,$00,$9D,$00,$04,$90,$08,$A0,$08,$20,$80,$F5,$4C,$CB,$87  ; $87B6
    .byte $A0,$09,$20,$C4,$F5,$AD,$80,$05,$29,$40,$85,$00,$AD,$81,$05,$29  ; $87C6
    .byte $BF,$05,$00,$8D,$81,$05,$60,$BD,$A0,$04,$29,$03,$F0,$67,$A9,$97  ; $87D6
    .byte $DD,$C0,$05,$F0,$03,$9D,$C0,$05,$BD,$A0,$04,$29,$01,$F0,$06,$20  ; $87E6
    .byte $1D,$F7,$4C,$FE,$87,$20,$3B,$F7,$A0,$1F,$B9,$00,$03,$10,$40,$B9  ; $87F6
    .byte $80,$04,$29,$40,$F0,$39,$BD,$60,$03,$38,$F9,$60,$03,$48,$BD,$80  ; $8806
    .byte $03,$F9,$80,$03,$68,$B0,$04,$49,$FF,$69,$01,$C9,$08,$B0,$20,$BD  ; $8816
    .byte $00,$04,$9D,$40,$04,$BD,$20,$04,$9D,$60,$04,$A9,$08,$9D,$A0,$04  ; $8826
    .byte $BD,$C0,$03,$38,$F9,$C0,$03,$B0,$0B,$A9,$04,$9D,$A0,$04,$60,$88  ; $8836
    .byte $C0,$0F,$D0,$B6,$60,$BD,$60,$04,$C9,$06,$F0,$11,$BD,$40,$04,$18  ; $8846
    .byte $69,$20,$9D,$40,$04,$BD,$60,$04,$69,$00,$9D,$60,$04,$BD,$A0,$04  ; $8856
    .byte $29,$08,$F0,$0B,$A9,$9A,$9D,$C0,$05,$20,$79,$F7,$4C,$7D,$88,$20  ; $8866
    .byte $59,$F7,$A9,$9B,$9D,$C0,$05,$BD,$E0,$03,$F0,$05,$A9,$00,$9D,$00  ; $8876
    .byte $03,$60,$BD,$00,$05,$F0,$0C,$DE,$00,$05,$BD,$00,$05,$DD,$43,$89  ; $8886
    .byte $90,$01,$60,$BD,$A0,$04,$29,$01,$F0,$1B,$BD,$00,$05,$F0,$08,$A0  ; $8896
    .byte $1E,$20,$80,$F5,$4C,$D6,$88,$BD,$80,$05,$09,$40,$9D,$80,$05,$20  ; $88A6
    .byte $1D,$F7,$4C,$FD,$88,$BD,$00,$05,$F0,$08,$A0,$1F,$20,$C4,$F5,$4C  ; $88B6
    .byte $D6,$88,$BD,$80,$05,$29,$BF,$9D,$80,$05,$20,$3B,$F7,$4C,$FD,$88  ; $88C6
    .byte $90,$25,$A9,$00,$9D,$40,$04,$9D,$00,$04,$A9,$03,$9D,$60,$04,$9D  ; $88D6
    .byte $20,$04,$BD,$A0,$04,$49,$03,$9D,$A0,$04,$29,$0C,$D0,$4F,$BD,$A0  ; $88E6
    .byte $04,$09,$08,$9D,$A0,$04,$60,$BD,$A0,$04,$29,$0C,$F0,$3F,$29,$04  ; $88F6
    .byte $F0,$1A,$BD,$00,$05,$F0,$0D,$A0,$12,$20,$06,$F6,$A9,$A0,$9D,$C0  ; $8906
    .byte $05,$4C,$39,$89,$A9,$A0,$9D,$C0,$05,$4C,$59,$F7,$BD,$00,$05,$D0  ; $8916
    .byte $08,$A9,$A1,$9D,$C0,$05,$4C,$79,$F7,$A0,$13,$20,$42,$F6,$A9,$A1  ; $8926
    .byte $9D,$C0,$05,$90,$08,$BD,$A0,$04,$49,$0C,$9D,$A0,$04,$60,$B4,$B2  ; $8936
    .byte $B0,$BD,$C0,$05,$C9,$71,$F0,$13,$C9,$AC,$F0,$04,$C9,$AE,$D0,$17  ; $8946
    .byte $BD,$E0,$05,$D0,$66,$A9,$71,$9D,$C0,$05,$60,$BD,$A0,$05,$C9,$04  ; $8956
    .byte $D0,$59,$A9,$AF,$20,$35,$F8,$BD,$20,$04,$C9,$03,$F0,$11,$BD,$00  ; $8966
    .byte $04,$18,$69,$20,$9D,$00,$04,$BD,$20,$04,$69,$00,$9D,$20,$04,$BD  ; $8976
    .byte $A0,$04,$29,$01,$F0,$06,$20,$1D,$F7,$4C,$95,$89,$20,$3B,$F7,$A5  ; $8986
    .byte $95,$29,$01,$F0,$06,$FE,$C0,$03,$4C,$A4,$89,$DE,$C0,$03,$A5,$16  ; $8996
    .byte $29,$0C,$F0,$17,$29,$08,$F0,$06,$20,$79,$F7,$4C,$B7,$89,$20,$59  ; $89A6
    .byte $F7,$BD,$E0,$03,$F0,$05,$A9,$00,$9D,$00,$03,$60,$BD,$00,$03,$29  ; $89B6
    .byte $0F,$D0,$2D,$A0,$12,$20,$7C,$F6,$B0,$0B,$BD,$00,$05,$F0,$72,$DE  ; $89C6
    .byte $00,$05,$4C,$80,$8A,$A9,$00,$9D,$00,$04,$9D,$40,$04,$A9,$03,$9D  ; $89D6
    .byte $20,$04,$9D,$60,$04,$BD,$A0,$04,$09,$04,$9D,$A0,$04,$FE,$00,$03  ; $89E6
    .byte $BD,$A0,$04,$29,$08,$D0,$0D,$A0,$12,$20,$06,$F6,$A9,$A6,$9D,$C0  ; $89F6
    .byte $05,$4C,$14,$8A,$A0,$13,$20,$42,$F6,$A9,$A7,$9D,$C0,$05,$BD,$E0  ; $8A06
    .byte $03,$D0,$79,$B0,$2D,$BD,$A0,$04,$29,$0C,$A8,$BD,$A0,$04,$48,$C0  ; $8A16
    .byte $08,$F0,$05,$49,$03,$9D,$A0,$04,$BD,$C0,$05,$48,$20,$55,$8A,$68  ; $8A26
    .byte $9D,$C0,$05,$68,$9D,$A0,$04,$B0,$39,$BD,$A0,$04,$49,$0C,$9D,$A0  ; $8A36
    .byte $04,$60,$BD,$A0,$04,$29,$08,$F0,$06,$A9,$00,$9D,$00,$03,$60,$A9  ; $8A46
    .byte $A5,$9D,$C0,$05,$BD,$A0,$04,$29,$01,$F0,$08,$A0,$1E,$20,$80,$F5  ; $8A56
    .byte $4C,$6E,$8A,$A0,$1F,$20,$C4,$F5,$90,$08,$BD,$A0,$04,$49,$0C,$9D  ; $8A66
    .byte $A0,$04,$60,$BD,$00,$03,$29,$0F,$D0,$0D,$BD,$A0,$04,$29,$01,$F0  ; $8A76
    .byte $03,$4C,$1D,$F7,$4C,$3B,$F7,$DE,$00,$05,$D0,$05,$A9,$00,$9D,$00  ; $8A86
    .byte $03,$60,$BD,$A0,$04,$29,$03,$F0,$0D,$29,$01,$F0,$06,$20,$1D,$F7  ; $8A96
    .byte $4C,$AC,$8A,$20,$3B,$F7,$BD,$A0,$04,$29,$0C,$F0,$0D,$29,$08,$F0  ; $8AA6
    .byte $06,$20,$79,$F7,$4C,$C0,$8A,$20,$59,$F7,$BD,$E0,$03,$D0,$0C,$DE  ; $8AB6
    .byte $00,$05,$D0,$30,$BD,$00,$03,$29,$0F,$F0,$06,$A9,$00,$9D,$00,$03  ; $8AC6
    .byte $60,$FE,$00,$03,$A9,$14,$9D,$00,$05,$BD,$A0,$04,$29,$0C,$F0,$0C  ; $8AD6
    .byte $BD,$A0,$04,$49,$0C,$9D,$A0,$04,$29,$03,$F0,$08,$BD,$A0,$04,$49  ; $8AE6
    .byte $03,$9D,$A0,$04,$60  ; $8AF6
    LDA $0300,X                  ; $8AFB  BD 00 03
    AND #$0F                     ; $8AFE  29 0F
    BNE loc_1C_8B0A              ; $8B00  D0 08
    INC $0300,X                  ; $8B02  FE 00 03
    LDA #$03                     ; $8B05  A9 03
    STA $0520,X                  ; $8B07  9D 20 05

loc_1C_8B0A:
    LDA $04A0,X                  ; $8B0A  BD A0 04
    AND #$01                     ; $8B0D  29 01
    BEQ loc_1C_8B19              ; $8B0F  F0 08
    LDY #$0A                     ; $8B11  A0 0A
    JSR sub_1F_F580              ; $8B13  20 80 F5
    JMP loc_1C_8B1E              ; $8B16  4C 1E 8B


loc_1C_8B19:
    LDY #$0B                     ; $8B19  A0 0B
    JSR sub_1F_F5C4              ; $8B1B  20 C4 F5

loc_1C_8B1E:
    LDY #$0A                     ; $8B1E  A0 0A
    JSR sub_1F_F67C              ; $8B20  20 7C F6
    BCC loc_1C_8B51              ; $8B23  90 2C
    LDA $0500,X                  ; $8B25  BD 00 05
    TAY                          ; $8B28  A8
    LDA $8B52,Y                  ; $8B29  B9 52 8B
    STA $0440,X                  ; $8B2C  9D 40 04
    LDA $8B55,Y                  ; $8B2F  B9 55 8B
    STA $0460,X                  ; $8B32  9D 60 04
    DEC $0520,X                  ; $8B35  DE 20 05
    BNE loc_1C_8B42              ; $8B38  D0 08
    JSR sub_1F_F869              ; $8B3A  20 69 F8
    LDA #$03                     ; $8B3D  A9 03
    STA $0520,X                  ; $8B3F  9D 20 05

loc_1C_8B42:
    INC $0500,X                  ; $8B42  FE 00 05
    LDA $0500,X                  ; $8B45  BD 00 05
    CMP #$03                     ; $8B48  C9 03
    BCC loc_1C_8B51              ; $8B4A  90 05
    LDA #$00                     ; $8B4C  A9 00
    STA $0500,X                  ; $8B4E  9D 00 05

loc_1C_8B51:
    RTS                          ; $8B51  60

    .byte $44,$44,$EA,$03,$03,$07,$BD,$C0,$05,$C9,$23,$F0,$14,$BD,$A0,$04  ; $8B52
    .byte $29,$01,$F0,$08,$A0,$08,$20,$80,$F5,$4C,$73,$8B,$A0,$09,$20,$C4  ; $8B62
    .byte $F5,$90,$08,$BD,$A0,$04,$49,$03,$9D,$A0,$04,$BD,$00,$03,$29,$0F  ; $8B72
    .byte $D0,$0E,$20,$C2,$F8,$C9,$04,$B0,$1D,$FE,$00,$03,$A9,$23,$D0,$13  ; $8B82
    .byte $BD,$C0,$05,$C9,$24,$F0,$0F,$BD,$A0,$05,$C9,$06,$D0,$08,$20,$A9  ; $8B92
    .byte $8B,$A9,$24,$20,$35,$F8,$60,$20,$53,$FC,$B0,$2F,$BD,$A0,$04,$99  ; $8BA2
    .byte $A0,$04,$BD,$60,$03,$99,$60,$03,$BD,$80,$03,$99,$80,$03,$BD,$C0  ; $8BB2
    .byte $03,$18,$69,$11,$99,$C0,$03,$A9,$01,$99,$E0,$04,$A9,$25,$20,$46  ; $8BC2
    .byte $F8,$A9,$04,$99,$20,$03,$A9,$C0,$99,$80,$04,$60,$BD,$00,$03,$29  ; $8BD2
    .byte $0F,$D0,$06,$20,$1B,$F8,$FE,$00,$03,$A0,$08,$20,$7C,$F6,$90,$0A  ; $8BE2
    .byte $A9,$71,$20,$35,$F8,$A9,$00,$9D,$20,$03,$60,$BD,$00,$03,$29,$0F  ; $8BF2
    .byte $D0,$0E,$9D,$20,$05,$A9,$1E,$9D,$00,$05,$20,$83,$F8,$FE,$00,$03  ; $8C02
    .byte $BD,$00,$05,$D0,$13,$BD,$E0,$05,$1D,$A0,$05,$D0,$0E,$A9,$27,$DD  ; $8C12
    .byte $C0,$05,$F0,$1C,$9D,$C0,$05,$60,$DE,$00,$05,$BD,$A0,$04,$48,$20  ; $8C22
    .byte $69,$F8,$68,$DD,$A0,$04,$F0,$08,$BD,$80,$05,$49,$40,$9D,$80,$05  ; $8C32
    .byte $BD,$C0,$05,$C9,$27,$D0,$36,$BD,$20,$05,$D0,$0B,$BD,$80,$04,$49  ; $8C42
    .byte $60,$9D,$80,$04,$FE,$20,$05,$BD,$A0,$05,$C9,$0A,$D0,$09,$BD,$E0  ; $8C52
    .byte $05,$D0,$04,$20,$80,$8C,$60,$BD,$E0,$05,$1D,$A0,$05,$D0,$0E,$DE  ; $8C62
    .byte $C0,$05,$DE,$00,$03,$BD,$80,$04,$49,$60,$9D,$80,$04,$60,$20,$53  ; $8C72
    .byte $FC,$B0,$49,$84,$00,$BD,$A0,$04,$99,$A0,$04,$29,$02,$A8,$BD,$60  ; $8C82
    .byte $03,$18,$79,$CF,$8C,$48,$BD,$80,$03,$79,$D0,$8C,$A4,$00,$99,$80  ; $8C92
    .byte $03,$68,$99,$60,$03,$BD,$C0,$03,$38,$E9,$06,$99,$C0,$03,$A9,$33  ; $8CA2
    .byte $99,$00,$04,$A9,$03,$99,$20,$04,$A9,$28,$20,$46,$F8,$A9,$2D,$99  ; $8CB2
    .byte $20,$03,$A9,$C0,$99,$80,$04,$A9,$01,$99,$E0,$04,$60,$13,$00,$ED  ; $8CC2
    .byte $FF,$A0,$00,$20,$7C,$F6,$26,$0F,$BD,$C0,$05,$C9,$6A,$F0,$22,$BD  ; $8CD2
    .byte $20,$05,$F0,$09,$BD,$00,$05,$F0,$04,$DE,$00,$05,$60,$BD,$A0,$04  ; $8CE2
    .byte $29,$01,$F0,$08,$A0,$00,$20,$80,$F5,$4C,$03,$8D,$A0,$01,$20,$C4  ; $8CF2
    .byte $F5,$90,$08,$BD,$A0,$04,$49,$03,$9D,$A0,$04,$BD,$00,$03,$29,$0F  ; $8D02
    .byte $D0,$0F,$20,$C2,$F8,$C9,$40,$B0,$08,$FE,$00,$03,$A9,$6A,$20,$35  ; $8D12
    .byte $F8,$BD,$C0,$05,$C9,$6A,$D0,$72,$BD,$A0,$05,$C9,$02,$D0,$6B,$A9  ; $8D22
    .byte $6B,$20,$35,$F8,$BD,$80,$04,$49,$60,$9D,$80,$04,$BD,$C0,$03,$38  ; $8D32
    .byte $E9,$10,$9D,$C0,$03,$A9,$4D,$9D,$40,$04,$A9,$07,$9D,$60,$04,$20  ; $8D42
    .byte $53,$FC,$B0,$46,$84,$00,$BD,$A0,$04,$29,$02,$A8,$BD,$60,$03,$18  ; $8D52
    .byte $79,$C4,$8D,$48,$BD,$80,$03,$79,$C5,$8D,$A4,$00,$99,$80,$03,$68  ; $8D62
    .byte $99,$60,$03,$BD,$C0,$03,$99,$C0,$03,$A9,$01,$99,$E0,$04,$A9,$6C  ; $8D72
    .byte $20,$46,$F8,$A9,$C2,$99,$80,$04,$A9,$44,$99,$40,$04,$A9,$03,$99  ; $8D82
    .byte $60,$04,$A9,$09,$99,$20,$03,$4C,$C3,$8D,$BD,$C0,$05,$C9,$6B,$D0  ; $8D92
    .byte $20,$A5,$0F,$29,$01,$F0,$1A,$A9,$6D,$20,$35,$F8,$20,$69,$F8,$A9  ; $8DA2
    .byte $00,$9D,$00,$04,$A9,$02,$9D,$20,$04,$A9,$10,$9D,$00,$05,$FE,$20  ; $8DB2
    .byte $05,$60,$20,$00,$E0,$FF,$4C,$97,$F7,$BD,$00,$03,$29,$0F,$D0,$1B  ; $8DC2
    .byte $9D,$60,$04,$A9,$C0,$9D,$40,$04,$BD,$20,$03,$38,$E9,$15,$A8,$B9  ; $8DD2
    .byte $12,$8E,$9D,$00,$05,$9D,$20,$05,$FE,$00,$03,$BD,$A0,$04,$29,$01  ; $8DE2
    .byte $F0,$06,$20,$79,$F7,$4C,$FD,$8D,$20,$59,$F7,$DE,$00,$05,$D0,$0F  ; $8DF2
    .byte $BD,$A0,$04,$49,$03,$9D,$A0,$04,$BD,$20,$05,$0A,$9D,$00,$05,$60  ; $8E02
    .byte $60,$70,$BD,$00,$03,$29,$0F,$D0,$0E,$FE,$00,$03,$A9,$00,$9D,$00  ; $8E12
    .byte $05,$9D,$20,$05,$20,$83,$F8,$BD,$00,$03,$29,$02,$F0,$03,$4C,$D3  ; $8E22
    .byte $8E,$BD,$00,$05,$D0,$4E,$BC,$20,$05,$B9,$3C,$8F,$0A,$A8,$B9,$4A  ; $8E32
    .byte $8F,$9D,$40,$04,$B9,$4B,$8F,$9D,$60,$04,$B9,$6A,$8F,$9D,$00,$04  ; $8E42
    .byte $B9,$6B,$8F,$9D,$20,$04,$BD,$20,$04,$10,$15,$BD,$00,$04,$49,$FF  ; $8E52
    .byte $18,$69,$01,$9D,$00,$04,$BD,$20,$04,$49,$FF,$69,$00,$9D,$20,$04  ; $8E62
    .byte $FE,$20,$05,$BD,$20,$05,$C9,$0E,$D0,$05,$A9,$00,$9D,$20,$05,$A9  ; $8E72
    .byte $05,$9D,$00,$05,$DE,$00,$05,$BD,$A0,$03,$18,$7D,$40,$04,$9D,$A0  ; $8E82
    .byte $03,$BD,$C0,$03,$7D,$60,$04,$9D,$C0,$03,$BD,$A0,$04,$29,$02,$D0  ; $8E92
    .byte $07,$20,$1D,$F7,$B0,$05,$90,$03,$20,$3B,$F7,$BD,$20,$03,$C9,$0A  ; $8EA2
    .byte $D0,$50,$20,$7B,$FB,$B0,$19,$A4,$10,$A9,$00,$99,$00,$03,$FE,$00  ; $8EB2
    .byte $03,$A9,$80,$9D,$00,$04,$A9,$02,$9D,$20,$04,$A9,$48,$20,$35,$F8  ; $8EC2
    .byte $60,$BD,$20,$03,$C9,$0A,$D0,$45,$BD,$C0,$05,$C9,$49,$F0,$16,$BD  ; $8ED2
    .byte $E0,$05,$1D,$A0,$05,$D0,$0D,$A9,$49,$20,$35,$F8,$BD,$80,$04,$09  ; $8EE2
    .byte $C3,$9D,$80,$04,$60,$BD,$A0,$04,$29,$01,$F0,$03,$4C,$1D,$F7,$4C  ; $8EF2
    .byte $3B,$F7,$20,$C2,$F8,$C9,$30,$B0,$EB,$A9,$00,$85,$02,$A9,$02,$85  ; $8F02
    .byte $03,$20,$63,$FC,$A5,$0C,$9D,$A0,$04,$FE,$00,$03,$60,$BD,$A0,$04  ; $8F12
    .byte $29,$01,$F0,$06,$20,$1D,$F7,$4C,$2F,$8F,$20,$3B,$F7,$BD,$A0,$04  ; $8F22
    .byte $29,$08,$F0,$03,$4C,$79,$F7,$4C,$59,$F7,$09,$0A,$0B,$0C,$0D,$0E  ; $8F32
    .byte $0F,$01,$02,$03,$04,$05,$06,$07,$CD,$FE,$E5,$FE,$27,$FF,$8B,$FF  ; $8F42
    .byte $00,$00,$75,$00,$D9,$00,$1B,$01,$33,$01,$1B,$01,$D9,$00,$75,$00  ; $8F52
    .byte $00,$00,$8B,$FF,$27,$FF,$E5,$FE,$00,$00,$75,$00,$D9,$00,$1B,$01  ; $8F62
    .byte $33,$01,$1B,$01,$D9,$00,$75,$00,$00,$00,$8B,$FF,$27,$FF,$E5,$FE  ; $8F72
    .byte $CD,$FE,$E5,$FE,$27,$FF,$8B,$FF,$BD,$00,$03,$29,$0F,$D0,$3E,$20  ; $8F82
    .byte $F6,$FA,$90,$01,$60,$FE,$00,$03,$A9,$CC,$9D,$40,$04,$A9,$00,$9D  ; $8F92
    .byte $60,$04,$A9,$02,$9D,$A0,$04,$A9,$10,$9D,$00,$05,$A9,$B4,$9D,$40  ; $8FA2
    .byte $05,$A9,$E8,$9D,$C0,$03,$BD,$60,$03,$29,$F0,$09,$08,$9D,$60,$05  ; $8FB2
    .byte $A9,$00,$9D,$40,$03,$BD,$80,$05,$29,$FB,$9D,$80,$05,$20,$79,$F7  ; $8FC2
    .byte $BD,$80,$05,$29,$20,$F0,$13,$A0,$06,$20,$D6,$E8,$A5,$10,$29,$10  ; $8FD2
    .byte $D0,$34,$BD,$80,$05,$29,$DF,$9D,$80,$05,$BD,$A0,$04,$29,$01,$F0  ; $8FE2
    .byte $06,$20,$1D,$F7,$4C,$FC,$8F,$20,$3B,$F7,$DE,$00,$05,$D0,$17,$FE  ; $8FF2
    .byte $20,$05,$BD,$20,$05,$29,$03,$9D,$20,$05,$A8,$B9,$30,$90,$9D,$A0  ; $9002
    .byte $04,$A9,$0E,$9D,$00,$05,$BD,$40,$05,$F0,$08,$DE,$40,$05,$D0,$0D  ; $9012
    .byte $20,$34,$90,$BD,$E0,$03,$F0,$05,$A9,$00,$9D,$00,$03,$60,$02,$01  ; $9022
    .byte $01,$02,$20,$53,$FC,$B0,$5C,$A9,$70,$20,$46,$F8,$A9,$14,$99,$20  ; $9032
    .byte $03,$A9,$81,$99,$00,$03,$B9,$80,$05,$09,$21,$99,$80,$05,$A9,$0F  ; $9042
    .byte $99,$80,$04,$BD,$60,$05,$99,$60,$03,$99,$60,$05,$BD,$80,$03,$99  ; $9052
    .byte $80,$03,$A9,$00,$99,$20,$05,$99,$E0,$03,$99,$60,$04,$99,$20,$04  ; $9062
    .byte $A9,$CC,$99,$40,$04,$A9,$80,$99,$00,$04,$A9,$E8,$99,$C0,$03,$A9  ; $9072
    .byte $02,$99,$A0,$04,$A9,$10,$99,$00,$05,$A9,$B4,$99,$40,$05,$A9,$E8  ; $9082
    .byte $99,$C0,$03,$60,$BD,$00,$05,$D0,$43,$20,$53,$FC,$B0,$36,$BD,$A0  ; $9092
    .byte $04,$99,$A0,$04,$BD,$60,$03,$99,$60,$03,$BD,$80,$03,$99,$80,$03  ; $90A2
    .byte $BD,$C0,$03,$99,$C0,$03,$A9,$01,$99,$E0,$04,$A9,$18,$99,$20,$03  ; $90B2
    .byte $A9,$4E,$20,$46,$F8,$A9,$C0,$99,$80,$04,$A9,$80,$99,$00,$04,$A9  ; $90C2
    .byte $01,$99,$20,$04,$A9,$F0,$9D,$00,$05,$4C,$69,$F8,$DE,$00,$05,$60  ; $90D2
    .byte $BD,$00,$03,$29,$0F,$D0,$06,$20,$1B,$F8,$FE,$00,$03,$BD,$C0,$05  ; $90E2
    .byte $C9,$4E,$D0,$36,$A0,$08,$20,$7C,$F6,$66,$00,$A5,$41,$C9,$40,$F0  ; $90F2
    .byte $04,$A5,$00,$10,$5D,$BD,$A0,$04,$29,$01,$F0,$08,$A5,$43,$C9,$40  ; $9102
    .byte $D0,$2E,$F0,$06,$A5,$42,$C9,$40,$D0,$26,$A9,$4F,$20,$35,$F8,$A9  ; $9112
    .byte $80,$9D,$40,$04,$A9,$01,$9D,$60,$04,$60,$A0,$0C,$20,$06,$F6,$90  ; $9122
    .byte $0E,$DE,$00,$03,$20,$69,$F8,$20,$1B,$F8,$A9,$4E,$20,$35,$F8,$60  ; $9132
    .byte $BD,$A0,$04,$29,$01,$F0,$08,$A0,$08,$20,$80,$F5,$4C,$56,$91,$A0  ; $9142
    .byte $09,$20,$C4,$F5,$A5,$10,$29,$10,$F0,$08,$BD,$A0,$04,$49,$03,$9D  ; $9152
    .byte $A0,$04,$60,$A0,$00,$20,$7C,$F6,$90,$1A,$BD,$00,$03,$29,$0F,$D0  ; $9162
    .byte $14,$FE,$00,$03,$A9,$44,$9D,$40,$04,$A9,$03,$9D,$60,$04,$20,$69  ; $9172
    .byte $F8,$20,$83,$F8,$60,$BD,$A0,$04,$29,$01,$F0,$03,$4C,$1D,$F7,$4C  ; $9182
    .byte $3B,$F7,$A0,$1E,$20,$7C,$F6,$BD,$C0,$05,$C9,$BC,$D0,$69,$BD,$E0  ; $9192
    .byte $05,$1D,$A0,$05,$D0,$60,$20,$86,$92,$BD,$40,$05,$D0,$59,$DE,$C0  ; $91A2
    .byte $05,$20,$53,$FC,$B0,$4B,$BD,$60,$03,$99,$60,$03,$BD,$80,$03,$99  ; $91B2
    .byte $80,$03,$BD,$C0,$03,$E9,$17,$99,$C0,$03,$A9,$BD,$20,$46,$F8,$A9  ; $91C2
    .byte $75,$99,$20,$03,$A9,$C0,$99,$80,$04,$A9,$01,$99,$E0,$04,$A9,$80  ; $91D2
    .byte $99,$C0,$04,$A9,$00,$99,$A0,$04,$99,$00,$04,$99,$20,$04,$99,$40  ; $91E2
    .byte $04,$99,$40,$05,$A9,$FE,$99,$60,$04,$A9,$08,$99,$00,$05,$99,$20  ; $91F2
    .byte $05,$A9,$00,$9D,$00,$05,$60,$BD,$00,$03,$29,$0F,$D0,$46,$BD,$A0  ; $9202
    .byte $04,$29,$01,$F0,$08,$A0,$20,$20,$80,$F5,$4C,$24,$92,$A0,$21,$20  ; $9212
    .byte $C4,$F5,$90,$08,$BD,$A0,$04,$49,$03,$9D,$A0,$04,$20,$C2,$F8,$C9  ; $9222
    .byte $30,$B0,$0D,$A9,$3C,$9D,$20,$05,$FE,$00,$03,$A9,$C2,$4C,$35,$F8  ; $9232
    .byte $A9,$CA,$9D,$80,$04,$FE,$00,$05,$BD,$00,$05,$C9,$1E,$D0,$34,$A9  ; $9242
    .byte $BC,$4C,$35,$F8,$20,$B3,$F8,$B0,$04,$A9,$DB,$D0,$02,$A9,$CA,$9D  ; $9252
    .byte $80,$04,$BD,$20,$05,$F0,$05,$DE,$20,$05,$D0,$17,$20,$C2,$F8,$C9  ; $9262
    .byte $30,$90,$10,$DE,$00,$03,$A9,$BB,$20,$35,$F8,$20,$69,$F8,$A9,$00  ; $9272
    .byte $9D,$00,$05,$60,$A9,$00,$85,$00,$A9,$80,$85,$01,$A0,$1F,$B9,$00  ; $9282
    .byte $03,$30,$15,$88,$C0,$0F,$D0,$F6,$A5,$00,$D0,$06,$A9,$00,$9D,$40  ; $9292
    .byte $05,$60,$A9,$FF,$9D,$40,$05,$60,$A5,$01,$D9,$C0,$04,$D0,$E4,$E6  ; $92A2
    .byte $00,$4C,$95,$92  ; $92B2
    LDA $0500,X                  ; $92B6  BD 00 05
    BNE loc_1C_92F5              ; $92B9  D0 3A
    JSR sub_1F_F954              ; $92BB  20 54 F9
    LDA $04A0,X                  ; $92BE  BD A0 04
    CLC                          ; $92C1  18
    ADC $0540,X                  ; $92C2  7D 40 05
    TAY                          ; $92C5  A8
    LDA $9349,Y                  ; $92C6  B9 49 93
    STA $0440,X                  ; $92C9  9D 40 04
    LDA $9369,Y                  ; $92CC  B9 69 93
    STA $0460,X                  ; $92CF  9D 60 04
    LDA $9389,Y                  ; $92D2  B9 89 93
    STA $0400,X                  ; $92D5  9D 00 04
    LDA $93A9,Y                  ; $92D8  B9 A9 93
    STA $0420,X                  ; $92DB  9D 20 04
    LDA $93C9,Y                  ; $92DE  B9 C9 93
    STA $05C0,X                  ; $92E1  9D C0 05
    LDA $0580,X                  ; $92E4  BD 80 05
    AND #$BF                     ; $92E7  29 BF
    ORA $93E9,Y                  ; $92E9  19 E9 93
    STA $0580,X                  ; $92EC  9D 80 05
    LDA $0520,X                  ; $92EF  BD 20 05
    STA $0500,X                  ; $92F2  9D 00 05

loc_1C_92F5:
    DEC $0500,X                  ; $92F5  DE 00 05
    LDA #$00                     ; $92F8  A9 00
    STA $00                      ; $92FA  85 00
    LDA $0420,X                  ; $92FC  BD 20 04
    BPL loc_1C_9303              ; $92FF  10 02
    DEC $00                      ; $9301  C6 00

loc_1C_9303:
    LDA $0340,X                  ; $9303  BD 40 03
    CLC                          ; $9306  18
    ADC $0400,X                  ; $9307  7D 00 04
    STA $0340,X                  ; $930A  9D 40 03
    LDA $0360,X                  ; $930D  BD 60 03
    ADC $0420,X                  ; $9310  7D 20 04
    STA $0360,X                  ; $9313  9D 60 03
    LDA $0380,X                  ; $9316  BD 80 03
    ADC $00                      ; $9319  65 00
    STA $0380,X                  ; $931B  9D 80 03
    LDA #$00                     ; $931E  A9 00
    STA $00                      ; $9320  85 00
    LDA $0460,X                  ; $9322  BD 60 04
    BPL loc_1C_9329              ; $9325  10 02
    DEC $00                      ; $9327  C6 00

loc_1C_9329:
    LDA $03A0,X                  ; $9329  BD A0 03
    CLC                          ; $932C  18
    ADC $0440,X                  ; $932D  7D 40 04
    STA $03A0,X                  ; $9330  9D A0 03
    LDA $03C0,X                  ; $9333  BD C0 03
    ADC $0460,X                  ; $9336  7D 60 04
    STA $03C0,X                  ; $9339  9D C0 03
    LDA $03E0,X                  ; $933C  BD E0 03
    ADC $00                      ; $933F  65 00
    BEQ loc_1C_9348              ; $9341  F0 05
    LDA #$00                     ; $9343  A9 00
    STA $0300,X                  ; $9345  9D 00 03

loc_1C_9348:
    RTS                          ; $9348  60

    .byte $00,$27,$4B,$3D,$00,$C3,$B5,$D9,$00,$D0,$B5,$C3,$00,$3D,$4B,$27  ; $9349
    .byte $CD,$E5,$27,$8B,$00,$75,$D9,$1B,$33,$1B,$D9,$75,$00,$8B,$27,$E5  ; $9359
    .byte $FE,$FE,$FF,$FF,$00,$00,$00,$01,$02,$01,$00,$00,$00,$FF,$FF,$FE  ; $9369
    .byte $FE,$FE,$FF,$FF,$00,$00,$00,$01,$01,$01,$00,$00,$00,$FF,$FF,$FE  ; $9379
    .byte $00,$C3,$B5,$D9,$00,$D9,$B5,$C3,$00,$3D,$4B,$27,$00,$27,$4B,$3D  ; $9389
    .byte $00,$75,$D9,$1B,$33,$1B,$D9,$75,$00,$8B,$27,$E5,$CD,$E5,$27,$8B  ; $9399
    .byte $00,$00,$00,$01,$02,$01,$00,$00,$00,$FF,$FF,$FE,$FE,$FE,$FF,$FF  ; $93A9
    .byte $00,$00,$00,$01,$01,$01,$00,$00,$00,$FF,$FF,$FE,$FE,$FE,$FF,$FF  ; $93B9
    .byte $BD,$BD,$BE,$BE,$BF,$BF,$C0,$C0,$C1,$C1,$C0,$C0,$BF,$BF,$BE,$BE  ; $93C9
    .byte $41,$41,$41,$41,$41,$41,$41,$41,$41,$41,$41,$41,$41,$41,$41,$41  ; $93D9
    .byte $00,$00,$40,$40,$40,$40,$40,$40,$00,$00,$00,$00,$00,$00,$00,$00  ; $93E9
    .byte $00,$00,$40,$40,$40,$40,$40,$40,$00,$00,$00,$00,$00,$00,$00,$00  ; $93F9
    .byte $20,$E2,$FA,$90,$4B  ; $9409
    LDA #$00                     ; $940E  A9 00
    STA $00                      ; $9410  85 00
    LDA $0420,X                  ; $9412  BD 20 04
    BPL loc_1C_9419              ; $9415  10 02
    DEC $00                      ; $9417  C6 00

loc_1C_9419:
    LDA $0340,X                  ; $9419  BD 40 03
    CLC                          ; $941C  18
    ADC $0400,X                  ; $941D  7D 00 04
    STA $0340,X                  ; $9420  9D 40 03
    LDA $0360,X                  ; $9423  BD 60 03
    ADC $0420,X                  ; $9426  7D 20 04
    STA $0360,X                  ; $9429  9D 60 03
    LDA $0380,X                  ; $942C  BD 80 03
    ADC $00                      ; $942F  65 00
    STA $0380,X                  ; $9431  9D 80 03
    LDA #$00                     ; $9434  A9 00
    STA $00                      ; $9436  85 00
    LDA $0460,X                  ; $9438  BD 60 04
    BPL loc_1C_943F              ; $943B  10 02
    DEC $00                      ; $943D  C6 00

loc_1C_943F:
    LDA $03A0,X                  ; $943F  BD A0 03
    CLC                          ; $9442  18
    ADC $0440,X                  ; $9443  7D 40 04
    STA $03A0,X                  ; $9446  9D A0 03
    LDA $03C0,X                  ; $9449  BD C0 03
    ADC $0460,X                  ; $944C  7D 60 04
    STA $03C0,X                  ; $944F  9D C0 03
    LDA $03E0,X                  ; $9452  BD E0 03
    ADC $00                      ; $9455  65 00
    BEQ loc_1C_945E              ; $9457  F0 05
    LDA #$00                     ; $9459  A9 00
    STA $0300,X                  ; $945B  9D 00 03

loc_1C_945E:
    RTS                          ; $945E  60

    .byte $BD,$00,$03,$29,$0F,$D0,$08,$FE,$00,$03,$A9,$3C,$9D,$00,$05,$BD  ; $945F
    .byte $80,$04,$29,$E0,$9D,$80,$04,$BC,$20,$03,$BD,$C0,$03,$48,$18,$79  ; $946F
    .byte $AF,$94,$9D,$C0,$03,$20,$97,$80,$BD,$A0,$04,$29,$01,$F0,$08,$A0  ; $947F
    .byte $08,$20,$80,$F5,$4C,$9B,$94,$A0,$09,$20,$C4,$F5,$BD,$80,$05,$29  ; $948F
    .byte $BF,$9D,$80,$05,$90,$0A,$BD,$A0,$04,$49,$03,$9D,$A0,$04,$D0,$25  ; $949F
    .byte $BC,$20,$03,$BD,$C0,$03,$18,$79,$B1,$94,$9D,$C0,$03,$20,$97,$80  ; $94AF
    .byte $A0,$08,$20,$7C,$F6,$BC,$A0,$04,$B9,$41,$00,$D0,$08,$BD,$A0,$04  ; $94BF
    .byte $49,$03,$9D,$A0,$04,$BD,$00,$05,$D0,$20,$BD,$A0,$05,$1D,$E0,$05  ; $94CF
    .byte $D0,$28,$BC,$20,$03,$BD,$C0,$05,$D9,$B3,$94,$D0,$12,$38,$E9,$02  ; $94DF
    .byte $9D,$C0,$05,$A9,$3C,$9D,$00,$05,$D0,$08,$DE,$00,$05,$D0,$0B,$FE  ; $94EF
    .byte $C0,$05,$A9,$00,$9D,$E0,$05,$9D,$A0,$05,$68,$9D,$C0,$03,$BC,$20  ; $94FF
    .byte $03,$BD,$C0,$05,$D9,$B3,$94,$D0,$0E,$BD,$80,$04,$29,$E0,$19,$B5  ; $950F
    .byte $94,$9D,$80,$04,$20,$97,$80,$60,$D8,$C8,$50,$70,$C5,$E1,$16,$14  ; $951F
    .byte $BD,$00,$03,$29,$0F,$D0,$0A,$20,$C2,$F8,$C9,$3C,$B0,$55,$FE,$00  ; $952F
    .byte $03,$BD,$20,$05,$D0,$4A,$A9,$70,$9D,$00,$05,$20,$B9,$95,$B0,$43  ; $953F
    .byte $20,$53,$FC,$B0,$3E,$A9,$94,$20,$46,$F8,$BD,$60,$03,$99,$60,$03  ; $954F
    .byte $BD,$80,$03,$99,$80,$03,$BD,$C0,$03,$99,$C0,$03,$A9,$62,$99,$20  ; $955F
    .byte $03,$BD,$80,$04,$99,$80,$04,$A9,$B2,$99,$80,$05,$A9,$5B,$9D,$20  ; $956F
    .byte $05,$A9,$AB,$99,$40,$04,$A9,$FF,$99,$60,$04,$A9,$08,$99,$E0,$04  ; $957F
    .byte $DE,$20,$05,$60,$A0,$1E,$20,$7C,$F6,$B0,$16,$BD,$C0,$03,$C9,$70  ; $958F
    .byte $90,$0F,$A9,$90,$9D,$00,$05,$20,$B9,$95,$90,$05,$A9,$70,$9D,$C0  ; $959F
    .byte $03,$BD,$80,$05,$09,$20,$9D,$80,$05,$60,$86,$00,$A0,$1F,$C4,$00  ; $95AF
    .byte $F0,$1C,$B9,$00,$03,$10,$17,$B9,$80,$05,$29,$04,$D0,$10,$BD,$60  ; $95BF
    .byte $03,$D9,$60,$03,$D0,$08,$B9,$C0,$03,$DD,$00,$05,$F0,$06,$88,$C0  ; $95CF
    .byte $0F,$D0,$DB,$18,$60  ; $95DF
    LDA $0300,X                  ; $95E4  BD 00 03
    AND #$0F                     ; $95E7  29 0F
    BNE loc_1C_95F9              ; $95E9  D0 0E
    JSR sub_1F_F883              ; $95EB  20 83 F8
    JSR sub_1F_F869              ; $95EE  20 69 F8
    INC $0300,X                  ; $95F1  FE 00 03
    LDA #$24                     ; $95F4  A9 24
    STA $0500,X                  ; $95F6  9D 00 05

loc_1C_95F9:
    LDA $0520,X                  ; $95F9  BD 20 05
    BNE loc_1C_9643              ; $95FC  D0 45
    LDA $0500,X                  ; $95FE  BD 00 05
    BNE loc_1C_963F              ; $9601  D0 3C
    LDA $04A0,X                  ; $9603  BD A0 04
    AND #$02                     ; $9606  29 02
    BNE loc_1C_9617              ; $9608  D0 0D
    JSR sub_1F_F8D9              ; $960A  20 D9 F8
    SEC                          ; $960D  38
    SBC #$01                     ; $960E  E9 01
    CMP #$07                     ; $9610  C9 07
    BCS loc_1C_9639              ; $9612  B0 25
    JMP loc_1C_9621              ; $9614  4C 21 96


loc_1C_9617:
    JSR sub_1F_F8D9              ; $9617  20 D9 F8
    SEC                          ; $961A  38
    SBC #$09                     ; $961B  E9 09
    CMP #$07                     ; $961D  C9 07
    BCS loc_1C_9639              ; $961F  B0 18

loc_1C_9621:
    LDA $05C0,X                  ; $9621  BD C0 05
    CMP #$D1                     ; $9624  C9 D1
    BNE loc_1C_962C              ; $9626  D0 04
    LDA #$D2                     ; $9628  A9 D2
    BNE loc_1C_962E              ; $962A  D0 02

loc_1C_962C:
    LDA #$D5                     ; $962C  A9 D5

loc_1C_962E:
    JSR sub_1F_F835              ; $962E  20 35 F8
    JSR sub_1C_9659              ; $9631  20 59 96
    LDA #$10                     ; $9634  A9 10
    STA $0520,X                  ; $9636  9D 20 05

loc_1C_9639:
    LDA #$78                     ; $9639  A9 78
    STA $0500,X                  ; $963B  9D 00 05
    RTS                          ; $963E  60


loc_1C_963F:
    DEC $0500,X                  ; $963F  DE 00 05
    RTS                          ; $9642  60


loc_1C_9643:
    DEC $0520,X                  ; $9643  DE 20 05
    BNE loc_1C_9658              ; $9646  D0 10
    LDA $05C0,X                  ; $9648  BD C0 05
    CMP #$D2                     ; $964B  C9 D2
    BNE loc_1C_9653              ; $964D  D0 04
    LDA #$D1                     ; $964F  A9 D1
    BNE loc_1C_9655              ; $9651  D0 02

loc_1C_9653:
    LDA #$D4                     ; $9653  A9 D4

loc_1C_9655:
    JSR sub_1F_F835              ; $9655  20 35 F8

loc_1C_9658:
    RTS                          ; $9658  60


sub_1C_9659:
    JSR sub_1F_FC53              ; $9659  20 53 FC
    BCS loc_1C_96C0              ; $965C  B0 62
    STY $00                      ; $965E  84 00
    LDA $04A0,X                  ; $9660  BD A0 04
    STA $04A0,Y                  ; $9663  99 A0 04
    AND #$02                     ; $9666  29 02
    TAY                          ; $9668  A8
    LDA $0360,X                  ; $9669  BD 60 03
    CLC                          ; $966C  18
    ADC $96C1,Y                  ; $966D  79 C1 96
    PHA                          ; $9670  48
    LDA $0380,X                  ; $9671  BD 80 03
    ADC $96C2,Y                  ; $9674  79 C2 96
    LDY $00                      ; $9677  A4 00
    STA $0380,Y                  ; $9679  99 80 03
    PLA                          ; $967C  68
    STA $0360,Y                  ; $967D  99 60 03
    LDA #$00                     ; $9680  A9 00
    STA $04E0,Y                  ; $9682  99 E0 04
    LDA $03C0,X                  ; $9685  BD C0 03
    STA $03C0,Y                  ; $9688  99 C0 03
    LDA $03E0,X                  ; $968B  BD E0 03
    STA $03E0,Y                  ; $968E  99 E0 03
    LDA #$66                     ; $9691  A9 66
    STA $0400,Y                  ; $9693  99 00 04
    STA $02                      ; $9696  85 02
    LDA #$03                     ; $9698  A9 03
    STA $0420,Y                  ; $969A  99 20 04
    STA $03                      ; $969D  85 03
    STY $0F                      ; $969F  84 0F
    STX $0E                      ; $96A1  86 0E
    LDX $0F                      ; $96A3  A6 0F
    JSR sub_1F_FC63              ; $96A5  20 63 FC
    LDY $0F                      ; $96A8  A4 0F
    LDX $0E                      ; $96AA  A6 0E
    LDA $0C                      ; $96AC  A5 0C
    STA $04A0,Y                  ; $96AE  99 A0 04
    LDA #$73                     ; $96B1  A9 73
    JSR sub_1F_F846              ; $96B3  20 46 F8
    LDA #$8F                     ; $96B6  A9 8F
    STA $0320,Y                  ; $96B8  99 20 03
    LDA #$8B                     ; $96BB  A9 8B
    STA $0480,Y                  ; $96BD  99 80 04

loc_1C_96C0:
    RTS                          ; $96C0  60

    .byte $04,$00,$FC,$FF  ; $96C1
    LDA $0300,X                  ; $96C5  BD 00 03
    AND #$0F                     ; $96C8  29 0F
    BNE loc_1C_96E5              ; $96CA  D0 19
    JSR sub_1F_F8C2              ; $96CC  20 C2 F8
    CMP #$51                     ; $96CF  C9 51
    BCS loc_1C_9716              ; $96D1  B0 43
    JSR sub_1F_F869              ; $96D3  20 69 F8
    JSR sub_1F_F883              ; $96D6  20 83 F8
    LDA $0580,X                  ; $96D9  BD 80 05
    AND #$FB                     ; $96DC  29 FB
    STA $0580,X                  ; $96DE  9D 80 05
    INC $0300,X                  ; $96E1  FE 00 03
    RTS                          ; $96E4  60


loc_1C_96E5:
    LDA $0500,X                  ; $96E5  BD 00 05
    BEQ loc_1C_9717              ; $96E8  F0 2D
    DEC $0500,X                  ; $96EA  DE 00 05
    LDA $0300,X                  ; $96ED  BD 00 03
    AND #$01                     ; $96F0  29 01
    BNE loc_1C_9716              ; $96F2  D0 22
    LDA $0460,X                  ; $96F4  BD 60 04
    BMI loc_1C_96FD              ; $96F7  30 04
    CMP #$02                     ; $96F9  C9 02
    BCS loc_1C_9716              ; $96FB  B0 19

loc_1C_96FD:
    LDA $0440,X                  ; $96FD  BD 40 04
    CLC                          ; $9700  18
    ADC #$10                     ; $9701  69 10
    STA $0440,X                  ; $9703  9D 40 04
    LDA $0460,X                  ; $9706  BD 60 04
    ADC #$00                     ; $9709  69 00
    STA $0460,X                  ; $970B  9D 60 04
    BPL loc_1C_9713              ; $970E  10 03
    JMP sub_1F_F7A8              ; $9710  4C A8 F7


loc_1C_9713:
    JMP sub_1F_F7C8              ; $9713  4C C8 F7


loc_1C_9716:
    RTS                          ; $9716  60


loc_1C_9717:
    LDA $0300,X                  ; $9717  BD 00 03
    AND #$0F                     ; $971A  29 0F
    CMP #$04                     ; $971C  C9 04
    BEQ loc_1C_9776              ; $971E  F0 56
    CMP #$03                     ; $9720  C9 03
    BEQ loc_1C_9767              ; $9722  F0 43
    CMP #$02                     ; $9724  C9 02
    BEQ loc_1C_9745              ; $9726  F0 1D
    JSR sub_1F_F8B3              ; $9728  20 B3 F8
    BCC loc_1C_9734              ; $972B  90 07
    CMP #$4D                     ; $972D  C9 4D
    BCC loc_1C_9734              ; $972F  90 03
    JMP sub_1F_F797              ; $9731  4C 97 F7


loc_1C_9734:
    LDA #$14                     ; $9734  A9 14
    STA $0500,X                  ; $9736  9D 00 05
    INC $0300,X                  ; $9739  FE 00 03
    JSR sub_1F_F81B              ; $973C  20 1B F8
    JSR sub_1F_F869              ; $973F  20 69 F8
    JMP sub_1F_F883              ; $9742  4C 83 F8


loc_1C_9745:
    LDA $04A0,X                  ; $9745  BD A0 04
    AND #$02                     ; $9748  29 02
    BEQ loc_1C_9758              ; $974A  F0 0C
    JSR sub_1F_F8C2              ; $974C  20 C2 F8
    BCC loc_1C_9755              ; $974F  90 04
    CMP #$29                     ; $9751  C9 29
    BCS loc_1C_9764              ; $9753  B0 0F

loc_1C_9755:
    JMP sub_1F_F73B              ; $9755  4C 3B F7


loc_1C_9758:
    JSR sub_1F_F8C2              ; $9758  20 C2 F8
    BCS loc_1C_9761              ; $975B  B0 04
    CMP #$29                     ; $975D  C9 29
    BCS loc_1C_9764              ; $975F  B0 03

loc_1C_9761:
    JMP sub_1F_F71D              ; $9761  4C 1D F7


loc_1C_9764:
    JMP loc_1C_9734              ; $9764  4C 34 97


loc_1C_9767:
    JSR sub_1F_F8B3              ; $9767  20 B3 F8
    BCC loc_1C_9734              ; $976A  90 C8
    CMP #$09                     ; $976C  C9 09
    BCC loc_1C_9773              ; $976E  90 03
    JMP sub_1F_F797              ; $9770  4C 97 F7


loc_1C_9773:
    JMP loc_1C_9734              ; $9773  4C 34 97


loc_1C_9776:
    LDA $04A0,X                  ; $9776  BD A0 04
    AND #$02                     ; $9779  29 02
    BEQ loc_1C_9780              ; $977B  F0 03
    JMP sub_1F_F73B              ; $977D  4C 3B F7


loc_1C_9780:
    JMP sub_1F_F71D              ; $9780  4C 1D F7

    LDA $0500,X                  ; $9783  BD 00 05
    BEQ loc_1C_978D              ; $9786  F0 05
    DEC $0500,X                  ; $9788  DE 00 05
    BNE loc_1C_97B3              ; $978B  D0 26

loc_1C_978D:
    LDA $0300,X                  ; $978D  BD 00 03
    AND #$0F                     ; $9790  29 0F
    BNE loc_1C_97D1              ; $9792  D0 3D
    JSR sub_1F_F869              ; $9794  20 69 F8
    JSR sub_1F_F883              ; $9797  20 83 F8
    LDA $05A0,X                  ; $979A  BD A0 05
    BNE loc_1C_97B9              ; $979D  D0 1A
    LDA $05E0,X                  ; $979F  BD E0 05
    CMP #$01                     ; $97A2  C9 01
    BNE loc_1C_97B9              ; $97A4  D0 13
    JSR sub_1F_F8C2              ; $97A6  20 C2 F8
    CMP #$41                     ; $97A9  C9 41
    BCS loc_1C_97B3              ; $97AB  B0 06
    LDA #$C3                     ; $97AD  A9 C3
    STA $0480,X                  ; $97AF  9D 80 04
    RTS                          ; $97B2  60


loc_1C_97B3:
    LDA #$00                     ; $97B3  A9 00
    STA $05E0,X                  ; $97B5  9D E0 05
    RTS                          ; $97B8  60


loc_1C_97B9:
    LDA $05A0,X                  ; $97B9  BD A0 05
    CMP #$02                     ; $97BC  C9 02
    BNE loc_1C_97D0              ; $97BE  D0 10
    JSR sub_1C_981D              ; $97C0  20 1D 98
    INC $0300,X                  ; $97C3  FE 00 03
    LDA #$13                     ; $97C6  A9 13
    STA $0520,X                  ; $97C8  9D 20 05
    LDA #$3C                     ; $97CB  A9 3C
    STA $0500,X                  ; $97CD  9D 00 05

loc_1C_97D0:
    RTS                          ; $97D0  60


loc_1C_97D1:
    LDA #$1D                     ; $97D1  A9 1D
    CMP $05C0,X                  ; $97D3  DD C0 05
    BEQ loc_1C_97DB              ; $97D6  F0 03
    JSR sub_1F_F835              ; $97D8  20 35 F8

loc_1C_97DB:
    LDY #$00                     ; $97DB  A0 00
    JSR sub_1F_F67C              ; $97DD  20 7C F6
    BCC loc_1C_97D0              ; $97E0  90 EE
    LDA $0520,X                  ; $97E2  BD 20 05
    BEQ loc_1C_97FB              ; $97E5  F0 14
    DEC $0520,X                  ; $97E7  DE 20 05
    LDA $04A0,X                  ; $97EA  BD A0 04
    AND #$01                     ; $97ED  29 01
    BEQ loc_1C_97F6              ; $97EF  F0 05
    LDY #$00                     ; $97F1  A0 00
    JMP sub_1F_F580              ; $97F3  4C 80 F5


loc_1C_97F6:
    LDY #$01                     ; $97F6  A0 01
    JMP sub_1F_F5C4              ; $97F8  4C C4 F5


loc_1C_97FB:
    LDA #$1C                     ; $97FB  A9 1C
    JSR sub_1F_F835              ; $97FD  20 35 F8
    LDA $0300,X                  ; $9800  BD 00 03
    AND #$F0                     ; $9803  29 F0
    STA $0300,X                  ; $9805  9D 00 03
    LDA #$A3                     ; $9808  A9 A3
    STA $0480,X                  ; $980A  9D 80 04
    LDA $E5                      ; $980D  A5 E5
    ADC $E6                      ; $980F  65 E6
    STA $E6                      ; $9811  85 E6
    AND #$03                     ; $9813  29 03
    TAY                          ; $9815  A8
    LDA $9881,Y                  ; $9816  B9 81 98
    STA $0500,X                  ; $9819  9D 00 05
    RTS                          ; $981C  60


sub_1C_981D:
    STX $00                      ; $981D  86 00
    LDA #$02                     ; $981F  A9 02
    STA $01                      ; $9821  85 01

loc_1C_9823:
    JSR sub_1F_FC53              ; $9823  20 53 FC
    BCS loc_1C_9872              ; $9826  B0 4A
    LDX $01                      ; $9828  A6 01
    LDA $9875,X                  ; $982A  BD 75 98
    STA $0400,Y                  ; $982D  99 00 04
    LDA $9878,X                  ; $9830  BD 78 98
    STA $0420,Y                  ; $9833  99 20 04
    LDA $987B,X                  ; $9836  BD 7B 98
    STA $0440,Y                  ; $9839  99 40 04
    LDA $987E,X                  ; $983C  BD 7E 98
    STA $0460,Y                  ; $983F  99 60 04
    LDA #$73                     ; $9842  A9 73
    JSR sub_1F_F846              ; $9844  20 46 F8
    LDA #$8B                     ; $9847  A9 8B
    STA $0480,Y                  ; $9849  99 80 04
    LDX $00                      ; $984C  A6 00
    LDA #$0F                     ; $984E  A9 0F
    STA $0320,Y                  ; $9850  99 20 03
    LDA $0360,X                  ; $9853  BD 60 03
    STA $0360,Y                  ; $9856  99 60 03
    LDA $0380,X                  ; $9859  BD 80 03
    STA $0380,Y                  ; $985C  99 80 03
    LDA $03C0,X                  ; $985F  BD C0 03
    CLC                          ; $9862  18
    ADC #$04                     ; $9863  69 04
    STA $03C0,Y                  ; $9865  99 C0 03
    LDA $04A0,X                  ; $9868  BD A0 04
    STA $04A0,Y                  ; $986B  99 A0 04
    DEC $01                      ; $986E  C6 01
    BPL loc_1C_9823              ; $9870  10 B1

loc_1C_9872:
    LDX $00                      ; $9872  A6 00
    RTS                          ; $9874  60

    .byte $FB,$33,$FB,$00,$01,$00,$50,$00,$B0,$FF,$00,$00,$1E,$3C,$96,$3C  ; $9875
    LDA #$00                     ; $9885  A9 00
    STA $00                      ; $9887  85 00
    LDA $0460,X                  ; $9889  BD 60 04
    BPL loc_1C_9890              ; $988C  10 02
    DEC $00                      ; $988E  C6 00

loc_1C_9890:
    LDA $03A0,X                  ; $9890  BD A0 03
    CLC                          ; $9893  18
    ADC $0440,X                  ; $9894  7D 40 04
    STA $03A0,X                  ; $9897  9D A0 03
    LDA $03C0,X                  ; $989A  BD C0 03
    ADC $0460,X                  ; $989D  7D 60 04
    STA $03C0,X                  ; $98A0  9D C0 03
    LDA $03E0,X                  ; $98A3  BD E0 03
    ADC $00                      ; $98A6  65 00
    BNE loc_1C_98AD              ; $98A8  D0 03
    JMP loc_1C_9776              ; $98AA  4C 76 97


loc_1C_98AD:
    LDA #$00                     ; $98AD  A9 00
    STA $0300,X                  ; $98AF  9D 00 03
    RTS                          ; $98B2  60

    LDA $0500,X                  ; $98B3  BD 00 05
    BEQ loc_1C_98BD              ; $98B6  F0 05
    DEC $0500,X                  ; $98B8  DE 00 05
    BNE loc_1C_98D0              ; $98BB  D0 13

loc_1C_98BD:
    LDA $05A0,X                  ; $98BD  BD A0 05
    BNE loc_1C_98DB              ; $98C0  D0 19
    LDA $05E0,X                  ; $98C2  BD E0 05
    CMP #$01                     ; $98C5  C9 01
    BNE loc_1C_98DB              ; $98C7  D0 12
    JSR sub_1F_F8C2              ; $98C9  20 C2 F8
    CMP #$51                     ; $98CC  C9 51
    BCC loc_1C_98D6              ; $98CE  90 06

loc_1C_98D0:
    LDA #$00                     ; $98D0  A9 00
    STA $05E0,X                  ; $98D2  9D E0 05
    RTS                          ; $98D5  60


loc_1C_98D6:
    LDA #$C9                     ; $98D6  A9 C9
    STA $0480,X                  ; $98D8  9D 80 04

loc_1C_98DB:
    JSR sub_1F_F869              ; $98DB  20 69 F8
    JSR sub_1F_F883              ; $98DE  20 83 F8
    LDA $05A0,X                  ; $98E1  BD A0 05
    ORA $05E0,X                  ; $98E4  1D E0 05
    BNE loc_1C_98FE              ; $98E7  D0 15
    LDA $E4                      ; $98E9  A5 E4
    ADC $E7                      ; $98EB  65 E7
    STA $E7                      ; $98ED  85 E7
    AND #$01                     ; $98EF  29 01
    TAY                          ; $98F1  A8
    LDA $9995,Y                  ; $98F2  B9 95 99
    STA $0500,X                  ; $98F5  9D 00 05
    LDA #$A9                     ; $98F8  A9 A9
    STA $0480,X                  ; $98FA  9D 80 04

loc_1C_98FD:
    RTS                          ; $98FD  60


loc_1C_98FE:
    LDA $05E0,X                  ; $98FE  BD E0 05
    BNE loc_1C_98FD              ; $9901  D0 FA
    LDA $05A0,X                  ; $9903  BD A0 05
    CMP #$09                     ; $9906  C9 09
    BEQ loc_1C_990F              ; $9908  F0 05
    CMP #$12                     ; $990A  C9 12
    BEQ loc_1C_990F              ; $990C  F0 01
    RTS                          ; $990E  60


loc_1C_990F:
    JSR sub_1F_FC53              ; $990F  20 53 FC
    BCS loc_1C_98FD              ; $9912  B0 E9
    LDA #$00                     ; $9914  A9 00
    STA $0440,Y                  ; $9916  99 40 04
    LDA #$04                     ; $9919  A9 04
    STA $0460,Y                  ; $991B  99 60 04
    LDA #$6F                     ; $991E  A9 6F
    JSR sub_1F_F846              ; $9920  20 46 F8
    LDA #$1E                     ; $9923  A9 1E
    JSR sub_1F_F89A              ; $9925  20 9A F8
    LDA #$C0                     ; $9928  A9 C0
    STA $0480,Y                  ; $992A  99 80 04
    LDA #$13                     ; $992D  A9 13
    STA $0320,Y                  ; $992F  99 20 03
    LDA $0360,X                  ; $9932  BD 60 03
    STA $0360,Y                  ; $9935  99 60 03
    LDA $0380,X                  ; $9938  BD 80 03
    STA $0380,Y                  ; $993B  99 80 03
    LDA $03C0,X                  ; $993E  BD C0 03
    SEC                          ; $9941  38
    SBC #$0C                     ; $9942  E9 0C
    STA $03C0,Y                  ; $9944  99 C0 03
    LDA $03E0,X                  ; $9947  BD E0 03
    STA $03E0,Y                  ; $994A  99 E0 03
    LDA $04A0,X                  ; $994D  BD A0 04
    STA $04A0,Y                  ; $9950  99 A0 04
    PHA                          ; $9953  48
    JSR sub_1F_F8C2              ; $9954  20 C2 F8
    STX $00                      ; $9957  86 00
    LDX #$03                     ; $9959  A2 03

loc_1C_995B:
    CMP $9989,X                  ; $995B  DD 89 99
    BCC loc_1C_9963              ; $995E  90 03
    DEX                          ; $9960  CA
    BNE loc_1C_995B              ; $9961  D0 F8

loc_1C_9963:
    LDA $998D,X                  ; $9963  BD 8D 99
    STA $0400,Y                  ; $9966  99 00 04
    LDA $9991,X                  ; $9969  BD 91 99
    STA $0420,Y                  ; $996C  99 20 04
    PLA                          ; $996F  68
    AND #$02                     ; $9970  29 02
    TAX                          ; $9972  AA
    LDA $0360,Y                  ; $9973  B9 60 03
    CLC                          ; $9976  18
    ADC $9997,X                  ; $9977  7D 97 99
    STA $0360,Y                  ; $997A  99 60 03
    LDA $0380,Y                  ; $997D  B9 80 03
    ADC $9998,X                  ; $9980  7D 98 99
    STA $0380,Y                  ; $9983  99 80 03
    LDX $00                      ; $9986  A6 00
    RTS                          ; $9988  60

    .byte $4C,$3D,$2E,$1F,$00,$80,$00,$80,$02,$01,$01,$00,$3C,$78,$0C,$00  ; $9989
    .byte $F4,$FF  ; $9999
    LDY #$08                     ; $999B  A0 08
    JSR sub_1F_F67C              ; $999D  20 7C F6
    BCS loc_1C_99B9              ; $99A0  B0 17
    LDA $04A0,X                  ; $99A2  BD A0 04
    AND #$02                     ; $99A5  29 02
    BEQ loc_1C_99B1              ; $99A7  F0 08
    LDY #$07                     ; $99A9  A0 07
    JSR sub_1F_F5C4              ; $99AB  20 C4 F5
    JMP loc_1C_99B6              ; $99AE  4C B6 99


loc_1C_99B1:
    LDY #$08                     ; $99B1  A0 08
    JSR sub_1F_F580              ; $99B3  20 80 F5

loc_1C_99B6:
    BCS loc_1C_99B9              ; $99B6  B0 01
    RTS                          ; $99B8  60


loc_1C_99B9:
    LDA #$00                     ; $99B9  A9 00
    STA $0320,X                  ; $99BB  9D 20 03
    LDA #$71                     ; $99BE  A9 71
    JMP sub_1F_F835              ; $99C0  4C 35 F8

    .byte $BD,$00,$03,$29,$0F,$C9,$01,$F0,$52,$C9,$02,$F0,$62,$C9,$03,$D0  ; $99C3
    .byte $03,$4C,$76,$97,$20,$69,$F8,$20,$83,$F8,$BD,$C0,$05,$C9,$1F,$F0  ; $99D3
    .byte $2A,$BD,$A0,$05,$D0,$12,$20,$C2,$F8,$C9,$61,$B0,$28,$A9,$C3,$9D  ; $99E3
    .byte $80,$04,$FE,$A0,$05,$BD,$A0,$05,$C9,$05,$D0,$1E,$A9,$00,$9D,$40  ; $99F3
    .byte $04,$A9,$02,$9D,$60,$04,$A9,$1F,$4C,$35,$F8,$20,$B3,$F8,$C9,$49  ; $9A03
    .byte $B0,$36,$4C,$79,$F7,$A9,$00,$9D,$E0,$05,$60,$20,$C2,$F8,$BD,$A0  ; $9A13
    .byte $04,$29,$02,$F0,$05,$B0,$25,$4C,$76,$97,$90,$20,$4C,$76,$97,$20  ; $9A23
    .byte $69,$F8,$20,$83,$F8,$BD,$00,$05,$F0,$04,$DE,$00,$05,$60,$20,$B3  ; $9A33
    .byte $F8,$C9,$04,$90,$03,$4C,$59,$F7,$FE,$00,$03,$60,$86,$00,$A9,$02  ; $9A43
    .byte $85,$01,$20,$53,$FC,$B0,$47,$A6,$01,$BD,$AC,$9A,$99,$00,$04,$BD  ; $9A53
    .byte $AF,$9A,$99,$20,$04,$BD,$B2,$9A,$99,$40,$04,$BD,$B5,$9A,$99,$60  ; $9A63
    .byte $04,$BD,$B8,$9A,$99,$A0,$04,$A9,$73,$20,$46,$F8,$A9,$8B,$99,$80  ; $9A73
    .byte $04,$A6,$00,$A9,$0F,$99,$20,$03,$BD,$60,$03,$99,$60,$03,$BD,$80  ; $9A83
    .byte $03,$99,$80,$03,$BD,$C0,$03,$99,$C0,$03,$C6,$01,$10,$B4,$A6,$00  ; $9A93
    .byte $FE,$00,$03,$A9,$3C,$9D,$00,$05,$60,$DB,$00,$DB,$00,$00,$00,$DB  ; $9AA3
    .byte $33,$DB,$00,$01,$00,$02,$01,$01  ; $9AB3
    LDA $04A0,X                  ; $9ABB  BD A0 04
    AND #$01                     ; $9ABE  29 01
    BEQ loc_1C_9AC8              ; $9AC0  F0 06
    JSR sub_1F_F71D              ; $9AC2  20 1D F7
    JMP loc_1C_9ACB              ; $9AC5  4C CB 9A


loc_1C_9AC8:
    JSR sub_1F_F73B              ; $9AC8  20 3B F7

loc_1C_9ACB:
    JSR sub_1F_F8B3              ; $9ACB  20 B3 F8
    BCC loc_1C_9B2B              ; $9ACE  90 5B
    JSR sub_1F_F8C2              ; $9AD0  20 C2 F8
    CMP #$10                     ; $9AD3  C9 10
    BCS loc_1C_9B2B              ; $9AD5  B0 54
    LDA $30                      ; $9AD7  A5 30
    CMP #$02                     ; $9AD9  C9 02
    BCS loc_1C_9B08              ; $9ADB  B0 2B
    LDA #$05                     ; $9ADD  A9 05
    STA $30                      ; $9ADF  85 30
    STX $34                      ; $9AE1  86 34
    LDA #$07                     ; $9AE3  A9 07
    STA $05C0                    ; $9AE5  8D C0 05
    LDA #$00                     ; $9AE8  A9 00
    STA $05E0                    ; $9AEA  8D E0 05
    STA $05A0                    ; $9AED  8D A0 05
    STA $32                      ; $9AF0  85 32
    LDA $03C0                    ; $9AF2  AD C0 03
    STA $0500,X                  ; $9AF5  9D 00 05
    LDA $0460                    ; $9AF8  AD 60 04
    BPL loc_1C_9B43              ; $9AFB  10 46
    LDA #$55                     ; $9AFD  A9 55
    STA $0440                    ; $9AFF  8D 40 04
    LDA #$00                     ; $9B02  A9 00
    STA $0460                    ; $9B04  8D 60 04
    RTS                          ; $9B07  60


loc_1C_9B08:
    LDA $30                      ; $9B08  A5 30
    CMP #$05                     ; $9B0A  C9 05
    BNE loc_1C_9B43              ; $9B0C  D0 35
    CPX $34                      ; $9B0E  E4 34
    BNE loc_1C_9B43              ; $9B10  D0 31
    LDA $0500,X                  ; $9B12  BD 00 05
    SEC                          ; $9B15  38
    SBC $03C0                    ; $9B16  ED C0 03
    CMP #$20                     ; $9B19  C9 20
    BCC loc_1C_9B43              ; $9B1B  90 26
    LDA #$00                     ; $9B1D  A9 00
    STA $0440                    ; $9B1F  8D 40 04
    STA $0460                    ; $9B22  8D 60 04
    LDA $04A0,X                  ; $9B25  BD A0 04
    STA $35                      ; $9B28  85 35
    RTS                          ; $9B2A  60


loc_1C_9B2B:
    LDA $30                      ; $9B2B  A5 30
    CMP #$05                     ; $9B2D  C9 05
    BNE loc_1C_9B43              ; $9B2F  D0 12
    CPX $34                      ; $9B31  E4 34
    BNE loc_1C_9B43              ; $9B33  D0 0E
    LDA #$AB                     ; $9B35  A9 AB
    STA $0440                    ; $9B37  8D 40 04
    LDA #$FF                     ; $9B3A  A9 FF
    STA $0460                    ; $9B3C  8D 60 04
    LDA #$00                     ; $9B3F  A9 00
    STA $30                      ; $9B41  85 30

loc_1C_9B43:
    RTS                          ; $9B43  60

    .byte $BD,$00,$03,$29,$0F,$D0,$0D,$20,$C2,$F8,$C9,$76,$B0,$F1,$FE,$00  ; $9B44
    .byte $03,$20,$83,$F8,$BD,$80,$05,$29,$04,$F0,$08,$BD,$80,$05,$49,$04  ; $9B54
    .byte $9D,$80,$05,$BD,$00,$03,$29,$02,$D0,$0A,$A0,$24,$20,$7C,$F6,$90  ; $9B64
    .byte $6C,$FE,$00,$03,$BD,$A0,$04,$48,$20,$69,$F8,$68,$DD,$A0,$04,$F0  ; $9B74
    .byte $08,$BD,$80,$05,$49,$40,$9D,$80,$05,$BD,$20,$05,$D0,$14,$20,$E2  ; $9B84
    .byte $9B,$84,$00,$A5,$00,$9D,$00,$05,$A9,$78,$9D,$20,$05,$A9,$00,$9D  ; $9B94
    .byte $40,$05,$BD,$40,$05,$D0,$26,$BD,$00,$05,$A8,$B9,$C0,$03,$38,$FD  ; $9BA4
    .byte $C0,$03,$B0,$05,$49,$FF,$69,$01,$18,$C9,$30,$B0,$20,$BD,$C0,$05  ; $9BB4
    .byte $C9,$39,$F0,$09,$A9,$39,$20,$35,$F8,$FE,$40,$05,$60,$DE,$20,$05  ; $9BC4
    .byte $BD,$E0,$05,$1D,$A0,$05,$D0,$05,$A9,$38,$20,$35,$F8,$60,$20,$53  ; $9BD4
    .byte $FC,$B0,$31,$BD,$A0,$04,$99,$A0,$04,$BD,$60,$03,$99,$60,$03,$BD  ; $9BE4
    .byte $80,$03,$99,$80,$03,$A9,$04,$99,$C0,$03,$BD,$C0,$03,$99,$00,$05  ; $9BF4
    .byte $A9,$94,$20,$46,$F8,$A9,$CA,$99,$80,$04,$A9,$24,$99,$20,$03,$A9  ; $9C04
    .byte $08,$99,$E0,$04,$60,$BD,$00,$03,$29,$0F,$D0,$0B,$9D,$40,$04,$A9  ; $9C14
    .byte $04,$9D,$60,$04,$FE,$00,$03,$20,$59,$F7,$BD,$C0,$03,$38,$FD,$00  ; $9C24
    .byte $05,$B0,$05,$49,$FF,$69,$01,$18,$C9,$20,$B0,$15,$A9,$80,$85,$02  ; $9C34
    .byte $A9,$04,$85,$03,$20,$63,$FC,$A5,$0C,$9D,$A0,$04,$A9,$0B,$9D,$20  ; $9C44
    .byte $03,$60  ; $9C54
    LDA $0300,X                  ; $9C56  BD 00 03
    AND #$0F                     ; $9C59  29 0F
    BNE loc_1C_9C73              ; $9C5B  D0 16
    STA $0440,X                  ; $9C5D  9D 40 04
    LDA #$04                     ; $9C60  A9 04
    STA $0460,X                  ; $9C62  9D 60 04
    JSR sub_1C_9D20              ; $9C65  20 20 9D
    STA $0500,X                  ; $9C68  9D 00 05
    LDA #$1E                     ; $9C6B  A9 1E
    STA $0520,X                  ; $9C6D  9D 20 05
    INC $0300,X                  ; $9C70  FE 00 03

loc_1C_9C73:
    LDA $03C0,X                  ; $9C73  BD C0 03
    PHA                          ; $9C76  48
    LDA $03C0,X                  ; $9C77  BD C0 03
    SEC                          ; $9C7A  38
    SBC #$17                     ; $9C7B  E9 17
    STA $03C0,X                  ; $9C7D  9D C0 03
    LDA #$C3                     ; $9C80  A9 C3
    STA $0480,X                  ; $9C82  9D 80 04
    JSR sub_1C_8003              ; $9C85  20 03 80
    PLA                          ; $9C88  68
    STA $03C0,X                  ; $9C89  9D C0 03
    LDA $04E0,X                  ; $9C8C  BD E0 04
    BEQ loc_1C_9CA5              ; $9C8F  F0 14
    LDA #$AC                     ; $9C91  A9 AC
    STA $0480,X                  ; $9C93  9D 80 04
    LDA $0300,X                  ; $9C96  BD 00 03
    AND #$02                     ; $9C99  29 02
    BNE loc_1C_9CD6              ; $9C9B  D0 39
    DEC $0500,X                  ; $9C9D  DE 00 05
    BNE loc_1C_9CA6              ; $9CA0  D0 04
    INC $0300,X                  ; $9CA2  FE 00 03

loc_1C_9CA5:
    RTS                          ; $9CA5  60


loc_1C_9CA6:
    LDY #$2A                     ; $9CA6  A0 2A
    JSR sub_1F_F606              ; $9CA8  20 06 F6
    LDA $04A0,X                  ; $9CAB  BD A0 04
    AND #$01                     ; $9CAE  29 01
    BEQ loc_1C_9CC0              ; $9CB0  F0 0E
    LDA $42                      ; $9CB2  A5 42
    AND #$10                     ; $9CB4  29 10
    BEQ loc_1C_9CCD              ; $9CB6  F0 15
    LDY #$10                     ; $9CB8  A0 10
    JSR sub_1F_F580              ; $9CBA  20 80 F5
    JMP loc_1C_9CCB              ; $9CBD  4C CB 9C


loc_1C_9CC0:
    LDA $44                      ; $9CC0  A5 44
    AND #$10                     ; $9CC2  29 10
    BEQ loc_1C_9CCD              ; $9CC4  F0 07
    LDY #$11                     ; $9CC6  A0 11
    JSR sub_1F_F5C4              ; $9CC8  20 C4 F5

loc_1C_9CCB:
    BCC loc_1C_9CD5              ; $9CCB  90 08

loc_1C_9CCD:
    LDA $04A0,X                  ; $9CCD  BD A0 04
    EOR #$03                     ; $9CD0  49 03
    STA $04A0,X                  ; $9CD2  9D A0 04

loc_1C_9CD5:
    RTS                          ; $9CD5  60


loc_1C_9CD6:
    DEC $0520,X                  ; $9CD6  DE 20 05
    BNE loc_1C_9CF0              ; $9CD9  D0 15
    STA $0540,X                  ; $9CDB  9D 40 05
    STA $0560,X                  ; $9CDE  9D 60 05
    LDA #$1E                     ; $9CE1  A9 1E
    STA $0520,X                  ; $9CE3  9D 20 05
    JSR sub_1C_9D20              ; $9CE6  20 20 9D
    STA $0500,X                  ; $9CE9  9D 00 05
    DEC $0300,X                  ; $9CEC  DE 00 03
    RTS                          ; $9CEF  60


loc_1C_9CF0:
    LDA $0540,X                  ; $9CF0  BD 40 05
    BNE loc_1C_9D18              ; $9CF3  D0 23
    LDA $0560,X                  ; $9CF5  BD 60 05
    AND #$01                     ; $9CF8  29 01
    ASL A                        ; $9CFA  0A
    TAY                          ; $9CFB  A8
    LDA $0360,X                  ; $9CFC  BD 60 03
    CLC                          ; $9CFF  18
    ADC $9D1C,Y                  ; $9D00  79 1C 9D
    STA $0360,X                  ; $9D03  9D 60 03
    LDA $0380,X                  ; $9D06  BD 80 03
    ADC $9D1D,Y                  ; $9D09  79 1D 9D
    STA $0380,X                  ; $9D0C  9D 80 03
    LDA #$02                     ; $9D0F  A9 02
    STA $0540,X                  ; $9D11  9D 40 05
    INC $0560,X                  ; $9D14  FE 60 05
    RTS                          ; $9D17  60


loc_1C_9D18:
    DEC $0540,X                  ; $9D18  DE 40 05
    RTS                          ; $9D1B  60

    .byte $01,$00,$FF,$FF  ; $9D1C

sub_1C_9D20:
    LDA $E4                      ; $9D20  A5 E4
    ADC $E5                      ; $9D22  65 E5
    STA $E4                      ; $9D24  85 E4
    AND #$03                     ; $9D26  29 03
    TAY                          ; $9D28  A8
    LDA $9D2D,Y                  ; $9D29  B9 2D 9D
    RTS                          ; $9D2C  60

    .byte $10,$20,$30,$10,$20,$83,$F8,$A0,$10,$20,$7C,$F6,$B0,$16,$A9,$00  ; $9D2D
    .byte $9D,$E0,$05,$BD,$A0,$04,$29,$01,$F0,$05,$A0,$0E,$4C,$80,$F5,$A0  ; $9D3D
    .byte $0F,$4C,$C4,$F5,$BD,$A0,$05,$C9,$08,$D0,$26,$BD,$E0,$05,$F0,$0E  ; $9D4D
    .byte $A9,$00,$9D,$A0,$05,$9D,$E0,$05,$A9,$20,$20,$9A,$F8,$60,$A9,$A8  ; $9D5D
    .byte $9D,$40,$04,$A9,$05,$9D,$60,$04,$20,$69,$F8,$A9,$C5,$9D,$80,$04  ; $9D6D
    .byte $60,$A9,$A5,$9D,$80,$04,$60,$20,$B3,$F8,$C9,$1C,$B0,$28,$20,$C2  ; $9D7D
    .byte $F8,$66,$00,$C9,$68,$B0,$1F,$BD,$80,$05,$29,$40,$D0,$08,$A5,$00  ; $9D8D
    .byte $30,$14,$A9,$01,$D0,$06,$A5,$00,$10,$0C,$A9,$02,$85,$36,$A9,$00  ; $9D9D
    .byte $85,$37,$A9,$01,$85,$38,$60  ; $9DAD
    LDA $0300,X                  ; $9DB4  BD 00 03
    AND #$0F                     ; $9DB7  29 0F
    BNE loc_1C_9DC3              ; $9DB9  D0 08
    LDA #$1E                     ; $9DBB  A9 1E
    STA $0500,X                  ; $9DBD  9D 00 05
    INC $0300,X                  ; $9DC0  FE 00 03

loc_1C_9DC3:
    LDA $0300,X                  ; $9DC3  BD 00 03
    AND #$02                     ; $9DC6  29 02
    BNE loc_1C_9E04              ; $9DC8  D0 3A
    JSR sub_1F_F8C2              ; $9DCA  20 C2 F8
    CMP #$50                     ; $9DCD  C9 50
    BCS loc_1C_9E0C              ; $9DCF  B0 3B
    LDA $0540,X                  ; $9DD1  BD 40 05
    BNE loc_1C_9DE7              ; $9DD4  D0 11
    LDA #$5A                     ; $9DD6  A9 5A
    JSR sub_1F_F835              ; $9DD8  20 35 F8
    JSR sub_1F_F869              ; $9DDB  20 69 F8
    JSR sub_1C_9EA9              ; $9DDE  20 A9 9E
    LDA #$1E                     ; $9DE1  A9 1E
    STA $0540,X                  ; $9DE3  9D 40 05
    RTS                          ; $9DE6  60


loc_1C_9DE7:
    DEC $0540,X                  ; $9DE7  DE 40 05
    BNE loc_1C_9E0C              ; $9DEA  D0 20
    INC $0560,X                  ; $9DEC  FE 60 05
    LDA $0560,X                  ; $9DEF  BD 60 05
    CMP #$02                     ; $9DF2  C9 02
    BCC loc_1C_9E0C              ; $9DF4  90 16
    LDA #$00                     ; $9DF6  A9 00
    STA $0560,X                  ; $9DF8  9D 60 05
    LDA #$78                     ; $9DFB  A9 78
    STA $0540,X                  ; $9DFD  9D 40 05
    INC $0300,X                  ; $9E00  FE 00 03
    RTS                          ; $9E03  60


loc_1C_9E04:
    DEC $0540,X                  ; $9E04  DE 40 05
    BNE loc_1C_9E0C              ; $9E07  D0 03
    DEC $0300,X                  ; $9E09  DE 00 03

loc_1C_9E0C:
    DEC $0500,X                  ; $9E0C  DE 00 05
    BNE loc_1C_9E31              ; $9E0F  D0 20
    LDA #$00                     ; $9E11  A9 00
    STA $01                      ; $9E13  85 01
    JSR sub_1C_9E46              ; $9E15  20 46 9E
    LDA #$1E                     ; $9E18  A9 1E
    STA $0500,X                  ; $9E1A  9D 00 05
    INC $0520,X                  ; $9E1D  FE 20 05
    LDA $0520,X                  ; $9E20  BD 20 05
    CMP #$03                     ; $9E23  C9 03
    BCC loc_1C_9E31              ; $9E25  90 0A
    LDA #$5A                     ; $9E27  A9 5A
    STA $0500,X                  ; $9E29  9D 00 05
    LDA #$00                     ; $9E2C  A9 00
    STA $0520,X                  ; $9E2E  9D 20 05

loc_1C_9E31:
    LDA $05C0,X                  ; $9E31  BD C0 05
    CMP #$5A                     ; $9E34  C9 5A
    BNE loc_1C_9E45              ; $9E36  D0 0D
    LDA $05E0,X                  ; $9E38  BD E0 05
    ORA $05A0,X                  ; $9E3B  1D A0 05
    BNE loc_1C_9E45              ; $9E3E  D0 05
    LDA #$59                     ; $9E40  A9 59
    JSR sub_1F_F835              ; $9E42  20 35 F8

loc_1C_9E45:
    RTS                          ; $9E45  60


sub_1C_9E46:
    JSR sub_1F_FC53              ; $9E46  20 53 FC
    BCS loc_1C_9EA4              ; $9E49  B0 59
    STY $00                      ; $9E4B  84 00
    LDA $04A0,X                  ; $9E4D  BD A0 04
    STA $04A0,Y                  ; $9E50  99 A0 04
    AND #$02                     ; $9E53  29 02
    TAY                          ; $9E55  A8
    LDA $0360,X                  ; $9E56  BD 60 03
    CLC                          ; $9E59  18
    ADC $9EA5,Y                  ; $9E5A  79 A5 9E
    PHA                          ; $9E5D  48
    LDA $0380,X                  ; $9E5E  BD 80 03
    ADC $9EA6,Y                  ; $9E61  79 A6 9E
    LDY $00                      ; $9E64  A4 00
    STA $0380,Y                  ; $9E66  99 80 03
    PLA                          ; $9E69  68
    STA $0360,Y                  ; $9E6A  99 60 03
    LDA $03C0,X                  ; $9E6D  BD C0 03
    SEC                          ; $9E70  38
    SBC #$04                     ; $9E71  E9 04
    STA $03C0,Y                  ; $9E73  99 C0 03
    LDA #$80                     ; $9E76  A9 80
    STA $0400,Y                  ; $9E78  99 00 04
    LDA #$01                     ; $9E7B  A9 01
    STA $0420,Y                  ; $9E7D  99 20 04
    LDA #$73                     ; $9E80  A9 73
    JSR sub_1F_F846              ; $9E82  20 46 F8
    LDA #$1B                     ; $9E85  A9 1B
    STA $0320,Y                  ; $9E87  99 20 03
    LDA #$8B                     ; $9E8A  A9 8B
    STA $0480,Y                  ; $9E8C  99 80 04
    LDA #$00                     ; $9E8F  A9 00
    STA $04E0,Y                  ; $9E91  99 E0 04
    LDA $04A0,X                  ; $9E94  BD A0 04
    EOR #$03                     ; $9E97  49 03
    STA $04A0,X                  ; $9E99  9D A0 04
    INC $01                      ; $9E9C  E6 01
    LDA $01                      ; $9E9E  A5 01
    CMP #$02                     ; $9EA0  C9 02
    BCC sub_1C_9E46              ; $9EA2  90 A2

loc_1C_9EA4:
    RTS                          ; $9EA4  60

    .byte $0F,$00,$F1,$FF  ; $9EA5

sub_1C_9EA9:
    JSR sub_1F_FC53              ; $9EA9  20 53 FC
    BCS loc_1C_9EA4              ; $9EAC  B0 F6
    LDA #$00                     ; $9EAE  A9 00
    STA $0440,Y                  ; $9EB0  99 40 04
    LDA #$04                     ; $9EB3  A9 04
    STA $0460,Y                  ; $9EB5  99 60 04
    LDA #$73                     ; $9EB8  A9 73
    JSR sub_1F_F846              ; $9EBA  20 46 F8
    LDA #$8B                     ; $9EBD  A9 8B
    STA $0480,Y                  ; $9EBF  99 80 04
    LDA #$0C                     ; $9EC2  A9 0C
    STA $0320,Y                  ; $9EC4  99 20 03
    LDA $0360,X                  ; $9EC7  BD 60 03
    STA $0360,Y                  ; $9ECA  99 60 03
    LDA $0380,X                  ; $9ECD  BD 80 03
    STA $0380,Y                  ; $9ED0  99 80 03
    LDA $03C0,X                  ; $9ED3  BD C0 03
    SEC                          ; $9ED6  38
    SBC #$10                     ; $9ED7  E9 10
    STA $03C0,Y                  ; $9ED9  99 C0 03
    LDA $03E0,X                  ; $9EDC  BD E0 03
    STA $03E0,Y                  ; $9EDF  99 E0 03
    LDA $04A0,X                  ; $9EE2  BD A0 04
    STA $04A0,Y                  ; $9EE5  99 A0 04
    JSR sub_1F_F8C2              ; $9EE8  20 C2 F8
    STX $00                      ; $9EEB  86 00
    LDX #$03                     ; $9EED  A2 03

loc_1C_9EEF:
    CMP $9F06,X                  ; $9EEF  DD 06 9F
    BCC loc_1C_9EF7              ; $9EF2  90 03
    DEX                          ; $9EF4  CA
    BNE loc_1C_9EEF              ; $9EF5  D0 F8

loc_1C_9EF7:
    LDA $9F0A,X                  ; $9EF7  BD 0A 9F
    STA $0400,Y                  ; $9EFA  99 00 04
    LDA $9F0E,X                  ; $9EFD  BD 0E 9F
    STA $0420,Y                  ; $9F00  99 20 04
    LDX $00                      ; $9F03  A6 00
    RTS                          ; $9F05  60

    .byte $4C,$3D,$2E,$1F,$00,$80,$00,$80,$02,$01,$01,$00  ; $9F06
    LDY #$12                     ; $9F12  A0 12
    JSR sub_1F_F67C              ; $9F14  20 7C F6
    BCS loc_1C_9F30              ; $9F17  B0 17
    LDA $04A0,X                  ; $9F19  BD A0 04
    AND #$01                     ; $9F1C  29 01
    BEQ loc_1C_9F28              ; $9F1E  F0 08
    LDY #$1E                     ; $9F20  A0 1E
    JSR sub_1F_F580              ; $9F22  20 80 F5
    JMP loc_1C_9F2D              ; $9F25  4C 2D 9F


loc_1C_9F28:
    LDY #$1F                     ; $9F28  A0 1F
    JSR sub_1F_F5C4              ; $9F2A  20 C4 F5

loc_1C_9F2D:
    BCS loc_1C_9F30              ; $9F2D  B0 01
    RTS                          ; $9F2F  60


loc_1C_9F30:
    LDA $0320,X                  ; $9F30  BD 20 03
    CMP #$0C                     ; $9F33  C9 0C
    BNE loc_1C_9F6C              ; $9F35  D0 35
    LDA #$00                     ; $9F37  A9 00
    STA $0320,X                  ; $9F39  9D 20 03
    LDA $B3                      ; $9F3C  A5 B3
    BPL loc_1C_9F44              ; $9F3E  10 04
    LDA #$59                     ; $9F40  A9 59
    BNE loc_1C_9F46              ; $9F42  D0 02

loc_1C_9F44:
    LDA #$71                     ; $9F44  A9 71

loc_1C_9F46:
    JMP sub_1F_F835              ; $9F46  4C 35 F8

    .byte $BD,$A0,$04,$29,$01,$F0,$08,$A0,$0C,$20,$80,$F5,$4C,$5D,$9F,$A0  ; $9F49
    .byte $0D,$20,$C4,$F5,$B0,$0D,$BD,$A0,$04,$29,$08,$F0,$03,$4C,$79,$F7  ; $9F59
    .byte $4C,$59,$F7  ; $9F69

loc_1C_9F6C:
    LDA #$00                     ; $9F6C  A9 00
    STA $0300,X                  ; $9F6E  9D 00 03
    STA $01                      ; $9F71  85 01
    LDA #$FF                     ; $9F73  A9 FF
    STA $04C0,X                  ; $9F75  9D C0 04

loc_1C_9F78:
    JSR sub_1F_FC53              ; $9F78  20 53 FC
    BCS loc_1C_9FE2              ; $9F7B  B0 65
    STY $00                      ; $9F7D  84 00
    LDA $04A0,X                  ; $9F7F  BD A0 04
    AND #$02                     ; $9F82  29 02
    TAY                          ; $9F84  A8
    LDA $0360,X                  ; $9F85  BD 60 03
    CLC                          ; $9F88  18
    ADC $A731,Y                  ; $9F89  79 31 A7
    PHA                          ; $9F8C  48
    LDA $0380,X                  ; $9F8D  BD 80 03
    ADC $A732,Y                  ; $9F90  79 32 A7
    LDY $00                      ; $9F93  A4 00
    STA $0380,Y                  ; $9F95  99 80 03
    PLA                          ; $9F98  68
    STA $0360,Y                  ; $9F99  99 60 03
    LDA $03C0,X                  ; $9F9C  BD C0 03
    STA $03C0,Y                  ; $9F9F  99 C0 03
    LDA #$5B                     ; $9FA2  A9 5B
    JSR sub_1F_F846              ; $9FA4  20 46 F8
    LDA #$0C                     ; $9FA7  A9 0C
    STA $0320,Y                  ; $9FA9  99 20 03
    LDA #$8B                     ; $9FAC  A9 8B
    STA $0480,Y                  ; $9FAE  99 80 04
    LDA #$00                     ; $9FB1  A9 00
    STA $04E0,Y                  ; $9FB3  99 E0 04
    STX $02                      ; $9FB6  86 02
    LDX $01                      ; $9FB8  A6 01
    LDA $9FE3,X                  ; $9FBA  BD E3 9F
    STA $04A0,Y                  ; $9FBD  99 A0 04
    LDA $9FE7,X                  ; $9FC0  BD E7 9F
    STA $0440,Y                  ; $9FC3  99 40 04
    LDA $9FEB,X                  ; $9FC6  BD EB 9F
    STA $0460,Y                  ; $9FC9  99 60 04
    LDA $9FEF,X                  ; $9FCC  BD EF 9F
    STA $0400,Y                  ; $9FCF  99 00 04
    LDA $9FF3,X                  ; $9FD2  BD F3 9F
    STA $0420,Y                  ; $9FD5  99 20 04
    LDX $02                      ; $9FD8  A6 02
    INC $01                      ; $9FDA  E6 01
    LDA $01                      ; $9FDC  A5 01
    CMP #$04                     ; $9FDE  C9 04
    BCC loc_1C_9F78              ; $9FE0  90 96

loc_1C_9FE2:
    RTS                          ; $9FE2  60

    .byte $01,$01,$02,$02,$9E,$44,$9E,$44,$04,$03,$04,$03,$CC,$80,$CC,$80  ; $9FE3
    .byte $00,$00,$00,$00  ; $9FF3
    JSR $A249                    ; $9FF7  20 49 A2
    LDA $0560,X                  ; $9FFA  BD 60 05
    BEQ loc_1C_9FE2              ; $9FFD  F0 E3
    .byte $BD  ; $9FFF
