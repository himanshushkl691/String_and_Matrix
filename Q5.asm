%include 'function.asm'

section .data
msg1:db	'Enter string to check for palindrome: ',0h
msg2:db	'String is not Palindrome!',0h
msg3:db	'String is Palindrome!!!',0h
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

	mov esi,string
	call readString
	mov [len],edi

	mov esi,string
	call isPalindrome
	cmp edx,1
	je yes
	no:
	mov eax, msg2
	call sprintfLF
	jmp ex
	yes:
	mov eax,msg3
	call sprintfLF
	ex:
	call quit
