package com.kh.object;

import com.kh.object.practice.Product;

public class Application {

    public static void main(String[] args) {
        // 매개변수를 안줬으니까 기본 생성자

        // 매개변수 있는 생성자 통해 객체 필드를 초기화 가능
        Product p1 = new Product();
        Product p2 = new Product();
        Product p3 = new Product();

        p1 = new Product("ssgnote9", "갤럭시노트9", "경기도 수원", 960000, 10.0);
        System.out.println(p1.information());
        // 생성과 동시에 필드 초기화
        p2 = new Product("lgxnote5", "LG스마트폰5", "경기도 평택", 780000, 0.7);
        System.out.println(p2.information());

        p3 = new Product("ktxnote3", "KT스마트폰3", "서울시 강남", 250000, 0.3);
        System.out.println(p3.information());
        System.out.println("=====================================================");

        // 이게 안되는 이유는 Product에서 price라는 메소드가 없잖슴~
        // p1.price();

        // 이게 되는 이유는 setPrice를 설정 해 놨고 ()안에 값으로 바뀌게 
        // Product 클래스에서 설정 해놨으니깨~
        p1.setPrice(1200000);
        p1.setTax(0.05);

        System.out.println(p1.information());
        p2.setPrice(1200000);
        p2.setTax(0.05);
        System.out.println(p2.information());
        p3.setPrice(1200000);
        p3.setTax(0.05);
        System.out.println(p3.information());
        System.out.println("=====================================================");

        System.out.println("상품명 = " + p1.getName());
        System.out.printf("부가세 포함 가격= %,d원\n", p1.priceAddTax());

        System.out.println("상품명 = " + p2.getName());
        System.out.printf("부가세 포함 가격= %,d원\n", p2.priceAddTax());

        System.out.println("상품명 = " + p3.getName());
        System.out.printf("부가세 포함 가격= %,d원\n", p3.priceAddTax());

    }

}
