import csv
with open('ex/2023_강수량.csv','r',encoding='utf-8') as file:
    # 구분자로 끊어서 리스트에 담아서 반환
    csv_reader = csv.reader(file, delimiter=",")

    header = next(csv_reader)
    x=[]
    y=[]
    for line in csv_reader :
        x.append(line[0].replace("2023-",""))
        y.append(float(line[2]))
print(x)
print(y)

import matplotlib.pyplot as plt

# 한글 깨짐 해결 - 맑은 고딕 폰트 사용
from matplotlib import font_manager, rc
font_name = font_manager.FontProperties(fname="c:/Windows/Fonts/malgun.ttf").get_name()
rc('font', family=font_name)

plt.plot(x,y,marker='o',linestyle='-',color='#7BC8F6', label="2023강수량")
plt.title("년도별 강수량")
plt.xlabel("월")
plt.ylabel("강수량(mm)")
plt.legend()
plt.show()