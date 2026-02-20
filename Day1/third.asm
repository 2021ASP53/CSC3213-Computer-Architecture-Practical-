.model small    
.stack 100h
.data
n1 db 2
msg db "Number $"  
.code
start:

mov ax,@data    
mov ds,ax

mov dx,offset msg  
mov ah,09h   
int 21h   

mov dl,10
mov ah,02h
int 21h

mov dl,n1  ;dl=2
add dl,48  ;dl=dl+48=2+48=50  
mov ah,02h
int 21h

mov ax,4c00h  ; these are terminate function
int 21h
end start 
