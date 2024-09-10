import locale
from datetime import datetime, timedelta
locale.setlocale(locale.LC_TIME, 'Korean_Korea')
sysday = datetime.now()

# 날짜 형식 지정
sysday.strftime(f"{sysday}-%Y-%M-%D(%A) %H:%M:%S")
dday=datetime(2026, 12, 1)
ddif = dday - sysday

print(ddif)

# timedelta - 날짜에 추가
return_day = timedelta(days=7)
input_day = 
user_return = input_day+return_day




