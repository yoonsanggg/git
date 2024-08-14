/*
    <숫자 관련 함수>
    
    1) ABS
        - ABS(NUBER)
        - 절대값을 구하는 함수
*/ 

SELECT ABS (10.9), ABS(-10.9) FROM DUAL;

/*
    2) MOD
        - MOD(NUMBER, NUMBER)
        - 두 수를 나눈 나머지를 반환해 주는 함수 (자바의 % 연산과 동일하다.)
*/ 

SELECT MOD(10,3)    FROM DUAL;


/*
    3) ROUND                                                                                            반올림
        - ROUND(NUMBER[, 위치])
        - 위치를 지정하여 반올림해주는 함수
        - 위치 : 기본값 0(.), 양수(소수점 기준으로 오른쪽)와 음수(소수점 기준으로 왼쪽)로 입력가능
*/ 

SELECT MOD(10,5) FROM DUAL;
SELECT  ABS(-12.14) FROM DUAL;

SELECT      ROUND(12.515)   FROM DUAL;

SELECT ROUND (10.55) FROM DUAL;
SELECT ROUND (10.45) FROM DUAL;
--기준 숫자만큼 보여줌
SELECT ROUND (10.554215126341, 2) FROM DUAL;

--     -는 기준 숫자를 반올림
SELECT ROUND (1510.554215126341,- 2) FROM DUAL;

--천단위 반올림 ㄱㄱ혓
SELECT ROUND (1510.554215126341,- 3) FROM DUAL;


/*                                                                                                          소수점올림
    4) CEIL
        - CEIL(NUMBER)
        - 소수점 기준으로 올림해주는 함수
*/
SELECT  CEIL(1510.554215126341) FROM DUAL;





/*                                                                                                          소수점버림
    5) FLOOR
        - FLOOR(NUMBER)
        - 소수점 기준으로 버림하는 함수
*/ 

--ORA-00909: 인수의 개수가 부적합합니다 . - 이거 왜뜨는지 알아야함

SELECT  FLOOR(1510.554215126341) FROM DUAL;

SELECT FLOOR (50030.235235) FROM DUAL;



/*
    6) TRUNC                                                                                                절삭
        - TRUNC(NUMBER[, 위치])
        - 위치를 지정하여 버림이 가능한 함수
        - 위치 : 기본값 0(.), 양수(소수점 기준으로 오른쪽)와 음수(소수점 기준으로 왼쪽)로 입력가능
*/ 


SELECT  TRUNC(1510.554215126341,-2) FROM DUAL;

SELECT      TRUNC (215215.521521,-5) FROM DUAL;

--============================숫자 끝~날짜시작===================================================



/*
    <날짜 관련 함수>
    
    1) SYSDATE
        시스템의 현재 날짜와 시간을 반환한다.
*/


SELECT SYSDATE
FROM DUAL;


/* 
    2) MONTHS_BETWEEN
        [표현법]
            MONTHS_BETWEEN(DATE1, DATE2)
            
        - 입력받은 두 날짜 사이의 개월 수를 반환한다.
        - 결과값은 NUMBER 타입이다.
*/ 

SELECT MONTHS_BETWEEN (SYSDATE,2026-12-01) FROM DUAL;
--위에껀 안됨

SELECT FLOOR (MONTHS_BETWEEN ('2026/12/01',SYSDATE)) || '개월' FROM DUAL;
--EMP 테이블에서 직원명 입사일 근무개월수

SELECT         EMP_NAME, HIRE_DATE, FLOOR( MONTHS_BETWEEN(SYSDATE,HIRE_DATE) ) 근무개월수
FROM            EMP;


/*
    3) ADD_MONTHS
        [표현법]
            ADD_MONTHS(DATE, NUMBER)
            
        - 특정 날짜에 입력받는 숫자만큼의 개월 수를 더한 날짜를 리턴한다.
        - 결과값은 DATE 타입이다.
*/ 
SELECT ADD_MONTHS(SYSDATE, 6) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 8) FROM DUAL;
SELECT ADD_MONTHS('2020/12/31', 2) FROM DUAL; 
SELECT ADD_MONTHS (SYSDATE,28) FROM DUAL;


/*
    4) NEXT_DAY
        [표현법]
            NEXT_DAY(DATE, 요일(문자|숫자))
        
        - 특정 날짜에서 구하려는 요일의 가장 가까운 날짜를 리턴한다.
        - 결과값은 DATE 타입이다.
*/ 


SELECT  SYSDATE,    NEXT_DAY (SYSDATE,  '일')  FROM    DUAL;

SELECT  SYSDATE,    NEXT_DAY (SYSDATE,      'SUNDAY')   FROM  DUAL;



SELECT  VALUE
FROM    NLS_SESSION_PARAMETERS
WHERE   PARAMETER = 'NLS_LANGUAGE';


ALTER   SESSION SET NLS_LANGUAGE =  AMERICAN;
ALTER   SESSION SET NLS_LANGUAGE =  KOREAN;
ALTER   SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS'; 


/*
    5) LAST_DAY
        [표현법]
            LAST_DAY(DATE|CHAR)
        
        - 해당 월의 마지막 날짜를 반환한다.
        - 결과값은 DATE 타입이다.   
*/
-- 말일을 반환 

SELECT  LAST_DAY(SYSDATE)   FROM DUAL;
SELECT  LAST_DAY('2026-12-01') FROM DUAL;

--입사월의 마지막 날짜를 조회

SELECT EMP_NAME, LAST_DAY(HIRE_DATE),   LAST_DAY(HIRE_DATE)- HIRE_DATE 근무일
FROM    EMP;

/*
    6) EXTRACT
        [표현법]
            EXTRACT(YEAR|MONTH|DAY FROM DATE);
            
        - 특정 날짜에서 연도, 월, 일 정보를 추출해서 반환한다.
          YEAR : 연도만 추출
          MONTH : 월만 추출
          DAY :  일만 추출
        - 결과값은 NUMBER 타입이다.
*/ 

SELECT   TO_CHAR (SYSDATE, 'YYYY') 년
            ,   EXTRACT(MONTH FROM SYSDATE) 월
            ,   EXTRACT(DAY     FROM       SYSDATE) 일
FROM DUAL;

/*
    <형변환 함수>
    
    1) TO_CHAR
        [표현법]
            TO_CHAR(날짜|숫자[, 포멧])
        
        - 날짜 또는 숫자 타입의 데이터를 문자 타입으로 변환해서 반환한다.
        - 결과값은 CHARACTER 타입이다.
*/ 

-- 숫자 ->문자

SELECT 1234, TO_CHAR (1234,'999,999')
-- 9갯수만큼 공간 확보, 왼쪽정렬, 빈칸공백
FROM DUAL;

-- 넣은 값이 더 크면 ####
SELECT TO_CHAR (500000000000, '999,999') FROM DUAL;
-- 편안
SELECT TO_CHAR (500000000000, '999,999,999,999,999,999') FROM DUAL;


-- 9는 출력 안됨, 0은 출력됨
SELECT TO_CHAR (500000000000, '000,000,000,000,000,000') FROM DUAL;

-- 이유
-- 9,0 둘 다 형식문자
-- 9는 자리수만, 0은 비어있는 자리 출력하죠

-- '' 안에 L 붙이면 원단위 기호
SELECT TO_CHAR (500000000000, 'L999,999,999,999,999,999') FROM DUAL;
-- '' 안에 C 붙이면 KRW
SELECT TO_CHAR (500000000000, 'C999,999,999,999,999,999') FROM DUAL;

-- 날짜 -> 문자
SELECT SYSDATE, TO_CHAR(SYSDATE) FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
-- 시간만 출력 (HH24:MI:SS - 24시간으로 출력)
SELECT SYSDATE, TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;
--DY:   수     DAY:    수요일
SELECT SYSDATE, TO_CHAR(SYSDATE, 'MON DY, YYYY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD(DAY)') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YEAR') FROM DUAL; 

-- 일에 대한 포맷
SELECT TO_CHAR(SYSDATE, 'DDD') -- 1년을 기준으로 몇일째 
        , TO_CHAR(SYSDATE, 'DD') -- 1달을 기준으로 몇일째
        , TO_CHAR(SYSDATE, 'D') -- 1주를 기준으로 몇일째
FROM DUAL; 

SELECT  TO_CHAR(SYSDATE,    'YYYY"년 " MM "월 " DD "일 " (DAY)')
FROM    DUAL;


SELECT      TO_CHAR (HIRE_DATE, ' YYYY "-" MM "-" DD (DY)')
FROM        EMP
ORDER BY   1 DESC ;
-- 컬럼의 순서, 별칭 , 컬럼의 이름 등 다양하게 사용 가능



/*
    2) TO_DATE
        [표현법]
            TO_DATE(숫자|문자[, 포멧])
        
        - 숫자 또는 문자형 데이터를 날짜 타입으로 변환해서 반환한다.
        - 결과값은 DATE 타입이다.
*/ 

--숫자 -> 날짜
SELECT      TO_DATE (20261201104350)
FROM        DUAL;

--문자 -> 날짜

SELECT      TO_DATE ('20261201104350')
FROM        DUAL;

SELECT      TO_DATE ('2026-12-01-10-43-50')
FROM        DUAL;

SELECT      TO_DATE ('2026-12-01 10:43:50')
FROM        DUAL;
--형식 지정
SELECT      TO_DATE ('261201 104350', 'YYMMDD HH24:MI:SS')
FROM        DUAL;

--아래같이 날짜를 문자로 설정하면 자동으로 형 변환 되는데 숫자는 인식 못합니당
SELECT      EMP_ID, EMP_NAME, HIRE_DATE
FROM        EMP
WHERE       HIRE_DATE >= '19980101'
ORDER BY    HIRE_DATE;

--이런 방법도 있고
SELECT      EMP_ID, EMP_NAME, HIRE_DATE
FROM        EMP
WHERE       HIRE_DATE >= TO_DATE(19980101)
ORDER BY    HIRE_DATE;
-- BETWEEN 당연히 사용 가능하고
SELECT      EMP_ID, EMP_NAME, HIRE_DATE
FROM        EMP
WHERE       HIRE_DATE BETWEEN '19980101' AND '20010101'
ORDER BY    HIRE_DATE;


/*
    3) TO_NUMBER
        [표현법]
            TO_NUMBER('문자값'[, 포멧])
        
        - 문자 타입의 데이터를 숫자 타입의 데이터로 변환해서 반환한다.
        - 결과값은 NUMBER 타입이다.
*/ 


SELECT TO_NUMBER ('123456')
FROM DUAL;
-- 자동형변환 미쳤음;;
-- 문자가 입력 된 경우 오류남
SELECT '1234' + '565A'
FROM DUAL;
-- 세자리 컴마를 숫자로 변경
SELECT TO_NUMBER ('50,000,000,000','999,999,999,999,999')
FROM EMP;



/*
    <NULL 처리 함수>
    
    1) NVL
        [표현법]
            NVL(컬럼, 컬럼값이 NULL일 경우 반환할 값)
        
        - NULL로 되어있는 컬럼의 값을 인자로 지정한 값으로 변경하여 반환한다.

    2) NVL2
        [표현법]
            NVL2(컬럼, 변경할 값 1, 변경할 값 2)
            
        - 컬럼 값이 NULL이 아니면 변경할 값 1, 컬럼 값이 NULL이면 변경할 값 2로 변경하여 반환한다.  
    
    3) NULLIF
        [표현법]
            NULLIF(비교대상 1, 비교대상 2)
            
        - 두 개의 값이 동일하면 NULL 반환, 두 개의 값이 동일하지 않으면 비교대상 1을 반환한다.
*/ 

--  NULL 연산에서 제외되므로 0으로 처리
SELECT  NVL (BONUS, '0') FROM EMP;

-- 보너스를 0,1로 동결

SELECT BONUS 보너스율 , NVL2(BONUS , '0.1', '0') "동결된 보너스" 
FROM EMP;

--  두 값이 같으면 NULL반환
SELECT NULLIF ('123', '123') FROM DUAL;
--  두 값이 같지 않으면 첫번째 값을 반환
SELECT NULLIF ('123', '456') FROM DUAL;


/*
    <선택함수>
        여러 가지 경우에 선택을 할 수 있는 기능을 제공하는 함수이다.
    
    1) DECODE
        [표현법]
            DECODE(컬럼|계산식, 조건값 1, 결과값 1, 조건값 2, 결과값 2, ..., 결과값)
        
        - 비교하고자 하는 값이 조건값과 일치할 경우 그에 해당하는 결과값을 반환해 주는 함수이다.
*/ 

SELECT    EMP_NAME 사원명,DECODE (SUBSTR (EMP_NO, 8 , 1) ,1, '남', 2, '여', 3, '남', 4, '여자' , '잘못된 주민번호 입니다.') 성별
FROM        EMP;

-- EMPLOYEE 테이블에서 사원명, 직급 코드, 기존 급여, 인상된 급여를 조회
-- 직급 코드가 J7인 사원은 급여를 10% 인상(SALARY * 1.1) 
-- 직급 코드가 J6인 사원은 급여를 15% 인상(SALARY * 1.15) 
-- 직급 코드가 J5인 사원은 급여를 20% 인상(SALARY * 1.2) 
-- 이 외의 직급은 사원은 급여를 5%만 인상 (SALARY * 1.05) 


--사용법
-- DECODE (JOB_CODE , 'J7', SALARY*1.1 ', SALARY*1.15) 
-- 잡코드의 값이 J7 이면 셀러리 *1.1 할게~ 아니면 1.15곱할게~


SELECT         EMP_NAME 이름, DECODE (JOB_CODE, 'J7' , SALARY*1.1,
                                                                                    'J6', SALARY*1.15, 
                                                                                    'J5', SALARY * 1.2, 
                                                                                    SALARY*1.05) "인상된 급여"
FROM            EMP
ORDER BY    JOB_CODE DESC;


/*
    2) CASE
        [표현법]
            CASE WHEN 조건식 1 THEN 결과값 1
                 WHEN 조건식 2 THEN 결과값 2
                 ...
                 ELSE 결과값 N
            END
*/ 

SELECT  EMP_NAME 사원명 , CASE WHEN  SUBSTR(EMP_NO,    8,  1)  =  1  THEN  '남자'
                         WHEN  SUBSTR(EMP_NO,    8,  1)  =  1  THEN  '여자'
                         ELSE    '주민번호 확인 요망'         -------------------------------ELSE 생략 가능
                END                                                     -------------------------------END 생략 불가
FROM      EMP;                   

SELECT     EMP_NAME 사원명, SALARY 급여, CASE     WHEN  SALARY  >= 5000000  THEN '고수익'
                                                                                   WHEN  SALARY  >= 3000000  THEN '일반'
                                                                                   ELSE     ' '
                                                                                   END
FROM    EMP;

SELECT * FROM EMP;






INSERT INTO EMP (EMP_ID, EMP_NAME, EMP_NO , SALARY, BONUS, HIRE_DATE ,  DEPT_CODE,  JOB_CODE) 
            VALUES (999,    '김윤상',      '980708-1111111', 500000000000 , 22, '2026-12-01', 'D9', 'J1' );
