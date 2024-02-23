;1+2+3+4.....N
.MODEL SMALL
.STACK 100H
.DATA

    A DB 1
    REM DB 0
    ADDS DB ?
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS,AX
        
        MOV CX,10  ;HOW MANY TIMES THE LOOP/LABLE WILL EXECUTE
        MOV BX,0
        
    SUM:
        ADD BH,A
        INC A
        LOOP SUM
        
        
        MOV ADDS,BH
        
        ;TO PRINT ADDS
        
        MOV DL,10
        MOV AH,02H
        INT 21H
        
        ;CLEAR ALL REGISTER TO USE
        
        MOV AH,00
        MOV DL,00
        MOV BL,00
        
        ;MOVING ADDS TO AL
        MOV AL,ADDS
        
        MOV BL,10
        
        ;AL/BL
        
        DIV BL
        
        ;MOVING REMINDER TO REM
        MOV REM,AH
        
        ;PRINT AL
        MOV DL,AL
        ADD DL,48
        MOV AH,02H
        INT 21H
        
        ;PRINT THE REMINDER
        MOV DL,REM
        ADD DL,48
        MOV AH,02H
        INT 21H
        
        MOV AH,04CH
        INT 21H
        
    MAIN ENDP
    END MAIN