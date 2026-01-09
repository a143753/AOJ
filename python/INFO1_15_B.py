input()
a = list(map(int, input().split()))
[l,r] = list(map(int, input().split()))

t = a[l]
a[l] = a[r]
a[r] = t

print(" ".join(map(str, a)))

