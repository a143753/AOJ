def pr(t):
    for i in range(0,10):
        if t[i] == 0:
            print "-"
        else:
            print "*"*t[i]


while True:
    n = int(raw_input())
    t = {}
    for i in range(0,10):
        t[i] = 0

    if n == 0:
        break
    else:
        for i in range(0,n):
            c = int(raw_input())
            t[c] += 1
#        print t
        pr(t)
