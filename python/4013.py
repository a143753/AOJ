[ d, x, y ] = map(int,input().split())

xa = abs(x)
ya = abs(y)

if ya <= -xa + d:
    print("Yes")
else:
    print("No")
    
