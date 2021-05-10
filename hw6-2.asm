; hw6-2.asm

INCLUDE Irvine32.inc
.data
PromptUser BYTE "Please enter a value:", 0
Stackcontent BYTE "Here are the stack values:", 0
inputArray DWORD 5 DUP(?)
.code
main proc
mov ecx, LENGTHOF inputArray
mov esi, OFFSET inputArray

L1:
mov edx,OFFSET PromptUser
call  WriteString
call  Crlf
call  ReadInt
push eax
loop l1

call Crlf
mov edx, OFFSET Stackcontent
call WriteString
mov ecx, LENGTHOF inputArray

L2:
pop eax
call Crlf
call WriteInt
loop L2

invoke ExitProcess,0
main endp 
end main