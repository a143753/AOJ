w = int(input())
n = int(input())

t = list(range(1,w+1,1))

for i in range(n):
    a, b = map(int, input().split(","))
    t[a-1], t[b-1] = t[b-1], t[a-1]

for i in range(len(t)):
    print(t[i])
