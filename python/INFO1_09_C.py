n = int(input())
a = [0]*n
q = int(input())

for _ in range(q):
    k = int(input())
    a[k] += 1

for i in range(n):
    print(a[i])
