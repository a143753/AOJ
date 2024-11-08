[m,n] = map(int,input().split())

def find(v,cs):
    for c in cities:
        if v in c:
            return (True,c)
    return (False,set([v]))

cities = []
for _ in range(n):
    [a,b] = map(int,input().split())

    (ra,fa) = find(a,cities)
    (rb,fb) = find(b,cities)

    mg = fa | fb

    if ra:
        cities.remove(fa)
    else:
        m = m - 1
    if rb:
        if fa != fb:
            cities.remove(fb)
    else:
        m = m - 1
    cities.append(mg)

print(abs(m-len(cities)))
