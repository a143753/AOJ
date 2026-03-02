ans [a,b,c] = a * b + c

main = do
  i <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans i
  print o
