package f_extends;

public class SuperSonicAirplane extends Airplane{
    
    // final 은 상수를 만들 때 사용함
    // 상수 =변경 x
    // 상수는 전부 대문자임 , 전부 대문자면 상수겠죵?
    public static final int NOMAL = 1; //일반비행
    public static final int SUPERSONIC = 2; //초음속비행

    public int flyMode =NOMAL;

    @Override
    public void fly () {
        if( flyMode == SUPERSONIC) {
            System.out.println("초음속비행중입니다.");

        } else {
            // 부모가 가지고 있는 메서드를 호출
            super.fly();

        }


    }


}
