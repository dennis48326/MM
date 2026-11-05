; PRG 8 KB bank $1C at $8000
.segment "BANK1C"
.org $8000

    SEI                          ; $8000  78
    LDX #$FF                     ; $8001  A2 FF
    TXS                          ; $8003  9A
    LDX #$01                     ; $8004  A2 01

loc_1C_8006:
    LDA $2002                    ; $8006  AD 02 20
    BPL loc_1C_8006              ; $8009  10 FB

loc_1C_800B:
    LDA $2002                    ; $800B  AD 02 20
    BMI loc_1C_800B              ; $800E  30 FB
    DEX                          ; $8010  CA
    BPL loc_1C_8006              ; $8011  10 F3
    LDA #$00                     ; $8013  A9 00
    STA $00                      ; $8015  85 00
    STA $01                      ; $8017  85 01
    LDY #$00                     ; $8019  A0 00

loc_1C_801B:
    STA ($00),Y                  ; $801B  91 00
    INY                          ; $801D  C8
    BNE loc_1C_801B              ; $801E  D0 FB
    INC $01                      ; $8020  E6 01
    LDX $01                      ; $8022  A6 01
    CPX #$08                     ; $8024  E0 08
    BNE loc_1C_801B              ; $8026  D0 F3
    LDA #$0E                     ; $8028  A9 0E
    JSR sub_1E_C05D              ; $802A  20 5D C0
    LDA #$01                     ; $802D  A9 01
    STA $BFFF                    ; $802F  8D FF BF
    LSR A                        ; $8032  4A
    STA $BFFF                    ; $8033  8D FF BF
    LSR A                        ; $8036  4A
    STA $BFFF                    ; $8037  8D FF BF
    LSR A                        ; $803A  4A
    STA $BFFF                    ; $803B  8D FF BF
    LSR A                        ; $803E  4A
    STA $BFFF                    ; $803F  8D FF BF
    LDA #$1F                     ; $8042  A9 1F
    STA $DFFF                    ; $8044  8D FF DF
    LSR A                        ; $8047  4A
    STA $DFFF                    ; $8048  8D FF DF
    LSR A                        ; $804B  4A
    STA $DFFF                    ; $804C  8D FF DF
    LSR A                        ; $804F  4A
    STA $DFFF                    ; $8050  8D FF DF
    LSR A                        ; $8053  4A
    STA $DFFF                    ; $8054  8D FF DF
    LDA #$03                     ; $8057  A9 03
    STA $A8                      ; $8059  85 A8
    LDA #$00                     ; $805B  A9 00
    STA $A7                      ; $805D  85 A7

loc_1C_805F:
    JSR sub_1E_C557              ; $805F  20 57 C5
    LDA $BE                      ; $8062  A5 BE
    BNE loc_1C_805F              ; $8064  D0 F9
    LDA $9A                      ; $8066  A5 9A
    CMP #$FF                     ; $8068  C9 FF
    BNE loc_1C_8072              ; $806A  D0 06
    LDA #$08                     ; $806C  A9 08
    STA $2A                      ; $806E  85 2A
    BNE loc_1C_8079              ; $8070  D0 07

loc_1C_8072:
    LDA #$03                     ; $8072  A9 03
    STA $A8                      ; $8074  85 A8
    JSR sub_1E_C565              ; $8076  20 65 C5

loc_1C_8079:
    LDA $2A                      ; $8079  A5 2A
    CMP #$08                     ; $807B  C9 08
    BCC loc_1C_8088              ; $807D  90 09
    JSR sub_1E_C071              ; $807F  20 71 C0
    LDA $2A                      ; $8082  A5 2A
    CMP #$09                     ; $8084  C9 09
    BCS loc_1C_8091              ; $8086  B0 09

loc_1C_8088:
    LDX #$0A                     ; $8088  A2 0A
    LDA #$1C                     ; $808A  A9 1C

loc_1C_808C:
    STA $9C,X                    ; $808C  95 9C
    DEX                          ; $808E  CA
    BPL loc_1C_808C              ; $808F  10 FB

loc_1C_8091:
    LDX #$00                     ; $8091  A2 00
    LDA $2A                      ; $8093  A5 2A
    AND #$08                     ; $8095  29 08
    BEQ loc_1C_809B              ; $8097  F0 02
    LDX #$03                     ; $8099  A2 03

loc_1C_809B:
    STX $B0                      ; $809B  86 B0
    LDA #$14                     ; $809D  A9 14
    LDX #$1F                     ; $809F  A2 1F

loc_1C_80A1:
    STA $0140,X                  ; $80A1  9D 40 01
    DEX                          ; $80A4  CA
    BPL loc_1C_80A1              ; $80A5  10 FA
    LDA #$00                     ; $80A7  A9 00
    STA $BC                      ; $80A9  85 BC
    LDA #$00                     ; $80AB  A9 00
    STA $46                      ; $80AD  85 46
    LDA #$40                     ; $80AF  A9 40
    STA $45                      ; $80B1  85 45
    LDA #$10                     ; $80B3  A9 10
    STA $F7                      ; $80B5  85 F7
    STA $2000                    ; $80B7  8D 00 20
    LDA #$06                     ; $80BA  A9 06
    STA $F8                      ; $80BC  85 F8
    STA $2001                    ; $80BE  8D 01 20
    JSR sub_1E_C45D              ; $80C1  20 5D C4
    LDA #$1C                     ; $80C4  A9 1C
    STA $06C0                    ; $80C6  8D C0 06
    LDA #$00                     ; $80C9  A9 00
    STA $AA                      ; $80CB  85 AA
    STA $A9                      ; $80CD  85 A9
    JSR sub_1E_D2ED              ; $80CF  20 ED D2
    JSR sub_1E_C4CD              ; $80D2  20 CD C4
    LDA #$00                     ; $80D5  A9 00
    STA $1F                      ; $80D7  85 1F
    STA $1E                      ; $80D9  85 1E
    STA $22                      ; $80DB  85 22
    STA $B5                      ; $80DD  85 B5
    STA $B6                      ; $80DF  85 B6
    STA $B7                      ; $80E1  85 B7
    STA $B8                      ; $80E3  85 B8
    STA $B9                      ; $80E5  85 B9
    STA $0460                    ; $80E7  8D 60 04
    STA $0480                    ; $80EA  8D 80 04
    STA $43                      ; $80ED  85 43
    STA $44                      ; $80EF  85 44
    STA $B1                      ; $80F1  85 B1
    LDA $20                      ; $80F3  A5 20
    JSR sub_1C_907D              ; $80F5  20 7D 90
    CLC                          ; $80F8  18
    LDA $20                      ; $80F9  A5 20
    ADC #$01                     ; $80FB  69 01
    JSR sub_1C_907D              ; $80FD  20 7D 90
    LDA #$20                     ; $8100  A9 20
    STA $1A                      ; $8102  85 1A
    JSR sub_1E_CC6C              ; $8104  20 6C CC
    LDA $F8                      ; $8107  A5 F8
    ORA #$1E                     ; $8109  09 1E
    STA $F8                      ; $810B  85 F8
    STA $2001                    ; $810D  8D 01 20
    LDA $F7                      ; $8110  A5 F7
    ORA #$80                     ; $8112  09 80
    STA $F7                      ; $8114  85 F7
    STA $2000                    ; $8116  8D 00 20
    STA $1D                      ; $8119  85 1D
    LDA #$40                     ; $811B  A9 40
    STA $30                      ; $811D  85 30
    LDA #$00                     ; $811F  A9 00
    STA $31                      ; $8121  85 31
    LDX $2A                      ; $8123  A6 2A
    LDA $81D0,X                  ; $8125  BD D0 81
    JSR sub_1E_C051              ; $8128  20 51 C0
    LDX #$13                     ; $812B  A2 13

loc_1C_812D:
    LDA $81BC,X                  ; $812D  BD BC 81
    STA $0200,X                  ; $8130  9D 00 02
    DEX                          ; $8133  CA
    BPL loc_1C_812D              ; $8134  10 F7
    LDA #$C0                     ; $8136  A9 C0
    STA $FD                      ; $8138  85 FD

loc_1C_813A:
    LDY #$60                     ; $813A  A0 60
    LDX #$10                     ; $813C  A2 10
    LDA $FD                      ; $813E  A5 FD
    AND #$08                     ; $8140  29 08
    BNE loc_1C_8146              ; $8142  D0 02
    LDY #$F8                     ; $8144  A0 F8

loc_1C_8146:
    TYA                          ; $8146  98
    STA $0200,X                  ; $8147  9D 00 02
    DEX                          ; $814A  CA
    DEX                          ; $814B  CA
    DEX                          ; $814C  CA
    DEX                          ; $814D  CA
    BPL loc_1C_8146              ; $814E  10 F6
    JSR sub_1E_C07F              ; $8150  20 7F C0
    DEC $FD                      ; $8153  C6 FD
    BNE loc_1C_813A              ; $8155  D0 E3
    JSR sub_1E_CC6C              ; $8157  20 6C CC
    LDA #$DF                     ; $815A  A9 DF
    STA $3B                      ; $815C  85 3B
    LDA #$04                     ; $815E  A9 04
    STA $3C                      ; $8160  85 3C
    JSR sub_1C_9220              ; $8162  20 20 92
    JSR sub_1E_C7B5              ; $8165  20 B5 C7
    LDA $2A                      ; $8168  A5 2A
    CMP #$0C                     ; $816A  C9 0C
    BNE loc_1C_8171              ; $816C  D0 03
    JMP loc_1C_8223              ; $816E  4C 23 82


loc_1C_8171:
    LDA $AD                      ; $8171  A5 AD
    BEQ loc_1C_8178              ; $8173  F0 03
    JSR sub_1C_82D5              ; $8175  20 D5 82

loc_1C_8178:
    LDA $27                      ; $8178  A5 27
    AND #$08                     ; $817A  29 08
    BEQ loc_1C_8181              ; $817C  F0 03
    JSR sub_1E_C573              ; $817E  20 73 C5

loc_1C_8181:
    JSR sub_1E_CB8C              ; $8181  20 8C CB
    JSR sub_1C_84EE              ; $8184  20 EE 84
    JSR sub_1E_DCD0              ; $8187  20 D0 DC
    JSR sub_1E_D658              ; $818A  20 58 D6
    JSR sub_1E_C5A9              ; $818D  20 A9 C5
    JSR sub_1C_925B              ; $8190  20 5B 92
    JSR sub_1E_CC77              ; $8193  20 77 CC
    LDA $37                      ; $8196  A5 37
    BEQ loc_1C_819D              ; $8198  F0 03
    JSR sub_1C_8278              ; $819A  20 78 82

loc_1C_819D:
    LDA $FB                      ; $819D  A5 FB
    BEQ loc_1C_81B0              ; $819F  F0 0F
    INC $FC                      ; $81A1  E6 FC
    CMP $FC                      ; $81A3  C5 FC
    BEQ loc_1C_81A9              ; $81A5  F0 02
    BCS loc_1C_81B0              ; $81A7  B0 07

loc_1C_81A9:
    JSR sub_1E_C0D7              ; $81A9  20 D7 C0
    LDA #$00                     ; $81AC  A9 00
    STA $FC                      ; $81AE  85 FC

loc_1C_81B0:
    JSR sub_1E_C07F              ; $81B0  20 7F C0
    JMP loc_1C_8171              ; $81B3  4C 71 81

    .byte $10,$10,$10,$15,$15,$10,$60,$96,$01,$6C,$60,$97,$01,$74,$60,$98  ; $81B6
    .byte $01,$7C,$60,$99,$01,$84,$60,$9A,$01,$8C,$03,$04,$01,$07,$06,$00  ; $81C6
    .byte $05,$02,$08,$08,$09,$09,$09,$FF  ; $81D6

sub_1C_81DE:
    LDA $BC                      ; $81DE  A5 BC
    CMP #$FF                     ; $81E0  C9 FF
    BNE loc_1C_81F9              ; $81E2  D0 15
    LDX #$00                     ; $81E4  A2 00
    STX $2B                      ; $81E6  86 2B
    LDA #$7E                     ; $81E8  A9 7E
    LDX #$0E                     ; $81EA  A2 0E
    JSR sub_1F_F160              ; $81EC  20 60 F1
    LDA #$3B                     ; $81EF  A9 3B
    STA $04BE                    ; $81F1  8D BE 04
    LDA #$80                     ; $81F4  A9 80
    STA $047E                    ; $81F6  8D 7E 04

loc_1C_81F9:
    LDA #$00                     ; $81F9  A9 00
    STA $2B                      ; $81FB  85 2B
    STA $02                      ; $81FD  85 02
    LDA $BC                      ; $81FF  A5 BC
    STA $03                      ; $8201  85 03

loc_1C_8203:
    LSR $03                      ; $8203  46 03
    BCS loc_1C_821A              ; $8205  B0 13
    LDA #$7C                     ; $8207  A9 7C
    LDX $02                      ; $8209  A6 02
    JSR sub_1F_F160              ; $820B  20 60 F1
    LDA $8268,Y                  ; $820E  B9 68 82
    STA $04B0,Y                  ; $8211  99 B0 04
    LDA $8270,Y                  ; $8214  B9 70 82
    STA $0470,Y                  ; $8217  99 70 04

loc_1C_821A:
    INC $02                      ; $821A  E6 02
    LDA $02                      ; $821C  A5 02
    CMP #$08                     ; $821E  C9 08
    BNE loc_1C_8203              ; $8220  D0 E1
    RTS                          ; $8222  60


loc_1C_8223:
    JSR sub_1C_81DE              ; $8223  20 DE 81

loc_1C_8226:
    LDA $AD                      ; $8226  A5 AD
    BEQ loc_1C_822D              ; $8228  F0 03
    JSR sub_1C_82D5              ; $822A  20 D5 82

loc_1C_822D:
    LDA $27                      ; $822D  A5 27
    AND #$08                     ; $822F  29 08
    BEQ loc_1C_8236              ; $8231  F0 03
    JSR sub_1E_C573              ; $8233  20 73 C5

loc_1C_8236:
    JSR sub_1E_CB8C              ; $8236  20 8C CB
    JSR sub_1C_84EE              ; $8239  20 EE 84
    JSR sub_1E_DCD0              ; $823C  20 D0 DC
    JSR sub_1E_C5A9              ; $823F  20 A9 C5
    JSR sub_1C_925B              ; $8242  20 5B 92
    JSR sub_1E_CC77              ; $8245  20 77 CC
    LDA $37                      ; $8248  A5 37
    BEQ loc_1C_824F              ; $824A  F0 03
    JSR sub_1C_8278              ; $824C  20 78 82

loc_1C_824F:
    LDA $FB                      ; $824F  A5 FB
    BEQ loc_1C_8262              ; $8251  F0 0F
    INC $FC                      ; $8253  E6 FC
    CMP $FC                      ; $8255  C5 FC
    BEQ loc_1C_825B              ; $8257  F0 02
    BCS loc_1C_8262              ; $8259  B0 07

loc_1C_825B:
    JSR sub_1E_C0D7              ; $825B  20 D7 C0
    LDA #$00                     ; $825E  A9 00
    STA $FC                      ; $8260  85 FC

loc_1C_8262:
    JSR sub_1E_C07F              ; $8262  20 7F C0
    JMP loc_1C_8226              ; $8265  4C 26 82

    .byte $3B,$7B,$BB,$BB,$BB,$3B,$7B,$BB,$20,$20,$20,$70,$90,$E0,$E0,$E0  ; $8268

sub_1C_8278:
    LDX $1F                      ; $8278  A6 1F
    BNE loc_1C_82BB              ; $827A  D0 3F
    LDX $20                      ; $827C  A6 20
    BEQ loc_1C_8298              ; $827E  F0 18
    CPX $14                      ; $8280  E4 14
    BNE loc_1C_8298              ; $8282  D0 14
    LDY $38                      ; $8284  A4 38
    DEY                          ; $8286  88
    JSR sub_1E_C7A4              ; $8287  20 A4 C7
    TYA                          ; $828A  98
    LDY $37                      ; $828B  A4 37
    AND $82CC,Y                  ; $828D  39 CC 82
    BEQ loc_1C_8298              ; $8290  F0 06
    JSR sub_1C_8EDD              ; $8292  20 DD 8E
    JMP loc_1C_82C8              ; $8295  4C C8 82


loc_1C_8298:
    CPX $15                      ; $8298  E4 15
    BNE loc_1C_82BB              ; $829A  D0 1F
    LDY $38                      ; $829C  A4 38
    JSR sub_1E_C7A4              ; $829E  20 A4 C7
    TYA                          ; $82A1  98
    LDY $37                      ; $82A2  A4 37
    AND $82D0,Y                  ; $82A4  39 D0 82
    BEQ loc_1C_82BB              ; $82A7  F0 12
    JSR sub_1C_8F39              ; $82A9  20 39 8F
    LDX $2A                      ; $82AC  A6 2A
    LDA $20                      ; $82AE  A5 20
    CMP $906F,X                  ; $82B0  DD 6F 90
    BNE loc_1C_82B8              ; $82B3  D0 03
    JSR sub_1E_C808              ; $82B5  20 08 C8

loc_1C_82B8:
    JMP loc_1C_82C8              ; $82B8  4C C8 82


loc_1C_82BB:
    LDA $37                      ; $82BB  A5 37
    CMP #$03                     ; $82BD  C9 03
    BNE loc_1C_82C8              ; $82BF  D0 07
    LDA #$01                     ; $82C1  A9 01
    STA $2C                      ; $82C3  85 2C
    JMP loc_1E_C10B              ; $82C5  4C 0B C1


loc_1C_82C8:
    LDA #$00                     ; $82C8  A9 00
    STA $37                      ; $82CA  85 37
    RTS                          ; $82CC  60

    .byte $40,$00,$80,$20,$80,$20,$40,$00  ; $82CD

sub_1C_82D5:
    SEC                          ; $82D5  38
    LDA $AD                      ; $82D6  A5 AD
    SBC #$76                     ; $82D8  E9 76
    TAY                          ; $82DA  A8
    LDA #$00                     ; $82DB  A9 00
    STA $AD                      ; $82DD  85 AD
    LDA $84DC,Y                  ; $82DF  B9 DC 84
    STA $08                      ; $82E2  85 08
    LDA $84E5,Y                  ; $82E4  B9 E5 84
    STA $09                      ; $82E7  85 09
    JMP ($0008)                  ; $82E9  6C 08 00

    LDA #$0A                     ; $82EC  A9 0A
    BNE loc_1C_82F2              ; $82EE  D0 02
    LDA #$02                     ; $82F0  A9 02

loc_1C_82F2:
    STA $FD                      ; $82F2  85 FD
    LDA $06C0                    ; $82F4  AD C0 06
    CMP #$1C                     ; $82F7  C9 1C
    BCS loc_1C_8326              ; $82F9  B0 2B
    LDA #$07                     ; $82FB  A9 07
    STA $AA                      ; $82FD  85 AA

loc_1C_82FF:
    LDX $A9                      ; $82FF  A6 A9
    LDA $06C0                    ; $8301  AD C0 06
    CMP #$1C                     ; $8304  C9 1C
    BCS loc_1C_8323              ; $8306  B0 1B
    LDA $1C                      ; $8308  A5 1C
    AND #$07                     ; $830A  29 07
    BNE loc_1C_831A              ; $830C  D0 0C
    DEC $FD                      ; $830E  C6 FD
    BMI loc_1C_8323              ; $8310  30 11
    INC $06C0                    ; $8312  EE C0 06
    LDA #$28                     ; $8315  A9 28
    JSR sub_1E_C051              ; $8317  20 51 C0

loc_1C_831A:
    JSR sub_1E_CC77              ; $831A  20 77 CC
    JSR sub_1E_C07F              ; $831D  20 7F C0
    JMP loc_1C_82FF              ; $8320  4C FF 82


loc_1C_8323:
    JMP loc_1C_8361              ; $8323  4C 61 83


loc_1C_8326:
    RTS                          ; $8326  60

    LDA #$0A                     ; $8327  A9 0A
    BNE loc_1C_832D              ; $8329  D0 02
    LDA #$02                     ; $832B  A9 02

loc_1C_832D:
    STA $FD                      ; $832D  85 FD
    LDA $A9                      ; $832F  A5 A9
    BEQ loc_1C_836E              ; $8331  F0 3B
    LDX $A9                      ; $8333  A6 A9
    LDA $9B,X                    ; $8335  B5 9B
    CMP #$1C                     ; $8337  C9 1C
    BEQ loc_1C_836E              ; $8339  F0 33
    LDA #$07                     ; $833B  A9 07
    STA $AA                      ; $833D  85 AA

loc_1C_833F:
    LDX $A9                      ; $833F  A6 A9
    LDA $9B,X                    ; $8341  B5 9B
    CMP #$1C                     ; $8343  C9 1C
    BCS loc_1C_8361              ; $8345  B0 1A
    LDA $1C                      ; $8347  A5 1C
    AND #$07                     ; $8349  29 07
    BNE loc_1C_8358              ; $834B  D0 0B
    DEC $FD                      ; $834D  C6 FD
    BMI loc_1C_8361              ; $834F  30 10
    INC $9B,X                    ; $8351  F6 9B
    LDA #$28                     ; $8353  A9 28
    JSR sub_1E_C051              ; $8355  20 51 C0

loc_1C_8358:
    JSR sub_1E_CC77              ; $8358  20 77 CC
    JSR sub_1E_C07F              ; $835B  20 7F C0
    JMP loc_1C_833F              ; $835E  4C 3F 83


loc_1C_8361:
    LDA #$00                     ; $8361  A9 00
    STA $FD                      ; $8363  85 FD
    STA $AA                      ; $8365  85 AA
    LDA #$03                     ; $8367  A9 03
    STA $2C                      ; $8369  85 2C
    JSR sub_1E_D3A8              ; $836B  20 A8 D3

loc_1C_836E:
    RTS                          ; $836E  60

    .byte $A5,$A7,$C9,$04,$B0,$02,$E6,$A7,$A9,$42,$20,$51,$C0,$60  ; $836F
    LDA $A8                      ; $837D  A5 A8
    CMP #$63                     ; $837F  C9 63
    BCS loc_1C_838A              ; $8381  B0 07
    INC $A8                      ; $8383  E6 A8
    LDA #$42                     ; $8385  A9 42
    JSR sub_1E_C051              ; $8387  20 51 C0

loc_1C_838A:
    RTS                          ; $838A  60

    .byte $20,$DF,$83,$A9,$00,$85,$FD,$A6,$BA,$BD,$D6,$83,$85,$FE,$CA,$86  ; $838B
    .byte $2A,$20,$16,$84,$A9,$0C,$85,$2A,$A2,$05,$A5,$BA,$C9,$04,$D0,$02  ; $839B
    .byte $A2,$02,$20,$81,$84,$E6,$20,$EE,$40,$04,$E6,$38,$E6,$14,$E6,$15  ; $83AB
    .byte $A9,$20,$8D,$60,$04,$A9,$B4,$8D,$A0,$04,$20,$07,$84,$A9,$0B,$20  ; $83BB
    .byte $51,$C0,$A5,$BA,$85,$B3,$C6,$B3,$20,$0C,$C8,$60,$06,$04,$0D,$07  ; $83CB
    .byte $11,$09,$04,$10,$A9,$30,$20,$51,$C0,$A9,$0B,$85,$2C,$20,$A8,$D3  ; $83DB
    .byte $20,$20,$92,$AD,$A0,$06,$C9,$03,$F0,$09,$20,$77,$CC,$20,$7F,$C0  ; $83EB
    .byte $4C,$EE,$83,$A9,$00,$8D,$20,$04,$20,$77,$CC,$60,$A9,$C0,$8D,$20  ; $83FB
    .byte $04,$A9,$00,$85,$36,$85,$2C,$20,$A8,$D3,$60,$20,$0C,$CB,$20,$7F  ; $840B
    .byte $C0,$A5,$FD,$C9,$60,$D0,$F4,$60,$20,$DF,$83,$A6,$B3,$A5,$BC,$1D  ; $841B
    .byte $79,$C2,$85,$BC,$C9,$FF,$D0,$1D,$A9,$00,$85,$FD,$A9,$14,$85,$FE  ; $842B
    .byte $20,$16,$84,$A9,$28,$20,$7D,$90,$A9,$28,$85,$20,$8D,$40,$04,$85  ; $843B
    .byte $14,$85,$15,$D0,$0B,$C6,$20,$CE,$40,$04,$C6,$38,$C6,$14,$C6,$15  ; $844B
    .byte $A2,$08,$20,$81,$84,$A9,$00,$85,$B1,$A6,$B3,$18,$BD,$68,$82,$69  ; $845B
    .byte $07,$8D,$A0,$04,$BD,$70,$82,$8D,$60,$04,$20,$07,$84,$A9,$09,$20  ; $846B
    .byte $51,$C0,$20,$DE,$81,$60,$A0,$02,$BD,$9A,$84,$99,$5F,$03,$99,$7F  ; $847B
    .byte $03,$99,$8F,$03,$99,$9F,$03,$99,$AF,$03,$CA,$88,$10,$EA,$60,$21  ; $848B
    .byte $11,$01,$19,$09,$0A,$19,$09,$21,$20,$DF,$83,$A9,$29,$20,$7D,$90  ; $849B
    .byte $A9,$29,$85,$20,$8D,$40,$04,$85,$14,$85,$15,$A9,$00,$85,$FD,$A9  ; $84AB
    .byte $15,$85,$FE,$20,$16,$84,$A9,$2A,$20,$7D,$90,$A9,$B4,$8D,$A0,$04  ; $84BB
    .byte $A9,$28,$8D,$60,$04,$20,$07,$84,$A9,$0B,$20,$51,$C0,$20,$08,$C8  ; $84CB
    .byte $60,$EC,$F0,$27,$2B,$6F,$7D,$8B,$23,$A3,$82,$82,$83,$83,$83,$83  ; $84DB
    .byte $83,$84,$84  ; $84EB

sub_1C_84EE:
    LDA $AA                      ; $84EE  A5 AA
    AND #$04                     ; $84F0  29 04
    BEQ loc_1C_84F5              ; $84F2  F0 01
    RTS                          ; $84F4  60


loc_1C_84F5:
    LDA #$00                     ; $84F5  A9 00
    STA $37                      ; $84F7  85 37
    LDX $2C                      ; $84F9  A6 2C
    LDA $8783,X                  ; $84FB  BD 83 87
    STA $08                      ; $84FE  85 08
    LDA $878F,X                  ; $8500  BD 8F 87
    STA $09                      ; $8503  85 09
    JMP ($0008)                  ; $8505  6C 08 00

    LDA $06A0                    ; $8508  AD A0 06
    CMP #$04                     ; $850B  C9 04
    BNE loc_1C_8544              ; $850D  D0 35
    LDA #$C0                     ; $850F  A9 C0
    STA $0660                    ; $8511  8D 60 06
    LDA #$FF                     ; $8514  A9 FF
    STA $0640                    ; $8516  8D 40 06
    LDA #$00                     ; $8519  A9 00
    STA $AA                      ; $851B  85 AA
    LDA #$03                     ; $851D  A9 03
    STA $2C                      ; $851F  85 2C
    JSR sub_1E_D3A8              ; $8521  20 A8 D3
    LDA $0460                    ; $8524  AD 60 04
    STA $08                      ; $8527  85 08
    LDA $0440                    ; $8529  AD 40 04
    STA $09                      ; $852C  85 09
    LDA $04A0                    ; $852E  AD A0 04
    STA $0A                      ; $8531  85 0A
    LDA #$00                     ; $8533  A9 00
    STA $0B                      ; $8535  85 0B
    JSR sub_1E_CBC3              ; $8537  20 C3 CB
    LDA $00                      ; $853A  A5 00
    CMP #$04                     ; $853C  C9 04
    BNE loc_1C_8544              ; $853E  D0 04
    LDA #$04                     ; $8540  A9 04
    STA $FB                      ; $8542  85 FB

loc_1C_8544:
    RTS                          ; $8544  60

    .byte $60  ; $8545
    LDA $0420                    ; $8546  AD 20 04
    AND #$40                     ; $8549  29 40
    EOR #$40                     ; $854B  49 40
    STA $42                      ; $854D  85 42
    JSR sub_1C_8922              ; $854F  20 22 89
    JSR sub_1C_8B83              ; $8552  20 83 8B
    LDA $06A0                    ; $8555  AD A0 06
    BEQ loc_1C_855E              ; $8558  F0 04
    JSR sub_1E_D3A8              ; $855A  20 A8 D3
    RTS                          ; $855D  60


loc_1C_855E:
    LDY #$06                     ; $855E  A0 06
    LDA $00                      ; $8560  A5 00
    BEQ loc_1C_8566              ; $8562  F0 02
    LDY #$03                     ; $8564  A0 03

loc_1C_8566:
    STY $2C                      ; $8566  84 2C
    RTS                          ; $8568  60

    JSR sub_1C_879B              ; $8569  20 9B 87
    LDA $23                      ; $856C  A5 23
    AND #$C0                     ; $856E  29 C0
    BEQ loc_1C_8579              ; $8570  F0 07
    LDA #$04                     ; $8572  A9 04
    STA $2C                      ; $8574  85 2C
    JSR sub_1C_87F2              ; $8576  20 F2 87

loc_1C_8579:
    JSR sub_1C_880D              ; $8579  20 0D 88
    JSR sub_1C_8922              ; $857C  20 22 89
    JSR sub_1C_8B83              ; $857F  20 83 8B
    LDA $00                      ; $8582  A5 00
    BNE loc_1C_858E              ; $8584  D0 08
    LDA #$06                     ; $8586  A9 06
    STA $2C                      ; $8588  85 2C
    JSR sub_1E_D3A8              ; $858A  20 A8 D3
    RTS                          ; $858D  60


loc_1C_858E:
    LDA $27                      ; $858E  A5 27
    AND #$01                     ; $8590  29 01
    BEQ loc_1C_85A2              ; $8592  F0 0E
    LDA $3B                      ; $8594  A5 3B
    STA $0660                    ; $8596  8D 60 06
    LDA $3C                      ; $8599  A5 3C
    STA $0640                    ; $859B  8D 40 06
    LDA #$06                     ; $859E  A9 06
    STA $2C                      ; $85A0  85 2C

loc_1C_85A2:
    JSR sub_1E_D3A8              ; $85A2  20 A8 D3
    RTS                          ; $85A5  60

    JSR sub_1C_879B              ; $85A6  20 9B 87
    JSR sub_1C_87F2              ; $85A9  20 F2 87
    JSR sub_1C_880D              ; $85AC  20 0D 88
    JSR sub_1C_8922              ; $85AF  20 22 89
    JSR sub_1C_8B83              ; $85B2  20 83 8B
    LDA $00                      ; $85B5  A5 00
    BEQ loc_1C_85E6              ; $85B7  F0 2D
    LDA $23                      ; $85B9  A5 23
    AND #$C0                     ; $85BB  29 C0
    BNE loc_1C_85C5              ; $85BD  D0 06
    LDA #$03                     ; $85BF  A9 03
    STA $2C                      ; $85C1  85 2C
    BNE loc_1C_85D0              ; $85C3  D0 0B

loc_1C_85C5:
    LDA $06A0                    ; $85C5  AD A0 06
    CMP #$01                     ; $85C8  C9 01
    BNE loc_1C_85D0              ; $85CA  D0 04
    LDA #$05                     ; $85CC  A9 05
    STA $2C                      ; $85CE  85 2C

loc_1C_85D0:
    JMP loc_1C_858E              ; $85D0  4C 8E 85

    JSR sub_1C_879B              ; $85D3  20 9B 87
    JSR sub_1C_87F2              ; $85D6  20 F2 87
    JSR sub_1C_880D              ; $85D9  20 0D 88
    JSR sub_1C_8922              ; $85DC  20 22 89
    JSR sub_1C_8B83              ; $85DF  20 83 8B
    LDA $00                      ; $85E2  A5 00
    BNE loc_1C_85EE              ; $85E4  D0 08

loc_1C_85E6:
    LDA #$06                     ; $85E6  A9 06
    STA $2C                      ; $85E8  85 2C
    JSR sub_1E_D3A8              ; $85EA  20 A8 D3
    RTS                          ; $85ED  60


loc_1C_85EE:
    LDA $23                      ; $85EE  A5 23
    AND #$C0                     ; $85F0  29 C0
    BNE loc_1C_85F8              ; $85F2  D0 04
    LDA #$07                     ; $85F4  A9 07
    STA $2C                      ; $85F6  85 2C

loc_1C_85F8:
    JMP loc_1C_858E              ; $85F8  4C 8E 85

    JSR sub_1C_879B              ; $85FB  20 9B 87
    LDA #$00                     ; $85FE  A9 00
    STA $0620                    ; $8600  8D 20 06
    STA $0600                    ; $8603  8D 00 06
    LDA $23                      ; $8606  A5 23
    AND #$C0                     ; $8608  29 C0
    BNE loc_1C_863C              ; $860A  D0 30
    LDA $3E                      ; $860C  A5 3E
    ORA $3F                      ; $860E  05 3F
    BNE loc_1C_861E              ; $8610  D0 0C
    LDA $40                      ; $8612  A5 40
    AND #$0F                     ; $8614  29 0F
    BEQ loc_1C_8642              ; $8616  F0 2A
    JSR sub_1C_889E              ; $8618  20 9E 88
    JMP loc_1C_8642              ; $861B  4C 42 86


loc_1C_861E:
    SEC                          ; $861E  38
    LDA $3E                      ; $861F  A5 3E
    SBC #$80                     ; $8621  E9 80
    STA $3E                      ; $8623  85 3E
    TAX                          ; $8625  AA
    LDA $3F                      ; $8626  A5 3F
    SBC #$00                     ; $8628  E9 00
    STA $3F                      ; $862A  85 3F
    BMI loc_1C_8634              ; $862C  30 06
    BNE loc_1C_8642              ; $862E  D0 12
    CPX #$80                     ; $8630  E0 80
    BCS loc_1C_8642              ; $8632  B0 0E

loc_1C_8634:
    LDA #$00                     ; $8634  A9 00
    STA $3E                      ; $8636  85 3E
    STA $3F                      ; $8638  85 3F
    BEQ loc_1C_8642              ; $863A  F0 06

loc_1C_863C:
    JSR sub_1C_87F2              ; $863C  20 F2 87
    JSR sub_1C_880D              ; $863F  20 0D 88

loc_1C_8642:
    JSR sub_1C_8922              ; $8642  20 22 89
    LDA $0640                    ; $8645  AD 40 06
    BMI loc_1C_866D              ; $8648  30 23
    JSR sub_1C_8B83              ; $864A  20 83 8B
    LDA $00                      ; $864D  A5 00
    BNE loc_1C_866C              ; $864F  D0 1B
    LDA $23                      ; $8651  A5 23
    AND #$01                     ; $8653  29 01
    BNE loc_1C_866C              ; $8655  D0 15
    LDA $0640                    ; $8657  AD 40 06
    BMI loc_1C_866C              ; $865A  30 10
    CMP #$01                     ; $865C  C9 01
    BCC loc_1C_866C              ; $865E  90 0C
    BEQ loc_1C_866C              ; $8660  F0 0A
    LDA #$01                     ; $8662  A9 01
    STA $0640                    ; $8664  8D 40 06
    LDA #$00                     ; $8667  A9 00
    STA $0660                    ; $8669  8D 60 06

loc_1C_866C:
    RTS                          ; $866C  60


loc_1C_866D:
    JSR sub_1C_8B83              ; $866D  20 83 8B
    LDA $00                      ; $8670  A5 00
    BEQ loc_1C_8688              ; $8672  F0 14
    LDA #$29                     ; $8674  A9 29
    JSR sub_1E_C051              ; $8676  20 51 C0
    LDX #$05                     ; $8679  A2 05
    LDA $25                      ; $867B  A5 25
    AND #$C0                     ; $867D  29 C0
    BNE loc_1C_8683              ; $867F  D0 02
    LDX #$08                     ; $8681  A2 08

loc_1C_8683:
    STX $2C                      ; $8683  86 2C
    JMP loc_1C_858E              ; $8685  4C 8E 85


loc_1C_8688:
    JSR sub_1E_D3A8              ; $8688  20 A8 D3
    RTS                          ; $868B  60

    JSR sub_1C_879B              ; $868C  20 9B 87
    JSR sub_1C_87F2              ; $868F  20 F2 87
    JSR sub_1C_880D              ; $8692  20 0D 88
    JSR sub_1C_8922              ; $8695  20 22 89
    JSR sub_1C_8B83              ; $8698  20 83 8B
    LDA $00                      ; $869B  A5 00
    BNE loc_1C_86A2              ; $869D  D0 03
    JMP loc_1C_85E6              ; $869F  4C E6 85


loc_1C_86A2:
    LDA $23                      ; $86A2  A5 23
    AND #$C0                     ; $86A4  29 C0
    BNE loc_1C_86B5              ; $86A6  D0 0D
    LDA $06A0                    ; $86A8  AD A0 06
    CMP #$02                     ; $86AB  C9 02
    BNE loc_1C_86B9              ; $86AD  D0 0A
    LDA #$03                     ; $86AF  A9 03
    STA $2C                      ; $86B1  85 2C
    BNE loc_1C_86B9              ; $86B3  D0 04

loc_1C_86B5:
    LDA #$04                     ; $86B5  A9 04
    STA $2C                      ; $86B7  85 2C

loc_1C_86B9:
    JMP loc_1C_858E              ; $86B9  4C 8E 85


loc_1C_86BC:
    LDA #$09                     ; $86BC  A9 09
    STA $2C                      ; $86BE  85 2C
    LDA $23                      ; $86C0  A5 23
    AND #$02                     ; $86C2  29 02
    BEQ loc_1C_86C9              ; $86C4  F0 03
    JMP loc_1C_8768              ; $86C6  4C 68 87


loc_1C_86C9:
    LDA #$00                     ; $86C9  A9 00
    STA $AB                      ; $86CB  85 AB

loc_1C_86CD:
    LDA $23                      ; $86CD  A5 23
    AND #$31                     ; $86CF  29 31
    BNE loc_1C_86D6              ; $86D1  D0 03
    JMP loc_1C_875F              ; $86D3  4C 5F 87


loc_1C_86D6:
    AND #$30                     ; $86D6  29 30
    BEQ loc_1C_874B              ; $86D8  F0 71
    AND #$10                     ; $86DA  29 10
    BEQ loc_1C_8708              ; $86DC  F0 2A
    LDY #$00                     ; $86DE  A0 00
    LDX #$C0                     ; $86E0  A2 C0
    LDA $35                      ; $86E2  A5 35
    AND #$0C                     ; $86E4  29 0C
    BNE loc_1C_86FE              ; $86E6  D0 16
    LDA $04A0                    ; $86E8  AD A0 04
    AND #$F0                     ; $86EB  29 F0
    SEC                          ; $86ED  38
    SBC #$0C                     ; $86EE  E9 0C
    STA $04A0                    ; $86F0  8D A0 04
    LDA $F9                      ; $86F3  A5 F9
    SBC #$00                     ; $86F5  E9 00
    STA $F9                      ; $86F7  85 F9
    LDX #$03                     ; $86F9  A2 03
    JMP loc_1C_874D              ; $86FB  4C 4D 87


loc_1C_86FE:
    AND #$08                     ; $86FE  29 08
    BNE loc_1C_872B              ; $8700  D0 29
    LDA #$0A                     ; $8702  A9 0A
    STA $2C                      ; $8704  85 2C
    BNE loc_1C_872B              ; $8706  D0 23

loc_1C_8708:
    LDA $35                      ; $8708  A5 35
    CMP #$01                     ; $870A  C9 01
    BNE loc_1C_871D              ; $870C  D0 0F
    LDA $04A0                    ; $870E  AD A0 04
    CLC                          ; $8711  18
    ADC #$0C                     ; $8712  69 0C
    STA $04A0                    ; $8714  8D A0 04
    LDA $F9                      ; $8717  A5 F9
    ADC #$00                     ; $8719  69 00
    STA $F9                      ; $871B  85 F9

loc_1C_871D:
    LDY #$FF                     ; $871D  A0 FF
    LDX #$40                     ; $871F  A2 40
    LDA $35                      ; $8721  A5 35
    AND #$0C                     ; $8723  29 0C
    BNE loc_1C_872B              ; $8725  D0 04
    LDA #$0A                     ; $8727  A9 0A
    STA $2C                      ; $8729  85 2C

loc_1C_872B:
    LDA $3D                      ; $872B  A5 3D
    BEQ loc_1C_8733              ; $872D  F0 04
    LDY #$00                     ; $872F  A0 00
    LDX #$00                     ; $8731  A2 00

loc_1C_8733:
    STY $0640                    ; $8733  8C 40 06
    STX $0660                    ; $8736  8E 60 06
    JSR sub_1C_8A84              ; $8739  20 84 8A
    LDA $35                      ; $873C  A5 35
    BEQ loc_1C_874B              ; $873E  F0 0B
    JSR sub_1C_8B83              ; $8740  20 83 8B
    LDA $00                      ; $8743  A5 00
    BEQ loc_1C_8764              ; $8745  F0 1D
    LDX #$03                     ; $8747  A2 03
    BNE loc_1C_874D              ; $8749  D0 02

loc_1C_874B:
    LDX #$06                     ; $874B  A2 06

loc_1C_874D:
    STX $2C                      ; $874D  86 2C
    LDA #$00                     ; $874F  A9 00
    STA $35                      ; $8751  85 35
    LDA #$C0                     ; $8753  A9 C0
    STA $0660                    ; $8755  8D 60 06
    LDA #$FF                     ; $8758  A9 FF
    STA $0640                    ; $875A  8D 40 06
    BNE loc_1C_8764              ; $875D  D0 05

loc_1C_875F:
    LDA #$00                     ; $875F  A9 00
    STA $0680                    ; $8761  8D 80 06

loc_1C_8764:
    JSR sub_1E_D3A8              ; $8764  20 A8 D3
    RTS                          ; $8767  60


loc_1C_8768:
    JSR sub_1C_87F2              ; $8768  20 F2 87
    JSR sub_1E_DA51              ; $876B  20 51 DA
    BCC loc_1C_8773              ; $876E  90 03
    JMP loc_1C_86CD              ; $8770  4C CD 86


loc_1C_8773:
    JMP loc_1C_875F              ; $8773  4C 5F 87

    .byte $AD,$A0,$06,$C9,$03,$D0,$05,$A9,$00,$8D,$80,$06,$60,$08,$45,$46  ; $8776
    .byte $69,$A6,$D3,$FB,$8C,$8C,$BC,$BC,$76,$85,$85,$85,$85,$85,$85,$85  ; $8786
    .byte $86,$86,$86,$86,$87  ; $8796

sub_1C_879B:
    LDA $23                      ; $879B  A5 23
    AND #$02                     ; $879D  29 02
    BNE loc_1C_87A7              ; $879F  D0 06
    LDA #$00                     ; $87A1  A9 00
    STA $AB                      ; $87A3  85 AB
    BEQ loc_1C_87AA              ; $87A5  F0 03

loc_1C_87A7:
    JSR sub_1E_DA51              ; $87A7  20 51 DA

loc_1C_87AA:
    LDA $35                      ; $87AA  A5 35
    BNE loc_1C_87AF              ; $87AC  D0 01

loc_1C_87AE:
    RTS                          ; $87AE  60


loc_1C_87AF:
    LDA $23                      ; $87AF  A5 23
    AND #$30                     ; $87B1  29 30
    BEQ loc_1C_87AE              ; $87B3  F0 F9
    ORA $35                      ; $87B5  05 35
    CMP #$11                     ; $87B7  C9 11
    BEQ loc_1C_87AE              ; $87B9  F0 F3
    CMP #$2E                     ; $87BB  C9 2E
    BEQ loc_1C_87AE              ; $87BD  F0 EF
    LDA $0460                    ; $87BF  AD 60 04
    STA $2E                      ; $87C2  85 2E
    AND #$F0                     ; $87C4  29 F0
    ORA #$08                     ; $87C6  09 08
    SEC                          ; $87C8  38
    STA $0460                    ; $87C9  8D 60 04
    SBC $2E                      ; $87CC  E5 2E
    BCC loc_1C_87D8              ; $87CE  90 08
    STA $00                      ; $87D0  85 00
    JSR sub_1C_8DF5              ; $87D2  20 F5 8D
    JMP loc_1C_87E2              ; $87D5  4C E2 87


loc_1C_87D8:
    EOR #$FF                     ; $87D8  49 FF
    CLC                          ; $87DA  18
    ADC #$01                     ; $87DB  69 01
    STA $00                      ; $87DD  85 00
    JSR sub_1C_8E65              ; $87DF  20 65 8E

loc_1C_87E2:
    LDA $0420                    ; $87E2  AD 20 04
    EOR #$40                     ; $87E5  49 40
    STA $0420                    ; $87E7  8D 20 04
    JSR sub_1E_D3A8              ; $87EA  20 A8 D3
    PLA                          ; $87ED  68
    PLA                          ; $87EE  68
    JMP loc_1C_86BC              ; $87EF  4C BC 86


sub_1C_87F2:
    LDA $23                      ; $87F2  A5 23
    AND #$C0                     ; $87F4  29 C0
    BEQ loc_1C_880C              ; $87F6  F0 14
    LDA $0420                    ; $87F8  AD 20 04
    AND #$BF                     ; $87FB  29 BF
    STA $0420                    ; $87FD  8D 20 04
    LDA $23                      ; $8800  A5 23
    AND #$40                     ; $8802  29 40
    EOR #$40                     ; $8804  49 40
    ORA $0420                    ; $8806  0D 20 04
    STA $0420                    ; $8809  8D 20 04

loc_1C_880C:
    RTS                          ; $880C  60


sub_1C_880D:
    LDX $2C                      ; $880D  A6 2C
    LDA $890C,X                  ; $880F  BD 0C 89
    STA $0600                    ; $8812  8D 00 06
    LDA $8917,X                  ; $8815  BD 17 89
    STA $0620                    ; $8818  8D 20 06
    LDA $3D                      ; $881B  A5 3D
    CMP #$03                     ; $881D  C9 03
    BNE loc_1C_882F              ; $881F  D0 0E
    LDA $2C                      ; $8821  A5 2C
    CMP #$06                     ; $8823  C9 06
    BEQ loc_1C_882F              ; $8825  F0 08
    LDA #$00                     ; $8827  A9 00
    STA $0620                    ; $8829  8D 20 06
    STA $0600                    ; $882C  8D 00 06

loc_1C_882F:
    LDA $40                      ; $882F  A5 40
    BMI loc_1C_883B              ; $8831  30 08
    LDA $3E                      ; $8833  A5 3E
    ORA $3F                      ; $8835  05 3F
    BEQ sub_1C_889E              ; $8837  F0 65
    BNE loc_1C_8844              ; $8839  D0 09

loc_1C_883B:
    LDA $0420                    ; $883B  AD 20 04
    AND #$40                     ; $883E  29 40
    CMP $42                      ; $8840  C5 42
    BEQ loc_1C_8880              ; $8842  F0 3C

loc_1C_8844:
    LDX #$00                     ; $8844  A2 00
    LDA $2C                      ; $8846  A5 2C
    CMP #$06                     ; $8848  C9 06
    BEQ loc_1C_8854              ; $884A  F0 08
    INX                          ; $884C  E8
    LDA $23                      ; $884D  A5 23
    AND #$C0                     ; $884F  29 C0
    BEQ loc_1C_8854              ; $8851  F0 01
    INX                          ; $8853  E8

loc_1C_8854:
    SEC                          ; $8854  38
    LDA $3E                      ; $8855  A5 3E
    SBC $8909,X                  ; $8857  FD 09 89
    STA $3E                      ; $885A  85 3E
    TAX                          ; $885C  AA
    LDA $3F                      ; $885D  A5 3F
    SBC #$00                     ; $885F  E9 00
    STA $3F                      ; $8861  85 3F
    BMI loc_1C_886B              ; $8863  30 06
    BNE loc_1C_8873              ; $8865  D0 0C
    CPX #$80                     ; $8867  E0 80
    BCS loc_1C_8873              ; $8869  B0 08

loc_1C_886B:
    LDA #$00                     ; $886B  A9 00
    STA $3E                      ; $886D  85 3E
    STA $3F                      ; $886F  85 3F
    BEQ loc_1C_8897              ; $8871  F0 24

loc_1C_8873:
    LDA $3E                      ; $8873  A5 3E
    STA $0620                    ; $8875  8D 20 06
    LDA $3F                      ; $8878  A5 3F
    STA $0600                    ; $887A  8D 00 06
    JMP sub_1C_889E              ; $887D  4C 9E 88


loc_1C_8880:
    SEC                          ; $8880  38
    LDA $0620                    ; $8881  AD 20 06
    SBC $3E                      ; $8884  E5 3E
    LDA $0600                    ; $8886  AD 00 06
    SBC $3F                      ; $8889  E5 3F
    BCC loc_1C_8844              ; $888B  90 B7
    LDA $0620                    ; $888D  AD 20 06
    STA $3E                      ; $8890  85 3E
    LDA $0600                    ; $8892  AD 00 06
    STA $3F                      ; $8895  85 3F

loc_1C_8897:
    LDA $0420                    ; $8897  AD 20 04
    AND #$40                     ; $889A  29 40
    STA $42                      ; $889C  85 42

sub_1C_889E:
    LDA $40                      ; $889E  A5 40
    BPL loc_1C_88A3              ; $88A0  10 01
    RTS                          ; $88A2  60


loc_1C_88A3:
    AND #$0F                     ; $88A3  29 0F
    BEQ loc_1C_88FA              ; $88A5  F0 53
    LDA $0420                    ; $88A7  AD 20 04
    AND #$40                     ; $88AA  29 40
    CMP $AF                      ; $88AC  C5 AF
    BEQ loc_1C_88E4              ; $88AE  F0 34
    SEC                          ; $88B0  38
    LDA $0620                    ; $88B1  AD 20 06
    SBC $4F                      ; $88B4  E5 4F
    STA $0620                    ; $88B6  8D 20 06
    LDA $0600                    ; $88B9  AD 00 06
    SBC $50                      ; $88BC  E5 50
    STA $0600                    ; $88BE  8D 00 06
    BCC loc_1C_88CB              ; $88C1  90 08
    LDA $0420                    ; $88C3  AD 20 04
    AND #$40                     ; $88C6  29 40
    STA $42                      ; $88C8  85 42
    RTS                          ; $88CA  60


loc_1C_88CB:
    LDA $0620                    ; $88CB  AD 20 06
    EOR #$FF                     ; $88CE  49 FF
    ADC #$01                     ; $88D0  69 01
    STA $0620                    ; $88D2  8D 20 06
    LDA $0600                    ; $88D5  AD 00 06
    EOR #$FF                     ; $88D8  49 FF
    ADC #$00                     ; $88DA  69 00
    STA $0600                    ; $88DC  8D 00 06
    LDA $AF                      ; $88DF  A5 AF
    STA $42                      ; $88E1  85 42
    RTS                          ; $88E3  60


loc_1C_88E4:
    CLC                          ; $88E4  18
    LDA $0620                    ; $88E5  AD 20 06
    ADC $4F                      ; $88E8  65 4F
    STA $0620                    ; $88EA  8D 20 06
    LDA $0600                    ; $88ED  AD 00 06
    ADC $50                      ; $88F0  65 50
    STA $0600                    ; $88F2  8D 00 06
    LDA $AF                      ; $88F5  A5 AF
    STA $42                      ; $88F7  85 42
    RTS                          ; $88F9  60


loc_1C_88FA:
    LDA $3F                      ; $88FA  A5 3F
    ORA $3E                      ; $88FC  05 3E
    BEQ loc_1C_8901              ; $88FE  F0 01
    RTS                          ; $8900  60


loc_1C_8901:
    LDA $0420                    ; $8901  AD 20 04
    AND #$40                     ; $8904  29 40
    STA $42                      ; $8906  85 42
    RTS                          ; $8908  60

    .byte $80,$02,$04,$00,$00,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00  ; $8909
    .byte $90,$00,$20,$60,$50,$80,$00,$00,$00  ; $8919

sub_1C_8922:
    LDX $0440                    ; $8922  AE 40 04
    STX $2D                      ; $8925  86 2D
    LDY $0460                    ; $8927  AC 60 04
    STY $2E                      ; $892A  84 2E
    LDA $0480                    ; $892C  AD 80 04
    STA $2F                      ; $892F  85 2F
    LDA #$00                     ; $8931  A9 00
    STA $00                      ; $8933  85 00
    LDA $42                      ; $8935  A5 42
    AND #$40                     ; $8937  29 40
    BEQ loc_1C_89AB              ; $8939  F0 70
    CPX $15                      ; $893B  E4 15
    BNE loc_1C_894A              ; $893D  D0 0B
    CPY #$EC                     ; $893F  C0 EC
    BCC loc_1C_894A              ; $8941  90 07
    LDA #$02                     ; $8943  A9 02
    STA $37                      ; $8945  85 37
    JMP loc_1C_8A12              ; $8947  4C 12 8A


loc_1C_894A:
    CLC                          ; $894A  18
    LDA $0480                    ; $894B  AD 80 04
    ADC $0620                    ; $894E  6D 20 06
    STA $0480                    ; $8951  8D 80 04
    LDA $0460                    ; $8954  AD 60 04
    ADC $0600                    ; $8957  6D 00 06
    STA $0460                    ; $895A  8D 60 04
    LDA $0440                    ; $895D  AD 40 04
    ADC #$00                     ; $8960  69 00
    STA $0440                    ; $8962  8D 40 04
    CLC                          ; $8965  18
    LDA $0460                    ; $8966  AD 60 04
    ADC #$08                     ; $8969  69 08
    STA $08                      ; $896B  85 08
    LDA $0440                    ; $896D  AD 40 04
    ADC #$00                     ; $8970  69 00
    STA $09                      ; $8972  85 09
    JSR sub_1C_8A20              ; $8974  20 20 8A
    LDA $00                      ; $8977  A5 00
    BEQ loc_1C_8997              ; $8979  F0 1C
    LDA #$00                     ; $897B  A9 00
    STA $0480                    ; $897D  8D 80 04
    LDA $08                      ; $8980  A5 08
    AND #$0F                     ; $8982  29 0F
    STA $00                      ; $8984  85 00
    SEC                          ; $8986  38
    LDA $0460                    ; $8987  AD 60 04
    SBC $00                      ; $898A  E5 00
    STA $0460                    ; $898C  8D 60 04
    LDA $0440                    ; $898F  AD 40 04
    SBC #$00                     ; $8992  E9 00
    STA $0440                    ; $8994  8D 40 04

loc_1C_8997:
    SEC                          ; $8997  38
    LDA $0460                    ; $8998  AD 60 04
    SBC $2E                      ; $899B  E5 2E
    STA $00                      ; $899D  85 00
    BPL loc_1C_8A12              ; $899F  10 71
    CLC                          ; $89A1  18
    EOR #$FF                     ; $89A2  49 FF
    ADC #$01                     ; $89A4  69 01
    STA $00                      ; $89A6  85 00
    JMP loc_1C_8A19              ; $89A8  4C 19 8A


loc_1C_89AB:
    CPX $14                      ; $89AB  E4 14
    BNE loc_1C_89B6              ; $89AD  D0 07
    CPY #$14                     ; $89AF  C0 14
    BCS loc_1C_89B6              ; $89B1  B0 03
    JMP loc_1C_8A19              ; $89B3  4C 19 8A


loc_1C_89B6:
    SEC                          ; $89B6  38
    LDA $0480                    ; $89B7  AD 80 04
    SBC $0620                    ; $89BA  ED 20 06
    STA $0480                    ; $89BD  8D 80 04
    LDA $0460                    ; $89C0  AD 60 04
    SBC $0600                    ; $89C3  ED 00 06
    STA $0460                    ; $89C6  8D 60 04
    LDA $0440                    ; $89C9  AD 40 04
    SBC #$00                     ; $89CC  E9 00
    STA $0440                    ; $89CE  8D 40 04
    SEC                          ; $89D1  38
    LDA $0460                    ; $89D2  AD 60 04
    SBC #$08                     ; $89D5  E9 08
    STA $08                      ; $89D7  85 08
    LDA $0440                    ; $89D9  AD 40 04
    SBC #$00                     ; $89DC  E9 00
    STA $09                      ; $89DE  85 09
    JSR sub_1C_8A20              ; $89E0  20 20 8A
    LDA $00                      ; $89E3  A5 00
    BEQ loc_1C_8A01              ; $89E5  F0 1A
    LDA #$00                     ; $89E7  A9 00
    STA $0480                    ; $89E9  8D 80 04
    LDA $08                      ; $89EC  A5 08
    AND #$0F                     ; $89EE  29 0F
    EOR #$0F                     ; $89F0  49 0F
    SEC                          ; $89F2  38
    ADC $0460                    ; $89F3  6D 60 04
    STA $0460                    ; $89F6  8D 60 04
    LDA $0440                    ; $89F9  AD 40 04
    ADC #$00                     ; $89FC  69 00
    STA $0440                    ; $89FE  8D 40 04

loc_1C_8A01:
    SEC                          ; $8A01  38
    LDA $2E                      ; $8A02  A5 2E
    SBC $0460                    ; $8A04  ED 60 04
    STA $00                      ; $8A07  85 00
    BPL loc_1C_8A19              ; $8A09  10 0E
    EOR #$FF                     ; $8A0B  49 FF
    CLC                          ; $8A0D  18
    ADC #$01                     ; $8A0E  69 01
    STA $00                      ; $8A10  85 00

loc_1C_8A12:
    JSR sub_1C_8DF5              ; $8A12  20 F5 8D
    JSR sub_1C_8A84              ; $8A15  20 84 8A
    RTS                          ; $8A18  60


loc_1C_8A19:
    JSR sub_1C_8E65              ; $8A19  20 65 8E
    JSR sub_1C_8A84              ; $8A1C  20 84 8A
    RTS                          ; $8A1F  60


sub_1C_8A20:
    LDA #$02                     ; $8A20  A9 02
    STA $01                      ; $8A22  85 01

loc_1C_8A24:
    LDX $01                      ; $8A24  A6 01
    CLC                          ; $8A26  18
    LDA $04A0                    ; $8A27  AD A0 04
    ADC $8A7E,X                  ; $8A2A  7D 7E 8A
    STA $0A                      ; $8A2D  85 0A
    LDA $F9                      ; $8A2F  A5 F9
    ADC $8A81,X                  ; $8A31  7D 81 8A
    STA $0B                      ; $8A34  85 0B
    JSR sub_1E_CBA2              ; $8A36  20 A2 CB
    LDX $01                      ; $8A39  A6 01
    LDA $00                      ; $8A3B  A5 00
    STA $32,X                    ; $8A3D  95 32
    DEC $01                      ; $8A3F  C6 01
    BPL loc_1C_8A24              ; $8A41  10 E1
    LDA #$00                     ; $8A43  A9 00
    STA $00                      ; $8A45  85 00
    LDX #$02                     ; $8A47  A2 02

loc_1C_8A49:
    LDY $32,X                    ; $8A49  B4 32
    LDA $8A75,Y                  ; $8A4B  B9 75 8A
    BPL loc_1C_8A56              ; $8A4E  10 06
    LDY #$02                     ; $8A50  A0 02
    STY $37                      ; $8A52  84 37
    BNE loc_1C_8A65              ; $8A54  D0 0F

loc_1C_8A56:
    CMP #$03                     ; $8A56  C9 03
    BNE loc_1C_8A65              ; $8A58  D0 0B
    LDY $4B                      ; $8A5A  A4 4B
    BNE loc_1C_8A65              ; $8A5C  D0 07
    LDA #$00                     ; $8A5E  A9 00
    STA $2C                      ; $8A60  85 2C
    JMP loc_1E_C10B              ; $8A62  4C 0B C1


loc_1C_8A65:
    ORA $00                      ; $8A65  05 00
    STA $00                      ; $8A67  85 00
    DEX                          ; $8A69  CA
    BPL loc_1C_8A49              ; $8A6A  10 DD
    RTS                          ; $8A6C  60

    .byte $40,$1E,$00,$04,$04,$05,$DF,$80,$00,$01,$00,$03,$00,$01,$01,$01  ; $8A6D
    .byte $81,$F4,$FC,$0B,$FF,$FF,$00  ; $8A7D

sub_1C_8A84:
    LDA $0460                    ; $8A84  AD 60 04
    STA $08                      ; $8A87  85 08
    LDA $0440                    ; $8A89  AD 40 04
    STA $09                      ; $8A8C  85 09
    LDA #$02                     ; $8A8E  A9 02
    STA $01                      ; $8A90  85 01

loc_1C_8A92:
    LDX $01                      ; $8A92  A6 01
    CLC                          ; $8A94  18
    LDA $04A0                    ; $8A95  AD A0 04
    ADC $8A7E,X                  ; $8A98  7D 7E 8A
    STA $0A                      ; $8A9B  85 0A
    LDA $F9                      ; $8A9D  A5 F9
    ADC $8A81,X                  ; $8A9F  7D 81 8A
    STA $0B                      ; $8AA2  85 0B
    JSR sub_1E_CBC3              ; $8AA4  20 C3 CB
    LDX $01                      ; $8AA7  A6 01
    LDA $00                      ; $8AA9  A5 00
    STA $32,X                    ; $8AAB  95 32
    DEC $01                      ; $8AAD  C6 01
    BPL loc_1C_8A92              ; $8AAF  10 E1
    LDX #$00                     ; $8AB1  A2 00
    LDA $B1                      ; $8AB3  A5 B1
    BEQ loc_1C_8ABD              ; $8AB5  F0 06
    LDA $B3                      ; $8AB7  A5 B3
    CMP #$03                     ; $8AB9  C9 03
    BEQ loc_1C_8AE8              ; $8ABB  F0 2B

loc_1C_8ABD:
    LDA $33                      ; $8ABD  A5 33
    CMP #$04                     ; $8ABF  C9 04
    BNE loc_1C_8B12              ; $8AC1  D0 4F
    LDA $FB                      ; $8AC3  A5 FB
    BNE loc_1C_8AE8              ; $8AC5  D0 21
    LDA $0640                    ; $8AC7  AD 40 06
    BPL loc_1C_8AE8              ; $8ACA  10 1C
    LDA #$3B                     ; $8ACC  A9 3B
    JSR sub_1E_C051              ; $8ACE  20 51 C0
    LDA $042E                    ; $8AD1  AD 2E 04
    BMI loc_1C_8AE8              ; $8AD4  30 12
    LDY #$0E                     ; $8AD6  A0 0E
    LDX #$0E                     ; $8AD8  A2 0E
    JSR sub_1E_D3E0              ; $8ADA  20 E0 D3
    SEC                          ; $8ADD  38
    LDA $04AE                    ; $8ADE  AD AE 04
    SBC #$04                     ; $8AE1  E9 04
    AND #$F0                     ; $8AE3  29 F0
    STA $04AE                    ; $8AE5  8D AE 04

loc_1C_8AE8:
    INC $39                      ; $8AE8  E6 39
    LDA $39                      ; $8AEA  A5 39
    CMP #$60                     ; $8AEC  C9 60
    BCC loc_1C_8B0F              ; $8AEE  90 1F
    BEQ loc_1C_8AFA              ; $8AF0  F0 08
    CMP #$80                     ; $8AF2  C9 80
    BCC loc_1C_8B0F              ; $8AF4  90 19
    LDA #$00                     ; $8AF6  A9 00
    STA $39                      ; $8AF8  85 39

loc_1C_8AFA:
    LDA $F9                      ; $8AFA  A5 F9
    BNE loc_1C_8B0F              ; $8AFC  D0 11
    STX $2B                      ; $8AFE  86 2B
    LDA #$0E                     ; $8B00  A9 0E
    JSR sub_1F_F159              ; $8B02  20 59 F1
    BCS loc_1C_8B0F              ; $8B05  B0 08
    LDA $0430,Y                  ; $8B07  B9 30 04
    AND #$F0                     ; $8B0A  29 F0
    STA $0430,Y                  ; $8B0C  99 30 04

loc_1C_8B0F:
    LDX #$00                     ; $8B0F  A2 00
    INX                          ; $8B11  E8

loc_1C_8B12:
    LDA $8A6D,X                  ; $8B12  BD 6D 8A
    STA $30                      ; $8B15  85 30
    LDA $8A6F,X                  ; $8B17  BD 6F 8A
    STA $FB                      ; $8B1A  85 FB
    LDA $8A71,X                  ; $8B1C  BD 71 8A
    STA $3C                      ; $8B1F  85 3C
    LDA $8A73,X                  ; $8B21  BD 73 8A
    STA $3B                      ; $8B24  85 3B
    LDA #$00                     ; $8B26  A9 00
    STA $35                      ; $8B28  85 35
    LDA #$02                     ; $8B2A  A9 02
    STA $01                      ; $8B2C  85 01
    LDX #$02                     ; $8B2E  A2 02

loc_1C_8B30:
    LDA $32,X                    ; $8B30  B5 32
    CMP #$02                     ; $8B32  C9 02
    BNE loc_1C_8B3C              ; $8B34  D0 06
    LDA $01                      ; $8B36  A5 01
    ORA $35                      ; $8B38  05 35
    STA $35                      ; $8B3A  85 35

loc_1C_8B3C:
    ASL $01                      ; $8B3C  06 01
    DEX                          ; $8B3E  CA
    BPL loc_1C_8B30              ; $8B3F  10 EF
    SEC                          ; $8B41  38
    LDA $04C0                    ; $8B42  AD C0 04
    SBC $0660                    ; $8B45  ED 60 06
    LDA $04A0                    ; $8B48  AD A0 04
    SBC $0640                    ; $8B4B  ED 40 06
    LDX $0640                    ; $8B4E  AE 40 06
    BMI loc_1C_8B5F              ; $8B51  30 0C
    SEC                          ; $8B53  38
    SBC #$0C                     ; $8B54  E9 0C
    STA $0A                      ; $8B56  85 0A
    LDA $F9                      ; $8B58  A5 F9
    SBC #$00                     ; $8B5A  E9 00
    JMP loc_1C_8B68              ; $8B5C  4C 68 8B


loc_1C_8B5F:
    CLC                          ; $8B5F  18
    ADC #$0C                     ; $8B60  69 0C
    STA $0A                      ; $8B62  85 0A
    LDA $F9                      ; $8B64  A5 F9
    ADC #$00                     ; $8B66  69 00

loc_1C_8B68:
    STA $0B                      ; $8B68  85 0B
    JSR sub_1E_CBC3              ; $8B6A  20 C3 CB
    LDA $00                      ; $8B6D  A5 00
    CMP #$02                     ; $8B6F  C9 02
    BNE loc_1C_8B82              ; $8B71  D0 0F
    LDA $0640                    ; $8B73  AD 40 06
    BMI loc_1C_8B7C              ; $8B76  30 04
    LDA #$10                     ; $8B78  A9 10
    BNE loc_1C_8B7E              ; $8B7A  D0 02

loc_1C_8B7C:
    LDA #$01                     ; $8B7C  A9 01

loc_1C_8B7E:
    ORA $35                      ; $8B7E  05 35
    STA $35                      ; $8B80  85 35

loc_1C_8B82:
    RTS                          ; $8B82  60


sub_1C_8B83:
    LDA $04A0                    ; $8B83  AD A0 04
    STA $2E                      ; $8B86  85 2E
    LDA $04C0                    ; $8B88  AD C0 04
    STA $2F                      ; $8B8B  85 2F
    LDA #$00                     ; $8B8D  A9 00
    STA $00                      ; $8B8F  85 00
    LDA $0640                    ; $8B91  AD 40 06
    BPL loc_1C_8B98              ; $8B94  10 02
    DEC $00                      ; $8B96  C6 00

loc_1C_8B98:
    SEC                          ; $8B98  38
    LDA $04C0                    ; $8B99  AD C0 04
    SBC $0660                    ; $8B9C  ED 60 06
    STA $04C0                    ; $8B9F  8D C0 04
    LDA $04A0                    ; $8BA2  AD A0 04
    SBC $0640                    ; $8BA5  ED 40 06
    STA $04A0                    ; $8BA8  8D A0 04
    TAX                          ; $8BAB  AA
    LDA $F9                      ; $8BAC  A5 F9
    SBC $00                      ; $8BAE  E5 00
    STA $F9                      ; $8BB0  85 F9
    CPX #$04                     ; $8BB2  E0 04
    BCS loc_1C_8BC6              ; $8BB4  B0 10
    LDA $2C                      ; $8BB6  A5 2C
    CMP #$09                     ; $8BB8  C9 09
    BEQ loc_1C_8BC0              ; $8BBA  F0 04
    CMP #$0A                     ; $8BBC  C9 0A
    BNE loc_1C_8BD2              ; $8BBE  D0 12

loc_1C_8BC0:
    LDA #$01                     ; $8BC0  A9 01
    STA $37                      ; $8BC2  85 37
    BNE loc_1C_8BD2              ; $8BC4  D0 0C

loc_1C_8BC6:
    CPX #$E8                     ; $8BC6  E0 E8
    BCC loc_1C_8BD2              ; $8BC8  90 08
    LDA $F9                      ; $8BCA  A5 F9
    BMI loc_1C_8BD2              ; $8BCC  30 04
    LDA #$03                     ; $8BCE  A9 03
    STA $37                      ; $8BD0  85 37

loc_1C_8BD2:
    LDA $0640                    ; $8BD2  AD 40 06
    BMI loc_1C_8C28              ; $8BD5  30 51
    SEC                          ; $8BD7  38
    LDA $04A0                    ; $8BD8  AD A0 04
    SBC #$0C                     ; $8BDB  E9 0C
    STA $0A                      ; $8BDD  85 0A
    LDA $F9                      ; $8BDF  A5 F9
    SBC #$00                     ; $8BE1  E9 00
    STA $0B                      ; $8BE3  85 0B
    JSR sub_1C_8C6A              ; $8BE5  20 6A 8C
    LDA $00                      ; $8BE8  A5 00
    BEQ loc_1C_8C06              ; $8BEA  F0 1A
    LDA #$00                     ; $8BEC  A9 00
    STA $04C0                    ; $8BEE  8D C0 04
    LDA $0A                      ; $8BF1  A5 0A
    AND #$0F                     ; $8BF3  29 0F
    EOR #$0F                     ; $8BF5  49 0F
    SEC                          ; $8BF7  38
    ADC $04A0                    ; $8BF8  6D A0 04
    STA $04A0                    ; $8BFB  8D A0 04

loc_1C_8BFE:
    LDA #$00                     ; $8BFE  A9 00
    STA $0660                    ; $8C00  8D 60 06
    STA $0640                    ; $8C03  8D 40 06

loc_1C_8C06:
    SEC                          ; $8C06  38
    LDA $0660                    ; $8C07  AD 60 06
    SBC $30                      ; $8C0A  E5 30
    STA $0660                    ; $8C0C  8D 60 06
    LDA $0640                    ; $8C0F  AD 40 06
    SBC $31                      ; $8C12  E5 31
    STA $0640                    ; $8C14  8D 40 06
    BPL loc_1C_8C27              ; $8C17  10 0E
    CMP #$F4                     ; $8C19  C9 F4
    BCS loc_1C_8C27              ; $8C1B  B0 0A
    LDA #$00                     ; $8C1D  A9 00
    STA $0660                    ; $8C1F  8D 60 06
    LDA #$F4                     ; $8C22  A9 F4
    STA $0640                    ; $8C24  8D 40 06

loc_1C_8C27:
    RTS                          ; $8C27  60


loc_1C_8C28:
    CLC                          ; $8C28  18
    LDA $04A0                    ; $8C29  AD A0 04
    ADC #$0C                     ; $8C2C  69 0C
    STA $0A                      ; $8C2E  85 0A
    LDA $F9                      ; $8C30  A5 F9
    ADC #$00                     ; $8C32  69 00
    STA $0B                      ; $8C34  85 0B
    JSR sub_1C_8C6A              ; $8C36  20 6A 8C
    JSR sub_1C_8CF4              ; $8C39  20 F4 8C
    LDA $00                      ; $8C3C  A5 00
    BNE loc_1C_8C44              ; $8C3E  D0 04
    BCS loc_1C_8C65              ; $8C40  B0 23
    BCC loc_1C_8C06              ; $8C42  90 C2

loc_1C_8C44:
    LDA #$00                     ; $8C44  A9 00
    STA $04C0                    ; $8C46  8D C0 04
    LDA $04A0                    ; $8C49  AD A0 04
    PHA                          ; $8C4C  48
    LDA $0A                      ; $8C4D  A5 0A
    AND #$0F                     ; $8C4F  29 0F
    STA $04A0                    ; $8C51  8D A0 04
    PLA                          ; $8C54  68
    SEC                          ; $8C55  38
    SBC $04A0                    ; $8C56  ED A0 04
    STA $04A0                    ; $8C59  8D A0 04
    LDA $F9                      ; $8C5C  A5 F9
    SBC #$00                     ; $8C5E  E9 00
    STA $F9                      ; $8C60  85 F9
    JMP loc_1C_8BFE              ; $8C62  4C FE 8B


loc_1C_8C65:
    LDA #$01                     ; $8C65  A9 01
    STA $00                      ; $8C67  85 00
    RTS                          ; $8C69  60


sub_1C_8C6A:
    LDA #$01                     ; $8C6A  A9 01
    STA $01                      ; $8C6C  85 01

loc_1C_8C6E:
    LDX $01                      ; $8C6E  A6 01
    CLC                          ; $8C70  18
    LDA $0460                    ; $8C71  AD 60 04
    ADC $8CED,X                  ; $8C74  7D ED 8C
    STA $08                      ; $8C77  85 08
    LDA $0440                    ; $8C79  AD 40 04
    ADC $8CEF,X                  ; $8C7C  7D EF 8C
    STA $09                      ; $8C7F  85 09
    JSR sub_1E_CBA2              ; $8C81  20 A2 CB
    LDX $01                      ; $8C84  A6 01
    LDA $00                      ; $8C86  A5 00
    STA $32,X                    ; $8C88  95 32
    DEC $01                      ; $8C8A  C6 01
    BPL loc_1C_8C6E              ; $8C8C  10 E0
    LDA #$00                     ; $8C8E  A9 00
    STA $40                      ; $8C90  85 40
    LDX #$01                     ; $8C92  A2 01

loc_1C_8C94:
    LDA $32,X                    ; $8C94  B5 32
    CMP #$08                     ; $8C96  C9 08
    BCS loc_1C_8CBA              ; $8C98  B0 20
    CMP #$05                     ; $8C9A  C9 05
    BCC loc_1C_8CBA              ; $8C9C  90 1C
    SBC #$05                     ; $8C9E  E9 05
    TAY                          ; $8CA0  A8
    LDA $8CF1,Y                  ; $8CA1  B9 F1 8C
    STA $40                      ; $8CA4  85 40
    BMI loc_1C_8CB6              ; $8CA6  30 0E
    TAY                          ; $8CA8  A8
    LDA $0044,Y                  ; $8CA9  B9 44 00
    STA $AF                      ; $8CAC  85 AF
    LDA #$01                     ; $8CAE  A9 01
    STA $50                      ; $8CB0  85 50
    LDA #$00                     ; $8CB2  A9 00
    STA $4F                      ; $8CB4  85 4F

loc_1C_8CB6:
    LDA #$01                     ; $8CB6  A9 01
    BNE loc_1C_8CD2              ; $8CB8  D0 18

loc_1C_8CBA:
    CMP #$03                     ; $8CBA  C9 03
    BNE loc_1C_8CC9              ; $8CBC  D0 0B
    LDY $4B                      ; $8CBE  A4 4B
    BNE loc_1C_8CC9              ; $8CC0  D0 07
    LDA #$00                     ; $8CC2  A9 00
    STA $2C                      ; $8CC4  85 2C
    JMP loc_1E_C10B              ; $8CC6  4C 0B C1


loc_1C_8CC9:
    DEX                          ; $8CC9  CA
    BPL loc_1C_8C94              ; $8CCA  10 C8
    LDA $32                      ; $8CCC  A5 32
    ORA $33                      ; $8CCE  05 33
    AND #$01                     ; $8CD0  29 01

loc_1C_8CD2:
    STA $00                      ; $8CD2  85 00
    LDA $35                      ; $8CD4  A5 35
    BEQ loc_1C_8CEC              ; $8CD6  F0 14
    CMP #$01                     ; $8CD8  C9 01
    BEQ loc_1C_8CEA              ; $8CDA  F0 0E
    LDX $F9                      ; $8CDC  A6 F9
    BPL loc_1C_8CEC              ; $8CDE  10 0C
    LDA $23                      ; $8CE0  A5 23
    AND #$30                     ; $8CE2  29 30
    BEQ loc_1C_8CEC              ; $8CE4  F0 06
    LDX #$01                     ; $8CE6  A2 01
    STX $37                      ; $8CE8  86 37

loc_1C_8CEA:
    STA $00                      ; $8CEA  85 00

loc_1C_8CEC:
    RTS                          ; $8CEC  60

    .byte $07,$F9,$00,$FF,$01,$02,$80  ; $8CED

sub_1C_8CF4:
    SEC                          ; $8CF4  38
    LDA $0460                    ; $8CF5  AD 60 04
    SBC $1F                      ; $8CF8  E5 1F
    STA $08                      ; $8CFA  85 08
    CLC                          ; $8CFC  18
    LDA $2E                      ; $8CFD  A5 2E
    ADC #$0C                     ; $8CFF  69 0C
    STA $09                      ; $8D01  85 09
    LDA $A9                      ; $8D03  A5 A9
    CMP #$09                     ; $8D05  C9 09
    BCC loc_1C_8D13              ; $8D07  90 0A
    LDX #$02                     ; $8D09  A2 02

loc_1C_8D0B:
    LDA $05A0,X                  ; $8D0B  BD A0 05
    BNE loc_1C_8D86              ; $8D0E  D0 76

loc_1C_8D10:
    DEX                          ; $8D10  CA
    BPL loc_1C_8D0B              ; $8D11  10 F8

loc_1C_8D13:
    LDX #$0F                     ; $8D13  A2 0F

loc_1C_8D15:
    LDA $0160,X                  ; $8D15  BD 60 01
    BNE loc_1C_8D1F              ; $8D18  D0 05

loc_1C_8D1A:
    DEX                          ; $8D1A  CA
    BPL loc_1C_8D15              ; $8D1B  10 F8
    CLC                          ; $8D1D  18
    RTS                          ; $8D1E  60


loc_1C_8D1F:
    LDA $F9                      ; $8D1F  A5 F9
    BNE loc_1C_8D1A              ; $8D21  D0 F7
    SEC                          ; $8D23  38
    LDA $0470,X                  ; $8D24  BD 70 04
    SBC $1F                      ; $8D27  E5 1F
    STA $0C                      ; $8D29  85 0C
    SEC                          ; $8D2B  38
    SBC $08                      ; $8D2C  E5 08
    BCS loc_1C_8D34              ; $8D2E  B0 04
    EOR #$FF                     ; $8D30  49 FF
    ADC #$01                     ; $8D32  69 01

loc_1C_8D34:
    CMP $0160,X                  ; $8D34  DD 60 01
    BCS loc_1C_8D1A              ; $8D37  B0 E1
    LDA $04B0,X                  ; $8D39  BD B0 04
    CMP $09                      ; $8D3C  C5 09
    BCC loc_1C_8D1A              ; $8D3E  90 DA
    LDA $0170,X                  ; $8D40  BD 70 01
    CMP $0A                      ; $8D43  C5 0A
    BEQ loc_1C_8D49              ; $8D45  F0 02
    BCS loc_1C_8D1A              ; $8D47  B0 D1

loc_1C_8D49:
    LDA $0410,X                  ; $8D49  BD 10 04
    CMP #$13                     ; $8D4C  C9 13
    BNE loc_1C_8D53              ; $8D4E  D0 03
    INC $04F0,X                  ; $8D50  FE F0 04

loc_1C_8D53:
    SEC                          ; $8D53  38
    LDA $0170,X                  ; $8D54  BD 70 01
    SBC #$0C                     ; $8D57  E9 0C
    STA $04A0                    ; $8D59  8D A0 04
    LDA $F9                      ; $8D5C  A5 F9
    SBC #$00                     ; $8D5E  E9 00
    STA $F9                      ; $8D60  85 F9
    LDA #$00                     ; $8D62  A9 00
    STA $04C0                    ; $8D64  8D C0 04
    STA $0660                    ; $8D67  8D 60 06
    LDA #$FF                     ; $8D6A  A9 FF
    STA $0640                    ; $8D6C  8D 40 06
    LDA #$01                     ; $8D6F  A9 01
    STA $40                      ; $8D71  85 40
    LDA $0430,X                  ; $8D73  BD 30 04
    AND #$40                     ; $8D76  29 40
    STA $AF                      ; $8D78  85 AF
    LDA $0630,X                  ; $8D7A  BD 30 06
    STA $4F                      ; $8D7D  85 4F
    LDA $0610,X                  ; $8D7F  BD 10 06
    STA $50                      ; $8D82  85 50
    SEC                          ; $8D84  38
    RTS                          ; $8D85  60


loc_1C_8D86:
    LDA $F9                      ; $8D86  A5 F9
    BNE loc_1C_8DF2              ; $8D88  D0 68
    SEC                          ; $8D8A  38
    LDA $0462,X                  ; $8D8B  BD 62 04
    SBC $1F                      ; $8D8E  E5 1F
    STA $0C                      ; $8D90  85 0C
    SEC                          ; $8D92  38
    SBC $08                      ; $8D93  E5 08
    BCS loc_1C_8D9B              ; $8D95  B0 04
    EOR #$FF                     ; $8D97  49 FF
    ADC #$01                     ; $8D99  69 01

loc_1C_8D9B:
    CMP $05A0,X                  ; $8D9B  DD A0 05
    BCS loc_1C_8DF2              ; $8D9E  B0 52
    LDA $04A2,X                  ; $8DA0  BD A2 04
    CMP $09                      ; $8DA3  C5 09
    BCC loc_1C_8DF2              ; $8DA5  90 4B
    LDA $05A3,X                  ; $8DA7  BD A3 05
    CMP $0A                      ; $8DAA  C5 0A
    BEQ loc_1C_8DB0              ; $8DAC  F0 02
    BCS loc_1C_8DF2              ; $8DAE  B0 42

loc_1C_8DB0:
    LDA $0402,X                  ; $8DB0  BD 02 04
    CMP #$3A                     ; $8DB3  C9 3A
    BNE loc_1C_8DBF              ; $8DB5  D0 08
    LDA $04E2,X                  ; $8DB7  BD E2 04
    ORA #$80                     ; $8DBA  09 80
    STA $04E2,X                  ; $8DBC  9D E2 04

loc_1C_8DBF:
    SEC                          ; $8DBF  38
    LDA $05A3,X                  ; $8DC0  BD A3 05
    SBC #$0C                     ; $8DC3  E9 0C
    STA $04A0                    ; $8DC5  8D A0 04
    LDA $F9                      ; $8DC8  A5 F9
    SBC #$00                     ; $8DCA  E9 00
    STA $F9                      ; $8DCC  85 F9
    LDA #$00                     ; $8DCE  A9 00
    STA $04C0                    ; $8DD0  8D C0 04
    STA $0660                    ; $8DD3  8D 60 06
    LDA #$FF                     ; $8DD6  A9 FF
    STA $0640                    ; $8DD8  8D 40 06
    LDA #$01                     ; $8DDB  A9 01
    STA $40                      ; $8DDD  85 40
    LDA $0422,X                  ; $8DDF  BD 22 04
    AND #$40                     ; $8DE2  29 40
    STA $AF                      ; $8DE4  85 AF
    LDA $0622,X                  ; $8DE6  BD 22 06
    STA $4F                      ; $8DE9  85 4F
    LDA $0602,X                  ; $8DEB  BD 02 06
    STA $50                      ; $8DEE  85 50
    SEC                          ; $8DF0  38
    RTS                          ; $8DF1  60


loc_1C_8DF2:
    JMP loc_1C_8D10              ; $8DF2  4C 10 8D


sub_1C_8DF5:
    SEC                          ; $8DF5  38
    LDA $0460                    ; $8DF6  AD 60 04
    SBC $1F                      ; $8DF9  E5 1F
    CMP #$80                     ; $8DFB  C9 80
    BCS loc_1C_8E00              ; $8DFD  B0 01
    RTS                          ; $8DFF  60


loc_1C_8E00:
    CLC                          ; $8E00  18
    LDA $1F                      ; $8E01  A5 1F
    PHA                          ; $8E03  48
    ADC $00                      ; $8E04  65 00
    STA $1F                      ; $8E06  85 1F
    LDA $20                      ; $8E08  A5 20
    ADC #$00                     ; $8E0A  69 00
    STA $20                      ; $8E0C  85 20
    CMP $15                      ; $8E0E  C5 15
    BNE loc_1C_8E1F              ; $8E10  D0 0D
    SEC                          ; $8E12  38
    LDA $00                      ; $8E13  A5 00
    SBC $1F                      ; $8E15  E5 1F
    STA $00                      ; $8E17  85 00
    LDA #$00                     ; $8E19  A9 00
    STA $1F                      ; $8E1B  85 1F
    STA $1E                      ; $8E1D  85 1E

loc_1C_8E1F:
    PLA                          ; $8E1F  68
    AND #$03                     ; $8E20  29 03
    ADC $00                      ; $8E22  65 00
    LSR A                        ; $8E24  4A
    LSR A                        ; $8E25  4A
    STA $01                      ; $8E26  85 01
    BEQ loc_1C_8E64              ; $8E28  F0 3A
    CLC                          ; $8E2A  18
    LDA $18                      ; $8E2B  A5 18
    STA $08                      ; $8E2D  85 08
    ADC $01                      ; $8E2F  65 01
    STA $18                      ; $8E31  85 18
    LDA $19                      ; $8E33  A5 19
    STA $09                      ; $8E35  85 09
    ADC #$00                     ; $8E37  69 00
    STA $19                      ; $8E39  85 19
    CLC                          ; $8E3B  18
    LDA $16                      ; $8E3C  A5 16
    ADC $01                      ; $8E3E  65 01
    STA $16                      ; $8E40  85 16
    LDA $17                      ; $8E42  A5 17
    ADC #$00                     ; $8E44  69 00
    STA $17                      ; $8E46  85 17

loc_1C_8E48:
    JSR sub_1E_C96B              ; $8E48  20 6B C9
    INC $1A                      ; $8E4B  E6 1A
    LDA $1A                      ; $8E4D  A5 1A
    AND #$3F                     ; $8E4F  29 3F
    STA $1A                      ; $8E51  85 1A
    CLC                          ; $8E53  18
    LDA $08                      ; $8E54  A5 08
    ADC #$01                     ; $8E56  69 01
    STA $08                      ; $8E58  85 08
    LDA $09                      ; $8E5A  A5 09
    ADC #$00                     ; $8E5C  69 00
    STA $09                      ; $8E5E  85 09
    DEC $01                      ; $8E60  C6 01
    BNE loc_1C_8E48              ; $8E62  D0 E4

loc_1C_8E64:
    RTS                          ; $8E64  60


sub_1C_8E65:
    SEC                          ; $8E65  38
    LDA $0460                    ; $8E66  AD 60 04
    SBC $1F                      ; $8E69  E5 1F
    CMP #$80                     ; $8E6B  C9 80
    BCC loc_1C_8E70              ; $8E6D  90 01
    RTS                          ; $8E6F  60


loc_1C_8E70:
    SEC                          ; $8E70  38
    LDA $1F                      ; $8E71  A5 1F
    PHA                          ; $8E73  48
    SBC $00                      ; $8E74  E5 00
    STA $1F                      ; $8E76  85 1F
    LDA $20                      ; $8E78  A5 20
    SBC #$00                     ; $8E7A  E9 00
    STA $20                      ; $8E7C  85 20
    LDX $14                      ; $8E7E  A6 14
    DEX                          ; $8E80  CA
    CPX $20                      ; $8E81  E4 20
    BNE loc_1C_8E94              ; $8E83  D0 0F
    INC $20                      ; $8E85  E6 20
    CLC                          ; $8E87  18
    LDA $00                      ; $8E88  A5 00
    ADC $1F                      ; $8E8A  65 1F
    STA $00                      ; $8E8C  85 00
    LDA #$00                     ; $8E8E  A9 00
    STA $1F                      ; $8E90  85 1F
    STA $1E                      ; $8E92  85 1E

loc_1C_8E94:
    CLC                          ; $8E94  18
    PLA                          ; $8E95  68
    EOR #$FF                     ; $8E96  49 FF
    AND #$03                     ; $8E98  29 03
    ADC $00                      ; $8E9A  65 00
    LSR A                        ; $8E9C  4A
    LSR A                        ; $8E9D  4A
    STA $01                      ; $8E9E  85 01
    BEQ loc_1C_8EDC              ; $8EA0  F0 3A
    SEC                          ; $8EA2  38
    LDA $16                      ; $8EA3  A5 16
    STA $08                      ; $8EA5  85 08
    SBC $01                      ; $8EA7  E5 01
    STA $16                      ; $8EA9  85 16
    LDA $17                      ; $8EAB  A5 17
    STA $09                      ; $8EAD  85 09
    SBC #$00                     ; $8EAF  E9 00
    STA $17                      ; $8EB1  85 17
    SEC                          ; $8EB3  38
    LDA $18                      ; $8EB4  A5 18
    SBC $01                      ; $8EB6  E5 01
    STA $18                      ; $8EB8  85 18
    LDA $19                      ; $8EBA  A5 19
    SBC #$00                     ; $8EBC  E9 00
    STA $19                      ; $8EBE  85 19

loc_1C_8EC0:
    JSR sub_1E_C96B              ; $8EC0  20 6B C9
    DEC $1A                      ; $8EC3  C6 1A
    LDA $1A                      ; $8EC5  A5 1A
    AND #$3F                     ; $8EC7  29 3F
    STA $1A                      ; $8EC9  85 1A
    SEC                          ; $8ECB  38
    LDA $08                      ; $8ECC  A5 08
    SBC #$01                     ; $8ECE  E9 01
    STA $08                      ; $8ED0  85 08
    LDA $09                      ; $8ED2  A5 09
    SBC #$00                     ; $8ED4  E9 00
    STA $09                      ; $8ED6  85 09
    DEC $01                      ; $8ED8  C6 01
    BNE loc_1C_8EC0              ; $8EDA  D0 E4

loc_1C_8EDC:
    RTS                          ; $8EDC  60


sub_1C_8EDD:
    JSR sub_1C_9220              ; $8EDD  20 20 92
    LDX $14                      ; $8EE0  A6 14
    DEX                          ; $8EE2  CA
    STX $15                      ; $8EE3  86 15
    DEC $38                      ; $8EE5  C6 38
    LDY $38                      ; $8EE7  A4 38
    JSR sub_1E_C7A4              ; $8EE9  20 A4 C7
    TYA                          ; $8EEC  98
    AND #$1F                     ; $8EED  29 1F
    STA $14                      ; $8EEF  85 14
    TXA                          ; $8EF1  8A
    SEC                          ; $8EF2  38
    SBC $14                      ; $8EF3  E5 14
    STA $14                      ; $8EF5  85 14
    LDA $15                      ; $8EF7  A5 15
    JSR sub_1C_907D              ; $8EF9  20 7D 90
    DEC $0440                    ; $8EFC  CE 40 04
    LDA $38                      ; $8EFF  A5 38
    STA $FE                      ; $8F01  85 FE
    JSR sub_1C_90C9              ; $8F03  20 C9 90
    DEC $20                      ; $8F06  C6 20
    SEC                          ; $8F08  38
    LDA $16                      ; $8F09  A5 16
    SBC #$40                     ; $8F0B  E9 40
    STA $16                      ; $8F0D  85 16
    LDA $17                      ; $8F0F  A5 17
    SBC #$00                     ; $8F11  E9 00
    STA $17                      ; $8F13  85 17
    SEC                          ; $8F15  38
    LDA $18                      ; $8F16  A5 18
    SBC #$40                     ; $8F18  E9 40
    STA $18                      ; $8F1A  85 18
    LDA $19                      ; $8F1C  A5 19
    SBC #$00                     ; $8F1E  E9 00
    STA $19                      ; $8F20  85 19
    JSR sub_1E_C07F              ; $8F22  20 7F C0
    SEC                          ; $8F25  38
    LDA $15                      ; $8F26  A5 15
    SBC #$01                     ; $8F28  E9 01
    JSR sub_1C_907D              ; $8F2A  20 7D 90
    LDA #$00                     ; $8F2D  A9 00
    STA $F9                      ; $8F2F  85 F9
    LDA #$00                     ; $8F31  A9 00
    STA $42                      ; $8F33  85 42
    JSR sub_1E_D658              ; $8F35  20 58 D6
    RTS                          ; $8F38  60


sub_1C_8F39:
    JSR sub_1C_9220              ; $8F39  20 20 92
    LDX $15                      ; $8F3C  A6 15
    INX                          ; $8F3E  E8
    TXA                          ; $8F3F  8A
    PHA                          ; $8F40  48
    JSR sub_1C_907D              ; $8F41  20 7D 90
    INC $0440                    ; $8F44  EE 40 04
    LDA $37                      ; $8F47  A5 37
    AND #$01                     ; $8F49  29 01
    BNE loc_1C_8F91              ; $8F4B  D0 44
    LDA #$18                     ; $8F4D  A9 18
    STA $FD                      ; $8F4F  85 FD
    LDA #$00                     ; $8F51  A9 00
    STA $FE                      ; $8F53  85 FE

loc_1C_8F55:
    LDX $2A                      ; $8F55  A6 2A
    LDA $20                      ; $8F57  A5 20
    CMP $9061,X                  ; $8F59  DD 61 90
    BCC loc_1C_8F91              ; $8F5C  90 33
    LDA $FD                      ; $8F5E  A5 FD
    AND #$07                     ; $8F60  29 07
    BNE loc_1C_8F85              ; $8F62  D0 21
    LDA #$34                     ; $8F64  A9 34
    JSR sub_1E_C051              ; $8F66  20 51 C0
    LDA $20                      ; $8F69  A5 20
    STA $09                      ; $8F6B  85 09
    LDA #$F0                     ; $8F6D  A9 F0
    STA $08                      ; $8F6F  85 08
    LDA $FD                      ; $8F71  A5 FD
    ASL A                        ; $8F73  0A
    ADC $9045,X                  ; $8F74  7D 45 90
    STA $0A                      ; $8F77  85 0A
    JSR sub_1E_C8EF              ; $8F79  20 EF C8
    JSR sub_1E_C91B              ; $8F7C  20 1B C9
    LDA #$80                     ; $8F7F  A9 80
    STA $54                      ; $8F81  85 54
    INC $51                      ; $8F83  E6 51

loc_1C_8F85:
    JSR sub_1E_C07F              ; $8F85  20 7F C0
    DEC $FD                      ; $8F88  C6 FD
    BPL loc_1C_8F55              ; $8F8A  10 C9
    LDA #$FE                     ; $8F8C  A9 FE
    JSR sub_1E_C051              ; $8F8E  20 51 C0

loc_1C_8F91:
    LDA $38                      ; $8F91  A5 38
    STA $FE                      ; $8F93  85 FE
    INC $FE                      ; $8F95  E6 FE
    JSR sub_1C_90C9              ; $8F97  20 C9 90
    INC $20                      ; $8F9A  E6 20
    JSR sub_1E_C07F              ; $8F9C  20 7F C0
    CLC                          ; $8F9F  18
    LDA $15                      ; $8FA0  A5 15
    ADC #$02                     ; $8FA2  69 02
    JSR sub_1C_907D              ; $8FA4  20 7D 90
    INC $38                      ; $8FA7  E6 38
    LDY $38                      ; $8FA9  A4 38
    JSR sub_1E_C7A4              ; $8FAB  20 A4 C7
    TYA                          ; $8FAE  98
    AND #$1F                     ; $8FAF  29 1F
    STA $14                      ; $8FB1  85 14
    PLA                          ; $8FB3  68
    TAX                          ; $8FB4  AA
    CLC                          ; $8FB5  18
    ADC $14                      ; $8FB6  65 14
    STA $15                      ; $8FB8  85 15
    STX $14                      ; $8FBA  86 14
    CLC                          ; $8FBC  18
    LDA $18                      ; $8FBD  A5 18
    ADC #$40                     ; $8FBF  69 40
    STA $18                      ; $8FC1  85 18
    LDA $19                      ; $8FC3  A5 19
    ADC #$00                     ; $8FC5  69 00
    STA $19                      ; $8FC7  85 19
    CLC                          ; $8FC9  18
    LDA $16                      ; $8FCA  A5 16
    ADC #$40                     ; $8FCC  69 40
    STA $16                      ; $8FCE  85 16
    LDA $17                      ; $8FD0  A5 17
    ADC #$00                     ; $8FD2  69 00
    STA $17                      ; $8FD4  85 17
    LDA #$00                     ; $8FD6  A9 00
    STA $F9                      ; $8FD8  85 F9
    LDA $37                      ; $8FDA  A5 37
    AND #$01                     ; $8FDC  29 01
    BNE loc_1C_903D              ; $8FDE  D0 5D
    LDA #$00                     ; $8FE0  A9 00
    STA $FD                      ; $8FE2  85 FD
    STA $FE                      ; $8FE4  85 FE

loc_1C_8FE6:
    LDX $2A                      ; $8FE6  A6 2A
    LDA $20                      ; $8FE8  A5 20
    CMP $9061,X                  ; $8FEA  DD 61 90
    BCC loc_1C_903D              ; $8FED  90 4E
    CMP $906F,X                  ; $8FEF  DD 6F 90
    BNE loc_1C_9003              ; $8FF2  D0 0F
    LDA #$0B                     ; $8FF4  A9 0B
    JSR sub_1E_C051              ; $8FF6  20 51 C0
    LDA $2A                      ; $8FF9  A5 2A
    CMP #$0B                     ; $8FFB  C9 0B
    BEQ loc_1C_9003              ; $8FFD  F0 04
    CMP #$08                     ; $8FFF  C9 08
    BCS loc_1C_903D              ; $9001  B0 3A

loc_1C_9003:
    LDA $FD                      ; $9003  A5 FD
    AND #$07                     ; $9005  29 07
    BNE loc_1C_902D              ; $9007  D0 24
    LDA #$34                     ; $9009  A9 34
    JSR sub_1E_C051              ; $900B  20 51 C0
    LDA $20                      ; $900E  A5 20
    STA $09                      ; $9010  85 09
    LDA #$00                     ; $9012  A9 00
    STA $08                      ; $9014  85 08
    LDA $FD                      ; $9016  A5 FD
    ASL A                        ; $9018  0A
    ADC $9045,X                  ; $9019  7D 45 90
    STA $0A                      ; $901C  85 0A
    JSR sub_1E_C8EF              ; $901E  20 EF C8
    LDX $2A                      ; $9021  A6 2A
    LDA $9053,X                  ; $9023  BD 53 90
    JSR sub_1E_C91B              ; $9026  20 1B C9
    INC $54                      ; $9029  E6 54
    INC $51                      ; $902B  E6 51

loc_1C_902D:
    JSR sub_1E_C07F              ; $902D  20 7F C0
    INC $FD                      ; $9030  E6 FD
    LDA $FD                      ; $9032  A5 FD
    CMP #$19                     ; $9034  C9 19
    BNE loc_1C_8FE6              ; $9036  D0 AE
    LDA #$FE                     ; $9038  A9 FE
    JSR sub_1E_C051              ; $903A  20 51 C0

loc_1C_903D:
    LDA #$40                     ; $903D  A9 40
    STA $42                      ; $903F  85 42
    JSR sub_1E_D658              ; $9041  20 58 D6
    RTS                          ; $9044  60

    .byte $60,$40,$40,$40,$40,$40,$40,$40,$00,$00,$80,$80,$00,$80,$00,$55  ; $9045
    .byte $AA,$00,$00,$55,$00,$AA,$00,$00,$00,$00,$00,$00,$15,$13,$15,$13  ; $9055
    .byte $15,$11,$13,$11,$00,$00,$26,$25,$00,$1E,$17,$15,$17,$15,$17,$13  ; $9065
    .byte $15,$13,$00,$27,$27,$26,$00,$1F  ; $9075

sub_1C_907D:
    LDX #$00                     ; $907D  A2 00
    STX $08                      ; $907F  86 08
    LSR A                        ; $9081  4A
    ROR $08                      ; $9082  66 08
    LSR A                        ; $9084  4A
    ROR $08                      ; $9085  66 08
    CLC                          ; $9087  18
    ADC #$85                     ; $9088  69 85
    STA $09                      ; $908A  85 09
    LDA $1A                      ; $908C  A5 1A
    PHA                          ; $908E  48
    LDA #$00                     ; $908F  A9 00
    STA $1A                      ; $9091  85 1A

loc_1C_9093:
    JSR sub_1E_C96B              ; $9093  20 6B C9
    INC $08                      ; $9096  E6 08
    INC $1A                      ; $9098  E6 1A
    JSR sub_1E_C96B              ; $909A  20 6B C9
    LDA $08                      ; $909D  A5 08
    PHA                          ; $909F  48
    LDA $09                      ; $90A0  A5 09
    PHA                          ; $90A2  48
    LDA $F7                      ; $90A3  A5 F7
    AND #$80                     ; $90A5  29 80
    BEQ loc_1C_90AF              ; $90A7  F0 06
    JSR sub_1E_C07F              ; $90A9  20 7F C0
    JMP loc_1C_90B4              ; $90AC  4C B4 90


loc_1C_90AF:
    LDA $1B                      ; $90AF  A5 1B
    JSR sub_1E_D11B              ; $90B1  20 1B D1

loc_1C_90B4:
    CLC                          ; $90B4  18
    PLA                          ; $90B5  68
    STA $09                      ; $90B6  85 09
    PLA                          ; $90B8  68
    STA $08                      ; $90B9  85 08
    INC $08                      ; $90BB  E6 08
    INC $1A                      ; $90BD  E6 1A
    LDA $08                      ; $90BF  A5 08
    AND #$3F                     ; $90C1  29 3F
    BNE loc_1C_9093              ; $90C3  D0 CE
    PLA                          ; $90C5  68
    STA $1A                      ; $90C6  85 1A
    RTS                          ; $90C8  60


sub_1C_90C9:
    LDA $37                      ; $90C9  A5 37
    AND #$01                     ; $90CB  29 01
    BEQ loc_1C_90D2              ; $90CD  F0 03
    JMP loc_1C_9185              ; $90CF  4C 85 91


loc_1C_90D2:
    JSR sub_1C_9115              ; $90D2  20 15 91
    LDA #$00                     ; $90D5  A9 00
    STA $3E                      ; $90D7  85 3E
    STA $3F                      ; $90D9  85 3F
    STA $FD                      ; $90DB  85 FD
    LDY #$3F                     ; $90DD  A0 3F

loc_1C_90DF:
    TYA                          ; $90DF  98
    PHA                          ; $90E0  48
    LDA #$01                     ; $90E1  A9 01
    CLC                          ; $90E3  18
    LDA $1F                      ; $90E4  A5 1F
    ADC #$04                     ; $90E6  69 04
    STA $1F                      ; $90E8  85 1F
    CLC                          ; $90EA  18
    LDA $0480                    ; $90EB  AD 80 04
    ADC #$C0                     ; $90EE  69 C0
    STA $0480                    ; $90F0  8D 80 04
    LDA $0460                    ; $90F3  AD 60 04
    ADC #$00                     ; $90F6  69 00
    STA $0460                    ; $90F8  8D 60 04
    LDA $A9                      ; $90FB  A5 A9
    CMP #$01                     ; $90FD  C9 01
    BNE loc_1C_9104              ; $90FF  D0 03
    JSR sub_1C_91FA              ; $9101  20 FA 91

loc_1C_9104:
    JSR sub_1E_CC77              ; $9104  20 77 CC
    JSR sub_1E_CB0C              ; $9107  20 0C CB
    JSR sub_1E_C07F              ; $910A  20 7F C0
    PLA                          ; $910D  68
    TAY                          ; $910E  A8
    DEY                          ; $910F  88
    BNE loc_1C_90DF              ; $9110  D0 CD
    STY $1F                      ; $9112  84 1F
    RTS                          ; $9114  60


sub_1C_9115:
    LDX $2A                      ; $9115  A6 2A
    CPX #$03                     ; $9117  E0 03
    BNE loc_1C_9121              ; $9119  D0 06
    LDY $38                      ; $911B  A4 38
    CPY #$04                     ; $911D  C0 04
    BEQ loc_1C_9147              ; $911F  F0 26

loc_1C_9121:
    LDY $9148,X                  ; $9121  BC 48 91
    BEQ loc_1C_9147              ; $9124  F0 21
    LDA $9164,X                  ; $9126  BD 64 91
    STA $FD                      ; $9129  85 FD
    LDA $9156,X                  ; $912B  BD 56 91
    TAX                          ; $912E  AA

loc_1C_912F:
    LDA $9172,X                  ; $912F  BD 72 91
    STA $0356,Y                  ; $9132  99 56 03
    STA $0376,Y                  ; $9135  99 76 03
    STA $0386,Y                  ; $9138  99 86 03
    STA $0396,Y                  ; $913B  99 96 03
    STA $03A6,Y                  ; $913E  99 A6 03
    DEX                          ; $9141  CA
    DEY                          ; $9142  88
    DEC $FD                      ; $9143  C6 FD
    BNE loc_1C_912F              ; $9145  D0 E8

loc_1C_9147:
    RTS                          ; $9147  60

    .byte $00,$0B,$00,$0B,$00,$00,$00,$0F,$00,$00,$03,$00,$00,$0B,$00,$02  ; $9148
    .byte $00,$05,$00,$00,$00,$0C,$00,$00,$0F,$00,$00,$12,$00,$03,$00,$03  ; $9158
    .byte $00,$00,$00,$07,$00,$00,$03,$00,$00,$03,$2B,$1B,$0B,$21,$01,$0F  ; $9168
    .byte $39,$18,$01,$0F,$39,$18,$0F,$27,$37,$30,$0F,$0F,$0F  ; $9178

loc_1C_9185:
    LDA $37                      ; $9185  A5 37
    LSR A                        ; $9187  4A
    BNE loc_1C_9193              ; $9188  D0 09
    LDX #$09                     ; $918A  A2 09
    STX $2C                      ; $918C  86 2C
    PHA                          ; $918E  48
    JSR sub_1E_D3A8              ; $918F  20 A8 D3
    PLA                          ; $9192  68

loc_1C_9193:
    TAX                          ; $9193  AA
    LDA $9212,X                  ; $9194  BD 12 92
    STA $39                      ; $9197  85 39
    LDA $921C,X                  ; $9199  BD 1C 92
    STA $22                      ; $919C  85 22
    LDA #$00                     ; $919E  A9 00
    STA $FD                      ; $91A0  85 FD

loc_1C_91A2:
    TXA                          ; $91A2  8A
    PHA                          ; $91A3  48
    JSR sub_1E_CC77              ; $91A4  20 77 CC
    JSR sub_1E_CA16              ; $91A7  20 16 CA
    JSR sub_1E_CB0C              ; $91AA  20 0C CB
    JSR sub_1E_C07F              ; $91AD  20 7F C0
    PLA                          ; $91B0  68
    TAX                          ; $91B1  AA
    LDA $A9                      ; $91B2  A5 A9
    CMP #$01                     ; $91B4  C9 01
    BNE loc_1C_91BB              ; $91B6  D0 03
    JSR sub_1C_91FA              ; $91B8  20 FA 91

loc_1C_91BB:
    CLC                          ; $91BB  18
    LDA $04C0                    ; $91BC  AD C0 04
    ADC $9216,X                  ; $91BF  7D 16 92
    STA $04C0                    ; $91C2  8D C0 04
    LDA $04A0                    ; $91C5  AD A0 04
    ADC $9218,X                  ; $91C8  7D 18 92
    STA $04A0                    ; $91CB  8D A0 04
    LDA $F9                      ; $91CE  A5 F9
    ADC $921E,X                  ; $91D0  7D 1E 92
    STA $F9                      ; $91D3  85 F9
    CLC                          ; $91D5  18
    LDA $22                      ; $91D6  A5 22
    ADC $921A,X                  ; $91D8  7D 1A 92
    STA $22                      ; $91DB  85 22
    CLC                          ; $91DD  18
    LDA $39                      ; $91DE  A5 39
    ADC $9214,X                  ; $91E0  7D 14 92
    STA $39                      ; $91E3  85 39
    BMI loc_1C_91ED              ; $91E5  30 06
    CMP #$3C                     ; $91E7  C9 3C
    BEQ loc_1C_91ED              ; $91E9  F0 02
    BNE loc_1C_91A2              ; $91EB  D0 B5

loc_1C_91ED:
    LDA #$00                     ; $91ED  A9 00
    STA $21                      ; $91EF  85 21
    STA $22                      ; $91F1  85 22
    STA $04C0                    ; $91F3  8D C0 04
    JSR sub_1E_CC77              ; $91F6  20 77 CC
    RTS                          ; $91F9  60


sub_1C_91FA:
    LDA $0460                    ; $91FA  AD 60 04
    STA $0462                    ; $91FD  8D 62 04
    LDA $0440                    ; $9200  AD 40 04
    STA $0442                    ; $9203  8D 42 04
    LDA $04A0                    ; $9206  AD A0 04
    STA $04A2                    ; $9209  8D A2 04
    LDA #$00                     ; $920C  A9 00
    STA $0682                    ; $920E  8D 82 06
    RTS                          ; $9211  60

    .byte $3B,$00,$FF,$01,$BF,$41,$03,$FC,$FC,$04,$EF,$00,$00,$FF  ; $9212

sub_1C_9220:
    LDX #$00                     ; $9220  A2 00
    LDA $A9                      ; $9222  A5 A9
    CMP #$06                     ; $9224  C9 06
    BEQ loc_1C_922C              ; $9226  F0 04
    CMP #$01                     ; $9228  C9 01
    BNE loc_1C_922F              ; $922A  D0 03

loc_1C_922C:
    LDX $0422                    ; $922C  AE 22 04

loc_1C_922F:
    TXA                          ; $922F  8A
    PHA                          ; $9230  48
    LDA #$00                     ; $9231  A9 00
    LDX #$1F                     ; $9233  A2 1F

loc_1C_9235:
    STA $0420,X                  ; $9235  9D 20 04
    DEX                          ; $9238  CA
    BNE loc_1C_9235              ; $9239  D0 FA
    STA $05A0                    ; $923B  8D A0 05
    STA $05A1                    ; $923E  8D A1 05
    STA $05A2                    ; $9241  8D A2 05
    PLA                          ; $9244  68
    STA $0422                    ; $9245  8D 22 04
    LDX #$0F                     ; $9248  A2 0F

loc_1C_924A:
    LDA #$FF                     ; $924A  A9 FF
    STA $0100,X                  ; $924C  9D 00 01
    STA $0130,X                  ; $924F  9D 30 01
    LDA #$00                     ; $9252  A9 00
    STA $0160,X                  ; $9254  9D 60 01
    DEX                          ; $9257  CA
    BPL loc_1C_924A              ; $9258  10 F0
    RTS                          ; $925A  60


sub_1C_925B:
    SEC                          ; $925B  38
    LDA $0460                    ; $925C  AD 60 04
    SBC $1F                      ; $925F  E5 1F
    STA $2D                      ; $9261  85 2D
    LDA $AA                      ; $9263  A5 AA
    BEQ loc_1C_926B              ; $9265  F0 04
    CMP #$04                     ; $9267  C9 04
    BNE loc_1C_92A2              ; $9269  D0 37

loc_1C_926B:
    LDX #$10                     ; $926B  A2 10
    STX $2B                      ; $926D  86 2B

loc_1C_926F:
    LDA $0420,X                  ; $926F  BD 20 04
    BPL loc_1C_9299              ; $9272  10 25
    SEC                          ; $9274  38
    LDA $0460,X                  ; $9275  BD 60 04
    SBC $1F                      ; $9278  E5 1F
    STA $2E                      ; $927A  85 2E
    LDA $0440,X                  ; $927C  BD 40 04
    SBC $20                      ; $927F  E5 20
    STA $2F                      ; $9281  85 2F
    LDY $0400,X                  ; $9283  BC 00 04
    LDA $92F0,Y                  ; $9286  B9 F0 92
    STA $08                      ; $9289  85 08
    LDA $9370,Y                  ; $928B  B9 70 93
    STA $09                      ; $928E  85 09
    LDA #$92                     ; $9290  A9 92
    PHA                          ; $9292  48
    LDA #$98                     ; $9293  A9 98
    PHA                          ; $9295  48
    JMP ($0008)                  ; $9296  6C 08 00


loc_1C_9299:
    INC $2B                      ; $9299  E6 2B
    LDX $2B                      ; $929B  A6 2B
    CPX #$20                     ; $929D  E0 20
    BNE loc_1C_926F              ; $929F  D0 CE
    RTS                          ; $92A1  60


loc_1C_92A2:
    LDX #$10                     ; $92A2  A2 10
    STX $2B                      ; $92A4  86 2B

loc_1C_92A6:
    LDA $0420,X                  ; $92A6  BD 20 04
    BPL loc_1C_92E7              ; $92A9  10 3C
    SEC                          ; $92AB  38
    LDA $0460,X                  ; $92AC  BD 60 04
    SBC $1F                      ; $92AF  E5 1F
    STA $2E                      ; $92B1  85 2E
    LDA $0440,X                  ; $92B3  BD 40 04
    SBC $20                      ; $92B6  E5 20
    STA $2F                      ; $92B8  85 2F
    LDA #$92                     ; $92BA  A9 92
    PHA                          ; $92BC  48
    LDA #$E6                     ; $92BD  A9 E6
    PHA                          ; $92BF  48
    LDY $0400,X                  ; $92C0  BC 00 04
    LDA $93F0,Y                  ; $92C3  B9 F0 93
    BNE loc_1C_92D8              ; $92C6  D0 10
    LDY $0400,X                  ; $92C8  BC 00 04
    LDA $92F0,Y                  ; $92CB  B9 F0 92
    STA $08                      ; $92CE  85 08
    LDA $9370,Y                  ; $92D0  B9 70 93
    STA $09                      ; $92D3  85 09
    JMP ($0008)                  ; $92D5  6C 08 00


loc_1C_92D8:
    TAY                          ; $92D8  A8
    DEY                          ; $92D9  88
    LDA $9470,Y                  ; $92DA  B9 70 94
    STA $08                      ; $92DD  85 08
    LDA $947F,Y                  ; $92DF  B9 7F 94
    STA $09                      ; $92E2  85 09
    JMP ($0008)                  ; $92E4  6C 08 00


loc_1C_92E7:
    INC $2B                      ; $92E7  E6 2B
    LDX $2B                      ; $92E9  A6 2B
    CPX #$20                     ; $92EB  E0 20
    BNE loc_1C_92A6              ; $92ED  D0 B7
    RTS                          ; $92EF  60

    .byte $8D,$8D,$23,$55,$D7,$4E,$71,$75,$E5,$6F,$76,$2B,$2F,$8F,$2B,$E3  ; $92F0
    .byte $43,$65,$73,$5B,$90,$CE,$81,$22,$2B,$D1,$36,$54,$69,$F4,$ED,$46  ; $9300
    .byte $7E,$85,$A6,$C2,$2B,$5A,$AB,$B8,$C5,$2A,$F1,$0D,$2E,$D7,$D7,$D3  ; $9310
    .byte $F2,$EA,$C3,$EC,$4E,$2B,$89,$A4,$12,$8F,$96,$2B,$30,$4C,$A3,$2B  ; $9320
    .byte $49,$49,$81,$81,$A1,$E0,$1B,$FA,$8A,$97,$0B,$12,$12,$2B,$F0,$21  ; $9330
    .byte $96,$D0,$5C,$69,$6D,$71,$E5,$D7,$41,$E3,$2B,$20,$2B,$4B,$67,$2B  ; $9340
    .byte $2B,$2B,$18,$55,$91,$7A,$B7,$CE,$2B,$FE,$32,$EF,$2B,$25,$2B,$2B  ; $9350
    .byte $98,$AD,$30,$30,$79,$A9,$A9,$B1,$A9,$B1,$A9,$A9,$08,$08,$08,$24  ; $9360
    .byte $94,$94,$95,$95,$95,$96,$96,$96,$96,$97,$97,$98,$98,$98,$98,$98  ; $9370
    .byte $9A,$9A,$9A,$9C,$9C,$9D,$9E,$9F,$98,$9F,$A1,$A1,$A1,$A2,$A3,$A4  ; $9380
    .byte $A4,$A4,$A4,$A4,$98,$A5,$A5,$A5,$A5,$A6,$A6,$A7,$A7,$A7,$A7,$A7  ; $9390
    .byte $A7,$A8,$A9,$A9,$AA,$98,$AB,$AB,$AC,$AC,$AC,$98,$AD,$AD,$AD,$98  ; $93A0
    .byte $AE,$AE,$AF,$AF,$AF,$AF,$B0,$B0,$B1,$B1,$B2,$B2,$B2,$98,$B2,$B4  ; $93B0
    .byte $B4,$B4,$B5,$B5,$B5,$B5,$B5,$A7,$B6,$B6,$98,$B7,$98,$B7,$B7,$98  ; $93C0
    .byte $98,$98,$B8,$B8,$B8,$B9,$B9,$B9,$98,$B9,$BA,$BA,$98,$BB,$98,$98  ; $93D0
    .byte $BB,$BB,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BD,$BD,$BD,$BD  ; $93E0
    .byte $01,$02,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$01,$00,$02  ; $93F0
    .byte $02,$02,$03,$04,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$01  ; $9400
    .byte $00,$01,$01,$08,$01,$00,$00,$00,$00,$01,$01,$01,$01,$00,$02,$00  ; $9410
    .byte $01,$01,$01,$01,$01,$01,$01,$00,$01,$00,$01,$01,$01,$01,$05,$01  ; $9420
    .byte $06,$07,$00,$00,$01,$01,$01,$00,$01,$01,$00,$01,$01,$01,$01,$01  ; $9430
    .byte $01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01  ; $9440
    .byte $01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00  ; $9450
    .byte $00,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; $9460
    .byte $B3,$AF,$D8,$F1,$0A,$23,$23,$7C,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$EF  ; $9470
    .byte $EF,$ED,$ED,$EE,$EE,$EE,$EE,$EE,$EE,$E6,$EE,$EE,$EE,$BD,$E0,$04  ; $9480
    .byte $D0,$6F,$9D,$80,$06,$BD,$10,$01,$D0,$42,$A9,$01,$9D,$10,$01,$A9  ; $9490
    .byte $14,$9D,$E0,$04,$A9,$05,$9D,$A0,$06,$A5,$4A,$29,$03,$F0,$10,$A9  ; $94A0
    .byte $02,$85,$09,$A9,$0C,$85,$08,$20,$97,$F1,$A6,$2B,$4C,$01,$95,$20  ; $94B0
    .byte $EE,$EF,$AD,$01,$DA,$9D,$00,$06,$AD,$02,$DA,$9D,$20,$06,$AD,$21  ; $94C0
    .byte $DA,$9D,$40,$06,$AD,$22,$DA,$9D,$60,$06,$D0,$25,$A9,$00,$9D,$A0  ; $94D0
    .byte $06,$9D,$10,$01,$A5,$4A,$29,$01,$A8,$B9,$21,$95,$9D,$E0,$04,$A9  ; $94E0
    .byte $00,$9D,$20,$06,$9D,$00,$06,$A9,$3C,$9D,$60,$06,$A9,$FF,$9D,$40  ; $94F0
    .byte $06,$DE,$E0,$04,$BD,$A0,$06,$C9,$04,$90,$12,$D0,$07,$A9,$00,$9D  ; $9500
    .byte $A0,$06,$F0,$09,$C9,$07,$D0,$05,$A9,$00,$9D,$80,$06,$20,$BA,$EE  ; $9510
    .byte $60,$19,$4A,$BD,$E0,$04,$D0,$26,$A0,$0F,$A9,$02,$85,$01,$A9,$01  ; $9520
    .byte $85,$00,$20,$14,$F0,$B0,$09,$C6,$01,$F0,$0E,$88,$D0,$F4,$D0,$09  ; $9530
    .byte $A9,$01,$20,$59,$F1,$A9,$31,$D0,$02,$A9,$62,$9D,$E0,$04,$DE,$E0  ; $9540
    .byte $04,$20,$AF,$EF,$60,$BD,$20,$06,$D0,$08,$A9,$03,$20,$B5,$95,$90  ; $9550
    .byte $01,$60,$AD,$60,$04,$9D,$60,$04,$AD,$40,$04,$9D,$40,$04,$BD,$E0  ; $9560
    .byte $04,$D0,$35,$A9,$03,$85,$01,$A9,$04,$20,$CF,$96,$B0,$25,$A9,$04  ; $9570
    .byte $20,$59,$F1,$B0,$1E,$BD,$10,$01,$29,$01,$AA,$18,$B9,$70,$04,$7D  ; $9580
    .byte $B1,$95,$99,$70,$04,$B9,$50,$04,$7D,$B3,$95,$99,$50,$04,$A6,$2B  ; $9590
    .byte $FE,$10,$01,$A9,$4B,$9D,$E0,$04,$DE,$E0,$04,$A0,$17,$20,$8D,$99  ; $95A0
    .byte $60,$50,$C8,$00,$FF  ; $95B0

sub_1C_95B5:
    STA $00                      ; $95B5  85 00
    LDY #$0F                     ; $95B7  A0 0F

loc_1C_95B9:
    JSR sub_1F_F014              ; $95B9  20 14 F0
    BCS loc_1C_95D0              ; $95BC  B0 12
    LDA $0630,Y                  ; $95BE  B9 30 06
    BEQ loc_1C_95CD              ; $95C1  F0 0A
    LSR $0420,X                  ; $95C3  5E 20 04
    LDA #$00                     ; $95C6  A9 00
    STA $00F0,X                  ; $95C8  9D F0 00
    SEC                          ; $95CB  38
    RTS                          ; $95CC  60


loc_1C_95CD:
    DEY                          ; $95CD  88
    BNE loc_1C_95B9              ; $95CE  D0 E9

loc_1C_95D0:
    LDA #$01                     ; $95D0  A9 01
    STA $0620,X                  ; $95D2  9D 20 06
    CLC                          ; $95D5  18
    RTS                          ; $95D6  60

    .byte $BD,$20,$06,$D0,$12,$38,$AD,$A0,$04,$FD,$A0,$04,$C9,$03,$90,$04  ; $95D7
    .byte $C9,$FE,$90,$4F,$20,$EE,$EF,$BD,$E0,$04,$D0,$44,$A9,$0B,$9D,$E0  ; $95E7
    .byte $04,$BD,$10,$01,$48,$29,$07,$A8,$A9,$00,$9D,$00,$06,$9D,$40,$06  ; $95F7
    .byte $B9,$3E,$96,$9D,$20,$06,$B9,$46,$96,$9D,$60,$06,$68,$48,$C9,$04  ; $9607
    .byte $90,$15,$C9,$0C,$B0,$11,$BD,$60,$06,$49,$FF,$69,$01,$9D,$60,$06  ; $9617
    .byte $A9,$FF,$69,$00,$9D,$40,$06,$68,$18,$69,$01,$29,$0F,$9D,$10,$01  ; $9627
    .byte $DE,$E0,$04,$20,$BA,$EE,$60,$17,$5E,$AD,$E3,$E3,$AD,$5E,$17,$F5  ; $9637
    .byte $E3,$AD,$5E,$5E,$AD,$E3,$F5,$A9,$03,$85,$00  ; $9647

loc_1C_9652:
    LDY #$0F                     ; $9652  A0 0F

loc_1C_9654:
    JSR sub_1F_F014              ; $9654  20 14 F0
    BCS loc_1C_9666              ; $9657  B0 0D
    LDA #$00                     ; $9659  A9 00
    STA $0430,Y                  ; $965B  99 30 04
    LDA #$FF                     ; $965E  A9 FF
    STA $0100,Y                  ; $9660  99 00 01
    DEY                          ; $9663  88
    BPL loc_1C_9654              ; $9664  10 EE

loc_1C_9666:
    LDA #$00                     ; $9666  A9 00
    STA $0420,X                  ; $9668  9D 20 04
    LDA #$FF                     ; $966B  A9 FF
    STA $00F0,X                  ; $966D  9D F0 00
    RTS                          ; $9670  60

    JSR sub_1F_EFB3              ; $9671  20 B3 EF
    RTS                          ; $9674  60

    .byte $BD,$20,$06,$D0,$08,$A9,$07,$20,$B5,$95,$90,$01,$60,$AD,$60,$04  ; $9675
    .byte $9D,$60,$04,$AD,$40,$04,$9D,$40,$04,$BD,$E0,$04,$D0,$34,$A9,$02  ; $9685
    .byte $85,$01,$A9,$08,$20,$CF,$96,$B0,$24,$A9,$08,$20,$59,$F1,$B0,$1D  ; $9695
    .byte $BD,$10,$01,$29,$01,$AA,$B9,$70,$04,$7D,$CB,$96,$99,$70,$04,$B9  ; $96A5
    .byte $50,$04,$7D,$CD,$96,$99,$50,$04,$A6,$2B,$FE,$10,$01,$A9,$5D,$9D  ; $96B5
    .byte $E0,$04,$DE,$E0,$04,$60,$30,$E0,$00,$FF  ; $96C5

sub_1C_96CF:
    STA $00                      ; $96CF  85 00
    LDY #$0F                     ; $96D1  A0 0F

loc_1C_96D3:
    JSR sub_1F_F014              ; $96D3  20 14 F0
    BCS loc_1C_96E1              ; $96D6  B0 09
    DEC $01                      ; $96D8  C6 01
    BEQ loc_1C_96E3              ; $96DA  F0 07
    DEY                          ; $96DC  88
    BNE loc_1C_96D3              ; $96DD  D0 F4
    BEQ loc_1C_96E3              ; $96DF  F0 02

loc_1C_96E1:
    CLC                          ; $96E1  18
    RTS                          ; $96E2  60


loc_1C_96E3:
    SEC                          ; $96E3  38
    RTS                          ; $96E4  60

    .byte $A9,$0B,$85,$01,$A9,$08,$85,$02,$20,$2C,$F0,$BD,$E0,$04,$D0,$1E  ; $96E5
    .byte $A5,$00,$F0,$72,$FE,$E0,$04,$A9,$76,$9D,$60,$06,$A9,$03,$9D,$40  ; $96F5
    .byte $06,$BD,$20,$04,$09,$04,$9D,$20,$04,$20,$EE,$EF,$D0,$58,$C9,$03  ; $9705
    .byte $F0,$3B,$A5,$00,$F0,$50,$BD,$E0,$04,$C9,$02,$F0,$0F,$A9,$00,$9D  ; $9715
    .byte $60,$06,$A9,$02,$9D,$40,$06,$FE,$E0,$04,$D0,$3A,$A9,$C0,$9D,$60  ; $9725
    .byte $06,$A9,$FF,$9D,$40,$06,$A9,$00,$9D,$00,$06,$A9,$A3,$9D,$20,$06  ; $9735
    .byte $FE,$E0,$04,$BD,$20,$04,$29,$FB,$9D,$20,$04,$D0,$19,$A9,$0C,$A5  ; $9745
    .byte $00,$D0,$13,$A9,$00,$9D,$E0,$04,$9D,$20,$06,$9D,$00,$06,$BD,$20  ; $9755
    .byte $04,$09,$04,$9D,$20,$04,$20,$BA,$EE,$60,$A9,$07,$85,$00,$4C,$52  ; $9765
    .byte $96,$BD,$E0,$04,$D0,$48,$A9,$0C,$85,$02,$BD,$A0,$06,$C9,$02,$90  ; $9775
    .byte $05,$A9,$00,$9D,$A0,$06,$BD,$C0,$06,$C9,$14,$F0,$41,$A9,$0B,$20  ; $9785
    .byte $59,$F1,$B9,$30,$04,$09,$04,$49,$40,$99,$30,$04,$18,$BD,$A0,$04  ; $9795
    .byte $69,$08,$9D,$A0,$04,$A9,$01,$9D,$00,$06,$A9,$47,$9D,$20,$06,$A9  ; $97A5
    .byte $03,$9D,$E0,$06,$A9,$03,$9D,$A0,$06,$FE,$E0,$04,$D0,$10,$A9,$04  ; $97B5
    .byte $85,$02,$BD,$A0,$06,$C9,$05,$90,$05,$A9,$03,$9D,$A0,$06,$BD,$20  ; $97C5
    .byte $04,$29,$40,$F0,$10,$18,$BD,$60,$04,$69,$0C,$85,$08,$BD,$40,$04  ; $97D5
    .byte $69,$00,$4C,$F7,$97,$38,$BD,$60,$04,$E9,$0C,$85,$08,$BD,$40,$04  ; $97E5
    .byte $E9,$00,$85,$09,$BD,$A0,$04,$85,$0A,$A9,$00,$85,$0B,$20,$C3,$CB  ; $97F5
    .byte $A6,$2B,$A5,$00,$29,$01,$D0,$12,$18,$A5,$0A,$65,$02,$85,$0A,$20  ; $9805
    .byte $C3,$CB,$A6,$2B,$A5,$00,$29,$01,$D0,$08,$BD,$20,$04,$49,$40,$9D  ; $9815
    .byte $20,$04,$20,$BA,$EE,$60  ; $9825
    JSR sub_1F_EEBA              ; $982B  20 BA EE
    RTS                          ; $982E  60

    LDA $06A0,X                  ; $982F  BD A0 06
    CMP #$09                     ; $9832  C9 09
    BCS loc_1C_984E              ; $9834  B0 18
    LDA #$01                     ; $9836  A9 01
    STA $01                      ; $9838  85 01
    LDA #$0D                     ; $983A  A9 0D
    JSR sub_1C_96CF              ; $983C  20 CF 96
    BCS loc_1C_9876              ; $983F  B0 35
    LDA #$09                     ; $9841  A9 09
    STA $06A0,X                  ; $9843  9D A0 06
    LDA #$00                     ; $9846  A9 00
    STA $0680,X                  ; $9848  9D 80 06
    JSR sub_1C_9882              ; $984B  20 82 98

loc_1C_984E:
    CMP #$0A                     ; $984E  C9 0A
    BNE sub_1C_9882              ; $9850  D0 30
    LDA $0680,X                  ; $9852  BD 80 06
    BNE sub_1C_9882              ; $9855  D0 2B
    LDA #$02                     ; $9857  A9 02
    STA $01                      ; $9859  85 01

loc_1C_985B:
    LDA #$0D                     ; $985B  A9 0D
    JSR sub_1F_F159              ; $985D  20 59 F1
    BCS loc_1C_9876              ; $9860  B0 14
    LDX $01                      ; $9862  A6 01
    LDA $9889,X                  ; $9864  BD 89 98
    STA $0630,Y                  ; $9867  99 30 06
    LDA $988C,X                  ; $986A  BD 8C 98
    STA $0610,Y                  ; $986D  99 10 06
    LDX $2B                      ; $9870  A6 2B
    DEC $01                      ; $9872  C6 01
    BPL loc_1C_985B              ; $9874  10 E5

loc_1C_9876:
    LDA $06A0,X                  ; $9876  BD A0 06
    CMP #$08                     ; $9879  C9 08
    BNE sub_1C_9882              ; $987B  D0 05
    LDA #$00                     ; $987D  A9 00
    STA $06A0,X                  ; $987F  9D A0 06

sub_1C_9882:
    JSR sub_1F_EFEE              ; $9882  20 EE EF
    JSR sub_1F_EFB3              ; $9885  20 B3 EF
    RTS                          ; $9888  60

    .byte $15,$8D,$A2,$04,$02,$01  ; $9889
    LDA #$00                     ; $988F  A9 00
    STA $0680,X                  ; $9891  9D 80 06
    LDA #$03                     ; $9894  A9 03
    STA $01                      ; $9896  85 01
    LDA #$04                     ; $9898  A9 04
    STA $02                      ; $989A  85 02
    JSR sub_1F_F0CF              ; $989C  20 CF F0
    LDA $0110,X                  ; $989F  BD 10 01
    BNE loc_1C_98BD              ; $98A2  D0 19
    LDA $00                      ; $98A4  A5 00
    BEQ loc_1C_98DF              ; $98A6  F0 37
    LDA #$3E                     ; $98A8  A9 3E
    STA $04E0,X                  ; $98AA  9D E0 04
    INC $06A0,X                  ; $98AD  FE A0 06
    LDA #$00                     ; $98B0  A9 00
    STA $0620,X                  ; $98B2  9D 20 06
    STA $0600,X                  ; $98B5  9D 00 06
    INC $0110,X                  ; $98B8  FE 10 01
    BNE loc_1C_98DF              ; $98BB  D0 22

loc_1C_98BD:
    DEC $04E0,X                  ; $98BD  DE E0 04
    BNE loc_1C_98DF              ; $98C0  D0 1D
    DEC $06A0,X                  ; $98C2  DE A0 06
    DEC $0110,X                  ; $98C5  DE 10 01
    JSR sub_1F_EFEE              ; $98C8  20 EE EF
    LDA #$A2                     ; $98CB  A9 A2
    STA $0620,X                  ; $98CD  9D 20 06
    LDA #$01                     ; $98D0  A9 01
    STA $0600,X                  ; $98D2  9D 00 06
    LDA #$E6                     ; $98D5  A9 E6
    STA $0620,X                  ; $98D7  9D 20 06
    LDA #$04                     ; $98DA  A9 04
    STA $0640,X                  ; $98DC  9D 40 06

loc_1C_98DF:
    JSR sub_1F_EEBA              ; $98DF  20 BA EE
    RTS                          ; $98E2  60

    .byte $BD,$20,$06,$D0,$68,$BD,$E0,$04,$F0,$0C,$A0,$02,$DD,$C0,$06,$F0  ; $98E3
    .byte $02,$A0,$05,$20,$8D,$99,$BD,$C0,$06,$9D,$E0,$04,$BD,$40,$04,$9D  ; $98F3
    .byte $60,$06,$20,$AF,$EF,$BD,$C0,$06,$D0,$42,$A9,$A0,$9D,$20,$04,$A9  ; $9903
    .byte $0F,$9D,$00,$04,$A2,$01,$86,$01,$BD,$FF,$99,$20,$10,$F0,$B0,$0A  ; $9913
    .byte $A9,$00,$99,$30,$04,$A9,$FF,$99,$20,$01,$A6,$01,$CA,$10,$E7,$A6  ; $9923
    .byte $2B,$BC,$10,$01,$A9,$00,$99,$3F,$01,$99,$41,$01,$99,$3E,$01,$99  ; $9933
    .byte $42,$01,$A9,$0E,$9D,$20,$06,$A9,$06,$9D,$00,$06,$60,$DE,$00,$06  ; $9943
    .byte $08,$BD,$20,$06,$C9,$05,$90,$0D,$A0,$02,$28,$F0,$04,$20,$8D,$99  ; $9953
    .byte $60,$A0,$05,$D0,$0A,$28,$D0,$21,$BC,$20,$06,$B9,$00,$9A,$A8,$A9  ; $9963
    .byte $09,$9D,$00,$06,$20,$8D,$99,$BD,$20,$06,$C9,$06,$B0,$03,$20,$A5  ; $9973
    .byte $99,$DE,$20,$06,$D0,$03,$5E,$20,$04,$60,$A2,$02,$B9,$F9,$99,$9D  ; $9983
    .byte $5F,$03,$9D,$7F,$03,$9D,$8F,$03,$9D,$9F,$03,$88,$CA,$10,$ED,$A6  ; $9993
    .byte $2B,$60,$A9,$04,$85,$01,$BD,$20,$06,$0A,$0A,$7D,$20,$06,$85,$02  ; $99A3
    .byte $BD,$60,$06,$85,$03,$A9,$06,$20,$59,$F1,$B0,$32,$A6,$02,$BD,$25  ; $99B3
    .byte $9A,$99,$B0,$04,$A5,$03,$99,$50,$04,$C9,$09,$08,$BD,$0C,$9A,$28  ; $99C3
    .byte $F0,$03,$38,$E9,$20,$99,$70,$04,$38,$E5,$1F,$A5,$03,$E5,$20,$F0  ; $99D3
    .byte $05,$A9,$00,$99,$30,$04,$A6,$2B,$E6,$02,$C6,$01,$10,$C7,$A6,$2B  ; $99E3
    .byte $A9,$2B,$20,$51,$C0,$60,$20,$15,$0F,$20,$20,$0F,$10,$02,$17,$14  ; $99F3
    .byte $11,$0E,$31,$14,$0F,$21,$13,$01,$11,$11,$01,$11,$11,$11,$68,$78  ; $9A03
    .byte $88,$88,$A8,$68,$78,$98,$98,$B8,$68,$78,$98,$98,$A8,$58,$68,$88  ; $9A13
    .byte $A8,$B8,$68,$78,$78,$88,$A8,$B8,$A8,$88,$B8,$B8,$A8,$B8,$98,$B8  ; $9A23
    .byte $A8,$98,$B8,$98,$B8,$A8,$B8,$88,$98,$88,$B8,$B8,$88,$A8,$A8,$98  ; $9A33
    .byte $BD,$E0,$04,$D0,$0A,$A9,$01,$9D,$A0,$06,$A9,$70,$9D,$E0,$04,$BD  ; $9A43
    .byte $A0,$06,$C9,$04,$90,$05,$A9,$00,$9D,$80,$06,$DE,$E0,$04,$20,$AF  ; $9A53
    .byte $EF,$60,$A0,$02,$20,$8D,$99,$A9,$FF,$9D,$20,$01,$5E,$20,$04,$60  ; $9A63
    .byte $A9,$14,$9D,$50,$01,$38,$BD,$40,$04,$E9,$04,$A4,$2A,$C0,$07,$F0  ; $9A73
    .byte $06,$38,$BD,$40,$04,$E9,$1B,$85,$00,$A8,$B9,$25,$9B,$85,$01,$18  ; $9A83
    .byte $7D,$E0,$04,$A8,$A5,$00,$C9,$03,$B0,$0B,$B9,$43,$9B,$85,$02,$B9  ; $9A93
    .byte $44,$9B,$4C,$B0,$9A,$B9,$BB,$9B,$85,$02,$B9,$BC,$9B,$29,$01,$D0  ; $9AA3
    .byte $09,$BD,$A0,$04,$C5,$02,$F0,$09,$D0,$2A,$BD,$60,$04,$C5,$02,$D0  ; $9AB3
    .byte $23,$A9,$00,$9D,$80,$04,$9D,$C0,$04,$C8,$C8,$FE,$E0,$04,$FE,$E0  ; $9AC3
    .byte $04,$BD,$E0,$04,$A6,$00,$DD,$3C,$9B,$D0,$09,$A6,$2B,$A9,$00,$9D  ; $9AD3
    .byte $E0,$04,$A4,$01,$A6,$00,$E0,$03,$B0,$06,$B9,$44,$9B,$4C,$F6,$9A  ; $9AE3
    .byte $B9,$BC,$9B,$A6,$2B,$A8,$B9,$2C,$9B,$9D,$60,$06,$B9,$30,$9B,$9D  ; $9AF3
    .byte $40,$06,$B9,$34,$9B,$9D,$20,$06,$B9,$38,$9B,$9D,$20,$04,$20,$BA  ; $9B03
    .byte $EE,$90,$05,$A9,$00,$9D,$50,$01,$38,$BD,$A0,$04,$E9,$04,$9D,$60  ; $9B13
    .byte $01,$60,$00,$08,$24,$00,$44,$5C,$8C,$1B,$00,$E5,$00,$FF,$00,$00  ; $9B23
    .byte $00,$00,$E5,$00,$E5,$80,$80,$C0,$C0,$08,$1C,$54,$44,$18,$30,$14  ; $9B33
    .byte $A0,$00,$28,$01,$40,$02,$D8,$03,$A0,$00,$68,$01,$80,$02,$98,$03  ; $9B43
    .byte $60,$02,$B8,$03,$40,$02,$88,$01,$60,$00,$28,$01,$40,$02,$68,$03  ; $9B53
    .byte $20,$02,$D8,$03,$A0,$00,$28,$01,$90,$02,$C8,$03,$30,$02,$A8,$01  ; $9B63
    .byte $40,$00,$B8,$03,$50,$00,$A8,$01,$60,$00,$B8,$03,$70,$00,$A8,$01  ; $9B73
    .byte $80,$00,$88,$01,$70,$02,$98,$03,$60,$02,$88,$01,$50,$02,$98,$03  ; $9B83
    .byte $40,$02,$88,$01,$30,$02,$78,$01,$80,$00,$38,$01,$70,$02,$68,$03  ; $9B93
    .byte $60,$02,$38,$01,$50,$02,$68,$03,$40,$02,$28,$01,$70,$00,$18,$01  ; $9BA3
    .byte $30,$02,$68,$03,$20,$02,$D8,$03,$A0,$00,$B8,$01,$50,$02,$E8,$03  ; $9BB3
    .byte $40,$02,$C8,$01,$20,$02,$88,$01,$30,$00,$A8,$03,$60,$00,$88,$01  ; $9BC3
    .byte $70,$00,$A8,$03,$B0,$00,$78,$01,$50,$02,$98,$03,$40,$02,$58,$01  ; $9BD3
    .byte $30,$02,$78,$03,$20,$02,$38,$01,$60,$00,$48,$03,$50,$02,$68,$03  ; $9BE3
    .byte $70,$00,$48,$01,$C0,$00,$C8,$03,$80,$02,$D8,$03,$C0,$00,$18,$01  ; $9BF3
    .byte $90,$02,$38,$03,$B0,$00,$58,$03,$C0,$00,$C8,$03,$70,$02,$88,$01  ; $9C03
    .byte $20,$02,$48,$01,$90,$00,$18,$01,$60,$02,$28,$03,$B0,$00,$B8,$03  ; $9C13
    .byte $C0,$00,$E8,$03,$40,$02,$C8,$01,$30,$02,$98,$01,$40,$00,$B8,$03  ; $9C23
    .byte $50,$00,$D8,$03,$B0,$00,$C8,$01,$60,$02,$58,$01,$30,$02,$28,$01  ; $9C33
    .byte $40,$00,$38,$03,$80,$00,$38,$01,$60,$02,$48,$03,$A0,$00,$88,$03  ; $9C43
    .byte $C0,$00,$D8,$03,$50,$02,$58,$01,$A9,$18,$9D,$50,$01,$BD,$20,$04  ; $9C53
    .byte $29,$04,$D0,$0D,$BD,$E0,$04,$C9,$06,$B0,$06,$20,$B3,$EF,$4C,$7F  ; $9C63
    .byte $9C,$BD,$20,$04,$09,$04,$9D,$20,$04,$20,$BA,$EE,$90,$05,$A9,$00  ; $9C73
    .byte $9D,$50,$01,$38,$BD,$A0,$04,$E9,$08,$9D,$60,$01,$60  ; $9C83
    SEC                          ; $9C90  38
    LDA $0440,X                  ; $9C91  BD 40 04
    SBC #$03                     ; $9C94  E9 03
    TAY                          ; $9C96  A8
    LDA $9CDE,Y                  ; $9C97  B9 DE 9C
    STA $02                      ; $9C9A  85 02
    LDA $9CEE,Y                  ; $9C9C  B9 EE 9C
    STA $01                      ; $9C9F  85 01

loc_1C_9CA1:
    LDA #$15                     ; $9CA1  A9 15
    JSR sub_1F_F159              ; $9CA3  20 59 F1
    LDX $01                      ; $9CA6  A6 01
    LDA $9CFE,X                  ; $9CA8  BD FE 9C
    STA $0430,Y                  ; $9CAB  99 30 04
    AND #$40                     ; $9CAE  29 40
    BNE loc_1C_9CB6              ; $9CB0  D0 04
    LDA #$FC                     ; $9CB2  A9 FC
    BNE loc_1C_9CB8              ; $9CB4  D0 02

loc_1C_9CB6:
    LDA #$04                     ; $9CB6  A9 04

loc_1C_9CB8:
    STA $0470,Y                  ; $9CB8  99 70 04
    LDA $9D32,X                  ; $9CBB  BD 32 9D
    STA $04B0,Y                  ; $9CBE  99 B0 04
    LDA $9D66,X                  ; $9CC1  BD 66 9D
    STA $0120,Y                  ; $9CC4  99 20 01
    LDA $9D9A,X                  ; $9CC7  BD 9A 9D
    STA $04F0,Y                  ; $9CCA  99 F0 04
    LDX $2B                      ; $9CCD  A6 2B
    INC $01                      ; $9CCF  E6 01
    DEC $02                      ; $9CD1  C6 02
    BNE loc_1C_9CA1              ; $9CD3  D0 CC
    LSR $0420,X                  ; $9CD5  5E 20 04
    LDA #$00                     ; $9CD8  A9 00
    STA $00F0,X                  ; $9CDA  9D F0 00
    RTS                          ; $9CDD  60

    .byte $02,$03,$04,$00,$00,$00,$00,$00,$00,$0C,$0A,$05,$05,$02,$05,$04  ; $9CDE
    .byte $00,$02,$05,$09,$09,$09,$09,$09,$09,$09,$15,$1F,$24,$29,$2B,$30  ; $9CEE
    .byte $E1,$A1,$E1,$A1,$A1,$E1,$A1,$E1,$A1,$E1,$A1,$E1,$A1,$E1,$A1,$E1  ; $9CFE
    .byte $A1,$E1,$A1,$E1,$A1,$E1,$A1,$E1,$A1,$E1,$A1,$E1,$A1,$E1,$A1,$E1  ; $9D0E
    .byte $A1,$E1,$A1,$A1,$A1,$A1,$E1,$E1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$E1  ; $9D1E
    .byte $A1,$A1,$E1,$A1,$47,$77,$57,$87,$C7,$47,$67,$87,$C7,$17,$17,$37  ; $9D2E
    .byte $37,$57,$57,$77,$77,$A7,$A7,$B7,$B7,$37,$37,$57,$57,$77,$77,$97  ; $9D3E
    .byte $97,$B7,$B7,$17,$17,$27,$27,$A7,$17,$37,$67,$87,$A7,$67,$B7,$27  ; $9D4E
    .byte $47,$67,$77,$A7,$17,$27,$67,$A7,$FF,$00,$FF,$00,$00,$FF,$A0,$60  ; $9D5E
    .byte $60,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80  ; $9D6E
    .byte $80,$60,$A0,$80,$80,$80,$80,$80,$80,$80,$80,$00,$00,$00,$FF,$FF  ; $9D7E
    .byte $00,$00,$00,$00,$00,$80,$00,$70,$00,$00,$FF,$20,$01,$1F,$01,$1F  ; $9D8E
    .byte $3E,$01,$1F,$3E,$5D,$01,$01,$1F,$1F,$3E,$3E,$5D,$5D,$7C,$7C,$9D  ; $9D9E
    .byte $9D,$01,$01,$1F,$1F,$3E,$3E,$5D,$5D,$7C,$7C,$01,$01,$1F,$1F,$3E  ; $9DAE
    .byte $01,$1F,$3E,$5D,$7C,$01,$1F,$01,$1F,$3E,$5D,$7C,$01,$1F,$3E,$5D  ; $9DBE
    LDA $04E0,X                  ; $9DCE  BD E0 04
    BEQ loc_1C_9DE6              ; $9DD1  F0 13
    DEC $04E0,X                  ; $9DD3  DE E0 04
    BEQ loc_1C_9DD9              ; $9DD6  F0 01
    RTS                          ; $9DD8  60


loc_1C_9DD9:
    LDA $0420,X                  ; $9DD9  BD 20 04
    AND #$DF                     ; $9DDC  29 DF
    STA $0420,X                  ; $9DDE  9D 20 04
    LDA #$27                     ; $9DE1  A9 27
    JSR sub_1E_C051              ; $9DE3  20 51 C0

loc_1C_9DE6:
    LDA $0420,X                  ; $9DE6  BD 20 04
    AND #$20                     ; $9DE9  29 20
    BNE loc_1C_9E4B              ; $9DEB  D0 5E
    LDA $0420,X                  ; $9DED  BD 20 04
    AND #$40                     ; $9DF0  29 40
    BNE loc_1C_9DFE              ; $9DF2  D0 0A
    LDA $0460,X                  ; $9DF4  BD 60 04
    CMP $0110,X                  ; $9DF7  DD 10 01
    BCS loc_1C_9E16              ; $9DFA  B0 1A
    BCC loc_1C_9E06              ; $9DFC  90 08

loc_1C_9DFE:
    LDA $0460,X                  ; $9DFE  BD 60 04
    CMP $0110,X                  ; $9E01  DD 10 01
    BCC loc_1C_9E16              ; $9E04  90 10

loc_1C_9E06:
    LDA $0110,X                  ; $9E06  BD 10 01
    STA $0460,X                  ; $9E09  9D 60 04
    LDA $0420,X                  ; $9E0C  BD 20 04
    ORA #$20                     ; $9E0F  09 20
    STA $0420,X                  ; $9E11  9D 20 04
    BNE loc_1C_9E4B              ; $9E14  D0 35

loc_1C_9E16:
    LDA $0440,X                  ; $9E16  BD 40 04
    STA $09                      ; $9E19  85 09
    LDA $0460,X                  ; $9E1B  BD 60 04
    STA $08                      ; $9E1E  85 08
    LDA $04A0,X                  ; $9E20  BD A0 04
    AND #$F0                     ; $9E23  29 F0
    STA $0A                      ; $9E25  85 0A
    JSR sub_1E_C8EF              ; $9E27  20 EF C8
    LDY #$74                     ; $9E2A  A0 74
    LDA $03BC,X                  ; $9E2C  BD BC 03
    AND #$01                     ; $9E2F  29 01
    BEQ loc_1C_9E35              ; $9E31  F0 02
    LDY #$76                     ; $9E33  A0 76

loc_1C_9E35:
    TYA                          ; $9E35  98
    STA $03C2,X                  ; $9E36  9D C2 03
    INC $51                      ; $9E39  E6 51
    LDX $2B                      ; $9E3B  A6 2B
    JSR sub_1F_EEBA              ; $9E3D  20 BA EE
    BCC loc_1C_9E4B              ; $9E40  90 09
    LDA $0420,X                  ; $9E42  BD 20 04
    ASL A                        ; $9E45  0A
    ORA #$20                     ; $9E46  09 20
    STA $0420,X                  ; $9E48  9D 20 04

loc_1C_9E4B:
    LDA $4B                      ; $9E4B  A5 4B
    BNE loc_1C_9E80              ; $9E4D  D0 31
    SEC                          ; $9E4F  38
    LDA $04A0,X                  ; $9E50  BD A0 04
    SBC $04A0                    ; $9E53  ED A0 04
    BCS loc_1C_9E5C              ; $9E56  B0 04
    EOR #$FF                     ; $9E58  49 FF
    ADC #$01                     ; $9E5A  69 01

loc_1C_9E5C:
    CMP #$10                     ; $9E5C  C9 10
    BCS loc_1C_9E80              ; $9E5E  B0 20
    LDA $0420,X                  ; $9E60  BD 20 04
    AND #$40                     ; $9E63  29 40
    BNE loc_1C_9E71              ; $9E65  D0 0A
    LDA $0460,X                  ; $9E67  BD 60 04
    CMP $0460                    ; $9E6A  CD 60 04
    BCS loc_1C_9E80              ; $9E6D  B0 11
    BCC loc_1C_9E79              ; $9E6F  90 08

loc_1C_9E71:
    LDA $0460,X                  ; $9E71  BD 60 04
    CMP $0460                    ; $9E74  CD 60 04
    BCC loc_1C_9E80              ; $9E77  90 07

loc_1C_9E79:
    LDA #$00                     ; $9E79  A9 00
    STA $2C                      ; $9E7B  85 2C
    JMP loc_1E_C10B              ; $9E7D  4C 0B C1


loc_1C_9E80:
    RTS                          ; $9E80  60

    LDA $04E0,X                  ; $9E81  BD E0 04
    BNE loc_1C_9E9C              ; $9E84  D0 16
    LDA $4A                      ; $9E86  A5 4A
    EOR #$01                     ; $9E88  49 01
    STA $4A                      ; $9E8A  85 4A
    AND #$01                     ; $9E8C  29 01
    TAY                          ; $9E8E  A8
    LDA $9F20,Y                  ; $9E8F  B9 20 9F
    STA $04E0,X                  ; $9E92  9D E0 04
    LDA #$8B                     ; $9E95  A9 8B
    STA $0420,X                  ; $9E97  9D 20 04
    BNE loc_1C_9EAF              ; $9E9A  D0 13

loc_1C_9E9C:
    CMP #$01                     ; $9E9C  C9 01
    BEQ loc_1C_9EB3              ; $9E9E  F0 13
    CMP #$FF                     ; $9EA0  C9 FF
    BEQ loc_1C_9EEF              ; $9EA2  F0 4B
    DEC $04E0,X                  ; $9EA4  DE E0 04
    LDA #$00                     ; $9EA7  A9 00
    STA $06A0,X                  ; $9EA9  9D A0 06
    STA $0680,X                  ; $9EAC  9D 80 06

loc_1C_9EAF:
    JSR sub_1F_EFB3              ; $9EAF  20 B3 EF
    RTS                          ; $9EB2  60


loc_1C_9EB3:
    LDA $0420,X                  ; $9EB3  BD 20 04
    AND #$F7                     ; $9EB6  29 F7
    STA $0420,X                  ; $9EB8  9D 20 04
    LDA $06A0,X                  ; $9EBB  BD A0 06
    CMP #$08                     ; $9EBE  C9 08
    BNE loc_1C_9ED2              ; $9EC0  D0 10
    LDA #$05                     ; $9EC2  A9 05
    STA $06A0,X                  ; $9EC4  9D A0 06
    LDA #$00                     ; $9EC7  A9 00
    STA $09                      ; $9EC9  85 09
    LDA #$83                     ; $9ECB  A9 83
    STA $08                      ; $9ECD  85 08
    JSR sub_1F_F197              ; $9ECF  20 97 F1

loc_1C_9ED2:
    JSR sub_1F_EEBA              ; $9ED2  20 BA EE
    LDA $01                      ; $9ED5  A5 01
    BEQ loc_1C_9EEE              ; $9ED7  F0 15
    LDA #$00                     ; $9ED9  A9 00
    STA $0600,X                  ; $9EDB  9D 00 06
    STA $0620,X                  ; $9EDE  9D 20 06
    STA $0660,X                  ; $9EE1  9D 60 06
    LDA #$02                     ; $9EE4  A9 02
    STA $0640,X                  ; $9EE6  9D 40 06
    LDA #$FF                     ; $9EE9  A9 FF
    STA $04E0,X                  ; $9EEB  9D E0 04

loc_1C_9EEE:
    RTS                          ; $9EEE  60


loc_1C_9EEF:
    LDA $06A0,X                  ; $9EEF  BD A0 06
    CMP #$08                     ; $9EF2  C9 08
    BNE loc_1C_9EFB              ; $9EF4  D0 05
    LDA #$05                     ; $9EF6  A9 05
    STA $06A0,X                  ; $9EF8  9D A0 06

loc_1C_9EFB:
    LDA #$04                     ; $9EFB  A9 04
    STA $01                      ; $9EFD  85 01
    LDA #$08                     ; $9EFF  A9 08
    STA $02                      ; $9F01  85 02
    JSR sub_1F_F02C              ; $9F03  20 2C F0
    LDA $00                      ; $9F06  A5 00
    BEQ loc_1C_9F1C              ; $9F08  F0 12
    LDA #$00                     ; $9F0A  A9 00
    STA $0640,X                  ; $9F0C  9D 40 06
    STA $0660,X                  ; $9F0F  9D 60 06
    LDA #$8B                     ; $9F12  A9 8B
    STA $0420,X                  ; $9F14  9D 20 04
    LDA #$3E                     ; $9F17  A9 3E
    STA $04E0,X                  ; $9F19  9D E0 04

loc_1C_9F1C:
    JSR sub_1F_EEBA              ; $9F1C  20 BA EE
    RTS                          ; $9F1F  60

    .byte $3E,$9C  ; $9F20
    LDA $0640,X                  ; $9F22  BD 40 06
    STA $04                      ; $9F25  85 04
    LDA #$0C                     ; $9F27  A9 0C
    STA $01                      ; $9F29  85 01
    LDA #$10                     ; $9F2B  A9 10
    STA $02                      ; $9F2D  85 02
    JSR sub_1F_F0CF              ; $9F2F  20 CF F0
    LDA $0110,X                  ; $9F32  BD 10 01
    BNE loc_1C_9F56              ; $9F35  D0 1F
    LDA $04E0,X                  ; $9F37  BD E0 04
    BNE loc_1C_9FB5              ; $9F3A  D0 79
    LDA #$C0                     ; $9F3C  A9 C0
    STA $0620,X                  ; $9F3E  9D 20 06
    STA $0660,X                  ; $9F41  9D 60 06
    LDA #$04                     ; $9F44  A9 04
    STA $0640,X                  ; $9F46  9D 40 06
    STA $04                      ; $9F49  85 04
    JSR sub_1F_EFEE              ; $9F4B  20 EE EF
    INC $0110,X                  ; $9F4E  FE 10 01
    LDA #$01                     ; $9F51  A9 01
    STA $06A0,X                  ; $9F53  9D A0 06

loc_1C_9F56:
    LDA $0110,X                  ; $9F56  BD 10 01
    CMP #$01                     ; $9F59  C9 01
    BNE loc_1C_9F79              ; $9F5B  D0 1C
    LDA $04                      ; $9F5D  A5 04
    BPL loc_1C_9FB5              ; $9F5F  10 54
    LDA $00                      ; $9F61  A5 00
    BEQ loc_1C_9FB5              ; $9F63  F0 50
    LDA #$00                     ; $9F65  A9 00
    STA $0620,X                  ; $9F67  9D 20 06
    INC $0110,X                  ; $9F6A  FE 10 01
    LDA #$3E                     ; $9F6D  A9 3E
    STA $04E0,X                  ; $9F6F  9D E0 04
    LDA #$03                     ; $9F72  A9 03
    STA $06A0,X                  ; $9F74  9D A0 06
    BNE loc_1C_9FB5              ; $9F77  D0 3C

loc_1C_9F79:
    LDA $04E0,X                  ; $9F79  BD E0 04
    BNE loc_1C_9FB5              ; $9F7C  D0 37
    JSR sub_1F_EFEE              ; $9F7E  20 EE EF
    LDA #$18                     ; $9F81  A9 18
    JSR sub_1F_F159              ; $9F83  20 59 F1
    BCS loc_1C_9FA1              ; $9F86  B0 19
    LDA $2B                      ; $9F88  A5 2B
    PHA                          ; $9F8A  48
    TYA                          ; $9F8B  98
    CLC                          ; $9F8C  18
    ADC #$10                     ; $9F8D  69 10
    TAX                          ; $9F8F  AA
    STX $2B                      ; $9F90  86 2B
    LDA #$02                     ; $9F92  A9 02
    STA $09                      ; $9F94  85 09
    LDA #$0C                     ; $9F96  A9 0C
    STA $08                      ; $9F98  85 08
    JSR sub_1F_F197              ; $9F9A  20 97 F1
    PLA                          ; $9F9D  68
    STA $2B                      ; $9F9E  85 2B
    TAX                          ; $9FA0  AA

loc_1C_9FA1:
    LDA #$3E                     ; $9FA1  A9 3E
    STA $04E0,X                  ; $9FA3  9D E0 04
    INC $0110,X                  ; $9FA6  FE 10 01
    LDA $0110,X                  ; $9FA9  BD 10 01
    CMP #$05                     ; $9FAC  C9 05
    BNE loc_1C_9FB5              ; $9FAE  D0 05
    LDA #$00                     ; $9FB0  A9 00
    STA $0110,X                  ; $9FB2  9D 10 01

loc_1C_9FB5:
    DEC $04E0,X                  ; $9FB5  DE E0 04
    LDY $0110,X                  ; $9FB8  BC 10 01
    LDA $06A0,X                  ; $9FBB  BD A0 06
    CMP $9FCC,Y                  ; $9FBE  D9 CC 9F
    BNE loc_1C_9FC8              ; $9FC1  D0 05
    LDA #$00                     ; $9FC3  A9 00
    STA $0680,X                  ; $9FC5  9D 80 06

loc_1C_9FC8:
    JSR sub_1F_EEBA              ; $9FC8  20 BA EE
    RTS                          ; $9FCB  60

    .byte $00,$02,$00,$00,$00  ; $9FCC
    LDY #$02                     ; $9FD1  A0 02
    LDA $06C0,X                  ; $9FD3  BD C0 06
    BNE loc_1C_9FDB              ; $9FD6  D0 03
    JMP loc_1D_A06B              ; $9FD8  4C 6B A0


loc_1C_9FDB:
    CMP $0660,X                  ; $9FDB  DD 60 06
    BEQ loc_1C_9FE2              ; $9FDE  F0 02
    LDY #$05                     ; $9FE0  A0 05

loc_1C_9FE2:
    STA $0660,X                  ; $9FE2  9D 60 06
    LDX #$0F                     ; $9FE5  A2 0F

loc_1C_9FE7:
    LDA $A108,Y                  ; $9FE7  B9 08 A1
    STA $0356,X                  ; $9FEA  9D 56 03
    DEY                          ; $9FED  88
    DEX                          ; $9FEE  CA
    CPX #$0C                     ; $9FEF  E0 0C
    BNE loc_1C_9FE7              ; $9FF1  D0 F4
    LDX $2B                      ; $9FF3  A6 2B
    LDA $0620,X                  ; $9FF5  BD 20 06
    BNE loc_1D_A02B              ; $9FF8  D0 31
    LDA #$01                     ; $9FFA  A9 01
    STA $06A0,X                  ; $9FFC  9D A0 06
    LDA #$00                     ; $9FFF  A9 78
