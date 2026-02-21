[r,c] = list(map(int,input().split()))

a = []
t = [0] * (c+1)
for _ in range(r):
    l = list(map(int,input().split()))
    
    l.append(sum(l))

    for j in range(c+1):
        t[j] += l[j]
    
    a.append(l)

a.append(t)

for l in a:
    print( " ".join(map(str,l)) )
