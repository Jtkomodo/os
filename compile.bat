
wsl nasm  boot_sector/boot.asm -f bin -o boot_sect.bin

wsl nasm  sector_2/exProgram.asm -f elf64 -o exProgram.o

wsl $WSLENV/x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "C_files/Kernel.cpp" -o "Kernel.o"
wsl $WSLENV/x86_64-elf-ld -T"link.ld"

copy /b boot_sect.bin+Kernel.bin boot_sect.flp
del /f *.o,*.bin,*.elf
