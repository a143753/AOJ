def search(n,d,t):
    b = 0
    e = n-1
    r = 0
    while True:
        if b > e:
            return r
        else:
            r += 1
            i = (b+e)//2
            if t == d[i]:
                return r
            elif t < d[i]:
                e = i - 1
            else:
                b = i + 1
while True:
    n = int(input())
    if n == 0:
        break
    d = [int(input()) for i in range(n)]
    t = int(input())

    m = search(n,d,t)
    print(m)
