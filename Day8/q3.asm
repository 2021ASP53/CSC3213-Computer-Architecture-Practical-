.MODEL SMALL
.STACK 100H
.DATA
    P DB 'Enter a three-digit number: $'
    Y DB 0DH, 0AH, 'The number is a palindrome.$'
    N DB 0DH, 0AH, 'The number is not a palindrome.$'
    D1 DB ?
    D3 DB ?

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, P
    INT 21H

    ; Read 1st digit [cite: 16]
    MOV AH, 01H
    INT 21H
    MOV D1, AL

    ; Read 2nd digit (ignored for palindrome check)
    INT 21H

    ; Read 3rd digit
    INT 21H
    MOV D3, AL

    ; Compare 1st and 3rd [cite: 17, 19]
    MOV AL, D1
    CMP AL, D3
    JE YES
    LEA DX, N
    JMP DONE
YES:
    LEA DX, Y
DONE:
    MOV AH, 09H
    INT 21H
    MOV AH, 4CH
    INT 21H
END MAIN

