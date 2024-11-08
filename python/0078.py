def magic_square(n):
    a = [[0 for i in range(n)] for j in range(n)]

    x = n//2
    y = (n+1)//2
    i = 1
    while True:
        if a[y][x] == 0:
            a[y][x] = i
            i += 1
            x += 1
            y += 1
        else:
            x -= 1
            y += 1
            
        if x >= n:
            x = 0
        elif x < 0:
            x = n-1
        if y >= n:
            y = 0
        
        if i > (n*n):
            break
    return a

def print_square(a):
    for aa in a:
        for aaa in aa:
            print('{0:4d}'.format(aaa),end="")
        print('')

while True:
    n = int(input())
    if n == 0:
        break
    else:
        a = magic_square(n)
        print_square(a)
