ans = sum

main = do
    l <- getLine
    let i = map read $ words l
        o = ans i
    print o
