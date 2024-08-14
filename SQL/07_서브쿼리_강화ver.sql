-- 서브쿼리 또할겨
/*
    <SUBQUERY>
        하나의 SQL문 안에 포함된 또다른 SQL 문을 뜻한다.
        메인 쿼리 (기존쿼리)를 보조하는 역할을 하는 쿼리문
*/
-- 노옹철 사원과 같은 부서인 사원들의 이름과 부서코드를 조회 하시오!
-- 1. 노옹철 사원의 부서를 조회 

SELECT         EMP_NAME 사원명 , DEPT_CODE
FROM            EMP, DEPT
WHERE          DEPT_CODE = DEPT_ID
AND               DEPT_CODE = 'D9';

SELECT      DEPT_CODE  FROM  EMP  WHERE   EMP_NAME = '노옹철';


--          원래 저 자리에 D9가 나왔는데
--           조건을 줘서 () 안에 값이  D9가 나오게 하면 결국 똑같다
SELECT         EMP_NAME 사원명 , DEPT_CODE,     DEPT_TITLE
FROM           EMP,  DEPT
WHERE        DEPT_CODE = DEPT_ID
AND             DEPT_CODE = (SELECT      DEPT_CODE  FROM  EMP  WHERE   EMP_NAME = '노옹철');


-- 단일행 서브쿼리 : 서브쿼리의 실행결과 행과 열의 갯수가 1개인 쿼리
-- 비교연산자 (>,< , <= , !=  ..... 등등등)를  이용 할 때 단일행 서브쿼리 사용할 수 있더라~



-- 2. 전 직원의 평균 급여보다 급여를 적게 받는 직원의 이름, 직급코드, 직급코드명, 급여를 조회

SELECT     EMP_NAME , J.JOB_CODE, JOB_NAME, TO_CHAR (SALARY,'999,999,999,999,999,999') 급여
FROM        EMP E, JOB J
WHERE      J.JOB_CODE = E.JOB_CODE
AND           SALARY < (SELECT FLOOR (AVG(SALARY)) FROM EMP);

-- 3. 최저 급여를 받는 직원의 사번, 이름, 직급 코드, 급여, 입사일 조회
SELECT MIN(SALARY) FROM EMP;

SELECT      EMP_ID,  EMP_NAME,  JOB_CODE,  SALARY,  HIRE_DATE
FROM         EMP
WHERE      SALARY = (SELECT MIN(SALARY) FROM EMP);

-- 4. 노옹철 사원의 급여보다 더 많은 급여받는 
-- 사원들의 사번, 사원명, 부서명, 직급 코드, 급여 조회
-- 노옹철 사원의 급여를 조회

SELECT     SALARY FROM EMP WHERE EMP_NAME = '노옹철';

SELECT  EMP_NO,  EMP_NAME,  DEPT_TITLE,  DEPT_ID, SALARY
FROM        EMP,  DEPT
WHERE       SALARY >(SELECT  SALARY FROM EMP WHERE EMP_NAME = '노옹철');


-- 5. 부서별 급여의 합이 가장 큰 부서의 
--    부서 코드, 급여의 합 조회
--    각 부서별 급여의 합 중에 가장 큰 급여의 합을 조회

-- GROUP BY 는 묶어준애랑 집계함수만 올 수 있음,, 왜 까먹었지


SELECT            MAX(SUM(SALARY)) "부서별 급여 합계"
FROM                EMP
GROUP BY        DEPT_CODE;


SELECT            MAX(SUM(SALARY)) , COUNT(SUM(SALARY)) --7개 행의 최대값
FROM                EMP
GROUP BY        DEPT_CODE;

SELECT             DEPT_CODE , SUM(SALARY)
FROM                EMP
-- WHERE은 단일행 비교인데 넌 다중행인데? HAVING 와라
GROUP BY        DEPT_CODE 
HAVING             SUM(SALARY) =  (SELECT MAX(SUM(SALARY))
                                                            FROM                EMP
                                                            GROUP BY        DEPT_CODE);

-- 집계함수에 대한 조건은 WHERE절에 올 수 없다!!!!!!!!!!!!!
-- HAVING 절을 이용하면 집계함수 조건 줄 수 있음
-- 그냥 GROUP BY 전용 WHERE 라고 생각 ㄱㄱ혓
-- GROUP BY 로 묶으면 집계함수, 묶은 컬럼만 올 수 있음
-------------------------------------------------일단 봐야함

-- 단일행임  그냥 급여를 하나로 묶었으니까
SELECT  SUM(SALARY)
FROM      EMP;

-- 다중행임  부서 '별' 이니까
SELECT        DEPT_CODE, SUM(SALARY)  ,COUNT(*) " D1로 묶은애 3명이야~"
FROM            EMP
GROUP BY    DEPT_CODE;

-- 직급별 급여의 평균
SELECT      AVG(SALARY)
FROM         EMP
GROUP BY  JOB_CODE;

--부서별, 직급별로 묶기

SELECT      AVG(SALARY),COUNT(*)
FROM         EMP
GROUP BY  JOB_CODE, DEPT_CODE ;




-- 6. 부서별 평균(소수점버림)급여가 가장 작은 부서의 부서코드와 부서명 평균급여를 조회

SELECT         MIN (FLOOR (AVG(SALARY))) 
FROM            EMP
GROUP BY     DEPT_CODE;



SELECT              DEPT_CODE, DEPT_TITLE,  FLOOR (AVG(SALARY))
FROM                 EMP, DEPT
WHERE              DEPT_CODE =  DEPT_ID
GROUP BY         DEPT_CODE,  DEPT_TITLE
HAVING              FLOOR (AVG(SALARY))  =     (SELECT         MIN (FLOOR (AVG(SALARY)))
                                                                        FROM            EMP
                                                                        GROUP BY     DEPT_CODE);






-- 7. 전지연 사원이 속해있는 부서원들 조회 (단, 전지연 사원은 제외)
-- 사번, 사원명, 전화번호, 직급명, 부서명, 입사일 
-- 전지연 사원이 속해있는 부서 조회 
-- 오라클 


SELECT    E.EMP_ID, E.EMP_NAME, PHONE, J.JOB_NAME, E.HIRE_DATE
FROM       EMP E, DEPT D,  JOB J
WHERE    E.JOB_CODE = J.JOB_CODE
AND         E.DEPT_CODE = D.DEPT_ID
AND         E.DEPT_CODE = 'D1'
AND         E.EMP_NAME != '전지연';

-- SELECT 에도 서브쿼리 사용 가능, JOIN 과정은 다음과 같다.
SELECT         EMP_ID 사원번호, EMP_NAME 사원명,  PHONE 전화번호,
                                                     (SELECT  JOB_NAME  FROM  JOB  WHERE  JOB.JOB_CODE  =  EMP.JOB_CODE) 직급
                                                     , (SELECT DEPT_TITLE  FROM DEPT  WHERE DEPT.DEPT_ID = EMP.DEPT_CODE) 부서

FROM           EMP
WHERE         DEPT_CODE = (SELECT    DEPT_CODE  FROM EMP    WHERE     EMP_NAME = '전지연')
AND             EMP_NAME != '전지연';



-- 사실 제일 자주 이용하는 JOIN ㄱㄱ
-- 사번, 사원명, 전화번호, 직급명, 부서명, 입사일 
SELECT         EMP_ID 사원번호, EMP_NAME 사원명,  PHONE 전화번호, JOB.JOB_NAME ,DEPT_TITLE, 
                                                                                                        TO_CHAR (HIRE_DATE,'YYYY-MM-DD')
FROM           EMP ,  JOB,  DEPT  
WHERE         DEPT_ID = DEPT_CODE
AND             EMP.JOB_CODE = JOB.JOB_CODE
AND              DEPT_CODE = (SELECT    DEPT_CODE  FROM EMP    WHERE     EMP_NAME = '전지연')
AND             EMP_NAME != '전지연';


--이거 너무 복잡함 다시
SELECT        E.DEPT_CODE , E.EMP_ID,  E.EMP_NAME,  E.PHONE,  J.JOB_CODE,  D.DEPT_TITLE
FROM            EMP E, DEPT D, JOB J
WHERE         D.DEPT_ID = E.DEPT_CODE
AND              E.JOB_CODE = J.JOB_CODE
GROUP BY    E.DEPT_CODE, E.EMP_ID,  E.EMP_NAME,  E.PHONE,  J.JOB_CODE,  D.DEPT_TITLE
HAVING         E.DEPT_CODE = (SELECT    DEPT_CODE
                                            FROM       EMP
                                            WHERE     EMP_NAME = '전지연')
AND              EMP_NAME != '전지연';

--- ANSI 방법
SELECT      EMP.EMP_ID, EMP.EMP_NAME, EMP.PHONE, JOB.JOB_NAME, EMP.HIRE_DATE
FROM          EMP
JOIN            JOB         USING     (JOB_CODE)
JOIN            DEPT        ON          (DEPT_ID = DEPT_CODE)
WHERE      EMP.DEPT_CODE = 'D1'
AND           EMP.EMP_NAME != '전지연';



/*
    2) 다중행 서브쿼리 : 서브쿼리의 조회 결과 값이 여러행 일대
    
    IN / NOT IN (서브쿼리)
        여러개의 결과값중 하나라도 일치하면  TRUE를 리턴
        -> WHERE절에서 조건을 만족 할경우 TRUE (결과집합에 포함)
    ANY : 여러개의 값들중 한개라도 만족 하면 TRUE
            IN과 다른점 : 비교연산자를 함께 사용 할수 있다
            EX) SALARY = ANY(....) : IN과 같은 결과
                SALARY != ANY(....): NOT IN과 같은 결과
                SALARY > ANY(10000000,2000000,3000000) : 최소값 보다 크면 TRUE
                SALARY < ANY(10000000,2000000,3000000) : 최대값 보다 작으면 TRUE
            
    ALL : 여러 개의 값들 모두와 비교하여 만족해야 TRUE
                SALARY > ALL(10000000,2000000,3000000) : 최대값 보다 크면 TRUE
                SALARY < ALL(10000000,2000000,3000000) : 최소값 보다 작으면 TRUE        
*/ 

-- IN / NOT IN  / ANY  /  ALL /
--싹 
-- ANY 는 범위 ㄱㄴ



-- 1) 각 부서별 최고 급여를 받는 직원의 이름, 직급 코드, 부서 코드, 급여 조회
-- 각 부서별 최고 급여를 조회

SELECT     MAX(SALARY)
FROM        EMP
WHERE       DEPT_CODE  IS NOT NULL
GROUP BY  DEPT_CODE;

SELECT         DEPT_CODE
FROM            EMP
GROUP BY    DEPT_CODE;


SELECT           EMP_NAME,JOB_CODE,  DEPT_CODE, SALARY
FROM            EMP
WHERE          (DEPT_CODE, SALARY)  IN (SELECT    DEPT_CODE, MAX(SALARY)
                                                                FROM            EMP
                                                                WHERE       DEPT_CODE  IS NOT NULL
                                                                GROUP BY  DEPT_CODE );
                                                                
-- 2) 전 직원들에 대해 사번, 이름, 부서 코드, 구분(매니저/사원)
-- 매니져의 사번을 조회 - 중복을 제거 

--매니져 조회
-- IN 이용해서 매니저인지 아닌지 구분하고 매니져 사번이면 매니져 아니면 사원

SELECT     DISTINCT MANAGER_ID , EMP_ID
FROM        EMP
WHERE       MANAGER_ID IS NOT NULL
AND            EMP_ID = 201;


----------------------------------매니저 사원 구분
SELECT      EMP_ID 사번, EMP_NAME 이름,   DEPT_CODE 부서코드, '매니저' 구분
FROM         EMP
WHERE       EMP_ID IN (SELECT     DISTINCT MANAGER_ID
                                    FROM        EMP
                                    WHERE       MANAGER_ID IS NOT NULL)

UNION


SELECT      EMP_ID  사번, EMP_NAME  이름,   DEPT_CODE 부서코드, '사원' 구분
FROM         EMP
WHERE       EMP_ID NOT IN (SELECT     DISTINCT MANAGER_ID
                                            FROM        EMP
                                            WHERE       MANAGER_ID IS NOT NULL)
                                            
                                            ORDER BY 사번;
                        

--DECODE (이쿼리에서,D1이면,~로 출력)


SELECT      EMP_ID,   DECODE ((SELECT  DISTINCT  M.MANAGER_ID   
                                                    FROM            EMP M
                                                    WHERE          M.MANAGER_ID IS NOT NULL
                                                    AND               M.MANAGER_ID  = EMP.EMP_ID), NULL, '사원', '매니져'  )

FROM         EMP;




-- EMP_ID 가 매니저 사번에 있다면
SELECT  DISTINCT  MANAGER_ID
FROM            EMP
WHERE          MANAGER_ID IS NOT NULL
AND               MANAGER_ID  = 210;

SELECT      EMP_ID,         '구분', (SELECT  DISTINCT  M.MANAGER_ID   매니저의사번
                                                    FROM            EMP M
                                                    WHERE          M.MANAGER_ID IS NOT NULL
                                                    -- 서브쿼리에서 사용되는 컬럼이 메인테이블을 참조하면 별칭줘라~
                                                    AND               M.MANAGER_ID  = EMP.EMP_ID)  매니저여부

FROM         EMP;

-- 위에 해석하면
-- M.매니저랑 E.EMP 아이디 JOIN해서 SELECT로 NOT NULL인 매니저 아이디를 출력

--      CASE AND THEN END

SELECT  COUNT (*)  FROM  EMP M WHERE M.MANAGER_ID = 200;

--관리자가 몇명을 관리하는지
SELECT                 EMP_ID, (SELECT  COUNT (*)  FROM  EMP M WHERE M.MANAGER_ID = EMP.EMP_ID)  횟수
        ,   CASE  WHEN   (SELECT  COUNT (*)  FROM  EMP M WHERE M.MANAGER_ID = EMP.EMP_ID) > 0 THEN '매니저'
                            ELSE '사원'
                            END 구분
FROM                     EMP
ORDER BY 횟수 DESC;



UNION  ALL  --결과집합을 합쳐주는 애임 중복도 합침
UNION          --결과집합을 합쳐주는 애임 중복 제외
INTERSECT  -- 교집합
MINUS          -- 차집합
--                  SELECT 리스트 개수와 데이터 타입 같아야함
--                   LOB 타입은 사용 불가 (용량 큰놈 , 이미지같은)
--                    LONG도 불가



-- 3) 대리 직급임에도 과장 직급들의 최소 급여보다 많이 받는 
-- 직원의 사번, 이름, 직급명, 급여 조회 

--과장 급여
SELECT      EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM         EMP E, JOB J 
WHERE       J.JOB_CODE = E.JOB_CODE 
AND            J.JOB_CODE = 'J5';
-- 대리 급여
SELECT      EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM         EMP E, JOB J 
WHERE       J.JOB_CODE = E.JOB_CODE 
AND            J.JOB_CODE = 'J6'
--                  ANY는 최소값보다 크면 됨
--                  ALL은 최대값보다 커야함                                                      ---어떻게 쓰는건지 모르겠음 ㄱㄱ
AND             SALARY > ALL (SELECT            MIN (SALARY)
                                        FROM            EMP E, JOB J 
                                      WHERE            J.JOB_CODE = E.JOB_CODE 
                                           AND            J.JOB_CODE = 'J5');


-- J6의 SALARY 가 J5의 SALARY 보다 큰경우

SELECT     DECODE (J.JOB_CODE , 'J6' , '대리', 'J5', '과장'),
                                                    CASE  WHEN (SELECT      SALARY
                                                                            FROM         EMP E, JOB J 
                                                                            WHERE       J.JOB_CODE = E.JOB_CODE 
                                                                            AND            J.JOB_CODE = 'J6') THEN >
                                                    (SELECT      MIN (SALARY)
                                                    FROM         EMP E, JOB J 
                                                    WHERE       J.JOB_CODE = E.JOB_CODE ) '대리'
                                                    END
FROM        JOB J, EMP E
WHERE      J.JOB_CODE = E.JOB_CODE ;


-- 3) 대리 직급임에도 과장 직급들의 최소 급여보다 많이 받는 
-- 직원의 사번, 이름, 직급명, 급여 조회 


SELECT          SALARY
FROM            EMP, JOB
WHERE          J.JOB_CODE = E.JOB_CODE

AND                 J.JOB_CODE IS NOT NULL;


--인라인 뷰

-- 서브쿼리를 테이블처럼 이용하는데 페이징 처리할 때 인라인사용
-- 서브쿼리 결과집합 가지고 FROM 절에서 사용
-- ROWNUM 사용 하는법 - 몇번부터 몇번 가져와~ SELECT 에 그냥 쓰면 됨

--이렇게 쓰면 ORDER BY 사용해도 쓸 수 있겠죵?
SELECT    *
FROM       (SELECT      ROWNUM  RN, EMP_NAME
                  FROM        
                                    (SELECT         EMP_ID,     EMP_NAME
                                        FROM          EMP
                                ORDER BY           EMP_NAME)
                                        )
WHERE   RN  BETWEEN 11   AND 20;                                        

-- ROWNUM 처음 괄호에 넣을 땐 ORDER BY를 해결하기 위해
-- ROWNUM 은 나와야 1번이 생김
-- 무조건 1부터 시작해야하는데 별칭주고 감싸면 해결됨
-- 왜 해결되지?
                      
--페이지 만들 때  쓰는거임 위에 예시로는 11번 게시글부터 20번 게시글 불러줘~                              



/*
    <다중열 서브 쿼리>
        조회 결과 값은 한 행이지만 나열된 컬럼 수가 여러 개일 때
*/

-- 다중열 서브쿼리를 작성 하는 방법
-- 비교연산자도 사용이 가능( =, IN ) 


SELECT      *
FROM        EMP
WHERE      (JOB_CODE, DEPT_CODE) = (('J1','D9'));
--괄호 두번 감싸야 되네
SELECT      *
FROM        EMP
WHERE       (JOB_CODE, DEPT_CODE) = ((SELECT  JOB_CODE, DEPT_CODE
                                        FROM    EMP
                                        WHERE   EMP_NAME = '하이유'));
--콤마로 나누는게 아니라 SELECT에서 구분해주면 됨



-- 2) 박나라 사원과 직급 코드가 일치하면서 같은 사수를 가지고 있는 
-- 사원의 사번, 이름, 직급 코드, 사수 사번 조회
-- 박나라 사원의 직급 코드와 사수의 사번을 조회 -- (J7, 207)

SELECT      JOB_CODE, MANAGER_ID
FROM        EMP
WHERE       EMP_NAME ='박나라';

SELECT  EMP_ID, EMP_NAME, JOB_CODE, MANAGER_ID
FROM    EMP
WHERE   (JOB_CODE, MANAGER_ID) IN (SELECT      JOB_CODE, MANAGER_ID
                                    FROM        EMP
                                    WHERE       EMP_NAME ='박나라');

/*
    <다중행 다중열 서브 쿼리>
    서브 쿼리의 조회 결과값이 여러 행, 여러 열일 경우
*/ 

SELECT  *
FROM    EMP
WHERE   (JOB_CODE, SALARY) IN (
                                ('J2', 3700000),
                                ('J7', 1380000)
    );

                                    
-- 1. 각 직급별로 최소 급여를 받는 사원들의 사번, 이름, 직급 코드, 급여 조회
-- 각 직급별 최소 급여 조회 

SELECT      JOB_CODE, MIN(SALARY)
FROM        EMP
GROUP BY    JOB_CODE;

SELECT  *
FROM    EMP
WHERE   (JOB_CODE, SALARY) IN (
                                SELECT      JOB_CODE, MIN(SALARY)
                                FROM        EMP
                                GROUP BY    JOB_CODE
    );
    
-- 2) 각 부서별 최소 급여를 받는 사원들의 사번, 이름, 부서명, 급여 조회
-- 부서가 없는 사원은 부서없음으로 표시
-- 각 부서별 최소 급여 조회 

SELECT      MIN(SALARY), NVL(DEPT_CODE,'부서 없음')
FROM        EMP
GROUP BY    DEPT_CODE;

SELECT      EMP_ID, EMP_NAME, DEPT_TITLE, SALARY
FROM        EMP, DEPT
WHERE       DEPT_CODE = DEPT_ID (+)
-- NULL 조회가 안돼서 바꿔줘야함
AND         (SALARY, DEPT_CODE) IN (SELECT      MIN(SALARY),DEPT_CODE
                                    FROM        EMP
                                    GROUP BY    DEPT_CODE);
-- 기준 안잡으면 안나옴
-- 기준 잡는게 OUTER JOIN
SELECT      EMP_ID, EMP_NAME, NVL (DEPT_TITLE, '부서없음'), SALARY
FROM        EMP, DEPT
WHERE       DEPT_CODE = DEPT_ID (+) 
AND         (SALARY, NVL(DEPT_CODE, '부서없음')) 
IN                                 (SELECT      MIN(SALARY),NVL(DEPT_CODE, '부서없음')
                                    FROM        EMP
                                    GROUP BY    DEPT_CODE)
ORDER BY    EMP_ID;      

SELECT      EMP_ID, EMP_NAME, NVL (DEPT_TITLE, '부서없음'), TO_CHAR(SALARY,'FM999,999,999,999C')
FROM        EMP
LEFT JOIN   DEPT ON (DEPT_CODE= DEPT_ID)
WHERE         (SALARY, NVL(DEPT_CODE, '부서없음')) 
IN                                 (SELECT      MIN(SALARY),NVL(DEPT_CODE, '부서없음')
                                    FROM        EMP
                                    GROUP BY    DEPT_CODE)   ;                  

--SELECT에 서브쿼리

SELECT DEPT_TITLE
FROM    DEPT
WHERE   DEPT_ID =DEPT_CODE;
------------------------------------이거 해보기

SELECT      EMP_ID, EMP_NAME, NVL ((SELECT DEPT_TITLE
                                    FROM    DEPT
                                    WHERE   DEPT_ID =DEPT_CODE), '부서없음'), SALARY
                                    --여기 FROM에서 EMP 쓸 필요가 없는 이유는
                                    --FROM 을 거치고 와서 WHERE에서 조건만 주면 되는거같음
FROM        EMP
WHERE         (SALARY, NVL(DEPT_CODE, '부서없음')) 
IN                                 (SELECT      MIN(SALARY),NVL(DEPT_CODE, '부서없음')
                                    FROM        EMP
                                    GROUP BY    DEPT_CODE)
ORDER BY    EMP_ID;                     


/*
    <인라인 뷰>
        FROM 절에 서브 쿼리를 제시하고, 서브 쿼리를 수행한 결과를 테이블 대신 사용한다.
    1) 인라인 뷰를 활용한 TOP-N분석
*/


--인라인뷰 -- FROM 안에 테이블처럼 쓸 수 있게

SELECT  ROWNUM , EMP.*
FROM    EMP;

SELECT  ROWNUM ,T.*
FROM    (SELECT  *
        FROM    EMP)
        ORDER BY EMP_NAME) T;

SELECT  *
FROM    (SELECT  ROWNUM RN, T.*
        FROM    (SELECT  *
                FROM    EMP
                ORDER BY EMP_NAME )T )
WHERE   RN BETWEEN 11 AND 20;        


-- 전 직원중 급여가 가장 높은 사람 5명을 순위, 이름, 급여 조회
-- FROM -> SELECT(순번이 정해진다.) -> ORDER BY
-- ROWNUM : 조회된 순서대로 번호를 붙여 줍니다
--          ORDER BY절이 SELECT절 다음에 실행 되므로 ROWNUM이 붙고 난 후 정렬 
-- 테이블의 이름을 명시적으로 써줘야 함


SELECT    ROWNUM, SALARY
FROM      EMP;

SELECT  RN, emp_name, SALARY
FROM    (SELECT     ROWNUM RN, T.*
FROM      (SELECT    *
            FROM      EMP
            ORDER BY     SALARY DESC)T)
WHERE   RN <= 5;



-- 2) 부서별 평균 급여가 높은 3개의 부서의 부서 코드, 평균 급여 조회

--------------------WITH 사용

WITH TOPN_SAL AS (
SELECT      DEPT_CODE ,FLOOR(AVG(SALARY)) SALARY
FROM        EMP
GROUP BY    DEPT_CODE
ORDER BY    SALARY DESC)

SELECT      ROWNUM, DEPT_CODE, SALARY  
FROM        TOPN_SAL
WHERE       ROWNUM <= 3;
------------------------------------

/*
     <RANK 함수>
        [표현법]
            RANK() OVER(정렬 기준) / DENSE_RANK() OVER(정렬 기준)
            DENSE_RANK() OVER(정렬 기준)   : 동일한 순위 이후의 등수를 무조건 1씩 증가한다.
        - 동일한 값인 경우 동일한 순번을 부여
        - 동일한 순위 이후 동일한 갯수만큼 건너 뛰고 순위를 부여
        - 정렬기준을 여러개 두어 순위를 구분 할 수 있다 EX) 급여가 같으면 직급순으로
*/ 

SELECT      RANK() OVER(ORDER BY SALARY DESC) RN , EMP_NAME , SALARY
FROM        EMP;

SELECT  * 
FROM    (SELECT      RANK() OVER(ORDER BY SALARY DESC) RN , EMP_NAME , SALARY
        FROM        EMP)
        --WHERE 절에서는 RANK () 사용이 불가능하므로 인라인뷰(FROM절)로 만들어서 사용
WHERE   RN <=5 ;

-- 부서별 급여순위

-- PARTITION BY 그룹으로 묶어줌
SELECT      RANK() OVER(PARTITION BY DEPT_CODE ORDER BY SALARY DESC) RN, DEPT_CODE, EMP_NAME , SALARY
FROM        EMP;

--부서별 최고급여
SELECT * 
FROM    (SELECT      RANK() OVER(PARTITION BY DEPT_CODE ORDER BY SALARY DESC) RN, DEPT_CODE, EMP_NAME , SALARY
        FROM        EMP)
WHERE RN=1;




