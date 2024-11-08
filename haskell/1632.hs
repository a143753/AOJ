trans ([]:_) = []
trans m = (map head m):(trans $ map tail m)

ans' m = maximum $ map sum $ trans m

ans ([0,0]:_) = []
ans ([n,m]:r) = 
    let p = take m r
        a = ans' p
        x = drop m r
    in
        a:(ans x)

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ print o
