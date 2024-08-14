/*
    <JOIN>
    두 개의 이상의 테이블에서 데이터를 조회하고자 할 때 사용하는 구문이다.
    
    1. 등가 조인(EQUAL JOIN) / 내부 조인(INNER JOIN)
    연결시키는 컬럼의 값이 일치하는 행들만 조인되서 조회한다.
    (일치하는 값이 없는 행은 조회 X)   
    
    --등가조인 : 조건 준거 일치하는 애들만 조회함
    
    1) 오라클 전용구문
        SELECT 컬럼, 컬럼, ...
        FROM   테이블1, 테이블2
        WHERE  테이블1.컬럼명 = 테이블2.컬럼명;
        
        - FROM절에 조회하고자 하는 컬럼들을 ,(콤마)로 구분하여 나열
        - WHERE절에 매칭시킬 컬럼에 대한 조건을 제시 한다.
        
    
    2) ANSI 표준 구문                                   --다른 DB에서도 똑같이 이용 할 수 있지만,,
        SELECT  컬럼, 컬럼, ...
        FROM    테이블1
        [INNER] JOIN 테이블2 ON (테이블1.컬럼명 = 테이블2.컬럼명);
        [INNER] JOIN 테이블2 USING (컬럼명);
        - FROM절에 기준이 되는 테이블을 기술
        - JOIN 절에 같이 조회하고자 하는 테이블을 기술후 조건을 명시
        - 연결에 사용하려는 커럼명이 같은 경우 ON절 
          대신 USING(컬럼명)을 사용 
 */
 
 
 -- 총 사원수 :23명
 SELECT * FROM EMP;
 -- 각 사원들의 사번, 사원명 , 부서코드, 부서명을 조회=======================
 
 
 -- DEPT_ID 값에 NULL이 없으니까
 -- DEPT_CODE 값에 NULL이 입력된 사원이 제외
 
 SELECT         EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
 FROM           EMP,  DEPT
 --     INNERJOIN   : 조건이 만족하는 값만 조회
 WHERE         DEPT_CODE = DEPT_ID;
 
 -- 부서테이블에서 사용되지 않는 부서코드를 조회==============================
 
 
 SELECT * FROM DEPT;
 
 SELECT     *
 FROM       DEPT
 WHERE      DEPT_ID NOT IN (
                    --EMP테이블이 사용중인 부서코드 목록
                    --  NOT IN 절에 NULL이 입력 될 경우 빼줘야함
                SELECT  DISTINCT (DEPT_CODE)
                FROM EMP
                WHERE DEPT_CODE IS NOT NULL);
 
 -- 표준 ANSI문법
 
 SELECT    EMP_ID, EMP_NAME, DEPT_CODE
 FROM     EMP
 JOIN       DEPT ON (DEPT_ID = DEPT_CODE);
 
 
 
 
 --         각 사원들의 사번, 사원명, 직급코드, 직급명을 조회             =======================
 
 
 --         컬럼 이름이 같은경우 (대부분 똑같이 쓰니까) 테이블명 명시하여 구분 할 수 있도록 해주자
 --         별칭 ㄱㄱ혓
 
 
 SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
 FROM   EMP E, JOB J
 WHERE E.JOB_CODE=J.JOB_CODE;
 
 -- ANSI 표준구문
 --컬럼이름이 같은경우
 --USING 절에 사용된 컬럼은 테이블 이름을 붙일 수 없다
 --앞에 테이블명을 붙이면 오류발생
 -- USING 자동으로 같은 컬럼 붙여주는거같은데?
 SELECT EMP_ID, JOB_CODE
 FROM EMP
 JOIN       JOB USING (JOB_CODE);
 
 --ON절 사용
 --테이블명 명시 ㄱㄱ혓
 SELECT EMP_ID,EMP_NAME, JOB.JOB_CODE
 FROM EMP 
 JOIN   JOB ON ( EMP.JOB_CODE=JOB.JOB_CODE);
 
 /*
	* ANSI SQL
	DBMS(Oracle, My-SQL, DB2 등등)들에서 각기 다른 SQL를 사용하므로, 
	미국 표준 협회(American National Standards Institute)에서 이를 
    표준화하여 표준 SQL문을 정립 시켜 놓은 것이다.
*/ 


 -- EMP 테이블과 JOB 테이블을 조인하여 직급이 대리인 사원의
-- 사번, 사원명, 직급명, 급여를 조회 =========================================

-- USING 써서
SELECT EMP_ID, EMP_NAME, JOB_CODE ,JOB_NAME, SALARY
FROM EMP
-- 컬럼의 이름이 다르면 ON절 쓰면 됨
JOIN  JOB USING (JOB_CODE)
WHERE JOB_NAME = '대리';


-- ORACLE 기본타입
SELECT EMP_ID, EMP_NAME, JOB_NAME, E.JOB_CODE ,SALARY
FROM EMP E, JOB J
WHERE  E.JOB_CODE = J.JOB_CODE
AND JOB_NAME = '대리';
 
 --ON 써서
 SELECT EMP_ID, EMP_NAME, JOB.JOB_CODE ,JOB_NAME, SALARY
FROM EMP
JOIN  JOB ON (EMP.JOB_CODE = JOB.JOB_CODE )
WHERE JOB_NAME = '대리';
 /*
    2. 다중 JOIN
        여러개의 테이블을 조인하는 경우 사용
 */
 --사번, 사원명, 부서명, 지역명===============================
  SELECT*FROM LOCATION;           --/ LOCAL_CODE
 SELECT*FROM DEPT; --DEPT_ID     / LOCATION_ID
 SELECT*FROM EMP; --DEPT_CODE/

--오라클 구문
 SELECT     EMP_ID, EMP_NAME,DEPT_TITLE,LOCAL_NAME
 FROM       EMP, DEPT, LOCATION
 WHERE     DEPT_CODE = DEPT_ID 
 AND         LOCATION_ID = LOCAL_CODE; 

--ANSI 구문 
--순서대로 연결해줘야함
 SELECT         EMP_ID,  EMP_NAME,  DEPT_TITLE, LOCAL_NAME
 FROM           EMP   JOIN             DEPT  ON   (DEPT_CODE = DEPT_ID ) 
 JOIN             LOCATION  ON  (LOCATION_ID=LOCAL_CODE);
 
 
/*
    3. 외부조인(OUTTER JOIN)
        테이블간에 JOIN시 조건에 일치하지 않는 행도 포함시켜서 조회
        기준이 되는 테이블을 지정 해야 한다(LEFT/RIGNT/(+))
*/


-- 1) LEFT [OUTER] JOIN 
--      두 테이블중 왼편에 기술된 테이블의 컬럼을 기준으로 JOIN을 진행
--      JOIN 조건이 일치하지 않아도 왼쪽에 테이블을 모두 출력 

-- 2) RIGHT [OUTER] JOIN 
--    두 테이블 중 오른편에 기술된 테이블의 컬럼을 기준으로 JOIN을 진행
--    오른쪽 테이블을 모두 출력
-- 사원이름, 부서명, 급여를 출력하는데 부서테이블의 모든 데이터가 출력되도록 

---=====================-------------누락된 사원 두명 데려올거임 
--조건의 반대편에 +를 붙여줌
--+ 반대가 기준이 됨
-- 기준이 되면 다 데려나온다~

 --   부서테이블에 없지만 사원테이블에는 있는 데이터 조회됨
SELECT      EMP_NAME,    DEPT_CODE,    DEPT_TITLE
FROM        EMP, DEPT
--조건이 일치하지 않아도 데이터 조회
-- 조회하고자 하는 테이블 반대편에 (+)
WHERE      DEPT_CODE = DEPT_ID(+);
 
 -- 사원테이블에는 없지만 부서테이블에 있는 데이터 조회됨
 SELECT      EMP_NAME,    DEPT_CODE,    DEPT_TITLE
FROM        EMP, DEPT
WHERE      DEPT_CODE (+)= DEPT_ID;
 
 
 --ANSI
 SELECT     EMP_NAME,    DEPT_CODE,    DEPT_TITLE
 FROM       EMP LEFT     /*OUTER*/     JOIN        DEPT      ON      ( DEPT_CODE =   DEPT_ID);
 
 
 
-- 3) FULL [OUTER] JOIN : 두 테이블이 가지는 모든 행을 조회
--    오라클 구문은 지원하지 않음
-- 조회조건만족                           21건 
-- 사원테이블 부서코드가 NULL인             2건 
-- 부서테이블 사원이 배정되지 않은 부서코드   3건 
 
 -- 그럼 ORACLE은 
 --WHERE      DEPT_CODE(+)  = DEPT_ID(+); 입니까?
 -- 아뇨 없습니다.
 
 -- 싹 다데려와
 SELECT EMP_NAME,    DEPT_CODE,    DEPT_TITLE
 FROM       EMP FULL    JOIN    DEPT    ON  ( DEPT_CODE =   DEPT_ID);
 
 --CROSS JOIN
 -- 조건 주지 않았을 때
 -- EX) 모든 사원들이 모든 부서를 가지고 있는거임
 -- 그냥 그 조건 없을 때 곱해져서 싹 다 나오는거
 
-- NON_EQU JOIN
--  지정하는 컬럼 값의 범위를 줌
-- EX) 

-- 6.   자체조인    (SELF JOIN)
--                      같인 테이블을 다시한번 조인하는 경우에 사용한다
-- 이해가 잘 안되니 공부 해야함&&&&&&&&&&&&&&&&&&&&&&&&&&&&

----------------------------사번,     이름,     관리자사번,      관리자이름
 
SELECT      E.EMP_ID, E.EMP_NAME, M.EMP_ID, M.EMP_NAME
FROM        EMP E, EMP M
WHERE      E.MANAGER_ID = M.EMP_ID(+);




/*
5. 비등가 조인(NON EQUAL JOIN)
    조인 조건에 등호(=)를 사용하지 않는 조인문을 비등가 조인이라고 한다.
    지정한 컬럼 값이 일치하는 경우가 아닌, 
    값의 범위에 포함되는 행들을 연결하는 방식이다.
    ( = 이외에 비교 연산자 >, <, >=, <=, 
    BETWEEN AND, IN, NOT IN 등을 사용한다.)
    ANSI 구문으로는 JOIN ON 구문으로만 사용이 가능하다. (USING 사용 불가)    
*/
/* 급여등급 테이블 생성 */
CREATE TABLE SAL_GRADE(
	SAL_LEVEL CHAR(2 BYTE), 
	MIN_SAL NUMBER, 
	MAX_SAL NUMBER
);
COMMENT ON COLUMN SAL_GRADE.SAL_LEVEL IS '급여등급';
COMMENT ON COLUMN SAL_GRADE.MIN_SAL IS '최소급여';
COMMENT ON COLUMN SAL_GRADE.MAX_SAL IS '최대급여';
COMMENT ON TABLE SAL_GRADE IS '급여등급'; 

Insert into SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL)
                                values ('S1',6000000,10000000);
Insert into SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) 
                                values ('S2',5000000,5999999);
Insert into SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) 
                                values ('S3',4000000,4999999);
Insert into SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) 
                                values ('S4',3000000,3999999);
Insert into SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) 
                                values ('S5',2000000,2999999);
Insert into SAL_GRADE (SAL_LEVEL,MIN_SAL,MAX_SAL) 
                                values ('S6',1000000,1999999); 
COMMIT; 

-- 범위 테이블의 값이 중복 될 경우, 한명의 사원이 여러 등급을 갖을 수 있으므로 주의해야함
SELECT * FROM SAL_GRADE;

SELECT       EMP_NAME,    SAL_LEVEL, SALARY
FROM         EMP,        SAL_GRADE
WHERE       SALARY      BETWEEN     MIN_SAL     AND     MAX_SAL;


-- JOIN 끝


