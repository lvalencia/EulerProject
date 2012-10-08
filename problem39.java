import java.util.*;

class problem39
{
   public static void main (String [] args)
   {
      HashMap<Integer, Integer> hm = new HashMap<Integer, Integer>();
      for(int i = 0; i <= 1000; i++)
         for(int j = 0; j <= (1000 - i); j++)
            for(int k = 0; k <= (1000 - (i+j)); k++)
            {
               if (i*i+j*j != k*k) continue;
               Integer sum = i+j+k;
               if(hm.containsKey(sum))
               {
                  Integer temp = hm.get(sum);
                  temp = temp.intValue() + 1;
                  hm.remove(sum);
                  hm.put(sum, temp);
               }
               else hm.put(sum, 1);
            }
       Set<Map.Entry<Integer, Integer>> pairs = hm.entrySet();
       Iterator<Map.Entry<Integer, Integer>> it = pairs.iterator();
       int max = -1, result=-1;
       while(it.hasNext())
       {
          Map.Entry<Integer, Integer> temp = it.next();
          int val = temp.getValue().intValue();
          if (val > max)
          {
             max = val;
             result = temp.getKey().intValue();
          }
       }
       System.out.println(result);
   }
}
