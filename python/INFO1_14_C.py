input()
a = list(map(int,input().split()))
q = int(input())

for _ in range(q):
    k = int(input())
    if k in a:
        print("Yes")
    else:
        print("No")
