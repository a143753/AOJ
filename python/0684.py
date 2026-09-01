def ans(a, b):
    i = 0
    j = 0
    res = []
    while i < len(a) and j < len(b):
        if a[i] == b[j]:
            res.append(a[i])
            i += 1
            j += 1
        elif a[i] < b[j]:
            i += 1
        else:
            j += 1
    return res

input()
a = sorted(set(map(int, input().split())))
b = sorted(set(map(int, input().split())))

c = ans(a, b)

for i in c:
    print(i)
