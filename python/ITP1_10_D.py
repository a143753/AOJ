import math

def dp(x,y,n,p):
    s = 0
    for i in range(n):
        s += math.pow( math.fabs(x[i]-y[i]), p )
    return math.pow(s,1.0/p)

def dinf(x,y,n):
    t = []
    for i in range(n):
        t.append( math.fabs(x[i]-y[i]) )
    return max(t)

n = int(input())
x = list(map(int,input().split()))
y = list(map(int,input().split()))

print(dp(x,y,n,1))
print(dp(x,y,n,2))
print(dp(x,y,n,3))
print(dinf(x,y,n))
