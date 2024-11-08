primes :: Integral a => [a]
primes = map fromIntegral $ [2, 3] ++ primes'
    where
        primes' = [5] ++ f 1 7 primes'
        f m s (p:ps) = [n | n <- ns, gcd m n == 1] ++ f (m * p) (p * p) ps
            where ns = [x + y | x <- [s, s + 6 .. p * p - 2], y <- [0, 4]]

ans i = sum $ take i primes 

main = do
  l <- getContents
  let i = takeWhile (/= 0) $ map read $ lines l :: [Int]
      o = map ans i
  mapM_ print o
