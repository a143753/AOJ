w = int(input())

for h in range(30,1000):
    if (w + 50) <= (h - 30) * 2 * h * 6 * h / 1000:
        break
print((6*h), (2*h), h)

