package com.kh.object.practice;

import java.util.Arrays;
import java.util.Scanner;

public class Lotto {
    public static void main(String[] args) {
        Lotto nu = new Lotto();
        nu.lottonum();
    }

    Scanner s = new Scanner(System.in);

    public void lottonum() {
        int howmany;

        System.out.println("몇장 사세요?");

        howmany = s.nextInt();

        for (int o = 0; o < howmany; o++) {
            System.out.println(Arrays.toString(lo()));

            if (o == howmany) {
                break;

            }

        }

    }

    public int[] lo() {

        int[] loto = new int[6];

        for (int i = 0; i < loto.length; i++) {

            loto[i] = (int) (Math.random() * 45) + 1;
            for (int k = 0; k < i; k++) {
                if (i == k) {
                    i--;
                    break;

                }

            }

        }
        return loto;


    }

}
