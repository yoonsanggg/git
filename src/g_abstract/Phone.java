package g_abstract;

/**
 * 추상클래서 (abstract 키워드를 이용하여 정의)
 * 
 * 설계의 용도로 사용
 * 생성할 수 없다. =생성을 통해 자식 클래스만 만들 수 있다
 * 
 * 
 * 자식들의 타입으로 사용됨
 * 
 * 타입으로 사용 될 경우, 추상 클래스를 상속받은 클래스들이 모두 사용될 수 있다.
 * ex) 필드의 타입을 추상 메서드를 하는경우
 *      메서드의 타입을 추상메서드로 하는경우
 */

public abstract class Phone {
    // 필드
    public String owner;

    // 생성자
    public Phone(String owner) {
        this.owner = owner;

    }
    // 추상메서드
    // 코드블럭 없고 abstract가 붙어있는 메서드
    // 자식에게 코드의 작성을 위임
    // 얘를 상속받는애는 무조건 구현 해놔야함
    // 아니면 오류발생   
    public abstract void turnOn();
    public abstract void turnOff();

}
