[org 0x7c00]
Main:
jmp START
bootsector:
    db "Kom-os  ";OEM STRING
    dw 0x200 ;bytes per sector
    db 1 ;sectors per cluster
    dw 1; number of reserved sectors
    db 2;number of FAT copies
    dw 2880;total number of sectors if over 32 MB
    db 0xf0;media descriptor
    dw 9;size of each FAT
    dw 9 ;sectors per track
    dw 2 ;number of r/w heads
    dw 0;number of hidden sectors
    dw 0 ;number of secotrs for over 32 MB
    db 0;holds drive that the bootloader came from
    db 0;reserved, empty
    db 0x29;extended boot secctor signature
    db "seri";disk serial
    db "MYVOLUME   ";Volume label
    db "FAT16   "  

PROGRAM_SPACE equ 0x8000;right after the boot sector


START:
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