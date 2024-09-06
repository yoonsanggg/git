# menu = [10000,2000,4000,5500]
# menuList = print("""
#                         메뉴판
#                 1. 오렌지(10000원)
#                 2. 족발(2000원)
#                 3. 바나나(4000원)
#                 4. 물(5500원)
#                  """)
# chooseMenu = int(input("메뉴를 선택해주세요"))

items=['람보르기니','페라리','초코파이']
prices = [5200,6600,7900]
# 인덱스랑 아이템을 함께 꺼내올 수 있음
# index 값을 가져오기 위해서 enumerate
for i, item in enumerate(items, start=1) :
    print(f"{i} : {item}")
menu = int(input('원하는 물건의 번호를 선택해주세요'))
price = prices[menu-1]
print(f"선택하신 메뉴의 가격은 : {price}")
money = int(input('입금 : '))
change = money - price
print(f"잔돈:{change}")
# 나누기 두번 - 정수로 반환하죠?

# 500원 갯수
coin500_cnt = change//500
# 거슬러주고 남은돈
change = change%500
# 100원 갯수
coin100_cnt = change//100

print(f"500원 : {coin500_cnt}개, 100원 : {coin100_cnt}개")
    

