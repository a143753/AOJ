while True:
    l = input()
    if l == "0":
        break

    s = 0
    for c in l:
        s += int(c)
    print(s)
    
