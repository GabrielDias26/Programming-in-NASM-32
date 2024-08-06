section .data
    msg_result db 'O resultado da expressão a = (2 * b) + (c / 2) + 200 sendo b = 5 e c = 4 eh: %d', 10, 0

section .bss
    a resd 1
    b resd 1
    c resd 1

section .text
    extern printf
    global main

main:
    mov dword [b], 5
    mov dword [c], 4

    mov eax, [b]
    imul eax, 2
    mov [b], eax

    mov eax, [c]
    xor edx, edx
    mov ebx, 2
    div ebx

    add eax, [b]

    add eax, 200

    mov [a], eax

    push dword [a]
    push dword msg_result
    call printf
    add esp, 8

    mov eax, 1
    xor ebx, ebx
    int 0x80

