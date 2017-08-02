n = int(raw_input())
u = raw_input()
q = int(raw_input())

def cmd_set(q,u):
    x = int(q[0])
    y = int(q[1])
    z = q[2]

    h = u[:x-1]
    t = u[y:]
    zz= z*(y-x+1)

    return h+zz+t

def cmd_comp(q, u):
    a = int(q[0])
    b = int(q[1])
    c = int(q[2])
    d = int(q[3])

    s = u[a-1:b]
    t = u[c-1:d]
    if s < t:
        print "s"
    elif s > t:
        print "t"
    else:
        print "e"

for i in range(q):
    q = raw_input().split()
    cmd = q[0]
    q.pop(0)

    if cmd == 'comp':
        cmd_comp(q, u)
    elif cmd == 'set':
        u = cmd_set(q, u)

