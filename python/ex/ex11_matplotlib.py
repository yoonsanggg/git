# 맷플롯립(matplotlib)
# 복잡한 자료는 숫자나 텍스트 보다 그래프나 차트로 
# 데이터를 시각화 하여 이해하고 분석 하는 것이 효과적입니다

# mat   : 매트랩이라는 유명한 수치해석및 데이터 시각화 프로그램
# plot  : 그래프 그리기
# lib   : 라이브러리
# 파이썬에서 그래프 차트 등으로 데이터를 시각화 하는데 편리한 라이브러리 

# pip 환경변수 설정하고 / 업데이트가 필요한 경우도 있음

# 간단한 그래프 그리기
import matplotlib.pyplot as plt
# 한글깨짐 해결
# 맷플롭에서 사용하는 폰트를 한글폰트로 변경
from matplotlib import font_manager, rc
font_name = font_manager.FontProperties(fname="c:/Windows/Fonts/malgun.ttf").get_name()
rc('font', family=font_name) 




fig, ax = plt.subplots()             # Create a figure containing a single Axes.
x = [1,2,3,4]
y = [1,55,911,612]
# color : 선의 색상 , linestyle : 선 모양 , marker : 마커모양
plt.plot(x, y, marker='o', color='red', linestyle ='--')  # Plot some data on the Axes.

x1 =[1,2,3,4]
y1 =[91,296,812,1012]
plt.plot(x1,y1)

# 제목
plt.title("나의 첫 그래프")

# 축제목
plt.xlabel('x축')
plt.xlabel('y축')

# 범례
plt.legend(['그래프1', '내'])
plt.show()                           # Show the figure.