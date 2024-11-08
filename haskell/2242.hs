cnst :: [String] -> (String,[Int])
cnst [n,b,w] =
    let b' = read b :: Int
        w' = read w :: Int
    in
        (n, [w' - b' + 1, w'])

solv :: [(String,[Int])] -> Int -> String
solv t w =
    let f = filter (\ (n,[s,e]) -> (w >= s) && (e >= w) ) t
    in
        if f == []
        then "Unknown"
        else
           let (n,[ws,wl]) = head f
           in
                unwords [ n, show (w - ws + 1) ] 

ans :: [[String]] -> [[String]]
ans (["0","0"]:_) = []
ans ([n,q]:x) =
    let n'= read n :: Int
        q'= read q :: Int
        t = map cnst $ take n' x
        w = map (read . head) $ take q' $ drop n' x :: [Int]
        a = map (solv t) w
        r = drop (n'+q') x
    in
        a:(ans r)

main = do
    c <- getContents
    let i = map words $ lines c
        o = ans i
    mapM_ putStrLn $ concat o
