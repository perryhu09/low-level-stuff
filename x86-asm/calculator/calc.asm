; Author: 0xp3rryhu
; Date: 16-Feb-2025 Sun 9:45 PM UTC-4

global _start

section .data
    welcome db "Welcome to the Calculator!", 0xA
            db "(1) Addition", 0xA
            db "(2) Subtraction", 0xA
            db "(3) Multiplication", 0xA
            db "(4) Division", 0xA
            db "Choose your operation: "
    welc_len equ $ - welcome

    prompt1 db "num1: ",0
    promtp1_len equ $ - prompt1
    
    prompt2 db "num2: ",0
    promtp2_len equ $ - prompt2

    res_msg db "Result: ",0
    res_msg_len equ $ - result

section .bss
    choice resb 1
    ret resb 64

    num1 resb 8
    num2 resb 8

section .text

_start:
    ; display welcome msg
    mov eax, 4
    mov ebx, 1
    mov ecx, welcome
    mov edx, welc_len
    int 0x80

    ; read in choice
    mov eax, 3
    mov ebx, 0
    mov ecx, choice
    mov edx, 1
    int 0x80

    ; prompt for 1st num
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, prompt1_len
    int 0x80

    ; read in 1st num
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 8
    int 0x80

    xor eax, eax
    lea esi, [num1]
    call convert
    mov ebx, eax

    ; prompt for 2nd num
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, prompt2_len
    int 0x80

    ; read in 2nd num
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 8
    int 0x80

    xor eax, eax
    lea esi, [num2]
    call convert
    mov ecx, eax

    mov al, [choice]
    sub al, '0'

    cmp al, 1
    je _add
    cmp al, 2
    je _sub
    cmp al, 3
    je _mul
    cmp al, 4
    je _div
    jmp exit

_add:
    add ebx, ecx
    mov [ret], ebx
    jmp print_res

_sub:
    sub ebx, ecx
    mov [ret], ebx
    jmp print_res

_mul:
    imul ebx, ecx
    jmp print_res

_div:
    mov eax, ebx
    div ecx
    mov [ret], eax
    jmp print_res

print_res:
    mov eax, 4
    mov ebx, 1
    mov ecx, res_msg
    mov edx, res_msg_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ret ; ret is currently an integer fix
    mov edx, 64
    int 0x80

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80

convert:
    movzx edx, byte [esi]
    cmp dl, 0x0A
    je conv_done
    imul eax, 10
    sub edx, '0'
    add eax, edx
    inc esi
    jmp convert

conv_done:
    ret
