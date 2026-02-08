n = int(input())
a = []
for _ in range(n):
    a.append(int(input()))

b = list(set(a))
for i in range(len(b)):
    print(b[i])
