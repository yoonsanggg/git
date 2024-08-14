package com.human;

import java.util.Scanner;

public class MenuBook240718 {
    public static void main(String[] args) {

        MenuBook240718 b = new MenuBook240718();
        b.menu();

    }

    Scanner s = new Scanner(System.in);

    public void menu() {
        while (true) {
            printMenu(); // 메뉴를 출력합니다.

            int menu = s.nextInt();
            s.nextLine(); // 숫자를 입력받으면 엔터가 남기때문에 문제를 일으킬 수 있음 그래서 빼준거
            // 숫자 입력받으면 걍 같이 쓰는거임

            // 제어문 switch : 사용자가 입력한 값에 따라 메서드 호출
            // switch문에서 break는 switch문을 벗어나는 용도로 사용됩니다.

            switch (menu) { // 3. 사용자의 입력을 따라 기능실행
                case 1:
                    // 밑에 메서드로 뺴놓음 보기 아주 편안
                    rentBook(); // 도서 대여 호출
                    s.nextLine();
                    break;
                case 2:
                    returnBook(); // 도서 반납 호출
                    s.nextLine();
                    break;
                case 3:
                    endBook(); // 종료 호출
                    break;
                // 종료
                default:
                    System.out.println("메뉴를 확인후 다시 선택해주세요");
                    break;
            }
            // if (menu==3)break;

        }
    }

    private void printMenu() {
        System.out.println("xx 도서관에 오신걸 환영합니다.");
        System.out.println("1.도서대여");
        System.out.println("2.도서반납.");
        System.out.println("3.종료");
    }

    public void rentBook() {
        // 도서대여
        System.out.println("도서 대여 선택");
    }

    private void returnBook() {
        System.out.println("도서 반납 선택");
    }

    private void endBook() {
        System.out.println("종료 선택");
        System.out.println("정말 종료하시겠습니까?(Y/N)");
        String res = s.nextLine(); // 이거 이해가 잘 안됨
        // if (res.equalsIgnoreCase(res) 이건 대소문자 구분 x 비교
        // if (res.equals(res)) 이건 대소문자 구분 ㅇㅇ 비교
        // 문자열 비교 할 때는 이 두개를 반드시 이용해야함 == 절대 안씀
        if (res.equals("Y"))
            System.out.println("프로그램을 종료합니다.");
        System.out.println("또 오세요");

        System.exit(-1);
        // 이건 걍 종료문자니까 외워야하나?
    }

}
