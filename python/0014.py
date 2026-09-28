import sys

def f(x):
    return x * x

for line in sys.stdin:
    d = int(line.strip())
    s = 0
    for x in range(0, 600, d):
        s += d * f(x)
    print(s)
