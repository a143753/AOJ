ans [a,b] = a * b

main = do
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    print o

