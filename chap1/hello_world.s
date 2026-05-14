// Assembler program to print "Hello World!"
// to stdout

.global _start // entry point
.align 4

_start:
    mov X16 ,#0x4
    mov X0  ,#1
    adr X1  ,helloworld
    mov X2  ,#13

wow:
    svc #0x80
    mov X16 ,#1
    mov X0  ,#0
    svc #0x80

helloworld: .ascii "Hello World!\n"
