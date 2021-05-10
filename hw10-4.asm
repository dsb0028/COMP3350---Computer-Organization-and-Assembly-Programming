include irvine32.inc

;Write a program that displays the z-coordinates of several points given as an array of coordinates in the data segment. 
;Unlike the example in the book you should use 3-dimensional points. 
;Test your program with various (x, y, z) 
;Use base-indexed addressing to implement the program.

Point STRUCT
	X SWORD ?
	Y SWORD ?
	Z SWORD ?
Point ENDS

.data
xyzCoords Point {-1,2,3}, {-3,4,-5}, {-5,7,9}, {6,8,0}, {7,3,-5}
.code
main PROC
mov esi, OFFSET xyzCoords
mov ax, (Point PTR[esi]).Z
movsx eax, ax
call WriteInt
mov ax, (Point PTR[esi + 6]).Z
movsx eax, ax
call WriteInt
mov ax, (Point PTR[esi + 12]).Z
movsx eax, ax
call WriteInt
mov ax, (Point PTR[esi + 18]).Z
movsx eax, ax
call WriteInt
mov ax, (Point PTR[esi + 24]).Z
movsx eax, ax
call WriteInt

invoke ExitProcess, 0
main endp
end main