import math

[a,b,c] = list(map(float,input().split()))

r = c / 360.0 * 2 * math.pi
s = a * b * math.sin(r) / 2
h = s / a * 2

i = math.sqrt( h*h + (a - b*math.cos(r))*(a - b*math.cos(r)))
l = a + b + i

print(s)
print(l)
print(h)
