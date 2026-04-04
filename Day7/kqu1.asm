; Write an assembly program to input three marks,
; Calculate the average,
; and print if the student passed (average >= 50).

.model small
.stack 100h
.data
    msg1 db "Enter Mark1 (two digits): $"
    msg2 db "Enter Mark2 (two digits): $"
    msg3 db "Enter Mark3 (two digits): $"
    msg4 db "Average is: $"
    msg5 db "Student Passed!$"
    msg6 db "Student Failed!$"
    m1 db 0
    m2 db 0
    m3 db 0
    avg db 0

.code
start:
    mov ax,@data
    mov ds,ax

; -------- Input Mark1 --------
    mov dx,offset msg1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,48
    mov bl,al        ; tens digit

    mov ah,01h
    int 21h
    sub al,48
    mov bh,al        ; ones digit

    mov al,bl
    mov cl,10
    mul cl
    add al,bh
    mov m1,al

    mov dl,10
    mov ah,02h
    int 21h

; -------- Input Mark2 --------
    mov dx,offset msg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,48
    mov bl,al

    mov ah,01h
    int 21h
    sub al,48
    mov bh,al

    mov al,bl
    mov cl,10
    mul cl
    add al,bh
    mov m2,al

    mov dl,10
    mov ah,02h
    int 21h

; -------- Input Mark3 --------
    mov dx,offset msg3
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,48
    mov bl,al

    mov ah,01h
    int 21h
    sub al,48
    mov bh,al

    mov al,bl
    mov cl,10
    mul cl
    add al,bh
    mov m3,al

    mov dl,10
    mov ah,02h
    int 21h

; -------- Calculate Average --------
    mov al,m1
    add al,m2
    add al,m3
    mov ah,0          ; clear high byte
    mov bl,3
    div bl            ; AX ÷ BL → AL=quotient, AH=remainder
    mov avg,al

; -------- Print Average --------
    mov dx,offset msg4
    mov ah,09h
    int 21h

    mov ax,0
    mov al,avg
    mov bl,10
    div bl            ; AL ÷ 10 → AL=quotient (tens), AH=remainder (ones)

    mov dl,al
    add dl,48
    mov ah,02h
    int 21h

    mov dl,ah
    add dl,48
    mov ah,02h
    int 21h

    mov dl,10
    mov ah,02h
    int 21h

; -------- Pass/Fail --------
    mov al,avg
    cmp al,50
    jl fail

pass:
    mov dx,offset msg5
    mov ah,09h
    int 21h
    jmp done

fail:
    mov dx,offset msg6
    mov ah,09h
    int 21h

done:
    mov ax,4C00h
    int 21h

end start

