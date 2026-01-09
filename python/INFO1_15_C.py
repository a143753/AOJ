input()
a = list(map(int, input().split()))
[l,r] = list(map(int, input().split()))

b = a[l:r+1]

for i in range(l, r+1):
    a[i] = b[r-i]

print(" ".join(map(str, a)))

