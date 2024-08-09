package com.kh.object;

import com.kh.object.practice.ProStudy;

public class AppStudy {
    public static void main(String[] args) {
        ProStudy p1 = new ProStudy("ssgnote", "갤럭시노트9", "경기도 수원", 960000, 10.0); 
        ProStudy p2 = new ProStudy("lgxnote5", "LG스마트폰5", "경기도 평택", 780000, 0.7); 
        ProStudy p3 = new ProStudy("ktsnote3", "KT스마트폰3", "서울시 강남", 250000, 0.3);
        System.out.println(p1.information());
        System.out.println(p2.information());
        System.out.println(p3.information());
        System.out.println("=====================================================");
        p1.setPrice(1200000);
        p2.setPrice(1200000);
        p3.setPrice(1200000);
        p1.setTax(0.05);
        p2.setTax(0.05);
        p3.setTax(0.05);
        
        System.out.println(p1.information());
        System.out.println(p2.information());
        System.out.println(p3.information());
        System.out.println("=====================================================");
        System.out.println("상품명 = 갤럭시노트9");
        p1.getRes();
        System.out.println("\n상품명 = LG스마트폰5");
        p2.getRes();
        System.out.println("\n상품명 = KT스마트폰3");
        p3.getRes();
    }

}
