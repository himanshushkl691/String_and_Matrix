%include 'function.asm'

section .data
msg1:db	'Enter rows: ',0h
msg2:db	'Enter columns: ',0h
msg3:db	'Enter matrix-1 element',0h
msg4:db 'Enter matrix-2 element',0h
mat0:	TIMES 10000 dd 0
mat1:	TIMES 10000 dd 0
res2:	TIMES 10000 dd 0

section .bss
n0:	resb	10
l0:	resb	10
row:	resb	4
column:	resb	4

section .text
global _start
_start:
	mov eax,msg1
	call sprintf
	
	mov eax, 3
	mov ebx, 0
	mov ecx, n0
	mov edx, l0
	call sys
	
	mov esi,n0
	call atoi
	mov [row],eax
	
	mov eax, msg2
	call sprintf
	
	mov eax, 3
	mov ebx, 0
	mov ecx, n0
	mov edx, l0
	call sys
	
	mov esi,n0
	call atoi
	mov [column],eax

	mov edi,[column]
	imul edi,[row]

	mov eax,msg3
	call sprintfLF
	mov esi,mat0
	mov ecx,edi
	call readArray
	
	mov eax,msg4
	call sprintfLF
	
	mov esi,mat1
	mov ecx,edi
	call readArray
	
	mov esi,mat0
	mov edi,mat1
	mov eax,res2
	mov edx,[row]
	mov ecx,[column]
	call addMatrix
	
	mov esi,res2
	mov edx,[row]
	mov ecx,[column]
	call printMatrix
	
	call quit
