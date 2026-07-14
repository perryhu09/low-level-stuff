section .data
    pathname db "/home/perryhu/programming/x86-asm/assembly-school/day4/lseek/data.txt", 0

section .bss
    buffer resb 32

section .text
global main

main:
    ; read data from file
    mov eax, 5
    mov ebx, pathname
    mov ecx, 0 ; type: read only
    int 0x80

    mov ebx, eax
    mov eax, 19 ; lseek syscall
    mov ecx, 20 ; offset by 20 bytes
    mov edx, 0  ; offset starting from beginning
    int 0x80
    
    mov eax, 3
    mov ecx, buffer
    mov edx, 10 ; read in 10 bytes (line 3 only)
    int 0x80

    mov edx, eax
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
