def p(t):
    for r in t:
        for c in r:
            print(c,end="")
        print("")
        
a = int(input())
for j in range(a):
    n = int(input())
    t = [ [ " " for _ in range(n) ] for _ in range(n)]
    d = 1 # 0:up, 1:right, 2:down, 3:left

    for i in range(n):
        t[i][0] = "#"

    x = 0
    y = 0
    for m in range(n-1):
        l = n - 1 - (m//2)*2
        for i in range(l):
            if d == 0:
                y -= 1
            elif d == 1:
                x += 1
            elif d == 2:
                y += 1
            elif d == 3:
                x -= 1
                
            t[y][x] = "#"

        d = (d + 1) % 4
    p(t)
    if j != a-1:
        print("")
