package g_abstract;

public class App {

    // 추상클래스는 직접 생성 불가능!!!
    // Phone phone = new Phone ();

    public static void main(String[] args) {

        SmartPhone sp = new SmartPhone(null);

        // 생성할 수 없지만 타입으로 이용 가능함
        // 타입으로 이용 할 경우, 추상클래스를 상속받아 구현된 객체들이 사용 될 수 있다
        Phone p = new SmartPhone("김길동");
        // 자식에서 뭘 추가해서 써도 됨

    }
}
