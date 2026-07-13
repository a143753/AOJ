import sys
import math

for line in sys.stdin:
    [a,b] = list(map(int, line.split()))

    x = math.gcd(a,b)
    y = a * b // x
    
    print(x,y)
