; putsreg16.asm
;-------------
; prints 16-bit register ax in hexadecimal format
;-------------

%ifndef PUTSREG16_ASM
%define PUTSREG16_ASM
%include "bootloader/io/print/putc.asm"

; prints 16-bit register ax
putsreg16:
	mov si, hexstr
	mov dx, ax

	mov bx, dx
	shr bx, 12
	and bx, 0xF
	add si, bx
	print_char [ds:si]
	mov si, hexstr
	mov bx, dx
	shr bx, 8
	and bx, 0xF
	add si, bx
	print_char [ds:si]
	mov si, hexstr
	mov bx, dx
	shr bx, 4
	and bx, 0xF
	add si, bx
	print_char [ds:si]
	mov si, hexstr
	mov bx, dx
	shr bx, 0
	and bx, 0xF
	add si, bx
	print_char [ds:si]

	mov ax, dx

	ret

%endif