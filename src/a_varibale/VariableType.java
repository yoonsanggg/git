package a_varibale;

public class VariableType {
    private static final char A = 0;

    public void type1(){
        // byte의 범위 -128 ~127
        // 메모리 공간에서 1byte 는 8bit 
        // bit는 0과 1 보관 단위 ex) 8bit 는 ㅁㅁㅁㅁㅁㅁㅁㅁ
        // 첫 ㅁ는 부호를 사용 나머지 7개를 사용해 2의7승
        // int - +- 21억까지
        // 정밀하게 표현하고 싶을 땐 숫자가 낮은 타입



        
        byte var1 = -128;
        byte var2 = 127;
        
        // short의 범위 약 -32,768~ 32,767(대부분 양수 측에 0이 포함되기 때문에 하나 작음)
        // short var = -32768;
        


        //byte var3 = 128; !!!!!!!범위를 벗어나는 리터럴(값)인 경우 컴파일 오류!!!!!!!!!
        // 리터럴 특,,,징)
        /*
         * 정수 인 경우 int 타입을 가짐 (지정 안해도) 
         * ex) byte var3 = 128; 여기선 128이 int로
         * 
         */
         System.out.println(var1);
         System.out.println(var2);
         //System.out.println(var3); 오류 떠서 주석 처리함 

         
        }
        public void type2(){
            
            // byte var1 = 10;
            // byte var2 = 20;

            // int i = 10;
            // 2진수 0b로 시작
            // int ii = 0b1011;
            // 8진수 0으로 시작
            // int iii = 013;
            // 16진수 0x로 시작
            // int iiii = 0xB3;
            
            // 우린 사람이라 10진수 쓰는데 저거를 남겨놓은 이유는? 어따씀? 보안 강화?
            // 저거 다 10진수로 출력 되는데 레터럴 넣으면 각각 2진수 8진수 16진수로 출력가능


            


            // byte 타입의 연산 -> int 타입으로 형변환 이루어져 int 타입을 반환 
            // @@@정수형 타입은 그냥 int로 쓰는게 낫다 왜냐면 계속  --> 그냥 int 써라
            // byte var4 = (byte)(var1 + var2);
            // 이렇게 쓸 수 없잖슴;;@@@

            // int var3 = var1 + var2;
        }
        public void type3(){
            /* 캐릭터 키워드
             * 
             *  
            */

            char var1= 'A'; // 하나의 문자만 저장 '' 유니코드로 변환
            // 유니코드 = 문자에 대응되는 숫자 값
            // int 는 숫자만 출력된다면서?
            // ex ) int var2 = 'A'; ---> 출력하면 65 나옴
            // 유니코드는 0~????까지 형변환 가능 @@@한번 찾아보셈 신기함 근데 많이 쓰나?
            int var2 = 'A';
            System.out.println(var1);
            System.out.println(var2);

        }
        public void type4 (){
            // 기본타입 변수 - 정수형, 실수형, boolean, char
            // 참조타입 변수 = 기본타입 외에는 싹 다 참조타입 (주소값을 가지고 있다 무슨의미?)
            // ex) String 대문자 조심;;

            // "" 를 출력하고 싶어 근데 """" 이렇게 하면 오류남;;
            // 해결 드가자
            // 이스케이프 문자 이건 진짜 다 외워야함 
            // 캐리지 리턴 - 엔터 치면 어떻게 된다고? 다시 공부
        


            
            String str = "\" 문자열 \""; // 엔터 위 \ 쓰면 본연의 역할에서 벗어나서 그냥 출력 가능

//            String stra = "문자열";
            System.out.println(str);
        }

        public void type5(){
            //  실수 타입
            // 리터럴(입력값)의 타입 
            //      정수 : int
            //      실수 :double
            //@@@@ int var1 = 1.5; //이래 오류남 인트는 정수잖슴~
            // 리터럴의 타입을 알려주기 위해
            // F, f 붙어줘야함
            // 오류--->float var1 = 1.5; 
            // 플룻 7자리 더블 15자리까지 자세하게 출력 ㄱㄴ 여기선 더블 씀
            float var1 = 1.5f; //참 쉽죠? 
            double var2 = 2.5;

            long var3 = 3000000000L; 
            //범위가 벗어나는건 숫자 뒤에 타입 첫글자 붙여줘야함 L 때면 오류남
            // long var3 = 3000000000L; 리터럴(입력값)에도 타입을 명시해야 알아먹음

            /* 
             *내 생각 ->  long var3 = 3000000000L; 앞에서 long 이라고 명시 해줬는데 
             * 왜 또 뒤에 명시를 해주지?
             * 그냥 해라.. 
             */ 

            System.out.println(var1);
            System.out.println(var2);
            System.out.println(var3);

        }

        public void type6(){
            // 논리 리터럴
            // 쉽게 말해서 참과 거짓
            // true , false

  //          boolean res = true;
            // if()안의 문장이 참이라면
            //  실행 ㄱㄱ혓
            if(true) {
                System.out.println("true");
            /*
                if(10>0) { 10은 0보다 
                    System.out.println("true");
            */
            
                
            }
            if (false) {
//                System.out.println("false");
//                }

        }

        
}
}
