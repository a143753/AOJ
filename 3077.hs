ans [n,a,b] =
    show(n*a) ++ (take b $ repeat '0')

main = do
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    putStrLn o

