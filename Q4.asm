%include 'function.asm'

section .data
msg1:db	'Enter a string: ',0h
msg2:db	'String is : ',0h
msg3:db	'Length of string is : ',0h
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
	
	mov eax,msg2
	call sprintf
	mov eax, string
	call sprintfLF
	
	mov eax, msg3
	call sprintf
	mov eax,[len]
	call iprintf
	call breakline

	call quit
