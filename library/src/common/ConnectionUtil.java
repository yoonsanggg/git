package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionUtil {
    
    
    
    /**
     * 데이터베이스 커넥션 생성 및 반환
     * 
     * 생성하지 않고 사용하기 위해서 static 키워드를 붙여줌
     */
    public static Connection getConnectin(){
        
        Connection con =null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            //매개변수 con에 db정보 저장
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "user01", "1234");

            

        } catch (ClassNotFoundException e) {
            System.out.println("라이브러리를 확인해주세요");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("접속정보를 확인해주세요");
            e.printStackTrace();
        }
        
        return con;
    }


    public static void main(String[] args) {
        Connection con = ConnectionUtil.getConnectin();
        // PreparedStatement 동적쿼리 작성
        // ?표 같은것도 가능
        // ed안붙이면 정적임
        try (PreparedStatement pstmt = con.prepareStatement("select sysdate from dual");
        ResultSet rs = pstmt.executeQuery();) {
            rs.next();
            System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("쿼리 확인");
            e.printStackTrace();
        }
        
    }
}
