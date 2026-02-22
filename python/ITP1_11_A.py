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
    return ret

dice = list(map(int,input().split()))
cmds = input()

for c in cmds:
    dice = move( c, dice )
print(dice[0])
