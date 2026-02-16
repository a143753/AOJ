def f(a):
    s = "("
    l = len(a)
    for i in range(l):
        s += str(a[i])
        if i != l - 1:
            s += ", "
    s += ")"
    return s

def g(n):
    ret = []
    for i in range(n):
        ret.append(i)
    return ret

n = int(input())

y = f(g(n))

print(y)
