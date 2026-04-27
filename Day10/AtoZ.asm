; print English alphabet small letters a to z , a=97 z=122

.model small
.stack 100h

.data

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cl, 26      ; total letters
    mov dl, 97      ; ascii value of a

print_loop:
    mov ah, 02h
    int 21h

    inc dl
    loop print_loop

    mov ah, 4ch
    int 21h

main endp
end main

