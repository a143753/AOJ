primes = 2 : 3 : 5 : primes'
  where
    isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
    primes' = 7 : filter (isPrime primes') (scanl (+) 11 $ cycle [2,4,2,4,6,2,6,4])

src [] _ = 0
src _ [] = 0
src (p:ps) (q:qs) =
  if p == q
  then 1 + src ps qs
  else if p < q
       then src ps (q:qs)
       else src (p:ps) qs

ans' p n = 
  src p' q
  where
    p' = takeWhile (<= n) p
    q  = reverse $ map (\x -> n + 1 - x) p'
    
ans ns = map (ans' p) ns
  where
    m = maximum ns
    p = takeWhile (<= m) primes
    
main = do
  i <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans i
  mapM_ print o
