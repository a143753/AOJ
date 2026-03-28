from collections import deque

q = int(input())
a = deque(maxlen=400000)
for _ in range(q):
    l = list(map(int, input().split()))

    if   l[0] == 0:
        if l[1] == 0:
            a.appendleft(l[2])
        elif l[1] == 1:
            a.append(l[2])
    elif l[0] == 1:
        print(a[l[1]])
    elif l[0] == 2:
        if l[1] == 0:
            a.popleft()
        elif l[1] == 1:
            a.pop()
