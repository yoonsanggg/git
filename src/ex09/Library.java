package ex09;

import java.util.List;

import common.ScannerUtil;

public class Library {
    List<Book> list;
    // BookDao dao = new BookDao();
    BookService service = new BookService();
    Library(){
        //DB 접근해서 도서목록 조회
        list = service.getBookList();
        for(Book a: list){
            System.out.println(a);
        }
        //메뉴 보여주고 반복적으로 실행 가능하게 만들기
        //누구를? BookService를
        //DAO에 직접 접근ㄴㄴ...
        //서비스 통해서 접근

    }


    void menu(){
        System.out.println("1. 도서 입력");
        System.out.println("2. 도서 삭제");
        System.out.println("0. 종료");
        ScannerUtil.getInt("메뉴를 입력하세요");
        
        int menu = ScannerUtil.getInt("번호");
        if (menu==1) {

            System.out.println("=============도서등록==========");
            
            String b_no = ScannerUtil.getString("책 번호");
            String title = ScannerUtil.getString("도서 제목");
            String author = ScannerUtil.getString("작가 이름");
            String rentyn = ScannerUtil.getString("대여여부 (Y/N)");

            Book book = new Book(b_no, title, author, rentyn);

            // 반환 해야하니
            // 서비스가 하는 역할 DAO를 여러번 날릴거야 (비즈니스 로직)
            // 업무 처리 - 서비스
            int res =service.insertBook(book);

            if (res >0) {
                System.out.println("입력 완료");
            } else {
                System.out.println("입력 실패");
            }

        } else {
            System.out.println("도서 삭제");
            printBookList();
            String bookNo = ScannerUtil.getString("삭제할 도서 번호");

            // b_no.
        }

    }
    public void printBookList(){
        List<Book> list = service.getBookList();
        for (Book l : list){
            System.out.println(l);
        }
    }

}
