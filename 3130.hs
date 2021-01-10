ans n [a,b] =
    ans' 1 a b
    where
        n' = n `mod` 12
        ans' m a b =
            if m > n'
            then (a,b)
            else if odd m
                 then ans' (m+1) (a-b) b
                 else ans' (m+1) a (a+b)

main = do
    n <- getLine
    l <- getLine
    let n' = read n :: Int
        l' = map read $ words l :: [Int]
        (a,b)  = ans n' l'
    putStrLn $ unwords $ map show [a,b]
        
