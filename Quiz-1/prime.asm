ORG 0000H
LJMP MAIN





ORG 20H
	
	
	
main: mov r3, 50h
	  mov b,#1;
	  mov r0,#51H
	  mov r2,#1
	  
loop:  inc r2
		 mov b,#1	
		 lcall primedetector
	  
	 
	  mov a,r3;
	  clr cy
	  
	  
	  subb a,r2;
	  mov a,#0;
	  addc a,#0;
	  
	  
	  jz loop
	  
	  jnz here
	  
	  
	  here: sjmp here
	  
	
primedetector: 	    
					inc b;
					mov a,b
					mov R4,a
					mov a,r2
					clr cy
					subb a,b
					jz writing
					
					mov a,r2;
					div ab
					mov a,b
					mov R1,a
					
					mov a,R4
					mov b,a
					
					mov a,R1
					jnz primedetector
					
					
					jz loop
					
					
					;mov R5,a
					
					;mov a,R2
					
					;subb a,b 
					;jz  writing
					
					;mov a,R5
					
					;jnz primedetector
					
		 
					ret


writing:
		inc r0;
		mov a,R2;
		mov @r0,a;
		mov a,b
		jz loop
		ret


	  
	 	
end	