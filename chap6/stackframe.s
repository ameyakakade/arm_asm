    .global _printword
    .global _sumfn
    // Simple function that takes two parameters
    // var1 and var2 and adds them. It stores the
    // result in another variable.
    // to demonstrate we can store values in the stack we will print the variables before adding and after adding
    
     // these are the offsets that we use to access the variables
     .EQU VAR1, 0
     .EQU VAR2, 4
     .EQU  SUM, 8

     // this function takes the two 32 bit values in w1 and w0, prints them, adds them, prints the result and returns it
_sumfn:
    STP LR, FP, [SP, #-16]! // move the stack pointer up by 16 bytes and store these 2 reg values in memory

    SUB SP, SP, #16 // move stack pointer up by 16 to store our 3 32 bit values (sp has to be 16 bit aligned)
    MOV FP, SP // store stack pointer value in fp

    // storing the parameters
    STR W0, [FP, #VAR1]
    STR W1, [FP, #VAR2]

    // to access our variables in this fn, all we have to do is add the defined offset to the fp. 
    // let us print these variables 
    LDR W0, [FP, #VAR1]
    BL _printword
    LDR W0, [FP, #VAR2]
    BL _printword

    // load variables into registers, add them and store them in stack
    LDR W0, [FP, #VAR1]
    LDR W1, [FP, #VAR2]
    ADD W0, W0, W1
    STR W0, [FP, #SUM]
    BL _printword

    LDR W0, [FP, #SUM]

    ADD SP, SP, #16 // move stack pointer up by 16 to store our 3 32 bit values (sp has to be 16 bit aligned)
    LDP LR, FP, [SP], #16 // get these 2 reg values from memory and move the stack pointer down by 16 bytes
    RET


    // ========= the below function will take the number in w0 and print it
    
_printword:
    STP LR, FP, [SP, #-16]! // move the stack pointer up by 16 bytes and store these 2 reg values in memory

    SUB SP, SP, #16 // we need to store 8 + newline chars
    MOV FP, SP // we can move in bytes using fp 

    MOV W2, #0xF // this will be used for masking 
    MOV X3, #8 // for looping

loop:   
    SUBS X3, X3, #1 // subtract one

    AND W1, W2, W0
    LSR W0, W0, #4

    CMP W1, #10
    B.LT isnum
    ADD W1, W1, #55
    B jump

isnum:   
    ADD W1, W1, #48
jump:
    
    STRB W1, [FP, X3] // fp + index will give pointer to mem
                      // this will also make it so that last byte is least sig digit

    CMP X3, #0
    B.NE loop // loop if not equal to zero

    MOV  W0, #0x0a // store newline at the end
    STRB W0, [FP, #8] 

    // write syscall
    MOV X16 ,#0x4
    MOV X0  ,#1
    MOV X1  ,FP
    MOV X2  ,#9
    SVC #0x80

    ADD SP, SP, #16 // we need to free the 8 bytes we used
    LDP LR, FP, [SP], #16 // get these 2 reg values from memory and move the stack pointer down by 16 bytes
    RET
