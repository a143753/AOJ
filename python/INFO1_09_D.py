n = int(input())
a = [0]*n
q = int(input())

for _ in range(q):
    l = int(input())
    r = int(input())
    for i in range(l,r+1):
        a[i] += 1

for i in range(n):
    print(a[i])
