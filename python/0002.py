import sys

def ans(a):
    if a == 0:
        return 1
    else:
        r = 0
        while a > 0:
            r += 1
            a //= 10
        return r

for line in sys.stdin:
    [a,b] = list(map(int, line.split()))
    print(ans(a+b))
