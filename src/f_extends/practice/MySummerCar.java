package f_extends.practice;

public class MySummerCar {

    // 어떤 객체가 다른 객체에 의존적이다-
    // 자동차는 타이어에게
    //
    Tire frontLeftTire;
    Tire backLeftTire;
    Tire frontRightTire;
    Tire backRightTire;


    public MySummerCar() {

        frontLeftTire = new Tire("왼쪽 앞 ", 5);
        backLeftTire = new Tire("왼쪽 뒤 ", 2);
        frontRightTire = new Tire("오른쪽 앞 ", 3);
        backRightTire = new Tire("오른쪽 뒤 ", 4);

    }

    
    int run() {
        // 타이어를 1회전 시키고 바퀴가 터지면 멈춥니다.
        if (!frontLeftTire.roll()) {
            System.out.print("왼쪽 앞 바퀴");
            stop();
            return 1;
        }
        if (!frontRightTire.roll()) {
            System.out.print("오른쪽 앞 바퀴");
            stop();
            return 2;
        }
        if (!backLeftTire.roll()) {
            System.out.print("왼쪽 뒷 바퀴");
            stop();
            return 3;
        }
        if (!backRightTire.roll()) {
            System.out.print("오른쪽 뒷 바퀴");
            stop();
            return 4;
        }
        return 0;

    }

    // 펑크 났을 때 실행
    void stop() {
        System.out.println(" 타이어 펑크로 멈춥니다.");
    }

}
