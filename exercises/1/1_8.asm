.segment "HEADER"
.org $7FF0
.byte $4E, $45, $53, $1A, $02, $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

.segment "CODE"
.org $8000

Reset:
    ldy #10 ; Initialize the Y register with the decimal value 10
Loop: 
    ; TODO:
    tya             ; Transfer Y to A
    sta $80,Y       ; Store the value in A inside memory position $80+Y
    dey               ; Decrement Y
    jmp Loop        ; Branch back to "Loop" until we are done  

NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word IRQ
.word Reset