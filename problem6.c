#include<stdio.h>

int main ()
{
   unsigned long sumSq, sqSum;
   sumSq = sqSum = 0;
   int i;
   for (i = 0; i <= 100; i++)
   {
      sumSq += (i*i);
      sqSum += i;
   }
   sqSum *= sqSum;
   printf("%lu\n", sqSum-sumSq);
   return 0;
}
