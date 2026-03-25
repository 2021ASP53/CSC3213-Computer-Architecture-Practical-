.model small
.stack 100h

.data
n1 db 0
n2 db 0

m1 db "Enter first number (0-9): $"
m2 db 10,13,"Enter second number (0-9): $"
m3 db 10,13,"Sum: $"
m4 db 10,13,"Difference: $"
m5 db 10,13,"Product: $"
m6 db 10,13,"Quotient: $"
remMsg db " (Remainder $"
close db ")$"

.code
main proc
mov ax,@data
mov ds,ax

mov dx,offset m1
mov ah,09h
int 21h

mov ah,01h      
int 21h
sub al,48      
mov n1,al

mov dx,offset m2
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,48
mov n2,al

mov dx,offset m3
mov ah,09h
int 21h

mov al,n1
add al,n2
add al,48
mov dl,al
mov ah,02h
int 21h

mov dx,offset m4
mov ah,09h
int 21h

mov al,n1
sub al,n2
add al,48
mov dl,al
mov ah,02h
int 21h

mov dx,offset m5
mov ah,09h
int 21h

mov al,n1
mul n2
add al,48
mov dl,al
mov ah,02h
int 21h

mov dx,offset m6
mov ah,09h
int 21h

mov al,n1
mov ah,0
div n2          

mov bl,ah       

add al,48
mov dl,al
mov ah,02h
int 21h

mov dx,offset remMsg
mov ah,09h
int 21h

mov dl,bl       
add dl,48
mov ah,02h
int 21h

mov dx,offset close
mov ah,09h
int 21h

mov ax,4c00h
int 21h

main endp
end main

