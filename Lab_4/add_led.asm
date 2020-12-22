org 00h
	
ljmp main




org 100H
	
readNibble:
mov P1, #0Fh; First configure P1.3-P1.0 as input

mov P1,#0ffh; Set pins P1.7-P1.4(LEDs) (indication that routine is ready to accept input)

lcall delay
lcall delay
lcall delay
lcall delay
lcall delay; wait for 5 sec during which user can give input
clr p1.7
clr p1.6
clr p1.5
clr p1.4; Clear pins P1.7-P1.4
lcall delay; wait for one sec
;mov @r0,p1
mov a,p1;
; read the input on P1.3-P1.0 (nibble)
mov b,#16

MUL AB
add a,#0FH;

mov p1,a



lcall delay
lcall delay
lcall delay
lcall delay
lcall delay; show the read value on pins P1.7-P1.4(LEDs)
;wait for 5 sec

;The following code is to verify that the user input is right
clr p1.7
clr p1.6
clr p1.5
clr p1.4
mov a,p1; USER sets all switches if I/P is verified. (0FH )
cjne a,#0Fh,readNibble; Follow the above-mentioned procedure to accept a nibble
mov @r0,p1
; If the nibble reads 0FH, USER input is verified.
; Else, User has to input the nibble again.
RET

packNibbles:
mov a,4Eh
add a,4fh
mov 50H,a; Combine the two nibbles and store the byte to 50H.
RET




delay:
		mov R3,#5;
   
		back3 :
			  mov R2,#196
			  BACK1 :
				    MOV R1,#0FFH
				    BACK :
				   	     DJNZ R1,BACK
				    DJNZ R2, BACK1
			
			  mov R4,#12;	
			  back4 :
					mov R6,#196
					BACK5 :
						  MOV R7,#0FFH
				          BACK6 :
				   	           DJNZ R7,BACK6
						  DJNZ R6, BACK5
				    DJNZ R4, back4
			  DJNZ R3, back3
ret





main:
mov r0,#4Eh
call readNibble; Read the MSB from the user and store in into locations 4EH
inc r0
call readNibble; Read the LSB from the user and store in into locations 4FH
call packNibbles;
end
