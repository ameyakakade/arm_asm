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
    CMP W0, #0
    B.EQ jump // go to jump if null
    CMP W0, 'a'
    B.LT cs
    CMP W0, 'z'
    B.GT cs
    // if you reach here it is def a lowercase to go jump
    B jump

cs:
    // it is not lowercase check if it is capital
    // we reach this only when we know it is not lowercase.
    // because if it is we just skip checking for caps
    CMP W0, 'A'
    B.LT replace
    CMP W0, 'Z'
    B.GT replace
    
    // if it reaches here we know it is a capital so go to jump
    B jump

replace:
    MOV W0, #0x20

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
str: .asciz "This asm program uses a lot of branches, and is probably slow. It takes a string and converts all the non alphabetic chars into spaces. This is why you cant see the full-stops or these (){}[] brackets. It even removes newline \n"
outstr: .fill 255, 1, 0

// if (x < a || x > z) && (x < A || x > Z) && (!=\0) then replace
