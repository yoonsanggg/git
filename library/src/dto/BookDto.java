package dto;

import lombok.Data;

@Data
public class BookDto {
    private String b_no;
    private String title;
    private String author;
    private int price;
    private String p_no;
    private String rentyn;
    private String r_no;


    public BookDto
    (String b_no, String title, String author, int price , String p_no,String rentyn , String r_no){
        this.b_no = b_no;
        this.title = title;
        this.author=author;
        this.price =price;
        this.p_no = p_no;
        this.rentyn =rentyn;
        this.r_no=r_no;
    }

}
