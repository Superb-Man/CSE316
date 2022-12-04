.MODEL SMALL 
.STACK 100H 
.DATA

NUMBER_STRING DW '00000$'

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV AX, 12394
    CALL PRINT
    
    ; interrupt to exit
    MOV AH, 4CH
    INT 21H
MAIN ENDP
           
;Modifying Sir's Code to print reverse

PRINT PROC  
    
    ;Printing reverse of a string 
    
    LEA SI, NUMBER_STRING
    ADD SI , 0 
    
    PRINT_LOOP:
        ;DEC SI Commenting to Print in reverse 
        
        MOV DX, 0

        MOV CX, 10
        DIV CX
        
        ADD DX, '0'
        MOV PTR [SI], DL  
        INC SI
        
        CMP AX, 0
        JNE PRINT_LOOP 
    
    SUB SI , 5
    MOV DX, SI
    MOV AH, 9
    INT 21H
    
    RET

PRINT ENDP

END MAIN 


