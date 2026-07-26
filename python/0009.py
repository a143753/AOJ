import sys

def judge(n):
    if n == 1:
        return False
    elif n == 2:
        return True
    elif n % 2 == 0:
        return False
    else:
        for i in range(3, int(n ** 0.5) + 1, 2):
            if n % i == 0:
                return False
        return True

t = {}

for line in sys.stdin:
    n = int(line.strip())

    f = sorted(t.keys())
    m = 0
    for i in f:
        if i > n:
            break
        m = i

    s = t[m] if m in t else 0
    for i in range(m+1, n+1):
        if judge(i):
            s += 1
    if n not in t:
        t[n] = s
    print(s)

