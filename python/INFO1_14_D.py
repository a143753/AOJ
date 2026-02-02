def f(k, a, n ):
    l = 0
    r = n
    while l < r:
        print("[{}, {})".format(l, r))
        m = (l + r) // 2
        if a[m] == k:
            break
        if a[m] < k:
            l = m + 1
        else:
            r = m
    
n = int(input())
a = list(map(int,input().split()))
k = int(input())

f(k, a, n)
