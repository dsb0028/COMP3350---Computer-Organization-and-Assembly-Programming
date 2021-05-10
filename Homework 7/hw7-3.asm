;hw7-3.asm

INCLUDE Irvine32.inc

.data
str1 BYTE "Value of sensor 1: ", 0
str2 BYTE "Value of sensor 2: ", 0
message BYTE "Difference of Sensor Values: ", 0
message1 BYTE "  Agree ", 0
message2 BYTE " Disagree", 0
message3 BYTE " Take Action", 0
errmess BYTE " Values differ by more than +/- 4! ", 0
errmess1 BYTE "Sensor values of 1 and 2 are both greater than equal to 50! ", 0
sens1Val DWORD ?
sens2Val DWORD ?
diff DWORD ?

.code
main PROC
mov edx, OFFSET str1
call WriteString
call ReadInt
mov sens1Val, eax

mov edx, OFFSET str2
call WriteString
call ReadInt


;Finding difference for the values of Sensors 1 and 2

mov edx, OFFSET message
call WriteString

mov sens2Val, eax
mov eax, sens1Val
sub eax, sens2Val
mov diff, eax
call WriteInt

cmp eax, +4
jle lowBound
jg error

lowBound:
cmp eax, -4
jge accept
jl error

accept:
mov edx, OFFSET message1
call WriteString
mov eax, 50
cmp sens1Val, eax
jge checkSens2Val
exit 

checkSens2Val:
mov eax, 50
cmp sens2Val, eax
jge sensValslargerthanfifty

sensValslargerthanfifty:
call Crlf
mov edx, OFFSET errmess1
call WriteString
mov edx, OFFSET message3
call WriteString
exit

error:
mov edx, OFFSET errmess
call WriteString

mov edx, OFFSET message2
call WriteString
exit

invoke ExitProcess,0
main ENDP
end main