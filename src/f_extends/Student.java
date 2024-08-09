package f_extends;

public class Student extends People{
    // 자식 생성자에서 코드를 입력하는게 더 자유로운듯함;;

    public int studentNo;

    public Student(String name, String ssn, int studentNo) {
        // super 는 부모생성자 호출 할 때 사용
        // 생성자의 호출은 첫번째 줄에 나와야 한다
        super(name, ssn);
        this.studentNo = studentNo;

    }



}
