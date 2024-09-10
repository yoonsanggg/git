import sys
print(bool(''))
print(bool([]))
print(bool(()))
print(bool({}))
print(bool(0))
print(bool(1))

q = [1,2]
d = q

print(id(q))
print(id(d))
q[0] = 99999
print(d)
print(q is d)

q, d=['name','age']
dic = {'go':'nineone'}
# 
print(dic.get('ni','gigigi'))
print(dic)
sys.exit()




# list=[] 요소 값 생성/ 수정/ 삭제/ 삽입
# tuple=() 요소값 변경 불가능, 값 하나면 ,
t1 = ()
t2 = (1,)
print(t2)
# 소괄호 생략 가능
t3 = 1,2,3
t3 = 1,2,3,('a','b'),[1,'a']
print(t3)
print(t3[0:])
print("================",len(t3),"=================")
print(t3)
l1 =[1,]
l2 ='980708'
print(int(l2[:2]))


a={1:'a'}
# []이걸로, 키값에 접근
print(a[1])
a['키']='벨류'
print(a['키'])
print(a[1])
# 중복 안됨, 덮어쓰기됨
a['키']='벨류'
a['키1']='벨류1'
# .keys 통해서 벨류 값 다 가져올 수 있음
print(a.keys())
for k in a:
    print(k,"============")
# list() 붙이면 리스트 처럼 형변환 가능 - 리스트가 갖고 있는 여러 함수도 사용 가능
print(list(a.keys()))
lista = list(a.keys())
for k in lista:
    print(k,"============")


print(f"벨류 : {a.values()}")
print(f"아이템 : {a.items()}")

p = {'name':'김윤상','home':'91'}
# 키값 있는지 확인 하는 법 True 반환
print('name' in p)
# 키 값 없으면 오류남
print(p['name'])
print(p.get("gender"))
print(p.get("name"),"이름만 반환")
print(p.get("name","home"),"===========")
print(int(True))
print(int(False))
# 비어있으면 False , 존재하면 True
print("비어있는지 체크 : ",bool())
print("비어있는지 체크 : ",bool(p['home']))
p['home'] =''
# 이러면 False 를 반환합니다.
print("비어있는지 체크 : ",bool(p['home']))




a.clear()