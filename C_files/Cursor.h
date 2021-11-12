#ifndef CURSOR_H
#define CURSOR_H
#include "IO.h"
extern "C" {

#define VGA_WIDTH 80
#define VGA_HEIGHT 24
typedef union position{
   u16int vec2;
    struct{
        u8int x;
        u8int y;
    };
} position;

void enable_cursor(u8int cursor_start, u8int cursor_end);
void update_cursor(int x, int y);
void Write_string(char* string,unsigned char color);
position get_cursor_position(void);








}    
#endif