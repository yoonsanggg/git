package a_varibale;

import java.util.Scanner;

//국어 영어 수학 평균 값 구하기

public class PointTest {
    public void haha() {
        int kor, eng, math;
        double ever;
        String Str, Name;

        // 인트로 숫자를 받아서
        // ever = (kor+eng+math)/3; 이걸 계산하면 소수점은 무시하고 3으로 나눠지니까
        // 첨부터 더블로 설정하기, 근데 저 한번의 상황에서만 실수로 쓰고 싶으면 어케해야하지?
        // 한번 말고 특정 몇번의 상황에서만 쓰려면 어카지?
        
        Scanner a = new Scanner(System.in); // 한글로 받을 때 깨지면 이렇게해라!
        // >> Scanner a = new Scanner(System.in, "MS949");
        // MS949 를 맞춰주려면 일단 터미널에서 >> chcp 를 쳐봄
        int i = 0;
        
        while (true) {
            if (i == 2) {
                
                break;
            }
            ++i;
            // i = i++; 왜 안되는지 다시
            // ++ 앞에다 붙으면 문장 실행하기전에 뒤에다 붙이면
            // true를 바꿔서 10번 반복하고 끝나는것도 만들어보기
            // 지금은 if랑 break로 해서 다시

            System.out.print("이름: ");
            Name = a.nextLine();

            System.out.print("국어 점수:");
            kor = a.nextInt();

            System.out.print("영어 점수:");
            eng = a.nextInt();

            System.out.print("수학 점수:");
            math = a.nextInt();
            // 남겨진 엔터를 제거 왜 하는지는 while 을 써서 해봐야함
            // 한번 반복하면 다음엔 이름이 아니라 국어점수부터 물어봐서
            // ---------------------------반드시 빼고 한번 실행해보자 -----------------------------
            a.nextLine();

            ever = (kor + eng + math) / 3;

            // 만약

            System.out.printf("평균:%.2f\n", ever);

            if (ever >= 90) {
                Str = "A";
            } else if (ever >= 80) {
                Str = "B";
            } else if (ever >= 70) {
                Str = "C";
            } else if (ever >= 60) {
                Str = "D";
            } else {
                Str = "F";
            }

            System.out.printf("이름:%s\n등급:%s", Name, Str);

        }
        a.close();

    }

}
