package f_extends;

public class TypeEx {

    public static void main(String[] args) {


        B b = new B();
        C c = new C();
        D d = new D();
        E e = new E();

        // 부모타입으로 자동 형변환
        A a1 =b;
        A a2 =c;
        A a3 =d;
        A a4 =e;
        
        B b1 = d;
        C c1 = e;

        // 상속 관계에 없는애들끼리는 형변환 ㄴㄴ
        // 여기선 C,D 그리고 B,E


    }

}

class A{}
class B extends A{}
class C extends A{}

class D extends B{}
class E extends C{}
