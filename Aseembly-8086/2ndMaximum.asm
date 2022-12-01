; a , b , c
; IF A NOT_EQUAL_TO B :
    ; IF A > B : 
        ; MX1 = A 
        ; MX2 = B
        ; IF MX2 >=C :
            ; MX2 = MX2
        ; ELSE :
            ; IF MX1  >= C :
                ; MX2 = C
            ; ELSE : 
                ; MX2 = MX1
    ; ELSE A<B :
        ; MX1 = B 
        ; MX2 = A
        ; IF MX2 >=C :
            ; MX2 = MX2
        ; ELSE :
            ; IF MX1  >= C :
                ; MX2 = C
            ; ELSE : 
                ; MX2 = MX1    
; IF A NOT_EQUAL C 
    ; SAME AS BEFORE











.MODEL SMALL


.STACK 100H


.DATA
    
    CR EQU 0DH
    LF EQU 0AH
    
    NEWLINE DB CR, LF , '$'  
    
    I1 DB 'ENTER FIRST NUMBER = ? $'  
    I2 DB 'ENTER SECOND NUMBER = ? $'   
    I3 DB 'ENTER THIRD NUMBER = ? $'
    
    O1 DB 'ALL EQUAL $'
    O2 DB '2ND MAXIMUM IS  = $'

    X DB ?
    Y DB ?
    Z DB ?
    
    MX1 DB ?
    MX2 DB ?
    
.CODE

MAIN PROC
	;DATA SEGMENT INITIALIZATION
    MOV AX, @DATA
    MOV DS, AX
    

    
    LEA DX, I1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H

    SUB AL, 30H
    MOV X, AL
    
    ; OUTPUT NEWLINE
    LEA DX, NEWLINE 
    MOV AH,9 
    INT 21H 

    LEA DX , I2
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    
    SUB AL, 30H
    MOV Y, AL 
    
    LEA DX, NEWLINE 
    MOV AH,9 
    INT 21H
                 
                 
    LEA DX, I3
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    SUB AL, 30H
    MOV Z, AL
    
    LEA DX, NEWLINE 
    MOV AH,9 
    INT 21H 
    
ALL_EQUAL :
    
    
    MOV AL , X 
    CMP AL , Y
     
    JNE IF_1
    
    CMP AL , Z
    JNE IF_1
    
    JMP SHOW_ALL_EQUAL
    
IF_1:                
    
    MOV AL , X
    CMP AL , Y
    
    JG IF_2
    
    ;ELSE PART
    
    MOV AL , Y
    MOV MX1 , AL
    
    MOV AL , X
    MOV MX2, AL 
    
    JMP IF_3
    
    
    
IF_2:
    MOV AL , X
    MOV MX1 , AL
    
    MOV AL , Y
    MOV MX2, AL


IF_3:
    MOV AL , MX2 
    CMP AL , Z
    
    JGE SHOW
    
    MOV AL , MX1
    CMP AL , Z
    JGE ASSIGN
    
    MOV MX2 , AL
    JMP SHOW                                

ASSIGN:
    MOV AL , Z
    MOV MX2 , AL
    
    JMP SHOW

SHOW_ALL_EQUAL: 
    LEA DX, O1
    MOV AH, 9
    INT 21H

    JMP EXIT
              
SHOW:
    LEA DX, O2
    MOV AH, 9
    INT 21H
                  
    MOV AH , 2 
    ADD MX2 ,30H
    MOV DL , MX2
    INT 21H
    JMP EXIT
    
    
    
EXIT:
    ;DOS EXIT
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
    