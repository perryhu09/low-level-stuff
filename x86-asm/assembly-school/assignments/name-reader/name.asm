section .data
    prompt db "What is your name?: "
    prompt_len equ $-prompt

    hello_msg db "Hello ", 0
    hello_msg_len equ $-hello_msg

section .bss
    name resb 32

section .text
    global _start

_start:
    ; Display prompt
    mov eax, 0x04  
    mov ebx, 0x01
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Get name input
    mov eax, 0x03
    mov ebx, 0x00
    mov ecx, name
    mov edx, 32
    int 0x80
    
    ; Display "Hello Message"
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, hello_msg
    mov edx, hello_msg_len
    int 0x80

    ; Display Name
    mov eax, 0x04
    mov ebx, 0x01 
    mov ecx, name
    mov edx, 32
    int 0x80
    
    ; Exit Program
_exit: 
    mov eax, 0x01
    mov ebx, 0x00
    int 0x80
