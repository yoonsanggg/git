package ex09.practice;

// 인터페이스 선언부
// 생성자를 가질 수 없다.
// 인터페이스는 객체의 사용방법(메서드)을 정의한 것이므로 인스턴스, 정적필드 선언이 불가
// 상수만 선언 가능 - 대문자, 두 단어가 연결시 _ 사용
public interface RemoteControl {
    /*
     * 웹브라우저 요청
     *  ->Controller    사용자의 요청 정보 수집
     *  ->Service       비지니스 로직 (실질적 업무)
     *      LoginService (인터페이스), LoginServiceImpl (구현체-class)
     *  -> Mapper(DAO) 데이터베이스 입출력
     */

    //  상수
     public int MAX_VOLUME = 10;
     public int MIN_VOLUME = 0;
     
    //  추상 메서드 - 메서드의 선언부만 작성
     public void turnOn();
     public void turnOff();
     public void setVolume(int volume);
     
}
