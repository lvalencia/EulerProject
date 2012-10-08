#include<stdio.h>
#include<stdlib.h>

int horizontal(int *a, int x, int y);
int vertical(int *a, int x, int y);
int diagDown(int *a, int x, int y);
int diagUp(int *a, int x, int y);

int main ()
{
   int* input = malloc(20*20*sizeof(int));
   int i, j;
   int temp;
   for (i = 0; i < 20; i++)
      for(j = 0; j < 20; j++)
      {
         scanf("%d", &temp);
         input[i*20+j] = temp;
      }
   for (i = 0; i < 20; i++)
   {
      for(j = 0; j < 20; j++)
      {
         printf("%2d ",  input[i*20+j]);
      }
      printf("\n");
   }
   int a = horizontal(input, 20, 20);
   int b = vertical(input, 20, 20);
   int c = diagDown(input, 20, 20);
   int d = diagUp(input, 20, 20);
   int result = a;
   if (result < b) result = b;
   if (result < c) result = c;
   if (result < d) result = d;
   printf("HIGHEST PRODUCT %d\n", result);

   return 0;
}
int horizontal (int *a, int x, int y)
{
   int stop = y-3;
   int i,j;
   int product = 1;
   for (i = 0; i < x; i++)
      for(j = 0; j < stop; j++)
      {
         int temp = a[i*20+j]*a[i*20+j+1]*a[i*20+j+2]*a[i*20+j+3];
         if (temp > product) product = temp;
      }
   return product;
}

int vertical(int *a, int x, int y)
{
   int stop = x-3;
   int i,j;
   int product = 1;
   for(j = 0; j < y; j++)
   {
      for (i = 0; i < stop; i++)
      {
         int temp = a[i*20+j]*a[(i+1)*20+j]*a[(i+2)*20+j]*a[(i+3)*20+j];
         if (temp > product) product = temp;
      }
   }
   return product;
}
int diagDown(int *a, int x, int y)
{
   int stop = y-3;
   int i,j;
   int product = 1;
   for (i = 0; i < x-3; i++)
      for(j = 0; j < stop; j++)
      {
         int temp = a[i*20+j]*a[(i+1)*20+j+1]*a[(i+2)*20+j+2]*a[(i+3)*20+j+3];
         if (temp > product) product = temp;
      }
   return product;

}
int diagUp(int *a, int x, int y)
{
   int i,j;
   int product = 1;
   for (i = 19; i > 2; i--)
      for (j = 0; j < y-3; j++)
      {
         int temp = a[i*20+j]*a[(i-1)*20+j+1]*a[(i-2)*20+j+2]*a[(i-3)*20+j+3];
         if (temp > product) product = temp;
      }
   return product;
}
