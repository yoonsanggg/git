package f_extends.practice;

public class HankookTire extends Tire {

    public HankookTire(String location, int maxRotation) {
        super(location, maxRotation+3);


    }

    //메서드 재정의
    @Override
    public boolean roll() {
        accumulatedRotation++;
        if (accumulatedRotation>= maxRotation) {
            System.out.println(location +"한국 타이어 펑크");
            return false;
        }else {
            return true;
        }

    }

}
