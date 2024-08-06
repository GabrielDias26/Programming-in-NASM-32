section .data
    msg_sum db 'A soma de todos os números eh: %d', 10, 0
    my_array dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

section .bss
    sum resd 1

section .text
    extern printf
    global main

main:
    mov dword [sum], 0
    xor edi, edi
    mov ecx, 10
    xor eax, eax

com_loop:
    add ax, [my_array + edi*2] 
    inc edi
    loop com_loop

    mov [sum], eax
    push dword [sum]
    push dword msg_sum
    call printf
    xor ebx, ebx
    int 0x80