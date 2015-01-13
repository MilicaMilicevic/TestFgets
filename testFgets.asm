SECTION .data
format_printf	db	'Enter string:',10,0
lenght	dd	15

SECTION .bss
buffer	resb	16	;+0 at the end! IMPORTANT!

SECTION .text
global main
extern fgets,printf
extern	stdin
main:

;storage reg.values
push	ebp
mov	ebp,esp
push	ebx
push	esi
push	edi

write:
    push	format_printf
    call 	printf
    add 	esp,4

read:
    push 	dword[stdin]	;we want to read a value!
    push	dword[lenght]
    push 	buffer		;address of destination
    call 	fgets
    add 	esp,12
    

modify:
    mov		BYTE[buffer+15],0	;at last place put delimiter, so we can apply printf

write_result:
    push	buffer
    call printf
    add 	esp,4
    
;load reg. values
pop	edi
pop	esi
pop	ebx
mov	esp,ebp
pop	ebp
ret