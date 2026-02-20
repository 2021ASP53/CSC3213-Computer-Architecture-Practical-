.model small
.stack 100h
.data
msg db "Hello",13,"hi $"  ; Hillo ; 13 move to begining of code
.code

start:
mov ax,@data
mov ds,ax

mov dx,offset msg
mov ah,09h
int 21h

mov ax,4c00h  
int 21h
end start 
