[org 0x7e00]
jmp Start
;includes
%include "sector_2/gdt.asm"
%include "sector_2/CPU_ID.asm"
%include "sector_2/paging.asm"
Start:

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

   ;detect long mode
   call Detect
   call Detect_LONG
   ;setup paging
   call SetupIdPaging
   call EditGDT
   
   ;far jump to flush the pipeline again
   jmp codeseg:START_64
   jmp $
[bits 64]   
START_64:
  

   mov edi,VIDEO_MEMORY
   mov rax,0x1f201f201f201f20
   mov ecx,500
   rep stosq


 jmp $
;padding
times 2048 -($-$$) db 0
