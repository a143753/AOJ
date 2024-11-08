primes :: Integral a => [a]
primes = map fromIntegral $ [2, 3] ++ primes'
    where
        primes' = [5] ++ f 1 7 primes'
        f m s (p:ps) = [n | n <- ns, gcd m n == 1] ++ f (m * p) (p * p) ps
            where ns = [x + y | x <- [s, s + 6 .. p * p - 2], y <- [0, 4]]

chk _ [] _ = []
chk _ _ [] = []
chk n (p:ps) (q:qs) = 
    case compare n (p+q) of
        EQ -> (p,q):(chk n ps qs)
        GT -> chk n ps (q:qs)
        LT -> chk n (p:ps) qs

ans s i = 
    let s1 = takeWhile (<= i `div` 2) s
        s2 = reverse $ dropWhile (<  i `div` 2) $ takeWhile (<= i) s
        l  = chk i s1 s2
    in
        length l

main = do
  l <- getContents
  let i = takeWhile (/= 0) $ map read $ lines l :: [Int]
      m = maximum i
      p = takeWhile (<= m) primes
      o = map (ans p) i
  mapM_ print o
