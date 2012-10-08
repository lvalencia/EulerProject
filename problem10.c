#include <stdio.h>
#include <stdlib.h>
int isPrime(long a);
int main(void)
{
   long unsigned i;
   long unsigned primeSum = 0;
   for (i = 2; i < 2000000; i++)
   {
      if (isPrime(i)){ 
         primeSum += i; }
   }
   printf("%lu\n", primeSum);
   return 0;
}

int isPrime(long a)
{
   long i;
   for(i = 2; i <= (a >> 1); i++)
   {
      if(a % i == 0) return 0;
   }
   return 1;
}
