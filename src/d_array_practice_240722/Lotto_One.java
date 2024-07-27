package d_array_practice_240722;

import java.util.Arrays;
import java.util.Scanner;


public class Lotto_One {
    public static void main(String[] args) {
        Lotto_One a = new Lotto_One();
        a.name();
    }

    Scanner s = new Scanner(System.in);

    public void name() {
        int howmany;
        System.out.println("몇장 사세요?");
        int count = s.nextInt();
        s.nextLine(); // 어차피 한번만 입력하고 끝나서 상관없긴 함
        for (howmany = 0; howmany < count; howmany++) {

            System.out.println(Arrays.toString(lolo()));
            
            if (count == howmany) {
                break;
            }
        }
        System.out.printf("%d원 입니다.", count * 1000);

    }

    public int[] lolo() {
        // null : 참조하는 주소가 없다
        // NullPointerException

        // int [] arr = null;

        int[] lo = new int[6];
        int i;

        for (i = 0; i < lo.length; i++) {
            lo[i] = (int) (Math.random() * 45) + 1;

            for (int k = 0; k < i; k++) {

                if (lo[k] == lo[i]) {
                    i--;
                    break;

                }
            }
        }
        // 배열요소가 가진 값을 출력해주는,,
        // Arrays.toString
        // System.out.println(Arrays.toString(lo));
        // 직접 출력하지않고 int[] (로또번호) 를 반환
        return lo;

        //
        // for (int s : lo) {
        // System.out.print("\t" + s);

        // }

    }

}
