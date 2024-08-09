package d_array_practice_240722;


import java.util.Scanner;

public class ArrayEx {

    public void array_error() {
        // 자동으로 인덱스를 초기화 한다
        // 정수 0,실수 0.0, false, null 으로
        int[] lotto = new int[6];

        // 향상된 for문 (타입 변수명: 배열변수명)
        // 배열의 시작부터 끝까지 하나씩 꺼내서 변수에 담고 코드블럭을 실행
        for (int i : lotto) {
            System.out.println("i:" + i);
        }

        for (int i = 0; i < lotto.length; i++) {
            // lotto[6];
            // ArrayIndexOutOfBoundsException
            // 인덱스6은 없으니까 <으로 해야 0~5까지 가능
            System.out.println(lotto[i]);

        }


    }
//////////////오늘 혼자 해볼거
    public void alonemm() { //모든 줄 설명 가능하게 공부하기
        int[] lotto = new int[6];
        for (int i = 0; i < lotto.length; i++) {
            int num = (int)(Math.random()*47)+1; //새로운 번호 생성 번호가 겹치는지 비교하기위해
            lotto[i] = num;
            System.out.println("lotto[i] : " + lotto[i]);
            
            //중복체크


            for(int j =0; j< i; j++) {
                if(lotto[j]==(lotto[i])) {
                    System.out.println("lotto[j] :" + lotto[j]);
                    System.out.println("===중복 발생===");
                    i--;
                    System.out.println("번호를 다시 뽑습니다.");
                    break;
                } 
                for (int n : lotto) {
                    System.out.print(n+"\t");
                }
                System.out.println();
            }
        }


            


    }
    public void alonemmm() { //모든 줄 설명 가능하게 공부하기
        int[] lotto = new int[6];
        for (int i = 0; i < lotto.length; i++) {
            int num = (int) (Math.random() * 45) + 1; // 1부터 45까지의 랜덤 숫자 생성
            lotto[i] = num;
            
            // 중복 체크
            for (int j = 0; j < i; j++) {
                if (lotto[j] == lotto[i]) { // 중복이 발생했을 때
                    System.out.println("lotto[j] : " + lotto[j]);
                    System.out.println("===중복 발생===");
                    i--; // 현재 인덱스를 다시 시도
                    System.out.println("번호를 다시 뽑습니다.");
                    break; // 중복이므로 루프 종료 후 다시 숫자 생성
                }
            }
        }
    
        // 최종 결과 출력
        System.out.println("생성된 로또 번호:");
        for (int n : lotto) {
            System.out.print(n +"\t");
        }
        System.out.println();
    }

    public void lotto2() {
        // 정수 20개를 저장 할 수 있는 배열 생성
        // 배열에 (1~100)무작위 수를 대입
        // 배열에 값을 출력
        // lotto 는 주소 값을 가지고 있음 - 주소값에 있는 방에다가 수를 저장함
        // ex ) ㅁㅁㅁㅁㅁ= 0 1 2 3 4 5
        // 기본타입을 제외한 나머지가 다 이런식으로 동작함
        // 같은곳을 바라보고 있다고 생각해야함

        int[] lotto = new int[20];
        
        int i= 0;
        for (i = 0; i < lotto.length; i++) {
            lotto[i] = (int) (Math.random() * 100) + 1;
        }
        int sum = 0;
        // 향상된 for 문을 이용하면
        // 이 모두가 lotto 를 향해서 값을 넣어 줬다 생각하면 되는듯함
        for (int num:lotto) {
            System.out.println("num : " +num);
            sum += num;
        }
        System.out.println("합계: " + sum);
        sum(lotto);

    }
    // 위에 sum(lotto); 를 array에 저장해서 쓸 수 있는거임 
    public void sum(int[] array) {
        // 반복문을 이용해 배열을 돌면서 값을 가지고와 합을 구함
        int sum = 0;
        for (int i : array) {
            sum+=i;     
        }
        System.out.println("총 합계 : " + sum);

    }

    public void lotto1() {
        // 무작위 수를 추출해서 배열에 담아보자
        // 정수 6개가 저장될 공간을 만드시오 변수명은 lotto로 한다
        // 각 방에는 랜덤 함수를 이용해서 1~47까지의 수를 추출하여 저장

        /*
         * int [] lotto = new int[6];
         * double num = Math.random();
         * 
         * num = (int)num*47+1;
         * 
         * 
         * for (i=0; i<7; i++) {
         * 
         * }
         */
        int[] lotto = new int[6];
        lotto[0] = (int) (Math.random() * 47 + 1);
        lotto[1] = (int) (Math.random() * 47 + 1);
        lotto[2] = (int) (Math.random() * 47 + 1);
        lotto[3] = (int) (Math.random() * 47 + 1);
        lotto[4] = (int) (Math.random() * 47 + 1);
        lotto[5] = (int) (Math.random() * 47 + 1);

        // 배열이름.length : 배열의 길이를 반환
        System.out.println("lotto.length: " + lotto.length);

        // 그래서 반복문에는 조건문에 숫자를 적지말고 .length를 사용해서 출력

        for (int i = 0; i < lotto.length; i++) {
            System.out.println(lotto[i]);
        }

    }

    /**
     * Arrat (배열)
     * 같은 타입의 데이터만 저장 가능
     * 배열의 단점을 극복하기 위해 컬렉션 프레임 워크
     */
    Scanner s = new Scanner(System.in);

    public void random1() {

        double num1 = Math.random() * 45;
        num1 = (int) num1 + 1;

        int[] lotto = new int[5];

        lotto[0] = (int) num1;
        lotto[1] = (int) num1;
        lotto[2] = (int) num1;
        lotto[3] = (int) num1;
        lotto[4] = (int) num1;
        // 다차원 배열 검색해보기
        // 배열의 길이만큼 알아서 반복해주는 향상된 for문

        for (int i : lotto) {
            System.out.println("i" + i);
        }

    }

    public void array1() {
        // 변수 선언 : 자료형 변수명;
        // 배열 선언 : 자료형[] 배열형;
        // 배열 선언 : 자료형 배열형[]; 위에나 아래나 똑같음
        int[] lotto;
        int lotto1[]; // 위나 아래나 똑같다 걍 위에 쓰는게 나음 첨부터 배열이라고 알려주는게 ㅇㅇ
        /*
         * 배열 초기화 : new 자료형[배열의 크기];
         * 배열의 특징
         * (1) 크기,길이 가 지정 돼 있다
         * (2) 같은 타입만 저장 가능
         * (3)
         */

        lotto = new int[6];

        // 인덱스를 이용한 초기화 방법 / 방 칸을 인덱스라고 부름
        lotto[0] = 10;
        lotto[1] = 20;
        // 반복문을 이용해서 초기화

        // 배열 선언과 생성 동시에
        int[] lotto2 = new int[6]; // 배열의 길이만 결정
        int[] lotto3 = new int[] { 1, 2, 3, 4, 5 }; // 인덱스의 값도 지정
        int[] lotto4 = { 1, 2, 3, 4, 5 }; // 인덱스의 값도 지정

    }

    /**
     * 오버로딩
     * 메서드의 이름이 같아도 매개변수의 타입과 갯수가 다르면 여러개 사용 가능
     * ex)
     * 
     * 오버라이딩
     * 부모가 가진 메서드를 자식이 재정의
     * 다시 쓰는거
     * 
     */
    /**
     * 부모의 매서드를 재정의
     * = 부모메서드의 선언부가 자식메서드의 선언부가 동일
     * @ : 어노케이션
     * ex) @Override 오버라이드인지 확인시켜주는 장치 없어도 메서드 실행하는데는 문제 없다
     * System.out.println( 생략 됐지만 ******.toString()******이 출력되는거임 );
     * .toString을 알아야 재정의를 할 수 있으니 꼭..알아야함
     * 밑에는 예시
     */
    @Override
    public String toString() {

        // super. = 부모 메서드
        return "배열연습";
    }

    // 오버라이딩 매개변수의 타입과 이름이 다르면 클래스의 이름이 같아도 계속 만들 수 있다
    public String toString(int a) {
        return super.toString();

    }

    public String toString(int a, int b) {
        return super.toString();

    }

    public String toString(int[] arr) {
        return super.toString();

    }

}
