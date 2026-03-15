.model small
.stack 100h
.data
	msg1 db "Enter the Number1 :$"
	msg2 db "Enter the Number2 :$"
	msg3 db "The addition is :$"
	msg4 db "The subtraction value is :$"
	t1 db 0
	o1 db 0
	dig1 db 0
	r1 db 0
	t2 db 0
	o2 db 0
	dig2 db 0
	r2 db 0
	a db 0
	s db 0
	
.code
start:
    mov ax,@data
    mov ds,ax
	
	mov dx,offset msg1 
	mov ah,09h
	int 21h
	
	mov ah,01h 
	int 21h
	sub al,48 
	mov t1,al 
	
	mov ah,01h
    int 21h
    sub al,48
    mov o1,al
	
	mov bl,10
	mov al,t1
	mul bl 
	add al,o1 
	mov dig1,al 
	
	mov dl,10  
	mov ah,02h
	int 21h
	
	mov dx,offset msg2
    mov ah,09h
    int 21h
	
	mov ah,01h 
	int 21h
	sub al,48 
	mov t2,al 

    mov ah,01h
    int 21h
    sub al,48
    mov o2,al
	
	mov bl,10
	mov al,t2
	mul bl 
	add al,o2 
	mov dig2,al 
	
	mov dl,10  
	mov ah,02h
	int 21h
	
	mov dx,offset msg3 
	mov ah,09h
	int 21h
	
	mov bl,10
	mov dl,dig1
	mov dl,dig2
	mov al,dl
	mov ah,00
	div bl
	
	mov r1,ah
	
	mov dl,al
	add dl,48 
	mov ah,02h
	int 21h
	
	mov dl,r1      
	add dl,48   
	mov ah,02h
	int 21h    

	mov dl,10
	mov ah,02h
	int 21h

	mov dx,offset msg4 
	mov ah,09h
	int 21h
	
	mov bl,10
	mov dl,dig1
	mov dl,dig2
	mov al,dl
	mov ah,00
	div bl
	
	mov r2,ah
	
	mov dl,al
	sub dl,48 
	mov ah,02h
	int 21h
	
	mov dl,r2      
	add dl,48   
	sub ah,02h
	int 21h    

	mov dl,10
	mov ah,02h
	int 21h

	mov ax,4C00h
    int 21h

end start

