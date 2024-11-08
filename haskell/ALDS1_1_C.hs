import Data.List

primes :: [Int]
--primes = sieve [2..]
primes = sieve (2:[3,5..])
  where
    sieve (p:xs) = p : sieve [x|x <- xs, x `mod` p > 0]

count :: [Int] -> [Int] -> Int
count table [] = 0
count table (d:ds) 
    | elem d table =  1 + count table ds
    | otherwise    =  count table ds
 
main = do
  l <- getContents
  let i0 = drop 1 $ lines l
      i  = map read i0 :: [Int]
      sorted = reverse $ sort i

      p = takeWhile (<=(sorted!!0)) primes

      a = count p sorted

  print a
