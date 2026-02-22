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
    else:
        exit(1)
    return ret

def g(dice1, dice2):
    moves = [ "C", "C", "C", "C",
              "N", "C", "C", "C", "C", "S",
              "E", "C", "C", "C", "C", "W",
              "W", "C", "C", "C", "C", "E",
              "S", "C", "C", "C", "C", "N",
              "S", "S", "C", "C", "C", "C" ]
    for m in moves:
        dice2 = move( m, dice2 )
        if dice1 == dice2:
            return "Yes"
    return "No"

def h(dices, n):
    for i in range(n):
        for j in range(i+1,n):
            a = g( dices[i], dices[j] )
            if a == "Yes":
                return "No"
    return "Yes"

n = int(input())
dices = []
for _ in range(n):
    dices.append( list(map(int,input().split())) )

a = h(dices, n)
print(a)
