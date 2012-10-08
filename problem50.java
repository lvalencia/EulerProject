import java.util.*;
class problem50
{
   public static void main (String [] args)
   {
      long max = 1000000;
      long sum = 0, solution = -1, maxCounter = Integer.MIN_VALUE, trueSolution = -1;
      int counter = 0, total = 0;
      for(long j = 1; true; j = nextPrime(j)){
         for(long i = j; sum < max; i = nextPrime(i)){
               sum+=nextPrime(i);
               counter++;
               if (sum < max && isPrime (sum)) { total = counter; solution = sum; }
   			}
            sum = 0;
            if (total > maxCounter) { trueSolution = solution; maxCounter = total; }
            total = 0;
            counter = 0;
            if (j > max) break;
   		}
		System.out.println(trueSolution);
	}
   private static long nextPrime(long currentPrime)
   {
      for(long x = currentPrime+1; true; x++)
			if(isPrime(x)) return x; 
   }
   private static boolean isPrime (long x)
   {
      for(long i = 2; i <= x>>1; i++)
			if(x % i == 0) return false;
		return true;
   }
}
