package com.human;

import com.human.ex01.Ex01;

// 패키지가 다르니까 임포트 자동으로 뜸
// 생성 시점 붙여주는것도 가능         @@@@@해보기

public class Application {
    public static void main(String[] args) {
        Ex01 hi = new Ex01();
        // com.human.ex01.Ex01 hi = new com.human.ex01.Ex01(); 
        hi.Print();
        System.out.println("\n자바는 재미있는 \"프로그래밍\"언어\n");

        System.out.println("\n안녕\"진짜로\"하세요 ");
        
        
    }

}
