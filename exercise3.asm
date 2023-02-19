processor 6502
    seg Code        ; define a new seg named "Code"
    org #F000       ; define the origin of hte ROM code at mem address $F000

Start:

        lda #15; Load the A register with the literal decimal value 15
        tax ; Transfer the value from A to X
        tay; Transfer the value from A to Y
        txa; Transfer the value from X to A
        tya; Transfer the value from Y to A
        ldx #6; Load X with the decimal value 6


        ; Transfer the value from X to Y
        ; can't transfer directly from x to y, must put it in A first

        txa
        tay

        jmp Start   ; Jump to Start label to force an infinite loop

    org $FFFC       ; end the ROM by adding required values to the mmeory position $FFFC
    .word Start     ; put 2 bytes with the reset address at memory postiion $FFFC
    .word Start     ; put 2 bytes with the break address at memory position $FFFE