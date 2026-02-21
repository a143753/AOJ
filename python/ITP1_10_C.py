import math

while True:
    n = int(input())
    if n == 0:
        break
    s = list(map(int,input().split()))
    a = sum(s) / n

    t = 0
    for i in range(n):
        t += (s[i] - a)*(s[i] - a)
    print(math.sqrt(t/n))
