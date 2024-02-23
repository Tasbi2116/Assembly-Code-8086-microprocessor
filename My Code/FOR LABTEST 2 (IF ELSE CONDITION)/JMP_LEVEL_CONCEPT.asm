.MODEL SMALL
.STACK 100H
.DATA
    A DB 'JMP CONCEPT $'
    B DB 'ASSEMBLY LANGUAGE $'
    C DB 'PROGRAMMING $'
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX ; INITIALIZING DATA
        
        ; STRING OUTPUT
        MOV AH,9
        LEA DX,A
        INT 21H
        
        ;NEW LINE
        MOV AH,2
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        
        ; JMP IS ONE KIND OF LEVEL
        ; LEVEL CREATION
        LEVEL1:
        MOV AH,9
        LEA DX,B
        INT 21H
        JMP LEVEL2
        
        LEVEL2:
        MOV AH,9
        LEA DX,C
        INT 21H
        JMP EXIT
        
        
        EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    END MAIN