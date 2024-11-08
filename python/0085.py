def act(t,m,l):
    t = (t+m) % len(l);
    del l[t-1]
    return (t-1) % (len(l)+1)

while True:
    i = raw_input().split()

    n = int(i[0])
    m = int(i[1])

    if n == 0 and m == 0:
        break
    else:
        l = range(1,n+1)
        t = 0
        for i in range(n-1):
            tt = act(t,m,l);
            t = tt;
        print l[0]
