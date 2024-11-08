def cls(i):
    if i < 60:
        return i // 10
    else:
        return 6

def answer(n,d):
    tbl = [ 0 for i in range(7) ]
    for i in range(n):
        c = cls(d[i])
        tbl[c] += 1
    return tbl

while True:
    n = int(input())
    if n == 0:
        break
    d = [int(input()) for i in range(n)]
    o = answer(n,d)
    for i in range(7):
        print(o[i])
