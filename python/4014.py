b = int(input())

print(b)
while b != 1:
    if b % 2 == 0:
        b = b // 2
    else:
        b = (b - 1) // 2
    print(b)
