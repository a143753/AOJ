--primes :: [Int]
--primes = sieve (2:[3,5..])
--  where
--    sieve (p:xs) = p : sieve [x|x <- xs, x `mod` p > 0]

filout k0 k (x:xs) =
  if k == x 
  then filout k0 (k+k0) xs
  else
    if k > x
    then x:(filout k0 k xs)
    else x:(filout k0 (k+k0) xs)

primes' (x:xs) = x:(primes' $ filout x x xs)
primes = 2:(primes' [3,5..])

main = do
  l <- getContents
  let i = map read $ lines l :: [Int]
      m = maximum i
      p = takeWhile (<=m) primes
      o = map (\a -> length $ takeWhile (<=a) p) i
  mapM_ print o
