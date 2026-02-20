.model small   
.stack 100h
.data
n1 db 2
n2 db 1
.code
start:
mov ax,@data   ; ax=16bit we can divide ax=ah+al where ah=al=8bits 
mov ds,ax

mov dl,n1      ; dx=dh+dl ; dl=2
add dl,n2	   ; n1+n2 ; dl=dl+n2=3
add dl,48      ; dl=dl+48=3+48=51

mov ah,02h
int 21h

mov ax,4c00h  
int 21h
end start 
