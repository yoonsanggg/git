f = open("D:\새파일\새파일.txt",'r',encoding="utf-8")

while True:
    line = f.readline()
    print(line)
    # 비어있으면 반복문 탈출
    if not line : break


f.close()
f= open('D:\새파일\새파일.txt','r', encoding='utf-8')
lines = f.readlines()
print(lines)
# 요소에 있는 값을 읽어와서 출력하기 때문에
# 줄바꿈 된 상태로 출력
for line in lines :
    # 근데 프린트에서 줄바꿈 한번 더 해주니까
    # end로 빼줄 수 있음
    print(line, end='')
f.close()


print("="*40)


f= open('D:\새파일\새파일.txt','r', encoding='utf-8')
print(f.read())

f.close()

f= open('D:\새파일\새파일.txt','r', encoding='utf-8')
for line in f :
    print("=====for문",line)
f.close()

# with 문은 파일을 열고 닫는것을 자동으로 처리해줌
with open('D:\새파일\새파일.txt','w', encoding='utf-8') as f :
    f.write("새로운 시작")
    