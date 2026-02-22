[n,m,q] = list(map(int,input().split()))

a = [ [0] * m for _ in range(n) ]
for _ in range(q):
    [i,j] = list(map(int,input().split()))
    if a[i][j] == 0:
        a[i][j] = 1
    else:
        a[i][j] = 0
    
for l in a:
    print( " ".join( map(str, l) ) )
