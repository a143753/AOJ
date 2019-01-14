ans [h,a,b] = length $ filter (\n -> (mod h n) == 0) [a..b]

main = do
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    print o

