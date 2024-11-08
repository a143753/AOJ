madd (Just a) (Just b) = Just (a+b)
madd _ _ = Nothing

mmax mx [] = mx
mmax mx (m:ms) = 
    case mx of
        Nothing -> mmax m ms
        Just a  -> case m of
                    Nothing -> mmax mx ms
                    Just b  -> mmax (Just (maximum [a,b])) ms

-- |
-- >>> cmpl [5,5,5] [1,0,1] [1,0,1]
-- Just 15
cmpl _ _ [] = Just 0
cmpl (a:as) (b:bs) (c:cs) = madd v v'
    where
        v = if b /= c then Nothing else Just a 
        v'= cmpl as bs cs
-- |
-- >>> cmpa [[47,32,11],[99,12,-8]] [[1,0,1],[0,1,0]] [[1,0,1],[0,1,0]]
-- Just 193
cmpa _ _ [] = Just 0
cmpa (a:as) (b:bs) (c:cs) = madd (cmpl a b c) (cmpa as bs cs)

scn' a b c =
    if la >= lc then sa:sr else []
    where
        sa = cmpa a b c
        sr = scn' (tail a) (tail b) c
        la = length a
        lc = length c
scn :: [[Int]] -> [[Int]] -> [[Int]] -> [Maybe Int]
scn a b c =
    if la >= lc then (sa ++ sr) else []
    where 
        sa = scn' a b c
        sr = scn (map tail a) (map tail b) c
        la = length $ head a
        lc = length $ head c

ans ([h,w]:x) = 
    let a = take h x
        b = take h $ drop h x
        c = drop (2*h+1) x
        r = mmax Nothing $ scn a b c
    in
        case r of
            Nothing -> "NA"
            Just v  -> show v

main = do
    c <- getContents
    let i = map (map read) $ map words $ lines c :: [[Int]]
        o = ans i
    putStrLn o

