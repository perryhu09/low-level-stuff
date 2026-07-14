section .data

section .text
global _start
    
_start:
    ;mov al, 0b11111111
    ;mov bl, 0b0001
    ;add al, bl
    ;adc ah, 0 ;adds the carry on

    ;mov eax, 0x03 
    ;mov ebx, 0x05
    ;sub eax, ebx
    ;mov ebx, 0x02
    ;add eax, ebx

    ;mov al, 0xFF
    ;mov bl, 2
    ;mul bl ;multiply (by default) a by bl
    ;negative numbers (two's complement)

    ;imul and idiv -> signed ints

    mov eax, 11
    mov ecx, 10
    div ecx ;edx stores remainder

    mov ebx, 0x00
    int 0x80
