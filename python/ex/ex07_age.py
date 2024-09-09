from datetime import datetime

sysdate = datetime.now()
print(sysdate)

while True:
    idNumber = input("주민등록번호 : ").replace('-', '').replace(' ', '')

    if idNumber.isnumeric() and len(idNumber) == 13:
        yearField = {"1": 1900, "2": 1900, "3": 2000, "4": 2000}

        # 출생 연도와 나이 계산
        year = yearField.get(idNumber[6], None)
        if year is None :
            print("[genError]잘못된 성별 코드입니다. 다시 입력해주세요.")
            continue

        birth_year = year + int(idNumber[:2])
        birth_month = int(idNumber[2:4])
        birth_day = int(idNumber[4:6])

        # 출생 연도와 월/일로 나이 계산
        birth_date = datetime(birth_year, birth_month, birth_day)
        age = sysdate.year - birth_date.year - ((sysdate.month, sysdate.day) < (birth_month, birth_day))

        if age <0:
            print("[ageError]나이가 음수입니다. 다시 입력해주세요.")
            continue
            

        # 성별 판별
        gender = "남자" if idNumber[6] in ['1', '3'] else "여자"

        # 결과 출력
        print(f"나이: {age}\n성별: {gender}")

    else:
        print("[idNumberError]잘못된 형식입니다. 다시 입력해주세요.")

    # 입력 완료 후 종료 여부 확인
    yn = input("종료하시겠습니까? (Y/N): ").lower()
    if yn == 'y':
        break

