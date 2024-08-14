package com.kh.object.practice;

public class Product_3 {
    private String id;
    private String name;
    private String site;
    private int price;
    private double tax;

    public Product_3() {
    }

    public Product_3(String id, String name, String site, int price, double tax) {

        this.id = id;
        this.name = name;
        this.site = site;
        this.tax = tax;
        this.price = price;

    }

    public String information() {

        return id + " " + name + " " + site + " " + tax + " " + price;

    }

    public int getPrice(int price) {

        this.price = price;

        return price;

    }

    public double getTax(double tax) {

        this.tax = tax;

        return tax;

    }

    public int setRes() {
        price = (int) (price + (price * tax));
        return price;
    }

    public String getName() {
        return name;
    }



}
