org 00H
mov r2, #0AH
mov r0, #29H
mov r1, #2EH
Lbl1:mov A, @r0
mov @r1,A
INC r0
INC r1
DJNZ r2, Lbl1
END
