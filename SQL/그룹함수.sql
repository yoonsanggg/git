/*
    <그룹함수>
        대량의 데이터들로 집계나 통계같은 작업을 처리해야 하는 경우 사용 하는 함수
        모든 그룹함수는 NULL 값을 자동으로 제외
        => NVL()함수와 함께 사용하는것을 권장 합니다.
    
    1) SUM(NUMBER)                                             ()안에 컬럼이나 타입 이름 들어갈 수 있음
        - 해당 컬럼의 총 합계를 반환 합니다
    2) AVG(NUMBER)
        - 해당 컬럼의 평균을 반환 합니다.
    3) MIN(모든타입) / MAX(모든타입)
        - MIN : 해당 컬럼의 값들중 가장 작은 값을 반환 합니다.
        - MAX : 해당 컬럼의 값들중 가장 큰 값을 반환 합니다.
    4) COUNT(*|컬럼명)
        - 결과 행의 갯수를 세서 반환 하는 함수
        - COUNT(*) : 조회결과에 해당하는 모든 행의 갯수를 반환
        - COUNT(컬럼명) : 제시한 컬럼값이 NULL이 아닌 행의 갯수를 반환
        - COUNT(DISTINTCT 컬럼명) : 해당 컬럼의 중복을 제거한 후 행의 갯수를 반환.
        
        */
        SELECT  FLOOR (AVG(SALARY))
        FROM EMP;
        
        SELECT  MIN(SALARY)
        FROM EMP;
        SELECT      TO_CHAR (MAX(SALARY)/100000000,'999,999,999,999,999,999')||'억'
        FROM EMP;
        
        INSERT INTO EMP (EMP_ID,    EMP_NAME,   EMP_NO,     JOB_CODE,     SALARY,     BONUS,      HIRE_DATE) 
        VALUES                (91,        '김윤상',      980708-1111111,       'J1',       500000000000,       22,     '2026-12-01');
        --집계함수 : 여러행 또는 테이블 전체 행으로부터 하나의 결과값을 반환
        
        UPDATE          EMP
        SET                 SALARY   = 549200000000
        WHERE           EMP_NAME = '김윤상';
        
        SELECT COUNT(*) -- 전체 갯수를 확인하기 때문에 단일값은 ㄴㄴ..
        FROM EMP;
        
        SELECT COUNT (EMP_ID)
        FROM EMP;
        
        SELECT COUNT (BONUS)
        FROM EMP;
        --NULL 값 2건을 제외
        SELECT COUNT (DEPT_CODE)
        FROM EMP;
        
        SELECT * FROM EMP;
        
        --중복 제거
        --1.
        SELECT DISTINCT DEPT_CODE
        FROM EMP;
        --2.
        SELECT COUNT (DISTINCT DEPT_CODE)
        FROM EMP;
        
        
        -- 사원은 총 급여의 합계
        
        SELECT SUM (SALARY)
        FROM EMP;
        -- 평균
        SELECT AVG (SALARY)
        FROM EMP;
        
        --새로운 사원번호 = 최대값 +1
        
        SELECT MAX(EMP_ID) +1
        FROM EMP;
        
        --급여의 최대값, 최소값 구하기
        SELECT MIN(SALARY), MAX(SALARY)
        FROM EMP;
        
   /*
    <GROUP BY>
        - 그룹에 대한 기준을 제시할 수 있는 구문
        여러개의 값들을 하나의 그룹으로 묶어서 처리할 목적으로 사용한다.
        SELECT 
        FROM
        [WHERE]
        [GROUP BY]
        [ORDER BY]
        생략이 가능 한 절도 있지만 
        - 쿼리를 작성시 순서대로 작성 해야 한다
        - SELECT 절에는 집계함수와 GROUP BY절에 명시된 컬럼만 작성이 가능하다
*/ 
        
-- 부서별 급여의 합계

SELECT DEPT_CODE , SUM(SALARY) 부서별총급여, COUNT (EMP_ID) , COUNT (*) 부서별사원수
FROM EMP
GROUP BY DEPT_CODE 
ORDER BY 1;

--직급별 사원의 수

SELECT JOB_CODE , COUNT (*) 직급별사원수
FROM EMP
GROUP BY JOB_CODE; --~별~


--부서별 보너스를 받는 사원의 수

SELECT JOB_CODE, COUNT (BONUS) 보너스받는사원
FROM EMP
GROUP BY JOB_CODE;

--직급별 급여의 평균

SELECT JOB_CODE, AVG(SALARY)
FROM EMP
GROUP BY JOB_CODE;

--부서별
--사원수, 보너스를 받는 사원수
-- , 급여의 합, 평균급여, 최고급여, 최저급여
-- 금액 3자리 콤마, 사원수에는 명을 붙여서 왼쪽 정렬

SELECT DEPT_CODE 부서코드 , LPAD(COUNT(*),2,0) || '명' 사원수, LPAD (COUNT(BONUS),2,0) || '명' "보너스를 받는 사원수" , TO_CHAR( SUM(SALARY) , '999,999,999,999') 급여의합, 
TO_CHAR( AVG(SALARY) , '999,999,999,999') 평균급여, TO_CHAR( MAX(SALARY) , '999,999,999,999') 최고급여, TO_CHAR(  MIN(SALARY) , '999,999,999,999') || '원'최저급여
FROM EMP
GROUP BY DEPT_CODE
ORDER BY 부서코드;

--남자 사원의 총 급여의 합계

SELECT SUM(SALARY)
FROM EMP
WHERE SUBSTR (EMP_NO, 8, 1 ) IN ('1','3');

--퇴직한 직원의 수
SELECT COUNT(*) 퇴사자수
FROM EMP
WHERE ENT_YN= 'Y';

