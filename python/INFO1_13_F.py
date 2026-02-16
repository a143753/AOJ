def f(a):
    s = "("
    l = len(a)
    for i in range(l):
        s += str(a[i])
        if i != l - 1:
            s += ", "
    s += ")"
    return s

def g(k, a):
    r = []
    for i in a:
        r.append(k*i)
    return r

_ = input()
a = list(map(int,input().split()))
k = int(input())

print(f(a))
print(f(g(k,a)))
