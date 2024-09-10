q = [1,2]
d = q

print(id(q))
print(id(d))
q[0] = 99999
print(d)
print(q is d)

q, d=['name','age']
