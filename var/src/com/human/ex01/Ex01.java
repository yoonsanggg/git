package com.human.ex01;

public class Ex01 {
    public void print(){

        int i = 2;

        System.out.println( "2단");
        System.out.println( i + "*1=" +i*1);
        
    }
// 이름이 똑같아도 매개변수가 다르면 괜춘
// 접근제한자 반환티입 메서드명 (매개변수 타입 매개변수 명)
//↘매개변수가 있는 메서드
    public void print(int i, int j){
//매개변수가 있는 메서드를 호출 할 때는 매개변수 타입과 일치하는 값 넣어줌 ㅎㅎ
// 여기선 int 로 설정 했으니 정수를 넣어야겠죵?
        System.out.println(i + "단");
        System.out.println( i + "*1=" + i * 1);
        System.out.println( i + "*2=" + i * 2);
        System.out.println( i + "*3=" + i * 3);
        System.out.println( i + "*4=" + i * 4);
        System.out.println( i + "*5=" + i * 5);

    

    }
    /*
            메서드명 : add
            매개변수 : 정수 num1, num2
            */
        public void add(int num1, int num2){

        System.out.println(num1 + num2);
        }
        /*누구나 사용 가능한
         * 정수를 반환하는 메서드명 minus
         * 매개변수 : 정수 num1, 정수 num2
         * 기능: num1, num2의 차를 반환
         */
        public int minus (int num1, int num2){
            //실행결과를 반환
            return num1-num2;
        }


        
    

}
