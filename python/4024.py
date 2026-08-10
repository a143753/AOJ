def digit(x):
    ret = []
    while x > 0:
        ret.append(x % 10)
        x //= 10
    return ret

x = int(input())
d = digit(x)

if len(d) == 1:
    print("No")
elif max(d) < 9:
    print("Yes")
else:
    print("No")
