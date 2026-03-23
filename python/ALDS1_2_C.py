def tonum(c):
    m = c[0]
    n = int(c[1])
    d = 0
    return d * 10 + n

def bubble_sort(c,n):
    r = c.copy()
    for i in range(n):
        for j in range(n-1, i, -1):
            if tonum(r[j]) < tonum(r[j-1]):
                r[j], r[j-1] = r[j-1], r[j]
    return r

def selection_sort(c,n):
    r = c.copy()
    for i in range(n):
        minj = i
        for j in range(i, n):
            if tonum(r[j]) < tonum(r[minj]):
                minj = j
        r[i], r[minj] = r[minj], r[i]
    return r
    
n = int(input())
c = input().split()

b = bubble_sort(c,n)
s = selection_sort(c,n)

print(" ".join(b))
print("Stable")
print(" ".join(s))
if b == s:
    print("Stable")
else:
    print("Not stable")
