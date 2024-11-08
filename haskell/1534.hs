mseq a b = 
    let a' = (a * b) `mod` 10
    in
        a:(mseq a' b)

-- |
-- >>> pow 9 2
-- 1
-- >>> pow 7 1
-- 7
-- >>> pow 7 3
-- 3
-- >>> pow 2 1
-- 2
-- >>> pow 2 11
-- 8

pow n i =
    let n' = n `mod` 10
        s@(h:t) = take 10 $ mseq n' n'
        r = h:(takeWhile (/= h) t)
        l = length r
        m = (i-1) `mod` l
    in
        r!!m

ans [n,m,k] = 
    let n' = n `mod` 10
        nm = pow n' m
        s@(h:t) = take 10 $ mseq n' nm
        r = h:(takeWhile (/= h) t)
        l = length r
        nn = k `mod` l
        mm = k `div` l
        a = mm * (sum r) + (sum $ take nn s)
    in  
        a

main = do
    l <- getLine
    let i = map read $ words l :: [Int]
        o = ans i
    print o


-- |
-- >>> ans [1,1,9]
-- 9
-- >>> ans [2,1,3]
-- 14
-- >>> ans [8,500000001,1000000000]
-- 5000000000
-- >>> ans [9847279827347,236475,23476723]
-- 117383611
-- >>> ans [88888888888888888,777777777,777777777]
-- 3888888888
