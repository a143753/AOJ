ans [] = 0
ans (a:[]) = 0
ans (a:b:r) = 
    if a < b
    then 1 + ans (b:r)
    else ans (b:r)

main = do
    _ <- getLine
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    print o
