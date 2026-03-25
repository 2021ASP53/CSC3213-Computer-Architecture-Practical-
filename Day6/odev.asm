.model small
.stack 100h
.data
	msg db "Enter a number : $"
	msg1 db "even",10,"$"
	msg2 db "odd",10,"$"
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg 
	mov ah,09h
	int 21h
	
	mov ah,01h  ; 6+48 =54
	int 21h
	
	sub al,48 	; al-48=6
	
	mov ah,00
	mov bl,2
	div bl 
	
	cmp ah,0
	mov dl,10
	
	mov ah,02h
	int 21h
	
	je Lblyes
	jne Lblno
	
	Lblyes:
		mov dx,offset msg1
		mov ah,09h
		int 21h
		jmp Endnn
		
	Lblno:
		mov dx,offset msg2
		mov ah,09h
		int 21h
	
	Endnn:
		mov ax,4c00h
		int 21h
	
end start

