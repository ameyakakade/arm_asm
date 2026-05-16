// this function converts a string into uppercase by calling a function
    .global start_

_start:
    // store add of input string in x0
    ADRP X0, instr@PAGE
    ADD  X0, X0, instr@PAGEOFf
    // store add of output string in x1
    ADRP X1, outstr@PAGE
    ADD  X1, X1, outstr@PAGEOFf

    BL toupper // this stores the next instruction in lr reg so we can return

    // printing the string
    MOV  X2, X0 // the function returns length of the string
    SUBS X5, X5, #1
    MOV  X16, #0x4
    MOV  X0,  #1
    SVC #0x80

    // exit
    MOV X16, #1
    MOV X0,  #0
    SVC #0x80
