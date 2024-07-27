package z_alonetest;

import java.util.Scanner;

import javax.print.DocFlavor.STRING;

public class CountNumber {
    Scanner s = new Scanner(System.in);

    public static void main(String[] args) {
        CountNumber restart = new CountNumber();
        restart.akak();

    }

    public void regnumber() {

        // 문자 입력 했을 때 다시 입력시키기
        // -입력 했을 때 빼주기
        //
        while (true) {
            System.out.println("주민등록번호를 입력하세요");
            String num = s.nextLine();

            System.out.println("주민등록번호 : " + num);

            // 공백을 제외하고 / 7번째 글자가 /1,3 인지/ 2,4인지 판단
            num = num.replace("-", "");

            if (num.length() != 13) {
                System.out.println("주민등록번호가 아닙니다. 다시 입력 해 주세요.");
                regnumber();
            } else if (num.length() == 13) {
                char c = num.charAt(6);
                if (c == '1' || c == '3') {
                    System.out.println("남자입니다.");
                    break;

                } else if (c == '2' || c == '4') {
                    System.out.println("여자입니다.");
                    break;
                } else {
                    try {
                        Exception e = new Exception();
                        throw e;

                    } catch (Exception e) {
                        System.out.println("주민등록번호가 아닙니다.");

                    }

                }

            }

            // 다른 문자가 들어왔을 때

        }

    }

    public void number() {
        while (true) {
            System.out.print("주민등록번호를 입력 해 주세요 (형식: 123456-1234567): ");
            String mFR = s.nextLine().replace("-", "").trim(); // 공백 및 하이픈 제거

            if (mFR.length() != 13) {
                System.out.println("주민등록번호는 숫자를 포함한 13자리여야 합니다. 다시 입력해주세요.");
                continue; // 입력을 다시 받기 위해 루프의 처음으로 돌아감
            }

            // 문자 예외 처리
            try {
                int num = Integer.parseInt(mFR); // 숫자로 변환 시도
                char genderChar = mFR.charAt(6);

                switch (genderChar) {
                    case '1':
                    case '3':
                        System.out.println("남자입니다.");
                        return; // 메서드 종료
                    case '2':
                    case '4':
                        System.out.println("여자입니다.");
                        return; // 메서드 종료
                    default:
                        System.out.println("유효하지 않은 주민등록번호입니다. 다시 입력해주세요.");
                        break; // 다음 입력을 받기 위해 루프 계속 진행
                }
            } catch (NumberFormatException e) {
                // 숫자로 변환할 수 없는 경우
                System.out.println("주민등록번호는 숫자만 포함해야 합니다. 다시 입력해주세요.");
            }
        }
    }

    public void akak() {

        while (true) {
            System.out.println("주민등록번호를 입력 해 주세요: ");
            String go = s.nextLine();

            go = go.replace("-", "");
            if (go.length() != 13) {
                System.out.println("잘못된 형식입니다. 다시 입력 해 주세요");
                continue;

            } else if (go.length()== 13) {
                switch (go.charAt(6)) {
                    case '1','3':
                    System.out.println("남자입니다.");
                    
                    break;
                    case '2','4':
                    System.out.println("여자입니다.");
                    
                    break;
                
                    default:
                    System.out.println("잘못 된 형식입니다 다시 입력 해 주세요");
                    continue;
                }
            }

        }

    }

}
