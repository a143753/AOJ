import sys

def cnv(s):
    [m,n] = s.split()
    return (m,int(n))

a = list(map(cnv,sys.stdin.readlines()[1:]))
for m in ['S', 'H', 'C', 'D']:
    for n in range(1,14):
        if (m,n) in a:
            continue
        else:
            print(m, n)


