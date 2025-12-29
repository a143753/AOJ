n = int(input())
t = int(input())
s = 0
for _ in range(n):
    a = int(input())
    s += a
    if s >= t:
        break
print(s)
