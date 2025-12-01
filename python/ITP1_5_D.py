def call( n : int ):
    i = 1
    while True:
        x = i
        if ( x % 3 == 0 ):
            print( "",i, end='' )
        else:
            while True:
                if ( x % 10 == 3 ):
                    print( "",i, end='' )
                    break
                x = x // 10
                if ( x == 0 ):
                    break
        i = i + 1
        if ( i > n ):
            break
    print( "" )
n = int(input())
call(n)
