[m,n] = map(int, input().split())

bin = []
while n > 0:
    bin.append(n%2)
    n //= 2

a = 1
mm = m
for i in bin:
    if i == 1:
        a = (a * mm) % 1000000007
    mm = (mm * mm) % 1000000007

print(a)
