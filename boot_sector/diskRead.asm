DISK_IO equ 0x13
DISK_READ equ 0x02

;readDisk(RamSpace,sectors,disk,cylinder,head,sector);
Read_Disk:
  mov ah,DISK_READ
  mov bx,PROGRAM_SPACE
  mov al,64;2048
  mov dl,[BOOT_DISK]
  mov ch,0
  mov dh,0
  mov cl,2


  int DISK_IO
  jc Read_Failed
  mov bx,READ_SUCCSESS
  call print_String
  ret
Read_Failed:
 mov bx,READ_ERROR
 call print_String
 jmp $



BOOT_DISK:
   db 0
READ_ERROR:
   db "[ERROR]READING DISK FAILED",NL,0 
READ_SUCCSESS:
  db "[OK]DISK READ SUCCSESS",NL,0      