_ = input()

n = int(input())
p = []
for _ in range(n):
    p.append( list(map(int,input().split())) )

q = int(input())
for _ in range(q):
    l = list(map(int,input().split()))
    if l in p:
        print("1")
    else:
        print("0")
