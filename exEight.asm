    processor 6502
    seg Code ; Define a new segment named "Code"
    org $F000 ; Define the origin of the ROM code at memory address $F000


Start:
    ldy #10 ; Initialize the Y register with the decimal value 10


Loop:
    ; TODO:
    tya         ; Transfer Y to A
    sta $80,Y   ; Store the value in A inside memory position $80+Y
    dey         ; Decrement Y
    bpl Loop    ;Branch if plus (resulte of 
                ;   last instruction was postiive)
                ; In other words if the negative flag is clear, meaning
                ; its Postive, then branch...
                ; Branch back to "Loop" until we are done

    jmp Start


    org $FFFC ; End the ROM always at position $FFFC
    .word Start ; Put 2 bytes with reset address at memory position $FFFC
    .word Start ; Put 2 bytes with break address at memory position $FFFE