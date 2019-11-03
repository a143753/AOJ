primes = 2 : 3 : 5 : primes'
  where
    isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
    primes' = 7 : filter (isPrime primes') (scanl (+) 11 $ cycle [2,4,2,4,6,2,6,4])

decomp 1 _ = []
decomp n (p:ps) = 
    if n < p*p
    then [n]
    else if r == 0
         then p:(decomp n' (p:ps))
         else decomp n ps
    where
        r = n `mod` p
        n' = n `div` p

ans n = 
     let d = decomp n primes
     in
         (show n) ++ ": " ++ (unwords $ map show d)

main = do
    n <- getLine
    let i = read n :: Int
        o = ans i
    putStrLn o

-- time limit exceeded
