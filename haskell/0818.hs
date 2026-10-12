main = do
  [x,b] <- map read . words <$> getLine
  let o = x * b * b
  print o
