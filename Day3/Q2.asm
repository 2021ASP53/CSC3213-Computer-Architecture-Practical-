.model small
.stack 100h
.data
	msg1 db "Enter the first number: $"
	msg2 db "Enter the second number: $"
	msg3 db "The sum is: $"
	n1 db 0
	n2 db 0
.code
start:
	mov ax,@data	;ax= al+ah
	mov ds,ax

	mov dx,offset msg1 ;Print the msg1 , dx= dl+dh
	mov ah,09h
	int 21h

	mov ah,01h ;Read input number1
	int 21h;2=al=50-48
	
	sub al,48;al=al-48=2
	mov n1,al;n1=2
	
	mov dl,10  ;nextline(can use 10 or 0ah)
	mov ah,02h
	int 21h
	
	mov dx,offset msg2 ;Print the msg2
	mov ah,09h
	int 21h
	
	mov ah,01h ;Read input number2
	int 21h
	
	sub al,48
	mov n2,al;n2=3
	
	mov dl,0ah  ;nextline(can use 10 or 0ah)
	mov ah,02h
	int 21h
	
	mov dx,offset msg3 ;Print the msg3
	mov ah,09h
	int 21h
	
	mov dl,n1 ; get sum dl=n1
	sub dl,n2 ; add n1,n2;dl=dl+n2
	
	add dl,48 ; print sum
	mov ah,02h
	int 21h

	mov ax,4c00h
	int 21h
end start

