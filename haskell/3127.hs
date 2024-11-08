ans n l =
    (sum l) - (n+1)*n`div`2

main = do
    n <- getLine
    l <- getLine
    let n' = read n :: Integer
        l' = map read $ words l :: [Integer]
        o  = ans n' l'
    print o

