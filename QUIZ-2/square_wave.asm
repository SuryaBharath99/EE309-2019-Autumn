ORG 0000H
clr p3.2
ljmp main


loop: cpl p3.2
		ljmp main



main: 
mov r0,#5FH
loop1:
mov 8AH,#00h
mov 8AH,#00h
mov 89H,#01H 

setb 08CH
jb 8Dh ,loop2


loop2:
djnz r0,loop1;
ljmp loop

here:sjmp here


end
