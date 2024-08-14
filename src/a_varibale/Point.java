package a_varibale;

import java.util.Scanner;


public class Point {
    public static void main(String[] args) {

        Point a = new Point();

        a.Scan();

        
    }
    private void Scan() {
        
        
        double kuk, eng, math,ever; 
        String str;
        Scanner p = new Scanner(System.in);

        System.out.print("국어 성적:");
        // 반복
        while (true) {        
            try { //예외처리 오류 날 수 있으니까
                kuk = p.nextDouble();
                break; //반복문 탈출 , 숫자 입력 받았으니까
            } catch (Exception e) { // 오류 처리 
                System.out.println("숫자만 가능 합니다.");
                p.next(); //p에 저장된 글자 삭제
                System.out.println("국어성적 : ");
            }
        }
        //while try break catch
        
        System.out.print("영어 성적:");
            //  반복문 [교재]131.p
            // () 안의 값이 참이면 코드블럭 반복해서 실행
            int i = 0;
            while (true) {
                // 반복문 탈출
                
            }
            /*while (i < 10) {
                i= i+1;                
            }*/
        eng = p.nextDouble();
        
        System.out.print("수학 성적:");
        math = p.nextDouble();

        ever = ((double)kuk+eng+math)/3;

        System.out.printf("성적 평균 %.2f\n", ever);
        
        
        if (ever>=90) 
            str= "A";
        else if  (ever>=80)
            str= "B";
        else if (ever>=70)
            str= "C";
        else if (ever>=60)
            str= "D";
        else
            str= "F";

            System.out.printf("%s등급 입니다", str);
        
            
    
        
        



p.close();
    }
            
}
 // 등급을 출력 (평균이 >=90 A, >=80 B, >=70 c, >=60 D, F )
   
        

    //밑에 놈 같이 접근제한자 안주면 같은 패키지 내에서만 쓸 수 있다.
    //private void getPoint(){ === 외부에서 접근 불가



    // 사용자로부터 성적을 입력받는다
    // 국어성적, 영어성적, 수학성적
    // 평균을 구한다
   

    //처음부터 싹 다