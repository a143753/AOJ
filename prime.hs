primes :: Integral a => [a]
primes = map fromIntegral $ [2, 3] ++ primes'
    where
        primes' = [5] ++ f 1 7 primes'
        f m s (p:ps) = [n | n <- ns, gcd m n == 1] ++ f (m * p) (p * p) ps
            where ns = [x + y | x <- [s, s + 6 .. p * p - 2], y <- [0, 4]]

-- prime factorization
pfact 1 _ = []
pfact n (p:ps) = 
    if n < p*p
    then [n]
    else if r == 0
         then p:(pfact n' (p:ps))
         else pfact n ps
    where
        r = n `mod` p
        n' = n `div` p

main = do
  print $ take 10000 $ primes
