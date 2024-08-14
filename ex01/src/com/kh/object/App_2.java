package com.kh.object;

import com.kh.object.practice.Product_2;

public class App_2 {

    public static void main(String[] args) {

        Product_2 pu1 = new Product_2("ssgnote", "갤럭시노트9", "경기도 수원", 960000, 10.0);
        Product_2 pu2 = new Product_2("lgxnote5", "LG스마트폰5", "경기도 평택", 780000, 0.7);
        Product_2 pu3 = new Product_2("ktsnote3", "KT스마트폰3", "서울시 강남", 250000, 0.3);


        System.out.println(pu1.information());
        System.out.println(pu2.information());
        System.out.println(pu3.information());
        System.out.println("=====================================================");

        pu1.setPrice(1200000);
        pu2.setPrice(1200000);
        pu3.setPrice(1200000);

        pu1.setTax(0.05);
        pu2.setTax(0.05);
        pu3.setTax(0.05);
        System.out.println(pu1.information());
        System.out.println(pu2.information());
        System.out.println(pu3.information());
        System.out.println("=====================================================");
        System.out.println("상품명 = "+pu1.getName());
        System.out.printf("부가세 포함 가격 = %,d원\n" ,pu1.priceAddTax());


        System.out.println("상품명 = "+pu2.getName());
        System.out.printf("부가세 포함 가격 = %,d원\n" ,pu2.priceAddTax());
        
        
        System.out.println("상품명 = "+pu3.getName());
        System.out.printf("부가세 포함 가격 = %,d원" ,pu3.priceAddTax());




    }

}
