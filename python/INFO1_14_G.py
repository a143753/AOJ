def f(n):
    i = 0
    while n > 0:
        i += 1
        n //= 2
    return i

n = int(input())

print(n)
print(f(n))
