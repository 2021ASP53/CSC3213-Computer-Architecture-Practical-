.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB 'Enter 3 single-digit sides : $'
    VALID  DB 0DH, 0AH, 'Valid Triangle$'
    INVALID DB 0DH, 0AH, 'Invalid Triangle$'
    SA DB ?
    SB DB ?
    SC DB ?

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    MOV AH, 09H
    LEA DX, PROMPT
    INT 21H

    ; Read Side A
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV SA, AL

    ; Read Side B
    INT 21H
    SUB AL, 30H
    MOV SB, AL

    ; Read Side C
    INT 21H
    SUB AL, 30H
    MOV SC, AL

    ; --- Test 1: a + b > c ---
    MOV AL, SA
    ADD AL, SB
    CMP AL, SC
    JBE NOT_VALID   ; If sum <= side, it is invalid

    ; --- Test 2: a + c > b ---
    MOV AL, SA
    ADD AL, SC
    CMP AL, SB
    JBE NOT_VALID

    ; --- Test 3: b + c > a ---
    MOV AL, SB
    ADD AL, SC
    CMP AL, SA
    JBE NOT_VALID

    ; If all tests pass, print Valid
    MOV AH, 09H
    LEA DX, VALID
    INT 21H
    JMP EXIT

NOT_VALID:
    ; If any test fails, print Invalid
    MOV AH, 09H
    LEA DX, INVALID
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
END MAIN

