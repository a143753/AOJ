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
  print $ take 100 $ primes
