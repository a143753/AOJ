def ans(m):
    h = 0
    w = 0
    pas = []

    while True:
#        print("h={0} v={1} mark={2}".format(h,w,m[h][w]))
        if   m[h][w] == '>':
            w += 1
        elif m[h][w] == '<':
            w -= 1
        elif m[h][w] == '^':
            h -= 1
        elif m[h][w] == 'v':
            h += 1
        elif m[h][w] == '.':
            return  "{0} {1}".format(w,h)

        if (h,w) in pas:
            return "LOOP"
        else:
            pas.append((h,w))

while True:
    [h,w] = map(int,input().split())
    if h == 0 and w == 0:
        break

    m = []
    for _ in range(h):
        m.append(input())

    res = ans(m)
    print(res)
