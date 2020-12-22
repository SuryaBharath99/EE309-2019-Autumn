org 00h
ljmp main


 
 
zeroOut : 
	loop1 : mov @r0,#0;
		  inc r0;
		  djnz r2 ,loop1  
  ret		  


display : 
loop2 : mov a,@r0;
	    RL a;
	    RL a;
	    rl a;
	    rl a;
	    mov P1,a;
	    inc r0;
	    mov R5,#20;
	    back2 :
				mov R4,#196
					BACK1 :
						MOV R3,#0FFH
						BACK :
							DJNZ R3,BACK
						DJNZ R4, BACK1
		djnz R5,back2
	      
	   djnz r2, loop2;

ret

 
bin2ascii_checksumbyte :
		loop :	add a,@r0;
				inc r0;
				djnz r2 , loop;
		cpl a;
		add a,#01H;
		inc r0;
		mov @r0,a;
		
		mov R6,a;
		
		anl a,#0f0h
		rr a
		rr a
		rr a
		rr a
		
		mov R7,a;
		mov a,#0Ah;
		
		mov psw,#00H
		
		SUBB a,R7;
		mov a,#00H;
		addc a,#00H; 
		
		cjne a,#00h,first
		jz second
		
		first : mov a,R6
				anl a,#0f0h
				rr a
				rr a
				rr a
				rr a
				
				add a,#37H;
				inc r1
				mov @r1,a;
				
				sjmp here2
				
				
		second :  mov a,R6
				anl a,#0f0h
				rr a
				rr a
				rr a
				rr a
				
				add a,#30H
				inc r1;
				mov @r1,a;
				
	
				
here2 :	mov a,R6;
		anl a,#0Fh;
		mov R6,a;
		mov R7,a;
		mov a,#0Ah;
		
		mov psw,#00H
		
		SUBB a,R7;
		mov a,#00H;
		addc a,#00H; 
		
		cjne a,#00h,third
		jz fourth


        third :	mov a,R6
				anl a,#0fh
				
				add a,#37H;
				inc r1
				mov @r1,a;
				sjmp here1;
		
		fourth :mov a,R6
				anl a,#0fh
				
				add a,#30H
				inc r1;
				mov @r1,a;

here1 : ret		
		
		
memcpy : 
		mov a,@r0;
		mov @r1,a;
		inc r0;
		inc r1;
		
		djnz r2, memcpy
ret		
	

                 

main:
	mov r2,50H;
mov r0,51H;
mov r1,52H;
	;ACALL zeroOut
	;ACALL display
	ACALL bin2ascii_checksumbyte
	;ACALL memcpy
	HERE :SJMP HERE
	
END	
	