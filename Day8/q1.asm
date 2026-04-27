.MODEL SMALL
.STACK 100H
.DATA
    M1 DB 'Enter the first two-digit number: $'
    M2 DB 0DH, 0AH, 'Enter a second two-digit number:: $'
    RS DB 0DH, 0AH, 'Sum: $'
    RD DB 0DH, 0AH, 'Difference: $'
    RQ DB 0DH, 0AH, 'Quotient: $'
    RR DB 0DH, 0AH, 'Remainder: $'
    V1 DB ?
    V2 DB ?
    REM_TEMP DB ? ; [cite: 12] Added to store remainder safely

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Get first number [cite: 7]
    MOV AH, 09H
    LEA DX, M1
    INT 21H
    CALL GET_NUM
    MOV V1, AL

    ; Get second number [cite: 8]
    MOV AH, 09H
    LEA DX, M2
    INT 21H
    CALL GET_NUM
    MOV V2, AL

    ; --- SUM --- [cite: 9]
    MOV AH, 09H
    LEA DX, RS
    INT 21H
    MOV AL, V1
    ADD AL, V2
    CALL OUT_NUM

    ; --- DIFFERENCE --- [cite: 10]
    MOV AH, 09H
    LEA DX, RD
    INT 21H
    MOV AL, V1
    SUB AL, V2
    CALL OUT_NUM

    ; --- QUOTIENT --- 
    MOV AH, 09H
    LEA DX, RQ
    INT 21H
    MOV AL, V1
    XOR AH, AH
    DIV V2
    MOV REM_TEMP, AH ; [cite: 12] SAVE REMAINDER HERE before calling OUT_NUM
    CALL OUT_NUM

    ; --- REMAINDER --- [cite: 12]
    MOV AH, 09H
    LEA DX, RR
    INT 21H
    MOV AL, REM_TEMP ; [cite: 12] Load the saved remainder
    CALL OUT_NUM

    MOV AH, 4CH
    INT 21H

GET_NUM:
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV BL, 10
    MUL BL
    MOV BL, AL
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    ADD AL, BL
    RET

OUT_NUM:
    AAM
    ADD AX, 3030H
    MOV BX, AX
    MOV DL, BH
    MOV AH, 02H
    INT 21H
    MOV DL, BL
    INT 21H
    RET
END MAIN

