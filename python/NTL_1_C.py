import math

_ = input()
a = list(map(int, input().split()))
l = math.lcm(*a)

print(l)
