package h_library_list;

import java.util.ArrayList;
import java.util.List;

import common.ScannerUtil;


public class Library {
    List<Book> bookList = new ArrayList<Book>();

    public Library() {



        

        bookList.add(new Book(0, "나인원101동", "한남대로91", "APT", false));
        bookList.add(new Book(1, "나인원102동", "한남대로91", "APT", false));
        bookList.add(new Book(2, "나인원103동", "한남대로91", "APT", false));
        bookList.add(new Book(3, "나인원104동", "한남대로91", "APT", false));
        bookList.add(new Book(4, "나인원105동", "한남대로91", "APT", false));
        bookList.add(new Book(5, "나인원106동", "한남대로91", "APT", false));
        bookList.add(new Book(6, "나인원107동", "한남대로91", "APT", false));
        bookList.add(new Book(7, "나인원108동", "한남대로91", "APT", false));
        bookList.add(new Book(8, "나인원109동", "한남대로91", "APT", false));
        // add (new Book으로 생성)
        // Book book = new Book(0, null, null, null, false); 으로 쓸 수 있음
        // 작업하기전에 검토를 좀 해봐야함 왜 코드를 그렇게 만들었는지

    }

    public void menu() {

        while (true) {
            System.out.println(toString());
            System.out.println("1. 도서대출");
            System.out.println("2. 도서반납");
            System.out.println("3. 도서등록");
            System.out.println("4. 도서삭제");
            System.out.println("9.종료");
            int menu = ScannerUtil.getInt("번호 입력");
            if (menu == 1) {

                System.out.println("=============도서대출=============");
                int bookNo = ScannerUtil.getInt("대출 할 도서 번호");

                // 번호 입력 안했을 때
                if (bookNo > bookList.size()) {
                    System.out.println("번호를 확인 후 다시 입력해주세요");
                    continue;
                }
                Book book = bookList.get(bookNo);
                // 받아온 번호를 가지고 getTitle+ 대출완료 띄워주고 true 로 바꾸기
                if (book.isRent()) {

                    System.out.println("이미 대여중인 도서입니다.");

                } else {

                    book.setRent(true);
                    System.out.println(book.getTitle() + " 대여완료!");
                }
            }
            if (menu ==2 ){
                System.out.println("=============도서반납===========");
                int bookNo = ScannerUtil.getInt("반납 할 도서 번호");
                if (menu > bookList.size()) {
                    System.out.println("번호를 확인 후 다시 입력해주세요");
                    continue;
                }
                Book book = bookList.get(bookNo);
                if (book.isRent()) {
                    System.out.println(book.getTitle()+ " 반납 완료!");
                    book.setRent(false);
                } else {
                    System.out.println("이미 반납을 완료한 도서입니다.");
                    continue;
                }
            }
            if (menu ==3 ){
                int no = ScannerUtil.getInt("도서 번호");
                String title = ScannerUtil.getString("제목");
                String author = ScannerUtil.getString("작가");
                String genre = ScannerUtil.getString("장르");
                boolean rent = false;

                bookList.add(new Book(no, title, author, genre, rent));

                if (bookList != null) {
                    System.out.println(" 추가 완료 !");
                    
                } else {
                    System.out.println( "등록 실패 ");
                    continue;
                }
                

            }
            if (menu == 4 ) {
                int bookNo = ScannerUtil.getInt("번호");
                if (bookNo > bookList.size()) {
                    System.out.println("번호를 확인 후 다시 입력해주세요");
                    continue;
                }
                Book remo =bookList.remove(bookNo);
                System.out.println(remo.getTitle()+" 삭제 완료");

            }
            if (menu == 9) {
                System.out.println("시스템을 종료합니다.");
                System.exit(-1);
            }
        }
    }

    public String toString() {
        String str = "";
        int gk = 0;
        for (Book book : bookList) {
            str += "[" + gk + "]" + book + "\n";
            gk++;
        }
        return str;
    }

}
