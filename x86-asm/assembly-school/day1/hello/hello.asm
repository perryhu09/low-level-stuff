global _start

section .text 
 
_start:
    ; exit(5) 
    mov eax, 1
    mov ebx, 5
    int 0x80

section .data

str: db "HELLO", 0x0a, 0x00

