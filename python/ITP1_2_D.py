[w,h,x,y,r] = map(int, input().split())

cx = (x - r) >= 0 and (x + r) <= w
cy = (y - r) >= 0 and (y + r) <= h

if cx and cy:
    print("Yes")
else:
    print("No")
