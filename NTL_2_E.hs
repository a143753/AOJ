ans [a,b] = a `mod` b
main = do
    l <- getLine
    let i = map read $ words l :: [Integer]
        o = ans i
    print o
