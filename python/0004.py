import sys

def rnd(x):
    tmp = round(x,3)
    if tmp == -0.0:
        return 0.0
    else:
        return tmp
    

for line in sys.stdin:
    [a,b,c,d,e,f] = list(map(int, line.split()))

    if b == 0:
        x = c / a
    elif e == 0:
        x = f / d
    else:  
        x = ( c / b - f / e ) / ( a / b - d / e )
    
    if a == 0:
        y = c / b
    elif d == 0:
        y = f / e
    else:
        y = ( c / a - f / d ) / ( b / a - e / d )

    xr = rnd(x)
    yr = rnd(y)
    print("{:.3f} {:.3f}".format(xr,yr))
