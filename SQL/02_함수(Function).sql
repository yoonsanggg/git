--------------------------------------------------

/*
    <함수>
        컬럼값을 읽어서 계산 결과를 반환한다.
          - 단일행 함수 : N개의 값을 읽어서 N개의 결과를 리턴한다. (매 행 함수 실행 -> 결과 반환)
          - 그룹 함수   : N개의 값을 읽어서 1개의 결과를 리턴한다. (하나의 그룹별로 함수 실행 -> 결과 반환)
        SELECT 절에 단일행 함수와 그룹 함수를 함께 사용하지 못한다. (결과 행의 개수가 다르기 때문에)
        함수를 기술할 수 있는 위치는 SELECT, WHERE, ORDER BY, GROUP BY, HAVING 절에 기술할 수 있다.
        (FROM절에는 테이블이름이 기술되므로 사용 할 수 없다)
*/ 
--단일행
/*
    <문자관련 함수>
    1) LENGTH : 글자수를 반환
       LENGTHB : 글자의 바이트수를 반환
       한글은 한글자당 3BYTE(지정된 문자셋에 따라 다를수 있음)
       영어, 숫자, 특수문자 1BYTE
       
*/ 
SELECT LENGTH('나인원')
FROM dual;

select length('오라클'), LENGTHB('오라클')
FROM DUAL;

select sysdate
from dual;

/*
    DUAL 테이블
    - SYS 사용자가 소유하는 테이블
    - SYS 사용자가 소유하지만 모든 사용자가 접근 할 수 있다
    - 하나의 행, 하나의 컬럼을 가지고 있는 더미 테이블이다
    - 사용자가 함수를 계산하거나 오늘 날자를 출력할때 임시로 사용되는 테이블
*/ 

/*
    2) INSTR
        - INSTR(컬럼|'문자값', '문자'[, POSITION[, OCCURRENCE]])
        - 지정한 위치부터 지정된 숫자 번째로 나타나는 문자의 시작 위치를 반환한다.

        position :  양수 - 앞에서 부터
        음수 - 뒤에서 부터
*/ 
-- 첫번째 나오는 B의 위치를 반환
select instr('AABAACAABBAA', 'B') from dual;        
-- 두번째 나오는 B의 위치를 반환
select instr('AABAACAABBAA', 'B',1,2 ) from dual;  
-- 세번째 나오는 B의 위치를 반환
select instr('AABAACAABBAA','B',1,3 ) from dual;  
-- 뒤에서 부터 첫번째로 나오는 나오는 B 위치(위치는 앞에서부터 넘버링)를 반환
select instr('AABAACAABBAA','B',-1) from dual;  
select instr('AABAACAABBAA','A',-1,7 ) from dual;  
-- 문자열이 없는 경우 0 을 반환
select instr('AABAACAABBAA','k' ) from dual;  

SELECT INSTR (SALARY,'5')
FROM    EMP;
--주민등록번호의 - 위치
SELECT instr(EMP_NO,'-')
from emp;


--이메일 @의 위치

SELECT instr(email,'@')
from emp;

/*
    3) SUBSTR
        - SUBSTR(컬럼|'문자값', POSITION[, LENGTH])
        - 문자데이터에서 지정한 위치부터 지정한 개수만큼의 문자열을 추출해서 반환한다.
*/ 

--SUBSTR (컬럼명, 시작위치, 글자수)
select substr('show me the money', 7)
from dual;

SELECT SUBSTR('나인원 한남 104동 803호',-16,6 )
from dual;

select substr('show me the money',5,2)
from dual;
select substr('show me the money',-9,3)
from dual;
select substr('쇼우 미 더 머니',0,2)
FROM dual;
--여기선 1부터 시작 0 부터 시작해도 똑같긴함 ㅇㅇ

-- 사원테이블의 이메일 컬럼에서 이메일 아이디와 도메인 추출을 추출 해보세요



SELECT     SUBSTR (EMAIL, INSTR(EMAIL,'@')+1), SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) 
FROM        EMP;


SELECT SUBSTR(EMAIL,INSTR(EMAIL,'@')+1) 도메인, SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) 아이디
from emp;




--sun_di@or.kr
--   ->  아이디@도메인
-- 1) INSTR함수를 이용해서 @의 위치를 확인
-- 2) SUBSTR함수를 이용해서 문자열을 추출(시작위치, 문자의 갯수) 

SELECT EMAIL, INSTR(EMAIL,'@'), instr(EMAIL,'@')-1
from emp;
--@ 있는지 확인하고

--처음부터 골뱅이의 위치까지
SELECT SUBSTR(EMAIL,1 ,INSTR(EMAIL,'@')-1)
from emp;
--아이디 골뱅이 빼고싶으면 -1 
--그냥 외우지말고 이해
SELECT SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1)
from emp;
--도메인 위치
SELECT SUBSTR(EMAIL,INSTR(EMAIL,'@')+1)
from emp;
--사원테이블의 주민등록번호 뒷번호 1번째까지 추출
SELECT substr(EMP_NO,1,instr(EMP_NO,'-')+1)
from emp;


-- 사원테이블에서 여자사원의 모든컬럼을 조회 하세요

SELECT        SUBSTR (EMP_NO,INSTR(EMP_NO,'-')+1,3)
FROM            EMP;












SELECT  *
FROM EMP
where substr(emp_no,instr(EMP_NO,'-')+1,1) in (2,4);

-- 부서테이블에서 부서코드가 D1, D2, D3인 부서만 조회 하세요
SELECT DEPT_ID, INSTR('D1|D2|D3',DEPT_ID)
FROM DEPT
/*WHERE DEPT_ID = 'D1'
OR DEPT_ID= 'D2'
OR DEPT_ID= 'D3';*/

--WHERE DEPT_ID IN ('D1','D2','D3');

--이거 이해하기
WHERE INSTR('D1|D2|D3',DEPT_ID) >0;

--근까 이게 D1,D2,D3 얘네만 조건에 넣어놓고 조회되게 하면 되니까
--조건절에다가 INSRT- 이건 숫자 반환하고
-- DEPT_ID가 갖고있는 d1 d2 d3 인식해서
--그냥 d1이 첫번째, d2가 4번째로 시작, d3이 7번째로 시작
-- 1 4 7 반환하니까 0보다 크게 하면 세개만 반환함 ㅇㅈ?

/*
    4) LPAD/RPAD
    - LPAD/RPAD(값, 길이[,'덧붙이려고 하는 문자'])
    - 제시된 값에 임의의 문자를 왼쪽 또는 오른쪽에 
        붙여 최종 N길이 만큼 문자열을 반환 한다.
    - 문자를 통일감있게 표시하고자 할때 사용
*/

--20만큼의 길이중  EMAIL 은 오른쪽으로 정렬하고 공백을 왼쪽으로 채운다.


--왼쪽을 공백으로 채워줌
SELECT RPAD(EMAIL,16,'*') 
from emp;

--오른쪽을 공백으로 채워줌
SELECT RPAD(email,20,'*')
from emp;

-- 길이가 짧으면 지정된 자릿수 만큼만 출력 (잘려나온다)
SELECT lpad(email,2,'*')
from emp;
--지정한 문자로 공백 채워줄 수 있음
select  email, lpad(email, 20, '*'), rpad(email, 20, '$'), rpad(email, 2)
FROM    emp;

--사원 테이블에서 주민등록번호의 뒤 1자리까지 추출하고 오른쪽에 *문자를 채워서 출력
SELECT rpad(SUBSTR(emp_no,1,INSTR(emp_no,'-')+1),14,'*')
from emp;


-- 위에 이것도 되긴함 SELECT RPAD(SUBSTR(EMP_NO,1,8),14,'*') 

/*
    제품 번호 추출해서 누가 관리하는지, 어디서 만드는지 다 알 수 있으니,,
*/


/*
    5) LOWER / UPPER / INITCAP
    - LOWER|UPPER|INITCAP (컬럼|'문자값')
     LOWER : 모두 소문자로 변경
     UPPER : 모두 대문자로 변경
     INITCAP : 단어 앞 글자마다 대문자로 변경
*/ 

SELECT LOWER('YONGSAN-GU'), UPPER('gogosing'),INITCAP('gogo ' || 'gogo'|| ' gigi')
FROM DUAL;
/*
    6) CONCAT
    - CONCAT(컬럼|'문자열', 컬럼|'문자열')   ==   ||
    - 문자데이터 두개를 전달 받아서 하나로 합친후 결과를 반환
*/ 
--인수는 2개만 넣어줄 수 있다.ALTER
-- 3개이상 넣을경우 부적합함. 오류발생
SELECT CONCAT('ferri', ' 296gts')
FROM dual;
--이거 어차피 || 랑 기능 똑같아서 보통 || 씀

/*
    7) REPLACE : 치환, 바꾸기
    - REPLACE(컬럼|'문자값', 변경하려는 문자, 변경하고자 하는 문자)
    - 컬럼, 문자값에서 변경하고자 하는 문자를 변경하려는 문자로 변경하여 반환
*/ 
--(바꿀대상, 바꿀 글자 , 뭘로바꿈?)
SELECT REPLACE('서울시 용산구 한남동','한남동','한남대로91')
FROM DUAL;


--*****데이터를 진짜 변경하는게 아니라 변경해서 조회(RESULT SET)만 함****
--쿼리는 대소문자 구분 ㄴㄴ연
SELECT EMP_NAME 사원명, EMAIL "기존 이메일" ,REPLACE(EMAIL,'or.kr','gmail.com') "변경 후 이메일"
FROM EMP;
SELECT * FROM EMP;
----------------------------데이터에서 대소문자를 구분하지 않고 다 바꾸려면 어쩌지 그냥 두번 해야하나
-----------------------------ANSWER : 아까 쓴 대소문자로 싹 바꾸는걸로 바꿔서 비교함 굿



