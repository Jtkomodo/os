TYPE_OUT equ 0x0e
%define NL 0xa,0xd
print_String:
push ax
mov ah,TYPE_OUT
loop:
 cmp [bx],byte 0
 je exit
   call .print_char
   inc bx 
   jmp loop


.print_char:
   mov al,[bx]
   int 0x10
   ret

exit:
pop ax
ret