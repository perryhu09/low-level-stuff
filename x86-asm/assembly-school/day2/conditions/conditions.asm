global _start

section .text

_start: 
    mov ebx, 0x12345
    mov eax, 0x54
    cmp eax, 0x55 ;alters eflags register
    je _true ;'jump if equal'

_exit:
    mov ebx, 0x00
_true: 
    mov eax, 0x01
    int 0x80

section .data
