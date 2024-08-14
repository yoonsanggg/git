package ex09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO (DATA ACCESS OBJECT): 데이터 입력,수정 ,삭제, 조회
 * 데이터베이스에 접근해서 데이터 조작을 한다~
 * 
 * getBookList() :도서 목록조회
 * insertBook() :도서 등록
 */

public class BookDao {
    
    public static void main(String[] args) {
        BookDao dao = new BookDao();
        // List<Book> list = dao.getBookList();
        // for(Book a : list){
        // System.out.println(list+ "\n");
        // }
        // //반복문 통해서 100번 반복 테스트
        // for(int i= 0 ; i<100 ; i++){
        // int res = dao.insertBook();
        // System.out.println(res+ "건 처리되었습니다");

        // 연습
        Book book = new Book(null, "책1", "작가1", "N");
        dao.insertBook(book);

    }
    // 커넥션
    // 프리페어스테이트먼트
    // 근데 알긴 해야할듯... 마이바티스!

    public int insertBook(Book book){
        int res = 0;

        String sql = "INSERT INTO TB_BOOK (B_NO, TITLE, AUTHOR, P_NO)" +
        //변수로 처리할 부분을 ?로 변경
        // preparedstatement - 얘는 
        // 동적쿼리 생성하기 위해서 ?,? -계속 변경 될 부분
        " VALUES ('B'||LPAD(seq_tb_BOOK.NEXTVAL,5,0),?,?,'')";
        // 0에 작은따옴표 안해도 됨

        try (
            // try() 안에 넣으면 try 끝나고 자동으로 close 해줌
            Connection con = ConnectionUtil.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);) {
            //setString 하면 쿼리 만들 때 '' 로 감싸줌

            //첫번째 물음표를 뭘로 바꿀거야
            pstmt.setString(1, book.getTitle());
            
            //두번째 물음표를 뭘로 바꿀거야
            pstmt.setString(2, book.getAuthor());

    }catch (SQLException e) {
            e.printStackTrace();
        }

        

        return res;

    }

    // 결과집합으로부터 책 꺼내서 반환
    public int insertBook() {
        // 변수 설정하고 / 입력 수정 삭제는 int
        int res = 0;
        // 추가 할 쿼리 넣고
        String sql = "INSERT INTO TB_BOOK (B_NO, TITLE, AUTHOR, P_NO)" +
                " VALUES ('B'||LPAD(seq_tb_BOOK.NEXTVAL,5,0),'고고씽씽','작가요','P00003')";
        // 0에 작은따옴표 안해도 됨

        try (
                // try() 안에 넣으면 try 끝나고 자동으로 close 해줌
                Connection con = ConnectionUtil.getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql);) {
            // insert, update, delete의 경우
            // 몇건 처리되었는지 숫자로 반환
            res = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }

    public List<Book> getBookList() {
        List<Book> list = null;
        // 데이터 베이스 연결

        try {
            Connection con = ConnectionUtil.getConnection();
            // 쿼리 질의
            PreparedStatement pstmt = con.prepareStatement("select * from tb_book");
            ResultSet rs = pstmt.executeQuery();

            list = new ArrayList<Book>();
            while (rs.next()) {
                // 결과집합으로부터 책을 꺼내서 리스트에 담아봅시다
                String b_no = rs.getString("b_no");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String rentyn = rs.getString("rentyn");
                Book book = new Book(b_no, title, author, rentyn);
                list.add(book);
            }

            ConnectionUtil.closeConnection(rs, pstmt, con);

        } catch (SQLException e) {
            System.out.println("BookDao 오류");
            e.printStackTrace();
        }
        ;

        return list;
    }

    public List<Book> deleteBooks(Book book){
        
        int res= 0;

        String sql = "Delete FROM TB_BOOK WHERE ?";
        try (
            // try() 안에 넣으면 try 끝나고 자동으로 close 해줌
            Connection con = ConnectionUtil.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);) {
                pstmt.
            }

    


    }
}
