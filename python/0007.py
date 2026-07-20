import math

n = int(input())
s = 100000
for _ in range(n):
    s = math.ceil( s * 1.05 / 1000 ) * 1000

print(s)
