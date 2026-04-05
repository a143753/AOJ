import math
import itertools

def decomp(n):
    val = n
    ans = []
    while True:
        if val % 2 == 0:
            val //= 2
            ans.append(2)
        else:
            break
    div = 3
    while True:
        if val == 1:
            break
        elif val < div * div:
            break
        elif val % div == 0:
            val //= div
            ans.append(div)
        else:
                div += 2
    if val != 1:
        ans.append(val)
    return ans

n = int(input())
d = set(decomp(n))

ans = n
for r in range(1, len(d) + 1):
    for c in itertools.combinations(d, r):
        if len(c) % 2 == 1:
            ans -= n // math.prod(c)
        else:
            ans += n // math.prod(c)

print(ans)
