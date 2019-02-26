%include 'function.asm'

section .data
msg1:db	'Enter first string: ',0h
msg2:db	'Enter second string to compare: ',0h
msg3:db	'Same!!',0h
msg4:db	'Not same!!',0h
string0:	TIMES 100 db 0
string1:	TIMES 100 db 0

section .text
global _start
_start:
	mov eax, msg1
	call sprintf
	
	mov esi,string0
	call readString
	
	mov eax,msg2
	call sprintf
	
	mov esi,string1
	call readString
	
	mov esi,string0
	mov edi,string1
	call compare
	cmp edx,1
	je Y
	N:
	mov eax, msg4
	call sprintfLF
	jmp EX
	Y:
	mov eax, msg3
	call sprintfLF
	EX:
	call quit
