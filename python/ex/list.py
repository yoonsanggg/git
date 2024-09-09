# 리스트
# 자료형의 집합을 표현할 수 있는 자료형

list = [1,2,3,4,5,6]
list = [1, 'list1문자열' , [1,2,3,4,5]] 
print(list[-1])
print(f"list 배열의 값은 : {list}")
print(f"list 배열의 값은 : {(int)(list[0])}")
print(f"list 배열의 값은 : {(str)(list[0])}")

list = [1,2,3,[1,2,3,4,5]]
# 5 꺼내는법
print (list [-1][-1])

list = [1,2,3,4,5]
list[0:2]

a=[1,2,3]
b=[4,5,6]
a+b

len(a) #길이 구하는 함수
a[0]='일'
a[1]='2'
del a[0]
# 앞에 두개 제외하고 삭제
del a[2:]
# 맨 뒤에 붙이기
a.append('삼')
a.append('사')
a.append(['오육칠'])
# 정렬
a=[1,4,5,2,3,6,8,7]
a
a.sort()
a=['가','다','나']
a=['그','느','드','흐','스']
a.sort()
# 한글도 정렬됨 ㄷㄷ
