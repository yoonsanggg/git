index =1
sum=0
while index <=100:
    
    index += 1
    sum += index
    
    print("sum : %d" %sum)
print("="*40)

index=0
sum=0

while index<=100:
    index += 1
    if index % 2 != 0:
        continue
    print(index)
    sum += index
    print("sum: %d" %sum)
    
        