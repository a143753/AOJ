cnt = 0

def shell_sort(a,n):
    def insertion_sort(a,n,g):
        global cnt
        for i in range(g,n):
            v = a[i]
            j = i - g
            while j >= 0 and a[j] > v:
                a[j+g] = a[j]
                j -= g
                cnt += 1
                a[j+g] = v
    
    g = 1
    while True:
        if 3*g + 1 > n:
            break
        g = 3*g + 1
        
    m = 0
    G = []
    while g > 0:
        G.append(g)
        m += 1
        g //= 3

    print(m)
    print(*G)

    for i in range(m):
        insertion_sort(a,n,G[i])

n = int(input())
a = []
for _ in range(n):
    a.append(int(input()))

shell_sort(a,n)

print(cnt)
for i in range(n):
    print(a[i])
