import matplotlib.pyplot as plt
import csv
from collections import defaultdict

# 한글 깨짐 해결 - 맑은 고딕 폰트 사용
from matplotlib import font_manager, rc
font_name = font_manager.FontProperties(fname="c:/Windows/Fonts/malgun.ttf").get_name()
rc('font', family=font_name)

# CSV 데이터 읽기
data_by_year = defaultdict(list)

with open('python\ex\연도별강수량.csv', 'r', encoding='utf-8') as file:
    csv_reader = csv.reader(file)
    header = next(csv_reader)  # 첫 번째 줄(헤더) 건너뛰기

    for line in csv_reader:
        year_month, location, rainfall = line
        year, month = year_month.split("-")
        
        # 연도별 데이터 저장
        data_by_year[year].append({
            "월": int(month),           # 월을 숫자로 저장
            "강수량": float(rainfall)   # 강수량을 실수로 저장
        })

# 그래프 생성 (하나의 그래프에 모든 연도 데이터를 표시)
plt.figure(figsize=(10, 6))

# 연도별로 데이터를 한 그래프에 표시
for year, data in data_by_year.items():
    # 월별 강수량 데이터를 월을 기준으로 정렬
    data_sorted = sorted(data, key=lambda x: x["월"])
    
    # X축: 월, Y축: 강수량
    months = [entry["월"] for entry in data_sorted]
    rainfalls = [entry["강수량"] for entry in data_sorted]

    # 한 그래프에 모든 연도 데이터 추가 (연도별 다른 선)
    plt.plot(months, rainfalls, marker='o', linestyle='-', label=f"{year}년")

# 그래프 설정
plt.title("2018~2023년 월별 강수량")
plt.xlabel("월")
plt.ylabel("강수량(mm)")
plt.xticks(range(1, 13))  # X축을 1월~12월로 설정
plt.legend()  # 범례 추가 (연도별 표시)
plt.grid(True)  # 그리드 추가

# 그래프 출력
plt.tight_layout()
plt.show()
