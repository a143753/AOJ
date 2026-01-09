input()
a = list(map(int, input().split()))
k = int(input())

t = a[0:k]
s = a[k:]

print(" ".join(map(str, s + t)))
