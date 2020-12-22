ORG 0000H
LJMP MAIN





ORG 0100H

;this subroutine generates delay of 50-60 ms
DELAY:
	;-- write appropriate delay code
	
	
MOV R2,#200
BACK1:
MOV R1,#0FFH
BACK :
DJNZ R1, BACK
DJNZ R2, BACK1
        
	RET





MAIN:
		mov a,#0;
		mov r3,#50
		mov r4,#5
		mov r5,#250
		;-- initialize appropriately
	loop:	mov p1,a;-- write out waveform magnitude onto the PORT P1
		
		lcall delay;-- call delay subroutine
		
		
		add a,r3;-- increment or decrement magnitude as required
		djnz r4, loop
		mov r4,#5;	
		clr cy
		subb a,r3
		loop1:	subb a,r3
				mov p1,a
				lcall delay;-- call delay subroutine
				
				
			jnz  loop1 ;-- logic to continue with the waveform
		jz loop  ;-- LJMP loop
	
	END
