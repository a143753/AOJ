main = do
  i <- map read <$> lines <$> getContents :: IO [Int]
  print $ sum $ take 2 i
