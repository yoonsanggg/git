package a_varibale;

    /*
     * while문장
     * 
     * 조건에따라 반복 할 때 사용하고
     * 조건이 참이면 코드블럭을 반복해서 실행
     *  while (조건) {
     *          코드
     * }
     * 
     * while 을 종료 혹은 빠져나가는 방법
     * 1. 조건을 주면 됨 아래 예시처럼
     * 2. break;
     * 
     * 반복문
     * continue : 탈출하지 않고 다음 반복으로 이동              ?????
     */


public class WhileBreak240718 {
    public static void main(String[] args) {
        int i = 0;  //구구단 만들 때는 while 두번씀 while 안 while
        
        //break 만나서 끝나는거
        // 1번 반복하고 끝
        while (true) {
            System.out.println("오늘도 맑음1 break" + i);
            i = i+1;
            break;
            // 반복 종료
            
        }
        //  1 ~ 9까지 9번 실행
        while (i < 10) {
            System.out.println("오늘도 맑음" + i);
            i = i + 1;
            
        }
        // 10 한번 실행
        while (true) {
            System.out.println("오늘도 맑음" + i);
            i = i +1;
            
            
            if(i>10) break;
        }
    
        // 만약 코드가 한줄인 경우 , 코드블럭 생략하고 작성가능
    }

}
