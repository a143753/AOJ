def f(a):
    s = "("
    l = len(a)
    for i in range(l):
        s += str(a[i])
        if i != l - 1:
            s += ", "
    s += ")"
    return s

def g(a, b):
    r = []
    l = len(a)
    for i in range(l):
        r.append(a[i] + b[i])
    return r
        
_ = input()
a = list(map(int,input().split()))
b = list(map(int,input().split()))

print( f(a) )
print( f(b) )
print( f(g(a,b)) )
