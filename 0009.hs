primes = 2 : 3 : 5 : primes'
  where
    isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
    primes' = 7 : filter (isPrime primes') (scanl (+) 11 $ cycle [2,4,2,4,6,2,6,4])

main = do
  l <- getContents
  let i = map read $ lines l :: [Int]
      m = maximum i
      p = takeWhile (<=m) primes
      o = map (\a -> length $ takeWhile (<=a) p) i
  mapM_ print o
