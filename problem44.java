import java.util.*;

class problem44
{
   public static void main (String [] args)
   {
      int min = Integer.MAX_VALUE;
      boolean notDone = true;
      for(int i = 2; notDone; i++)
      {
         for(int j = i-1; j > 0; j--)
         {
            int pi = nthPentagonal(i), pj = nthPentagonal(j);
            int d = Math.abs(pi-pj);
            if (min < d) notDone = false;
            if (isPentagonal(pi+pj) && isPentagonal(pi-pj) && min > d) min = d;
         }
      }
      System.out.println(min);
   }
   private static boolean isPentagonal (int x)
   {
      double n = (Math.sqrt(24*x+1)+1)/6;
      int temp = (int)n;
      return temp == n;
   }
   private static int nthPentagonal (int n){ return n*(3*n-1)/2; }
}
