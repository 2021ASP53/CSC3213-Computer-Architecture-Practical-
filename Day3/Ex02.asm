.model small
.stack 100h
.data
n1 db 4
n2 db 2
m1 db "Enter the first number:$"
m2 db "Enter the second number:$"
m3 db "Sum:$"
m4 db "Difference:$"
m5 db "Product:$"
m6 db "Quotient:$"
.code
mov ax,@data
mov ds,ax

mov dx,offset m1;num01 =4
mov ah,09h
int 21h

mov dl,n1
add dl,48
mov ah,02h
int 21h

mov dl,10 
mov ah,02h
int 21h

mov dx,offset m2;num02 =2
mov ah,09h
int 21h

mov dl,n2
add dl,48
mov ah,02h
int 21h

mov dl,10 
mov ah,02h
int 21h

mov dx,offset m3
mov ah,09h
int 21h

mov dl,n1
add dl,n2
add dl,48

mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h

mov dx,offset m4
mov ah,09h
int 21h

mov dl,n1
sub dl,n2
add dl,48

mov ah,02h
int 21h

mov dl,10
mov ah,02h
int 21h

mov dx,offset m5
mov ah,09h
int 21h

mov al,n1
mul n2
mov dl,al
add dl,48

mov ah,02h
int 21h


mov dl,10
mov ah,02h
int 21h

mov dx,offset m6
mov ah,09h
int 21h

mov ah,00
mov al,n2
div n1
mov dl,al
add dl,48

mov ah,02h
int 21h

mov ax,4c00h
int 21h
end
