import java.util.*;
import static java.lang.System.out;
import java.lang.String;

class problem18
{
   public static void main (String [] args)
   { 
      node root = makeTree();
      out.println(maximumTotal(root));
   }
   public static int maximumTotal(node root)
   {
      LinkedList<node> q = new LinkedList<node>();
      q.offer(root);
      int maximum = -1;
      while (q.size() > 0)
      { 
         node inspect = q.remove();
         if(inspect.hasLeftChild())
         { 
            node left = inspect.getLeftChild();
            left.setWeight(left.getValue()+inspect.getWeight());
            q.offer(left);
         }
         if(inspect.hasRightChild()) 
         {
            node right = inspect.getRightChild();
            right.setWeight(right.getValue()+inspect.getWeight());
            q.offer(right);
         }
         if(!inspect.hasRightChild() && !inspect.hasLeftChild())
         {
            if (maximum < inspect.getWeight()) maximum = inspect.getWeight();
         }
      }
      return maximum;
   }
   public static node makeTree ()
   {
      //PREPROCESSING, MAKE A PSUEDO-BINARY TREE : MEMORY IS SHARED
      Scanner sc = new Scanner(System.in);
      String currentLine = sc.nextLine();
      Scanner line = new Scanner(currentLine);
      node root = new node(line.nextInt());
      node current = root;
      Queue<node> q = new LinkedList<node>();
      q.offer(root);
      int counter = 2;
      while (sc.hasNext())
      {
          currentLine = sc.nextLine();
          line = new Scanner(currentLine).useDelimiter(" ");
          node next = null;
          boolean skip = false;
          while(line.hasNextInt())
          { 
             if(next == null) { current = q.remove(); }
             else { current = next; }
             if (!skip){
                 int left = line.nextInt();
                 current.makeLeftChild(left);
                 q.offer(current.getLeftChild());
              }
              int right = line.nextInt();
              current.makeRightChild(right);
              q.offer(current.getRightChild()); 
              if(line.hasNextInt())
              {
                 next = q.remove();
                 next.setLeftChild(current.getRightChild());
                 skip = true;
              }
          }
          counter++;
      }
      sc.close();
      line.close();
      return root;
   }
}
class node
{
   int k;
   int weight;
   node r;
   node l;
   node(int x) { k = x; weight = x; }
   node getRightChild() { return r; }
   node getLeftChild() { return l; }
   boolean hasRightChild() { return !(r == null); }
   boolean hasLeftChild() { return !(l == null); }
   void setValue(int x) { k = x; }
   int getValue () { return k; }
   void setWeight(int x) { if (x > weight) { weight = x;} }
   int getWeight(){ return weight; }
   void makeRightChild(int x) { r = new node(x); }
   void makeLeftChild(int x) { l = new node(x); }
   void setRightChild(node x) { r = x; }
   void setLeftChild(node x) { l = x; }
}
