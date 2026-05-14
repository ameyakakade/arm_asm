    .global _start
_start:
    // loading address of str into reg 1
    ADRP X1, str@PAGE
    ADD  X1, X1, str@PAGEOFF
    ADRP X2, outstr@PAGE
    ADD  X2, X2, outstr@PAGEOFF

loop:
    // current char will be present in W0
    LDRB W0, [X1], #1 // loading char and increment x1
    CMP W0, 'a'
    B.LT jump
    CMP W0, 'z'
    B.GT jump
    SUB W0, W0, #('a'-'A')

jump:   
    STRB W0, [X2], #1 // storing the byte back into out string and incre x2
    CMP W0, #0    // jump back to loop if W0 is not null
    B.NE loop

    // printing the string
    SUBS X5, X5, #1
    MOV  X16, #0x4
    MOV  X0,  #1
    ADRP X1,  outstr@PAGE
    ADD  X1,  X1, outstr@PAGEOFF
    SUB  X2,  X2, X1

    // exit
    SVC #0x80
    MOV X16, #1
    MOV X0,  #0
    SVC #0x80
    
    .data
str: .asciz "All caps when you spell the man name\n"
outstr: .fill 255, 1, 0
