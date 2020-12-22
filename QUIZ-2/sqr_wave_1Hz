org 00H
ljmp main
org 00Bh
	
cpl p3.2
retI

org 100h
main: mov TMOD,#02H
mov TH0,#-50;
setb TR0
mov IE,#82H
sjmp $
end
