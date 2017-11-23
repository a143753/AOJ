[n,q] = map(int,input().split())

t = [ 0 for _ in range(n) ]

max_idx = 0
max_val = 0

for _ in range(q):
    [a,v] = map(int,input().split())
    t[a-1] += v

    if max_idx == a-1:
        if v > 0:
            max_val = t[a-1]
        else:
            max_val = max(t)
            max_idx = t.index(max_val)
    elif t[a-1] > max_val:
        max_val = t[a-1]
        max_idx = a-1
    elif t[a-1] == max_val:
        if a-1 < max_idx:
            max_val = t[a-1]
            max_idx = a-1

    print("{} {}".format(max_idx+1,max_val))
