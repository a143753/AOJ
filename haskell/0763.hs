ans [x,y] = x + y + 3

main = do
  i <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans(i)
  print o
