section .data
    msg_even db 'O número %d é par', 10, 0
    msg_odd db 'O número %d é impar', 10, 0

section .bss
    num resd 1

section .text
    extern printf
    global main

main:
    mov dword [num], 59
    mov eax, [num]
    and eax, 1
    jz even
    jmp next
    

even:
    push dword [num]
    push dword msg_even
    call printf
    add esp, 8

next:
    push dword [num]
    push dword msg_odd
    call printf
    add esp, 8

    mov eax, 0
    ret