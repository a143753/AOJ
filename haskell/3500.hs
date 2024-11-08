ans [a,b] = a*2 + b*3

main = do
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    print o

