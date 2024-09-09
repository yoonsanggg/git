# 두 수를 입력받고 사칙연산의 결과를 출력 해봅시다.



input_str1 = "ABCDEFG///hijklnmop"
# 대소문자 변환 = 비교시 사용
print(input_str1.upper())
print(input_str1.lower())
# 바꿔서 출력만 해주는거임 , let 선언한거 값 안바뀌는거랑 비슷
print(input_str1)

input_str1 = input_str1.upper()
print("대문자로 바뀐놈:",input_str1)
input_str1 = input_str1.lower()
print("소문자로 바뀐놈:",input_str1)
input_str1='       안녕       '
# 대소문자
print(input_str1.strip())
print(input_str1.lstrip())
print(input_str1.rstrip())
# replace
input_str1 = "999999-1111111"
print(input_str1.replace("-",""))
print(input_str1.replace("1","2"))

# split("끊을 문자") - list type
print(input_str1.split("9",2))
# ㅇ문자열을 원하는 문자로 끊어서 리스트로 반환
input_str1 = 'a,b,c,d'
print(input_str1.split(","))
input_str1 = '안녕하세요\n반갑습니다'
print(input_str1.split("\n"))


num = input("주민등록번호를 입력하세요")
# while num :
#     if num.isnumeric() != False:
#         if len(num)== 13:
#             pass
#             maleFemale = int(num.find(num[6]))
#             if maleFemale == 1 or maleFemale ==3:
#                 print("남자입니다.")
#             elif maleFemale ==2 or maleFemale ==4:
#                 print("여자입니다,")
#             continue
#         else : print("13자리로 입력해주세요")
            
        
#     else : print (f"{num} 은 올바르지 않은 형식입니다. 숫자만 입력 가능합니다")
        
# not은 부정 연산자
print(type(num))
print(num.isnumeric())
if num.isnumeric():
    num.strip()
    if len(num)==13:
        check = num[6]
        print(f"성별 판별 : {check}")
        yyyy=2024
        yy= num.split
            
        if check =='1' or check =='3':
            print("남자임")
        elif check =='2' or check =='4':
            print("여자임")
            # 나이 구하기
            

    else :
        print("13자리 숫자만 입력가능")
    # exit
    # continue
    # break
    # return



exit()

input_str1 = '안녕하세요'
input_str2 = '반갑습니다'

# :< 왼쪽정렬 , :> 오른쪽 정렬, :^ 가운데 정렬
print(f"{input_str1:<10} 음 {input_str2:^30}===")
# 빈 공간에 = 채우는법 물론 다른 숫자나 특수문자도 가능해보임
print(f"{input_str1:<10} 음 {input_str2:=^30}===")
print(f"{"input_str1":<30} 음 {"input_str2":^30}===")

# 문자열 관련 함수
# 문자 갯수 세기
input_str1 = '하하호호하하히히하하호호후후하하히헤헤ㅣ하허혀허호후흐히'
res = print(input_str1.count('하'))
# 이건 그냥 사용하는게 더 간단한듯 Join
res1= print(",".join(input_str1))
res2=print(f"{".".join(input_str1)}")
print(type(res))
# 없으면 -1 반환
print(input_str1.find("호"))
print(input_str1.index("호"))


print('{0:>10}'.format('==안녕=='))
print('{0:<10}'.format('==안녕=='))
print('{0:^10}'.format('==안녕=='))


print("문자열 길이 : " , len("문자열 길이"))

# 인덱스로 넣어야함
print("문자1 : {0}".format(input_str1))
print("문자1 : {0}, 문자 2: {1}".format(input_str1, input_str2))
print("숫자 : {0}".format(20))



exit()
# a + b = c
# 최대값과 최소값 출력

a = int(input("a숫자를 입력해주세요 : "))
b = int(input("b숫자를 입력해주세요 : "))

print(type(a))
# 숫자로 연산하기 위해 형 변환이 필요
print(f"{a}+{b} = {a+b}")
print(f"{a}-{b} = {a-b}")
print(f"{a}*{b} = {a*b}")
print(f"{a}%{b} = {a%b}")
print(f"{a}/{b} = {a/b}")
print(f"최대값 : {max(a,b)} 최소값 : {min(a,b)}")
 
exit()

print("=====================")
items=['람보르기니','페라리','초코파이']
prices = [5200,6600,7900]
# 인덱스랑 아이템을 함께 꺼내올 수 있음
# index 값을 가져오기 위해서 enumerate
for i, item in enumerate(items, start=1) :
    print(f"{i} : {item}")
menu = int(input('원하는 물건의 번호를 선택해주세요'))
price = prices[menu-1]
print(f"선택하신 메뉴의 가격은 : {price}")
money = int(input('입금 : '))
change = money - price
print(f"잔돈:{change}")
# 나누기 두번 - 정수로 반환하죠?

# 500원 갯수
coin500_cnt = change//500
# 거슬러주고 남은돈
change = change%500
# 100원 갯수
coin100_cnt = change//100

print(f"500원 : {coin500_cnt}개, 100원 : {coin100_cnt}개")


