.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH,1          ; 1 ST INPUT
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,10         ; NEW LINE
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,1
    INT 21H            ; 2ND INPUT
    MOV BH,AL
    
    MOV AH,2
    MOV DL,10         ; NEW LINE
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,2
    MOV DL,BL          ; OUTPUT
    INT 21H
    
    MOV AH,2
    MOV DL,10         ; NEW LINE
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,2
    MOV DL,BH          ; OUTPUT
    INT 21H
    
    ;BEEP SOUND
    
    MOV AH,2
    MOV DL,07
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    END MAIN  