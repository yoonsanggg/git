package com.kh.object;

import com.kh.object.practice.Product_1;

public class App_1 {

    public static void main(String[] args) {
        
        Product_1 pu1 = new Product_1("ssgnote9", "갤럭시노트9", "경기도 수원", 960000, 10.0);
        Product_1 pu2 = new Product_1("lgxnote5", "LG스마트폰5", "경기도 평택", 780000, 0.7);
        Product_1 pu3 = new Product_1("ktsnote3", "KT스마트폰3", "서울시 강남", 250000, 0.3);

        System.out.println(pu1.information());
        System.out.println(pu2.information());
        System.out.println(pu3.information());

        pu1.setPrice(1200000);
        pu2.setPrice(1200000);
        pu3.setPrice(1200000);
        pu1.setTax(0.05);
        pu2.setTax(0.05);
        pu3.setTax(0.05);
        System.out.println("=====================================================");
        System.out.println(pu1.information());
        System.out.println(pu2.information());
        System.out.println(pu3.information());
        System.out.println("=====================================================");

        System.out.println("상품명 = 갤럭시노트9");
        System.out.println("부가세 포함 가격 = "+ pu1.getRes());
        
        System.out.println("상품명 = LG스마트폰5");
        System.out.println("부가세 포함 가격 = "+ pu2.getRes());
        
        System.out.println("상품명 = KT스마트폰3");
        System.out.println("부가세 포함 가격 = "+ pu3.getRes());




    }

}
