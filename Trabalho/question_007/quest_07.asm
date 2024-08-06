    section .data
        msg_mult db 'A multiplicação de todos os números eh: %d', 10, 0
        my_array dw 1, 2, 3, 4, 5

    section .bss
        mult resd 1

    section .text
        extern printf
        global main

    main:
        mov dword [mult], 1
        xor edi, edi
        mov ecx, 5
        mov ebx, 1

    com_loop:
        mov ax, [my_array + 2*edi]
        imul bx, ax
        inc edi
        loop com_loop

        mov [mult], ebx
        push dword [mult]
        push dword msg_mult
        call printf
        add esp, 8
        
        xor ebx, ebx
        mov eax, 1
        int 0x80
