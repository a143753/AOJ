main = do
    _ <- getLine
    c <- getContents
    let i = map (map read) $ map words $ lines c
        o = maximum $ map sum i
    print o

