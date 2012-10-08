import java.util.*;

class problem42
{
   public static void main (String [] args)
   {
      Scanner sc = new Scanner (System.in);
      int counter = 0;
      while (sc.hasNext())
         if(isTriangleNum(valueOfWord(sc.nextLine()))) counter++;
      System.out.println(counter);
   }
   private static boolean isTriangleNum (long num)
   {
      double testA = (Math.sqrt(8*num+1)-1)/2;
      int testB = (int) testA;
      return testA == testB;
   }
   private static int valueOfWord(String s)
   {
      int accum=0;
      for(int i = 0; i < s.length(); i++)
      {
         char t = s.charAt(i); 
         int val = t-64;
         accum+=val;
      }
      return accum;
   }
}
