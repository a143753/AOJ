_ = int(input())
a = list(map(int, input().split()))
q = int(input())

for _ in range(q):
    [b,e,k] = list(map(int, input().split()))

    s = 0
    for i in range(b,e):
        if a[i] == k:
            s += 1
    print(s)
