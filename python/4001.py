a = map(int,input().split())

t = {}
for i in a:
    if i in t:
        t[i] += 1
    else:
        t[i] = 1

n2 = 0
for v in t.values():
    if v >= 3:
        print("1")
        exit()
    if v == 2:
        n2 += 1
        if n2 >= 2:
            print("1")
            exit()
if n2 == 1:
    print("3")
else:
    print("2")
