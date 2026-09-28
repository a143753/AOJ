import sys

def chk(c):
    [x1,y1,x2,y2,xp,yp,xq,yq] = c
    if x1 == x2:
        return (xp-x1) * (xq-x1) >= 0
    else:
        dp = (y2-y1) / (x2-x1) * (xp-x1) + y1 - yp
        dq = (y2-y1) / (x2-x1) * (xq-x1) + y1 - yq
        return (dp * dq >= 0)

def ans(c):
    [x1,y1,x2,y2,x3,y3,xp,yp] = c
    c1 = chk([x1,y1,x2,y2,x3,y3,xp,yp])
    c2 = chk([x2,y2,x3,y3,x1,y1,xp,yp])
    c3 = chk([x3,y3,x1,y1,x2,y2,xp,yp])
    if c1 and c2 and c3:
        return "YES"
    else:
        return "NO"

for line in sys.stdin:
    c = list(map(float,line.split()))
    f = ans(c)
    print(f)
