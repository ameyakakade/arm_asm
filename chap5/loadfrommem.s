    .global _start
_start:
    // load address of mynum into reg 1
    ADRP X1,     mynum@PAGE 
    ADD  X1, X1, mynum@PAGEOFF

    // load the word stored at mynum into reg 2
    LDR X2, [X1]

.data
mynum:  .quad 0x012345678ABCDEEF
