ans d n = length $ filter (== d) n

main = do
  [d, n] <- words <$> getLine
  let o = ans (head d) n
  print o
