main = do
  l <- getLine
  let (m:n:_) = map read $ words l :: [Integer]
      o = (m ^ n) `mod` 1000000007
  print o
