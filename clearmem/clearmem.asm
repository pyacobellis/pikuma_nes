; The iNES header (contains total of 16 bytes with flags at $7FF0)

.segment "HEADER"
.org $7FF0
.byte $4E, $45, $53, $1A ;  4 bytes with characters, 'N', 'E', 'S', '\n'
.byte $02                ; PRG ROM How man 16KB we'll use (02*16=32)
.byte $01                ; CHR ROM How many 8kbs we'll use
.byte %00000000          ; Horz mirroring, no battery, mapper 0
.byte %00000000          ; mapper 0, playchoice, NES 2.0
.byte $00                ; no PRG-RAM (rarely used)
.byte $00                ; TV System (0 = NTSC, 1 = PAL)
.byte $00                ; no PRG-RAM
.byte $00, $00, $00, $00 ; unused padding to complete 16 bytes of header

.segment "CODE"
.org $8000   ; code always starts at this
; TODO; Add code of PRG-ROM

RESET:                   ; always do these things when reset or start NES
    sei                  ; disable all IRQ interupts
    cld                  ; Clear Decimal Mode (unsupport in NES)
    ldx #$FF
    txs                  ;  Initialize the stack pointer at $01FF

    ;;;  TODO:  Loop all mem positions from $00 to $FF clearing them out
    lda #0               ; A = 0
    ldx #$FF             ; X = $FF
MemLoop:
    sta $0,x   ;  Store teh value of A (zero) into $0 + X , is like adding - take what is at $0, add whatever is in x
    dex        ; X--
    bne MemLoop ; if X is not zero, loop back to MemLoop label
NMI:
    rti ;  return from interupt
IRQ:
    rti;  return from interupt

.segment "VECTORS"   ; 
.org $FFFA
.word NMI     ; word same as two bytes (16 bits) address of the NMI handler
.word RESET   ; address of RESET handler
.word IRQ     ; address of IRQ handler

