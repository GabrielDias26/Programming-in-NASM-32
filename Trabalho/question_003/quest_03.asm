section .data
	msg_maior db 'O maior numero eh: %d', 10, 0
	msg_menor db 'O menor numero eh: %d', 10, 0
	my_array dd 12, 56, 31, 40, 80, 10, 6, 108, 200, 79
	
section .bss
	a resd 1
	b resd 1

section .text
	extern printf
	global main
	
main:
	mov ecx, 10
	mov dword [a], 10000
	mov dword [b], 1
	mov edi, 0
	
com_loop:
        ; Calcula o endereço atual
		mov eax, my_array
		mov ebx, edi
		imul ebx, 4
		add eax, ebx

		mov edx, [eax]

		mov ebx, [b]
		cmp edx, ebx
		jle skip_ma
		mov [b], edx

skip_ma:
		mov ebx, [a]
		cmp edx, ebx
		jge skip_me
		mov [a], edx
       	
skip_me:
	inc edi
	loop com_loop

	push dword [a]
	push dword msg_maior
	call printf
	add esp, 8

	push dword [b]
	push dword msg_menor
	call printf
	add esp, 8

