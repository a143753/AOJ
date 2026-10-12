ans a b = if a > b * 3 then 1 else 0

main = do
  [a, b] <- map read . words <$> getLine
  let o = ans a b
  print o
