[n,q] = list(map(int,input().split()))
queue = []
for _ in range(n):
    e = input().split()
    queue.append( (e[0], int(e[1])) )

clk = 0
while True:
#    print(clk,queue)
    if len(queue) == 0:
        break
    [n,t] = queue.pop(0)
    if t > q:
        clk += q
        queue.append( (n, t-q) )
    else:
        clk += t
        print(n, clk)
