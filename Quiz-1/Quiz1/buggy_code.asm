
org 0H
ljmp main

org 100H
main:
    mov r2, #1          
    mov r1, #50H         
    mov r0, 51H	
    mov r3, 50H 
		
                 
    
loop:	mov a, r2            
	mov b, r2		
	mul ab
	mov @r0,a
	inc r0
	inc r2
	djnz r3, loop
    here : sjmp here        
end
