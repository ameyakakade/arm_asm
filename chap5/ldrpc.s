// this example just loads addresses relative to program counter in various registers

    .global _start
_start:
    MOV  X1, #0xBEEF 
    MOVK X1, #0xDEED, LSL #16
    LDR X0, =0x1234ABCD
