package a_varibale;

public class Variable {
    
    // 전역변수 = 필드
    // 클래스 전체에서 사용 가능
    // new 연산자를 만나서 생성될 때, 타입의 기본값으로 초기화 됨
    // 그래서 new 연산자가 뭐 하는앤데? 알아보기
    int x = 1;

    public void var3(){
        System.out.println("========var3=========");
        // 지역변수, 로컬변수 = 코드블럭 안에서만 사용 할 수 있는 변수
        // 얜 초기화(변수를 선언하고 처음으로 값을 정하는것) 안하면 사용 못함
        // 싹 다 없앤다의 초기화 인 줄 알았는데 그게 아니라
        // 초기 내용을 설정하다.
        int value;
        // error int res = value + 10;
        int res1 = x+10; //11로 출력 되는 이유는 필드에 int x =1; 이라고 초기화 돼 있어서

        // 변수의 값 출력
        System.out.println("res1");
        System.out.println(res1);
        res1 = 100;
        System.out.println("100으로 변경 : " + res1);
        System.out.println("=====================");

    }
    
    
    // 매서드
    public void method1(){
    }
    // 생성자
    public Variable(){
    }
    
    // 메서드 선언
    public void var1(){
        System.out.println("=========var1=========");
        // 타입 지정 (변수, 실수, 문자? 인지) 변수이름
        // 타입 종류 
        /* int 정수
        * double 실수
        * char 하나의 문자
        */
        // 변수 : 값을 재사용하기 위해 메모리에 저장
        // 변수 선언
        int x;
        //  값을 대입
        x = 10;
        //  변수 선언과 동시에 대입도 가능
        int y = 20;
        // 여러개의 변수를 한번에 선언
        int a,b,c;
        a = 1;
        b = 3;
        c = 5;
        
        System.out.println(x+y);
        System.out.println(a+b+c);
        
        
        // 값을 대입하지 않고 사용시 컴파일 오류 발생
        //System.out.println(a);    <-------요런식으로 오류남 
        
       
        // 변수명 규칙
        /*
        * 첫번째 자리에 숫자 불가능                             ex) 1a
        * 소문자로 시작하고 단어가 연결될 경우 다음 단어는 대문자 ex)  int carBodyColor(); 
        * 대소문자 구분                                        ex) Hi, hi 두개가 다름
        * 동일한 이름 변수는 ㄴㄴ                               ex) int hello();
        *                                                     ex) int hello();
        * 특수문자는 $랑 _만 가능
        * 길이 제한은 없으나... 내가 쓰려고 만든건데 굳이 길게? 쉽게 ㄱㄱ
        */
        System.out.println("======================");
    }
    
    public void var2() {
        System.out.println("==========var2===========");
        // 변수 x를 선언하고 10을 대입
        int x = 10;
        // 변수 y를 선언하고 20을 대입
        int y = 20;
        
        // x값 출력
        System.out.println("x : "+x);
        // y값 출력
        System.out.println("y: "+y);
        // x+y 출력
        System.out.println("x+y :" + (x + y)); 
        // x*y 출력
        System.out.println("x*y :" + x * y);
        System.out.println("x/y :" + x / y);
        System.out.println("x%y :" + x % y);
        System.out.println("=========================");
        
        
    }
    /*
    * 구구단을 출력
     */
    public void gugudan(){  
        int x =8;

        //" 문자열"
        // syso (변수x + "단");
        System.out.println(x+"단");
        // syso[변수x"텍스트 출력" (+연결) (연산) ]
        System.out.println(x+"*1="+ (x * 1));
        System.out.println(x+"*2="+ (x * 2));
        System.out.println(x+"*3="+ (x * 3));
        System.out.println(x+"*4="+ (x * 4));
        System.out.println(x+"*5="+ (x * 5));
        
    
    }
   
        }


