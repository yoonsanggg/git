package a_varibale;

import java.util.Scanner;

public class Menu240718 {
    public static void main(String[] args) {
        while (true) {
            int menu = s.nextInt();

        System.out.println("oo 도서관에 오신걸 환영합니다.");
        System.out.println(" 1. 도서 대여 ");
        System.out.println(" 2. 도서 반납 ");
        System.out.println(" 3. 도서 종류 ");
        System.out.println(" 메뉴를 선택해 주세요 ");
        
        if(menu>3) {
            System.out.println("메뉴가 존재하지 않습니다.");
        } else if(menu==1) {
            rent();
        } else if (menu==2) {
            returnBook();
        }
            else if (menu==3); {
                // 반복문 탈출
                // 프로그램종료 아예 종료 해버리는거임
                // break; 랑은 다름

                System.exit(-1);
            }
        
        
        // 메뉴 선택을 물어봅니다
            
        }
        
    }

    private static void returnBook() {
        System.out.println("도서 반납을 선택하셨습니다.");

    }

    private static void rent() {
        System.out.println("도서대여를 선택하셨습니다.");

    }
    

    // 정적필드, 정적메서드
    // 생성하지 않고 사용이 가능, 메모리에 올라가서 ex)main 메서드, Integer.parseInt(""); 같은것들
    static Scanner s = new Scanner(System.in);
    // 웹으로 만들거여서 스윙 안쓰고 html에 데이터만 뿌려주면 됨
    // 콘솔창에 데이터 입력 받고
    // 데이터베이스에 넘겨주고
    //
}
