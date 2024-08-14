package c_operator_practice_240719;

import java.util.Scanner;

public class Example {

    Scanner s = new Scanner(System.in);

    public void mathod() {
        // 증감연산자 : 피연산자의 값을 1증가시키거나 1 감소시킬 때 사용
        int x = 1;
        int y = 1;

        // ++하고 연산
        int res1 = ++x + 10;
        // 연산 후 ++적용
        int res2 = y++ + 10;

        // int res2 = y++ +10; 12가 아닌 이유. 11을 출력 한 뒤 y=2 가 됨5

        System.out.println("res : " + res1);
        System.out.println("res : " + res2);
        System.out.println("res : " + x);
        System.out.println("res : " + y);
    }

    // 삼항연산자
    // (조건식) ? 참일 때 반환할 값 : 거짓일 떄 반환하는 값;
    public void method2() {
        int score = 60;
        // 참 - ?"" false - :"뒤"
        String res = (score >= 90) ? "90이상" : (score >= 80) ? "80이상" : "80미만";
        System.out.println("res :" + res);

        int i = 10;

        i *= (3 + 1) + 1 * 3 / (2 + 1);
        System.out.println("i:" + i);

    }

    public void login() {
        while (true) {

            System.out.print("아이디: ");
            String id = s.nextLine();

            System.out.print("비밀번호: ");
            String pw = s.nextLine();

            id = id.trim();
            pw = pw.trim();

            System.out.printf("id:%s\npw:%s\n", id, pw); // 한번 출력 꼭 해보기

            if (id.equals("java") && pw.equals("12345")) { // .equals 사용하기
                System.out.println("관리자 입니다.");
                break; // return; - 해당 메서드 탈출 break; 여기선 while 탈출
            } else {
                System.out.println("\n로그인 실패");
            }

        }

        // 만약 id= java, pw=12345 이면 로그인 성공을 출력
        // 아니면 로그인 실패를 출력
        // 도서관 만든거에서 1,2 로 사용자 관리자를 구분하는게 아니라
        // 로그인 아이디,비밀번호에 따라서 사용자 관리자로 구분

    }

    // for문 배우기 ********레전드**********
    public void method3() {
        int dan = 2;
        // for : 반복문
        // for (초기화; 조건식; 증감식;) {}
        // i는 1부터 10보다 작을 때 까지 실행
        // 코드블럭이 끝날 때 마다 i 값을 1씩 증가시킴

        for (dan = 2; dan < 10; dan++) {
            System.out.printf("%d단\n", dan);
            for (int i = 1; i < 10; i++) { // () 안에서 선언해서 사용 가능
                // 1~9까지 반복실행
                System.out.printf("%d * %d=%d\n", dan, i, dan * i);
            }
            if (dan == 9) {
                break;
            }
        }

    }


}
