f a b x = a * x + b

ans' k [l,r,p] =
    let ab = take (r-l+1) $ drop (l-1) k
    in
        minimum $ map (\[a,b] -> f a b p) ab

ans ([n,q]:r) =
    let a = take n r
        l = take q $ drop n r
    in
        map (\ ll -> ans' a ll) l

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    mapM_ print o
