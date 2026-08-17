[n,q] = map(int,input().split())

fs = []
for _ in range(n):
    ab = list(map(int,input().split()))
    fs.append(ab)

for _ in range(q):
    [l,r,p] = map(int,input().split())
    ys = []
    for i in range(l-1,r):
        ys.append( fs[i][0] * p + fs[i][1] )
    print(min(ys))
