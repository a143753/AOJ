takeSeq _ [] = []
takeSeq n (x:xs) = if x == n + 1 then x:(takeSeq x xs) else []
dropSeq _ [] = []
dropSeq n (x:xs) = if x == n + 1 then (dropSeq x xs) else (x:xs)

sq :: [Int] -> [[Int]]
sq [] = []
sq (x:xs) = 
    let a = x:(takeSeq x xs)
        r = dropSeq x xs
    in
        a:(sq r)

pt s = unwords $ map (\a -> if 1 == length a
                            then show $ head a
                            else (show $ head a) ++ "-" ++ (show $ last a) ) s

ans' x = 
    let s = sq x
        p = pt s
    in
        p

ans ([0]:_) = []
ans (_:x:xs) =
    let a = ans' x
    in
        a:(ans xs)

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ putStrLn o

