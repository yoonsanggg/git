menu = []

for i in range(4):
    while True:
        new_menu = input("메뉴를 입력하세요: ")
        if new_menu in menu:
            print(f"{menu.index(new_menu) + 1}번째 메뉴와 중복됩니다. 다시 입력해주세요.")
        else:
            menu.append(new_menu)
            break

# 리스트의 요소들을 쉼표로 구분하여 한 행으로 출력
go = ", ".join(menu)
print(go)
