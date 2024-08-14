package com.kh.object;

import java.util.Arrays;
import java.util.Scanner;

public class LottoApp {
    Scanner s = new Scanner(System.in);

    public static void main(String[] args) {

        LottoApp nu = new LottoApp();
        nu.howmany();

    }

    public void howmany() {

        System.out.println("몇장 사세요?");

        int set = s.nextInt();

        for (int a = 0; a < set; a++) {

            System.out.println(Arrays.toString(lotto()));
            if (a == set) {
                break;

            }

        }

    }

    public int[] lotto() {

        int[] lottonum = new int[6]; // 0부터 시작함
        for (int i = 0; i < lottonum.length; i++) {

            lottonum[i] = (int) (Math.random() * 45) + 1; // math.random = 0.0부터 0.999까지 생성이라
                                                          // 45를 곱했을 때 0~44생성 +1해주면 1~45

            for (int k = 0; k < i; k++) {
                if (lottonum[i] == lottonum[k]) {
                    i--;
                    break;

                }
            }

        }
        return lottonum;

    }

}
