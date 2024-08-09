package com.kh.object.practice;

import lombok.Data;

// @Data - 데이터 어노테이션이라고 함
// 어노테이션의 뜻
@Data

public class Product {

    // 생성자를 통해서 객체가 생성될 때 기본값으로 자동 초기화

    private String id; // null
    private String name;
    private String site;
    private int price; // 정수타입이니까 0으로 기본값 초기화

    private double tax;// 0.0으로 초기화
    public Object p_id;

    // 기본 생성자 - 매개변수가 없는 생성자
    // 생성자가 없다면 컴파일러에 의해 자동으로 생성되는 생성자
    // 만약 생성자가 하나라도 있다면 자동생성 ㄴㄴ

    // 생성자의 특징
    // 반환타입이 없고 class와 이름이 같다

    // 얘도 생성자
    public Product() {

    }

    // 생성자는 필드를 초기화함 얜 생성자
    public Product(String p_id, String name, String site, int price, double tax) {
        // 매개변수로 받아온 값을 필드에 저장
        id = p_id;
        // 필드명과 매개변수의 이름이 같을 때 메서드 안에서는 매개변수가 우선된다
        // 필드명이랑 매개변수의 이름이 같을 때 ↙
        // 필드에 접근하기위해 사용하는 키워드 : this 매우매우
        // 매개변수 name 을 필드 name에 저장
        this.name = name;
        this.site = site;
        this.price = price;
        this.tax = tax;

    }
    // 필드가 가지고 있는 값을 하나의 문자열로 반환한다.

    // 얜 메서드
    public String information() {

        // 필드의 값을 반환
        return id + " " + name + " " + site + " " + price + " " + tax;

    }

    // setter, getter
    // 캡슐화
    // 필드에 설정해 놓은 값을 바꾸는게 아니라
    // setter, getter 메서드를 사용해서 필요 할 때만 수정해서 씀
    // 필드에 설정해놓은 값이 private 일 때도 사용 할 수 있음
    // setter:외부로 부터(내가 설정) 값을 받아서 필드에 저장
    // getter:필드 값을 외부로 보냄
    public void setPrice(int price) {
        this.price = price;

    }

    // 이건 그냥 .setTax 하면 바뀐 tax값만 출력 할 수 있게
    // 값은 직접 바꿔야함
    public void setTax(double tax) {
        this.tax = tax;

    }

    // 이건 그냥 .getName 하면 이름만 출력 할 수 있게
    public String getName() {
        return name;
    }

    // 이건 그냥 식을 만들어 놓은거
    public int priceAddTax() {
        double res = (price * tax) + price;
        return (int) res;

    }

}
