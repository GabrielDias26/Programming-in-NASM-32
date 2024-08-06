section .data
    msg_apr db 'Aluno Aprovado', 10, 0
    msg_af db 'Aluno em Avaliação Final', 10, 0
    msg_rep db 'Aluno Reprovado', 10, 0

section .bss
    media resd 1
    n1 resd 1
    n2 resd 1
    n3 resd 1

section .text
    extern printf
    global main

main:
    mov dword [media], 0
    mov dword [n1], 7
    mov dword [n2], 5
    mov dword [n3], 5

nota:
    mov eax, [n2]
    imul eax, 2
    mov [n2], eax

    mov eax, [n3]
    imul eax, 3
    mov [n3], eax

    xor eax, eax
    add eax, [n1]
    add eax, [n2]
    add eax, [n3]

    xor edx, edx
    mov ebx, 3
    div ebx
    mov [media], eax

    cmp eax, 7
    jl aval_final

    ;Aprovado
    push msg_apr
    call printf
    add esp, 4
    jmp fim

aval_final:
    cmp eax, 4
    jl repr

    ;AF
    push msg_af
    call printf
    add esp, 4
    jmp fim

repr:
    push msg_rep
    call printf
    add esp, 4
    jmp fim

fim:
    xor ebx, ebx
    mov eax, 1
    int 0x80