package com.human;

import com.human.ex01.Ex01;

public class Application {
    public static void main(String[] args) {
        
        Ex01 p = new Ex01();

        p.print();
        System.out.println("======매개변수가 있는 메서드 실행");
        //i 뒤 값을 바꾸면 출력 내용 바뀜
        p.print(3, 0);
        System.out.println("======매개변수가 있는 메서드 실행2");
        
        p.add(4,10);

        // 반환 타입 매우 중요*****************

        System.out.println("======반환타입이 있는 메서드 실행3");
        //변수 선언을 해야 반환 받을 수 있음
        int res = p.minus(6, 1);
        // int (변수)
        System.out.println("res="+ res );




    }



}
