OUTPUT_FORMAT(binary)


ENTRY (_start)


INPUT
(
      exProgram.o
      Kernel.o
      Cursor.o
      IO.o
      Keyboard.o
)

OUTPUT(

    Kernel.bin

)

SECTIONS{

    . = 0x8000;
    
    .text :ALIGN(0x1000)
    {

        *(.text)
    }
    

     .data :ALIGN(0x1000)
    {

        *(.data)
    }

   .rodata :ALIGN(0x1000)
    {

        *(.rodata)
    }

   .bss :ALIGN(0x1000)
    {
        *(COMMMON)
        *(.bss)
    }
}