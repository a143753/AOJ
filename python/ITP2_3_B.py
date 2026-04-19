_ = int(input())
a = list(map(int, input().split()))
q = int(input())

for _ in range(q):
    k = list(map(int, input().split()))
    if k[0] == 0:
        print(min(a[k[1]:k[2]]))
    if k[0] == 1:
        print(max(a[k[1]:k[2]]))
