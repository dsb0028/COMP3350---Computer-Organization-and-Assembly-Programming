; hw6-3.asm

INCLUDE Irvine32.inc

.data
	prompt  BYTE "Please input a value: ", 0
	spacing BYTE ", ",0 
	Str2 BYTE "The target value is ", 0
	Str3 BYTE "and is located at index: ", 0
	Str4 BYTE  "Value not found,", 0
	target SDWORD ?
	firstValue SDWORD ?
.code
	main proc


	mov ecx, 5
	mov esi, 0

	input:
	mov edx, OFFSET prompt
	call WriteString
	mov edx, OFFSET spacing
	call WriteString
	call ReadInt
	push eax
	loop input
	mov ebp, esp

	mov edx, OFFSET Str2
	call WriteString
	call ReadInt
	

	call Search
	
	invoke ExitProcess,0
	main endp
	;-----------------------------------------------------------------------------------------------------------------------------------;
	Search proc USES ebp
	;-----------------------------------------------------------------------------------------------------------------------------------;
	; Searches the stack for the value that you provide in the register AX and returns its index.
	; Receives: AX
	; Returns: Returns the index of the value stored in AX, assuming the first value is stored in index 0

	;-----------------------------------------------------------------------------------------------------------------------------------;
	
	mov ebx, [ebp + 16]
	mov firstValue, ebx

	cmp eax, [ebp]	
	JZ fifthVal
	JNZ forthVal
	
	fifthVal:
	mov edx, OFFSET Str3
	call WriteString
	mov eax, 4
	call WriteDec
	
	ret


	forthVal:
	cmp eax, [ebp + 4]
	JNZ thirdVal
	mov edx, OFFSET Str3
	call WriteString
	;pop [ebp + 4]
	mov eax, 3
	call WriteDec	
	ret

	thirdVal:
	cmp eax, [ebp + 8]
	JNZ secVal
	mov edx, OFFSET Str3
	call WriteString
	mov eax, 2
	call WriteDec
	ret

	secVal:
	cmp eax, [ebp + 12]
	JNZ fVal
	mov edx, OFFSET Str3
	call WriteString
	mov eax, 1
	call WriteDec
	ret

	fVal:	
	cmp eax, [ebp + 16]
	JNZ ValNotFound
	mov edx, OFFSET Str3
	call WriteString
	mov eax, 0
	call WriteDec
	ret

	ValNotFound:
	mov edx, OFFSET Str4
	call WriteString
	mov eax, -1
	call WriteInt
	ret
	Search endp
	end main