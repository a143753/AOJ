while True:
    n = int(input())
    if n == 0:
        break
    s = 0
    for _ in range(n//4):
        s += int(input())
    print(s)
