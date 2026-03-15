.model small
.stack 100h

.data
msg1 db "Enter Number1 (2 digits): $"
msg2 db 13,10,"Enter Number2 (2 digits): $"
msg3 db 13,10,"Addition is: $"
msg4 db 13,10,"Subtraction is: $"

t1 db ?
o1 db ?
t2 db ?
o2 db ?

dig1 db ?
dig2 db ?

res db ?
rem db ?

.code
start:
    mov ax,@data
    mov ds,ax

; -------- NUMBER 1 INPUT --------
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

    mov al,t1
    mov bl,10
    mul bl
    add al,o1
    mov dig1,al

; -------- NUMBER 2 INPUT --------
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

    mov al,t2
    mov bl,10
    mul bl
    add al,o2
    mov dig2,al

; -------- ADDITION --------
    mov dx,offset msg3
    mov ah,09h
    int 21h

    mov al,dig1
    add al,dig2

    xor ah,ah
    mov bl,10
    div bl

    mov res,al
    mov rem,ah

    mov dl,res
    add dl,48
    mov ah,02h
    int 21h

    mov dl,rem
    add dl,48
    mov ah,02h
    int 21h

; -------- SUBTRACTION --------
    mov dx,offset msg4
    mov ah,09h
    int 21h

    mov al,dig1
    sub al,dig2

    jns positive

; if negative
    mov dl,'-'
    mov ah,02h
    int 21h
    neg al

positive:
    xor ah,ah
    mov bl,10
    div bl

    mov res,al
    mov rem,ah

    mov dl,res
    add dl,48
    mov ah,02h
    int 21h

    mov dl,rem
    add dl,48
    mov ah,02h
    int 21h

; -------- EXIT --------
    mov ax,4C00h
    int 21h

end start

