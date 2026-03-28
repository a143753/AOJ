from collections import deque
[n,q] = list(map(int,input().split()))

s = [ deque() for _ in range(n) ]

for _ in range(q):
    c = list(map(int,input().split()))
    if c[0] == 0: # push
        s[c[1]].append(c[2])
    elif c[0] == 1: # top
        if len(s[c[1]]) != 0:
            print(s[c[1]][-1])
    elif c[0] == 2: # pop
        if len(s[c[1]]) != 0:
            s[c[1]].pop()
