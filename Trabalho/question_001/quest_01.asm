section .data
    msg_even db 'A soma dos números pares é: %d', 10, 0
    msg_odd db 'A soma dos números ímpares é: %d', 10, 0

section .bss
    num_even resd 1
    num_odd resd 1

section .text
    extern printf
    global main

main:
    ; Inicializa os valores
    mov dword [num_even], 0
    mov dword [num_odd], 0

    mov ecx, 100        

sum_loop:
    mov eax, ecx        
    and eax, 1          
    jz even             

    ; Se for ímpar
    mov eax, [num_odd]
    add eax, ecx
    mov [num_odd], eax
    jmp next

even:
    ; Se for par
    mov eax, [num_even]
    add eax, ecx
    mov [num_even], eax

next:
    loop sum_loop       

    ; Imprime a soma dos números pares
    push dword [num_even]
    push dword msg_even
    call printf
    add esp, 8       

    ; Imprime a soma dos números ímpares
    push dword [num_odd]
    push dword msg_odd
    call printf
    add esp, 8          

    ; Termina o programa
    mov eax, 0          ; Código de saída 0
    ret

