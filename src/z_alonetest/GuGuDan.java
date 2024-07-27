package z_alonetest;

import java.util.Scanner;

public class GuGuDan {
    public static void main(String[] args) {
        GuGuDan ggdstart= new GuGuDan();
        ggdstart.gugu();
    }
    
    public void gugu() {
        int dan;
        for (dan=2; dan<10; dan++) {
            System.out.printf( "\n%d단", dan );
            for(int i = 1 ;i<10; i++ ){
                System.out.printf("\n%d * %d = %d",dan,i,dan*i );
            }

            
        } if (dan==10) {
        return;           
        }


    }



}