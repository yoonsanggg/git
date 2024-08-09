package com.kh.object.practice;

public class Product_4 {

    private String id;
    private String name;
    private String site;
    private int price;
    private double tax;

    public Product_4() {
    }

    public Product_4(String id, String name, String site, int price, double tax) {

        this.id = id;
        this.name = name;
        this.site = site;
        this.price = price;
        this.tax = tax;

    }

    public String informating() {

        return id + " " + name + " " + site + " " + price + " " + tax;

    }

    public int setPrice(int price) {
        this.price = price;
        return price;
    }

    public double setTax(double tax) {
        this.tax = tax;
        return tax;
    }

    public int getRes() {
        price = (int)(price + (price*tax));
        return price;
    }
    public String getName() {
        return name;

    }








}
