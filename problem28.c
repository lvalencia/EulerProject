#include<stdio.h>
int main ()
{
   unsigned int n = 1001, spacing = 2, counter = 1, i, j;
   unsigned long long sum = 1;
   for (j = 0, i = 3; j < 4*(n/2); j++, i+=spacing)
   {  
      sum+=i;
      if(counter % 4 == 0) { spacing+=2; }
      counter++;
   }
   printf("%llu\n", sum);
   return 0;
}
