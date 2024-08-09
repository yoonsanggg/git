package e_object_240723.practice;

import lombok.Data;

@Data

public class Student {

    private int age;
    private String no;
    private String name;

    // 이것도
    // 얘가 new Student 역할을 해서 꼭 만들어야 밑에 놈을 쓸 수 있음
    // 당연하지?
    // 오버로딩 종류 : 생성자 오버로딩, 메소드 오버로딩
    // 여기선 생성자 오버로딩이죵?
    public Student() {
    }

    public Student(String no, String name, int age) { // 나 이거 못했음 필드에 세팅하는거임 이거 안하면
        // 기본값만 출력됨

        // 필드명이랑 매개변수 이름이 같으면 매개변수가 우선되므로
        // 필드에 접근하기위해 this 키워드 사용
        // 만약 this 를 사용하지않으면 선언했을 때 매개변수만 불러옴
        this.no = no;
        this.name = name;
        this.age = age;

    }

    public String info() {
        return no + " " + name + " " + age;

    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setName(String name) {
        this.name = name;

    }

    public String toString() {
        return no + " " + name + " " + age;

    }

}