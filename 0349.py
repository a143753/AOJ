n = int(input())
d = list(map(int,input().split()))
c = [False for _ in range(n)]

for i in range(n):

    if c[i]:
        continue

    j = i
    t = [False for _ in range(n)]
    while True:
        if t[j]:
            break
        else:
            t[j] = True
            j = (j + d[j]) % n

    if i == j:
        for j in range(n):
            c[j] = c[j] | t[j]
    else:
        c[j] = True

sum = 0
for i in range(n):
    if c[i]:
        sum += 1
print(sum)

