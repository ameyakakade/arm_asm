.global _start // entry point
.align 4

_start:
    mov X3, #0
    b _loop

_loop:  
    mov X16, #0x4
    mov X0,  #1
    adr X1,  helloworld
    mov X2,  #13
    svc #0x80

    add X3,  X3, #1
    
    cmp X3, #10
    b.cc _loop

helloworld: .ascii "Hello World!\n"

// this prints hello world in a infinite loop
