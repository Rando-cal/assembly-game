

    processor 6502
    seg Code    ; Define a new segment named "Code"
    org $F000   ; Define the origin of the ROM code at memory address $F000
Start:
    ; TODO:
    lda #1      ; Load the A register with the decimal value 1
    ldx #2      ; Load the X register with the decimal value 2
    ldy #3      ; Load the Y register with the decimal value 3

    inx         ; Increment X
    iny         ; Increment Y

    clc         ; clear carry before add
    adc #1      ; Increment A   Add oen to A (no direct instuction) -- 
                ; maybe it just adds one which goes automatically to ACCUmulator??


    dex         ; Decrement X
    dey         ; Decrement Y
    
    
    sec
    sbc #1      ; Decrement A

                ; can't directly inc/ decr X or Y reg, but not A. 
                ; Must just remove 1 or add 1. For loops its easier to use X/Y since we have a OPCODE

    jmp Start
    
    
    org $FFFC ; End the ROM always at position $FFFC
    .word Start ; Put 2 bytes with reset address at memory position $FFFC
    .word Start ; Put 2 bytes with break address at memory position $FFFE