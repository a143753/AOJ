import math

[x1,y1,x2,y2] = list(map(float,input().split()))

d = math.sqrt( (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2) )
print( d )
