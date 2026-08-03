import math
n = int(input())

for i in range(n):
    [x1,y1,x2,y2,x3,y3] = map(float, input().split())

    a2 = x1*x1 - x2*x2
    b2 = 2*(x1 - x2)
    c2 = y1*y1 - y2*y2
    d2 = 2*(y1 - y2)
    a3 = x1*x1 - x3*x3
    b3 = 2*(x1 - x3)
    c3 = y1*y1 - y3*y3
    d3 = 2*(y1 - y3)

    xp = (a2*d3 + c2*d3 - a3*d2 - c3*d2) / (b2*d3 - b3*d2)
    if d2 != 0:
        yp = (a2 + c2 - b2*xp ) / d2
    else:
        yp = (a3 + c3 - b3*xp ) / d3

    r = math.sqrt((x1 - xp)**2 + (y1 - yp)**2)

    print(f"{xp:.3f} {yp:.3f} {r:.3f}")
