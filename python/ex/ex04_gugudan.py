i_range = range(1, 10)
dan_range = range(2, 10)

for dan in dan_range:  # dan_range 안에서 각 단을 꺼냄
    print(f'{dan}단')
    for i in i_range:  # i_range 안에서 각 곱할 값을 꺼냄
        print(f"{dan} * {i} = {dan * i}")


print("="*40)
print("홀수단 시작")

i_range = range(1, 10)
dan_range = range(2, 10)

for dan in dan_range:
        if dan%2==0:
            # 응 2로 나눈 나머지가 0이면 무시할게~
            continue
        print(f"{dan}단")
        for i in i_range:
            print(f"{dan}*{i}={dan*i}")
            
print("="*50)
print("짝수단 시작")
i_range = range(1,10)
dan_range = range(2,10)

for dan in dan_range :
    if dan % 2 ==1:
        continue
    print(f"{dan}단")
    for i in i_range :
        print (f"{dan}*{i}={dan*i}")




