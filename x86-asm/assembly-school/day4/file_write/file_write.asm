section .data
    pathname db "/home/perryhu/programming/x86-asm/assembly-school/day4/file_write/message.txt",0
    message db "Hello World!",0AH,0DH,"$"
    message_len equ $ - message

section .text
global main

main:
    mov eax, 5
    mov ebx, pathname
    mov ecx, 101o ; octal  
    mov edx, 700o
    int 0x80

    mov ebx, eax ; move fd
    mov eax, 4
    mov ecx, message
    mov edx, message_len
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
