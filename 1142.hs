import Data.List

f s n = 
    let s1 = take n s
        s2 = drop n s
        r1 = reverse s1
        r2 = reverse s2
    in
        [s1++s2, s1++r2, r1++s2, r1++r2, s2++s1, s2++r1, r2++s1, r2++r1]


ans s =
    let l = length s
        p = nub $ sort $ concat $ map (f s) [1..(l-1)]
    in
        length p


main = do
    _ <- getLine
    c <- getContents
    let i = lines c
        o = map ans i
    mapM_ print o

