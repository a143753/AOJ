def decomp(a,b,c):
    res = []
    for i in range(1, c + 1):
        if c % i == 0:
            if i >= a and i <= b:
                res.append(i)
    return res

[a,b,c] = map(int, input().split())
s = decomp(a,b,c)
print(len(s));
