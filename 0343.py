i = input().split()
n = int(i[0])
c = int(i[1])

s = [0 for i in range(n)]
v = [i for i in range(n)]
f = True

for i in range(c):
    l = input().split()

    if l[0] == "0":
        t = int(l[1])
        p = int(l[2])
        s[t-1] += p
        f = False
    else:
        r = int(l[1])
        if f == False:
            v = sorted(range(len(s)),reverse=True,key=lambda k: s[k])
            f = True
        i = v[r-1]
        
        print("{0:d} {1:d}".format(i+1,s[i]))

# Time Limit Exceeded        
