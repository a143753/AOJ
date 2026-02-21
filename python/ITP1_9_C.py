n = int(input())
st = 0
sh = 0
for _ in range(n):
    [wt,wh] = input().split()
    if wt < wh:
        sh += 3
    elif wt > wh:
        st += 3
    else:
        st += 1
        sh += 1

print(st, sh)
