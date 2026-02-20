.model small    ; declare model and satck size
.stack 100h
.data
msg db "hello $"  ; data segment
.code
start:
mov ax,@data    ; ax , ds are data segment register
mov ds,ax

mov dx,offset msg  ; dx - high level "string" , dl - low level "integer"
mov ah,09h   ; tell
int 21h   ; print the values

mov ax,4c00h  ; these are terminate function
int 21h
end start 
