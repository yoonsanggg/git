package a_varibale;

import java.util.Scanner;

public class Bmi {
    public static void main(String[] args) {
        Bmi b = new Bmi();
        
        while (true) {
            b.Bmi();
            
        }


    }
    
    
    public void Bmi() {

        double height, weight, bmi;
        String Str;

        Scanner s = new Scanner(System.in); /// (Sysyem.in)입력 받아오는 언어 // 메모리에 s 로 저장해서 입출력 하고싶삼

        System.out.print("키(m):");
        height = s.nextDouble();
        System.out.print("몸무게(kg):");
        weight = s.nextDouble();

        bmi = weight / (height * height);

        if (bmi >= 25)
            Str = "비만";
        else if (bmi >= 23)
            Str = "과체중";
        else if (bmi >= 18.5)
            Str = "정상";

        else
            Str = "저체중";

        if (height >= 100) {
            height = height / 100;

        }

        System.out.printf("당신의 bmi는 %.2f 이고, %s 입니다.\n", bmi, Str);

        // s.close(); // 닫는 이유는 시스템 자원을 스캐너한테 넘겨줘서 준비 된 상태인데 다 사용했으면 반남해야한다.
        // 싱글톤 방식 찾아보기

    }
}

// bmi 구하는거 만드는거 처음부터 다시해보기 // 여러개의 변수 선언

// 조건문의 결과 참 , 거짓에 의해 코드 실행여부를 판단
// 조건문이 참이면 코드를 실행
// else if 로 조건을 추가해서 필터를 계속 만든다 생각하면 될듯?
