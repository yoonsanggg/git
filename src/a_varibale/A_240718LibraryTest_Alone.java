package a_varibale;

import java.util.Scanner;

public class A_240718LibraryTest_Alone {

    Scanner a = new Scanner(System.in);
    // 메모리 a

    public static void main(String[] args) {
        // 실행만 할거임 메인에선
        A_240718LibraryTest_Alone a = new A_240718LibraryTest_Alone();

        a.library();

    }

    public void library() {
        // 매번 a.nextLine(); 하기 싫으니까 이것도 변수로 만들어서 쓰자

        while (true) {

            libraryNew();
            int menu = getInt();
            if (menu == 1) {
                user();
            } else if (menu == 2) {
                // 메서드를 호출 할 때, 매개변수의 값만 넣는다
                admin(); // 반환타입까지 지정하고 싶으묜

            } else if (menu == 0) {
                System.out.println("종료 합니다.");
                System.exit(-1);
            } else {
                System.out.println(" 메뉴를 확인 후 다시입력해주세요");
            }
        }
    }

    // 전체 메뉴중에
    // 1을 선택하면 사용자
    // 2를 선택하면 관리자
    public void user() {
        while (true) {
            userTxt();
            getInt();
            if (num == 1) {
                bookBorrow();
                a.nextLine();
            } else if (num == 2) {
                bookReturn();
                a.nextLine();
            } else if (num == 3) {
                break; 
            }

            else if (num == 0) {
                systemOff();
                a.nextLine();
            } else {
                getInt();

            }

        }
    }

    public void admin() {
        // switch 문장에서 사용되는 break는 while을 못 빠져나가니까
        // while 빠져나가기 위해 변수 사용
        boolean res = true;
        while (res) {
            adminTxt();
            int adminInt = getInt();

            switch (adminInt) {
                case 1:
                    bookReg();
                    break;
                case 2:
                    bookDel();
                    break;
                case 3:
                    userReg();
                    break;
                case 4:
                    res = false;
                    break;
                    //break 넣어야되는 이유 다시 공부
                    //반복문 끝낼 때 두가지 방법. 1.변수 2. return;으로 메서드 종료
                    //reture;
                case 0:
                    systemOff();
                    a.nextLine();
                default:
                    admin();
                    a.nextLine();

            }
        }

    }

    // 계속 반복해야되는거
    // int 스캐너에 넣고 선언
    // 스위치 이용해서 메뉴 왔다갔다

    int num; // 0이 아니어도 종속값 넣으면 됨

    public int getInt() {
        while (true) {

            try {// 예외를 던짐 근데 catch 설정이 안돼 있으면 던지기만함;; -콘솔창에 예외만 찍히고 끝남.

                num = a.nextInt(); // 숫자를 입력
                a.nextLine();
                // return은 메서드 끝내는 문장
                return num;

            } catch (Exception e) {
                // 사용자가 문자를 입력한 경우 예외발생 여기서 해결해야함
                System.out.println("숫자만 입력이 가능합니다.");
                a.nextLine();
            }

        }

    }

    private void userReg() {
        System.out.println("사용자를 등록합니다");
    }

    private void bookDel() {
        System.out.println("도서를 삭제합니다");
    }

    private void bookReg() {
        System.out.println("도서를 등록합니다");
    }

    private void bookReturn() {
        System.out.println("도서를 반납합니다.");
    }

    private void bookBorrow() {
        System.out.println("도서를 대여합니다.");
    }

    public void systemOff() {

        System.out.println("종료 하시겠습니까 (Y/N)");
        String str = a.nextLine();

        if (str.equalsIgnoreCase("N"))
            library();
        if (str.equalsIgnoreCase("Y"))
            System.out.println("감사합니다! 안녕히가세요.");

        System.exit(-1);

        // 사용자, 관리자 선택 메뉴로 돌아가기

    }

    private void libraryNew() {
        System.out.println("안녕하세요 도서관 입니다.");
        System.out.println("사용자는 1번, 관리자는 2번을 종료는 0번을 눌러주세요.");
    }

    public void userTxt() {
        System.out.println("사용자 메뉴입니다.\n");
        System.out.println("1.도서 대여");
        System.out.println("2.도서 반납");
        System.out.println("3.이전 메뉴");
        System.out.println("0.종료");

    }

    public void adminTxt() {
        System.out.println("1.도서 등록");
        System.out.println("2.도서 삭제");
        System.out.println("3.사용자 등록");
        System.out.println("4.이전 메뉴");
        System.out.println("0.종료");
    }

    // 종료 Str 선언하고 if 만들어서 선택 할 수 있게하기

}
