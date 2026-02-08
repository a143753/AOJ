n = int(input())
p = []
m = []

for _ in range(n*2):
    x = int(input())
    if x >= 0:
        p.append(x)
    else:
        m.append(x)

for i in range(n):
    print(m[i], p[i])
    
