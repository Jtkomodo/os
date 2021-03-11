
#include "IO.cpp"
#include "print.cpp"
extern "C" {

void _start(){
  int* p=(int*)0xb8000;
  *p=0x0f690000;

}


 


}