#include <stdio.h>
#include <stdlib.h>
long factorable = 600851475143;
int prime(long a);
int main(void)
{
   long i;
   long primeNum = 0;
   long product = 1;
   for (i = 1; i < (factorable/2); i++)
   {
      if (factorable % i == 0) 
         if (primeNum < i && prime (i))
         { 
            primeNum = i;
            printf("%li\n", primeNum);
            product *= primeNum;
            if (product >= factorable){ exit(0); }
         }
   }
   return 0;
}

int prime(long a)
{
   long i;
   for(i = 2; i <= a >> 1; i++)
   {
      if(a % i == 0) return 0;
   }
   return 1;
}
