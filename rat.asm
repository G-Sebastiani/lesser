;            _              _                           _   _                             _
;           | |            | |                         | | | |                           | |
;  _ __ __ _| |_   ______  | | ___  ___ ___  ___ _ __  | |_| |__   __ _ _ __     ___ __ _| |_
; | '__/ _` | __| |______| | |/ _ \/ __/ __|/ _ \ '__| | __| '_ \ / _` | '_ \   / __/ _` | __|
; | | | (_| | |_           | |  __/\__ \__ \  __/ |    | |_| | | | (_| | | | | | (_| (_| | |_
; |_|  \__,_|\__|          |_|\___||___/___/\___|_|     \__|_| |_|\__,_|_| |_|  \___\__,_|\__|
; 
; Description:	Reads file [filename] and sends content to std_out. There is a 64k size limit.
;				Mainly a joke on the theme that More has grown big. Less is a lighweight way 
;				to view file content, but is has also grown big. People are using Cat to view
;				file content, but even Cat has grown new features. NoCat offers utlra
;				lightweight way of outputing file content. ;-)
;
; Usage:		nocat [filename]
;				Input: file given in [filename]
;				Output: File content to std_out.
;
%include "Linux_x64_mini.asm"
section .data
	szError1 	db "Wrong number of arguments. Usage: lesser 'file name'", 10, 0
	szError2 	db "Could not open file.", 10, 0
	qwLen		dq 65536

section .bss
	szBuf resb 65536		; 64k limit

section .text
	global _start

_start:
	;------------------------------------------------------------
	; Get filename from args:
	;------------------------------------------------------------
	pop rsi					; argc
	cmp rsi, 1				; if argc < 2
	je _error1				;   raise error 1 - missing arg
	pop rsi					; argv[0] = path
	;------------------------------------------------------------
	; Open the file:
	;------------------------------------------------------------
	pop rdi               	; argv[1] = filename
	open rdi, O_READ, 0644o
	;------------------------------------------------------------
	; Error check:
	;------------------------------------------------------------
	cmp rax, 0				; if file handle is missing
	je _error2				;   raise error 2 - file not found
	push rax				; Save file handle on stack
	;------------------------------------------------------------
	; Read file to buffer:
	;------------------------------------------------------------
	read [rsp], szBuf, qwLen
	;------------------------------------------------------------
	; Write from buffer to screen:
	;------------------------------------------------------------
	writefixed STDOUT, szBuf, qwLen
	;------------------------------------------------------------
	; Cleanup:
	;------------------------------------------------------------
	pop rdi					; File handle
	close rdi
	exit 0
_error1:
	write STDERR, szError1
	exit 1
_error2:
	write STDERR, szError2
	exit 2

