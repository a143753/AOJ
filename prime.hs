primes = 2 : 3 : 5 : primes'
  where
    isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
    primes' = 7 : filter (isPrime primes') (scanl (+) 11 $ cycle [2,4,2,4,6,2,6,4])

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
