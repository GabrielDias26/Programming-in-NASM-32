section .data
    fmt db "Teste tipos de dados: %c %s %d %X %e %E", 10, 0
    c db 'e', 0
    s db "string", 0
    i dq 7654321
    h dq 0x6789ABCD
    f dq -1.234e-1
    d dq 77.6e3

section .text
    extern printf

global main

main:
    mov rdi, fmt
    mov al, [c]
    mov rsi, s
    mov rdx, [i]
    mov rcx, [h]
    mov r8, [f]
    mov r9, [d]
    call printf

    mov eax, 60
    xor edi, edi
    syscall

