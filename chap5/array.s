    .global _start
_start:
    MOV X1, 0
.data
uh:  .byte 0x69
.align 4
helloworld:	.ascii "Hello World!"
