package ex09;

import java.util.List;

/**
 * 비즈니스 로직 생성
 * 라이브러리가 서비스 호출하고 끝나고 반복임
 * 
 * 
 */
public class BookService {

    // 반환해야하니까 dao들을 필드로 가지고 있음
    private BookDao dao = new BookDao();

    public List<Book> getBookList() {

        return dao.getBookList();

    }


    //책 입력 받고 넘겨주는거임
    public int insertBook(Book book){
        
        //변수 설정 해놓고 쓰면 다른 여러가지 작업 가능
        int res = dao.insertBook(book);
        
        return res;


    }

    public void deleteBook(){

        // dao.
    }



}
