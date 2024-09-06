# 두 수를 입력받고 두 수의 합을 출력하는 프로그램을 작성
# 출력양식 : 입력값1 + 입력값2 = 입력값1+ 입력값2

# num1= float(input("첫번째 실수를 입력하세요: "))
# num2= float(input("두번째 실수를 입력하세요: "))

# print(num1,'+', num2 ,'=', num1+num2)

# # printf랑 똑같이 사용됨
# # %d : 정수 $f: 실수 $s : 문자열
# print("%d + %d = %d" %(num1,num2,num1+num2))
while True:

    try:
        height= float(input("키를 입력하세요(종료하려면 문자를 입력하세요): "))
        weight= float(input("몸무게를 입력하세요: "))

        if height>= 100:
            height = height/100
        bmi = weight/(height*height)
        print("당신의 bmi는:",bmi)

        if bmi >=35:
            print("고도비만 입니다.")
        elif  30<=bmi<=34.9:
            print("중등도 비만 입니다")
        elif  25<=bmi<=29.9:
            print("경도 비만 입니다")
        elif  23<=bmi<=24.9:
            print("과체중 입니다")
        elif  18.5<=bmi<=22.9:
            print("정상체중 입니다")
        elif  bmi<18.5:
            print("저체중 입니다")
        next = ''
        
        while next.lower() not in ['y','n']:
            next = input('계속 하시겠습니까??(y/n)')

        print('next', next)
        if next.lower() != 'y' :
            print('lower', next.lower())
            break
        if next == 'y' or next =='Y':
            print('y')
            continue #다음 반복으로 넘어감
        else :
            print('n')
            break #반복문을 탈출함
        
    except ValueError:
        print("숫자가 아닌 값이 입력되어 프로그램을 종료합니다.")
        break
    
    
treeHit = 0
while treeHit <10:
    treeHit= treeHit+1
    print("나무를 %d번 찍었습니다." %(treeHit))
    if treeHit ==10:
        print("나무가 넘어갑,,")
        