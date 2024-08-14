package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtil;
import dto.BookDto;

// 얜 이제 맵퍼로 바뀜 db 입출력 ㅇㅇ

/**
 * @return 도서목록
 * 
 */
public class BookDao { 

    public List<BookDto> getBookList(){
        
        List<BookDto> list = null;
        String sql = "select * from tb_book";
        
        // try () 안에 생성된 객체 = .close  -> 자원반납 (만들다 꽉 차서 안만들어가지고 닫아줘야함)
        try (
        // 데이터베이스 접근
        Connection con = ConnectionUtil.getConnectin();
        // 동적인 쿼리 실행
        PreparedStatement pstmt = con.prepareStatement(sql);

        // 결과 executeQuery
        // 입력, 수정 , 삭제 : executeUpdate
        ResultSet rs = pstmt.executeQuery();) {
            list = new ArrayList<BookDto>();
            while (rs.next()) {
                    String b_no = rs.getString(1);
                    String title = rs.getString(2);
                    String author = rs.getString(3);
                    int price = rs.getInt(4);

                    BookDto book = new BookDto(b_no, title, author, price, b_no, author, b_no);

                    list.add(book);

                } 


        } catch (SQLException e) {
            e.printStackTrace();
        }
        


        return list;
    }


    public static void main(String[] args) {
        //업데이트 테스트
        BookDao dao = new BookDao();
        // 입력테스트 데이터 생성 (지금 내가 만들지만 사용자한테 받아올 값 이라고 생각ㅇㅇ)
        // BookDto book = new BookDto("B00020", null, null, 0, null, null, null);
        System.out.println(dao.getBookList());
    
        //     int res =dao.insertBook(book);
    //     if (res>0) {
    //         System.out.println("성공");
    //     }else{
    //     System.out.println("실패");
    // }
        // 리스트 테스트
        // List<BookDto> list= dao.getBookList(); 
        // for(BookDto a: list){
        //     System.out.println(a);
        // }



    }

    public int insertBook(BookDto book){
        int res = 0;

        // ?를 이용해서 동적쿼리 생성

        String sql = "insert into tb_book (b_no,title,author,price,p_no,rentyn,r_no) " +
        "values ('B'|| LPAD(seq_tb_book.nextval,5,0),    ?   ,   ?   ,   ?   , null   , default , null )";

        try (Connection con = ConnectionUtil.getConnectin();
            PreparedStatement pstmt = con.prepareStatement(sql)) {
                
                //동적 파라메터 세팅
                pstmt.setString(1, book.getTitle());
                pstmt.setString(2, book.getAuthor());
                pstmt.setInt(3, book.getPrice());
                
                //executeUpdate : DML 문장의 실행결과를 숫자로 반환
                // 몇건이 처리되었는지 숫자로 반환

                res = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public int updateBook(BookDto book){
        int res = 0;
        
        String sql = " UPDATE  tb_book " + 
                        "SET title = ?, author = ? , price = ?" +
                        "where    B_NO = ?  ";

        try (Connection con = ConnectionUtil.getConnectin();
            PreparedStatement pstmt = con.prepareStatement(sql)) {

                pstmt.setString(1, book.getTitle());
                pstmt.setString(2, book.getAuthor());
                pstmt.setInt(3, book.getPrice());
                pstmt.setString(4, book.getB_no());

                res = pstmt.executeUpdate();

                
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("업데이트 성공");
        return res;

    }
    public int deleteBook (BookDto book){
        int res = 0;

        String sql = " delete from tb_book " + 
                        " where b_no = ? ";
        try (Connection con = ConnectionUtil.getConnectin();
            PreparedStatement pstmt = con.prepareStatement(sql)) {

                pstmt.setString(1, book.getB_no());

                res = pstmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
        }


        return res;


    }


}
