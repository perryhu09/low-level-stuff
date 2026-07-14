section .data
    char db 'A'
    list db 1, 2, 3, 4 ; a 'list' each num get 1 byte
    ; need a null terminator to end the list?
    str1 db "perry",0 ; string is just a list of chars, each char gets 1 byte
    str2 db "tianyi",0

section .text

global _start

_start: 
    

_exit: 
    mov eax, 1
    mov bl, [char]
    int 0x80
    ; prints out 65 (ASCII)
    
