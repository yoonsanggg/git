package a_varibale;

import java.io.IOException;
import java.util.Scanner;

public class InputOutput {
    public static void main(String[] args) throws IOException {
        InputOutput io = new InputOutput();
        //io.print();
        //io.print2();
        io.bmi();
    }
    public void bmi(){
        Scanner scan = new Scanner(System.in); //System.in 은 입력 장치로 입력 할테니까 기다렷 
        System.out.print("키(m):"); //입력 받으려면 Scanner를 이용해서 입력 받아야함
        //사용자의 입력을 기다리고 있다가.
        double height = scan.nextDouble(); //실수니까 double
        //next 다음에 오는 타입이 숫자 타입인경우 ex) double) 문자를 입력하면 오류남
        System.out.print("몸무게:");
        double weight = scan.nextDouble();

        System.out.println("사용자 정보");
        System.out.printf("키: %.2fm, 몸무게: %.1fkg\n", height, weight);  // printf 이용해서 사용자 정보 출력

        double bmi = weight / (height*height);
        System.out.printf("당신의 BMI는 %.2f입니다.\n", bmi);
        

        //double 타입에 int 타입을 대입 할 경우, 자동 형변환이 발생하여
        //오류발생 ㄴㄴㄴ
        //ex) height=111111;
        //ex) height=1.5;    정상 작동 됨

        //Double로 받을거라고 선언했기 때문에 다른 문자 들어가면 오류 날 수 있음
        // 

        //bmi값에 따라 비만도 출력
        // 만약 ()안의 값이 참이면 코드블럭 실행
        // 코드가 한줄인 경우, 코드블럭 추가로 안해도 ㄱㅊ
        if(bmi>25)
            System.out.println("비만 입니다.");
            else if(bmi>23)
            System.out.println("과체중 입니다.");
        
            else if(bmi>18.5)
                System.out.println("정상 입니다.");
            else
            System.out.println("저체중 입니다.");            


    }


    // 키코드 처음 배움 ***
    public void input() throws IOException{
        int keyCode;

        keyCode = System.in.read(); 
        //예외처리하라고 오류 뜸 , 방법은 두가지
        //나 몰라, 내가 알아서
        //해당 키에 해당하는 키코드를 변수에 저장
        System.out.println("keyCode" + keyCode);
        System.out.println((char)keyCode);
        
    }
    //입력을 받아올 수 있는 명령어
    public void inputScanner(){
        Scanner scan = new Scanner(System.in);
        // 엔터키가 입력 될 때 까지 대기하고 있다가        >>>>scan.nextLine(); 
        // 엔터키가 입력되면 그동안 입력 된 값을 읽어옵니다.
        //  nextLine 위에 마우스 올리면 이렇게 뜸 String java.util.Scanner.nextLine()
        // nextLine()은 엔터키를 칠 때 까지 기다림
        // 1. str 이라는 임의 변수에 저장하고 출력
        System.out.println("이름을 입력해주세요 : ");
        String str = scan.nextLine();
        System.out.println(str);
        // 2.반환 받은 값을 바로 출력 
        System.out.println("나이를 입력해주세요 : ");
        System.out.println(scan.nextLine());
        

    }





/*
    public void print(){
        System.out.print("그냥 출력만"); //문자열 안넣으면 오류나요
        System.out.println("줄바꿈 해줌");


        

        int dan = 2;

        // System.out.printf(null, null); //%들어간 애들을 형식 문자열이라고 함
        //%d - 정수     %f - 실수       %s - 문자열
        System.out.printf("%d * 1= %d\n", dan, dan * 1);
        
        
        //교재 70쪽 \n 줄바꿈 처리
        System.out.printf("이름 : %s, 나이:%d\n ", "김윤상", 25);
        System.out.printf("%6d\n", 1234);
        System.out.printf("%6d\n", 12345);
        System.out.printf("%6d\n", 123456);
        System.out.printf("%6d\n", 1234567);
        
        System.out.printf("%.2f", 123.123);

    }
    //printf 혼자 해보기 
    public void print2(){

    }
*/
        

    }

