n = int(input())

for _ in range(n):
    [a,b,c] = sorted(list(map(int, input().split())))

    if a*a + b*b == c*c:
        print("YES")
    else:
        print("NO")
