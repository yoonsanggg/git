package com.kh.object.practice;

public class Product_2 {

    private String id;
    private String name;
    private String site;
    private int price;
    private double tax;


    public Product_2(){}
    public Product_2(String id, String name, String site, int price, double tax){

        this.id =id;
        this.name=name;
        this.tax=tax;
        this.site=site;
        this.price=price;


    }

    public String information() {

        return id+" "+name+" "+site+" "+price+" "+tax;
    }
    public int setPrice(int price) {

        this.price = price;
        return price;

    }
    public double setTax(double tax) {

        this.tax = tax;
        return tax;

    }
    public String getName() {

        return name;
    }
    public int priceAddTax() {
        price = (int)(price +(price*tax));
        return price;


    }




}
