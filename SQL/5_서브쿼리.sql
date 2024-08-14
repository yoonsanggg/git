

--서브쿼리 입력 할 땐 VALUES 입력 ㄴㄴ
--서브쿼리로 데이터 삽입
INSERT INTO EMP_01 (

-- DEPT CODE : 부서테이블의 기본키
SELECT  EMP_ID, EMP_NAME, DEPT_CODE
--여러개의 테이블 기술될 수 있음
FROM    EMP, DEPT
--사원테이블과 부서 테이블
WHERE DEPT_CODE = DEPT_ID 
);

--서브쿼리를 이용해서 테이블을 복사 , 
--그리고 !!! @@구조만 생성@@ =데이터 없는 빈 테이블= FALSE 조건을 주면 밑에선 0=1 이라했죵?
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME,HIRE_DATE, SALARY
    FROM EMP;

    
    
    
    SELECT *
    FROM EMP_OLD;
    
    DROP TABLE EMP_OLD;
    
-- 테이블 복사


-- '2000/01/01' 기준으로 EMP_OLD, EMP_NEW ㄱㄱ


CREATE TABLE EMP_OLD
AS SELECT   EMP_ID    ,    EMP_NAME  ,   HIRE_DATE   ,    SALARY
    FROM EMP
    --테이블 구조만 복사 / 값은 ㄴㄴ
    WHERE 1=0;
    
CREATE TABLE EMP_NEW
AS SELECT EMP_ID , EMP_NAME, HIRE_DATE ,SALARY
FROM EMP
WHERE 1=0;


    
    INSERT ALL
    WHEN HIRE_DATE < '2000/01/01' THEN
    INTO EMP_OLD VALUES (EMP_ID,EMP_NAME,HIRE_DATE,SALARY)
    WHEN HIRE_DATE >= '2000/01/01' THEN
    INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
--조회구문 여기죠?
    SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMP;
    
    --조회구문에 있는 애들을 WHEN 조건절에 넣을거야
    --원하는 데이터만 쏙 뽑아서 싹 넣기
            SELECT * FROM EMP_NEW;
            SELECT * FROM EMP_OLD;
            
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPT;

UPDATE DEPT_COPY
SET DEPT_TITLE = '전략기획팀'
WHERE DEPT_ID = 'D9';

SELECT *
FROM TB_BOOK;

INSERT INTO TB_BOOK (B_NO,TITLE,PRICE) VALUES ('B00025', '나인원한남', 50000);

DELETE TB_BOOK
WHERE B_NO > 'B00022';

--방명수 사원의 급여와 보너스 율을 유재식 사원과 동일하게 변경
SELECT* FROM EMP WHERE EMP_NAME= '유재식';

INSERT INTO EMP (EMP_ID, EMP_NAME, EMP_NO, JOB_CODE ,SALARY, BONUS ) VALUES (204 , '유재식' , '640105-1156322' , 'J7' ,3800000,0.2);

SELECT * FROM EMP;
SELECT * FROM DEPT_COPY;
    
    --서브쿼리 이용해서 업데이트 하는법 (단일행)
UPDATE EMP
SET 
SALARY =  (SELECT SALARY FROM EMP WHERE  EMP_NAME = '유재식') ,
BONUS = (SELECT BONUS FROM EMP WHERE EMP_NAME = '유재식') 
WHERE EMP_NAME = '방명수';

SELECT *
FROM EMP
WHERE EMP_NAME= '방명수';


    --서브쿼리 이용해서 업데이트 하는법 (다중행)
    --노옹철, 전형돈, 정중하, 하동운의 급여와 보너스를 유재식 사원과 동일하게 변경
    
    UPDATE      EMP
    SET             (SALARY,BONUS) = (SELECT          SALARY, BONUS
                                                    FROM            EMP
                                                    WHERE          EMP_NAME= '유재식')
    WHERE   EMP_NAME IN ('노옹철', '전형돈', '정중하' , '하동운');
    
    
    SELECT          EMP_NAME, SALARY, BONUS
    FROM            EMP
    WHERE          EMP_NAME='유재식';
    
    
    
    
    
    
    
    
    
    
    
    UPDATE EMP
    --다중열 - 여러행을 한꺼번에 처리
    SET     (SALARY,BONUS) = (SELECT SALARY, BONUS
                                                FROM EMP 
                                                WHERE  EMP_NAME = '유재식')
    --다중행  - 여러줄이 조회 되어짐
    WHERE EMP_NAME IN ('노옹철', '전형돈','정중하','하동운');
    
    SELECT* FROM EMP
    WHERE EMP_NAME IN ('노옹철', '전형돈','정중하','하동운');
    
-- 아시아 지역에 근무하는 직원의 보너스 포인트를 0.3으로 변경
SELECT     *
FROM        EMP;
SELECT * FROM LOCATION;

UPDATE          EMP
SET                 BONUS= 0.3
WHERE            EMP_ID IN (SELECT            EMP_ID
                                        FROM               EMP,     DEPT,       LOCATION
                                        WHERE            DEPT_CODE  =   DEPT_ID
                                        AND                 LOCATION_ID =     LOCAL_CODE
                                        AND                 LOCAL_NAME LIKE  'ASIA%');


UPDATE      EMP
SET             BONUS = 0.3 
WHERE       EMP_ID IN (
                                        SELECT      EMP_ID 
                                        FROM        EMP, DEPT D , LOCATION L
                                        WHERE      EMP.DEPT_CODE = D.DEPT_ID
                                        AND          D.LOCATION_ID = L.LOCAL_CODE
                                        AND          LOCAL_NAME LIKE 'ASIA%');



-- DEPT - LOCATION_ID -L1

SELECT * 
FROM EMP, DEPT D, LOCATION L
WHERE EMP.DEPT_CODE = D.DEPT_ID 
AND D.LOCATION_ID = L.LOCAL_CODE
AND   LOCAL_NAME LIKE 'ASIA%';

UPDATE EMP
SET BONUS=0.3
WHERE EMP_ID IN (   
                                SELECT              EMP_ID 
                                FROM                EMP, DEPT D, LOCATION L
                                WHERE              EMP.DEPT_CODE = D.DEPT_ID 
                                AND                  D.LOCATION_ID = L.LOCAL_CODE
                                AND                  LOCAL_NAME LIKE 'ASIA%');

SELECT * FROM EMP;

--총무부의 보너스를 0으로 업데이트




UPDATE      EMP      
SET            BONUS = 0
WHERE       EMP_ID IN (SELECT      EMP_ID
                                        FROM         EMP
                                        WHERE       DEPT_CODE = 'D9');









SELECT      *
FROM        EMP, DEPT
WHERE      DEPT_ID= DEPT_CODE 
AND DEPT_TITLE = '총무부';

UPDATE           EMP 
SET                  BONUS=0
WHERE            EMP_ID IN (                SELECT EMP_ID
                                                         FROM       EMP  ,  DEPT
                                                        WHERE      DEPT_ID= DEPT_CODE 
                                                        AND DEPT_TITLE = '총무부');

DELETE EMP WHERE EMP_NAME ='유재식' ;

COMMIT;

select * from TB_BOOK where title = '책다시';
