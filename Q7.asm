%include 'function.asm'

section .data
msg1:db	'Enter first string: ',0h
msg2:db	'Enter second string: ',0h
msg3:db	'Concatenated string: ',0h
string0:	TIMES 100 db 0
string1:	TIMES 100 db 0
string2:	TIMES 200 db 0

section .bss
len0:	resb	10
len1:	resb	10
len2:	resb	10

section .text
global _start
_start:
	mov eax, msg1
	call sprintf
	
	mov esi,string0
	call readString
	mov [len0],edi

	mov eax, msg2
	call sprintf
	
	mov esi,string1
	call readString
	mov [len1],edi
	
	mov ecx,[len0]
	add ecx,[len1]
	mov [len2],ecx
	
	mov eax,msg3
	call sprintf
	mov esi,string0
	mov edi,string1
	mov ecx,string2
	call concatenate
	mov eax,string2
	call sprintfLF		
	call quit
