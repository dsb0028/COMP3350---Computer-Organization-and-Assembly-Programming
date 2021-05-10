include irvine32.inc

.data
xVal DWORD ?
aVal DWORD ?
bVal DWORD ?
cVal DWORD ?
prompt BYTE "A program that computes X = A - B + C", 0
prompta BYTE "Enter a value for A: ", 0
promptb BYTE "Enter a value for B: ", 0
promptc BYTE "Enter a value for C: ", 0
promptx BYTE "X = ", 0

.code
main proc
mov edx, OFFSET prompt 
call WriteString
call crlf

mov edx, OFFSET prompta
call WriteString
call ReadInt
mov aVal, eax

mov edx, OFFSET promptb
call WriteString
call ReadInt
mov bVal, eax

mov edx, OFFSET promptc 
call WriteString
call ReadInt
mov cVal, eax

push aVal
push bVal
push cVal
push xVal
call ArithmeticExpression
invoke ExitProcess, 0
main endp

;-----------------------------------------------------
; ArithmeticExpression PROC
;
; Computes X=A-B + C. 
; The 32-bit variables A, B, and C must be passed as value to the stack.  
; The  value X should be returned on the top of the stack upon return 
; from the procedure and its address must be
; returned as reference in the register EDI of the program. 
; 
; Requires: A, B, and C must all be passed by value to the stack.
; Receives: aVal, bVal, cVal
; Returns: xVal on the top of the stack and returns its address in the EDI register
;-----------------------------------------------------
x_local EQU DWORD PTR [esp + 8]
ArithmeticExpression PROC
push ebp
mov ebp, esp
mov eax, aVal
sub eax, bVal
add eax, cVal
mov x_local, eax
lea edi, x_local
mov edx, OFFSET promptx
call WriteString
call WriteInt  
pop ebp
ret 
ArithmeticExpression endp
END main
