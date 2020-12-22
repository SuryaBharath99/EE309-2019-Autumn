Org 0h
ljmp main
Org 100h

main:
    mov r2, #1 ; r2
	mov r1, 50H ;
	mov r0, #50H ;
	
	mov a, 50H;
	
	jz here;
	
	mov a, #0  ; clearing a
	
	loop:  
			add a, r2;
			inc r2; increamenting the no.
			inc r0; increamentiong the memory pointer
			mov @r0,a; storing the of a in memory location present in r0
			djnz r1,loop ;
			
			here : sjmp here;
end;			