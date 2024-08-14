package ex09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DBConnection {
    public static void main(String[] args) {
        try {
           

            
            Connection con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:orcl"
                , "user01"
                , "1234");
            String sql = "select * from tb_book";

            // PreparedStatement는 클래스이름
            
            // PrepareStatemen는 메서드이름


            //쿼리세팅
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            //dto ,vo
            List <Book> list = new ArrayList<Book>();

            while(rs.next()){
                String b_no = rs.getString("B_NO");
                String title = rs.getString("TITLE");
                String author = rs.getString("AUTHOR");
                String rentyn = rs.getString("rentyn");
                Book book = new Book(b_no,title,author,rentyn);
                list.add(book);
            }

            for(Book book : list){
                System.out.println(book);
            }
            // 자원해제
            rs.close();
            pstmt.close();
            con.close();
                                
        } catch (ClassNotFoundException e) {
            System.out.println("라이브러리가 추가 되었는지 확인해보세요!");
            e.printStackTrace();
        } catch (SQLException e) { 
            System.out.println("계정 정보를 확인해보세요!");
            e.printStackTrace();
        }
    }

}
