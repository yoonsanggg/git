package a_varibale;

import java.util.Scanner;

public class A_240718Menu3 {
    static Scanner a = new Scanner(System.in);

    public static void main(String[] args) {
        A_240718Menu3 go = new A_240718Menu3();
        go.library();

    }
    int menu = a.nextInt();

    public void library() {

        while (true) {


            if (true) {
                a();
            } else if (menu == 2) {
                b();
            } else if (menu == 3) {
                c();
            } else {
                System.out.println("메뉴를 잘못 입력했음");
            }
        }

    }

    void a() {
        System.out.println(" a메서드 ");
    }

    void b() {
        System.out.println(" b메서드 ");
    }

    void c() {
        System.out.println(" c메서드 ");
    }

    /*
     * public void menu(){
     * System.out.println("xx도서관에 오신걸 환영합니다.");
     * System.out.println("1번: 도서대출");
     * System.out.println("2번: 도서반납");
     * System.out.println("3번: 종료");
     * System.out.println("0번: 다시듣기");
     * }
     */

}
