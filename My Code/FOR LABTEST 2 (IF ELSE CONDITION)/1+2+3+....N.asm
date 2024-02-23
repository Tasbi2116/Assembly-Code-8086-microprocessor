                                                .MODEL SMALL
.STACK 100H

.DATA
NUM DB 1
NUM2 DB ?
REM DB ?
COUNT DB 1
TILL DB ?
SUMMATION DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DL,10
    MOV BL,00
    
SCANNUM:
    
    MOV AH,01H
    INT 21H
    
    CMP AL,13
    JE SUM
    
    MOV AH,00
    
    SUB AL,48
    MOV CL,AL
    MOV AL,BL
    MUL DL 
    
    ADD AL,CL
    MOV BL,AL
    MOV TILL,AL
    
    JMP SCANNUM
    
   
SUM:

    MOV AL,00
    MOV AH,00
    MOV DL,00
    MOV CL,00
    MOV BL,00
    MOV CL,TILL
    
SUM2:
      
    ;MOV AL,NUM
    ADD AL,NUM
    MOV NUM2,AL
    ;MOV BL,AL
    MOV AL,00
    
    CMP COUNT,CL
    JE EXIT
    
    MOV AL,COUNT
    ADD AL,1
    MOV COUNT,AL
    MOV AL,00 
    
    MOV AL,NUM
    ADD AL,1
    MOV NUM,AL
    MOV AL,00
    MOV AL,NUM2
    
    
    JMP SUM2
    
EXIT:

    MOV AL,00
    MOV AH,00
    MOV DL,00
    
    MOV AL,NUM2
    MOV BL,10
    DIV BL
    MOV REM,AH
    MOV SUMMATION,AL
    
    MOV DL,10
    MOV AH,02H
    INT 21H
    
    MOV DL,SUMMATION
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    MOV DL,REM 
    ADD DL,48
    MOV AH,02H
    INT 21H  
    
    MOV AX,4C00H
    INT 21H
    
MAIN ENDP
END MAIN