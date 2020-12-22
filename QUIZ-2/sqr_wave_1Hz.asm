org 00H
ljmp main1




org 00Bh
ljmp 200H



org 200H
djnz r0,loop1

cpl p3.2
ljmp main1

loop1: 
ljmp main 
ret

retI




org 100h


main1:
mov r0,#0Fh

main: 


;mov r1,#0FFh

mov TMOD,#01H
mov TH0,#01H;
mov TL0,#00H
setb TR0
clr 8DH;
mov IE,#82H

sjmp $


end
