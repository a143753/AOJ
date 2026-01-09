input()
a = list(map(int, input().split()))
a = sorted(a,reverse=True)
print(" ".join(map(str, a)))
