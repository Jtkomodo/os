#define WIDTH 80  
#define HEIGHT 24




extern "C" int printString(char* string,int x,int y){
   if(x>WIDTH){
     x=WIDTH;
   }
   if(y>HEIGHT){
     y=HEIGHT;
   }
   int index=y*WIDTH+x;
   char* p=(char*)(0xb8000);
   int i=0;
   int i2=index*2;
   while((string[i])!=0){
 
     p[i2+1]=0x0f;
     p[i2]=string[i];
  

     i2+=2;
     i++;
   }
   return i;
}