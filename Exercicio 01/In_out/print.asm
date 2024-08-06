section .data
	msg db "Digite um número entre 0-9: ", 0
	mens db "O seu número é: ", 0
	
	lens equ $ - msg
	len equ $ - mens
	
section .bss
	num resd 1
	
section .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, lens
	int 0x80
	
	mov eax, 3
	mov ebx, 0
	mov ecx, num
	mov edx, 4
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, mens
	mov edx, len
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 4
	int 0x80
	
	mov eax, 1
	xor ebx, ebx
	int 0x80
