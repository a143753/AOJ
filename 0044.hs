primes :: Integral a => [a]
primes = map fromIntegral $ [2, 3] ++ primes'
    where
        primes' = [5] ++ f 1 7 primes'
        f m s (p:ps) = [n | n <- ns, gcd m n == 1] ++ f (m * p) (p * p) ps
            where ns = [x + y | x <- [s, s + 6 .. p * p - 2], y <- [0, 4]]

ans (p1:p2:ps) n =
    if n < p1
    then []
    else if n == p1
         then []
         else if n < p2
              then [p1, p2]
              else if n == p2
                   then [p1, head ps]
                   else ans (p2:ps) n

main = do
  l <- getContents
  let i = map read $ lines l :: [Int]
      o = map (ans primes) i
  mapM_ putStrLn $ map unwords $ map (map show) o
