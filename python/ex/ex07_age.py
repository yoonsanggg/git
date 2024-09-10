from datetime import datetime

sysday= datetime.now()

id_num = input("주민등록번호:").replace("-","").replace(" ","")

if len(id_num)==13 and id_num.isnumeric():
    centry = {"1":1900,"2":1900,"3":2000,"4":2000}
    birth_year = centry[id_num[6]] + int(id_num[:2])
    print(birth_year)
    birth_month = int(id_num[2:4])
    birth_day = int(id_num[4:6])
    print(((sysday.month,sysday.day)<(birth_month,birth_day)))
    print((birth_month,birth_day))
    
    age = sysday.year - birth_year - ((sysday.month,sysday.day) < (birth_month,birth_day))

    gender = "남자" if id_num[6] in ["1","3"] else "여자"
    
    print(f"나이:{age} 성별:{gender}")