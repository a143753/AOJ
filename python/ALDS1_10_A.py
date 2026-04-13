n = int(input())

a = [1,1]
for i in range(n-1):
    a.append(a[i]+a[i+1])

print(a[n])    
