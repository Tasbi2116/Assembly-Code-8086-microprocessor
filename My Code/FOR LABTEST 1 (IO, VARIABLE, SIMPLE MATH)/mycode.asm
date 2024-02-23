 .MODEL SMALL
 .STACK 100H
 .CODE
 
 MAIN PROC
    
    ;INPUT TWO DIGIT.
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    ; OUTPUT TWO DIGIT
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    EXIT:       ; EXIT DOCS LABEL
    MOV AH,4CH
    INT 21H
    MAIN ENDP
 END MAIN