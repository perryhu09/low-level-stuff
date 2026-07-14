global _start

section .text

_start:
    MOV eax, 0b1010
    MOV ebx, 0b1100
    AND eax, ebx ;and dest, src

    MOV eax, 0b1010
    MOV ebx, 0b1100
    OR eax, ebx
    NOT eax ;negate 
    XOR eax, ebx ;XOR operator

    mov al, 0b00001110    ; al = 00001110
    shl al, 1             ; al = 00011100 (shift left, doubles value)
    shr al, 2             ; al = 00000111 (shift right, quarters value)
    sar al, 1             ; preserves the sign bit during the shift right
    sal al, 1

    int 0x80
