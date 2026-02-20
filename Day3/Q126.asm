.model small
.stack 100h
.data
n1 db 2
n2 db 3
m1 db "num 01:$"
m2 db "num 02:$"
m3 db "add num1 and num2:$"
m4 db "sub num2 and num1:$"
m5 db "mul num1 and num2:$"
m6 db "div num2 and num1:$"
.code
mov ax,@data
mov ds,ax

mov dx,offset m1;num01 =2
mov ah,09h
int 21h

mov dl,n1
add dl,48
mov ah,02h
int 21h

mov dl,10 
mov ah,02h
int 21h

mov dx,offset m2;num02 =3
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

mov dl,n2
sub dl,n1
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