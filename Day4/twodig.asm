; this is a program to read two digit numbers from user
.model small
.stack 100h
.data
	msg1 db "Enter the Number :$"
	t db 0 ;23
	o db 0
	dig db 0
	r db 0
	
.code
start:
    mov ax,@data
    mov ds,ax
	
	mov dx,offset msg1 
	mov ah,09h
	int 21h
	
	; read the first digit
	mov ah,01h ;al=50
	int 21h
	sub al,48 ;al-48=2
	mov t,al ;t=2
	
	;read the second digit
	mov ah,01h ;al=51
	int 21h
	sub al,48 ;al-48=3
	mov o,al ;o=3
	
	;t=2 o=3 t*10+3=23
	mov bl,10
	
	mov al,t ;al=t=2
	mul bl ;al=al*bl=2*10=20
	
	add al,o ;al=al+o=20+3=23
	mov dig,al ;dig=23/10=2 rem=3
	
	mov dl,10
	mov al,dig
	mov ah,00
	div bl ; al/bl=23/10=2 ah=3
	
	mov r,ah ;r=3
	
	mov dl,al ;print 2
	add dl,48
	mov ah,02h
	int 21h
	
	mov ax,4C00h
    int 21h

end start

