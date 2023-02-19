

    processor 6502
    seg Code ; Define a new segment named "Code"
    org $F000 ; Define the origin of the ROM code at memory address $F000

Start:
    ; TODO:

    lda #10     ; Load the A register with the decimal value 10
    lda $80    ; Store the value from A into memory position $80  -- NOT #$80 but $80.. I think #$80 is HEx
    
    inc $80     ; DO I need to do #$80 or $80?? --A: just $80 Increment the value inside a (zero page) memory position $80
    dec $80     ; Decrement the value inside a (zero page) memory position $80

    jmp Start

    org $FFFC ; End the ROM always at position $FFFC
    .word Start ; Put 2 bytes with reset address at memory position $FFFC
    .word Start ; Put 2 bytes with break address at memory position $FFFE