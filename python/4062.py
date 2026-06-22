[n,m] = list(map(int, input().split()))

s = 0
for i in range(n):
    t = list(map(int, input().split()))
    m = max(t)
    s += m
print(s)

