%include 'function.asm'

section .data
msg1:db	'Enter string: ',0h
msg2:db 'Number of vowels: ',0h
string:	TIMES 100 db 0

section .bss
len:	resb 10

section .text
global _start
_start:
	mov eax, msg1
	call sprintf

	mov esi,string
	call readString
	mov [len],edi
	
	mov eax, msg2
	call sprintf
	
	xor edi,edi
	xor edx,edx
	mov esi,string
	cnt_vowel:
		cmp edi,[len]
		je exit_cnt_vowel
		mov bl,byte[esi + edi]
		call isVowel
		cmp eax,1
		jne contin
		inc edx
		contin:
		inc edi
		jmp cnt_vowel
	exit_cnt_vowel:
	mov eax,edx
	call iprintf
	call breakline
	call quit
