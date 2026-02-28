def f(a,n):
    maxval = a[0]
    ret = a[1]-a[0]
    for i in range(n-1):
        if a[i] == maxval:
            maxval = max(a[i+1:])
        if maxval - a[i] > ret:
            ret = maxval - a[i]
    return ret

n = int(input())
a = []
for _ in range(n):
    a.append(int(input()))

print(f(a,n))

