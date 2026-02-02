def bin(k, a, n ):
    l = 0
    r = n
    t = []
    while l < r:
        m = (l + r) // 2
        t.append(str(a[m]))
        if a[m] == k:
            print(" ".join(t))
            return True
        if a[m] < k:
            l = m + 1
        else:
            r = m
    print(" ".join(t))
    return False

def lin(k, a, n ):
    l = 0
    r = n
    t = []
    while l < r:
        m = l
        t.append(str(a[m]))
        if a[m] == k:
            print(" ".join(t))
            return True
        else:
            l += 1
    print(" ".join(t))
    return False

n = int(input())
a = list(map(int,input().split()))
k = int(input())

lin(k, a, n)
bin(k, a, n)
