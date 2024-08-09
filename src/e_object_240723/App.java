package e_object_240723;

import e_object_240723.practice.ClassMate;
import e_object_240723.practice.ObjectEx;
import e_object_240723.practice.Student;

/*
 * 1. 필드 -[ 인스턴스변수, 멤버변수, 필드 ,전역변수 ] 싹 다 똑같은 말
 *      멤버변수  <-> 지역변수 (코드블럭 안에서만)
 * 
 * (1) 필드의 생성과 소멸
 *  생성: new 연산자를 통해 객체 생성시 메모리에 할당
 *  소멸: 객체가 소멸하는 시점에 같이 제거 (가비지 컬렉터) 
 *  
 * 2. 접근 제한자
 *  publick     - 모든 패키지에서 사용 가능
 *  protected   -  같은 패키지 또는 상속관계 사용가능
 *  default     - 같은 패키지에 있는 경우
 *  private     -  해당 클래스 내부에서만 사용 가능
 *  (1)   접근제한자의 역할
 *      외부에서 접근 할 수 있는 범위를 제한하는 역할
 *  (2)     
 *      public(+) > protected(#) > default(~) > private(-)으로 갈수록 접근 제한이 강화된다.
 * 
 * 
 */


public class App {
    public static void main(String[] args) {
        String str = "123456-1234567";
        // 인덱스 번호부터 끝까지 출력해
        System.out.println(str.substring(7));
        // 서브스트링 비긴, 엔드가 있는
        // 비긴인덱스 포함,엔드 인덱스 미포함
        // 비긴0 ,엔드 1
        System.out.println(str.substring(0, 1));

        System.out.println("=============================");

        // 학생객체를 만듦
        // 클래스명 Student
        // 필드 : 학번 ,이름 ,나이 - private
        // 2개의 생성자 매개변수 ox
        // info() 메서드
        // getter, setter 를 가지고있음
        // 
        ObjectEx startEx= new ObjectEx();
        ClassMate cm = new ClassMate();
        Student s1 = new Student("1","김윤상", 20);
        
        Student s2 = new Student("2","백지연", 21);
        Student s3 = new Student("3","박근민", 20);

        System.out.println(s1.info());
        System.out.println(s2.info());
        System.out.println(s3.info());

        // classmate를 생성하고
        // 학생을 추가해봅니다
        // 등록된 학생을 출력해봅시다.
        


        





        
    }

}
