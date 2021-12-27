;     _    ____  __  __    _     _                            __   _  _
;    / \  / ___||  \/  |  | |   (_)_ __  _   ___  __   __  __/ /_ | || |
;   / _ \ \___ \| |\/| |  | |   | | '_ \| | | \ \/ /   \ \/ / '_ \| || |_
;  / ___ \ ___) | |  | |  | |___| | | | | |_| |>  <     >  <| (_) |__   _|
; /_/   \_\____/|_|  |_|  |_____|_|_| |_|\__,_/_/\_\   /_/\_\\___/   |_|
;
; This file has been cut down to only contain constants and macros
; needed by NoCat/lesser.
;
; Syscall:
;==================================================================
;ID 			rax	rdi		rsi		rdx	r10	r8	r9
;==================================================================
SYS_READ 	equ 0  ;hFile	sz		len
SYS_WRITE 	equ 1  ;hFile	sz		len
SYS_OPEN 	equ 2  ;mode	szFile	perm
SYS_CLOSE 	equ 3  ;hFile
SYS_EXIT 	equ 60 ;err_code

;SYS_READ + SYS_WRITE
STDIN  equ 0
STDOUT equ 1
STDERR equ 2

;SYS_OPEN
O_READ  equ 0
O_WRITE equ 1

%macro read 3
	mov rax, SYS_READ
	mov rdi, %1			; hFile
	mov rsi, %2			; Address of data
	mov rdx, %3
	syscall
%endmacro

%macro write 2
	mov rax, SYS_WRITE
	mov rdi, %1			; Destination
	mov rsi, %2			; Output
	call _rsi_len2rdx	; Length
	syscall
%endmacro

%macro writefixed 3
	mov rax, SYS_WRITE
	mov rdi, %1			; Destination
	mov rsi, %2			; Output
	mov rdx, %3			; Length
	syscall
%endmacro

%macro open 3
	mov rax, SYS_OPEN
	mov rdi, %1			; Source
	mov rsi, %2			; Buffer
	mov rdx, %3			; Length
	syscall
%endmacro

%macro close 1
	mov rax, SYS_CLOSE
	mov rdi, %1			; hFile
	syscall
%endmacro

%macro exit 1
	mov rax, SYS_EXIT
	mov rdi, %1			; Error code
	syscall
%endmacro

_rsi_len2rdx:
	mov rdx, rsi
	mov rcx, 0
_loop_rsi_len2rdx:
	inc rdx
	inc rcx
	mov bl, [rdx]
	cmp bl, 0
	jne _loop_rsi_len2rdx
	mov rdx, rcx
	ret
	
