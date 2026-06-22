[h,c,r] = list(map(int, input().split()))

if h < c - r:
    print("up")
elif h <= c + r:
    print("side")
else:
    print("down")
    
