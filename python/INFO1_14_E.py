n = int(input())
a = list(map(int,input().split()))
q = int(input())

def f(k, a, n ):
    l = 0
    r = n
    while l < r:
        m = (l + r) // 2
        if a[m] == k:
            return True
        if a[m] < k:
            l = m + 1
        else:
            r = m
    return False

for _ in range(q):
    k = int(input())
    if f(k, a, n):
        print("Yes")
    else:
        print("No")
