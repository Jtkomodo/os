[org 0x7c00]
PROGRAM_SPACE equ 0x8000;right after the boot sector

;setup stack
mov bp,0x7c00
mov sp,bp
mov bx,String
call print_String
call Read_Disk
jmp PROGRAM_SPACE

;includes
%include "boot_sector/printSting.asm"
%include "boot_sector/diskRead.asm"
mov bx,BAD
call print_String
;data
String:
  db "Jesse Talbot's OS",NL,0
BAD:
 db "BAD",NL,0


;padding and magic number
times 510 -( $ - $$ ) db 0 
dw 0xaa55