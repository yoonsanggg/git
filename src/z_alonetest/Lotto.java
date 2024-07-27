package z_alonetest;

public class Lotto {
    public static void main(String[] args) {
        Lotto start = new Lotto();
        start.lototo();
    }

    public void alonemmm() { // 모든 줄 설명 가능하게 공부하기
        int[] lotto = new int[6];
        for (int i = 0; i < lotto.length; i++) {

            lotto[i] = (int) (Math.random() * 45) + 1; // 1부터 45까지의 랜덤 숫자 생성

            // 중복 체크
            for (int j = 0; j < i; j++) {
                if (lotto[j] == lotto[i]) { // 중복이 발생했을 때
                    System.out.println("lotto[j] : " + lotto[j]);
                    System.out.println("===중복 발생===");
                    i--; // 현재 인덱스를 다시 시도
                    System.out.println("번호를 다시 뽑습니다.");
                    break; // 중복이므로 루프 종료 후 다시 숫자 생성
                }
            }
        }
        // 최종 결과 출력
        System.out.println("생성된 로또 번호:");
        for (int n : lotto) {
            System.out.print(n + "\t");
        }
        System.out.println();

    }

    public void lototo() {
        int[] lotto = new int[6];

        for (int i = 0; i < lotto.length; i++) {
            lotto[i] = (int) (Math.random() * 45) + 1;
            // int 로 형변환을 했기 때문에 0 아래 수는 날라가고 1부터 생김
            // 이유는 [] 배열 안의 수는 0.0부터 정의되기 때문에~
            // +1을 하는 이유: +1 안하고 *45를 하게되면 0~44의 값이 출력됨

            for (int s = 0; s < i; s++) {
                if (lotto[i] == lotto[s]) {
                    System.out.println("중복된 번호를 뽑아 다시 뽑습니다");
                    i--;
                    break;
                }

            }
        }
        for (int s : lotto) {
            System.out.print("\t"+ s);
        }
    }



}
