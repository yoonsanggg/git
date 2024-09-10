import random

lotto = set()
while len(lotto) <6:
    num = random.randint(1,47)
    lotto.add(num)
    lotto_list = sorted(lotto)

print(lotto_list)
