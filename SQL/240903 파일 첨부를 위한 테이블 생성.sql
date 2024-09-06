create table tb_upload_file(
    f_no            number--기본키
    ,idx            number--기본키
    ,oname          VARCHAR2(500) not null
    ,sname          VARCHAR2(500) not null
    ,path           VARCHAR2(100)
    ,file_type      VARCHAR2(100)
    ,regdate        date default sysdate
    ,PRIMARY key(f_no,idx)
    );
    drop table tb_upload_file;
    
    create sequence seq_upload_file;
    
    insert into tb_upload_file (f_no,idx,oname,sname,path,file_type) 
    values (seq_upload_file.nextval,seq_upload_file.nextval,'oname','sname'||lpad(seq_upload_file.nextval,5,0),'d:/upload','text');
    
    
select *
from tb_upload_file;

select *
from tb_upload_file
where f_no = 1;

alter table tb_book add f_no number;

select * from tb_book;

update tb_book 
set f_no = 1
where b_no = 'B00022';

select b_no,title,path,f.regdate, b.f_no
from tb_book b, tb_upload_file f
where b.f_no = f.f_no(+);


select * from tb_upload_file 
order by f_no desc;

update tb_upload_file
set path = 'multiple';
