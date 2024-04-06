.segment "HEADER"
.org $7FF0
.byte $4E, $45, $53, $1A, $02, $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

.segment "CODE"
.org $8000

Reset:  ; TODO:
    lda #$A                ; Load the A register with the hexadecimal value $A
    ldx #%1010                    ; Load the X register with the binary value %1010
                        
    sta $80                    ; Store the value in the A register into (zero page) memory address $80
    stx $81                    ; Store the value in the X register into (zero page) memory address $81
                        
    lda #10                    ; Load A with the decimal value 10
    adc $80                    ; Add to A the value inside RAM address $80
    adc $81                    ; Add to A the value inside RAM address $81
                        ; A should contain (#10 + $A + %1010) = #30 (or $1E in hexadecimal)
                        
                        ; Store the value of A into RAM position $8             
NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word IRQ
.word Reset