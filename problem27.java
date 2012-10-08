import java.util.*;

class pair {
   public int a, b;
}
class problem27
{
   public static void main (String [] args)
   {
      int max = -1;
      pair quad = new pair();
      for(int i = -999; i < 1000; i++)
         for(int j = -999; j < 1000; j++)
         {
            int temp = countPrimes(i,j);
            if (temp > max) { max = temp; quad.a=i; quad.b=j; } 
         }
      System.out.println(quad.a*quad.b);
   }
   public static boolean isPrime(long p){
      for (int i = 2; i <= (p >> 1); i++)
         if( p % i == 0) return false;
      return true;
   }
   public static int countPrimes(long a, long b){
      int n = 0;
      int counter = 0;
      long value = n*(n+a)+b;
      while (isPrime(value))
      {
         counter++;
         n++;
         value = n*(n+a)+b;
      }
      return counter;
   }
}
