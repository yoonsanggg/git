-- 도서관리 프로그램을 만들기 위한 테이블 만들기 
-- 제약조건에 이름을 부여및 COMMENT 추가

-- 1. 출판사들에 대한 데이터를 담기 위한 출판사 테이블(TB_PUB) 
--  1) 컬럼 : P_NO(출판사 번호 - P00001) -- 기본 키
--           PUB_NAME(출판사명) -- NOT NULL
--           PHONE(출판사 전화번호)
--           DELYN(삭제 여부)     -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           REGDATE(등록일)  -- 기본값으로 SYSDATE, NOT NULL
drop table tb_pub;
create table tb_pub(
    p_no        CHAR(6)            PRIMARY KEY
    ,pub_name   VARCHAR2(20)       not null
    ,phone      VARCHAR2(20)         
    ,delyn      char(1)          DEFAULT 'N'    check(delyn in ('Y','N'))
    ,regdate    date            DEFAULT SYSDATE  NOT null
);


drop SEQUENCE SEQ_TB_PUB;
CREATE SEQUENCE SEQ_TB_PUB;

SELECT 'P'||LPAD(seq_tb_pub.NEXTVAL,5,'0') from dual;
--  2) 3개 정도의 샘플 데이터 추가하기
INSERT into tb_pub (p_no,PUB_NAME,DELYN) VALUES('P'||LPAD(seq_tb_pub.NEXTVAL,5,'0'),'김윤상','Y');


SELECT * from tb_pub;

--  3) 커멘트 달기


-- 2. 도서들에 대한 데이터를 담기 위한 도서 테이블 (TB_BOOK)
--  1) 컬럼 : B_NO (도서번호 - B00001) -- 기본 키
--           TITLE (도서명)        -- NOT NULL
--           AUTHOR(저자명)        -- NOT NULL
--           PRICE(가격)
--           P_NO(출판사 번호)     -- 외래 키(TB_PUB 테이블을 참조)
--           RENTYN(대여여부)      -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           DELYN(삭제 여부)      -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           REGDATE(등록일)       -- 기본값으로 SYSDATE, NOT NULL
DROP TABLE TB_BOOK;
CREATE TABLE TB_BOOK(
    B_NO        CHAR(6)             PRIMARY KEY
    ,   TITLE   VARCHAR2(100)       NOT NULL
    ,   AUTHOR  VARCHAR2(20)        NOT NULL
    ,   PRICE   NUMBER
    ,   P_NO    CHAR(6)             REFERENCES TB_PUB(p_no)     ON DELETE CASCADE
    ,   RENTYN  CHAR(1)             DEFAULT 'N' CHECK (RENTYN IN ('Y','N'))
    ,   REGDATE    DATE             DEFAULT SYSDATE
);




--  2) 5개 정도의 샘플 데이터 추가하기
DROP SEQUENCE SEQ_TB_BOOK;
CREATE SEQUENCE SEQ_TB_BOOK;

INSERT INTO TB_BOOK (B_NO, TITLE, AUTHOR, P_NO) VALUES ('B'||LPAD(seq_tb_BOOK.NEXTVAL,5,'0'),'난 간다6','고고씽6','P00006');
--DML 문장을 실행 후 COMMIT/ROLLBACK
COMMIT;

SELECT * FROM TB_BOOK;



-- FK제약조건 위배시 데이터 입력 제한

COMMENT ON TABLE TB_BOOK IS '도서';
COMMENT ON COLUMN TB_BOOK.B_NO IS '도서번호';
COMMENT ON COLUMN TB_BOOK.TITLE IS '도서명';
COMMENT ON COLUMN TB_BOOK.AUTHOR IS '작가이름';
COMMENT ON COLUMN TB_BOOK.PRICE IS '가격';
COMMENT ON COLUMN TB_BOOK.P_NO IS '출판사 번호';
COMMENT ON COLUMN TB_BOOK.RENTYN IS '대여여부';

COMMIT;
-- 부모테이블 데이터 삭제시 참조하고 있는 자식테이블의 데이터도 함께 제거



-- 3. 회원에 대한 데이터를 담기 위한 회원 테이블 (TB_MEMBER)
--  1) 컬럼 : M_NO(회원번호 - M00001) -- 기본 키
--           ID(아이디)   -- 중복 금지
--           PW(비밀번호) -- NOT NULL
--           NAME(회원명) -- NOT NULL
--           GENDER(성별)        -- 'M' 또는 'F'로 입력되도록 제한
--           ADDR(주소)       
--           PHONE(연락처)       
--           DELYN(탈퇴 여부)     -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--           REGDATE(가입일)  -- 기본값으로 SYSDATE, NOT NULL
DROP TABLE TB_MEMBER;
CREATE TABLE TB_MEMBER(
    M_NO    CHAR(6)         PRIMARY KEY
    ,ID     VARCHAR2(20)    UNIQUE
    ,PW     VARCHAR2(20)    NOT NULL
    ,NAME   VARCHAR2(20)    NOT NULL
    ,GENDER CHAR(1)         DEFAULT 'N' CHECK(GENDER IN ('Y','N'))
    ,ADDR   VARCHAR2(100)
    ,PHONE  VARCHAR2(20)
    ,DELYN  CHAR(1)         DEFAULT 'N' CHECK(DELYN IN ('Y','N'))
    ,REGDATE DATE            DEFAULT SYSDATE NOT NULL
);


--  2) 3개 정도의 샘플 데이터 추가하기
INSERT INTO TB_MEMBER(M_NO,ID,PW,NAME) VALUES('M00002','GOGO','SIG','김윤상');
INSERT INTO TB_MEMBER(M_NO,ID,PW,NAME) VALUES('M00003','GOGO3','SIG3','김윤상3');
INSERT INTO TB_MEMBER(M_NO,ID,PW,NAME) VALUES('M00004','GOGO4','SIG4','김윤상4');
INSERT INTO TB_MEMBER(M_NO,ID,PW,NAME) VALUES('M00005','GOGO5','SIG5','김윤상5');
INSERT INTO TB_MEMBER(M_NO,ID,PW,NAME) VALUES('M00006','GOGO6','SIG6','김윤상6');

SELECT* FROM TB_MEMBER;

--멤버 객체 만드는거임



-- 4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여 목록 테이블(TB_RENT)
--  1) 컬럼 : R_NO(대여번호 R00001) -- 기본 키
--           M_NO(대여 회원번호 M00001) -- 외래 키(TB_MEMBER와 참조)
--                                      이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--           B_NO(대여 도서번호 B00001) -- 외래 키(TB_BOOK와 참조)
--                                      이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--           RENT_DATE(대여일) -- 기본값 SYSDATE
--           RETURN_DATE(반납일)
DROP TABLE TB_RENT;
CREATE TABLE TB_RENT(
    R_NO            CHAR(6)     PRIMARY KEY
    ,M_NO           CHAR(6)     REFERENCES TB_MEMBER(M_NO)     
    ,B_NO           CHAR(6)     REFERENCES TB_BOOK(B_NO)
    ,RENT_DATE      DATE        DEFAULT SYSDATE
    ,RETURN_DATE    DATE        

);

SELECT* FROM TB_MEMBER;
-- 아이디가 M00015번인 사람이 B00010번책을 대여 대여번호는 R00033

INSERT INTO TB_RENT (R_NO,M_NO,B_NO) VALUES ('R00033','M00006','B00006');

--테이블의 데이터를 수정
UPDATE  TB_BOOK SET RENTYN = 'Y' WHERE B_NO = 'B00006';

SELECT * FROM TB_BOOK WHERE RENTYN= 'Y';

UPDATE  TB_BOOK SET R_NO = 'R00033' WHERE B_NO = 'B00006';

--도서가 대여되면 위 두개의 문장이 실행


--아이디가 M00003인 사람이 B00004번 책을 대여
--1.책의 상태를 확인



------------------------------------------------------
--도서 반납
--------------------------------------------------------
--1.책의 상태를 확인

SELECT * FROM TB_BOOK WHERE R_NO = 'R00033';


UPDATE TB_BOOK SET RENTYN ='N'
WHERE B_NO = 'B00006';

UPDATE TB_RENT SET RETURN_DATE =SYSDATE WHERE R_NO = 'R00033';
