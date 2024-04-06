.segment "HEADER"
.org $7FF0
.byte $4E, $45, $53, $1A, $02, $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

.segment "CODE"
.org $8000

Reset:           ;TODO:
 
    lda #15        ; Load the A register with the literal decimal value 15
    tax            ; Transfer the value from A to X
    tay            ; Transfer the value from A to Y
    txa            ; Transfer the value from X to A
    tya            ;  Transfer the value from Y to A
    
    ldx #6      ; Load X with the decimal value 6
    txa            ; Transfer the value from X to Y
    tay

NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word IRQ
.word Reset