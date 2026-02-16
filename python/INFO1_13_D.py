def f(a):
    s = "("
    l = len(a)
    for i in range(l):
        s += str(a[i])
        if i != l - 1:
            s += ", "
    s += ")"
    return s

_ = input()
a = list(map(int,input().split()))

y = f(a)

print(y)
