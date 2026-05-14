    .global _start
    // this program will print helloworld 5 times

_start:
    MOV X3, #5
    
loop:   // print hello world to stdout
    MOV X16, #0x4
    MOV X0,  #1
    ADR X1,  helloworld
    MOV X2,  #13
    SVC #0x18

    SUBS X3, X3, #1

    SVC #0x80
    MOV X16 ,#1
    MOV X0  ,#0
    SVC #0x80
    
    
helloworld: .ascii "Hello World!\n"
