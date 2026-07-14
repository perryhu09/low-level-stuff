section .bss
    num resb 3

section .text
    num2 db 3 dup(2) ;intializes 3 vars of val 2

global _start

_start: 
    mov bl, 0x01 ; ebx : 0x0000 00 01
    mov bl, [num2]
    mov [num], bl ; equivalent to *num = 1 (C)
    mov [num + 1], bl ; offset by 1 byte from the start of num
    mov [num + 2], bl ; offset by one word from the start of num

_exit: 
    mov eax, 0x01
    int 0x80
