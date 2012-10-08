#include<stdio.h>
int main ()
{
   int counter = 0;
   int a,b,c,d,e,f,g,h;
   for (a = 0; a <= 1; a++){
      for (b = 0; b <= (200-(200*a))/100; b++){
         for (c = 0; c <= (200-(200*a+100*b))/50; c++){
            for (d = 0; d <= (200-(200*a+100*b+50*c))/20; d++){
               for (e = 0; e <= (200-(200*a+100*b+50*c+20*d))/10; e++){
                  for (f = 0; f <= (200-(200*a+100*b+50*c+20*d+10*e))/5; f++) {
                     for (g = 0; g <= (200-(200*a+100*b+50*c+20*d+10*e+5*f))/2; g++){
                        for (h = 0; h <= (200-(200*a+100*b+50*c+20*d+10*e+5*f+2*g)); h++){ 
                           if (200*a+100*b+50*c+20*d+10*e+5*f+2*g+h == 200) { counter++; } }}}}}}}}
   printf("%d\n", counter);
   return 0;
}
