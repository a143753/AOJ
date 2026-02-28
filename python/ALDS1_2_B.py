def selection_sort(a,n):
    s = 0
    for i in range(n):
        minj = i
        for j in range(i,n):
            if a[j] < a[minj]:
                minj = j
        if i != minj:
            a[i], a[minj] = a[minj], a[i]
            s += 1
    print(" ".join(map(str,a)))
    print(s)

n = int(input())
a = list(map(int,input().split()))

selection_sort(a,n)
