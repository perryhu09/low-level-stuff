extern printf
extern exit

section .data
    msg db "Hello World!",0
    msg2 dd "This is a test!",0
    fmt db "Output is: %s %s",0xA,0
    

section .text
global main

; printf(fmt, msg), gets fmt first then msg -> fmt on top in the stack, push msg first

main:
    push msg2
    push msg ;push on to the stack (LIFO)
    push fmt
    call printf
    push 10 ; exit(1) 
    call exit
