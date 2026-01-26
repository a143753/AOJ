def grade(m, f, r):
    if m == -1 or f == -1:
        return "F"
    
    total = m + f
    if total >= 80:
        return "A"
    elif total >= 65:
        return "B"
    elif total >= 50:
        return "C"
    elif total >= 30:
        if r >= 50:
            return "C"
        else:
            return "D"
    else:
        return "F"

while True:
    [m,f,r] = map(int, input().split())
    if m == -1 and f == -1 and r == -1:
        break
    ret = grade(m,f,r)
    print(ret)
