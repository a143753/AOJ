def print_table(t):
    for c in t:
        for r in c:
            print("{0:d}".format(r),end="")
        print("")

def play(t,x,y):
    q = [[x,y]]
    while True:
        p = q.pop(0)

        x = p[0]
        y = p[1]

        t[y][x] = 0
        for i in range(1,4):
            if x+i < 8:
                if t[y][x+i] == 1:
                    q.append([x+i,y])
                    t[y][x+i] = 0
            if x-i >= 0:
                if t[y][x-i] == 1:
                    q.append([x-i,y])
                    t[y][x-i] = 0
            if y+i < 8:
                if t[y+i][x] == 1:
                    q.append([x,y+i])
                    t[y+i][x] = 0
            if y-i >= 0:
                if t[y-i][x] == 1:
                    q.append([x,y-i])
                    t[y-i][x] = 0

        if q == []:
            break
    return t
        
n = int(input())

for i in range(1,n+1):
    input() # 空行をskip

    t = [[int(i) for i in list(input())]]
    for j in range(0,7):
        t.append([int(i) for i in list(input())])
    x = int(input())
    y = int(input())

    tt = play(t,x-1,y-1)
    
    print('Data {0:d}:'.format(i))
    print_table(tt)

