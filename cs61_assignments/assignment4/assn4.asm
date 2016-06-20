;=================================================
; Name: Valerie Chiou	
; Email: vchio001@ucr.edu
; 
; Assignment name: assn 4
; Lab section: 22
; TA: Jhaveri
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------

;-------------------------------
;INSERT CODE STARTING FROM HERE 
;--------------------------------
;Example of how to Output Error Message

AND R2,R2, #0
BR BEGIN

ERROR
LD R0,NEWLINE
OUT
LD R0, errorMessage
PUTS

AND R2,R2, #0
BEGIN
LD R0, intoMessage
PUTS
GETC		;input
OUT

LD R1,C_POS	; checks for positive
ADD R3,R1,R0	; adds to R3 to check for zero, if zero its true
BRz TRUE	; if 0 , goes to POSITIVE
BR CHECK_NEG	; if not zero, goes  to check_neg

CHECK_NEG
LD R1, C_NEG
ADD R3,R1,R0	; check for neg
BRz SIGN	;goes to sign when 0
BR C_NUM1	;goes check for number

;twos complement, invert then add one to the lmb
SIGN
LD R3, ONE	; add one to the left most bit to make twos complement
ST R3, NEG_MEMORY
BR TRUE

TRUE

GETC
OUT


C_NUM1		; checks number
LD R3,C_NINE		;load value for nine
LD R4, MAX_NUM		; five values max
ADD R2,R0,R3	; value check greater than 9
BRp ERROR 	; if greater than 9 return error
LD R3,C_ZERO
ADD R2,R0,R3
;BRz IFZERO
BRn ERROR
ST R2, MEMORY


ADD R4,R4, #-1		;counter
ST R4, MAX_NUM		; Store counter


		;;;;;;;;;;;;;;;;;;;true


LOOP	;loop 5 times afters
LD R4, MAX_NUM
GETC
OUT
ADD R1,R0,#-10	;enter key, gives null
BRz ENTER
BR CK_NUM	

ENTER			;end loop
LD R5,ONE
;LD R5, MEMORY2		
ADD R5,R5,#-1
BRz CONV		;should equal to 0

CK_NUM			;enter 2
LD R3, C_NINE		;-57
LD R5, ONE		;1
ST R5,MEMORY2		; store 1 into MEMORY2
ADD R2,R0,R3		; =-7
BRp ERROR	;greater than 9

LD R3, C_ZERO		;load -48
ADD R1, R0, R3		;50-48 R1=2
BRn ERROR	;less than 0

;ADD R2,R3,R0	;-48+50 R2 = 2
LD R2, MEMORY		; load 1
ADD R5, R1,#0		;R4 = 2

;BRz IFZERO

LD R5, ENT		;10
LD R6, NULL ; 0
ADD R2, R2, #0
BRz IFZERO
BR NOTZERO
IFZERO
ADD R5,R5, #-10
NOTZERO

LOOP2		;multiplication
ADD R6,R6,R5		;10+0 = 10
ADD R2,R2,#-1		;2-1= R2=1
BRp LOOP2
ADD R6,R6, R1
ST R6, MEMORY
BR DONE 



DONE
ADD R4,R4,#-1 	;counter
ST R4, MAX_NUM
BRp LOOP
;BR CONV

;IFZERO
;ST R2, MEMORY  		;store zero directly no conversion
;BR FINISH

CONV	;null finish
LD R2, MEMORY

LD R3, NEG_MEMORY
ADD R3, R3, #0
BRnz FINISH

;1 stored in neg mem
NOT R2,R2	;ones complement
ADD R2,R2,#1	; twos complement

ST R5, NULL
ADD R5, R2, #0

FINISH

LD R0, NEWLINE
OUT
HALT
;---------------	
;Data
;---------------
ENT	.FILL #10
POS	.FILL #43
NEG	.FILL #45
C_ZERO	.FILL #-48
C_NINE	.FILL #-57
NEWLINE	.FILL #10
C_POS	.FILL #-43
C_NEG	.FILL #-45
MAX_NUM	.FILL #5
NULL	.FILL #0
MAX	.FILL #5
N_ONE	.FILL #-1
ONE 	.FILL #1 

MEMORY	.BLKW #1	
MEMORY2	.BLKW #1
NEG_MEMORY	.BLKW #1

intoMessage .FILL x6000
errorMessage .FILL x6100

;------------
;Remote data
;------------
.ORIG x6000
;---------------
;messages
;---------------
intro .STRINGZ	"Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"
;---------------
;error_messages
;---------------
.ORIG x6100	
error_mes .STRINGZ	"ERROR INVALID INPUT\n"

;---------------
;END of PROGRAM
;---------------
.END
;-------------------
;PURPOSE of PROGRAM
;-------------------
