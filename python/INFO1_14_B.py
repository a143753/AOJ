input()
a = list(map(int,input().split()))
k = int(input())

flag = True
for i in range(len(a)):
    if k == a[i]:
        print(i)
        flag = False
        break

if flag:
    print(-1)
