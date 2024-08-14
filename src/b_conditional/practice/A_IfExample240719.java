package b_conditional.practice;

import java.util.Scanner;

/*
	 * if 문
	 * 만약 ()안의 문장이 true(참) 라면 코드블럭을 실행해줘 
     * 
     * boolean :참(true) 거짓(false) 판단 
	 * [표현법]
	 *   if(조건식) {
	 *     .. 실행할 코드 ..;
	 *   }
	 * - 보통 조건식(()안의 문장)에는 비교 연산자(>, <, >=, <=)
	 * 		, 논리 연산자(&& == AND, || == OR)를 사용한다.
	 * - 조건식의 결과가 참(true)이면 중괄호 안의 코드를 실행한다.
	 * - 조건식의 결과가 거짓(false)이면 중괄호 안의 코드를 무시하고 넘어간다.
	 */ 


public class A_IfExample240719 {
    static Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        // String str = "문자열 12345";
        // 문자열의 인덱스에 해당하는 문자를 반환/ 인덱스는 0부터 시작함
    }

    public void printGender() {
        System.out.println("주민등록번호를 입력 해 주세요 : ");
        String ssn = s.nextLine(); // 메서드 밖에 스캐너 불러오려니까 스태틱 오류남 왜 나는지?

        System.out.println("주민번호 : " + ssn);
        // ssn = 을 붙이는 이유는 치환한 값을 다시 변수 ssn으로 받아오는 과정
        ssn = ssn.replace("-", "");// -를 빈 문자열로 치환 사용법 익히기
        // 값이 1,3이면 남자
        // 값이 2,4면 여자
        // 길이 반환
        // != 부정연산자
        if (ssn.length() != 13) { // 자리 수 틀렸을때 확인하는 방법 ssn의 길이가 13이 아니라면
            System.out.println(ssn.length() + "잘못된 주민등록번호 입니다.");
            return; //시스템을 끝냅니당

        }
        char c = ssn.charAt(6);
        // || - 또는(or) ....
        if (c == '1' || c == '3') {
            System.out.println("남자");
        } else if (c == '2' || c == '4') {
            System.out.println(" 여자");
        } else {
            System.out.println(ssn + "는 주민등록번호가 아닙니다.");
        }
    }

    public int add(int add1, int add2) {

        return 0;
    }
    // 주민등록번호를 입력 받아서 남자인지 여자인지 판단, 출력하는 메서드를 만드시오

    //숫자 입력 받으세요
    


        while (true) {
            System.out.print("숫자를 입력: ");
            int num = s.nextInt();
            s.nextLine();
            System.out.println( "num :" + num);
            if (num <100) {
                //홀수인지 짝수인지 출력
                if (num %2 == 0) {
                    System.out.println("짝수 입니다.\n");

                    //break; 는 이 조건문 탈출 // return; 은 메서드 끝
                }
                else if (num %2 == 0) { //num %2!=0 으로 쓰면 2로 나눈 값이0이 아닐때
                    System.out.println("홀수입니다.\n");

                }
    
            }
            else if (num > 100) {
                System.out.println(" 100보다 작은 수를 입력하세요\n");
                
            }
            
        }


        


    }

}
