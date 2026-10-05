n = int(input())

for _ in range(n):
    a = int(input())
    b = int(input())
    c = a + b

    if c >= 10**80:
        print("overflow")
    else:
        print(c)
        
