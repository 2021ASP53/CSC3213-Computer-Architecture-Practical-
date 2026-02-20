.model small   
.stack 100h
.data
n1 db 4
n2 db 2
.code
start:
mov ax,@data   
mov ds,ax

mov al,n1  ;al=4    
mul n2	;al=al*n2=4*2=8  
mov dl,al
add dl,48    

mov ah,02h
int 21h

mov ax,4c00h  
int 21h
end start 
