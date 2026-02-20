.model small   
.stack 100h
.data
n1 db 4
n2 db 2
n3 db 0		;n1/n2=4/2=ans =2 rem=0 ah
.code
start:
mov ax,@data   
mov ds,ax

mov ah,00
mov al,n1	;al=n1=4
div n2      ;n1/n2=4/2=2 ah=0
mov n3,ah

mov dl,al
add dl,48    

mov ah,02h
int 21h

mov ax,4c00h  
int 21h
end start 
