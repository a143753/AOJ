N,M,Q = map(int,input().split())

a = map(int,input().split())
q = map(int,input().split())

t = [ i for i in range(N) ]
n = N
i = 0
for aa in a:
    if aa % 2 == 1:
        i = (i - aa) % n
    else:
        i = (i + aa) % n
    del t[i]
    n -= 1
    
for i in q:
    if i in t:
        print(1)
    else:
        print(0)
