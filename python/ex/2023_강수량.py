import matplotlib.pyplot as plt

# 한글 깨짐 해결 - 맑은 고딕 폰트 사용
from matplotlib import font_manager, rc
font_name = font_manager.FontProperties(fname="c:/Windows/Fonts/malgun.ttf").get_name()
rc('font', family=font_name)

# 데이터 저장 리스트
x = [] 
y = []  

# CSV 파일 읽기
f = open('ex/2023_강수량.csv', 'r', encoding='utf-8')
title = f.readline()  # 헤더는 무시
while True:
    line = f.readline()
    if not line: 
        break

    # 데이터 분리
    a, b, c = line.split(",")
    x.append(a.replace("2023-", ""))  # 년월에서 '2023-'을 제거하여 월만 사용
    y.append(float(c.replace("\n", "")))  # 강수량을 실수로 변환하여 저장

f.close()

# 그래프 생성
plt.plot(x, y, marker="o", linestyle='-', color='#0f0f0f')
plt.title("2023년 월별 강수량")
plt.xlabel('월')
plt.ylabel('강수량(mm)')

# 범례 추가 (범례는 반드시 label과 연결되어야 함)
plt.legend(['2023 강수량'])

# 그래프 출력
plt.show()
