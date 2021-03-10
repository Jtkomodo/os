nasm  boot_sector/boot.asm -f bin -o boot_sect.bin
nasm  sector_2/exProgram.asm -f bin -o exProgram.bin
copy /b boot_sect.bin+exProgram.bin boot_sect.flp