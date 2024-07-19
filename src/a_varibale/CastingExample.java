package a_varibale;

public class CastingExample {
    public static void main(String[] args) {
        int intValue = 44032;
        // 자동형변환
        // 작은 집합이 큰 집합으로 저장되는경우는 자동형변환
        // 밑에 더블에서 인트 - 자동으로 됐쥬?
        //  byey < short < int < long < float < double
        double doubleValue = intValue;
        System.out.println("안녕" + doubleValue);
        // 강제형변환
        //int 타입의 값을 char 타입의 변수에 대입
        char charValue = (char)intValue;
        // 44032를 int 로 설정했지만 char 로 강제형변환 - 유니코드 표에 대응되는 44032=가
        System.out.println("강제형변환" + charValue);

        double doubleValue2 = 3.14;
        intValue = (int)doubleValue2;
        System.out.println("더블벨류 2를 넣은 인트" + intValue);

        byte x=10;
        byte y=20;
        // 연산시  int타입으로 자동형변환
        // 그래서 이건 계산 안됩니당 ;;
        // byte res = x + y;
        int res = x + y;
        System.out.println(res);
        // 강제형변환 시작
        //아주아주아주 중요;;;;;; 문자열을 기본타입으로 강제 형변환 // parse를 사용
        // 문자열안에 숫자가 들어있는 경우에만 가능 [교재] 67p
        String s = "hi";
        // int : 기본타입이고
        // Integer : 객체타입 한번 찾아보기                         ??????
        // Integer 가 반환 타입이라 나를 호출한곳으로 다시 반환한다
        // 문자가 들어있는경우 오류 발생 int i = Integer.parseInt(s);
        // NumberFormatException 숫자로 바꾸려했는데 
        // For input string: "hi" hi라는 문자가 입력됐어 
    
        int i = Integer.parseInt(s);
        String str = "100";

        byte byteValue = Byte.parseByte(str);  //컨트롤 누르고 Byte 누르면
        // 들어가서 parse 검색
        // public static byte parseByte (String s) throws
        // static = 생성하지 않아도 사용 가능 프로그램 생성과 동시에 메모리에 올라감
        // byte 타입을 반환하는
        // 이름: parseByte
        // ( String s )문자열을 하나 받는
        // throws 에러를 일으킬 수 있는
        short shortValue = Short.parseShort(str);
        System.out.println(shortValue);
        int intValue1 = Integer.parseInt(str); //인트타입으로 변하게
        System.out.println(intValue);

        long longValue = Long.parseLong("4000000000");
        System.out.println();
        float floatValue = Float.parseFloat("12.345");
        double dValue = Double.parseDouble("123124"); //뒤에 첫글자 왜 대문자인지?

        boolean booleanType = Boolean.parseBoolean("true");

        String sss =String.valueOf(100); //이건 잘 안씀
        String ss ="100"; //이렇게 쓰면 돼서
        // 글고 ↘이거 출력하면
        String sssss = 100+"10"+1;
        // 100101 나옴 / 왜냐고 물어본다면.. 
        String ssss = 100 + "";
        
       

    }


}
