primes :: Integral a => [a]
primes = map fromIntegral $ [2, 3] ++ primes'
    where
        primes' = [5] ++ f 1 7 primes'
        f m s (p:ps) = [n | n <- ns, gcd m n == 1] ++ f (m * p) (p * p) ps
            where ns = [x + y | x <- [s, s + 6 .. p * p - 2], y <- [0, 4]]

-- prime factorization
-- pfact target primes
pfact1 1 _ = []
pfact1 n (p:ps) = 
    if n < p*p
    then [n]
    else if r == 0
         then p:(pfact1 n' (p:ps))
         else pfact1 n ps
    where
        r = n `mod` p
        n' = n `div` p

pfact2 :: Integral a => a -> [a]
pfact2 n = sub n 2
  where
    sub n p
      | n == 1 = []
      | n `mod` p == 0 = p : sub (n `div` p) p
      | otherwise = sub n (p + 1)

main = do
  print $ take 10000 $ primes
