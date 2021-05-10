;hw7-1.asm

INCLUDE Irvine32.inc

.data

;MyArray1 BYTE  'a', 'B', 'c', 'D', 'e', 'F'
;MyArray1 BYTE  44, 3, 8, 22, 12, 34
;MyArray1 BYTE  67, -3, 74, 'G', 'W',92
;MyArray1 BYTE  5, 'H', 74, 'G', 'W',92
;MyArray1 BYTE  4, 2, 11, 'r', 'W',92
MyArray1 BYTE  10, 3, 'J', -22, 'W',92
message BYTE "alphabet found! ", 0
message1 BYTE " Index: ", 0
message2 BYTE "Value: ", 0
message3 BYTE "No alphabet found!", 0

.code
main PROC

mov esi, OFFSET MyArray1
mov ecx, LENGTHOF MyArray1
mov esi, 0

L1: cmp esi, ecx
jl L2
jmp NotFound

L2: 
cmp MyArray1[esi], 'A' ; if(MyArray[esi] >= 'A')
jge L3
jb  L6


L3: 
cmp MyArray1[esi], 'Z'
jle Found
jg L4


L4: 
cmp MyArray1[esi], 'a' 
jge L5
jb L6


L5:
cmp MyArray1[esi], 'z'
jle Found
jg L6

L6:
	inc esi
	jmp L1



Found:
mov al, MyArray1[esi]
mov edx, OFFSET message
call WriteString
mov edx, OFFSET message2
call WriteString
mov al, MyArray1[esi]
call WriteChar
mov edx, OFFSET message1
call WriteString
mov eax, esi
call WriteDec
jmp quit

NotFound:
mov edx, OFFSET message3
call WriteString

quit:
call Crlf
exit

invoke ExitProcess,0
main endp
end main