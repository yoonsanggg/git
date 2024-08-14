-- 실습문제 
-- 보너스를 받는 사원들의 사번, 사원명, 보너스, 부서명을 조회
-- 오라클 

--      KO










SELECT      EMP_ID, EMP_NAME,   BONUS,  DEPT_TITLE
FROM        EMP , DEPT
WHERE      DEPT_CODE = DEPT_ID
AND          BONUS IS NOT NULL 
AND BONUS != 0;


--ANCI

SELECT         EMP_ID, EMP_NAME,   BONUS,  DEPT_TITLE
FROM           EMP     JOIN    DEPT    ON  (DEPT_CODE = DEPT_ID)
WHERE         BONUS IS NOT NULL
AND             BONUS != 0;

--인사관리부가 아닌 사원들의 사원명, 부서명   , 급여를 조회

--오라클

-- 누락된 사원ㄷ이 없도록 ! (부서코드가 입력되지 않은 사원)


-- DEPT_ID = D1     ,       DEPT_TITLE = '인사관리부'        LOCATION_ID = 'L1'


SELECT      EMP_NAME, DEPT_TITLE, SALARY , DEPT_ID
FROM        EMP,    DEPT
WHERE      DEPT_CODE  = DEPT_ID (+) --기준 잡아주고
AND          (DEPT_ID  != 'D1' OR DEPT_ID IS NULL); --여기서 해결해주고
--이게 아우터조인
--조건 밖에서 값 가져온다~

--부서코드 6개 사용중
SELECT  DISTINCT    DEPT_CODE   FROM EMP;
--9개의 부서코드
SELECT  DEPT_ID FROM DEPT;

--     ANCI JOIN

SELECT     EMP_NAME, NVL (DEPT_TITLE, '부서없음'), SALARY , DEPT_ID
FROM       EMP     LEFT       JOIN          DEPT      ON  (DEPT_CODE  = DEPT_ID)
WHERE     NVL (DEPT_TITLE, '부서없음') != '인사관리부' ;     

-- EMP, DEPT, LOCATION, NATIONAL
-- 사번, 사원명, 부서명, 지역명, 국가명 조회
-- 누락되는 사원이 없이 조회해봅시다 
SELECT* FROM EMP;


SELECT          EMP_ID, EMP_NAME, DEPT_TITLE ,L.LOCAL_NAME, N.NATIONAL_NAME
FROM            EMP, DEPT, LOCATION L,    NATIONAL N
WHERE          DEPT_CODE = DEPT_ID (+)
AND              LOCATION_ID = L.LOCAL_CODE (+)
AND              L.NATIONAL_CODE = N.NATIONAL_CODE (+);

-- + 로 기준잡는법 설명 들어간다
-- 걍 ERD 보고  첫기준 이후에는 연결되는애로 기준 잡으면 됨

-- ANCI로 ㄱㄱ혓

SELECT          EMP_ID, EMP_NAME, DEPT_TITLE ,L.LOCAL_NAME, N.NATIONAL_NAME
FROM            EMP    
LEFT             JOIN             DEPT                  ON                (DEPT_CODE = DEPT_ID )
LEFT             JOIN             LOCATION L       ON         (LOCATION_ID = L.LOCAL_CODE )
LEFT             JOIN             NATIONAL N      ON        (L.NATIONAL_CODE = N.NATIONAL_CODE);

--부서별 최고 급여를 받는 사람 이거 히트임;;===============================
--          IN      <-다중행 처리
--          =       <- 단일행 처리
SELECT                      * 
FROM                         EMP
WHERE (DEPT_CODE, SALARY)
IN (SELECT     DEPT_CODE,        MAX (SALARY)
FROM        EMP
GROUP BY    DEPT_CODE);



