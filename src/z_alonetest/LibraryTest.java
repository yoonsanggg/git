package z_alonetest;

import java.util.Scanner;

public class LibraryTest {
    static Scanner s = new Scanner(System.in);

    public void libraryStart() {

        while (true) {

            System.out.print("아이디를 입력하세요 : ");
            String Id = s.nextLine();
            Id = Id.strip();
            
            System.out.print("비밀번호를 입력하세요 : ");
            String Pw = s.nextLine();
            Pw = Pw.strip();
            

            if (Id.equals("java") && Pw.equals("12345")) {
                userMenu();
                int userChoose = getInt();
                s.nextLine();

                while (true) { // 유저가 쓰는 while

                    switch (userChoose) {
                        case 1:
                            System.out.println("도서를 대출합니다.");
                            break;
                        case 2:
                            System.out.println("도서를 반납합니다.");
                            break;
                        case 3:
                            System.out.println("로그인 페이지로 돌아갑니다.");
                            libraryStart();

                        case 0:
                            userExitYN();
                            break;

                        default:
                            break;

                    }

                }

            } if (Id.equals("admin") && Pw.equals("adminpw")) {

                while (true) {// 관리자가 쓰는 while
                    // exit 지금 유저랑 어드민 분리 해 놨는데 그냥 같이 써도 되는지 해보기
                    adminMenu();
                    int adminMenuChoose = getInt();
                    s.nextLine();

                    switch (adminMenuChoose) {
                        case 1:
                            System.out.println("도서를 등록합니다.");
                            break;
                        case 2:
                            System.out.println("등록된 도서를 삭제합니다.");
                            break;
                        case 3:
                            System.out.println("이용자를 등록합니다.");
                            break;
                        case 4:
                            System.out.println("등록된 이용자를 삭제합니다.");
                            break;
                        case 5:
                            System.out.println("로그인 페이지로 넘어갑니다.");
                            libraryStart();
                            break;
                        case 0:
                            userExitYN();
                        default:
                            break;
                    }

                }

            } else {
                idPwError();
            }

        }

    }

    String str;
    int num;

    public int getInt() {
        while (true) {

            try {
                num = s.nextInt();
                return num;

            } catch (Exception e) {
                // 사용자가 문자를 입력 한 경우 여기서 해결해야함
                System.out.println("숫자를 입력하세요");
                s.nextLine();
            }

        }

    }

    public Exception idPwError() {
        try {
            throw new Exception();
        } catch (Exception e) {
            System.out.println("아이디와 비밀번호를 다시 입력하세요.");
            return e;
        }
    }

    private void adminMenu() {
        System.out.println("1. 도서를 등록합니다.");
        System.out.println("2. 등록된 도서를 삭제합니다.");
        System.out.println("3. 이용자를 등록합니다.");
        System.out.println("4. 등록된 이용자를 삭제합니다.");
        System.out.println("5. 로그인 페이지로 돌아갑니다.");
        System.out.println("6~9. 다시듣기.");
        System.out.println("0. 종료합니다.");
    }

    private static void userExitYN() {
        System.out.println("종료하시겠습니까? (Y/N)");
        String exit = s.nextLine();

        switch (exit) {
            case "Y", "y":
                System.out.println("이용해주셔서 감사합니다!");
                System.exit(-1);
            case "N", "n":
                break;

        }

    }

    private static void userMenu() {

        System.out.println("도서관에 오신걸 환영합니다.");
        System.out.println("이용자 메뉴 입니다.");
        System.out.println("1. 도서 대출");
        System.out.println("2. 도서 반납");
        System.out.println("3. 이전 페이지");
        System.out.println("4~9 다시 듣기");
        System.out.println("0. 종료");

    }

}
