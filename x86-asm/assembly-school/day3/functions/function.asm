global main

section .data

section .text

addTwo:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    add eax, ebx
    pop ebp
    ret 

main: 
    ; mov eax, 0x04
    ; mov ebx, 0x01
    push 4
    push 1
    call addTwo
    mov ebx, eax
    mov eax, 0x01
    int 0x80
