.segment "HEADER"
.org $7FF0
.byte $4E, $45, $53, $1A, $02, $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

.segment "CODE"
.org $8000

Reset:
    lda #1 ; Initialize the A register with the decimal value 1
Loop: 
        ;TODO
    clc
    adc #1        ; Increment A
    cmp #10       ; Compare the value in A with the decimal value 10
    bne Loop  ; Branch back to "Loop" if the comparison was not equals (to zero) 

NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word IRQ
.word Reset