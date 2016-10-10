;;boot.asm
bits 32 ;nasm directive - 32 bit
section .text
	;multiboot spec
	align 4
	dd 0x1BADB002 ;magic
	dd 0x00 ;flags
	dd - (0x1BADB002 + 0X00) ;checksum m+f+c tiene que ser cero

global start

extern kmain	;kmain se define en el archivo c

start:
cli
mov esp, stack_space
call kmain
hlt

section .bss
stack_space: resb 8192 ;8k para el stack
