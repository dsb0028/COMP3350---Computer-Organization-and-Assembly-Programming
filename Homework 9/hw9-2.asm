include irvine32.inc

.data
BCDnum1 DWORD ?
BCDnum2 DWORD ?
diff    DWORD ?
prompt1 BYTE "Enter two 8-digit BCD numbers (performing 8-digit BCD subtraction): ", 0
extraSpace BYTE "  ", 0  
equalBar   BYTE "____________", 0
subOP   BYTE "- ", 0
negOP   BYTE " -", 0
.code
main proc
;Initialize difference and index
mov diff, 0
mov esi, 0

mov edx, OFFSET prompt1
call WriteString
call crlf
mov edx, OFFSET extraSpace  
call WriteString
call ReadHex
mov BCDnum1, eax
mov edx, OFFSET subOP
call WriteString
call ReadHex
mov BCDnum2, eax
mov edx, OFFSET equalBar
call WriteString
call Crlf
mov eax, BCDnum1
cmp eax, BCDnum2
JC Count
mov edx, OFFSET extraSpace
call WriteString
mov ecx, 4
L1:
mov al, BYTE PTR BCDnum1[esi]
sbb al, BYTE PTR BCDnum2[esi]
das
mov BYTE PTR diff[esi], al
inc esi
loop L1
mov eax, diff
call WriteHex
jmp return

Count: mov ecx, 4
clc
L2:
mov al, BYTE PTR BCDnum2[esi]
sbb al, BYTE PTR BCDnum1[esi]
das
mov BYTE PTR diff[esi], al
inc esi
loop L2

mov edx, OFFSET negOP
call WriteString
mov eax, diff
call WriteHex
return: exit
invoke ExitProcess, 0
main endp
end main