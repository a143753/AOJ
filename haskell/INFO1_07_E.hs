main = do
  i <- take 2 <$> map read <$> lines <$> getContents :: IO [Int]
  print $ minimum i
