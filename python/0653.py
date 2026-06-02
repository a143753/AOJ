n = int(input())
x = list(map(int, input().split()))
m = int(input())
a = list(map(int, input().split()))

for i in range(m):
    idx = a[i]-1
    if idx == n - 1:
        if x[idx] < 2019:
            x[idx] += 1
    else:
        if x[idx+1] != x[idx] + 1:
            x[idx] += 1
for xx in x:
    print(xx)
    
