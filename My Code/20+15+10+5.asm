; 20+15+10+5=
.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "RESULT: $"
    ANS DB ?
    REM DB ?
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
                
        MOV CX,4
        MOV AL,0
        MOV BL,20
        
        
    SUM:
    
    ADD AL,BL
    SUB BL,5
    MOV ANS,AL
    LOOP SUM
    
    ;PRINT MSG
    MOV AH,09
    LEA DX,MSG
    INT 21H 
    
    PRINT:
    MOV AL,00
    MOV AH,00
    MOV AL,ANS
    MOV BL,10
    DIV BL ; AL/BL = AL
    MOV REM,AH
    MOV AH,00
    
    ;AL=5 AH=0
    
    ;PRINT AL
    MOV AH,02
    MOV DL,AL
    ADD DL,48
    INT 21H
    
    ;PRINT AH
    MOV AH,02
    MOV DL,REM
    ADD DL,48
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN