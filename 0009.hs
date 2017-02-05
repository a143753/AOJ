primes :: [Int]
primes = sieve (2:[3,5..])
  where
    sieve (p:xs) = p : sieve [x|x <- xs, x `mod` p > 0]

main = do
  l <- getContents
  let i = map read $ lines l :: [Int]
      m = maximum i
      p = takeWhile (<=m) primes
      o = map (\a -> length $ takeWhile (<=a) p) i
  mapM_ print o
