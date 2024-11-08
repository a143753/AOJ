import math

t = [ [ None,  300,  500,  600,  700, 1350, 1650 ],
      [ None, None,  350,  450,  600, 1150, 1500 ],
      [ None, None, None,  250,  400, 1000, 1350 ],
      [ None, None, None, None,  250,  850, 1300 ],
      [ None, None, None, None, None,  600, 1150 ],
      [ None, None, None, None, None, None,  500 ] ]

l = [ [ None, None, None, None, None, None, None ],
      [    6, None, None, None, None, None, None ],
      [   13,    7, None, None, None, None, None ],
      [   18,   12,    5, None, None, None, None ],
      [   23,   17,   10,    5, None, None, None ],
      [   43,   37,   30,   25,   20, None, None ],
      [   58,   52,   45,   40,   35,   15, None ] ]

def inside(h,m):
    return h*60+m >= 17*60+30 and h*60+m <= 19*60+30

def discount(n):
    return math.ceil(n / 2 / 50) * 50

while True:
    d = int(input())
    if d == 0:
        break

    [hd,md] = map(int,input().split())
    a = int(input())
    [ha,ma] = map(int,input().split())

    tt = t[d-1][a-1]
    ll = l[a-1][d-1]

    if ( ( inside(hd,md) or inside(ha,ma) ) and (ll <= 40) ):
        print(discount(tt))
    else:
        print(tt)
    


      
