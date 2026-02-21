[n,m] = list(map(int,input().split()))

t = []
for _ in range(n):
    l = list(map(int,input().split()))
    t.append(l)

[i,j] = list(map(int,input().split()))

print(t[i][j])
