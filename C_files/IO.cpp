#pragma once
#include "IO.h"



extern "C" void outb(u16int port, u8int value)
{
   asm volatile( "outb %0, %1" : : "a"(value), "Nd"(port) );

}

extern "C" u8int inb(u16int port)
{
   u8int ret;
   asm volatile("inb %1, %0" : "=a" (ret) : "dN" (port));
   return ret;
}

