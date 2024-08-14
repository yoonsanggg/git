package z_alonetest;

import java.util.Scanner;

public class LibraryTestGoGo {

    Scanner s = new Scanner(System.in);

    public void library() {
        

        System.out.println("ID를 입력해주세요:");
        String Id = s.nextLine();
        System.out.println("PW를 입력해주세요:");
        String Pw = s.nextLine();

        if (Id.equals("java") && Pw.equals("12345")) {

            boolean a = true;

            while (a) {
                System.out.println("1.도서대출");
                System.out.println("2.도서반납");
                System.out.println("3.이전메뉴");
                System.out.println("0.종료");

                int userChoose = s.nextInt();
                s.nextLine();

                switch (userChoose) {
                    case 1:
                        System.out.println("도서대출");

                        break;
                    case 2:
                        System.out.println("도서반납");
                    case 3:
                        a= false;

                    case 0 :
                        exit();
                        break;
                    

                    default:
                        intMust();
                        break;
                }

            }

        } else if (Id.equals("admin") && Pw.equals("12345")) {

        } else {
            System.err.println("ID,PW가 맞지 않습니다");
            System.err.println("다시 입력 해 주세요");
        }

    }

    private void exit() {
        //나갈거야
        System.out.println("종료하시겠습니까? (Y/N)");
        String ex = s.nextLine();
        if (ex.equalsIgnoreCase("Y")) {
            System.exit(-1);
            
        } else if (ex.equalsIgnoreCase("N")) {
            return;
        } else {

    
        }
    }
    //문자를 입력해야되는데 다른걸 입력했을 때
    public void intMust() {
        try {
            s.nextInt();
            s.nextLine();
        } catch (Exception e) {
            System.out.println("숫자를 입력해주세요.");
            s.nextInt();
        }

    }

    //숫자를 입력해야되는데 다른걸 입력했을 때

}
