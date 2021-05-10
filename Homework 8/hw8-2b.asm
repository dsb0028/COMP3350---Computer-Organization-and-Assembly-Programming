; (hw8-2b.asm)

INCLUDE Irvine32.inc

.data
binVal	DWORD 0A1BC23D4h		
.code
main PROC
	mov	eax,binVal			; EAX = binary integer
	mov ebx, 00f00ff0fh
	AND eax, ebx
	rol al, 4
	rol eax, 4
	mov dl, ah
	rol eax, 16
	rol ax, 4
	rol al, 4
	mov dh, al
	movzx eax, dx
	call WriteHex
	exit
main ENDP
END main