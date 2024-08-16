select count(*) from tb_book;

commit;

select 'B'||lpad(seq_tb_book.nextval ,5,0);
insert into tb_book (b_no, title, author) values('B'||lpad(seq_tb_book.nextval ,5,0), 't','a');


select * from tb_member where m_no = 'M00002';

select count(*) from tb_member ;
