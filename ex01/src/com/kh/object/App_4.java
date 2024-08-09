package com.kh.object;

import com.kh.object.practice.Product_4;

public class App_4 {
    public static void main(String[] args) {

        Product_4 pd1 = new Product_4("ssgnote9", "갤럭시노트9", "경기도 수원", 960000, 10.0);
        Product_4 pd2 = new Product_4("lgxnote5", "LG스마트폰5", "경기도 평택", 7800000, 0.7);
        Product_4 pd3 = new Product_4("ktsnote3", "KT스마트폰3", "서울시 강남", 2500000, 0.3);


        System.out.println(pd1.informating()); 
        System.out.println(pd2.informating()); 
        System.out.println(pd3.informating());

        System.out.println("=====================================================");
        pd1.setPrice(1200000);
        pd2.setPrice(1200000);
        pd3.setPrice(1200000);
        
        pd1.setTax(0.05);
        pd2.setTax(0.05);
        pd3.setTax(0.05);
        System.out.println(pd1.informating());
        System.out.println(pd2.informating());
        System.out.println(pd3.informating());
        System.out.println("=====================================================");

        System.out.println("상품명 = " + pd1.getName());
        System.out.printf("부가세 포함 가격 =%,d\n" , pd1.getRes());
        
        System.out.println("상품명 = " + pd2.getName());
        System.out.printf("부가세 포함 가격 =%,d\n" , pd2.getRes());
        
        
        System.out.println("상품명 = " + pd3.getName());
        System.out.printf("부가세 포함 가격 =%,d\n" , pd3.getRes());







    }


}
