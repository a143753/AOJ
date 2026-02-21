def mul(a, b, n, m, l):
    r = [ [0] * l for _ in range(n) ]

    for i in range(n):
        for j in range(l):
            s = 0
            for k in range(m):
                s += a[i][k] * b[k][j]
            r[i][j] = s
    return r

[n,m,l] = list(map(int,input().split()))

a = []
b = []

for _ in range(n):
    a.append( list(map(int, input().split())) )
for _ in range(m):
    b.append( list(map(int, input().split())) )

r = mul(a,b,n,m,l)

for l in r:
    print(" ".join(map(str,l)))
