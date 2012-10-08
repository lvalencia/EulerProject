#include<stdio.h>

int isPrime(int a);
int isFullReptendPrime (int prime);
int main ()
{
   int i;
   int max = -1;
   for(i = 2; i < 1000; i++)
   {
      if (i > max && isPrime(i) && isFullReptendPrime(i)) { max = i; }
   }
   printf("%d\n", max);
   return 0;
}
int isPrime(int a)
{
   int i;
   for (i = 2; i <= (a >> 1); i++)
      if(a%i==0) return 0;
   return 1;
}
int isFullReptendPrime (int prime)
{
   if ( 10 % prime == 0) return 0;
   int t = 0;
   int r = 1;
   unsigned long long n = 0;
   int done =  0;
   while (!done)
   {
       t = t + 1;
       int x = r * 10;
       int d = (x / prime);
       r = x % prime;
       n = n * 10 + d;
       if (r == 1) done = 1;
   }
   return t == prime - 1;
} 
