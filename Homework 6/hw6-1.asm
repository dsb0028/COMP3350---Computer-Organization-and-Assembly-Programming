;hw6-1.asm

INCLUDE Irvine32.inc

.data
	; declare variables here
		prompt BYTE "Enter an integer value to display War Eagle in either Blue or Orange: Blue(0), Orange(1)", 0
		str1 BYTE "War Eagle", 0
		BlueTextOnGray = blue + (lightGray * 16)
		DefaultColor = lightGray + (black * 16)
.code
main proc
	mov edx, OFFSET prompt
	call WriteString
	call Crlf
	call ReadInt
	mov ebx, eax
	call DisplayTiger
	mov ax, DefaultColor
	call	SetTextColor
	invoke ExitProcess,0
main endp 

;-----------------------------------------------------
DisplayTiger proc USES ebx
;
; Will display the string "War Eagle" in Blue or Orange depending upon the whether the input is 0 or 1.
; Receives: EAX =  0 | 1 | 2 , EBX = 0 | 1 | 2
; Returns: Returns the string "War Eagle" in either in Blue or Orange depending upon the whether the EBX register value is 0 or 1.
;-----------------------------------------------------

cmp ebx, 0
JZ printBlue
JNZ printOrange




printOrange:
	cmp ebx, 2
	JZ return
	mov	ax, red + (gray * 16)
	call	SetTextColor
	mov edx, OFFSET str1
	call WriteString
return: ret
printBlue:
	mov	ax,blue + (gray * 16)
	call	SetTextColor
	mov edx, OFFSET str1
	call WriteString
ret
DisplayTiger endp
end main

