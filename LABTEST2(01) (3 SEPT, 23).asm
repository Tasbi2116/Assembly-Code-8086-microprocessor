; LABTEST 2: 3RD SEPTEMBER, 2023 (CSE_21)
; TAKE AN INPUT N. IF N IS 5/7, THEN OUTPUT A MESSAGE SAYING 
; "IT'S A NUMBER THAT YOU WANT". IF N IS 1, THEN PRINT 1
; IF N IS ANY SINGLE DIGIT NUMBER, THEN INPUT A TWO DIGIT NUMBER.
; AND SHOW IT IN OUTPUT AFTER ADDING 5 WITH THE NUMBER. 
; 210216

.MODEL SMALL
.STACK 100H

.DATA
N DB ? 
MSG DB "Enter the number:$"
MSG1 DB "It's a number that you want.$"
MSG2 DB "YOU PRESSED:$"
NUM DB ?
RES DB ?
REM DB ?


.CODE
MAIN PROC
  MOV AX,@DATA
  MOV DS,AX
  
  MOV AL,00
  MOV AH,00
  MOV AH,01H
  INT 21H
  SUB AL,48
  MOV N,AL 
  
  MOV AL,N
  CMP AL,5
  JE FISE
  
  CMP AL,7
  JE FISE 
  
  CMP AL,1
  JE ONE
  
  JMP ELSE
  
    
FISE:

  MOV DL,10
  MOV AH,02H
  INT 21H
  
  MOV DL,00
  MOV AH,00
  MOV AL,00
  MOV DL,OFFSET MSG1
  MOV AH,09H
  INT 21H
  
  JMP EXIT  

ONE:
  
  MOV DL,10
  MOV AH,02H
  INT 21H
  
  MOV DL,00
  MOV AH,00
  MOV AL,00
  MOV DL,OFFSET MSG2
  MOV AH,09H
  INT 21H
  
  MOV DL,N
  ADD DL,48
  MOV AH,02H
  INT 21H
  
  JMP EXIT
  
ELSE:

  MOV DL,10
  MOV AH,02H
  INT 21H

  MOV AL,00
  MOV AH,00
  MOV BL,00
  MOV CL,00
  MOV DL,10
  
  MOV AH,01H
  INT 21H
  SUB AL,48
  MUL DL
  MOV CL,AL
  
  MOV AH,01H
  INT 21H
  SUB AL,48
  ADD AL,CL
  MOV NUM,AL
  MOV AL,NUM
  ADD AL,05
  MOV NUM,AL 
  
  MOV DL,10
  MOV AH,02H
  INT 21H
  
  MOV AL,00
  MOV AH,00
  MOV BL,00
  MOV CL,00
  MOV DL,00
  MOV AL,NUM
  MOV BL,10
  DIV BL
  MOV RES,AL
  MOV REM,AH
  
  
  MOV DL,00
  MOV AH,00
  MOV AL,00 
  MOV DL,RES
  ADD DL,48
  MOV AH,02H
  INT 21H
  
  MOV DL,REM
  ADD DL,48
  MOV AH,02H
  INT 21H
   
  
          
    
EXIT:
  MOV AX,4C00H
  INT 21H    
    
    
MAIN ENDP
END MAIN