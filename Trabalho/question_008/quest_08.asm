section .data
    msg_maior db 'O segundo maior numero eh: %d', 10, 0
	msg_menor db 'O segundo menor numero eh: %d', 10, 0
    my_array dd 12, 56, 31, 40, 80, 10, 6, 108, 200, 79

section .bss
        a resd 1  ; Maior
        b resd 1  ; Menor
        c resd 1  ; Segundo Menor
        d resd 1  ; Segundo Maior
    
section .text
        extern printf
        global main

        main:
            mov ecx, 10
            mov dword [a], -1
            mov dword [b], 10000
            mov dword [c], 10000
            mov dword [d], -1
            mov edi, 0
            
        com_loop:
                mov eax, my_array
                mov ebx, edi
                imul ebx, 4
                add eax, ebx

                mov edx, [eax]
                
                cmp edx, [a]
                jle check_max2
                mov eax, [a]
                mov [d], eax
                mov [a], edx
                jmp check_min

        check_max2:
            cmp edx, [d]
            jle check_min
            mov [d], edx

        check_min:
            cmp edx, [b]
            jge check_min2
            mov eax, [b]
            mov [c], eax
            mov [b], edx
            jmp next

        check_min2:
            cmp edx, [c]
            jge next
            mov [c], edx

        next:
            inc edi
            loop com_loop

            push dword [d]
            push dword msg_maior
            call printf
            add esp, 8

            push dword [c]
            push dword msg_menor
            call printf
            add esp, 8

            xor ebx, ebx
            mov eax, 1
            int 0x80
