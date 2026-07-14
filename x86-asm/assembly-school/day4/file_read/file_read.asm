section .data
    pathname db "/home/perryhu/programming/x86-asm/assembly-school/day4/file_read/database",0

section .bss
    buffer resb 1024

section .text
global main

main:
    mov eax, 5 ; open syscall
    mov ebx, pathname
    mov ecx, 0
    int 0x80

    mov ebx, eax ; file descriptor is returned to eax
    mov eax, 3
    mov ecx, buffer
    mov edx, 1024
    int 0x80

    ; sys_read returns # of characters it read

    mov edx, eax
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
