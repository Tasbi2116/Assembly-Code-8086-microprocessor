.MODEL SMALL
.STACK 100H

.DATA
A DB ?
B DB ?
C DB ?
MSGA DB "A IS GREATEST$"  
MSGB DB "B IS GREATEST$"
MSGC DB "C IS GREATEST$"
REM DB ? 

.CODE
MAIN PROC
    ; initializing data
    MOV AX,@DATA
    MOV DS,AX
    
    ;input A
    
    MOV AH,01H
    INT 21H
    
    SUB AL,48
    MOV A,AL
    MOV AL,00
    MOV AH,00
    
    MOV DL,10 ; new line
    MOV AH,02H
    INT 21H 
     
    ;input B
    
    MOV AH,01H
    INT 21H
    
    SUB AL,48
    MOV B,AL
    MOV AL,00
    MOV AH,00
    
    MOV DL,10 ; new line
    MOV AH,02H
    INT 21H 
           
    ;input C
           
    MOV AH,01H
    INT 21H
    
    SUB AL,48
    MOV C,AL
    MOV AL,00
    MOV AH,00
    MOV BL,00 
    MOV CL,00
    
    MOV AL,A
    MOV BL,B
    MOV CL,C
    
    CMP AL,BL
    JG A_C 
    JL B_C
    
    
A_C:

    CMP AL,CL
    JG GREATA
    JL GREATC
    
B_C:

    CMP BL,CL
    JG GREATB
    JL GREATC
    
GREATA:

    MOV DL,13
    MOV AH,02H
    INT 21H
    
    MOV DL,10
    MOV AH,02H
    INT 21H

    MOV DX,OFFSET MSGA
    MOV AH,09H
    INT 21H
    JMP EXIT

GREATB:

    
    MOV DL,13
    MOV AH,02H
    INT 21H
    
    MOV DL,10
    MOV AH,02H
    INT 21H
    
    MOV DX,OFFSET MSGB
    MOV AH,09H
    INT 21H
    JMP EXIT

GREATC:
    
    MOV DL,13
    MOV AH,02H
    INT 21H
    
    MOV DL,10
    MOV AH,02H
    INT 21H
    
    MOV DX,OFFSET MSGC
    MOV AH,09H
    INT 21H
    JMP EXIT 
    
EXIT:

    MOV AX,4C00H
    INT 21H
    
MAIN ENDP
END MAIN