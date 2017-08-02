def cal(n):
    for i in range(0,10):
        n = (n*n / 100) % 10000
        print n

n = int(raw_input())

for i in range(0,n):
    print "Case %d:" % (i+1)
    n = int(raw_input())
    cal(n)
