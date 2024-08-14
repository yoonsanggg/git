package com.kh.object;

import com.kh.object.practice.Product_3;

public class App_3 {

    public static void main(String[] args) {

        Product_3 pu1 = new Product_3("ssgnote9", "갤럭시노트9", "경기도 수원", 960000, 10.0);
        Product_3 pu2 = new Product_3("lgnote5", "LG스마트폰5", "경기도 평택", 780000, 0.7);
        Product_3 pu3 = new Product_3("ktsnote3", "KT스마트폰3", "서울시 강남", 250000, 0.3);

        System.out.println(pu1.information());
        System.out.println(pu2.information());
        System.out.println(pu3.information());
        System.out.println("=====================================================");
        pu1.getPrice(1200000);
        pu2.getPrice(1200000);
        pu3.getPrice(1200000);
        pu1.getTax(0.05);
        pu2.getTax(0.05);
        pu3.getTax(0.05);
 
        System.out.println(pu1.information());
        System.out.println(pu2.information());
        System.out.println(pu3.information());
        System.out.println("=====================================================");
        
        System.out.println("상품명 = " + pu1.getName());
        System.out.printf("부가세 포함 가격 = %,d원", pu1.information());
        System.out.println("상품명 = " + pu2.getName());
        System.out.printf("부가세 포함 가격 = %,d원", pu2.information());
        System.out.println("상품명 = " + pu3.getName());
        System.out.printf("부가세 포함 가격 = %,d원", pu3.information());















    }

}
