from collections import deque

n = int(input())
q = deque(maxlen=1000000)

for _ in range(n):
    c = input().split()

    if len(c) == 2:
        d = int(c[1])
    
    if c[0] == "insert":
        q.appendleft(d)
    elif c[0] == "delete":
        if d in q:
            q.remove(d)
    elif c[0] == "deleteFirst":
        q.popleft()
    elif c[0] == "deleteLast":
        q.pop()

print(" ".join(map(str, q)))
