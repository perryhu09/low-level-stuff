; Author: perryhu
; Date: 14-Nov-2024 Thu 6:00 PM UTC-4
global _start

section .data
    menu db "Welcome to the Calculator Program!", 0xA
         db "1 - Addition", 0xA
         db "2 - Subtraction", 0xA
         db "3 - Multiplication", 0xA
         db "4 - Division", 0xA
         db "Choose your an operation to proceed: ",0
    menu_len equ $ - menu
    
    prompt db "Enter two numbers", 0xA,0
    prompt_len equ $ - prompt

    prompt1 db "num1: ",0xA,0
    prompt1_len equ $ - prompt1

    prompt2 db "num2: ",0xA,0
    prompt2_len equ $ - prompt2

    result db "Result: ",0
    result_len equ $ - result

    newline db 0xA

section .bss
    operation resb 1
    num1 resb 8
    num2 resb 8
    ans resb 16

section .text

_start:
    ; Display welcome and menu
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, menu
    mov edx, menu_len
    int 0x80

    ; read in operation
    mov eax, 0x03 ; sys_read
    mov ebx, 0x00
    mov ecx, operation
    mov edx, 1
    int 0x80

    ;Ask for 2 nums
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Read in first num
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, prompt1
    mov edx, prompt1_len
    int 0x80

    mov eax, 0x03 
    mov ebx, 0x00
    mov ecx, num1
    mov edx, 8
    int 0x80

    ; Read in second num
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, prompt2
    mov edx, prompt2_len
    int 0x80

    mov eax, 0x03 
    mov ebx, 0x00
    mov ecx, num2
    mov edx, 8
    int 0x80

    ; Convert string to integer
    mov al, [operation]
    sub al, '0'

    mov ebx, [num1]
    sub ebx, '0'
    mov ecx, [num2]
    sub ebx, '0'

    cmp al, 0x01
    je _add
    cmp al, 0x02
    je _subtract
    cmp al, 0x03
    je _multiply
    cmp al, 0x04
    je _divide
    jmp _exit

_add:
    add ebx, ecx
    jmp _print_result

_subtract:
    sub ebx, ecx
    jmp _print_result

_multiply:
    imul ebx, ecx
    jmp _print_result

_divide: 
    mov eax, ebx
    cdq
    idiv ecx
    mov ebx, eax
    jmp _print_result
    
_print_result:
    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, result
    mov edx, result_len
    int 0x80

    ; print number 
    add ebx, '0'
    mov [ans], ebx

    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, [ans]
    mov edx, 16
    int 0x80

    mov eax, 0x04
    mov ebx, 0x01
    mov ecx, newline
    mov edx, 1
    int 0x80

_exit:
    ;exit program
    mov eax, 0x01
    mov ebx, 0x00
    int 0x80
