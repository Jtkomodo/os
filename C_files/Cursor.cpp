#include "Cursor.h"


 


 void enable_cursor(u8int cursor_start, u8int cursor_end)
{
	outb(0x3D4, 0x0A);
	outb(0x3D5, (inb(0x3D5) & 0xC0) | cursor_start);
 
	outb(0x3D4, 0x0B);
	outb(0x3D5, (inb(0x3D5) & 0xE0) | cursor_end);
}

void update_cursor(int x, int y)
{
	u16int pos = y * VGA_WIDTH + x;
 
	outb(0x3D4, 0x0F);
	outb(0x3D5, (u8int) (pos & 0xFF));
	outb(0x3D4, 0x0E);
	outb(0x3D5, (u8int) ((pos >> 8) & 0xFF));
}
position get_cursor_position(void)
{
    position out;
    u16int pos;
    pos=0;
    outb(0x3D4, 0x0F);
    pos |= inb(0x3D5);
    outb(0x3D4, 0x0E);
    pos |= ((u16int)inb(0x3D5)) << 8;
    
    
    out.x=pos%VGA_WIDTH;
	out.y=pos/VGA_WIDTH;


    return out;
}

extern  "C"  int  printString(char* string,int x,int y,unsigned char color){
   if(x>VGA_WIDTH){
     x=VGA_WIDTH;
   }
   if(y>VGA_HEIGHT){
     y=VGA_HEIGHT;
   }
   int index=y*VGA_WIDTH+x;
   char* p=(char*)(0xb8000);
   int i=0;
   int i2=index*2;
   while((string[i])!=0){
 
     p[i2+1]=color;
     p[i2]=string[i];
  

     i2+=2;
     i++;
   }
   return i;
}

void Write_string(char* string,unsigned char color){
      position p=get_cursor_position();
      int i=printString(string,p.x,p.y,color);
      update_cursor(p.x+i,p.y);




}



