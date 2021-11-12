#include "KeyboardIDT.h"


__attribute__((aligned(0x10))) 
static IDTDescr idt[256];


