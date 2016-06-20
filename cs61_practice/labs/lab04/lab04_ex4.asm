;=================================================
; Name: Valerie Chiou
; Username: vchio001
; 
; Lab: <lab 4>
; Lab section: 21
; TA: Bryan Marsh
; 
;=================================================
.orig x3000
LD R1,DEC_1
LD R5,POINTER
LD R4,DEC_10


INPUT_WHILE	;store values in array
    STR R1,R5,#0
    ADD R5,R5,#1
    ADD R1,R1,R1
    ADD R4,R4,#-1
    BRnp INPUT_WHILE


LD R5,DEC_10	;array iteration loop
LD R2,POINTER
OUTPUT_WHILE
    LDR R1,R2,#0
    LD R6,FOUR

    LD R3,HIGH_BIT
    ST R2,POINTER
    LD R2,DEC_16

    ;output a 'b'
    LD R0,CHAR_B
    OUT
    ;output contents of actual array value loop 
    FOR_EACH
       
        AND R4,R1,R3
        NOT R4,R4
        ADD R4,R4,#1 
       ADD R4,R3,R4
        BRnp ZEROBIT
        ONEBIT
            LD R0,ONE
            OUT
            BR DONE
        ZEROBIT
            LD R0,ZERO
            OUT 
            BR DONE
        DONE
        ; check for 4 iterations and add space
        ADD R6,R6,#-1
        BRnp NOSPACE
        LD R0,SPACE
        OUT
        LD R6,FOUR
        NOSPACE 
        
        ADD R1,R1,R1
        ADD R2,R2,#-1
        BRnp FOR_EACH
    
    LD R0,NEWLINE
    OUT
    ADD R5,R5,#-1

    LD R2,POINTER
    ADD R2,R2,#1
    ST R2,POINTER
    
    ADD R5,R5,#0
    BRnp OUTPUT_WHILE
HALT


;data

DEC_1 .FILL #1
DEC_10 .FILL #10
POINTER .FILL x4000
CHAR_B .FILL x62


ZERO .FILL x30
ONE .FILL x31
SPACE .FILL x20
FOUR .FILL #4

DEC_16 .FILL #16
HIGH_BIT .FILL x8000
NEWLINE .FILL xA


.orig x4000

.BLKW #10
.end
