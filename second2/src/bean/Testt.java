package bean;

import java.util.Random;

public class Testt {
   public static void main(String[] args) {
      Random r = new Random();
      int index = 0;
      int i = 0;
      boolean b = false;
      int[] rNum = new int[5];
      while(true) {
         b =false;
         index = r.nextInt(5);
         if(i ==0) {
            rNum[i] = index;
            System.out.println(index);
            i++;
         }else if(i ==5) {
            break;
         }else if(1<=i && i<5) {
            rNum[i] = index;
            for (int j = i; j >= 0; j--) {
               for (int k = i; k >= 0; k--) {
                  if(j!=k) {
                     if(rNum[j] != rNum[k]) {
                    	 b=true;
                     }else {
                    	 b=false;
                    	 j=0;
                    	 k=0;
                     }
                  }
               }
            }
         }
         if(b) {
        	 i++;
        	 System.out.println(index);
         }else {
         }
      }
   }
}