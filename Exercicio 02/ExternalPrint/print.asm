section .data
	val db 5

section .text
	extern printf
	
global main
main:
	mov rdi, fmt
	mov eax, dword[val]
	add eax, 2
	mov esi, eax
	xor eax,eax
	call printf
	ret
	
section .data
	fmt db "valor = %d, eax = %d", 10, 0
