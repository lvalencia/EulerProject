#include <stdio.h>
int isPrime(long a);
int main(void)
{
   long result = -1;
   int i = 1;
   unsigned long prime = 2;
   while (i <= 10001)
   {
      if(isPrime(prime))
      {
         result = prime;
         i++;
      }
      prime++;
   }
   printf("%lu\n", result);
	return 0;
}

int isPrime(long a)
{
   long i;
   for(i = 2; i <= a/2; i++)
   {
      if(a % i == 0){ return 0; }
   }
   return 1;
}
