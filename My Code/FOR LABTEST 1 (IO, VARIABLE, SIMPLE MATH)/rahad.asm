                                                     .MODEL SMALL
.STACK 100H

.DATA
MSG1 DB "ENTER 1ST NUM:$"
MSG2 DB "ENTER 2ND NUM:$"
MSG3 DB "SUM IS :$"
MSG4 DB "SUB IS :$"
MSG5 DB "MUL IS :$"
MSG6 DB "DIV IS :$"

NO1 DB ?
NO2 DB ?
SUM DB ?
REM DB ?
RES DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    ;ENTER NUMBERS
    
    MOV DX,OFFSET MSG1
    MOV AH,09H
    INT 21H
    
    MOV AL,00
    MOV AH,01H
    INT 21H        ;input no1
    SUB AL,48
    MOV NO1,AL
    
    MOV DX,10
    MOV AH,02H   ;new line
    INT 21H
    
    MOV DX,13
    MOV AH,02H   ;carrige return
    INT 21H
    
    MOV DX,OFFSET MSG2
    MOV AH,09H             ;print msg2
    INT 21H
    
    MOV AL,00
    MOV AH,01H
    INT 21H               ;input no2
    SUB AL,48
    MOV NO2,AL
    
    MOV DX,10
    MOV AH,02H
    INT 21H
    
    MOV DX,13
    MOV AH,02H
    INT 21H
    
    ;ADD
    
    MOV DX,OFFSET MSG3
    MOV AH,09H
    INT 21H 
    
    MOV AL,NO1
    ADD AL,NO2
    MOV SUM,AL
    
    MOV AH,00
    MOV BL,10
    MOV AL,SUM
    DIV BL
    MOV REM,AH
    
    MOV DL,AL
    ADD DL,48
    MOV AH,02H    
    INT 21H 
    
    MOV DL,REM
    ADD DL,48
    MOV AH,02H    
    INT 21H
    
    MOV DX,10
    MOV AH,02H
    INT 21H 
    
    MOV DX,13
    MOV AH,02H
    INT 21H
    
    ;SUB
    
    MOV DX,OFFSET MSG4
    MOV AH,09H
    INT 21H
     
    MOV AL,00
    MOV AL,NO1
    SUB AL,NO2
    MOV RES,AL
    
    MOV AH,00
    MOV REM,00
    MOV BL,10
    MOV AL,RES
    DIV BL
    MOV REM,AH
    
    MOV DL,AL
    ADD DL,48
    MOV AH,02H    
    INT 21H 
    
    MOV DL,REM
    ADD DL,48
    MOV AH,02H    
    INT 21H
    
    MOV DX,10
    MOV AH,02H
    INT 21H
    
    MOV DX,13
    MOV AH,02H
    INT 21H
    
    ;MUL
    
    MOV DX,OFFSET MSG5
    MOV AH,09H
    INT 21H
     
    MOV AL,00
    MOV AH,00
    MOV RES,00
    MOV AL,NO1
    MOV BL,NO2 
    MUL BL
    MOV RES,AL
    
    MOV AH,00
    MOV REM,00
    MOV BL,10
    MOV AL,RES
    DIV BL
    MOV REM,AH
    
    MOV DL,AL
    ADD DL,48
    MOV AH,02H    
    INT 21H 
    
    MOV DL,REM
    ADD DL,48
    MOV AH,02H    
    INT 21H
    
    MOV DX,10
    MOV AH,02H
    INT 21H
    
    MOV DX,13
    MOV AH,02H
    INT 21H
    
    ;DIV
    
    MOV DX,OFFSET MSG5
    MOV AH,09H
    INT 21H
     
    MOV AL,00
    MOV AH,00
    MOV RES,00
    MOV AL,NO1
    MOV BL,NO2 
    DIV BL
    MOV RES,AL
    
    MOV AH,00
    MOV REM,00
    MOV BL,10
    MOV AL,RES
    DIV BL
    MOV REM,AH
    
    MOV DL,AL
    ADD DL,48
    MOV AH,02H    
    INT 21H 
    
    MOV DL,REM
    ADD DL,48
    MOV AH,02H    
    INT 21H
    
    MOV DX,10
    MOV AH,02H
    INT 21H
    
    MOV DX,13
    MOV AH,02H
    INT 21H
    
    MOV AX,4C00H
    INT 21H
    
MAIN ENDP
END MAIN