%include 'function.asm'

section .data
msg1:db	'Enter string: ',0h
msg2:db	'Number of spaces: ',0h
string:	TIMES 100 db 0

section .bss
len:	resb	10

section .text
global _start
_start:
	mov eax, msg1
	call sprintf

	mov esi,string
	call readString
	mov [len],edi
	
	xor edi,edi
	xor edx,edx
	cnt_space:
		cmp edi,[len]
		je exit_cnt_space
		cmp byte[esi + edi],32
		jne cont
		inc edx
		cont:
		inc edi
		jmp cnt_space
	exit_cnt_space:
		mov eax, msg2
		call sprintf
		mov eax,edx
		call iprintf
		call breakline
	call quit	
