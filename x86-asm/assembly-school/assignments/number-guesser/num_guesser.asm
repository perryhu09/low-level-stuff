; Number Guessing Game - Assembly x86
; perryhu, 27-Nov-2024

extern printf
extern srand, rand, time ; used to generate random num

section .data
    ; messages to the user
    msg db "Guess a number between 0 and 100: ",0
    msg_len equ $ - msg

    high_msg db "Too high, guess again: ",0
    high_len equ $ - high_msg

    low_msg db "Too low, guess again: ",0
    low_len equ $ - low_msg

    win_msg db "Congratulations! You have won!",0xA,0
    win_len equ $ - win_msg

    guess_msg db "You've run out of guesses",0xA,0
    guess_len equ $ - guess_msg

    correct_msg db "The correct number was %d",0xA,0
    correct_len equ $ - correct_msg

    ; how many guesses remaining
    guesses db 10

section .bss
    guess resb 4
    target resb 4

section .text
global main
    
main:
    push dword 0
    call srand

    call rand
    mov ebx, 101
    div ebx
    mov [target], edx

    mov eax, 4
    mov ebx, 1
    mov ecx, target
    mov edx, 4
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
