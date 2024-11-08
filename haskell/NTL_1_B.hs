k = 1000000007

ans m 0 = 1
ans m 1 = m

ans m n =
  let n' = n `div` 2
      x  = ans m n'
      y  = ans m (n-2*n')
  in
    (x * x * y) `mod` k

main = do
  l <- getLine
  let (m:n:_) = map read $ words l :: [Integer]
      o = ans m n
  print o
