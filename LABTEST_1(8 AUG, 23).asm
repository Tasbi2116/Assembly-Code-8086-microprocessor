; LABTEST 1 : 8 AUG, 2023. CSE_21
; A PROGRAME THAT TAKES FOUR NUMBERS AND SHOW THE RESULT
; BY DOING X+Y+Z-W OPERATION.
; 210235

.MODEL SMALL
.STACK 100H
.DATA
A DB "Sanimun Maria $"
B DB 10,13, "SID 210235 $"

C DB 10,13, "1st num : $"
D DB 10,13, "2nd num : $"
E DB 10,13, "3rd num : $"
F DB 10,13, "4th num : $"
X DB ?
Y DB ?
Z DB ?
W DB ? 

SUM1 DB ?
SUM2 DB ?
SUMF DB ?

R DB 10,13, "Result : $" 

.CODE
MAIN PROC 
    MOV AX,@DATA ;Data segment initialize
    MOV DS,AX
    
    ;My name and ID
    
    MOV AH,00
    MOV AH,9 
    LEA DX,A
    INT 21H
    
    MOV AH,00
    MOV AH,9
    LEA DX,B
    INT 21H  
     
     ;Print ST1 
     MOV AH,00
    MOV AH,9
    LEA DX,C
    INT 21H
    
    
     
     MOV AH,1   ;Input X
     INT 21H
     SUB AL,48
     MOV X,AL 
        
     
     ;Print ST2 
     MOV AH,00
    MOV AH,9
    LEA DX,D
    INT 21H
     
       
    MOV AH,1
     INT 21H    ;Input Y
     SUB AL,48
     MOV Y,AL
              
              
      ;Print ST3 
     MOV AH,00
    MOV AH,9
    LEA DX,E
    INT 21H
     
     MOV AH,1
     INT 21H        ;Input Z
     SUB AL,48
     MOV Z,AL
     
      ;Print ST4 
     MOV AH,00
    MOV AH,9
    LEA DX,F
    INT 21H 
    
    
     MOV AH,1            ;Input  W
     INT 21H
     SUB AL,48
     MOV W,AL 
     
     
     
     ;RESULT
     
     MOV AH,00
     MOV AH,9
     LEA DX,R
     INT 21H
              
              
      MOV AL,00   ;SUM1
      MOV AL,X
      ADD AL,Y
      MOV SUM1,AL
      
      MOV  AL,00
      MOV AL,SUM1  ;SUM2
      ADD AL,Z
      MOV SUM2,AL
      
      
      MOV AL,00
      MOV AL,SUM2   ;SUMF
      SUB AL,W
      MOV SUMF,AL  
      
      
      ;OUTPUT
      MOV AH,00
      MOV AH,2
      MOV DL,SUMF 
      ADD DL,48
      INT 21H
     
    
    
    
    
    
EXIT:
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN 