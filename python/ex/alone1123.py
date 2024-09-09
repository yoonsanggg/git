from datetime import datetime

sysdate = datetime.now()
while True:
    idNum = input("주민등록번호:").replace('-','').replace(' ','')
    if idNum.isnumeric() and len(idNum) ==13:
        if idNum[6] in ['1','2','3','4']:
            yearWhen= {'1':1900,'2':1900,'3':2000,'4':2000}
            birthYear = yearWhen[idNum[6]]+int(idNum[:2])
            birthMonth = int(idNum[2:4])
            birthDay = int(idNum[4:6])

            age = sysdate.year - birthYear - ((sysdate.month,sysdate.day)<(birthMonth,birthDay))
            if age<0:
                print("[ageError] 나이 형식 오류입니다.")
                continue    
            gender = "남자" if idNum[6] in ['1','3'] else "여자"
            print(f"나이 : {age} 성별 : {gender}")

        else:
            print("잘못된 형식입니다. 다시 입력해주세요")
    else:
        print("잘못된 형식입니다. 다시 입력해주세요")
    
    yn = input("종료하시려면(Y)").upper
    if yn=='Y':
        print("이용해주셔서 감사합니다.")
        break
    
    
    
    
     


