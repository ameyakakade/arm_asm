    .global _start

    // this is a program that will print contents of a register to stdout

_start:
    // moving data into x4 register
    MOV  X4, #0xBEEF 
    MOVK X4, #0xDEED, LSL #16
    MOVK X4, #0xFEDA, LSL #32
    MOVK X4, #0x1234, LSL #48

    ADRP X1,     hexstr@PAGE
    ADD  X1, X1, hexstr@PAGEOFF
    // the above two commands load the address of hexstring into x1. x1 now points to '0' in the string
    ADD  X1, X1, #17 // this makes it so that x1 now points at 'G' in the string

    MOV W5, #16 // 16 digits

loop:
    AND W6, W4, 0xF // get the least sig digit of number 
    // if W6 is < 10 then go to number
    CMP  W6, #10
    B.LT number
    // else it is a letter so we convert to ascii letter
    ADD W6, W6, #('A'-10)
    B cont

number:
    ADD W6, W6, #'0'
    // we can add 'B cont' here but it already will go to cont so we can not write it

cont:
    // store digit, decrement address go back to loop if w5 is > 0
    STRB W6, [X1] // Store the least sig Byte of W6 in address given by X1  
    SUB  X1, X1, #1

    LSR X4, X4, #4 // shift by 4 bits to remove the digit we just stored

    // loop if w5 is not zero
    SUBS W5, W5, #1
    B.NE loop
    
    // perform write syscall to std out
    MOV X16, #0x4
    MOV X0,  #1
    ADRP X1,     hexstr@PAGE
    ADD  X1, X1, hexstr@PAGEOFF
    MOV X2,  #19
    SVC #0x80

    // perform exit syscall
    SVC #0x80
    MOV X16, #1
    MOV X0,  #0
    SVC #0x80

    .data
hexstr: .ascii "0x123456789ABCDEFG\n"
