package f_extends.practice;

public class Tire {

    public int maxRotation; // 최대 회전수
    public int accumulatedRotation; // 누적 회전수
    public String location; // 타이어의 위치

    public Tire(String location, int maxRotation) {

        this.maxRotation = maxRotation;
        this.location = location;


    

    }

    /**
     * roll() 메소드
     * 타이어 1회전 - 1번 실행할 때마다 누적 회전수 1 증가
     * boolean 리턴 타입 – 정상 회전일 경우 true, 펑크인 경우 false 리턴
     * 
     */
    public boolean roll() {


        System.out.println("==========회전============");
        accumulatedRotation++;
        if (accumulatedRotation >= maxRotation) {

            return false;
        } else {
            System.out.println(location +"남은 회전수 :"+ (maxRotation - accumulatedRotation) + " 회");
            return true;
        }

    }

}
