def add(a,smaller): # a,smaller: 매개변수
    print(f"a : {a}")
    print(f"smaller : {smaller}")
    return a+smaller

print(add(1,5))
print("="*50)
# 이름으로 값 넣어줄 수 있음
print(add(a=10,smaller=15)) # 10,15는 인수, 파라미터 : 함수 호출할 때 전달하는 입력값

def print_title():
    print('='*5,"환영합니다")
print_title()
# print로 하면 반환타입이 없기 때문에 none
print(print_title())

# 매개변수 갯수 모를 때 변수명앞에 * 붙여주면 튜플타입으로 받아옴
def add(*arr):
    print(arr)
    print(type(arr))
    sum = 0
    for num in arr:
        sum += num
    return sum

sum1 = add(1,2,2,3)
print(sum1)
def calc(*args):
    res =0
    print(args)
    if len(args) <2 :
        print("2개 이상의 수를 입력해주세요")
        return res
    for num in args :
        res += num
    return res
print(calc(1,2))
print(calc(1,5))
print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
    

def nine(a,b,operator):

    operation = {'+':lambda x, y :x+y
                ,'-' : lambda x,y:x-y 
                ,'/' : lambda x,y : x/y
                ,'*' : lambda x,y : x*y
                ,'%' : lambda x,y : x%y
                }
    bigger = max(a,b)
    smaller =min(a,b)
    if operator in operation:
        return operation[operator](bigger,smaller)
    else:
        return "Error: 연산자 오류임"



def avg(*numbers):
    print("numbers", numbers)
    return sum(numbers)/len(numbers)
    
    
print(avg(1,45,5))
    


print(f"nine(51,59,'%'): {nine(51,59,'%')}")
print(f"(5101,9191,'%') : {nine(5101,9191,'%')}")
print(f"(5101,9191,'+') : {nine(5101,9191,'+')}")
print(f"(5101,9191,'-') : {nine(5101,9191,'-')}")
print(f"(5101,9191,'*') : {nine(5101,9191,'*')}")
print(f"(5101,9191,'/') : {nine(5101,9191,'/')}")


from datetime import datetime
sysdate = datetime.now()
def id(name,id_num):
    id_num = str(id_num).replace("-", "").replace(" ", "")
    if len(id_num) == 13 and id_num.isnumeric():
        birth_centery = {"1":1900,"2":1900,"3":2000,"4":2000}    
        gender = "남자" if id_num[6] in ["1","3"] else "여자"
        birth_year = birth_centery[id_num[6]] + int(id_num[:2])
        birth_month =  int(id_num[2:4])
        birth_day =  int(id_num[4:6])
        age = sysdate.year - birth_year - ((birth_month,birth_day) > (sysdate.month,sysdate.day))
        if age < 0:
            print("[age_Error]잘못된 형식의 주민번호 입니다.")
            return
        print(f"이름:{name} 나이: {age} 성별:{gender}")
    else :
            print("[id_num_Error]잘못된 형식의 주민번호 입니다.")
            return
id('김윤상',9807081111111)

# 그냥 이렇게 부르면 됨
# id()

def gugudan(dan):
        print(f"{dan}단")
        for num in range(1,10):
                print(f"{dan}*{num} = {dan*num}")
                
                
                
import random

def event():
    while True:
        try:
            # 이벤트 참여자 수 입력
            num = int(input("몇명 참여? "))
            
            # 최소 참여자 수는 11명 이상이어야 함
            if num >= 11:
                # 참여자 범위 설정
                sample_range = range(1, num + 1)
                
                # 1등부터 4등까지 11명 무작위로 추첨
                chuchom = random.sample(sample_range, 11)

                # 당첨자 목록을 딕셔너리에 저장
                dung = {
                    "1등": [chuchom[0]],  # 1등은 1명
                    "2등": chuchom[1:3],  # 2등은 2명
                    "3등": chuchom[3:6],  # 3등은 3명
                    "4등": chuchom[6:11]  # 4등은 4명
                }

                # 당첨자 출력
                for 등수, 당첨자 in dung.items():
                    당첨자_목록 = ', '.join(map(str, 당첨자))  # 리스트의 각 당첨자를 문자열로 변환 후, 쉼표로 연결
                    print(f"{등수}: {당첨자_목록}")
                
                break  # 정상적인 실행 후 종료
            else:
                print("인원수가 적습니다. 최소 11명 이상이어야 합니다.")
                continue

        except ValueError:
            print("잘못된 입력입니다. 숫자를 입력해주세요.")
            continue

# 이벤트 함수 실행
event()
