;1+4+7+10.....N

.MODEL SMALL
.STACK 100H
.DATA

    SUMMATION DB ?
    REM DB 0
      
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,0
    MOV BX,1
    MOV CX,5
    
    SUM: ;; LABLE FOR SUMMATION
    
    ADD AX,BX
    ADD BX,3
    MOV SUMMATION,BX
    LOOP SUM
    
    
    
    MOV AH,04CH
    INT 21H
    
    MAIN ENDP
END MAIN