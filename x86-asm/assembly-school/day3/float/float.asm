global _start

section .data
    x dd 3.14
    y dd 2.71

    message db "pi IS GREATER THAN e",0xA
    message_len equ $ - message

section .text

_start: 
    ; ss = scalar single precision floating point
    movss xmm0, [x]
    movss xmm1, [y]
    ucomiss xmm0, xmm1 ;compare xmm0, xmm1, set eflags register
    ja greater

    ;j - b(elow), a(bove), e(quals)

greater:
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, message_len
    int 0x80

_exit: 
    mov eax, 0x01
    mov ebx, 0x01
    int 0x80
