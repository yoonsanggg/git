package d_array_practice_240722;

public class ArrayStringEx {
    public static void main(String[] args) {

        ArrayStringEx ase = new ArrayStringEx();
        ase.nana();

    }

    // 배열의 길이를 변경 할 수 없으므로 새로운 배열을 만들고 값을 복사
    public void method3() {
        int[] old = { 1, 2, 3 };
        int[] newArray = new int[5];

        for (int i = 0; i < old.length; i++) {
            newArray[i] = old[i];

        }
        for (int i : newArray) {
            System.out.println(i);
        }

    }

    public void nana() {
        
        int [] lotto = new int[6];
        int i;
        boolean inDulicate;

            for(i=0;i <lotto.length; i++) {
                lotto[i] = (int)(Math.random()*45)+1;}        

        



    
}

    /**
     * 문자 비교할 때 equals()메서드
     * 
     * 참조타입의 경우 == 는 객체의 번지(주소) 값을 비교한는거라서
     * 값 그 자체가 비교되지 않는다.
     * ex...)
     * 
     */
    public void method2() {
        String[] strArray = new String[3];
        // 리터럴 : 값 그 자체를 의미
        strArray[0] = "java";
        strArray[1] = "java";
        strArray[2] = new String("java");
        // 사람이 보기엔 다 똑같은데
        // strArray 는 새로운 객체이지만 문자열의 내용이 같기 때문에 해시코드도 같다
        System.out.println(strArray[0].hashCode());
        System.out.println(strArray[1].hashCode());
        System.out.println(strArray[2].hashCode());

        System.out.println(strArray[0] == strArray[1]);
        // 컴터가 인식하기엔 다름 2번
        // 문자열 상수 풀을 이해 해야함
        // 문자열 상수 풀은 동일한 리터럴이 여러번 사용되면
        // JVM은 같은 문자열 객체를 재사용하여 메모리를 최적화함
        // 따라서 java 라는 리터럴은 상수 풀에 하나만 존재를 하고있음
        // "java" 는 같은 문자열 객체를 재사용 했죠? 같은 상수 풀 안에 있기 때문에
        // == 로 비교 했을 때 같다고 나옴
        // == 비교는 두 객체의 참조를 비교함
        // 두 객체가 동일한 메모리 주소를 가르키는지 확인함
        // new 연산자를 이용하면 힙 메모리에 저장됨
        System.out.println(strArray[0] == strArray[2]);
        // equals 는 문자열의 내용이 같으면 true
        System.out.println(strArray[0].equals(strArray[2]));

    }

    // 배열에 들어있는 문자열을 출력
    // 배열은 기본이기때문에 꼭 알아야하지만 현장에서 잘 쓰지는 않는다
    // list나 다른거 사용하는게 더 효율적이기 때문에
    public void method1() {
        printStringArr(new String[] { "a", "b", "c" });

        String[] color = new String[5];
        color[0] = "나는";
        color[1] = "는";
        color[2] = "모";
        color[3] = "이";
        printStringArr(color);
        // 배열을 처음에 5칸이라고 설정했고
        // 4칸만 출력했음 string 타입이라 null로 출력
        // boolean 은 false
        // 정수는 0
        // 캐릭터 타입은 /u0000
    }

    public void printStringArr(String[] strArr) {
        System.out.println("printStringArr============");
        for (String str : strArr) {
            System.out.println(str);

        }

    }

}
