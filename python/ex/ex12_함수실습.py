import math

print(math.ceil(0.1234))

print("="*60)

def get_total_page(amount,totalCnt):
    endpage = math.ceil(totalCnt/amount)
    return print(f"총 게시물 : {totalCnt},페이지 당 보여줄 게시물 수 {amount} ,끝 페이지 : {endpage}")

get_total_page(10,60)
get_total_page(10,45)
get_total_page(10,1)
get_total_page(10,12)
get_total_page(10,202)
    

def say_my(name,age, man=True):
        print(name)
        print(age)
        if man :
            print("남자")
        else :
            print("여자")

say_my('김윤상',25)

exit()
def gugudan(dan):
    result = []
    for i in range(1,10):
        result.append(dan *i)
        print(dan *i,end=" ")
    return result
    
print(gugudan(2))
    
def plus35 (nn) :
    n = range(1,nn)

def test (end):
    result = 0
    for n in range (1,end):
        if n % 3 == 0 or n% 5 == 0:
            print(n)
            result += n
    return result
print(test(17))
