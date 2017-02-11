ans (x0:x1:[]) = x1 - x0
ans (x:xs ) = 
    let min = x
        max = maximum xs
        p0  = max - min
        p1  = ans xs
    in
        maximum [p0,p1]

main = do
    n <- getLine
    c <- getContents
    let i = map read $ lines c :: [Int]
        o = ans i
    --print i
    print o

