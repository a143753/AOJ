[n,k] = list(map(int,input().split()))

a = sorted(map(int,input().split()),reverse=True)
o = list(filter(lambda x: x%2==1,a))
e = list(filter(lambda x: (x%2)==0,a))

lo = len(o)
le = len(e)
so = sum(o[0:k])
se = sum(e[0:k])

if   lo >= k and le >= k:
    print(max(so,se))
elif lo >= k:
    print(so)
elif le >= k:
    print(se)
else:
    print(0)
