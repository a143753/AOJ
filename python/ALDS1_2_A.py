def bubble_sort(a,n):
    f = True
    s = 0
    while f:
        f = False
        for j in range(n-1,0,-1):
            if a[j] < a[j-1]:
                a[j], a[j-1] = a[j-1], a[j]
                f = True
                s += 1
    print(" ".join(map(str,a)))
    print(s)

n = int(input())
a = list(map(int,input().split()))

r = bubble_sort(a,n)
