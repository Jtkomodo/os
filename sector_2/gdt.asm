
gdt_nulldesc:
    dd 0x0
    dd 0x0
gdt_codedesc:
    dw 0xffff ;limit
    dw 0x0000; base 0:15
    db 0x00;base 16:23
    db 10011010b;flags
    db 11001111b;flags + upper limit
    db 0x00;base 24;31
gdt_datadesc:
    dw 0xffff ;limit
    dw 0x0000; base 0:15
    db 0x00;base 16:23
    db 10010010b;flags
    db 11001111b;flags+ upper limit
    db 0x00;base 24;31
gdt_end:
gdt_descriptor:
     gdt_size:
        dw gdt_end-gdt_nulldesc-1
        dq gdt_nulldesc
codeseg equ gdt_codedesc-gdt_nulldesc
dataseg equ gdt_datadesc-gdt_nulldesc     

[bits 32]
EditGDT:
  ;change to 64 bit mode
  mov [gdt_codedesc+6],byte 0xaf
  mov [gdt_datadesc+6],byte 0xaf
ret
[bits 16]