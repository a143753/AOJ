tax [] = []
tax ([p,f]:r) =
    p':(tax r)
    where
        p' = if f == 0
             then p + p `div` 10
             else p

ans x =
    let c = zip [1..] $ tax x
        (i,h) = head c
        t = filter (\(a,b) -> b < h) $ tail  c
    in
        if t == []
        then ["No"]
        else ["Yes"] ++ ( map show $ map fst t )

main = do
    _ <- getLine
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ putStrLn o
