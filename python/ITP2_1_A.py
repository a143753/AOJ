q = int(input())
a = []
for _ in range(q):
    l = list(map(int, input().split()))

    if   l[0] == 0:
        a.append(l[1])
    elif l[0] == 1:
        print(a[l[1]])
    elif l[0] == 2:
        del(a[-1])
