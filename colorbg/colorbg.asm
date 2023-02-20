    processor 6502

    include "vcs.h"
    include "macro.h"

    seg code
    org $f000       ; defines the origin of the ROM at $F000

START:
    CLEAN_START     ; macro to safely clear the memory, TIA reg...



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set background luminosity color to yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; using lumincance table for video consoles


    lda #$1E        ; load color into A with NTSC yellow
    sta COLUBK      ; store A to BackgroundColor address $09 

    jmp START       ; repeat from START



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org $FFFC       ; defines origin to $FFFC
    .word START     ; reset vector at $fffc (where program starts)
    .word START     ; interrupt vector at $fffe (unused in the VCS)