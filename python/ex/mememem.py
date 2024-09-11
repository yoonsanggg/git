import pandas as pd
import matplotlib.pyplot as plt
from collections import defaultdict

data_by_year = defaultdict(list)

file_path = 'python/ex/연도별강수량.csv'

data = pd.read_csv(file_path)
print(data)





# import pandas as pd
# import matplotlib.pyplot as plt
# from collections import defaultdict

# # 데이터 저장 딕셔너리 (연도별로 데이터를 저장)
# data_by_year = defaultdict(list)

# # CSV 파일 읽기
# file_path = 'python/ex/연도별강수량.csv'  # 파일 경로
# data = pd.read_csv(file_path)

# # 연도와 월을 분리
# data[['연도', '월']] = data['년월'].str.split('-', expand=True)

# # 그래프 생성
# plt.figure(figsize=(10, 6))

# # 연도별로 데이터를 추가하고 그래프 그리기
# for year in data['연도'].unique():
#     year_data = data[data['연도'] == year]
#     plt.plot(year_data['월'].astype(int), year_data['강수량(mm)'], marker='o', label=f"{year}년")

# # 그래프 설정
# plt.title("연도별 월별 강수량")
# plt.xlabel("월")
# plt.ylabel("강수량 (mm)")
# plt.xticks(range(1, 13))  # X축은 1월~12월로 설정
# plt.legend(title="연도")  # 범례 추가
# plt.grid(True)

# # 그래프 출력
# plt.tight_layout()
# plt.show()
