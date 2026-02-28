import math

def is_prime(n):
    if n == 2:
        return True
    else:
        s = math.ceil(math.sqrt(n))
        for i in range(2,s+1):
            if (n % i) == 0:
                return False
        return True

n = int(input())

s = 0
for _ in range(n):
    a = int(input())
    if is_prime(a):
        s += 1
print(s)
        
