n = int(input())
a = 0
for _ in range(n):
    i = int(input())
    if i != 0:
        a += 1
    else:
        print(a)
        a = 0
