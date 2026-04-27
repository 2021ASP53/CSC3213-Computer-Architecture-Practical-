.MODEL SMALL
.STACK 100H
.DATA
    P1 DB 'Enter a three-digit number: $'
    P2 DB 0DH, 0AH, 'The Number: $'
    B  DB 4 DUP('$')

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, P1
    INT 21H

    LEA SI, B
    MOV CX, 3
L1:
    MOV AH, 01H
    INT 21H
    MOV [SI], AL
    INC SI
    LOOP L1

    MOV AH, 09H
    LEA DX, P2
    INT 21H
    LEA DX, B
    INT 21H

    MOV AH, 4CH
    INT 21H
END MAIN

