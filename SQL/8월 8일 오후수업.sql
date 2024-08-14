--춘 대학교 워크북 과제
--SQL02_SELECT(Function)

-- 1번
-- 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른 순으로 표시하는 SQL문장을 작성하시오.
-- (단, 헤더는 "학번", "이름", "입학년도" 가 표시되도록 한다.)
    
SELECT      STUDENT_NO, student_name, entrance_date, department_no
FROM        TB_STUDENT
WHERE       department_no = 002
ORDER BY    entrance_date;

-- 2번
-- 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다. 그 교수의 이름과 주민번호를 화면에 출력하는 SQL문장을 작성해보자.
-- (*이때 올바르게 작성한 SQL 문장의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇인지 생각해볼 것)

SELECT  PROFESSOR_NAME
FROM    TB_PROFESSOR
WHERE   PROFESSOR_NAME IS NOT NULL
AND     PROFESSOR_NAME NOT LIKE '___';

-- 3번
-- 춘 기술대학교의 남자 교수들의 이름을 출력하는 SQL 문장을 작성하시오. 단 이때 나이가 적은 사람에서 많은 사람 순서
-- (나이가 같다면 이름의 가나다 순서)로 화면에 출력되도록 만드시오.
-- (단, 교수 중 2000년 이후 출생자는 없으며 출력 헤더는 "교수이름"으로 한다. 나이는 '만'으로 계산한다.)
-- 실행 월에 따라 결과 값 다를 수 있으므로 PROFESSOR_SSN 같이 SELECT 해서 확인해보기!!

SELECT      PROFESSOR_NAME 이름, TO_CHAR(SYSDATE,'YYYY') ,
    DECODE (SUBSTR(PROFESSOR_SSN,8,1),1,19,2,19,3,20,4,20)||SUBSTR(PROFESSOR_SSN,1,2) 나이
FROM        TB_PROFESSOR
WHERE   SUBSTR(PROFESSOR_SSN, 8,1) IN (1,3)
ORDER BY 나이, 이름 DESC;

SELECT      PROFESSOR_NAME 이름, 
        TO_CHAR(SYSDATE,'YYYY') -('19'||SUBSTR(PROFESSOR_SSN,1,2))+1 나이
FROM        TB_PROFESSOR
WHERE   SUBSTR(PROFESSOR_SSN, 8,1) IN (1,3)
ORDER BY 나이, 이름 DESC;



SELECT  TO_CHAR(SYSDATE , 'YYYY-MM')
FROM    DUAL;

SELECT  TO_DATE(SYSDATE),
TO_DATE (TO_NUMBER(DECODE (SUBSTR(PROFESSOR_SSN,8,1),1,19,2,19,3,20,4,20)||
SUBSTR(PROFESSOR_SSN,1,6)),'YYYY-MM-DD')
FROM    TB_PROFESSOR;


SELECT  TO_DATE(SUBSTR(PROFESSOR_SSN, 1, 6), 'RR-MM-DD')
FROM    TB_PROFESSOR;

--MONTH BETWEEN - 

-- 4번
-- 교수들의 이름 중 성을 제외한 이름만 출력하는 SQL 문장을 작성하시오. 출력 헤더는 "이름"이 찍히도록 한다.
-- (성이 2자인 경우의 교수는 없다고 가정하시오)

SELECT  CASE WHEN LENGTH(PROFESSOR_NAME)= 3 THEN (SUBSTR(PROFESSOR_NAME,2,3))
            WHEN LENGTH(PROFESSOR_NAME)= 2 THEN  PROFESSOR_NAME ||'(외자)'
            WHEN LENGTH(PROFESSOR_NAME)>= 4 THEN  PROFESSOR_NAME ||'(4자이상)'
            END "성을 뺀 이름 (특이사항)"
FROM    TB_PROFESSOR;
-- 5번
-- 춘 기술대학교의 재수생 입학자 학번과 이름을 표시하시오.(이때, 19살에 입학하면 재수를 하지 않은 것으로 간주)
-- 문제에서 요구하는 내용은 현역과 삼수생을 모두 제외한 재수생만 추려내는 것 (삼수생도 포함한 결과는 245행)
-- 0301생인 김정현 학생을 제외시키기 위해 19 초과 20 이하라는 조건식 사용

--98년 17학번
SELECT  *
FROM    TB_STUDENT
WHERE   SUBSTR(SUBSTR(STUDENT_SSN,1,2)+19,2,3)=SUBSTR(ENTRANCE_DATE,3,2);

SELECT  ENTRANCE_DATE , GET_AGE(STUDENT_SSN) 나이
FROM    TB_STUDENT;

SELECT  *
FROM    (SELECT STUDENT_NAME 이름, ENTRANCE_DATE 입학일
                ,GET_AGE(STUDENT_SSN) 현재나이
                ,TO_CHAR(ENTRANCE_DATE, 'YYYY')
                    - (DECODE (SUBSTR(STUDENT_SSN,8,1),1,19,2,19,3,20,4,20)
                        || SUBSTR(STUDENT_SSN,1,2) ) +1 입학나이
    FROM TB_STUDENT)
    WHERE 입학나이 !=20 ;

SELECT  *
FROM    TB_STUDENT
WHERE   STUDENT_NAME='김정현';

SELECT  GET_AGE('980708-1111111')
FROM    DUAL;

SELECT   EXTRACT(, 'YYYY') 년
            ,   EXTRACT(MONTH FROM SYSDATE) 월
            ,   EXTRACT(DAY     FROM       SYSDATE) 일
FROM DUAL;

-- 6번
-- 2020년 크리스마스는 무슨 요일인가?
--'DAY': 금요일 'DY': 금 'D': 6
SELECT  NEXT_DAY('2020-12-25',5)
FROM DUAL;

SELECT  SYSDATE, TO_DATE('2020-12-25','YYYY-MM-DD(DAY)')
FROM    DUAL;

SELECT  EXTRACT((YEAR-MONTH-DAY) FROM '2020-12-25')
FROM    DUAL;

SELECT  TO_CHAR (TO_DATE('2020-12-25', 'YYYY-MM-DD'),'DAY')
FROM    DUAL;

SELECT  TO_CHAR(TO_DATE('2026-12-01', 'YYYY-MM-DD'), 'DAY')
FROM DUAL;

SELECT TO_CHAR(TO_DATE('2020-12-25', 'YYYY-MM-DD'), 'DAY') AS 요일
FROM dual;
-- 8번
-- 춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작하게 되어있다. 
-- 2000년도 이전 학번을 받은 학생들의 학번과 이름을 보여주는 SQL 문장을 작성하시오.

SELECT  *
FROM    TB_STUDENT
WHERE   STUDENT_NO NOT LIKE 'A%';


-- 9번
-- 학번이 A517178인 한아름 학생의 학점 총 평점을 구하는 SQL문을 작성하시오.
-- 단, 이때 출력 화면의 헤더는 "평점"이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.

SELECT  ROUND(AVG(POINT),1)
FROM    TB_STUDENT S, TB_GRADE G
WHERE   S.STUDENT_NO = G.STUDENT_NO
AND     S.STUDENT_NO = 'A517178';


-- 10번
-- 학과별 학생 수를 구하여 "학과번호", "학생수(명)"의 형태로 헤더를 만들어 결과값이 출력되도록 하시오.


SELECT      DEPARTMENT_NO,COUNT(*)||'명' "학생수"
FROM        TB_STUDENT
GROUP BY    DEPARTMENT_NO;



-- 11번
-- 지도 교수를 배정받지 못한 학생의 수는 몇 명 정도 되는지 알아내는 SQL문을 작성하시오

SELECT      COUNT(STUDENT_NO)
FROM        TB_STUDENT
WHERE       COACH_PROFESSOR_NO IS NULL;

SELECT      COACH_PROFESSOR_NO
FROM        TB_STUDENT
ORDER BY      COACH_PROFESSOR_NO NULLS FIRST;

-- 12번
-- 학번이 A112113인 김고운 학생의 년도 별 평점을 구하는 SQL문을 작성하시오.
-- 단, 이때 출력화면의 헤더는 "년도", "년도 별 평점"이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.

SELECT      SUBSTR(TERM_NO,1,4)"년도", ROUND(AVG(POINT),1) "년도 별 평점"
FROM        TB_GRADE
WHERE       STUDENT_NO = 'A112113'
GROUP BY   SUBSTR(TERM_NO,1,4);



-- 13번
-- 학과 별 휴학생 수를 파악하고자 한다. 학과 번호와 휴학생 수를 표시하는 SQL문장을 작성하시오.

-- COUNT(DECODE(ABSENCE_YN, 'Y', 1, NULL)) 의 부연설명
-- 만일 ABSENCE_YN의 값이 'Y'였을 경우 COUNT(1)이 되어 갯수를 세게 되고
--     ABSENCE_YN의 값이 'Y'가 아니였을 경우 COUNT(NULL)이 되어 갯수를 세지 않게되는 원리!!


SELECT      (SELECT DEPARTMENT_NAME
            FROM    TB_DEPARTMENT
            WHERE   DEPARTMENT_NO = S.DEPARTMENT_NO ),
COUNT(DECODE(ABSENCE_YN,'Y',1,NULL)) 휴학생수
FROM        TB_STUDENT S
GROUP BY    DEPARTMENT_NO;





-- 14번
-- 춘 대학교에 다니는 동명이인 학생들의 이름을 찾고자 한다.
-- 어떤 SQL 문장을 사용하면 가능하겠는가?


SELECT  STUDENT_NAME, COUNT(*)
FROM     TB_STUDENT
GROUP BY    STUDENT_NAME
HAVING      COUNT(*) > 1;








-- 15번
-- 학번이 A112113인 김고운 학생의 년도, 학기 별 평점과 년도 별 누적 평점, 총 평점을 구하는 SQL문을 작성하시오.
-- (단, 평점은 소수점 1자리까지만 반올림하여 표시한다.)



SELECT  *
FROM       TB_GRADE
WHERE      STUDENT_NO = 'A112113' ;


SELECT      NVL(SUBSTR(TERM_NO,1,4),'총') || NVL(SUBSTR(TERM_NO,5,2),'평점') 년도,ROUND(AVG(POINT),1) 평균
FROM        TB_GRADE
WHERE       STUDENT_NO = 'A112113' 
GROUP BY    ROLLUP(SUBSTR(TERM_NO,1,4),SUBSTR(TERM_NO,5,2));




--춘 대학교 워크북 과제
--SQL03_SELECT(Option)

-- 1번
-- 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록 한다.

SELECT  student_name "학생 이름", department_no "주소지"
FROM    tb_student
ORDER BY    student_name ASC;



-- 2번
-- 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오

SELECT      STUDENT_NAME , STUDENT_SSN
FROM        tb_student
WHERE       absence_yn = 'Y'
ORDER BY    GET_AGE(STUDENT_SSN);


-- 3번
-- 주소지가 강원도나 경기도인 학생들 중 1900년대 학번을 가진 학생들의 이름과 학번, 주소를 이름의 오름차순으로 
--화면에 출력하시오.
-- 단, 출력헤더에는 "학생이름", "학번", "거주지 주소"가 출력되도록 한다.



SELECT      STUDENT_NAME, STUDENT_NO , STUDENT_ADDRESS
FROM        (SELECT      STUDENT_NAME, STUDENT_NO , STUDENT_ADDRESS
FROM        TB_STUDENT
WHERE       STUDENT_NO      NOT LIKE '%A%')
WHERE       STUDENT_ADDRESS LIKE '%경기%'
OR          STUDENT_ADDRESS LIKE '%강원%'
ORDER BY    STUDENT_NAME;

-- 4번
-- 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오.
-- (법학과의 '학과 코드'는 학과 테이블을 조회해서 찾아 내도록 하자)

SELECT  PROFESSOR_NO , PROFESSOR_NAME, GET_AGE(PROFESSOR_SSN)
FROM    TB_PROFESSOR
WHERE   DEPARTMENT_NO =005
ORDER BY  GET_AGE(PROFESSOR_SSN)DESC ;

SELECT  PROFESSOR_NO , PROFESSOR_NAME, 
                        TO_CHAR(SYSDATE,'YYYY')-
                                        (DECODE (SUBSTR(PROFESSOR_SSN,8,1),1,19,2,19,3,20,4,20, NULL )
                                        ||SUBSTR(PROFESSOR_SSN,1,2)) 나이
                                        
                                        
                                        
FROM    TB_PROFESSOR
WHERE   DEPARTMENT_NO =005
ORDER BY  PROFESSOR_SSN ;


SELECT  DEPARTMENT_NO , DEPARTMENT_NAME
FROM    TB_DEPARTMENT;
-- 5번
-- 2004년 2학기에 'C3118100' 과목을 수강한 학생들의 학점을 조회하려고 한다. 
-- 학점이 높은 학생부터 표시하고,
-- 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해 보시오.

SELECT      STUDENT_NO, TO_CHAR(POINT,99.99)
FROM        TB_GRADE
WHERE       CLASS_NO ='C3118100'
AND         SUBSTR(TERM_NO,1,6)=200402
ORDER BY    POINT DESC, STUDENT_NO;


-- 6번
-- 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL문을 작성하시오.

SELECT      STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM        TB_STUDENT S, TB_DEPARTMENT D
WHERE       S.DEPARTMENT_NO = D.DEPARTMENT_NO
ORDER BY    STUDENT_NAME;



-- 7번
-- 춘 기술대학교의 과목 이름과 과목의 학과 이름을 출력하는 SQL문장을 작성하시오.

SELECT  CLASS_NAME, DEPARTMENT_NAME
FROM  TB_DEPARTMENT D, TB_CLASS C
WHERE   D.DEPARTMENT_NO = C.DEPARTMENT_NO;



-- 8번
-- 과목별 교수 이름을 찾으려고 한다. 과목 이름과 교수 이름을 출력하는 SQL문을 작성하시오.

SELECT      PROFESSOR_NAME, CLASS_NAME, C.CLASS_NO
FROM        TB_CLASS_PROFESSOR C ,TB_PROFESSOR P , TB_CLASS CS
WHERE       P.PROFESSOR_NO = C.PROFESSOR_NO
AND         CS.CLASS_NO = C.CLASS_NO;

SELECT      PROFESSOR_NAME, CLASS_NAME
FROM        TB_CLASS_PROFESSOR CP ,TB_PROFESSOR P , TB_CLASS C
WHERE       P.PROFESSOR_NO = CP.PROFESSOR_NO
GROUP BY    CP.CLASS_NO,PROFESSOR_NAME, CLASS_NAME;

-- 9번
-- 8번의 결과 중 '인문 사회' 계열에 속한 과목의 교수 이름을 찾으려고 한다.
-- 이에 해당하는 과목 이름과 교수 이름을 출력하는 SQL문을 작성하시오.


SELECT      PROFESSOR_NAME, CLASS_NAME, CP.CLASS_NO
FROM        TB_CLASS_PROFESSOR CP ,TB_PROFESSOR P , TB_CLASS C , TB_DEPARTMENT D
WHERE       P.PROFESSOR_NO = CP.PROFESSOR_NO
AND         C.CLASS_NO = CP.CLASS_NO
AND         D.DEPARTMENT_NO = C.DEPARTMENT_NO
AND         CATEGORY LIKE '%인문사회%';

SELECT  CATEGORY
FROM    TB_DEPARTMENT;


                        
-- 10번
-- '음악학과' 학생들의 평점을 구하려고 한다. 
-- 음악학과 학생들의 "학번", "학생 이름", "전체 평점"을 출력하는 SQL 문장을 작성하시오.
-- (단, 평점은 소수점 1자리까지만 반올림하여 표시한다.)



SELECT      FLOOR(AVG(POINT)),S.STUDENT_NO, STUDENT_NAME
FROM        TB_GRADE G,   TB_STUDENT S, TB_DEPARTMENT D
WHERE       G.STUDENT_NO = S.STUDENT_NO
AND         D.DEPARTMENT_NO = S.DEPARTMENT_NO
AND         DEPARTMENT_NAME ='음악학과' 
GROUP BY    S.STUDENT_NO, STUDENT_NAME;

-- 11번
-- 학번이 A313047인 학생이 학교에 나오고 있지 않다. 지도 교수에게 내용을 전달하기 위한 
-- 학과 이름, 학생 이름과 지도 교수 이름이 필요하다.
-- 이때 사용할 SQL문을 작성하시오.

SELECT      DISTINCT STUDENT_NAME, PROFESSOR_NAME, COACH_PROFESSOR_NO
FROM        TB_STUDENT S, TB_PROFESSOR P
WHERE       P.DEPARTMENT_NO = S.DEPARTMENT_NO
AND         STUDENT_NO ='A313047';




-- 12번
-- 2007년도에 '인간관계론' 과목을 수강한 학생을 찾아 
-- 학생이름과 수강학기를 표시하는 SQL 문장을 작성하시오.


SELECT  STUDENT_NAME ,TERM_NO
FROM    TB_CLASS C, TB_GRADE G ,TB_STUDENT S
WHERE   C.CLASS_NO = G.CLASS_NO
AND     S.STUDENT_NO = G.STUDENT_NO
AND     CLASS_NAME = '인간관계론'
AND     SUBSTR(TERM_NO,1,4)= 2007;



-- 13번
-- 예체능 계열 과목 중 과목 담당교수를 한 명도 배정받지 못한 과목을 찾아
-- DEPARTMENT_NO 가 NULL인
-- 그 과목 이름과 학과 이름을 출력하는 SQL 문장을 작성하시오.
-- 결과 행의 수는 동일하나 정렬 기준이 없어 다른 순서를 보임



SELECT *
FROM    TB_PROFESSOR;

SELECT  STUDENT_NAME 학생이름기준잡으면,PROFESSOR_NAME, COACH_PROFESSOR_NO 학생코치넘버기준, P.PROFESSOR_NO 기준아님교수
FROM    TB_STUDENT,  TB_PROFESSOR P
WHERE   COACH_PROFESSOR_NO = P.PROFESSOR_NO (+);

SELECT *
FROM    TB_CLASS_PROFESSOR;

SELECT *
FROM    TB_PROFESSOR;
---------------------------------
SELECT      DEPARTMENT_NAME
FROM        TB_DEPARTMENT D, TB_PROFESSOR P
WHERE       D.DEPARTMENT_NO = P.DEPARTMENT_NO (+)
AND         P.DEPARTMENT_NO IS NULL
AND         CATEGORY = '예체능';

-- 14번
-- 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 한다. 
-- 학생이름과 지도교수 이름을 찾고 만일 지도 교수가 없는 학생일 경우
-- "지도교수 미지정"으로 표시하도록 하는 SQL 문을 작성하시오. 
-- 단 출력헤더는 "학생이름", "지도교수"로 표시하며 고학번 학생이 먼저 표시되도록 한다.

SELECT  *
FROM        TB_DEPARTMENT
WHERE       DEPARTMENT_NAME = '서반아어학과';

SELECT      STUDENT_NAME, NVL (PROFESSOR_NAME , '지도교수 미지정') 지도교수,NVL(COACH_PROFESSOR_NO, '지도교수 미지정') 교수번호
FROM        TB_STUDENT S, TB_PROFESSOR P
WHERE       COACH_PROFESSOR_NO = P.PROFESSOR_NO (+)
AND         S.DEPARTMENT_NO = 020;

    
    
    
-- 15번
-- 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 
-- 그 학생의 학번, 이름, 학과, 이름, 평점을 출력하는 SQL문을 작성하시오.


SELECT      ROUND(AVG(POINT),1)
FROM        TB_GRADE
GROUP BY    STUDENT_NO;

SELECT  G.STUDENT_NO 학번, STUDENT_NAME 성함,DEPARTMENT_NAME 과명, ROUND(AVG(POINT),1) 총학점평균
FROM    TB_STUDENT S, TB_GRADE G, TB_DEPARTMENT D
WHERE   S.STUDENT_NO = G.STUDENT_NO (+)
AND     D.DEPARTMENT_NO = S.DEPARTMENT_NO
AND     ABSENCE_YN = 'N'
GROUP BY    G.STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
HAVING      ROUND(AVG(POINT),1) >= 4.0;



-- 16번
-- 환경조경학과 전공과목들의 과목 별 평점을 파악할 수 있는 SQL 문을 작성하시오.

SELECT      *
FROM        TB_CLASS;

SELECT      *
FROM        TB_DEPARTMENT;

SELECT      G.CLASS_NO, AVG(POINT)
FROM        TB_GRADE G, TB_CLASS C
WHERE       G.CLASS_NO = C.CLASS_NO
AND         DEPARTMENT_NO = 034;

SELECT      DEPARTMENT_NO 학과번호, CLASS_NAME 과목이름, ROUND(AVG(POINT),1) 평균학점
FROM        TB_CLASS C,   TB_GRADE G
WHERE       G.CLASS_NO = C.CLASS_NO
GROUP BY    DEPARTMENT_NO ,CLASS_NAME
HAVING      DEPARTMENT_NO = 034
ORDER BY    평균학점 DESC;


-- 17번
-- 춘 기술대학교에 다니고 있는 최경희 학생과 같은 과 학생들의 이름과 주소를 출력하는 SQL 문을 작성하시오.
                       
SELECT      ROWNUM ,STUDENT_NAME
FROM        TB_STUDENT;
                       
                       
-- 18번
-- 국어국문학과에서 총점수가 가장 높은 학생의 이름과 학번을 표시하는 SQL문을 작성하시오

SELECT      STUDENT_NAME, G.STUDENT_NO , ROUND(AVG(POINT),2) 평균학점
FROM        TB_DEPARTMENT D , TB_STUDENT S, TB_GRADE G
WHERE       D.DEPARTMENT_NO  = S.DEPARTMENT_NO
AND         S.STUDENT_NO  = G.STUDENT_NO
AND         DEPARTMENT_NAME = '국어국문학과'
GROUP BY    G.STUDENT_NO, STUDENT_NAME 
ORDER BY    평균학점 DESC;


-- 19번
-- 춘 기술대학교의 "환경조경학과"가 속한 같은 계열 학과들의 
-- 학과 별 전공과목 평점을 파악하기 위한 적절한 SQL문을 찾아내시오.
-- 단, 출력헤더는 "계열 학과명", "전공평점"으로 표시되도록 하고, 
-- 평점은 소수점 한자리까지만 반올림하여 표시되도록 한다.

SELECT      DEPARTMENT_NAME, ROUND(AVG(POINT),1) "전공평점"
FROM        TB_DEPARTMENT D, TB_CLASS C, TB_GRADE G
WHERE       D.DEPARTMENT_NO (+)= C.DEPARTMENT_NO
AND         G.CLASS_NO(+) = C.CLASS_NO
AND         CATEGORY = '자연과학'
AND         CLASS_TYPE LIKE '%전공%'
GROUP BY    DEPARTMENT_NAME;

-- D _NO 로 묶고
-- HAVING CLASS_TYPE LIKE '%전공%'


SELECT      C.DEPARTMENT_NO
FROM        TB_CLASS C, TB_DEPARTMENT D
WHERE       D.DEPARTMENT_NO = C.DEPARTMENT_NO
AND         CATEGORY = '자연과학'
AND         CLASS_TYPE LIKE '%전공%';

SELECT      *
FROM        TB_CLASS
WHERE       CLASS_TYPE LIKE '%전공%';

SELECT  *
FROM    TB_DEPARTMENT;

--SELECT      D.DEPARTMENT_NO
--FROM        TB_DEPARTMENT D, TB_CLASS C
--WHERE       D.DEPARTMENT_NO = C.DEPARTMENT_NO
--AND         CATEGORY = '자연과학'
--GROUP BY    D.DEPARTMENT_NO;


