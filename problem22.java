import java.util.*;
import static java.lang.System.out;

class problem22 
{
   static int displacement = 64;
   public static void main (String [] args)
   {
      Scanner sc = new Scanner (System.in);
      String name;
      int c;
      int counter = 1;
      int total = 0;
      while (sc.hasNext())
      {
         name = sc.nextLine();
         int innerSum = 0;
         for (int i = 0; i < name.length(); i++)
         {
             c = name.charAt(i);
             innerSum += (c-displacement);
         }
         total += (counter*innerSum); 
         counter++;
      }
      out.println(total);
   }
}
