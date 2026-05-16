    // this file contains the toupper function that will be called
    .global _upper // allow other files to call this routine

_upper:
    // X0 has address of input string
    // X1 has address of output string
    // function returns length of the string

    // return to instr in lr
    // store lr in stack
    STR LR, [SP, #-16]!
    MOV X3, #-1 // we dont need to print last char because it is null

loop:   
    // W2 holds current character
    // X3 holds number of chars
    LDRB W2, [X0], #1 // loading char and incrementing X0 by 1

    CMP W2, 'a'
    B.LT jump
    CMP W2, 'z'
    B.GT jump

    // if we get here that means it is a lowercase char
    // so we convert it to uppercase
    SUB W2, W2, #('a'-'A')

jump:
    STRB W2, [X1], #1 // storing char and incrementing X1 by 1
    ADD X3, X3, #1
    CMP W2, #0 // if its null do not loop
    B.NE loop

    // load lr from stack
    LDR LR, [SP], #16
    MOV X0, X3 // store length in x5
    RET
