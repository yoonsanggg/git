package com.kh.object;

import java.util.Arrays;
import java.util.Scanner;

public class Lololi {
    Scanner s = new Scanner(System.in);
    public static void main(String[] args) {
        Lololi go = new Lololi();
        go.howmany();
    }

    int[] lotto = new int[6];

    public int[] draw() {


        for (int i = 0; i < lotto.length; i++) {
            lotto[i] = (int) (Math.random() * 45) + 1;

            for (int k = 0; k < i; k++) {
                if (k == i) {
                    i--;
                    break;

                }

            }
        }
        return lotto;



    }
    public void howmany () {
        
        System.out.println("몇장 뽑으시겠습니까? ");
        int count = s.nextInt();
        s.nextLine();

        for(int w=0 ; w<count ;w++){
            System.out.println(Arrays.toString(draw()));
            if (w ==count) {
                break;
            
            }
        }
        


    }

}
