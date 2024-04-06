.segment "HEADER"
.org $7FF0
.byte $4E, $45, $53, $1A, $02, $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

.segment "CODE"
.org $8000

Reset:  ;  TODO:
    lda #10    ;Load the A register with the decimal value 10
    sta $80     ; Store the value from A into memory position $80
 
    inc $80         ; Increment the value inside a (zero page) memory position $80

    dec $80
  
  
                ; Decrement the value inside a (zero page) memory position $80
          
NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word IRQ
.word Reset