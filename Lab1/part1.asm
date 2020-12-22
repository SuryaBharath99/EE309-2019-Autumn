org 0H
ljmp main  ; a label with name main
;as after 00h some locations are  there for interrupt ISR 

org 100H

main:
	mov a, 50H;
	mov r1, 60H;
	add a, r1;
	mov 70H,a;
	mov a,#0H;
	addc a,#0H;
	mov 71H,a;
	here : sjmp here;
end	