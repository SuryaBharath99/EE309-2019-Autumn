ORG 00H
	
clr p3.2
ljmp main





org 100H
main: 
setb IE.7
setb IE.1
mov r0,#6FH




mov 8AH,#00h;TL0
mov 8CH,#00h; TH0
mov 89H,#01H ; timer 0 in mode 1
setb 8CH
;here2:sjmp here2



here:sjmp here


org 000BH
ljmp 200h

org 200H
	
clr 8Dh
ljmp loop2
	
loop: cpl p3.2
		ljmp main
		

loop2:
djnz r0,loop4;
acall loop


loop4:
mov 8AH,#00h;TL0
mov 8CH,#00h; TH0
mov 89H,#01H ; timer 0 in mode 1
setb 8CH
here66: sjmp here66



end
