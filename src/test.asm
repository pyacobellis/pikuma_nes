;a blank comment

    LDY #100

Loop:
    DEY             ; decrement Y.   When Y = 0, Zero Flag set to 1
    BNE Loop        ; Branch Not Equal Zero, branches back to Loop label (loop repeats)