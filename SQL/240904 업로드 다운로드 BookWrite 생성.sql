insert into tb_book (b_no,title, author,price, img_f_no) 
                values ('B'||lpad(seq_tb_book.nextval,5,0), 'title', 'author', 910000,35);
                
                rollback;
              
    select img_f_no from tb_ book where b_no='B00089';
select * from tb_upload_file
where f_no = 109;

