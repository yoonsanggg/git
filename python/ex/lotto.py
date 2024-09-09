# 임의의 수를 추출
# 0~9까지
import random

def generate_lotto():
    lotto_numbers = set()
    while len(lotto_numbers) < 6:
        lotto_numbers.add(random.randint(1,45))
    return sorted(lotto_numbers)