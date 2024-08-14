package common;

import java.util.Scanner;

public class ScannerUtil {
    
    private static Scanner scan = new Scanner(System.in);

    private ScannerUtil(){
        
    };
    public static int getInt(String str){
        int i;
        while (true) {
            try { 
                System.out.print(str +" : ");
                i= scan.nextInt();
                scan.nextLine();
                return i;
                
            } catch (Exception e) {
                System.out.println("숫자를 확인 후 재입력해주세요");
                scan.nextLine();
                continue;
            }
        }
    }
    public static String getString(String msg){
        System.out.print(msg + " : ");
        return scan.nextLine();
    }

}
