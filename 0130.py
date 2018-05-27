def proc(i):
    l  = len(i)
    o = [ i[0] ]
    io = 1
    ii = 1

    while ii < l:
#        print(o)
#        print("io={0} d={1} c={2} o={3}".format(io,i[ii:ii+2],i[ii+2],o))
        if i[ii:ii+2] == "<-":
            io -= 1
        else:
            io += 1

        if (io == 0):
            o.insert(io,i[ii+2])
            io += 1
        elif (io == len(o)+1):
            o.insert(io,i[ii+2])
        else:
#            print("i={0} o={1}".format(i[ii+2],o[io-1]))
            if i[ii+2] != o[io-1]:
                raise untimeError("error")

        ii += 3

    s = ""
    for c in o:
        s += c
    return s


n = int(input())

for _ in range(n):
    l = input()
    r = proc(l)
    print(r)

