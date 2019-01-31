ans [a, b] = 
    let d = b `div` a
        r = b `mod` a
    in
        if r == 0 then d else (d+1)

main = do
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    print o

