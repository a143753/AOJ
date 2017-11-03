from itertools import dropwhile

n = int(input())
d = list(map(int,input().split()))
c = set()

for i in range(n):

    if i in c:
        continue

    j = i
    t = []
    while True:
        if j in c:
            break
        elif j in t:
            #    print("i={0},j={1}".format(i,j))
            if i == j:
                c = c.union(t)
            else:
                #        print("t={0}".format(t))
                tt = dropwhile(lambda x: x != j, t)
                c = c.union(tt)
            break
        else:
            t.append(j)
            j = (j + d[j]) % n
print( len(c) )

