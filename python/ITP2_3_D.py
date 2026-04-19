n = int(input())
a = list(map(int, input().split()))
m = int(input())
b = list(map(int, input().split()))

for i in range(min(n,m)):
    if a[i] < b[i]:
        print(1)
        exit()
    elif a[i] > b[i]:
        print(0)
        exit()

if n < m:
    print(1)
else:
    print(0)
