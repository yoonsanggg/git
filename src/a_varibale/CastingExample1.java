package a_varibale;

public class CastingExample1 {
    public static void main(String[] args) {
        
        long var1 =2;
        float var2 =1.8f;
        double var3 = 2.5;
        String var4 = "3.9"    ;
        // 아래에 싹 다 주석처리 한 이유 
        // 저거 다 바꾸면 소수점 사라져서 결과 출력하면 8 나옴
       //int varL = (int) var1;  // long - int 강제형변환
        //int varF = (int) var2;  // float - int 강제형변환
        //int varD = (int) var3;  // double - int 강제형변환

        // 이거 오류 남 
        // 더블로 받아야 3.9가 받아지고 (int) 붙어주면 인트로 받아짐
        int varS = (int)Double.parseDouble(var4); // String - int 강제형변환

        int result = (int)(var1+var2+var3+varS);

        System.out.println(result);
        /*
        System.out.println("================");
        int x = 5;
        int y = 2;
        double res = (double)x/y; // (double)x/y 안해도 결과 나옴 2로
        // (double) 으로 묶어주면 2.5로 나옴
        // 양변에 반환타입 하나라도 실수여야 형 변환 가능
        // ex) int res1= (double)x/y; 이럼 틀림
        //int res1= (double)x/y; //이렇게 
        System.out.println(res);
        
        */

    }

}
