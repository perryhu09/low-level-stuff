; Author: perryhu
; My FIRST x86 assembly program (credit to John Hammond)
; hello_world.asm (32 bit)
; Mon 11-Nov-2024

global _start

section .text:

_start:
    mov eax, 0x4
    mov ebx, 1
    mov ecx, message
    mov edx, message_length
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

section .data:
    message: db "Hello World", 0xA
    message_length equ $-message
