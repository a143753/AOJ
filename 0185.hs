primes :: Integral a => [a]
primes = map fromIntegral $ [2, 3] ++ primes'
    where
        primes' = [5] ++ f 1 7 primes'
        f m s (p:ps) = [n | n <- ns, gcd m n == 1] ++ f (m * p) (p * p) ps
            where ns = [x + y | x <- [s, s + 6 .. p * p - 2], y <- [0, 4]]

ans' [] _ _ = []
ans' _ [] _ = []
ans' (p:pr) (r:rr) n =
    if p > r
    then []
    else case c of
            EQ -> (p,r):(ans' pr rr n)
            GT -> ans' (p:pr) rr n
            LT -> ans' pr (r:rr) n
    where
        s = p + r
        c = compare s n

ans i =
    let m = maximum i
        p = takeWhile (<= m) primes
        r = reverse p
    in
        map (length . (ans' p r)) i

main = do
    c <- getContents
    let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
        o = ans i
    mapM_ print o

