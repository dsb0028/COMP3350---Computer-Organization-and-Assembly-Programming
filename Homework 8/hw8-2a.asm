;hw8-2a.asm

INCLUDE Irvine32.inc

.data
string1 BYTE "Enter an integer: ", 0
message1 BYTE "EBX = ", 0
message2 BYTE "EBX * 11 = ", 0
message3 BYTE "Binary value of EBX: ", 0
message4 BYTE "Binary value of RESULT: ", 0
.code
main PROC
mov edx, OFFSET string1
call WriteString
call ReadInt
mov edx, OFFSET message1
call WriteString
call WriteInt
call Crlf
mov edx, OFFSET message3
call WriteString
call WriteBin
call Crlf
mov ebx, eax
shl ebx, 3
push ebx
mov ebx, eax
shl ebx, 1
shl eax, 0
add eax, ebx
pop ebx
add eax, ebx
mov edx, OFFSET message2
call WriteString
call WriteInt
call Crlf
mov edx, OFFSET message4
call WriteString
call WriteBin
invoke ExitProcess,0
main ENDP 
end main
