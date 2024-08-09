package e_object_240723.practice;

/**
 * 생성자 호출
 * - 생성자가 다른 생성자를 호출하는 것
 * - this ()를 사용해서 생성자 호출
 * - 꼭 첫 줄에 나와야함
 * 
 */

public class Car {

    String company = "페라리";
    String model;
    String color;
    int maxSpeed;
    public char[] info;


    public Car() {}
    public Car(String model) {
        // 무조건 첫번째 줄
        this(model,"은색",350);
        // this.model = model;
        // color= "은색";
        // maxSpeed = 350;
        
    }

    public Car(String model, String color,int maxSpeed){
        this.model =model;
        this.color=color;
        this.maxSpeed=maxSpeed;

    }
    public String info() {
        return company + " " +model+ " " + color + " " + maxSpeed;

    }


}
