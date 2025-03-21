[bits 32]
PageTableEntry equ 0x1000


SetupIdPaging:
    ;setup the start of the page table
     mov edi,PageTableEntry
     mov cr3,edi
     mov dword[edi],0x2003
     add edi,0x1000
     mov dword[edi],0x3003
     add edi,0x1000
     mov dword[edi],0x4003
     add edi,0x1000

     mov ebx,0x00000003
     mov ecx,512
     .setEntry:
         mov dword[edi],ebx
         add ebx,0x1000
         add edi,8
         loop .setEntry

    mov eax,cr4
    or eax,1<<5
    mov cr4,eax
    
    mov ecx,0xc0000080
    rdmsr
    or eax,1<<8
    wrmsr

    mov eax,cr0
    or eax,0x1<<31
    mov cr0,eax
  ret
  [bits 16]