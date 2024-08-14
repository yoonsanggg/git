package h_library_list;

import lombok.Data;

@Data
public class Book {
    private int no;
    private String title;
    private String author;
    private String genre;
    private boolean rent; // 대여여부 (false - 대여가능 / true - 대여불가)
    private String rent_str;

    public Book(int no, String title, String author, String genre, boolean rent) {
        this.no = no;
        this.title = title;
        this.author = author;
        this.genre = genre;
        this.rent = rent;
        rent_str = "";
    }

    public void setRent(boolean rent) {
        this.rent =rent;
        
        if (rent) {
            rent_str = "대여중";

        } else {
            rent_str=  "대여 가능";
        }
    }

}

