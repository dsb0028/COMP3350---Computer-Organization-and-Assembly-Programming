include irvine32.inc
;A program that computes the number of characters in any string.  
;Test the robustness of your program using different strings including those of size 0. 
.data
prompt BYTE "Enter a string: ", 0
SomeString1 BYTE ?
msg  BYTE "Total number of characters: ", 0
MAX = 80
COUNT = 0
.code
main proc
mov edx, OFFSET prompt
call WriteString
call crlf
mov edx, OFFSET SomeString1
mov ecx, MAX
call ReadString

mov ecx, LENGTHOF SomeString1
inc ecx
mov edi, OFFSET SomeString1
mov eax, COUNT
L1: cmp BYTE PTR[edi], 0
    je L2
    inc edi
    inc eax
    jmp L1

L2:
call crlf
call WriteDec
invoke ExitProcess, 0
main endp
end main