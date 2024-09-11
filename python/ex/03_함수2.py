
def add(a,b):
    return a+b
print(add(1,2))

add = lambda a,b : a+b
print(add(1,2))

# 리스트 컴프리핸션
a=[1,2,3,4,5,6]
res =[]
# 기존 리스트의 요소 값에 3을 곱한 리스트를 
for i in a:
    res.append(i*3)
print(res)
print(a)
# [반환값 for 변수명 in 반복할 대산 if 조건]
res = [i*3 for i in a if i%2==0]
# for 부터 실행 if 돌고 i*3 ㄱㄱ

print(res)

exit()


# * : 튜플로 값을 받아옴
# ** : 딕셔너리로 받아옴
# 키 - 값  으로 저장되므로 변수 이름이 지정되어 있어야함
from datetime import datetime

sysdate = datetime.now()
def print_k(**kw):
    print(kw)
    return '첫번째 반환'

    return '두번째 반환'

print_k(a=10)
print_k(one=1900)
print_k(nine=5000, go = 261201)


var1 = "함수 밖 변수"
var2 = "함수 밖 변수"

def varTest(var1):
    print("var1:", var1)
    global var2
    var2 = 10
    print("var2 :", var2)

varTest("인수")
print("전역 변수 var1:", var1)  # var1은 전역 변수로 선언
print("전역 변수 var2:", var2)  # var2는 10으로 변경됨

def gogo():
    global var2
    print("gogo 함수 실행 전 var2:", var2)
    var2 = 15
    print("gogo 함수 실행 후 var2:", var2)
    
def gogo1():
    global var2
    print(var2)
    var2 = 20
    print("gogo1:",var2)
print(gogo())    
print(gogo1())    
print(var2)
