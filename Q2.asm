%include 'function.asm'

section .data
msg1:db	'Enter row of matrix-1: ',0h
msg2:db	'Enter column of  matrix-1: ',0h
msg3:db	'Enter matrix-1 element',0h
msg4:db	'Enter row of matrix-2: ',0h
msg5:db	'Enter column of matrix-2: ',0h
msg6:db	'Enter matrix-2 element',0h
msg7:db	'Result of multiplying 1 and 2',0h
mat0:	TIMES 10000 dd 0
mat1:	TIMES 10000 dd 0
res:	TIMES 10000 dd 0

section .bss
n0:	resb	10
l0:	resb	10
row0:	resb	4
col0:	resb	4
row1:	resb	4
col1:	resb	4
l:	resb	4
m:	resb	4
n:	resb	4

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
	mov [row0],eax
	
	mov eax, msg2
	call sprintf
	
	mov eax, 3
	mov ebx, 0
	mov ecx, n0
	mov edx, l0
	call sys
		
	mov esi,n0
	call atoi
	mov [col0],eax
	
	mov eax, msg3
	call sprintfLF
	
	mov edi,[col0]
	imul edi,[row0]
	mov esi,mat0
	mov ecx, edi
	call readArray
	
	mov eax,msg4
	call sprintf

	mov eax, 3
	mov ebx, 0
	mov ecx, n0
	mov edx, l0
	call sys

	mov esi,n0
	call atoi
	mov [row1],eax
	
	mov eax, msg5
	call sprintf
	
	mov eax, 3
	mov ebx, 0
	mov ecx, n0
	mov edx, l0
	call sys
	
	mov esi,n0
	call atoi
	mov [col1],eax
	
	mov eax, msg6
	call sprintfLF
	
	mov edi,[col1]
	imul edi,[row1]
	mov esi,mat1
	mov ecx,edi
	call readArray
	
	mov esi,mat0
	mov edi,mat1
	mov edx,res
	mov dword[l],0
	mov eax,[row0]
	mov ebx,[col1]
	mov ecx,[col0]
	mult:
		cmp [l],eax
		je exit_mult
		mov dword[m],0
		second_loop:
			cmp [m],ebx
			je exit_second
			mov dword[n],0
			third_loop:
				cmp [n],ecx
				je exit_third
				push eax
				push ebx
				push esi
				push ecx
				push edx
				mov eax,[l]
				mov ebx,[n]
				mov esi,mat0
				mov ecx,[col0]
				call access
				mov ecx,dword[edx]
				push ecx
				mov eax,[n]
				mov ebx,[m]
				mov esi,mat1
				mov ecx,[col1]
				call access
				mov eax,dword[edx]
				pop ecx
				imul ecx,eax
				push ecx
				mov eax,[l]
				mov ebx,[m]
				mov ecx,[col1]
				mov esi,res
				call access
				pop ecx
				add dword[edx],ecx
				pop edx
				pop ecx
				pop esi
				pop ebx
				pop eax
				inc dword[n]
				jmp third_loop
			exit_third:
			inc dword[m]
			jmp second_loop
		exit_second:
		inc dword[l]
		jmp mult
	exit_mult:
	mov esi,res
	mov edx,[row0]
	mov ecx,[col1]
	call printMatrix

	call quit			
