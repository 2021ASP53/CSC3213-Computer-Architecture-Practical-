.model small
.stack 100h

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cl, 26      ; loop counter for 26 letters
    mov dl, 65      ; ASCII value of 'A'

upper_loop:
    mov ah, 02h
    int 21h         ; print uppercase letter

    mov dl, 32      ; ASCII value of space
    mov ah, 02h
    int 21h         ; print space

    mov dl, 65      ; reset to 'A'
    add dl, 26      ; ensure dl increments correctly
    sub cl, 26      ; restore loop counter
    
    inc dl
    loop upper_loop

    mov dl, 13      ; carriage return
    mov ah, 02h
    int 21h

    mov dl, 10      ; line feed
    mov ah, 02h
    int 21h

    mov cl, 26      ; loop counter for 26 letters
    mov dl, 97      ; ASCII value of 'a'

lower_loop:
    mov ah, 02h
    int 21h         ; print lowercase letter

    mov dl, 32      ; ASCII value of space
    mov ah, 02h
    int 21h         ; print space

    inc dl          ; move to next lowercase letter
    loop lower_loop

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main

