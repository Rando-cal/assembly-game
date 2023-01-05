# assembly-game

FOR LINUX:

Need to use an Assembler for the source code. Used https://dasm-assembler.github.io/ here.

To assemble:

'dasm cleanmem.asm -f3 -v0 -ocart.bin'

Linux won't be able to execute this type of Binary file ---> get emulator for this at https://stella-emu.github.io/ OR Javatari OR 8bitworkshop.com for all online.

Once installed. Run with 'stella' which opens a GUI for the program, goto new bin file and run. You can hit ~ for Debugger.

In Stella with ` top right is RAM and bottom right is ROM. in ROM right column is OpCodes like ldx = a2 ff

With PS point stack if letter is Uppercase it is N negative, n is not-negative. And red means is changed since last compuatation, while white is NOT changed. Upper = set, lower = unset



Note:

* When we power-up or reset the Atari 2600, that sets the RESET pin on the 6507 processor. The 6502 CPU (or 6507 in our case) is designed to always initialize and load the PC register (program counter) with the address that is in inside memory positions $FFFC and $FFFD (two bytes)




* Boilerplate:

    processor 6502
    seg Code        ; define a new seg named "Code"
    org #F000       ; define the origin of hte ROM code at mem address $F000

Start:

        ; body of code here


    org $FFFC       ; end the ROM by adding required values to the mmeory position $FFFC
    .word Start     ; put 2 bytes with the reset address at memory postiion $FFFC
    .word Start     ; put 2 bytes with the break address at memory position $FFFE

* Can't use ADD with 6502 chip so we have to clear the Carry using 'clc' then use 'adc' OR to subtract, we have to set Carry flag to 1 using 'sec', then subtract using 'sbc' like 'sbc #10' to subtract 10 decimal...

