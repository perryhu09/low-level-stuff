global _start

section .text
    _start: 
        jmp _exit

    _exit: 
        mov eax, 0x01
        mov ebx, [num]
        int 0x80

section .data
    num DD 5 ; name, size, value
