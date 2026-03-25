.model small
.stack 100h
.data
    num1 db 5        ; First number
    num2 db 3        ; Second number
    msg  db "Greater number is : $"

.code
main:
    mov ax,@data
    mov ds,ax

    ; Load numbers
    mov al,num1
    mov bl,num2

    ; Compare
    cmp al,bl
    jg FIRST_GREATER   ; if num1 > num2
    jl SECOND_GREATER  ; if num1 < num2
    jmp FIRST_GREATER  ; if equal (optional: treat num1 as greater)

FIRST_GREATER:
    mov dx,offset msg
    mov ah,09h
    int 21h

    mov dl,num1
    add dl,48
    mov ah,02h
    int 21h
    jmp EXIT

SECOND_GREATER:
    mov dx,offset msg
    mov ah,09h
    int 21h

    mov dl,num2
    add dl,48
    mov ah,02h
    int 21h

EXIT:
    mov ax,4c00h
    int 21h

end main

