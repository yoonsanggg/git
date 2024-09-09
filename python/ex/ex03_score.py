while True:
    try:
        name = input("이름:")
        kor = float(input("국어 성적을 입력하세요:"))
        eng = float(input("영어 성적을 입력하세요:"))
        math = float(input("수학 성적을 입력하세요:"))
        # //:나눗셈 후 정수

        avg = (kor+eng+math)/3
        if avg >100:
            print("평균점수는 %.2f입니다. 입력 오류로 재시작 됩니다." %(avg))    
            continue


        print("%s의 평균 점수는: %.2f점 입니다." %(name,avg))

        if avg >= 90:
            print("A학점")
        elif avg >= 80:
            print("B학점") 
        elif avg >=70:
            print("C학점") 
        elif avg >=60:
            print("D학점") 
        elif avg <60:
            print("F학점") 
        
    except ValueError:
        break

