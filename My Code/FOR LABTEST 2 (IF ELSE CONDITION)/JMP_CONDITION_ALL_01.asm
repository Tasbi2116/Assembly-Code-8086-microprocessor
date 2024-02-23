.MODEL SMALL
.STACK 100H

.DATA
MSG DB "ENTER NUMBER 1:$"
MSG2 DB "ENTER NUMBER 2:$"
MSG3 DB "ENTER OPERATION:$" 
MSG4 DB "SUM IS = $"
MSG5 DB "SUB IS = $"
MSG6 DB "MUL IS = $"
MSG7 DB "DIV IS = $"
NO1 DB 0
NO2 DB 0
RES DB 0
REM DB 0

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DL,OFFSET MSG
    MOV AH,09H
    INT 21H 
    
    MOV DL,10
    MOV BL,00
    MOV AH,00
    MOV AL,00 
    
    
    
SCANNUM1:
    
    MOV AH,01H ;TAKING INPUT
    INT 21H 
    
    CMP AL,13  ;CHECKING IF ENTER IS PRESSED
    JE SECOND
    
    SUB AL,48  ;CONVERTING TO DECIMAL
    MOV AH,00
    
    MOV CL,AL
    MOV AL,BL
    MUL DL     ;MULTIPIED BY 10  
    
    ADD AL,CL
    MOV BL,AL
    MOV NO1,BL
    
    JMP SCANNUM1
    
SECOND:

    MOV DL,10
    MOV AH,02H
    INT 21H
    

    MOV DL,OFFSET MSG2
    MOV AH,09H
    INT 21H

    
    MOV DL,10
    MOV BL,00
    MOV AL,00
    MOV AH,00
    MOV CL,00
    
    
SCANNUM2: 

    
    
    MOV AH,01H ;TAKING INPUT
    INT 21H 
    
    CMP AL,13  ;CHECKING IF ENTER IS PRESSED
    JE OPERATION
    
    SUB AL,48  ;CONVERTING TO DECIMAL
    MOV AH,00
    
    MOV CL,AL
    MOV AL,BL
    MUL DL     ;MULTIPIED BY 10  
    
    ADD AL,CL
    MOV BL,AL
    MOV NO2,BL
    
    JMP SCANNUM2

OPERATION:
    
    MOV DL,10
    MOV AH,02H
    INT 21H
    

    MOV DL,OFFSET MSG3
    MOV AH,09H
    INT 21H 
    
    MOV DL,10
    MOV BL,00
    MOV AL,00
    MOV AH,00
    MOV CL,00
    
    MOV AH,01H
    INT 21H
    
    SUB AL,48
    
    
    
    CMP AL,1
    JE SUM
    
    CMP AL,2
    JE SUBTRACT
    
    CMP AL,3
    JE MULTIPLY
    
    CMP AL,4
    JE DIVIDE 
    
    
    
SUM:

    MOV DL,10
    MOV AH,02H
    INT 21H
    
    MOV DL,13
    MOV AH,02H
    INT 21H
    

    MOV DL,OFFSET MSG4
    MOV AH,09H
    INT 21H
    
    MOV AL,00
    MOV AH,00
    MOV RES,00
    MOV AL,NO1
    ADD AL,NO2
    MOV RES,AL
    
    MOV AL,00
    MOV AL,RES
    MOV BL,10
    DIV BL
    MOV REM,AH
    
    MOV DL,00
    MOV AH,00
    MOV DL,AL
    ADD DL,48
    MOV AH,02H
    INT 21H 
    
    MOV DL,00
    MOV AH,00
    MOV DL,REM
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    JMP EXIT
    
SUBTRACT:

    
    MOV DL,10
    MOV AH,02H
    INT 21H
    
    MOV DL,13
    MOV AH,02H
    INT 21H
    

    MOV DL,OFFSET MSG5
    MOV AH,09H
    INT 21H    
     
    MOV AL,00
    MOV AH,00
    MOV AL,NO1
    SUB AL,NO2
    
    MOV BL,10
    DIV BL
    MOV REM,AH
    
    MOV DL,00
    MOV AH,00
    MOV DL,AL
    ADD DL,48
    MOV AH,02H
    INT 21H 
    
    MOV DL,00
    MOV AH,00
    MOV DL,REM
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    JMP EXIT
    
MULTIPLY:

    
    MOV DL,10
    MOV AH,02H
    INT 21H
    
    MOV DL,13
    MOV AH,02H
    INT 21H
    

    MOV DL,OFFSET MSG6
    MOV AH,09H
    INT 21H

    MOV AL,00
    MOV AH,00
    MOV BL,00
    
    MOV AL,NO1
    MOV BL,NO2
    MUL BL
    
    MOV BL,10
    DIV BL
    MOV REM,AH
    
    MOV DL,00
    MOV AH,00
    MOV DL,AL
    ADD DL,48
    MOV AH,02H
    INT 21H 
    
    MOV DL,00
    MOV AH,00
    MOV DL,REM
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    JMP EXIT

DIVIDE:

    
    MOV DL,10
    MOV AH,02H
    INT 21H
    
    MOV DL,13
    MOV AH,02H
    INT 21H
    

    MOV DL,OFFSET MSG7
    MOV AH,09H
    INT 21H

    MOV AL,00
    MOV AH,00
    MOV BL,00
    
    MOV AL,NO1
    MOV BL,NO2
    DIV BL
    
    MOV BL,10
    DIV BL
    MOV REM,AH
    
    MOV DL,00
    MOV AH,00
    MOV DL,AL
    ADD DL,48
    MOV AH,02H
    INT 21H 
    
    MOV DL,00
    MOV AH,00
    MOV DL,REM
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    JMP EXIT
    
EXIT:

    MOV AX,4C00H
    INT 21H
    
MAIN ENDP
END MAIN