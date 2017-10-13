def ans(n,s):
    p = [[] for i in range(n)]
    h = []
    i = 0
    while True:
        if s == []:
            break
        c = s.pop(0)
        if c == 'M':
            if p[i] == []:
                p[i] = [c]
            else:
                p[i].append(c)
        elif c == 'L':
            if p[i] == []:
                p[i] = [c]
            else:
                p[i].append(c)
            if h != []:
                p[i] += h
            h = []
        elif c == 'S':
            if h == []:
                h = [c]
            else:
                h.append(c)
            if p[i] != []:
                h += p[i]
            p[i] = []
        
        i = (i+1) % n
    pp = list(sorted(map(len,p)))
    hh = len(h)
    pp.append(hh)
    
    return " ".join(map(str,pp))

while True:
    n = int(input())
    if n == 0:
        break
    s = list(input())
    o = ans(n,s)
    print(o)
