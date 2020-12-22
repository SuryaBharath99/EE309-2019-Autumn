ORG 0000H
mov p0, #0FFh

setb p3.2
ljmp main


loop: cpl p3.2
		ljmp main



main: 
;acall delay


mov a,p0


anl a,#07H
add a,#02H
mov r5,a
cpl a
add a,#01h
mov b,#06h
MUL AB
mov r0,a
mov a,#0Ah
clr cy
subb a,r5
cpl a
add a,#01h
mov b,#06h
MUL AB
mov r1,a



;  timer



loop5: mov a,r0
mov th0,a
;mov a,r1
mov tl0,a



setb TR0



loop4: jnb tf0,loop9

	
		clr tf0
		clr tr0
		cpl p3.2
		
 mov a,r1
mov th0,a
;mov a,r1
mov tl0,a



setb TR0



loop6: jnb tf0,loop10


	
		clr tf0
		clr tr0
		cpl p3.2

        sjmp loop5









here1:sjmp here1

loop9:		mov a,p0


anl a,#07H
add a,#02H
    clr cy
	subb a,r5
	cjne a,#00, main
	sjmp loop4
	
	
loop10:mov a,p0


anl a,#07H
add a,#02H
    clr cy
	subb a,r5
	cjne a,#00, main
	sjmp loop6	
	


delay:

	push 3
		push 2
		push 1
		push 4
		push 6
		push 7
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

		pop 7
		pop 6 
		pop 4 
		pop 1
		pop 2
		pop 3
ret



end

