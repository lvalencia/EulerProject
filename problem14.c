#include<stdio.h>
static unsigned int counter = 0;
unsigned int collatz (unsigned int x)
{ 
   counter++;
   if (!(x % 2)) { return x+collatz (x>>1); }
   else { if (x == 1) { return 1; } else return x+(collatz((x<<1)+x+1)); } 
}
int main (int argc, char *argv[])
{
   unsigned int i;
   unsigned int largest = 0;
   unsigned int solution = 0;
   for (i = 1; i <= 1000000; i++)
   { 
       counter=0;
       collatz (i);
       if (counter > largest){ 
          largest = counter; 
          solution = i;
       }
   }
   printf("%u\n", solution);
   return 0;
}
