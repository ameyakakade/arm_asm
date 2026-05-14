.global _start // provide program starting address

_start1: 
    mov X2  ,#0x6E3A
    movk X2 ,#0x4F5D, LSL #16
    movk X2 ,#0xFEDC, LSL #32
    movk X2 ,#0x1234, LSL #48

    mov W1, W2
    mov X1, #0xAB000000
    movn W1, #45

    mov W1, #0xFFFFFFFE

    mov X16 ,#0x01
    mov X0  ,#0
    svc #0x80

    // we load -2 in two's complement form and use it as exit code
_start2:
    movn W0 ,#2
    add  W0 ,W0, #1

    mov X16, #0x01
    svc #0x80

    // adding with carry
_start3:
    // first 128 bit number is 0x0000000000000003FFFFFFFFFFFFFFFF
    // we move msb part into x2, and other into x3
    mov X2, #0x0000000000000003
    mov X3, #0xFFFFFFFFFFFFFFFF

    // second 128 bit number is 0x00000000000000050000000000000001
    // we move msb part into x4, and other into x5
    mov X4, #0x0000000000000005
    mov X5, #0x0000000000000001

    // the added number will have msb in X0
    adds X1, X3, X5
    adc  X0, X2, X4
    // we use adds so it changes the carry flag if first add overflows.
    // we use adc so that it uses the carry flag set before for additio

    // adding 2 192bit numbers
_start4:
    mov X3, #0x0000000000000003
    mov X4, #0xFFFFFFFFFFFFFFFF
    mov X5, #0xFFFFFFFFFFFFDDDD

    mov X6, #0x0000000000000005
    mov X7, #0x0000000000000001
    mov X8, #0x0000000000000033

    adds X2, X5, X8
    adcs X1, X4, X7
    adc  X0, X3, X6

    // subtracting 2 128 bit numbers
_start:
    // a 
    // first 128 bit number is 0x0000000000000003FFFFFFFFFFFFFFFF
    mov X2, #0x0000000000000006
    mov X3, #0xFFFFFFFFFFFFFFFF

    // b 
    // second 128 bit number is 0x00000000000000050000000000000001
    mov X4, #0x0000000000000005
    mov X5, #0x0000000000000001

    // a - b
    // the final number will have msb in X0
    subs X1, X3, X5
    sbc  X0, X2, X4
