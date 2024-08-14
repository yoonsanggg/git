package com.kh.object.practice;

public class ProStudy {
    private String id;
    private String name;
    private String site;
    private int price;
    private double tax;

    public void Product() {


    }
    public ProStudy(String id,String name,String site,int price,double tax) {
        this.id = id;
        this.name = name;
        this.site = site;
        this.price = price;
        this.tax = tax;


    }
    public String information(){

        return id +" "+name+" "+site+" "+price+" "+tax;
        


    }
    // 가격 120만원으로
    // tax 0.05로 변경
    public int setPrice(int price) {
        this.price =price;
        return price;

    }
    public double setTax(double tax) {

        this.tax = tax;
        return tax;

    }
    public void getRes() {

        double res = (double) price +(price*tax);
        System.out.printf("부가세 포함 가격= %.0f원" , res);

        
    }


}
