%include 'function.asm'

section .data
msg1:db	'Enter row: ',0h
msg2:db 'Enter column: ',0h
msg3:db	'Enter matrix element',0h
msg4:db	'Transpose of given matrix',0h
mat0:	TIMES 10000 dd 0
res:	TIMES 10000 dd 0

section .bss
n0:	resb	10
l0:	resb	10
row:	resb	4
col:	resb	4

section .text
global _start
_start:
	mov eax, msg1
	call sprintf
	
	mov eax, 3
	mov ebx, 0
	mov ecx, n0
	mov edx, l0
	call sys
	
	mov esi,n0
	call atoi
	mov [row],eax
	
	mov eax,msg2
	call sprintf
	
	mov eax, 3
	mov ebx, 0
	mov ecx, n0
	mov edx, l0
	call sys
	
	mov esi,n0
	call atoi
	mov [col],eax
	
	imul eax,[row]
	
	push eax
	mov eax,msg3
	call sprintfLF
	pop eax
	
	mov esi,mat0
	mov ecx,eax
	call readArray
	
	mov edx,[row]
	mov ecx,[col]
	call printMatrix

	mov edi,res
	call transpose
	mov eax, msg4
	call sprintfLF
	mov edx,[col]
	mov ecx,[row]
	mov esi,edi
	call printMatrix
	call quit
