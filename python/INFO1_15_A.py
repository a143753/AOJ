input()
a = list(map(int, input().split()))

if a == sorted(a):
    print("Yes")
else:
    print("No")
