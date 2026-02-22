dice = list(map(int,input().split()))
n = int(input())

def move(dir, dice):
    ret = [0] * 6
    if dir == "N":
        ret[0] = dice[1]
        ret[1] = dice[5]
        ret[2] = dice[2]
        ret[3] = dice[3]
        ret[4] = dice[0]
        ret[5] = dice[4]
    elif dir == "S":
        ret[0] = dice[4]
        ret[1] = dice[0]
        ret[2] = dice[2]
        ret[3] = dice[3]
        ret[4] = dice[5]
        ret[5] = dice[1]
    elif dir == "E":
        ret[0] = dice[3]
        ret[1] = dice[1]
        ret[2] = dice[0]
        ret[3] = dice[5]
        ret[4] = dice[4]
        ret[5] = dice[2]
    elif dir == "W":
        ret[0] = dice[2]
        ret[1] = dice[1]
        ret[2] = dice[5]
        ret[3] = dice[0]
        ret[4] = dice[4]
        ret[5] = dice[3]
    elif dir == "C":
        ret[0] = dice[0]
        ret[1] = dice[2]
        ret[2] = dice[4]
        ret[3] = dice[1]
        ret[4] = dice[3]
        ret[5] = dice[5]
    return ret

def f(dice, top, front):
    tidx = 0
    fidx = 0
    for index, value in enumerate(dice):
        if value == top:
            tidx = index
        if value == front:
            fidx = index

    if tidx == 1:
        dice = move( "N", dice )
    elif tidx == 2:
        dice = move( "W", dice )
    elif tidx == 3:
        dice = move( "E", dice )
    elif tidx == 4:
        dice = move( "S", dice )
    elif tidx == 5:
        dice = move( "S", move( "S", dice ) )
        
    while front != dice[1]:
        dice = move( "C", dice )

    return dice[2]

for _ in range(n):
    [top,front] = list(map(int,input().split()))
    a = f(dice, top, front)
    print(a)
