[x,l,r] = list(map(int, input().split()))

if x < l:
    print(l)
elif x <= r:
    print(x)
else:
    print(r)
