[org 0x7e00]
[bits 16]
jmp Start
;includes
%include "boot_sector/printSting.asm"
%include "sector_2/gdt.asm"

Start:
mov ah,TYPE_OUT
mov al,'K'
int 0x10
call ENABLE_A20
cli;disable bios inturupts
lgdt [gdt_descriptor]
mov eax,cr0
or eax,0x1
mov cr0,eax
jmp codeseg:START_PM


ENABLE_A20:
    in al,0x92
    or al,2
    out 0x92,al
    ret


[bits 32]
;defines
VIDEO_MEMORY equ 0xb8000
START_PM:
   mov ax,dataseg
   mov ds,ax
   mov ss,ax
   mov es,ax
   mov fs,ax
   mov gs,ax
   ;setup stack
   mov ebp,0x90000
   mov esp,ebp
   
   mov [VIDEO_MEMORY],byte 'H'

   jmp $



;padding
times 2048 -($-$$) db 0
