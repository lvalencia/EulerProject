import java.util.*;
import java.lang.String;

class problem4
{
   public static void main (String [] args)
   {
      long largest = -1;
      for(int i = 999; i >= 100; i--)
         for(int j = 999; j >= 100; j--)
         {
            long result = i*j;
            if (isPalindrome(result+"")) 
            {
               if (result > largest) largest = result; 
            }
         }
      System.out.println(largest);
   }
   public static boolean isPalindrome (String str)
   {
      int j = str.length()-1;
      for (int i = 0; i <= str.length() >> 1; i++)
      {
         if (str.charAt(i) !=  str.charAt(j)) return false; 
         j--;
      }
      return true;
   }
}
