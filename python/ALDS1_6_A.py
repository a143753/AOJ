def counting_sort(a, b, k):
    c = [0] * k
    for i in range(k):
        c[i] = 0

    # c[i] に i の出現数を記録する 
    for j in range(len(a)):
        c[a[j]] += 1

    # c[i] に i 以下の数の出現数を記録する
    for i in range(1,k):
        c[i] = c[i] + c[i-1]

    for j in range(len(a)-1, -1, -1):
        b[c[a[j]]-1] = a[j]
        c[a[j]] -= 1
    return b

n = int(input())
a = list(map(int, input().split()))
k = max(a) + 1

r = counting_sort(a,[0] * n , k)
print(" ".join(map(str, r)))
