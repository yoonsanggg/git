
def add(a,b):
    return a+b
print(add(1,2))

add = lambda a,b : a+b
print(add(1,2))

# 리스트 컴프리핸션



exit()


import random

lotto = set()
while len(lotto) <6:
    num = random.randint(1,47)
    lotto.add(num)
    lotto_list = sorted(lotto)

print(lotto_list)

lotto = set()
while len(lotto)<6:
    random_num = random.randint(1,47)
    lotto.add(random_num)
sorted(lotto)
