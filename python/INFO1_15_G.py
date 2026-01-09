input()
a = list(map(int, input().split()))

f = [True,True,True,True] # >, >=, <=, <

for i in range(len(a)-1):
    if a[i] < a[i+1]:
        f[2] = False
        f[3] = False
    elif a[i] == a[i+1]:
        f[0] = False
        f[3] = False
    else:
        f[0] = False
        f[1] = False

if f == [True,True,False,False]:
    print(2)
elif f == [False,True,False,False]:
    print(1)
elif f == [False,False,True,True]:
    print(-2)
elif f == [False,False,True,False]:
    print(-1)
elif f == [False,True,True,False]:
    print(0)
    
