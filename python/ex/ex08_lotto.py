import random

# 원하는 갯수만큼 중복되지 않은 값 추출
# lotto = random.sample(range(1,47),6)
# 정렬도
# print(sorted(lotto))

# 빈 리스트 만들고 무작위수 추출

lotto=[]

# while len(lotto) < 6:
#     num = random.randint(1,47)
#     if num not in lotto :
#         lotto.insert(0,num)

lotto = set()
while len(lotto)<6 :
    num = random.randint(1,47)
    lotto.add(num)

lotto_list = sorted(lotto)
print(lotto)
print(lotto_list)


