#ifndef IO_H
#define IO_H
typedef unsigned int   u32int;
typedef          int   s32int;
typedef unsigned short u16int;
typedef          short s16int;
typedef unsigned char  u8int;
typedef          char  s8int;


extern "C" void outb(u16int port, u8int value);
extern "C" u8int inb(u16int port);


#endif