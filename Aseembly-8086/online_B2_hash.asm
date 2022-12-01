
.MODEL SMALL


.STACK 100H                                                                S
.DATA
    
    CR EQU 0DH
    LF EQU 0AH
    
    NEWLINE DB CR, LF , '$'
    O1 DB "EQUAL" , '$'
    O2 DB "NOT EQUAL", '$'  

    hash1 DB ?
    hash2 DB ?
    
.CODE

MAIN PROC
	;DATA SEGMENT INITIALIZATION
    MOV AX, @DATA
    MOV DS, AX
    

    
    MOV CL , 0
    MOV BL , 0 
    
    START:
        MOV AH , 1
        INT 21H
        
        CMP AL , ' '
        JE SECOND
        
        CMP AL , NEWLINE
        JE PRINT
        
        INC CL
        
        SUB AL , 96
        
        MUL CL
        ADD BL , AL
        
        JMP START
        
     SECOND: 
        MOV CL , 0
        MOV hash1 , BL
        
        ;MOV DL , hash1
        ;MOV AH , 2
        ;INT 21H
        
        
        MOV BL , 0
        JMP START  
     
     PRINT: 
        LEA DX , NEWLINE
        MOV AH , 9
        INT 21H 
        
        CMP BL , hash1 
        JE EQUAL 
        
        LEA DX , O2
        MOV AH , 9
        INT 21H  
        JMP EXIT:
        
        EQUAL:
            LEA DX , O1
            MOV AH , 9
            INT 21H
        
          
    
    
    
EXIT:
    ;DOS EXIT
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN