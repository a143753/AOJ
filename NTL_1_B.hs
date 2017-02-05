main = do
  l <- getLine
  let i = map read $ words l :: [Integer]
      m = i!!0
      n = i!!1
      o = (m ^ n) `mod` 1000000007
  print o
