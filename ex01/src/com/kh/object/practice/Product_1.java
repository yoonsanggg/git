package com.kh.object.practice;

public class Product_1 {
    private String id;
    private String name;
    private String site;
    private int price;
    private double tax;

    public Product_1(){}

    public Product_1 (String id,String name, String site, int price, double tax){

        this.id = id;
        this.name =name;
        this.site = site;
        this.price = price;
        this.tax = tax;

    }

    public String information() {

        return id+" "+name+" "+site+" "+price+" "+tax;
    }
    public int setPrice(int price) {
        this.price = price;
        return price ;
    }


    public double setTax(double d) {
        this.tax =(double) d;
        return d;

    }
    public int getRes() {
        price = (int) (price+(tax*price));

        return price;
        

    }


}
