--테이블 만드는 작업
/*
    <DDL(Data Definition Language)>
        (쿼리를 실행하는 순간 반영됨)
        데이터 정의 언어로 오라클에서 제공하는 객체를 만들고(CREATE), 변경하고(ALTER), 삭제하는(DROP) 등
        실제 데이터 값이 아닌 데이터의 구조 자체를 정의하는 언어로 DB 관리자, 설계자가 주로 사용한다.

        * 오라클에서의 객체 : 테이블, 뷰, 시퀀스, 인덱스, 트리거, 프로시져, 함수, 사용자 등등
        
    <CREATE>
        데이터베이스의 객체를 생성하는 구문이다.
    
    <TABLE(테이블)>
        테이블은 행과 열로 구성되는 가장 기본적인 데이터베이스 객체로
        데이터베이스 내에서 모든 데이터는 테이블에 저장된다.
        
    <테이블 생성>
        [표현법]
            CREATE TABLE 테이블명 (
                컬럼명 자료형(크기) [DEFAULT 기본값] [제약조건],
                컬럼명 자료형(크기) [DEFAULT 기본값] [제약조건],
                ...
            );
*/ 

--ddl은 날렸어? 끝임
--쿼리 실행하면 바로 반영

CREATE TABLE MEMBER(
    ID VARCHAR2(20)
    , PW VARCHAR2(20)
    , NAME VARCHAR2(20)
    , REGDATE   DATE 
    , DELYN CHAR(1)
);
--데이터에 대한 처리는 DML
--DML문장 (INSERT,UPDATE,DELETE)은 커밋(저장)/ 롤백(취소) 해야함.
INSERT INTO MEMBER VALUES ('IN','1234','YOS',SYSDATE,'N');
--테이블에 저장이 안되는디? 
COMMIT;
--이제 됐죵?

SELECT * FROM MEMBER;

-- 테이블 삭제
DROP TABLE MEMBER;

CREATE TABLE MEMBER(
    ID VARCHAR2(20)
    , PW VARCHAR2(20)
    , NAME VARCHAR2(20)
    , REGDATE  DATE DEFAULT SYSDATE 
    , DELYN CHAR(1)
);
--날짜는 어차피 오늘 날짜 넣는건데? 자동 ㄱㄱ
/*기본값 지정*/ 
--REGDATE  DATE DEFAULT SYSDATE 

--모든 컬럼에 값 넣는 방법이고 디폴트는 따로 배우자
--지금 5개 받아오는데 받아 올 값이 변경되면 오류남;; 하나 지워보셈

INSERT INTO MEMBER VALUES ('IN','1234','YOS',NULL,'N');
INSERT INTO MEMBER VALUES ('IN','1234','YOS',DEFAULT,'N');

--입력 할 컬럼 지정 - 테이블 이름 뒤 입력할 컬럼명 명시
--되도록이면 이 방법을 쓰자 (테이블 구조변경되도 오류 ㄴㄴ)
INSERT INTO MEMBER (ID) VALUES ('ID2');
--COMMIT: 테이블에 추가한 데이터를 실제 데이터베이스에 반영 한다.
--COMMIT 하기전 : (메모리 버퍼에 임시저장 된 데이터)
COMMIT;
SELECT * FROM MEMBER;

-- 테이블의 구조를 확인
DESC MEMBER;

/*
    <컬럼에 주석 달기>
        [표현법]
            COMMENT ON COLUMN 테이블명.컬럼명 IS '주석내용';
*/ 

COMMENT ON TABLE MEMBER IS '멤버';
COMMENT ON COLUMN MEMBER.ID IS '아이디';
COMMENT ON COLUMN MEMBER.PW IS '비밀번호';
COMMENT ON COLUMN MEMBER.NAME IS '이름';
COMMENT ON COLUMN MEMBER.REGDATE IS '등록일';
COMMENT ON COLUMN MEMBER.DELYN IS '삭제여부';

--[1]. 딕셔너리 테이블 (데이터 사전): 데이터베이스 효율적으로 관리하기 위해서 자동으로 갱신(관리)가 됨
--테이블 전반적인 상태 확인

/*
    DBA_XXX : 관리자만 접근 가능한 객체등의 정보조회
    USER_XXX : 계정이 소유한 객체등에 관한 정보 조회
    ALL_XXX : 계정소유 또는 권한을 부여받은 객체등에 관한 정보 조회

    데이터에 관한 데이터가 저장되어 있어 메타 데이터라고도 한다
*/ 

--EMP 누르면 정보 나오잖슴 그 정보를 담는 놈
SELECT * FROM USER_TABLES;
/*
    <제약 조건(CONSTRAINT)>
        사용자가 원하는 조건의 데이터만 유지하기 위해서 테이블 작성 시 
        각 컬럼에 대해 저장될 값에 대한 제약조건을 설정할 수 있다.
        제약 조건은 데이터 무결성 보장을 목적으로 한다. (데이터의 정확성과 일관성을 유지시키는 것)
        
        * 종류 : NOT NULL : 비워둘 수 없음
                UNIQUE   : 중복 ㄴㄴ
                CHECK    : 값을 제한(EX) Y, N만 입력가능)
                PRIMARY KEY: 기본키 - NOT NULL + UNIQUE
                FOREIGN KEY: 외래키
        
        [표현법]
            1) 컬럼 레벨
                CRATE TABLE 테이블명 (
                    컬럼명 자료형(크기) [CONSTRAINT 제약조건명] 제약조건,
                    ...
                );
                제약조건명은 생략이 가능하고 생략하면
                SYS_C일련번호 형태로 이름이 지정된다.

            2) 테이블 레벨
                CRATE TABLE 테이블명 (
                    컬럼명 자료형(크기),
                    ...,
                    [CONSTRAINT 제약조건명] 제약조건(컬럼명)
                );
*/ 
/*
    <NOT NULL 제약조건>
        해당 컬럼에 반드시 값이 있어야만 하는 경우 사용한다.
        삽입/수정 시 NULL 값을 허용하지 않도록 제한한다.
*/ 

--데이터 사전? 에서 확인하는 방법
SELECT * FROM USER_CONSTRAINTS;

DROP TABLE MEMBER;
--컬럼레벨방식
CREATE TABLE MEMBER(
    ID VARCHAR2(20) CONSTRAINT PR_MEMBER_ID PRIMARY KEY -- 기본키 제약조건(NOT NULL + UNIQUE)
    , PW VARCHAR2(20) CONSTRAINT NN_MEMBER_PW NOT NULL
    , NAME VARCHAR2(20) CONSTRAINT NN_MEMBER_NAME NOT NULL 
    , REGDATE  DATE DEFAULT SYSDATE 
    , DELYN CHAR(1)
);
DESC MEMBER;
INSERT INTO MEMBER (ID,PW,NAME) VALUES ('ID3','1234','ㅎㅎㅎ');
SELECT * FROM MEMBER;

--테이블레벨방식
CREATE TABLE MEMBER(
    ID VARCHAR2(20) NOT NULL --이런것도 됨 NOT NULL 컬럼
    , PW VARCHAR2(20) CONSTRAINT NN_MEMBER_PW NOT NULL
    , NAME VARCHAR2(20) CONSTRAINT NN_MEMBER_NAME NOT NULL 
    , REGDATE  DATE DEFAULT SYSDATE 
    , DELYN CHAR(1)
    , CONSTRAINT PK_MEMBER_ID UNIQUE(ID) --UNIQUE 를 테이블 방식
);
DESC MEMBER;
--NOT  NULL 제약조건에 의해 ID PW 이름 칼럼에 값 입력 안되면 오류
INSERT INTO MEMBER (ID,PW,NAME) VALUES ('ID3'); --이놈
--아이디 중복 오류나겠죠?
INSERT INTO MEMBER (ID,PW,NAME) VALUES ('ID3','1234','ㅎㅎㅎ');
SELECT * FROM MEMBER;
--컬럼 옆에 주면 컬럼
--밑에다 주면 테이블임 , 간혹 기본키가 두개인 컬럼을 이용하면 테이블식으로 해야함

DROP TABLE MEMBER;

/*
    <UNIQUE 제약조건>
        컬럼의 입력 값에 중복 값을 제한하는 제약조건이다.
        데이터를 삽입/수정 시 기존에 있는 데이터 값 중에 중복되는 값이 있을 경우 삽입/수정되지 않는다.
        제약조건 지정 방식으로 컬럼 레벨, 테이블 레벨 방식 모두 사용 가능하다.
*/ 

--위에 유니크까지 다 함

/*
    <CHECK 제약조건>
        컬럼에 기록되는 값에 조건을 설정하고 조건을 만족하는 값만 기록할 수 있다.
        비교 값은 리터럴만 사용 가능하다.(변하는 값이나 함수 사용하지 못한다.)
        
        [표현법]
            CHECK(비교연산자)
                CHECK(컬럼 [NOT] IN(값, 값, ...))
                CHECK(컬럼 = 값)
                CHECK(컬럼 BETWEEN 값 AND 값)
                CHECK(컬럼 LIKE '_문자' OR 컬럼 LIKE '문자%')
                ...
*/ 

--칼럼에 어떤값만 사용할 수 있어?

DROP TABLE MEMBER;
CREATE TABLE MEMBER(
    ID VARCHAR2(20) NOT NULL 
    , PW VARCHAR2(20) CONSTRAINT NN_MEMBER_PW NOT NULL
    , NAME VARCHAR2(20) CONSTRAINT NN_MEMBER_NAME NOT NULL 
    , REGDATE  DATE DEFAULT SYSDATE 
    , DELYN CHAR(1) CONSTRAINT CHECK_MEMBER_DELYN CHECK(DELYN IN ('Y', 'N')) --이름 붙이고 CHECK
    , GENDER CHAR(1) CHECK(GENDER IN ('M','F')) --걍 CHECK
    , AGE CHAR(6) CHECK(AGE >0) --걍 CHECK
    , CONSTRAINT PK_MEMBER_ID UNIQUE(ID)
);

--회원가입창에 선택만 할 수있는애들, 빨간점 찍혀있는애들 상상
--정상
INSERT INTO MEMBER (ID,PW,NAME,DELYN,GENDER,AGE) 
                VALUES('ID','PW','ㅎㅎ','Y','M',10);
                SELECT* FROM MEMBER;
--오류
--AGE는 0보다 큰 값이어야함
--성별은 M,F 만 가능
--ID 중복 불가
--아까 체크 제약조건 건것들
INSERT INTO MEMBER (ID,PW,NAME,DELYN,GENDER,AGE) 
                VALUES('ID','PW','ㅎㅎ','Y','A',-10);


/*
    <PRIMARY KEY(기본 키) 제약조건>
        테이블에서 한 행의 정보를 식별하기 위해 사용할 컬럼에 부여하는 제약조건이다.
        각 행들을 구분할 수 있는 식별자 역할(사번, 부서 코드, 직급 코드, ..)
        기본 키 제약조건을 설정하게 되면 자동으로 해당 컬럼에 
        NOT NULL + UNIQUE 제약조건이 설정된다.
        한 테이블에 한 개만 설정할 수 있다.
        (단, 한 개 이상의 컬럼을 묶어서 PRIMARY KEY로 제약조건을 설정할 수 있다.)
        컬럼 레벨, 테이블 레벨 방식 모두 설정 가능하다.
*/ 
DROP TABLE MEMBER;
CREATE TABLE MEMBER(
    NO CHAR(6)
    , ID VARCHAR2(20) 
    , PW VARCHAR2(20) CONSTRAINT NN_MEMBER_PW NOT NULL
    , NAME VARCHAR2(20) CONSTRAINT NN_MEMBER_NAME NOT NULL 
    , REGDATE  DATE DEFAULT SYSDATE 
    , DELYN CHAR(1) CONSTRAINT CHECK_MEMBER_DELYN CHECK(DELYN IN ('Y', 'N')) 
    , GENDER CHAR(1) CHECK(GENDER IN ('M','F')) 
    , AGE CHAR(6) CHECK(AGE >0) 
    --복합키 : 두 컬럼을 묶어서 하나의 기본키 생성
    --테이블레벨로 설정이 가능함
    , CONSTRAINT PK_MEMBER_ID PRIMARY KEY(ID,NO)
);

-- 도서들에 대한 데이터를 담기 위한 도서 테이블 (TB_BOOK)
--  1) 컬럼 : NO (도서번호) -- 기본 키
--           TITLE (도서명) -- NOT NULL
--           AUTHOR(저자명) -- NOT NULL
--           PRICE(가격)
--           RENTYN         --YN
--           PUB_NO(출판사 번호) -- 외래 키(TB_PUB 테이블을 참조하도록)
--                      이때 참조하고 있는 부모 데이터 삭제 시 자식 데이터도 삭제 되도록 옵션 지정 

DROP TABLE TB_BOOK;
CREATE TABLE TB_BOOK(
    NO          NUMBER      PRIMARY KEY
    ,TITLE      VARCHAR2    NOT NULL
    ,AUTHOR     VARCHAR2    NOT NULL
    ,PRICE      NUMBER      
    ,RENTYN     CHAR        CHECK(RENTYN IN('Y','N'))
    ,PUB_NO     NUMBER      
);


-- 디폴트를 먼저 넣기
--벨리데이션 체크 = 유효성 검사 (데이터가 유효한지 체크- DB입력이 가능한지)

--  INT-문자열 자동 형 변환돼서 입력됨

INSERT INTO TB_BOOK (NO,TITLE,AUTHOR,PRICE,PUB_NO)
VALUES (91,'고고','작가',5000,104803);

--  코드값을 생성할 때 자릿수를 맞추기 위해서 함수를 사용 할 수 있다.
--  B00001  -이거 만들어주고싶어 왜? 헷갈려 다른 번호랑 구분이 안돼;;
--  일련번호 :  자동으로 1씩 증가되는 숫자

SELECT 'B' || LPAD(SEQ_TB_BOOK.NEXTVAL, 5,'0') FROM DUAL;
SELECT* FROM TB_BOOK;

--시퀀스로 아까 만든 테이블에 복사
DROP TABLE TB_BOOK;

INSERT INTO TB_BOOK (NO,TITLE,AUTHOR,PRICE,PUB_NO)
VALUES ('B' || LPAD(SEQ_TB_BOOK.NEXTVAL, 5,'0'),'고고','작가',5000,104803);
SELECT* FROM TB_BOOK;
--시퀀스 (일련번호 생성기)
--아무 값도 안주면 1부터 시작하는 1씩 증가하는
DROP SEQUENCE SEQ_TB_BOOK;
CREATE SEQUENCE SEQ_TB_BOOK;
-- NEXTVAL :다음값 
-- CURRVAL :현재값 () (NEXTVAL 한번 이상 사용 후 사용 가능)
SELECT SEQ_TB_BOOK.NEXTVAL , SEQ_TB_BOOK.CURRVAL
FROM DUAL;

-- 1. 출판사들에 대한 데이터를 담기 위한 출판사 테이블(TB_PUB) 
--  1) 컬럼 : PUB_NO(출판사 번호) -- 기본 키 - CHAR(6)
--           PUB_NAME(출판사명) -- NOT NULL
--           PHONE(출판사 전화번호) -- 제약조건 없음
--           DELYN(삭제여부) -- Y/N
--           REGDATE(등록일) -- 기본값 : 오늘날자
--
-- 2. 일련번호 
--      SEQ_TB_PUB
--      P00001 
DROP TABLE TB_PUB;
DROP SEQUENCE SEQ_TB_PUB;



--모든 컬럼에 데이터를 입력할 경우 컬럼명을 생략 할 수 있다.
INSERT INTO TB_PUB VALUES ('P00001','출판사명',91,'N',SYSDATE);


INSERT INTO TB_PUB(PUB_NO,PUB_NAME, PHONE)
VALUES ('P'|| LPAD(SEQ_TB_PUB.NEXTVAL,5 , '0'),'출판사'||SEQ_TB_PUB.NEXTVAL,91);



SELECT 'P'|| LPAD(SEQ_TB_PUB.NEXTVAL,5 , '0')
FROM DUAL;


SELECT*FROM TB_PUB;

COMMIT;



-- 4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여 목록 테이블(TB_RENT)
--  1) 컬럼 : RENT_NO(대여번호) -- 기본 키
--           RENT_MEM_NO(대여 회원번호) -- 외래 키(TB_MEMBER와 참조)
--                                      이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--           RENT_BOOK_NO(대여 도서번호) -- 외래 키(TB_BOOK와 참조)
--                                      이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--           RENT_DATE(대여일) -- 기본값 SYSDATE

-- 시퀀스 생성 SEQ_TB_RENT 
DROP SEQUENCE SEQ_TB_RENT;
DROP TABLE TB_RENT;

CREATE TABLE TB_RENT(
    RENT_NO     NUMBER      PRIMARY KEY
    ,RENT_MEN_NO NUMBER      
    ,RENT_DATE   DATE        DEFAULT SYSDATE

);

-------------------------------------------------------------오늘의 끝판왕
DESC TB_BOOK;   
DESC MEMBER;    

--이걸로 정보 따와서 PUB_NO 그대로 입력해야 렌트 입력가능
SELECT*FROM TB_BOOK; 
SELECT*FROM MEMBER;


--외래키 제약조건을 추가할 때 컬럼의 이름이 같지 않아도 된다
INSERT INTO MEMBER (ID,PW,NAME) VALUES ('ID','PW','NAME');



INSERT INTO TB_RENT (RENT_NO, RENT_MEN_NO, RENT_BOOK_NO) VALUES ('R00001','ID','D00001');



-------------------------------------------------------------------------------------------------

CREATE SEQUENCE SEQ_TB_RENT;

INSERT INTO  TB_RENT(RENT_NO) VALUES('R'||LPAD(SEQ_TB_RENT.NEXTVAL, 5,'0'));
INSERT INTO  TB_RENT VALUES ('R'||LPAD(SEQ_TB_RENT.NEXTVAL, 5,'0'),'A','B',SYSDATE);
SELECT      *
FROM        TB_RENT;
--이미지 삽입 할 땐 파일로 저장하고
-- 날짜이름별로 폴더에 넣어놓고, 위치만 불러오면 됨




/*
    -----------------------------------------------------<FOREIGN KEY(외래 키) 제약조건>
        다른 테이블에 존재하는 값만을 가져야 하는 컬럼에 부여하는 제약조건이다.(단, NULL 값도 가질 수 있다.)
        즉, 참조된 다른 테이블이 제공하는 값만 기록할 수 있다. (FOREIGN KEY 제약조건에 의해서 테이블 간에 관계가 형성된다.)
        
        [표현법]
            1) 컬럼 레벨
                컬럼명 자료형(크기) [CONSTRAINT 제약조건명] REFERENCES 참조할테이블명 [(기본키)] [삭제룰]
                
            2) 테이블 레벨
                [CONSTRAINT 제약조건명] FOREIGN KEY(컬럼명) REFERENCES 참조할테이블명 [(기본키)] [삭제룰]
                
        [삭제룰]
            부모 테이블의 데이터가 삭제됐을 때의 옵션을 지정해 놓을 수 있다.
            1) ON DELETE RESTRICT : (기존적으로 적용되는 옵션)
            자식 테이블의 참조 키가 부모 테이블의 키 값을 참조하는 경우 부모 테이블의 행을 삭제할 수 없다. 
            2) ON DELETE SET NULL : 부모 테이블의 데이터가 삭제 시 참조하고 있는 자식 테이블의 컬럼 값이 NULL로 변경된다.
            3) ON DELETE CASCADE  : 부모 테이블의 데이터가 삭제 시 참조하고 있느 자식 테이블의 컴럼 값이 존재하는 행 전체가 삭제된다.
*/ 

--FOREIGN 키 제약조건 - 다른 테이블과의 관계를 뜻함


-- 회원등급 테이블
-- MEMBER_GRADE(GRADE_CODE 기본키 숫자타입
--                , GRADE_NAME 문자타입 30BYTE NOTNULL)


-------------------------------------------------------------------- 위를 정독하고 밑에 두줄을 꼭 읽으시오
--자바로 치면 EXTENDS 인데 걸린놈이 자식 BOOK EXTENDS LIBRARY 하잖슴
-- 부모테이블
-- MEMBER_GRADE 라는 테이블 만들고
/* GRADE_CODE  -기본키
    GRADE_NAME -NOT NULL

    GRADE_CODE가 10이면 일반회원, 20 - 우수, 30- 특별
*/
DROP TABLE MEMBER_GRADE;
CREATE TABLE MEMBER_GRADE (
    GRADE_CODE NUMBER PRIMARY KEY
    ,GRADE_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO MEMBER_GRADE VALUES (10,'일반회원');
INSERT INTO MEMBER_GRADE VALUES (20,'우수회원');
INSERT INTO MEMBER_GRADE VALUES (30,'특별회원');



DROP TABLE MEMBER;
----------------------------------------------------------------------------------테이블 레벨에서 FK 추가








------------------------------------------------------------------------------------컬럼에 FK 추가






DROP TABLE MEMBER;
CREATE TABLE MEMBER(
    ID VARCHAR2(20) NOT NULL
    , PW VARCHAR2(20) CONSTRAINT NN_MEMBER_PW NOT NULL
    , NAME VARCHAR2(20) CONSTRAINT NN_MEMBER_NAME NOT NULL
    , REGDATE  DATE DEFAULT SYSDATE -- 기본값
    , DELYN CHAR(1) CONSTRAINT CHECK_MEMBER_DELYN CHECK(DELYN IN ('Y', 'N'))
    , GENDER CHAR(1) CHECK(GENDER IN ('M', 'F'))
    , AGE NUMBER CHECK(AGE > 0)
    , CONSTRAINT PK_MEMBER_ID UNIQUE(ID)
    --제약조건이름 REFERENCES 테이블명(컬럼명)
    , GRADE_CODE NUMBER CONSTRAINT FK_MEMBER_GRADE_CODE REFERENCES MEMBER_GRADE (GRADE_CODE) ON DELETE SET NULL 
); 
--------------------------------------------------------------------------------------------------------

--부모테이블의 컬럼에 입력된 값만 입력이 가능
INSERT INTO MEMBER (ID, PW, NAME,GRADE_CODE) VALUES ('ID','PW','홍홍홍',10);
--NULL만 입력가능
INSERT INTO MEMBER (ID, PW, NAME,GRADE_CODE) VALUES ('ID1','PW','홍홍홍',NULL);
INSERT INTO MEMBER (ID, PW, NAME,GRADE_CODE) VALUES ('ID2','PW','홍홍홍',10);

--외래키 재약조건을 사용중인 경우, 자식이 존재하는 경우 삭제 불가
--자식테이블에서 입력할 때 오류가 발생할 수 있다.


--자식테이블이 부모테이블을 참조하고 있는 경우 
--부모테이블에 입력된 데이터만 입력 가능

-- 자식이 참조하고있는 데이터는 삭제불가 (기본값) -> 옵션줘서 삭제
-- 옵션 : 1. 자식이 참조하고 있는 부모 데이터를 NULL로 업데이트 (부서 코드 없어졌다고 사원 날려버리지 않으니까 보통 이걸 쓰죠)
--        2. 자식행을 삭제

DELETE MEMBER_GRADE WHERE GRADE_CODE = 10;

SELECT * FROM MEMBER;
SELECT * FROM MEMBER_GRADE;

-- 데이터 무결성 : 데이터의 정확성과 일관성 유지, 결손과 부정합이 없음을 보증하는것

SELECT * FROM TB_BOOK;

SELECT * FROM TB_PUB;

DROP TABLE TB_BOOK;
CREATE TABLE TB_BOOK(

    NO          CHAR(6)         CONSTRAINT PK_TB_BOOK_NO        PRIMARY KEY
    , TITLE     VARCHAR2(100)   CONSTRAINT NN_TB_BOOK_TITLE     NOT NULL
    , AUTHOR    VARCHAR2(30)    CONSTRAINT NN_TB_BOOK_AUTHOR    NOT NULL
    , PRICE     CHAR(6)         CONSTRAINT CK_TB_BOOK_PRICE     CHECK(PRICE>0)
    , RENTYN    CHAR            DEFAULT 'N' 
                                CONSTRAINT CK_TB_BOOK_RENTYN    CHECK(RENTYN IN ('Y','N'))
    --외래키 제약조건                  
    , PUB_NO    CHAR(6)         REFERENCES TB_PUB(PUB_NO)
);

--외래키 제약조건에 의해 TB_PUB 테이블의 PUB_NO에 등록된 값만 입력 할 수 있다.
INSERT INTO TB_BOOK VALUES ('D00001','제목','작가',500000,'N','P00001');


-- 조건을 안주면 테이블의 모든 데이터를 삭제...................................이거 ...............조심...........
--건수 확인하고 실행 SELECT *FROM 이거 DELETE 로 바꾸면 되잖슴
--잘못됐다!!!!!! ROLLBACK
SELECT *FROM TB_BOOK;


DELETE BOOK;
DELETE FROM BOOK;
-- 업데이트도 똑같습니다..

-----%%%%%%%%%%%%%%%%%%%%%%-=======================================------실습문제

DROP TABLE MEMBER_GRADE;
CREATE TABLE MEMBER_GRADE (
    GRADE_CODE NUMBER PRIMARY KEY
    ,GRADE_NAME VARCHAR2(20) NOT NULL
);
INSERT INTO MEMBER_GRADE VALUES (10,'일반회원');
INSERT INTO MEMBER_GRADE VALUES (20,'우수회원');
INSERT INTO MEMBER_GRADE VALUES (30,'특별회원');

DROP TABLE MEMBER;

CREATE TABLE MEMBER (
    ID VARCHAR2(20)     PRIMARY KEY
    ,PW VARCHAR2(20)    CONSTRAINT NN_MEMBER_PW NOT NULL
    ,NAME VARCHAR2(20)  CONSTRAINT NN_MEMBER_NAME NOT NULL
    ,REGDATE DATE       DEFAULT SYSDATE
    ,DELYN   CHAR(1)    CONSTRAINT CHECK_MEMBER_DELYN CHECK(DELYN IN('Y','N'))
    ,GENDER  CHAR(1)    CONSTRAINT CHECK_MEMBER_GENDER CHECK(GENDER IN ('M','F'))
    ,AGE     NUMBER     CONSTRAINT CHECK_MEMBER_AGE     CHECK(AGE>0)
    ,GRADE_CODE NUMBER  REFERENCES MEMBER_GRADE(GRADE_CODE) ON DELETE SET NULL
);

INSERT INTO MEMBER(ID,PW,NAME,GRADE_CODE) VALUES ('ID','PW','김윤상',30);

SELECT * FROM MEMBER;

-- 1. 출판사들에 대한 데이터를 담기 위한 출판사 테이블(TB_PUB) 
--  1) 컬럼 : PUB_NO(출판사 번호) -- 기본 키 - CHAR(6)
--           PUB_NAME(출판사명) -- NOT NULL
--           PHONE(출판사 전화번호) -- 제약조건 없음
--           DELYN(삭제여부) -- Y/N
--           REGDATE(등록일) -- 기본값 : 오늘날자
--
-- 2. 일련번호 
--      SEQ_TB_PUB
--      P00001 


DROP TABLE TB_RENT;


DROP TABLE TB_PUB;
CREATE TABLE TB_PUB (
PUB_NO          CHAR(6)     PRIMARY KEY
,PUB_NAME       VARCHAR2(20)    NOT NULL
,PHONE          NUMBER(13)
,DELYN          CHAR(1)        CHECK(DELYN IN ('Y','N'))
,REGDATE        DATE        DEFAULT SYSDATE
);
DROP SEQUENCE SEQ_TB_PUB;
CREATE SEQUENCE SEQ_TB_PUB;

INSERT INTO TB_PUB(PUB_NO,PUB_NAME,DELYN) VALUES ('P'||LPAD(SEQ_TB_PUB.NEXTVAL , 5 , '0'),'나인','Y' );

SELECT * FROM TB_PUB;

-- 도서들에 대한 데이터를 담기 위한 도서 테이블 (TB_BOOK)
--  1) 컬럼 : NO (도서번호) -- 기본 키
--           TITLE (도서명) -- NOT NULL
--           AUTHOR(저자명) -- NOT NULL
--           PRICE(가격)
--           RENTYN         --YN
--           PUB_NO(출판사 번호) -- 외래 키(TB_PUB 테이블을 참조하도록)
--                      이때 참조하고 있는 부모 데이터 삭제 시 자식 데이터도 삭제 되도록 옵션 지정 

DROP TABLE TB_BOOK;
CREATE TABLE TB_BOOK(
    NO          NUMBER(6)      PRIMARY KEY
    ,TITLE      VARCHAR2(20)    NOT NULL
    ,AUTHOR     VARCHAR2(20)    NOT NULL
    ,PRICE      NUMBER(6)      
    ,RENTYN     CHAR(1)        CHECK(RENTYN IN('Y','N'))
    ,PUB_NO     CHAR(6)    REFERENCES TB_PUB(PUB_NO)
);
INSERT INTO TB_BOOK(NO,TITLE,AUTHOR,RENTYN,PUB_NO) VALUES (123456,'나인원에간다','곧','Y','P00002');
SELECT*FROM TB_BOOK;

-- 4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여 목록 테이블(TB_RENT)
--  1) 컬럼 : RENT_NO(대여번호) -- 기본 키
--           RENT_MEM_NO(대여 회원번호) -- 외래 키(TB_MEMBER와 참조)
--                                      이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--           RENT_BOOK_NO(대여 도서번호) -- 외래 키(TB_BOOK와 참조)
--                                      이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--           RENT_DATE(대여일) -- 기본값 SYSDATE

-- 시퀀스 생성 SEQ_TB_RENT 
DROP TABLE TB_RENT;
CREATE TABLE TB_RENT(
    RENT_NO     CHAR(6)     PRIMARY KEY
    ,RENT_MEN_NO VARCHAR2(20)    REFERENCES MEMBER(ID)
    ,RENT_DATE    DATE     DEFAULT SYSDATE  
);
DROP SEQUENCE SEQ_TB_RENT;
CREATE SEQUENCE SEQ_TB_RENT;
INSERT INTO TB_RENT(RENT_NO,RENT_MEN_NO) VALUES ('P'||LPAD(SEQ_TB_RENT.NEXTVAL,5,'0') ,'ID');

SELECT * FROM TB_RENT;

