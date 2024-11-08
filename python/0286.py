def mul(v,u):
    s = 0
    for i in range(len(u)):
        s += v[u[i][0]] * u[i][1]
    return s

[n,m] = list(map(int,input().split()))

t = [ [] for j in range(n) ]

while True:
    d = list(map(int,input().split()))
    if d == [0,0,0]:
        break
    else:
        t[d[0]-1].append([d[1]-1,d[2]])

c = int(input())
p = [ list(map(int,input().split())) for i in range(c) ]

for i in range(c):
    r = []
    for j in range(n):
        r.append( mul(p[i],t[j]) )
    print(" ".join(map(str,r)))
