section .data
    num1 db 0x01
    num2 db 0x02
    
section .text
global _start

; ebx - 32 bits (4B)
; bx - 16 bits (2B)
; bl - lower byte of bx
; bh - upper byte of bx

_start:
    mov bl, [num1]
    mov cl, [num2]
    mov eax, 0x01
    int 0x80
