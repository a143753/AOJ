[n,m] = list(map(int,input().split()))

t = []
for _ in range(n):
    l = list(map(int,input().split()))
    t.append(l)

[i1,j1] = list(map(int,input().split()))
[i2,j2] = list(map(int,input().split()))

for i in range(i1,i2+1):
    for j in range(j1,j2+1):
        if j != j2:
            print(t[i][j], end=' ')
        else:
            print(t[i][j])
