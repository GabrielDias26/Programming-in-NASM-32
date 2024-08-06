section .data
	mensagem db 'Hello, World!'
section .text
	global _start
_start:
	CALL PRINTHELLO
	CALL FIM
	
PRINTHELLO:
	mov rax, 1
	mov rdi, 1
	mov rsi, mensagem
	mov rdx, 13
	syscall
FIM:
	mov rax, 60
	mov rdi, 0
	syscall
