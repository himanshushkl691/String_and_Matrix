%include 'function.asm'

section .data
msg1:db	'Enter a string to reverse: ',0h
msg2:db	'Reversed string: ',0h
msg3:db	'Length of reversed string is: ',0h
string:	TIMES 100 db 0
rev_string:	TIMES 100 db 0

section .bss
len:	resb	10
rev_len:	resb	10

section .text
global _start
_start:
	mov eax, msg1
	call sprintf
	
	mov esi, string
	call readString
	mov [len],edi

	mov eax,msg2
	call sprintf	
	mov esi, string
	mov edi, rev_string
	call reverse
	mov [rev_len],edx

	mov eax,rev_string
	call sprintfLF
	
	mov eax,msg3
	call sprintf
	mov eax,[rev_len]
	call iprintf
	call breakline
	
	call quit
