import sys

l = input().split()
f = int(l[1])

t = {}

for l in sys.stdin:
    e = l.split()
    m = int(e.pop(0))
    s = sorted(e)
    for i in range(m):
        for j in range(i+1,m):
            k = (s[i],s[j])
            if k in t:
                t[k] += 1
            else:
                t[k] =  1

f = list(sorted(filter(lambda x: t[x] >= f, t)))
print(len(f))
for e in f:
    print("{0:s} {1:s}".format(e[0],e[1]))
