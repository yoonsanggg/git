package c_operator_practice_240719;

public class RandomExample {
    public static void main(String[] args) {
        // static - 정적메서드 혹은 필드 특)
        // 생성하지 않고도 쓸 수 있음 - 실행과 동시에 메모리에 올라감
        // 정적 메서드에서는 정적 필드랑 정적 메서드만 사용 가능
        // 일반 메서드의 경우 생성 후 호출이 가능하다 밑에 new로 하는 것 처럼
        RandomExample re = new RandomExample();

        /*
         * for(int i = 1; i<100; i++){
         * re.random1();
         * }
         */
        for (int i = 1; i < 4; i++) {
            re.random3();
        }

    }

    public void random3() {
        // 주사위 2개를 굴려서 수를 나온 수를 출력하세요 (num1, num2)
        double num1 = Math.random() * 6;
        double num2 = Math.random() * 6;

        System.out.printf("(%d, %d)\n", (int) num1 + 1,(int) num2 + 1);

    }

    public void random1() {
        // 무작위 수를 추출하는 방법
        // 0.0~1.0 사이의 수를 반환함 Math.
        // 0.001 ~ 0.999 가장 작다고 생각하는 숫자 ~ 가장 크다고 생각하는 숫자에 반환하고싶은 값을 곱해봄
        // 0.006 ~ 5.999 주사위라고 생각했을 땐 *6
        // double 을 (int)로 형변환 후에
        // 0~5를 출력하니까 +1
        double num = Math.random() * 6;
        System.out.println((int) num + 1);

    }

    public void random2() {
        // 기능 : 0.0부터 1.0사이의 수 추출
        // 변수선언 = 변수타입 변수명
        // int i = 0;
        // 걍 내가 생각했을 때 최소값 0.0001
        // 걍 내가 생각했을 때 최댓값 0.9999 - 어차피 난 정수의 범위를 구하고 싶은거라 더 할 필요x
        // 숫자의 범위를 구하기 위해선 * 이용
        // 0 ~ 곱한 수 -1 이게 범위
        // ex) *6 = 5.99999999999
        double num = Math.random() * 6;

        System.out.println((int) num + 1);

    }

}
