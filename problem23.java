import java.util.*;
import static java.lang.System.out;

class problem23
{
   public static void main (String [] args)
   {
      ArrayList<Integer> abNums = new ArrayList<Integer>();
      for (int i = 1; i <= 28123; i++)
         if(isAbundantNum(i)) abNums.add(i);
      abNums.trimToSize();
      
      ArrayList<Integer> nums = new ArrayList<Integer>();
      for (int i = 0; i < 28123; i++) nums.add(i+1);
      nums.trimToSize();
      
      int stop = abNums.size();
      for (int i = 0; i < stop; i++)
      {
			for(int j = 0; j < stop; j++)
         {
            Integer sum = abNums.get(i)+abNums.get(j);
            if (nums.contains(sum)){ nums.remove(sum); }
         }
      }
      int sum = 0;
      for (int i = 0; i < nums.size(); i++)
         sum+=nums.get(i);
  
      out.println(sum);
   }
   private static boolean isAbundantNum (int x)
   {
      int sum = 0;
      for (int i = 1; i <= x >> 1; i++)
      {
         if (x % i == 0) sum+=i;
      }
      return sum > x;
   }
}
