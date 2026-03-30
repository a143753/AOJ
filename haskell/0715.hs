main = do
  [a,b] <- map read <$> lines <$> getContents :: IO [Int]
  let o = b - a
  print o
