ans' s =
    if l < 4
    then 0
    else if h == [2,0,2,0]
         then 1 + r
         else r
    where
        l = length s
        h = take 4 s
        r = ans' $ tail s

ans ([0]:_) = []
ans (_:s:r) =
    (ans' s):(ans r)

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ print o
