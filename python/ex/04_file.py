
# open(파일명,모드)
# 담아서 쓰기
# encoding 은 선택
# w - 덮어쓰기
# 계속 실행해도 중복 안됨, 덮어쓰잖슴~
f = open("D:\새파일\새파일.txt",'w')

f.write('안녕하세요\n')
f.write('반가워요\n')

for i in range(1,20) :
    f.write(f"{i}번째 줄 값\n")
print(i)

# 읽기전용
# a - 이어쓰기 
f = open("D:\새파일\새파일.txt",'a')
f.write('안녕하세요\n')

f.close()