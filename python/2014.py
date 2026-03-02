def print_matrix(t):
    for c in t:
        print(" ".join(map(str, c)))
    print("--")

def sub(t,w,h,cu,cl):
    f = False
    for i in range(h):
        for j in range(w):
            if not ( t[i][j] in [ 'B', 'W', 'c' ] ):
                if ( ( i > 0   and ( t[i-1][j] in [cu,cl,'c'] ) ) or 
                     ( i < h-1 and ( t[i+1][j] in [cu,cl,'c'] ) ) or
                     ( j > 0   and ( t[i][j-1] in [cu,cl,'c'] ) ) or
                     ( j < w-1 and ( t[i][j+1] in [cu,cl,'c'] ) ) ):
                    if t[i][j] == '.':
                        f = True
                        t[i][j] = cl
                    elif t[i][j] == cl:
                        t[i][j] = cl
                    elif t[i][j] in [ 'b', 'w' ]:
                        f = True
                        t[i][j] = 'c'
        #print_matrix(t)
    return [f, t]

def count(t,w,h):
    sb = 0
    sw = 0
    for i in range(h):
        for j in range(w):
            if t[i][j] == 'b':
                sb += 1
            elif t[i][j] == 'w':
                sw += 1
    return [sb, sw]

def ans(t,w,h):
    while True:
        [fb, t] = sub(t,w,h,'B','b')
        [fw, t] = sub(t,w,h,'W','w')
        #print_matrix(t)
        if not fw and not fb:
            break
    [sb, sw] = count(t,w,h)
    return [sb, sw]

while True:
    [w, h] = list(map(int, input().split()))
    if w == 0 and h == 0:
        break
    else:
        t = []
        for i in range(h):
            t.append(list(input()))
        #print_matrix(t)
        [sb,sw] = ans(t,w,h)
        print(sb, sw)
