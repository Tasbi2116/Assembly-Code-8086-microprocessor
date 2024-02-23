.MODEL SMALL
.STACK 100H
.DATA
    A DB 'INPUT FIRST DIGIT $'
    B DB 10,13, 'INPUT SECOND DIGIT $'
    C DB 10,13, 'RESULT $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    ;OUTPUT STRING A
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;INPUT FIRST DIGIT
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    
    ;OUTPUT STRING B
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;INPUT SECOND DIGIT
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    ;OUTPUT STRING C
    MOV AH,9
    LEA DX,C
    INT 21H
    
    ;SUB TWO DIGIT
    SUB BL,BH ; BL=BL-BH
    ADD BL,48 ; ADD ASCII VALUE TO THE RESULT
    
    ;OUTPUT RESULT
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN