; bootloader.asm
;-------------
; Main bootloader file
;-------------

	BITS 16

[ORG 0x7C00]

jmp bootloader

; Necessary includes for bootloader:
; -> IO
    %include "bootloader/io/io.inc"
; -> Misc
    %include "bootloader/cursor.asm"
    %include "bootloader/constants.asm"

bootloader:
	mov ax, 0
	mov ds, ax
	mov ss, ax

	reset_cursor
	clear_screen 0xF
	reset_cursor
	print_string msg, endl
	mov ax, 0x7098
	call putsreg16
	cmp ax, 0x7098
	jne .ne
	print_char "Y"
	.ne:

	jmp $				; Jump here - infinite loop!



msg  db "Starting INKEREX bootloader..", 0
times 510-($-$$) db 0	; Pad remainder of boot sector with 0
dw 0xAA55
