.MODEL SMALL
.STACK 100H
.DATA
    M DB 'Enter mark (00-99): $'
    GA DB 0DH, 0AH, 'Grade: A$'
    GB DB 0DH, 0AH, 'Grade: B$'
    GC DB 0DH, 0AH, 'Grade: C$'
    GD DB 0DH, 0AH, 'Grade: D$'
    GF DB 0DH, 0AH, 'Grade: Fail$'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, M
    INT 21H

    ; Read 2 digits
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

    ; Compare ranges [cite: 21, 22, 23, 24, 25]
    CMP AL, 90
    JAE RA
    CMP AL, 75
    JAE RB
    CMP AL, 60
    JAE RC
    CMP AL, 50
    JAE RD
    LEA DX, GF
    JMP SHOW
RA: LEA DX, GA
    JMP SHOW
RB: LEA DX, GB
    JMP SHOW
RC: LEA DX, GC
    JMP SHOW
RD: LEA DX, GD
SHOW:
    MOV AH, 09H
    INT 21H
    MOV AH, 4CH
    INT 21H
END MAIN

