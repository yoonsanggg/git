res = ''
if res:
    print("참인 경우에만 실행합니다")
elif not True :
    # !대신 not으로 사용
    print("조건이 여러개인경우")
else :
    print("거짓일 경우에만 실행됩니다.")
    
    #조건부 표현식 (삼항연산자)
    message = True
    message = '참일 때 넣을값' if message==True else "그짓말"
    print (message)
    
while True :
    print('무한반복')
    if True :
        break
i=0
while i<10 :
    i += 1
    print('i:%d' %i)
    while True:
            msg ="""
            도서관에 오신걸 환영합니다.
            1. 도서대여
            2. 도서반납
            3. 도서등록
            4. 도서삭제
            5. 종료
            
            """
            print(msg)
            menu = int(input("메뉴를 선택해 주세요\n"))
            if menu ==1:
                print("도서 대여를 선택하셨습니다.")
            elif menu==2:
                print("도서 반납을 선택하셨습니다.")
            elif menu==3:
                print("도서 등록을 선택하셨습니다.")
            elif menu==4:
                print("도서 삭제를 선택하셨ㅅ브니다.")
            elif menu==5:
                print("종료합니다.")
                break
            else:
                print("올바르지 않은 번호입니다.")

index=0
while index<10:
    index += 1
    # 홀수인 경우 더 이상 실행하지마
    if index%2 !=0:
        continue
    print(index)
