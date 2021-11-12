#ifndef KEYBOARD_H
#define KEYBOARD_H
#include "IO.h"

typedef struct {
	uint16_t	limit;
	uint64_t	base;
} __attribute__((packed)) IDTR;
typedef struct IDTDescr {
   u16int offset_1; // offset bits 0..15
   u16int selector; // a code segment selector in GDT or LDT
   u8int zero;      // unused, set to 0
   u8int type_attr; // type and attributes
   u16int offset_2; // offset bits 16..31
} IDTDescr;







#endif