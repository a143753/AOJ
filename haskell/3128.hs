ans (_:[]) = 1
ans (a:b:r) = 
    if a < b
    then ans (b:r)
    else 1 + ans (b:r)

main = do
    _ <- getLine
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    print o
    print $ length i
