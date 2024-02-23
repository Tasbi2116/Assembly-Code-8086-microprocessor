; 4+7+10+13+16=50

.MODEL SMALL
.STACK 100H
.DATA
A DB 10,13, "RESULT : $" 
REM DB ?
ANS DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,5
    MOV AL,0
    MOV BL,4
    
LEBEL:
    ADD AL,BL
    ADD BL,3
    MOV ANS,AL
    
    LOOP LEBEL
    
PRINT:
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,0
    MOV BL,10
    MOV AL,0
    MOV AL,ANS
    DIV BL ;AL/BL=AL
    MOV REM,AH
    MOV AH,0
    
    MOV AH,2
    MOV DL,AL
    ADD DL,48
    INT 21H
    
    MOV AH,0
    MOV AH,2
    MOV DL,REM
    ADD DL,48
    INT 21H
    
EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    