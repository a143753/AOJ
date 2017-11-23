# time limit exceeded

import copy

input()
a = list(map(int,input().split()))
b = list(map(int,input().split()))

q = int(input())

for _ in range(q):
    [x,y,z] = map(int,input().split())
    if   x == 1:
        a[y-1] = z
    elif x == 2:
        b[y-1] = z
    elif x == 3:
        print(min(a[y-1:z]))
    elif x == 4:
        print(min(b[y-1:z]))
    elif x == 5:
        a = copy.deepcopy(b)
    elif x == 6:
        b = copy.deepcopy(a)
    
