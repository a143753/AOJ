[n,m,q] = list(map(int,input().split()))

a = [ [0] * m for _ in range(n) ]
for _ in range(q):
    [i1,j1,i2,j2] = list(map(int,input().split()))
    for i in range(i1,i2+1):
        for j in range(j1,j2+1):
            a[i][j] += 1
    
for l in a:
    print( " ".join( map(str, l) ) )
