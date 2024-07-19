package a_varibale;

import java.util.Scanner;

public class A_240718Menu4 {

    static Scanner a = new Scanner(System.in);

    public static void main(String[] args) {
        A_240718Menu4 scan = new A_240718Menu4();

        scan.library();

    }

    public void library() {

        while (true) {
            newUser();
            int allInt = a.nextInt();
            a.nextLine();

            if (allInt == 1) {
                user();

            } else if (allInt == 2) {
                admin();
            }

        }
    }

    public void user() {

        chooseUser();
        userMenu();

        int userInt = a.nextInt();
        a.nextLine();

        switch (userInt) {
            case 1:
                bookBorrow();
                a.nextLine();
                break;

            case 2:
                bookReturn();
                a.nextLine();
                break;

            case 3:
                library();

            case 0:
                systemOff();
                a.nextLine();

            default:
                user();
                // 메인 메뉴를 다시 알려줘야해서 반복 해야함
        }

    }

    public void admin() {

        chooseAdmin();
        adminMenu();
        int adminInt = a.nextInt();
        a.nextLine();

        switch (adminInt) {
            case 1:
                bookReg();
                a.nextLine();
                break;
            case 2:
                bookDel();
                a.nextLine();
                break;
            case 3:
                userReg();
                a.nextLine();
                break;
            case 4:
                library();

            case 0:
                systemOff();
                a.nextLine();

            default:
                admin();

        }

    }

    private void chooseUser() {
        System.out.println("\n사용자 입니다.");
    }

    private void chooseAdmin() {
        System.out.println("\n관리자 전용 메뉴입니다.");
    }

    private void newUser() {
        System.out.println("도서관에 오신걸 환영합니다.");
        System.out.println("사용자는 1번, 관리자는2번을 눌러주세요 ");

    }

    private void userReg() {
        System.out.println("\n사용자를 등록합니다.\n");
    }

    private void bookDel() {
        System.out.println("\n도서를 삭제합니다.\n");
    }

    private void bookReg() {
        System.out.println("\n도서를 등록합니다.\n");
    }

    private static void otherNum() {
        System.out.println("메뉴를 다시 선택해주세요\n");
    }

    public void userMenu() {
        System.out.println("1.도서대여");
        System.out.println("2.도서반납");
        System.out.println("3.이전메뉴");
        System.out.println("0.종료합니다.");
    }

    public static void adminMenu() {
        System.out.println("1.도서등록");
        System.out.println("2.도서삭제");
        System.out.println("3.사용자등록");
        System.out.println("4.이전메뉴");
        System.out.println("0.종료합니다.");
    }

    public void systemOff() {
        System.out.println("\n정말 종료하시겠습니까?(Y/N)");
        String res = a.nextLine();

        if (res.equalsIgnoreCase("Y")) {
            System.out.println("\n감사합니다 안녕히가세요.\n");
        }
        if (res.equalsIgnoreCase("N")) {
            library();
        }

    }

    private void bookBorrow() {
        System.out.println("\n도서를 대여합니다. ");
    }

    private void bookReturn() {
        System.out.println("\n도서를 반납합니다. ");
    }

}