ans [a,b,c] = if (a <= c) && (c < b) then 1 else 0

main = do
  i <- map read <$> words <$> getLine :: IO [Int]
  let o = ans i
  print o
