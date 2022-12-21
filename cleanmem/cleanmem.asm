    processor 6502 ; always indent. Using 4 spaces here
    
    seg code
    org $F000 ; start of ROM "cartridge" at F000 address

Start:          ; labels to memory address. NOT indented will go to F000
    sei         ; Disable interrupts. though 6057 doesn't have interrupts. need
    cld         ; Disable BCD decimal math mode
    ldx #$FF    ; Load x register with #$FF
    txs         ;transfer the X register to the Stack pointer reg. Point to last


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Body of code below
; Clear the Page Zero region of memory from $00 to $FF
; Meaning the entire RAM and alsoe th entire TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; start with FF and decrement to zero
    lda #0      ; A = 0
    ldx #$FF    ; X is counter of loop.  X = #$FF  ==>>> So A reg has 0 , X has $FF, and S has $FF
    sta $FF     ; make sure $FF is zeroed before the loop starts since it Decrements then zeros...stella

MemLoop:        ; start with $FF and make is a Zero, go down to $FE and make zero, goto $FD and make zero...
    dex         ; X--  (de)crement X
    sta $0,X    ; store the value of A inside memory $0 Plus whats in X reg
    bne MemLoop ; branch if NOT 0 go back to MemLoop, it'll stop branching when X is zero (Z-flag is set)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FILL the ROM size exactly to 4KB
; Ending the ROM. Need for all 6502
;;;;;;;;;;;;;;;;;;;;;;


    org $FFFC   ; set origin to $FFFC. Jump to FFFC and add two bytes with address of start and again with two bytes 
    .word Start ; Reset vector at $FFRC (where th program starts)
    .word Start ; Interrupt vector at $FFFE (unused in VCS)  Required for every 6502