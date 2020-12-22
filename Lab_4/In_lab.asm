org 00h
	
ljmp main




org 50H
	
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
	
readNibble:
mov P1, #0Fh; First configure P1.3-P1.0 as input

mov P1,#0ffh; Set pins P1.7-P1.4(LEDs) (indication that routine is ready to accept input)

;lcall delay
;lcall delay
;lcall delay
lcall delay; wait for 5 sec during which user can give input
clr p1.7
clr p1.6
clr p1.5
clr p1.4; Clear pins P1.7-P1.4
lcall delay; wait for one sec

mov a,p1;
; read the input on P1.3-P1.0 (nibble)
mov b,#16

MUL AB
add a,#0FH;
mov r5,p1
mov p1,a




;lcall delay
;lcall delay
;lcall delay
lcall delay; show the read value on pins P1.7-P1.4(LEDs)
;wait for 5 sec

;The following code is to verify that the user input is right
clr p1.7
clr p1.6
clr p1.5
clr p1.4
mov a,p1; USER sets all switches if I/P is verified. (0FH )
cjne a,#0Fh,readNibble; Follow the above-mentioned procedure to accept a nibble
; If the nibble reads 0FH, USER input is verified.
; Else, User has to input the nibble again.
mov a,r5
mov @r0,a
RET






main:

mov r0,#50H
call readNibble
inc r0;
call readNibble
inc r0;
call readNibble
inc r0;
call readNibble
mov a,50H;
add a,51H;

mov 56H,a;

mov a,52H
addc a,53h
anl a,#0Fh

rl a
rl a
rl a
rl a

mov 57H,a
add a,56H;


cpl a
inc a

mov r0,a

anl a,#0F0H
mov P1,a;

lcall delay
lcall delay

mov a ,r0
anl a,#0Fh
rl a
rl a
rl a
rl a
mov P1,a;

here: sjmp here
end
