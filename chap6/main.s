// this function converts a string into uppercase by calling a function
    .global _start

_start:
    // store add of input string in x0
    ADRP X0, instr@PAGE
    ADD  X0, X0, instr@PAGEOFF
    // store add of output string in x1
    ADRP X1, outstr@PAGE
    ADD  X1, X1, outstr@PAGEOFF

    BL _upper // this stores the next instruction in lr reg so we can return

    // printing the string
    MOV  X2, X0 // the function returns length of the string
    MOV  X0,  #1
    ADRP X1, outstr@PAGE
    ADD  X1, X1, outstr@PAGEOFF
    MOV  X16, #0x4
    SVC #0x80

    // exit
    MOV X16, #1
    MOV X0,  #0
    SVC #0x80

    .data
instr:  .asciz "This is a null terminated string. \nThis assembly program calls a function in another assembly program. \nI might be able to call the uppercase function from a high level language like C."
outstr: .fill 255, 1, 0 // 255 bytes filled with zero
