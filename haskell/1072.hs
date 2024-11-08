ans ([0,0]:_) = []
ans ([r,c]:x) = a:(ans x)
    where
        a = if (mod (r*c) 2) == 0
            then "yes"
            else "no"

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ putStrLn o
